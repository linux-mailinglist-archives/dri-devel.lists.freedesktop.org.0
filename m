Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 75A942605E2
	for <lists+dri-devel@lfdr.de>; Mon,  7 Sep 2020 22:46:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4644F6E0DF;
	Mon,  7 Sep 2020 20:46:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7DC66E0DF
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Sep 2020 20:46:49 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-328-wYIQNmqdPpKWtmfSIHjrGA-1; Mon, 07 Sep 2020 16:46:46 -0400
X-MC-Unique: wYIQNmqdPpKWtmfSIHjrGA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B39141074646;
 Mon,  7 Sep 2020 20:46:45 +0000 (UTC)
Received: from tyrion-bne-redhat-com.redhat.com (vpn2-54-45.bne.redhat.com
 [10.64.54.45])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 074A960BE2;
 Mon,  7 Sep 2020 20:46:39 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 01/13] drm/ttm: introduce ttm_bo_move_null
Date: Tue,  8 Sep 2020 06:46:18 +1000
Message-Id: <20200907204630.1406528-2-airlied@gmail.com>
In-Reply-To: <20200907204630.1406528-1-airlied@gmail.com>
References: <20200907204630.1406528-1-airlied@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0.0
X-Mimecast-Originator: gmail.com
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
Cc: kraxel@redhat.com, sroland@vmware.com, bskeggs@redhat.com,
 christian.koenig@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Dave Airlie <airlied@redhat.com>

This pattern is cut-n-pasted across 4 drivers, switch it to
a WARN_ON instead, as BUG_ON is considered a bad idea usually.

Signed-off-by: Dave Airlie <airlied@redhat.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 24 +++---------------------
 drivers/gpu/drm/nouveau/nouveau_bo.c    |  4 +---
 drivers/gpu/drm/qxl/qxl_ttm.c           | 12 +-----------
 drivers/gpu/drm/radeon/radeon_ttm.c     | 14 ++------------
 include/drm/ttm/ttm_bo_driver.h         | 17 +++++++++++++++++
 5 files changed, 24 insertions(+), 47 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index ca568e25c41c..9592505563bf 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -174,24 +174,6 @@ static int amdgpu_verify_access(struct ttm_buffer_object *bo, struct file *filp)
 					  filp->private_data);
 }
 
-/**
- * amdgpu_move_null - Register memory for a buffer object
- *
- * @bo: The bo to assign the memory to
- * @new_mem: The memory to be assigned.
- *
- * Assign the memory from new_mem to the memory of the buffer object bo.
- */
-static void amdgpu_move_null(struct ttm_buffer_object *bo,
-			     struct ttm_resource *new_mem)
-{
-	struct ttm_resource *old_mem = &bo->mem;
-
-	BUG_ON(old_mem->mm_node != NULL);
-	*old_mem = *new_mem;
-	new_mem->mm_node = NULL;
-}
-
 /**
  * amdgpu_mm_node_addr - Compute the GPU relative offset of a GTT buffer.
  *
@@ -676,7 +658,7 @@ static int amdgpu_bo_move(struct ttm_buffer_object *bo, bool evict,
 	adev = amdgpu_ttm_adev(bo->bdev);
 
 	if (old_mem->mem_type == TTM_PL_SYSTEM && bo->ttm == NULL) {
-		amdgpu_move_null(bo, new_mem);
+		ttm_bo_move_null(bo, new_mem);
 		return 0;
 	}
 	if ((old_mem->mem_type == TTM_PL_TT &&
@@ -684,7 +666,7 @@ static int amdgpu_bo_move(struct ttm_buffer_object *bo, bool evict,
 	    (old_mem->mem_type == TTM_PL_SYSTEM &&
 	     new_mem->mem_type == TTM_PL_TT)) {
 		/* bind is enough */
