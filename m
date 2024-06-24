Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E6CD9145E0
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jun 2024 11:06:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4714F10E3C1;
	Mon, 24 Jun 2024 09:06:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Xp/WYfN9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 830D510E3C0;
 Mon, 24 Jun 2024 09:06:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719219995; x=1750755995;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=UeI0V2I/4AlMgFDCbvikPtnGEyBLiuTqh4Iv0y/8qoQ=;
 b=Xp/WYfN9FOoviD91vopSCQHQ7ZWlx5mhQ//0CPzjzxUjgobUdAqjPEMl
 0WlgWH2Di/Onk7UHygsoKBIrQoh57ym3IumfS71fHawoF/OTDn0X914e7
 xhES+6bffSUdWHf6IGQYogIiMj4YKhPhaNoy0sBrhZRCn3VKok5s4ksgV
 C1mTMU2UqIALZ9vuzzkZFjtPMIbXGq76tX07yuDxL4FOHTfvUVFyBzLSc
 TejNvi3e3GEhSm50urOX4ZQpOaV2xVi+x4PFUpy8e8OJGBQNlRmv0vh+l
 i/1qFav4HQh4fRSW7enlMUmi/SQLf0Owx4Is5Tp/Z8uNpwvNb9cJeFZB0 g==;
X-CSE-ConnectionGUID: vFUFLLF5RY6C2BMXwcjsCg==
X-CSE-MsgGUID: 6lg4eIRBQa6ua6CfVjKHjw==
X-IronPort-AV: E=McAfee;i="6700,10204,11112"; a="16147500"
X-IronPort-AV: E=Sophos;i="6.08,261,1712646000"; d="scan'208";a="16147500"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2024 02:06:34 -0700
X-CSE-ConnectionGUID: NwgVnq+ERruKgxOc/+hwFw==
X-CSE-MsgGUID: CIL7Nn87RdWeVf5MJpgmHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,261,1712646000"; d="scan'208";a="80764462"
Received: from oandoniu-mobl3.ger.corp.intel.com (HELO [10.245.244.144])
 ([10.245.244.144])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2024 02:06:32 -0700
Message-ID: <9d6ba9d54f8c941094cd7f0975d20b90ec7f58a8.camel@linux.intel.com>
Subject: Re: [PATCH v5 07/12] drm/ttm: Use the LRU walker for eviction
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org, Christian =?ISO-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>, Somalapuram Amaranath
 <Amaranath.Somalapuram@amd.com>, dri-devel@lists.freedesktop.org
Date: Mon, 24 Jun 2024 11:06:29 +0200
In-Reply-To: <ZnNhIE6IhRuls2uA@DUT025-TGLU.fm.intel.com>
References: <20240618071820.130917-1-thomas.hellstrom@linux.intel.com>
 <20240618071820.130917-8-thomas.hellstrom@linux.intel.com>
 <ZnNhIE6IhRuls2uA@DUT025-TGLU.fm.intel.com>
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

Hi, Matthew

