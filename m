Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08F43A97343
	for <lists+dri-devel@lfdr.de>; Tue, 22 Apr 2025 19:03:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19A1310E610;
	Tue, 22 Apr 2025 17:03:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jbcMxdsh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7C9E10E603;
 Tue, 22 Apr 2025 17:02:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745341379; x=1776877379;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vYktfllJKFa4C+JLWL9QOzVFl+KW6OyzHiyHy/deynk=;
 b=jbcMxdsherL2wkxDkhlGrCmF/mlt6/fkokdMR+AZrg4b58YIh6duyVLg
 rWlYWlxl94Ip+ye5zX58FglsqmgsN7sd15ENLAWKjx/bvotkB9aEAbwr8
 /daJi9T2JV+wTBe73wuxQZGyszQ7r3bpWZxi45ZYB/kJjJ76MIL06CvZn
 u9C4zDmJuXtOJVKlZcL8oXb5FqNSiNiz6Djv98ffzP6WrEtn0FyEfXMJ+
 I0unG1HY9ixNewsKqk5QAoB1rpK4YmtC/KKvg+9PpCgXLOCkATBCF8FoJ
 PWW8xHKTZNCCwn/BEKbcDqvzh8fd6Dww5yIjWv858rZ0T75uabQLDLvaQ A==;
X-CSE-ConnectionGUID: 1zFPPfULTJuADitNDyIvpQ==
X-CSE-MsgGUID: 5/53c0r9TRGyOwTDSjemnQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11411"; a="46794352"
X-IronPort-AV: E=Sophos;i="6.15,231,1739865600"; d="scan'208";a="46794352"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2025 10:02:56 -0700
X-CSE-ConnectionGUID: c6LFLuuHRLiBT+kp+859mQ==
X-CSE-MsgGUID: ZjvcEDUJTOCrR1Vy0Ki+Rg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,231,1739865600"; d="scan'208";a="131964239"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2025 10:02:56 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, thomas.hellstrom@linux.intel.com,
 himal.prasad.ghimiray@intel.com
Subject: [PATCH v4 2/5] drm/xe: Strict migration policy for atomic SVM faults
Date: Tue, 22 Apr 2025 10:04:12 -0700
Message-Id: <20250422170415.584662-3-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250422170415.584662-1-matthew.brost@intel.com>
References: <20250422170415.584662-1-matthew.brost@intel.com>
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

Mixing GPU and CPU atomics does not work unless a strict migration
policy of GPU atomics must be device memory. Enforce a policy of must be
in VRAM with a retry loop of 2 attempts, if retry loop fails abort
fault.

v2:
 - Only retry migration on atomics
 - Drop alway migrate modparam
v3:
 - Only set vram_only on DGFX (Himal)
 - Bail on get_pages failure if vram_only and retry count exceeded (Himal)
 - s/vram_only/devmem_only
 - Update xe_svm_range_is_valid to accept devmem_only argument
v4:
 - Fix logic bug get_pages failure

Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_module.c |  3 --
 drivers/gpu/drm/xe/xe_module.h |  1 -
 drivers/gpu/drm/xe/xe_svm.c    | 89 +++++++++++++++++++++++++---------
 drivers/gpu/drm/xe/xe_svm.h    |  5 --
 4 files changed, 65 insertions(+), 33 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_module.c b/drivers/gpu/drm/xe/xe_module.c
