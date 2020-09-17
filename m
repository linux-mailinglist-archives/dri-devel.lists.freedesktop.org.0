Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A61AA26D2A8
	for <lists+dri-devel@lfdr.de>; Thu, 17 Sep 2020 06:32:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BB586E03A;
	Thu, 17 Sep 2020 04:32:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D9366E081
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Sep 2020 04:32:02 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-34-QcnbD0SIPjqDJ7-KNWNCTA-1; Thu, 17 Sep 2020 00:30:51 -0400
X-MC-Unique: QcnbD0SIPjqDJ7-KNWNCTA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E0A128018A9;
 Thu, 17 Sep 2020 04:30:50 +0000 (UTC)
Received: from tyrion-bne-redhat-com.redhat.com (vpn2-54-25.bne.redhat.com
 [10.64.54.25])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 268DC19D61;
 Thu, 17 Sep 2020 04:30:49 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 6/7] drm/ttm: move ghost object creation to a common function
Date: Thu, 17 Sep 2020 14:30:39 +1000
Message-Id: <20200917043040.146575-7-airlied@gmail.com>
In-Reply-To: <20200917043040.146575-1-airlied@gmail.com>
References: <20200917043040.146575-1-airlied@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=airlied@gmail.com
X-Mimecast-Spam-Score: 0
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

Both accel cleanup and pipeline move had the same code, make
a single function for it.

Signed-off-by: Dave Airlie <airlied@redhat.com>
---
 drivers/gpu/drm/ttm/ttm_bo_util.c | 105 ++++++++++++------------------
 1 file changed, 43 insertions(+), 62 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c b/drivers/gpu/drm/ttm/ttm_bo_util.c
index 5a8d77ef504f..3c16e303d2e2 100644
--- a/drivers/gpu/drm/ttm/ttm_bo_util.c
+++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
@@ -526,6 +526,47 @@ void ttm_bo_kunmap(struct ttm_bo_kmap_obj *map)
 }
 EXPORT_SYMBOL(ttm_bo_kunmap);
 
+static int ttm_bo_move_to_ghost(struct ttm_buffer_object *bo,
+				struct dma_fence *fence,
+				bool dst_use_tt)
+{
+	struct ttm_buffer_object *ghost_obj;
+	int ret;
+
+	/**
+	 * This should help pipeline ordinary buffer moves.
+	 *
+	 * Hang old buffer memory on a new buffer object,
+	 * and leave it to be released when the GPU
+	 * operation has completed.
+	 */
+
+	dma_fence_put(bo->moving);
+	bo->moving = dma_fence_get(fence);
+
+	ret = ttm_buffer_object_transfer(bo, &ghost_obj);
+	if (ret)
+		return ret;
+
+	dma_resv_add_excl_fence(&ghost_obj->base._resv, fence);
+
+	/**
+	 * If we're not moving to fixed memory, the TTM object
+	 * needs to stay alive. Otherwhise hang it on the ghost
+	 * bo to be unbound and destroyed.
+	 */
+
+	if (dst_use_tt) {
+		ghost_obj->ttm = NULL;
+	} else {
+		bo->ttm = NULL;
+	}
+
+	dma_resv_unlock(&ghost_obj->base._resv);
+	ttm_bo_put(ghost_obj);
+	return 0;
+}
+
 int ttm_bo_move_accel_cleanup(struct ttm_buffer_object *bo,
 			      struct dma_fence *fence,
 			      bool evict,
@@ -534,7 +575,6 @@ int ttm_bo_move_accel_cleanup(struct ttm_buffer_object *bo,
 	struct ttm_bo_device *bdev = bo->bdev;
 	struct ttm_resource_manager *man = ttm_manager_type(bdev, new_mem->mem_type);
 	int ret;
-	struct ttm_buffer_object *ghost_obj;
 
 	dma_resv_add_excl_fence(bo->base.resv, fence);
 	if (evict) {
@@ -546,37 +586,9 @@ int ttm_bo_move_accel_cleanup(struct ttm_buffer_object *bo,
 			ttm_bo_tt_destroy(bo);
 		ttm_bo_free_old_node(bo);
 	} else {
-		/**
-		 * This should help pipeline ordinary buffer moves.
-		 *
-		 * Hang old buffer memory on a new buffer object,
-		 * and leave it to be released when the GPU
-		 * operation has completed.
-		 */
-
-		dma_fence_put(bo->moving);
-		bo->moving = dma_fence_get(fence);
-
-		ret = ttm_buffer_object_transfer(bo, &ghost_obj);
+		ret = ttm_bo_move_to_ghost(bo, fence, man->use_tt);
 		if (ret)
 			return ret;
-
-		dma_resv_add_excl_fence(&ghost_obj->base._resv, fence);
-
-		/**
-		 * If we're not moving to fixed memory, the TTM object
-		 * needs to stay alive. Otherwhise hang it on the ghost
-		 * bo to be unbound and destroyed.
-		 */
-
-		if (man->use_tt) {
-			ghost_obj->ttm = NULL;
-		} else {
-			bo->ttm = NULL;
-		}
-
-		dma_resv_unlock(&ghost_obj->base._resv);
-		ttm_bo_put(ghost_obj);
 	}
 
 	ttm_bo_assign_mem(bo, new_mem);
@@ -599,40 +611,9 @@ int ttm_bo_pipeline_move(struct ttm_buffer_object *bo,
 	dma_resv_add_excl_fence(bo->base.resv, fence);
 
 	if (!evict) {
-		struct ttm_buffer_object *ghost_obj;
-
-		/**
-		 * This should help pipeline ordinary buffer moves.
-		 *
-		 * Hang old buffer memory on a new buffer object,
-		 * and leave it to be released when the GPU
-		 * operation has completed.
-		 */
-
-		dma_fence_put(bo->moving);
-		bo->moving = dma_fence_get(fence);
-
-		ret = ttm_buffer_object_transfer(bo, &ghost_obj);
+		ret = ttm_bo_move_to_ghost(bo, fence, to->use_tt);
 		if (ret)
 			return ret;
-
-		dma_resv_add_excl_fence(&ghost_obj->base._resv, fence);
-
-		/**
-		 * If we're not moving to fixed memory, the TTM object
-		 * needs to stay alive. Otherwhise hang it on the ghost
-		 * bo to be unbound and destroyed.
-		 */
-
-		if (to->use_tt) {
-			ghost_obj->ttm = NULL;
-		} else {
-			bo->ttm = NULL;
-		}
-
-		dma_resv_unlock(&ghost_obj->base._resv);
-		ttm_bo_put(ghost_obj);
-
 	} else if (!from->use_tt) {
 
 		/**
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
