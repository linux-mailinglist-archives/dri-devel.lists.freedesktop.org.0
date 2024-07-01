Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 431EC91E42F
	for <lists+dri-devel@lfdr.de>; Mon,  1 Jul 2024 17:32:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 026FA10E467;
	Mon,  1 Jul 2024 15:32:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="j0ULJ3Sb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 332A710E45E;
 Mon,  1 Jul 2024 15:32:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719847965; x=1751383965;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=dGm9vKUI+AA0jMZcq0Yihe9syAFf+8ClkNDzf9dy2co=;
 b=j0ULJ3SbSAKjZaIHdVnOef+8kAts2bfO2pgABm7WG+2RXmSKN++Nz7nP
 hYiDICxE34R69ywCB5L68LgJYNUyX3m0BqtvZOI1LJr9ZNy38u4m4oWqq
 EWmu2vmf3JjHPyjrD/Sqc9EoZSUhoKkUwLBih+w1L3HgatcEfWhGD5aF3
 0/jqzt+jhAi/xN8tb4fackuBkdSdUkjjYzUYDVzTGYgnZwOW9BZzoXaT9
 TFLUwbZoyaFMZ2C7YSWr9f+k3HThpeLw3T5wpQSd8ZS9GQW99GhzEKTBH
 zGmb4xBqPx1Kj0C7sJrDUpbnC2C5gPj/6i8O7/75SiyC+bic3rpzBveZX Q==;
X-CSE-ConnectionGUID: UZitAIASQnC8tEl2dpXJYw==
X-CSE-MsgGUID: 8s4XdPtTS32M7l8pJmfFLw==
X-IronPort-AV: E=McAfee;i="6700,10204,11120"; a="34527117"
X-IronPort-AV: E=Sophos;i="6.09,176,1716274800"; d="scan'208";a="34527117"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2024 08:32:44 -0700
X-CSE-ConnectionGUID: KETSVeExRnO6ryOFX184nQ==
X-CSE-MsgGUID: 7eefXc9BR8uJWXUB6UoM5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,176,1716274800"; d="scan'208";a="49912412"
Received: from nirmoyda-desk.igk.intel.com ([10.102.138.190])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2024 08:32:42 -0700
From: Nirmoy Das <nirmoy.das@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org, Nirmoy Das <nirmoy.das@intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: [PATCH v4 2/4] drm/xe/migrate: Parameterize ccs and bo data clear in
 xe_migrate_clear()
Date: Mon,  1 Jul 2024 17:17:36 +0200
Message-ID: <20240701151738.6749-2-nirmoy.das@intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240701151738.6749-1-nirmoy.das@intel.com>
References: <20240701151738.6749-1-nirmoy.das@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Deutschland GmbH, Registered Address: Am Campeon 10,
 85579 Neubiberg, Germany, Commercial Register: Amtsgericht Muenchen HRB 186928
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

Parameterize clearing ccs and bo data in xe_migrate_clear() which  higher
layers can utilize. This patch will be used later on when doing bo data
clear for igfx as well.

Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
Cc: "Thomas Hellström" <thomas.hellstrom@linux.intel.com>
Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_bo.c      |  3 ++-
 drivers/gpu/drm/xe/tests/xe_migrate.c |  6 +++---
 drivers/gpu/drm/xe/xe_bo.c            | 11 +++++++++--
 drivers/gpu/drm/xe/xe_migrate.c       | 23 +++++++++++++++--------
 drivers/gpu/drm/xe/xe_migrate.h       |  4 +++-
 5 files changed, 32 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_bo.c b/drivers/gpu/drm/xe/tests/xe_bo.c
