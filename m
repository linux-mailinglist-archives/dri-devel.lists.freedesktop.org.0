Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F114831B47
	for <lists+dri-devel@lfdr.de>; Thu, 18 Jan 2024 15:25:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82B7310E832;
	Thu, 18 Jan 2024 14:24:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1E7410E7EC;
 Thu, 18 Jan 2024 14:24:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705587893; x=1737123893;
 h=message-id:subject:from:to:date:in-reply-to:references:
 content-transfer-encoding:mime-version;
 bh=uG/63xjLCGEhJv+GS8FqGJDmilEizHhjWXRTqPSSRts=;
 b=PCVG3sgMnJd5or95fmgimWSEWpaVTjakiKPKBnmMS7uXY51XH0KPEbkk
 lEWhGA/qqtsHVPI54QD3yynH8PuEwDVEqGUfOKMT1ORjM3h8g1rjio7Gk
 4xEUPPZA+Q6UQeXqQ0ailiTlKqWxhO7q8KND9IU0odN3ollQfqFbyAE4P
 OilY6jgv20xit8fz4FyFm50UFlML2JF5siAWXw0db+2nlGRVoSo2EyAT6
 uPg4S44WTSZeu7iGhH1SAkyyVELN1sI36NfJ/Y8s6UwyPJbhxrtpyL7GN
 FXjoly90+hORfV483Sqy4rV8e9Iupg20V9zld4F5chewiWx4yAAQ9WKwd g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="7152646"
X-IronPort-AV: E=Sophos;i="6.05,203,1701158400"; 
   d="scan'208";a="7152646"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2024 06:24:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,203,1701158400"; 
   d="scan'208";a="367673"
Received: from clanggaa-mobl.ger.corp.intel.com (HELO [10.249.254.203])
 ([10.249.254.203])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2024 06:24:50 -0800
Message-ID: <1b984027fcd36e9a7196834e4727da98391e5caa.camel@linux.intel.com>
Subject: Re: [PATCH 4/5] drm/ttm: improve idle/busy handling v3
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>, 
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 nouveau@lists.freedesktop.org, jani.nikula@linux.intel.com,
 kherbst@redhat.com,  lyude@redhat.com, zackr@vmware.com,
 michel.daenzer@mailbox.org
Date: Thu, 18 Jan 2024 15:24:48 +0100
In-Reply-To: <20240112125158.2748-5-christian.koenig@amd.com>
References: <20240112125158.2748-1-christian.koenig@amd.com>
 <20240112125158.2748-5-christian.koenig@amd.com>
Autocrypt: addr=thomas.hellstrom@linux.intel.com; prefer-encrypt=mutual;
 keydata=mDMEZaWU6xYJKwYBBAHaRw8BAQdAj/We1UBCIrAm9H5t5Z7+elYJowdlhiYE8zUXgxcFz360SFRob21hcyBIZWxsc3Ryw7ZtIChJbnRlbCBMaW51eCBlbWFpbCkgPHRob21hcy5oZWxsc3Ryb21AbGludXguaW50ZWwuY29tPoiTBBMWCgA7FiEEbJFDO8NaBua8diGTuBaTVQrGBr8FAmWllOsCGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgkQuBaTVQrGBr/yQAD/Z1B+Kzy2JTuIy9LsKfC9FJmt1K/4qgaVeZMIKCAxf2UBAJhmZ5jmkDIf6YghfINZlYq6ixyWnOkWMuSLmELwOsgPuDgEZaWU6xIKKwYBBAGXVQEFAQEHQF9v/LNGegctctMWGHvmV/6oKOWWf/vd4MeqoSYTxVBTAwEIB4h4BBgWCgAgFiEEbJFDO8NaBua8diGTuBaTVQrGBr8FAmWllOsCGwwACgkQuBaTVQrGBr/P2QD9Gts6Ee91w3SzOelNjsus/DcCTBb3fRugJoqcfxjKU0gBAKIFVMvVUGbhlEi6EFTZmBZ0QIZEIzOOVfkaIgWelFEH
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.2 (3.50.2-1.fc39) 
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

