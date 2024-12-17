Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF3969F5A67
	for <lists+dri-devel@lfdr.de>; Wed, 18 Dec 2024 00:33:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0122610EA9A;
	Tue, 17 Dec 2024 23:33:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PSLlxhqR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBA6D10EA9A;
 Tue, 17 Dec 2024 23:33:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734478393; x=1766014393;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Y3YmEbBP6eyvdNHn47sDbkBmUJkqaDgg+Lzhmsn8+wc=;
 b=PSLlxhqRVKMOEWOGDsn0NClffd/IrWu31y0TPmC5ECbRNUuF6TGzz9W2
 NrJoGzid98UMK+01+viTOJcGJJUrB7/ofC7Labv5FLOMNmzFOgVoLMZcN
 pETw9fEnQZ+hWwrS54m5TvzoBKvxXN4VtPpHCvH5n8oPeYEx7pA+fBpit
 YeA0JtCRsSSLwv9DE/Tjawi0PVXkMzJbZuCjHC9q/wJz8uN7JJ4qQYBPV
 ovCowdkmLoykk3R8siGEqSL4ygF+/8WQpZKMDxrOHUeT6YcR2EHaTF55U
 tH5B1zbz2J4dOgdlARlXxJ/+ZYnlnaNL6vtWqikrUNJ06QIlXgwRIfqmC g==;
X-CSE-ConnectionGUID: ajyB+DIbQeqYkrJEqCbEHQ==
X-CSE-MsgGUID: HhEpyzBtTzmfWXjXx+KzFw==
X-IronPort-AV: E=McAfee;i="6700,10204,11289"; a="22517476"
X-IronPort-AV: E=Sophos;i="6.12,243,1728975600"; d="scan'208";a="22517476"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2024 15:33:13 -0800
X-CSE-ConnectionGUID: mWyIXZYNSpqOF6NIJmqYGA==
X-CSE-MsgGUID: XVqGTCtTT/+OCjrQ8e3fZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="102273457"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2024 15:33:13 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: apopple@nvidia.com, airlied@gmail.com, christian.koenig@amd.com,
 thomas.hellstrom@linux.intel.com, simona.vetter@ffwll.ch,
 felix.kuehling@amd.com, dakr@kernel.org
Subject: [PATCH v3 25/30] drm/xe: Add BO flags required for SVM
Date: Tue, 17 Dec 2024 15:33:43 -0800
Message-Id: <20241217233348.3519726-26-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241217233348.3519726-1-matthew.brost@intel.com>
References: <20241217233348.3519726-1-matthew.brost@intel.com>
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

Add XE_BO_FLAG_CPU_ADDR_MIRROR to indicate BO is tied to SVM range.
While these BO's are kernel allocations, we need a VM reference in this
case which this flag indicates. In addition, we do not support CCS on
these BO's either. The later can be revisited later.

v2:
 - Take VM ref for system allocator BOs
v3:
 - s/XE_BO_FLAG_SYSTEM_ALLOC/XE_BO_FLAG_CPU_ADDR_MIRROR (Thomas)
 - Better commit message (Thomas)
 - Drop XE_BO_FLAG_SKIP_CLEAR for now
 - Add comment about possibly supporting CCS (Thomas)

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c | 12 ++++++++----
 drivers/gpu/drm/xe/xe_bo.h |  1 +
 2 files changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index a670a0444e03..0c1134d6209c 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -1222,7 +1222,7 @@ static void xe_ttm_bo_destroy(struct ttm_buffer_object *ttm_bo)
 		xe_drm_client_remove_bo(bo);
 #endif
 
-	if (bo->vm && xe_bo_is_user(bo))
+	if (bo->vm && (xe_bo_is_user(bo) || bo->flags & XE_BO_FLAG_CPU_ADDR_MIRROR))
 		xe_vm_put(bo->vm);
 
 	mutex_lock(&xe->mem_access.vram_userfault.lock);
@@ -1418,7 +1418,8 @@ struct xe_bo *___xe_bo_create_locked(struct xe_device *xe, struct xe_bo *bo,
 	int err;
 
 	/* Only kernel objects should set GT */
-	xe_assert(xe, !tile || type == ttm_bo_type_kernel);
+	xe_assert(xe, !tile || type == ttm_bo_type_kernel ||
+		  flags & XE_BO_FLAG_CPU_ADDR_MIRROR);
 
 	if (XE_WARN_ON(!size)) {
 		xe_bo_free(bo);
@@ -1614,7 +1615,7 @@ __xe_bo_create_locked(struct xe_device *xe,
 	 * by having all the vm's bo refereferences released at vm close
 	 * time.
 	 */
-	if (vm && xe_bo_is_user(bo))
+	if (vm && (xe_bo_is_user(bo) || bo->flags & XE_BO_FLAG_CPU_ADDR_MIRROR))
 		xe_vm_get(vm);
 	bo->vm = vm;
 
@@ -2465,8 +2466,11 @@ bool xe_bo_needs_ccs_pages(struct xe_bo *bo)
 	 * system memory (i.e., it allows XE_PL_TT placement), FlatCCS
 	 * can't be used since there's no CCS storage associated with
 	 * non-VRAM addresses.
+	 *
+	 * XXX: Can we support CCS with CPU address mirroring?
 	 */
-	if (IS_DGFX(xe) && (bo->flags & XE_BO_FLAG_SYSTEM))
+	if (IS_DGFX(xe) && ((bo->flags & XE_BO_FLAG_SYSTEM) ||
+	    (bo->flags & XE_BO_FLAG_CPU_ADDR_MIRROR)))
 		return false;
 
 	return true;
diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
index d9386ab03140..a281e0187ebe 100644
--- a/drivers/gpu/drm/xe/xe_bo.h
+++ b/drivers/gpu/drm/xe/xe_bo.h
@@ -47,6 +47,7 @@
 					 XE_BO_FLAG_GGTT1 | \
 					 XE_BO_FLAG_GGTT2 | \
 					 XE_BO_FLAG_GGTT3)
+#define XE_BO_FLAG_CPU_ADDR_MIRROR	BIT(22)
 
 /* this one is trigger internally only */
 #define XE_BO_FLAG_INTERNAL_TEST	BIT(30)
-- 
2.34.1

