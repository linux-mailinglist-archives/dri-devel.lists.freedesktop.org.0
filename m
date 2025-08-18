Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9071AB2B370
	for <lists+dri-devel@lfdr.de>; Mon, 18 Aug 2025 23:31:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B490510E4E9;
	Mon, 18 Aug 2025 21:31:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dgjGepuO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70AB310E4ED;
 Mon, 18 Aug 2025 21:31:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755552681; x=1787088681;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=X2jtkFeU66GlRJO9q5DY3+idcXiGghulcKIRsCV4CYQ=;
 b=dgjGepuOBPFL4jYuT6tlu08op19q08pX7RCbPCRxuEdFr1nJAkoJ/TPZ
 8JK5yqUbXAmBJEfahRcKfEU2tLSkj5VP7P6AX3PgtPboaHFdTFhWuuDZQ
 Z1VnEKVdKlpHPhQS5kghqmsuSZ5vum2SQCPEWdoA2WuqtivMD2YsxDrm5
 WHSi73+EQr3bkjVpGqWXEJ1aTpoEBeIrDj+0EAw3puWLLLMDpvY5ftkcU
 EP+MIJgcy4DiKXSfElEfAUJikphnnVf9qA5T4xh1m+ze4Vf7H1U9TVZAz
 bQq1qa9T1vn77hjiwsFaqktLKcYvSEJXl5wgnEL09bouT4bPOKjhD5oBU g==;
X-CSE-ConnectionGUID: DOkeZcPuRWqGfsE3D9Fs/Q==
X-CSE-MsgGUID: CN/ip1sFSJCfKaOy7lG3dQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11526"; a="56815268"
X-IronPort-AV: E=Sophos;i="6.17,300,1747724400"; d="scan'208";a="56815268"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2025 14:31:15 -0700
X-CSE-ConnectionGUID: E8rsYNE1S8S3P29cWMtdQg==
X-CSE-MsgGUID: 5FtpbFO0RcWVqRRpp2xxSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,300,1747724400"; d="scan'208";a="167186338"
Received: from himal-super-server.iind.intel.com ([10.190.239.34])
 by fmviesa007.fm.intel.com with ESMTP; 18 Aug 2025 14:31:14 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v8 19/24] drm/xe/bo: Update atomic_access attribute on madvise
Date: Tue, 19 Aug 2025 03:27:48 +0530
Message-Id: <20250818215753.2762426-20-himal.prasad.ghimiray@intel.com>
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

Update the bo_atomic_access based on user-provided input and determine
the migration to smem during a CPU fault

v2 (Matthew Brost)
- Avoid cpu unmapping if bo is already in smem
- check atomics on smem too for ioctl
- Add comments

v3
- Avoid migration in prefetch

v4 (Matthew Brost)
- make sanity check function bool
- add assert for smem placement
- fix doc

v5 (Matthew Brost)
- NACK atomic fault with  DRM_XE_ATOMIC_CPU

Cc: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c           | 29 ++++++++++++--
 drivers/gpu/drm/xe/xe_gt_pagefault.c | 35 ++++++-----------
 drivers/gpu/drm/xe/xe_vm.c           |  7 +++-
 drivers/gpu/drm/xe/xe_vm_madvise.c   | 59 +++++++++++++++++++++++++++-
 4 files changed, 102 insertions(+), 28 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 6fea39842e1e..72396d358a00 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -1711,6 +1711,18 @@ static void xe_gem_object_close(struct drm_gem_object *obj,
 	}
 }
 
