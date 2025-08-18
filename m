Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15B55B2B373
	for <lists+dri-devel@lfdr.de>; Mon, 18 Aug 2025 23:31:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 755B510E4F9;
	Mon, 18 Aug 2025 21:31:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BG8xwdUI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 116AE10E4ED;
 Mon, 18 Aug 2025 21:31:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755552681; x=1787088681;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Wmr3kNzlgViRmFSGQDY3AqILsmx0QaNLJNHMptymFwc=;
 b=BG8xwdUI1N86bysHF9BC9S1uhOHrsWIZ9Y4C1DmKvO/rd5VLb7OKMoON
 9fRafAURtZZkzaPJH7ICit+SpapRgA8cHhdx3ex496r5JQ/Ez200qKo5y
 ztRWg6gpB1OACsdkGn8s4kGAWhVJyX0GwJ6JDZpCB/Z6lc9t883pl3XoQ
 gTXIcSHIgxQu/GnfbOxBihWO/oAO/9HvyFJRhH5IJmo3elgBUmxOsL+2I
 PTZ6L+SXTgF7uT6cQJEDQ8oKevxJ0TAYlwmn2TfxxwmOHfguNO5lXTvkN
 0VNBXfu1l/Vn2nwdgq20j/gnarTKIVCOojV68ILXkQeGCRbPGeVawLBcB Q==;
X-CSE-ConnectionGUID: 1PC5oXezS6aN01t4gOZBUw==
X-CSE-MsgGUID: KGEupyhMT3SX0a3rp89JPg==
X-IronPort-AV: E=McAfee;i="6800,10657,11526"; a="56815269"
X-IronPort-AV: E=Sophos;i="6.17,300,1747724400"; d="scan'208";a="56815269"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2025 14:31:17 -0700
X-CSE-ConnectionGUID: KWkpY+qOSYeJ69R8FOlFjw==
X-CSE-MsgGUID: qTM122zwSlCHrDm9odJJgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,300,1747724400"; d="scan'208";a="167186344"
Received: from himal-super-server.iind.intel.com ([10.190.239.34])
 by fmviesa007.fm.intel.com with ESMTP; 18 Aug 2025 14:31:15 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v8 20/24] drm/xe/madvise: Skip vma invalidation if mem attr
 are unchanged
Date: Tue, 19 Aug 2025 03:27:49 +0530
Message-Id: <20250818215753.2762426-21-himal.prasad.ghimiray@intel.com>
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

If a VMA within the madvise input range already has the same memory
attribute as the one requested by the user, skip PTE zapping for that
VMA to avoid unnecessary invalidation.

v2 (Matthew Brost)
- fix skip_invalidation for new attributes
- s/u32/bool
- Remove unnecessary assignment  for kzalloc'ed

Suggested-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_vm_madvise.c | 68 ++++++++++++++++++++----------
 drivers/gpu/drm/xe/xe_vm_types.h   |  6 +++
 2 files changed, 52 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.c b/drivers/gpu/drm/xe/xe_vm_madvise.c
index 212a03178d65..7813bdedacaa 100644
--- a/drivers/gpu/drm/xe/xe_vm_madvise.c
+++ b/drivers/gpu/drm/xe/xe_vm_madvise.c
@@ -85,16 +85,20 @@ static void madvise_preferred_mem_loc(struct xe_device *xe, struct xe_vm *vm,
 
 	for (i = 0; i < num_vmas; i++) {
 		/*TODO: Extend attributes to bo based vmas */
-		if (!xe_vma_is_cpu_addr_mirror(vmas[i]))
-			continue;
-
-		vmas[i]->attr.preferred_loc.devmem_fd = op->preferred_mem_loc.devmem_fd;
-
-		/* Till multi-device support is not added migration_policy
-		 * is of no use and can be ignored.
-		 */
-		vmas[i]->attr.preferred_loc.migration_policy =
+		if ((vmas[i]->attr.preferred_loc.devmem_fd == op->preferred_mem_loc.devmem_fd &&
+		     vmas[i]->attr.preferred_loc.migration_policy ==
+		     op->preferred_mem_loc.migration_policy) ||
+		    !xe_vma_is_cpu_addr_mirror(vmas[i])) {
+			vmas[i]->skip_invalidation = true;
+		} else {
+			vmas[i]->skip_invalidation = false;
+			vmas[i]->attr.preferred_loc.devmem_fd = op->preferred_mem_loc.devmem_fd;
+			/* Till multi-device support is not added migration_policy
+			 * is of no use and can be ignored.
+			 */
+			vmas[i]->attr.preferred_loc.migration_policy =
 						op->preferred_mem_loc.migration_policy;
+		}
 	}
 }
 
