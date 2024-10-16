Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B695299FF64
	for <lists+dri-devel@lfdr.de>; Wed, 16 Oct 2024 05:25:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D2E610E664;
	Wed, 16 Oct 2024 03:25:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PfY4hVEa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B65AF10E65D;
 Wed, 16 Oct 2024 03:25:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729049101; x=1760585101;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=dWkSprtV5Q0EJFotAxMizHIOBwpJamM/z8QQwCk0Km4=;
 b=PfY4hVEa8f67/MsLb43T/eMcqL7ahcdE4Ce+aVE0ye9B5ngvXkbkEBaz
 3iMiC3UpG/3OMZQgr9bZGNvNX+CDvfV/nFPio2i5zuodMwow+W4SL8eys
 cq4X9JOXwWW37ZcxTHEU9z7CKYhMwjHJZOBsxJz97IMPjeKvJVUZiODXD
 JGWKXndh5dYvUbQ2OE7KZGI/hfydsLMbW/SOpSuVtz7KXm1LOtvM16uzw
 Eu2/99gAK3FGoVPwhDtVHdR1Kz8CoEOEj5fLNlZSgE+HC4CaplV4Zvegf
 jBFMOCuBsx27LN69J2Os3FX2Z/sQqLRdtzwFB5P8ywEmSDFpgyXya/rRV A==;
X-CSE-ConnectionGUID: oyMMJhF9TviERhDMLRu4zA==
X-CSE-MsgGUID: rpyOUA06TL+CYrWoi8k4Sg==
X-IronPort-AV: E=McAfee;i="6700,10204,11225"; a="39056469"
X-IronPort-AV: E=Sophos;i="6.11,206,1725346800"; d="scan'208";a="39056469"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2024 20:24:59 -0700
X-CSE-ConnectionGUID: /O6hEG4hSxC110z8W5u+Mg==
X-CSE-MsgGUID: 7W8I9QEIQ9euO7doqboBaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,206,1725346800"; d="scan'208";a="78930275"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2024 20:24:58 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: apopple@nvidia.com, airlied@gmail.com, christian.koenig@amd.com,
 thomas.hellstrom@linux.intel.com, simona.vetter@ffwll.ch,
 felix.kuehling@amd.com, dakr@kernel.org
Subject: [PATCH v2 23/29] drm/xe: Add BO flags required for SVM
Date: Tue, 15 Oct 2024 20:25:12 -0700
Message-Id: <20241016032518.539495-24-matthew.brost@intel.com>
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

Add XE_BO_FLAG_SYSTEM_ALLOC to indicate BO is tied to SVM range.

Add XE_BO_FLAG_SKIP_CLEAR to indicate BO does not need to cleared.

v2:
 - Take VM ref for system allocator BOs

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c | 15 +++++++++------
 drivers/gpu/drm/xe/xe_bo.h |  2 ++
 2 files changed, 11 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index a02d63e322ae..dbd03383878e 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -685,8 +685,9 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
 	move_lacks_source = !old_mem || (handle_system_ccs ? (!bo->ccs_cleared) :
 					 (!mem_type_is_vram(old_mem_type) && !tt_has_data));
 
-	needs_clear = (ttm && ttm->page_flags & TTM_TT_FLAG_ZERO_ALLOC) ||
-		(!ttm && ttm_bo->type == ttm_bo_type_device);
+	needs_clear = !(bo->flags & XE_BO_FLAG_SKIP_CLEAR) &&
+		((ttm && ttm->page_flags & TTM_TT_FLAG_ZERO_ALLOC) ||
+		(!ttm && ttm_bo->type == ttm_bo_type_device));
 
 	if (new_mem->mem_type == XE_PL_TT) {
 		ret = xe_tt_map_sg(ttm);
@@ -1145,7 +1146,7 @@ static void xe_ttm_bo_destroy(struct ttm_buffer_object *ttm_bo)
 		xe_drm_client_remove_bo(bo);
 #endif
 
-	if (bo->vm && xe_bo_is_user(bo))
+	if (bo->vm && (xe_bo_is_user(bo) || bo->flags & XE_BO_FLAG_SYSTEM_ALLOC))
 		xe_vm_put(bo->vm);
 
 	mutex_lock(&xe->mem_access.vram_userfault.lock);
@@ -1301,7 +1302,8 @@ struct xe_bo *___xe_bo_create_locked(struct xe_device *xe, struct xe_bo *bo,
 	int err;
 
 	/* Only kernel objects should set GT */
-	xe_assert(xe, !tile || type == ttm_bo_type_kernel);
+	xe_assert(xe, !tile || type == ttm_bo_type_kernel ||
+		  flags & XE_BO_FLAG_SYSTEM_ALLOC);
 
 	if (XE_WARN_ON(!size)) {
 		xe_bo_free(bo);
@@ -1493,7 +1495,7 @@ __xe_bo_create_locked(struct xe_device *xe,
 	 * by having all the vm's bo refereferences released at vm close
 	 * time.
 	 */
-	if (vm && xe_bo_is_user(bo))
+	if (vm && (xe_bo_is_user(bo) || bo->flags & XE_BO_FLAG_SYSTEM_ALLOC))
 		xe_vm_get(vm);
 	bo->vm = vm;
 
@@ -2333,7 +2335,8 @@ bool xe_bo_needs_ccs_pages(struct xe_bo *bo)
 	 * can't be used since there's no CCS storage associated with
 	 * non-VRAM addresses.
 	 */
-	if (IS_DGFX(xe) && (bo->flags & XE_BO_FLAG_SYSTEM))
+	if (IS_DGFX(xe) && ((bo->flags & XE_BO_FLAG_SYSTEM) ||
+	    (bo->flags & XE_BO_FLAG_SYSTEM_ALLOC)))
 		return false;
 
 	return true;
diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
index 7fa44a0138b0..caf0459d16ad 100644
--- a/drivers/gpu/drm/xe/xe_bo.h
+++ b/drivers/gpu/drm/xe/xe_bo.h
@@ -39,6 +39,8 @@
 #define XE_BO_FLAG_NEEDS_64K		BIT(15)
 #define XE_BO_FLAG_NEEDS_2M		BIT(16)
 #define XE_BO_FLAG_GGTT_INVALIDATE	BIT(17)
+#define XE_BO_FLAG_SYSTEM_ALLOC		BIT(18)
+#define XE_BO_FLAG_SKIP_CLEAR		BIT(19)
 /* this one is trigger internally only */
 #define XE_BO_FLAG_INTERNAL_TEST	BIT(30)
 #define XE_BO_FLAG_INTERNAL_64K		BIT(31)
-- 
2.34.1

