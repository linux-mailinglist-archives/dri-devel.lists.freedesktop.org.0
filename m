Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 426D890E487
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jun 2024 09:31:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89F8510EAA2;
	Wed, 19 Jun 2024 07:31:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bBS+mJca";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A83BB10EA7F;
 Wed, 19 Jun 2024 07:31:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718782299; x=1750318299;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=jS4qg0ZpOeVeb7PnEWtdg9Ipey1WyOtIt6jzrmY7Cs0=;
 b=bBS+mJcaNsGiByCLBmyLoNT4u3Rh41kEJhWNLksu5z2Rp1t3RSEzDD5Y
 S7h4CKJXI2mEHhvAezNgeMK9t56sU3aRcvDmTR13t5Y9T791LRpn386nJ
 RRdau/+NE4D0aznL8xHdsFoLuZfsfN/EFpfy5DsCDv+Vek4WsE31t3E3g
 pcLWQl2IlXUiKet/uW02u/YAUl9Tf1y0Hn+x7cdBtWAtNKVz8am0kvRMq
 OKT/lwEQf9TElYyGV5QRlhg5Ktqw667zbmnc+5P/QbAX6HaKYuT/pdG6v
 2cMv16v+l9BFSy/y8wDhK+ehigwRyoa07m8WV+BP73tVkQ9qY2KRuLZ3t w==;
X-CSE-ConnectionGUID: jeOwIcHiTEaY5vO+JZVflQ==
X-CSE-MsgGUID: TH1klBfoRUGOob0PPUY/Yw==
X-IronPort-AV: E=McAfee;i="6700,10204,11107"; a="26332785"
X-IronPort-AV: E=Sophos;i="6.08,249,1712646000"; d="scan'208";a="26332785"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2024 00:31:38 -0700
X-CSE-ConnectionGUID: 1tbHiDRmQ4ueZzxb0jLShQ==
X-CSE-MsgGUID: 4kW0koWKSWWM9SujMvsn9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,249,1712646000"; d="scan'208";a="46200625"
Received: from oandoniu-mobl3.ger.corp.intel.com (HELO [10.245.245.122])
 ([10.245.245.122])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2024 00:31:36 -0700
Message-ID: <ea9a30622e4d2e773eede7afe9d60891eea0c7c1.camel@linux.intel.com>
Subject: Re: [PATCH v5 05/12] drm/ttm: Provide a generic LRU walker helper
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org, Christian =?ISO-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>, Somalapuram Amaranath
 <Amaranath.Somalapuram@amd.com>, dri-devel@lists.freedesktop.org
Date: Wed, 19 Jun 2024 09:31:33 +0200
In-Reply-To: <ZnIGBea3S5fquc32@DUT025-TGLU.fm.intel.com>
References: <20240618071820.130917-1-thomas.hellstrom@linux.intel.com>
 <20240618071820.130917-6-thomas.hellstrom@linux.intel.com>
 <ZnIGBea3S5fquc32@DUT025-TGLU.fm.intel.com>
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

Hi, Matthew.=20

Thanks for reviewing.

On Tue, 2024-06-18 at 22:11 +0000, Matthew Brost wrote:
> On Tue, Jun 18, 2024 at 09:18:13AM +0200, Thomas Hellstr=C3=B6m wrote:
>=20
> Replying to correct version...
>=20
> > Provide a generic LRU walker in TTM, in the spirit of
> > drm_gem_lru_scan()
> > but building on the restartable TTM LRU functionality.
> >=20
> > The LRU walker optionally supports locking objects as part of
> > a ww mutex locking transaction, to mimic to some extent the
> > current functionality in ttm. However any -EDEADLK return
> > is converted to -ENOMEM, so that the driver will need to back
> > off and possibly retry without being able to keep the
> > ticket.
> >=20
>=20
> Wouldn't the backoff be unlock everything but keep the ticket?

We can't do that (yet) since we don't have the drm_exec or similar
functionality. The missing part is that if keep the ticket, it's in
contended state which means we need to slow-lock the contending lock as
the first lock. And the caller doesn't know which lock is the
contending one....

That is all addressed in the RFC part of the series that I left out for
now. This is only trying to mimic current functionality.

