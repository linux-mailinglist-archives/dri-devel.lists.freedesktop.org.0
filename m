Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 53B5F164765
	for <lists+dri-devel@lfdr.de>; Wed, 19 Feb 2020 15:47:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 235C96EC14;
	Wed, 19 Feb 2020 14:47:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A06E76EC14;
 Wed, 19 Feb 2020 14:47:31 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1BC0B2F9;
 Wed, 19 Feb 2020 15:47:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1582123650;
 bh=eqexCJDLlnsAwkC1kGAH9CP2qRlZIuaQ5DtnMSCDxjg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=kr0vW0BE9nJMICt8kFpE/CDPd8NXTwaxI6I4dGq9ngZEf8DBu4Gl3qErdbTqA/RQw
 Oh2Xlkw5ka7pJRjsu6IY4RQdFaEU+rGppR0QdvQqnXLgAx7T/azn1XRMGlSxw/vIuu
 mj6xH4Z3F8s0tM/8TEJEFDTAcc0BnE3VaDUZAb7o=
Date: Wed, 19 Feb 2020 16:47:11 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH 23/52] drm: manage drm_minor cleanup with drmm_
Message-ID: <20200219144711.GO5070@pendragon.ideasonboard.com>
References: <20200219102122.1607365-1-daniel.vetter@ffwll.ch>
 <20200219102122.1607365-24-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200219102122.1607365-24-daniel.vetter@ffwll.ch>
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

On Wed, Feb 19, 2020 at 11:20:53AM +0100, Daniel Vetter wrote:
> The cleanup here is somewhat tricky, since we can't tell apart the
> allocated minor index from 0. So register a cleanup action first, and
> if the index allocation fails, unregister that cleanup action again to
> avoid bad mistakes.
> 
> The kdev for the minor already handles NULL, so no problem there.
> 
> Hence add drmm_remove_action() to the drm_managed library.
> 
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> ---
>  drivers/gpu/drm/drm_drv.c     | 74 +++++++++++++----------------------
>  drivers/gpu/drm/drm_managed.c | 28 +++++++++++++
>  include/drm/drm_managed.h     |  4 ++
>  3 files changed, 59 insertions(+), 47 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
> index 1f7ab88d9435..03a1fb377830 100644
> --- a/drivers/gpu/drm/drm_drv.c
> +++ b/drivers/gpu/drm/drm_drv.c
> @@ -93,19 +93,35 @@ static struct drm_minor **drm_minor_get_slot(struct drm_device *dev,
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
>  	minor->type = type;
>  	minor->dev = dev;
>  
> +	r = drmm_add_action(dev, drm_minor_alloc_release, minor);
> +	if (r)
> +		return r;
> +
>  	idr_preload(GFP_KERNEL);
>  	spin_lock_irqsave(&drm_minor_lock, flags);
>  	r = idr_alloc(&drm_minors_idr,
> @@ -116,47 +132,18 @@ static int drm_minor_alloc(struct drm_device *dev, unsigned int type)
>  	spin_unlock_irqrestore(&drm_minor_lock, flags);
>  	idr_preload_end();
>  
> -	if (r < 0)
> -		goto err_free;
> +	if (r < 0) {
> +		drmm_remove_action(dev, drm_minor_alloc_release, minor);
> +		return r;
> +	}
>  
>  	minor->index = r;
> -
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

The need to do the drmm_remove_action() dance, with the need for
drmm_remove_action() in the first place, just to remove those three
lines of manual cleanup really seems overkill to me. Automation is nice,
but not everything is a nail even if all you have is a hammer.

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
>  }
>  
>  static int drm_minor_register(struct drm_device *dev, unsigned int type)
> @@ -678,16 +665,16 @@ int drm_dev_init(struct drm_device *dev,
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
> @@ -695,7 +682,7 @@ int drm_dev_init(struct drm_device *dev,
>  		ret = drm_gem_init(dev);
>  		if (ret) {
>  			DRM_ERROR("Cannot initialize graphics execution manager (GEM)\n");
> -			goto err_ctxbitmap;
> +			goto err;
>  		}
>  	}
>  
> @@ -708,10 +695,6 @@ int drm_dev_init(struct drm_device *dev,
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
> @@ -776,9 +759,6 @@ void drm_dev_fini(struct drm_device *dev)
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
> index d8a484e19830..fb44fe65c2cd 100644
> --- a/drivers/gpu/drm/drm_managed.c
> +++ b/drivers/gpu/drm/drm_managed.c
> @@ -132,6 +132,34 @@ int __drmm_add_action(struct drm_device *dev,
>  }
>  EXPORT_SYMBOL(__drmm_add_action);
>  
> +void drmm_remove_action(struct drm_device *dev,
> +			drmres_release_t action,
> +			void *data)
> +{
> +	struct drmres *dr = NULL, *tmp;
> +	unsigned long flags;
> +
> +	if (!data)
> +		return;
> +
> +	spin_lock_irqsave(&dev->managed.lock, flags);
> +	list_for_each_entry(tmp, &dev->managed.resources, node.entry) {
> +		if (tmp->node.release == action &&
> +		    * (void **) tmp->data == data) {

As before, &tmp->data, and let's rename tmp.

> +			dr = tmp;
> +			del_dr(dev, dr);
> +			break;
> +		}
> +	}
> +	spin_unlock_irqrestore(&dev->managed.lock, flags);
> +
> +	if (WARN_ON(!dr))
> +		return;
> +
> +	kfree(dr);
> +}
> +EXPORT_SYMBOL(drmm_remove_action);
> +
>  void *drmm_kmalloc(struct drm_device *dev, size_t size, gfp_t gfp)
>  {
>  	struct drmres *dr;
> diff --git a/include/drm/drm_managed.h b/include/drm/drm_managed.h
> index 240edd395e88..df30f9355902 100644
> --- a/include/drm/drm_managed.h
> +++ b/include/drm/drm_managed.h
> @@ -14,6 +14,10 @@ int __must_check __drmm_add_action(struct drm_device *dev,
>  				   drmres_release_t action,
>  				   void *data, const char *name);
>  
> +void drmm_remove_action(struct drm_device *dev,
> +			drmres_release_t action,
> +			void *data);
> +
>  void drmm_add_final_kfree(struct drm_device *dev, void *parent);
>  
>  void *drmm_kmalloc(struct drm_device *dev, size_t size, gfp_t gfp) __malloc;

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