index 9f3c02826464..aea9b64fe04a 100644
--- a/drivers/gpu/drm/xe/tests/xe_bo.c
+++ b/drivers/gpu/drm/xe/tests/xe_bo.c
@@ -36,7 +36,8 @@ static int ccs_test_migrate(struct xe_tile *tile, struct xe_bo *bo,
 
 	/* Optionally clear bo *and* CCS data in VRAM. */
 	if (clear) {
-		fence = xe_migrate_clear(tile->migrate, bo, bo->ttm.resource);
+		fence = xe_migrate_clear(tile->migrate, bo, bo->ttm.resource,
+					 true, true);
 		if (IS_ERR(fence)) {
 			KUNIT_FAIL(test, "Failed to submit bo clear.\n");
 			return PTR_ERR(fence);
diff --git a/drivers/gpu/drm/xe/tests/xe_migrate.c b/drivers/gpu/drm/xe/tests/xe_migrate.c
index 962f6438e219..ef2dc34e8297 100644
--- a/drivers/gpu/drm/xe/tests/xe_migrate.c
+++ b/drivers/gpu/drm/xe/tests/xe_migrate.c
@@ -105,7 +105,7 @@ static void test_copy(struct xe_migrate *m, struct xe_bo *bo,
 	}
 
 	xe_map_memset(xe, &remote->vmap, 0, 0xd0, remote->size);
-	fence = xe_migrate_clear(m, remote, remote->ttm.resource);
+	fence = xe_migrate_clear(m, remote, remote->ttm.resource, true, true);
 	if (!sanity_fence_failed(xe, fence, big ? "Clearing remote big bo" :
 				 "Clearing remote small bo", test)) {
 		retval = xe_map_rd(xe, &remote->vmap, 0, u64);
@@ -279,7 +279,7 @@ static void xe_migrate_sanity_test(struct xe_migrate *m, struct kunit *test)
 	kunit_info(test, "Clearing small buffer object\n");
 	xe_map_memset(xe, &tiny->vmap, 0, 0x22, tiny->size);
 	expected = 0;
-	fence = xe_migrate_clear(m, tiny, tiny->ttm.resource);
+	fence = xe_migrate_clear(m, tiny, tiny->ttm.resource, true, true);
 	if (sanity_fence_failed(xe, fence, "Clearing small bo", test))
 		goto out;
 
@@ -300,7 +300,7 @@ static void xe_migrate_sanity_test(struct xe_migrate *m, struct kunit *test)
 	kunit_info(test, "Clearing big buffer object\n");
 	xe_map_memset(xe, &big->vmap, 0, 0x11, big->size);
 	expected = 0;
-	fence = xe_migrate_clear(m, big, big->ttm.resource);
+	fence = xe_migrate_clear(m, big, big->ttm.resource, true, true);
 	if (sanity_fence_failed(xe, fence, "Clearing big bo", test))
 		goto out;
 
diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 65c696966e96..4d6315d2ae9a 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -650,6 +650,7 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
 	bool needs_clear;
 	bool handle_system_ccs = (!IS_DGFX(xe) && xe_bo_needs_ccs_pages(bo) &&
 				  ttm && ttm_tt_is_populated(ttm)) ? true : false;
+
 	int ret = 0;
 
 	/* Bo creation path, moving to system or TT. */
@@ -784,8 +785,14 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
 			}
 		}
 	} else {
-		if (move_lacks_source)
-			fence = xe_migrate_clear(migrate, bo, new_mem);
+		if (move_lacks_source) {
+			bool clear_ccs = mem_type_is_vram(new_mem->mem_type) ||
+					 handle_system_ccs;
+			bool clear_bo_data = mem_type_is_vram(new_mem->mem_type);
+
+			fence = xe_migrate_clear(migrate, bo, new_mem,
+						 clear_bo_data, clear_ccs);
+		}
 		else
 			fence = xe_migrate_copy(migrate, bo, bo, old_mem,
 						new_mem, handle_system_ccs);
diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index c9f5673353ee..e0a3f6921572 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -986,9 +986,12 @@ static void emit_clear(struct xe_gt *gt, struct xe_bb *bb, u64 src_ofs,
  * @m: The migration context.
  * @bo: The buffer object @dst is currently bound to.
  * @dst: The dst TTM resource to be cleared.
+ * @clear_bo_data: clear bo data
+ * @clear_ccs: clear ccs metadata
  *
- * Clear the contents of @dst to zero. On flat CCS devices,
- * the CCS metadata is cleared to zero as well on VRAM destinations.
+ * Clear the contents of @dst to zero when @clear_bo_data is set.
+ * On flat CCS devices, the CCS metadata is cleared to zero with @clear_ccs.
+ * Set both, @clear_bo_data and  @clear_ccs to clear bo as well as CCS metadata
  * TODO: Eliminate the @bo argument.
  *
  * Return: Pointer to a dma_fence representing the last clear batch, or
@@ -997,18 +1000,22 @@ static void emit_clear(struct xe_gt *gt, struct xe_bb *bb, u64 src_ofs,
  */
 struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
 				   struct xe_bo *bo,
-				   struct ttm_resource *dst)
+				   struct ttm_resource *dst,
+				   bool clear_bo_data,
+				   bool clear_ccs)
 {
 	bool clear_vram = mem_type_is_vram(dst->mem_type);
 	struct xe_gt *gt = m->tile->primary_gt;
 	struct xe_device *xe = gt_to_xe(gt);
-	bool clear_system_ccs = (xe_bo_needs_ccs_pages(bo) && !IS_DGFX(xe)) ? true : false;
 	struct dma_fence *fence = NULL;
 	u64 size = bo->size;
 	struct xe_res_cursor src_it;
 	struct ttm_resource *src = dst;
 	int err;
 
+	if (WARN_ON(!clear_bo_data && !clear_ccs))
+		return NULL;
+
 	if (!clear_vram)
 		xe_res_first_sg(xe_bo_sg(bo), 0, bo->size, &src_it);
 	else
@@ -1032,7 +1039,7 @@ struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
 		batch_size = 2 +
 			pte_update_size(m, clear_vram, src, &src_it,
 					&clear_L0, &clear_L0_ofs, &clear_L0_pt,
-					clear_system_ccs ? 0 : emit_clear_cmd_len(gt), 0,
+					clear_bo_data ? emit_clear_cmd_len(gt) : 0, 0,
 					avail_pts);
 
 		if (xe_device_has_flat_ccs(xe))
@@ -1054,13 +1061,13 @@ struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
 		if (clear_vram && xe_migrate_allow_identity(clear_L0, &src_it))
 			xe_res_next(&src_it, clear_L0);
 		else
-			emit_pte(m, bb, clear_L0_pt, clear_vram, clear_system_ccs,
+			emit_pte(m, bb, clear_L0_pt, clear_vram, clear_ccs,
 				 &src_it, clear_L0, dst);
 
 		bb->cs[bb->len++] = MI_BATCH_BUFFER_END;
 		update_idx = bb->len;
 
-		if (!clear_system_ccs)
+		if (clear_bo_data)
 			emit_clear(gt, bb, clear_L0_ofs, clear_L0, XE_PAGE_SIZE, clear_vram);
 
 		if (xe_device_has_flat_ccs(xe)) {
@@ -1119,7 +1126,7 @@ struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
 		return ERR_PTR(err);
 	}
 
-	if (clear_system_ccs)
+	if (clear_ccs)
 		bo->ccs_cleared = true;
 
 	return fence;
diff --git a/drivers/gpu/drm/xe/xe_migrate.h b/drivers/gpu/drm/xe/xe_migrate.h
index 951f19318ea4..33306cb98dc8 100644
--- a/drivers/gpu/drm/xe/xe_migrate.h
+++ b/drivers/gpu/drm/xe/xe_migrate.h
@@ -90,7 +90,9 @@ struct dma_fence *xe_migrate_copy(struct xe_migrate *m,
 
 struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
 				   struct xe_bo *bo,
-				   struct ttm_resource *dst);
+				   struct ttm_resource *dst,
+				   bool clear_bo_data,
+				   bool clear_ccs);
 
 struct xe_vm *xe_migrate_get_vm(struct xe_migrate *m);
 
-- 
2.42.0

