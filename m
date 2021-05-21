Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F0F638CA37
	for <lists+dri-devel@lfdr.de>; Fri, 21 May 2021 17:33:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A28116E194;
	Fri, 21 May 2021 15:33:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 692316EE2D;
 Fri, 21 May 2021 15:33:23 +0000 (UTC)
IronPort-SDR: dydm7h1F5FNKBkF2e+qog/FV0uXHYibRoSqD4im8+mYcR5iG2S1dpYnGLiE0MzU/36Zhp9qoD+
 4kYS9CcAuSrA==
X-IronPort-AV: E=McAfee;i="6200,9189,9990"; a="265415725"
X-IronPort-AV: E=Sophos;i="5.82,319,1613462400"; d="scan'208";a="265415725"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2021 08:33:22 -0700
IronPort-SDR: PVCgY+JFd81itaVa6m7DTUAZQFVPgqChRKo4bYTvB7bMsXLYqM0Gncvulvg4eKSIdcA+ev0Ga/
 d4nA1ciu4eGQ==
X-IronPort-AV: E=Sophos;i="5.82,319,1613462400"; d="scan'208";a="441125473"
Received: from imarinmo-mobl1.ger.corp.intel.com (HELO
 thellst-mobl1.intel.com) ([10.249.254.34])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2021 08:33:21 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v3 09/12] drm/ttm: Document and optimize
 ttm_bo_pipeline_gutting()
Date: Fri, 21 May 2021 17:32:50 +0200
Message-Id: <20210521153253.518037-10-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210521153253.518037-1-thomas.hellstrom@linux.intel.com>
References: <20210521153253.518037-1-thomas.hellstrom@linux.intel.com>
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
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

If the bo is idle when calling ttm_bo_pipeline_gutting(), we unnecessarily
create a ghost object and push it out to delayed destroy.
Fix this by adding a path for idle, and document the function.

Also avoid having the bo end up in a bad state vulnerable to user-space
triggered kernel BUGs if the call to ttm_tt_create() fails.

Finally reuse ttm_bo_pipeline_gutting() in ttm_bo_evict().

