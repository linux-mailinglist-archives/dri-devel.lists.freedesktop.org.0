Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A7CB9D281C
	for <lists+dri-devel@lfdr.de>; Tue, 19 Nov 2024 15:27:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9156410E667;
	Tue, 19 Nov 2024 14:26:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CuNXqiUA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 874C610E666;
 Tue, 19 Nov 2024 14:26:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732026418; x=1763562418;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=ccJPVy6ldTYhJBmezTs4aCxSYNMUtl1/eXHIqY3WEGk=;
 b=CuNXqiUAtahj+XlviQAm3tNlJ633sUHsJIKPfFh+9Ir5nWqYbOpkqgHh
 VQMYy9RLY546vcp/fc+xvJ6tDvBEp6jFnfYOUdO36Si1rucaelS6A/ylw
 VlwMsJCIRd9bIn3asYL3yPBcew3Gt1sOllYSKc/mUHCdSlykm0B7/0Ug3
 BLcjn5pV3URo9EPvxzGJe/6tSK2wom3uN84LVmUnmC7tkbn+zAOXphvgg
 qc/gar/xa4TyYAW3q7TM1PGpCfCzRQvfc2met0gwewRzbMN70DwwkqqLB
 pJY4EsFWqX2FFUE/E1ZWEyd096E8O42MEOr+Kma3xYqkikoKvH3o2icbI w==;
X-CSE-ConnectionGUID: i8CB+rVcSVmXpDV+VRLpKg==
X-CSE-MsgGUID: 2yk3UJ9vRQCwvdvojAh22g==
X-IronPort-AV: E=McAfee;i="6700,10204,11261"; a="35698595"
X-IronPort-AV: E=Sophos;i="6.12,166,1728975600"; d="scan'208";a="35698595"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2024 06:26:38 -0800
X-CSE-ConnectionGUID: 9sIKPOmlRl22KwAdW5EPRw==
X-CSE-MsgGUID: B3E8rgRxR1Kvo5KCbf9qwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,166,1728975600"; d="scan'208";a="127100055"
Received: from smoticic-mobl.ger.corp.intel.com (HELO [10.245.246.223])
 ([10.245.246.223])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2024 06:26:35 -0800
Message-ID: <0d67ecef420cc38f05c029480252f4f30fdad834.camel@linux.intel.com>
Subject: Re: [PATCH v2 11/29] drm/xe: Add (re)bind to SVM page fault handler
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: apopple@nvidia.com, airlied@gmail.com, christian.koenig@amd.com, 
 simona.vetter@ffwll.ch, felix.kuehling@amd.com, dakr@kernel.org
Date: Tue, 19 Nov 2024 15:26:32 +0100
In-Reply-To: <20241016032518.539495-12-matthew.brost@intel.com>
References: <20241016032518.539495-1-matthew.brost@intel.com>
 <20241016032518.539495-12-matthew.brost@intel.com>
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

