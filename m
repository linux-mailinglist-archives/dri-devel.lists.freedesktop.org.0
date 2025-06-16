Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C6AD3ADB567
	for <lists+dri-devel@lfdr.de>; Mon, 16 Jun 2025 17:30:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 566AC10E400;
	Mon, 16 Jun 2025 15:29:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lbe9YrfN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB49310E401;
 Mon, 16 Jun 2025 15:29:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750087798; x=1781623798;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=+J8nSOb7hRk+Jm0SViXxsR1XYri2ftqnKkmtO6ruwRk=;
 b=lbe9YrfN5/cQ5XgqUW3TW1bvTzU/8YhPj6MCzAEqn/WJNT1NAi9+iu4S
 T2FLw7biP6ypbQU8q94NTFedQJO9hGubKgDp9+OypqJa/Wkm9WC11mBDw
 y1ULvIUIz2c/37S6Mz7JiWQoyRd0uuOkG1ZoK7rjIMkHs89h+yfIrvheK
 k3hj2TbNNMeR9EtLpplfAlkfHjGtn+rA5zFMEvPTKe4lDNpIxthtM28rl
 ++BDugY4IIa7ESWHuz5K6CNsjWi6Y+JgOA81febkLt8Gl3H1ITqqqvSZW
 lRF/8G7aQWUsRTmNsMOEpyL83LBAQqbBe93njlaBGppI5+epl6Bt5lv5B Q==;
X-CSE-ConnectionGUID: XaOln6eNT+ifA+i4LKaJ7Q==
X-CSE-MsgGUID: SVU9+Pg4SY2YZdAUzL4YVA==
X-IronPort-AV: E=McAfee;i="6800,10657,11465"; a="52379155"
X-IronPort-AV: E=Sophos;i="6.16,241,1744095600"; d="scan'208";a="52379155"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2025 08:29:56 -0700
X-CSE-ConnectionGUID: 0RDwc8vmQc2JgHty08Td2w==
X-CSE-MsgGUID: pii/D6V/QdWtmMrEQnkSRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,241,1744095600"; d="scan'208";a="148971453"
Received: from abityuts-desk.ger.corp.intel.com (HELO [10.245.244.241])
 ([10.245.244.241])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2025 08:29:54 -0700
Message-ID: <110cc49ef761d014b7cb9285c9d60d1a0680a3cb.camel@linux.intel.com>
Subject: Re: [PATCH 3/3] drm/ttm, drm_xe, Implement ttm_lru_walk_for_evict()
 using the guarded LRU iteration
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, 
 intel-xe@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, airlied@gmail.com, Matthew Brost
 <matthew.brost@intel.com>, Matthew Auld <matthew.auld@intel.com>
Date: Mon, 16 Jun 2025 17:29:51 +0200
In-Reply-To: <04728a48-d755-4839-86b6-f4214cc2f7b5@amd.com>
References: <20250613151824.178650-1-thomas.hellstrom@linux.intel.com>
 <20250613151824.178650-4-thomas.hellstrom@linux.intel.com>
 <04728a48-d755-4839-86b6-f4214cc2f7b5@amd.com>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
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

