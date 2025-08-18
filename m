Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 479B9B2B372
	for <lists+dri-devel@lfdr.de>; Mon, 18 Aug 2025 23:31:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59AA810E4F8;
	Mon, 18 Aug 2025 21:31:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aHVtm3wr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6B4510E4F3;
 Mon, 18 Aug 2025 21:31:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755552682; x=1787088682;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=rS0w2lHMIwiDrkc5Pik2nIj5ekumCx8bR5TZbY5o2Js=;
 b=aHVtm3wr5Emm4hHgD95aX/U94ajZFRXWOdjrWJyVJtkHrUvTsTD1QtBt
 Av96kxMTKIS3a/O1c8hhoOWELOLMPpSFfdjQDwFMKjkLno5iGppjhqMV0
 eueIF7iljRPlg0Tg91ZN89E/y1xOmk9pFeOe0ANBp0/NNwb/u2lUN0U9c
 96QbBVOVZ+mk6Pht2JgO8KBjtRwq6ywtdGh2m8J5guU5lw09QDjk9Vb7o
 r5iXIKrzgVM/GpAMTAe/SVzesMpRpfKY/SAON7qZYid1/ZMLbr65LLXIu
 oeTp5ujpZYJFmoHaDLs8+G3F3d8v357mGbK4crWvcgsuzzDelj7qmi9UV w==;
X-CSE-ConnectionGUID: 50v2coDGQYGtwlGwqjj1Vg==
X-CSE-MsgGUID: LuGgA3dgQjy+QzsFV8oC2g==
X-IronPort-AV: E=McAfee;i="6800,10657,11526"; a="56815282"
X-IronPort-AV: E=Sophos;i="6.17,300,1747724400"; d="scan'208";a="56815282"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2025 14:31:21 -0700
X-CSE-ConnectionGUID: 88W7p5eOSe6S4p8Z5MHPvg==
X-CSE-MsgGUID: Er/vo+UPTzOPbIZCoxtrXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,300,1747724400"; d="scan'208";a="167186373"
Received: from himal-super-server.iind.intel.com ([10.190.239.34])
 by fmviesa007.fm.intel.com with ESMTP; 18 Aug 2025 14:31:19 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v8 22/24] drm/xe: Reset VMA attributes to default in SVM
 garbage collector
Date: Tue, 19 Aug 2025 03:27:51 +0530
Message-Id: <20250818215753.2762426-23-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250818215753.2762426-1-himal.prasad.ghimiray@intel.com>
References: <20250818215753.2762426-1-himal.prasad.ghimiray@intel.com>
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

Restore default memory attributes for VMAs during garbage collection
if they were modified by madvise. Reuse existing VMA if fully overlapping;
otherwise, allocate a new mirror VMA.

v2 (Matthew Brost)
- Add helper for vma split
- Add retry to get updated vma

v3
- Rebase on gpuvm layer

Suggested-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_svm.c |  80 ++++++++++++++++--
 drivers/gpu/drm/xe/xe_vm.c  | 156 ++++++++++++++++++++++++++----------
 drivers/gpu/drm/xe/xe_vm.h  |   2 +
 3 files changed, 190 insertions(+), 48 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index 19585a3d9f69..0596039ef0a1 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -253,10 +253,56 @@ static int __xe_svm_garbage_collector(struct xe_vm *vm,
 	return 0;
 }
 
