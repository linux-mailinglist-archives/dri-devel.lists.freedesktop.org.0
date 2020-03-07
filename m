Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B14417CCD4
	for <lists+dri-devel@lfdr.de>; Sat,  7 Mar 2020 09:28:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE1146E10C;
	Sat,  7 Mar 2020 08:28:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD0676E0B6;
 Sat,  7 Mar 2020 08:28:17 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id E12E580511;
 Sat,  7 Mar 2020 09:28:15 +0100 (CET)
Date: Sat, 7 Mar 2020 09:28:14 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH 24/51] drm: Manage drm_vblank_cleanup with drmm_
Message-ID: <20200307082814.GC28810@ravnborg.org>
References: <20200302222631.3861340-1-daniel.vetter@ffwll.ch>
 <20200302222631.3861340-25-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200302222631.3861340-25-daniel.vetter@ffwll.ch>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=XpTUx2N9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=QyXUC8HyAAAA:8
 a=7gkXJVJtAAAA:8 a=e5mUnYsNAAAA:8 a=mbxDDwLYv4oOkcGWJz8A:9
 a=6y4ZaWG7wlO2C3wI:21 a=kPZdfhLwyzaIfhaO:21 a=CjuIK1q_8ugA:10
 a=E9Po1WZjFZOl8hwRPBS3:22 a=Vxmtnl_E_bksehYqCbjh:22
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
Cc: Daniel Vetter <daniel.vetter@intel.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Mar 02, 2020 at 11:26:04PM +0100, Daniel Vetter wrote:
> Nothing special here, except that this is the first time that we
> automatically clean up something that's initialized with an explicit
> driver call. But the cleanup was done at the very of the release
the very what?

> sequence for all drivers, and that's still the case. At least without
> more uses of drmm_ through explicit driver calls.

This patch does not simplify things in itself.
The motivation here is to remove the drm_dev_fini()
dependencies from the drivers.

So drm_dev_fini() can be dropped in a follow-up patch.
Maybe extend the changelog a little?

> Also for this one we need drmm_kcalloc, so lets add those
> 
> v2: Sort includes (Laurent)
> 
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>

Acked-by: Sam Ravnborg <sam@ravnborg.org>

