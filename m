Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 352A199FF69
	for <lists+dri-devel@lfdr.de>; Wed, 16 Oct 2024 05:25:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1657210E668;
	Wed, 16 Oct 2024 03:25:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MZCrJaUL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8DA410E652;
 Wed, 16 Oct 2024 03:24:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729049099; x=1760585099;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=SjkmJ4x9/JiX7DJjW+DGFQwsmT3QlSIHf8uZCm5eYf4=;
 b=MZCrJaUL77TxAYf/o8MqqJjuoW30Q8oFOdqhnLfRQARxNbH+Cx2Fn8sf
 RS2049fJ7e50MKV+vvp6tO9IXsMWdVjNBNU1ZibdQWbljiIOBi+w4ZS5U
 J2ksIG/X0sZqPeVAai1+LVQPw299A3b3kHa+KwW6ELZzhZaZgCh6aZfDr
 w8x8kvpejn2xrLGKThiBAUiXrS7mTOgE/KbODuRGQk+UGspmckMB3u8YT
 7qdZ1aqEu0RXrxZq0wBG4lvjMnOVNB4FHu+QqDC267JEl0Cqkjs6svFoA
 Kaj8jZ3wzAbvwTLUWdGYssdeeikwCJWS5btWxmR8im4o5hNl/UgvKzc3c Q==;
X-CSE-ConnectionGUID: AvS30RlbRKes0zMXsYgE9w==
X-CSE-MsgGUID: vepNMzbxTq2HQP+3yaLQoQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11225"; a="39056363"
X-IronPort-AV: E=Sophos;i="6.11,206,1725346800"; d="scan'208";a="39056363"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2024 20:24:58 -0700
X-CSE-ConnectionGUID: yGOMnxZ4SuWGG1c4kdKBhA==
X-CSE-MsgGUID: 3AuODeAjTICp7QTPbVq7/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,206,1725346800"; d="scan'208";a="78930255"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2024 20:24:57 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: apopple@nvidia.com, airlied@gmail.com, christian.koenig@amd.com,
 thomas.hellstrom@linux.intel.com, simona.vetter@ffwll.ch,
 felix.kuehling@amd.com, dakr@kernel.org
Subject: [PATCH v2 06/29] drm/xe/uapi: Add
 DRM_XE_VM_BIND_FLAG_SYSTEM_ALLOCATON flag
Date: Tue, 15 Oct 2024 20:24:55 -0700
Message-Id: <20241016032518.539495-7-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241016032518.539495-1-matthew.brost@intel.com>
References: <20241016032518.539495-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Add the DRM_XE_VM_BIND_FLAG_SYSTEM_ALLOCATOR flag, which is used to
create unpopulated virtual memory areas (VMAs) without memory backing or
GPU page tables. These VMAs are referred to as system allocator VMAs.
The idea is that upon a page fault or prefetch, the memory backing and
GPU page tables will be populated.

System allocator VMAs only update GPUVM state; they do not have an
internal page table (PT) state, nor do they have GPU mappings.

It is expected that system allocator VMAs will be mixed with buffer
object (BO) VMAs within a single VM. In other words, system allocations
and runtime allocations can be mixed within a single user-mode driver
(UMD) program.

Expected usage:

- Bind the entire virtual address (VA) space upon program load using the
  DRM_XE_VM_BIND_FLAG_SYSTEM_ALLOCATOR flag.
- If a buffer object (BO) requires GPU mapping, allocate an address
  using malloc, and bind the BO to the malloc'd address using existing
  bind IOCTLs (runtime allocation).
- If a BO no longer requires GPU mapping, bind the mapping address with
  the DRM_XE_VM_BIND_FLAG_SYSTEM_ALLOCATOR flag.
- Any malloc'd address accessed by the GPU will be faulted in via the
  SVM implementation (system allocation).
- Upon freeing any malloc'd data, the SVM implementation will remove GPU
  mappings.

