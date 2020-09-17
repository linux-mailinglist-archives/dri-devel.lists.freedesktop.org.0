Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A10E226D3DA
	for <lists+dri-devel@lfdr.de>; Thu, 17 Sep 2020 08:41:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B923D6E0E9;
	Thu, 17 Sep 2020 06:41:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-44.mimecast.com
 (us-smtp-delivery-44.mimecast.com [205.139.111.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 193906E0E9
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Sep 2020 06:41:43 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-172-Icx898tIOqudgp1CCkUYEA-1; Thu, 17 Sep 2020 02:41:38 -0400
X-MC-Unique: Icx898tIOqudgp1CCkUYEA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 046728015A3;
 Thu, 17 Sep 2020 06:41:37 +0000 (UTC)
Received: from tyrion-bne-redhat-com.redhat.com (vpn2-54-25.bne.redhat.com
 [10.64.54.25])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3B88D58;
 Thu, 17 Sep 2020 06:41:36 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/2] drm/ttm: drop special pipeline accel cleanup function.
Date: Thu, 17 Sep 2020 16:41:31 +1000
Message-Id: <20200917064132.148521-2-airlied@gmail.com>
In-Reply-To: <20200917064132.148521-1-airlied@gmail.com>
References: <20200917064132.148521-1-airlied@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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
Cc: christian.koenig@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Dave Airlie <airlied@redhat.com>

The two accel cleanup paths were mostly the same once refactored.

Just pass a bool to say if the evictions are to be pipelined.

Signed-off-by: Dave Airlie <airlied@redhat.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c |  5 +-
 drivers/gpu/drm/nouveau/nouveau_bo.c    |  2 +-
 drivers/gpu/drm/radeon/radeon_ttm.c     |  2 +-
 drivers/gpu/drm/ttm/ttm_bo_util.c       | 89 +++++++++----------------
 include/drm/ttm/ttm_bo_driver.h         | 17 +----
 5 files changed, 37 insertions(+), 78 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index a57aaf666340..1ea58ce7c559 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -499,10 +499,7 @@ static int amdgpu_move_blit(struct ttm_buffer_object *bo,
 	}
 
 	/* Always block for VM page tables before committing the new location */
-	if (bo->type == ttm_bo_type_kernel)
-		r = ttm_bo_move_accel_cleanup(bo, fence, true, new_mem);
-	else
-		r = ttm_bo_pipeline_move(bo, fence, evict, new_mem);
+	r = ttm_bo_move_accel_cleanup(bo, fence, true, bo->type != ttm_bo_type_kernel, new_mem);
 	dma_fence_put(fence);
 	return r;
 
diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
index 56f974c28eb5..2ee75646ad6f 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
@@ -824,7 +824,7 @@ nouveau_bo_move_m2mf(struct ttm_buffer_object *bo, int evict, bool intr,
 			if (ret == 0) {
 				ret = ttm_bo_move_accel_cleanup(bo,
 								&fence->base,
-								evict,
+								evict, false,
 								new_reg);
 				nouveau_fence_unref(&fence);
 			}
diff --git a/drivers/gpu/drm/radeon/radeon_ttm.c b/drivers/gpu/drm/radeon/radeon_ttm.c
index 99d9ca1087b7..36150b7f31a9 100644
--- a/drivers/gpu/drm/radeon/radeon_ttm.c
+++ b/drivers/gpu/drm/radeon/radeon_ttm.c
@@ -200,7 +200,7 @@ static int radeon_move_blit(struct ttm_buffer_object *bo,
 	if (IS_ERR(fence))
 		return PTR_ERR(fence);
 
-	r = ttm_bo_move_accel_cleanup(bo, &fence->base, evict, new_mem);
+	r = ttm_bo_move_accel_cleanup(bo, &fence->base, evict, false, new_mem);
 	radeon_fence_unref(&fence);
 	return r;
 }
diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c b/drivers/gpu/drm/ttm/ttm_bo_util.c
index 502d334786d2..777f843cdb98 100644
--- a/drivers/gpu/drm/ttm/ttm_bo_util.c
+++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
@@ -581,81 +581,56 @@ static int ttm_bo_move_to_ghost(struct ttm_buffer_object *bo,
 	return 0;
 }
 
-int ttm_bo_move_accel_cleanup(struct ttm_buffer_object *bo,
-			      struct dma_fence *fence,
-			      bool evict,
-			      struct ttm_resource *new_mem)
+static void ttm_bo_move_pipeline_evict(struct ttm_buffer_object *bo,
+				       struct dma_fence *fence)
 {
 	struct ttm_bo_device *bdev = bo->bdev;
-	struct ttm_resource_manager *man = ttm_manager_type(bdev, new_mem->mem_type);
-	int ret;
+	struct ttm_resource_manager *from = ttm_manager_type(bdev, bo->mem.mem_type);
 
-	dma_resv_add_excl_fence(bo->base.resv, fence);
-	if (evict)
-		ret = ttm_bo_wait_free_node(bo, man->use_tt);
-	else
-		ret = ttm_bo_move_to_ghost(bo, fence, man->use_tt);
-	if (ret)
-		return ret;
+	/**
+	 * BO doesn't have a TTM we need to bind/unbind. Just remember
+	 * this eviction and free up the allocation
+	 */
+	spin_lock(&from->move_lock);
+	if (!from->move || dma_fence_is_later(fence, from->move)) {
+		dma_fence_put(from->move);
+		from->move = dma_fence_get(fence);
+	}
+	spin_unlock(&from->move_lock);
 
-	ttm_bo_assign_mem(bo, new_mem);
+	ttm_bo_free_old_node(bo);
 
-	return 0;
+	dma_fence_put(bo->moving);
+	bo->moving = dma_fence_get(fence);
 }
-EXPORT_SYMBOL(ttm_bo_move_accel_cleanup);
 
-int ttm_bo_pipeline_move(struct ttm_buffer_object *bo,
-			 struct dma_fence *fence, bool evict,
-			 struct ttm_resource *new_mem)
+int ttm_bo_move_accel_cleanup(struct ttm_buffer_object *bo,
+			      struct dma_fence *fence,
+			      bool evict,
+			      bool pipeline,
+			      struct ttm_resource *new_mem)
 {
 	struct ttm_bo_device *bdev = bo->bdev;
-
 	struct ttm_resource_manager *from = ttm_manager_type(bdev, bo->mem.mem_type);
-	struct ttm_resource_manager *to = ttm_manager_type(bdev, new_mem->mem_type);
-
-	int ret;
+	struct ttm_resource_manager *man = ttm_manager_type(bdev, new_mem->mem_type);
+	int ret = 0;
 
 	dma_resv_add_excl_fence(bo->base.resv, fence);
+	if (!evict)
+		ret = ttm_bo_move_to_ghost(bo, fence, man->use_tt);
+	else if (!from->use_tt && pipeline)
+		ttm_bo_move_pipeline_evict(bo, fence);
+	else
+		ret = ttm_bo_wait_free_node(bo, man->use_tt);
 
-	if (!evict) {
-		ret = ttm_bo_move_to_ghost(bo, fence, to->use_tt);
-		if (ret)
-			return ret;
-	} else if (!from->use_tt) {
-
-		/**
-		 * BO doesn't have a TTM we need to bind/unbind. Just remember
-		 * this eviction and free up the allocation
-		 */
-
-		spin_lock(&from->move_lock);
-		if (!from->move || dma_fence_is_later(fence, from->move)) {
-			dma_fence_put(from->move);
-			from->move = dma_fence_get(fence);
-		}
-		spin_unlock(&from->move_lock);
-
-		ttm_bo_free_old_node(bo);
-
-		dma_fence_put(bo->moving);
-		bo->moving = dma_fence_get(fence);
-
-	} else {
-		/**
-		 * Last resort, wait for the move to be completed.
-		 *
-		 * Should never happen in pratice.
-		 */
-		ret = ttm_bo_wait_free_node(bo, to->use_tt);
-		if (ret)
-			return ret;
-	}
+	if (ret)
+		return ret;
 
 	ttm_bo_assign_mem(bo, new_mem);
 
 	return 0;
 }
-EXPORT_SYMBOL(ttm_bo_pipeline_move);
+EXPORT_SYMBOL(ttm_bo_move_accel_cleanup);
 
 int ttm_bo_pipeline_gutting(struct ttm_buffer_object *bo)
 {
diff --git a/include/drm/ttm/ttm_bo_driver.h b/include/drm/ttm/ttm_bo_driver.h
index 25cc932d63f1..864afa8f6f18 100644
--- a/include/drm/ttm/ttm_bo_driver.h
+++ b/include/drm/ttm/ttm_bo_driver.h
@@ -642,6 +642,7 @@ void ttm_bo_free_old_node(struct ttm_buffer_object *bo);
  * @bo: A pointer to a struct ttm_buffer_object.
  * @fence: A fence object that signals when moving is complete.
  * @evict: This is an evict move. Don't return until the buffer is idle.
+ * @pipeline: evictions are to be pipelined.
  * @new_mem: struct ttm_resource indicating where to move.
  *
  * Accelerated move function to be called when an accelerated move
@@ -653,23 +654,9 @@ void ttm_bo_free_old_node(struct ttm_buffer_object *bo);
  */
 int ttm_bo_move_accel_cleanup(struct ttm_buffer_object *bo,
 			      struct dma_fence *fence, bool evict,
+			      bool pipeline,
 			      struct ttm_resource *new_mem);
 
-/**
- * ttm_bo_pipeline_move.
- *
- * @bo: A pointer to a struct ttm_buffer_object.
- * @fence: A fence object that signals when moving is complete.
- * @evict: This is an evict move. Don't return until the buffer is idle.
- * @new_mem: struct ttm_resource indicating where to move.
- *
- * Function for pipelining accelerated moves. Either free the memory
- * immediately or hang it on a temporary buffer object.
- */
-int ttm_bo_pipeline_move(struct ttm_buffer_object *bo,
-			 struct dma_fence *fence, bool evict,
-			 struct ttm_resource *new_mem);
-
 /**
  * ttm_bo_pipeline_gutting.
  *
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
