Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E156A90E5C8
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jun 2024 10:36:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDC8510E147;
	Wed, 19 Jun 2024 08:36:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="U1XS1qUH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDB8310E147;
 Wed, 19 Jun 2024 08:36:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718786211; x=1750322211;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=anE/3sn+GpPB4s7jIFcFVEICXelX/Fc75xz5r/MgPx4=;
 b=U1XS1qUHgN7Y9u3e6EbD3PUfbR6twcSOG7O7pb3d8B7nhyEe23wibjRH
 rSEVwcsOfDnBKfvosmzL1DpHW1bVbcpzoemdEkWG9x2Kj658fT7A+FcPb
 HijTl5ANMMftb3VuHKxsdUTK+zVirqOcoz47Uf4kDjtSmCxbahXTZe/ll
 e1XycRJxSP5RtCanlWyp+tPifdc31K9/IvpVO2BdOGV39kcDZ26Pzo5nB
 ZnSbMxweRtJw2WDAkkPRoJc6z1AAAsUQlOoR/Qxle3LWywzag6ievmHk0
 mnIXDwV5QbDaZuF0E+z4DtpnZv0sSfi1QZjZRyRKT8kV03vAnvjOwZ1QS g==;
X-CSE-ConnectionGUID: HX0O3CbaS5OyjtRX2Hrp5w==
X-CSE-MsgGUID: OCgW7rWsTKGEXsYvYVu2ww==
X-IronPort-AV: E=McAfee;i="6700,10204,11107"; a="27116887"
X-IronPort-AV: E=Sophos;i="6.08,249,1712646000"; d="scan'208";a="27116887"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2024 01:36:50 -0700
X-CSE-ConnectionGUID: U7imXg9xSn6Go7/F/s/90A==
X-CSE-MsgGUID: XTj9okNrR72IERd7Z2FXmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,249,1712646000"; d="scan'208";a="42554341"
Received: from oandoniu-mobl3.ger.corp.intel.com (HELO [10.245.245.122])
 ([10.245.245.122])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2024 01:36:48 -0700
Message-ID: <0926e844f86fe52299fdddb2ad5fe41f23faf74d.camel@linux.intel.com>
Subject: Re: [PATCH v5 06/12] drm/ttm: Use the LRU walker helper for swapping
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org, Christian =?ISO-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>, Somalapuram Amaranath
 <Amaranath.Somalapuram@amd.com>, dri-devel@lists.freedesktop.org
Date: Wed, 19 Jun 2024 10:36:45 +0200
In-Reply-To: <ZnJdPV9uIF+HD/B/@DUT025-TGLU.fm.intel.com>
References: <20240618071820.130917-1-thomas.hellstrom@linux.intel.com>
 <20240618071820.130917-7-thomas.hellstrom@linux.intel.com>
 <ZnJdPV9uIF+HD/B/@DUT025-TGLU.fm.intel.com>
Autocrypt: addr=thomas.hellstrom@linux.intel.com; prefer-encrypt=mutual;
 keydata=mDMEZaWU6xYJKwYBBAHaRw8BAQdAj/We1UBCIrAm9H5t5Z7+elYJowdlhiYE8zUXgxcFz360SFRob21hcyBIZWxsc3Ryw7ZtIChJbnRlbCBMaW51eCBlbWFpbCkgPHRob21hcy5oZWxsc3Ryb21AbGludXguaW50ZWwuY29tPoiTBBMWCgA7FiEEbJFDO8NaBua8diGTuBaTVQrGBr8FAmWllOsCGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgkQuBaTVQrGBr/yQAD/Z1B+Kzy2JTuIy9LsKfC9FJmt1K/4qgaVeZMIKCAxf2UBAJhmZ5jmkDIf6YghfINZlYq6ixyWnOkWMuSLmELwOsgPuDgEZaWU6xIKKwYBBAGXVQEFAQEHQF9v/LNGegctctMWGHvmV/6oKOWWf/vd4MeqoSYTxVBTAwEIB4h4BBgWCgAgFiEEbJFDO8NaBua8diGTuBaTVQrGBr8FAmWllOsCGwwACgkQuBaTVQrGBr/P2QD9Gts6Ee91w3SzOelNjsus/DcCTBb3fRugJoqcfxjKU0gBAKIFVMvVUGbhlEi6EFTZmBZ0QIZEIzOOVfkaIgWelFEH
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.4 (3.50.4-1.fc39) 
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

