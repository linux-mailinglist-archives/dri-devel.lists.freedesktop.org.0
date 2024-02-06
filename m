Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B725F84B59A
	for <lists+dri-devel@lfdr.de>; Tue,  6 Feb 2024 13:54:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40CB0112B99;
	Tue,  6 Feb 2024 12:54:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NIs9hRff";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBDD0112B96;
 Tue,  6 Feb 2024 12:54:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707224046; x=1738760046;
 h=message-id:subject:from:to:date:in-reply-to:references:
 content-transfer-encoding:mime-version;
 bh=26ldJlYjgN8PCWLNzlfpmgnnnKCn8TNeTQH2HSYmM3Y=;
 b=NIs9hRffhlAHl9ISJzUZJ54WlrNKTxr/noQQOyRAK8ZdIVmzZHtPuXfy
 f8RCwmuP3RCsrg9Db1Xus0EuXvW8XWH5DMNxckO01mMXOjwLGF7Cqnlz+
 N8GAnycJ7aCvgbwBiv6wNXNCRfTvwFzXIougnOGyxptT4dIZT2mbTsSGW
 GYnmpRtW8hLVZ6tWITFPCpDaxa3CM3xzfC+7ATsA8klM9bQYX8SW15mtx
 tPe+spT0zVqh3rQdAPinMbQ8JOdRmP+UWRY0pHzl5aY2OpDuXX4aAF6bS
 wohFAYXSJC0sGzyyGlNkWfh8pAMg50HA+3G8e8t6u4FnvehNbxVY16KSI g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10975"; a="4550496"
X-IronPort-AV: E=Sophos;i="6.05,247,1701158400"; 
   d="scan'208";a="4550496"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2024 04:54:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,247,1701158400"; 
   d="scan'208";a="1294272"
Received: from mstribae-mobl.ger.corp.intel.com (HELO [10.249.254.52])
 ([10.249.254.52])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2024 04:54:02 -0800
Message-ID: <ce167d0a18781733eeb4974b92ff5038a5241a70.camel@linux.intel.com>
Subject: Re: [PATCH 1/2] drm/ttm: improve idle/busy handling v4
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>, 
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 nouveau@lists.freedesktop.org
Date: Tue, 06 Feb 2024 13:53:59 +0100
In-Reply-To: <20240126140916.1577-2-christian.koenig@amd.com>
References: <20240126140916.1577-1-christian.koenig@amd.com>
 <20240126140916.1577-2-christian.koenig@amd.com>
Autocrypt: addr=thomas.hellstrom@linux.intel.com; prefer-encrypt=mutual;
 keydata=mDMEZaWU6xYJKwYBBAHaRw8BAQdAj/We1UBCIrAm9H5t5Z7+elYJowdlhiYE8zUXgxcFz360SFRob21hcyBIZWxsc3Ryw7ZtIChJbnRlbCBMaW51eCBlbWFpbCkgPHRob21hcy5oZWxsc3Ryb21AbGludXguaW50ZWwuY29tPoiTBBMWCgA7FiEEbJFDO8NaBua8diGTuBaTVQrGBr8FAmWllOsCGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgkQuBaTVQrGBr/yQAD/Z1B+Kzy2JTuIy9LsKfC9FJmt1K/4qgaVeZMIKCAxf2UBAJhmZ5jmkDIf6YghfINZlYq6ixyWnOkWMuSLmELwOsgPuDgEZaWU6xIKKwYBBAGXVQEFAQEHQF9v/LNGegctctMWGHvmV/6oKOWWf/vd4MeqoSYTxVBTAwEIB4h4BBgWCgAgFiEEbJFDO8NaBua8diGTuBaTVQrGBr8FAmWllOsCGwwACgkQuBaTVQrGBr/P2QD9Gts6Ee91w3SzOelNjsus/DcCTBb3fRugJoqcfxjKU0gBAKIFVMvVUGbhlEi6EFTZmBZ0QIZEIzOOVfkaIgWelFEH
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.3 (3.50.3-1.fc39) 
MIME-Version: 1.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Christian,

On Fri, 2024-01-26 at 15:09 +0100, Christian K=C3=B6nig wrote:
> Previously we would never try to move a BO into the preferred
> placements
> when it ever landed in a busy placement since those were considered
> compatible.
>=20
> Rework the whole handling and finally unify the idle and busy
> handling.
> ttm_bo_validate() is now responsible to try idle placement first and
> then
> use the busy placement if that didn't worked.
>=20
> Drawback is that we now always try the idle placement first for each
> validation which might cause some additional CPU overhead on
> overcommit.
>=20
> v2: fix kerneldoc warning and coding style
> v3: take care of XE as well
> v4: keep the ttm_bo_mem_space functionality as it is for now, only
> add
> =C2=A0=C2=A0=C2=A0 new handling for ttm_bo_validate as suggested by Thoma=
s
>=20
> Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> Reviewed-by: Zack Rusin <zack.rusin@broadcom.com> v3

