require 'test_helper'

class ProductTest < ActiveSupport::TestCase

  test "product price must be positive" do
    product = Product.new(title: "My Book Title",
                          description: "fvygbuhjkml",
                          image_url: "zzz.jpg" )
    product.price = -1
      assert product.invalid?
      assert_equal ["must be greater than or equal to 0.01"],
      product.errors[:price]

    product.price = 0
      assert product.invalid?
      assert_equal ["must be greater than or equal to 0.01"],
      product.errors[:price]

    product.price = 1
      assert product.valid?
  end

end