+static int xe_svm_range_set_default_attr(struct xe_vm *vm, u64 range_start, u64 range_end)
+{
+	struct xe_vma *vma;
+	struct xe_vma_mem_attr default_attr = {
+		.preferred_loc = {
+			.devmem_fd = DRM_XE_PREFERRED_LOC_DEFAULT_DEVICE,
+			.migration_policy = DRM_XE_MIGRATE_ALL_PAGES,
+		},
+		.atomic_access = DRM_XE_ATOMIC_UNDEFINED,
+	};
+	int err = 0;
+
+	vma = xe_vm_find_vma_by_addr(vm, range_start);
+	if (!vma)
+		return -EINVAL;
+
+	if (xe_vma_has_default_mem_attrs(vma))
+		return 0;
+
+	vm_dbg(&vm->xe->drm, "Existing VMA start=0x%016llx, vma_end=0x%016llx",
+	       xe_vma_start(vma), xe_vma_end(vma));
+
+	if (xe_vma_start(vma) == range_start && xe_vma_end(vma) == range_end) {
+		default_attr.pat_index = vma->attr.default_pat_index;
+		default_attr.default_pat_index  = vma->attr.default_pat_index;
+		vma->attr = default_attr;
+	} else {
+		vm_dbg(&vm->xe->drm, "Split VMA start=0x%016llx, vma_end=0x%016llx",
+		       range_start, range_end);
+		err = xe_vm_alloc_cpu_addr_mirror_vma(vm, range_start, range_end - range_start);
+		if (err) {
+			drm_warn(&vm->xe->drm, "VMA SPLIT failed: %pe\n", ERR_PTR(err));
+			xe_vm_kill(vm, true);
+			return err;
+		}
+	}
+
+	/*
+	 * On call from xe_svm_handle_pagefault original VMA might be changed
+	 * signal this to lookup for VMA again.
+	 */
+	return -EAGAIN;
+}
+
 static int xe_svm_garbage_collector(struct xe_vm *vm)
 {
 	struct xe_svm_range *range;
-	int err;
+	u64 range_start;
+	u64 range_end;
+	int err, ret = 0;
 
 	lockdep_assert_held_write(&vm->lock);
 
@@ -271,6 +317,9 @@ static int xe_svm_garbage_collector(struct xe_vm *vm)
 		if (!range)
 			break;
 
+		range_start = xe_svm_range_start(range);
+		range_end = xe_svm_range_end(range);
+
 		list_del(&range->garbage_collector_link);
 		spin_unlock(&vm->svm.garbage_collector.lock);
 
@@ -283,11 +332,19 @@ static int xe_svm_garbage_collector(struct xe_vm *vm)
 			return err;
 		}
 
+		err = xe_svm_range_set_default_attr(vm, range_start, range_end);
+		if (err) {
+			if (err == -EAGAIN)
+				ret = -EAGAIN;
+			else
+				return err;
+		}
+
 		spin_lock(&vm->svm.garbage_collector.lock);
 	}
 	spin_unlock(&vm->svm.garbage_collector.lock);
 
-	return 0;
+	return ret;
 }
 
 static void xe_svm_garbage_collector_work_func(struct work_struct *w)
@@ -927,13 +984,26 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
 			    struct xe_gt *gt, u64 fault_addr,
 			    bool atomic)
 {
-	int need_vram;
-
+	int need_vram, ret;
+retry:
 	need_vram = xe_vma_need_vram_for_atomic(vm->xe, vma, atomic);
 	if (need_vram < 0)
 		return need_vram;
 
-	return __xe_svm_handle_pagefault(vm, vma, gt, fault_addr, need_vram ? true : false);
+	ret =  __xe_svm_handle_pagefault(vm, vma, gt, fault_addr,
+					 need_vram ? true : false);
+	if (ret == -EAGAIN) {
+		/*
+		 * Retry once on -EAGAIN to re-lookup the VMA, as the original VMA
+		 * may have been split by xe_svm_range_set_default_attr.
+		 */
+		vma = xe_vm_find_vma_by_addr(vm, fault_addr);
+		if (!vma)
+			return -EINVAL;
+
+		goto retry;
+	}
+	return ret;
 }
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 123b88d85c13..f2cf8e046eef 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -4287,35 +4287,26 @@ int xe_vma_need_vram_for_atomic(struct xe_device *xe, struct xe_vma *vma, bool i
 	}
 }
 