Cc: Christian König <christian.koenig@amd.com>
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/ttm/ttm_bo.c      | 20 ++++++------
 drivers/gpu/drm/ttm/ttm_bo_util.c | 52 ++++++++++++++++++++++++++++---
 drivers/gpu/drm/ttm/ttm_tt.c      |  5 +++
 include/drm/ttm/ttm_tt.h          | 10 ++++++
 4 files changed, 73 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index ca1b098b6a56..a8fa3375b8aa 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -501,10 +501,15 @@ static int ttm_bo_evict(struct ttm_buffer_object *bo,
 	bdev->funcs->evict_flags(bo, &placement);
 
 	if (!placement.num_placement && !placement.num_busy_placement) {
-		ttm_bo_wait(bo, false, false);
+		ret = ttm_bo_wait(bo, true, false);
+		if (ret)
+			return ret;
 
-		ttm_bo_cleanup_memtype_use(bo);
-		return ttm_tt_create(bo, false);
+		/*
+		 * Since we've already synced, this frees backing store
+		 * immediately.
+		 */
+		return ttm_bo_pipeline_gutting(bo);
 	}
 
 	ret = ttm_bo_mem_space(bo, &placement, &evict_mem, ctx);
@@ -974,13 +979,8 @@ int ttm_bo_validate(struct ttm_buffer_object *bo,
 	/*
 	 * Remove the backing store if no placement is given.
 	 */
-	if (!placement->num_placement && !placement->num_busy_placement) {
-		ret = ttm_bo_pipeline_gutting(bo);
-		if (ret)
-			return ret;
-
-		return ttm_tt_create(bo, false);
-	}
+	if (!placement->num_placement && !placement->num_busy_placement)
+		return ttm_bo_pipeline_gutting(bo);
 
 	/*
 	 * Check whether we need to move buffer.
diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c b/drivers/gpu/drm/ttm/ttm_bo_util.c
index 4a7d3d672f9a..7fa9b3a852eb 100644
--- a/drivers/gpu/drm/ttm/ttm_bo_util.c
+++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
@@ -585,26 +585,70 @@ int ttm_bo_move_accel_cleanup(struct ttm_buffer_object *bo,
 }
 EXPORT_SYMBOL(ttm_bo_move_accel_cleanup);
 
+/**
+ * ttm_bo_pipeline_gutting - purge the contents of a bo
+ * @bo: The buffer object
+ *
+ * Purge the contents of a bo, async if the bo is not idle.
+ * After a successful call, the bo is left unpopulated in
+ * system placement. The function may wait uninterruptible
+ * for idle on OOM.
+ *
+ * Return: 0 if successful, negative error code on failure.
+ */
 int ttm_bo_pipeline_gutting(struct ttm_buffer_object *bo)
 {
 	static const struct ttm_place sys_mem = { .mem_type = TTM_PL_SYSTEM };
 	struct ttm_buffer_object *ghost;
+	struct ttm_tt *ttm;
 	int ret;
 
-	ret = ttm_buffer_object_transfer(bo, &ghost);
+	/* If already idle, no need for ghost object dance. */
+	ret = ttm_bo_wait(bo, false, true);
+	if (ret != -EBUSY) {
+		if (!bo->ttm) {
+			ret = ttm_tt_create(bo, true);
+			if (ret)
+				return ret;
+		} else {
+			ttm_tt_unpopulate(bo->bdev, bo->ttm);
+			if (bo->type == ttm_bo_type_device)
+				ttm_tt_mark_for_clear(bo->ttm);
+		}
+		ttm_resource_free(bo, &bo->mem);
+		ttm_resource_alloc(bo, &sys_mem, &bo->mem);
+
+		return 0;
+	}
+
+	/*
+	 * We need an unpopulated ttm_tt after giving our current one,
+	 * if any, to the ghost object. And we can't afford to fail
+	 * creating one *after* the operation.
+	 */
+
+	ttm = bo->ttm;
+	bo->ttm = NULL;
+	ret = ttm_tt_create(bo, true);
+	swap(bo->ttm, ttm);
 	if (ret)
 		return ret;
 
+	ret = ttm_buffer_object_transfer(bo, &ghost);
+	if (ret) {
+		ttm_tt_destroy(bo->bdev, ttm);
+		return ret;
+	}
+
 	ret = dma_resv_copy_fences(&ghost->base._resv, bo->base.resv);
 	/* Last resort, wait for the BO to be idle when we are OOM */
 	if (ret)
 		ttm_bo_wait(bo, false, false);
 
-	ttm_resource_alloc(bo, &sys_mem, &bo->mem);
-	bo->ttm = NULL;
-
 	dma_resv_unlock(&ghost->base._resv);
 	ttm_bo_put(ghost);
+	bo->ttm = ttm;
+	ttm_resource_alloc(bo, &sys_mem, &bo->mem);
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/ttm/ttm_tt.c b/drivers/gpu/drm/ttm/ttm_tt.c
index 0e41227116b1..913b330a234b 100644
--- a/drivers/gpu/drm/ttm/ttm_tt.c
+++ b/drivers/gpu/drm/ttm/ttm_tt.c
@@ -134,6 +134,11 @@ void ttm_tt_destroy_common(struct ttm_device *bdev, struct ttm_tt *ttm)
 }
 EXPORT_SYMBOL(ttm_tt_destroy_common);
 
+void ttm_tt_mark_for_clear(struct ttm_tt *ttm)
+{
+	ttm->page_flags |= TTM_PAGE_FLAG_ZERO_ALLOC;
+}
+
 void ttm_tt_destroy(struct ttm_device *bdev, struct ttm_tt *ttm)
 {
 	bdev->funcs->ttm_tt_destroy(bdev, ttm);
diff --git a/include/drm/ttm/ttm_tt.h b/include/drm/ttm/ttm_tt.h
index 3102059db726..daa9c4cf48bb 100644
--- a/include/drm/ttm/ttm_tt.h
+++ b/include/drm/ttm/ttm_tt.h
@@ -170,6 +170,16 @@ int ttm_tt_populate(struct ttm_device *bdev, struct ttm_tt *ttm, struct ttm_oper
  */
 void ttm_tt_unpopulate(struct ttm_device *bdev, struct ttm_tt *ttm);
 
+/**
+ * ttm_tt_mark_for_clear - Mark pages for clearing on populate.
+ *
+ * @ttm: Pointer to the ttm_tt structure
+ *
+ * Marks pages for clearing so that the next time the page vector is
+ * populated, the pages will be cleared.
+ */
+void ttm_tt_mark_for_clear(struct ttm_tt *ttm);
+
 void ttm_tt_mgr_init(unsigned long num_pages, unsigned long num_dma32_pages);
 
 struct ttm_kmap_iter *ttm_kmap_iter_tt_init(struct ttm_kmap_iter_tt *iter_tt,
-- 
2.31.1

