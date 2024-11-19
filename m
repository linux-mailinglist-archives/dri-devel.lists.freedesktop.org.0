Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC96E9D2773
	for <lists+dri-devel@lfdr.de>; Tue, 19 Nov 2024 14:56:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BFCC10E648;
	Tue, 19 Nov 2024 13:56:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BPxPKYbm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F318810E648;
 Tue, 19 Nov 2024 13:56:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732024579; x=1763560579;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=uyZyKHdrhoteT2xvGurGW2c2iRqYXfrZJ6ZSVzospvI=;
 b=BPxPKYbmnOHYMGamgW/CBI+dX52njjID7/rmxr4xMLYHKNioNapxTKWJ
 whafDBzeTA7DfWbTNKqVhah/AC4YecgGDV0w6M+p3MqKYHbhMCZPQ6UZ2
 /Em9F3dy4Em820BGyWYIGDlDBNfY2rllTs8J/38jLp4sVq8SaZ3FRf3qA
 /tRwUGFbigeKpmJlASDCm9skELm3oV8JCMf+GTY366AoJT76mFYfmDUDu
 wNQFmtbof7ynB+9hbAHAPMPTBejtx3BB86mchgIECobFhvpHKDsYF4wwx
 1H6lb74tsgH8qOnWvHkoKVu/MHWpnnxKZ2WlYmFTGwl+MxOym4P37LS++ Q==;
X-CSE-ConnectionGUID: XcAiIm+hS4i8zpQD/7NVtA==
X-CSE-MsgGUID: H68zDSnjQgSd5jgHrmFDmA==
X-IronPort-AV: E=McAfee;i="6700,10204,11261"; a="32270551"
X-IronPort-AV: E=Sophos;i="6.12,166,1728975600"; d="scan'208";a="32270551"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2024 05:56:19 -0800
X-CSE-ConnectionGUID: CZCkuvtZQZiBAE+y7HtlOw==
X-CSE-MsgGUID: 6F1UAhB5Rv+YelhoEQVl8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,166,1728975600"; d="scan'208";a="94635223"
Received: from smoticic-mobl.ger.corp.intel.com (HELO [10.245.246.223])
 ([10.245.246.223])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2024 05:56:16 -0800
Message-ID: <12b541d3a1b46434032afc1bcb9ce90428aa24a5.camel@linux.intel.com>
Subject: Re: [PATCH v2 09/29] drm/xe: Add SVM range invalidation
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: apopple@nvidia.com, airlied@gmail.com, christian.koenig@amd.com, 
 simona.vetter@ffwll.ch, felix.kuehling@amd.com, dakr@kernel.org
Date: Tue, 19 Nov 2024 14:56:12 +0100
In-Reply-To: <20241016032518.539495-10-matthew.brost@intel.com>
References: <20241016032518.539495-1-matthew.brost@intel.com>
 <20241016032518.539495-10-matthew.brost@intel.com>
Autocrypt: addr=thomas.hellstrom@linux.intel.com; prefer-encrypt=mutual;
 keydata=mDMEZaWU6xYJKwYBBAHaRw8BAQdAj/We1UBCIrAm9H5t5Z7+elYJowdlhiYE8zUXgxcFz360SFRob21hcyBIZWxsc3Ryw7ZtIChJbnRlbCBMaW51eCBlbWFpbCkgPHRob21hcy5oZWxsc3Ryb21AbGludXguaW50ZWwuY29tPoiTBBMWCgA7FiEEbJFDO8NaBua8diGTuBaTVQrGBr8FAmWllOsCGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgkQuBaTVQrGBr/yQAD/Z1B+Kzy2JTuIy9LsKfC9FJmt1K/4qgaVeZMIKCAxf2UBAJhmZ5jmkDIf6YghfINZlYq6ixyWnOkWMuSLmELwOsgPuDgEZaWU6xIKKwYBBAGXVQEFAQEHQF9v/LNGegctctMWGHvmV/6oKOWWf/vd4MeqoSYTxVBTAwEIB4h4BBgWCgAgFiEEbJFDO8NaBua8diGTuBaTVQrGBr8FAmWllOsCGwwACgkQuBaTVQrGBr/P2QD9Gts6Ee91w3SzOelNjsus/DcCTBb3fRugJoqcfxjKU0gBAKIFVMvVUGbhlEi6EFTZmBZ0QIZEIzOOVfkaIgWelFEH
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.4 (3.50.4-3.fc39) 
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

