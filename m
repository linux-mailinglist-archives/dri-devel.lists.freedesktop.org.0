Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49EE8A2C320
	for <lists+dri-devel@lfdr.de>; Fri,  7 Feb 2025 13:57:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C85F10EAFA;
	Fri,  7 Feb 2025 12:57:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ftYSoT4h";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAE1D10E372;
 Fri,  7 Feb 2025 12:56:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738932968; x=1770468968;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=7BPgLsycO98AEriFeoscf9hf4VZdOczxIV2GzXsOV4s=;
 b=ftYSoT4hahuIgrxcaJ0L8gBAO9JD8x5Sc3cr3aIuLtKCYtgXKQaKyok/
 aY+4AFEzrc5nfar/vAtetGGIjvSbjeqfAgm38IitgPBiWVMbM/LRY8s5w
 0TdAOxeJluAkStZuweV6XE2KBZTr65wYrfxmIDfojK39PPnYIm8GVDOdF
 aCRN0diC1qBCrLIsWzUiy2YsFUvlghoH62ywVJNEi2u96BCfztPUcX5eR
 Rb1Vyyp5P5zPQhyEFdmMOiISUZpJLUIFXIt6rj4y8eSk49UBjiQdlDfR8
 zKCy44SgV52IvLwdGwE5QErkJi61Ewaf2EynCjMSwojD6WMX4vT+4BGoV g==;
X-CSE-ConnectionGUID: Ugzx9YfCS3O/YT63L508yw==
X-CSE-MsgGUID: BQtdrrZFT6CWolkODruMjg==
X-IronPort-AV: E=McAfee;i="6700,10204,11338"; a="39700693"
X-IronPort-AV: E=Sophos;i="6.13,267,1732608000"; d="scan'208";a="39700693"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2025 04:56:04 -0800
X-CSE-ConnectionGUID: 3XCMv5uSSY+EPnWabzd1ww==
X-CSE-MsgGUID: RHclR0s+Q9i0bdM9oa0m1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,267,1732608000"; d="scan'208";a="112032058"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO [10.245.246.108])
 ([10.245.246.108])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2025 04:56:01 -0800
Message-ID: <912b7cd94d00d84525d58bb3cebc7b82ad0129b2.camel@linux.intel.com>
Subject: Re: [PATCH v4 16/33] drm/xe: Add unbind to SVM garbage collector
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com, apopple@nvidia.com, airlied@gmail.com, 
 simona.vetter@ffwll.ch, felix.kuehling@amd.com, dakr@kernel.org
Date: Fri, 07 Feb 2025 13:55:58 +0100
In-Reply-To: <20250129195212.745731-17-matthew.brost@intel.com>
References: <20250129195212.745731-1-matthew.brost@intel.com>
 <20250129195212.745731-17-matthew.brost@intel.com>
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
> Add unbind to SVM garbage collector. To facilitate add unbind support
> function to VM layer which unbinds a SVM range. Also teach PY layer

Should it be
s/PY layer/the PT layer/ ?

Also see below regarding accessors,

Thanks,
Thomas


> to
> understand unbinds of SVM ranges.
>=20
> v3:
> =C2=A0- s/INVALID_VMA/XE_INVALID_VMA (Thomas)
> =C2=A0- Kernel doc (Thomas)
> =C2=A0- New GPU SVM range structure (Thomas)
> =C2=A0- s/DRM_GPUVA_OP_USER/DRM_GPUVA_OP_DRIVER (Thomas)
> v4:
> =C2=A0- Use xe_vma_op_unmap_range (Himal)
>=20
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
> =C2=A0drivers/gpu/drm/xe/xe_pt.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 84=
 ++++++++++++++++++++++++++----
> --
> =C2=A0drivers/gpu/drm/xe/xe_svm.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 9=
 +++-
