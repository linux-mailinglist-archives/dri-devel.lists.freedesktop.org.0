Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 136E61646D1
	for <lists+dri-devel@lfdr.de>; Wed, 19 Feb 2020 15:22:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79C196E81C;
	Wed, 19 Feb 2020 14:22:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEAF96E808;
 Wed, 19 Feb 2020 14:22:36 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5A12F2F9;
 Wed, 19 Feb 2020 15:22:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1582122155;
 bh=hdAYzomJhaxy0DSd8b/nOVZASYeXhOhOUsp8XKuJ3rU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=oZLEn5udRwppYh2zjWY0mJoMa4pKFAbwRSgIWXdYFFkU1LHcwdImSo/hg2EuMrSEF
 hlhMEqW2wVUxLVUqzgXBbG8QT7fWXgoyV3wFUScpqb7fdN5hoefysPr0wYvkhFrMdX
 qAYHmB4senfhXVegkAd5F/CnfAxM2TfHQwJEMtP8=
Date: Wed, 19 Feb 2020 16:22:17 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH 24/52] drm: Manage drm_gem_init with drmm_
Message-ID: <20200219142217.GK5070@pendragon.ideasonboard.com>
References: <20200219102122.1607365-1-daniel.vetter@ffwll.ch>
 <20200219102122.1607365-25-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200219102122.1607365-25-daniel.vetter@ffwll.ch>
User-Agent: Mutt/1.10.1 (2018-07-13)
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

Hi Daniel,

Thank you for the patch.

On Wed, Feb 19, 2020 at 11:20:54AM +0100, Daniel Vetter wrote:
> We might want to look into pushing this down into drm_mm_init, but
> that would mean rolling out return codes to a pile of functions
> unfortunately. So let's leave that for now.
> 
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> ---
>  drivers/gpu/drm/drm_drv.c      |  8 +-------
>  drivers/gpu/drm/drm_gem.c      | 21 ++++++++++-----------
>  drivers/gpu/drm/drm_internal.h |  1 -
>  3 files changed, 11 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
> index 03a1fb377830..7b3df1188da9 100644
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

This looks fine as such (although I'm not sure if the managed API
overhead is really worth it for core code), but it leads to a potential
issue: if we handle more of the cleanup through the managed API, how do
we ensure that the cleanup functions are called in the right order (when
order matters) ?

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

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