On Mon, 2025-06-16 at 15:23 +0200, Christian K=C3=B6nig wrote:
> On 6/13/25 17:18, Thomas Hellstr=C3=B6m wrote:
> > To avoid duplicating the tricky bo locking implementation,
> > Implement ttm_lru_walk_for_evict() using the guarded bo LRU
> > iteration.
> >=20
> > To facilitate this, support ticketlocking from the guarded bo LRU
> > iteration.
>=20
> That looks mostly identical to a patch I have in my drm_exec branch.
>=20
> A few questions below.
>=20
> >=20
> > Signed-off-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> > ---
> > =C2=A0drivers/gpu/drm/ttm/ttm_bo_util.c | 166 ++++++++++++-------------=
-
> > ----
> > =C2=A0drivers/gpu/drm/xe/xe_shrinker.c=C2=A0 |=C2=A0=C2=A0 7 +-
> > =C2=A0include/drm/ttm/ttm_bo.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 9 +-
> > =C2=A03 files changed, 76 insertions(+), 106 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c
> > b/drivers/gpu/drm/ttm/ttm_bo_util.c
> > index 62b76abac578..9bc17ea1adb2 100644
> > --- a/drivers/gpu/drm/ttm/ttm_bo_util.c
> > +++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
> > @@ -821,12 +821,6 @@ static int ttm_lru_walk_ticketlock(struct
> > ttm_lru_walk_arg *arg,
> > =C2=A0	return ret;
> > =C2=A0}
> > =C2=A0
> > -static void ttm_lru_walk_unlock(struct ttm_buffer_object *bo, bool
> > locked)
> > -{
> > -	if (locked)
> > -		dma_resv_unlock(bo->base.resv);
> > -}
> > -
> > =C2=A0/**
> > =C2=A0 * ttm_lru_walk_for_evict() - Perform a LRU list walk, with
> > actions taken on
> > =C2=A0 * valid items.
> > @@ -861,64 +855,21 @@ static void ttm_lru_walk_unlock(struct
> > ttm_buffer_object *bo, bool locked)
> > =C2=A0s64 ttm_lru_walk_for_evict(struct ttm_lru_walk *walk, struct
> > ttm_device *bdev,
> > =C2=A0			=C2=A0=C2=A0 struct ttm_resource_manager *man, s64
> > target)
> > =C2=A0{
> > -	struct ttm_resource_cursor cursor;
> > -	struct ttm_resource *res;
> > +	struct ttm_bo_lru_cursor cursor;
> > +	struct ttm_buffer_object *bo;
> > =C2=A0	s64 progress =3D 0;
> > =C2=A0	s64 lret;
> > =C2=A0
> > -	spin_lock(&bdev->lru_lock);
> > -	ttm_resource_cursor_init(&cursor, man);
> > -	ttm_resource_manager_for_each_res(&cursor, res) {
> > -		struct ttm_buffer_object *bo =3D res->bo;
> > -		bool bo_needs_unlock =3D false;
> > -		bool bo_locked =3D false;
> > -		int mem_type;
> > -
> > -		/*
> > -		 * Attempt a trylock before taking a reference on
> > the bo,
> > -		 * since if we do it the other way around, and the
> > trylock fails,
> > -		 * we need to drop the lru lock to put the bo.
> > -		 */
> > -		if (ttm_lru_walk_trylock(&walk->arg, bo,
> > &bo_needs_unlock))
> > -			bo_locked =3D true;
> > -		else if (!walk->arg.ticket || walk->arg.ctx-
> > >no_wait_gpu ||
> > -			 walk->arg.trylock_only)
> > -			continue;
> > -
> > -		if (!ttm_bo_get_unless_zero(bo)) {
> > -			ttm_lru_walk_unlock(bo, bo_needs_unlock);
> > -			continue;
> > -		}
> > -
> > -		mem_type =3D res->mem_type;
> > -		spin_unlock(&bdev->lru_lock);
> > -
> > -		lret =3D 0;
> > -		if (!bo_locked)
> > -			lret =3D ttm_lru_walk_ticketlock(&walk->arg,
> > bo, &bo_needs_unlock);
> > -
> > -		/*
> > -		 * Note that in between the release of the lru
> > lock and the
> > -		 * ticketlock, the bo may have switched resource,
> > -		 * and also memory type, since the resource may
> > have been
> > -		 * freed and allocated again with a different
> > memory type.
> > -		 * In that case, just skip it.
> > -		 */
> > -		if (!lret && bo->resource && bo->resource-
> > >mem_type =3D=3D mem_type)
> > -			lret =3D walk->ops->process_bo(walk, bo);
> > -
> > -		ttm_lru_walk_unlock(bo, bo_needs_unlock);
> > -		ttm_bo_put(bo);
> > +	ttm_bo_lru_for_each_reserved_guarded(&cursor, man, &walk-
> > >arg, bo) {
> > +		lret =3D walk->ops->process_bo(walk, bo);
> > =C2=A0		if (lret =3D=3D -EBUSY || lret =3D=3D -EALREADY)
> > =C2=A0			lret =3D 0;
> > =C2=A0		progress =3D (lret < 0) ? lret : progress + lret;
> > -
> > -		spin_lock(&bdev->lru_lock);
> > =C2=A0		if (progress < 0 || progress >=3D target)
> > =C2=A0			break;
> > =C2=A0	}
> > -	ttm_resource_cursor_fini(&cursor);
> > -	spin_unlock(&bdev->lru_lock);
> > +	if (IS_ERR(bo))
> > +		return PTR_ERR(bo);
> > =C2=A0
> > =C2=A0	return progress;
> > =C2=A0}
> > @@ -958,10 +909,7 @@ EXPORT_SYMBOL(ttm_bo_lru_cursor_fini);
> > =C2=A0 * @man: The ttm resource_manager whose LRU lists to iterate over=
.
> > =C2=A0 * @arg: The ttm_lru_walk_arg to govern the walk.
> > =C2=A0 *
> > - * Initialize a struct ttm_bo_lru_cursor. Currently only
> > trylocking
> > - * or prelocked buffer objects are available as detailed by
> > - * @arg->ctx.resv and @arg->ctx.allow_res_evict. Ticketlocking is
> > not
> > - * supported.
> > + * Initialize a struct ttm_bo_lru_cursor.
> > =C2=A0 *
> > =C2=A0 * Return: Pointer to @curs. The function does not fail.
> > =C2=A0 */
> > @@ -979,21 +927,65 @@ ttm_bo_lru_cursor_init(struct
> > ttm_bo_lru_cursor *curs,
> > =C2=A0EXPORT_SYMBOL(ttm_bo_lru_cursor_init);
> > =C2=A0
> > =C2=A0static struct ttm_buffer_object *
> > -ttm_bo_from_res_reserved(struct ttm_resource *res, struct
> > ttm_bo_lru_cursor *curs)
> > +__ttm_bo_lru_cursor_next(struct ttm_bo_lru_cursor *curs, bool
> > first)
>=20
> Giving first as bool parameter here looks really ugly. Isn't there
> any other way to do this?

I agree. The previous way of doing this with a bo_from_res() isn't a
good fit since if ticketlocking, we'd like to return without the
spinlock held, and be called with the spinlock held. That's really
confusing both to readers and static analyzers so rather avoided.

We could look at curs->bo and see if it's NULL, but then I think the
bool argument is more readable. But if you have a better idea, I'm of
course open to changing this.

>=20
> > =C2=A0{
> > -	struct ttm_buffer_object *bo =3D res->bo;
> > +	spinlock_t *lru_lock =3D &curs->res_curs.man->bdev-
> > >lru_lock;
> > +	struct ttm_resource *res =3D NULL;
> > +	struct ttm_buffer_object *bo;
> > +	struct ttm_lru_walk_arg *arg =3D curs->arg;
> > =C2=A0
> > -	if (!ttm_lru_walk_trylock(curs->arg, bo, &curs-
> > >needs_unlock))
> > -		return NULL;
> > +	ttm_bo_lru_cursor_cleanup_bo(curs);
> > =C2=A0
> > -	if (!ttm_bo_get_unless_zero(bo)) {
> > -		if (curs->needs_unlock)
> > -			dma_resv_unlock(bo->base.resv);
> > -		return NULL;
> > +	spin_lock(lru_lock);
> > +	for (;;) {
> > +		int mem_type, ret;
> > +		bool bo_locked =3D false;
> > +
> > +		if (first) {
> > +			res =3D ttm_resource_manager_first(&curs-
> > >res_curs);
> > +			first =3D false;
> > +		} else {
> > +			res =3D ttm_resource_manager_next(&curs-
> > >res_curs);
> > +		}
> > +		if (!res)
> > +			break;
> > +
> > +		bo =3D res->bo;
> > +		if (ttm_lru_walk_trylock(arg, bo, &curs-
> > >needs_unlock))
>=20
> Could/should we move needs_unlock into arg as well?

They are different in that arg is state that governs the whole loop but
needs_unlock is local to a single iteration. We could of course pass
the cursor to the various locking functions to eliminate one argument
now that walk_for_evict() also uses the cursor.

Thoughts?
/Thomas



>=20
> Apart from that looks good to me.
>=20
> Regards,
> Christian.
>=20
> > +			bo_locked =3D true;
> > +		else if (!arg->ticket || arg->ctx->no_wait_gpu ||
> > arg->trylock_only)
> > +			continue;
> > +
> > +		if (!ttm_bo_get_unless_zero(bo)) {
> > +			if (curs->needs_unlock)
> > +				dma_resv_unlock(bo->base.resv);
> > +			continue;
> > +		}
> > +
> > +		mem_type =3D res->mem_type;
> > +		spin_unlock(lru_lock);
> > +		if (!bo_locked)
> > +			ret =3D ttm_lru_walk_ticketlock(arg, bo,
> > &curs->needs_unlock);
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
> > +		curs->bo =3D bo;
> > +		if (!ret && bo->resource && bo->resource->mem_type
> > =3D=3D mem_type)
> > +			return bo;
> > +
> > +		ttm_bo_lru_cursor_cleanup_bo(curs);
> > +		if (ret)
> > +			return ERR_PTR(ret);
> > +
> > +		spin_lock(lru_lock);
> > =C2=A0	}
> > =C2=A0
> > -	curs->bo =3D bo;
> > -	return bo;
> > +	spin_unlock(lru_lock);
> > +	return res ? bo : NULL;
> > =C2=A0}
> > =C2=A0
> > =C2=A0/**
> > @@ -1007,25 +999,7 @@ ttm_bo_from_res_reserved(struct ttm_resource
> > *res, struct ttm_bo_lru_cursor *cur
> > =C2=A0 */
> > =C2=A0struct ttm_buffer_object *ttm_bo_lru_cursor_next(struct
> > ttm_bo_lru_cursor *curs)
> > =C2=A0{
> > -	spinlock_t *lru_lock =3D &curs->res_curs.man->bdev-
> > >lru_lock;
> > -	struct ttm_resource *res =3D NULL;
> > -	struct ttm_buffer_object *bo;
> > -
> > -	ttm_bo_lru_cursor_cleanup_bo(curs);
> > -
> > -	spin_lock(lru_lock);
> > -	for (;;) {
> > -		res =3D ttm_resource_manager_next(&curs->res_curs);
> > -		if (!res)
> > -			break;
> > -
> > -		bo =3D ttm_bo_from_res_reserved(res, curs);
> > -		if (bo)
> > -			break;
> > -	}
> > -
> > -	spin_unlock(lru_lock);
> > -	return res ? bo : NULL;
> > +	return __ttm_bo_lru_cursor_next(curs, false);
> > =C2=A0}
> > =C2=A0EXPORT_SYMBOL(ttm_bo_lru_cursor_next);
> > =C2=A0
> > @@ -1039,21 +1013,7 @@ EXPORT_SYMBOL(ttm_bo_lru_cursor_next);
> > =C2=A0 */
> > =C2=A0struct ttm_buffer_object *ttm_bo_lru_cursor_first(struct
> > ttm_bo_lru_cursor *curs)
> > =C2=A0{
> > -	spinlock_t *lru_lock =3D &curs->res_curs.man->bdev-
> > >lru_lock;
> > -	struct ttm_buffer_object *bo;
> > -	struct ttm_resource *res;
> > -
> > -	spin_lock(lru_lock);
> > -	res =3D ttm_resource_manager_first(&curs->res_curs);
> > -	if (!res) {
> > -		spin_unlock(lru_lock);
> > -		return NULL;
> > -	}
> > -
> > -	bo =3D ttm_bo_from_res_reserved(res, curs);
> > -	spin_unlock(lru_lock);
> > -
> > -	return bo ? bo : ttm_bo_lru_cursor_next(curs);
> > +	return __ttm_bo_lru_cursor_next(curs, true);
> > =C2=A0}
> > =C2=A0EXPORT_SYMBOL(ttm_bo_lru_cursor_first);
> > =C2=A0
> > diff --git a/drivers/gpu/drm/xe/xe_shrinker.c
> > b/drivers/gpu/drm/xe/xe_shrinker.c
> > index f8a1129da2c3..1c3c04d52f55 100644
> > --- a/drivers/gpu/drm/xe/xe_shrinker.c
> > +++ b/drivers/gpu/drm/xe/xe_shrinker.c
> > @@ -66,7 +66,10 @@ static s64 xe_shrinker_walk(struct xe_device
> > *xe,
> > =C2=A0		struct ttm_resource_manager *man =3D
> > ttm_manager_type(&xe->ttm, mem_type);
> > =C2=A0		struct ttm_bo_lru_cursor curs;
> > =C2=A0		struct ttm_buffer_object *ttm_bo;
> > -		struct ttm_lru_walk_arg arg =3D {.ctx =3D ctx};
> > +		struct ttm_lru_walk_arg arg =3D {
> > +			.ctx =3D ctx,
> > +			.trylock_only =3D true,
> > +		};
> > =C2=A0
> > =C2=A0		if (!man || !man->use_tt)
> > =C2=A0			continue;
> > @@ -83,6 +86,8 @@ static s64 xe_shrinker_walk(struct xe_device *xe,
> > =C2=A0			if (*scanned >=3D to_scan)
> > =C2=A0				break;
> > =C2=A0		}
> > +		/* Trylocks should never error, just fail. */
> > +		xe_assert(xe, !IS_ERR(ttm_bo));
> > =C2=A0	}
> > =C2=A0
> > =C2=A0	return freed;
> > diff --git a/include/drm/ttm/ttm_bo.h b/include/drm/ttm/ttm_bo.h
> > index 8f04fa48b332..d3a85d76aaff 100644
> > --- a/include/drm/ttm/ttm_bo.h
> > +++ b/include/drm/ttm/ttm_bo.h
> > @@ -529,10 +529,15 @@
> > class_ttm_bo_lru_cursor_lock_ptr(class_ttm_bo_lru_cursor_t *_T)
> > =C2=A0 * up at looping termination, even if terminated prematurely by,
> > for
> > =C2=A0 * example a return or break statement. Exiting the loop will als=
o
> > unlock
> > =C2=A0 * (if needed) and unreference @_bo.
> > + *
> > + * Return: If locking of a bo returns an error, then iteration is
> > terminated
> > + * and @_bo is set to a corresponding error pointer. It's illegal
> > to
> > + * dereference @_bo after loop exit.
> > =C2=A0 */
> > =C2=A0#define ttm_bo_lru_for_each_reserved_guarded(_cursor, _man, _arg,
> > _bo)	\
> > =C2=A0	scoped_guard(ttm_bo_lru_cursor, _cursor, _man,
> > _arg)		\
> > -		for ((_bo) =3D ttm_bo_lru_cursor_first(_cursor);
> > (_bo);	\
> > -		=C2=A0=C2=A0=C2=A0=C2=A0 (_bo) =3D ttm_bo_lru_cursor_next(_cursor))
> > +		for ((_bo) =3D
> > ttm_bo_lru_cursor_first(_cursor);		\
> > +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> > !IS_ERR_OR_NULL(_bo);				\
> > +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (_bo) =3D ttm_bo_lru_cursor_nex=
t(_cursor))
> > =C2=A0
> > =C2=A0#endif
>=20

