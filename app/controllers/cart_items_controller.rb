class CartItemsController < ApplicationController
    def new
        @cart_id = current_cart.id
        @product_id = params[:product_id]
        @cart_item = CartItem.new
    end
    
    def create
        @cart_id = params[:cart_item][:cart_id]
        @product_id = params[:cart_item][:product_id]
        @qty = params[:cart_item][:qty]
        c = CartItem.new(cart_id: @cart_id, product_id: @product_id, qty: @qty)
        if c.save
            redirect_to carts_show_path
        else
            render "new"
        end
    end
    
    def destroy
        CartItem.find(params[:id]).destroy
        redirect_to root_path
    end
end