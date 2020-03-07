Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03C7917CCCD
	for <lists+dri-devel@lfdr.de>; Sat,  7 Mar 2020 09:21:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CC396E0B8;
	Sat,  7 Mar 2020 08:21:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E09A66E09A;
 Sat,  7 Mar 2020 08:21:00 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id E390D804FD;
 Sat,  7 Mar 2020 09:20:58 +0100 (CET)
Date: Sat, 7 Mar 2020 09:20:57 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH 23/51] drm: Manage drm_gem_init with drmm_
Message-ID: <20200307082057.GB28810@ravnborg.org>
References: <20200302222631.3861340-1-daniel.vetter@ffwll.ch>
 <20200302222631.3861340-24-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200302222631.3861340-24-daniel.vetter@ffwll.ch>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=XpTUx2N9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=QyXUC8HyAAAA:8
 a=7gkXJVJtAAAA:8 a=e5mUnYsNAAAA:8 a=ja8H0Y2h8MqB4HDIWGUA:9
 a=CjuIK1q_8ugA:10 a=E9Po1WZjFZOl8hwRPBS3:22 a=Vxmtnl_E_bksehYqCbjh:22
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

Hi Daniel.

On Mon, Mar 02, 2020 at 11:26:03PM +0100, Daniel Vetter wrote:
> We might want to look into pushing this down into drm_mm_init, but
> that would mean rolling out return codes to a pile of functions
> unfortunately. So let's leave that for now.
> 
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>

We are loosing this part of the destroy function:

	dev->vma_offset_manager = NULL;

But there was no code that I could find that relied on this, so this
should be OK.

Acked-by: Sam Ravnborg <sam@ravnborg.org>

> ---
>  drivers/gpu/drm/drm_drv.c      |  8 +-------
>  drivers/gpu/drm/drm_gem.c      | 21 ++++++++++-----------
>  drivers/gpu/drm/drm_internal.h |  1 -
>  3 files changed, 11 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
> index 29d106195ab3..9a646155dfc6 100644
> --- a/drivers/gpu/drm/drm_drv.c
> +++ b/drivers/gpu/drm/drm_drv.c
> @@ -688,13 +688,10 @@ int drm_dev_init(struct drm_device *dev,
>  
>  	ret = drm_dev_set_unique(dev, dev_name(parent));
>  	if (ret)
> -		goto err_setunique;
> +		goto err;
>  
>  	return 0;
>  
> -err_setunique:
> -	if (drm_core_check_feature(dev, DRIVER_GEM))
> -		drm_gem_destroy(dev);
>  err:
>  	drm_managed_release(dev);
>  
> @@ -756,9 +753,6 @@ EXPORT_SYMBOL(devm_drm_dev_init);
>  void drm_dev_fini(struct drm_device *dev)
>  {
>  	drm_vblank_cleanup(dev);
> -
> -	if (drm_core_check_feature(dev, DRIVER_GEM))
> -		drm_gem_destroy(dev);
>  }
>  EXPORT_SYMBOL(drm_dev_fini);
>  
> diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
> index 0b6e6623735e..31095e0f6b9f 100644
> --- a/drivers/gpu/drm/drm_gem.c
> +++ b/drivers/gpu/drm/drm_gem.c
> @@ -44,6 +44,7 @@
>  #include <drm/drm_drv.h>
>  #include <drm/drm_file.h>
>  #include <drm/drm_gem.h>
> +#include <drm/drm_managed.h>
>  #include <drm/drm_print.h>
>  #include <drm/drm_vma_manager.h>
>  
> @@ -77,6 +78,12 @@
>   * up at a later date, and as our interface with shmfs for memory allocation.
>   */
>  
> +static void
> +drm_gem_init_release(struct drm_device *dev, void *ptr)
> +{
> +	drm_vma_offset_manager_destroy(dev->vma_offset_manager);
> +}
> +
>  /**
>   * drm_gem_init - Initialize the GEM device fields
>   * @dev: drm_devic structure to initialize
> @@ -89,7 +96,8 @@ drm_gem_init(struct drm_device *dev)
>  	mutex_init(&dev->object_name_lock);
>  	idr_init_base(&dev->object_name_idr, 1);
>  
> -	vma_offset_manager = kzalloc(sizeof(*vma_offset_manager), GFP_KERNEL);
> +	vma_offset_manager = drmm_kzalloc(dev, sizeof(*vma_offset_manager),
> +					  GFP_KERNEL);
>  	if (!vma_offset_manager) {
>  		DRM_ERROR("out of memory\n");
>  		return -ENOMEM;
> @@ -100,16 +108,7 @@ drm_gem_init(struct drm_device *dev)
>  				    DRM_FILE_PAGE_OFFSET_START,
>  				    DRM_FILE_PAGE_OFFSET_SIZE);
>  
> -	return 0;
> -}
> -
> -void
> -drm_gem_destroy(struct drm_device *dev)
> -{
> -
> -	drm_vma_offset_manager_destroy(dev->vma_offset_manager);
> -	kfree(dev->vma_offset_manager);
> -	dev->vma_offset_manager = NULL;
> +	return drmm_add_action(dev, drm_gem_init_release, NULL);
>  }
>  
>  /**
> diff --git a/drivers/gpu/drm/drm_internal.h b/drivers/gpu/drm/drm_internal.h
> index 8c2628dfc6c7..cb09e95a795e 100644
> --- a/drivers/gpu/drm/drm_internal.h
> +++ b/drivers/gpu/drm/drm_internal.h
> @@ -144,7 +144,6 @@ void drm_sysfs_lease_event(struct drm_device *dev);
>  /* drm_gem.c */
>  struct drm_gem_object;
>  int drm_gem_init(struct drm_device *dev);
> -void drm_gem_destroy(struct drm_device *dev);
>  int drm_gem_handle_create_tail(struct drm_file *file_priv,
>  			       struct drm_gem_object *obj,
>  			       u32 *handlep);
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