-/**
- * xe_vm_alloc_madvise_vma - Allocate VMA's with madvise ops
- * @vm: Pointer to the xe_vm structure
- * @start: Starting input address
- * @range: Size of the input range
- *
- * This function splits existing vma to create new vma for user provided input range
- *
- *  Return: 0 if success
- */
-int xe_vm_alloc_madvise_vma(struct xe_vm *vm, uint64_t start, uint64_t range)
+static int xe_vm_alloc_vma(struct xe_vm *vm,
+			   struct drm_gpuvm_map_req *map_req,
+			   bool is_madvise)
 {
-	struct drm_gpuvm_map_req map_req = {
-		.map.va.addr = start,
-		.map.va.range = range,
-	};
-
 	struct xe_vma_ops vops;
 	struct drm_gpuva_ops *ops = NULL;
 	struct drm_gpuva_op *__op;
 	bool is_cpu_addr_mirror = false;
 	bool remap_op = false;
 	struct xe_vma_mem_attr tmp_attr;
+	u16 default_pat;
 	int err;
 
 	lockdep_assert_held_write(&vm->lock);
 
-	vm_dbg(&vm->xe->drm, "MADVISE_OPS_CREATE: addr=0x%016llx, size=0x%016llx", start, range);
-	ops = drm_gpuvm_madvise_ops_create(&vm->gpuvm, &map_req);
+	if (is_madvise)
+		ops = drm_gpuvm_madvise_ops_create(&vm->gpuvm, map_req);
+	else
+		ops = drm_gpuvm_sm_map_ops_create(&vm->gpuvm, map_req);
+
 	if (IS_ERR(ops))
 		return PTR_ERR(ops);
 
@@ -4326,33 +4317,57 @@ int xe_vm_alloc_madvise_vma(struct xe_vm *vm, uint64_t start, uint64_t range)
 
 	drm_gpuva_for_each_op(__op, ops) {
 		struct xe_vma_op *op = gpuva_op_to_vma_op(__op);
+		struct xe_vma *vma = NULL;
 
-		if (__op->op == DRM_GPUVA_OP_REMAP) {
-			xe_assert(vm->xe, !remap_op);
-			remap_op = true;
+		if (!is_madvise) {
+			if (__op->op == DRM_GPUVA_OP_UNMAP) {
+				vma = gpuva_to_vma(op->base.unmap.va);
+				XE_WARN_ON(!xe_vma_has_default_mem_attrs(vma));
+				default_pat = vma->attr.default_pat_index;
+			}
 
-			if (xe_vma_is_cpu_addr_mirror(gpuva_to_vma(op->base.remap.unmap->va)))
-				is_cpu_addr_mirror = true;
-			else
-				is_cpu_addr_mirror = false;
-		}
+			if (__op->op == DRM_GPUVA_OP_REMAP) {
+				vma = gpuva_to_vma(op->base.remap.unmap->va);
+				default_pat = vma->attr.default_pat_index;
+			}
 
-		if (__op->op == DRM_GPUVA_OP_MAP) {
-			xe_assert(vm->xe, remap_op);
-			remap_op = false;
+			if (__op->op == DRM_GPUVA_OP_MAP) {
+				op->map.is_cpu_addr_mirror = true;
+				op->map.pat_index = default_pat;
+			}
+		} else {
+			if (__op->op == DRM_GPUVA_OP_REMAP) {
+				vma = gpuva_to_vma(op->base.remap.unmap->va);
+				xe_assert(vm->xe, !remap_op);
+				xe_assert(vm->xe, xe_vma_has_no_bo(vma));
+				remap_op = true;
+
+				if (xe_vma_is_cpu_addr_mirror(vma))
+					is_cpu_addr_mirror = true;
+				else
+					is_cpu_addr_mirror = false;
+			}
 
-			/* In case of madvise ops DRM_GPUVA_OP_MAP is always after
-			 * DRM_GPUVA_OP_REMAP, so ensure we assign op->map.is_cpu_addr_mirror true
-			 * if REMAP is for xe_vma_is_cpu_addr_mirror vma
-			 */
-			op->map.is_cpu_addr_mirror = is_cpu_addr_mirror;
+			if (__op->op == DRM_GPUVA_OP_MAP) {
+				xe_assert(vm->xe, remap_op);
+				remap_op = false;
+				/*
+				 * In case of madvise ops DRM_GPUVA_OP_MAP is
+				 * always after DRM_GPUVA_OP_REMAP, so ensure
+				 * we assign op->map.is_cpu_addr_mirror true
+				 * if REMAP is for xe_vma_is_cpu_addr_mirror vma
+				 */
+				op->map.is_cpu_addr_mirror = is_cpu_addr_mirror;
+			}
 		}
-
 		print_op(vm->xe, __op);
 	}
 
 	xe_vma_ops_init(&vops, vm, NULL, NULL, 0);
-	vops.flags |= XE_VMA_OPS_FLAG_MADVISE;
+
+	if (is_madvise)
+		vops.flags |= XE_VMA_OPS_FLAG_MADVISE;
+
 	err = vm_bind_ioctl_ops_parse(vm, ops, &vops);
 	if (err)
 		goto unwind_ops;
@@ -4364,15 +4379,20 @@ int xe_vm_alloc_madvise_vma(struct xe_vm *vm, uint64_t start, uint64_t range)
 		struct xe_vma *vma;
 
 		if (__op->op == DRM_GPUVA_OP_UNMAP) {
-			/* There should be no unmap */
-			XE_WARN_ON("UNEXPECTED UNMAP");
-			xe_vma_destroy(gpuva_to_vma(op->base.unmap.va), NULL);
+			vma = gpuva_to_vma(op->base.unmap.va);
+			/* There should be no unmap for madvise */
+			if (is_madvise)
+				XE_WARN_ON("UNEXPECTED UNMAP");
+
+			xe_vma_destroy(vma, NULL);
 		} else if (__op->op == DRM_GPUVA_OP_REMAP) {
 			vma = gpuva_to_vma(op->base.remap.unmap->va);
-			/* Store attributes for REMAP UNMAPPED VMA, so they can be assigned
-			 * to newly MAP created vma.
+			/* In case of madvise ops Store attributes for REMAP UNMAPPED
+			 * VMA, so they can be assigned to newly MAP created vma.
 			 */
-			tmp_attr = vma->attr;
+			if (is_madvise)
+				tmp_attr = vma->attr;
+
 			xe_vma_destroy(gpuva_to_vma(op->base.remap.unmap->va), NULL);
 		} else if (__op->op == DRM_GPUVA_OP_MAP) {
 			vma = op->map.vma;
@@ -4380,7 +4400,8 @@ int xe_vm_alloc_madvise_vma(struct xe_vm *vm, uint64_t start, uint64_t range)
 			 * Therefore temp_attr will always have sane values, making it safe to
 			 * copy them to new vma.
 			 */
-			vma->attr = tmp_attr;
+			if (is_madvise)
+				vma->attr = tmp_attr;
 		}
 	}
 
@@ -4394,3 +4415,52 @@ int xe_vm_alloc_madvise_vma(struct xe_vm *vm, uint64_t start, uint64_t range)
 	drm_gpuva_ops_free(&vm->gpuvm, ops);
 	return err;
 }
