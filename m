Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D3C0C3481DD
	for <lists+dri-devel@lfdr.de>; Wed, 24 Mar 2021 20:29:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DFD76EA80;
	Wed, 24 Mar 2021 19:29:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CDBF6EA7F
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Mar 2021 19:29:26 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 a132-20020a1c668a0000b029010f141fe7c2so1870733wmc.0
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Mar 2021 12:29:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to; bh=GnJ8nkSwkXHwiL432McDivoNP7hmDTX0LH/iM/iaIQ8=;
 b=S+3wdak6TotUcrkgQqyFDXj+9nPgZne1rkRg7a4Y9dkvnhxVgrdlBXAdSdfnkwAE3P
 ng9kXbEJdxnHupb9a02wytdZH1AkF1q64RtpVrSOKH8dsgwI0c21aE2FqPng6rPgCLWL
 fbu7wugZm+R4YW0Is9LHyRkgvbWEY3fwwkfdA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to;
 bh=GnJ8nkSwkXHwiL432McDivoNP7hmDTX0LH/iM/iaIQ8=;
 b=iVM7QHKCguiqnaNh1BQ+gzHXyhkWOcC1WswGXlIPcQJkNGzXrsFCnJZyv0WYVpOUsW
 BwqiiiwmmxH01YHeh/kiAt14OtoGBJdhGwJuyUPW/K5lUrIimh1RH/AE+1fgGMpgBvx8
 H2oKhncvjsv+1I6jbOYAUmvG9RN3ys0gb3FtDa8nMIMvuDtJn7yiqEvMaqYqdlH9iccQ
 CoHsmCgFyDObVvg7cMr5a4Ri0ikWUS2yffPKZ5hdZt9QWsYrvRVOHeTOeHPLJgiys8Xp
 4LgtTFGno9M98yNn/s505vSCfcPyQjDlNxK18sqaiKsHOBpqut8NJTX8Fsw3X5ufyIqQ
 5xYA==
X-Gm-Message-State: AOAM530XLw8xiPRT1DUhmvQIDV64i+XH1QeQpxRUivdXlKzkcRPG778K
 zPXZ7qZlbSNjmGDkm57hrkTcdg==
X-Google-Smtp-Source: ABdhPJy0q9VbtM5J5QIc8n4RplJqQPYP9aivogC44QvHxiE+3iZJSLO9qVBhcd2y10Q3oYgyNqtRdg==
X-Received: by 2002:a05:600c:4f94:: with SMTP id
 n20mr4393432wmq.18.1616614165048; 
 Wed, 24 Mar 2021 12:29:25 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id b17sm4414260wrt.17.2021.03.24.12.29.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Mar 2021 12:29:24 -0700 (PDT)
Date: Wed, 24 Mar 2021 20:29:22 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [PATCH] drm/ttm: switch back to static allocation limits for now
Message-ID: <YFuTEl/R73Fvet/y@phenom.ffwll.local>
Mail-Followup-To: Christian =?iso-8859-1?Q?K=F6nig?=
 <ckoenig.leichtzumerken@gmail.com>, 
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 Liang.Liang@amd.com, thomas_os@shipmail.org
References: <20210324134845.2338-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210324134845.2338-1-christian.koenig@amd.com>
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
Cc: linux-mm@kvack.org, thomas_os@shipmail.org, Liang.Liang@amd.com,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Mar 24, 2021 at 02:48:45PM +0100, Christian K=F6nig wrote:
> The shrinker based approach still has some flaws. Especially that we need
> temporary pages to free up the pages allocated to the driver is problemat=
ic
> in a shrinker.
> =

> Signed-off-by: Christian K=F6nig <christian.koenig@amd.com>
> ---
>  drivers/gpu/drm/ttm/ttm_device.c |  14 ++--
>  drivers/gpu/drm/ttm/ttm_tt.c     | 112 ++++++++++++-------------------
>  include/drm/ttm/ttm_tt.h         |   3 +-
>  3 files changed, 53 insertions(+), 76 deletions(-)
> =

> diff --git a/drivers/gpu/drm/ttm/ttm_device.c b/drivers/gpu/drm/ttm/ttm_d=
evice.c
> index 95e1b7b1f2e6..388da2a7f0bb 100644
> --- a/drivers/gpu/drm/ttm/ttm_device.c
> +++ b/drivers/gpu/drm/ttm/ttm_device.c
> @@ -53,7 +53,6 @@ static void ttm_global_release(void)
>  		goto out;
>  =

>  	ttm_pool_mgr_fini();
> -	ttm_tt_mgr_fini();
>  =