>=20
> > v3:
> > - Move the helper to core ttm.
> > - Remove the drm_exec usage from it for now, it will be
> > =C2=A0 reintroduced later in the series.
> > v4:
> > - Handle the -EALREADY case if ticketlocking.
> >=20
> > Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> > Cc: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>
> > Cc: Matthew Brost <matthew.brost@intel.com>
> > Cc: <dri-devel@lists.freedesktop.org>
> > Signed-off-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> > ---
> > =C2=A0drivers/gpu/drm/ttm/ttm_bo_util.c | 145
> > ++++++++++++++++++++++++++++++
> > =C2=A0include/drm/ttm/ttm_bo.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0 32 +++++++
> > =C2=A02 files changed, 177 insertions(+)
> >=20
> > diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c
> > b/drivers/gpu/drm/ttm/ttm_bo_util.c
> > index 0b3f4267130c..45fcaf6f8644 100644
> > --- a/drivers/gpu/drm/ttm/ttm_bo_util.c
> > +++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
> > @@ -768,3 +768,148 @@ int ttm_bo_pipeline_gutting(struct
> > ttm_buffer_object *bo)
> > =C2=A0	ttm_tt_destroy(bo->bdev, ttm);
> > =C2=A0	return ret;
> > =C2=A0}
> > +
> > +static bool ttm_lru_walk_trylock(struct ttm_lru_walk *walk,
> > +				 struct ttm_buffer_object *bo,
> > +				 bool *needs_unlock)
> > +{
> > +	struct ttm_operation_ctx *ctx =3D walk->ctx;
> > +
> > +	*needs_unlock =3D false;
> > +
> > +	if (dma_resv_trylock(bo->base.resv)) {
> > +		*needs_unlock =3D true;
> > +		return true;
> > +	}
> > +
> > +	if (bo->base.resv =3D=3D ctx->resv && ctx->allow_res_evict) {
> > +		dma_resv_assert_held(bo->base.resv);
> > +		return true;
> > +	}
> > +i
>=20
> Any reason this is done after the try lock? Just kinda goofy as if
> this
> statement is true the dma_resv_trylock will always fail.

It should work either way. I guess I had viewed it as "trylock first,
if that fails, attempt any exception". I guess if we want to optimize
performance for shared lock implementations, moving it first might
avoid the atomic trylock operation, but I wouldn't expect a noticeable
difference.

>=20
> > +	return false;
> > +}
> > +
> > +static int ttm_lru_walk_ticketlock(struct ttm_lru_walk *walk,
> > +				=C2=A0=C2=A0 struct ttm_buffer_object *bo,
> > +				=C2=A0=C2=A0 bool *needs_unlock)
> > +{
> > +	struct dma_resv *resv =3D bo->base.resv;
> > +	int ret;
> > +
>=20
> I suppose we don't have asserts here like in Xe but if we did,
> assert(walk->ticket)?

I agree. I think we'd really want a TTM assert or warning that could be
compiled away. In any case, I only expect a single caller of this
function.

>=20
> > +	if (walk->ctx->interruptible)
> > +		ret =3D dma_resv_lock_interruptible(resv, walk-
> > >ticket);
> > +	else
> > +		ret =3D dma_resv_lock(resv, walk->ticket);
> > +
> > +	if (!ret) {
> > +		*needs_unlock =3D true;
> > +		/* Only a single ticketlock per loop. */
> > +		walk->ticket =3D NULL;
>=20
> Can you explain this a bit more? I see that once the walk->ticket is
> set
> to NULL this function will not be called again (i.e. only try locking
> will be used). I want to understand the reasoning for this.
>=20
> It might be helpful for a more lengthly explaination in the comments
> of
> the code too.

I can add a more thorough explanation, Again, this is trying to mimic
the current code, that does a walk of trylocking, then a single ticket
lock more as a sort of "wait a while to be able to make progress" and
then resorts to trylock again.

The real reason to avoid multiple ticketlocks here is that each have a
chance of failing with -EDEADLK, (in particular with the -EDEADLK
injection enabled) which would translate to an -ENOMEM in the caller.

>=20
> > +	} else if (ret =3D=3D -EDEADLK) {
> > +		/* Caller needs to exit the ww transaction. */
> > +		ret =3D -ENOSPC;
>=20
> The commit message says -ENOMEM.

The -ENOSPC is converted to -ENOMEM for the driver in
ttm_bo_validate(). I could explain a bit more in the commit message.

>=20
> > +	}
> > +
> > +	return ret;
> > +}
> > +
> > +static void ttm_lru_walk_unlock(struct ttm_buffer_object *bo, bool
> > locked)
> > +{
> > +	if (locked)
> > +		dma_resv_unlock(bo->base.resv);
> > +}
> > +
> > +/**
> > + * ttm_lru_walk_for_evict() - Perform a LRU list walk, with
> > actions taken on
> > + * valid items.
> > + * @walk: describe the walks and actions taken
> > + * @bdev: The TTM device.
> > + * @man: The struct ttm_resource manager whose LRU lists we're
> > walking.
> > + * @target: The end condition for the walk.
> > + *
> > + * The LRU lists of @man are walk, and for each struct
> > ttm_resource encountered,
> > + * the corresponding ttm_buffer_object is locked and taken a
> > reference on, and
> > + * the LRU lock is dropped. the LRU lock may be dropped before
> > locking and, in
> > + * that case, it's verified that the item actually remains on the
> > LRU list after
> > + * the lock, and that the buffer object didn't switch resource in
> > between.
> > + *
> > + * With a locked object, the actions indicated by @walk-
> > >process_bo are
> > + * performed, and after that, the bo is unlocked, the refcount
> > dropped and the
> > + * next struct ttm_resource is processed. Here, the walker relies
> > on
> > + * TTM's restartable LRU list implementation.
> > + *
> > + * Typically @walk->process_bo() would return the number of pages
> > evicted,
> > + * swapped or shrunken, so that when the total exceeds @target, or
> > when the
> > + * LRU list has been walked in full, iteration is terminated. It's
> > also terminated
> > + * on error. Note that the definition of @target is done by the
> > caller, it
> > + * could have a different meaning than the number of pages.
> > + *
> > + * Note that the way dma_resv individualization is done, locking
> > needs to be done
> > + * either with the LRU lock held (trylocking only) or with a
> > reference on the
> > + * object.
> > + *
> > + * Return: The progress made towards target or negative error code
> > on error.
> > + */
> > +long ttm_lru_walk_for_evict(struct ttm_lru_walk *walk, struct
> > ttm_device *bdev,
> > +			=C2=A0=C2=A0=C2=A0 struct ttm_resource_manager *man, long
> > target)
> > +{
> > +	struct ttm_resource_cursor cursor;
> > +	struct ttm_resource *res;
> > +	long sofar =3D 0;
>=20
> s/sofar/evicted?

That's not always the case. When used for eviction it is actually 0 if
the new allocation failed, 1 on success. It should be interpreted as
"progress towards target", so perhaps progress?

>=20
> > +	long lret;
> > +
> > +	spin_lock(&bdev->lru_lock);
> > +	ttm_resource_manager_for_each_res(man, &cursor, res) {
> > +		struct ttm_buffer_object *bo =3D res->bo;
> > +		bool bo_needs_unlock =3D false;
> > +		bool bo_locked =3D false;
> > +		int mem_type;
> > +
> > +		if (!bo || bo->resource !=3D res)
> > +			continue;
> > +
> > +		if (ttm_lru_walk_trylock(walk, bo,
> > &bo_needs_unlock))
> > +			bo_locked =3D true;
> > +		else if ((!walk->ticket) || walk->ctx->no_wait_gpu
> > ||
>=20
> Nit - (!walk->ticket) could just be !walk->ticket.

Will fix.

>=20
> > +			 walk->trylock_only)
> > +			continue;
> > +
> > +		if (!ttm_bo_get_unless_zero(bo)) {
> > +			ttm_lru_walk_unlock(bo, bo_needs_unlock);
> > +			continue;
> > +		}
> > +
>=20
> This kinda goofy pattern too, typically in code a get_unless_zero is
> done before trying to lock the object not after. Even odder here, the
> could or could not be locked depending on the outcome of
> ttm_lru_walk_trylock. This is covering individualization case? Would
> it
> make more sense to move ttm_bo_get_unless_zero before the try lock or
> is
> that to avoid a put on try lock failure + continue?

I guess this is still a remnant from the old code: ttm_bos can't be put
in atomic context, so we'd had to unlock the lru_lock to put ( which we
still do). However, without the restartable lists that we have with
this series, list traversal would have to be reset.

If we were to change the order of trylock and get_unless_zero now, we
could do that, but that would mean unnecessary refcounting and dropping
the lru_lock in the case of trylock failure.


>=20
> > +		mem_type =3D res->mem_type;
> > +		spin_unlock(&bdev->lru_lock);
> > +
> > +		lret =3D 0;
> > +		if (!bo_locked && walk->ticket)
>=20
> As above could you explain the ticket usage a bit more?
>=20
> Also you shouldn't need to check the ticket here there is !walk-
> >ticket
> above which triggers a continue.

I hope I explained sufficiently above. Please get back otherwise, I'll
remove the walk->ticket check.

>=20
> > +			lret =3D ttm_lru_walk_ticketlock(walk, bo,
> > &bo_needs_unlock);
> > +
> > +		/*
> > +		 * Note that in between the release of the lru
> > lock and the
> > +		 * ticketlock, the bo may have switched resource,
> > +		 * and also memory type, since the resource may
> > have been
> > +		 * freed and allocated again with a different
> > memory type.
> > +		 * In that case, just skip it.
> > +		 */
> > +		if (!lret && bo->resource =3D=3D res && res->mem_type
> > =3D=3D mem_type)
> > +			lret =3D walk->ops->process_bo(walk, bo);
> > +
> > +		ttm_lru_walk_unlock(bo, bo_needs_unlock);
> > +		ttm_bo_put(bo);
> > +		if (lret =3D=3D -EBUSY || lret =3D=3D -EALREADY)
> > +			lret =3D 0;
>=20
> What is usage of these error codes?
>=20
> -EALREADY means the resv is locked with the current ticket, right?
> Wouldn't we want to call process_bo in this case too?

No, then we might evict our own working set. Processing of shared bos
is handled as before with ctx->allow_res_evict.

>=20
> -EBUSY I need some help figuring out.

-EBUSY is the return of ttm_bo_wait_ctx() in case we're in no-wait-gpu
context. Like direct reclaim. If the bo is then busy, we simply skip to
the next bo. If process_bo() waits for gpu idle using the above
function, this is to catch that error code.
Should probably add that to the process_bo() docs.

>=20
> > +		sofar =3D (lret < 0) ? lret : sofar + lret;
> > +		if (sofar < 0 || sofar >=3D target)
> > +			goto out;
> > +
>=20
> Here we have dropped the BO unlock. What prevents the BO from being
> moved back to the resource we just evicted it from resulting in sofar
> not being accurate?

For eviction, the byte-count is not used, but rather the success of
allocating the new resource.

For shrinking, any process could allocate what we just shrunk, and even
so shrinking does not always mean that the memory is immediately
available so the byte-count will always be a rough estimate.

A related question is "what prevents anyone else from stealing memory
that we just evicted", and the answer to that is "Nothing... yet". The
exhaustive eviction part handles that with drm_exec keeping the bo
locks of evicted objects until we make progress. Eventually we'd hold
enough locks to block all other competitors.

Unrelated to this patch, me and Christian had a discussion on whether
to unlock those when we made progress in the sense of

a) A validation succeeded,
b) An exec submission succeeded.

