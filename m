Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35A22A3C301
	for <lists+dri-devel@lfdr.de>; Wed, 19 Feb 2025 16:05:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CC3710E81E;
	Wed, 19 Feb 2025 15:05:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QOnWwhPc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CD6910E14C;
 Wed, 19 Feb 2025 15:05:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739977517; x=1771513517;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=5OVwWlTY+g8rjkwPCVKaDJEeTp3MQ+mfd6uGA+nXGF8=;
 b=QOnWwhPcfDHy0RqLJmxR2wUSwJqYYjIhJ5yU/6J++IoPdzTehooedyVU
 lz39w0dn1ZmKeRTYzwGPJBJSse74Iigq+cgTIK6o1Xb1hoM+t0jByoDL/
 f/4d8FVbAXjsFtt65zC8Cu0EeFHtkgWGXLYFbqn/St5Whg3vnNydkAIBR
 Y3n2+KmZ3yisYMq30LZn4BA7fXZSZ/obkJM7TZITd4A7yPPnjZEyTgdC/
 MnfJ3LTCy3xSfRwN6OBRvDC1iCiRLBT7e/0VfbV/YcCaOSdkV3cQmoAp8
 4yTF3P6za5vv5AeQ33qlF2BgtpjPs6hChW8ovVaN9W/yQ8nqsXxvPn4BR Q==;
X-CSE-ConnectionGUID: lfrO0iDVQsm0Y6vG+vzPDA==
X-CSE-MsgGUID: tmEbnAYxSkSbZ5rwnKkkyA==
X-IronPort-AV: E=McAfee;i="6700,10204,11350"; a="44365606"
X-IronPort-AV: E=Sophos;i="6.13,299,1732608000"; d="scan'208";a="44365606"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2025 07:05:17 -0800
X-CSE-ConnectionGUID: ilveB+pSTKO1a+3GqZxi+Q==
X-CSE-MsgGUID: bzwO58uqQHO1xFBWuInT+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="115222200"
Received: from lfiedoro-mobl.ger.corp.intel.com (HELO [10.245.246.115])
 ([10.245.246.115])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2025 07:05:15 -0800
Message-ID: <67bd68ecf83d49180e76b12a967c65da79d10c0b.camel@linux.intel.com>
Subject: Re: [PATCH v5 16/32] drm/xe: Add unbind to SVM garbage collector
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com, apopple@nvidia.com, airlied@gmail.com, 
 simona.vetter@ffwll.ch, felix.kuehling@amd.com, dakr@kernel.org
Date: Wed, 19 Feb 2025 16:05:12 +0100
In-Reply-To: <20250213021112.1228481-17-matthew.brost@intel.com>
References: <20250213021112.1228481-1-matthew.brost@intel.com>
 <20250213021112.1228481-17-matthew.brost@intel.com>
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

On Wed, 2025-02-12 at 18:10 -0800, Matthew Brost wrote:
> Add unbind to SVM garbage collector. To facilitate add unbind support
> function to VM layer which unbinds a SVM range. Also teach PT layer
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
> v5:
> =C2=A0- s/PY/PT (Thomas)
>=20
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>

LGTM. Reviewed-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>


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
> =C2=A0drivers/gpu/drm/xe/xe_vm_types.h | 10 ++++
> =C2=A05 files changed, 171 insertions(+), 17 deletions(-)
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
> index ed91291a24db..98130c0768ec 100644
> --- a/drivers/gpu/drm/xe/xe_svm.c
> +++ b/drivers/gpu/drm/xe/xe_svm.c
> @@ -226,7 +226,14 @@ static void xe_svm_invalidate(struct drm_gpusvm
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
> index f57fc30b969a..d482c0cafba3 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -985,6 +985,89 @@ struct dma_fence *xe_vm_range_rebind(struct
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
> index 61e7919956ec..83adde1a84bd 100644
> --- a/drivers/gpu/drm/xe/xe_vm.h
> +++ b/drivers/gpu/drm/xe/xe_vm.h
> @@ -223,6 +223,8 @@ struct dma_fence *xe_vm_range_rebind(struct xe_vm
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
> index 8aa77aaaae6b..0b59ba948e86 100644
> --- a/drivers/gpu/drm/xe/xe_vm_types.h
> +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> @@ -362,6 +362,12 @@ struct xe_vma_op_map_range {
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
> @@ -376,6 +382,8 @@ enum xe_vma_op_flags {
> =C2=A0enum xe_vma_subop {
> =C2=A0	/** @XE_VMA_SUBOP_MAP_RANGE: Map range */
> =C2=A0	XE_VMA_SUBOP_MAP_RANGE,
> +	/** @XE_VMA_SUBOP_UNMAP_RANGE: Unmap range */
> +	XE_VMA_SUBOP_UNMAP_RANGE,
> =C2=A0};
> =C2=A0
> =C2=A0/** struct xe_vma_op - VMA operation */
> @@ -400,6 +408,8 @@ struct xe_vma_op {
> =C2=A0		struct xe_vma_op_prefetch prefetch;
> =C2=A0		/** @map_range: VMA map range operation specific
> data */
> =C2=A0		struct xe_vma_op_map_range map_range;
> +		/** @unmap_range: VMA unmap range operation specific
> data */
> +		struct xe_vma_op_unmap_range unmap_range;
> =C2=A0	};
> =C2=A0};
> =C2=A0

