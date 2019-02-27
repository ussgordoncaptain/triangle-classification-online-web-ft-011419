
class Triangle
  # write code here
  
  def initialize(a,b,c)
    @a=a 
    @b = b 
    @c = c 
  end 
  attr_reader :a , :b, :c 
  attr_accessor :kind 
 
  def kind 
    errorA = (@a+@b <= @c)
    errorB = (@b+@c <= @a)
    errorC = (@c +@a <= @b)
    errorD = ((@a <= 0) || (@b <= 0) || (@c <=0) )
   
    if (errorA || errorB || errorC)
      begin 
        raise TriangleError
      rescue TriangleError => error
        puts error.length_error
      end
      elsif (errorD)
        begin
          raise TriangleError
        rescue TriangleError => error 
          puts error.other_error
        end
          
      elsif (@a==@b && @c == @b && @c == @a)
        @kind = :equilateral
      elsif (@a!=@b && @c != @b && @c != @a )
        @kind = :scalene 
      else 
        @kind = :isosceles
    end
  end
     class TriangleError < StandardError
    def length_error
      "Error sum of 2 sides must be longer than the third"
    end 
    def other_error
      "error some problem with individual side length"
    end
  end
end
