Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 642C99697EC
	for <lists+dri-devel@lfdr.de>; Tue,  3 Sep 2024 10:55:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E69C10E43E;
	Tue,  3 Sep 2024 08:55:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SOqJcUof";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A44D510E43E;
 Tue,  3 Sep 2024 08:55:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725353715; x=1756889715;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=Renq7OreZ21gnGDtMnHFRG/gCdwtb1FkzgJtymQzRzg=;
 b=SOqJcUofEzOXNt8NUOVMdX6aoOX493ppVg2oDNUIwvpF2LCYpe68nO2r
 u8j+uPciP9F3KrhQcnb1AX/Bm278T6rsgSwq7NVypd+Vpt+b96OxEt866
 ljDHAL66PvP0v7/U87R2GnMupF4T4DSNdrI5cIDEMVfsXlRoJvG4PmTVD
 rwlBlqrAfDuICc3ySns2tPbBi9orRJO/8dXIih0eEcvtHXiA4e2JiS9qD
 QcnJHcMx/5Jkd9yJ10qgh3ywIE87BZ9CxNP3dkyVEbl6IX+c3J3+s3bvr
 fI0X05dE29eQ7K6oD2hpg/XpzLhX8JZfeiMr8AvPbtB+3X+2fDmxQdjFX w==;
X-CSE-ConnectionGUID: fMnR97n/QtmLf3s3LUiKLA==
X-CSE-MsgGUID: TQfAOon1REGncWQMnn+BMw==
X-IronPort-AV: E=McAfee;i="6700,10204,11183"; a="34546714"
X-IronPort-AV: E=Sophos;i="6.10,198,1719903600"; d="scan'208";a="34546714"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2024 01:55:15 -0700
X-CSE-ConnectionGUID: XgifwZ6MQEuFBF+gLt5p0A==
X-CSE-MsgGUID: eliWrn/8TmK9RXkQAy13Sw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,198,1719903600"; d="scan'208";a="65197664"
Received: from dhhellew-desk2.ger.corp.intel.com.ger.corp.intel.com (HELO
 [10.245.244.199]) ([10.245.244.199])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2024 01:55:14 -0700
Message-ID: <90c52e4d320e5fd322644309c8f04bccae561955.camel@linux.intel.com>
Subject: Re: [PATCH 1/2] drm/ttm: Move swapped objects off the manager's LRU
 list
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, 
 intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>, dri-devel@lists.freedesktop.org
Date: Tue, 03 Sep 2024 10:55:11 +0200
In-Reply-To: <a06e14d8-b9e5-44bc-bac5-42cb7d7e658e@amd.com>
References: <20240902154159.78871-1-thomas.hellstrom@linux.intel.com>
 <20240902154159.78871-2-thomas.hellstrom@linux.intel.com>
 <a06e14d8-b9e5-44bc-bac5-42cb7d7e658e@amd.com>
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

Hi, Christian,

Thanks for reviewing.

On Tue, 2024-09-03 at 09:49 +0200, Christian K=C3=B6nig wrote:
> Am 02.09.24 um 17:41 schrieb Thomas Hellstr=C3=B6m:
> > Resources of swapped objects remains on the TTM_PL_SYSTEM manager's
> > LRU list, which is bad for the LRU walk efficiency.
> >=20
> > Rename the device-wide "pinned" list to "unevictable" and move
> > also resources of swapped-out objects to that list.
> >=20
> > An alternative would be to create an "UNEVICTABLE" priority to
> > be able to keep the pinned- and swapped objects on their
> > respective manager's LRU without affecting the LRU walk efficiency.
> >=20
> > Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> > Cc: Matthew Brost <matthew.brost@intel.com>
> > Cc: <dri-devel@lists.freedesktop.org>
> > Signed-off-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> > ---
> > =C2=A0 drivers/gpu/drm/i915/gem/i915_gem_ttm.c=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 |=C2=A0 2 +-
> > =C2=A0 drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c |=C2=A0 2 +-
> > =C2=A0 drivers/gpu/drm/i915/gem/i915_gem_ttm_pm.c=C2=A0=C2=A0 |=C2=A0 4=
 +-