On Wed, 2024-06-19 at 04:23 +0000, Matthew Brost wrote:
> On Tue, Jun 18, 2024 at 09:18:14AM +0200, Thomas Hellstr=C3=B6m wrote:
> > Rework the TTM swapping to use the LRU walker helper.
> > This helps fixing up the ttm_bo_swapout() interface
> > to be consistent about not requiring any locking.
> >=20
> > For now mimic the current behaviour of using trylock
> > only. We could be using ticket-locks here but defer
> > that until it's deemed necessary. The TTM swapout
> > functionality is a bit weird anyway since it
> > alternates between memory types without exhausting
> > TTM_PL_SYSTEM first.
> >=20
> > Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> > Cc: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>
> > Cc: Matthew Brost <matthew.brost@intel.com>
> > Cc: <dri-devel@lists.freedesktop.org>
> > Signed-off-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> > ---
> > =C2=A0drivers/gpu/drm/ttm/ttm_bo.c=C2=A0=C2=A0=C2=A0=C2=A0 | 112 ++++++=
+++++++++++++++------
> > ----
> > =C2=A0drivers/gpu/drm/ttm/ttm_device.c |=C2=A0 30 ++-------
> > =C2=A0include/drm/ttm/ttm_bo.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0=C2=A0 5 +-
> > =C2=A03 files changed, 83 insertions(+), 64 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/ttm/ttm_bo.c
> > b/drivers/gpu/drm/ttm/ttm_bo.c
> > index 43eda720657f..63a91b77f7da 100644
> > --- a/drivers/gpu/drm/ttm/ttm_bo.c
> > +++ b/drivers/gpu/drm/ttm/ttm_bo.c
> > @@ -1118,11 +1118,23 @@ int ttm_bo_wait_ctx(struct
> > ttm_buffer_object *bo, struct ttm_operation_ctx *ctx)
> > =C2=A0}
> > =C2=A0EXPORT_SYMBOL(ttm_bo_wait_ctx);
> > =C2=A0
> > -int ttm_bo_swapout(struct ttm_buffer_object *bo, struct
> > ttm_operation_ctx *ctx,
> > -		=C2=A0=C2=A0 gfp_t gfp_flags)
> > +/**
> > + * struct ttm_bo_swapout_walk - Parameters for the swapout walk
> > + */
> > +struct ttm_bo_swapout_walk {
> > +	/** @walk: The walk base parameters. */
> > +	struct ttm_lru_walk walk;
> > +	/** @gfp_flags: The gfp flags to use for ttm_tt_swapout()
> > */
> > +	gfp_t gfp_flags;
> > +};
> > +
> > +static long
> > +ttm_bo_swapout_cb(struct ttm_lru_walk *walk, struct
> > ttm_buffer_object *bo)
> > =C2=A0{
> > -	struct ttm_place place;
> > -	bool locked;
> > +	struct ttm_place place =3D {.mem_type =3D bo->resource-
> > >mem_type};
> > +	struct ttm_bo_swapout_walk *swapout_walk =3D
> > +		container_of(walk, typeof(*swapout_walk), walk);
> > +	struct ttm_operation_ctx *ctx =3D walk->ctx;
> > =C2=A0	long ret;
> > =C2=A0
> > =C2=A0	/*
> > @@ -1131,28 +1143,29 @@ int ttm_bo_swapout(struct ttm_buffer_object
> > *bo, struct ttm_operation_ctx *ctx,
> > =C2=A0	 * The driver may use the fact that we're moving from
> > SYSTEM
> > =C2=A0	 * as an indication that we're about to swap out.
> > =C2=A0	 */
> > -	memset(&place, 0, sizeof(place));
> > -	place.mem_type =3D bo->resource->mem_type;
> > -	if (!ttm_bo_evict_swapout_allowable(bo, ctx, &place,
> > &locked, NULL))
> > -		return -EBUSY;
> > +	if (!bo->bdev->funcs->eviction_valuable(bo, &place)) {
> > +		ret =3D -EBUSY;
> > +		goto out;
> > +	}
> > =C2=A0
> > =C2=A0	if (!bo->ttm || !ttm_tt_is_populated(bo->ttm) ||
> > =C2=A0	=C2=A0=C2=A0=C2=A0 bo->ttm->page_flags & TTM_TT_FLAG_EXTERNAL ||
> > -	=C2=A0=C2=A0=C2=A0 bo->ttm->page_flags & TTM_TT_FLAG_SWAPPED ||
> > -	=C2=A0=C2=A0=C2=A0 !ttm_bo_get_unless_zero(bo)) {
> > -		if (locked)
> > -			dma_resv_unlock(bo->base.resv);
> > -		return -EBUSY;
> > +	=C2=A0=C2=A0=C2=A0 bo->ttm->page_flags & TTM_TT_FLAG_SWAPPED) {
> > +		ret =3D -EBUSY;
>=20
> I think answers my -EBUSY question from here [1]. In these cases we
> continue LRU walk as eviction of the BO is not valuable.
>=20
> [1]
> https://patchwork.freedesktop.org/patch/599606/?series=3D131815&rev=3D5#c=
omment_1091419
>=20
> > +		goto out;
> > =C2=A0	}
> > =C2=A0
> > =C2=A0	if (bo->deleted) {
> > -		ret =3D ttm_bo_cleanup_refs(bo, false, false,
> > locked);
> > -		ttm_bo_put(bo);
> > -		return ret =3D=3D -EBUSY ? -ENOSPC : ret;
> > -	}
> > +		pgoff_t num_pages =3D bo->ttm->num_pages;
> > =C2=A0
> > -	/* TODO: Cleanup the locking */
> > -	spin_unlock(&bo->bdev->lru_lock);
> > +		ret =3D ttm_bo_wait_ctx(bo, ctx);
> > +		if (ret)
> > +			goto out;
> > +
> > +		ttm_bo_cleanup_memtype_use(bo);
> > +		ret =3D num_pages;
> > +		goto out;
> > +	}
> > =C2=A0
> > =C2=A0	/*
> > =C2=A0	 * Move to system cached
> > @@ -1164,12 +1177,13 @@ int ttm_bo_swapout(struct ttm_buffer_object
> > *bo, struct ttm_operation_ctx *ctx,
> > =C2=A0		memset(&hop, 0, sizeof(hop));
> > =C2=A0		place.mem_type =3D TTM_PL_SYSTEM;
> > =C2=A0		ret =3D ttm_resource_alloc(bo, &place, &evict_mem);
> > -		if (unlikely(ret))
> > +		if (ret)
> > =C2=A0			goto out;
> > =C2=A0
> > =C2=A0		ret =3D ttm_bo_handle_move_mem(bo, evict_mem, true,
> > ctx, &hop);
> > -		if (unlikely(ret !=3D 0)) {
> > -			WARN(ret =3D=3D -EMULTIHOP, "Unexpected
> > multihop in swaput - likely driver bug.\n");
> > +		if (ret) {
> > +			WARN(ret =3D=3D -EMULTIHOP,
> > +			=C2=A0=C2=A0=C2=A0=C2=A0 "Unexpected multihop in swapout -
> > likely driver bug.\n");
> > =C2=A0			ttm_resource_free(bo, &evict_mem);
> > =C2=A0			goto out;
> > =C2=A0		}
> > @@ -1179,30 +1193,54 @@ int ttm_bo_swapout(struct ttm_buffer_object
> > *bo, struct ttm_operation_ctx *ctx,
> > =C2=A0	 * Make sure BO is idle.
> > =C2=A0	 */
> > =C2=A0	ret =3D ttm_bo_wait_ctx(bo, ctx);
> > -	if (unlikely(ret !=3D 0))
> > +	if (ret)
> > =C2=A0		goto out;
> > =C2=A0
> > =C2=A0	ttm_bo_unmap_virtual(bo);
> > -
> > -	/*
> > -	 * Swap out. Buffer will be swapped in again as soon as
> > -	 * anyone tries to access a ttm page.
> > -	 */
> > =C2=A0	if (bo->bdev->funcs->swap_notify)
> > =C2=A0		bo->bdev->funcs->swap_notify(bo);
> > =C2=A0
> > =C2=A0	if (ttm_tt_is_populated(bo->ttm))
> > -		ret =3D ttm_tt_swapout(bo->bdev, bo->ttm,
> > gfp_flags);
> > +		ret =3D ttm_tt_swapout(bo->bdev, bo->ttm,
> > swapout_walk->gfp_flags);
> > =C2=A0out:
> > +	/* Consider some error codes fatal. Others may continue
> > the walk. */
> > +	if (ret =3D=3D -ENOMEM || ret =3D=3D -EINTR || ret =3D=3D -ERESTARTSY=
S
> > ||
> > +	=C2=A0=C2=A0=C2=A0 ret =3D=3D -EAGAIN || ret > 0)
> > +		return ret;
>=20
> Would it be more robust / clear to do the inverse of this? i.e.
> Return 0
> on non-fatal error codes?

