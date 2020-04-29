Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D1EA1BE5AD
	for <lists+dri-devel@lfdr.de>; Wed, 29 Apr 2020 19:55:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BA146EAB4;
	Wed, 29 Apr 2020 17:55:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90B546EAB4
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Apr 2020 17:55:42 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 390E7804E6;
 Wed, 29 Apr 2020 19:55:40 +0200 (CEST)
Date: Wed, 29 Apr 2020 19:55:38 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 04/17] drm/mgag200: Use managed mode-config initialization
Message-ID: <20200429175538.GD31071@ravnborg.org>
References: <20200429143238.10115-1-tzimmermann@suse.de>
 <20200429143238.10115-5-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200429143238.10115-5-tzimmermann@suse.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=MOBOZvRl c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=kj9zAlcOel0A:10 a=7gkXJVJtAAAA:8 a=AnTGxznJFG88c3E8JKMA:9
 a=CjuIK1q_8ugA:10 a=E9Po1WZjFZOl8hwRPBS3:22
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
Cc: john.p.donnelly@oracle.com, dri-devel@lists.freedesktop.org,
 kraxel@redhat.com, airlied@redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 29, 2020 at 04:32:25PM +0200, Thomas Zimmermann wrote:
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Nice simplification. Changelog could be a bit more descriptive...

Anyway:
Acked-by: Sam Ravnborg <sam@ravnborg.org>