/Thomas

>=20
> Matt
>=20
> > +		cond_resched();
> > +		spin_lock(&bdev->lru_lock);
> > +	}
> > +	spin_unlock(&bdev->lru_lock);
> > +out:
> > +	ttm_resource_cursor_fini(&cursor);
> > +	return sofar;
> > +}
> > diff --git a/include/drm/ttm/ttm_bo.h b/include/drm/ttm/ttm_bo.h
> > index 6ccf96c91f3a..8b032298d66e 100644
> > --- a/include/drm/ttm/ttm_bo.h
> > +++ b/include/drm/ttm/ttm_bo.h
> > @@ -190,6 +190,38 @@ struct ttm_operation_ctx {
> > =C2=A0	uint64_t bytes_moved;
> > =C2=A0};
> > =C2=A0
> > +struct ttm_lru_walk;
> > +
> > +/** struct ttm_lru_walk_ops - Operations for a LRU walk. */
> > +struct ttm_lru_walk_ops {
> > +	/**
> > +	 * process_bo - Process this bo.
> > +	 * @walk: struct ttm_lru_walk describing the walk.
> > +	 * @bo: A locked and referenced buffer object.
> > +	 *
> > +	 * Return: Negative error code on error, Number of
> > processed pages on
> > +	 * success. 0 also indicates success.
> > +	 */
> > +	long (*process_bo)(struct ttm_lru_walk *walk, struct
> > ttm_buffer_object *bo);
> > +};
> > +
> > +/**
> > + * struct ttm_lru_walk - Structure describing a LRU walk.
> > + */
> > +struct ttm_lru_walk {
> > +	/** @ops: Pointer to the ops structure. */
> > +	const struct ttm_lru_walk_ops *ops;
> > +	/** @ctx: Pointer to the struct ttm_operation_ctx. */
> > +	struct ttm_operation_ctx *ctx;
> > +	/** @ticket: The struct ww_acquire_ctx if any. */
> > +	struct ww_acquire_ctx *ticket;
> > +	/** @tryock_only: Only use trylock for locking. */
> > +	bool trylock_only;
> > +};
> > +
> > +long ttm_lru_walk_for_evict(struct ttm_lru_walk *walk, struct
> > ttm_device *bdev,
> > +			=C2=A0=C2=A0=C2=A0 struct ttm_resource_manager *man, long
> > target);
> > +
> > =C2=A0/**
> > =C2=A0 * ttm_bo_get - reference a struct ttm_buffer_object
> > =C2=A0 *
> > --=20
> > 2.44.0
> >=20

