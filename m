Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 358C938B2AE
	for <lists+dri-devel@lfdr.de>; Thu, 20 May 2021 17:10:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 822876F47E;
	Thu, 20 May 2021 15:10:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B8C36E222;
 Thu, 20 May 2021 15:10:39 +0000 (UTC)
IronPort-SDR: +/X7bcty0zXF6mtjyrXOBEZuXwDozxjIOWImHz52BqMm+AiOUxXeHG6xCLHgEae8Ds+csIvlLt
 xdmVx7yqYuBQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9989"; a="222341214"
X-IronPort-AV: E=Sophos;i="5.82,313,1613462400"; d="scan'208";a="222341214"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2021 08:10:06 -0700
IronPort-SDR: /9hSwakneEPVnVDZhXNKI70+o49IW/xXCgRkt/WNJajpddL6blTd7hS97+wX27Jhw7Uh9t/0G7
 Fg/FPDJ1+0Vg==
X-IronPort-AV: E=Sophos;i="5.82,313,1613462400"; d="scan'208";a="395728200"
Received: from cbjoerns-mobl1.ger.corp.intel.com (HELO
 thellst-mobl1.intel.com) ([10.249.254.247])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2021 08:10:05 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [RFC PATCH 4/5] drm/ttm: Document and optimize
 ttm_bo_pipeline_gutting()
Date: Thu, 20 May 2021 17:09:46 +0200
Message-Id: <20210520150947.803891-5-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210520150947.803891-1-thomas.hellstrom@linux.intel.com>
References: <20210520150947.803891-1-thomas.hellstrom@linux.intel.com>
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
 drivers/gpu/drm/ttm/ttm_bo.c      | 20 +++++-----
 drivers/gpu/drm/ttm/ttm_bo_util.c | 63 ++++++++++++++++++++++++-------
 drivers/gpu/drm/ttm/ttm_tt.c      |  5 +++
 include/drm/ttm/ttm_tt.h          | 10 +++++
 4 files changed, 75 insertions(+), 23 deletions(-)

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
index 919ee03f7eb3..1860e2e7563f 100644
--- a/drivers/gpu/drm/ttm/ttm_bo_util.c
+++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
@@ -479,7 +479,8 @@ static void ttm_transfered_destroy(struct ttm_buffer_object *bo)
  */
 
 static int ttm_buffer_object_transfer(struct ttm_buffer_object *bo,
-				      struct ttm_buffer_object **new_obj)
+				      struct ttm_buffer_object **new_obj,
+				      bool realloc_tt)
 {
 	struct ttm_transfer_obj *fbo;
 	int ret;
@@ -493,6 +494,17 @@ static int ttm_buffer_object_transfer(struct ttm_buffer_object *bo,
 	ttm_bo_get(bo);
 	fbo->bo = bo;
 
+	if (realloc_tt) {
+		bo->ttm = NULL;
+		ret = ttm_tt_create(bo, true);
+		if (ret) {
+			bo->ttm = fbo->base.ttm;
+			kfree(fbo);
+			ttm_bo_put(bo);
+			return ret;
+		}
+	}
+
 	/**
 	 * Fix up members that we shouldn't copy directly:
 	 * TODO: Explicit member copy would probably be better here.
@@ -763,7 +775,7 @@ static int ttm_bo_move_to_ghost(struct ttm_buffer_object *bo,
 	dma_fence_put(bo->moving);
 	bo->moving = dma_fence_get(fence);
 
-	ret = ttm_buffer_object_transfer(bo, &ghost_obj);
+	ret = ttm_buffer_object_transfer(bo, &ghost_obj, false);
 	if (ret)
 		return ret;
 
@@ -836,26 +848,51 @@ int ttm_bo_move_accel_cleanup(struct ttm_buffer_object *bo,
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
 	int ret;
 
-	ret = ttm_buffer_object_transfer(bo, &ghost);
-	if (ret)
-		return ret;
+	/* If already idle, no need for ghost object dance. */
+	ret = ttm_bo_wait(bo, false, true);
+	if (ret == -EBUSY) {
+		ret = ttm_buffer_object_transfer(bo, &ghost, true);
+		if (ret)
+			return ret;
 
-	ret = dma_resv_copy_fences(&ghost->base._resv, bo->base.resv);
-	/* Last resort, wait for the BO to be idle when we are OOM */
-	if (ret)
-		ttm_bo_wait(bo, false, false);
+		ret = dma_resv_copy_fences(&ghost->base._resv, bo->base.resv);
+		/* Last resort, wait for the BO to be idle when we are OOM */
+		if (ret)
+			ttm_bo_wait(bo, false, false);
 
-	ttm_resource_alloc(bo, &sys_mem, &bo->mem);
-	bo->ttm = NULL;
+		dma_resv_unlock(&ghost->base._resv);
+		ttm_bo_put(ghost);
+	} else {
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
+	}
 
-	dma_resv_unlock(&ghost->base._resv);
-	ttm_bo_put(ghost);
+	ttm_resource_alloc(bo, &sys_mem, &bo->mem);
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/ttm/ttm_tt.c b/drivers/gpu/drm/ttm/ttm_tt.c
index 539e0232cb3b..0b1053e93db2 100644
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
index 134d09ef7766..91552c83ac79 100644
--- a/include/drm/ttm/ttm_tt.h
+++ b/include/drm/ttm/ttm_tt.h
@@ -157,6 +157,16 @@ int ttm_tt_populate(struct ttm_device *bdev, struct ttm_tt *ttm, struct ttm_oper
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
 
 #if IS_ENABLED(CONFIG_AGP)
-- 
2.31.1