> ---
>  drivers/gpu/drm/mgag200/mgag200_drv.h  |  1 -
>  drivers/gpu/drm/mgag200/mgag200_main.c | 18 -------------
>  drivers/gpu/drm/mgag200/mgag200_mode.c | 37 ++++++++++++++++++++------
>  3 files changed, 29 insertions(+), 27 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mgag200/mgag200_drv.h b/drivers/gpu/drm/mgag200/mgag200_drv.h
> index 09b43a0ff6bbf..4403145e3593c 100644
> --- a/drivers/gpu/drm/mgag200/mgag200_drv.h
> +++ b/drivers/gpu/drm/mgag200/mgag200_drv.h
> @@ -182,7 +182,6 @@ mgag200_flags_from_driver_data(kernel_ulong_t driver_data)
>  
>  				/* mgag200_mode.c */
>  int mgag200_modeset_init(struct mga_device *mdev);
> -void mgag200_modeset_fini(struct mga_device *mdev);
>  
>  				/* mgag200_main.c */
>  int mgag200_driver_load(struct drm_device *dev, unsigned long flags);
> diff --git a/drivers/gpu/drm/mgag200/mgag200_main.c b/drivers/gpu/drm/mgag200/mgag200_main.c
> index 698fbf31337d4..cf25012f9b6ec 100644
> --- a/drivers/gpu/drm/mgag200/mgag200_main.c
> +++ b/drivers/gpu/drm/mgag200/mgag200_main.c
> @@ -10,15 +10,8 @@
>  
>  #include <linux/pci.h>
>  
> -#include <drm/drm_crtc_helper.h>
> -#include <drm/drm_gem_framebuffer_helper.h>
> -
>  #include "mgag200_drv.h"
>  
> -static const struct drm_mode_config_funcs mga_mode_funcs = {
> -	.fb_create = drm_gem_fb_create
> -};
> -
>  static int mga_probe_vram(struct mga_device *mdev, void __iomem *mem)
>  {
>  	int offset;
> @@ -159,14 +152,6 @@ int mgag200_driver_load(struct drm_device *dev, unsigned long flags)
>  	if (r)
>  		goto err_mm;
>  
> -	drm_mode_config_init(dev);
> -	dev->mode_config.funcs = (void *)&mga_mode_funcs;
> -	if (IS_G200_SE(mdev) && mdev->vram_fb_available < (2048*1024))
> -		dev->mode_config.preferred_depth = 16;
> -	else
> -		dev->mode_config.preferred_depth = 32;
> -	dev->mode_config.prefer_shadow = 1;
> -
>  	r = mgag200_modeset_init(mdev);
>  	if (r) {
>  		dev_err(&dev->pdev->dev, "Fatal error during modeset init: %d\n", r);
> @@ -176,7 +161,6 @@ int mgag200_driver_load(struct drm_device *dev, unsigned long flags)
>  	return 0;
>  
>  err_modeset:
> -	drm_mode_config_cleanup(dev);
>  	mgag200_mm_fini(mdev);
>  err_mm:
>  	dev->dev_private = NULL;
> @@ -190,8 +174,6 @@ void mgag200_driver_unload(struct drm_device *dev)
>  
>  	if (mdev == NULL)
>  		return;
> -	mgag200_modeset_fini(mdev);
> -	drm_mode_config_cleanup(dev);
>  	mgag200_mm_fini(mdev);
>  	dev->dev_private = NULL;
>  }
> diff --git a/drivers/gpu/drm/mgag200/mgag200_mode.c b/drivers/gpu/drm/mgag200/mgag200_mode.c
> index eaa3fca7216ac..3d894b37a0812 100644
> --- a/drivers/gpu/drm/mgag200/mgag200_mode.c
> +++ b/drivers/gpu/drm/mgag200/mgag200_mode.c
> @@ -13,6 +13,7 @@
>  
>  #include <drm/drm_crtc_helper.h>
>  #include <drm/drm_fourcc.h>
> +#include <drm/drm_gem_framebuffer_helper.h>
>  #include <drm/drm_plane_helper.h>
>  #include <drm/drm_probe_helper.h>
>  #include <drm/drm_simple_kms_helper.h>
> @@ -1614,16 +1615,41 @@ static int mgag200_vga_connector_init(struct mga_device *mdev)
>  	return ret;
>  }
>  
> +static const struct drm_mode_config_funcs mgag200_mode_config_funcs = {
> +	.fb_create = drm_gem_fb_create
> +};
> +
> +static unsigned int mgag200_preferred_depth(struct mga_device *mdev)
> +{
> +	if (IS_G200_SE(mdev) && mdev->vram_fb_available < (2048*1024))
> +		return 16;
> +	else
> +		return 32;
> +}
> +
>  int mgag200_modeset_init(struct mga_device *mdev)
>  {
> +	struct drm_device *dev = mdev->dev;
>  	struct drm_encoder *encoder = &mdev->encoder;
>  	struct drm_connector *connector = &mdev->connector.base;
>  	int ret;
>  
> -	mdev->dev->mode_config.max_width = MGAG200_MAX_FB_WIDTH;
> -	mdev->dev->mode_config.max_height = MGAG200_MAX_FB_HEIGHT;
> +	ret = drmm_mode_config_init(dev);
> +	if (ret) {
> +		drm_err(dev, "drmm_mode_config_init() failed, error %d\n",
> +			ret);
> +		return ret;
> +	}
> +
> +	dev->mode_config.max_width = MGAG200_MAX_FB_WIDTH;
> +	dev->mode_config.max_height = MGAG200_MAX_FB_HEIGHT;
> +
> +	dev->mode_config.preferred_depth = mgag200_preferred_depth(mdev);
> +	dev->mode_config.prefer_shadow = 1;
> +
> +	dev->mode_config.fb_base = mdev->mc.vram_base;
>  
> -	mdev->dev->mode_config.fb_base = mdev->mc.vram_base;
> +	dev->mode_config.funcs = &mgag200_mode_config_funcs;
>  
>  	mga_crtc_init(mdev);
>  
> @@ -1648,8 +1674,3 @@ int mgag200_modeset_init(struct mga_device *mdev)
>  
>  	return 0;
>  }
> -
> -void mgag200_modeset_fini(struct mga_device *mdev)
> -{
> -
> -}
> -- 
> 2.26.0
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
