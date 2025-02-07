Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84CAEA2C0A9
	for <lists+dri-devel@lfdr.de>; Fri,  7 Feb 2025 11:34:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCE2E10EA9C;
	Fri,  7 Feb 2025 10:34:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aDhgdawS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00C4610EAB1;
 Fri,  7 Feb 2025 10:33:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738924387; x=1770460387;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=eZy9Gb5gLT8uTvv3UiwN5DarZza67t3nwXUh5IJLW9U=;
 b=aDhgdawSAeTYpl19bQNnJZMrJ1rU/16bZoy1cZa/nk5vG8TnJDgoz5SO
 nI3+G9gSXAE8uz9Xo02EnHVv5qgoZgIygYgXQPMbX0yd8qozXbR/pp1tS
 XUS/8uBQ+GLf7pFpvCDAukBGKQ3+8M5BBz/4eh88e1AVdjnbmeLbD/7Je
 nnuhC8jqKOh48mXOZ6jg1SgdfoTF8941YbFpQU/ZKtE2yecbdE9UHbsTy
 LxwkOPwsfP56XUe6PKV5wEhvnMcby+vbvcmS8+16/FoYiR5NhSZSDygNZ
 D/OlQO+Sh4vqBbqGYJ5kqChvHcZWnNNl9YEhuKxGBt4qFUdLXUetWxOAi g==;
X-CSE-ConnectionGUID: W5N1A47JQJWyNvCCCYCeEw==
X-CSE-MsgGUID: ZYprOvG9SmuCNaXrWhJBuQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="39467673"
X-IronPort-AV: E=Sophos;i="6.13,266,1732608000"; d="scan'208";a="39467673"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2025 02:33:03 -0800
X-CSE-ConnectionGUID: CcyQaBGwQHi04qb+1OCsWQ==
X-CSE-MsgGUID: CGoLT5e/R9mXOok86LPqRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,266,1732608000"; d="scan'208";a="111274577"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO [10.245.246.108])
 ([10.245.246.108])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2025 02:33:00 -0800
Message-ID: <97a9153d05a8c8a20adc2590643cd01875031a9a.camel@linux.intel.com>
Subject: Re: [PATCH v4 12/33] drm/xe: Add SVM range invalidation and page
 fault handler
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com, apopple@nvidia.com, airlied@gmail.com, 
 simona.vetter@ffwll.ch, felix.kuehling@amd.com, dakr@kernel.org
Date: Fri, 07 Feb 2025 11:32:56 +0100
In-Reply-To: <20250129195212.745731-13-matthew.brost@intel.com>
References: <20250129195212.745731-1-matthew.brost@intel.com>
 <20250129195212.745731-13-matthew.brost@intel.com>
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

On Wed, 2025-01-29 at 11:51 -0800, Matthew Brost wrote:
> Add SVM range invalidation vfunc which invalidates PTEs. A new PT
> layer
> function which accepts a SVM range is added to support this. In
> addition, add the basic page fault handler which allocates a SVM
> range
> which is used by SVM range invalidation vfunc.
>=20
> v2:
> =C2=A0- Don't run invalidation if VM is closed
> =C2=A0- Cycle notifier lock in xe_svm_close
> =C2=A0- Drop xe_gt_tlb_invalidation_fence_fini
> v3:
> =C2=A0- Better commit message (Thomas)
> =C2=A0- Add lockdep asserts (Thomas)
> =C2=A0- Add kernel doc (Thomas)
> =C2=A0- s/change/changed (Thomas)
> =C2=A0- Use new GPU SVM range / notifier structures
> =C2=A0- Ensure PTEs are zapped / dma mappings are unmapped on VM close
> (Thomas)
> v4:
> =C2=A0- Fix macro (Checkpatch)
>=20
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>

