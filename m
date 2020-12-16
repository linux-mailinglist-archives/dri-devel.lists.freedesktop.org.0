Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 335AC2DC2C4
	for <lists+dri-devel@lfdr.de>; Wed, 16 Dec 2020 16:09:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E5EF897EE;
	Wed, 16 Dec 2020 15:09:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F9B5897EE
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Dec 2020 15:09:53 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id n16so2128732wmc.0
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Dec 2020 07:09:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=oNtmiM7bZyGlupg7ZZGBN40tOdQ6hlYS2DWE4QJw8iE=;
 b=Z+WhKR6HUaJ6mOPq3QcWBniJM4ZT4v+O0OJ4BIYfuExn88e/L2fsKa9p+jY9N12LxL
 SmyFcRStuEiZuVOTaZdeZ6/mfI9OoEB/DpkD7n3LEXlLoXCF0uv6enmAPqjRkzQElY4O
 Om1WSktgBzPEdeooiEmDVWCYKIuYyHiLWzrzw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=oNtmiM7bZyGlupg7ZZGBN40tOdQ6hlYS2DWE4QJw8iE=;
 b=W5Gi//cP0fk65rQE02EbhtIPpiY+/Idtmh0Dt2WYdOnl4SdpoF3guUr6A1ThJ+k4af
 ZIyqLMfQN0XLAdDaAaultkyg/XYSmXo6wF+ZPRASvLnskyXqLOTfo7F8dHixziRTQrQY
 20E0zIEcifW8sSxs5v5sUrlP6QFHkm3+2Kj1T4LHqtPT3skc+Ofdu3AM7Zj+5MlroefJ
 YkSB6l8QXDzpn2vhr0mfroUFWhhmnQYPojo2qTukfFsBTuh1bptZYj5hR0LrVUGL79k4
 Ut0NL2d4hP+nZfEQhDgKDu7GSB5XR9omAw1xyUpyrxPQTDq8FxIa4jxpaqClQqb6ONtT
 lVIA==
X-Gm-Message-State: AOAM533Z6A1HhGPbiWi+VfusM+Jm/Dk17zsIcrAePdIHE9HUca8Hz8eb
 nvfyK1ouSPkLDmym/WzIqVGMWA==
X-Google-Smtp-Source: ABdhPJxJ3ZgGRX7uEtcTePyiyOISoXDzxcexk0q2gZ/c+r9rvGzs7/2FKzLe61IARP4ZMtdY7m9nYg==
X-Received: by 2002:a1c:4e17:: with SMTP id g23mr3837004wmh.101.1608131391795; 
 Wed, 16 Dec 2020 07:09:51 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id x18sm4100279wrg.55.2020.12.16.07.09.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Dec 2020 07:09:50 -0800 (PST)
Date: Wed, 16 Dec 2020 16:09:48 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [PATCH 1/2] drm/ttm: rework ttm_tt page limit v2
Message-ID: <X9ojPDJv1ybEJT0k@phenom.ffwll.local>
References: <20201216140427.1253-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201216140427.1253-1-christian.koenig@amd.com>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
Cc: airlied@linux.ie, sroland@vmware.com, dri-devel@lists.freedesktop.org,
 ray.huang@amd.com, linux-graphics-maintainer@vmware.com
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Dec 16, 2020 at 03:04:26PM +0100, Christian K=F6nig wrote:
> TTM implements a rather extensive accounting of allocated memory.
> =

> There are two reasons for this:
> 1. It tries to block userspace allocating a huge number of very small
>    BOs without accounting for the kmalloced memory.
> =

> 2. Make sure we don't over allocate and run into an OOM situation
>    during swapout while trying to handle the memory shortage.
> =

> This is only partially a good idea. First of all it is perfectly
> valid for an application to use all of system memory, limiting it to
> 50% is not really acceptable.
> =

> What we need to take care of is that the application is held
> accountable for the memory it allocated. This is what control
> mechanisms like memcg and the normal Linux page accounting already do.
> =

> Making sure that we don't run into an OOM situation while trying to
> cope with a memory shortage is still a good idea, but this is also
> not very well implemented since it means another opportunity of
> recursion from the driver back into TTM.
> =

> So start to rework all of this by implementing a shrinker callback which
> allows for TT object to be swapped out if necessary.
> =

> v2: Switch from limit to shrinker callback.
> =

> Signed-off-by: Christian K=F6nig <christian.koenig@amd.com>
> ---
>  drivers/gpu/drm/ttm/ttm_bo.c        |  4 +-
>  drivers/gpu/drm/ttm/ttm_memory.c    |  7 ++-
>  drivers/gpu/drm/ttm/ttm_tt.c        | 82 +++++++++++++++++++++++++++--
>  drivers/gpu/drm/vmwgfx/vmwgfx_drv.c |  2 +-
>  include/drm/ttm/ttm_bo_api.h        |  2 +-
>  include/drm/ttm/ttm_tt.h            |  6 ++-
>  6 files changed, 91 insertions(+), 12 deletions(-)
> =

> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
> index 31e8b3da5563..f1f3fd085465 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
> @@ -1412,7 +1412,7 @@ EXPORT_SYMBOL(ttm_bo_wait);
>   * A buffer object shrink method that tries to swap out the first
>   * buffer object on the bo_global::swap_lru list.
>   */
> -int ttm_bo_swapout(struct ttm_operation_ctx *ctx)
> +int ttm_bo_swapout(struct ttm_operation_ctx *ctx, gfp_t gfp_flags)
>  {
>  	struct ttm_bo_global *glob =3D &ttm_bo_glob;
>  	struct ttm_buffer_object *bo;
> @@ -1495,7 +1495,7 @@ int ttm_bo_swapout(struct ttm_operation_ctx *ctx)
>  	if (bo->bdev->driver->swap_notify)
>  		bo->bdev->driver->swap_notify(bo);
>  =

> -	ret =3D ttm_tt_swapout(bo->bdev, bo->ttm);
> +	ret =3D ttm_tt_swapout(bo->bdev, bo->ttm, gfp_flags);
>  out:
>  =

>  	/**
> diff --git a/drivers/gpu/drm/ttm/ttm_memory.c b/drivers/gpu/drm/ttm/ttm_m=
emory.c
> index a3bfbd9cea68..3d2479d0ce2c 100644
> --- a/drivers/gpu/drm/ttm/ttm_memory.c
> +++ b/drivers/gpu/drm/ttm/ttm_memory.c
> @@ -37,6 +37,7 @@
>  #include <linux/slab.h>
>  #include <linux/swap.h>
>  #include <drm/ttm/ttm_pool.h>
> +#include <drm/ttm/ttm_tt.h>
>  =

>  #include "ttm_module.h"
>  =

> @@ -276,9 +277,9 @@ static void ttm_shrink(struct ttm_mem_global *glob, b=
ool from_wq,
>  =

>  	while (ttm_zones_above_swap_target(glob, from_wq, extra)) {
>  		spin_unlock(&glob->lock);
> -		ret =3D ttm_bo_swapout(ctx);
> +		ret =3D ttm_bo_swapout(ctx, 0);

General we don't treat gfp_mask as a set of additional flags, but the full
thing. So here we should have GFP_KERNEL.

Also having both the shrinker and the ttm_shrink_work is a bit much, the
shrink work should get deleted completely I think.

>  		spin_lock(&glob->lock);
> -		if (unlikely(ret !=3D 0))
> +		if (unlikely(ret < 0))
>  			break;
>  	}
>  =

> @@ -453,6 +454,7 @@ int ttm_mem_global_init(struct ttm_mem_global *glob)
>  			zone->name, (unsigned long long)zone->max_mem >> 10);
>  	}
>  	ttm_pool_mgr_init(glob->zone_kernel->max_mem/(2*PAGE_SIZE));
> +	ttm_tt_mgr_init();
>  	return 0;
>  out_no_zone:
>  	ttm_mem_global_release(glob);
> @@ -466,6 +468,7 @@ void ttm_mem_global_release(struct ttm_mem_global *gl=
ob)
>  =

>  	/* let the page allocator first stop the shrink work. */
>  	ttm_pool_mgr_fini();
> +	ttm_tt_mgr_fini();
>  =

>  	flush_workqueue(glob->swap_queue);
>  	destroy_workqueue(glob->swap_queue);
> diff --git a/drivers/gpu/drm/ttm/ttm_tt.c b/drivers/gpu/drm/ttm/ttm_tt.c
> index 7f75a13163f0..d454c428c56a 100644
> --- a/drivers/gpu/drm/ttm/ttm_tt.c
> +++ b/drivers/gpu/drm/ttm/ttm_tt.c
> @@ -38,6 +38,8 @@
>  #include <drm/drm_cache.h>
>  #include <drm/ttm/ttm_bo_driver.h>
>  =

> +static struct shrinker mm_shrinker;
> +
>  /*
>   * Allocates a ttm structure for the given BO.
>   */
> @@ -223,13 +225,23 @@ int ttm_tt_swapin(struct ttm_tt *ttm)
>  	return ret;
>  }
>  =