On Tue, 2024-10-15 at 20:24 -0700, Matthew Brost wrote:
> Add SVM range invalidation vfunc.
>=20
> v2:
> =C2=A0- Don't run invalidation if VM is closed
> =C2=A0- Cycle notifier lock in xe_svm_close
> =C2=A0- Drop xe_gt_tlb_invalidation_fence_fini
>=20
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
> =C2=A0drivers/gpu/drm/xe/xe_gt_pagefault.c |=C2=A0 17 ++-
> =C2=A0drivers/gpu/drm/xe/xe_pt.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 24 ++++
> =C2=A0drivers/gpu/drm/xe/xe_pt.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 3 +
> =C2=A0drivers/gpu/drm/xe/xe_svm.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 | 205
> ++++++++++++++++++++++++++-
> =C2=A0drivers/gpu/drm/xe/xe_svm.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0 13 ++
> =C2=A05 files changed, 256 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c
> b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> index 79c426dc2505..92923947a12c 100644
> --- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
> +++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> @@ -19,6 +19,7 @@
> =C2=A0#include "xe_guc.h"
> =C2=A0#include "xe_guc_ct.h"
> =C2=A0#include "xe_migrate.h"
> +#include "xe_svm.h"
> =C2=A0#include "xe_trace_bo.h"
> =C2=A0#include "xe_vm.h"
> =C2=A0
> @@ -125,18 +126,17 @@ static int xe_pf_begin(struct drm_exec *exec,
> struct xe_vma *vma,
> =C2=A0	return 0;
> =C2=A0}
> =C2=A0
> -static int handle_vma_pagefault(struct xe_tile *tile, struct
> pagefault *pf,
> -				struct xe_vma *vma)
> +static int handle_vma_pagefault(struct xe_tile *tile, struct xe_vma
> *vma,
> +				bool atomic)
> =C2=A0{
> =C2=A0	struct xe_vm *vm =3D xe_vma_vm(vma);
> =C2=A0	struct drm_exec exec;
> =C2=A0	struct dma_fence *fence;
> =C2=A0	ktime_t end =3D 0;
> =C2=A0	int err;
> -	bool atomic;
> =C2=A0
> +	lockdep_assert_held_write(&vm->lock);
> =C2=A0	trace_xe_vma_pagefault(vma);
> -	atomic =3D access_is_atomic(pf->access_type);
> =C2=A0
> =C2=A0	/* Check if VMA is valid */
> =C2=A0	if (vma_is_valid(tile, vma) && !atomic)
> @@ -207,6 +207,7 @@ static int handle_pagefault(struct xe_gt *gt,
> struct pagefault *pf)
> =C2=A0	struct xe_vm *vm;
> =C2=A0	struct xe_vma *vma =3D NULL;
> =C2=A0	int err;
> +	bool atomic;
> =C2=A0
> =C2=A0	/* SW isn't expected to handle TRTT faults */
> =C2=A0	if (pf->trva_fault)
> @@ -232,7 +233,13 @@ static int handle_pagefault(struct xe_gt *gt,
> struct pagefault *pf)
> =C2=A0		goto unlock_vm;
> =C2=A0	}
> =C2=A0
> -	err =3D handle_vma_pagefault(tile, pf, vma);
> +	atomic =3D access_is_atomic(pf->access_type);
> +
> +	if (xe_vma_is_system_allocator(vma))
> +		err =3D xe_svm_handle_pagefault(vm, vma, tile,
> +					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pf->page_addr,
> atomic);
> +	else
> +		err =3D handle_vma_pagefault(tile, vma, atomic);
> =C2=A0
> =C2=A0unlock_vm:
> =C2=A0	if (!err)
> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> index 39357e829b6d..282476c4edbd 100644
> --- a/drivers/gpu/drm/xe/xe_pt.c
> +++ b/drivers/gpu/drm/xe/xe_pt.c
> @@ -20,6 +20,7 @@
> =C2=A0#include "xe_res_cursor.h"
> =C2=A0#include "xe_sched_job.h"
> =C2=A0#include "xe_sync.h"
> +#include "xe_svm.h"
> =C2=A0#include "xe_trace.h"
> =C2=A0#include "xe_ttm_stolen_mgr.h"
> =C2=A0#include "xe_vm.h"
> @@ -829,6 +830,29 @@ bool xe_pt_zap_ptes(struct xe_tile *tile, struct
> xe_vma *vma)
> =C2=A0	return xe_walk.needs_invalidate;
> =C2=A0}
> =C2=A0
> +bool xe_pt_zap_ptes_range(struct xe_tile *tile, struct xe_vm *vm,
> +			=C2=A0 struct xe_svm_range *range)

