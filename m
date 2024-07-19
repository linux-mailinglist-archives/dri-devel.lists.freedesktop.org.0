Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DCFEA937681
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jul 2024 12:11:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A5DE10EBB0;
	Fri, 19 Jul 2024 10:11:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WZRgYO5t";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FFB410EBAC;
 Fri, 19 Jul 2024 10:11:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721383876; x=1752919876;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=d6UNNu1NMf7asf5jb8J1BVauPEvuoTMYVqSequJVJeU=;
 b=WZRgYO5tMmQDJ1PaTJsCbP7B/5uMqde80fbtnOPY9f79ioKVQqBByMGx
 Mr5n8qAoL+MjEnlZpMTuuvRxqEI8YVmpysKnJeUgrriWhkfS4XjdbUH5c
 +uTbwKTEFIqjvedKAntSgriKmGz7M3VI1TrxcgPIYJ5KVqAaG5URRbtiN
 adEhOINA7hFw0Wy0XzvqnoXbY3amjNpqF8GUx/Jh5upioMxFNkUvcB1d9
 iudo7PfdGVvYLvxMckWB40EMf+p2y9NUpWAlrmqykvSFqSEvQBuASXh1c
 ugweWnoHQ0FPWGUP0GUNqj/E9R16CrSzjgzauMQ1sI9ES7KpUgU2sFzx0 A==;
X-CSE-ConnectionGUID: xVrvndyjR++5Ywtkql0PhQ==
X-CSE-MsgGUID: IcWHm8VcSPuw48XfcVj5zA==
X-IronPort-AV: E=McAfee;i="6700,10204,11137"; a="22753312"
X-IronPort-AV: E=Sophos;i="6.09,220,1716274800"; d="scan'208";a="22753312"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jul 2024 03:11:16 -0700
X-CSE-ConnectionGUID: 0CTDGIeySPS6kgGfYlOYXw==
X-CSE-MsgGUID: bcUAiGCCR6KLO6NDf4PUIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,220,1716274800"; d="scan'208";a="50758623"
Received: from nirmoyda-desk.igk.intel.com ([10.102.138.190])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jul 2024 03:11:14 -0700
From: Nirmoy Das <nirmoy.das@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org, Nirmoy Das <nirmoy.das@intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Akshata Jahagirdar <akshata.jahagirdar@intel.com>
Subject: [PATCH v6 2/3] drm/xe/migrate: Parameterize ccs and bo data clear in
 xe_migrate_clear()
Date: Fri, 19 Jul 2024 11:55:05 +0200
Message-ID: <20240719095506.4068-2-nirmoy.das@intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240719095506.4068-1-nirmoy.das@intel.com>
References: <20240719095506.4068-1-nirmoy.das@intel.com>
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

v2: Replace multiple params with flags in xe_migrate_clear (Matt B)
v3: s/CLEAR_BO_DATA_FLAG_*/XE_MIGRATE_CLEAR_FLAG_* and move to
    xe_migrate.h. other nits(Matt B)

Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: "Thomas Hellström" <thomas.hellstrom@linux.intel.com>
Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
Signed-off-by: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_bo.c      |  3 ++-
 drivers/gpu/drm/xe/tests/xe_migrate.c | 12 ++++++++----
 drivers/gpu/drm/xe/xe_bo.c            | 12 ++++++++++--
 drivers/gpu/drm/xe/xe_migrate.c       | 27 +++++++++++++++++++--------
 drivers/gpu/drm/xe/xe_migrate.h       |  7 ++++++-
 5 files changed, 45 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_bo.c b/drivers/gpu/drm/xe/tests/xe_bo.c