On Wed, 2024-06-19 at 22:52 +0000, Matthew Brost wrote:
> On Tue, Jun 18, 2024 at 09:18:15AM +0200, Thomas Hellstr=C3=B6m wrote:
> > Use the LRU walker for eviction. This helps
> > removing a lot of code with weird locking
> > semantics.
> >=20
> > The functionality is slightly changed so that
> > when trylocked buffer objects are exhausted, we
> > continue to interleave walks with ticket-locks while
> > there is still progress made. The list walks are
> > not restarted in-between evictions.
> >=20
> > Also provide a separate ttm_bo_evict_first()
> > function for its single user. The context of that
> > user allows sleeping dma_resv locks.
> >=20
> I'm inclined to RB this as I think I've made sense of it all but just
> have a few questions / nits first + one small bug.
>=20
> > Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> > Cc: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>
> > Cc: Matthew Brost <matthew.brost@intel.com>
> > Cc: <dri-devel@lists.freedesktop.org>
> > Signed-off-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> > ---
> > =C2=A0drivers/gpu/drm/ttm/ttm_bo.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
| 350 ++++++++++++-------------
> > ----
> > =C2=A0drivers/gpu/drm/ttm/ttm_resource.c |=C2=A0 20 +-
> > =C2=A0include/drm/ttm/ttm_bo.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 8 +-
> > =C2=A03 files changed, 145 insertions(+), 233 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/ttm/ttm_bo.c
> > b/drivers/gpu/drm/ttm/ttm_bo.c
> > index 63a91b77f7da..316afe19a325 100644
> > --- a/drivers/gpu/drm/ttm/ttm_bo.c
> > +++ b/drivers/gpu/drm/ttm/ttm_bo.c
> > @@ -224,80 +224,6 @@ static void ttm_bo_flush_all_fences(struct
> > ttm_buffer_object *bo)
> > =C2=A0	dma_resv_iter_end(&cursor);
> > =C2=A0}
> > =C2=A0
> > -/**
> > - * ttm_bo_cleanup_refs
> > - * If bo idle, remove from lru lists, and unref.
> > - * If not idle, block if possible.
> > - *
> > - * Must be called with lru_lock and reservation held, this
> > function
> > - * will drop the lru lock and optionally the reservation lock
> > before returning.
> > - *
> > - * @bo:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 The buffer object to cl=
ean-up
> > - * @interruptible:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Any=
 sleeps should occur interruptibly.
> > - * @no_wait_gpu:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 Never wait for gpu. Return -EBUSY
> > instead.
> > - * @unlock_resv:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 Unlock the reservation lock as well.
> > - */
> > -
> > -static int ttm_bo_cleanup_refs(struct ttm_buffer_object *bo,
> > -			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bool interruptible, bool
> > no_wait_gpu,
> > -			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bool unlock_resv)
> > -{
> > -	struct dma_resv *resv =3D &bo->base._resv;
> > -	int ret;
> > -
> > -	if (dma_resv_test_signaled(resv, DMA_RESV_USAGE_BOOKKEEP))
> > -		ret =3D 0;
> > -	else
> > -		ret =3D -EBUSY;
> > -
> > -	if (ret && !no_wait_gpu) {
> > -		long lret;
> > -
> > -		if (unlock_resv)
> > -			dma_resv_unlock(bo->base.resv);
> > -		spin_unlock(&bo->bdev->lru_lock);
> > -
> > -		lret =3D dma_resv_wait_timeout(resv,
> > DMA_RESV_USAGE_BOOKKEEP,
> > -					=C2=A0=C2=A0=C2=A0=C2=A0 interruptible,
> > -					=C2=A0=C2=A0=C2=A0=C2=A0 30 * HZ);
> > -
> > -		if (lret < 0)
> > -			return lret;
> > -		else if (lret =3D=3D 0)
> > -			return -EBUSY;
> > -
> > -		spin_lock(&bo->bdev->lru_lock);
> > -		if (unlock_resv && !dma_resv_trylock(bo-
> > >base.resv)) {
> > -			/*
> > -			 * We raced, and lost, someone else holds
> > the reservation now,
> > -			 * and is probably busy in
> > ttm_bo_cleanup_memtype_use.
> > -			 *
> > -			 * Even if it's not the case, because we
> > finished waiting any
> > -			 * delayed destruction would succeed, so
> > just return success
> > -			 * here.
> > -			 */
> > -			spin_unlock(&bo->bdev->lru_lock);
> > -			return 0;
> > -		}
> > -		ret =3D 0;
> > -	}
> > -
> > -	if (ret) {
> > -		if (unlock_resv)
> > -			dma_resv_unlock(bo->base.resv);
> > -		spin_unlock(&bo->bdev->lru_lock);
> > -		return ret;
> > -	}
> > -
> > -	spin_unlock(&bo->bdev->lru_lock);
> > -	ttm_bo_cleanup_memtype_use(bo);
> > -
> > -	if (unlock_resv)
> > -		dma_resv_unlock(bo->base.resv);
> > -
> > -	return 0;
> > -}
> > -
> > =C2=A0/*
> > =C2=A0 * Block for the dma_resv object to become idle, lock the buffer
> > and clean up
> > =C2=A0 * the resource and tt object.
> > @@ -505,151 +431,154 @@ bool ttm_bo_eviction_valuable(struct
> > ttm_buffer_object *bo,
> > =C2=A0}
> > =C2=A0EXPORT_SYMBOL(ttm_bo_eviction_valuable);
> > =C2=A0
> > -/*
> > - * Check the target bo is allowable to be evicted or swapout,
> > including cases:
> > - *
> > - * a. if share same reservation object with ctx->resv, have
> > assumption
> > - * reservation objects should already be locked, so not lock again
> > and
> > - * return true directly when either the opreation
> > allow_reserved_eviction
> > - * or the target bo already is in delayed free list;
> > +/**
> > + * ttm_bo_evict_first() - Evict the first bo on the manager's LRU
> > list.
> > + * @bdev: The ttm device.
> > + * @man: The manager whose bo to evict.
> > + * @ctx: The TTM operation ctx governing the eviction.
> > =C2=A0 *
> > - * b. Otherwise, trylock it.
> > + * Return: 0 if successful or the resource disappeared. Negative
> > error code on error.
> > =C2=A0 */
> > -static bool ttm_bo_evict_swapout_allowable(struct
> > ttm_buffer_object *bo,
> > -					=C2=A0=C2=A0 struct
> > ttm_operation_ctx *ctx,
> > -					=C2=A0=C2=A0 const struct ttm_place
> > *place,
> > -					=C2=A0=C2=A0 bool *locked, bool
> > *busy)
> > +int ttm_bo_evict_first(struct ttm_device *bdev, struct
> > ttm_resource_manager *man,
> > +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct ttm_operation_ctx *ctx)
> > =C2=A0{
> > -	bool ret =3D false;
> > +	struct ttm_resource_cursor cursor;
> > +	struct ttm_buffer_object *bo;
> > +	struct ttm_resource *res;
> > +	unsigned int mem_type;
> > +	int ret =3D 0;
> > =C2=A0
> > -	if (bo->pin_count) {
> > -		*locked =3D false;
> > -		if (busy)
> > -			*busy =3D false;
> > -		return false;
> > +	spin_lock(&bdev->lru_lock);
> > +	res =3D ttm_resource_manager_first(man, &cursor);
> > +	if (!res) {
> > +		ret =3D -ENOENT;
>=20
> Nit, this assignment is not needed a out_no_ref just returns -ENOENT.
>=20
> > +		goto out_no_ref;
> > =C2=A0	}
> > +	bo =3D res->bo;
> > +	if (!ttm_bo_get_unless_zero(bo))
> > +		goto out_no_ref;
> > +	mem_type =3D res->mem_type;
> > +	spin_unlock(&bdev->lru_lock);
> > +	ret =3D ttm_bo_reserve(bo, ctx->interruptible, ctx-
> > >no_wait_gpu, NULL);
> > +	if (ret)
> > +		goto out_no_lock;
> > +	if (bo->resource !=3D res || res->mem_type !=3D mem_type)
>=20
> So 'bo->resource !=3D res' is checking between dropping of the LRU lock
> and grabbing the dma-resv lock in ttm_bo_reserve, the BO's backing
> resource has changed (i.e. someone else could've evicted to BO). Is
> that correct? Also in this case 'res' could be stale memory and not
> safe
> to dereference, right?

Yes, that's correct. Although if bo->resource =3D=3D res, it is safe to
dereference res.

>=20
> I'm confused about 'res->mem_type !=3D mem_type' though. Looking
> through
> the code is res->mem_type not immutable? I think I only see
> res->mem_type assigned in ttm_resource_init.

It's if someone freed res and then allocated a new resource that ended
up as bo->resource, but with the same virtual address as res. Not very
likely but definitely possible. Then if the new resource has the same
memory type we can go ahead and evict anyway, If not, we skip eviction.

>=20
> > +		goto out_bad_res;
>=20
> s/out_bad_res/out_bo_moved
>=20
> Would that be more accurate?

Yes, I could change that.

>=20
> > =C2=A0
> > -	if (bo->base.resv =3D=3D ctx->resv) {
> > -		dma_resv_assert_held(bo->base.resv);
> > -		if (ctx->allow_res_evict)
> > -			ret =3D true;
> > -		*locked =3D false;
> > -		if (busy)
> > -			*busy =3D false;
> > +	if (bo->deleted) {
> > +		ret =3D ttm_bo_wait_ctx(bo, ctx);
> > +		if (ret)
>=20
> This should be 'if (!ret)', right? We should cleanup once the BO is
> idle.

Right. Will fix.

>=20
> > +			ttm_bo_cleanup_memtype_use(bo);
> > =C2=A0	} else {
> > -		ret =3D dma_resv_trylock(bo->base.resv);
> > -		*locked =3D ret;
> > -		if (busy)
> > -			*busy =3D !ret;
> > -	}
> > -
> > -	if (ret && place && (bo->resource->mem_type !=3D place-
> > >mem_type ||
> > -		!bo->bdev->funcs->eviction_valuable(bo, place))) {
> > -		ret =3D false;
> > -		if (*locked) {
> > -			dma_resv_unlock(bo->base.resv);
> > -			*locked =3D false;
> > -		}
> > +		ret =3D ttm_bo_evict(bo, ctx);
> > =C2=A0	}
> > -
> > +out_bad_res:
> > +	dma_resv_unlock(bo->base.resv);
> > +out_no_lock:
> > +	ttm_bo_put(bo);
> > +	ttm_resource_cursor_fini(&cursor);
> > =C2=A0	return ret;
> > +
> > +out_no_ref:
> > +	ttm_resource_cursor_fini_locked(&cursor);
> > +	spin_unlock(&bdev->lru_lock);
> > +	return -ENOENT;
> > =C2=A0}
> > =C2=A0
> > =C2=A0/**
> > - * ttm_mem_evict_wait_busy - wait for a busy BO to become
> > available
> > - *
> > - * @busy_bo: BO which couldn't be locked with trylock
> > - * @ctx: operation context
> > - * @ticket: acquire ticket
> > - *
> > - * Try to lock a busy buffer object to avoid failing eviction.
> > + * struct ttm_bo_evict_walk - Parameters for the evict walk.
> > =C2=A0 */
> > -static int ttm_mem_evict_wait_busy(struct ttm_buffer_object
> > *busy_bo,
> > -				=C2=A0=C2=A0 struct ttm_operation_ctx *ctx,
> > -				=C2=A0=C2=A0 struct ww_acquire_ctx *ticket)
> > -{
> > -	int r;
> > -
> > -	if (!busy_bo || !ticket)
> > -		return -EBUSY;
> > -
> > -	if (ctx->interruptible)
> > -		r =3D dma_resv_lock_interruptible(busy_bo-
> > >base.resv,
> > -							=C2=A0 ticket);
> > -	else
> > -		r =3D dma_resv_lock(busy_bo->base.resv, ticket);
> > -
> > -	/*
> > -	 * TODO: It would be better to keep the BO locked until
> > allocation is at
> > -	 * least tried one more time, but that would mean a much
> > larger rework
> > -	 * of TTM.
> > -	 */
> > -	if (!r)
> > -		dma_resv_unlock(busy_bo->base.resv);
> > -
> > -	return r =3D=3D -EDEADLK ? -EBUSY : r;
> > -}
> > +struct ttm_bo_evict_walk {
> > +	/** @walk: The walk base parameters. */
> > +	struct ttm_lru_walk walk;
> > +	/** @place: The place passed to the resource allocation.
> > */
> > +	const struct ttm_place *place;
> > +	/** @evictor: The buffer object we're trying to make room
> > for. */
> > +	struct ttm_buffer_object *evictor;
> > +	/** @res: The allocated resource if any. */
> > +	struct ttm_resource **res;
> > +	/** @evicted: The number of evicted pages. */
>=20
> s/pages/BOs or resources
>=20
> Another option would be 'forward_progess' or something like that
> given
> the usage in this patch.

OK, yes, will take a look and fix.

>=20
> > +	unsigned long evicted;
> > +};
> > =C2=A0
> > -int ttm_mem_evict_first(struct ttm_device *bdev,
> > -			struct ttm_resource_manager *man,
> > -			const struct ttm_place *place,
> > -			struct ttm_operation_ctx *ctx,
> > -			struct ww_acquire_ctx *ticket)
> > +static long ttm_bo_evict_cb(struct ttm_lru_walk *walk, struct
> > ttm_buffer_object *bo)
> > =C2=A0{
> > -	struct ttm_buffer_object *bo =3D NULL, *busy_bo =3D NULL;
> > -	struct ttm_resource_cursor cursor;
> > -	struct ttm_resource *res;
> > -	bool locked =3D false;
> > -	int ret;
> > +	struct ttm_bo_evict_walk *evict_walk =3D
> > +		container_of(walk, typeof(*evict_walk), walk);
> > +	long lret;
> > =C2=A0
> > -	spin_lock(&bdev->lru_lock);
> > -	ttm_resource_manager_for_each_res(man, &cursor, res) {
> > -		bool busy;
> > -
> > -		if (!ttm_bo_evict_swapout_allowable(res->bo, ctx,
> > place,
> > -						=C2=A0=C2=A0=C2=A0 &locked,
> > &busy)) {
> > -			if (busy && !busy_bo && ticket !=3D
> > -			=C2=A0=C2=A0=C2=A0 dma_resv_locking_ctx(res->bo-
> > >base.resv))
> > -				busy_bo =3D res->bo;
> > -			continue;
> > -		}
> > +	if (!bo->bdev->funcs->eviction_valuable(bo, evict_walk-
> > >place))
> > +		return 0;
> > =C2=A0
> > -		if (ttm_bo_get_unless_zero(res->bo)) {
> > -			bo =3D res->bo;
> > -			break;
> > -		}
> > -		if (locked)
> > -			dma_resv_unlock(res->bo->base.resv);
> > +	if (bo->deleted) {
> > +		lret =3D ttm_bo_wait_ctx(bo, walk->ctx);
> > +		if (!lret)
> > +			ttm_bo_cleanup_memtype_use(bo);
> > +	} else {
> > +		lret =3D ttm_bo_evict(bo, walk->ctx);
> > =C2=A0	}
> > -	ttm_resource_cursor_fini_locked(&cursor);
> > =C2=A0
> > -	if (!bo) {
> > -		if (busy_bo && !ttm_bo_get_unless_zero(busy_bo))
> > -			busy_bo =3D NULL;
> > -		spin_unlock(&bdev->lru_lock);
> > -		ret =3D ttm_mem_evict_wait_busy(busy_bo, ctx,
> > ticket);
> > -		if (busy_bo)
> > -			ttm_bo_put(busy_bo);
> > -		return ret;
> > -	}
> > +	if (lret)
> > +		goto out;
> > =C2=A0
> > -	if (bo->deleted) {
> > -		ret =3D ttm_bo_cleanup_refs(bo, ctx->interruptible,
> > -					=C2=A0 ctx->no_wait_gpu,
> > locked);
> > -		ttm_bo_put(bo);
> > -		return ret;
> > -	}
> > +	evict_walk->evicted++;
> > +	if (evict_walk->res)
> > +		lret =3D ttm_resource_alloc(evict_walk->evictor,
> > evict_walk->place,
> > +					=C2=A0 evict_walk->res);
> > +	if (lret =3D=3D 0)
> > +		return 1;
> > +out:
> > +	/* Errors that should terminate the walk. */
> > +	if (lret =3D=3D -ENOMEM || lret =3D=3D -EINTR || lret =3D=3D -
> > ERESTARTSYS ||
> > +	=C2=A0=C2=A0=C2=A0 lret =3D=3D -EAGAIN)
> > +		return lret;
>=20
> Same comment as the previous patch, the inverse of this might be more
> clear. Also if the condition is the same, a helper may make sense.

Will fix.

>=20
> > =C2=A0
> > -	spin_unlock(&bdev->lru_lock);
> > +	return 0;
> > +}
> > =C2=A0
> > -	ret =3D ttm_bo_evict(bo, ctx);
> > -	if (locked)
> > -		ttm_bo_unreserve(bo);
> > -	else
> > -		ttm_bo_move_to_lru_tail_unlocked(bo);
> > +static const struct ttm_lru_walk_ops ttm_evict_walk_ops =3D {
> > +	.process_bo =3D ttm_bo_evict_cb,
> > +};
> > =C2=A0
> > -	ttm_bo_put(bo);
> > -	return ret;
> > +static int ttm_bo_evict_alloc(struct ttm_device *bdev,
> > +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct ttm_resource_manager *man,
> > +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const struct ttm_place *place,
> > +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct ttm_buffer_object *evictor,
> > +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct ttm_operation_ctx *ctx,
> > +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct ww_acquire_ctx *ticket,
> > +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct ttm_resource **res)
> > +{
> > +	struct ttm_bo_evict_walk evict_walk =3D {
> > +		.walk =3D {
> > +			.ops =3D &ttm_evict_walk_ops,
> > +			.ctx =3D ctx,
> > +			.ticket =3D ticket,
> > +		},
> > +		.place =3D place,
> > +		.evictor =3D evictor,
> > +		.res =3D res,
> > +	};
> > +	long lret;
> > +
> > +	evict_walk.walk.trylock_only =3D true;
> > +	lret =3D ttm_lru_walk_for_evict(&evict_walk.walk, bdev, man,
> > 1);
> > +	if (lret || !ticket)
> > +		goto out;
> > +
> > +	/* If ticket-locking, repeat while making progress. */
> > +	evict_walk.walk.trylock_only =3D false;
> > +	do {
> > +		/* The walk may clear the evict_walk.walk.ticket
> > field */
> > +		evict_walk.walk.ticket =3D ticket;
> > +		evict_walk.evicted =3D 0;
> > +		lret =3D ttm_lru_walk_for_evict(&evict_walk.walk,
> > bdev, man, 1);
> > +	} while (!lret && evict_walk.evicted);
> > +out:
> > +	if (lret < 0)
> > +		return lret;
> > +	if (lret =3D=3D 0)
> > +		return -EBUSY;
> > +	return 0;
> > =C2=A0}
> > =C2=A0
> > =C2=A0/**
> > @@ -760,6 +689,7 @@ static int ttm_bo_alloc_resource(struct
> > ttm_buffer_object *bo,
> > =C2=A0	for (i =3D 0; i < placement->num_placement; ++i) {
> > =C2=A0		const struct ttm_place *place =3D &placement-
> > >placement[i];
> > =C2=A0		struct ttm_resource_manager *man;
> > +		bool may_evict;
> > =C2=A0
> > =C2=A0		man =3D ttm_manager_type(bdev, place->mem_type);
> > =C2=A0		if (!man || !ttm_resource_manager_used(man))
> > @@ -769,22 +699,21 @@ static int ttm_bo_alloc_resource(struct
> > ttm_buffer_object *bo,
> > =C2=A0				=C2=A0=C2=A0=C2=A0 TTM_PL_FLAG_FALLBACK))
> > =C2=A0			continue;
> > =C2=A0
> > -		do {
> > -			ret =3D ttm_resource_alloc(bo, place, res);
> > -			if (unlikely(ret && ret !=3D -ENOSPC))
> > +		may_evict =3D (force_space && place->mem_type !=3D
> > TTM_PL_SYSTEM);
> > +		ret =3D ttm_resource_alloc(bo, place, res);
> > +		if (ret) {
> > +			if (ret !=3D -ENOSPC)
> > =C2=A0				return ret;
> > -			if (likely(!ret) || !force_space)
> > -				break;
> > -
> > -			ret =3D ttm_mem_evict_first(bdev, man,
> > place, ctx,
> > -						=C2=A0 ticket);
> > -			if (unlikely(ret =3D=3D -EBUSY))
> > -				break;
> > -			if (unlikely(ret))
> > +			if (!may_evict)
> > +				continue;
> > +
> > +			ret =3D ttm_bo_evict_alloc(bdev, man, place,
> > bo, ctx,
> > +						 ticket, res);
> > +			if (ret =3D=3D -EBUSY)
> > +				continue;
> > +			if (ret)
> > =C2=A0				return ret;
> > -		} while (1);
> > -		if (ret)
> > -			continue;
> > +		}
> > =C2=A0
> > =C2=A0		ret =3D ttm_bo_add_move_fence(bo, man, ctx-
> > >no_wait_gpu);
> > =C2=A0		if (unlikely(ret)) {
> > @@ -796,7 +725,6 @@ static int ttm_bo_alloc_resource(struct
> > ttm_buffer_object *bo,
> > =C2=A0		}
> > =C2=A0		return 0;
> > =C2=A0	}
> > -
>=20
> Nit, seems unrelated.

Yup. Will fix.

>=20
> Matt
>=20
> > =C2=A0	return -ENOSPC;
> > =C2=A0}
> > =C2=A0
> > diff --git a/drivers/gpu/drm/ttm/ttm_resource.c
> > b/drivers/gpu/drm/ttm/ttm_resource.c
> > index a03090683e79..6d0c66fc36e3 100644
> > --- a/drivers/gpu/drm/ttm/ttm_resource.c
> > +++ b/drivers/gpu/drm/ttm/ttm_resource.c
> > @@ -508,24 +508,10 @@ int ttm_resource_manager_evict_all(struct
> > ttm_device *bdev,
> > =C2=A0	};
> > =C2=A0	struct dma_fence *fence;
> > =C2=A0	int ret;
> > -	unsigned i;
> > -
> > -	/*
> > -	 * Can't use standard list traversal since we're
> > unlocking.
> > -	 */
> > =C2=A0
> > -	spin_lock(&bdev->lru_lock);
> > -	for (i =3D 0; i < TTM_MAX_BO_PRIORITY; ++i) {
> > -		while (!list_empty(&man->lru[i])) {
> > -			spin_unlock(&bdev->lru_lock);
> > -			ret =3D ttm_mem_evict_first(bdev, man, NULL,
> > &ctx,
> > -						=C2=A0 NULL);
> > -			if (ret)
> > -				return ret;
> > -			spin_lock(&bdev->lru_lock);
> > -		}
> > -	}
> > -	spin_unlock(&bdev->lru_lock);
> > +	do {
> > +		ret =3D ttm_bo_evict_first(bdev, man, &ctx);
> > +	} while (!ret);
> > =C2=A0
> > =C2=A0	spin_lock(&man->move_lock);
> > =C2=A0	fence =3D dma_fence_get(man->move);
> > diff --git a/include/drm/ttm/ttm_bo.h b/include/drm/ttm/ttm_bo.h
> > index 472a55b69afb..148f49f625e4 100644
> > --- a/include/drm/ttm/ttm_bo.h
> > +++ b/include/drm/ttm/ttm_bo.h
> > @@ -415,11 +415,9 @@ long ttm_bo_swapout(struct ttm_device *bdev,
> > struct ttm_operation_ctx *ctx,
> > =C2=A0		=C2=A0=C2=A0=C2=A0 pgoff_t target);
> > =C2=A0void ttm_bo_pin(struct ttm_buffer_object *bo);
> > =C2=A0void ttm_bo_unpin(struct ttm_buffer_object *bo);
> > -int ttm_mem_evict_firevictedst(struct ttm_device *bdev,
> > -			struct ttm_resource_manager *man,
> > -			const struct ttm_place *place,
> > -			struct ttm_operation_ctx *ctx,
> > -			struct ww_acquire_ctx *ticket);
> > +int ttm_bo_evict_first(struct ttm_device *bdev,
> > +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct ttm_resource_manager *ma=
n,
> > +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct ttm_operation_ctx *ctx);
> > =C2=A0vm_fault_t ttm_bo_vm_reserve(struct ttm_buffer_object *bo,
> > =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0 struct vm_fault *vmf);
> > =C2=A0vm_fault_t ttm_bo_vm_fault_reserved(struct vm_fault *vmf,
> > --=20
> > 2.44.0
> >=20

