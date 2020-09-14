Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF06F2699F1
	for <lists+dri-devel@lfdr.de>; Tue, 15 Sep 2020 01:53:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43B656E825;
	Mon, 14 Sep 2020 23:53:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AAF96E823
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Sep 2020 23:53:50 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id EA27D275;
 Tue, 15 Sep 2020 01:53:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1600127629;
 bh=kBvLuc4IpczcLRoHMhtPbkUjmkX557HmsMDym8BZWN8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=TfVRlZh9MJoIhDtENDWGwOlfG0+Kmlysg9scJBJ2gvIf+FesZGjf56+VslvST7x/P
 iM/b7fcLFrTclie+paQ8iv2DoJcD4gLfczT9UjIHSe0IhjMj4PTEmf21k+aostXWwQ
 Zqk9qtQdlTY6luiYUNHWCDkvzf1OGYriqC1Bkvf4=
Date: Tue, 15 Sep 2020 02:53:21 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jyri Sarha <jsarha@ti.com>
Subject: Re: [PATCH 2/2] drm/tilcdc: Remove tilcdc_crtc_max_width(), use
 private data
Message-ID: <20200914235321.GL15543@pendragon.ideasonboard.com>
References: <cover.1600072407.git.jsarha@ti.com>
 <871a82bc0388ffb5a9b2a14c129c7174b0b4324c.1600072407.git.jsarha@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <871a82bc0388ffb5a9b2a14c129c7174b0b4324c.1600072407.git.jsarha@ti.com>
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
Cc: tomi.valkeinen@ti.com, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jyri,

Thank you for the patch.

On Mon, Sep 14, 2020 at 11:34:50AM +0300, Jyri Sarha wrote:
> We already have a private data member for maximum display width so
> let's use it and get rid of the redundant tilcdc_crtc_max_width().

You may want to add a sentence to explain why OF parsing is moved.

