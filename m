Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 76035A90AF1
	for <lists+dri-devel@lfdr.de>; Wed, 16 Apr 2025 20:10:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7472D10E9A0;
	Wed, 16 Apr 2025 18:09:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ObkmdAdJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9073B10E994;
 Wed, 16 Apr 2025 18:09:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744826991; x=1776362991;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+6e5qMpE0AD4RSIpXlsL0oEc0Vi1uxmcukmeQxG/EiM=;
 b=ObkmdAdJWx/ZPMvz/imJYE1Pjmjki8pG1ljrR38uZdRZwNRMkhTLLQvu
 +5CMbNlcp5n3NvAUupAj02UkFQEbctG0o81AZMU1JteZdfzwHlueMULkR
 wi019Z9atkXcXgkSqzsvi+1ZOMLgMkIjwuuzjULaTZUoOKfXwdd05XL1w
 5L5KKszTPAcpVPvoKzsLlWEoSoiZ2+q00kxLeE87zfhhDWnwGLivxoxWk
 Sw3Og6OOphRs1kCeH5FVoss1GZVp6Q9smMjTfBNdrTp0rNU+7Kx7ZevCP
 3Hz7tPB7YT8wnPYznBhI7sd0p0bK4CQwAN2RAGMitUf6H4s6Wb7meyG8Q g==;
X-CSE-ConnectionGUID: EbgD8psCTB2Psl/n0KQkxA==
X-CSE-MsgGUID: GQtMMc3zRZyjtWnjEhURtA==
X-IronPort-AV: E=McAfee;i="6700,10204,11405"; a="63799687"
X-IronPort-AV: E=Sophos;i="6.15,216,1739865600"; d="scan'208";a="63799687"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2025 11:09:51 -0700
X-CSE-ConnectionGUID: dK9XNLUTSwa+U4K5suySJQ==
X-CSE-MsgGUID: 4+ePE4iHSHyETLAs0y5Qtg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,216,1739865600"; d="scan'208";a="131468161"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2025 11:09:51 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, thomas.hellstrom@linux.intel.com,
 himal.prasad.ghimiray@intel.com
Subject: [RFC PATCH 2/4] drm/xe: Strict migration policy for atomic SVM faults
Date: Wed, 16 Apr 2025 11:11:05 -0700
Message-Id: <20250416181107.409538-3-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250416181107.409538-1-matthew.brost@intel.com>
References: <20250416181107.409538-1-matthew.brost@intel.com>
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

Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_svm.c | 57 ++++++++++++++++++++++++++++---------
 drivers/gpu/drm/xe/xe_svm.h |  5 ----
 2 files changed, 44 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index 56b18a293bbc..ec61af659a13 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -726,6 +726,35 @@ static int xe_svm_alloc_vram(struct xe_vm *vm, struct xe_tile *tile,
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
@@ -750,12 +779,14 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
 			IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR),
 		.check_pages_threshold = IS_DGFX(vm->xe) &&
 			IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR) ? SZ_64K : 0,
+		.vram_only = atomic,
 	};
 	struct xe_svm_range *range;
 	struct drm_gpusvm_range *r;
 	struct drm_exec exec;
 	struct dma_fence *fence;
 	struct xe_tile *tile = gt_to_tile(gt);
+	int migrate_try_count = 2;
 	ktime_t end = 0;
 	int err;
 
@@ -782,18 +813,21 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
 
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
+			if (migrate_try_count || !ctx.vram_only) {
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
 
@@ -843,9 +877,6 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
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