@@ -109,17 +113,27 @@ static void madvise_atomic(struct xe_device *xe, struct xe_vm *vm,
 	xe_assert(vm->xe, op->atomic.val <= DRM_XE_ATOMIC_CPU);
 
 	for (i = 0; i < num_vmas; i++) {
-		if ((xe_vma_is_userptr(vmas[i]) &&
-		     !(op->atomic.val == DRM_XE_ATOMIC_DEVICE &&
-		       xe->info.has_device_atomics_on_smem)))
+		if (xe_vma_is_userptr(vmas[i]) &&
+		    !(op->atomic.val == DRM_XE_ATOMIC_DEVICE &&
+		      xe->info.has_device_atomics_on_smem)) {
+			vmas[i]->skip_invalidation = true;
 			continue;
+		}
+
+		if (vmas[i]->attr.atomic_access == op->atomic.val) {
+			vmas[i]->skip_invalidation = true;
+		} else {
+			vmas[i]->skip_invalidation = false;
+			vmas[i]->attr.atomic_access = op->atomic.val;
+		}
 
 		vmas[i]->attr.atomic_access = op->atomic.val;
 
 		bo = xe_vma_bo(vmas[i]);
-		if (!bo)
+		if (!bo || bo->attr.atomic_access == op->atomic.val)
 			continue;
 
+		vmas[i]->skip_invalidation = false;
 		xe_bo_assert_held(bo);
 		bo->attr.atomic_access = op->atomic.val;
 
@@ -139,8 +153,14 @@ static void madvise_pat_index(struct xe_device *xe, struct xe_vm *vm,
 
 	xe_assert(vm->xe, op->type == DRM_XE_MEM_RANGE_ATTR_PAT);
 
-	for (i = 0; i < num_vmas; i++)
-		vmas[i]->attr.pat_index = op->pat_index.val;
+	for (i = 0; i < num_vmas; i++) {
+		if (vmas[i]->attr.pat_index == op->pat_index.val) {
+			vmas[i]->skip_invalidation = true;
+		} else {
+			vmas[i]->skip_invalidation = false;
+			vmas[i]->attr.pat_index = op->pat_index.val;
+		}
+	}
 }
 
 typedef void (*madvise_func)(struct xe_device *xe, struct xe_vm *vm,
@@ -157,7 +177,7 @@ static u8 xe_zap_ptes_in_madvise_range(struct xe_vm *vm, u64 start, u64 end)
 {
 	struct drm_gpuva *gpuva;
 	struct xe_tile *tile;
-	u8 id, tile_mask;
+	u8 id, tile_mask = 0;
 
 	lockdep_assert_held_write(&vm->lock);
 
@@ -166,17 +186,20 @@ static u8 xe_zap_ptes_in_madvise_range(struct xe_vm *vm, u64 start, u64 end)
 				  false, MAX_SCHEDULE_TIMEOUT) <= 0)
 		XE_WARN_ON(1);
 
-	tile_mask = xe_svm_ranges_zap_ptes_in_range(vm, start, end);
-
 	drm_gpuvm_for_each_va_range(gpuva, &vm->gpuvm, start, end) {
 		struct xe_vma *vma = gpuva_to_vma(gpuva);
 
-		if (xe_vma_is_cpu_addr_mirror(vma) || xe_vma_is_null(vma))
+		if (vma->skip_invalidation || xe_vma_is_null(vma))
 			continue;
 
-		for_each_tile(tile, vm->xe, id) {
-			if (xe_pt_zap_ptes(tile, vma)) {
-				tile_mask |= BIT(id);
+		if (xe_vma_is_cpu_addr_mirror(vma)) {
+			tile_mask |= xe_svm_ranges_zap_ptes_in_range(vm,
+								      xe_vma_start(vma),
+								      xe_vma_end(vma));
+		} else {
+			for_each_tile(tile, vm->xe, id) {
+				if (xe_pt_zap_ptes(tile, vma)) {
+					tile_mask |= BIT(id);
 
 				/*
 				 * WRITE_ONCE pairs with READ_ONCE
@@ -184,6 +207,7 @@ static u8 xe_zap_ptes_in_madvise_range(struct xe_vm *vm, u64 start, u64 end)
 				 */
 				WRITE_ONCE(vma->tile_invalidated,
 					   vma->tile_invalidated | BIT(id));
+				}
 			}
 		}
 	}
diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
index 5704f379c225..35b6344158f5 100644
--- a/drivers/gpu/drm/xe/xe_vm_types.h
+++ b/drivers/gpu/drm/xe/xe_vm_types.h
@@ -157,6 +157,12 @@ struct xe_vma {
 	/** @tile_staged: bind is staged for this VMA */
 	u8 tile_staged;
 
+	/**
+	 * @skip_invalidation: Used in madvise to avoid invalidation
+	 * if mem attributes doesn't change
+	 */
+	bool skip_invalidation;
+
 	/**
 	 * @ufence: The user fence that was provided with MAP.
 	 * Needs to be signalled before UNMAP can be processed.
-- 
2.34.1

