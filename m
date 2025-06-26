Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A28BAE9E06
	for <lists+dri-devel@lfdr.de>; Thu, 26 Jun 2025 15:00:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CE5110E286;
	Thu, 26 Jun 2025 13:00:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DN5RB1E2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4020810E029;
 Thu, 26 Jun 2025 13:00:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750942812; x=1782478812;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=/UEIK94lwgTKkWECjY02zamd5rtGr6ybdxI6oAfIcLg=;
 b=DN5RB1E2Ugwa6xxZsHFyABYCunsk4UBmWh8Bfuqw7IAWEIT0QAJsDKcy
 4ppn3EaqOITAbo5k3OmtS3J8GZummZIP9xu9Sa7PQ9Wjrs/WnBotXgdpH
 LI4aJjzMs18rYSKeTbGlbHp4BjjDFQ1o00ZlkrBS744ZAjUhYnHUJAFbJ
 QLtZ0P66m04hBA99TToph7xGh6FeA72/f/UShwupV+eB4KR1MXVBsdFir
 nS211NAvGzufIReQvTjdDWAyzbGQI9q84m6nH0b7yJR1Y8d4x8vqqpYRu
 brD7U85J2cP5carYgwQrWL8ORzZi/a/eTUED9oZmDbOldHWEff7EOEuCm g==;
X-CSE-ConnectionGUID: v6CvzLo5ThyKyS6hgiXXjg==
X-CSE-MsgGUID: MyHTvkSYTom5rNxdadsyuQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11475"; a="57043200"
X-IronPort-AV: E=Sophos;i="6.16,267,1744095600"; d="scan'208";a="57043200"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2025 06:00:12 -0700
X-CSE-ConnectionGUID: idJXRswiSD+pD0AQa8yo8A==
X-CSE-MsgGUID: NbTKk1cvQ8ObWzM6lspmrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,267,1744095600"; d="scan'208";a="183402744"
Received: from johunt-mobl9.ger.corp.intel.com (HELO [10.245.244.148])
 ([10.245.244.148])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2025 06:00:10 -0700
Message-ID: <109aaf5732ba0beedfcb3d58267c2f05489da2e9.camel@linux.intel.com>
Subject: Re: [PATCH v2 3/3] drm/ttm, drm_xe, Implement
 ttm_lru_walk_for_evict() using the guarded LRU iteration
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, 
 intel-xe@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, airlied@gmail.com, Matthew Brost
 <matthew.brost@intel.com>, Matthew Auld <matthew.auld@intel.com>
Date: Thu, 26 Jun 2025 15:00:07 +0200
In-Reply-To: <bbdc49f6-313f-42df-a531-d573b247820c@amd.com>
References: <20250623155313.4901-1-thomas.hellstrom@linux.intel.com>
 <20250623155313.4901-4-thomas.hellstrom@linux.intel.com>
 <bbdc49f6-313f-42df-a531-d573b247820c@amd.com>
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

On Thu, 2025-06-26 at 13:06 +0200, Christian K=C3=B6nig wrote:
> On 23.06.25 17:53, Thomas Hellstr=C3=B6m wrote:
> > To avoid duplicating the tricky bo locking implementation,
> > Implement ttm_lru_walk_for_evict() using the guarded bo LRU
> > iteration.
> >=20
> > To facilitate this, support ticketlocking from the guarded bo LRU
> > iteration.
> >=20
> > v2:
> > - Clean up some static function interfaces (Christian K=C3=B6nig)
> > - Fix Handling -EALREADY from ticketlocking in the loop by
> > =C2=A0 skipping to the next item. (Intel CI)
> >=20
> > Signed-off-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
>=20
> I have a cold at the moment so I might have missed something, but
> still feel free to add Reviewed-by: Christian K=C3=B6nig
> <christian.koenig@amd.com>.

Thanks, I'll likely be merging this through drm-misc-next.
/Thomas