-		amdgpu_move_null(bo, new_mem);
+		ttm_bo_move_null(bo, new_mem);
 		return 0;
 	}
 	if (old_mem->mem_type == AMDGPU_PL_GDS ||
@@ -694,7 +676,7 @@ static int amdgpu_bo_move(struct ttm_buffer_object *bo, bool evict,
 	    new_mem->mem_type == AMDGPU_PL_GWS ||
 	    new_mem->mem_type == AMDGPU_PL_OA) {
 		/* Nothing to save here */
-		amdgpu_move_null(bo, new_mem);
+		ttm_bo_move_null(bo, new_mem);
 		return 0;
 	}
 
diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
index 41aa7ac31bd5..091f80fbbd7c 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
@@ -993,9 +993,7 @@ nouveau_bo_move(struct ttm_buffer_object *bo, bool evict,
 
 	/* Fake bo copy. */
 	if (old_reg->mem_type == TTM_PL_SYSTEM && !bo->ttm) {
-		BUG_ON(bo->mem.mm_node != NULL);
-		bo->mem = *new_reg;
-		new_reg->mm_node = NULL;
+		ttm_bo_move_null(bo, new_reg);
 		goto out;
 	}
 
diff --git a/drivers/gpu/drm/qxl/qxl_ttm.c b/drivers/gpu/drm/qxl/qxl_ttm.c
index 3ab460339145..c3530c6e46bd 100644
--- a/drivers/gpu/drm/qxl/qxl_ttm.c
+++ b/drivers/gpu/drm/qxl/qxl_ttm.c
@@ -159,16 +159,6 @@ static struct ttm_tt *qxl_ttm_tt_create(struct ttm_buffer_object *bo,
 	return &gtt->ttm;
 }
 
-static void qxl_move_null(struct ttm_buffer_object *bo,
-			     struct ttm_resource *new_mem)
-{
-	struct ttm_resource *old_mem = &bo->mem;
-
-	BUG_ON(old_mem->mm_node != NULL);
-	*old_mem = *new_mem;
-	new_mem->mm_node = NULL;
-}
-
 static int qxl_bo_move(struct ttm_buffer_object *bo, bool evict,
 		       struct ttm_operation_ctx *ctx,
 		       struct ttm_resource *new_mem)
@@ -181,7 +171,7 @@ static int qxl_bo_move(struct ttm_buffer_object *bo, bool evict,
 		return ret;
 
 	if (old_mem->mem_type == TTM_PL_SYSTEM && bo->ttm == NULL) {
-		qxl_move_null(bo, new_mem);
+		ttm_bo_move_null(bo, new_mem);
 		return 0;
 	}
 	return ttm_bo_move_memcpy(bo, ctx, new_mem);
diff --git a/drivers/gpu/drm/radeon/radeon_ttm.c b/drivers/gpu/drm/radeon/radeon_ttm.c
index a8d6ca88c6e3..1d3e8bb69f8e 100644
--- a/drivers/gpu/drm/radeon/radeon_ttm.c
+++ b/drivers/gpu/drm/radeon/radeon_ttm.c
@@ -148,16 +148,6 @@ static int radeon_verify_access(struct ttm_buffer_object *bo, struct file *filp)
 					  filp->private_data);
 }
 
-static void radeon_move_null(struct ttm_buffer_object *bo,
-			     struct ttm_resource *new_mem)
-{
-	struct ttm_resource *old_mem = &bo->mem;
-
-	BUG_ON(old_mem->mm_node != NULL);
-	*old_mem = *new_mem;
-	new_mem->mm_node = NULL;
-}
-
 static int radeon_move_blit(struct ttm_buffer_object *bo,
 			bool evict, bool no_wait_gpu,
 			struct ttm_resource *new_mem,
@@ -316,7 +306,7 @@ static int radeon_bo_move(struct ttm_buffer_object *bo, bool evict,
 
 	rdev = radeon_get_rdev(bo->bdev);
 	if (old_mem->mem_type == TTM_PL_SYSTEM && bo->ttm == NULL) {
-		radeon_move_null(bo, new_mem);
+		ttm_bo_move_null(bo, new_mem);
 		return 0;
 	}
 	if ((old_mem->mem_type == TTM_PL_TT &&
@@ -324,7 +314,7 @@ static int radeon_bo_move(struct ttm_buffer_object *bo, bool evict,
 	    (old_mem->mem_type == TTM_PL_SYSTEM &&
 	     new_mem->mem_type == TTM_PL_TT)) {
 		/* bind is enough */
-		radeon_move_null(bo, new_mem);
+		ttm_bo_move_null(bo, new_mem);
 		return 0;
 	}
 	if (!rdev->ring[radeon_copy_ring_index(rdev)].ready ||
diff --git a/include/drm/ttm/ttm_bo_driver.h b/include/drm/ttm/ttm_bo_driver.h
index a694388f7b13..ebba282667ba 100644
--- a/include/drm/ttm/ttm_bo_driver.h
+++ b/include/drm/ttm/ttm_bo_driver.h
@@ -520,6 +520,23 @@ static inline void ttm_bo_move_to_lru_tail_unlocked(struct ttm_buffer_object *bo
 	spin_unlock(&ttm_bo_glob.lru_lock);
 }
 
+/**
+ * ttm_bo_move_null = assign memory for a buffer object.
+ * @bo: The bo to assign the memory to
+ * @new_mem: The memory to be assigned.
+ *
+ * Assign the memory from new_mem to the memory of the buffer object bo.
+ */
+static inline void ttm_bo_move_null(struct ttm_buffer_object *bo,
+				    struct ttm_resource *new_mem)
+{
+	struct ttm_resource *old_mem = &bo->mem;
+
+	WARN_ON(old_mem->mm_node != NULL);
+	*old_mem = *new_mem;
+	new_mem->mm_node = NULL;
+}
+
 /**
  * ttm_bo_unreserve
  *
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
