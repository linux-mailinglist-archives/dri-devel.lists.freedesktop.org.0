Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46F14A3354D
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2025 03:10:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8A8310EA07;
	Thu, 13 Feb 2025 02:10:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FDlGy+E4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B77610E9D5;
 Thu, 13 Feb 2025 02:10:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739412620; x=1770948620;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=R0vvdAUDRfkDY2ve1JaiI4Foz/+tQhUEM7l4XA9bg7E=;
 b=FDlGy+E4m0avxi+0to9CbVTlEx8dYlNaIHSapOrNlwu722cuykBhJRWp
 vQg/eOimA8E3X0X0O4wX2FAkxkC5Xu7DUTJiq1iwbaePEGYfD7zDKpWHn
 iHcSJPDBNj5LApa/myFqhdlKvqAc8Si6gMMYNIh8vZAjRJOWQTSAw7nQs
 TWhPGqHJrlEqRJQ6qrFFbrRiKxaMpAJpkadUBJZb+zQhlgfXggcH6a8D3
 RZ4rYLq3htoZSyWO8PdcxE1IP9Dgd+IyTphk3nmEyT3lNWGZxesfaokOY
 0zc/zmyNKG4AAHGKRsMI5V72IYYZ3Ya0aGHo7aVHXVtqdu+spSgPS9Uvc g==;
X-CSE-ConnectionGUID: uLELRfDZSWu+/QBa3MgKGw==
X-CSE-MsgGUID: uGDBNDu2QZinDNRq7GWqVw==
X-IronPort-AV: E=McAfee;i="6700,10204,11343"; a="65456069"
X-IronPort-AV: E=Sophos;i="6.13,281,1732608000"; d="scan'208";a="65456069"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2025 18:10:17 -0800
X-CSE-ConnectionGUID: D7PoAGVFRMKfQSXlEAFsqA==
X-CSE-MsgGUID: LI5knRjkQCSzUcq5PoNKbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="117945120"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2025 18:10:16 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com, apopple@nvidia.com, airlied@gmail.com,
 thomas.hellstrom@linux.intel.com, simona.vetter@ffwll.ch,
 felix.kuehling@amd.com, dakr@kernel.org
Subject: [PATCH v5 29/32] drm/xe: Add SVM debug
Date: Wed, 12 Feb 2025 18:11:09 -0800
Message-Id: <20250213021112.1228481-30-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250213021112.1228481-1-matthew.brost@intel.com>
References: <20250213021112.1228481-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Add some useful SVM debug logging fro SVM range which prints the range's
state.

v2:
 - Update logging with latest structure layout
v3:
 - Better commit message (Thomas)
 - New range structure (Thomas)
 - s/COLLECTOT/s/COLLECTOR (Thomas)
v4:
 - Drop partial evict message (Thomas)
 - Use %p for pointers print (Thomas)

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_pt.c  |  8 ++++
 drivers/gpu/drm/xe/xe_svm.c | 84 +++++++++++++++++++++++++++++++++----
 drivers/gpu/drm/xe/xe_svm.h |  2 +
 3 files changed, 87 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index f8d06c70f77d..29ade504e1c1 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -647,6 +647,7 @@ xe_pt_stage_bind(struct xe_tile *tile, struct xe_vma *vma,
 		/* Move this entire thing to xe_svm.c? */
 		xe_svm_notifier_lock(xe_vma_vm(vma));
 		if (!xe_svm_range_pages_valid(range)) {
+			xe_svm_range_debug(range, "BIND PREPARE - RETRY");
 			xe_svm_notifier_unlock(xe_vma_vm(vma));
 			return -EAGAIN;
 		}
@@ -655,6 +656,10 @@ xe_pt_stage_bind(struct xe_tile *tile, struct xe_vma *vma,
 					 range->base.itree.last + 1 - range->base.itree.start,
 					 &curs);
 			is_devmem = xe_res_is_vram(&curs);
+			if (is_devmem)
+				xe_svm_range_debug(range, "BIND PREPARE - DMA VRAM");
+			else
+				xe_svm_range_debug(range, "BIND PREPARE - DMA");
 		} else {
 			xe_assert(xe, false);
 		}
@@ -1429,10 +1434,13 @@ static int xe_pt_svm_pre_commit(struct xe_migrate_pt_update *pt_update)
 		if (op->subop == XE_VMA_SUBOP_UNMAP_RANGE)
 			continue;
 
+		xe_svm_range_debug(range, "PRE-COMMIT");
+
 		xe_assert(vm->xe, xe_vma_is_cpu_addr_mirror(op->map_range.vma));
 		xe_assert(vm->xe, op->subop == XE_VMA_SUBOP_MAP_RANGE);
 
 		if (!xe_svm_range_pages_valid(range)) {
+			xe_svm_range_debug(range, "PRE-COMMIT - RETRY");
 			xe_svm_notifier_unlock(vm);
 			return -EAGAIN;
 		}
diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index ea43dd00d226..8fd1750b5b04 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -12,6 +12,18 @@
 #include "xe_vm.h"
 #include "xe_vm_types.h"
 
+static bool xe_svm_range_in_vram(struct xe_svm_range *range)
+{
+	/* Not reliable without notifier lock */
+	return range->base.flags.has_devmem_pages;
+}
+
+static bool xe_svm_range_has_vram_binding(struct xe_svm_range *range)
+{
+	/* Not reliable without notifier lock */
+	return xe_svm_range_in_vram(range) && range->tile_present;
+}
+
 static struct xe_vm *gpusvm_to_vm(struct drm_gpusvm *gpusvm)
 {
 	return container_of(gpusvm, struct xe_vm, svm.gpusvm);
@@ -37,6 +49,23 @@ static unsigned long xe_svm_range_size(struct xe_svm_range *range)
 	return drm_gpusvm_range_size(&range->base);
 }
 
+#define range_debug(r__, operaton__)					\
+	vm_dbg(&range_to_vm(&(r__)->base)->xe->drm,			\
+	       "%s: asid=%u, gpusvm=%p, vram=%d,%d, seqno=%lu, " \
+	       "start=0x%014lx, end=0x%014lx, size=%lu",		\
+	       (operaton__), range_to_vm(&(r__)->base)->usm.asid,	\
+	       (r__)->base.gpusvm,					\
+	       xe_svm_range_in_vram((r__)) ? 1 : 0,			\
+	       xe_svm_range_has_vram_binding((r__)) ? 1 : 0,		\
+	       (r__)->base.notifier_seq,				\
+	       xe_svm_range_start((r__)), xe_svm_range_end((r__)),	\
+	       xe_svm_range_size((r__)))
+
+void xe_svm_range_debug(struct xe_svm_range *range, const char *operation)
+{
+	range_debug(range, operation);
+}
+
 static void *xe_svm_devm_owner(struct xe_device *xe)
 {
 	return xe;
@@ -74,6 +103,8 @@ xe_svm_garbage_collector_add_range(struct xe_vm *vm, struct xe_svm_range *range,
 {
 	struct xe_device *xe = vm->xe;
 
+	range_debug(range, "GARBAGE COLLECTOR ADD");
+
 	drm_gpusvm_range_set_unmapped(&range->base, mmu_range);
 
 	spin_lock(&vm->svm.garbage_collector.lock);
@@ -99,10 +130,14 @@ xe_svm_range_notifier_event_begin(struct xe_vm *vm, struct drm_gpusvm_range *r,
 
 	xe_svm_assert_in_notifier(vm);
 
+	range_debug(range, "NOTIFIER");
+
 	/* Skip if already unmapped or if no binding exist */
 	if (range->base.flags.unmapped || !range->tile_present)
 		return 0;
 
+	range_debug(range, "NOTIFIER - EXECUTE");
+
 	/* Adjust invalidation to range boundaries */
 	if (xe_svm_range_start(range) < mmu_range->start)
 		*adj_start = xe_svm_range_start(range);
@@ -155,6 +190,11 @@ static void xe_svm_invalidate(struct drm_gpusvm *gpusvm,
 
 	xe_svm_assert_in_notifier(vm);
 
+	vm_dbg(&gpusvm_to_vm(gpusvm)->xe->drm,
+	       "INVALIDATE: asid=%u, gpusvm=%p, seqno=%lu, start=0x%016lx, end=0x%016lx, event=%d",
+	       vm->usm.asid, gpusvm, notifier->notifier.invalidate_seq,
+	       mmu_range->start, mmu_range->end, mmu_range->event);
+
 	/* Adjust invalidation to notifier boundaries */
 	if (adj_start < drm_gpusvm_notifier_start(notifier))
 		adj_start = drm_gpusvm_notifier_start(notifier);
@@ -241,6 +281,8 @@ static int __xe_svm_garbage_collector(struct xe_vm *vm,
 {
 	struct dma_fence *fence;
 
+	range_debug(range, "GARBAGE COLLECTOR");
+
 	xe_vm_lock(vm, false);
 	fence = xe_vm_range_unbind(vm, range);
 	xe_vm_unlock(vm);
@@ -400,16 +442,23 @@ static int xe_svm_copy(struct page **pages, dma_addr_t *dma_addr,
 			int incr = (match && last) ? 1 : 0;
 
 			if (vram_addr != XE_VRAM_ADDR_INVALID) {
-				if (sram)
+				if (sram) {
+					vm_dbg(&tile->xe->drm,
+					       "COPY TO SRAM - 0x%016llx -> 0x%016llx, NPAGES=%ld",
+					       vram_addr, dma_addr[pos], i - pos + incr);
 					__fence = xe_migrate_from_vram(tile->migrate,
 								       i - pos + incr,
 								       vram_addr,
 								       dma_addr + pos);
-				else
+				} else {
+					vm_dbg(&tile->xe->drm,
+					       "COPY TO VRAM - 0x%016llx -> 0x%016llx, NPAGES=%ld",
+					       dma_addr[pos], vram_addr, i - pos + incr);
 					__fence = xe_migrate_to_vram(tile->migrate,
 								     i - pos + incr,
 								     dma_addr + pos,
 								     vram_addr);
+				}
 				if (IS_ERR(__fence)) {
 					err = PTR_ERR(__fence);
 					goto err_out;
@@ -429,14 +478,21 @@ static int xe_svm_copy(struct page **pages, dma_addr_t *dma_addr,
 
 			/* Extra mismatched device page, copy it */
 			if (!match && last && vram_addr != XE_VRAM_ADDR_INVALID) {
-				if (sram)
+				if (sram) {
+					vm_dbg(&tile->xe->drm,
+					       "COPY TO SRAM - 0x%016llx -> 0x%016llx, NPAGES=%d",
+					       vram_addr, dma_addr[pos], 1);
 					__fence = xe_migrate_from_vram(tile->migrate, 1,
 								       vram_addr,
 								       dma_addr + pos);
-				else
+				} else {
+					vm_dbg(&tile->xe->drm,
+					       "COPY TO VRAM - 0x%016llx -> 0x%016llx, NPAGES=%d",
+					       dma_addr[pos], vram_addr, 1);
 					__fence = xe_migrate_to_vram(tile->migrate, 1,
 								     dma_addr + pos,
 								     vram_addr);
+				}
 				if (IS_ERR(__fence)) {
 					err = PTR_ERR(__fence);
 					goto err_out;
@@ -613,6 +669,8 @@ static struct xe_bo *xe_svm_alloc_vram(struct xe_vm *vm, struct xe_tile *tile,
 	ktime_t end = 0;
 	int err;
 
+	range_debug(range, "ALLOCATE VRAM");
+
 	if (!mmget_not_zero(mm))
 		return ERR_PTR(-EFAULT);
 	mmap_read_lock(mm);
@@ -716,6 +774,8 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
 	if (xe_svm_range_is_valid(range, tile))
 		return 0;
 
+	range_debug(range, "PAGE FAULT");
+
 	/* XXX: Add migration policy, for now migrate range once */
 	if (!range->migrated && range->base.flags.migrate_devmem &&
 	    xe_svm_range_size(range) >= SZ_64K) {
@@ -731,18 +791,26 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
 		}
 	}
 
+	range_debug(range, "GET PAGES");
 	err = drm_gpusvm_range_get_pages(&vm->svm.gpusvm, r, &ctx);
 	/* Corner where CPU mappings have changed */
 	if (err == -EOPNOTSUPP || err == -EFAULT || err == -EPERM) {
-		if (err == -EOPNOTSUPP)
+		if (err == -EOPNOTSUPP) {
+			range_debug(range, "PAGE FAULT - EVICT PAGES");
 			drm_gpusvm_range_evict(&vm->svm.gpusvm, &range->base);
+		}
 		drm_info(&vm->xe->drm,
 			 "Get pages failed, falling back to retrying, asid=%u, gpusvm=%p, errno %pe\n",
 			 vm->usm.asid, &vm->svm.gpusvm, ERR_PTR(err));
+		range_debug(range, "PAGE FAULT - RETRY PAGES");
 		goto retry;
 	}
-	if (err)
+	if (err) {
+		range_debug(range, "PAGE FAULT - FAIL PAGE COLLECT");
 		goto err_out;
+	}
+
+	range_debug(range, "PAGE FAULT - BIND");
 
 retry_bind:
 	drm_exec_init(&exec, 0, 0);
@@ -758,8 +826,10 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
 		if (IS_ERR(fence)) {
 			drm_exec_fini(&exec);
 			err = PTR_ERR(fence);
-			if (err == -EAGAIN)
+			if (err == -EAGAIN) {
+				range_debug(range, "PAGE FAULT - RETRY BIND");
 				goto retry;
+			}
 			if (xe_vm_validate_should_retry(&exec, err, &end))
 				goto retry_bind;
 			goto err_out;
diff --git a/drivers/gpu/drm/xe/xe_svm.h b/drivers/gpu/drm/xe/xe_svm.h
index ff43a6193536..1de3ade10fbf 100644
--- a/drivers/gpu/drm/xe/xe_svm.h
+++ b/drivers/gpu/drm/xe/xe_svm.h
@@ -57,6 +57,8 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
 
 bool xe_svm_has_mapping(struct xe_vm *vm, u64 start, u64 end);
 
+void xe_svm_range_debug(struct xe_svm_range *range, const char *operation);
+
 int xe_svm_bo_evict(struct xe_bo *bo);
 
 /**
-- 
2.34.1