Only supporting 1 to 1 mapping between user address space and GPU
address space at the moment as that is the expected use case. uAPI
defines interface for non 1 to 1 but enforces 1 to 1, this restriction
can be lifted if use cases arrise for non 1 to 1 mappings.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_pt.c       |  76 +++++++++++++++++-----
 drivers/gpu/drm/xe/xe_vm.c       | 107 ++++++++++++++++++++-----------
 drivers/gpu/drm/xe/xe_vm.h       |   8 ++-
 drivers/gpu/drm/xe/xe_vm_types.h |   3 +
 include/uapi/drm/xe_drm.h        |  19 +++++-
 5 files changed, 157 insertions(+), 56 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index f27f579f4d85..39357e829b6d 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -1068,6 +1068,11 @@ static int op_add_deps(struct xe_vm *vm, struct xe_vma_op *op,
 {
 	int err = 0;
 
+	/*
+	 * No need to check for is_system_allocator here as vma_add_deps is a
+	 * NOP if VMA is_system_allocator
+	 */
+
 	switch (op->base.op) {
 	case DRM_GPUVA_OP_MAP:
 		if (!op->map.immediate && xe_vm_in_fault_mode(vm))
@@ -1646,6 +1651,7 @@ static int bind_op_prepare(struct xe_vm *vm, struct xe_tile *tile,
 	struct xe_vm_pgtable_update_op *pt_op = &pt_update_ops->ops[current_op];
 	int err;
 
+	xe_tile_assert(tile, !xe_vma_is_system_allocator(vma));
 	xe_bo_assert_held(xe_vma_bo(vma));
 
 	vm_dbg(&xe_vma_vm(vma)->xe->drm,
@@ -1713,6 +1719,7 @@ static int unbind_op_prepare(struct xe_tile *tile,
 	if (!((vma->tile_present | vma->tile_staged) & BIT(tile->id)))
 		return 0;
 
+	xe_tile_assert(tile, !xe_vma_is_system_allocator(vma));
 	xe_bo_assert_held(xe_vma_bo(vma));
 
 	vm_dbg(&xe_vma_vm(vma)->xe->drm,
@@ -1759,15 +1766,21 @@ static int op_prepare(struct xe_vm *vm,
 
 	switch (op->base.op) {
 	case DRM_GPUVA_OP_MAP:
-		if (!op->map.immediate && xe_vm_in_fault_mode(vm))
+		if ((!op->map.immediate && xe_vm_in_fault_mode(vm)) ||
+		    op->map.is_system_allocator)
 			break;
 
 		err = bind_op_prepare(vm, tile, pt_update_ops, op->map.vma);
 		pt_update_ops->wait_vm_kernel = true;
 		break;
 	case DRM_GPUVA_OP_REMAP:
-		err = unbind_op_prepare(tile, pt_update_ops,
-					gpuva_to_vma(op->base.remap.unmap->va));
+	{
+		struct xe_vma *old = gpuva_to_vma(op->base.remap.unmap->va);
+
+		if (xe_vma_is_system_allocator(old))
+			break;
+
+		err = unbind_op_prepare(tile, pt_update_ops, old);
 
 		if (!err && op->remap.prev) {
 			err = bind_op_prepare(vm, tile, pt_update_ops,
@@ -1780,15 +1793,28 @@ static int op_prepare(struct xe_vm *vm,
 			pt_update_ops->wait_vm_bookkeep = true;
 		}
 		break;
+	}
 	case DRM_GPUVA_OP_UNMAP:
-		err = unbind_op_prepare(tile, pt_update_ops,
-					gpuva_to_vma(op->base.unmap.va));
+	{
+		struct xe_vma *vma = gpuva_to_vma(op->base.unmap.va);
+
+		if (xe_vma_is_system_allocator(vma))
+			break;
+
+		err = unbind_op_prepare(tile, pt_update_ops, vma);
 		break;
+	}
 	case DRM_GPUVA_OP_PREFETCH:
-		err = bind_op_prepare(vm, tile, pt_update_ops,
-				      gpuva_to_vma(op->base.prefetch.va));
+	{
+		struct xe_vma *vma = gpuva_to_vma(op->base.prefetch.va);
+
+		if (xe_vma_is_system_allocator(vma))
+			break;
+
+		err = bind_op_prepare(vm, tile, pt_update_ops, vma);
 		pt_update_ops->wait_vm_kernel = true;
 		break;
+	}
 	default:
 		drm_warn(&vm->xe->drm, "NOT POSSIBLE");
 	}
@@ -1857,6 +1883,8 @@ static void bind_op_commit(struct xe_vm *vm, struct xe_tile *tile,
 			   struct xe_vma *vma, struct dma_fence *fence,
 			   struct dma_fence *fence2)
 {
+	xe_tile_assert(tile, !xe_vma_is_system_allocator(vma));
+
 	if (!xe_vma_has_no_bo(vma) && !xe_vma_bo(vma)->vm) {
 		dma_resv_add_fence(xe_vma_bo(vma)->ttm.base.resv, fence,
 				   pt_update_ops->wait_vm_bookkeep ?
@@ -1890,6 +1918,8 @@ static void unbind_op_commit(struct xe_vm *vm, struct xe_tile *tile,
 			     struct xe_vma *vma, struct dma_fence *fence,
 			     struct dma_fence *fence2)
 {
+	xe_tile_assert(tile, !xe_vma_is_system_allocator(vma));
+
 	if (!xe_vma_has_no_bo(vma) && !xe_vma_bo(vma)->vm) {
 		dma_resv_add_fence(xe_vma_bo(vma)->ttm.base.resv, fence,
 				   pt_update_ops->wait_vm_bookkeep ?
@@ -1924,16 +1954,21 @@ static void op_commit(struct xe_vm *vm,
 
 	switch (op->base.op) {
 	case DRM_GPUVA_OP_MAP:
-		if (!op->map.immediate && xe_vm_in_fault_mode(vm))
+		if ((!op->map.immediate && xe_vm_in_fault_mode(vm)) ||
+		    op->map.is_system_allocator)
 			break;
 
 		bind_op_commit(vm, tile, pt_update_ops, op->map.vma, fence,
 			       fence2);
 		break;
 	case DRM_GPUVA_OP_REMAP:
-		unbind_op_commit(vm, tile, pt_update_ops,
-				 gpuva_to_vma(op->base.remap.unmap->va), fence,
-				 fence2);
+	{
+		struct xe_vma *old = gpuva_to_vma(op->base.remap.unmap->va);
+
+		if (xe_vma_is_system_allocator(old))
+			break;
+
+		unbind_op_commit(vm, tile, pt_update_ops, old, fence, fence2);
 
 		if (op->remap.prev)
 			bind_op_commit(vm, tile, pt_update_ops, op->remap.prev,
@@ -1942,14 +1977,25 @@ static void op_commit(struct xe_vm *vm,
 			bind_op_commit(vm, tile, pt_update_ops, op->remap.next,
 				       fence, fence2);
 		break;
+	}
 	case DRM_GPUVA_OP_UNMAP:
-		unbind_op_commit(vm, tile, pt_update_ops,
-				 gpuva_to_vma(op->base.unmap.va), fence, fence2);
+	{
+		struct xe_vma *vma = gpuva_to_vma(op->base.unmap.va);
+
+		if (!xe_vma_is_system_allocator(vma))
+			unbind_op_commit(vm, tile, pt_update_ops, vma, fence,
+					 fence2);
 		break;
+	}
 	case DRM_GPUVA_OP_PREFETCH:
-		bind_op_commit(vm, tile, pt_update_ops,
-			       gpuva_to_vma(op->base.prefetch.va), fence, fence2);
+	{
+		struct xe_vma *vma = gpuva_to_vma(op->base.prefetch.va);
+
+		if (!xe_vma_is_system_allocator(vma))
+			bind_op_commit(vm, tile, pt_update_ops, vma, fence,
+				       fence2);
 		break;
+	}
 	default:
 		drm_warn(&vm->xe->drm, "NOT POSSIBLE");
 	}
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index c99380271de6..0d887fb9de59 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -901,9 +901,10 @@ static void xe_vma_free(struct xe_vma *vma)
 		kfree(vma);
 }
 
-#define VMA_CREATE_FLAG_READ_ONLY	BIT(0)
-#define VMA_CREATE_FLAG_IS_NULL		BIT(1)
-#define VMA_CREATE_FLAG_DUMPABLE	BIT(2)
+#define VMA_CREATE_FLAG_READ_ONLY		BIT(0)
+#define VMA_CREATE_FLAG_IS_NULL			BIT(1)
+#define VMA_CREATE_FLAG_DUMPABLE		BIT(2)
+#define VMA_CREATE_FLAG_IS_SYSTEM_ALLOCATOR	BIT(3)
 
 static struct xe_vma *xe_vma_create(struct xe_vm *vm,
 				    struct xe_bo *bo,
@@ -917,6 +918,8 @@ static struct xe_vma *xe_vma_create(struct xe_vm *vm,
 	bool read_only = (flags & VMA_CREATE_FLAG_READ_ONLY);
 	bool is_null = (flags & VMA_CREATE_FLAG_IS_NULL);
 	bool dumpable = (flags & VMA_CREATE_FLAG_DUMPABLE);
+	bool is_system_allocator =
+		(flags & VMA_CREATE_FLAG_IS_SYSTEM_ALLOCATOR);
 
 	xe_assert(vm->xe, start < end);
 	xe_assert(vm->xe, end < vm->size);
@@ -925,7 +928,7 @@ static struct xe_vma *xe_vma_create(struct xe_vm *vm,
 	 * Allocate and ensure that the xe_vma_is_userptr() return
 	 * matches what was allocated.
 	 */
-	if (!bo && !is_null) {
+	if (!bo && !is_null && !is_system_allocator) {
 		struct xe_userptr_vma *uvma = kzalloc(sizeof(*uvma), GFP_KERNEL);
 
 		if (!uvma)
@@ -937,6 +940,8 @@ static struct xe_vma *xe_vma_create(struct xe_vm *vm,
 		if (!vma)
 			return ERR_PTR(-ENOMEM);
 
+		if (is_system_allocator)
+			vma->gpuva.flags |= XE_VMA_SYSTEM_ALLOCATOR;
 		if (is_null)
 			vma->gpuva.flags |= DRM_GPUVA_SPARSE;
 		if (bo)
@@ -979,7 +984,7 @@ static struct xe_vma *xe_vma_create(struct xe_vm *vm,
 		drm_gpuva_link(&vma->gpuva, vm_bo);
 		drm_gpuvm_bo_put(vm_bo);
 	} else /* userptr or null */ {
-		if (!is_null) {
+		if (!is_null && !is_system_allocator) {
 			struct xe_userptr *userptr = &to_userptr_vma(vma)->userptr;
 			u64 size = end - start + 1;
 			int err;
@@ -1029,7 +1034,7 @@ static void xe_vma_destroy_late(struct xe_vma *vma)
 		 */
 		mmu_interval_notifier_remove(&userptr->notifier);
 		xe_vm_put(vm);
-	} else if (xe_vma_is_null(vma)) {
+	} else if (xe_vma_is_null(vma) || xe_vma_is_system_allocator(vma)) {
 		xe_vm_put(vm);
 	} else {
 		xe_bo_put(xe_vma_bo(vma));
@@ -1068,7 +1073,7 @@ static void xe_vma_destroy(struct xe_vma *vma, struct dma_fence *fence)
 		spin_lock(&vm->userptr.invalidated_lock);
 		list_del(&to_userptr_vma(vma)->userptr.invalidate_link);
 		spin_unlock(&vm->userptr.invalidated_lock);
-	} else if (!xe_vma_is_null(vma)) {
+	} else if (!xe_vma_is_null(vma) && !xe_vma_is_system_allocator(vma)) {
 		xe_bo_assert_held(xe_vma_bo(vma));
 
 		drm_gpuva_unlink(&vma->gpuva);
@@ -1967,6 +1972,8 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_bo *bo,
 			op->map.read_only =
 				flags & DRM_XE_VM_BIND_FLAG_READONLY;
 			op->map.is_null = flags & DRM_XE_VM_BIND_FLAG_NULL;
+			op->map.is_system_allocator = flags &
+				DRM_XE_VM_BIND_FLAG_SYSTEM_ALLOCATOR;
 			op->map.dumpable = flags & DRM_XE_VM_BIND_FLAG_DUMPABLE;
 			op->map.pat_index = pat_index;
 		} else if (__op->op == DRM_GPUVA_OP_PREFETCH) {
@@ -2158,6 +2165,8 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct drm_gpuva_ops *ops,
 				VMA_CREATE_FLAG_IS_NULL : 0;
 			flags |= op->map.dumpable ?
 				VMA_CREATE_FLAG_DUMPABLE : 0;
+			flags |= op->map.is_system_allocator ?
+				VMA_CREATE_FLAG_IS_SYSTEM_ALLOCATOR : 0;
 
 			vma = new_vma(vm, &op->base.map, op->map.pat_index,
 				      flags);
@@ -2165,7 +2174,8 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct drm_gpuva_ops *ops,
 				return PTR_ERR(vma);
 
 			op->map.vma = vma;
-			if (op->map.immediate || !xe_vm_in_fault_mode(vm))
+			if ((op->map.immediate || !xe_vm_in_fault_mode(vm)) &&
+			    !op->map.is_system_allocator)
 				xe_vma_ops_incr_pt_update_ops(vops,
 							      op->tile_mask);
 			break;
@@ -2174,21 +2184,24 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct drm_gpuva_ops *ops,
 		{
 			struct xe_vma *old =
 				gpuva_to_vma(op->base.remap.unmap->va);
+			bool skip = xe_vma_is_system_allocator(old);
 
 			op->remap.start = xe_vma_start(old);
 			op->remap.range = xe_vma_size(old);
 
-			if (op->base.remap.prev) {
-				flags |= op->base.remap.unmap->va->flags &
-					XE_VMA_READ_ONLY ?
-					VMA_CREATE_FLAG_READ_ONLY : 0;
-				flags |= op->base.remap.unmap->va->flags &
-					DRM_GPUVA_SPARSE ?
-					VMA_CREATE_FLAG_IS_NULL : 0;
-				flags |= op->base.remap.unmap->va->flags &
-					XE_VMA_DUMPABLE ?
-					VMA_CREATE_FLAG_DUMPABLE : 0;
+			flags |= op->base.remap.unmap->va->flags &
+				XE_VMA_READ_ONLY ?
+				VMA_CREATE_FLAG_READ_ONLY : 0;
+			flags |= op->base.remap.unmap->va->flags &
+				DRM_GPUVA_SPARSE ?
+				VMA_CREATE_FLAG_IS_NULL : 0;
+			flags |= op->base.remap.unmap->va->flags &
+				XE_VMA_DUMPABLE ?
+				VMA_CREATE_FLAG_DUMPABLE : 0;
+			flags |= xe_vma_is_system_allocator(old) ?
+				VMA_CREATE_FLAG_IS_SYSTEM_ALLOCATOR : 0;
 
+			if (op->base.remap.prev) {
 				vma = new_vma(vm, op->base.remap.prev,
 					      old->pat_index, flags);
 				if (IS_ERR(vma))
@@ -2200,9 +2213,10 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct drm_gpuva_ops *ops,
 				 * Userptr creates a new SG mapping so
 				 * we must also rebind.
 				 */
-				op->remap.skip_prev = !xe_vma_is_userptr(old) &&
+				op->remap.skip_prev = skip ||
+					(!xe_vma_is_userptr(old) &&
 					IS_ALIGNED(xe_vma_end(vma),
-						   xe_vma_max_pte_size(old));
+						   xe_vma_max_pte_size(old)));
 				if (op->remap.skip_prev) {
 					xe_vma_set_pte_size(vma, xe_vma_max_pte_size(old));
 					op->remap.range -=
@@ -2218,16 +2232,6 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct drm_gpuva_ops *ops,
 			}
 
 			if (op->base.remap.next) {
-				flags |= op->base.remap.unmap->va->flags &
-					XE_VMA_READ_ONLY ?
-					VMA_CREATE_FLAG_READ_ONLY : 0;
-				flags |= op->base.remap.unmap->va->flags &
-					DRM_GPUVA_SPARSE ?
-					VMA_CREATE_FLAG_IS_NULL : 0;
-				flags |= op->base.remap.unmap->va->flags &
-					XE_VMA_DUMPABLE ?
-					VMA_CREATE_FLAG_DUMPABLE : 0;
-
 				vma = new_vma(vm, op->base.remap.next,
 					      old->pat_index, flags);
 				if (IS_ERR(vma))
@@ -2239,9 +2243,10 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct drm_gpuva_ops *ops,
 				 * Userptr creates a new SG mapping so
 				 * we must also rebind.
 				 */
-				op->remap.skip_next = !xe_vma_is_userptr(old) &&
+				op->remap.skip_next = skip ||
+					(!xe_vma_is_userptr(old) &&
 					IS_ALIGNED(xe_vma_start(vma),
-						   xe_vma_max_pte_size(old));
+						   xe_vma_max_pte_size(old)));
 				if (op->remap.skip_next) {
 					xe_vma_set_pte_size(vma, xe_vma_max_pte_size(old));
 					op->remap.range -=
@@ -2254,14 +2259,27 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct drm_gpuva_ops *ops,
 					xe_vma_ops_incr_pt_update_ops(vops, op->tile_mask);
 				}
 			}
-			xe_vma_ops_incr_pt_update_ops(vops, op->tile_mask);
+			if (!skip)
+				xe_vma_ops_incr_pt_update_ops(vops, op->tile_mask);
 			break;
 		}
 		case DRM_GPUVA_OP_UNMAP:
+		{
+			struct xe_vma *vma = gpuva_to_vma(op->base.unmap.va);
+
+			if (!xe_vma_is_system_allocator(vma))
+				xe_vma_ops_incr_pt_update_ops(vops, op->tile_mask);
+			break;
+		}
 		case DRM_GPUVA_OP_PREFETCH:
+		{
+			struct xe_vma *vma = gpuva_to_vma(op->base.prefetch.va);
+
 			/* FIXME: Need to skip some prefetch ops */
-			xe_vma_ops_incr_pt_update_ops(vops, op->tile_mask);
+			if (!xe_vma_is_system_allocator(vma))
+				xe_vma_ops_incr_pt_update_ops(vops, op->tile_mask);
 			break;
+		}
 		default:
 			drm_warn(&vm->xe->drm, "NOT POSSIBLE");
 		}
@@ -2702,7 +2720,8 @@ static int vm_bind_ioctl_ops_execute(struct xe_vm *vm,
 	(DRM_XE_VM_BIND_FLAG_READONLY | \
 	 DRM_XE_VM_BIND_FLAG_IMMEDIATE | \
 	 DRM_XE_VM_BIND_FLAG_NULL | \
-	 DRM_XE_VM_BIND_FLAG_DUMPABLE)
+	 DRM_XE_VM_BIND_FLAG_DUMPABLE | \
+	 DRM_XE_VM_BIND_FLAG_SYSTEM_ALLOCATOR)
 
 #ifdef TEST_VM_OPS_ERROR
 #define SUPPORTED_FLAGS	(SUPPORTED_FLAGS_STUB | FORCE_OP_ERROR)
@@ -2757,9 +2776,17 @@ static int vm_bind_ioctl_check_args(struct xe_device *xe,
 		u64 obj_offset = (*bind_ops)[i].obj_offset;
 		u32 prefetch_region = (*bind_ops)[i].prefetch_mem_region_instance;
 		bool is_null = flags & DRM_XE_VM_BIND_FLAG_NULL;
+		bool is_system_allocator = flags &
+			DRM_XE_VM_BIND_FLAG_SYSTEM_ALLOCATOR;
 		u16 pat_index = (*bind_ops)[i].pat_index;
 		u16 coh_mode;
 
+		/* FIXME: Disabling system allocator for now */
+		if (XE_IOCTL_DBG(xe, is_system_allocator)) {
+			err = -EOPNOTSUPP;
+			goto free_bind_ops;
+		}
+
 		if (XE_IOCTL_DBG(xe, pat_index >= xe->pat.n_entries)) {
 			err = -EINVAL;
 			goto free_bind_ops;
@@ -2780,13 +2807,14 @@ static int vm_bind_ioctl_check_args(struct xe_device *xe,
 
 		if (XE_IOCTL_DBG(xe, op > DRM_XE_VM_BIND_OP_PREFETCH) ||
 		    XE_IOCTL_DBG(xe, flags & ~SUPPORTED_FLAGS) ||
-		    XE_IOCTL_DBG(xe, obj && is_null) ||
-		    XE_IOCTL_DBG(xe, obj_offset && is_null) ||
+		    XE_IOCTL_DBG(xe, obj && (is_null || is_system_allocator)) ||
+		    XE_IOCTL_DBG(xe, obj_offset && (is_null ||
+				 is_system_allocator)) ||
 		    XE_IOCTL_DBG(xe, op != DRM_XE_VM_BIND_OP_MAP &&
-				 is_null) ||
+				 (is_null || is_system_allocator)) ||
 		    XE_IOCTL_DBG(xe, !obj &&
 				 op == DRM_XE_VM_BIND_OP_MAP &&
-				 !is_null) ||
+				 !is_null && !is_system_allocator) ||
 		    XE_IOCTL_DBG(xe, !obj &&
 				 op == DRM_XE_VM_BIND_OP_UNMAP_ALL) ||
 		    XE_IOCTL_DBG(xe, addr &&
@@ -3170,6 +3198,7 @@ int xe_vm_invalidate_vma(struct xe_vma *vma)
 	int ret = 0;
 
 	xe_assert(xe, !xe_vma_is_null(vma));
+	xe_assert(xe, !xe_vma_is_system_allocator(vma));
 	trace_xe_vma_invalidate(vma);
 
 	vm_dbg(&xe_vma_vm(vma)->xe->drm,
diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
index c864dba35e1d..1a5aed678214 100644
--- a/drivers/gpu/drm/xe/xe_vm.h
+++ b/drivers/gpu/drm/xe/xe_vm.h
@@ -151,6 +151,11 @@ static inline bool xe_vma_is_null(struct xe_vma *vma)
 	return vma->gpuva.flags & DRM_GPUVA_SPARSE;
 }
 
+static inline bool xe_vma_is_system_allocator(struct xe_vma *vma)
+{
+	return vma->gpuva.flags & XE_VMA_SYSTEM_ALLOCATOR;
+}
+
 static inline bool xe_vma_has_no_bo(struct xe_vma *vma)
 {
 	return !xe_vma_bo(vma);
@@ -158,7 +163,8 @@ static inline bool xe_vma_has_no_bo(struct xe_vma *vma)
 
 static inline bool xe_vma_is_userptr(struct xe_vma *vma)
 {
-	return xe_vma_has_no_bo(vma) && !xe_vma_is_null(vma);
+	return xe_vma_has_no_bo(vma) && !xe_vma_is_null(vma) &&
+		!xe_vma_is_system_allocator(vma);
 }
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
index 7f9a303e51d8..1764781c376b 100644
--- a/drivers/gpu/drm/xe/xe_vm_types.h
+++ b/drivers/gpu/drm/xe/xe_vm_types.h
@@ -42,6 +42,7 @@ struct xe_vm_pgtable_update_op;
 #define XE_VMA_PTE_64K		(DRM_GPUVA_USERBITS << 6)
 #define XE_VMA_PTE_COMPACT	(DRM_GPUVA_USERBITS << 7)
 #define XE_VMA_DUMPABLE		(DRM_GPUVA_USERBITS << 8)
+#define XE_VMA_SYSTEM_ALLOCATOR	(DRM_GPUVA_USERBITS << 9)
 
 /** struct xe_userptr - User pointer */
 struct xe_userptr {
@@ -294,6 +295,8 @@ struct xe_vma_op_map {
 	bool read_only;
 	/** @is_null: is NULL binding */
 	bool is_null;
+	/** @is_system_allocator: is system allocator binding */
+	bool is_system_allocator;
 	/** @dumpable: whether BO is dumped on GPU hang */
 	bool dumpable;
 	/** @pat_index: The pat index to use for this operation. */
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index c4182e95a619..1e92fd498967 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -906,6 +906,12 @@ struct drm_xe_vm_destroy {
  *    will only be valid for DRM_XE_VM_BIND_OP_MAP operations, the BO
  *    handle MBZ, and the BO offset MBZ. This flag is intended to
  *    implement VK sparse bindings.
+ *  - %DRM_XE_VM_BIND_FLAG_SYSTEM_ALLOCATOR - When the system allocator flag is
+ *    set, no mappings are created rather the range is reserved for system
+ *    allocations which will be populated on GPU page faults. Only valid on VMs
+ *    with DRM_XE_VM_CREATE_FLAG_FAULT_MODE set. The system allocator flag are
+ *    only valid for DRM_XE_VM_BIND_OP_MAP operations, the BO handle MBZ, and
+ *    the BO offset MBZ.
  */
 struct drm_xe_vm_bind_op {
 	/** @extensions: Pointer to the first extension struct, if any */
@@ -958,7 +964,9 @@ struct drm_xe_vm_bind_op {
 	 * on the @pat_index. For such mappings there is no actual memory being
 	 * mapped (the address in the PTE is invalid), so the various PAT memory
 	 * attributes likely do not apply.  Simply leaving as zero is one
-	 * option (still a valid pat_index).
+	 * option (still a valid pat_index). Same applies to
+	 * DRM_XE_VM_BIND_FLAG_SYSTEM_ALLOCATOR bindings as for such mapping
+	 * there is no actual memory being mapped.
 	 */
 	__u16 pat_index;
 
@@ -974,6 +982,14 @@ struct drm_xe_vm_bind_op {
 
 		/** @userptr: user pointer to bind on */
 		__u64 userptr;
+
+		/**
+		 * @system_allocator_offset: Offset from GPU @addr to create
+		 * system allocator mappings. MBZ with current level of support
+		 * (e.g. 1 to 1 mapping between GPU and CPU mappings only
+		 * supported).
+		 */
+		__s64 system_allocator_offset;
 	};
 
 	/**
@@ -996,6 +1012,7 @@ struct drm_xe_vm_bind_op {
 #define DRM_XE_VM_BIND_FLAG_IMMEDIATE	(1 << 1)
 #define DRM_XE_VM_BIND_FLAG_NULL	(1 << 2)
 #define DRM_XE_VM_BIND_FLAG_DUMPABLE	(1 << 3)
+#define DRM_XE_VM_BIND_FLAG_SYSTEM_ALLOCATOR	(1 << 4)
 	/** @flags: Bind flags */
 	__u32 flags;
 
-- 
2.34.1