index e2e0ea24757a..600d1772fa87 100644
--- a/drivers/gpu/drm/xe/tests/xe_bo.c
+++ b/drivers/gpu/drm/xe/tests/xe_bo.c
@@ -35,7 +35,8 @@ static int ccs_test_migrate(struct xe_tile *tile, struct xe_bo *bo,
 
 	/* Optionally clear bo *and* CCS data in VRAM. */
 	if (clear) {
-		fence = xe_migrate_clear(tile->migrate, bo, bo->ttm.resource);
+		fence = xe_migrate_clear(tile->migrate, bo, bo->ttm.resource,
+					 XE_MIGRATE_CLEAR_FLAG_FULL);
 		if (IS_ERR(fence)) {
 			KUNIT_FAIL(test, "Failed to submit bo clear.\n");
 			return PTR_ERR(fence);
diff --git a/drivers/gpu/drm/xe/tests/xe_migrate.c b/drivers/gpu/drm/xe/tests/xe_migrate.c
index 48bf7e831014..12a26cf1a521 100644
--- a/drivers/gpu/drm/xe/tests/xe_migrate.c
+++ b/drivers/gpu/drm/xe/tests/xe_migrate.c
@@ -104,7 +104,8 @@ static void test_copy(struct xe_migrate *m, struct xe_bo *bo,
 	}
 
 	xe_map_memset(xe, &remote->vmap, 0, 0xd0, remote->size);
-	fence = xe_migrate_clear(m, remote, remote->ttm.resource);
+	fence = xe_migrate_clear(m, remote, remote->ttm.resource,
+				 XE_MIGRATE_CLEAR_FLAG_FULL);
 	if (!sanity_fence_failed(xe, fence, big ? "Clearing remote big bo" :
 				 "Clearing remote small bo", test)) {
 		retval = xe_map_rd(xe, &remote->vmap, 0, u64);
@@ -278,7 +279,8 @@ static void xe_migrate_sanity_test(struct xe_migrate *m, struct kunit *test)
 	kunit_info(test, "Clearing small buffer object\n");
 	xe_map_memset(xe, &tiny->vmap, 0, 0x22, tiny->size);
 	expected = 0;
-	fence = xe_migrate_clear(m, tiny, tiny->ttm.resource);
+	fence = xe_migrate_clear(m, tiny, tiny->ttm.resource,
+				 XE_MIGRATE_CLEAR_FLAG_FULL);
 	if (sanity_fence_failed(xe, fence, "Clearing small bo", test))
 		goto out;
 
@@ -299,7 +301,8 @@ static void xe_migrate_sanity_test(struct xe_migrate *m, struct kunit *test)
 	kunit_info(test, "Clearing big buffer object\n");
 	xe_map_memset(xe, &big->vmap, 0, 0x11, big->size);
 	expected = 0;
-	fence = xe_migrate_clear(m, big, big->ttm.resource);
+	fence = xe_migrate_clear(m, big, big->ttm.resource,
+				 XE_MIGRATE_CLEAR_FLAG_FULL);
 	if (sanity_fence_failed(xe, fence, "Clearing big bo", test))
 		goto out;
 
@@ -600,7 +603,8 @@ static void test_clear(struct xe_device *xe, struct xe_tile *tile,
 
 	kunit_info(test, "Clear vram buffer object\n");
 	expected = 0x0000000000000000;
-	fence = xe_migrate_clear(tile->migrate, vram_bo, vram_bo->ttm.resource);
+	fence = xe_migrate_clear(tile->migrate, vram_bo, vram_bo->ttm.resource,
+				 XE_MIGRATE_CLEAR_FLAG_FULL);
 	if (sanity_fence_failed(xe, fence, "Clear vram_bo", test))
 		return;
 	dma_fence_put(fence);
diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 31192d983d9e..0b7202dd4c9e 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -793,8 +793,16 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
 			}
 		}
 	} else {
-		if (move_lacks_source)
-			fence = xe_migrate_clear(migrate, bo, new_mem);
+		if (move_lacks_source) {
+			u32 flags = 0;
+
+			if (mem_type_is_vram(new_mem->mem_type))
+				flags |= XE_MIGRATE_CLEAR_FLAG_FULL;
+			else if (handle_system_ccs)
+				flags |= XE_MIGRATE_CLEAR_FLAG_CCS_DATA;
+
+			fence = xe_migrate_clear(migrate, bo, new_mem, flags);
+		}
 		else
 			fence = xe_migrate_copy(migrate, bo, bo, old_mem,
 						new_mem, handle_system_ccs);
diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index c007f68503d4..0ea0bc692c55 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -1036,9 +1036,11 @@ static void emit_clear(struct xe_gt *gt, struct xe_bb *bb, u64 src_ofs,
  * @m: The migration context.
  * @bo: The buffer object @dst is currently bound to.
  * @dst: The dst TTM resource to be cleared.
+ * @clear_flags: flags to specify which data to clear: CCS, BO, or both.
  *
- * Clear the contents of @dst to zero. On flat CCS devices,
- * the CCS metadata is cleared to zero as well on VRAM destinations.
+ * Clear the contents of @dst to zero when XE_MIGRATE_CLEAR_FLAG_BO_DATA is set.
+ * On flat CCS devices, the CCS metadata is cleared to zero with XE_MIGRATE_CLEAR_FLAG_CCS_DATA.
+ * Set XE_MIGRATE_CLEAR_FLAG_FULL to clear bo as well as CCS metadata.
  * TODO: Eliminate the @bo argument.
  *
  * Return: Pointer to a dma_fence representing the last clear batch, or
@@ -1047,18 +1049,27 @@ static void emit_clear(struct xe_gt *gt, struct xe_bb *bb, u64 src_ofs,
  */
 struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
 				   struct xe_bo *bo,
-				   struct ttm_resource *dst)
+				   struct ttm_resource *dst,
+				   u32 clear_flags)
 {
 	bool clear_vram = mem_type_is_vram(dst->mem_type);
+	bool clear_bo_data = XE_MIGRATE_CLEAR_FLAG_BO_DATA & clear_flags;
+	bool clear_ccs = XE_MIGRATE_CLEAR_FLAG_CCS_DATA & clear_flags;
 	struct xe_gt *gt = m->tile->primary_gt;
 	struct xe_device *xe = gt_to_xe(gt);
-	bool clear_system_ccs = (xe_bo_needs_ccs_pages(bo) && !IS_DGFX(xe)) ? true : false;
+	bool clear_only_system_ccs = false;
 	struct dma_fence *fence = NULL;
 	u64 size = bo->size;
 	struct xe_res_cursor src_it;
 	struct ttm_resource *src = dst;
 	int err;
 
+	if (WARN_ON(!clear_bo_data && !clear_ccs))
+		return NULL;
+
+	if (!clear_bo_data && clear_ccs && !IS_DGFX(xe))
+		clear_only_system_ccs = true;
+
 	if (!clear_vram)
 		xe_res_first_sg(xe_bo_sg(bo), 0, bo->size, &src_it);
 	else
@@ -1084,7 +1095,7 @@ struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
 		batch_size = 2 +
 			pte_update_size(m, pte_flags, src, &src_it,
 					&clear_L0, &clear_L0_ofs, &clear_L0_pt,
-					clear_system_ccs ? 0 : emit_clear_cmd_len(gt), 0,
+					clear_bo_data ? emit_clear_cmd_len(gt) : 0, 0,
 					avail_pts);
 
 		if (xe_migrate_needs_ccs_emit(xe))
@@ -1106,13 +1117,13 @@ struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
 		if (clear_vram && xe_migrate_allow_identity(clear_L0, &src_it))
 			xe_res_next(&src_it, clear_L0);
 		else
-			emit_pte(m, bb, clear_L0_pt, clear_vram, clear_system_ccs,
+			emit_pte(m, bb, clear_L0_pt, clear_vram, clear_only_system_ccs,
 				 &src_it, clear_L0, dst);
 
 		bb->cs[bb->len++] = MI_BATCH_BUFFER_END;
 		update_idx = bb->len;
 
-		if (!clear_system_ccs)
+		if (clear_bo_data)
 			emit_clear(gt, bb, clear_L0_ofs, clear_L0, XE_PAGE_SIZE, clear_vram);
 
 		if (xe_migrate_needs_ccs_emit(xe)) {
@@ -1171,7 +1182,7 @@ struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
 		return ERR_PTR(err);
 	}
 
-	if (clear_system_ccs)
+	if (clear_ccs)
 		bo->ccs_cleared = true;
 
 	return fence;
diff --git a/drivers/gpu/drm/xe/xe_migrate.h b/drivers/gpu/drm/xe/xe_migrate.h
index 453e0ecf5034..7929cc2425e8 100644
--- a/drivers/gpu/drm/xe/xe_migrate.h
+++ b/drivers/gpu/drm/xe/xe_migrate.h
@@ -102,9 +102,14 @@ struct dma_fence *xe_migrate_copy(struct xe_migrate *m,
 				  struct ttm_resource *dst,
 				  bool copy_only_ccs);
 
+#define XE_MIGRATE_CLEAR_FLAG_BO_DATA		BIT(0)
+#define XE_MIGRATE_CLEAR_FLAG_CCS_DATA		BIT(1)
+#define XE_MIGRATE_CLEAR_FLAG_FULL	(XE_MIGRATE_CLEAR_FLAG_BO_DATA | \
+					XE_MIGRATE_CLEAR_FLAG_CCS_DATA)
 struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
 				   struct xe_bo *bo,
-				   struct ttm_resource *dst);
+				   struct ttm_resource *dst,
+				   u32 clear_flags);
 
 struct xe_vm *xe_migrate_get_vm(struct xe_migrate *m);
 
-- 
2.42.0

