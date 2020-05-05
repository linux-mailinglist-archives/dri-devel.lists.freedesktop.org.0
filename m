Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 756991C5DBD
	for <lists+dri-devel@lfdr.de>; Tue,  5 May 2020 18:40:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B3FC6E7DD;
	Tue,  5 May 2020 16:40:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0ADE56E7DD
 for <dri-devel@lists.freedesktop.org>; Tue,  5 May 2020 16:40:08 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 5F98C804BA;
 Tue,  5 May 2020 18:40:05 +0200 (CEST)
Date: Tue, 5 May 2020 18:40:04 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 2/5] drm/mgag200: Integrate init function into load
 function
Message-ID: <20200505164004.GC5082@ravnborg.org>
References: <20200505095649.25814-1-tzimmermann@suse.de>
 <20200505095649.25814-3-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200505095649.25814-3-tzimmermann@suse.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=MOBOZvRl c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=kj9zAlcOel0A:10 a=7gkXJVJtAAAA:8 a=BSp6G6xUjbiB4hBflvYA:9
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
Cc: cogarre@gmail.com, dri-devel@lists.freedesktop.org, kraxel@redhat.com,
 airlied@redhat.com, emil.velikov@collabora.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, May 05, 2020 at 11:56:46AM +0200, Thomas Zimmermann wrote:
> Done to simplify initialization code before embedding the DRM device
> instance in struct mga_device.
And replace DRM_ERROR with drm_err
And replace r with ret.

I could not follow all the code re-shuffeling, but I expect it to be
fine.
Acked-by: Sam Ravnborg <sam@ravnborg.org>

> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/mgag200/mgag200_main.c | 67 ++++++++++----------------
>  1 file changed, 26 insertions(+), 41 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mgag200/mgag200_main.c b/drivers/gpu/drm/mgag200/mgag200_main.c
> index b705b7776d2fc..3830d3f3c9fa2 100644
> --- a/drivers/gpu/drm/mgag200/mgag200_main.c
> +++ b/drivers/gpu/drm/mgag200/mgag200_main.c
> @@ -89,12 +89,23 @@ static int mga_vram_init(struct mga_device *mdev)
>  	return 0;
>  }
>  
> -static int mgag200_device_init(struct drm_device *dev,
> -			       uint32_t flags)
> +/*
> + * Functions here will be called by the core once it's bound the driver to
> + * a PCI device
> + */
> +
> +
> +int mgag200_driver_load(struct drm_device *dev, unsigned long flags)
>  {
> -	struct mga_device *mdev = to_mga_device(dev);
> +	struct mga_device *mdev;
>  	int ret, option;
>  
> +	mdev = devm_kzalloc(dev->dev, sizeof(struct mga_device), GFP_KERNEL);
> +	if (mdev == NULL)
> +		return -ENOMEM;
> +	dev->dev_private = (void *)mdev;
> +	mdev->dev = dev;
> +
>  	mdev->flags = mgag200_flags_from_driver_data(flags);
>  	mdev->type = mgag200_type_from_driver_data(flags);
>  
> @@ -110,7 +121,7 @@ static int mgag200_device_init(struct drm_device *dev,
>  
>  	if (!devm_request_mem_region(mdev->dev->dev, mdev->rmmio_base, mdev->rmmio_size,
>  				"mgadrmfb_mmio")) {
> -		DRM_ERROR("can't reserve mmio registers\n");
> +		drm_err(dev, "can't reserve mmio registers\n");
>  		return -ENOMEM;
>  	}
>  
> @@ -121,8 +132,8 @@ static int mgag200_device_init(struct drm_device *dev,
>  	/* stash G200 SE model number for later use */
>  	if (IS_G200_SE(mdev)) {
>  		mdev->unique_rev_id = RREG32(0x1e24);
> -		DRM_DEBUG("G200 SE unique revision id is 0x%x\n",
> -			  mdev->unique_rev_id);
> +		drm_dbg(dev, "G200 SE unique revision id is 0x%x\n",
> +			mdev->unique_rev_id);
>  	}
>  
>  	ret = mga_vram_init(mdev);
> @@ -133,33 +144,9 @@ static int mgag200_device_init(struct drm_device *dev,
>  	mdev->bpp_shifts[1] = 1;
>  	mdev->bpp_shifts[2] = 0;
>  	mdev->bpp_shifts[3] = 2;
> -	return 0;
> -}
>  
> -/*
> - * Functions here will be called by the core once it's bound the driver to
> - * a PCI device
> - */
> -
> -
> -int mgag200_driver_load(struct drm_device *dev, unsigned long flags)
> -{
> -	struct mga_device *mdev;
> -	int r;
> -
> -	mdev = devm_kzalloc(dev->dev, sizeof(struct mga_device), GFP_KERNEL);
> -	if (mdev == NULL)
> -		return -ENOMEM;
> -	dev->dev_private = (void *)mdev;
> -	mdev->dev = dev;
> -
> -	r = mgag200_device_init(dev, flags);
> -	if (r) {
> -		dev_err(&dev->pdev->dev, "Fatal error during GPU init: %d\n", r);
> -		return r;
> -	}
> -	r = mgag200_mm_init(mdev);
> -	if (r)
> +	ret = mgag200_mm_init(mdev);
> +	if (ret)
>  		goto err_mm;
>  
>  	drm_mode_config_init(dev);
> @@ -170,16 +157,15 @@ int mgag200_driver_load(struct drm_device *dev, unsigned long flags)
>  		dev->mode_config.preferred_depth = 32;
>  	dev->mode_config.prefer_shadow = 1;
>  
> -	r = mgag200_modeset_init(mdev);
> -	if (r) {
> -		dev_err(&dev->pdev->dev, "Fatal error during modeset init: %d\n", r);
> +	ret = mgag200_modeset_init(mdev);
> +	if (ret) {
> +		drm_err(dev, "Fatal error during modeset init: %d\n", ret);
>  		goto err_modeset;
>  	}
>  
> -	r = mgag200_cursor_init(mdev);
> -	if (r)
> -		dev_warn(&dev->pdev->dev,
> -			"Could not initialize cursors. Not doing hardware cursors.\n");
> +	ret = mgag200_cursor_init(mdev);
> +	if (ret)
> +		drm_err(dev, "Could not initialize cursors. Not doing hardware cursors.\n");
>  
>  	return 0;
>  
> @@ -189,8 +175,7 @@ int mgag200_driver_load(struct drm_device *dev, unsigned long flags)
>  	mgag200_mm_fini(mdev);
>  err_mm:
>  	dev->dev_private = NULL;
> -
> -	return r;
> +	return ret;
>  }
>  
>  void mgag200_driver_unload(struct drm_device *dev)
> -- 
> 2.26.0
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
