Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 18B8330D893
	for <lists+dri-devel@lfdr.de>; Wed,  3 Feb 2021 12:26:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80EA76EA6B;
	Wed,  3 Feb 2021 11:26:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E82626EA6B
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Feb 2021 11:26:20 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id j11so4299414wmi.3
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Feb 2021 03:26:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=vnQhJfIGMXTbz4IQaHx8/jc0pDG8pGGIXguaFmYEnVU=;
 b=I9uBF8Y+S7Og0Cz/i6xTB0WG/noIjrjk43Fc3yAFDvuvTfKfgA3qbixCxfPLRiyQMV
 zJ2stFPGA9nKbaLGSzOQmCnNUTrudSu7l8H0GyKfBlCvH3qQNTRLEL/oMZ4XzBYYFNXp
 DwSpWDQm6Uyjk63Kqj9eCNf8zsjU1CyIMfwDs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=vnQhJfIGMXTbz4IQaHx8/jc0pDG8pGGIXguaFmYEnVU=;
 b=Z3ZwhDf8ScKB3QypK1ApyvDKoa70i6Tx8XN9NUkP5ybk0ChswLyAAqyEm+7yYZulbx
 nJd3fPxGttw3G/zbhy/bt9gd+gvysNZlrz61xR/gvCGeCpjSfu29DPJwU/VJ7gZEIvWY
 HVrVr5xz7S4n87XnZ2zhdsVtbqNCsknd+hOHAmmybHWDa12QMBbmJQbg4gono/ABJvd9
 h7eZPu16nFnXSzQhpf4/oXFxuVcWyGcSRWS/h9XEcb0S6avX2Yl3pOu+MaDqcILKOcPb
 KyfHQC0UKF8TpSxatjXTpKMYxPgbvuy6GGU4QHIeYyH4F+9ht09iuXcd7bqcdlZW6+1t
 Yb1A==
X-Gm-Message-State: AOAM531V6wjxoWx4HQBxScSCMMKMXUp735XaTqVFGyuBsPaaVwF62RgH
 T+tEQ/7gizd3w56h2lwaAZvKCg==
X-Google-Smtp-Source: ABdhPJwo0AN82SbtDRnZrsqEAnm9nSkbs+T31uXnzzazA1fA4WJfgLtEIF4SKSbteaGShXDLdgDOzQ==
X-Received: by 2002:a1c:740b:: with SMTP id p11mr2417972wmc.34.1612351579484; 
 Wed, 03 Feb 2021 03:26:19 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id a6sm2359940wmj.27.2021.02.03.03.26.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Feb 2021 03:26:18 -0800 (PST)
Date: Wed, 3 Feb 2021 12:26:16 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [PATCH 1/3] drm/ttm: rework ttm_tt page limit v3
Message-ID: <YBqIWIlPL+QGXz2r@phenom.ffwll.local>
References: <20210128131604.149660-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210128131604.149660-1-christian.koenig@amd.com>
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
Cc: linux-graphics-maintainer@vmware.com, dri-devel@lists.freedesktop.org,
 sroland@vmware.com
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jan 28, 2021 at 02:16:02PM +0100, Christian K=F6nig wrote:
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
> v3: fix gfp mask handling, use atomic for swapable_pages, add debugfs
> =

> Signed-off-by: Christian K=F6nig <christian.koenig@amd.com>
> ---
>  drivers/gpu/drm/ttm/ttm_bo.c        |   4 +-
>  drivers/gpu/drm/ttm/ttm_memory.c    |   7 +-
>  drivers/gpu/drm/ttm/ttm_tt.c        | 111 ++++++++++++++++++++++++++--
>  drivers/gpu/drm/vmwgfx/vmwgfx_drv.c |   2 +-
>  include/drm/ttm/ttm_bo_api.h        |   2 +-
>  include/drm/ttm/ttm_tt.h            |   6 +-
>  6 files changed, 117 insertions(+), 15 deletions(-)
> =

> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
> index 20256797f3a6..643befc1a6f2 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
> @@ -1219,7 +1219,7 @@ EXPORT_SYMBOL(ttm_bo_wait);
>   * A buffer object shrink method that tries to swap out the first
>   * buffer object on the bo_global::swap_lru list.
>   */
> -int ttm_bo_swapout(struct ttm_operation_ctx *ctx)
> +int ttm_bo_swapout(struct ttm_operation_ctx *ctx, gfp_t gfp_flags)
>  {
>  	struct ttm_global *glob =3D &ttm_glob;
>  	struct ttm_buffer_object *bo;
> @@ -1302,7 +1302,7 @@ int ttm_bo_swapout(struct ttm_operation_ctx *ctx)
>  	if (bo->bdev->funcs->swap_notify)
>  		bo->bdev->funcs->swap_notify(bo);
>  =

> -	ret =3D ttm_tt_swapout(bo->bdev, bo->ttm);
> +	ret =3D ttm_tt_swapout(bo->bdev, bo->ttm, gfp_flags);
>  out:
>  =

>  	/**
> diff --git a/drivers/gpu/drm/ttm/ttm_memory.c b/drivers/gpu/drm/ttm/ttm_m=
emory.c
> index a3bfbd9cea68..634a85c2dc4c 100644
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
> +		ret =3D ttm_bo_swapout(ctx, GFP_KERNEL);
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
> index 7782d5393c7c..b67795de228d 100644
> --- a/drivers/gpu/drm/ttm/ttm_tt.c
> +++ b/drivers/gpu/drm/ttm/ttm_tt.c
> @@ -38,6 +38,11 @@
>  #include <drm/drm_cache.h>
>  #include <drm/ttm/ttm_bo_driver.h>
>  =

> +#include "ttm_module.h"
> +
> +static struct shrinker mm_shrinker;
> +static atomic_long_t swapable_pages;
> +
>  /*
>   * Allocates a ttm structure for the given BO.
>   */
> @@ -223,32 +228,41 @@ int ttm_tt_swapin(struct ttm_tt *ttm)
>  	return ret;
>  }
>  =

> -int ttm_tt_swapout(struct ttm_device *bdev, struct ttm_tt *ttm)
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
> +int ttm_tt_swapout(struct ttm_device *bdev, struct ttm_tt *ttm,
> +		   gfp_t gfp_flags)
>  {
> +	loff_t size =3D (loff_t)ttm->num_pages << PAGE_SHIFT;
>  	struct address_space *swap_space;
>  	struct file *swap_storage;
>  	struct page *from_page;
>  	struct page *to_page;
> -	gfp_t gfp_mask;
>  	int i, ret;
>  =

> -	swap_storage =3D shmem_file_setup("ttm swap",
> -					ttm->num_pages << PAGE_SHIFT,
> -					0);
> +	swap_storage =3D shmem_file_setup("ttm swap", size, 0);
>  	if (IS_ERR(swap_storage)) {
>  		pr_err("Failed allocating swap storage\n");
>  		return PTR_ERR(swap_storage);
>  	}
>  =

>  	swap_space =3D swap_storage->f_mapping;
> -	gfp_mask =3D mapping_gfp_mask(swap_space);
> +	gfp_flags &=3D mapping_gfp_mask(swap_space);
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
> @@ -263,7 +277,7 @@ int ttm_tt_swapout(struct ttm_device *bdev, struct tt=
m_tt *ttm)
>  	ttm->swap_storage =3D swap_storage;
>  	ttm->page_flags |=3D TTM_PAGE_FLAG_SWAPPED;
>  =

> -	return 0;
> +	return ttm->num_pages;
>  =

>  out_err:
>  	fput(swap_storage);
> @@ -280,6 +294,8 @@ static void ttm_tt_add_mapping(struct ttm_device *bde=
v, struct ttm_tt *ttm)
>  =

>  	for (i =3D 0; i < ttm->num_pages; ++i)
>  		ttm->pages[i]->mapping =3D bdev->dev_mapping;
> +
> +	atomic_long_add(ttm->num_pages, &swapable_pages);
>  }
>  =

>  int ttm_tt_populate(struct ttm_device *bdev,
> @@ -326,6 +342,8 @@ static void ttm_tt_clear_mapping(struct ttm_tt *ttm)
>  		(*page)->mapping =3D NULL;
>  		(*page++)->index =3D 0;
>  	}
> +
> +	atomic_long_sub(ttm->num_pages, &swapable_pages);
>  }
>  =

