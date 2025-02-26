Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C6C1A46738
	for <lists+dri-devel@lfdr.de>; Wed, 26 Feb 2025 18:00:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA6C110E98A;
	Wed, 26 Feb 2025 17:00:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IzEnNFMg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE76610E97F;
 Wed, 26 Feb 2025 17:00:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740589228; x=1772125228;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=BI8jFIwZXL+/a1ANr6UVtfHiuyIvOqERcmKL6+aI4ZI=;
 b=IzEnNFMgcV+f5Gfax+n9Y6N9y9aukFTTnrUAIR5Afqstj9ylYS9BVGPQ
 eK/xjrHZUJwEVjI4ony9G1bcavPcG+d9BpESuA2or5szuiYiSbEBoQ4F1
 gUAaeqX4w1f/dfU3z7vkYJXc+utHjkm05RxQJHmoaqwKWc73zmpHrg7uy
 1E5S226Jm+UL4O36FwpSTXQUyfbJ3EDlnLxQETC0lFY2f/Ivm7JCOnGru
 QG+MoS+hr+KDgj0dOIDKNc1jVjpSoosK2ziSFzinXNwyVPjgEvYihPfyY
 ck93KrcB8o2G7tv8NA7WdCRc0lKDACv29fqcZEMdS2hrgiFR7wannzUFa g==;
X-CSE-ConnectionGUID: LB24h0oyT/qjx4VAZM0fHA==
X-CSE-MsgGUID: 7bZHnF98TzeX8IxvTMuueg==
X-IronPort-AV: E=McAfee;i="6700,10204,11357"; a="41576995"
X-IronPort-AV: E=Sophos;i="6.13,317,1732608000"; d="scan'208";a="41576995"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2025 09:00:27 -0800
X-CSE-ConnectionGUID: kaYeNzKuRfaV9Fav/O94JA==
X-CSE-MsgGUID: SrtjqQ5kRV6mnp8qFp6SwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,317,1732608000"; d="scan'208";a="139971195"
Received: from dprybysh-mobl.ger.corp.intel.com (HELO [10.245.246.144])
 ([10.245.246.144])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2025 09:00:25 -0800
Message-ID: <22c0bae01011556af4ac953bb36d22c994a25b20.camel@linux.intel.com>
Subject: Re: [PATCH v6 14/32] drm/xe: Add (re)bind to SVM page fault handler
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com, apopple@nvidia.com, airlied@gmail.com, 
 simona.vetter@ffwll.ch, felix.kuehling@amd.com, dakr@kernel.org
Date: Wed, 26 Feb 2025 18:00:22 +0100
In-Reply-To: <20250225044311.3178695-15-matthew.brost@intel.com>
References: <20250225044311.3178695-1-matthew.brost@intel.com>
 <20250225044311.3178695-15-matthew.brost@intel.com>
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

On Mon, 2025-02-24 at 20:42 -0800, Matthew Brost wrote:
> Add (re)bind to SVM page fault handler. To facilitate add support
> function to VM layer which (re)binds a SVM range. Also teach PT layer
> to
> understand (re)binds of SVM ranges.
>=20
> v2:
> =C2=A0- Don't assert BO lock held for range binds
> =C2=A0- Use xe_svm_notifier_lock/unlock helper in xe_svm_close
> =C2=A0- Use drm_pagemap dma cursor
> =C2=A0- Take notifier lock in bind code to check range state
> v3:
> =C2=A0- Use new GPU SVM range structure (Thomas)
> =C2=A0- Kernel doc (Thomas)
> =C2=A0- s/DRM_GPUVA_OP_USER/DRM_GPUVA_OP_DRIVER (Thomas)
> v5:
> =C2=A0- Kernel doc (Thomas)
> v6:
> =C2=A0- Only compile if CONFIG_DRM_GPUSVM selected (CI, Lucas)
>=20
> Signed-off-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>

This LGTM but since I'm a co-author to some of the code, we'd need an
additional reviewer.

/Thomas