+
+/**
+ * xe_vm_alloc_madvise_vma - Allocate VMA's with madvise ops
+ * @vm: Pointer to the xe_vm structure
+ * @start: Starting input address
+ * @range: Size of the input range
+ *
+ * This function splits existing vma to create new vma for user provided input range
+ *
+ * Return: 0 if success
+ */
+int xe_vm_alloc_madvise_vma(struct xe_vm *vm, uint64_t start, uint64_t range)
+{
+	struct drm_gpuvm_map_req map_req = {
+		.map.va.addr = start,
+		.map.va.range = range,
+	};
+
+	lockdep_assert_held_write(&vm->lock);
+
+	vm_dbg(&vm->xe->drm, "MADVISE_OPS_CREATE: addr=0x%016llx, size=0x%016llx", start, range);
+
+	return xe_vm_alloc_vma(vm, &map_req, true);
+}
+
+/**
+ * xe_vm_alloc_cpu_addr_mirror_vma - Allocate CPU addr mirror vma
+ * @vm: Pointer to the xe_vm structure
+ * @start: Starting input address
+ * @range: Size of the input range
+ *
+ * This function splits/merges existing vma to create new vma for user provided input range
+ *
+ * Return: 0 if success
+ */
+int xe_vm_alloc_cpu_addr_mirror_vma(struct xe_vm *vm, uint64_t start, uint64_t range)
+{
+	struct drm_gpuvm_map_req map_req = {
+		.map.va.addr = start,
+		.map.va.range = range,
+	};
+
+	lockdep_assert_held_write(&vm->lock);
+
+	vm_dbg(&vm->xe->drm, "CPU_ADDR_MIRROR_VMA_OPS_CREATE: addr=0x%016llx, size=0x%016llx",
+	       start, range);
+
+	return xe_vm_alloc_vma(vm, &map_req, false);
+}
diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
index 83a61fcef3b4..c8b8318fe61a 100644
--- a/drivers/gpu/drm/xe/xe_vm.h
+++ b/drivers/gpu/drm/xe/xe_vm.h
@@ -177,6 +177,8 @@ int xe_vma_need_vram_for_atomic(struct xe_device *xe, struct xe_vma *vma, bool i
 
 int xe_vm_alloc_madvise_vma(struct xe_vm *vm, uint64_t addr, uint64_t size);
 
+int xe_vm_alloc_cpu_addr_mirror_vma(struct xe_vm *vm, uint64_t addr, uint64_t size);
+
 /**
  * to_userptr_vma() - Return a pointer to an embedding userptr vma
  * @vma: Pointer to the embedded struct xe_vma
-- 
2.34.1