>  	__free_page(glob->dummy_read_page);
>  	memset(glob, 0, sizeof(*glob));
> @@ -64,7 +63,7 @@ static void ttm_global_release(void)
>  static int ttm_global_init(void)
>  {
>  	struct ttm_global *glob =3D &ttm_glob;
> -	unsigned long num_pages;
> +	unsigned long num_pages, num_dma32;
>  	struct sysinfo si;
>  	int ret =3D 0;
>  	unsigned i;
> @@ -79,8 +78,15 @@ static int ttm_global_init(void)
>  	 * system memory.
>  	 */
>  	num_pages =3D ((u64)si.totalram * si.mem_unit) >> PAGE_SHIFT;
> -	ttm_pool_mgr_init(num_pages * 50 / 100);
> -	ttm_tt_mgr_init();
> +	num_pages /=3D 2;
> +
> +	/* But for DMA32 we limit ourself to only use 2GiB maximum. */
> +	num_dma32 =3D (u64)(si.totalram - si.totalhigh) * si.mem_unit
> +		>> PAGE_SHIFT;
> +	num_dma32 =3D min(num_dma32, 2UL << (30 - PAGE_SHIFT));
> +
> +	ttm_pool_mgr_init(num_pages);
> +	ttm_tt_mgr_init(num_pages, num_dma32);
>  =

>  	spin_lock_init(&glob->lru_lock);
>  	glob->dummy_read_page =3D alloc_page(__GFP_ZERO | GFP_DMA32);
> diff --git a/drivers/gpu/drm/ttm/ttm_tt.c b/drivers/gpu/drm/ttm/ttm_tt.c
> index 2f0833c98d2c..5d8820725b75 100644
> --- a/drivers/gpu/drm/ttm/ttm_tt.c
> +++ b/drivers/gpu/drm/ttm/ttm_tt.c
> @@ -40,8 +40,18 @@
>  =

>  #include "ttm_module.h"
>  =

> -static struct shrinker mm_shrinker;
> -static atomic_long_t swapable_pages;
> +static unsigned long ttm_pages_limit;
> +
> +MODULE_PARM_DESC(pages_limit, "Limit for the allocated pages");
> +module_param_named(pages_limit, ttm_pages_limit, ulong, 0644);
> +
> +static unsigned long ttm_dma32_pages_limit;
> +
> +MODULE_PARM_DESC(dma32_pages_limit, "Limit for the allocated DMA32 pages=
");
> +module_param_named(dma32_pages_limit, ttm_dma32_pages_limit, ulong, 0644=
);
> +
> +static atomic_long_t ttm_pages_allocated;
> +static atomic_long_t ttm_dma32_pages_allocated;

Making this configurable looks an awful lot like "job done, move on". Just
the revert to hardcoded 50% (or I guess just revert the shrinker patch at
that point) for -fixes is imo better.

Then I guess retry again for 5.14 or so.
-Daniel

>  =

>  /*
>   * Allocates a ttm structure for the given BO.
> @@ -294,8 +304,6 @@ static void ttm_tt_add_mapping(struct ttm_device *bde=
v, struct ttm_tt *ttm)
>  =

>  	for (i =3D 0; i < ttm->num_pages; ++i)
>  		ttm->pages[i]->mapping =3D bdev->dev_mapping;
> -
> -	atomic_long_add(ttm->num_pages, &swapable_pages);
>  }
>  =

>  int ttm_tt_populate(struct ttm_device *bdev,
> @@ -309,12 +317,25 @@ int ttm_tt_populate(struct ttm_device *bdev,
>  	if (ttm_tt_is_populated(ttm))
>  		return 0;
>  =

> +	atomic_long_add(ttm->num_pages, &ttm_pages_allocated);
> +	if (bdev->pool.use_dma32)
> +		atomic_long_add(ttm->num_pages, &ttm_dma32_pages_allocated);
> +
> +	while (atomic_long_read(&ttm_pages_allocated) > ttm_pages_limit ||
> +	       atomic_long_read(&ttm_dma32_pages_allocated) >
> +	       ttm_dma32_pages_limit) {
> +
> +		ret =3D ttm_bo_swapout(ctx, GFP_KERNEL);
> +		if (ret)
> +			goto error;
> +	}
> +
>  	if (bdev->funcs->ttm_tt_populate)
>  		ret =3D bdev->funcs->ttm_tt_populate(bdev, ttm, ctx);
>  	else
>  		ret =3D ttm_pool_alloc(&bdev->pool, ttm, ctx);
>  	if (ret)
> -		return ret;
> +		goto error;
>  =

>  	ttm_tt_add_mapping(bdev, ttm);
>  	ttm->page_flags |=3D TTM_PAGE_FLAG_PRIV_POPULATED;
> @@ -327,6 +348,12 @@ int ttm_tt_populate(struct ttm_device *bdev,
>  	}
>  =

>  	return 0;
> +
> +error:
> +	atomic_long_sub(ttm->num_pages, &ttm_pages_allocated);
> +	if (bdev->pool.use_dma32)
> +		atomic_long_sub(ttm->num_pages, &ttm_dma32_pages_allocated);
> +	return ret;
>  }
>  EXPORT_SYMBOL(ttm_tt_populate);
>  =

> @@ -342,12 +369,9 @@ static void ttm_tt_clear_mapping(struct ttm_tt *ttm)
>  		(*page)->mapping =3D NULL;
>  		(*page++)->index =3D 0;
>  	}
> -
> -	atomic_long_sub(ttm->num_pages, &swapable_pages);
>  }
>  =

> -void ttm_tt_unpopulate(struct ttm_device *bdev,
> -		       struct ttm_tt *ttm)
> +void ttm_tt_unpopulate(struct ttm_device *bdev, struct ttm_tt *ttm)
>  {
>  	if (!ttm_tt_is_populated(ttm))
>  		return;
> @@ -357,76 +381,24 @@ void ttm_tt_unpopulate(struct ttm_device *bdev,
>  		bdev->funcs->ttm_tt_unpopulate(bdev, ttm);
>  	else
>  		ttm_pool_free(&bdev->pool, ttm);
> -	ttm->page_flags &=3D ~TTM_PAGE_FLAG_PRIV_POPULATED;
> -}
> -
> -/* As long as pages are available make sure to release at least one */
> -static unsigned long ttm_tt_shrinker_scan(struct shrinker *shrink,
> -					  struct shrink_control *sc)
> -{
> -	struct ttm_operation_ctx ctx =3D {
> -		.no_wait_gpu =3D false
> -	};
> -	int ret;
> -
> -	ret =3D ttm_bo_swapout(&ctx, GFP_NOFS);
> -	return ret < 0 ? SHRINK_EMPTY : ret;
> -}
> -
> -/* Return the number of pages available or SHRINK_EMPTY if we have none =
*/
> -static unsigned long ttm_tt_shrinker_count(struct shrinker *shrink,
> -					   struct shrink_control *sc)
> -{
> -	unsigned long num_pages;
> -
> -	num_pages =3D atomic_long_read(&swapable_pages);
> -	return num_pages ? num_pages : SHRINK_EMPTY;
> -}
>  =

> -#ifdef CONFIG_DEBUG_FS
> +	atomic_long_sub(ttm->num_pages, &ttm_pages_allocated);
> +	if (bdev->pool.use_dma32)
> +		atomic_long_sub(ttm->num_pages, &ttm_dma32_pages_allocated);
>  =

> -/* Test the shrinker functions and dump the result */
> -static int ttm_tt_debugfs_shrink_show(struct seq_file *m, void *data)
> -{
> -	struct shrink_control sc =3D { .gfp_mask =3D GFP_KERNEL };
> -
> -	fs_reclaim_acquire(GFP_KERNEL);
> -	seq_printf(m, "%lu/%lu\n", ttm_tt_shrinker_count(&mm_shrinker, &sc),
> -		   ttm_tt_shrinker_scan(&mm_shrinker, &sc));
> -	fs_reclaim_release(GFP_KERNEL);
> -
> -	return 0;
> +	ttm->page_flags &=3D ~TTM_PAGE_FLAG_PRIV_POPULATED;
>  }
> -DEFINE_SHOW_ATTRIBUTE(ttm_tt_debugfs_shrink);
> -
> -#endif
> -
> -
>  =

>  /**
>   * ttm_tt_mgr_init - register with the MM shrinker
>   *
>   * Register with the MM shrinker for swapping out BOs.
>   */
> -int ttm_tt_mgr_init(void)
> +void ttm_tt_mgr_init(unsigned long num_pages, unsigned long num_dma32_pa=
ges)
>  {
> -#ifdef CONFIG_DEBUG_FS
> -	debugfs_create_file("tt_shrink", 0400, ttm_debugfs_root, NULL,
> -			    &ttm_tt_debugfs_shrink_fops);
> -#endif
> -
> -	mm_shrinker.count_objects =3D ttm_tt_shrinker_count;
> -	mm_shrinker.scan_objects =3D ttm_tt_shrinker_scan;
> -	mm_shrinker.seeks =3D 1;
> -	return register_shrinker(&mm_shrinker);
> -}
> +	if (!ttm_pages_limit)
> +		ttm_pages_limit =3D num_pages;
>  =

> -/**
> - * ttm_tt_mgr_fini - unregister our MM shrinker
> - *
> - * Unregisters the MM shrinker.
> - */
> -void ttm_tt_mgr_fini(void)
> -{
> -	unregister_shrinker(&mm_shrinker);
> +	if (!ttm_dma32_pages_limit)
> +		ttm_dma32_pages_limit =3D num_dma32_pages;
>  }
> diff --git a/include/drm/ttm/ttm_tt.h b/include/drm/ttm/ttm_tt.h
> index 069f8130241a..134d09ef7766 100644
> --- a/include/drm/ttm/ttm_tt.h
> +++ b/include/drm/ttm/ttm_tt.h
> @@ -157,8 +157,7 @@ int ttm_tt_populate(struct ttm_device *bdev, struct t=
tm_tt *ttm, struct ttm_oper
>   */
>  void ttm_tt_unpopulate(struct ttm_device *bdev, struct ttm_tt *ttm);
>  =

> -int ttm_tt_mgr_init(void);
> -void ttm_tt_mgr_fini(void);
> +void ttm_tt_mgr_init(unsigned long num_pages, unsigned long num_dma32_pa=
ges);
>  =

>  #if IS_ENABLED(CONFIG_AGP)
>  #include <linux/agp_backend.h>
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