> ---
> =C2=A0drivers/gpu/drm/xe/xe_pt.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 17=
0 +++++++++++++++++++++++++++--
> --
> =C2=A0drivers/gpu/drm/xe/xe_pt_types.h |=C2=A0=C2=A0 2 +
> =C2=A0drivers/gpu/drm/xe/xe_svm.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 4=
4 +++++++-
> =C2=A0drivers/gpu/drm/xe/xe_svm.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 2=
8 +++++
> =C2=A0drivers/gpu/drm/xe/xe_vm.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=
=A0 92 +++++++++++++++++
> =C2=A0drivers/gpu/drm/xe/xe_vm.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=
=A0=C2=A0 5 +
> =C2=A0drivers/gpu/drm/xe/xe_vm_types.h |=C2=A0 19 ++++
> =C2=A07 files changed, 340 insertions(+), 20 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> index a9aa1678437e..cb63596dbfbf 100644
> --- a/drivers/gpu/drm/xe/xe_pt.c
> +++ b/drivers/gpu/drm/xe/xe_pt.c
> @@ -602,6 +602,7 @@ static const struct xe_pt_walk_ops
> xe_pt_stage_bind_ops =3D {
> =C2=A0 * range.
> =C2=A0 * @tile: The tile we're building for.
> =C2=A0 * @vma: The vma indicating the address range.
> + * @range: The range indicating the address range.
> =C2=A0 * @entries: Storage for the update entries used for connecting the
> tree to
> =C2=A0 * the main tree at commit time.
> =C2=A0 * @num_entries: On output contains the number of @entries used.
> @@ -617,6 +618,7 @@ static const struct xe_pt_walk_ops
> xe_pt_stage_bind_ops =3D {
> =C2=A0 */
> =C2=A0static int
> =C2=A0xe_pt_stage_bind(struct xe_tile *tile, struct xe_vma *vma,
> +		 struct xe_svm_range *range,
> =C2=A0		 struct xe_vm_pgtable_update *entries, u32
> *num_entries)
> =C2=A0{
> =C2=A0	struct xe_device *xe =3D tile_to_xe(tile);
> @@ -633,14 +635,38 @@ xe_pt_stage_bind(struct xe_tile *tile, struct
> xe_vma *vma,
> =C2=A0		.vm =3D xe_vma_vm(vma),
> =C2=A0		.tile =3D tile,
> =C2=A0		.curs =3D &curs,
> -		.va_curs_start =3D xe_vma_start(vma),
> +		.va_curs_start =3D range ? range->base.itree.start :
> +			xe_vma_start(vma),
> =C2=A0		.vma =3D vma,
> =C2=A0		.wupd.entries =3D entries,
> -		.needs_64K =3D (xe_vma_vm(vma)->flags &
> XE_VM_FLAG_64K) && is_devmem,
> =C2=A0	};
> =C2=A0	struct xe_pt *pt =3D xe_vma_vm(vma)->pt_root[tile->id];
> =C2=A0	int ret;
> =C2=A0
> +	if (range) {
> +		/* Move this entire thing to xe_svm.c? */
> +		xe_svm_notifier_lock(xe_vma_vm(vma));
> +		if (!xe_svm_range_pages_valid(range)) {
> +			xe_svm_notifier_unlock(xe_vma_vm(vma));
> +			return -EAGAIN;
> +		}
> +		if (xe_svm_range_has_dma_mapping(range)) {
> +			xe_res_first_dma(range->base.dma_addr, 0,
> +					 range->base.itree.last + 1
> - range->base.itree.start,
> +					 &curs);
> +			is_devmem =3D xe_res_is_vram(&curs);
> +		} else {
> +			xe_assert(xe, false);
> +		}
> +		/*
> +		 * Note, when unlocking the resource cursor dma
> addresses may become
> +		 * stale, but the bind will be aborted anyway att
> commit time.
> +		 */
> +		xe_svm_notifier_unlock(xe_vma_vm(vma));
> +	}
> +
> +	xe_walk.needs_64K =3D (xe_vma_vm(vma)->flags & XE_VM_FLAG_64K)
> && is_devmem;
> +
> =C2=A0	/**
> =C2=A0	 * Default atomic expectations for different allocation
> scenarios are as follows:
> =C2=A0	 *
> @@ -662,7 +688,7 @@ xe_pt_stage_bind(struct xe_tile *tile, struct
> xe_vma *vma,
> =C2=A0			 * gets migrated to LMEM, bind such
> allocations with
> =C2=A0			 * device atomics enabled.
> =C2=A0			 */
> -			else if (is_devmem &&
> !xe_bo_has_single_placement(bo))
> +			else if (is_devmem)
> =C2=A0				xe_walk.default_pte |=3D
> XE_USM_PPGTT_PTE_AE;
> =C2=A0		} else {
> =C2=A0			xe_walk.default_pte |=3D XE_USM_PPGTT_PTE_AE;
> @@ -678,15 +704,16 @@ xe_pt_stage_bind(struct xe_tile *tile, struct
> xe_vma *vma,
> =C2=A0
> =C2=A0	if (is_devmem) {
> =C2=A0		xe_walk.default_pte |=3D XE_PPGTT_PTE_DM;
> -		xe_walk.dma_offset =3D vram_region_gpu_offset(bo-
> >ttm.resource);
> +		xe_walk.dma_offset =3D bo ? vram_region_gpu_offset(bo-
> >ttm.resource) : 0;
> =C2=A0	}
> =C2=A0
> =C2=A0	if (!xe_vma_has_no_bo(vma) && xe_bo_is_stolen(bo))
> =C2=A0		xe_walk.dma_offset =3D
> xe_ttm_stolen_gpu_offset(xe_bo_device(bo));
> =C2=A0
> -	xe_bo_assert_held(bo);
> +	if (!range)
> +		xe_bo_assert_held(bo);
> =C2=A0
> -	if (!xe_vma_is_null(vma)) {
> +	if (!xe_vma_is_null(vma) && !range) {
> =C2=A0		if (xe_vma_is_userptr(vma))
> =C2=A0			xe_res_first_sg(to_userptr_vma(vma)-
> >userptr.sg, 0,
> =C2=A0					xe_vma_size(vma), &curs);
> @@ -696,12 +723,14 @@ xe_pt_stage_bind(struct xe_tile *tile, struct
> xe_vma *vma,
> =C2=A0		else
> =C2=A0			xe_res_first_sg(xe_bo_sg(bo),
> xe_vma_bo_offset(vma),
> =C2=A0					xe_vma_size(vma), &curs);
> -	} else {
> +	} else if (!range) {
> =C2=A0		curs.size =3D xe_vma_size(vma);
> =C2=A0	}
> =C2=A0
> -	ret =3D xe_pt_walk_range(&pt->base, pt->level,
> xe_vma_start(vma),
> -			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 xe_vma_end(vma), &xe_walk.base);
> +	ret =3D xe_pt_walk_range(&pt->base, pt->level,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 range ? range->base.itree.start =
:
> xe_vma_start(vma),
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 range ? range->base.itree.last +=
 1 :
> xe_vma_end(vma),
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &xe_walk.base);
> =C2=A0
> =C2=A0	*num_entries =3D xe_walk.wupd.num_used_entries;
> =C2=A0	return ret;
> @@ -934,7 +963,7 @@ static void xe_pt_commit_locks_assert(struct
> xe_vma *vma)
> =C2=A0
> =C2=A0	lockdep_assert_held(&vm->lock);
> =C2=A0
> -	if (!xe_vma_is_userptr(vma) && !xe_vma_is_null(vma))
> +	if (!xe_vma_has_no_bo(vma))
> =C2=A0		dma_resv_assert_held(xe_vma_bo(vma)->ttm.base.resv);
> =C2=A0
> =C2=A0	xe_vm_assert_held(vm);
> @@ -1036,12 +1065,13 @@ static void xe_pt_free_bind(struct
> xe_vm_pgtable_update *entries,
> =C2=A0
> =C2=A0static int
> =C2=A0xe_pt_prepare_bind(struct xe_tile *tile, struct xe_vma *vma,
> +		=C2=A0=C2=A0 struct xe_svm_range *range,
> =C2=A0		=C2=A0=C2=A0 struct xe_vm_pgtable_update *entries, u32
> *num_entries)
> =C2=A0{
> =C2=A0	int err;
> =C2=A0
> =C2=A0	*num_entries =3D 0;
> -	err =3D xe_pt_stage_bind(tile, vma, entries, num_entries);
> +	err =3D xe_pt_stage_bind(tile, vma, range, entries,
> num_entries);
> =C2=A0	if (!err)
> =C2=A0		xe_tile_assert(tile, *num_entries);
> =C2=A0
> @@ -1147,6 +1177,8 @@ static int op_add_deps(struct xe_vm *vm, struct
> xe_vma_op *op,
> =C2=A0	case DRM_GPUVA_OP_PREFETCH:
> =C2=A0		err =3D vma_add_deps(gpuva_to_vma(op-
> >base.prefetch.va), job);
> =C2=A0		break;
> +	case DRM_GPUVA_OP_DRIVER:
> +		break;
> =C2=A0	default:
> =C2=A0		drm_warn(&vm->xe->drm, "NOT POSSIBLE");
> =C2=A0	}
> @@ -1371,6 +1403,34 @@ static int xe_pt_userptr_pre_commit(struct
> xe_migrate_pt_update *pt_update)
> =C2=A0	return err;
> =C2=A0}
> =C2=A0
> +static int xe_pt_svm_pre_commit(struct xe_migrate_pt_update
> *pt_update)
> +{
> +	struct xe_vm *vm =3D pt_update->vops->vm;
> +	struct xe_vma_ops *vops =3D pt_update->vops;
> +	struct xe_vma_op *op;
> +	int err;
> +
> +	err =3D xe_pt_pre_commit(pt_update);
> +	if (err)
> +		return err;
> +
> +	xe_svm_notifier_lock(vm);
> +
> +	list_for_each_entry(op, &vops->list, link) {
> +		struct xe_svm_range *range =3D op->map_range.range;
> +
> +		xe_assert(vm->xe, xe_vma_is_cpu_addr_mirror(op-
> >map_range.vma));
> +		xe_assert(vm->xe, op->subop =3D=3D
> XE_VMA_SUBOP_MAP_RANGE);
> +
> +		if (!xe_svm_range_pages_valid(range)) {
> +			xe_svm_notifier_unlock(vm);
> +			return -EAGAIN;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
> =C2=A0struct invalidation_fence {
> =C2=A0	struct xe_gt_tlb_invalidation_fence base;
> =C2=A0	struct xe_gt *gt;
> @@ -1663,12 +1723,12 @@ xe_pt_commit_prepare_unbind(struct xe_vma
> *vma,
> =C2=A0
> =C2=A0static void
> =C2=A0xe_pt_update_ops_rfence_interval(struct xe_vm_pgtable_update_ops
> *pt_update_ops,
> -				 struct xe_vma *vma)
> +				 u64 start, u64 end)
> =C2=A0{
> +	u64 last;
> =C2=A0	u32 current_op =3D pt_update_ops->current_op;
> =C2=A0	struct xe_vm_pgtable_update_op *pt_op =3D &pt_update_ops-
> >ops[current_op];
> =C2=A0	int i, level =3D 0;
> -	u64 start, last;
> =C2=A0
> =C2=A0	for (i =3D 0; i < pt_op->num_entries; i++) {
> =C2=A0		const struct xe_vm_pgtable_update *entry =3D &pt_op-
> >entries[i];
> @@ -1678,8 +1738,8 @@ xe_pt_update_ops_rfence_interval(struct
> xe_vm_pgtable_update_ops *pt_update_ops,
> =C2=A0	}
> =C2=A0
> =C2=A0	/* Greedy (non-optimal) calculation but simple */
> -	start =3D ALIGN_DOWN(xe_vma_start(vma), 0x1ull <<
> xe_pt_shift(level));
> -	last =3D ALIGN(xe_vma_end(vma), 0x1ull << xe_pt_shift(level))
> - 1;
> +	start =3D ALIGN_DOWN(start, 0x1ull << xe_pt_shift(level));
> +	last =3D ALIGN(end, 0x1ull << xe_pt_shift(level)) - 1;
> =C2=A0
> =C2=A0	if (start < pt_update_ops->start)
> =C2=A0		pt_update_ops->start =3D start;
> @@ -1721,7 +1781,7 @@ static int bind_op_prepare(struct xe_vm *vm,
> struct xe_tile *tile,
> =C2=A0	if (err)
> =C2=A0		return err;
> =C2=A0
> -	err =3D xe_pt_prepare_bind(tile, vma, pt_op->entries,
> +	err =3D xe_pt_prepare_bind(tile, vma, NULL, pt_op->entries,
> =C2=A0				 &pt_op->num_entries);
> =C2=A0	if (!err) {
> =C2=A0		xe_tile_assert(tile, pt_op->num_entries <=3D
> @@ -1729,7 +1789,9 @@ static int bind_op_prepare(struct xe_vm *vm,
> struct xe_tile *tile,
> =C2=A0		xe_vm_dbg_print_entries(tile_to_xe(tile), pt_op-
> >entries,
> =C2=A0					pt_op->num_entries, true);
> =C2=A0
> -		xe_pt_update_ops_rfence_interval(pt_update_ops,
> vma);
> +		xe_pt_update_ops_rfence_interval(pt_update_ops,
> +						 xe_vma_start(vma),
> +						 xe_vma_end(vma));
> =C2=A0		++pt_update_ops->current_op;
> =C2=A0		pt_update_ops->needs_userptr_lock |=3D
> xe_vma_is_userptr(vma);
> =C2=A0
> @@ -1763,6 +1825,48 @@ static int bind_op_prepare(struct xe_vm *vm,
> struct xe_tile *tile,
> =C2=A0	return err;
> =C2=A0}
> =C2=A0
> +static int bind_range_prepare(struct xe_vm *vm, struct xe_tile
> *tile,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct xe_vm_pgtable_update_ops
> *pt_update_ops,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct xe_vma *vma, struct
> xe_svm_range *range)
> +{
> +	u32 current_op =3D pt_update_ops->current_op;
> +	struct xe_vm_pgtable_update_op *pt_op =3D &pt_update_ops-
> >ops[current_op];
> +	int err;
> +
> +	xe_tile_assert(tile, xe_vma_is_cpu_addr_mirror(vma));
> +
> +	vm_dbg(&xe_vma_vm(vma)->xe->drm,
> +	=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "Preparing bind, with range [%lx..=
.%lx)\n",
> +	=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 range->base.itree.start, range->ba=
se.itree.last);
> +
> +	pt_op->vma =3D NULL;
> +	pt_op->bind =3D true;
> +	pt_op->rebind =3D BIT(tile->id) & range->tile_present;
> +
> +	err =3D xe_pt_prepare_bind(tile, vma, range, pt_op->entries,
> +				 &pt_op->num_entries);
> +	if (!err) {
> +		xe_tile_assert(tile, pt_op->num_entries <=3D
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ARRAY_SIZE(pt_op->entries));
> +		xe_vm_dbg_print_entries(tile_to_xe(tile), pt_op-
> >entries,
> +					pt_op->num_entries, true);
> +
> +		xe_pt_update_ops_rfence_interval(pt_update_ops,
> +						 range-
> >base.itree.start,
> +						 range-
> >base.itree.last + 1);
> +		++pt_update_ops->current_op;
> +		pt_update_ops->needs_svm_lock =3D true;
> +
> +		pt_op->vma =3D vma;
> +		xe_pt_commit_prepare_bind(vma, pt_op->entries,
> +					=C2=A0 pt_op->num_entries, pt_op-
> >rebind);
> +	} else {
> +		xe_pt_cancel_bind(vma, pt_op->entries, pt_op-
> >num_entries);
> +	}
> +
> +	return err;
> +}
> +
> =C2=A0static int unbind_op_prepare(struct xe_tile *tile,
> =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0 struct xe_vm_pgtable_update_ops
> *pt_update_ops,
> =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0 struct xe_vma *vma)
> @@ -1800,7 +1904,8 @@ static int unbind_op_prepare(struct xe_tile
> *tile,
> =C2=A0
> =C2=A0	xe_vm_dbg_print_entries(tile_to_xe(tile), pt_op->entries,
> =C2=A0				pt_op->num_entries, false);
> -	xe_pt_update_ops_rfence_interval(pt_update_ops, vma);
> +	xe_pt_update_ops_rfence_interval(pt_update_ops,
> xe_vma_start(vma),
> +					 xe_vma_end(vma));
> =C2=A0	++pt_update_ops->current_op;
> =C2=A0	pt_update_ops->needs_userptr_lock |=3D xe_vma_is_userptr(vma);
> =C2=A0	pt_update_ops->needs_invalidation =3D true;
> @@ -1870,6 +1975,15 @@ static int op_prepare(struct xe_vm *vm,
> =C2=A0		pt_update_ops->wait_vm_kernel =3D true;
> =C2=A0		break;
> =C2=A0	}
> +	case DRM_GPUVA_OP_DRIVER:
> +		if (op->subop =3D=3D XE_VMA_SUBOP_MAP_RANGE) {
> +			xe_assert(vm->xe,
> xe_vma_is_cpu_addr_mirror(op->map_range.vma));
> +
> +			err =3D bind_range_prepare(vm, tile,
> pt_update_ops,
> +						 op->map_range.vma,
> +						 op-
> >map_range.range);
> +		}
> +		break;
> =C2=A0	default:
> =C2=A0		drm_warn(&vm->xe->drm, "NOT POSSIBLE");
> =C2=A0	}
> @@ -2052,6 +2166,14 @@ static void op_commit(struct xe_vm *vm,
> =C2=A0				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fence2);
> =C2=A0		break;
> =C2=A0	}
> +	case DRM_GPUVA_OP_DRIVER:
> +	{
> +		if (op->subop =3D=3D XE_VMA_SUBOP_MAP_RANGE) {
> +			op->map_range.range->tile_present |=3D
> BIT(tile->id);
> +			op->map_range.range->tile_invalidated &=3D
> ~BIT(tile->id);
> +		}
> +		break;
> +	}
> =C2=A0	default:
> =C2=A0		drm_warn(&vm->xe->drm, "NOT POSSIBLE");
> =C2=A0	}
> @@ -2069,6 +2191,12 @@ static const struct xe_migrate_pt_update_ops
> userptr_migrate_ops =3D {
> =C2=A0	.pre_commit =3D xe_pt_userptr_pre_commit,
> =C2=A0};
> =C2=A0
> +static const struct xe_migrate_pt_update_ops svm_migrate_ops =3D {
> +	.populate =3D xe_vm_populate_pgtable,
> +	.clear =3D xe_migrate_clear_pgtable_callback,
> +	.pre_commit =3D xe_pt_svm_pre_commit,
> +};
> +
> =C2=A0/**
> =C2=A0 * xe_pt_update_ops_run() - Run PT update operations
> =C2=A0 * @tile: Tile of PT update operations
> @@ -2094,7 +2222,9 @@ xe_pt_update_ops_run(struct xe_tile *tile,
> struct xe_vma_ops *vops)
> =C2=A0	struct xe_vma_op *op;
> =C2=A0	int err =3D 0, i;
> =C2=A0	struct xe_migrate_pt_update update =3D {
> -		.ops =3D pt_update_ops->needs_userptr_lock ?
> +		.ops =3D pt_update_ops->needs_svm_lock ?
> +			&svm_migrate_ops :
> +			pt_update_ops->needs_userptr_lock ?
> =C2=A0			&userptr_migrate_ops :
> =C2=A0			&migrate_ops,
> =C2=A0		.vops =3D vops,
> @@ -2215,6 +2345,8 @@ xe_pt_update_ops_run(struct xe_tile *tile,
> struct xe_vma_ops *vops)
> =C2=A0				=C2=A0 &ifence->base.base, &mfence-
> >base.base);
> =C2=A0	}
> =C2=A0
> +	if (pt_update_ops->needs_svm_lock)
> +		xe_svm_notifier_unlock(vm);
> =C2=A0	if (pt_update_ops->needs_userptr_lock)
> =C2=A0		up_read(&vm->userptr.notifier_lock);
> =C2=A0
> diff --git a/drivers/gpu/drm/xe/xe_pt_types.h
> b/drivers/gpu/drm/xe/xe_pt_types.h
> index 384cc04de719..69eab6f37cfe 100644
> --- a/drivers/gpu/drm/xe/xe_pt_types.h
> +++ b/drivers/gpu/drm/xe/xe_pt_types.h
> @@ -104,6 +104,8 @@ struct xe_vm_pgtable_update_ops {
> =C2=A0	u32 num_ops;
> =C2=A0	/** @current_op: current operations */
> =C2=A0	u32 current_op;
> +	/** @needs_svm_lock: Needs SVM lock */
> +	bool needs_svm_lock;
> =C2=A0	/** @needs_userptr_lock: Needs userptr lock */
> =C2=A0	bool needs_userptr_lock;
> =C2=A0	/** @needs_invalidation: Needs invalidation */
> diff --git a/drivers/gpu/drm/xe/xe_svm.c
> b/drivers/gpu/drm/xe/xe_svm.c
> index 866872f75d5e..401583cf8e73 100644
> --- a/drivers/gpu/drm/xe/xe_svm.c
> +++ b/drivers/gpu/drm/xe/xe_svm.c
> @@ -258,6 +258,12 @@ void xe_svm_fini(struct xe_vm *vm)
> =C2=A0	drm_gpusvm_fini(&vm->svm.gpusvm);
> =C2=A0}
> =C2=A0
> +static bool xe_svm_range_is_valid(struct xe_svm_range *range,
> +				=C2=A0 struct xe_tile *tile)
> +{
> +	return (range->tile_present & ~range->tile_invalidated) &
> BIT(tile->id);
> +}
> +
> =C2=A0/**
> =C2=A0 * xe_svm_handle_pagefault() - SVM handle page fault
> =C2=A0 * @vm: The VM.
> @@ -275,7 +281,11 @@ int xe_svm_handle_pagefault(struct xe_vm *vm,
> struct xe_vma *vma,
> =C2=A0			=C2=A0=C2=A0=C2=A0 bool atomic)
> =C2=A0{
> =C2=A0	struct drm_gpusvm_ctx ctx =3D { .read_only =3D
> xe_vma_read_only(vma), };
> +	struct xe_svm_range *range;
> =C2=A0	struct drm_gpusvm_range *r;
> +	struct drm_exec exec;
> +	struct dma_fence *fence;
> +	ktime_t end =3D 0;
> =C2=A0	int err;
> =C2=A0
> =C2=A0	lockdep_assert_held_write(&vm->lock);
> @@ -290,11 +300,43 @@ int xe_svm_handle_pagefault(struct xe_vm *vm,
> struct xe_vma *vma,
> =C2=A0	if (IS_ERR(r))
> =C2=A0		return PTR_ERR(r);
> =C2=A0
> +	range =3D to_xe_range(r);
> +	if (xe_svm_range_is_valid(range, tile))
> +		return 0;
> +
> =C2=A0	err =3D drm_gpusvm_range_get_pages(&vm->svm.gpusvm, r, &ctx);
> =C2=A0	if (err =3D=3D -EFAULT || err =3D=3D -EPERM)	/* Corner where CPU
> mappings have changed */
> =C2=A0		goto retry;
> +	if (err)
> +		goto err_out;
> +
> +retry_bind:
> +	drm_exec_init(&exec, 0, 0);
> +	drm_exec_until_all_locked(&exec) {
> +		err =3D drm_exec_lock_obj(&exec, vm->gpuvm.r_obj);
> +		drm_exec_retry_on_contention(&exec);
> +		if (err) {
> +			drm_exec_fini(&exec);
> +			goto err_out;
> +		}
> +
> +		fence =3D xe_vm_range_rebind(vm, vma, range, BIT(tile-
> >id));
> +		if (IS_ERR(fence)) {
> +			drm_exec_fini(&exec);
> +			err =3D PTR_ERR(fence);
> +			if (err =3D=3D -EAGAIN)
> +				goto retry;
> +			if (xe_vm_validate_should_retry(&exec, err,
> &end))
> +				goto retry_bind;
> +			goto err_out;
> +		}
> +	}
> +	drm_exec_fini(&exec);
> +
> +	dma_fence_wait(fence, false);
> +	dma_fence_put(fence);
> =C2=A0
> -	/* TODO: Issue bind */
> +err_out:
> =C2=A0
> =C2=A0	return err;
> =C2=A0}
> diff --git a/drivers/gpu/drm/xe/xe_svm.h
> b/drivers/gpu/drm/xe/xe_svm.h
> index 31090967b83c..e03699becb3d 100644
> --- a/drivers/gpu/drm/xe/xe_svm.h
> +++ b/drivers/gpu/drm/xe/xe_svm.h
> @@ -32,6 +32,17 @@ struct xe_svm_range {
> =C2=A0};
> =C2=A0
> =C2=A0#if IS_ENABLED(CONFIG_DRM_GPUSVM)
> +/**
> + * xe_svm_range_pages_valid() - SVM range pages valid
> + * @range: SVM range
> + *
> + * Return: True if SVM range pages are valid, False otherwise
> + */
> +static inline bool xe_svm_range_pages_valid(struct xe_svm_range
> *range)
> +{
> +	return drm_gpusvm_range_pages_valid(range->base.gpusvm,
> &range->base);
> +}
> +
> =C2=A0int xe_svm_init(struct xe_vm *vm);
> =C2=A0
> =C2=A0void xe_svm_fini(struct xe_vm *vm);
> @@ -42,6 +53,11 @@ int xe_svm_handle_pagefault(struct xe_vm *vm,
> struct xe_vma *vma,
> =C2=A0			=C2=A0=C2=A0=C2=A0 struct xe_tile *tile, u64 fault_addr,
> =C2=A0			=C2=A0=C2=A0=C2=A0 bool atomic);
> =C2=A0#else
> +static inline bool xe_svm_range_pages_valid(struct xe_svm_range
> *range)
> +{
> +	return false;
> +}
> +
> =C2=A0static inline
> =C2=A0int xe_svm_init(struct xe_vm *vm)
> =C2=A0{
> @@ -67,6 +83,18 @@ int xe_svm_handle_pagefault(struct xe_vm *vm,
> struct xe_vma *vma,
> =C2=A0}
> =C2=A0#endif
> =C2=A0
> +/**
> + * xe_svm_range_has_dma_mapping() - SVM range has DMA mapping
> + * @range: SVM range
> + *
> + * Return: True if SVM range has a DMA mapping, False otherwise
> + */
> +static inline bool xe_svm_range_has_dma_mapping(struct xe_svm_range
> *range)
> +{
> +	lockdep_assert_held(&range->base.gpusvm->notifier_lock);
> +	return range->base.flags.has_dma_mapping;
> +}
> +
> =C2=A0#define xe_svm_assert_in_notifier(vm__) \
> =C2=A0	lockdep_assert_held_write(&(vm__)->svm.gpusvm.notifier_lock)
> =C2=A0
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index b89b0933dff6..56524d21b708 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -919,6 +919,96 @@ struct dma_fence *xe_vma_rebind(struct xe_vm
> *vm, struct xe_vma *vma, u8 tile_ma
> =C2=A0	return fence;
> =C2=A0}
> =C2=A0
> +static void xe_vm_populate_range_rebind(struct xe_vma_op *op,
> +					struct xe_vma *vma,
> +					struct xe_svm_range *range,
> +					u8 tile_mask)
> +{
> +	INIT_LIST_HEAD(&op->link);
> +	op->tile_mask =3D tile_mask;
> +	op->base.op =3D DRM_GPUVA_OP_DRIVER;
> +	op->subop =3D XE_VMA_SUBOP_MAP_RANGE;
> +	op->map_range.vma =3D vma;
> +	op->map_range.range =3D range;
> +}
> +
> +static int
> +xe_vm_ops_add_range_rebind(struct xe_vma_ops *vops,
> +			=C2=A0=C2=A0 struct xe_vma *vma,
> +			=C2=A0=C2=A0 struct xe_svm_range *range,
> +			=C2=A0=C2=A0 u8 tile_mask)
> +{
> +	struct xe_vma_op *op;
> +
> +	op =3D kzalloc(sizeof(*op), GFP_KERNEL);
> +	if (!op)
> +		return -ENOMEM;
> +
> +	xe_vm_populate_range_rebind(op, vma, range, tile_mask);
> +	list_add_tail(&op->link, &vops->list);
> +	xe_vma_ops_incr_pt_update_ops(vops, tile_mask);
> +
> +	return 0;
> +}
> +
> +/**
> + * xe_vm_range_rebind() - VM range (re)bind
> + * @vm: The VM which the range belongs to.
> + * @vma: The VMA which the range belongs to.
> + * @range: SVM range to rebind.
> + * @tile_mask: Tile mask to bind the range to.
> + *
> + * (re)bind SVM range setting up GPU page tables for the range.
> + *
> + * Return: dma fence for rebind to signal completion on succees,
> ERR_PTR on
> + * failure
> + */
> +struct dma_fence *xe_vm_range_rebind(struct xe_vm *vm,
> +				=C2=A0=C2=A0=C2=A0=C2=A0 struct xe_vma *vma,
> +				=C2=A0=C2=A0=C2=A0=C2=A0 struct xe_svm_range *range,
> +				=C2=A0=C2=A0=C2=A0=C2=A0 u8 tile_mask)
> +{
> +	struct dma_fence *fence =3D NULL;
> +	struct xe_vma_ops vops;
> +	struct xe_vma_op *op, *next_op;
> +	struct xe_tile *tile;
> +	u8 id;
> +	int err;
> +
> +	lockdep_assert_held(&vm->lock);
> +	xe_vm_assert_held(vm);
> +	xe_assert(vm->xe, xe_vm_in_fault_mode(vm));
> +	xe_assert(vm->xe, xe_vma_is_cpu_addr_mirror(vma));
> +
> +	xe_vma_ops_init(&vops, vm, NULL, NULL, 0);
> +	for_each_tile(tile, vm->xe, id) {
> +		vops.pt_update_ops[id].wait_vm_bookkeep =3D true;
> +		vops.pt_update_ops[tile->id].q =3D
> +			xe_tile_migrate_exec_queue(tile);
> +	}
> +
> +	err =3D xe_vm_ops_add_range_rebind(&vops, vma, range,
> tile_mask);
> +	if (err)
> +		return ERR_PTR(err);
> +
> +	err =3D xe_vma_ops_alloc(&vops, false);
> +	if (err) {
> +		fence =3D ERR_PTR(err);
> +		goto free_ops;
> +	}
> +
> +	fence =3D ops_execute(vm, &vops);
> +
> +free_ops:
> +	list_for_each_entry_safe(op, next_op, &vops.list, link) {
> +		list_del(&op->link);
> +		kfree(op);
> +	}
> +	xe_vma_ops_fini(&vops);
> +
> +	return fence;
> +}
> +
> =C2=A0static void xe_vma_free(struct xe_vma *vma)
> =C2=A0{
> =C2=A0	if (xe_vma_is_userptr(vma))
> @@ -2588,6 +2678,8 @@ static void op_trace(struct xe_vma_op *op)
> =C2=A0	case DRM_GPUVA_OP_PREFETCH:
> =C2=A0		trace_xe_vma_bind(gpuva_to_vma(op-
> >base.prefetch.va));
> =C2=A0		break;
> +	case DRM_GPUVA_OP_DRIVER:
> +		break;
> =C2=A0	default:
> =C2=A0		XE_WARN_ON("NOT POSSIBLE");
> =C2=A0	}
> diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
> index 448922ad9b6b..61e7919956ec 100644
> --- a/drivers/gpu/drm/xe/xe_vm.h
> +++ b/drivers/gpu/drm/xe/xe_vm.h
> @@ -23,6 +23,7 @@ struct dma_fence;
> =C2=A0struct xe_exec_queue;
> =C2=A0struct xe_file;
> =C2=A0struct xe_sync_entry;
> +struct xe_svm_range;
> =C2=A0struct drm_exec;
> =C2=A0
> =C2=A0struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags);
> @@ -218,6 +219,10 @@ int xe_vm_userptr_check_repin(struct xe_vm *vm);
> =C2=A0int xe_vm_rebind(struct xe_vm *vm, bool rebind_worker);
> =C2=A0struct dma_fence *xe_vma_rebind(struct xe_vm *vm, struct xe_vma
> *vma,
> =C2=A0				u8 tile_mask);
> +struct dma_fence *xe_vm_range_rebind(struct xe_vm *vm,
> +				=C2=A0=C2=A0=C2=A0=C2=A0 struct xe_vma *vma,
> +				=C2=A0=C2=A0=C2=A0=C2=A0 struct xe_svm_range *range,
> +				=C2=A0=C2=A0=C2=A0=C2=A0 u8 tile_mask);
> =C2=A0
> =C2=A0int xe_vm_invalidate_vma(struct xe_vma *vma);
> =C2=A0
> diff --git a/drivers/gpu/drm/xe/xe_vm_types.h
> b/drivers/gpu/drm/xe/xe_vm_types.h
> index 18ec9003a48a..2d988a867e63 100644
> --- a/drivers/gpu/drm/xe/xe_vm_types.h
> +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> @@ -19,6 +19,7 @@
> =C2=A0#include "xe_range_fence.h"
> =C2=A0
> =C2=A0struct xe_bo;
> +struct xe_svm_range;
> =C2=A0struct xe_sync_entry;
> =C2=A0struct xe_user_fence;
> =C2=A0struct xe_vm;
> @@ -335,6 +336,14 @@ struct xe_vma_op_prefetch {
> =C2=A0	u32 region;
> =C2=A0};
> =C2=A0
> +/** struct xe_vma_op_map_range - VMA map range operation */
> +struct xe_vma_op_map_range {
> +	/** @vma: VMA to map (system allocator VMA) */
> +	struct xe_vma *vma;
> +	/** @range: SVM range to map */
> +	struct xe_svm_range *range;
> +};
> +
> =C2=A0/** enum xe_vma_op_flags - flags for VMA operation */
> =C2=A0enum xe_vma_op_flags {
> =C2=A0	/** @XE_VMA_OP_COMMITTED: VMA operation committed */
> @@ -345,6 +354,12 @@ enum xe_vma_op_flags {
> =C2=A0	XE_VMA_OP_NEXT_COMMITTED	=3D BIT(2),
> =C2=A0};
> =C2=A0
> +/** enum xe_vma_subop - VMA sub-operation */
> +enum xe_vma_subop {
> +	/** @XE_VMA_SUBOP_MAP_RANGE: Map range */
> +	XE_VMA_SUBOP_MAP_RANGE,
> +};
> +
> =C2=A0/** struct xe_vma_op - VMA operation */
> =C2=A0struct xe_vma_op {
> =C2=A0	/** @base: GPUVA base operation */
> @@ -353,6 +368,8 @@ struct xe_vma_op {
> =C2=A0	struct list_head link;
> =C2=A0	/** @flags: operation flags */
> =C2=A0	enum xe_vma_op_flags flags;
> +	/** @subop: user defined sub-operation */
> +	enum xe_vma_subop subop;
> =C2=A0	/** @tile_mask: Tile mask for operation */
> =C2=A0	u8 tile_mask;
> =C2=A0
> @@ -363,6 +380,8 @@ struct xe_vma_op {
> =C2=A0		struct xe_vma_op_remap remap;
> =C2=A0		/** @prefetch: VMA prefetch operation specific data
> */
> =C2=A0		struct xe_vma_op_prefetch prefetch;
> +		/** @map_range: VMA map range operation specific
> data */
> +		struct xe_vma_op_map_range map_range;
> =C2=A0	};
> =C2=A0};
> =C2=A0