>  void ttm_tt_unpopulate(struct ttm_device *bdev,
> @@ -341,3 +359,80 @@ void ttm_tt_unpopulate(struct ttm_device *bdev,
>  		ttm_pool_free(&bdev->pool, ttm);
>  	ttm->page_flags &=3D ~TTM_PAGE_FLAG_PRIV_POPULATED;
>  }
> +
> +/* As long as pages are available make sure to release at least one */
> +static unsigned long ttm_tt_shrinker_scan(struct shrinker *shrink,
> +					  struct shrink_control *sc)
> +{
> +	struct ttm_operation_ctx ctx =3D {
> +		.no_wait_gpu =3D false
> +	};
> +	int ret;
> +
> +	if (!(sc->gfp_mask & __GFP_FS))
> +		return SHRINK_EMPTY;

These two checks here still look like cargo cult to me. I thought the
gfp_mask you're getting is for numa/zone-aware shrinking, which we're not
doing. __GFP_FS in the shrinker is a bug.

Maybe convert to WARN_ON to convince yourself, test, then remove? If you
ever get __GFP_FS context in a shrinker lockdep will start screaming real
fast :-)

With that addressed:

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

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
> +	unsigned long num_pages;
> +
> +	if (!(sc->gfp_mask & __GFP_FS))
> +		return SHRINK_EMPTY;
> +
> +	num_pages =3D atomic_long_read(&swapable_pages);
> +	return num_pages ? num_pages : SHRINK_EMPTY;
> +}
> +
> +#ifdef CONFIG_DEBUG_FS
> +
> +/* Test the shrinker functions and dump the result */
> +static int ttm_tt_debugfs_shrink_show(struct seq_file *m, void *data)
> +{
> +	struct shrink_control sc =3D { .gfp_mask =3D GFP_KERNEL };
> +
> +	fs_reclaim_acquire(GFP_KERNEL);
> +	seq_printf(m, "%lu/%lu\n", ttm_tt_shrinker_count(&mm_shrinker, &sc),
> +		   ttm_tt_shrinker_scan(&mm_shrinker, &sc));
> +	fs_reclaim_release(GFP_KERNEL);
> +
> +	return 0;
> +}
> +DEFINE_SHOW_ATTRIBUTE(ttm_tt_debugfs_shrink);
> +
> +#endif
> +
> +
> +
> +/**
> + * ttm_tt_mgr_init - register with the MM shrinker
> + *
> + * Register with the MM shrinker for swapping out BOs.
> + */
> +int ttm_tt_mgr_init(void)
> +{
> +#ifdef CONFIG_DEBUG_FS
> +	debugfs_create_file("tt_shrink", 0400, ttm_debugfs_root, NULL,
> +			    &ttm_tt_debugfs_shrink_fops);
> +#endif
> +
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
> index b454d80c273e..710ba5169a74 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
> @@ -1383,7 +1383,7 @@ static int vmw_pm_freeze(struct device *kdev)
>  	vmw_execbuf_release_pinned_bo(dev_priv);
>  	vmw_resource_evict_all(dev_priv);
>  	vmw_release_device_early(dev_priv);
> -	while (ttm_bo_swapout(&ctx) =3D=3D 0);
> +	while (ttm_bo_swapout(&ctx, GFP_KERNEL) > 0);
>  	if (dev_priv->enable_fb)
>  		vmw_fifo_resource_dec(dev_priv);
>  	if (atomic_read(&dev_priv->num_fifo_resources) !=3D 0) {
> diff --git a/include/drm/ttm/ttm_bo_api.h b/include/drm/ttm/ttm_bo_api.h
> index 62734db0b421..1297a8fb7ccb 100644
> --- a/include/drm/ttm/ttm_bo_api.h
> +++ b/include/drm/ttm/ttm_bo_api.h
> @@ -569,7 +569,7 @@ ssize_t ttm_bo_io(struct ttm_device *bdev, struct fil=
e *filp,
>  		  const char __user *wbuf, char __user *rbuf,
>  		  size_t count, loff_t *f_pos, bool write);
>  =

> -int ttm_bo_swapout(struct ttm_operation_ctx *ctx);
> +int ttm_bo_swapout(struct ttm_operation_ctx *ctx, gfp_t gfp_flags);
>  =

>  /**
>   * ttm_bo_uses_embedded_gem_object - check if the given bo uses the
> diff --git a/include/drm/ttm/ttm_tt.h b/include/drm/ttm/ttm_tt.h
> index 0020a0588985..cce57fb49e2c 100644
> --- a/include/drm/ttm/ttm_tt.h
> +++ b/include/drm/ttm/ttm_tt.h
> @@ -135,7 +135,8 @@ void ttm_tt_destroy_common(struct ttm_device *bdev, s=
truct ttm_tt *ttm);
>   * Swap in a previously swap out ttm_tt.
>   */
>  int ttm_tt_swapin(struct ttm_tt *ttm);
> -int ttm_tt_swapout(struct ttm_device *bdev, struct ttm_tt *ttm);
> +int ttm_tt_swapout(struct ttm_device *bdev, struct ttm_tt *ttm,
> +		   gfp_t gfp_flags);
>  =

>  /**
>   * ttm_tt_populate - allocate pages for a ttm
> @@ -155,6 +156,9 @@ int ttm_tt_populate(struct ttm_device *bdev, struct t=
tm_tt *ttm, struct ttm_oper
>   */
>  void ttm_tt_unpopulate(struct ttm_device *bdev, struct ttm_tt *ttm);
>  =

> +int ttm_tt_mgr_init(void);
> +void ttm_tt_mgr_fini(void);
> +
>  #if IS_ENABLED(CONFIG_AGP)
>  #include <linux/agp_backend.h>
>  =

> -- =

> 2.25.1
> =


-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