On Fri, 2024-01-12 at 13:51 +0100, Christian K=C3=B6nig wrote:
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
>=20
> Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> ---
> =C2=A0drivers/gpu/drm/amd/amdgpu/amdgpu_object.c |=C2=A0=C2=A0 2 +-
> =C2=A0drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c=C2=A0=C2=A0=C2=A0 |=C2=A0=
=C2=A0 2 +-
> =C2=A0drivers/gpu/drm/ttm/ttm_bo.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 131 ++++++++-----------
> --
> =C2=A0drivers/gpu/drm/ttm/ttm_resource.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0 16 ++-
> =C2=A0drivers/gpu/drm/xe/xe_bo.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 4 +=
-
> =C2=A0include/drm/ttm/ttm_bo.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=
=C2=A0 3 +-
> =C2=A0include/drm/ttm/ttm_resource.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 3 +-
> =C2=A07 files changed, 68 insertions(+), 93 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> index b671b0665492..06fb3fc47eaa 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> @@ -404,7 +404,7 @@ int amdgpu_bo_create_kernel_at(struct
> amdgpu_device *adev,
> =C2=A0		(*bo_ptr)->placements[i].lpfn =3D (offset + size) >>
> PAGE_SHIFT;
> =C2=A0	}
> =C2=A0	r =3D ttm_bo_mem_space(&(*bo_ptr)->tbo, &(*bo_ptr)->placement,
> -			=C2=A0=C2=A0=C2=A0=C2=A0 &(*bo_ptr)->tbo.resource, &ctx);
> +			=C2=A0=C2=A0=C2=A0=C2=A0 &(*bo_ptr)->tbo.resource, &ctx, false);
> =C2=A0	if (r)
> =C2=A0		goto error;
> =C2=A0
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> index 8722beba494e..f23cdc7c5b08 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> @@ -966,7 +966,7 @@ int amdgpu_ttm_alloc_gart(struct
> ttm_buffer_object *bo)
> =C2=A0	placements.mem_type =3D TTM_PL_TT;
> =C2=A0	placements.flags =3D bo->resource->placement;
> =C2=A0
> -	r =3D ttm_bo_mem_space(bo, &placement, &tmp, &ctx);
> +	r =3D ttm_bo_mem_space(bo, &placement, &tmp, &ctx, true);
> =C2=A0	if (unlikely(r))
> =C2=A0		return r;
> =C2=A0
> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c
> b/drivers/gpu/drm/ttm/ttm_bo.c
> index a5e11a92e0b9..3783be24d832 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
> @@ -414,7 +414,7 @@ static int ttm_bo_bounce_temp_buffer(struct
> ttm_buffer_object *bo,
> =C2=A0	hop_placement.placement =3D hop;
> =C2=A0
> =C2=A0	/* find space in the bounce domain */
> -	ret =3D ttm_bo_mem_space(bo, &hop_placement, &hop_mem, ctx);
> +	ret =3D ttm_bo_mem_space(bo, &hop_placement, &hop_mem, ctx,
> true);
> =C2=A0	if (ret)
> =C2=A0		return ret;
> =C2=A0	/* move to the bounce domain */
> @@ -454,7 +454,7 @@ static int ttm_bo_evict(struct ttm_buffer_object
> *bo,
> =C2=A0		return ttm_bo_pipeline_gutting(bo);
> =C2=A0	}
> =C2=A0
> -	ret =3D ttm_bo_mem_space(bo, &placement, &evict_mem, ctx);
> +	ret =3D ttm_bo_mem_space(bo, &placement, &evict_mem, ctx,
> true);

This is what breaks xe's selftest since the evict-flags preferred
placement is never tried so it changes the behavior.=C2=A0

The xe evict flags were set up to "Try to evict to TT first, but if
that causes recursive eviction, try to evict to system". This here
ignores the preferred eviction placement.

So "Preferred" in effect changes meaning from "Don't try this if it
will cause an eviction", to "Don't try this in the evict path", which
is hard for the driver to have any knowledge about.

Then also it sounds from the commit message with this patch "Preferred"
also gets overloaded with "Always retry preferred on validate", but
shouldn't that really be a dynamic driver decision and not something
TTM should try to enforce in a static way? Drivers could have short-
circuited the ttm_bo_validate() call if it succeeded once, and have a
deeper thought about when to migrate from, say TT to VRAM and vice
versa.

For the specific behaviour sought here, there is (or at least used to
be) a construct in the vmwgfx driver that first called
ttm_bo_validate() with VRAM as preferred placement and no fallback. If
that failed due to VRAM being full, it called ttm_bo_validate() again,
this time with fallback and VRAM allowing eviction.

/Thomas




> =C2=A0	if (ret) {
> =C2=A0		if (ret !=3D -ERESTARTSYS) {
> =C2=A0			pr_err("Failed to find memory space for
> buffer 0x%p eviction\n",
> @@ -724,37 +724,6 @@ static int ttm_bo_add_move_fence(struct
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
> =C2=A0 * ttm_bo_mem_space
> =C2=A0 *
> @@ -763,6 +732,7 @@ static int ttm_bo_mem_force_space(struct
> ttm_buffer_object *bo,
> =C2=A0 * @placement: Proposed new placement for the buffer object.
> =C2=A0 * @mem: A struct ttm_resource.
> =C2=A0 * @ctx: if and how to sleep, lock buffers and alloc memory
> + * @force_space: If we should evict buffers to force space
> =C2=A0 *
> =C2=A0 * Allocate memory space for the buffer object pointed to by @bo,
> using
> =C2=A0 * the placement flags in @placement, potentially evicting other
> idle buffer objects.
> @@ -776,12 +746,14 @@ static int ttm_bo_mem_force_space(struct
> ttm_buffer_object *bo,
> =C2=A0int ttm_bo_mem_space(struct ttm_buffer_object *bo,
> =C2=A0			struct ttm_placement *placement,
> =C2=A0			struct ttm_resource **mem,
> -			struct ttm_operation_ctx *ctx)
> +			struct ttm_operation_ctx *ctx,
> +			bool force_space)
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
> @@ -790,19 +762,30 @@ int ttm_bo_mem_space(struct ttm_buffer_object
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
> +			ret =3D ttm_resource_alloc(bo, place, mem);
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
> =C2=A0		ret =3D ttm_bo_add_move_fence(bo, man, *mem, ctx-
> >no_wait_gpu);
> =C2=A0		if (unlikely(ret)) {
> @@ -810,45 +793,19 @@ int ttm_bo_mem_space(struct ttm_buffer_object
> *bo,
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
> =C2=A0EXPORT_SYMBOL(ttm_bo_mem_space);
> =C2=A0
> =C2=A0static int ttm_bo_move_buffer(struct ttm_buffer_object *bo,
> =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct ttm_placement *placement,
> -			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct ttm_operation_ctx *ctx)
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct ttm_operation_ctx *ctx,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bool force_space)
> =C2=A0{
> =C2=A0	struct ttm_resource *mem;
> =C2=A0	struct ttm_place hop;
> @@ -865,7 +822,7 @@ static int ttm_bo_move_buffer(struct
> ttm_buffer_object *bo,
> =C2=A0	 * stop and the driver will be called to make
> =C2=A0	 * the second hop.
> =C2=A0	 */
> -	ret =3D ttm_bo_mem_space(bo, placement, &mem, ctx);
> +	ret =3D ttm_bo_mem_space(bo, placement, &mem, ctx,
> force_space);
> =C2=A0	if (ret)
> =C2=A0		return ret;
> =C2=A0bounce:
> @@ -902,6 +859,7 @@ int ttm_bo_validate(struct ttm_buffer_object *bo,
> =C2=A0		=C2=A0=C2=A0=C2=A0 struct ttm_placement *placement,
> =C2=A0		=C2=A0=C2=A0=C2=A0 struct ttm_operation_ctx *ctx)
> =C2=A0{
> +	bool force_space;
> =C2=A0	int ret;
> =C2=A0
> =C2=A0	dma_resv_assert_held(bo->base.resv);
> @@ -912,20 +870,27 @@ int ttm_bo_validate(struct ttm_buffer_object
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
> +
> +		/* Moving of pinned BOs is forbidden */
> +		if (bo->pin_count)
> +			return -EINVAL;
> =C2=A0
> -	/* Moving of pinned BOs is forbidden */
> -	if (bo->pin_count)
> -		return -EINVAL;
> +		ret =3D ttm_bo_move_buffer(bo, placement, ctx,
> force_space);
> +		if (ret && ret !=3D -ENOSPC)
> +			return ret;
> =C2=A0
> -	ret =3D ttm_bo_move_buffer(bo, placement, ctx);
> +		force_space =3D !force_space;
> +	} while (force_space);
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
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index 1e5edc7f0b85..d4b8bd774ada 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -828,7 +828,7 @@ int xe_bo_evict_pinned(struct xe_bo *bo)
> =C2=A0	if (WARN_ON(!xe_bo_is_vram(bo)))
> =C2=A0		return -EINVAL;
> =C2=A0
> -	ret =3D ttm_bo_mem_space(&bo->ttm, &placement, &new_mem,
> &ctx);
> +	ret =3D ttm_bo_mem_space(&bo->ttm, &placement, &new_mem, &ctx,
> false);
> =C2=A0	if (ret)
> =C2=A0		return ret;
> =C2=A0
> @@ -893,7 +893,7 @@ int xe_bo_restore_pinned(struct xe_bo *bo)
> =C2=A0	if (WARN_ON(xe_bo_is_vram(bo) || !bo->ttm.ttm))
> =C2=A0		return -EINVAL;
> =C2=A0
> -	ret =3D ttm_bo_mem_space(&bo->ttm, &bo->placement, &new_mem,
> &ctx);
> +	ret =3D ttm_bo_mem_space(&bo->ttm, &bo->placement, &new_mem,
> &ctx, false);
> =C2=A0	if (ret)
> =C2=A0		return ret;
> =C2=A0
> diff --git a/include/drm/ttm/ttm_bo.h b/include/drm/ttm/ttm_bo.h
> index 0223a41a64b2..64d738f152d1 100644
> --- a/include/drm/ttm/ttm_bo.h
> +++ b/include/drm/ttm/ttm_bo.h
> @@ -397,7 +397,8 @@ vm_fault_t ttm_bo_vm_dummy_page(struct vm_fault
> *vmf, pgprot_t prot);
> =C2=A0int ttm_bo_mem_space(struct ttm_buffer_object *bo,
> =C2=A0		=C2=A0=C2=A0=C2=A0=C2=A0 struct ttm_placement *placement,
> =C2=A0		=C2=A0=C2=A0=C2=A0=C2=A0 struct ttm_resource **mem,
> -		=C2=A0=C2=A0=C2=A0=C2=A0 struct ttm_operation_ctx *ctx);
> +		=C2=A0=C2=A0=C2=A0=C2=A0 struct ttm_operation_ctx *ctx,
> +		=C2=A0=C2=A0=C2=A0=C2=A0 bool force_space);
> =C2=A0
> =C2=A0void ttm_bo_unmap_virtual(struct ttm_buffer_object *bo);
> =C2=A0/*
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

