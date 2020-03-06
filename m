Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4009817C6ED
	for <lists+dri-devel@lfdr.de>; Fri,  6 Mar 2020 21:18:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7992B6ED69;
	Fri,  6 Mar 2020 20:18:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 392AF6E4DE;
 Fri,  6 Mar 2020 20:18:45 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 34A2C2002E;
 Fri,  6 Mar 2020 21:18:43 +0100 (CET)
Date: Fri, 6 Mar 2020 21:18:41 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH 32/51] drm/mcde: Drop explicit drm_mode_config_cleanup call
Message-ID: <20200306201841.GE13014@ravnborg.org>
References: <20200302222631.3861340-1-daniel.vetter@ffwll.ch>
 <20200302222631.3861340-33-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200302222631.3861340-33-daniel.vetter@ffwll.ch>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=eMA9ckh1 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=7gkXJVJtAAAA:8
 a=KKAkSRfTAAAA:8 a=P1BnusSwAAAA:8 a=QyXUC8HyAAAA:8 a=ya7CBqEtM8g-VZpO8hwA:9
 a=CjuIK1q_8ugA:10 a=E9Po1WZjFZOl8hwRPBS3:22 a=cvBusfyB2V15izCimMoJ:22
 a=D0XLA9XvdZm18NrgonBM:22
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
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Mar 02, 2020 at 11:26:12PM +0100, Daniel Vetter wrote:
> Allows us to drop the drm_driver.release callback.
> 
> This is made possible by a preceeding patch which added a drmm_
> cleanup action to drm_mode_config_init(), hence all we need to do to
> ensure that drm_mode_config_cleanup() is run on final drm_device
> cleanup is check the new error code for _init().
> 
> v2: Explain why this cleanup is possible (Laurent).
> 
> v3: Use drmm_mode_config_init() for more clarity (Sam, Thomas)
> 
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org> (v2)
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Linus Walleij <linus.walleij@linaro.org>

Acked-by: Sam Ravnborg <sam@ravnborg.org>

> ---
>  drivers/gpu/drm/mcde/mcde_drv.c | 22 ++++++----------------
>  1 file changed, 6 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mcde/mcde_drv.c b/drivers/gpu/drm/mcde/mcde_drv.c
> index a543ebf3d541..03d2e1a00810 100644
> --- a/drivers/gpu/drm/mcde/mcde_drv.c
> +++ b/drivers/gpu/drm/mcde/mcde_drv.c
> @@ -184,13 +184,13 @@ static int mcde_modeset_init(struct drm_device *drm)
>  	ret = drm_vblank_init(drm, 1);
>  	if (ret) {
>  		dev_err(drm->dev, "failed to init vblank\n");
> -		goto out_config;
> +		return ret;
>  	}
>  
>  	ret = mcde_display_init(drm);
>  	if (ret) {
>  		dev_err(drm->dev, "failed to init display\n");
> -		goto out_config;
> +		return ret;
>  	}
>  
>  	/*
> @@ -204,7 +204,7 @@ static int mcde_modeset_init(struct drm_device *drm)
>  						    mcde->bridge);
>  	if (ret) {
>  		dev_err(drm->dev, "failed to attach display output bridge\n");
> -		goto out_config;
> +		return ret;
>  	}
>  
>  	drm_mode_config_reset(drm);
> @@ -212,17 +212,6 @@ static int mcde_modeset_init(struct drm_device *drm)
>  	drm_fbdev_generic_setup(drm, 32);
>  
>  	return 0;
> -
> -out_config:
> -	drm_mode_config_cleanup(drm);
> -	return ret;
> -}
> -
> -static void mcde_release(struct drm_device *drm)
> -{
> -	struct mcde *mcde = drm->dev_private;
> -
> -	drm_mode_config_cleanup(drm);
>  }
>  
>  DEFINE_DRM_GEM_CMA_FOPS(drm_fops);
> @@ -230,7 +219,6 @@ DEFINE_DRM_GEM_CMA_FOPS(drm_fops);
>  static struct drm_driver mcde_drm_driver = {
>  	.driver_features =
>  		DRIVER_MODESET | DRIVER_GEM | DRIVER_ATOMIC,
> -	.release = mcde_release,
>  	.lastclose = drm_fb_helper_lastclose,
>  	.ioctls = NULL,
>  	.fops = &drm_fops,
> @@ -258,7 +246,9 @@ static int mcde_drm_bind(struct device *dev)
>  	struct drm_device *drm = dev_get_drvdata(dev);
>  	int ret;
>  
> -	drm_mode_config_init(drm);
> +	ret = drmm_mode_config_init(drm);
> +	if (ret)
> +		return ret;
>  
>  	ret = component_bind_all(drm->dev, drm);
>  	if (ret) {
> -- 
> 2.24.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