> ---
>  drivers/gpu/drm/drm_drv.c      |  1 -
>  drivers/gpu/drm/drm_internal.h |  1 -
>  drivers/gpu/drm/drm_vblank.c   | 31 ++++++++++++-------------------
>  include/drm/drm_managed.h      | 16 ++++++++++++++++
>  4 files changed, 28 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
> index 9a646155dfc6..90b6ae81d431 100644
> --- a/drivers/gpu/drm/drm_drv.c
> +++ b/drivers/gpu/drm/drm_drv.c
> @@ -752,7 +752,6 @@ EXPORT_SYMBOL(devm_drm_dev_init);
>   */
>  void drm_dev_fini(struct drm_device *dev)
>  {
> -	drm_vblank_cleanup(dev);
>  }
>  EXPORT_SYMBOL(drm_dev_fini);
>  
> diff --git a/drivers/gpu/drm/drm_internal.h b/drivers/gpu/drm/drm_internal.h
> index cb09e95a795e..e67015d07c4c 100644
> --- a/drivers/gpu/drm/drm_internal.h
> +++ b/drivers/gpu/drm/drm_internal.h
> @@ -94,7 +94,6 @@ void drm_managed_release(struct drm_device *dev);
>  
>  /* drm_vblank.c */
>  void drm_vblank_disable_and_save(struct drm_device *dev, unsigned int pipe);
> -void drm_vblank_cleanup(struct drm_device *dev);
>  
>  /* IOCTLS */
>  int drm_wait_vblank_ioctl(struct drm_device *dev, void *data,
> diff --git a/drivers/gpu/drm/drm_vblank.c b/drivers/gpu/drm/drm_vblank.c
> index 47fc4339ec7f..5a6ec8aa0873 100644
> --- a/drivers/gpu/drm/drm_vblank.c
> +++ b/drivers/gpu/drm/drm_vblank.c
> @@ -30,6 +30,7 @@
>  #include <drm/drm_crtc.h>
>  #include <drm/drm_drv.h>
>  #include <drm/drm_framebuffer.h>
> +#include <drm/drm_managed.h>
>  #include <drm/drm_modeset_helper_vtables.h>
>  #include <drm/drm_print.h>
>  #include <drm/drm_vblank.h>
> @@ -425,14 +426,10 @@ static void vblank_disable_fn(struct timer_list *t)
>  	spin_unlock_irqrestore(&dev->vbl_lock, irqflags);
>  }
>  
> -void drm_vblank_cleanup(struct drm_device *dev)
> +static void drm_vblank_init_release(struct drm_device *dev, void *ptr)
>  {
>  	unsigned int pipe;
>  
> -	/* Bail if the driver didn't call drm_vblank_init() */
> -	if (dev->num_crtcs == 0)
> -		return;
> -
>  	for (pipe = 0; pipe < dev->num_crtcs; pipe++) {
>  		struct drm_vblank_crtc *vblank = &dev->vblank[pipe];
>  
> @@ -441,10 +438,6 @@ void drm_vblank_cleanup(struct drm_device *dev)
>  
>  		del_timer_sync(&vblank->disable_timer);
>  	}
> -
> -	kfree(dev->vblank);
> -
> -	dev->num_crtcs = 0;
>  }
>  
>  /**
> @@ -453,25 +446,29 @@ void drm_vblank_cleanup(struct drm_device *dev)
>   * @num_crtcs: number of CRTCs supported by @dev
>   *
>   * This function initializes vblank support for @num_crtcs display pipelines.
> - * Cleanup is handled by the DRM core, or through calling drm_dev_fini() for
> - * drivers with a &drm_driver.release callback.
> + * Cleanup is handled automatically through a cleanup function added with
> + * drmm_add_action().
>   *
>   * Returns:
>   * Zero on success or a negative error code on failure.
>   */
>  int drm_vblank_init(struct drm_device *dev, unsigned int num_crtcs)
>  {
> -	int ret = -ENOMEM;
> +	int ret;
>  	unsigned int i;
>  
>  	spin_lock_init(&dev->vbl_lock);
>  	spin_lock_init(&dev->vblank_time_lock);
>  
> +	dev->vblank = drmm_kcalloc(dev, num_crtcs, sizeof(*dev->vblank), GFP_KERNEL);
> +	if (!dev->vblank)
> +		return -ENOMEM;
> +
>  	dev->num_crtcs = num_crtcs;
>  
> -	dev->vblank = kcalloc(num_crtcs, sizeof(*dev->vblank), GFP_KERNEL);
> -	if (!dev->vblank)
> -		goto err;
> +	ret = drmm_add_action(dev, drm_vblank_init_release, NULL);
> +	if (ret)
> +		return ret;
>  
>  	for (i = 0; i < num_crtcs; i++) {
>  		struct drm_vblank_crtc *vblank = &dev->vblank[i];
> @@ -486,10 +483,6 @@ int drm_vblank_init(struct drm_device *dev, unsigned int num_crtcs)
>  	DRM_INFO("Supports vblank timestamp caching Rev 2 (21.10.2013).\n");
>  
>  	return 0;
> -
> -err:
> -	dev->num_crtcs = 0;
> -	return ret;
>  }
>  EXPORT_SYMBOL(drm_vblank_init);
>  
> diff --git a/include/drm/drm_managed.h b/include/drm/drm_managed.h
> index 5280209dff92..2b1ba2ad5582 100644
> --- a/include/drm/drm_managed.h
> +++ b/include/drm/drm_managed.h
> @@ -4,6 +4,7 @@
>  #define _DRM_MANAGED_H_
>  
>  #include <linux/gfp.h>
> +#include <linux/overflow.h>
>  #include <linux/types.h>
>  
>  struct drm_device;
> @@ -28,6 +29,21 @@ static inline void *drmm_kzalloc(struct drm_device *dev, size_t size, gfp_t gfp)
>  {
>  	return drmm_kmalloc(dev, size, gfp | __GFP_ZERO);
>  }
> +static inline void *drmm_kmalloc_array(struct drm_device *dev,
> +				       size_t n, size_t size, gfp_t flags)
> +{
> +	size_t bytes;
> +
> +	if (unlikely(check_mul_overflow(n, size, &bytes)))
> +		return NULL;
> +
> +	return drmm_kmalloc(dev, bytes, flags);
> +}
> +static inline void *drmm_kcalloc(struct drm_device *dev,
> +				 size_t n, size_t size, gfp_t flags)
> +{
> +	return drmm_kmalloc_array(dev, n, size, flags | __GFP_ZERO);
> +}
>  char *drmm_kstrdup(struct drm_device *dev, const char *s, gfp_t gfp);
>  
>  void drmm_kfree(struct drm_device *dev, void *data);
> -- 
> 2.24.1
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