> Signed-off-by: Jyri Sarha <jsarha@ti.com>
> ---
>  drivers/gpu/drm/tilcdc/tilcdc_crtc.c | 16 +-----------
>  drivers/gpu/drm/tilcdc/tilcdc_drv.c  | 38 +++++++++++++++-------------
>  drivers/gpu/drm/tilcdc/tilcdc_drv.h  |  7 ++---
>  3 files changed, 26 insertions(+), 35 deletions(-)
> 
> diff --git a/drivers/gpu/drm/tilcdc/tilcdc_crtc.c b/drivers/gpu/drm/tilcdc/tilcdc_crtc.c
> index 29f263e1975a..27ea529d74b8 100644
> --- a/drivers/gpu/drm/tilcdc/tilcdc_crtc.c
> +++ b/drivers/gpu/drm/tilcdc/tilcdc_crtc.c
> @@ -754,20 +754,6 @@ static const struct drm_crtc_funcs tilcdc_crtc_funcs = {
>  	.disable_vblank	= tilcdc_crtc_disable_vblank,
>  };
>  
> -int tilcdc_crtc_max_width(struct drm_crtc *crtc)
> -{
> -	struct drm_device *dev = crtc->dev;
> -	struct tilcdc_drm_private *priv = dev->dev_private;
> -	int max_width = 0;
> -
> -	if (priv->rev == 1)
> -		max_width = 1024;
> -	else if (priv->rev == 2)
> -		max_width = 2048;
> -
> -	return max_width;
> -}
> -
>  static enum drm_mode_status
>  tilcdc_crtc_mode_valid(struct drm_crtc *crtc,
>  		       const struct drm_display_mode *mode)
> @@ -780,7 +766,7 @@ tilcdc_crtc_mode_valid(struct drm_crtc *crtc,
>  	 * check to see if the width is within the range that
>  	 * the LCD Controller physically supports
>  	 */
> -	if (mode->hdisplay > tilcdc_crtc_max_width(crtc))
> +	if (mode->hdisplay > priv->max_width)
>  		return MODE_VIRTUAL_X;
>  
>  	/* width must be multiple of 16 */
> diff --git a/drivers/gpu/drm/tilcdc/tilcdc_drv.c b/drivers/gpu/drm/tilcdc/tilcdc_drv.c
> index 4f5fc3e87383..866b33b40eff 100644
> --- a/drivers/gpu/drm/tilcdc/tilcdc_drv.c
> +++ b/drivers/gpu/drm/tilcdc/tilcdc_drv.c
> @@ -105,7 +105,7 @@ static void modeset_init(struct drm_device *dev)
>  
>  	dev->mode_config.min_width = 0;
>  	dev->mode_config.min_height = 0;
> -	dev->mode_config.max_width = tilcdc_crtc_max_width(priv->crtc);
> +	dev->mode_config.max_width = priv->max_width;
>  	dev->mode_config.max_height = 2048;
>  	dev->mode_config.funcs = &mode_config_funcs;
>  }
> @@ -218,22 +218,6 @@ static int tilcdc_init(struct drm_driver *ddrv, struct device *dev)
>  		goto init_failed;
>  	}
>  
> -	if (of_property_read_u32(node, "max-bandwidth", &priv->max_bandwidth))
> -		priv->max_bandwidth = TILCDC_DEFAULT_MAX_BANDWIDTH;
> -
> -	DBG("Maximum Bandwidth Value %d", priv->max_bandwidth);
> -
> -	if (of_property_read_u32(node, "max-width", &priv->max_width))
> -		priv->max_width = TILCDC_DEFAULT_MAX_WIDTH;
> -
> -	DBG("Maximum Horizontal Pixel Width Value %dpixels", priv->max_width);
> -
> -	if (of_property_read_u32(node, "max-pixelclock",
> -					&priv->max_pixelclock))
> -		priv->max_pixelclock = TILCDC_DEFAULT_MAX_PIXELCLOCK;
> -
> -	DBG("Maximum Pixel Clock Value %dKHz", priv->max_pixelclock);
> -
>  	pm_runtime_enable(dev);
>  
>  	/* Determine LCD IP Version */
> @@ -287,6 +271,26 @@ static int tilcdc_init(struct drm_driver *ddrv, struct device *dev)
>  		}
>  	}
>  
> +	if (of_property_read_u32(node, "max-bandwidth", &priv->max_bandwidth))
> +		priv->max_bandwidth = TILCDC_DEFAULT_MAX_BANDWIDTH;
> +
> +	DBG("Maximum Bandwidth Value %d", priv->max_bandwidth);
> +
> +	if (of_property_read_u32(node, "max-width", &priv->max_width)) {
> +		if (priv->rev == 1)
> +			priv->max_width = TILCDC_DEFAULT_MAX_WIDTH_V1;
> +		else
> +			priv->max_width = TILCDC_DEFAULT_MAX_WIDTH_V2;
> +	}
> +
> +	DBG("Maximum Horizontal Pixel Width Value %dpixels", priv->max_width);
> +
> +	if (of_property_read_u32(node, "max-pixelclock",
> +					&priv->max_pixelclock))
> +		priv->max_pixelclock = TILCDC_DEFAULT_MAX_PIXELCLOCK;
> +
> +	DBG("Maximum Pixel Clock Value %dKHz", priv->max_pixelclock);
> +
>  	ret = tilcdc_crtc_create(ddev);
>  	if (ret < 0) {
>  		dev_err(dev, "failed to create crtc\n");
> diff --git a/drivers/gpu/drm/tilcdc/tilcdc_drv.h b/drivers/gpu/drm/tilcdc/tilcdc_drv.h
> index 18815e75ca4f..76adf87fec4e 100644
> --- a/drivers/gpu/drm/tilcdc/tilcdc_drv.h
> +++ b/drivers/gpu/drm/tilcdc/tilcdc_drv.h
> @@ -28,8 +28,10 @@ struct drm_plane;
>  
>  /* Defaulting to pixel clock defined on AM335x */
>  #define TILCDC_DEFAULT_MAX_PIXELCLOCK  126000
> -/* Defaulting to max width as defined on AM335x */
> -#define TILCDC_DEFAULT_MAX_WIDTH  2048
> +/* Maximum width as defined on AM335x */
> +#define TILCDC_DEFAULT_MAX_WIDTH_V2  2048
> +/* ... and for V1 LCDC: */
> +#define TILCDC_DEFAULT_MAX_WIDTH_V1  1024

Nitpicking, I'd define V1 before V2 :-)

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

>  /*
>   * This may need some tweaking, but want to allow at least 1280x1024@60
>   * with optimized DDR & EMIF settings tweaked 1920x1080@24 appears to
> @@ -158,7 +160,6 @@ void tilcdc_crtc_set_panel_info(struct drm_crtc *crtc,
>  		const struct tilcdc_panel_info *info);
>  void tilcdc_crtc_set_simulate_vesa_sync(struct drm_crtc *crtc,
>  					bool simulate_vesa_sync);
> -int tilcdc_crtc_max_width(struct drm_crtc *crtc);
>  void tilcdc_crtc_shutdown(struct drm_crtc *crtc);
>  int tilcdc_crtc_update_fb(struct drm_crtc *crtc,
>  		struct drm_framebuffer *fb,

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