Kerneldoc.

Here, (and I saw Oak also commented around this some time ago) ideally
we should make xe_pt.c unaware of vmas and svm ranges, and in this
case, use the same xe_pt function for both.



> +{
> +	struct xe_pt_zap_ptes_walk xe_walk =3D {
> +		.base =3D {
> +			.ops =3D &xe_pt_zap_ptes_ops,
> +			.shifts =3D xe_normal_pt_shifts,
> +			.max_level =3D XE_PT_HIGHEST_LEVEL,
> +		},
> +		.tile =3D tile,
> +	};
> +	struct xe_pt *pt =3D vm->pt_root[tile->id];
> +	u8 pt_mask =3D (range->tile_present & ~range-
> >tile_invalidated);
> +
> +	if (!(pt_mask & BIT(tile->id)))
> +		return false;
> +
> +	(void)xe_pt_walk_shared(&pt->base, pt->level, range-
> >base.va.start,
> +				range->base.va.end, &xe_walk.base);
> +
> +	return xe_walk.needs_invalidate;
> +}
> +
> =C2=A0static void
> =C2=A0xe_vm_populate_pgtable(struct xe_migrate_pt_update *pt_update,
> struct xe_tile *tile,
> =C2=A0		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct iosys_map *map, void =
*data,
> diff --git a/drivers/gpu/drm/xe/xe_pt.h b/drivers/gpu/drm/xe/xe_pt.h
> index 9ab386431cad..5f333eeedf5c 100644
> --- a/drivers/gpu/drm/xe/xe_pt.h
> +++ b/drivers/gpu/drm/xe/xe_pt.h
> @@ -13,6 +13,7 @@ struct dma_fence;
> =C2=A0struct xe_bo;
> =C2=A0struct xe_device;
> =C2=A0struct xe_exec_queue;
> +struct xe_svm_range;
> =C2=A0struct xe_sync_entry;
> =C2=A0struct xe_tile;
> =C2=A0struct xe_vm;
> @@ -42,5 +43,7 @@ void xe_pt_update_ops_fini(struct xe_tile *tile,
> struct xe_vma_ops *vops);
> =C2=A0void xe_pt_update_ops_abort(struct xe_tile *tile, struct xe_vma_ops
> *vops);
> =C2=A0
> =C2=A0bool xe_pt_zap_ptes(struct xe_tile *tile, struct xe_vma *vma);
> +bool xe_pt_zap_ptes_range(struct xe_tile *tile, struct xe_vm *vm,
> +			=C2=A0 struct xe_svm_range *range);
> =C2=A0
> =C2=A0#endif
> diff --git a/drivers/gpu/drm/xe/xe_svm.c
> b/drivers/gpu/drm/xe/xe_svm.c
> index 57b740367843..b2bc259978c4 100644
> --- a/drivers/gpu/drm/xe/xe_svm.c
> +++ b/drivers/gpu/drm/xe/xe_svm.c
> @@ -5,18 +5,188 @@
> =C2=A0
> =C2=A0#include "drm_gpusvm.h"
> =C2=A0
> +#include "xe_gt_tlb_invalidation.h"
> +#include "xe_pt.h"
> =C2=A0#include "xe_svm.h"
> =C2=A0#include "xe_vm.h"
> =C2=A0#include "xe_vm_types.h"
> =C2=A0
> +static struct xe_vm *gpusvm_to_vm(struct drm_gpusvm *gpusvm)
> +{
> +	return container_of(gpusvm, struct xe_vm, svm.gpusvm);
> +}
> +
> +static struct xe_vm *range_to_vm(struct drm_gpusvm_range *r)
> +{
> +	return gpusvm_to_vm(r->gpusvm);
> +}
> +
> +static struct drm_gpusvm_range *
> +xe_svm_range_alloc(struct drm_gpusvm *gpusvm)
> +{
> +	struct xe_svm_range *range;
> +
> +	range =3D kzalloc(sizeof(*range), GFP_KERNEL);
> +	if (!range)
> +		return ERR_PTR(-ENOMEM);
> +
> +	xe_vm_get(gpusvm_to_vm(gpusvm));
> +
> +	return &range->base;
> +}
> +
> +static void xe_svm_range_free(struct drm_gpusvm_range *range)
> +{
> +	xe_vm_put(range_to_vm(range));
> +	kfree(range);
> +}
> +
> +static struct xe_svm_range *to_xe_range(struct drm_gpusvm_range *r)
> +{
> +	return container_of(r, struct xe_svm_range, base);
> +}
> +
> +static u8
> +xe_svm_range_notifier_event_begin(struct xe_vm *vm, struct
> drm_gpusvm_range *r,
> +				=C2=A0 const struct mmu_notifier_range
> *mmu_range,
> +				=C2=A0 u64 *adj_start, u64 *adj_end)
> +{
> +	struct xe_svm_range *range =3D to_xe_range(r);
> +	struct xe_device *xe =3D vm->xe;
> +	struct xe_tile *tile;
> +	u8 tile_mask =3D 0;
> +	u8 id;
> +

lockdep assert?

> +	/* Skip if already unmapped or if no binding exist */
> +	if (range->base.flags.unmapped || !range->tile_present)
> +		return 0;
> +
> +	/* Adjust invalidation to range boundaries */
> +	if (range->base.va.start < mmu_range->start)
> +		*adj_start =3D range->base.va.start;
> +	if (range->base.va.end > mmu_range->end)
> +		*adj_end =3D range->base.va.end;
> +
> +	/*
> +	 * XXX: Ideally would zap PTEs in one shot in
> xe_svm_invalidate but the
> +	 * invalidation code can't correctly cope with sparse ranges
> or
> +	 * invalidations spanning multiple ranges.
> +	 */
> +	for_each_tile(tile, xe, id)
> +		if (xe_pt_zap_ptes_range(tile, vm, range)) {
> +			tile_mask |=3D BIT(id);
> +			range->tile_invalidated |=3D BIT(id);
> +		}
> +
> +	return tile_mask;
> +}
> +
> +static void
> +xe_svm_range_notifier_event_end(struct xe_vm *vm, struct
> drm_gpusvm_range *r,
> +				const struct mmu_notifier_range
> *mmu_range)
> +{
> +	struct drm_gpusvm_ctx ctx =3D { .in_notifier =3D true, };
> +
> +	drm_gpusvm_range_unmap_pages(&vm->svm.gpusvm, r, &ctx);
> +	/* TODO: Add range to garbage collector */
> +}
> +
> =C2=A0static void xe_svm_invalidate(struct drm_gpusvm *gpusvm,
> =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct drm_gpusvm_notifier *notif=
ier,
> =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const struct mmu_notifier_range
> *mmu_range)
> =C2=A0{
> -	/* TODO: Implement */
> +	struct xe_vm *vm =3D gpusvm_to_vm(gpusvm);
> +	struct xe_device *xe =3D vm->xe;
> +	struct xe_tile *tile;
> +	struct drm_gpusvm_range *r, *first;
> +	struct xe_gt_tlb_invalidation_fence
> +		fence[XE_MAX_TILES_PER_DEVICE * XE_MAX_GT_PER_TILE];
> +	u64 adj_start =3D mmu_range->start, adj_end =3D mmu_range->end;
> +	u8 tile_mask =3D 0;
> +	u8 id;
> +	u32 fence_id =3D 0;
> +	long err;
> +
> +	if (xe_vm_is_closed(vm))
> +		return;

How do we ensure we don't race here? Are we sure that all dma mappings
and all PTEs pointing to the range is gone at this point? Becase "They
will soon be gone anyway" isn't enough.

> +
> +	/* Adjust invalidation to notifier boundaries */
> +	if (adj_start < notifier->interval.start)
> +		adj_start =3D notifier->interval.start;
> +	if (adj_end > notifier->interval.end)
> +		adj_end =3D notifier->interval.end;
> +
> +	first =3D drm_gpusvm_range_find(notifier, adj_start, adj_end);
> +	if (!first)
> +		return;
> +
> +	/*
> +	 * XXX: Less than ideal to always wait on VM's resv slots if
> an
> +	 * invalidation is not required. Could walk range list twice
> to figure
> +	 * out if an invalidations is need, but also not ideal.
> Maybe a counter
> +	 * within the notifier, seems like that could work.
> +	 */
> +	err =3D dma_resv_wait_timeout(xe_vm_resv(vm),
> +				=C2=A0=C2=A0=C2=A0 DMA_RESV_USAGE_BOOKKEEP,
> +				=C2=A0=C2=A0=C2=A0 false, MAX_SCHEDULE_TIMEOUT);
> +	XE_WARN_ON(err <=3D 0);
> +
> +	r =3D first;
> +	drm_gpusvm_for_each_range(r, notifier, adj_start, adj_end)
> +		tile_mask |=3D xe_svm_range_notifier_event_begin(vm,
> r, mmu_range,
> +							=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> &adj_start,
> +							=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> &adj_end);
> +	if (!tile_mask)
> +		goto range_notifier_event_end;
> +
> +	xe_device_wmb(xe);
> +
> +	for_each_tile(tile, xe, id) {
> +		if (tile_mask & BIT(id)) {
> +			int err;
> +
> +			xe_gt_tlb_invalidation_fence_init(tile-
> >primary_gt,
> +							=C2=A0
> &fence[fence_id], true);
> +
> +			err =3D xe_gt_tlb_invalidation_range(tile-
> >primary_gt,
> +							=C2=A0=C2=A0
> &fence[fence_id],
> +							=C2=A0=C2=A0
> adj_start,
> +							=C2=A0=C2=A0 adj_end,
> +							=C2=A0=C2=A0 vm-
> >usm.asid);
> +			if (WARN_ON_ONCE(err < 0))
> +				goto wait;
> +			++fence_id;
> +
> +			if (!tile->media_gt)
> +				continue;
> +
> +			xe_gt_tlb_invalidation_fence_init(tile-
> >media_gt,
> +							=C2=A0
> &fence[fence_id], true);
> +
> +			err =3D xe_gt_tlb_invalidation_range(tile-
> >media_gt,
> +							=C2=A0=C2=A0
> &fence[fence_id],
> +							=C2=A0=C2=A0
> adj_start,
> +							=C2=A0=C2=A0 adj_end,
> +							=C2=A0=C2=A0 vm-
> >usm.asid);
> +			if (WARN_ON_ONCE(err < 0))
> +				goto wait;
> +			++fence_id;
> +		}
> +	}
> +
> +wait:
> +	for (id =3D 0; id < fence_id; ++id)
> +		xe_gt_tlb_invalidation_fence_wait(&fence[id]);
> +
> +range_notifier_event_end:
> +	r =3D first;
> +	drm_gpusvm_for_each_range(r, notifier, adj_start, adj_end)
> +		xe_svm_range_notifier_event_end(vm, r, mmu_range);
> =C2=A0}
> =C2=A0
> =C2=A0static const struct drm_gpusvm_ops gpusvm_ops =3D {
> +	.range_alloc =3D xe_svm_range_alloc,
> +	.range_free =3D xe_svm_range_free,
> =C2=A0	.invalidate =3D xe_svm_invalidate,
> =C2=A0};
> =C2=A0
> @@ -36,6 +206,11 @@ int xe_svm_init(struct xe_vm *vm)
> =C2=A0
> =C2=A0void xe_svm_close(struct xe_vm *vm)
> =C2=A0{
> +	xe_assert(vm->xe, xe_vm_is_closed(vm));
> +
> +	/* Flush running notifiers making xe_vm_close() visable */
> +	drm_gpusvm_notifier_lock(&vm->svm.gpusvm);
> +	drm_gpusvm_notifier_unlock(&vm->svm.gpusvm);

Calling mmu_notifier_read_begin() ensures that nothing is invalidating
on the range. Probably a better choice.

> =C2=A0}
> =C2=A0
> =C2=A0void xe_svm_fini(struct xe_vm *vm)
> @@ -44,3 +219,31 @@ void xe_svm_fini(struct xe_vm *vm)
> =C2=A0
> =C2=A0	drm_gpusvm_fini(&vm->svm.gpusvm);
> =C2=A0}
> +
> +int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
> +			=C2=A0=C2=A0=C2=A0 struct xe_tile *tile, u64 fault_addr,
> +			=C2=A0=C2=A0=C2=A0 bool atomic)
> +{
> +	struct drm_gpusvm_ctx ctx =3D { .read_only =3D
> xe_vma_read_only(vma), };
> +	struct drm_gpusvm_range *r;
> +	int err;
> +
> +	lockdep_assert_held_write(&vm->lock);
> +
> +retry:
> +	/* TODO: Run garbage collector */
> +
> +	r =3D drm_gpusvm_range_find_or_insert(&vm->svm.gpusvm,
> fault_addr,
> +					=C2=A0=C2=A0=C2=A0 xe_vma_start(vma),
> xe_vma_end(vma),
> +					=C2=A0=C2=A0=C2=A0 &ctx);
> +	if (IS_ERR(r))
> +		return PTR_ERR(r);
> +
> +	err =3D drm_gpusvm_range_get_pages(&vm->svm.gpusvm, r, false);
> +	if (err =3D=3D -EFAULT || err =3D=3D -EPERM)	/* Corner where CPU
> mappings have change */

s/change/changed/

> +	=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 goto retry;
> +
> +	/* TODO: Issue bind */
> +
> +	return err;
> +}
> diff --git a/drivers/gpu/drm/xe/xe_svm.h
> b/drivers/gpu/drm/xe/xe_svm.h
> index 376e86876a11..c91c5f538024 100644
> --- a/drivers/gpu/drm/xe/xe_svm.h
> +++ b/drivers/gpu/drm/xe/xe_svm.h
> @@ -6,14 +6,27 @@
> =C2=A0#ifndef _XE_SVM_H_
> =C2=A0#define _XE_SVM_H_
> =C2=A0
> +#include "drm_gpusvm.h"
> =C2=A0#include "drm_pagemap.h"
> =C2=A0
> =C2=A0#define XE_INTERCONNECT_VRAM DRM_INTERCONNECT_DRIVER

Not used yet

> =C2=A0
> +struct xe_tile;
> =C2=A0struct xe_vm;
> +struct xe_vma;
> +
> +struct xe_svm_range {
> +	struct drm_gpusvm_range base;
> +	u8 tile_present;
> +	u8 tile_invalidated;
> +};

Kerneldoc


> =C2=A0
> =C2=A0int xe_svm_init(struct xe_vm *vm);
> =C2=A0void xe_svm_fini(struct xe_vm *vm);
> =C2=A0void xe_svm_close(struct xe_vm *vm);
> =C2=A0
> +int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
> +			=C2=A0=C2=A0=C2=A0 struct xe_tile *tile, u64 fault_addr,
> +			=C2=A0=C2=A0=C2=A0 bool atomic);
> +
> =C2=A0#endif

Thanks,
Thomas

