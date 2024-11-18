Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD75A9D1262
	for <lists+dri-devel@lfdr.de>; Mon, 18 Nov 2024 14:45:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D36D910E4DB;
	Mon, 18 Nov 2024 13:45:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CZmfxfQ6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED01310E4D7;
 Mon, 18 Nov 2024 13:45:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731937504; x=1763473504;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=cfIjn59SU0hrFHix0DWVL5LQxWTAnsA0KUSxqzRY8sA=;
 b=CZmfxfQ6xd6wXcPdkqjxJOLF7kdJNoZkCE9mC425H3U+AL4hSEMTwqsl
 ghhLM4kXwK00p0CCSd0A98f41saM8yKdQW/nSigbQZyZlVXQafDRXuHBV
 RSktz7DMbJ4blMg93MgHXKPAIT/IADoKv4VzDX32l1JHbMMbHi8EpfRd1
 oEB62yCvA/Wg7owBo73WMR14R0z/hyl0BM3cO8bRgR7hO5X5iSCLDF/pp
 DTS14BsPk9fTZ/l7XQwU8ERVR1E93DSYEGBB31R+8IHapE44LGv4CpYN7
 150XJaazYlBAf8uKcmbhjlKsafnQKXY+5Y/HS2WK9U7q9WLwB+TCvovp4 g==;
X-CSE-ConnectionGUID: OEDfU2SdSy2g2kb1iFTsKQ==
X-CSE-MsgGUID: iNGDl1acTK6pqPMq4xh3dA==
X-IronPort-AV: E=McAfee;i="6700,10204,11260"; a="31742516"
X-IronPort-AV: E=Sophos;i="6.12,164,1728975600"; d="scan'208";a="31742516"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2024 05:45:04 -0800
X-CSE-ConnectionGUID: yELC3r2LQ4SpCpmXkXOLqQ==
X-CSE-MsgGUID: hv0XHR5BTjGlh6n1F/KXOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,164,1728975600"; d="scan'208";a="90017454"
Received: from mwiniars-desk2.ger.corp.intel.com (HELO [10.245.246.149])
 ([10.245.246.149])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2024 05:45:01 -0800
Message-ID: <f4798ea4f804bd94138d2662944be7d9c392cc7c.camel@linux.intel.com>
Subject: Re: [PATCH v2 06/29] drm/xe/uapi: Add
 DRM_XE_VM_BIND_FLAG_SYSTEM_ALLOCATON flag
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: apopple@nvidia.com, airlied@gmail.com, christian.koenig@amd.com, 
 simona.vetter@ffwll.ch, felix.kuehling@amd.com, dakr@kernel.org
Date: Mon, 18 Nov 2024 14:44:58 +0100
In-Reply-To: <20241016032518.539495-7-matthew.brost@intel.com>
References: <20241016032518.539495-1-matthew.brost@intel.com>
 <20241016032518.539495-7-matthew.brost@intel.com>
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
> Add the DRM_XE_VM_BIND_FLAG_SYSTEM_ALLOCATOR flag, which is used to
> create unpopulated virtual memory areas (VMAs) without memory backing
> or
> GPU page tables. These VMAs are referred to as system allocator VMAs.
> The idea is that upon a page fault or prefetch, the memory backing
> and
> GPU page tables will be populated.

It would be good if the commit message could describe the state of the
code after this patch. It seems we do a lot more than just adding a
flag, but no real implementation. Perhaps just adjust the current code
to avoid code-paths that are not taken when the flag is set?

>=20
> System allocator VMAs only update GPUVM state; they do not have an
> internal page table (PT) state, nor do they have GPU mappings.
>=20
> It is expected that system allocator VMAs will be mixed with buffer
> object (BO) VMAs within a single VM. In other words, system
> allocations
> and runtime allocations can be mixed within a single user-mode driver
> (UMD) program.

This sounds like compute API-level terminology describing where the app
gets its buffer objects: System allocator - malloc, Runtime allocator -
the compute runtime (allocating buffer objects under the hood).=C2=A0

Not sure what would be the best terminology, though, but something
along DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR? (And when setteled change
inside code as well).

Otherwise it gets weird if someone asks why is it called "System
Allocator", and the reply is "a compute runtime would typically use
this functionality when an app has allocated the memory using malloc()
which can be called a system allocator".

IOW we name the functionality based on what KMD does and not how the
app uses it through UMD.

>=20
> Expected usage:
>=20
> - Bind the entire virtual address (VA) space upon program load using
> the
> =C2=A0 DRM_XE_VM_BIND_FLAG_SYSTEM_ALLOCATOR flag.
> - If a buffer object (BO) requires GPU mapping, allocate an address
> =C2=A0 using malloc, and bind the BO to the malloc'd address using
> existing
> =C2=A0 bind IOCTLs (runtime allocation).

allocate a cpu address using mmap(PROT_NONE), bind the BO to the
malloced address using existing bind IOCTLS. If a cpu map of the bo is
needed, mmap it again to the same cpu address using mmap(MAP_FIXED)