+static bool should_migrate_to_smem(struct xe_bo *bo)
+{
+	/*
+	 * NOTE: The following atomic checks are platform-specific. For example,
+	 * if a device supports CXL atomics, these may not be necessary or
+	 * may behave differently.
+	 */
+
+	return bo->attr.atomic_access == DRM_XE_ATOMIC_GLOBAL ||
+	       bo->attr.atomic_access == DRM_XE_ATOMIC_CPU;
+}
+
 static vm_fault_t xe_gem_fault(struct vm_fault *vmf)
 {
 	struct ttm_buffer_object *tbo = vmf->vma->vm_private_data;
@@ -1719,7 +1731,7 @@ static vm_fault_t xe_gem_fault(struct vm_fault *vmf)
 	struct xe_bo *bo = ttm_to_xe_bo(tbo);
 	bool needs_rpm = bo->flags & XE_BO_FLAG_VRAM_MASK;
 	vm_fault_t ret;
-	int idx;
+	int idx, r = 0;
 
 	if (needs_rpm)
 		xe_pm_runtime_get(xe);
@@ -1731,8 +1743,19 @@ static vm_fault_t xe_gem_fault(struct vm_fault *vmf)
 	if (drm_dev_enter(ddev, &idx)) {
 		trace_xe_bo_cpu_fault(bo);
 
-		ret = ttm_bo_vm_fault_reserved(vmf, vmf->vma->vm_page_prot,
-					       TTM_BO_VM_NUM_PREFAULT);
+		if (should_migrate_to_smem(bo)) {
+			xe_assert(xe, bo->flags & XE_BO_FLAG_SYSTEM);
+
+			r = xe_bo_migrate(bo, XE_PL_TT);
+			if (r == -EBUSY || r == -ERESTARTSYS || r == -EINTR)
+				ret = VM_FAULT_NOPAGE;
+			else if (r)
+				ret = VM_FAULT_SIGBUS;
+		}
+		if (!ret)
+			ret = ttm_bo_vm_fault_reserved(vmf,
+						       vmf->vma->vm_page_prot,
+						       TTM_BO_VM_NUM_PREFAULT);
 		drm_dev_exit(idx);
 
 		if (ret == VM_FAULT_RETRY &&
diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
index ab43dec52776..4ea30fbce9bd 100644
--- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
+++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
@@ -75,7 +75,7 @@ static bool vma_is_valid(struct xe_tile *tile, struct xe_vma *vma)
 }
 
 static int xe_pf_begin(struct drm_exec *exec, struct xe_vma *vma,
-		       bool atomic, struct xe_vram_region *vram)
+		       bool need_vram_move, struct xe_vram_region *vram)
 {
 	struct xe_bo *bo = xe_vma_bo(vma);
 	struct xe_vm *vm = xe_vma_vm(vma);
@@ -85,26 +85,13 @@ static int xe_pf_begin(struct drm_exec *exec, struct xe_vma *vma,
 	if (err)
 		return err;
 
-	if (atomic && vram) {
-		xe_assert(vm->xe, IS_DGFX(vm->xe));
+	if (!bo)
+		return 0;
 
-		if (xe_vma_is_userptr(vma)) {
-			err = -EACCES;
-			return err;
-		}
+	err = need_vram_move ? xe_bo_migrate(bo, vram->placement) :
+			       xe_bo_validate(bo, vm, true);
 
-		/* Migrate to VRAM, move should invalidate the VMA first */
-		err = xe_bo_migrate(bo, vram->placement);
-		if (err)
-			return err;
-	} else if (bo) {
-		/* Create backing store if needed */
-		err = xe_bo_validate(bo, vm, true);
-		if (err)
-			return err;
-	}
-
-	return 0;
+	return err;
 }
 
 static int handle_vma_pagefault(struct xe_gt *gt, struct xe_vma *vma,
@@ -115,10 +102,14 @@ static int handle_vma_pagefault(struct xe_gt *gt, struct xe_vma *vma,
 	struct drm_exec exec;
 	struct dma_fence *fence;
 	ktime_t end = 0;
-	int err;
+	int err, needs_vram;
 
 	lockdep_assert_held_write(&vm->lock);
 
+	needs_vram = xe_vma_need_vram_for_atomic(vm->xe, vma, atomic);
+	if (needs_vram < 0 || (needs_vram && xe_vma_is_userptr(vma)))
+		return needs_vram < 0 ? needs_vram : -EACCES;
+
 	xe_gt_stats_incr(gt, XE_GT_STATS_ID_VMA_PAGEFAULT_COUNT, 1);
 	xe_gt_stats_incr(gt, XE_GT_STATS_ID_VMA_PAGEFAULT_KB, xe_vma_size(vma) / 1024);
 
@@ -141,7 +132,7 @@ static int handle_vma_pagefault(struct xe_gt *gt, struct xe_vma *vma,
 	/* Lock VM and BOs dma-resv */
 	drm_exec_init(&exec, 0, 0);
 	drm_exec_until_all_locked(&exec) {
-		err = xe_pf_begin(&exec, vma, atomic, tile->mem.vram);
+		err = xe_pf_begin(&exec, vma, needs_vram == 1, tile->mem.vram);
 		drm_exec_retry_on_contention(&exec);
 		if (xe_vm_validate_should_retry(&exec, err, &end))
 			err = -EAGAIN;
@@ -576,7 +567,7 @@ static int handle_acc(struct xe_gt *gt, struct acc *acc)
 	/* Lock VM and BOs dma-resv */
 	drm_exec_init(&exec, 0, 0);
 	drm_exec_until_all_locked(&exec) {
-		ret = xe_pf_begin(&exec, vma, true, tile->mem.vram);
+		ret = xe_pf_begin(&exec, vma, IS_DGFX(vm->xe), tile->mem.vram);
 		drm_exec_retry_on_contention(&exec);
 		if (ret)
 			break;
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 9974734e8806..aebd02964c1c 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -4238,15 +4238,18 @@ void xe_vm_snapshot_free(struct xe_vm_snapshot *snap)
  */
 int xe_vma_need_vram_for_atomic(struct xe_device *xe, struct xe_vma *vma, bool is_atomic)
 {
+	u32 atomic_access = xe_vma_bo(vma) ? xe_vma_bo(vma)->attr.atomic_access :
+					     vma->attr.atomic_access;
+
 	if (!IS_DGFX(xe) || !is_atomic)
-		return 0;
+		return false;
 
 	/*
 	 * NOTE: The checks implemented here are platform-specific. For
 	 * instance, on a device supporting CXL atomics, these would ideally
 	 * work universally without additional handling.
 	 */
-	switch (vma->attr.atomic_access) {
+	switch (atomic_access) {
 	case DRM_XE_ATOMIC_DEVICE:
 		return !xe->info.has_device_atomics_on_smem;
 
diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.c b/drivers/gpu/drm/xe/xe_vm_madvise.c
index 3bd52063f9c2..212a03178d65 100644
--- a/drivers/gpu/drm/xe/xe_vm_madvise.c
+++ b/drivers/gpu/drm/xe/xe_vm_madvise.c
@@ -102,6 +102,7 @@ static void madvise_atomic(struct xe_device *xe, struct xe_vm *vm,
 			   struct xe_vma **vmas, int num_vmas,
 			   struct drm_xe_madvise *op)
 {
+	struct xe_bo *bo;
 	int i;
 
 	xe_assert(vm->xe, op->type == DRM_XE_MEM_RANGE_ATTR_ATOMIC);
@@ -114,7 +115,19 @@ static void madvise_atomic(struct xe_device *xe, struct xe_vm *vm,
 			continue;
 
 		vmas[i]->attr.atomic_access = op->atomic.val;
-	/*TODO: handle bo backed vmas */
+
+		bo = xe_vma_bo(vmas[i]);
+		if (!bo)
+			continue;
+
+		xe_bo_assert_held(bo);
+		bo->attr.atomic_access = op->atomic.val;
+
+		/* Invalidate cpu page table, so bo can migrate to smem in next access */
+		if (xe_bo_is_vram(bo) &&
+		    (bo->attr.atomic_access == DRM_XE_ATOMIC_CPU ||
+		     bo->attr.atomic_access == DRM_XE_ATOMIC_GLOBAL))
+			ttm_bo_unmap_virtual(&bo->ttm);
 	}
 }
 
@@ -262,6 +275,41 @@ static bool madvise_args_are_sane(struct xe_device *xe, const struct drm_xe_madv
 	return true;
 }
 
+static bool check_bo_args_are_sane(struct xe_vm *vm, struct xe_vma **vmas,
+				   int num_vmas, u32 atomic_val)
+{
+	struct xe_device *xe = vm->xe;
+	struct xe_bo *bo;
+	int i;
+
+	for (i = 0; i < num_vmas; i++) {
+		bo = xe_vma_bo(vmas[i]);
+		if (!bo)
+			continue;
+		/*
+		 * NOTE: The following atomic checks are platform-specific. For example,
+		 * if a device supports CXL atomics, these may not be necessary or
+		 * may behave differently.
+		 */
+		if (XE_IOCTL_DBG(xe, atomic_val == DRM_XE_ATOMIC_CPU &&
+				 !(bo->flags & XE_BO_FLAG_SYSTEM)))
+			return false;
+
+		if (XE_IOCTL_DBG(xe, atomic_val == DRM_XE_ATOMIC_DEVICE &&
+				 !(bo->flags & XE_BO_FLAG_VRAM0) &&
+				 !(bo->flags & XE_BO_FLAG_VRAM1) &&
+				 !(bo->flags & XE_BO_FLAG_SYSTEM &&
+				   xe->info.has_device_atomics_on_smem)))
+			return false;
+
+		if (XE_IOCTL_DBG(xe, atomic_val == DRM_XE_ATOMIC_GLOBAL &&
+				 (!(bo->flags & XE_BO_FLAG_SYSTEM) ||
+				  (!(bo->flags & XE_BO_FLAG_VRAM0) &&
+				   !(bo->flags & XE_BO_FLAG_VRAM1)))))
+			return false;
+	}
+	return true;
+}
 /**
  * xe_vm_madvise_ioctl - Handle MADVise ioctl for a VM
  * @dev: DRM device pointer
@@ -313,6 +361,15 @@ int xe_vm_madvise_ioctl(struct drm_device *dev, void *data, struct drm_file *fil
 		goto unlock_vm;
 
 	if (madvise_range.has_bo_vmas) {
+		if (args->type == DRM_XE_MEM_RANGE_ATTR_ATOMIC) {
+			if (!check_bo_args_are_sane(vm, madvise_range.vmas,
+						    madvise_range.num_vmas,
+						    args->atomic.val)) {
+				err = -EINVAL;
+				goto unlock_vm;
+			}
+		}
+
 		drm_exec_init(&exec, DRM_EXEC_IGNORE_DUPLICATES | DRM_EXEC_INTERRUPTIBLE_WAIT, 0);
 		drm_exec_until_all_locked(&exec) {
 			for (int i = 0; i < madvise_range.num_vmas; i++) {
-- 
2.34.1