index 05c7d0ae6d83..1c4dfafbcd0b 100644
--- a/drivers/gpu/drm/xe/xe_module.c
+++ b/drivers/gpu/drm/xe/xe_module.c
@@ -33,9 +33,6 @@ struct xe_modparam xe_modparam = {
 module_param_named(svm_notifier_size, xe_modparam.svm_notifier_size, uint, 0600);
 MODULE_PARM_DESC(svm_notifier_size, "Set the svm notifier size(in MiB), must be power of 2");
 
-module_param_named(always_migrate_to_vram, xe_modparam.always_migrate_to_vram, bool, 0444);
-MODULE_PARM_DESC(always_migrate_to_vram, "Always migrate to VRAM on GPU fault");
-
 module_param_named_unsafe(force_execlist, xe_modparam.force_execlist, bool, 0444);
 MODULE_PARM_DESC(force_execlist, "Force Execlist submission");
 
diff --git a/drivers/gpu/drm/xe/xe_module.h b/drivers/gpu/drm/xe/xe_module.h
index 84339e509c80..5a3bfea8b7b4 100644
--- a/drivers/gpu/drm/xe/xe_module.h
+++ b/drivers/gpu/drm/xe/xe_module.h
@@ -12,7 +12,6 @@
 struct xe_modparam {
 	bool force_execlist;
 	bool probe_display;
-	bool always_migrate_to_vram;
 	u32 force_vram_bar_size;
 	int guc_log_level;
 	char *guc_firmware_path;
diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index 890f6b2f40e9..f749ae367a8f 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -650,9 +650,11 @@ void xe_svm_fini(struct xe_vm *vm)
 }
 
 static bool xe_svm_range_is_valid(struct xe_svm_range *range,
-				  struct xe_tile *tile)
+				  struct xe_tile *tile,
+				  bool devmem_only)
 {
-	return (range->tile_present & ~range->tile_invalidated) & BIT(tile->id);
+	return ((range->tile_present & ~range->tile_invalidated) & BIT(tile->id))
+		&& (!devmem_only || range->base.flags.migrate_devmem);
 }
 
 #if IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR)
@@ -726,6 +728,35 @@ static int xe_svm_alloc_vram(struct xe_vm *vm, struct xe_tile *tile,
 }
 #endif
 