On Tue, 2024-10-15 at 20:25 -0700, Matthew Brost wrote:
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
>=20
> Signed-off-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
> =C2=A0drivers/gpu/drm/xe/xe_pt.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 17=
0 +++++++++++++++++++++++++++--
> --
> =C2=A0drivers/gpu/drm/xe/xe_pt_types.h |=C2=A0=C2=A0 2 +
> =C2=A0drivers/gpu/drm/xe/xe_svm.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 4=
9 ++++++++-
> =C2=A0drivers/gpu/drm/xe/xe_svm.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 1=
7 ++++
> =C2=A0drivers/gpu/drm/xe/xe_vm.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=
=A0 80 +++++++++++++++
> =C2=A0drivers/gpu/drm/xe/xe_vm.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=
=A0=C2=A0 5 +
> =C2=A0drivers/gpu/drm/xe/xe_vm_types.h |=C2=A0 19 ++++
> =C2=A07 files changed, 319 insertions(+), 23 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> index 282476c4edbd..024e4eb83408 100644
> --- a/drivers/gpu/drm/xe/xe_pt.c
> +++ b/drivers/gpu/drm/xe/xe_pt.c
> @@ -587,6 +587,7 @@ static const struct xe_pt_walk_ops
> xe_pt_stage_bind_ops =3D {
> =C2=A0 * range.
> =C2=A0 * @tile: The tile we're building for.
> =C2=A0 * @vma: The vma indicating the address range.
> + * @range: The range indicating the address range.
> =C2=A0 * @entries: Storage for the update entries used for connecting the
> tree to
> =C2=A0 * the main tree at commit time.
> =C2=A0 * @num_entries: On output contains the number of @entries used.
> @@ -602,6 +603,7 @@ static const struct xe_pt_walk_ops
> xe_pt_stage_bind_ops =3D {
> =C2=A0 */
> =C2=A0static int
> =C2=A0xe_pt_stage_bind(struct xe_tile *tile, struct xe_vma *vma,
> +		 struct xe_svm_range *range,
> =C2=A0		 struct xe_vm_pgtable_update *entries, u32
> *num_entries)

Really the same comment here, should rework the interface to drop vma
and range, although since it's more involved here let's do it as a
follow-up.

> =C2=A0{
> =C2=A0	struct xe_device *xe =3D tile_to_xe(tile);
> @@ -618,14 +620,38 @@ xe_pt_stage_bind(struct xe_tile *tile, struct
> xe_vma *vma,
> =C2=A0		.vm =3D xe_vma_vm(vma),
> =C2=A0		.tile =3D tile,
> =C2=A0		.curs =3D &curs,
> -		.va_curs_start =3D xe_vma_start(vma),
> +		.va_curs_start =3D range ? range->base.va.start :
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
> +					 range->base.va.end - range-
> >base.va.start,
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
> @@ -647,7 +673,7 @@ xe_pt_stage_bind(struct xe_tile *tile, struct
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
> @@ -663,15 +689,16 @@ xe_pt_stage_bind(struct xe_tile *tile, struct
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
> @@ -681,12 +708,14 @@ xe_pt_stage_bind(struct xe_tile *tile, struct
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
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 range ? range->base.va.start :
> xe_vma_start(vma),
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 range ? range->base.va.end :
> xe_vma_end(vma),
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &xe_walk.base);
> =C2=A0
> =C2=A0	*num_entries =3D xe_walk.wupd.num_used_entries;
> =C2=A0	return ret;
> @@ -902,7 +931,7 @@ static void xe_pt_commit_locks_assert(struct
> xe_vma *vma)
> =C2=A0
> =C2=A0	lockdep_assert_held(&vm->lock);
> =C2=A0
> -	if (!xe_vma_is_userptr(vma) && !xe_vma_is_null(vma))
> +	if (!xe_vma_has_no_bo(vma))
> =C2=A0		dma_resv_assert_held(xe_vma_bo(vma)->ttm.base.resv);
> =C2=A0
> =C2=A0	xe_vm_assert_held(vm);
> @@ -1004,12 +1033,13 @@ static void xe_pt_free_bind(struct
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
> @@ -1115,6 +1145,8 @@ static int op_add_deps(struct xe_vm *vm, struct
> xe_vma_op *op,
> =C2=A0	case DRM_GPUVA_OP_PREFETCH:
> =C2=A0		err =3D vma_add_deps(gpuva_to_vma(op-
> >base.prefetch.va), job);
> =C2=A0		break;
> +	case DRM_GPUVA_OP_USER:
> +		break;
> =C2=A0	default:
> =C2=A0		drm_warn(&vm->xe->drm, "NOT POSSIBLE");
> =C2=A0	}
> @@ -1339,6 +1371,34 @@ static int xe_pt_userptr_pre_commit(struct
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
> +		xe_assert(vm->xe, xe_vma_is_system_allocator(op-
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
> @@ -1632,12 +1692,12 @@ xe_pt_commit_prepare_unbind(struct xe_vma
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
> @@ -1647,8 +1707,8 @@ xe_pt_update_ops_rfence_interval(struct
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
> @@ -1690,7 +1750,7 @@ static int bind_op_prepare(struct xe_vm *vm,
> struct xe_tile *tile,
> =C2=A0	if (err)
> =C2=A0		return err;
> =C2=A0
> -	err =3D xe_pt_prepare_bind(tile, vma, pt_op->entries,
> +	err =3D xe_pt_prepare_bind(tile, vma, NULL, pt_op->entries,
> =C2=A0				 &pt_op->num_entries);
> =C2=A0	if (!err) {
> =C2=A0		xe_tile_assert(tile, pt_op->num_entries <=3D
> @@ -1698,7 +1758,9 @@ static int bind_op_prepare(struct xe_vm *vm,
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
> @@ -1732,6 +1794,48 @@ static int bind_op_prepare(struct xe_vm *vm,
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
> +	xe_tile_assert(tile, xe_vma_is_system_allocator(vma));
> +
> +	vm_dbg(&xe_vma_vm(vma)->xe->drm,
> +	=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "Preparing bind, with range [%llx.=
..%llx)\n",
> +	=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 range->base.va.start, range->base.=
va.end - 1);
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
> >base.va.start,
> +						 range-
> >base.va.end);
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
> @@ -1769,7 +1873,8 @@ static int unbind_op_prepare(struct xe_tile
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
> @@ -1839,6 +1944,15 @@ static int op_prepare(struct xe_vm *vm,
> =C2=A0		pt_update_ops->wait_vm_kernel =3D true;
> =C2=A0		break;
> =C2=A0	}
> +	case DRM_GPUVA_OP_USER:
> +		if (op->subop =3D=3D XE_VMA_SUBOP_MAP_RANGE) {

See question below on subops

> +			xe_assert(vm->xe,
> xe_vma_is_system_allocator(op->map_range.vma));
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
> @@ -2020,6 +2134,14 @@ static void op_commit(struct xe_vm *vm,
> =C2=A0				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fence2);
> =C2=A0		break;
> =C2=A0	}
> +	case DRM_GPUVA_OP_USER:
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
> @@ -2037,6 +2159,12 @@ static const struct xe_migrate_pt_update_ops
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
> @@ -2062,7 +2190,9 @@ xe_pt_update_ops_run(struct xe_tile *tile,
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
> @@ -2183,6 +2313,8 @@ xe_pt_update_ops_run(struct xe_tile *tile,
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
> index b2bc259978c4..a9addaea316d 100644
> --- a/drivers/gpu/drm/xe/xe_svm.c
> +++ b/drivers/gpu/drm/xe/xe_svm.c
> @@ -209,8 +209,8 @@ void xe_svm_close(struct xe_vm *vm)
> =C2=A0	xe_assert(vm->xe, xe_vm_is_closed(vm));
> =C2=A0
> =C2=A0	/* Flush running notifiers making xe_vm_close() visable */
> -	drm_gpusvm_notifier_lock(&vm->svm.gpusvm);
> -	drm_gpusvm_notifier_unlock(&vm->svm.gpusvm);
> +	xe_svm_notifier_lock(vm);
> +	xe_svm_notifier_unlock(vm);
> =C2=A0}
> =C2=A0
> =C2=A0void xe_svm_fini(struct xe_vm *vm)
> @@ -220,12 +220,22 @@ void xe_svm_fini(struct xe_vm *vm)
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
> =C2=A0int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
> =C2=A0			=C2=A0=C2=A0=C2=A0 struct xe_tile *tile, u64 fault_addr,
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
> @@ -239,11 +249,42 @@ int xe_svm_handle_pagefault(struct xe_vm *vm,
> struct xe_vma *vma,
> =C2=A0	if (IS_ERR(r))
> =C2=A0		return PTR_ERR(r);
> =C2=A0
> -	err =3D drm_gpusvm_range_get_pages(&vm->svm.gpusvm, r, false);
> +	range =3D to_xe_range(r);
> +	if (xe_svm_range_is_valid(range, tile))
> +		return 0;
> +
> +	err =3D drm_gpusvm_range_get_pages(&vm->svm.gpusvm, r, &ctx);
> =C2=A0	if (err =3D=3D -EFAULT || err =3D=3D -EPERM)	/* Corner where CPU
> mappings have change */
> =C2=A0	=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 goto retry;
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
> =C2=A0
> -	/* TODO: Issue bind */
> +	dma_fence_wait(fence, false);
> +	dma_fence_put(fence);
> =C2=A0
> +err_out:
> =C2=A0	return err;
> =C2=A0}
> diff --git a/drivers/gpu/drm/xe/xe_svm.h
> b/drivers/gpu/drm/xe/xe_svm.h
> index c91c5f538024..ee0bd1ae655b 100644
> --- a/drivers/gpu/drm/xe/xe_svm.h
> +++ b/drivers/gpu/drm/xe/xe_svm.h
> @@ -29,4 +29,21 @@ int xe_svm_handle_pagefault(struct xe_vm *vm,
> struct xe_vma *vma,
> =C2=A0			=C2=A0=C2=A0=C2=A0 struct xe_tile *tile, u64 fault_addr,
> =C2=A0			=C2=A0=C2=A0=C2=A0 bool atomic);
> =C2=A0
> +static inline bool xe_svm_range_pages_valid(struct xe_svm_range
> *range)
> +{
> +	return drm_gpusvm_range_pages_valid(range->base.gpusvm,
> &range->base);
> +}
> +
> +static inline bool xe_svm_range_has_dma_mapping(struct xe_svm_range
> *range)
> +{
> +	lockdep_assert_held(&range->base.gpusvm->notifier_lock);
> +	return range->base.flags.has_dma_mapping;
> +}
> +
> +#define xe_svm_notifier_lock(vm__)	\
> +	drm_gpusvm_notifier_lock(&(vm__)->svm.gpusvm)
> +
> +#define xe_svm_notifier_unlock(vm__)	\
> +	drm_gpusvm_notifier_unlock(&(vm__)->svm.gpusvm)
> +
> =C2=A0#endif
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index b11fb0ac9520..63aa0a25d3b7 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -894,6 +894,84 @@ struct dma_fence *xe_vma_rebind(struct xe_vm
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
> +	op->base.op =3D DRM_GPUVA_OP_USER;
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
> +struct dma_fence *xe_vm_range_rebind(struct xe_vm *vm,
> +				=C2=A0=C2=A0=C2=A0=C2=A0 struct xe_vma *vma,
> +				=C2=A0=C2=A0=C2=A0=C2=A0 struct xe_svm_range *range,
> +				=C2=A0=C2=A0=C2=A0=C2=A0 u8 tile_mask)

kerneldoc

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
> +	xe_assert(vm->xe, xe_vma_is_system_allocator(vma));
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
> @@ -2514,6 +2592,8 @@ static void op_trace(struct xe_vma_op *op)
> =C2=A0	case DRM_GPUVA_OP_PREFETCH:
> =C2=A0		trace_xe_vma_bind(gpuva_to_vma(op-
> >base.prefetch.va));
> =C2=A0		break;
> +	case DRM_GPUVA_OP_USER:
> +		break;
> =C2=A0	default:
> =C2=A0		XE_WARN_ON("NOT POSSIBLE");
> =C2=A0	}
> diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
> index 1a5aed678214..8bd921b33090 100644
> --- a/drivers/gpu/drm/xe/xe_vm.h
> +++ b/drivers/gpu/drm/xe/xe_vm.h
> @@ -22,6 +22,7 @@ struct ttm_validate_buffer;
> =C2=A0struct xe_exec_queue;
> =C2=A0struct xe_file;
> =C2=A0struct xe_sync_entry;
> +struct xe_svm_range;
> =C2=A0struct drm_exec;
> =C2=A0
> =C2=A0struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags);
> @@ -217,6 +218,10 @@ int xe_vm_userptr_check_repin(struct xe_vm *vm);
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
> index bd1c0e368238..b736e53779d2 100644
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
> @@ -334,6 +335,14 @@ struct xe_vma_op_prefetch {
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
> @@ -344,6 +353,12 @@ enum xe_vma_op_flags {
> =C2=A0	XE_VMA_OP_NEXT_COMMITTED	=3D BIT(2),
> =C2=A0};
> =C2=A0
> +/** enum xe_vma_subop - VMA sub-operation */
> +enum xe_vma_subop {
> +	/** @XE_VMA_SUBOP_MAP_RANGE: Map range */
> +	XE_VMA_SUBOP_MAP_RANGE,

Instead of introducing subops, should we perhaps consider
 DRM_GPUVMA_OP_USER plus any following op as driver defined so that the
                    next subop would instead be DRM_GPUVMA_OP_USER + 1?

> +};
> +
> =C2=A0/** struct xe_vma_op - VMA operation */
> =C2=A0struct xe_vma_op {
> =C2=A0	/** @base: GPUVA base operation */
> @@ -352,6 +367,8 @@ struct xe_vma_op {
> =C2=A0	struct list_head link;
> =C2=A0	/** @flags: operation flags */
> =C2=A0	enum xe_vma_op_flags flags;
> +	/** @subop: user defined sub-operation */
> +	enum xe_vma_subop subop;
> =C2=A0	/** @tile_mask: Tile mask for operation */
> =C2=A0	u8 tile_mask;
> =C2=A0
> @@ -362,6 +379,8 @@ struct xe_vma_op {
> =C2=A0		struct xe_vma_op_remap remap;
> =C2=A0		/** @prefetch: VMA prefetch operation specific data
> */
> =C2=A0		struct xe_vma_op_prefetch prefetch;
> +		/** @map: VMA map range operation specific data */
> +		struct xe_vma_op_map_range map_range;
> =C2=A0	};
> =C2=A0};
> =C2=A0

Thanks,
Thomas

