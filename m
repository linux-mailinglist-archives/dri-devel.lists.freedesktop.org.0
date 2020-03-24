Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AD264191C0B
	for <lists+dri-devel@lfdr.de>; Tue, 24 Mar 2020 22:42:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 655966E067;
	Tue, 24 Mar 2020 21:42:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 830706E0CC;
 Tue, 24 Mar 2020 21:42:05 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id F36B920058;
 Tue, 24 Mar 2020 22:42:02 +0100 (CET)
Date: Tue, 24 Mar 2020 22:42:01 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH] drm: manage drm_minor cleanup with drmm_
Message-ID: <20200324214201.GA26542@ravnborg.org>
References: <20200323144950.3018436-23-daniel.vetter@ffwll.ch>
 <20200324203936.3330994-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200324203936.3330994-1-daniel.vetter@ffwll.ch>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=eMA9ckh1 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=P1BnusSwAAAA:8
 a=QyXUC8HyAAAA:8 a=e5mUnYsNAAAA:8 a=f1K3EPI_e7ua9Xh_lkcA:9
 a=CjuIK1q_8ugA:10 a=D0XLA9XvdZm18NrgonBM:22 a=Vxmtnl_E_bksehYqCbjh:22
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Mar 24, 2020 at 09:39:36PM +0100, Daniel Vetter wrote:
> The cleanup here is somewhat tricky, since we can't tell apart the
> allocated minor index from 0. So register a cleanup action first, and
> if the index allocation fails, unregister that cleanup action again to
> avoid bad mistakes.
> 
> The kdev for the minor already handles NULL, so no problem there.
> 
> Hence add drmm_remove_action() to the drm_managed library.
> 
> v2: Make pointer math around void ** consistent with what Laurent
> suggested.
> 
> v3: Use drmm_add_action_or_reset and remove drmm_remove_action. Noticed
> because of some questions from Thomas. This also means we need to move
> the drmm_add_action_or_reset helper earlier in the series.
> 
> v4: Uh ... fix slightly embarrassing bug CI spotted.
Looks like the one I spotted in my review.
Saw your mail only after posting.

One Q below.