+static bool supports_4K_migration(struct xe_device *xe)
+{
+	if (xe->info.vram_flags & XE_VRAM_FLAGS_NEED64K)
+		return false;
+
+	return true;
+}
+
+static bool xe_svm_range_needs_migrate_to_vram(struct xe_svm_range *range,
+					       struct xe_vma *vma)
+{
+	struct xe_vm *vm = range_to_vm(&range->base);
+	u64 range_size = xe_svm_range_size(range);
+
+	if (!range->base.flags.migrate_devmem)
+		return false;
+
+	if (xe_svm_range_in_vram(range)) {
+		drm_dbg(&vm->xe->drm, "Range is already in VRAM\n");
+		return false;
+	}
+
+	if (range_size <= SZ_64K && !supports_4K_migration(vm->xe)) {
+		drm_dbg(&vm->xe->drm, "Platform doesn't support SZ_4K range migration\n");
+		return false;
+	}
+
+	return true;
+}
 
 /**
  * xe_svm_handle_pagefault() - SVM handle page fault
@@ -750,12 +781,15 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
 			IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR),
 		.check_pages_threshold = IS_DGFX(vm->xe) &&
 			IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR) ? SZ_64K : 0,
+		.devmem_only = atomic && IS_DGFX(vm->xe) &&
+			IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR),
 	};
 	struct xe_svm_range *range;
 	struct drm_gpusvm_range *r;
 	struct drm_exec exec;
 	struct dma_fence *fence;
 	struct xe_tile *tile = gt_to_tile(gt);
+	int migrate_try_count = ctx.devmem_only ? 3 : 1;
 	ktime_t end = 0;
 	int err;
 
@@ -777,23 +811,26 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
 		return PTR_ERR(r);
 
 	range = to_xe_range(r);
-	if (xe_svm_range_is_valid(range, tile))
+	if (xe_svm_range_is_valid(range, tile, ctx.devmem_only))
 		return 0;
 
 	range_debug(range, "PAGE FAULT");
 
-	/* XXX: Add migration policy, for now migrate range once */
-	if (!range->skip_migrate && range->base.flags.migrate_devmem &&
-	    xe_svm_range_size(range) >= SZ_64K) {
-		range->skip_migrate = true;
-
+	if (--migrate_try_count >= 0 &&
+	    xe_svm_range_needs_migrate_to_vram(range, vma)) {
 		err = xe_svm_alloc_vram(vm, tile, range, &ctx);
 		if (err) {
-			drm_dbg(&vm->xe->drm,
-				"VRAM allocation failed, falling back to "
-				"retrying fault, asid=%u, errno=%pe\n",
-				vm->usm.asid, ERR_PTR(err));
-			goto retry;
+			if (migrate_try_count || !ctx.devmem_only) {
+				drm_dbg(&vm->xe->drm,
+					"VRAM allocation failed, falling back to retrying fault, asid=%u, errno=%pe\n",
+					vm->usm.asid, ERR_PTR(err));
+				goto retry;
+			} else {
+				drm_err(&vm->xe->drm,
+					"VRAM allocation failed, retry count exceeded, asid=%u, errno=%pe\n",
+					vm->usm.asid, ERR_PTR(err));
+				return err;
+			}
 		}
 	}
 
@@ -801,15 +838,22 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
 	err = drm_gpusvm_range_get_pages(&vm->svm.gpusvm, r, &ctx);
 	/* Corner where CPU mappings have changed */
 	if (err == -EOPNOTSUPP || err == -EFAULT || err == -EPERM) {
-		if (err == -EOPNOTSUPP) {
-			range_debug(range, "PAGE FAULT - EVICT PAGES");
-			drm_gpusvm_range_evict(&vm->svm.gpusvm, &range->base);
+		if (migrate_try_count > 0 || !ctx.devmem_only) {
+			if (err == -EOPNOTSUPP) {
+				range_debug(range, "PAGE FAULT - EVICT PAGES");
+				drm_gpusvm_range_evict(&vm->svm.gpusvm,
+						       &range->base);
+			}
+			drm_dbg(&vm->xe->drm,
+				"Get pages failed, falling back to retrying, asid=%u, gpusvm=%p, errno=%pe\n",
+				vm->usm.asid, &vm->svm.gpusvm, ERR_PTR(err));
+			range_debug(range, "PAGE FAULT - RETRY PAGES");
+			goto retry;
+		} else {
+			drm_err(&vm->xe->drm,
+				"Get pages failed, retry count exceeded, asid=%u, gpusvm=%p, errno=%pe\n",
+				vm->usm.asid, &vm->svm.gpusvm, ERR_PTR(err));
 		}
-		drm_dbg(&vm->xe->drm,
-			"Get pages failed, falling back to retrying, asid=%u, gpusvm=%p, errno=%pe\n",
-			vm->usm.asid, &vm->svm.gpusvm, ERR_PTR(err));
-		range_debug(range, "PAGE FAULT - RETRY PAGES");
-		goto retry;
 	}
 	if (err) {
 		range_debug(range, "PAGE FAULT - FAIL PAGE COLLECT");
@@ -843,9 +887,6 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
 	}
 	drm_exec_fini(&exec);
 
-	if (xe_modparam.always_migrate_to_vram)
-		range->skip_migrate = false;
-
 	dma_fence_wait(fence, false);
 	dma_fence_put(fence);
 
diff --git a/drivers/gpu/drm/xe/xe_svm.h b/drivers/gpu/drm/xe/xe_svm.h
index 3d441eb1f7ea..0e1f376a7471 100644
--- a/drivers/gpu/drm/xe/xe_svm.h
+++ b/drivers/gpu/drm/xe/xe_svm.h
@@ -39,11 +39,6 @@ struct xe_svm_range {
 	 * range. Protected by GPU SVM notifier lock.
 	 */
 	u8 tile_invalidated;
-	/**
-	 * @skip_migrate: Skip migration to VRAM, protected by GPU fault handler
-	 * locking.
-	 */
-	u8 skip_migrate	:1;
 };
 
 /**
-- 
2.34.1

