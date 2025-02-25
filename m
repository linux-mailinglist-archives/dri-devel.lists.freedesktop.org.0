Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F7A3A43448
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2025 05:42:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB41F10E571;
	Tue, 25 Feb 2025 04:42:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bmD2g4/U";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AB3F10E54F;
 Tue, 25 Feb 2025 04:42:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740458536; x=1771994536;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=LHOiJRjL5fOPXshB0W8pfiD3iVoer7UU03adcIy5ZzA=;
 b=bmD2g4/UWGrIIRGUXW95YG+JIDVgDey93q1exE+bCBTr4c2eMT+6tarw
 cpMouIdoCU1NxEoddbns6IqhiOT/PaBwJXCCY3hmLBtj+2rLL7v6DzPjU
 TEdLpfSQBmWAhjZQlLtrYK51eZn07jmHL/6FcF61/i9N581ZMkBFGpc+V
 OX5NAjoj6l3UPpVNGigKGT67ewwMOE1rpM0hXGlgk7HHALrZTRD4EVXAn
 NT4csSxgs4l9dHESUH8Dx8ukjmjgSuMyO1ds1f9OCS3aaiAXIe+Lr/4kb
 5yWrvpb2RalWcmS2hYLSFwN0nSifpuieuZMOwtkCCmcJBSkAs852iRWkz g==;
X-CSE-ConnectionGUID: a6WI5w/eTsu3cTz4fMsPDA==
X-CSE-MsgGUID: ExHMJRtmSgWaDXlX2JtBjA==
X-IronPort-AV: E=McAfee;i="6700,10204,11355"; a="51885078"
X-IronPort-AV: E=Sophos;i="6.13,313,1732608000"; d="scan'208";a="51885078"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2025 20:42:16 -0800
X-CSE-ConnectionGUID: M1MOl77tTEqw4l6f8O0VUQ==
X-CSE-MsgGUID: vjZq9BYzTcyH6LeHhGp5Kg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,313,1732608000"; d="scan'208";a="116290332"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2025 20:42:15 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com, apopple@nvidia.com, airlied@gmail.com,
 thomas.hellstrom@linux.intel.com, simona.vetter@ffwll.ch,
 felix.kuehling@amd.com, dakr@kernel.org
Subject: [PATCH v6 29/32] drm/xe: Add SVM debug
Date: Mon, 24 Feb 2025 20:43:08 -0800
Message-Id: <20250225044311.3178695-30-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250225044311.3178695-1-matthew.brost@intel.com>
References: <20250225044311.3178695-1-matthew.brost@intel.com>
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
v6:
 - Cast dma_addr to u64 (CI)
 - Only compile if CONFIG_DRM_GPUSVM selected (CI, Lucas)

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_pt.c  |  8 ++++
 drivers/gpu/drm/xe/xe_svm.c | 84 +++++++++++++++++++++++++++++++++----
 drivers/gpu/drm/xe/xe_svm.h |  7 ++++
 3 files changed, 92 insertions(+), 7 deletions(-)

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
index e2f76692adc0..546336a0ab2a 100644
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
 	*adj_start = min(xe_svm_range_start(range), mmu_range->start);
 	*adj_end = max(xe_svm_range_end(range), mmu_range->end);