> -int ttm_tt_swapout(struct ttm_bo_device *bdev, struct ttm_tt *ttm)
> +/**
> + * ttm_tt_swapout - swap out tt object
> + *
> + * @bdev: TTM device structure.
> + * @ttm: The struct ttm_tt.
> + * @gfp_flags: Flags to use for memory allocation.
> + *
> + * Swapout a TT object to a shmem_file, return number of pages swapped o=
ut or
> + * negative error code.
> + */
> +int ttm_tt_swapout(struct ttm_bo_device *bdev, struct ttm_tt *ttm,
> +		   gfp_t gfp_flags)
>  {
>  	struct address_space *swap_space;
>  	struct file *swap_storage;
>  	struct page *from_page;
>  	struct page *to_page;
> -	gfp_t gfp_mask;
>  	int i, ret;
>  =

>  	swap_storage =3D shmem_file_setup("ttm swap",
> @@ -241,14 +253,14 @@ int ttm_tt_swapout(struct ttm_bo_device *bdev, stru=
ct ttm_tt *ttm)
>  	}
>  =

>  	swap_space =3D swap_storage->f_mapping;
> -	gfp_mask =3D mapping_gfp_mask(swap_space);
> +	gfp_flags |=3D mapping_gfp_mask(swap_space);

I don't think this combines flags correctly. mapping_gfp_mask is most
likely GFP_KERNEL or something like that, so __GFP_FS (the thing you want
to check for to avoid recursion) is always set.

I think we need an & here, and maybe screaming if the gfp flags for the
swapout space are funny.

>  =

>  	for (i =3D 0; i < ttm->num_pages; ++i) {
>  		from_page =3D ttm->pages[i];
>  		if (unlikely(from_page =3D=3D NULL))
>  			continue;
>  =

> -		to_page =3D shmem_read_mapping_page_gfp(swap_space, i, gfp_mask);
> +		to_page =3D shmem_read_mapping_page_gfp(swap_space, i, gfp_flags);
>  		if (IS_ERR(to_page)) {
>  			ret =3D PTR_ERR(to_page);
>  			goto out_err;
> @@ -263,7 +275,7 @@ int ttm_tt_swapout(struct ttm_bo_device *bdev, struct=
 ttm_tt *ttm)
>  	ttm->swap_storage =3D swap_storage;
>  	ttm->page_flags |=3D TTM_PAGE_FLAG_SWAPPED;
>  =

> -	return 0;
> +	return ttm->num_pages;
>  =

>  out_err:
>  	fput(swap_storage);
> @@ -341,3 +353,63 @@ void ttm_tt_unpopulate(struct ttm_bo_device *bdev,
>  		ttm_pool_free(&bdev->pool, ttm);
>  	ttm->page_flags &=3D ~TTM_PAGE_FLAG_PRIV_POPULATED;
>  }
> +
> +/* As long as pages are available make sure to release at least one */
> +static unsigned long ttm_tt_shrinker_scan(struct shrinker *shrink,
> +					  struct shrink_control *sc)
> +{
> +	struct ttm_operation_ctx ctx =3D {
> +		.no_wait_gpu =3D true

Iirc there's an eventual shrinker limit where it gets desperate. I think
once we hit that, we should allow gpu waits. But it's not passed to
shrinkers for reasons, so maybe we should have a second round that tries
to more actively shrink objects if we fell substantially short of what
reclaim expected us to do?

Also don't we have a trylock_only flag here to make sure drivers don't do
something stupid?

> +	};
> +	int ret;
> +
> +	if (sc->gfp_mask & GFP_NOFS)
> +		return 0;
> +
> +	ret =3D ttm_bo_swapout(&ctx, GFP_NOFS);
> +	return ret < 0 ? SHRINK_EMPTY : ret;
> +}
> +
> +/* Return the number of pages available or SHRINK_EMPTY if we have none =
*/
> +static unsigned long ttm_tt_shrinker_count(struct shrinker *shrink,
> +					   struct shrink_control *sc)
> +{
> +	struct ttm_buffer_object *bo;
> +	unsigned long num_pages =3D 0;
> +	unsigned int i;
> +
> +	if (sc->gfp_mask & GFP_NOFS)
> +		return 0;

The count function should always count, and I'm not seeing a reason why
you couldn't do that here ... Also my understanding is that GFP_NOFS never
goes into shrinkers (the NOFS comes from shrinkers originally only being
used for filesystem objects), so this is double redundant.

My understanding is that gfp_mask is just to convey the right zones and
stuff, so that your shrinker can try to shrink objects in the right zones.
Hence I think the check in the _scan() function should also be removed.

Also the non __ prefixed flags are the combinations callers are supposed
to look at. Memory reclaim code needs to look at the __GFP flags, see e.g. =

gfpflags_allow_blocking() or fs_reclaim_acquire().

> +
> +	/* TODO: Is that to much overhead? */
> +	spin_lock(&ttm_bo_glob.lru_lock);
> +	for (i =3D 0; i < TTM_MAX_BO_PRIORITY; ++i)
> +		list_for_each_entry(bo, &ttm_bo_glob.swap_lru[i], swap)
> +			num_pages +=3D bo->ttm->num_pages;
> +	spin_unlock(&ttm_bo_glob.lru_lock);
> +
> +	return num_pages ? num_pages : SHRINK_EMPTY;
> +}
> +
> +/**
> + * ttm_tt_mgr_init - register with the MM shrinker
> + *
> + * Register with the MM shrinker for swapping out BOs.
> + */
> +int ttm_tt_mgr_init(void)
> +{
> +	mm_shrinker.count_objects =3D ttm_tt_shrinker_count;
> +	mm_shrinker.scan_objects =3D ttm_tt_shrinker_scan;
> +	mm_shrinker.seeks =3D 1;
> +	return register_shrinker(&mm_shrinker);
> +}
> +
> +/**
> + * ttm_tt_mgr_fini - unregister our MM shrinker
> + *
> + * Unregisters the MM shrinker.
> + */
> +void ttm_tt_mgr_fini(void)
> +{
> +	unregister_shrinker(&mm_shrinker);
> +}
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c b/drivers/gpu/drm/vmwgfx=
/vmwgfx_drv.c
> index 0008be02d31c..e141fa9f616d 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
> @@ -1389,7 +1389,7 @@ static int vmw_pm_freeze(struct device *kdev)
>  	vmw_execbuf_release_pinned_bo(dev_priv);
>  	vmw_resource_evict_all(dev_priv);
>  	vmw_release_device_early(dev_priv);
> -	while (ttm_bo_swapout(&ctx) =3D=3D 0);
> +	while (ttm_bo_swapout(&ctx, 0) > 0);

I think again GFP_KERNEL.

>  	if (dev_priv->enable_fb)
>  		vmw_fifo_resource_dec(dev_priv);
>  	if (atomic_read(&dev_priv->num_fifo_resources) !=3D 0) {
> diff --git a/include/drm/ttm/ttm_bo_api.h b/include/drm/ttm/ttm_bo_api.h
> index e17be324d95f..7c7539d76e1d 100644
> --- a/include/drm/ttm/ttm_bo_api.h
> +++ b/include/drm/ttm/ttm_bo_api.h
> @@ -569,7 +569,7 @@ ssize_t ttm_bo_io(struct ttm_bo_device *bdev, struct =
file *filp,
>  		  const char __user *wbuf, char __user *rbuf,
>  		  size_t count, loff_t *f_pos, bool write);
>  =

> -int ttm_bo_swapout(struct ttm_operation_ctx *ctx);
> +int ttm_bo_swapout(struct ttm_operation_ctx *ctx, gfp_t gfp_flags);
>  =

>  /**
>   * ttm_bo_uses_embedded_gem_object - check if the given bo uses the
> diff --git a/include/drm/ttm/ttm_tt.h b/include/drm/ttm/ttm_tt.h
> index 6c8eb9a4de81..4bc3a08644fc 100644
> --- a/include/drm/ttm/ttm_tt.h
> +++ b/include/drm/ttm/ttm_tt.h
> @@ -135,7 +135,8 @@ void ttm_tt_destroy_common(struct ttm_bo_device *bdev=
, struct ttm_tt *ttm);
>   * Swap in a previously swap out ttm_tt.
>   */
>  int ttm_tt_swapin(struct ttm_tt *ttm);
> -int ttm_tt_swapout(struct ttm_bo_device *bdev, struct ttm_tt *ttm);
> +int ttm_tt_swapout(struct ttm_bo_device *bdev, struct ttm_tt *ttm,
> +		   gfp_t gfp_flags);
>  =

>  /**
>   * ttm_tt_populate - allocate pages for a ttm
> @@ -155,6 +156,9 @@ int ttm_tt_populate(struct ttm_bo_device *bdev, struc=
t ttm_tt *ttm, struct ttm_o
>   */
>  void ttm_tt_unpopulate(struct ttm_bo_device *bdev, struct ttm_tt *ttm);
>  =

> +int ttm_tt_mgr_init(void);
> +void ttm_tt_mgr_fini(void);
> +
>  #if IS_ENABLED(CONFIG_AGP)
>  #include <linux/agp_backend.h>

For testing I strongly recommend a debugfs file to trigger this shrinker
completely, from the right lockdep context (i.e. using
fs_reclaim_acquire/release()). Much easier to test that way. See
i915_drop_caches_set() in i915_debugfs.c.

That way you can fully test it all without hitting anything remotely
resembling actual OOM, which tends to kill all kinds of things.

Aside from the detail work I think this is going in the right direction.
-Daniel
-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
