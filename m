Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EAEF32A2B54
	for <lists+dri-devel@lfdr.de>; Mon,  2 Nov 2020 14:20:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C86906E504;
	Mon,  2 Nov 2020 13:20:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 076A86E504
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Nov 2020 13:20:31 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id g12so14540484wrp.10
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Nov 2020 05:20:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=Q27kP5PRo1ZgTH44y0i/gV0rA1j9PBrwXbk/37xYozg=;
 b=U5tqKyuNFlpW2kXShbi2HO+xFbAK8Cqt/w1KnL2F0fYWMTCtnKpe+h2CN0ZFGUwreH
 2YQHqdPKG4dzr+63sOKoYyUEwNKbXaqLtdHU83vdFhaRrWVEG8eQqijGQ9TMR+xk3Njp
 pnqUpQR87mL84XuFMASZeCKkpCU7QXs7p4ioU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=Q27kP5PRo1ZgTH44y0i/gV0rA1j9PBrwXbk/37xYozg=;
 b=tBxf/msMp34QUzOUWwhlW8okqAzUUz+IulOdKgX8O0e/I5mafy4RMkkn1yLw+UVF1P
 Ym4pD/Rg0QRQV0b9jJYRm7goJa3eLkoMLcMugn198srOX+FyCKBzMWbtMlgK/nnvft7L
 EkEz4ULqITu7NulQRc1RF58UiIF90DwAAQF5iJXpxo3s2h1VIixNyA+yl0Phks9JX41G
 0zUEYAOM50CvFogiFKu1edgO13ABFYZ0z4l8V8GYU4wujqFz+kvT7UR91wPxLnD3+Tra
 L/wU4GPaiGvD3oFmnH1yVUOE7uPxuUrTFOPd31RNM9V+G6zTOL/EGtmnPD5re9W3UaRK
 N1Qg==
X-Gm-Message-State: AOAM5330NXg02bZ5+N17iJfIeTWPgbViKMyDjG+IE4y3DvxXCSJEN3BN
 XtjlzaESBvczHsn4VfNxiNbL7g==
X-Google-Smtp-Source: ABdhPJxke69moamBPMGxbd9Jm8HWEpxO8d3WliB0nLv7CpULnJMO8jQsdsFzLDbUuCR59rlZh2LDuw==
X-Received: by 2002:adf:c101:: with SMTP id r1mr19373514wre.87.1604323229727; 
 Mon, 02 Nov 2020 05:20:29 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id b8sm1500469wmj.9.2020.11.02.05.20.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Nov 2020 05:20:29 -0800 (PST)
Date: Mon, 2 Nov 2020 14:20:27 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [PATCH 1/2] drm/ttm: rework no_retry handling
Message-ID: <20201102132027.GQ401619@phenom.ffwll.local>
References: <20201102125808.75130-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201102125808.75130-1-christian.koenig@amd.com>
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Nov 02, 2020 at 01:58:07PM +0100, Christian K=F6nig wrote:
> During eviction we do want to trigger the OOM killer.
> =

> Only while doing new allocations we should try to avoid that and
> return -ENOMEM to the application.
> =

> Signed-off-by: Christian K=F6nig <christian.koenig@amd.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_object.c | 2 ++
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c    | 3 ---
>  drivers/gpu/drm/ttm/ttm_pool.c             | 2 +-
>  drivers/gpu/drm/ttm/ttm_tt.c               | 7 -------
>  include/drm/ttm/ttm_bo_api.h               | 2 ++
>  include/drm/ttm/ttm_bo_driver.h            | 3 ---
>  6 files changed, 5 insertions(+), 14 deletions(-)
> =

> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/drm=
/amd/amdgpu/amdgpu_object.c
> index 1aa516429c80..52041f48e1c9 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> @@ -516,6 +516,8 @@ static int amdgpu_bo_do_create(struct amdgpu_device *=
adev,
>  	struct ttm_operation_ctx ctx =3D {
>  		.interruptible =3D (bp->type !=3D ttm_bo_type_kernel),
>  		.no_wait_gpu =3D bp->no_wait_gpu,
> +		/* We opt to avoid OOM on system pages allocations */
> +		.retry_mayfail =3D true,

Hm this is a bit confusingly named imo, but it comes from the gfp flags.
So maybe call it gfp_retry_mayfail, to make it clear where it's from and
that it's only for system allocations. Personally I'd have called this
limited_retry, but I think better to stay consistent.

Also I think we should __GFP_NOWARN for this, to avoid splats in dmesg
since we expect to handle this.

With the bikesheds addressed somehow.

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

>  		.resv =3D bp->resv,
>  		.flags =3D bp->type !=3D ttm_bo_type_kernel ?
>  			TTM_OPT_FLAG_ALLOW_RES_EVICT : 0
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/am=
d/amdgpu/amdgpu_ttm.c
> index bd6e6641c3fc..c01c060e4ac5 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> @@ -1914,9 +1914,6 @@ int amdgpu_ttm_init(struct amdgpu_device *adev)
>  	}
>  	adev->mman.initialized =3D true;
>  =

> -	/* We opt to avoid OOM on system pages allocations */
> -	adev->mman.bdev.no_retry =3D true;
> -
>  	/* Initialize VRAM pool with all of VRAM divided into pages */
>  	r =3D amdgpu_vram_mgr_init(adev);
>  	if (r) {
> diff --git a/drivers/gpu/drm/ttm/ttm_pool.c b/drivers/gpu/drm/ttm/ttm_poo=
l.c
> index 1e50deefb5d5..7100fd0e9e88 100644
> --- a/drivers/gpu/drm/ttm/ttm_pool.c
> +++ b/drivers/gpu/drm/ttm/ttm_pool.c
> @@ -367,7 +367,7 @@ int ttm_pool_alloc(struct ttm_pool *pool, struct ttm_=
tt *tt,
>  	if (tt->page_flags & TTM_PAGE_FLAG_ZERO_ALLOC)
>  		gfp_flags |=3D __GFP_ZERO;
>  =

> -	if (tt->page_flags & TTM_PAGE_FLAG_NO_RETRY)
> +	if (ctx->retry_mayfail)
>  		gfp_flags |=3D __GFP_RETRY_MAYFAIL;
>  =

>  	if (pool->use_dma32)
> diff --git a/drivers/gpu/drm/ttm/ttm_tt.c b/drivers/gpu/drm/ttm/ttm_tt.c
> index 8861a74ac335..cfd633c7e764 100644
> --- a/drivers/gpu/drm/ttm/ttm_tt.c
> +++ b/drivers/gpu/drm/ttm/ttm_tt.c
> @@ -51,9 +51,6 @@ int ttm_tt_create(struct ttm_buffer_object *bo, bool ze=
ro_alloc)
>  	if (bo->ttm)
>  		return 0;
>  =

> -	if (bdev->no_retry)
> -		page_flags |=3D TTM_PAGE_FLAG_NO_RETRY;
> -
>  	switch (bo->type) {
>  	case ttm_bo_type_device:
>  		if (zero_alloc)
> @@ -211,8 +208,6 @@ int ttm_tt_swapin(struct ttm_tt *ttm)
>  =

>  	swap_space =3D swap_storage->f_mapping;
>  	gfp_mask =3D mapping_gfp_mask(swap_space);
> -	if (ttm->page_flags & TTM_PAGE_FLAG_NO_RETRY)
> -		gfp_mask |=3D __GFP_RETRY_MAYFAIL;
>  =

>  	for (i =3D 0; i < ttm->num_pages; ++i) {
>  		from_page =3D shmem_read_mapping_page_gfp(swap_space, i,
> @@ -260,8 +255,6 @@ int ttm_tt_swapout(struct ttm_bo_device *bdev, struct=
 ttm_tt *ttm)
>  =

>  	swap_space =3D swap_storage->f_mapping;
>  	gfp_mask =3D mapping_gfp_mask(swap_space);
> -	if (ttm->page_flags & TTM_PAGE_FLAG_NO_RETRY)
> -		gfp_mask |=3D __GFP_RETRY_MAYFAIL;
>  =

>  	for (i =3D 0; i < ttm->num_pages; ++i) {
>  		from_page =3D ttm->pages[i];
> diff --git a/include/drm/ttm/ttm_bo_api.h b/include/drm/ttm/ttm_bo_api.h
> index 37102e45e496..4c7c2d574db6 100644
> --- a/include/drm/ttm/ttm_bo_api.h
> +++ b/include/drm/ttm/ttm_bo_api.h
> @@ -195,6 +195,7 @@ struct ttm_bo_kmap_obj {
>   *
>   * @interruptible: Sleep interruptible if sleeping.
>   * @no_wait_gpu: Return immediately if the GPU is busy.
> + * @retry_mayfail: Set the __GFP_RETRY_MAYFAIL when allocation pages.
>   * @resv: Reservation object to allow reserved evictions with.
>   * @flags: Including the following flags
>   *
> @@ -204,6 +205,7 @@ struct ttm_bo_kmap_obj {
>  struct ttm_operation_ctx {
>  	bool interruptible;
>  	bool no_wait_gpu;
> +	bool retry_mayfail;
>  	struct dma_resv *resv;
>  	uint64_t bytes_moved;
>  	uint32_t flags;
> diff --git a/include/drm/ttm/ttm_bo_driver.h b/include/drm/ttm/ttm_bo_dri=
ver.h
> index e9f683fa72dc..da8208f43378 100644
> --- a/include/drm/ttm/ttm_bo_driver.h
> +++ b/include/drm/ttm/ttm_bo_driver.h
> @@ -276,7 +276,6 @@ extern struct ttm_bo_global {
>   * @dev_mapping: A pointer to the struct address_space representing the
>   * device address space.
>   * @wq: Work queue structure for the delayed delete workqueue.
> - * @no_retry: Don't retry allocation if it fails
>   *
>   */
>  =

> @@ -314,8 +313,6 @@ struct ttm_bo_device {
>  	 */
>  =

>  	struct delayed_work wq;
> -
> -	bool no_retry;
>  };
>  =

>  static inline struct ttm_resource_manager *ttm_manager_type(struct ttm_b=
o_device *bdev,
> -- =

> 2.25.1
> =

> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