Sending this through xe CI, will try to review asap.

/Thomas


> ---
> =C2=A0drivers/gpu/drm/ttm/ttm_bo.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | =
231 +++++++++++++--------------
> --
> =C2=A0drivers/gpu/drm/ttm/ttm_resource.c |=C2=A0 16 +-
> =C2=A0include/drm/ttm/ttm_resource.h=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=
=A0 3 +-
> =C2=A03 files changed, 121 insertions(+), 129 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c
> b/drivers/gpu/drm/ttm/ttm_bo.c
> index ba3f09e2d7e6..b12f435542a9 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
> @@ -724,64 +724,36 @@ static int ttm_bo_add_move_fence(struct
> ttm_buffer_object *bo,
> =C2=A0	return ret;
> =C2=A0}
> =C2=A0
> -/*
> - * Repeatedly evict memory from the LRU for @mem_type until we
> create enough
> - * space, or we've evicted everything and there isn't enough space.
> - */
> -static int ttm_bo_mem_force_space(struct ttm_buffer_object *bo,
> -				=C2=A0 const struct ttm_place *place,
> -				=C2=A0 struct ttm_resource **mem,
> -				=C2=A0 struct ttm_operation_ctx *ctx)
> -{
> -	struct ttm_device *bdev =3D bo->bdev;
> -	struct ttm_resource_manager *man;
> -	struct ww_acquire_ctx *ticket;
> -	int ret;
> -
> -	man =3D ttm_manager_type(bdev, place->mem_type);
> -	ticket =3D dma_resv_locking_ctx(bo->base.resv);
> -	do {
> -		ret =3D ttm_resource_alloc(bo, place, mem);
> -		if (likely(!ret))
> -			break;
> -		if (unlikely(ret !=3D -ENOSPC))
> -			return ret;
> -		ret =3D ttm_mem_evict_first(bdev, man, place, ctx,
> -					=C2=A0 ticket);
> -		if (unlikely(ret !=3D 0))
> -			return ret;
> -	} while (1);
> -
> -	return ttm_bo_add_move_fence(bo, man, *mem, ctx-
> >no_wait_gpu);
> -}
> -
> =C2=A0/**
> - * ttm_bo_mem_space
> + * ttm_bo_alloc_resource - Allocate backing store for a BO
> =C2=A0 *
> - * @bo: Pointer to a struct ttm_buffer_object. the data of which
> - * we want to allocate space for.
> - * @placement: Proposed new placement for the buffer object.
> - * @mem: A struct ttm_resource.
> + * @bo: Pointer to a struct ttm_buffer_object of which we want a
> resource for
> + * @placement: Proposed new placement for the buffer object
> =C2=A0 * @ctx: if and how to sleep, lock buffers and alloc memory
> + * @force_space: If we should evict buffers to force space
> + * @res: The resulting struct ttm_resource.
> =C2=A0 *
> - * Allocate memory space for the buffer object pointed to by @bo,
> using
> - * the placement flags in @placement, potentially evicting other
> idle buffer objects.
> - * This function may sleep while waiting for space to become
> available.
> + * Allocates a resource for the buffer object pointed to by @bo,
> using the
> + * placement flags in @placement, potentially evicting other buffer
> objects when
> + * @force_space is true.
> + * This function may sleep while waiting for resources to become
> available.
> =C2=A0 * Returns:
> - * -EBUSY: No space available (only if no_wait =3D=3D 1).
> + * -EBUSY: No space available (only if no_wait =3D=3D true).
> =C2=A0 * -ENOSPC: Could not allocate space for the buffer object, either
> due to
> =C2=A0 * fragmentation or concurrent allocators.
> =C2=A0 * -ERESTARTSYS: An interruptible sleep was interrupted by a signal=
.
> =C2=A0 */
> -int ttm_bo_mem_space(struct ttm_buffer_object *bo,
> -			struct ttm_placement *placement,
> -			struct ttm_resource **mem,
> -			struct ttm_operation_ctx *ctx)
> +static int ttm_bo_alloc_resource(struct ttm_buffer_object *bo,
> +				 struct ttm_placement *placement,
> +				 struct ttm_operation_ctx *ctx,
> +				 bool force_space,
> +				 struct ttm_resource **res)
> =C2=A0{
> =C2=A0	struct ttm_device *bdev =3D bo->bdev;
> -	bool type_found =3D false;
> +	struct ww_acquire_ctx *ticket;
> =C2=A0	int i, ret;
> =C2=A0
> +	ticket =3D dma_resv_locking_ctx(bo->base.resv);
> =C2=A0	ret =3D dma_resv_reserve_fences(bo->base.resv, 1);
> =C2=A0	if (unlikely(ret))
> =C2=A0		return ret;
> @@ -790,98 +762,73 @@ int ttm_bo_mem_space(struct ttm_buffer_object
> *bo,
> =C2=A0		const struct ttm_place *place =3D &placement-
> >placement[i];
> =C2=A0		struct ttm_resource_manager *man;
> =C2=A0
> -		if (place->flags & TTM_PL_FLAG_FALLBACK)
> -			continue;
> -
> =C2=A0		man =3D ttm_manager_type(bdev, place->mem_type);
> =C2=A0		if (!man || !ttm_resource_manager_used(man))
> =C2=A0			continue;
> =C2=A0
> -		type_found =3D true;
> -		ret =3D ttm_resource_alloc(bo, place, mem);
> -		if (ret =3D=3D -ENOSPC)
> +		if (place->flags & (force_space ?
> TTM_PL_FLAG_DESIRED :
> +				=C2=A0=C2=A0=C2=A0 TTM_PL_FLAG_FALLBACK))
> +			continue;
> +
> +		do {
> +			ret =3D ttm_resource_alloc(bo, place, res);
> +			if (unlikely(ret !=3D -ENOSPC))
> +				return ret;
> +			if (likely(!ret) || !force_space)
> +				break;
> +
> +			ret =3D ttm_mem_evict_first(bdev, man, place,
> ctx,
> +						=C2=A0 ticket);
> +			if (unlikely(ret =3D=3D -EBUSY))
> +				break;
> +			if (unlikely(ret))
> +				return ret;
> +		} while (1);
> +		if (ret)
> =C2=A0			continue;
> -		if (unlikely(ret))
> -			goto error;
> =C2=A0
> -		ret =3D ttm_bo_add_move_fence(bo, man, *mem, ctx-
> >no_wait_gpu);
> +		ret =3D ttm_bo_add_move_fence(bo, man, *res, ctx-
> >no_wait_gpu);
> =C2=A0		if (unlikely(ret)) {
> -			ttm_resource_free(bo, mem);
> +			ttm_resource_free(bo, res);
> =C2=A0			if (ret =3D=3D -EBUSY)
> =C2=A0				continue;
> =C2=A0
> -			goto error;
> +			return ret;
> =C2=A0		}
> =C2=A0		return 0;
> =C2=A0	}
> =C2=A0
> -	for (i =3D 0; i < placement->num_placement; ++i) {
> -		const struct ttm_place *place =3D &placement-
> >placement[i];
> -		struct ttm_resource_manager *man;
> -
> -		if (place->flags & TTM_PL_FLAG_DESIRED)
> -			continue;
> -
> -		man =3D ttm_manager_type(bdev, place->mem_type);
> -		if (!man || !ttm_resource_manager_used(man))
> -			continue;
> -
> -		type_found =3D true;
> -		ret =3D ttm_bo_mem_force_space(bo, place, mem, ctx);
> -		if (likely(!ret))
> -			return 0;
> -
> -		if (ret && ret !=3D -EBUSY)
> -			goto error;
> -	}
> -
> -	ret =3D -ENOSPC;
> -	if (!type_found) {
> -		pr_err(TTM_PFX "No compatible memory type found\n");
> -		ret =3D -EINVAL;
> -	}
> -
> -error:
> -	return ret;
> +	return -ENOSPC;
> =C2=A0}
> -EXPORT_SYMBOL(ttm_bo_mem_space);
> =C2=A0
> -static int ttm_bo_move_buffer(struct ttm_buffer_object *bo,
> -			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct ttm_placement *placement,
> -			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct ttm_operation_ctx *ctx)
> +/*
> + * ttm_bo_mem_space - Wrapper around ttm_bo_alloc_resource
> + *
> + * @bo: Pointer to a struct ttm_buffer_object of which we want a
> resource for
> + * @placement: Proposed new placement for the buffer object
> + * @res: The resulting struct ttm_resource.
> + * @ctx: if and how to sleep, lock buffers and alloc memory
> + *
> + * Tries both idle allocation and forcefully eviction of buffers.
> See
> + * ttm_bo_alloc_resource for details.
> + */
> +int ttm_bo_mem_space(struct ttm_buffer_object *bo,
> +		=C2=A0=C2=A0=C2=A0=C2=A0 struct ttm_placement *placement,
> +		=C2=A0=C2=A0=C2=A0=C2=A0 struct ttm_resource **res,
> +		=C2=A0=C2=A0=C2=A0=C2=A0 struct ttm_operation_ctx *ctx)
> =C2=A0{
> -	struct ttm_resource *mem;
> -	struct ttm_place hop;
> +	bool force_space =3D false;
> =C2=A0	int ret;
> =C2=A0
> -	dma_resv_assert_held(bo->base.resv);
> +	do {
> +		ret =3D ttm_bo_alloc_resource(bo, placement, ctx,
> +					=C2=A0=C2=A0=C2=A0 force_space, res);
> +		force_space =3D !force_space;
> +	} while (ret =3D=3D -ENOSPC && force_space);
> =C2=A0
> -	/*
> -	 * Determine where to move the buffer.
> -	 *
> -	 * If driver determines move is going to need
> -	 * an extra step then it will return -EMULTIHOP
> -	 * and the buffer will be moved to the temporary
> -	 * stop and the driver will be called to make
> -	 * the second hop.
> -	 */
> -	ret =3D ttm_bo_mem_space(bo, placement, &mem, ctx);
> -	if (ret)
> -		return ret;
> -bounce:
> -	ret =3D ttm_bo_handle_move_mem(bo, mem, false, ctx, &hop);
> -	if (ret =3D=3D -EMULTIHOP) {
> -		ret =3D ttm_bo_bounce_temp_buffer(bo, &mem, ctx,
> &hop);
> -		if (ret)
> -			goto out;
> -		/* try and move to final place now. */
> -		goto bounce;
> -	}
> -out:
> -	if (ret)
> -		ttm_resource_free(bo, &mem);
> =C2=A0	return ret;
> =C2=A0}
> +EXPORT_SYMBOL(ttm_bo_mem_space);
> =C2=A0
> =C2=A0/**
> =C2=A0 * ttm_bo_validate
> @@ -902,6 +849,9 @@ int ttm_bo_validate(struct ttm_buffer_object *bo,
> =C2=A0		=C2=A0=C2=A0=C2=A0 struct ttm_placement *placement,
> =C2=A0		=C2=A0=C2=A0=C2=A0 struct ttm_operation_ctx *ctx)
> =C2=A0{
> +	struct ttm_resource *res;
> +	struct ttm_place hop;
> +	bool force_space;
> =C2=A0	int ret;
> =C2=A0
> =C2=A0	dma_resv_assert_held(bo->base.resv);
> @@ -912,20 +862,53 @@ int ttm_bo_validate(struct ttm_buffer_object
> *bo,
> =C2=A0	if (!placement->num_placement)
> =C2=A0		return ttm_bo_pipeline_gutting(bo);
> =C2=A0
> -	/* Check whether we need to move buffer. */
> -	if (bo->resource && ttm_resource_compatible(bo->resource,
> placement))
> -		return 0;
> +	force_space =3D false;
> +	do {
> +		/* Check whether we need to move buffer. */
> +		if (bo->resource &&
> +		=C2=A0=C2=A0=C2=A0 ttm_resource_compatible(bo->resource, placement,
> +					=C2=A0=C2=A0=C2=A0 force_space))
> +			return 0;
> =C2=A0
> -	/* Moving of pinned BOs is forbidden */
> -	if (bo->pin_count)
> -		return -EINVAL;
> +		/* Moving of pinned BOs is forbidden */
> +		if (bo->pin_count)
> +			return -EINVAL;
> +
> +		/*
> +		 * Determine where to move the buffer.
> +		 *
> +		 * If driver determines move is going to need
> +		 * an extra step then it will return -EMULTIHOP
> +		 * and the buffer will be moved to the temporary
> +		 * stop and the driver will be called to make
> +		 * the second hop.
> +		 */
> +		ret =3D ttm_bo_alloc_resource(bo, placement, ctx,
> force_space,
> +					=C2=A0=C2=A0=C2=A0 &res);
> +		force_space =3D !force_space;
> +		if (ret =3D=3D -ENOSPC)
> +			continue;
> +		if (ret)
> +			return ret;
> +
> +bounce:
> +		ret =3D ttm_bo_handle_move_mem(bo, res, false, ctx,
> &hop);
> +		if (ret =3D=3D -EMULTIHOP) {
> +			ret =3D ttm_bo_bounce_temp_buffer(bo, &res,
> ctx, &hop);
> +			/* try and move to final place now. */
> +			if (!ret)
> +				goto bounce;
> +		}
> +		if (ret) {
> +			ttm_resource_free(bo, &res);
> +			return ret;
> +		}
> +
> +	} while (ret && force_space);
> =C2=A0
> -	ret =3D ttm_bo_move_buffer(bo, placement, ctx);
> =C2=A0	/* For backward compatibility with userspace */
> =C2=A0	if (ret =3D=3D -ENOSPC)
> =C2=A0		return -ENOMEM;
> -	if (ret)
> -		return ret;
> =C2=A0
> =C2=A0	/*
> =C2=A0	 * We might need to add a TTM.
> diff --git a/drivers/gpu/drm/ttm/ttm_resource.c
> b/drivers/gpu/drm/ttm/ttm_resource.c
> index fb14f7716cf8..65155f2013ca 100644
> --- a/drivers/gpu/drm/ttm/ttm_resource.c
> +++ b/drivers/gpu/drm/ttm/ttm_resource.c
> @@ -295,11 +295,13 @@ bool ttm_resource_intersects(struct ttm_device
> *bdev,
> =C2=A0 *
> =C2=A0 * @res: the resource to check
> =C2=A0 * @placement: the placement to check against
> + * @evicting: true if the caller is doing evictions
> =C2=A0 *
> =C2=A0 * Returns true if the placement is compatible.
> =C2=A0 */
> =C2=A0bool ttm_resource_compatible(struct ttm_resource *res,
> -			=C2=A0=C2=A0=C2=A0=C2=A0 struct ttm_placement *placement)
> +			=C2=A0=C2=A0=C2=A0=C2=A0 struct ttm_placement *placement,
> +			=C2=A0=C2=A0=C2=A0=C2=A0 bool evicting)
> =C2=A0{
> =C2=A0	struct ttm_buffer_object *bo =3D res->bo;
> =C2=A0	struct ttm_device *bdev =3D bo->bdev;
> @@ -315,14 +317,20 @@ bool ttm_resource_compatible(struct
> ttm_resource *res,
> =C2=A0		if (res->mem_type !=3D place->mem_type)
> =C2=A0			continue;
> =C2=A0
> +		if (place->flags & (evicting ? TTM_PL_FLAG_DESIRED :
> +				=C2=A0=C2=A0=C2=A0 TTM_PL_FLAG_FALLBACK))
> +			continue;
> +
> +		if (place->flags & TTM_PL_FLAG_CONTIGUOUS &&
> +		=C2=A0=C2=A0=C2=A0 !(res->placement & TTM_PL_FLAG_CONTIGUOUS))
> +			continue;
> +
> =C2=A0		man =3D ttm_manager_type(bdev, res->mem_type);
> =C2=A0		if (man->func->compatible &&
> =C2=A0		=C2=A0=C2=A0=C2=A0 !man->func->compatible(man, res, place, bo-
> >base.size))
> =C2=A0			continue;
> =C2=A0
> -		if ((!(place->flags & TTM_PL_FLAG_CONTIGUOUS) ||
> -		=C2=A0=C2=A0=C2=A0=C2=A0 (res->placement & TTM_PL_FLAG_CONTIGUOUS)))
> -			return true;
> +		return true;
> =C2=A0	}
> =C2=A0	return false;
> =C2=A0}
> diff --git a/include/drm/ttm/ttm_resource.h
> b/include/drm/ttm/ttm_resource.h
> index 1afa13f0c22b..7561023db43d 100644
> --- a/include/drm/ttm/ttm_resource.h
> +++ b/include/drm/ttm/ttm_resource.h
> @@ -366,7 +366,8 @@ bool ttm_resource_intersects(struct ttm_device
> *bdev,
> =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0 const struct ttm_place *place,
> =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0 size_t size);
> =C2=A0bool ttm_resource_compatible(struct ttm_resource *res,
> -			=C2=A0=C2=A0=C2=A0=C2=A0 struct ttm_placement *placement);
> +			=C2=A0=C2=A0=C2=A0=C2=A0 struct ttm_placement *placement,
> +			=C2=A0=C2=A0=C2=A0=C2=A0 bool evicting);
> =C2=A0void ttm_resource_set_bo(struct ttm_resource *res,
> =C2=A0			 struct ttm_buffer_object *bo);
> =C2=A0

