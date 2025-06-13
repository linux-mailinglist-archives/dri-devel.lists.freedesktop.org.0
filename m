Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B0BEAD8933
	for <lists+dri-devel@lfdr.de>; Fri, 13 Jun 2025 12:17:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC83110E979;
	Fri, 13 Jun 2025 10:16:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LBE/FjJU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D2EF10E96A;
 Fri, 13 Jun 2025 10:16:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749809819; x=1781345819;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=EpKGYcUA7FTsVSARI6FwnDQ2/lPmq/4yrZndPo38piY=;
 b=LBE/FjJU5rDlhw3B73lv5xxazU9VyGmX3IioCytl1WT2jrCCXxexrqYP
 k3pMEFBxHXZvNqS+ZJqycvJrLlWCVTxgIoGHC5HGp+4I8zoT9XP+M0Va0
 1XapO5bHBvmq1eE37TFEh2wL8Ck2RwA08BimXf7bCBYHtcAfY6wkJs5TP
 4McXr4YG4Jph5qnmF+B93ss0f3LMlM9SthcG6h+NlVIETUnFjGn/cTB7J
 uFHN2bxlbBc8L0jF/+qfAO/m6vvk7wSlLmKVDKnXG+WREX7gbaxfactlA
 zFesmv+165/wTv275mfXKU6YkzoAAEsn9Btv0OtIbRuvijjgabt/Se/CU A==;
X-CSE-ConnectionGUID: svkHoPilT/O+2V233izJbQ==
X-CSE-MsgGUID: 1fMaMMgRSE2azWeWCXtMgw==
X-IronPort-AV: E=McAfee;i="6800,10657,11462"; a="52001419"
X-IronPort-AV: E=Sophos;i="6.16,233,1744095600"; d="scan'208";a="52001419"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2025 03:16:58 -0700
X-CSE-ConnectionGUID: O/nfrNZITf6xDxKJIoivAQ==
X-CSE-MsgGUID: 0kFI++kdTICQGAieOXVQOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,233,1744095600"; d="scan'208";a="153078959"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO [10.245.245.83])
 ([10.245.245.83])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2025 03:16:55 -0700
Message-ID: <09a8f3434df1a9467a92f5c45799c909bdf5c6c4.camel@linux.intel.com>
Subject: Re: [PATCH v2 3/3] drm/xe: Implement and use the drm_pagemap
 populate_mm op
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 himal.prasad.ghimiray@intel.com, apopple@nvidia.com, airlied@gmail.com,
 Simona Vetter <simona.vetter@ffwll.ch>, felix.kuehling@amd.com, Christian
 =?ISO-8859-1?Q?K=F6nig?=	 <christian.koenig@amd.com>, dakr@kernel.org,
 "Mrozek, Michal"	 <michal.mrozek@intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>
Date: Fri, 13 Jun 2025 12:16:52 +0200
In-Reply-To: <aEIXPQpz0BqO58l/@lstrano-desk.jf.intel.com>
References: <20250604093536.95982-1-thomas.hellstrom@linux.intel.com>
 <20250604093536.95982-4-thomas.hellstrom@linux.intel.com>
 <aEIXPQpz0BqO58l/@lstrano-desk.jf.intel.com>
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

On Thu, 2025-06-05 at 15:16 -0700, Matthew Brost wrote:
> On Wed, Jun 04, 2025 at 11:35:36AM +0200, Thomas Hellstr=C3=B6m wrote:
> > Add runtime PM since we might call populate_mm on a foreign device.
> > Also create the VRAM bos as ttm_bo_type_kernel. This avoids the
> > initial clearing and the creation of an mmap handle.
> >=20
>=20
> I didn't read this part - skipping the initial clears. Discussed this
> on
> a private chat but to recap we need initial clears as copies for
> non-faulted in CPU pages are skipped which could result in another
> processes data being exposed in VRAM. We could only issue a clear if
> a
> non-faulted in page is found in xe_svm_copy or IIRC there was some
> work
> flying around to clear VRAM upon free, not sure if that ever landed -
> I
> believe AMD does clear on free their driver + buddy allocator has the
> concept of dirty blocks.

Thanks for reviewing!

I'll change back to ttm_bo_type_device for now. I think we should
change back to ttm_bo_type_kernel later, also to avoid the mmap offset
allocation.