> > =C2=A0 drivers/gpu/drm/ttm/ttm_bo.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 55
> > +++++++++++++++++++-
> > =C2=A0 drivers/gpu/drm/ttm/ttm_bo_util.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 6 +--
> > =C2=A0 drivers/gpu/drm/ttm/ttm_bo_vm.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 2 +-
> > =C2=A0 drivers/gpu/drm/ttm/ttm_device.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 4 +-
> > =C2=A0 drivers/gpu/drm/ttm/ttm_resource.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 9 ++--
> > =C2=A0 drivers/gpu/drm/ttm/ttm_tt.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 1 -
> > =C2=A0 drivers/gpu/drm/xe/xe_bo.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=
=C2=A0 4 +-
> > =C2=A0 include/drm/ttm/ttm_bo.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 |=C2=A0 2 +
> > =C2=A0 include/drm/ttm/ttm_device.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 5 +-
> > =C2=A0 include/drm/ttm/ttm_tt.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 |=C2=A0 5 ++
> > =C2=A0 13 files changed, 81 insertions(+), 20 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> > b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> > index 5c72462d1f57..7de284766f82 100644
> > --- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> > +++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> > @@ -808,7 +808,7 @@ static int __i915_ttm_get_pages(struct
> > drm_i915_gem_object *obj,
> > =C2=A0=C2=A0	}
> > =C2=A0=20
> > =C2=A0=C2=A0	if (bo->ttm && !ttm_tt_is_populated(bo->ttm)) {
> > -		ret =3D ttm_tt_populate(bo->bdev, bo->ttm, &ctx);
> > +		ret =3D ttm_bo_populate(bo, &ctx);
> > =C2=A0=C2=A0		if (ret)
> > =C2=A0=C2=A0			return ret;
> > =C2=A0=20
> > diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c
> > b/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c
> > index 03b00a03a634..041dab543b78 100644
> > --- a/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c
> > +++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c
> > @@ -624,7 +624,7 @@ int i915_ttm_move(struct ttm_buffer_object *bo,
> > bool evict,
> > =C2=A0=20
> > =C2=A0=C2=A0	/* Populate ttm with pages if needed. Typically system
> > memory. */
> > =C2=A0=C2=A0	if (ttm && (dst_man->use_tt || (ttm->page_flags &
> > TTM_TT_FLAG_SWAPPED))) {
> > -		ret =3D ttm_tt_populate(bo->bdev, ttm, ctx);
> > +		ret =3D ttm_bo_populate(bo, ctx);
> > =C2=A0=C2=A0		if (ret)
> > =C2=A0=C2=A0			return ret;
> > =C2=A0=C2=A0	}
> > diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm_pm.c
> > b/drivers/gpu/drm/i915/gem/i915_gem_ttm_pm.c
> > index ad649523d5e0..61596cecce4d 100644
> > --- a/drivers/gpu/drm/i915/gem/i915_gem_ttm_pm.c
> > +++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm_pm.c
> > @@ -90,7 +90,7 @@ static int i915_ttm_backup(struct
> > i915_gem_apply_to_region *apply,
> > =C2=A0=C2=A0		goto out_no_lock;
> > =C2=A0=20
> > =C2=A0=C2=A0	backup_bo =3D i915_gem_to_ttm(backup);
> > -	err =3D ttm_tt_populate(backup_bo->bdev, backup_bo->ttm,
> > &ctx);
> > +	err =3D ttm_bo_populate(backup_bo, &ctx);
> > =C2=A0=C2=A0	if (err)
> > =C2=A0=C2=A0		goto out_no_populate;
> > =C2=A0=20
> > @@ -189,7 +189,7 @@ static int i915_ttm_restore(struct
> > i915_gem_apply_to_region *apply,
> > =C2=A0=C2=A0	if (!backup_bo->resource)
> > =C2=A0=C2=A0		err =3D ttm_bo_validate(backup_bo,
> > i915_ttm_sys_placement(), &ctx);
> > =C2=A0=C2=A0	if (!err)
> > -		err =3D ttm_tt_populate(backup_bo->bdev, backup_bo-
> > >ttm, &ctx);
> > +		err =3D ttm_bo_populate(backup_bo, &ctx);
> > =C2=A0=C2=A0	if (!err) {
> > =C2=A0=C2=A0		err =3D i915_gem_obj_copy_ttm(obj, backup, pm_apply-
> > >allow_gpu,
> > =C2=A0=C2=A0					=C2=A0=C2=A0=C2=A0 false);
> > diff --git a/drivers/gpu/drm/ttm/ttm_bo.c
> > b/drivers/gpu/drm/ttm/ttm_bo.c
> > index 320592435252..d244566a7e48 100644
> > --- a/drivers/gpu/drm/ttm/ttm_bo.c
> > +++ b/drivers/gpu/drm/ttm/ttm_bo.c
> > @@ -139,7 +139,7 @@ static int ttm_bo_handle_move_mem(struct
> > ttm_buffer_object *bo,
> > =C2=A0=C2=A0			goto out_err;
> > =C2=A0=20
> > =C2=A0=C2=A0		if (mem->mem_type !=3D TTM_PL_SYSTEM) {
> > -			ret =3D ttm_tt_populate(bo->bdev, bo->ttm,
> > ctx);
> > +			ret =3D ttm_bo_populate(bo, ctx);
> > =C2=A0=C2=A0			if (ret)
> > =C2=A0=C2=A0				goto out_err;
> > =C2=A0=C2=A0		}
> > @@ -1131,6 +1131,13 @@ ttm_bo_swapout_cb(struct ttm_lru_walk *walk,
> > struct ttm_buffer_object *bo)
> > =C2=A0=C2=A0	if (ttm_tt_is_populated(bo->ttm))
> > =C2=A0=C2=A0		ret =3D ttm_tt_swapout(bo->bdev, bo->ttm,
> > swapout_walk->gfp_flags);
> > =C2=A0=20
> > +	if (ttm_tt_is_swapped(bo->ttm)) {
> > +		spin_lock(&bo->bdev->lru_lock);
> > +		ttm_resource_del_bulk_move(bo->resource, bo);
> > +		ttm_resource_move_to_lru_tail(bo->resource);
> > +		spin_unlock(&bo->bdev->lru_lock);
> > +	}
> > +
> > =C2=A0 out:
> > =C2=A0=C2=A0	/* Consider -ENOMEM and -ENOSPC non-fatal. */
> > =C2=A0=C2=A0	if (ret =3D=3D -ENOMEM || ret =3D=3D -ENOSPC)
> > @@ -1180,3 +1187,49 @@ void ttm_bo_tt_destroy(struct
> > ttm_buffer_object *bo)
> > =C2=A0=C2=A0	ttm_tt_destroy(bo->bdev, bo->ttm);
> > =C2=A0=C2=A0	bo->ttm =3D NULL;
> > =C2=A0 }
> > +
> > +/**
> > + * ttm_bo_populate() - Ensure that a buffer object has backing
> > pages
> > + * @bo: The buffer object
> > + * @ctx: The ttm_operation_ctx governing the operation.
> > + *
> > + * For buffer objects in a memory type whose manager uses
> > + * struct ttm_tt for backing pages, ensure those backing pages
> > + * are present and with valid content. The bo's resource is also
> > + * placed on the correct LRU list if it was previously swapped
> > + * out.
> > + *
> > + * Return: 0 if successful, negative error code on failure.
> > + * Note: May return -EINTR or -ERESTARTSYS if @ctx::interruptible
> > + * is set to true.
> > + */
> > +int ttm_bo_populate(struct ttm_buffer_object *bo,
> > +		=C2=A0=C2=A0=C2=A0 struct ttm_operation_ctx *ctx)
> > +{
> > +	struct ttm_tt *tt =3D bo->ttm;
> > +	bool swapped;
> > +	int ret;
> > +
> > +	dma_resv_assert_held(bo->base.resv);
> > +
> > +	if (!tt)
> > +		return 0;
> > +
> > +	swapped =3D ttm_tt_is_swapped(tt);
> > +	ret =3D ttm_tt_populate(bo->bdev, tt, ctx);
> > +	if (ret)
> > +		return ret;
> > +
> > +	if (swapped && !ttm_tt_is_swapped(tt) && !bo->pin_count) {
> > +		if (WARN_ON_ONCE(bo->pin_count))
> > +			return 0;
>=20
> You have both "&& !bo->pin_count" and a WARN_ON(bo->pin_count), that=20
> doesn't make much sense.

Yeah, I guess that won't catch much more than buggy processors. I'll
remove.

>=20
> > +
> > +		spin_lock(&bo->bdev->lru_lock);
> > +		ttm_resource_add_bulk_move(bo->resource, bo);
> > +		ttm_resource_move_to_lru_tail(bo->resource);
> > +		spin_unlock(&bo->bdev->lru_lock);
> > +	}
> > +
> > +	return 0;
> > +}
> > +EXPORT_SYMBOL(ttm_bo_populate);
> > diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c
> > b/drivers/gpu/drm/ttm/ttm_bo_util.c
> > index 3c07f4712d5c..d939925efa81 100644
> > --- a/drivers/gpu/drm/ttm/ttm_bo_util.c
> > +++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
> > @@ -163,7 +163,7 @@ int ttm_bo_move_memcpy(struct ttm_buffer_object
> > *bo,
> > =C2=A0=C2=A0	src_man =3D ttm_manager_type(bdev, src_mem->mem_type);
> > =C2=A0=C2=A0	if (ttm && ((ttm->page_flags & TTM_TT_FLAG_SWAPPED) ||
> > =C2=A0=C2=A0		=C2=A0=C2=A0=C2=A0 dst_man->use_tt)) {
> > -		ret =3D ttm_tt_populate(bdev, ttm, ctx);
> > +		ret =3D ttm_bo_populate(bo, ctx);
> > =C2=A0=C2=A0		if (ret)
> > =C2=A0=C2=A0			return ret;
> > =C2=A0=C2=A0	}
> > @@ -350,7 +350,7 @@ static int ttm_bo_kmap_ttm(struct
> > ttm_buffer_object *bo,
> > =C2=A0=20
> > =C2=A0=C2=A0	BUG_ON(!ttm);
> > =C2=A0=20
> > -	ret =3D ttm_tt_populate(bo->bdev, ttm, &ctx);
> > +	ret =3D ttm_bo_populate(bo, &ctx);
> > =C2=A0=C2=A0	if (ret)
> > =C2=A0=C2=A0		return ret;
> > =C2=A0=20
> > @@ -507,7 +507,7 @@ int ttm_bo_vmap(struct ttm_buffer_object *bo,
> > struct iosys_map *map)
> > =C2=A0=C2=A0		pgprot_t prot;
> > =C2=A0=C2=A0		void *vaddr;
> > =C2=A0=20
> > -		ret =3D ttm_tt_populate(bo->bdev, ttm, &ctx);
> > +		ret =3D ttm_bo_populate(bo, &ctx);
> > =C2=A0=C2=A0		if (ret)
> > =C2=A0=C2=A0			return ret;
> > =C2=A0=20
> > diff --git a/drivers/gpu/drm/ttm/ttm_bo_vm.c
> > b/drivers/gpu/drm/ttm/ttm_bo_vm.c
> > index 4212b8c91dd4..2c699ed1963a 100644
> > --- a/drivers/gpu/drm/ttm/ttm_bo_vm.c
> > +++ b/drivers/gpu/drm/ttm/ttm_bo_vm.c
> > @@ -224,7 +224,7 @@ vm_fault_t ttm_bo_vm_fault_reserved(struct
> > vm_fault *vmf,
> > =C2=A0=C2=A0		};
> > =C2=A0=20
> > =C2=A0=C2=A0		ttm =3D bo->ttm;
> > -		err =3D ttm_tt_populate(bdev, bo->ttm, &ctx);
> > +		err =3D ttm_bo_populate(bo, &ctx);
> > =C2=A0=C2=A0		if (err) {
> > =C2=A0=C2=A0			if (err =3D=3D -EINTR || err =3D=3D -ERESTARTSYS
> > ||
> > =C2=A0=C2=A0			=C2=A0=C2=A0=C2=A0 err =3D=3D -EAGAIN)
> > diff --git a/drivers/gpu/drm/ttm/ttm_device.c
> > b/drivers/gpu/drm/ttm/ttm_device.c
> > index e7cc4954c1bc..02e797fd1891 100644
> > --- a/drivers/gpu/drm/ttm/ttm_device.c
> > +++ b/drivers/gpu/drm/ttm/ttm_device.c
> > @@ -216,7 +216,7 @@ int ttm_device_init(struct ttm_device *bdev,
> > const struct ttm_device_funcs *func
> > =C2=A0=20
> > =C2=A0=C2=A0	bdev->vma_manager =3D vma_manager;
> > =C2=A0=C2=A0	spin_lock_init(&bdev->lru_lock);
> > -	INIT_LIST_HEAD(&bdev->pinned);
> > +	INIT_LIST_HEAD(&bdev->unevictable);
> > =C2=A0=C2=A0	bdev->dev_mapping =3D mapping;
> > =C2=A0=C2=A0	mutex_lock(&ttm_global_mutex);
> > =C2=A0=C2=A0	list_add_tail(&bdev->device_list, &glob->device_list);
> > @@ -283,7 +283,7 @@ void ttm_device_clear_dma_mappings(struct
> > ttm_device *bdev)
> > =C2=A0=C2=A0	struct ttm_resource_manager *man;
> > =C2=A0=C2=A0	unsigned int i, j;
> > =C2=A0=20
> > -	ttm_device_clear_lru_dma_mappings(bdev, &bdev->pinned);
> > +	ttm_device_clear_lru_dma_mappings(bdev, &bdev-
> > >unevictable);
> > =C2=A0=20
> > =C2=A0=C2=A0	for (i =3D TTM_PL_SYSTEM; i < TTM_NUM_MEM_TYPES; ++i) {
> > =C2=A0=C2=A0		man =3D ttm_manager_type(bdev, i);
> > diff --git a/drivers/gpu/drm/ttm/ttm_resource.c
> > b/drivers/gpu/drm/ttm/ttm_resource.c
> > index 6d764ba88aab..9d54c0e3e43d 100644
> > --- a/drivers/gpu/drm/ttm/ttm_resource.c
> > +++ b/drivers/gpu/drm/ttm/ttm_resource.c
> > @@ -30,6 +30,7 @@
> > =C2=A0 #include <drm/ttm/ttm_bo.h>
> > =C2=A0 #include <drm/ttm/ttm_placement.h>
> > =C2=A0 #include <drm/ttm/ttm_resource.h>
> > +#include <drm/ttm/ttm_tt.h>
> > =C2=A0=20
> > =C2=A0 #include <drm/drm_util.h>
> > =C2=A0=20
> > @@ -259,8 +260,8 @@ void ttm_resource_move_to_lru_tail(struct
> > ttm_resource *res)
> > =C2=A0=20
> > =C2=A0=C2=A0	lockdep_assert_held(&bo->bdev->lru_lock);
> > =C2=A0=20
> > -	if (bo->pin_count) {
> > -		list_move_tail(&res->lru.link, &bdev->pinned);
> > +	if (bo->pin_count || (bo->ttm && ttm_tt_is_swapped(bo-
> > >ttm))) {
> > +		list_move_tail(&res->lru.link, &bdev-
> > >unevictable);
>=20
> You need to change ttm_resource_add_bulk_move() and=20
> ttm_resource_del_bulk_move() as well.

Ugh. HMM, that will result in some slightly ugly code since we can't
remove from a bulk move twice. Those pos->first and pos->last updates
seem to have caused some grief in the past when it comes to fragility.=C2=
=A0

Perhaps moving forward aim for using special struct ttm_lru_items for
those, which would make them self-adjusting.

Anyway, I'll update.

>=20
> > =C2=A0=20
> > =C2=A0=C2=A0	} else	if (bo->bulk_move) {
> > =C2=A0=C2=A0		struct ttm_lru_bulk_move_pos *pos =3D
> > @@ -301,8 +302,8 @@ void ttm_resource_init(struct ttm_buffer_object
> > *bo,
> > =C2=A0=20
> > =C2=A0=C2=A0	man =3D ttm_manager_type(bo->bdev, place->mem_type);
> > =C2=A0=C2=A0	spin_lock(&bo->bdev->lru_lock);
> > -	if (bo->pin_count)
> > -		list_add_tail(&res->lru.link, &bo->bdev->pinned);
> > +	if (bo->pin_count || (bo->ttm && ttm_tt_is_swapped(bo-
> > >ttm)))
> > +		list_add_tail(&res->lru.link, &bo->bdev-
> > >unevictable);
> > =C2=A0=C2=A0	else
> > =C2=A0=C2=A0		list_add_tail(&res->lru.link, &man->lru[bo-
> > >priority]);
> > =C2=A0=C2=A0	man->usage +=3D res->size;
> > diff --git a/drivers/gpu/drm/ttm/ttm_tt.c
> > b/drivers/gpu/drm/ttm/ttm_tt.c
> > index 4b51b9023126..d1325cf37b18 100644
> > --- a/drivers/gpu/drm/ttm/ttm_tt.c
> > +++ b/drivers/gpu/drm/ttm/ttm_tt.c
> > @@ -367,7 +367,6 @@ int ttm_tt_populate(struct ttm_device *bdev,
> > =C2=A0=C2=A0	}
> > =C2=A0=C2=A0	return ret;
> > =C2=A0 }
> > -EXPORT_SYMBOL(ttm_tt_populate);
> > =C2=A0=20
> > =C2=A0 void ttm_tt_unpopulate(struct ttm_device *bdev, struct ttm_tt
> > *ttm)
> > =C2=A0 {
> > diff --git a/drivers/gpu/drm/xe/xe_bo.c
> > b/drivers/gpu/drm/xe/xe_bo.c
> > index 9df5a16662cf..d7d0add20b77 100644
> > --- a/drivers/gpu/drm/xe/xe_bo.c
> > +++ b/drivers/gpu/drm/xe/xe_bo.c
> > @@ -903,7 +903,7 @@ int xe_bo_evict_pinned(struct xe_bo *bo)
> > =C2=A0=C2=A0		}
> > =C2=A0=C2=A0	}
> > =C2=A0=20
> > -	ret =3D ttm_tt_populate(bo->ttm.bdev, bo->ttm.ttm, &ctx);
> > +	ret =3D ttm_bo_populate(&bo->ttm, &ctx);
> > =C2=A0=C2=A0	if (ret)
> > =C2=A0=C2=A0		goto err_res_free;
> > =C2=A0=20
> > @@ -956,7 +956,7 @@ int xe_bo_restore_pinned(struct xe_bo *bo)
> > =C2=A0=C2=A0	if (ret)
> > =C2=A0=C2=A0		return ret;
> > =C2=A0=20
> > -	ret =3D ttm_tt_populate(bo->ttm.bdev, bo->ttm.ttm, &ctx);
> > +	ret =3D ttm_bo_populate(&bo->ttm, &ctx);
> > =C2=A0=C2=A0	if (ret)
> > =C2=A0=C2=A0		goto err_res_free;
> > =C2=A0=20
> > diff --git a/include/drm/ttm/ttm_bo.h b/include/drm/ttm/ttm_bo.h
> > index 7b56d1ca36d7..5804408815be 100644
> > --- a/include/drm/ttm/ttm_bo.h
> > +++ b/include/drm/ttm/ttm_bo.h
> > @@ -462,5 +462,7 @@ int ttm_bo_pipeline_gutting(struct
> > ttm_buffer_object *bo);
> > =C2=A0 pgprot_t ttm_io_prot(struct ttm_buffer_object *bo, struct
> > ttm_resource *res,
> > =C2=A0=C2=A0		=C2=A0=C2=A0=C2=A0=C2=A0 pgprot_t tmp);
> > =C2=A0 void ttm_bo_tt_destroy(struct ttm_buffer_object *bo);
> > +int ttm_bo_populate(struct ttm_buffer_object *bo,
> > +		=C2=A0=C2=A0=C2=A0 struct ttm_operation_ctx *ctx);
> > =C2=A0=20
> > =C2=A0 #endif
> > diff --git a/include/drm/ttm/ttm_device.h
> > b/include/drm/ttm/ttm_device.h
> > index c22f30535c84..438358f72716 100644
> > --- a/include/drm/ttm/ttm_device.h
> > +++ b/include/drm/ttm/ttm_device.h
> > @@ -252,9 +252,10 @@ struct ttm_device {
> > =C2=A0=C2=A0	spinlock_t lru_lock;
> > =C2=A0=20
> > =C2=A0=C2=A0	/**
> > -	 * @pinned: Buffer objects which are pinned and so not on
> > any LRU list.
> > +	 * @unevictable Buffer objects which are pinned or swapped
> > and as such
> > +	 * not on an LRU list.
>=20
> Either "a LRU list" or "any LRU list".

It's actually "an" since the L in LRU is pronounced with a leading
Vowel sound.

>=20
> Apart from that this change makes a lot of sense.

Thanks. Will also update the broken KUNIT tests.

/Thomas


>=20
> Regards,
> Christian.
>=20
> > =C2=A0=C2=A0	 */
> > -	struct list_head pinned;
> > +	struct list_head unevictable;
> > =C2=A0=20
> > =C2=A0=C2=A0	/**
> > =C2=A0=C2=A0	 * @dev_mapping: A pointer to the struct address_space for
> > invalidating
> > diff --git a/include/drm/ttm/ttm_tt.h b/include/drm/ttm/ttm_tt.h
> > index 2b9d856ff388..991edafdb2dd 100644
> > --- a/include/drm/ttm/ttm_tt.h
> > +++ b/include/drm/ttm/ttm_tt.h
> > @@ -129,6 +129,11 @@ static inline bool ttm_tt_is_populated(struct
> > ttm_tt *tt)
> > =C2=A0=C2=A0	return tt->page_flags & TTM_TT_FLAG_PRIV_POPULATED;
> > =C2=A0 }
> > =C2=A0=20
> > +static inline bool ttm_tt_is_swapped(const struct ttm_tt *tt)
> > +{
> > +	return tt->page_flags & TTM_TT_FLAG_SWAPPED;
> > +}
> > +
> > =C2=A0 /**
> > =C2=A0=C2=A0 * ttm_tt_create
> > =C2=A0=C2=A0 *
>=20