> ---
> =C2=A0drivers/gpu/drm/xe/xe_gt_pagefault.c |=C2=A0 17 +-
> =C2=A0drivers/gpu/drm/xe/xe_pt.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 41 +++++
> =C2=A0drivers/gpu/drm/xe/xe_pt.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 2 +
> =C2=A0drivers/gpu/drm/xe/xe_svm.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 | 223
> ++++++++++++++++++++++++++-
> =C2=A0drivers/gpu/drm/xe/xe_svm.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0 32 ++++
> =C2=A0drivers/gpu/drm/xe/xe_vm.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 4 +
> =C2=A06 files changed, 313 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c
> b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> index 2606cd396df5..7e71bf604ae8 100644
> --- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
> +++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> @@ -18,6 +18,7 @@
> =C2=A0#include "xe_guc.h"
> =C2=A0#include "xe_guc_ct.h"
> =C2=A0#include "xe_migrate.h"
> +#include "xe_svm.h"
> =C2=A0#include "xe_trace_bo.h"
> =C2=A0#include "xe_vm.h"
> =C2=A0
> @@ -124,18 +125,17 @@ static int xe_pf_begin(struct drm_exec *exec,
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
> @@ -206,6 +206,7 @@ static int handle_pagefault(struct xe_gt *gt,
> struct pagefault *pf)
> =C2=A0	struct xe_vm *vm;
> =C2=A0	struct xe_vma *vma =3D NULL;
> =C2=A0	int err;
> +	bool atomic;
> =C2=A0
> =C2=A0	/* SW isn't expected to handle TRTT faults */
> =C2=A0	if (pf->trva_fault)
> @@ -231,7 +232,13 @@ static int handle_pagefault(struct xe_gt *gt,
> struct pagefault *pf)
> =C2=A0		goto unlock_vm;
> =C2=A0	}
> =C2=A0
> -	err =3D handle_vma_pagefault(tile, pf, vma);
> +	atomic =3D access_is_atomic(pf->access_type);
> +
> +	if (xe_vma_is_cpu_addr_mirror(vma))
> +		err =3D xe_svm_handle_pagefault(vm, vma, tile,
> +					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pf->page_addr,
> atomic);
> +	else
> +		err =3D handle_vma_pagefault(tile, vma, atomic);
> =C2=A0
> =C2=A0unlock_vm:
> =C2=A0	if (!err)
> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> index c5060011ad43..a9aa1678437e 100644
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
> @@ -844,6 +845,46 @@ bool xe_pt_zap_ptes(struct xe_tile *tile, struct
> xe_vma *vma)
> =C2=A0	return xe_walk.needs_invalidate;
> =C2=A0}
> =C2=A0
> +/**
> + * xe_pt_zap_ptes_range() - Zap (zero) gpu ptes of a SVM range
> + * @tile: The tile we're zapping for.
> + * @vm: The VM we're zapping for.
> + * @range: The SVM range we're zapping for.
> + *
> + * SVM invalidation needs to be able to zap the gpu ptes of a given
> address
> + * range. In order to be able to do that, that function needs access
> to the
> + * shared page-table entries so it can either clear the leaf PTEs or
> + * clear the pointers to lower-level page-tables. The caller is
> required
> + * to hold the SVM notifier lock.
> + *
> + * Return: Whether ptes were actually updated and a TLB invalidation
> is
> + * required.
> + */
> +bool xe_pt_zap_ptes_range(struct xe_tile *tile, struct xe_vm *vm,
> +			=C2=A0 struct xe_svm_range *range)
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
> +	xe_svm_assert_in_notifier(vm);
> +
> +	if (!(pt_mask & BIT(tile->id)))
> +		return false;
> +
> +	(void)xe_pt_walk_shared(&pt->base, pt->level, range-
> >base.itree.start,
> +				range->base.itree.last + 1,
> &xe_walk.base);
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
> index 8e43912ae8e9..5ecf003d513c 100644
> --- a/drivers/gpu/drm/xe/xe_pt.h
> +++ b/drivers/gpu/drm/xe/xe_pt.h
> @@ -45,5 +45,7 @@ void xe_pt_update_ops_fini(struct xe_tile *tile,
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
> index 79da859f02b1..bd7b9c6ea229 100644
> --- a/drivers/gpu/drm/xe/xe_svm.c
> +++ b/drivers/gpu/drm/xe/xe_svm.c
> @@ -3,18 +3,198 @@
> =C2=A0 * Copyright =C2=A9 2024 Intel Corporation
> =C2=A0 */
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
> +	xe_svm_assert_in_notifier(vm);
> +
> +	/* Skip if already unmapped or if no binding exist */
> +	if (range->base.flags.unmapped || !range->tile_present)
> +		return 0;
> +
> +	/* Adjust invalidation to range boundaries */
> +	if (range->base.itree.start < mmu_range->start)
> +		*adj_start =3D range->base.itree.start;
> +	if (range->base.itree.last + 1 > mmu_range->end)
> +		*adj_end =3D range->base.itree.last + 1;
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
> +	xe_svm_assert_in_notifier(vm);
> +
> +	drm_gpusvm_range_unmap_pages(&vm->svm.gpusvm, r, &ctx);
> +	/* TODO: Add range to garbage collector if VM is not closed
> */
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
> +	xe_svm_assert_in_notifier(vm);
> +
> +	/* Adjust invalidation to notifier boundaries */
> +	if (adj_start < notifier->itree.start)
> +		adj_start =3D notifier->itree.start;
> +	if (adj_end > notifier->itree.last + 1)
> +		adj_end =3D notifier->itree.last + 1;
> +
> +	first =3D drm_gpusvm_range_find(notifier, adj_start, adj_end);
> +	if (!first)
> +		return;
> +
> +	/*
> +	 * PTs may be getting destroyed so not safe to touch these
> but PT should
> +	 * be invalidated at this point in time. Regardless we still
> need to
> +	 * ensure any dma mappings are unmapped in the here.
> +	 */
> +	if (xe_vm_is_closed(vm))
> +		goto range_notifier_event_end;
> +
> +	/*
> +	 * XXX: Less than ideal to always wait on VM's resv slots if
> an
> +	 * invalidation is not required. Could walk range list twice
> to figure
> +	 * out if an invalidations is need, but also not ideal.
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
> @@ -71,3 +251,44 @@ void xe_svm_fini(struct xe_vm *vm)
> =C2=A0
> =C2=A0	drm_gpusvm_fini(&vm->svm.gpusvm);
> =C2=A0}
> +
> +/**
> + * xe_svm_handle_pagefault() - SVM handle page fault
> + * @vm: The VM.
> + * @vma: The CPU address mirror VMA.
> + * @tile: The tile upon the fault occurred.
> + * @fault_addr: The GPU fault address.
> + * @atomic: The fault atomic access bit.
> + *
> + * Create GPU bindings for a SVM page fault.
> + *
> + * Return: 0 on success, negative error code on error.
> + */
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
> +	xe_assert(vm->xe, xe_vma_is_cpu_addr_mirror(vma));
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
> +	err =3D drm_gpusvm_range_get_pages(&vm->svm.gpusvm, r, &ctx);
> +	if (err =3D=3D -EFAULT || err =3D=3D -EPERM)	/* Corner where CPU
> mappings have changed */
> +		goto retry;
> +
> +	/* TODO: Issue bind */
> +
> +	return err;
> +}
> diff --git a/drivers/gpu/drm/xe/xe_svm.h
> b/drivers/gpu/drm/xe/xe_svm.h
> index 4569931db622..caf02138ae4f 100644
> --- a/drivers/gpu/drm/xe/xe_svm.h
> +++ b/drivers/gpu/drm/xe/xe_svm.h
> @@ -7,10 +7,29 @@
> =C2=A0#define _XE_SVM_H_
> =C2=A0
> =C2=A0#include <drm/drm_pagemap.h>
> +#include <drm/drm_gpusvm.h>
> =C2=A0
> =C2=A0#define XE_INTERCONNECT_VRAM DRM_INTERCONNECT_DRIVER
> =C2=A0
> +struct xe_tile;
> =C2=A0struct xe_vm;
> +struct xe_vma;
> +
> +/** struct xe_svm_range - SVM range */
> +struct xe_svm_range {
> +	/** @base: base drm_gpusvm_range */
> +	struct drm_gpusvm_range base;
> +	/**
> +	 * @tile_present: Tile mask of binding is present for this
> range.
> +	 * Protected by GPU SVM notifier lock.
> +	 */
> +	u8 tile_present;
> +	/**
> +	 * @tile_invalidated: Tile mask of binding is invalidated
> for this
> +	 * range. Protected by GPU SVM notifier lock.
> +	 */
> +	u8 tile_invalidated;
> +};
> =C2=A0
> =C2=A0int xe_svm_init(struct xe_vm *vm);
> =C2=A0
> @@ -18,4 +37,17 @@ void xe_svm_fini(struct xe_vm *vm);
> =C2=A0
> =C2=A0void xe_svm_close(struct xe_vm *vm);
> =C2=A0
> +int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
> +			=C2=A0=C2=A0=C2=A0 struct xe_tile *tile, u64 fault_addr,
> +			=C2=A0=C2=A0=C2=A0 bool atomic);
> +
> +#define xe_svm_assert_in_notifier(vm__) \
> +	lockdep_assert_held_write(&(vm__)->svm.gpusvm.notifier_lock)
> +
> +#define xe_svm_notifier_lock(vm__)	\
> +	drm_gpusvm_notifier_lock(&(vm__)->svm.gpusvm)
> +
> +#define xe_svm_notifier_unlock(vm__)	\
> +	drm_gpusvm_notifier_unlock(&(vm__)->svm.gpusvm)
> +
> =C2=A0#endif
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 82026c5a154d..8a8d2e6032bd 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -1540,6 +1540,8 @@ static void xe_vm_close(struct xe_vm *vm)
> =C2=A0	bool migration =3D (vm->flags & XE_VM_FLAG_MIGRATION);
> =C2=A0
> =C2=A0	down_write(&vm->lock);
> +	if (xe_vm_in_fault_mode(vm))
> +		xe_svm_notifier_lock(vm);
> =C2=A0
> =C2=A0	vm->size =3D 0;
> =C2=A0
> @@ -1561,6 +1563,8 @@ static void xe_vm_close(struct xe_vm *vm)
> =C2=A0			xe_gt_tlb_invalidation_vm(gt, vm);
> =C2=A0	}
> =C2=A0
> +	if (xe_vm_in_fault_mode(vm))
> +		xe_svm_notifier_unlock(vm);
> =C2=A0	up_write(&vm->lock);
> =C2=A0}
> =C2=A0

