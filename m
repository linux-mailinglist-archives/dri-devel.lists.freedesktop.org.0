Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ACB2C1B756
	for <lists+dri-devel@lfdr.de>; Wed, 29 Oct 2025 15:56:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBC5810E7E1;
	Wed, 29 Oct 2025 14:56:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UrdqfTlB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FC6210E7E1;
 Wed, 29 Oct 2025 14:56:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761749799; x=1793285799;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=rQyembffZT5sKXDxEzr9qU78ck2Bh+khqF9niWL471s=;
 b=UrdqfTlBnsRIaIvQcW7b4J9s92rBv3v4QVVh647dE7QVL2fs9SV3Z/az
 +JKh+oWsWZ/FfD+W/3E6zeUDhjoeNljC0DHJcFrpYaWcAycPUTSqyuFaF
 rX45jPcV5sAMmq0eQ9FjWJZieF6mivYDicJqcJhit68OA1/Ic0SyGQZJX
 9lBv8jCpvi3J5drZ8NjiAvWzLirX7JuxdFxeeAs7qkOSzUJBI5UkE2hDI
 gaUqd2FgPcXjEEz165CSK3xDYLzFOwjWmKTj4Bsktn0LIU+96jsavc/vp
 CLVF+JvssS2wMI/Dcbj83qmNTVfOeMdQqgMegC8DSWIsvwNYr7xb+MyEA Q==;
X-CSE-ConnectionGUID: JKDyE5MERjCvA/Fei6QJfQ==
X-CSE-MsgGUID: LXiJrhJaTyGqvyh5SIeQfw==
X-IronPort-AV: E=McAfee;i="6800,10657,11597"; a="63757387"
X-IronPort-AV: E=Sophos;i="6.19,264,1754982000"; d="scan'208";a="63757387"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2025 07:56:39 -0700
X-CSE-ConnectionGUID: AA6cIH0nR6mqbtPjFWin1g==
X-CSE-MsgGUID: XgP9B5yCTwOIWWENumIYig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,264,1754982000"; d="scan'208";a="186143529"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO [10.245.245.28])
 ([10.245.245.28])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2025 07:56:36 -0700
Message-ID: <f92f89d247e296531640026d6226f1ead1a03b7c.camel@linux.intel.com>
Subject: Re: [PATCH 10/15] drm/xe: Use the vma attibute drm_pagemap to
 select where to migrate
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 himal.prasad.ghimiray@intel.com, apopple@nvidia.com, airlied@gmail.com,
 Simona Vetter <simona.vetter@ffwll.ch>, felix.kuehling@amd.com, Christian
 =?ISO-8859-1?Q?K=F6nig?=	 <christian.koenig@amd.com>, dakr@kernel.org,
 "Mrozek, Michal"	 <michal.mrozek@intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>
Date: Wed, 29 Oct 2025 15:56:34 +0100
In-Reply-To: <aQGJkJqG9Un1i3lP@lstrano-desk.jf.intel.com>
References: <20251025120412.12262-1-thomas.hellstrom@linux.intel.com>
 <20251025120412.12262-11-thomas.hellstrom@linux.intel.com>
 <aQGJkJqG9Un1i3lP@lstrano-desk.jf.intel.com>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-2.fc41) 
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

On Tue, 2025-10-28 at 20:27 -0700, Matthew Brost wrote:
> On Sat, Oct 25, 2025 at 02:04:07PM +0200, Thomas Hellstr=C3=B6m wrote:
> > Enable migrating to foreign drm_pagemaps.
> >=20
>=20
> Slightly better commit message ahead of merging.
>=20
> > Signed-off-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> > ---
> > =C2=A0drivers/gpu/drm/xe/xe_svm.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 39 ++=
+++++++++++++-------------
> > ----
> > =C2=A0drivers/gpu/drm/xe/xe_svm.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=
 8 +++----
