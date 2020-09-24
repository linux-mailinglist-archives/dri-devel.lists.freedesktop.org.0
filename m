Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7C19276842
	for <lists+dri-devel@lfdr.de>; Thu, 24 Sep 2020 07:19:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DE596EA86;
	Thu, 24 Sep 2020 05:19:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-44.mimecast.com
 (us-smtp-delivery-44.mimecast.com [207.211.30.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB1446EA7A
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Sep 2020 05:19:29 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-459-2Fdm8qLJPUGG3VFhjVlTrA-1; Thu, 24 Sep 2020 01:19:24 -0400
X-MC-Unique: 2Fdm8qLJPUGG3VFhjVlTrA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A8E861091071;
 Thu, 24 Sep 2020 05:19:23 +0000 (UTC)
Received: from tyrion-bne-redhat-com.redhat.com (vpn2-54-60.bne.redhat.com
 [10.64.54.60])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AB82D19D7C;
 Thu, 24 Sep 2020 05:19:22 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 25/45] drm/ttm: don't call ttm_bo_move_ttm from drivers
Date: Thu, 24 Sep 2020 15:18:25 +1000
Message-Id: <20200924051845.397177-26-airlied@gmail.com>
In-Reply-To: <20200924051845.397177-1-airlied@gmail.com>
References: <20200924051845.397177-1-airlied@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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
Cc: christian.koenig@amd.com, bskeggs@redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Dave Airlie <airlied@redhat.com>

Drop the interface completely

Signed-off-by: Dave Airlie <airlied@redhat.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c    | 12 ++++++++++--
 drivers/gpu/drm/nouveau/nouveau_bo.c       | 10 ++++++++--
 drivers/gpu/drm/radeon/radeon_ttm.c        | 12 ++++++++++--
 drivers/gpu/drm/ttm/ttm_bo_util.c          | 19 -------------------
 drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c | 10 +++++++++-
 include/drm/ttm/ttm_bo_driver.h            | 21 ---------------------
 6 files changed, 37 insertions(+), 47 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index 18b7d28a0c94..50362f56d2d0 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -708,8 +708,16 @@ static int amdgpu_bo_move(struct ttm_buffer_object *bo, bool evict,
 	}
 
 	if (old_mem->mem_type == TTM_PL_TT &&
-	    new_mem->mem_type == TTM_PL_SYSTEM)
-		return ttm_bo_move_ttm(bo, ctx, new_mem);
+	    new_mem->mem_type == TTM_PL_SYSTEM) {
+		r = ttm_bo_move_old_to_system(bo, ctx);
+		if (r)
+			return r;
+		r = ttm_tt_set_placement_caching(bo->ttm, new_mem->placement);
+		if (r)
+			return r;
+		ttm_bo_assign_mem(bo, new_mem);
+		return 0;
+	}
 
 	if (old_mem->mem_type == AMDGPU_PL_GDS ||
 	    old_mem->mem_type == AMDGPU_PL_GWS ||
diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
index 1ce13223939b..fc0f9e9232db 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
@@ -1107,8 +1107,14 @@ nouveau_bo_move(struct ttm_buffer_object *bo, bool evict,
 
 	if (old_reg->mem_type == TTM_PL_TT &&
 	    new_reg->mem_type == TTM_PL_SYSTEM) {
-		ret = ttm_bo_move_ttm(bo, ctx, new_reg);
-		goto out;
+		ret = ttm_bo_move_old_to_system(bo, ctx);
+		if (ret)
+			goto out;
+		ret = ttm_tt_set_placement_caching(bo->ttm, new_reg->placement);
+		if (ret)
+			goto out;
+		ttm_bo_assign_mem(bo, new_reg);
+		return 0;
 	}
 
 	/* Hardware assisted copy. */
diff --git a/drivers/gpu/drm/radeon/radeon_ttm.c b/drivers/gpu/drm/radeon/radeon_ttm.c
index 435dc37eea34..0ea20dc15cb2 100644
--- a/drivers/gpu/drm/radeon/radeon_ttm.c
+++ b/drivers/gpu/drm/radeon/radeon_ttm.c
@@ -353,8 +353,16 @@ static int radeon_bo_move(struct ttm_buffer_object *bo, bool evict,
 	}
 
 	if (old_mem->mem_type == TTM_PL_TT &&
-	    new_mem->mem_type == TTM_PL_SYSTEM)
-		return ttm_bo_move_ttm(bo, ctx, new_mem);
+	    new_mem->mem_type == TTM_PL_SYSTEM) {
+		r = ttm_bo_move_old_to_system(bo, ctx);
+		if (r)
+			return r;
+		r = ttm_tt_set_placement_caching(bo->ttm, new_mem->placement);
+		if (r)
+			return r;
+		ttm_bo_assign_mem(bo, new_mem);
+		return 0;
+	}
 
 	if (!rdev->ring[radeon_copy_ring_index(rdev)].ready ||
 	    rdev->asic->copy.copy == NULL) {
diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c b/drivers/gpu/drm/ttm/ttm_bo_util.c
index ac921d6456b7..4ceef9f7dce6 100644
--- a/drivers/gpu/drm/ttm/ttm_bo_util.c
+++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
@@ -89,25 +89,6 @@ int ttm_bo_move_old_to_system(struct ttm_buffer_object *bo,
 }
 EXPORT_SYMBOL(ttm_bo_move_old_to_system);
 
-int ttm_bo_move_ttm(struct ttm_buffer_object *bo,
-		   struct ttm_operation_ctx *ctx,
-		    struct ttm_resource *new_mem)
-{
-	int ret;
-
-	ret = ttm_bo_move_old_to_system(bo, ctx);
-	if (ret)
-		return ret;
-
-	ret = ttm_bo_move_to_new_tt_mem(bo, ctx, new_mem);
-	if (ret)
-		return ret;
-
-	ttm_bo_assign_mem(bo, new_mem);
-	return 0;
-}
-EXPORT_SYMBOL(ttm_bo_move_ttm);
-
 int ttm_mem_io_reserve(struct ttm_bo_device *bdev,
 		       struct ttm_resource *mem)
 {
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c b/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
index 2a99c24abbdf..0b8d5655e416 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
@@ -742,7 +742,15 @@ static int vmw_move(struct ttm_buffer_object *bo,
 			ttm_bo_assign_mem(bo, new_mem);
 			return 0;
 		}
-		ret = ttm_bo_move_ttm(bo, ctx, new_mem);
+		ret = ttm_bo_move_old_to_system(bo, ctx);
+		if (ret)
+			return ret;
+
+		ret = ttm_bo_move_to_new_tt_mem(bo, ctx, new_mem);
+		if (ret)
+			return ret;
+
+		ttm_bo_assign_mem(bo, new_mem);
 	} else
 		ret = ttm_bo_move_memcpy(bo, ctx, new_mem);
 
diff --git a/include/drm/ttm/ttm_bo_driver.h b/include/drm/ttm/ttm_bo_driver.h
index 65cf86b3ba0b..58d2d3a5ed20 100644
--- a/include/drm/ttm/ttm_bo_driver.h
+++ b/include/drm/ttm/ttm_bo_driver.h
@@ -583,27 +583,6 @@ int ttm_mem_io_reserve(struct ttm_bo_device *bdev,
 		       struct ttm_resource *mem);
 void ttm_mem_io_free(struct ttm_bo_device *bdev,
 		     struct ttm_resource *mem);
-/**
- * ttm_bo_move_ttm
- *
- * @bo: A pointer to a struct ttm_buffer_object.
- * @interruptible: Sleep interruptible if waiting.
- * @no_wait_gpu: Return immediately if the GPU is busy.
- * @new_mem: struct ttm_resource indicating where to move.
- *
- * Optimized move function for a buffer object with both old and
- * new placement backed by a TTM. The function will, if successful,
- * free any old aperture space, and set (@new_mem)->mm_node to NULL,
- * and update the (@bo)->mem placement flags. If unsuccessful, the old
- * data remains untouched, and it's up to the caller to free the
- * memory space indicated by @new_mem.
- * Returns:
- * !0: Failure.
- */
-
-int ttm_bo_move_ttm(struct ttm_buffer_object *bo,
-		    struct ttm_operation_ctx *ctx,
-		    struct ttm_resource *new_mem);
 
 int ttm_bo_move_old_to_system(struct ttm_buffer_object *bo,
 			      struct ttm_operation_ctx *ctx);
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