From my understanding of the migrate docs, we're intended to either
clear (no system pages allocated) or copy (system pages allocated).

So for overall best efficiency I think when we implement clear on free,
we should also have a hint to allow allocation of blocks not
necessarily cleared yet.

Thanks,
Thomas

>=20
> Matt=20
>=20
> > Signed-off-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> > ---
> > =C2=A0drivers/gpu/drm/drm_pagemap.c |=C2=A0=C2=A0 1 +
> > =C2=A0drivers/gpu/drm/xe/xe_svm.c=C2=A0=C2=A0 | 104 +++++++++++++++++++=
+----------
> > ----
> > =C2=A0drivers/gpu/drm/xe/xe_svm.h=C2=A0=C2=A0 |=C2=A0 10 ++--
> > =C2=A0drivers/gpu/drm/xe/xe_tile.h=C2=A0 |=C2=A0 11 ++++
> > =C2=A0drivers/gpu/drm/xe/xe_vm.c=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 2 +-
> > =C2=A05 files changed, 78 insertions(+), 50 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/drm_pagemap.c
> > b/drivers/gpu/drm/drm_pagemap.c
> > index 25395685a9b8..94619be00d2a 100644
> > --- a/drivers/gpu/drm/drm_pagemap.c
> > +++ b/drivers/gpu/drm/drm_pagemap.c
> > @@ -843,3 +843,4 @@ int drm_pagemap_populate_mm(struct drm_pagemap
> > *dpagemap,
> > =C2=A0
> > =C2=A0	return err;
> > =C2=A0}
> > +EXPORT_SYMBOL(drm_pagemap_populate_mm);
> > diff --git a/drivers/gpu/drm/xe/xe_svm.c
> > b/drivers/gpu/drm/xe/xe_svm.c
> > index e161ce3e67a1..a10aab3768d8 100644
> > --- a/drivers/gpu/drm/xe/xe_svm.c
> > +++ b/drivers/gpu/drm/xe/xe_svm.c
> > @@ -3,13 +3,17 @@
> > =C2=A0 * Copyright =C2=A9 2024 Intel Corporation
> > =C2=A0 */
> > =C2=A0
> > +#include <drm/drm_drv.h>
> > +
> > =C2=A0#include "xe_bo.h"
> > =C2=A0#include "xe_gt_stats.h"
> > =C2=A0#include "xe_gt_tlb_invalidation.h"
> > =C2=A0#include "xe_migrate.h"
> > =C2=A0#include "xe_module.h"
> > +#include "xe_pm.h"
> > =C2=A0#include "xe_pt.h"
> > =C2=A0#include "xe_svm.h"
> > +#include "xe_tile.h"
> > =C2=A0#include "xe_ttm_vram_mgr.h"
> > =C2=A0#include "xe_vm.h"
> > =C2=A0#include "xe_vm_types.h"
> > @@ -525,8 +529,10 @@ static struct xe_bo *to_xe_bo(struct
> > drm_pagemap_devmem *devmem_allocation)
> > =C2=A0static void xe_svm_devmem_release(struct drm_pagemap_devmem
> > *devmem_allocation)
> > =C2=A0{
> > =C2=A0	struct xe_bo *bo =3D to_xe_bo(devmem_allocation);
> > +	struct xe_device *xe =3D xe_bo_device(bo);
> > =C2=A0
> > =C2=A0	xe_bo_put_async(bo);
> > +	xe_pm_runtime_put(xe);
> > =C2=A0}
> > =C2=A0
> > =C2=A0static u64 block_offset_to_pfn(struct xe_vram_region *vr, u64
> > offset)
> > @@ -720,76 +726,63 @@ static struct xe_vram_region
> > *tile_to_vr(struct xe_tile *tile)
> > =C2=A0	return &tile->mem.vram;
> > =C2=A0}
> > =C2=A0
> > -/**
> > - * xe_svm_alloc_vram()- Allocate device memory pages for range,
> > - * migrating existing data.
> > - * @vm: The VM.
> > - * @tile: tile to allocate vram from
> > - * @range: SVM range
> > - * @ctx: DRM GPU SVM context
> > - *
> > - * Return: 0 on success, error code on failure.
> > - */
> > -int xe_svm_alloc_vram(struct xe_vm *vm, struct xe_tile *tile,
> > -		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct xe_svm_range *range,
> > -		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const struct drm_gpusvm_ctx *ctx)
> > +static int xe_drm_pagemap_populate_mm(struct drm_pagemap
> > *dpagemap,
> > +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned long start,
> > unsigned long end,
> > +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct mm_struct *mm,
> > +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned long timeslice_ms)
> > =C2=A0{
> > -	struct mm_struct *mm =3D vm->svm.gpusvm.mm;
> > +	struct xe_tile *tile =3D container_of(dpagemap,
> > typeof(*tile), mem.vram.dpagemap);
> > +	struct xe_device *xe =3D tile_to_xe(tile);
> > +	struct device *dev =3D xe->drm.dev;
> > =C2=A0	struct xe_vram_region *vr =3D tile_to_vr(tile);
> > =C2=A0	struct drm_buddy_block *block;
> > =C2=A0	struct list_head *blocks;
> > =C2=A0	struct xe_bo *bo;
> > -	ktime_t end =3D 0;
> > -	int err;
> > -
> > -	if (!range->base.flags.migrate_devmem)
> > -		return -EINVAL;
> > +	ktime_t time_end =3D 0;
> > +	int err, idx;
> > =C2=A0
> > -	range_debug(range, "ALLOCATE VRAM");
> > +	if (!drm_dev_enter(&xe->drm, &idx))
> > +		return -ENODEV;
> > =C2=A0
> > -	if (!mmget_not_zero(mm))
> > -		return -EFAULT;
> > -	mmap_read_lock(mm);
> > +	xe_pm_runtime_get(xe);
> > =C2=A0
> > -retry:
> > -	bo =3D xe_bo_create_locked(tile_to_xe(tile), NULL, NULL,
> > -				 xe_svm_range_size(range),
> > -				 ttm_bo_type_device,
> > + retry:
> > +	bo =3D xe_bo_create_locked(tile_to_xe(tile), NULL, NULL, end
> > - start,
> > +				 ttm_bo_type_kernel,
> > =C2=A0				 XE_BO_FLAG_VRAM_IF_DGFX(tile) |
> > =C2=A0				 XE_BO_FLAG_CPU_ADDR_MIRROR);
> > =C2=A0	if (IS_ERR(bo)) {
> > =C2=A0		err =3D PTR_ERR(bo);
> > -		if (xe_vm_validate_should_retry(NULL, err, &end))
> > +		if (xe_vm_validate_should_retry(NULL, err,
> > &time_end))
> > =C2=A0			goto retry;
> > -		goto unlock;
> > +		goto out_pm_put;
> > =C2=A0	}
> > =C2=A0
> > -	drm_pagemap_devmem_init(&bo->devmem_allocation,
> > -				vm->xe->drm.dev, mm,
> > +	drm_pagemap_devmem_init(&bo->devmem_allocation, dev, mm,
> > =C2=A0				&dpagemap_devmem_ops,
> > =C2=A0				&tile->mem.vram.dpagemap,
> > -				xe_svm_range_size(range));
> > +				end - start);
> > =C2=A0
> > =C2=A0	blocks =3D &to_xe_ttm_vram_mgr_resource(bo->ttm.resource)-
> > >blocks;
> > =C2=A0	list_for_each_entry(block, blocks, link)
> > =C2=A0		block->private =3D vr;
> > =C2=A0
> > =C2=A0	xe_bo_get(bo);
> > -	err =3D drm_pagemap_migrate_to_devmem(&bo-
> > >devmem_allocation,
> > -					=C2=A0=C2=A0=C2=A0 mm,
> > -					=C2=A0=C2=A0=C2=A0
> > xe_svm_range_start(range),
> > -					=C2=A0=C2=A0=C2=A0
> > xe_svm_range_end(range),
> > -					=C2=A0=C2=A0=C2=A0 ctx->timeslice_ms,
> > -					=C2=A0=C2=A0=C2=A0 xe_svm_devm_owner(vm-
> > >xe));
> > +
> > +	/* Ensure the device has a pm ref while there are device
> > pages active. */
> > +	xe_pm_runtime_get_noresume(xe);
> > +	err =3D drm_pagemap_migrate_to_devmem(&bo-
> > >devmem_allocation, mm,
> > +					=C2=A0=C2=A0=C2=A0 start, end,
> > timeslice_ms,
> > +					=C2=A0=C2=A0=C2=A0
> > xe_svm_devm_owner(xe));
> > =C2=A0	if (err)
> > =C2=A0		xe_svm_devmem_release(&bo->devmem_allocation);
> > =C2=A0
> > =C2=A0	xe_bo_unlock(bo);
> > =C2=A0	xe_bo_put(bo);
> > =C2=A0
> > -unlock:
> > -	mmap_read_unlock(mm);
> > -	mmput(mm);
> > +out_pm_put:
> > +	xe_pm_runtime_put(xe);
> > +	drm_dev_exit(idx);
> > =C2=A0
> > =C2=A0	return err;
> > =C2=A0}
> > @@ -898,7 +891,7 @@ int xe_svm_handle_pagefault(struct xe_vm *vm,
> > struct xe_vma *vma,
> > =C2=A0
> > =C2=A0	if (--migrate_try_count >=3D 0 &&
> > =C2=A0	=C2=A0=C2=A0=C2=A0 xe_svm_range_needs_migrate_to_vram(range, vma=
,
> > IS_DGFX(vm->xe))) {
> > -		err =3D xe_svm_alloc_vram(vm, tile, range, &ctx);
> > +		err =3D xe_svm_alloc_vram(tile, range, &ctx);
> > =C2=A0		ctx.timeslice_ms <<=3D 1;	/* Double
> > timeslice if we have to retry */
> > =C2=A0		if (err) {
> > =C2=A0			if (migrate_try_count || !ctx.devmem_only)
> > {
> > @@ -1054,6 +1047,30 @@ int xe_svm_range_get_pages(struct xe_vm *vm,
> > struct xe_svm_range *range,
> > =C2=A0
> > =C2=A0#if IS_ENABLED(CONFIG_DRM_XE_PAGEMAP)
> > =C2=A0
> > +/**
> > + * xe_svm_alloc_vram()- Allocate device memory pages for range,
> > + * migrating existing data.
> > + * @vm: The VM.
> > + * @tile: tile to allocate vram from
> > + * @range: SVM range
> > + * @ctx: DRM GPU SVM context
> > + *
> > + * Return: 0 on success, error code on failure.
> > + */
> > +int xe_svm_alloc_vram(struct xe_tile *tile, struct xe_svm_range
> > *range,
> > +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const struct drm_gpusvm_ctx *ctx)
> > +{
> > +	struct drm_pagemap *dpagemap;
> > +
> > +	range_debug(range, "ALLOCATE VRAM");
> > +
> > +	dpagemap =3D xe_tile_local_pagemap(tile);
> > +	return drm_pagemap_populate_mm(dpagemap,
> > xe_svm_range_start(range),
> > +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 xe_svm_range_end(range),
> > +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 range->base.gpusvm->mm,
> > +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ctx->timeslice_ms);
> > +}
> > +
> > =C2=A0static struct drm_pagemap_device_addr
> > =C2=A0xe_drm_pagemap_device_map(struct drm_pagemap *dpagemap,
> > =C2=A0			=C2=A0 struct device *dev,
> > @@ -1078,6 +1095,7 @@ xe_drm_pagemap_device_map(struct drm_pagemap
> > *dpagemap,
> > =C2=A0
> > =C2=A0static const struct drm_pagemap_ops xe_drm_pagemap_ops =3D {
> > =C2=A0	.device_map =3D xe_drm_pagemap_device_map,
> > +	.populate_mm =3D xe_drm_pagemap_populate_mm,
> > =C2=A0};
> > =C2=A0
> > =C2=A0/**
> > @@ -1130,7 +1148,7 @@ int xe_devm_add(struct xe_tile *tile, struct
> > xe_vram_region *vr)
> > =C2=A0	return 0;
> > =C2=A0}
> > =C2=A0#else
> > -int xe_svm_alloc_vram(struct xe_vm *vm, struct xe_tile *tile,
> > +int xe_svm_alloc_vram(struct xe_tile *tile,
> > =C2=A0		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct xe_svm_range *range,
> > =C2=A0		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const struct drm_gpusvm_ctx *ctx=
)
> > =C2=A0{
> > diff --git a/drivers/gpu/drm/xe/xe_svm.h
> > b/drivers/gpu/drm/xe/xe_svm.h
> > index 19ce4f2754a7..da9a69ea0bb1 100644
> > --- a/drivers/gpu/drm/xe/xe_svm.h
> > +++ b/drivers/gpu/drm/xe/xe_svm.h
> > @@ -70,8 +70,7 @@ int xe_svm_bo_evict(struct xe_bo *bo);
> > =C2=A0
> > =C2=A0void xe_svm_range_debug(struct xe_svm_range *range, const char
> > *operation);
> > =C2=A0
> > -int xe_svm_alloc_vram(struct xe_vm *vm, struct xe_tile *tile,
> > -		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct xe_svm_range *range,
> > +int xe_svm_alloc_vram(struct xe_tile *tile, struct xe_svm_range
> > *range,
> > =C2=A0		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const struct drm_gpusvm_ctx *ctx=
);
> > =C2=A0
> > =C2=A0struct xe_svm_range *xe_svm_range_find_or_insert(struct xe_vm *vm=
,
> > u64 addr,
> > @@ -237,10 +236,9 @@ void xe_svm_range_debug(struct xe_svm_range
> > *range, const char *operation)
> > =C2=A0{
> > =C2=A0}
> > =C2=A0
> > -static inline
> > -int xe_svm_alloc_vram(struct xe_vm *vm, struct xe_tile *tile,
> > -		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct xe_svm_range *range,
> > -		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const struct drm_gpusvm_ctx *ctx)
> > +static inline int
> > +xe_svm_alloc_vram(struct xe_tile *tile, struct xe_svm_range
> > *range,
> > +		=C2=A0 const struct drm_gpusvm_ctx *ctx)
> > =C2=A0{
> > =C2=A0	return -EOPNOTSUPP;
> > =C2=A0}
> > diff --git a/drivers/gpu/drm/xe/xe_tile.h
> > b/drivers/gpu/drm/xe/xe_tile.h
> > index eb939316d55b..066a3d0cea79 100644
> > --- a/drivers/gpu/drm/xe/xe_tile.h
> > +++ b/drivers/gpu/drm/xe/xe_tile.h
> > @@ -16,4 +16,15 @@ int xe_tile_init(struct xe_tile *tile);
> > =C2=A0
> > =C2=A0void xe_tile_migrate_wait(struct xe_tile *tile);
> > =C2=A0
> > +#if IS_ENABLED(CONFIG_DRM_XE_PAGEMAP)
> > +static inline struct drm_pagemap *xe_tile_local_pagemap(struct
> > xe_tile *tile)
> > +{
> > +	return &tile->mem.vram.dpagemap;
> > +}
> > +#else
> > +static inline struct drm_pagemap *xe_tile_local_pagemap(struct
> > xe_tile *tile)
> > +{
> > +	return NULL;
> > +}
> > +#endif
> > =C2=A0#endif
> > diff --git a/drivers/gpu/drm/xe/xe_vm.c
> > b/drivers/gpu/drm/xe/xe_vm.c
> > index 7140d8856bad..def493acb4d7 100644
> > --- a/drivers/gpu/drm/xe/xe_vm.c
> > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > @@ -2911,7 +2911,7 @@ static int prefetch_ranges(struct xe_vm *vm,
> > struct xe_vma_op *op)
> > =C2=A0
> > =C2=A0		if (xe_svm_range_needs_migrate_to_vram(svm_range,
> > vma, region)) {
> > =C2=A0			tile =3D &vm->xe-
> > >tiles[region_to_mem_type[region] - XE_PL_VRAM0];
> > -			err =3D xe_svm_alloc_vram(vm, tile,
> > svm_range, &ctx);
> > +			err =3D xe_svm_alloc_vram(tile, svm_range,
> > &ctx);
> > =C2=A0			if (err) {
> > =C2=A0				drm_dbg(&vm->xe->drm, "VRAM
> > allocation failed, retry from userspace, asid=3D%u, gpusvm=3D%p,
> > errno=3D%pe\n",
> > =C2=A0					vm->usm.asid, &vm-
> > >svm.gpusvm, ERR_PTR(err));
> > --=20
> > 2.49.0
> >=20