> > =C2=A0drivers/gpu/drm/xe/xe_vm.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | =
19 ++++++----------
> > =C2=A0drivers/gpu/drm/xe/xe_vm_types.h |=C2=A0 6 ++---
> > =C2=A04 files changed, 32 insertions(+), 40 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/xe/xe_svm.c
> > b/drivers/gpu/drm/xe/xe_svm.c
> > index d27cedeaf70c..36a6ac293e71 100644
> > --- a/drivers/gpu/drm/xe/xe_svm.c
> > +++ b/drivers/gpu/drm/xe/xe_svm.c
> > @@ -1132,9 +1132,9 @@ static int __xe_svm_handle_pagefault(struct
> > xe_vm *vm, struct xe_vma *vma,
> > =C2=A0	if (err)
> > =C2=A0		return err;
> > =C2=A0
> > -	dpagemap =3D xe_vma_resolve_pagemap(vma, tile);
> > -	ctx.device_private_page_owner =3D
> > -		xe_svm_private_page_owner(vm, !dpagemap &&
> > !ctx.devmem_only);
> > +	dpagemap =3D ctx.devmem_only ? xe_tile_local_pagemap(tile) :
> > +		xe_vma_resolve_pagemap(vma, tile);
> > +	ctx.device_private_page_owner =3D
> > xe_svm_private_page_owner(vm, !dpagemap);
> > =C2=A0	range =3D xe_svm_range_find_or_insert(vm, fault_addr, vma,
> > &ctx);
> > =C2=A0
> > =C2=A0	if (IS_ERR(range))
> > @@ -1159,13 +1159,8 @@ static int __xe_svm_handle_pagefault(struct
> > xe_vm *vm, struct xe_vma *vma,
> > =C2=A0	=C2=A0=C2=A0=C2=A0 xe_svm_range_needs_migrate_to_vram(range, vma=
,
> > !!dpagemap || ctx.devmem_only)) {
> > =C2=A0		ktime_t migrate_start =3D xe_svm_stats_ktime_get();
> > =C2=A0
> > -		/* TODO : For multi-device dpagemap will be used
> > to find the
> > -		 * remote tile and remote device. Will need to
> > modify
> > -		 * xe_svm_alloc_vram to use dpagemap for future
> > multi-device
> > -		 * support.
> > -		 */
> > =C2=A0		xe_svm_range_migrate_count_stats_incr(gt, range);
> > -		err =3D xe_svm_alloc_vram(tile, range, &ctx);
> > +		err =3D xe_svm_alloc_vram(range, &ctx, dpagemap);
> > =C2=A0		xe_svm_range_migrate_us_stats_incr(gt, range,
> > migrate_start);
> > =C2=A0		ctx.timeslice_ms <<=3D 1;	/* Double
> > timeslice if we have to retry */
> > =C2=A0		if (err) {
> > @@ -1482,7 +1477,13 @@ u8 xe_svm_ranges_zap_ptes_in_range(struct
> > xe_vm *vm, u64 start, u64 end)
> > =C2=A0 */
> > =C2=A0struct drm_pagemap *xe_vma_resolve_pagemap(struct xe_vma *vma,
> > struct xe_tile *tile)
> > =C2=A0{
> > -	s32 fd =3D (s32)vma->attr.preferred_loc.devmem_fd;
> > +	struct drm_pagemap *dpagemap =3D vma-
> > >attr.preferred_loc.dpagemap;
> > +	s32 fd;
> > +
> > +	if (dpagemap)
> > +		return dpagemap;
> > +
> > +	fd =3D (s32)vma->attr.preferred_loc.devmem_fd;
> > =C2=A0
> > =C2=A0	if (fd =3D=3D DRM_XE_PREFERRED_LOC_DEFAULT_SYSTEM)
> > =C2=A0		return NULL;
> > @@ -1490,28 +1491,24 @@ struct drm_pagemap
> > *xe_vma_resolve_pagemap(struct xe_vma *vma, struct xe_tile *t
> > =C2=A0	if (fd =3D=3D DRM_XE_PREFERRED_LOC_DEFAULT_DEVICE)
> > =C2=A0		return IS_DGFX(tile_to_xe(tile)) ?
> > xe_tile_local_pagemap(tile) : NULL;
> > =C2=A0
> > -	/* TODO: Support multi-device with drm_pagemap_from_fd(fd)
> > */
> > =C2=A0	return NULL;
> > =C2=A0}
> > =C2=A0
> > =C2=A0/**
> > =C2=A0 * xe_svm_alloc_vram()- Allocate device memory pages for range,
> > =C2=A0 * migrating existing data.
> > - * @tile: tile to allocate vram from
> > =C2=A0 * @range: SVM range
> > =C2=A0 * @ctx: DRM GPU SVM context
> > + * @dpagemap: The struct drm_pagemap representing the memory to
> > allocate.
> > =C2=A0 *
> > =C2=A0 * Return: 0 on success, error code on failure.
> > =C2=A0 */
> > -int xe_svm_alloc_vram(struct xe_tile *tile, struct xe_svm_range
> > *range,
> > -		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const struct drm_gpusvm_ctx *ctx)
> > +int xe_svm_alloc_vram(struct xe_svm_range *range, const struct
> > drm_gpusvm_ctx *ctx,
> > +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct drm_pagemap *dpagemap)
> > =C2=A0{
> > -	struct drm_pagemap *dpagemap;
> > -
> > -	xe_assert(tile_to_xe(tile), range-
> > >base.pages.flags.migrate_devmem);
> > +	xe_assert(range_to_vm(&range->base)->xe, range-
> > >base.pages.flags.migrate_devmem);
> > =C2=A0	range_debug(range, "ALLOCATE VRAM");
> > =C2=A0
> > -	dpagemap =3D xe_tile_local_pagemap(tile);
> > =C2=A0	return drm_pagemap_populate_mm(dpagemap,
> > xe_svm_range_start(range),
> > =C2=A0				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 xe_svm_range_end(range),
> > =C2=A0				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 range->base.gpusvm->mm,
> > @@ -1778,9 +1775,9 @@ int xe_pagemap_cache_create(struct xe_tile
> > *tile)
> > =C2=A0	return 0;
> > =C2=A0}
> > =C2=A0
> > -int xe_svm_alloc_vram(struct xe_tile *tile,
> > -		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct xe_svm_range *range,
> > -		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const struct drm_gpusvm_ctx *ctx)
> > +int xe_svm_alloc_vram(struct xe_svm_range *range,
> > +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const struct drm_gpusvm_ctx *ctx,
> > +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct drm_pagemap *dpagemap)
> > =C2=A0{
> > =C2=A0	return -EOPNOTSUPP;
> > =C2=A0}
> > diff --git a/drivers/gpu/drm/xe/xe_svm.h
> > b/drivers/gpu/drm/xe/xe_svm.h
> > index 5adce108f7eb..c7027facf6e9 100644
> > --- a/drivers/gpu/drm/xe/xe_svm.h
> > +++ b/drivers/gpu/drm/xe/xe_svm.h
> > @@ -94,8 +94,8 @@ int xe_svm_bo_evict(struct xe_bo *bo);
> > =C2=A0
> > =C2=A0void xe_svm_range_debug(struct xe_svm_range *range, const char
> > *operation);
> > =C2=A0
> > -int xe_svm_alloc_vram(struct xe_tile *tile, struct xe_svm_range
> > *range,
> > -		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const struct drm_gpusvm_ctx *ctx);
> > +int xe_svm_alloc_vram(struct xe_svm_range *range, const struct
> > drm_gpusvm_ctx *ctx,
> > +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct drm_pagemap *dpagemap);
> > =C2=A0
> > =C2=A0struct xe_svm_range *xe_svm_range_find_or_insert(struct xe_vm *vm=
,
> > u64 addr,
> > =C2=A0						 struct xe_vma
> > *vma, struct drm_gpusvm_ctx *ctx);
> > @@ -276,8 +276,8 @@ void xe_svm_range_debug(struct xe_svm_range
> > *range, const char *operation)
> > =C2=A0}
> > =C2=A0
> > =C2=A0static inline int
> > -xe_svm_alloc_vram(struct xe_tile *tile, struct xe_svm_range
> > *range,
> > -		=C2=A0 const struct drm_gpusvm_ctx *ctx)
> > +xe_svm_alloc_vram(struct xe_svm_range *range, const struct
> > drm_gpusvm_ctx *ctx,
> > +		=C2=A0 struct drm_pagemap *dpagemap)
> > =C2=A0{
> > =C2=A0	return -EOPNOTSUPP;
> > =C2=A0}
> > diff --git a/drivers/gpu/drm/xe/xe_vm.c
> > b/drivers/gpu/drm/xe/xe_vm.c
> > index 3c3dc1b1ace9..381d4b4abac9 100644
> > --- a/drivers/gpu/drm/xe/xe_vm.c
> > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > @@ -2355,18 +2355,13 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm,
> > struct xe_vma_ops *vops,
> > =C2=A0			if (prefetch_region =3D=3D
> > DRM_XE_CONSULT_MEM_ADVISE_PREF_LOC) {
> > =C2=A0				dpagemap =3D
> > xe_vma_resolve_pagemap(vma,
> > =C2=A0								=C2=A0
> > xe_device_get_root_tile(vm->xe));
> > -				/*
> > -				 * TODO: Once multigpu support is
> > enabled will need
> > -				 * something to dereference tile
> > from dpagemap.
> > -				 */
> > -				if (dpagemap)
> > -					tile =3D
> > xe_device_get_root_tile(vm->xe);
> > =C2=A0			} else if (prefetch_region) {
> > =C2=A0				tile =3D &vm->xe-
> > >tiles[region_to_mem_type[prefetch_region] -
> > =C2=A0						=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> > XE_PL_VRAM0];
> > +				dpagemap =3D
> > xe_tile_local_pagemap(tile);
>=20
> Per kernel test robot, dpagemap needs to initialized to NULL. There
> is
> existing code which tile to NULL after a for_each_tile loop that can
> also be droppped.
>=20

Yeah I noticed that. I'll fix this up.
Thanks,
Thomas


> Everything else looks right.

>=20
> Matt
>=20
> > =C2=A0			}
> > =C2=A0
> > -			op->prefetch_range.tile =3D tile;
> > +			op->prefetch_range.dpagemap =3D dpagemap;
> > =C2=A0alloc_next_range:
> > =C2=A0			svm_range =3D
> > xe_svm_range_find_or_insert(vm, addr, vma, &ctx);
> > =C2=A0
> > @@ -2897,7 +2892,7 @@ static int prefetch_ranges(struct xe_vm *vm,
> > struct xe_vma_op *op)
> > =C2=A0{
> > =C2=A0	bool devmem_possible =3D IS_DGFX(vm->xe) &&
> > IS_ENABLED(CONFIG_DRM_XE_PAGEMAP);
> > =C2=A0	struct xe_vma *vma =3D gpuva_to_vma(op->base.prefetch.va);
> > -	struct xe_tile *tile =3D op->prefetch_range.tile;
> > +	struct drm_pagemap *dpagemap =3D op-
> > >prefetch_range.dpagemap;
> > =C2=A0	int err =3D 0;
> > =C2=A0
> > =C2=A0	struct xe_svm_range *svm_range;
> > @@ -2910,15 +2905,15 @@ static int prefetch_ranges(struct xe_vm
> > *vm, struct xe_vma_op *op)
> > =C2=A0	ctx.read_only =3D xe_vma_read_only(vma);
> > =C2=A0	ctx.devmem_possible =3D devmem_possible;
> > =C2=A0	ctx.check_pages_threshold =3D devmem_possible ? SZ_64K : 0;
> > -	ctx.device_private_page_owner =3D
> > xe_svm_private_page_owner(vm, !tile);
> > +	ctx.device_private_page_owner =3D
> > xe_svm_private_page_owner(vm, !dpagemap);
> > =C2=A0
> > =C2=A0	/* TODO: Threading the migration */
> > =C2=A0	xa_for_each(&op->prefetch_range.range, i, svm_range) {
> > -		if (!tile)
> > +		if (!dpagemap)
> > =C2=A0			xe_svm_range_migrate_to_smem(vm,
> > svm_range);
> > =C2=A0
> > -		if (xe_svm_range_needs_migrate_to_vram(svm_range,
> > vma, !!tile)) {
> > -			err =3D xe_svm_alloc_vram(tile, svm_range,
> > &ctx);
> > +		if (xe_svm_range_needs_migrate_to_vram(svm_range,
> > vma, !!dpagemap)) {
> > +			err =3D xe_svm_alloc_vram(svm_range, &ctx,
> > dpagemap);
> > =C2=A0			if (err) {
> > =C2=A0				drm_dbg(&vm->xe->drm, "VRAM
> > allocation failed, retry from userspace, asid=3D%u, gpusvm=3D%p,
> > errno=3D%pe\n",
> > =C2=A0					vm->usm.asid, &vm-
> > >svm.gpusvm, ERR_PTR(err));
> > diff --git a/drivers/gpu/drm/xe/xe_vm_types.h
> > b/drivers/gpu/drm/xe/xe_vm_types.h
> > index 70856d536047..5313bf2afa54 100644
> > --- a/drivers/gpu/drm/xe/xe_vm_types.h
> > +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> > @@ -413,10 +413,10 @@ struct xe_vma_op_prefetch_range {
> > =C2=A0	/** @ranges_count: number of svm ranges to map */
> > =C2=A0	u32 ranges_count;
> > =C2=A0	/**
> > -	 * @tile: Pointer to the tile structure containing memory
> > to prefetch.
> > -	 *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 NULL if prefetch request=
ed region is smem
> > +	 * @dpagemap: Pointer to the dpagemap structure containing
> > memory to prefetch.
> > +	 * NULL if prefetch requested region is smem
> > =C2=A0	 */
> > -	struct xe_tile *tile;
> > +	struct drm_pagemap *dpagemap;
> > =C2=A0};
> > =C2=A0
> > =C2=A0/** enum xe_vma_op_flags - flags for VMA operation */
> > --=20
> > 2.51.0
> >=20