> 
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> ---
>  drivers/gpu/drm/drm_drv.c     | 69 ++++++++++++-----------------------
>  drivers/gpu/drm/drm_managed.c | 14 +++++++
>  include/drm/drm_managed.h     |  9 ++++-
>  3 files changed, 46 insertions(+), 46 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
> index a710c53d13a8..50c56ff24c71 100644
> --- a/drivers/gpu/drm/drm_drv.c
> +++ b/drivers/gpu/drm/drm_drv.c
> @@ -93,13 +93,25 @@ static struct drm_minor **drm_minor_get_slot(struct drm_device *dev,
>  	}
>  }
>  
> +static void drm_minor_alloc_release(struct drm_device *dev, void *data)
> +{
> +	struct drm_minor *minor = data;
> +	unsigned long flags;
> +
> +	put_device(minor->kdev);
> +
> +	spin_lock_irqsave(&drm_minor_lock, flags);
> +	idr_remove(&drm_minors_idr, minor->index);
> +	spin_unlock_irqrestore(&drm_minor_lock, flags);
> +}
> +
>  static int drm_minor_alloc(struct drm_device *dev, unsigned int type)
>  {
>  	struct drm_minor *minor;
>  	unsigned long flags;
>  	int r;
>  
> -	minor = kzalloc(sizeof(*minor), GFP_KERNEL);
> +	minor = drmm_kzalloc(dev, sizeof(*minor), GFP_KERNEL);
>  	if (!minor)
>  		return -ENOMEM;
>  
> @@ -117,46 +129,20 @@ static int drm_minor_alloc(struct drm_device *dev, unsigned int type)
>  	idr_preload_end();
>  
>  	if (r < 0)
> -		goto err_free;
> +		return r;
>  
>  	minor->index = r;
>  
> +	r = drmm_add_action_or_reset(dev, drm_minor_alloc_release, minor);
> +	if (r)
> +		return r;
> +
>  	minor->kdev = drm_sysfs_minor_alloc(minor);
> -	if (IS_ERR(minor->kdev)) {
> -		r = PTR_ERR(minor->kdev);
> -		goto err_index;
> -	}
> +	if (IS_ERR(minor->kdev))
> +		return PTR_ERR(minor->kdev);
>  
>  	*drm_minor_get_slot(dev, type) = minor;
>  	return 0;
> -
> -err_index:
> -	spin_lock_irqsave(&drm_minor_lock, flags);
> -	idr_remove(&drm_minors_idr, minor->index);
> -	spin_unlock_irqrestore(&drm_minor_lock, flags);
> -err_free:
> -	kfree(minor);
> -	return r;
> -}
> -
> -static void drm_minor_free(struct drm_device *dev, unsigned int type)
> -{
> -	struct drm_minor **slot, *minor;
> -	unsigned long flags;
> -
> -	slot = drm_minor_get_slot(dev, type);
> -	minor = *slot;
> -	if (!minor)
> -		return;
> -
> -	put_device(minor->kdev);
> -
> -	spin_lock_irqsave(&drm_minor_lock, flags);
> -	idr_remove(&drm_minors_idr, minor->index);
> -	spin_unlock_irqrestore(&drm_minor_lock, flags);
> -
> -	kfree(minor);

> -	*slot = NULL;

In drm_minor_alloc_release() there is no equivalent to this
NULL assignment.
Did you consider if there was any real reason for the NULL assignment?

	Sam


>  }
>  
>  static int drm_minor_register(struct drm_device *dev, unsigned int type)
> @@ -678,16 +664,16 @@ int drm_dev_init(struct drm_device *dev,
>  	if (drm_core_check_feature(dev, DRIVER_RENDER)) {
>  		ret = drm_minor_alloc(dev, DRM_MINOR_RENDER);
>  		if (ret)
> -			goto err_minors;
> +			goto err;
>  	}
>  
>  	ret = drm_minor_alloc(dev, DRM_MINOR_PRIMARY);
>  	if (ret)
> -		goto err_minors;
> +		goto err;
>  
>  	ret = drm_legacy_create_map_hash(dev);
>  	if (ret)
> -		goto err_minors;
> +		goto err;
>  
>  	drm_legacy_ctxbitmap_init(dev);
>  
> @@ -695,7 +681,7 @@ int drm_dev_init(struct drm_device *dev,
>  		ret = drm_gem_init(dev);
>  		if (ret) {
>  			DRM_ERROR("Cannot initialize graphics execution manager (GEM)\n");
> -			goto err_ctxbitmap;
> +			goto err;
>  		}
>  	}
>  
> @@ -708,10 +694,6 @@ int drm_dev_init(struct drm_device *dev,
>  err_setunique:
>  	if (drm_core_check_feature(dev, DRIVER_GEM))
>  		drm_gem_destroy(dev);
> -err_ctxbitmap:
> -err_minors:
> -	drm_minor_free(dev, DRM_MINOR_PRIMARY);
> -	drm_minor_free(dev, DRM_MINOR_RENDER);
>  err:
>  	drm_managed_release(dev);
>  
> @@ -776,9 +758,6 @@ void drm_dev_fini(struct drm_device *dev)
>  
>  	if (drm_core_check_feature(dev, DRIVER_GEM))
>  		drm_gem_destroy(dev);
> -
> -	drm_minor_free(dev, DRM_MINOR_PRIMARY);
> -	drm_minor_free(dev, DRM_MINOR_RENDER);
>  }
>  EXPORT_SYMBOL(drm_dev_fini);
>  
> diff --git a/drivers/gpu/drm/drm_managed.c b/drivers/gpu/drm/drm_managed.c
> index 6bce1c892df3..7246a8318137 100644
> --- a/drivers/gpu/drm/drm_managed.c
> +++ b/drivers/gpu/drm/drm_managed.c
> @@ -149,6 +149,20 @@ int __drmm_add_action(struct drm_device *dev,
>  }
>  EXPORT_SYMBOL(__drmm_add_action);
>  
> +int __drmm_add_action_or_reset(struct drm_device *dev,
> +			       drmres_release_t action,
> +			       void *data, const char *name)
> +{
> +	int ret;
> +
> +	ret = __drmm_add_action(dev, action, data, name);
> +	if (ret)
> +		action(dev, data);
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL(__drmm_add_action_or_reset);
> +
>  void *drmm_kmalloc(struct drm_device *dev, size_t size, gfp_t gfp)
>  {
>  	struct drmres *dr;
> diff --git a/include/drm/drm_managed.h b/include/drm/drm_managed.h
> index 89e6fce9f689..2d1e29a2200c 100644
> --- a/include/drm/drm_managed.h
> +++ b/include/drm/drm_managed.h
> @@ -17,7 +17,14 @@ int __must_check __drmm_add_action(struct drm_device *dev,
>  				   drmres_release_t action,
>  				   void *data, const char *name);
>  
> -void drmm_add_final_kfree(struct drm_device *dev, void *parent);
> +#define drmm_add_action_or_reset(dev, action, data) \
> +	__drmm_add_action_or_reset(dev, action, data, #action)
> +
> +int __must_check __drmm_add_action_or_reset(struct drm_device *dev,
> +					    drmres_release_t action,
> +					    void *data, const char *name);
> +
> +void drmm_add_final_kfree(struct drm_device *dev, void *container);
>  
>  void *drmm_kmalloc(struct drm_device *dev, size_t size, gfp_t gfp) __malloc;
>  static inline void *drmm_kzalloc(struct drm_device *dev, size_t size, gfp_t gfp)
> -- 
> 2.25.1
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
