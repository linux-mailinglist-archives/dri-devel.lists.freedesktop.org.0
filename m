Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AFA19231141
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jul 2020 20:06:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 326F86E221;
	Tue, 28 Jul 2020 18:06:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BA936E221
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jul 2020 18:06:52 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 72DE32002C;
 Tue, 28 Jul 2020 20:06:50 +0200 (CEST)
Date: Tue, 28 Jul 2020 20:06:49 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 04/13] drm/ast: Managed release of I2C adapter
Message-ID: <20200728180649.GD1114934@ravnborg.org>
References: <20200728074425.2749-1-tzimmermann@suse.de>
 <20200728074425.2749-5-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200728074425.2749-5-tzimmermann@suse.de>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=f+hm+t6M c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=kj9zAlcOel0A:10 a=e5mUnYsNAAAA:8 a=o4y5w0TeNhCH0ykGtUAA:9
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

On Tue, Jul 28, 2020 at 09:44:16AM +0200, Thomas Zimmermann wrote:
> Managed releases of the device's I2C adapter simplify the connector's
> release.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/ast/ast_mode.c | 21 ++++++++++-----------
>  1 file changed, 10 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
> index f421a60d8a96..27eb49bd12b3 100644
> --- a/drivers/gpu/drm/ast/ast_mode.c
> +++ b/drivers/gpu/drm/ast/ast_mode.c
> @@ -39,6 +39,7 @@
>  #include <drm/drm_fourcc.h>
>  #include <drm/drm_gem_framebuffer_helper.h>
>  #include <drm/drm_gem_vram_helper.h>
> +#include <drm/drm_managed.h>
>  #include <drm/drm_plane_helper.h>
>  #include <drm/drm_probe_helper.h>
>  #include <drm/drm_simple_kms_helper.h>
> @@ -591,6 +592,14 @@ static void ast_i2c_setsda(void *i2c_priv, int data)
>  	}
>  }
>  
> +static void ast_i2c_release(struct drm_device *dev, void *data)
> +{
> +	struct ast_i2c_chan *i2c = data;
> +
> +	i2c_del_adapter(&i2c->adapter);
> +	i2c->dev = NULL; /* clear to signal absence of I2C support */
> +}
> +
>  static int ast_i2c_init(struct ast_i2c_chan *i2c, struct drm_device *dev)
>  {
>  	int ret;
> @@ -618,7 +627,7 @@ static int ast_i2c_init(struct ast_i2c_chan *i2c, struct drm_device *dev)
>  
>  	i2c->dev = dev; /* signals presence of I2C support */
>  
> -	return 0;
> +	return drmm_add_action_or_reset(dev, ast_i2c_release, i2c);
>  }
>  
>  static bool ast_i2c_is_initialized(struct ast_i2c_chan *i2c)
> @@ -626,14 +635,6 @@ static bool ast_i2c_is_initialized(struct ast_i2c_chan *i2c)
>  	return !!i2c->dev;
>  }
>  
> -static void ast_i2c_fini(struct ast_i2c_chan *i2c)
> -{
> -	if (!ast_i2c_is_initialized(i2c))
> -		return;
> -	i2c_del_adapter(&i2c->adapter);
> -	i2c->dev = NULL; /* clear to signal absence of I2C support */
> -}
The intro of ast_i2c_fini() and then removal again confuses me a little.
But end result looks simple so I guess thats what counts.

	Sam

> -
>  /*
>   * Primary plane
>   */
> @@ -1139,8 +1140,6 @@ static enum drm_mode_status ast_mode_valid(struct drm_connector *connector,
>  
>  static void ast_connector_destroy(struct drm_connector *connector)
>  {
> -	struct ast_connector *ast_connector = to_ast_connector(connector);
> -	ast_i2c_fini(&ast_connector->i2c);
>  	drm_connector_cleanup(connector);
>  	kfree(connector);
>  }
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
