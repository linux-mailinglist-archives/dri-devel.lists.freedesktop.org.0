Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 209AD23113F
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jul 2020 20:05:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23FE76E1A8;
	Tue, 28 Jul 2020 18:05:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDE2C6E1A8
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jul 2020 18:05:03 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id D5A7D2002C;
 Tue, 28 Jul 2020 20:04:59 +0200 (CEST)
Date: Tue, 28 Jul 2020 20:04:58 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 01/13] drm/ast: Move I2C code within ast_mode.c
Message-ID: <20200728180458.GC1114934@ravnborg.org>
References: <20200728074425.2749-1-tzimmermann@suse.de>
 <20200728074425.2749-2-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200728074425.2749-2-tzimmermann@suse.de>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=f+hm+t6M c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=kj9zAlcOel0A:10 a=e5mUnYsNAAAA:8 a=jTImw1BgtyBHuwfRpEcA:9
 a=CjuIK1q_8ugA:10 a=Vxmtnl_E_bksehYqCbjh:22
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Cc: emil.l.velikov@gmail.com, dri-devel@lists.freedesktop.org,
 kraxel@redhat.com, airlied@redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Thomas.

A few comments related to the code - but not to this patch and
not to this patch-set.
But I noticed so here goes.

	Sam

On Tue, Jul 28, 2020 at 09:44:13AM +0200, Thomas Zimmermann wrote:
> The I2C support feels slammed down to the end of ast_mode.c. Improve
> this by moving the code before it's callers, remove the declarations,
> rename the callbacks to match I2C's get/set sda/scl convention, and
> prefix all functions with ast_. No functional changes have been made.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/ast/ast_mode.c | 249 +++++++++++++++++----------------
>  1 file changed, 125 insertions(+), 124 deletions(-)
> 
> diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
> index 154cd877d9d1..19f1dfc8e9e0 100644
> --- a/drivers/gpu/drm/ast/ast_mode.c
> +++ b/drivers/gpu/drm/ast/ast_mode.c
> @@ -46,9 +46,6 @@
>  #include "ast_drv.h"
>  #include "ast_tables.h"
>  
> -static struct ast_i2c_chan *ast_i2c_create(struct drm_device *dev);
> -static void ast_i2c_destroy(struct ast_i2c_chan *i2c);
> -
>  static inline void ast_load_palette_index(struct ast_private *ast,
>  				     u8 index, u8 red, u8 green,
>  				     u8 blue)
> @@ -514,6 +511,131 @@ static void ast_set_start_address_crt1(struct ast_private *ast,
>  
>  }
>  
> +/*
> + * I2C
> + */
> +
> +static int ast_i2c_getscl(void *i2c_priv)
> +{
> +	struct ast_i2c_chan *i2c = i2c_priv;
> +	struct ast_private *ast = to_ast_private(i2c->dev);
> +	uint32_t val, val2, count, pass;
s/uint32_t/u32

> +
> +	count = 0;
> +	pass = 0;
> +	val = (ast_get_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xb7, 0x10) >> 4) & 0x01;
So val is a bool - but anyway an int is used.

> +	do {
> +		val2 = (ast_get_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xb7, 0x10) >> 4) & 0x01;
Likewise for val2.

> +		if (val == val2) {
> +			pass++;
> +		} else {
> +			pass = 0;
> +			val = (ast_get_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xb7, 0x10) >> 4) & 0x01;
> +		}
> +	} while ((pass < 5) && (count++ < 0x10000));
> +
> +	return val & 1 ? 1 : 0;
bool to int conversion could do the trick here.

