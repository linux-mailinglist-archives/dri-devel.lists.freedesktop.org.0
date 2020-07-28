Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F743231100
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jul 2020 19:38:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 779876E130;
	Tue, 28 Jul 2020 17:38:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6DB16E130
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jul 2020 17:38:50 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id BC09E80503;
 Tue, 28 Jul 2020 19:38:47 +0200 (CEST)
Date: Tue, 28 Jul 2020 19:38:46 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 02/13] drm/ast: Test if I2C support has been initialized
Message-ID: <20200728173846.GB1114934@ravnborg.org>
References: <20200728074425.2749-1-tzimmermann@suse.de>
 <20200728074425.2749-3-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200728074425.2749-3-tzimmermann@suse.de>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=aP3eV41m c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=kj9zAlcOel0A:10 a=e5mUnYsNAAAA:8 a=fDbEF_Ak_whUwfVfRf8A:9
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

On Tue, Jul 28, 2020 at 09:44:14AM +0200, Thomas Zimmermann wrote:
> The ast driver is supposed to work without I2C support. This is
> tested by looking at the connector's i2c field being non-NULL.
> 
> After embedding the I2C structure in the connector, the i2c field
> will not be a pointer. So change the test to look at the dev field
> in struct ast_i2c_chan.
> 
> ast_get_modes() did not really test if I2C has been initialized, so
> the patch adds this test as well.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/ast/ast_mode.c | 23 ++++++++++++++++++-----
>  1 file changed, 18 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
> index 19f1dfc8e9e0..45be020afcad 100644
> --- a/drivers/gpu/drm/ast/ast_mode.c
> +++ b/drivers/gpu/drm/ast/ast_mode.c
> @@ -603,7 +603,6 @@ static struct ast_i2c_chan *ast_i2c_create(struct drm_device *dev)
>  	i2c->adapter.owner = THIS_MODULE;
>  	i2c->adapter.class = I2C_CLASS_DDC;
>  	i2c->adapter.dev.parent = &dev->pdev->dev;
> -	i2c->dev = dev;
>  	i2c_set_adapdata(&i2c->adapter, i2c);
>  	snprintf(i2c->adapter.name, sizeof(i2c->adapter.name),
>  		 "AST i2c bit bus");
> @@ -622,17 +621,30 @@ static struct ast_i2c_chan *ast_i2c_create(struct drm_device *dev)
>  		goto out_free;
>  	}
>  
> +	i2c->dev = dev; /* signals presence of I2C support */
> +
>  	return i2c;
>  out_free:
>  	kfree(i2c);
>  	return NULL;
>  }
>  
> -static void ast_i2c_destroy(struct ast_i2c_chan *i2c)
> +static bool ast_i2c_is_initialized(struct ast_i2c_chan *i2c)
>  {
> -	if (!i2c)
> +	return i2c && !!i2c->dev;
> +}
It seems pointless to convert the pointer to bool here ("!!").

> +
> +static void ast_i2c_fini(struct ast_i2c_chan *i2c)
> +{
> +	if (!ast_i2c_is_initialized(i2c))
>  		return;
Empty line after return?
>  	i2c_del_adapter(&i2c->adapter);
> +	i2c->dev = NULL; /* clear to signal absence of I2C support */
> +}
> +
> +static void ast_i2c_destroy(struct ast_i2c_chan *i2c)
> +{
> +	ast_i2c_fini(i2c);
>  	kfree(i2c);
>  }
>  
> @@ -1054,6 +1066,7 @@ static int ast_get_modes(struct drm_connector *connector)
>  {
>  	struct ast_connector *ast_connector = to_ast_connector(connector);
>  	struct ast_private *ast = to_ast_private(connector->dev);
> +	struct ast_i2c_chan *i2c = ast_connector->i2c;
>  	struct edid *edid;
>  	int ret;
>  	bool flags = false;
> @@ -1069,8 +1082,8 @@ static int ast_get_modes(struct drm_connector *connector)
>  		else
>  			kfree(edid);
>  	}
> -	if (!flags)
> -		edid = drm_get_edid(connector, &ast_connector->i2c->adapter);
> +	if (!flags && ast_i2c_is_initialized(i2c))
> +		edid = drm_get_edid(connector, &i2c->adapter);
>  	if (edid) {
>  		drm_connector_update_edid_property(&ast_connector->base, edid);
>  		ret = drm_add_edid_modes(connector, edid);
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
