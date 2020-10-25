Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 03AD82983D1
	for <lists+dri-devel@lfdr.de>; Sun, 25 Oct 2020 23:08:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 771DA6E0D1;
	Sun, 25 Oct 2020 22:08:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA3686E055;
 Sun, 25 Oct 2020 22:08:22 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 9D64B80617;
 Sun, 25 Oct 2020 23:08:20 +0100 (CET)
Date: Sun, 25 Oct 2020 23:08:19 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH 2/5] drm: Compile out legacy chunks from struct drm_device
Message-ID: <20201025220819.GB13779@ravnborg.org>
References: <20201023122811.2374118-1-daniel.vetter@ffwll.ch>
 <20201023122811.2374118-2-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201023122811.2374118-2-daniel.vetter@ffwll.ch>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=fu7ymmwf c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=kj9zAlcOel0A:10 a=QyXUC8HyAAAA:8 a=VwQbUJbxAAAA:8 a=7gkXJVJtAAAA:8
 a=e5mUnYsNAAAA:8 a=2N2MxvP87AMp4j_agHYA:9 a=CjuIK1q_8ugA:10
 a=AjGcO6oz07-iQ99wixmX:22 a=E9Po1WZjFZOl8hwRPBS3:22
 a=Vxmtnl_E_bksehYqCbjh:22
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@intel.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 DRI Development <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Oct 23, 2020 at 02:28:08PM +0200, Daniel Vetter wrote:
> This means some very few #ifdef in code, but it allows us to
> enlist the compiler to make sure this stuff isn't used anymore.
> 
> More important, only legacy drivers change drm_device (for the
> legacy_dev_list shadow attach management), therefore this is
> prep to allow modern drivers to have a const driver struct. Which
> is nice, because there's a ton of function pointers in there.
> 
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Signed-off-by: Daniel Vetter <daniel.vetter@ffwll.ch>

Some of the conditionals does not help the readability :-(
But they are better than exposing legacy stuff to non-legacy drivers.
And it is a suprising fews that are required.
So legacy seems to be factored out well from the core.

Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
> ---
>  drivers/gpu/drm/drm_file.c   |  2 ++
>  drivers/gpu/drm/drm_vblank.c | 15 ++++++++++++---
>  include/drm/drm_drv.h        |  2 ++
>  3 files changed, 16 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
> index 0ac4566ae3f4..b50380fa80ce 100644
> --- a/drivers/gpu/drm/drm_file.c
> +++ b/drivers/gpu/drm/drm_file.c
> @@ -258,9 +258,11 @@ void drm_file_free(struct drm_file *file)
>  		  (long)old_encode_dev(file->minor->kdev->devt),
>  		  atomic_read(&dev->open_count));
>  
> +#ifdef CONFIG_DRM_LEGACY
>  	if (drm_core_check_feature(dev, DRIVER_LEGACY) &&
>  	    dev->driver->preclose)
>  		dev->driver->preclose(dev, file);
> +#endif
>  
>  	if (drm_core_check_feature(dev, DRIVER_LEGACY))
>  		drm_legacy_lock_release(dev, file->filp);
> diff --git a/drivers/gpu/drm/drm_vblank.c b/drivers/gpu/drm/drm_vblank.c
> index ba7e741764aa..15e5ea436434 100644
> --- a/drivers/gpu/drm/drm_vblank.c
> +++ b/drivers/gpu/drm/drm_vblank.c
> @@ -210,9 +210,12 @@ static u32 __get_vblank_counter(struct drm_device *dev, unsigned int pipe)
>  
>  		if (crtc->funcs->get_vblank_counter)
>  			return crtc->funcs->get_vblank_counter(crtc);
> -	} else if (dev->driver->get_vblank_counter) {
> +	}
> +#ifdef CONFIG_DRM_LEGACY
> +	else if (dev->driver->get_vblank_counter) {
>  		return dev->driver->get_vblank_counter(dev, pipe);
>  	}
> +#endif
>  
>  	return drm_vblank_no_hw_counter(dev, pipe);
>  }
> @@ -430,9 +433,12 @@ static void __disable_vblank(struct drm_device *dev, unsigned int pipe)
>  
>  		if (crtc->funcs->disable_vblank)
>  			crtc->funcs->disable_vblank(crtc);
> -	} else {
> +	}
> +#ifdef CONFIG_DRM_LEGACY
> +	else {
>  		dev->driver->disable_vblank(dev, pipe);
>  	}
> +#endif
>  }
>  
>  /*
> @@ -1097,9 +1103,12 @@ static int __enable_vblank(struct drm_device *dev, unsigned int pipe)
>  
>  		if (crtc->funcs->enable_vblank)
>  			return crtc->funcs->enable_vblank(crtc);
> -	} else if (dev->driver->enable_vblank) {
> +	}
> +#ifdef CONFIG_DRM_LEGACY
> +	else if (dev->driver->enable_vblank) {
>  		return dev->driver->enable_vblank(dev, pipe);
>  	}
> +#endif
>  
>  	return -EINVAL;
>  }
> diff --git a/include/drm/drm_drv.h b/include/drm/drm_drv.h
> index c6d17550efc9..7af220226a25 100644
> --- a/include/drm/drm_drv.h
> +++ b/include/drm/drm_drv.h
> @@ -498,6 +498,7 @@ struct drm_driver {
>  	 */
>  	const struct file_operations *fops;
>  
> +#ifdef CONFIG_DRM_LEGACY
>  	/* Everything below here is for legacy driver, never use! */
>  	/* private: */
>  
> @@ -512,6 +513,7 @@ struct drm_driver {
>  	int (*enable_vblank)(struct drm_device *dev, unsigned int pipe);
>  	void (*disable_vblank)(struct drm_device *dev, unsigned int pipe);
>  	int dev_priv_size;
> +#endif
>  };
>  
>  void *__devm_drm_dev_alloc(struct device *parent, struct drm_driver *driver,
> -- 
> 2.28.0
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