> +}
> +
> +static int ast_i2c_getsda(void *i2c_priv)
> +{
> +	struct ast_i2c_chan *i2c = i2c_priv;
> +	struct ast_private *ast = to_ast_private(i2c->dev);
> +	uint32_t val, val2, count, pass;
> +
> +	count = 0;
> +	pass = 0;
> +	val = (ast_get_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xb7, 0x20) >> 5) & 0x01;
> +	do {
> +		val2 = (ast_get_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xb7, 0x20) >> 5) & 0x01;
> +		if (val == val2) {
> +			pass++;
> +		} else {
> +			pass = 0;
> +			val = (ast_get_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xb7, 0x20) >> 5) & 0x01;
> +		}
> +	} while ((pass < 5) && (count++ < 0x10000));
> +
> +	return val & 1 ? 1 : 0;
> +}
> +
> +static void ast_i2c_setscl(void *i2c_priv, int clock)
> +{
> +	struct ast_i2c_chan *i2c = i2c_priv;
> +	struct ast_private *ast = to_ast_private(i2c->dev);
> +	int i;
> +	u8 ujcrb7, jtemp;
And now u8 is used for registers.
Maybe because ast_get_index_reg_mask() returns uint8_t.

So for consistentcy do the uint8_t => u8 etc. conversion first.

> +
> +	for (i = 0; i < 0x10000; i++) {
> +		ujcrb7 = ((clock & 0x01) ? 0 : 1);
> +		ast_set_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xb7, 0xf4, ujcrb7);
> +		jtemp = ast_get_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xb7, 0x01);
> +		if (ujcrb7 == jtemp)
> +			break;
> +	}
> +}
> +
> +static void ast_i2c_setsda(void *i2c_priv, int data)
> +{
> +	struct ast_i2c_chan *i2c = i2c_priv;
> +	struct ast_private *ast = to_ast_private(i2c->dev);
> +	int i;
> +	u8 ujcrb7, jtemp;
> +
> +	for (i = 0; i < 0x10000; i++) {
> +		ujcrb7 = ((data & 0x01) ? 0 : 1) << 2;
> +		ast_set_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xb7, 0xf1, ujcrb7);
> +		jtemp = ast_get_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xb7, 0x04);
> +		if (ujcrb7 == jtemp)
> +			break;
> +	}
> +}
> +
> +static struct ast_i2c_chan *ast_i2c_create(struct drm_device *dev)
> +{
> +	struct ast_i2c_chan *i2c;
> +	int ret;
> +
> +	i2c = kzalloc(sizeof(struct ast_i2c_chan), GFP_KERNEL);
> +	if (!i2c)
> +		return NULL;
> +
> +	i2c->adapter.owner = THIS_MODULE;
> +	i2c->adapter.class = I2C_CLASS_DDC;
> +	i2c->adapter.dev.parent = &dev->pdev->dev;
> +	i2c->dev = dev;
> +	i2c_set_adapdata(&i2c->adapter, i2c);
If ast_private * was passed here and not i2c.
Then the implementation of ast_i2c_* could be a tad simpler - no
upclassing needed.
And then you could drop the drm_device field.
(And would need to invent another way to check if i2c is initialized).


> +	snprintf(i2c->adapter.name, sizeof(i2c->adapter.name),
> +		 "AST i2c bit bus");
> +	i2c->adapter.algo_data = &i2c->bit;
> +
> +	i2c->bit.udelay = 20;
> +	i2c->bit.timeout = 2;
> +	i2c->bit.data = i2c;
> +	i2c->bit.setsda = ast_i2c_setsda;
> +	i2c->bit.setscl = ast_i2c_setscl;
> +	i2c->bit.getsda = ast_i2c_getsda;
> +	i2c->bit.getscl = ast_i2c_getscl;
> +	ret = i2c_bit_add_bus(&i2c->adapter);
> +	if (ret) {
> +		drm_err(dev, "Failed to register bit i2c\n");
> +		goto out_free;
> +	}
> +
> +	return i2c;
> +out_free:
> +	kfree(i2c);
> +	return NULL;
> +}
> +
> +static void ast_i2c_destroy(struct ast_i2c_chan *i2c)
> +{
> +	if (!i2c)
> +		return;
> +	i2c_del_adapter(&i2c->adapter);
> +	kfree(i2c);
> +}
> +
>  /*
>   * Primary plane
>   */
> @@ -1146,124 +1268,3 @@ int ast_mode_config_init(struct ast_private *ast)
>  
>  	return 0;
>  }
> -
> -static int get_clock(void *i2c_priv)
> -{
> -	struct ast_i2c_chan *i2c = i2c_priv;
> -	struct ast_private *ast = to_ast_private(i2c->dev);
> -	uint32_t val, val2, count, pass;
> -
> -	count = 0;
> -	pass = 0;
> -	val = (ast_get_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xb7, 0x10) >> 4) & 0x01;
> -	do {
> -		val2 = (ast_get_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xb7, 0x10) >> 4) & 0x01;
> -		if (val == val2) {
> -			pass++;
> -		} else {
> -			pass = 0;
> -			val = (ast_get_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xb7, 0x10) >> 4) & 0x01;
> -		}
> -	} while ((pass < 5) && (count++ < 0x10000));
> -
> -	return val & 1 ? 1 : 0;
> -}
> -
> -static int get_data(void *i2c_priv)
> -{
> -	struct ast_i2c_chan *i2c = i2c_priv;
> -	struct ast_private *ast = to_ast_private(i2c->dev);
> -	uint32_t val, val2, count, pass;
> -
> -	count = 0;
> -	pass = 0;
> -	val = (ast_get_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xb7, 0x20) >> 5) & 0x01;
> -	do {
> -		val2 = (ast_get_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xb7, 0x20) >> 5) & 0x01;
> -		if (val == val2) {
> -			pass++;
> -		} else {
> -			pass = 0;
> -			val = (ast_get_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xb7, 0x20) >> 5) & 0x01;
> -		}
> -	} while ((pass < 5) && (count++ < 0x10000));
> -
> -	return val & 1 ? 1 : 0;
> -}
> -
> -static void set_clock(void *i2c_priv, int clock)
> -{
> -	struct ast_i2c_chan *i2c = i2c_priv;
> -	struct ast_private *ast = to_ast_private(i2c->dev);
> -	int i;
> -	u8 ujcrb7, jtemp;
> -
> -	for (i = 0; i < 0x10000; i++) {
> -		ujcrb7 = ((clock & 0x01) ? 0 : 1);
> -		ast_set_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xb7, 0xf4, ujcrb7);
> -		jtemp = ast_get_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xb7, 0x01);
> -		if (ujcrb7 == jtemp)
> -			break;
> -	}
> -}
> -
> -static void set_data(void *i2c_priv, int data)
> -{
> -	struct ast_i2c_chan *i2c = i2c_priv;
> -	struct ast_private *ast = to_ast_private(i2c->dev);
> -	int i;
> -	u8 ujcrb7, jtemp;
> -
> -	for (i = 0; i < 0x10000; i++) {
> -		ujcrb7 = ((data & 0x01) ? 0 : 1) << 2;
> -		ast_set_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xb7, 0xf1, ujcrb7);
> -		jtemp = ast_get_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xb7, 0x04);
> -		if (ujcrb7 == jtemp)
> -			break;
> -	}
> -}
> -
> -static struct ast_i2c_chan *ast_i2c_create(struct drm_device *dev)
> -{
> -	struct ast_i2c_chan *i2c;
> -	int ret;
> -
> -	i2c = kzalloc(sizeof(struct ast_i2c_chan), GFP_KERNEL);
> -	if (!i2c)
> -		return NULL;
> -
> -	i2c->adapter.owner = THIS_MODULE;
> -	i2c->adapter.class = I2C_CLASS_DDC;
> -	i2c->adapter.dev.parent = &dev->pdev->dev;
> -	i2c->dev = dev;
> -	i2c_set_adapdata(&i2c->adapter, i2c);
> -	snprintf(i2c->adapter.name, sizeof(i2c->adapter.name),
> -		 "AST i2c bit bus");
> -	i2c->adapter.algo_data = &i2c->bit;
> -
> -	i2c->bit.udelay = 20;
> -	i2c->bit.timeout = 2;
> -	i2c->bit.data = i2c;
> -	i2c->bit.setsda = set_data;
> -	i2c->bit.setscl = set_clock;
> -	i2c->bit.getsda = get_data;
> -	i2c->bit.getscl = get_clock;
> -	ret = i2c_bit_add_bus(&i2c->adapter);
> -	if (ret) {
> -		drm_err(dev, "Failed to register bit i2c\n");
> -		goto out_free;
> -	}
> -
> -	return i2c;
> -out_free:
> -	kfree(i2c);
> -	return NULL;
> -}
> -
> -static void ast_i2c_destroy(struct ast_i2c_chan *i2c)
> -{
> -	if (!i2c)
> -		return;
> -	i2c_del_adapter(&i2c->adapter);
> -	kfree(i2c);
> -}
> -- 
> 2.27.0
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