@@ -153,6 +188,11 @@ static void xe_svm_invalidate(struct drm_gpusvm *gpusvm,
 
 	xe_svm_assert_in_notifier(vm);
 
+	vm_dbg(&gpusvm_to_vm(gpusvm)->xe->drm,
+	       "INVALIDATE: asid=%u, gpusvm=%p, seqno=%lu, start=0x%016lx, end=0x%016lx, event=%d",
+	       vm->usm.asid, gpusvm, notifier->notifier.invalidate_seq,
+	       mmu_range->start, mmu_range->end, mmu_range->event);
+
 	/* Adjust invalidation to notifier boundaries */
 	adj_start = max(drm_gpusvm_notifier_start(notifier), adj_start);
 	adj_end = min(drm_gpusvm_notifier_end(notifier), adj_end);
@@ -237,6 +277,8 @@ static int __xe_svm_garbage_collector(struct xe_vm *vm,
 {
 	struct dma_fence *fence;
 
+	range_debug(range, "GARBAGE COLLECTOR");
+
 	xe_vm_lock(vm, false);
 	fence = xe_vm_range_unbind(vm, range);
 	xe_vm_unlock(vm);
@@ -396,16 +438,23 @@ static int xe_svm_copy(struct page **pages, dma_addr_t *dma_addr,
 			int incr = (match && last) ? 1 : 0;
 
 			if (vram_addr != XE_VRAM_ADDR_INVALID) {
-				if (sram)
+				if (sram) {
+					vm_dbg(&tile->xe->drm,
+					       "COPY TO SRAM - 0x%016llx -> 0x%016llx, NPAGES=%ld",
+					       vram_addr, (u64)dma_addr[pos], i - pos + incr);
 					__fence = xe_migrate_from_vram(tile->migrate,
 								       i - pos + incr,
 								       vram_addr,
 								       dma_addr + pos);
-				else
+				} else {
+					vm_dbg(&tile->xe->drm,
+					       "COPY TO VRAM - 0x%016llx -> 0x%016llx, NPAGES=%ld",
+					       (u64)dma_addr[pos], vram_addr, i - pos + incr);
 					__fence = xe_migrate_to_vram(tile->migrate,
 								     i - pos + incr,
 								     dma_addr + pos,
 								     vram_addr);
+				}
 				if (IS_ERR(__fence)) {
 					err = PTR_ERR(__fence);
 					goto err_out;
@@ -425,14 +474,21 @@ static int xe_svm_copy(struct page **pages, dma_addr_t *dma_addr,
 
 			/* Extra mismatched device page, copy it */
 			if (!match && last && vram_addr != XE_VRAM_ADDR_INVALID) {
-				if (sram)
+				if (sram) {
+					vm_dbg(&tile->xe->drm,
+					       "COPY TO SRAM - 0x%016llx -> 0x%016llx, NPAGES=%d",
+					       vram_addr, (u64)dma_addr[pos], 1);
 					__fence = xe_migrate_from_vram(tile->migrate, 1,
 								       vram_addr,
 								       dma_addr + pos);
-				else
+				} else {
+					vm_dbg(&tile->xe->drm,
+					       "COPY TO VRAM - 0x%016llx -> 0x%016llx, NPAGES=%d",
+					       (u64)dma_addr[pos], vram_addr, 1);
 					__fence = xe_migrate_to_vram(tile->migrate, 1,
 								     dma_addr + pos,
 								     vram_addr);
+				}
 				if (IS_ERR(__fence)) {
 					err = PTR_ERR(__fence);
 					goto err_out;
@@ -609,6 +665,8 @@ static int xe_svm_alloc_vram(struct xe_vm *vm, struct xe_tile *tile,
 	ktime_t end = 0;
 	int err;
 
+	range_debug(range, "ALLOCATE VRAM");
+
 	if (!mmget_not_zero(mm))
 		return -EFAULT;
 	mmap_read_lock(mm);
@@ -699,6 +757,8 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
 	if (xe_svm_range_is_valid(range, tile))
 		return 0;
 
+	range_debug(range, "PAGE FAULT");
+
 	/* XXX: Add migration policy, for now migrate range once */
 	if (!range->skip_migrate && range->base.flags.migrate_devmem &&
 	    xe_svm_range_size(range) >= SZ_64K) {
@@ -714,18 +774,26 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
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
 		drm_dbg(&vm->xe->drm,
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
@@ -741,8 +809,10 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
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
index 855aa8e1dd38..e059590e5076 100644
--- a/drivers/gpu/drm/xe/xe_svm.h
+++ b/drivers/gpu/drm/xe/xe_svm.h
@@ -70,6 +70,8 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
 bool xe_svm_has_mapping(struct xe_vm *vm, u64 start, u64 end);
 
 int xe_svm_bo_evict(struct xe_bo *bo);
+
+void xe_svm_range_debug(struct xe_svm_range *range, const char *operation);
 #else
 static inline bool xe_svm_range_pages_valid(struct xe_svm_range *range)
 {
@@ -117,6 +119,11 @@ int xe_svm_bo_evict(struct xe_bo *bo)
 {
 	return 0;
 }
+
+static inline
+void xe_svm_range_debug(struct xe_svm_range *range, const char *operation)
+{
+}
 #endif
 
 /**
-- 
2.34.1