Hm. I'll check how that will turn out.

>=20
> > =C2=A0
> > -	/*
> > -	 * Unreserve without putting on LRU to avoid swapping out
> > an
> > -	 * already swapped buffer.
> > -	 */
> > -	if (locked)
> > -		dma_resv_unlock(bo->base.resv);
> > -	ttm_bo_put(bo);
> > -	return ret =3D=3D -EBUSY ? -ENOSPC : ret;
> > +	return 0;
> > +}
> > +
> > +const struct ttm_lru_walk_ops ttm_swap_ops =3D {
> > +	.process_bo =3D ttm_bo_swapout_cb,
> > +};
> > +
> > +/**
> > + * ttm_bo_swapout() - Swap out buffer objects on the LRU list to
> > shmem.
> > + * @bdev: The ttm device.
> > + * @ctx: The ttm_operation_ctx governing the swapout operation.
> > + * @man: The resource manager whose resources / buffer objects are
> > + * goint to be swapped out.
> > + * @gfp_flags: The gfp flags used for shmem page allocations.
> > + * @target: The desired number of pages to swap out.
> > + *
> > + * Return: The number of pages actually swapped out, or negative
> > error code
> > + * on error.
> > + */
> > +long ttm_bo_swapout(struct ttm_device *bdev, struct
> > ttm_operation_ctx *ctx,
> > +		=C2=A0=C2=A0=C2=A0 struct ttm_resource_manager *man, gfp_t
> > gfp_flags,
> > +		=C2=A0=C2=A0=C2=A0 pgoff_t target)
> > +{
> > +	struct ttm_bo_swapout_walk swapout_walk =3D {
> > +		.walk =3D {
> > +			.ops =3D &ttm_swap_ops,
> > +			.ctx =3D ctx,
> > +			.trylock_only =3D true,
> > +		},
> > +		.gfp_flags =3D gfp_flags,
> > +	};
> > +
> > +	return ttm_lru_walk_for_evict(&swapout_walk.walk, bdev,
> > man, target);
> > =C2=A0}
> > =C2=A0
> > =C2=A0void ttm_bo_tt_destroy(struct ttm_buffer_object *bo)
> > diff --git a/drivers/gpu/drm/ttm/ttm_device.c
> > b/drivers/gpu/drm/ttm/ttm_device.c
> > index f9e9b1ec8c8a..ee575d8a54c0 100644
> > --- a/drivers/gpu/drm/ttm/ttm_device.c
> > +++ b/drivers/gpu/drm/ttm/ttm_device.c
> > @@ -148,40 +148,20 @@ int ttm_global_swapout(struct
> > ttm_operation_ctx *ctx, gfp_t gfp_flags)
> > =C2=A0int ttm_device_swapout(struct ttm_device *bdev, struct
> > ttm_operation_ctx *ctx,
> > =C2=A0		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 gfp_t gfp_flags)
> > =C2=A0{
> > -	struct ttm_resource_cursor cursor;
> > =C2=A0	struct ttm_resource_manager *man;
> > -	struct ttm_resource *res;
> > =C2=A0	unsigned i;
> > -	int ret;
> > +	long lret;
> > =C2=A0
> > -	spin_lock(&bdev->lru_lock);
> > =C2=A0	for (i =3D TTM_PL_SYSTEM; i < TTM_NUM_MEM_TYPES; ++i) {
> > =C2=A0		man =3D ttm_manager_type(bdev, i);
> > =C2=A0		if (!man || !man->use_tt)
> > =C2=A0			continue;
> > =C2=A0
> > -		ttm_resource_manager_for_each_res(man, &cursor,
> > res) {
> > -			struct ttm_buffer_object *bo =3D res->bo;
> > -			uint32_t num_pages;
> > -
> > -			if (!bo || bo->resource !=3D res)
> > -				continue;
> > -
> > -			num_pages =3D PFN_UP(bo->base.size);
> > -			ret =3D ttm_bo_swapout(bo, ctx, gfp_flags);
> > -			/* ttm_bo_swapout has dropped the lru_lock
> > */
> > -			if (!ret) {
> > -				ttm_resource_cursor_fini(&cursor);
> > -				return num_pages;
> > -			}
> > -			if (ret !=3D -EBUSY) {
> > -				ttm_resource_cursor_fini(&cursor);
> > -				return ret;
> > -			}
> > -		}
> > +		lret =3D ttm_bo_swapout(bdev, ctx, man, gfp_flags,
> > 1);
>=20
> With a target of 1 this will evict exactly 1 various sized BO which
> seems to match the current behavior.
>=20
> Just curious what is the usage of this function which evicts 1 BO
> from
> the device?

I think it evicts one bo at a time until the 50% system target is met,
alternating between TTM devices and, unfortunately, memory regions.

That could probably be improved upon, but beyond the scope of this
series since with the shrinker, we can't really exercise that on xe.

/Thomas


>=20
> Matt=20
>=20
> > +		/* Can be both positive (num_pages) and negative
> > (error) */
> > +		if (lret)
> > +			return lret;
> > =C2=A0	}
> > -	ttm_resource_cursor_fini_locked(&cursor);
> > -	spin_unlock(&bdev->lru_lock);
> > =C2=A0	return 0;
> > =C2=A0}
> > =C2=A0EXPORT_SYMBOL(ttm_device_swapout);
> > diff --git a/include/drm/ttm/ttm_bo.h b/include/drm/ttm/ttm_bo.h
> > index 8b032298d66e..472a55b69afb 100644
> > --- a/include/drm/ttm/ttm_bo.h
> > +++ b/include/drm/ttm/ttm_bo.h
> > @@ -410,8 +410,9 @@ void ttm_bo_kunmap(struct ttm_bo_kmap_obj
> > *map);
> > =C2=A0int ttm_bo_vmap(struct ttm_buffer_object *bo, struct iosys_map
> > *map);
> > =C2=A0void ttm_bo_vunmap(struct ttm_buffer_object *bo, struct iosys_map
> > *map);
> > =C2=A0int ttm_bo_mmap_obj(struct vm_area_struct *vma, struct
> > ttm_buffer_object *bo);
> > -int ttm_bo_swapout(struct ttm_buffer_object *bo, struct
> > ttm_operation_ctx *ctx,
> > -		=C2=A0=C2=A0 gfp_t gfp_flags);
> > +long ttm_bo_swapout(struct ttm_device *bdev, struct
> > ttm_operation_ctx *ctx,
> > +		=C2=A0=C2=A0=C2=A0 struct ttm_resource_manager *man, gfp_t
> > gfp_flags,
> > +		=C2=A0=C2=A0=C2=A0 pgoff_t target);
> > =C2=A0void ttm_bo_pin(struct ttm_buffer_object *bo);
> > =C2=A0void ttm_bo_unpin(struct ttm_buffer_object *bo);
> > =C2=A0int ttm_mem_evict_first(struct ttm_device *bdev,
> > --=20
> > 2.44.0
> >=20