> =C2=A0drivers/gpu/drm/xe/xe_vm.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 83
> +++++++++++++++++++++++++++++++
> =C2=A0drivers/gpu/drm/xe/xe_vm.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=
=A0 2 +
> =C2=A0drivers/gpu/drm/xe/xe_vm_types.h | 12 ++++-
> =C2=A05 files changed, 172 insertions(+), 18 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> index cb63596dbfbf..f8d06c70f77d 100644
> --- a/drivers/gpu/drm/xe/xe_pt.c
> +++ b/drivers/gpu/drm/xe/xe_pt.c
> @@ -957,10 +957,16 @@ static void xe_pt_cancel_bind(struct xe_vma
> *vma,
> =C2=A0	}
> =C2=A0}
> =C2=A0
> +#define XE_INVALID_VMA	((struct xe_vma *)(0xdeaddeadull))
> +
> =C2=A0static void xe_pt_commit_locks_assert(struct xe_vma *vma)
> =C2=A0{
> -	struct xe_vm *vm =3D xe_vma_vm(vma);
> +	struct xe_vm *vm;
> =C2=A0
> +	if (vma =3D=3D XE_INVALID_VMA)
> +		return;
> +
> +	vm =3D xe_vma_vm(vma);
> =C2=A0	lockdep_assert_held(&vm->lock);
> =C2=A0
> =C2=A0	if (!xe_vma_has_no_bo(vma))
> @@ -986,7 +992,8 @@ static void xe_pt_commit(struct xe_vma *vma,
> =C2=A0		for (j =3D 0; j < entries[i].qwords; j++) {
> =C2=A0			struct xe_pt *oldpte =3D
> entries[i].pt_entries[j].pt;
> =C2=A0
> -			xe_pt_destroy(oldpte, xe_vma_vm(vma)->flags,
> deferred);
> +			xe_pt_destroy(oldpte, (vma =3D=3D
> XE_INVALID_VMA) ? 0 :
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 xe_vma_vm(vma)->flags,
> deferred);
> =C2=A0		}
> =C2=A0	}
> =C2=A0}
> @@ -1419,6 +1426,9 @@ static int xe_pt_svm_pre_commit(struct
> xe_migrate_pt_update *pt_update)
> =C2=A0	list_for_each_entry(op, &vops->list, link) {
> =C2=A0		struct xe_svm_range *range =3D op->map_range.range;
> =C2=A0
> +		if (op->subop =3D=3D XE_VMA_SUBOP_UNMAP_RANGE)
> +			continue;
> +
> =C2=A0		xe_assert(vm->xe, xe_vma_is_cpu_addr_mirror(op-
> >map_range.vma));
> =C2=A0		xe_assert(vm->xe, op->subop =3D=3D
> XE_VMA_SUBOP_MAP_RANGE);
> =C2=A0
> @@ -1616,7 +1626,9 @@ static const struct xe_pt_walk_ops
> xe_pt_stage_unbind_ops =3D {
> =C2=A0 * xe_pt_stage_unbind() - Build page-table update structures for an
> unbind
> =C2=A0 * operation
> =C2=A0 * @tile: The tile we're unbinding for.
> + * @vm: The vm
> =C2=A0 * @vma: The vma we're unbinding.
> + * @range: The range we're unbinding.
> =C2=A0 * @entries: Caller-provided storage for the update structures.
> =C2=A0 *
> =C2=A0 * Builds page-table update structures for an unbind operation. The
> function
> @@ -1626,9 +1638,14 @@ static const struct xe_pt_walk_ops
> xe_pt_stage_unbind_ops =3D {
> =C2=A0 *
> =C2=A0 * Return: The number of entries used.
> =C2=A0 */
> -static unsigned int xe_pt_stage_unbind(struct xe_tile *tile, struct
> xe_vma *vma,
> +static unsigned int xe_pt_stage_unbind(struct xe_tile *tile,
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct xe_vm *vm,
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct xe_vma *vma,
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct xe_svm_range *range,
> =C2=A0				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct xe_vm_pgtable_updat=
e
> *entries)
> =C2=A0{
> +	u64 start =3D range ? range->base.itree.start :
> xe_vma_start(vma);
> +	u64 end =3D range ? range->base.itree.last + 1 :
> xe_vma_end(vma);

Perhaps a code-wide comment is in place here, To use accessors

static inline unsigned long xe_svm_range_start(struct xe_svm_range);
static inline unsigned long xe_svm_range_end(struct xe_svm_range);

to avoid open-coding range->base.itree.xxxx. It's pretty frequent in
the code.


> =C2=A0	struct xe_pt_stage_unbind_walk xe_walk =3D {
> =C2=A0		.base =3D {
> =C2=A0			.ops =3D &xe_pt_stage_unbind_ops,
> @@ -1636,14 +1653,14 @@ static unsigned int xe_pt_stage_unbind(struct
> xe_tile *tile, struct xe_vma *vma,
> =C2=A0			.max_level =3D XE_PT_HIGHEST_LEVEL,
> =C2=A0		},
> =C2=A0		.tile =3D tile,
> -		.modified_start =3D xe_vma_start(vma),
> -		.modified_end =3D xe_vma_end(vma),
> +		.modified_start =3D start,
> +		.modified_end =3D end,
> =C2=A0		.wupd.entries =3D entries,
> =C2=A0	};
> -	struct xe_pt *pt =3D xe_vma_vm(vma)->pt_root[tile->id];
> +	struct xe_pt *pt =3D vm->pt_root[tile->id];
> =C2=A0
> -	(void)xe_pt_walk_shared(&pt->base, pt->level,
> xe_vma_start(vma),
> -				xe_vma_end(vma), &xe_walk.base);
> +	(void)xe_pt_walk_shared(&pt->base, pt->level, start, end,
> +				&xe_walk.base);
> =C2=A0
> =C2=A0	return xe_walk.wupd.num_used_entries;
> =C2=A0}
> @@ -1885,13 +1902,6 @@ static int unbind_op_prepare(struct xe_tile
> *tile,
> =C2=A0	=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "Preparing unbind, with range=
 [%llx...%llx)\n",
> =C2=A0	=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 xe_vma_start(vma), xe_vma_end=
(vma) - 1);
> =C2=A0
> -	/*
> -	 * Wait for invalidation to complete. Can corrupt internal
> page table
> -	 * state if an invalidation is running while preparing an
> unbind.
> -	 */
> -	if (xe_vma_is_userptr(vma) &&
> xe_vm_in_fault_mode(xe_vma_vm(vma)))
> -		mmu_interval_read_begin(&to_userptr_vma(vma)-
> >userptr.notifier);
> -
> =C2=A0	pt_op->vma =3D vma;
> =C2=A0	pt_op->bind =3D false;
> =C2=A0	pt_op->rebind =3D false;
> @@ -1900,7 +1910,8 @@ static int unbind_op_prepare(struct xe_tile
> *tile,
> =C2=A0	if (err)
> =C2=A0		return err;
> =C2=A0
> -	pt_op->num_entries =3D xe_pt_stage_unbind(tile, vma, pt_op-
> >entries);
> +	pt_op->num_entries =3D xe_pt_stage_unbind(tile,
> xe_vma_vm(vma),
> +						vma, NULL, pt_op-
> >entries);
> =C2=A0
> =C2=A0	xe_vm_dbg_print_entries(tile_to_xe(tile), pt_op->entries,
> =C2=A0				pt_op->num_entries, false);
> @@ -1915,6 +1926,42 @@ static int unbind_op_prepare(struct xe_tile
> *tile,
> =C2=A0	return 0;
> =C2=A0}
> =C2=A0
> +static int unbind_range_prepare(struct xe_vm *vm,
> +				struct xe_tile *tile,
> +				struct xe_vm_pgtable_update_ops
> *pt_update_ops,
> +				struct xe_svm_range *range)
> +{
> +	u32 current_op =3D pt_update_ops->current_op;
> +	struct xe_vm_pgtable_update_op *pt_op =3D &pt_update_ops-
> >ops[current_op];
> +
> +	if (!(range->tile_present & BIT(tile->id)))
> +		return 0;
> +
> +	vm_dbg(&vm->xe->drm,
> +	=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "Preparing unbind, with range [%lx=
...%lx)\n",
> +	=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 range->base.itree.start, range->ba=
se.itree.last);
> +
> +	pt_op->vma =3D XE_INVALID_VMA;
> +	pt_op->bind =3D false;
> +	pt_op->rebind =3D false;
> +
> +	pt_op->num_entries =3D xe_pt_stage_unbind(tile, vm, NULL,
> range,
> +						pt_op->entries);
> +
> +	xe_vm_dbg_print_entries(tile_to_xe(tile), pt_op->entries,
> +				pt_op->num_entries, false);
> +	xe_pt_update_ops_rfence_interval(pt_update_ops, range-
> >base.itree.start,
> +					 range->base.itree.last +
> 1);
> +	++pt_update_ops->current_op;
> +	pt_update_ops->needs_svm_lock =3D true;
> +	pt_update_ops->needs_invalidation =3D true;
> +
> +	xe_pt_commit_prepare_unbind(XE_INVALID_VMA, pt_op->entries,
> +				=C2=A0=C2=A0=C2=A0 pt_op->num_entries);
> +
> +	return 0;
> +}
> +
> =C2=A0static int op_prepare(struct xe_vm *vm,
> =C2=A0		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct xe_tile *tile,
> =C2=A0		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct xe_vm_pgtable_update_ops
> *pt_update_ops,
> @@ -1982,6 +2029,9 @@ static int op_prepare(struct xe_vm *vm,
> =C2=A0			err =3D bind_range_prepare(vm, tile,
> pt_update_ops,
> =C2=A0						 op->map_range.vma,
> =C2=A0						 op-
> >map_range.range);
> +		} else if (op->subop =3D=3D XE_VMA_SUBOP_UNMAP_RANGE) {
> +			err =3D unbind_range_prepare(vm, tile,
> pt_update_ops,
> +						=C2=A0=C2=A0 op-
> >unmap_range.range);
> =C2=A0		}
> =C2=A0		break;
> =C2=A0	default:
> @@ -2171,6 +2221,8 @@ static void op_commit(struct xe_vm *vm,
> =C2=A0		if (op->subop =3D=3D XE_VMA_SUBOP_MAP_RANGE) {
> =C2=A0			op->map_range.range->tile_present |=3D
> BIT(tile->id);
> =C2=A0			op->map_range.range->tile_invalidated &=3D
> ~BIT(tile->id);
> +		} else if (op->subop =3D=3D XE_VMA_SUBOP_UNMAP_RANGE) {
> +			op->unmap_range.range->tile_present &=3D
> ~BIT(tile->id);
> =C2=A0		}
> =C2=A0		break;
> =C2=A0	}
> diff --git a/drivers/gpu/drm/xe/xe_svm.c
> b/drivers/gpu/drm/xe/xe_svm.c
> index 3788196b2925..03c5cbcacb0e 100644
> --- a/drivers/gpu/drm/xe/xe_svm.c
> +++ b/drivers/gpu/drm/xe/xe_svm.c
> @@ -216,7 +216,14 @@ static void xe_svm_invalidate(struct drm_gpusvm
> *gpusvm,
> =C2=A0static int __xe_svm_garbage_collector(struct xe_vm *vm,
> =C2=A0				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct xe_svm_range *range)
> =C2=A0{
> -	/* TODO: Do unbind */
> +	struct dma_fence *fence;
> +
> +	xe_vm_lock(vm, false);
> +	fence =3D xe_vm_range_unbind(vm, range);
> +	xe_vm_unlock(vm);
> +	if (IS_ERR(fence))
> +		return PTR_ERR(fence);
> +	dma_fence_put(fence);
> =C2=A0
> =C2=A0	drm_gpusvm_range_remove(&vm->svm.gpusvm, &range->base);
> =C2=A0
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index bdc9b75e0aee..6fa446884955 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -984,6 +984,89 @@ struct dma_fence *xe_vm_range_rebind(struct
> xe_vm *vm,
> =C2=A0	return fence;
> =C2=A0}
> =C2=A0
> +static void xe_vm_populate_range_unbind(struct xe_vma_op *op,
> +					struct xe_svm_range *range)
> +{
> +	INIT_LIST_HEAD(&op->link);
> +	op->tile_mask =3D range->tile_present;
> +	op->base.op =3D DRM_GPUVA_OP_DRIVER;
> +	op->subop =3D XE_VMA_SUBOP_UNMAP_RANGE;
> +	op->unmap_range.range =3D range;
> +}
> +
> +static int
> +xe_vm_ops_add_range_unbind(struct xe_vma_ops *vops,
> +			=C2=A0=C2=A0 struct xe_svm_range *range)
> +{
> +	struct xe_vma_op *op;
> +
> +	op =3D kzalloc(sizeof(*op), GFP_KERNEL);
> +	if (!op)
> +		return -ENOMEM;
> +
> +	xe_vm_populate_range_unbind(op, range);
> +	list_add_tail(&op->link, &vops->list);
> +	xe_vma_ops_incr_pt_update_ops(vops, range->tile_present);
> +
> +	return 0;
> +}
> +
> +/**
> + * xe_vm_range_unbind() - VM range unbind
> + * @vm: The VM which the range belongs to.
> + * @range: SVM range to rebind.
> + *
> + * Unbind SVM range removing the GPU page tables for the range.
> + *
> + * Return: dma fence for unbind to signal completion on succees,
> ERR_PTR on
> + * failure
> + */
> +struct dma_fence *xe_vm_range_unbind(struct xe_vm *vm,
> +				=C2=A0=C2=A0=C2=A0=C2=A0 struct xe_svm_range *range)
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
> +
> +	if (!range->tile_present)
> +		return dma_fence_get_stub();
> +
> +	xe_vma_ops_init(&vops, vm, NULL, NULL, 0);
> +	for_each_tile(tile, vm->xe, id) {
> +		vops.pt_update_ops[id].wait_vm_bookkeep =3D true;
> +		vops.pt_update_ops[tile->id].q =3D
> +			xe_tile_migrate_exec_queue(tile);
> +	}
> +
> +	err =3D xe_vm_ops_add_range_unbind(&vops, range);
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
> diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
> index a82fe743bbe0..3b6316dd9fd6 100644
> --- a/drivers/gpu/drm/xe/xe_vm.h
> +++ b/drivers/gpu/drm/xe/xe_vm.h
> @@ -221,6 +221,8 @@ struct dma_fence *xe_vm_range_rebind(struct xe_vm
> *vm,
> =C2=A0				=C2=A0=C2=A0=C2=A0=C2=A0 struct xe_vma *vma,
> =C2=A0				=C2=A0=C2=A0=C2=A0=C2=A0 struct xe_svm_range *range,
> =C2=A0				=C2=A0=C2=A0=C2=A0=C2=A0 u8 tile_mask);
> +struct dma_fence *xe_vm_range_unbind(struct xe_vm *vm,
> +				=C2=A0=C2=A0=C2=A0=C2=A0 struct xe_svm_range *range);
> =C2=A0
> =C2=A0int xe_vm_invalidate_vma(struct xe_vma *vma);
> =C2=A0
> diff --git a/drivers/gpu/drm/xe/xe_vm_types.h
> b/drivers/gpu/drm/xe/xe_vm_types.h
> index 576316729249..aaba9e5acfb7 100644
> --- a/drivers/gpu/drm/xe/xe_vm_types.h
> +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> @@ -361,6 +361,12 @@ struct xe_vma_op_map_range {
> =C2=A0	struct xe_svm_range *range;
> =C2=A0};
> =C2=A0
> +/** struct xe_vma_op_unmap_range - VMA unmap range operation */
> +struct xe_vma_op_unmap_range {
> +	/** @range: SVM range to unmap */
> +	struct xe_svm_range *range;
> +};
> +
> =C2=A0/** enum xe_vma_op_flags - flags for VMA operation */
> =C2=A0enum xe_vma_op_flags {
> =C2=A0	/** @XE_VMA_OP_COMMITTED: VMA operation committed */
> @@ -375,6 +381,8 @@ enum xe_vma_op_flags {
> =C2=A0enum xe_vma_subop {
> =C2=A0	/** @XE_VMA_SUBOP_MAP_RANGE: Map range */
> =C2=A0	XE_VMA_SUBOP_MAP_RANGE,
> +	/** @XE_VMA_SUBOP_UNMAP_RANGE: Unmap range */
> +	XE_VMA_SUBOP_UNMAP_RANGE,
> =C2=A0};
> =C2=A0
> =C2=A0/** struct xe_vma_op - VMA operation */
> @@ -397,8 +405,10 @@ struct xe_vma_op {
> =C2=A0		struct xe_vma_op_remap remap;
> =C2=A0		/** @prefetch: VMA prefetch operation specific data
> */
> =C2=A0		struct xe_vma_op_prefetch prefetch;
> -		/** @map: VMA map range operation specific data */
> +		/** @map_range: VMA map range operation specific
> data */
> =C2=A0		struct xe_vma_op_map_range map_range;
> +		/** @unmap_range: VMA unmap range operation specific
> data */
> +		struct xe_vma_op_unmap_range unmap_range;
> =C2=A0	};
> =C2=A0};
> =C2=A0