> - If a BO no longer requires GPU mapping, bind the mapping address
> with
> =C2=A0 the DRM_XE_VM_BIND_FLAG_SYSTEM_ALLOCATOR flag.

unmap it from cpu space  and then...

> - Any malloc'd address accessed by the GPU will be faulted in via the
> =C2=A0 SVM implementation (system allocation).
> - Upon freeing any malloc'd data, the SVM implementation will remove
> GPU
> =C2=A0 mappings.
>=20
> Only supporting 1 to 1 mapping between user address space and GPU
> address space at the moment as that is the expected use case. uAPI
> defines interface for non 1 to 1 but enforces 1 to 1, this
> restriction
> can be lifted if use cases arrise for non 1 to 1 mappings.
>=20
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
> =C2=A0drivers/gpu/drm/xe/xe_pt.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=
=A0 76 +++++++++++++++++-----
> =C2=A0drivers/gpu/drm/xe/xe_vm.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 10=
7 ++++++++++++++++++++---------
> --
> =C2=A0drivers/gpu/drm/xe/xe_vm.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=
=A0=C2=A0 8 ++-
> =C2=A0drivers/gpu/drm/xe/xe_vm_types.h |=C2=A0=C2=A0 3 +
> =C2=A0include/uapi/drm/xe_drm.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 |=C2=A0 19 +++++-
> =C2=A05 files changed, 157 insertions(+), 56 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> index f27f579f4d85..39357e829b6d 100644
> --- a/drivers/gpu/drm/xe/xe_pt.c
> +++ b/drivers/gpu/drm/xe/xe_pt.c
> @@ -1068,6 +1068,11 @@ static int op_add_deps(struct xe_vm *vm,
> struct xe_vma_op *op,
> =C2=A0{
> =C2=A0	int err =3D 0;
> =C2=A0
> +	/*
> +	 * No need to check for is_system_allocator here as
> vma_add_deps is a
> +	 * NOP if VMA is_system_allocator
> +	 */
> +
> =C2=A0	switch (op->base.op) {
> =C2=A0	case DRM_GPUVA_OP_MAP:
> =C2=A0		if (!op->map.immediate && xe_vm_in_fault_mode(vm))
> @@ -1646,6 +1651,7 @@ static int bind_op_prepare(struct xe_vm *vm,
> struct xe_tile *tile,
> =C2=A0	struct xe_vm_pgtable_update_op *pt_op =3D &pt_update_ops-
> >ops[current_op];
> =C2=A0	int err;
> =C2=A0
> +	xe_tile_assert(tile, !xe_vma_is_system_allocator(vma));
> =C2=A0	xe_bo_assert_held(xe_vma_bo(vma));
> =C2=A0
> =C2=A0	vm_dbg(&xe_vma_vm(vma)->xe->drm,
> @@ -1713,6 +1719,7 @@ static int unbind_op_prepare(struct xe_tile
> *tile,
> =C2=A0	if (!((vma->tile_present | vma->tile_staged) & BIT(tile-
> >id)))
> =C2=A0		return 0;
> =C2=A0
> +	xe_tile_assert(tile, !xe_vma_is_system_allocator(vma));
> =C2=A0	xe_bo_assert_held(xe_vma_bo(vma));
> =C2=A0
> =C2=A0	vm_dbg(&xe_vma_vm(vma)->xe->drm,
> @@ -1759,15 +1766,21 @@ static int op_prepare(struct xe_vm *vm,
> =C2=A0
> =C2=A0	switch (op->base.op) {
> =C2=A0	case DRM_GPUVA_OP_MAP:
> -		if (!op->map.immediate && xe_vm_in_fault_mode(vm))
> +		if ((!op->map.immediate && xe_vm_in_fault_mode(vm))
> ||
> +		=C2=A0=C2=A0=C2=A0 op->map.is_system_allocator)
> =C2=A0			break;
> =C2=A0
> =C2=A0		err =3D bind_op_prepare(vm, tile, pt_update_ops, op-
> >map.vma);
> =C2=A0		pt_update_ops->wait_vm_kernel =3D true;
> =C2=A0		break;
> =C2=A0	case DRM_GPUVA_OP_REMAP:
> -		err =3D unbind_op_prepare(tile, pt_update_ops,
> -					gpuva_to_vma(op-
> >base.remap.unmap->va));
> +	{
> +		struct xe_vma *old =3D gpuva_to_vma(op-
> >base.remap.unmap->va);
> +
> +		if (xe_vma_is_system_allocator(old))
> +			break;
> +
> +		err =3D unbind_op_prepare(tile, pt_update_ops, old);
> =C2=A0
> =C2=A0		if (!err && op->remap.prev) {
> =C2=A0			err =3D bind_op_prepare(vm, tile,
> pt_update_ops,
> @@ -1780,15 +1793,28 @@ static int op_prepare(struct xe_vm *vm,
> =C2=A0			pt_update_ops->wait_vm_bookkeep =3D true;
> =C2=A0		}
> =C2=A0		break;
> +	}
> =C2=A0	case DRM_GPUVA_OP_UNMAP:
> -		err =3D unbind_op_prepare(tile, pt_update_ops,
> -					gpuva_to_vma(op-
> >base.unmap.va));
> +	{
> +		struct xe_vma *vma =3D gpuva_to_vma(op-
> >base.unmap.va);
> +
> +		if (xe_vma_is_system_allocator(vma))
> +			break;
> +
> +		err =3D unbind_op_prepare(tile, pt_update_ops, vma);
> =C2=A0		break;
> +	}
> =C2=A0	case DRM_GPUVA_OP_PREFETCH:
> -		err =3D bind_op_prepare(vm, tile, pt_update_ops,
> -				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 gpuva_to_vma(op-
> >base.prefetch.va));
> +	{
> +		struct xe_vma *vma =3D gpuva_to_vma(op-
> >base.prefetch.va);
> +
> +		if (xe_vma_is_system_allocator(vma))
> +			break;
> +
> +		err =3D bind_op_prepare(vm, tile, pt_update_ops, vma);
> =C2=A0		pt_update_ops->wait_vm_kernel =3D true;
> =C2=A0		break;
> +	}
> =C2=A0	default:
> =C2=A0		drm_warn(&vm->xe->drm, "NOT POSSIBLE");
> =C2=A0	}
> @@ -1857,6 +1883,8 @@ static void bind_op_commit(struct xe_vm *vm,
> struct xe_tile *tile,
> =C2=A0			=C2=A0=C2=A0 struct xe_vma *vma, struct dma_fence
> *fence,
> =C2=A0			=C2=A0=C2=A0 struct dma_fence *fence2)
> =C2=A0{
> +	xe_tile_assert(tile, !xe_vma_is_system_allocator(vma));
> +
> =C2=A0	if (!xe_vma_has_no_bo(vma) && !xe_vma_bo(vma)->vm) {
> =C2=A0		dma_resv_add_fence(xe_vma_bo(vma)->ttm.base.resv,
> fence,
> =C2=A0				=C2=A0=C2=A0 pt_update_ops->wait_vm_bookkeep ?
> @@ -1890,6 +1918,8 @@ static void unbind_op_commit(struct xe_vm *vm,
> struct xe_tile *tile,
> =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0 struct xe_vma *vma, struct dma_fence
> *fence,
> =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0 struct dma_fence *fence2)
> =C2=A0{
> +	xe_tile_assert(tile, !xe_vma_is_system_allocator(vma));
> +
> =C2=A0	if (!xe_vma_has_no_bo(vma) && !xe_vma_bo(vma)->vm) {
> =C2=A0		dma_resv_add_fence(xe_vma_bo(vma)->ttm.base.resv,
> fence,
> =C2=A0				=C2=A0=C2=A0 pt_update_ops->wait_vm_bookkeep ?
> @@ -1924,16 +1954,21 @@ static void op_commit(struct xe_vm *vm,
> =C2=A0
> =C2=A0	switch (op->base.op) {
> =C2=A0	case DRM_GPUVA_OP_MAP:
> -		if (!op->map.immediate && xe_vm_in_fault_mode(vm))
> +		if ((!op->map.immediate && xe_vm_in_fault_mode(vm))
> ||
> +		=C2=A0=C2=A0=C2=A0 op->map.is_system_allocator)
> =C2=A0			break;
> =C2=A0
> =C2=A0		bind_op_commit(vm, tile, pt_update_ops, op->map.vma,
> fence,
> =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fence2);
> =C2=A0		break;
> =C2=A0	case DRM_GPUVA_OP_REMAP:
> -		unbind_op_commit(vm, tile, pt_update_ops,
> -				 gpuva_to_vma(op->base.remap.unmap-
> >va), fence,
> -				 fence2);
> +	{
> +		struct xe_vma *old =3D gpuva_to_vma(op-
> >base.remap.unmap->va);
> +
> +		if (xe_vma_is_system_allocator(old))
> +			break;
> +
> +		unbind_op_commit(vm, tile, pt_update_ops, old,
> fence, fence2);
> =C2=A0
> =C2=A0		if (op->remap.prev)
> =C2=A0			bind_op_commit(vm, tile, pt_update_ops, op-
> >remap.prev,
> @@ -1942,14 +1977,25 @@ static void op_commit(struct xe_vm *vm,
> =C2=A0			bind_op_commit(vm, tile, pt_update_ops, op-
> >remap.next,
> =C2=A0				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fence, fence2);
> =C2=A0		break;
> +	}
> =C2=A0	case DRM_GPUVA_OP_UNMAP:
> -		unbind_op_commit(vm, tile, pt_update_ops,
> -				 gpuva_to_vma(op->base.unmap.va),
> fence, fence2);
> +	{
> +		struct xe_vma *vma =3D gpuva_to_vma(op-
> >base.unmap.va);
> +
> +		if (!xe_vma_is_system_allocator(vma))
> +			unbind_op_commit(vm, tile, pt_update_ops,
> vma, fence,
> +					 fence2);
> =C2=A0		break;
> +	}
> =C2=A0	case DRM_GPUVA_OP_PREFETCH:
> -		bind_op_commit(vm, tile, pt_update_ops,
> -			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 gpuva_to_vma(op->base.prefetch.v=
a),
> fence, fence2);
> +	{
> +		struct xe_vma *vma =3D gpuva_to_vma(op-
> >base.prefetch.va);
> +
> +		if (!xe_vma_is_system_allocator(vma))
> +			bind_op_commit(vm, tile, pt_update_ops, vma,
> fence,
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fence2);

Wouldn't we want to support prefetch? Or perhaps the implementation is
deferred?=20


> =C2=A0		break;
> +	}
> =C2=A0	default:
> =C2=A0		drm_warn(&vm->xe->drm, "NOT POSSIBLE");
> =C2=A0	}
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index c99380271de6..0d887fb9de59 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -901,9 +901,10 @@ static void xe_vma_free(struct xe_vma *vma)
> =C2=A0		kfree(vma);
> =C2=A0}
> =C2=A0
> -#define VMA_CREATE_FLAG_READ_ONLY	BIT(0)
> -#define VMA_CREATE_FLAG_IS_NULL		BIT(1)
> -#define VMA_CREATE_FLAG_DUMPABLE	BIT(2)
> +#define VMA_CREATE_FLAG_READ_ONLY		BIT(0)
> +#define VMA_CREATE_FLAG_IS_NULL			BIT(1)
> +#define VMA_CREATE_FLAG_DUMPABLE		BIT(2)
> +#define VMA_CREATE_FLAG_IS_SYSTEM_ALLOCATOR	BIT(3)
> =C2=A0
> =C2=A0static struct xe_vma *xe_vma_create(struct xe_vm *vm,
> =C2=A0				=C2=A0=C2=A0=C2=A0 struct xe_bo *bo,
> @@ -917,6 +918,8 @@ static struct xe_vma *xe_vma_create(struct xe_vm
> *vm,
> =C2=A0	bool read_only =3D (flags & VMA_CREATE_FLAG_READ_ONLY);
> =C2=A0	bool is_null =3D (flags & VMA_CREATE_FLAG_IS_NULL);
> =C2=A0	bool dumpable =3D (flags & VMA_CREATE_FLAG_DUMPABLE);
> +	bool is_system_allocator =3D
> +		(flags & VMA_CREATE_FLAG_IS_SYSTEM_ALLOCATOR);
> =C2=A0
> =C2=A0	xe_assert(vm->xe, start < end);
> =C2=A0	xe_assert(vm->xe, end < vm->size);
> @@ -925,7 +928,7 @@ static struct xe_vma *xe_vma_create(struct xe_vm
> *vm,
> =C2=A0	 * Allocate and ensure that the xe_vma_is_userptr() return
> =C2=A0	 * matches what was allocated.
> =C2=A0	 */
> -	if (!bo && !is_null) {
> +	if (!bo && !is_null && !is_system_allocator) {
> =C2=A0		struct xe_userptr_vma *uvma =3D kzalloc(sizeof(*uvma),
> GFP_KERNEL);
> =C2=A0
> =C2=A0		if (!uvma)
> @@ -937,6 +940,8 @@ static struct xe_vma *xe_vma_create(struct xe_vm
> *vm,
> =C2=A0		if (!vma)
> =C2=A0			return ERR_PTR(-ENOMEM);
> =C2=A0
> +		if (is_system_allocator)
> +			vma->gpuva.flags |=3D XE_VMA_SYSTEM_ALLOCATOR;
> =C2=A0		if (is_null)
> =C2=A0			vma->gpuva.flags |=3D DRM_GPUVA_SPARSE;
> =C2=A0		if (bo)
> @@ -979,7 +984,7 @@ static struct xe_vma *xe_vma_create(struct xe_vm
> *vm,
> =C2=A0		drm_gpuva_link(&vma->gpuva, vm_bo);
> =C2=A0		drm_gpuvm_bo_put(vm_bo);
> =C2=A0	} else /* userptr or null */ {
> -		if (!is_null) {
> +		if (!is_null && !is_system_allocator) {
> =C2=A0			struct xe_userptr *userptr =3D
> &to_userptr_vma(vma)->userptr;
> =C2=A0			u64 size =3D end - start + 1;
> =C2=A0			int err;
> @@ -1029,7 +1034,7 @@ static void xe_vma_destroy_late(struct xe_vma
> *vma)
> =C2=A0		 */
> =C2=A0		mmu_interval_notifier_remove(&userptr->notifier);
> =C2=A0		xe_vm_put(vm);
> -	} else if (xe_vma_is_null(vma)) {
> +	} else if (xe_vma_is_null(vma) ||
> xe_vma_is_system_allocator(vma)) {
> =C2=A0		xe_vm_put(vm);
> =C2=A0	} else {
> =C2=A0		xe_bo_put(xe_vma_bo(vma));
> @@ -1068,7 +1073,7 @@ static void xe_vma_destroy(struct xe_vma *vma,
> struct dma_fence *fence)
> =C2=A0		spin_lock(&vm->userptr.invalidated_lock);
> =C2=A0		list_del(&to_userptr_vma(vma)-
> >userptr.invalidate_link);
> =C2=A0		spin_unlock(&vm->userptr.invalidated_lock);
> -	} else if (!xe_vma_is_null(vma)) {
> +	} else if (!xe_vma_is_null(vma) &&
> !xe_vma_is_system_allocator(vma)) {
> =C2=A0		xe_bo_assert_held(xe_vma_bo(vma));
> =C2=A0
> =C2=A0		drm_gpuva_unlink(&vma->gpuva);
> @@ -1967,6 +1972,8 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm,
> struct xe_bo *bo,
> =C2=A0			op->map.read_only =3D
> =C2=A0				flags &
> DRM_XE_VM_BIND_FLAG_READONLY;
> =C2=A0			op->map.is_null =3D flags &
> DRM_XE_VM_BIND_FLAG_NULL;
> +			op->map.is_system_allocator =3D flags &
> +				DRM_XE_VM_BIND_FLAG_SYSTEM_ALLOCATOR
> ;
> =C2=A0			op->map.dumpable =3D flags &
> DRM_XE_VM_BIND_FLAG_DUMPABLE;
> =C2=A0			op->map.pat_index =3D pat_index;
> =C2=A0		} else if (__op->op =3D=3D DRM_GPUVA_OP_PREFETCH) {
> @@ -2158,6 +2165,8 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm
> *vm, struct drm_gpuva_ops *ops,
> =C2=A0				VMA_CREATE_FLAG_IS_NULL : 0;
> =C2=A0			flags |=3D op->map.dumpable ?
> =C2=A0				VMA_CREATE_FLAG_DUMPABLE : 0;
> +			flags |=3D op->map.is_system_allocator ?
> +				VMA_CREATE_FLAG_IS_SYSTEM_ALLOCATOR
> : 0;
> =C2=A0
> =C2=A0			vma =3D new_vma(vm, &op->base.map, op-
> >map.pat_index,
> =C2=A0				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 flags);
> @@ -2165,7 +2174,8 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm
> *vm, struct drm_gpuva_ops *ops,
> =C2=A0				return PTR_ERR(vma);
> =C2=A0
> =C2=A0			op->map.vma =3D vma;
> -			if (op->map.immediate ||
> !xe_vm_in_fault_mode(vm))
> +			if ((op->map.immediate ||
> !xe_vm_in_fault_mode(vm)) &&
> +			=C2=A0=C2=A0=C2=A0 !op->map.is_system_allocator)
> =C2=A0				xe_vma_ops_incr_pt_update_ops(vops,
> =C2=A0							=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 op-
> >tile_mask);
> =C2=A0			break;
> @@ -2174,21 +2184,24 @@ static int vm_bind_ioctl_ops_parse(struct
> xe_vm *vm, struct drm_gpuva_ops *ops,
> =C2=A0		{
> =C2=A0			struct xe_vma *old =3D
> =C2=A0				gpuva_to_vma(op->base.remap.unmap-
> >va);
> +			bool skip =3D xe_vma_is_system_allocator(old);
> =C2=A0
> =C2=A0			op->remap.start =3D xe_vma_start(old);
> =C2=A0			op->remap.range =3D xe_vma_size(old);
> =C2=A0
> -			if (op->base.remap.prev) {
> -				flags |=3D op->base.remap.unmap->va-
> >flags &
> -					XE_VMA_READ_ONLY ?
> -					VMA_CREATE_FLAG_READ_ONLY :
> 0;
> -				flags |=3D op->base.remap.unmap->va-
> >flags &
> -					DRM_GPUVA_SPARSE ?
> -					VMA_CREATE_FLAG_IS_NULL : 0;
> -				flags |=3D op->base.remap.unmap->va-
> >flags &
> -					XE_VMA_DUMPABLE ?
> -					VMA_CREATE_FLAG_DUMPABLE :
> 0;
> +			flags |=3D op->base.remap.unmap->va->flags &
> +				XE_VMA_READ_ONLY ?
> +				VMA_CREATE_FLAG_READ_ONLY : 0;
> +			flags |=3D op->base.remap.unmap->va->flags &
> +				DRM_GPUVA_SPARSE ?
> +				VMA_CREATE_FLAG_IS_NULL : 0;
> +			flags |=3D op->base.remap.unmap->va->flags &
> +				XE_VMA_DUMPABLE ?
> +				VMA_CREATE_FLAG_DUMPABLE : 0;
> +			flags |=3D xe_vma_is_system_allocator(old) ?
> +				VMA_CREATE_FLAG_IS_SYSTEM_ALLOCATOR
> : 0;
> =C2=A0
> +			if (op->base.remap.prev) {
> =C2=A0				vma =3D new_vma(vm, op-
> >base.remap.prev,
> =C2=A0					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 old->pat_index,
> flags);
> =C2=A0				if (IS_ERR(vma))
> @@ -2200,9 +2213,10 @@ static int vm_bind_ioctl_ops_parse(struct
> xe_vm *vm, struct drm_gpuva_ops *ops,
> =C2=A0				 * Userptr creates a new SG mapping
> so
> =C2=A0				 * we must also rebind.
> =C2=A0				 */
> -				op->remap.skip_prev =3D
> !xe_vma_is_userptr(old) &&
> +				op->remap.skip_prev =3D skip ||
> +					(!xe_vma_is_userptr(old) &&
> =C2=A0					IS_ALIGNED(xe_vma_end(vma),
> -						=C2=A0=C2=A0
> xe_vma_max_pte_size(old));
> +						=C2=A0=C2=A0
> xe_vma_max_pte_size(old)));
> =C2=A0				if (op->remap.skip_prev) {
> =C2=A0					xe_vma_set_pte_size(vma,
> xe_vma_max_pte_size(old));
> =C2=A0					op->remap.range -=3D
> @@ -2218,16 +2232,6 @@ static int vm_bind_ioctl_ops_parse(struct
> xe_vm *vm, struct drm_gpuva_ops *ops,
> =C2=A0			}
> =C2=A0
> =C2=A0			if (op->base.remap.next) {
> -				flags |=3D op->base.remap.unmap->va-
> >flags &
> -					XE_VMA_READ_ONLY ?
> -					VMA_CREATE_FLAG_READ_ONLY :
> 0;
> -				flags |=3D op->base.remap.unmap->va-
> >flags &
> -					DRM_GPUVA_SPARSE ?
> -					VMA_CREATE_FLAG_IS_NULL : 0;
> -				flags |=3D op->base.remap.unmap->va-
> >flags &
> -					XE_VMA_DUMPABLE ?
> -					VMA_CREATE_FLAG_DUMPABLE :
> 0;
> -
> =C2=A0				vma =3D new_vma(vm, op-
> >base.remap.next,
> =C2=A0					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 old->pat_index,
> flags);
> =C2=A0				if (IS_ERR(vma))
> @@ -2239,9 +2243,10 @@ static int vm_bind_ioctl_ops_parse(struct
> xe_vm *vm, struct drm_gpuva_ops *ops,
> =C2=A0				 * Userptr creates a new SG mapping
> so
> =C2=A0				 * we must also rebind.
> =C2=A0				 */
> -				op->remap.skip_next =3D
> !xe_vma_is_userptr(old) &&
> +				op->remap.skip_next =3D skip ||
> +					(!xe_vma_is_userptr(old) &&
> =C2=A0					IS_ALIGNED(xe_vma_start(vma)
> ,
> -						=C2=A0=C2=A0
> xe_vma_max_pte_size(old));
> +						=C2=A0=C2=A0
> xe_vma_max_pte_size(old)));
> =C2=A0				if (op->remap.skip_next) {
> =C2=A0					xe_vma_set_pte_size(vma,
> xe_vma_max_pte_size(old));
> =C2=A0					op->remap.range -=3D
> @@ -2254,14 +2259,27 @@ static int vm_bind_ioctl_ops_parse(struct
> xe_vm *vm, struct drm_gpuva_ops *ops,
> =C2=A0					xe_vma_ops_incr_pt_update_op
> s(vops, op->tile_mask);
> =C2=A0				}
> =C2=A0			}
> -			xe_vma_ops_incr_pt_update_ops(vops, op-
> >tile_mask);
> +			if (!skip)
> +				xe_vma_ops_incr_pt_update_ops(vops,
> op->tile_mask);
> =C2=A0			break;
> =C2=A0		}
> =C2=A0		case DRM_GPUVA_OP_UNMAP:
> +		{
> +			struct xe_vma *vma =3D gpuva_to_vma(op-
> >base.unmap.va);
> +
> +			if (!xe_vma_is_system_allocator(vma))
> +				xe_vma_ops_incr_pt_update_ops(vops,
> op->tile_mask);
> +			break;
> +		}
> =C2=A0		case DRM_GPUVA_OP_PREFETCH:
> +		{
> +			struct xe_vma *vma =3D gpuva_to_vma(op-
> >base.prefetch.va);
> +
> =C2=A0			/* FIXME: Need to skip some prefetch ops */
> -			xe_vma_ops_incr_pt_update_ops(vops, op-
> >tile_mask);
> +			if (!xe_vma_is_system_allocator(vma))
> +				xe_vma_ops_incr_pt_update_ops(vops,
> op->tile_mask);
> =C2=A0			break;
> +		}
> =C2=A0		default:
> =C2=A0			drm_warn(&vm->xe->drm, "NOT POSSIBLE");
> =C2=A0		}
> @@ -2702,7 +2720,8 @@ static int vm_bind_ioctl_ops_execute(struct
> xe_vm *vm,
> =C2=A0	(DRM_XE_VM_BIND_FLAG_READONLY | \
> =C2=A0	 DRM_XE_VM_BIND_FLAG_IMMEDIATE | \
> =C2=A0	 DRM_XE_VM_BIND_FLAG_NULL | \
> -	 DRM_XE_VM_BIND_FLAG_DUMPABLE)
> +	 DRM_XE_VM_BIND_FLAG_DUMPABLE | \
> +	 DRM_XE_VM_BIND_FLAG_SYSTEM_ALLOCATOR)
> =C2=A0
> =C2=A0#ifdef TEST_VM_OPS_ERROR
> =C2=A0#define SUPPORTED_FLAGS	(SUPPORTED_FLAGS_STUB |
> FORCE_OP_ERROR)
> @@ -2757,9 +2776,17 @@ static int vm_bind_ioctl_check_args(struct
> xe_device *xe,
> =C2=A0		u64 obj_offset =3D (*bind_ops)[i].obj_offset;
> =C2=A0		u32 prefetch_region =3D
> (*bind_ops)[i].prefetch_mem_region_instance;
> =C2=A0		bool is_null =3D flags & DRM_XE_VM_BIND_FLAG_NULL;
> +		bool is_system_allocator =3D flags &
> +			DRM_XE_VM_BIND_FLAG_SYSTEM_ALLOCATOR;
> =C2=A0		u16 pat_index =3D (*bind_ops)[i].pat_index;
> =C2=A0		u16 coh_mode;
> =C2=A0
> +		/* FIXME: Disabling system allocator for now */
> +		if (XE_IOCTL_DBG(xe, is_system_allocator)) {
> +			err =3D -EOPNOTSUPP;
> +			goto free_bind_ops;
> +		}
> +
> =C2=A0		if (XE_IOCTL_DBG(xe, pat_index >=3D xe-
> >pat.n_entries)) {
> =C2=A0			err =3D -EINVAL;
> =C2=A0			goto free_bind_ops;
> @@ -2780,13 +2807,14 @@ static int vm_bind_ioctl_check_args(struct
> xe_device *xe,
> =C2=A0
> =C2=A0		if (XE_IOCTL_DBG(xe, op >
> DRM_XE_VM_BIND_OP_PREFETCH) ||
> =C2=A0		=C2=A0=C2=A0=C2=A0 XE_IOCTL_DBG(xe, flags & ~SUPPORTED_FLAGS) ||
> -		=C2=A0=C2=A0=C2=A0 XE_IOCTL_DBG(xe, obj && is_null) ||
> -		=C2=A0=C2=A0=C2=A0 XE_IOCTL_DBG(xe, obj_offset && is_null) ||
> +		=C2=A0=C2=A0=C2=A0 XE_IOCTL_DBG(xe, obj && (is_null ||
> is_system_allocator)) ||
> +		=C2=A0=C2=A0=C2=A0 XE_IOCTL_DBG(xe, obj_offset && (is_null ||
> +				 is_system_allocator)) ||
> =C2=A0		=C2=A0=C2=A0=C2=A0 XE_IOCTL_DBG(xe, op !=3D DRM_XE_VM_BIND_OP_MAP=
 &&
> -				 is_null) ||
> +				 (is_null || is_system_allocator))
> ||
> =C2=A0		=C2=A0=C2=A0=C2=A0 XE_IOCTL_DBG(xe, !obj &&
> =C2=A0				 op =3D=3D DRM_XE_VM_BIND_OP_MAP &&
> -				 !is_null) ||
> +				 !is_null && !is_system_allocator)
> ||
> =C2=A0		=C2=A0=C2=A0=C2=A0 XE_IOCTL_DBG(xe, !obj &&
> =C2=A0				 op =3D=3D DRM_XE_VM_BIND_OP_UNMAP_ALL)
> ||
> =C2=A0		=C2=A0=C2=A0=C2=A0 XE_IOCTL_DBG(xe, addr &&
> @@ -3170,6 +3198,7 @@ int xe_vm_invalidate_vma(struct xe_vma *vma)
> =C2=A0	int ret =3D 0;
> =C2=A0
> =C2=A0	xe_assert(xe, !xe_vma_is_null(vma));
> +	xe_assert(xe, !xe_vma_is_system_allocator(vma));
> =C2=A0	trace_xe_vma_invalidate(vma);
> =C2=A0
> =C2=A0	vm_dbg(&xe_vma_vm(vma)->xe->drm,
> diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
> index c864dba35e1d..1a5aed678214 100644
> --- a/drivers/gpu/drm/xe/xe_vm.h
> +++ b/drivers/gpu/drm/xe/xe_vm.h
> @@ -151,6 +151,11 @@ static inline bool xe_vma_is_null(struct xe_vma
> *vma)
> =C2=A0	return vma->gpuva.flags & DRM_GPUVA_SPARSE;
> =C2=A0}
> =C2=A0
> +static inline bool xe_vma_is_system_allocator(struct xe_vma *vma)
> +{
> +	return vma->gpuva.flags & XE_VMA_SYSTEM_ALLOCATOR;
> +}
> +
> =C2=A0static inline bool xe_vma_has_no_bo(struct xe_vma *vma)
> =C2=A0{
> =C2=A0	return !xe_vma_bo(vma);
> @@ -158,7 +163,8 @@ static inline bool xe_vma_has_no_bo(struct xe_vma
> *vma)
> =C2=A0
> =C2=A0static inline bool xe_vma_is_userptr(struct xe_vma *vma)
> =C2=A0{
> -	return xe_vma_has_no_bo(vma) && !xe_vma_is_null(vma);
> +	return xe_vma_has_no_bo(vma) && !xe_vma_is_null(vma) &&
> +		!xe_vma_is_system_allocator(vma);
> =C2=A0}
> =C2=A0
> =C2=A0/**
> diff --git a/drivers/gpu/drm/xe/xe_vm_types.h
> b/drivers/gpu/drm/xe/xe_vm_types.h
> index 7f9a303e51d8..1764781c376b 100644
> --- a/drivers/gpu/drm/xe/xe_vm_types.h
> +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> @@ -42,6 +42,7 @@ struct xe_vm_pgtable_update_op;
> =C2=A0#define XE_VMA_PTE_64K		(DRM_GPUVA_USERBITS << 6)
> =C2=A0#define XE_VMA_PTE_COMPACT	(DRM_GPUVA_USERBITS << 7)
> =C2=A0#define XE_VMA_DUMPABLE		(DRM_GPUVA_USERBITS << 8)
> +#define XE_VMA_SYSTEM_ALLOCATOR	(DRM_GPUVA_USERBITS << 9)
> =C2=A0
> =C2=A0/** struct xe_userptr - User pointer */
> =C2=A0struct xe_userptr {
> @@ -294,6 +295,8 @@ struct xe_vma_op_map {
> =C2=A0	bool read_only;
> =C2=A0	/** @is_null: is NULL binding */
> =C2=A0	bool is_null;
> +	/** @is_system_allocator: is system allocator binding */
> +	bool is_system_allocator;
> =C2=A0	/** @dumpable: whether BO is dumped on GPU hang */
> =C2=A0	bool dumpable;
> =C2=A0	/** @pat_index: The pat index to use for this operation. */
> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> index c4182e95a619..1e92fd498967 100644
> --- a/include/uapi/drm/xe_drm.h
> +++ b/include/uapi/drm/xe_drm.h
> @@ -906,6 +906,12 @@ struct drm_xe_vm_destroy {
> =C2=A0 *=C2=A0=C2=A0=C2=A0 will only be valid for DRM_XE_VM_BIND_OP_MAP o=
perations, the
> BO
> =C2=A0 *=C2=A0=C2=A0=C2=A0 handle MBZ, and the BO offset MBZ. This flag i=
s intended to
> =C2=A0 *=C2=A0=C2=A0=C2=A0 implement VK sparse bindings.
> + *=C2=A0 - %DRM_XE_VM_BIND_FLAG_SYSTEM_ALLOCATOR - When the system
> allocator flag is
> + *=C2=A0=C2=A0=C2=A0 set, no mappings are created rather the range is re=
served for
> system
> + *=C2=A0=C2=A0=C2=A0 allocations which will be populated on GPU page fau=
lts. Only
> valid on VMs
> + *=C2=A0=C2=A0=C2=A0 with DRM_XE_VM_CREATE_FLAG_FAULT_MODE set. The syst=
em
> allocator flag are
> + *=C2=A0=C2=A0=C2=A0 only valid for DRM_XE_VM_BIND_OP_MAP operations, th=
e BO handle
> MBZ, and
> + *=C2=A0=C2=A0=C2=A0 the BO offset MBZ.
> =C2=A0 */
> =C2=A0struct drm_xe_vm_bind_op {
> =C2=A0	/** @extensions: Pointer to the first extension struct, if
> any */
> @@ -958,7 +964,9 @@ struct drm_xe_vm_bind_op {
> =C2=A0	 * on the @pat_index. For such mappings there is no actual
> memory being
> =C2=A0	 * mapped (the address in the PTE is invalid), so the
> various PAT memory
> =C2=A0	 * attributes likely do not apply.=C2=A0 Simply leaving as zero
> is one
> -	 * option (still a valid pat_index).
> +	 * option (still a valid pat_index). Same applies to
> +	 * DRM_XE_VM_BIND_FLAG_SYSTEM_ALLOCATOR bindings as for such
> mapping
> +	 * there is no actual memory being mapped.
> =C2=A0	 */
> =C2=A0	__u16 pat_index;
> =C2=A0
> @@ -974,6 +982,14 @@ struct drm_xe_vm_bind_op {
> =C2=A0
> =C2=A0		/** @userptr: user pointer to bind on */
> =C2=A0		__u64 userptr;
> +
> +		/**
> +		 * @system_allocator_offset: Offset from GPU @addr
> to create
> +		 * system allocator mappings. MBZ with current level
> of support
> +		 * (e.g. 1 to 1 mapping between GPU and CPU mappings
> only
> +		 * supported).
> +		 */
> +		__s64 system_allocator_offset;
> =C2=A0	};
> =C2=A0
> =C2=A0	/**
> @@ -996,6 +1012,7 @@ struct drm_xe_vm_bind_op {
> =C2=A0#define DRM_XE_VM_BIND_FLAG_IMMEDIATE	(1 << 1)
> =C2=A0#define DRM_XE_VM_BIND_FLAG_NULL	(1 << 2)
> =C2=A0#define DRM_XE_VM_BIND_FLAG_DUMPABLE	(1 << 3)
> +#define DRM_XE_VM_BIND_FLAG_SYSTEM_ALLOCATOR	(1 << 4)
> =C2=A0	/** @flags: Bind flags */
> =C2=A0	__u32 flags;
> =C2=A0