>=20
> > ---
> > =C2=A0drivers/gpu/drm/ttm/ttm_bo_util.c | 188 ++++++++++++-------------=
-
> > ----
> > =C2=A0drivers/gpu/drm/xe/xe_shrinker.c=C2=A0 |=C2=A0=C2=A0 7 +-
> > =C2=A0include/drm/ttm/ttm_bo.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 9 +-
> > =C2=A03 files changed, 88 insertions(+), 116 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c
> > b/drivers/gpu/drm/ttm/ttm_bo_util.c
> > index 6de1f0c432c2..250675d56b1c 100644
> > --- a/drivers/gpu/drm/ttm/ttm_bo_util.c
> > +++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
> > @@ -773,16 +773,15 @@ int ttm_bo_pipeline_gutting(struct
> > ttm_buffer_object *bo)
> > =C2=A0	return ret;
> > =C2=A0}
> > =C2=A0
> > -static bool ttm_lru_walk_trylock(struct ttm_lru_walk_arg *arg,
> > -				 struct ttm_buffer_object *bo,
> > -				 bool *needs_unlock)
> > +static bool ttm_lru_walk_trylock(struct ttm_bo_lru_cursor *curs,
> > +				 struct ttm_buffer_object *bo)
> > =C2=A0{
> > -	struct ttm_operation_ctx *ctx =3D arg->ctx;
> > +	struct ttm_operation_ctx *ctx =3D curs->arg->ctx;
> > =C2=A0
> > -	*needs_unlock =3D false;
> > +	curs->needs_unlock =3D false;
> > =C2=A0
> > =C2=A0	if (dma_resv_trylock(bo->base.resv)) {
> > -		*needs_unlock =3D true;
> > +		curs->needs_unlock =3D true;
> > =C2=A0		return true;
> > =C2=A0	}
> > =C2=A0
> > @@ -794,10 +793,10 @@ static bool ttm_lru_walk_trylock(struct
> > ttm_lru_walk_arg *arg,
> > =C2=A0	return false;
> > =C2=A0}
> > =C2=A0
> > -static int ttm_lru_walk_ticketlock(struct ttm_lru_walk_arg *arg,
> > -				=C2=A0=C2=A0 struct ttm_buffer_object *bo,
> > -				=C2=A0=C2=A0 bool *needs_unlock)
> > +static int ttm_lru_walk_ticketlock(struct ttm_bo_lru_cursor *curs,
> > +				=C2=A0=C2=A0 struct ttm_buffer_object *bo)
> > =C2=A0{
> > +	struct ttm_lru_walk_arg *arg =3D curs->arg;
> > =C2=A0	struct dma_resv *resv =3D bo->base.resv;
> > =C2=A0	int ret;
> > =C2=A0
> > @@ -807,7 +806,7 @@ static int ttm_lru_walk_ticketlock(struct
> > ttm_lru_walk_arg *arg,
> > =C2=A0		ret =3D dma_resv_lock(resv, arg->ticket);
> > =C2=A0
> > =C2=A0	if (!ret) {
> > -		*needs_unlock =3D true;
> > +		curs->needs_unlock =3D true;
> > =C2=A0		/*
> > =C2=A0		 * Only a single ticketlock per loop. Ticketlocks
> > are prone
> > =C2=A0		 * to return -EDEADLK causing the eviction to
> > fail, so
> > @@ -823,12 +822,6 @@ static int ttm_lru_walk_ticketlock(struct
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
> > @@ -863,64 +856,21 @@ static void ttm_lru_walk_unlock(struct
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
> > @@ -960,10 +910,7 @@ EXPORT_SYMBOL(ttm_bo_lru_cursor_fini);
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
> > @@ -981,21 +928,67 @@ ttm_bo_lru_cursor_init(struct
> > ttm_bo_lru_cursor *curs,
> > =C2=A0EXPORT_SYMBOL(ttm_bo_lru_cursor_init);
> > =C2=A0
> > =C2=A0static struct ttm_buffer_object *
> > -ttm_bo_from_res_reserved(struct ttm_resource *res, struct
> > ttm_bo_lru_cursor *curs)
> > +__ttm_bo_lru_cursor_next(struct ttm_bo_lru_cursor *curs)
> > =C2=A0{
> > -	struct ttm_buffer_object *bo =3D res->bo;
> > +	spinlock_t *lru_lock =3D &curs->res_curs.man->bdev-
> > >lru_lock;
> > +	struct ttm_resource *res =3D NULL;
> > +	struct ttm_buffer_object *bo;
> > +	struct ttm_lru_walk_arg *arg =3D curs->arg;
> > +	bool first =3D !curs->bo;
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
> > +		int mem_type, ret =3D 0;
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
> > +		if (ttm_lru_walk_trylock(curs, bo))
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
> > +			ret =3D ttm_lru_walk_ticketlock(curs, bo);
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
> > +		curs->bo =3D bo;
> > +		if (!ret && bo->resource && bo->resource->mem_type
> > =3D=3D mem_type)
> > +			return bo;
> > +
> > +		ttm_bo_lru_cursor_cleanup_bo(curs);
> > +		if (ret && ret !=3D -EALREADY)
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
> > @@ -1009,25 +1002,7 @@ ttm_bo_from_res_reserved(struct ttm_resource
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
> > +	return __ttm_bo_lru_cursor_next(curs);
> > =C2=A0}
> > =C2=A0EXPORT_SYMBOL(ttm_bo_lru_cursor_next);
> > =C2=A0
> > @@ -1041,21 +1016,8 @@ EXPORT_SYMBOL(ttm_bo_lru_cursor_next);
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
> > +	ttm_bo_lru_cursor_cleanup_bo(curs);
> > +	return __ttm_bo_lru_cursor_next(curs);
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
> > index ab9a6b343a53..894ff7ccd68e 100644
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

