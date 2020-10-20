Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 776BC293292
	for <lists+dri-devel@lfdr.de>; Tue, 20 Oct 2020 03:03:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DEF66EE53;
	Tue, 20 Oct 2020 01:03:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-44.mimecast.com
 (us-smtp-delivery-44.mimecast.com [205.139.111.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83B576EE52
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Oct 2020 01:03:30 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-92-JW6yhgjCMyymDZKImDA_Sw-1; Mon, 19 Oct 2020 21:03:27 -0400
X-MC-Unique: JW6yhgjCMyymDZKImDA_Sw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 72F458030BB;
 Tue, 20 Oct 2020 01:03:26 +0000 (UTC)
Received: from tyrion-bne-redhat-com.redhat.com (vpn2-54-180.bne.redhat.com
 [10.64.54.180])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AC34E55775;
 Tue, 20 Oct 2020 01:03:25 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 3/7] drm/ttm: add move to system into drivers
Date: Tue, 20 Oct 2020 11:03:15 +1000
Message-Id: <20201020010319.1692445-4-airlied@gmail.com>
In-Reply-To: <20201020010319.1692445-1-airlied@gmail.com>
References: <20201020010319.1692445-1-airlied@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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

This moves the to system move into the drivers, and moves all
the unbinds in the move path under driver control

Note: radeon/nouveau already wait so don't duplicate it.

Signed-off-by: Dave Airlie <airlied@redhat.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c    | 12 +++++++++---
 drivers/gpu/drm/nouveau/nouveau_bo.c       | 10 ++++++----
 drivers/gpu/drm/radeon/radeon_ttm.c        | 12 +++++++-----
 drivers/gpu/drm/ttm/ttm_bo_util.c          | 21 ---------------------
 drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c |  5 ++++-
 include/drm/ttm/ttm_bo_driver.h            |  2 --
 6 files changed, 26 insertions(+), 36 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index 4af4891264e1..fcec99aea019 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -66,6 +66,8 @@
 static int amdgpu_ttm_backend_bind(struct ttm_bo_device *bdev,
 				   struct ttm_tt *ttm,
 				   struct ttm_resource *bo_mem);
+static void amdgpu_ttm_backend_unbind(struct ttm_bo_device *bdev,
+				      struct ttm_tt *ttm);
 
 static int amdgpu_ttm_init_on_chip(struct amdgpu_device *adev,
 				    unsigned int type,
@@ -561,11 +563,12 @@ static int amdgpu_move_vram_ram(struct ttm_buffer_object *bo, bool evict,
 		goto out_cleanup;
 	}
 
-	/* move BO (in tmp_mem) to new_mem */
-	r = ttm_bo_move_to_system(bo, ctx);
+	r = ttm_bo_wait_ctx(bo, ctx);
 	if (unlikely(r))
 		goto out_cleanup;
 
+	amdgpu_ttm_backend_unbind(bo->bdev, bo->ttm);
+	ttm_resource_free(bo, &bo->mem);
 	ttm_bo_assign_mem(bo, new_mem);
 out_cleanup:
 	ttm_resource_free(bo, &tmp_mem);
@@ -682,9 +685,12 @@ static int amdgpu_bo_move(struct ttm_buffer_object *bo, bool evict,
 
 	if (old_mem->mem_type == TTM_PL_TT &&
 	    new_mem->mem_type == TTM_PL_SYSTEM) {
-		r = ttm_bo_move_to_system(bo, ctx);
+		r = ttm_bo_wait_ctx(bo, ctx);
 		if (r)
 			return r;
+
+		amdgpu_ttm_backend_unbind(bo->bdev, bo->ttm);
+		ttm_resource_free(bo, &bo->mem);
 		ttm_bo_assign_mem(bo, new_mem);
 		return 0;
 	}
diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
index 7e604340b780..c58c8951f72f 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
@@ -46,6 +46,7 @@
 
 static int nouveau_ttm_tt_bind(struct ttm_bo_device *bdev, struct ttm_tt *ttm,
 			       struct ttm_resource *reg);
+static void nouveau_ttm_tt_unbind(struct ttm_bo_device *bdev, struct ttm_tt *ttm);
 
 /*
  * NV10-NV40 tiling helpers
@@ -897,10 +898,12 @@ nouveau_bo_move_flipd(struct ttm_buffer_object *bo, bool evict,
 	if (ret)
 		goto out;
 
-	ret = ttm_bo_move_to_system(bo, ctx);
+	ret = ttm_bo_wait_ctx(bo, ctx);
 	if (ret)
 		goto out;
 
+	nouveau_ttm_tt_unbind(bo->bdev, bo->ttm);
+	ttm_resource_free(bo, &bo->mem);
 	ttm_bo_assign_mem(bo, &tmp_reg);
 out:
 	ttm_resource_free(bo, &tmp_reg);
@@ -1056,9 +1059,8 @@ nouveau_bo_move(struct ttm_buffer_object *bo, bool evict,
 
 	if (old_reg->mem_type == TTM_PL_TT &&
 	    new_reg->mem_type == TTM_PL_SYSTEM) {
-		ret = ttm_bo_move_to_system(bo, ctx);
-		if (ret)
-			return ret;
+		nouveau_ttm_tt_unbind(bo->bdev, bo->ttm);
+		ttm_resource_free(bo, &bo->mem);
 		ttm_bo_assign_mem(bo, new_reg);
 		goto out;
 	}
diff --git a/drivers/gpu/drm/radeon/radeon_ttm.c b/drivers/gpu/drm/radeon/radeon_ttm.c
index 24ef25665249..d3d39823b69f 100644
--- a/drivers/gpu/drm/radeon/radeon_ttm.c
+++ b/drivers/gpu/drm/radeon/radeon_ttm.c
@@ -59,6 +59,8 @@ static void radeon_ttm_debugfs_fini(struct radeon_device *rdev);
 static int radeon_ttm_tt_bind(struct ttm_bo_device *bdev,
 			      struct ttm_tt *ttm,
 			      struct ttm_resource *bo_mem);
+static void radeon_ttm_tt_unbind(struct ttm_bo_device *bdev,
+				 struct ttm_tt *ttm);
 
 struct radeon_device *radeon_get_rdev(struct ttm_bo_device *bdev)
 {
@@ -244,10 +246,12 @@ static int radeon_move_vram_ram(struct ttm_buffer_object *bo,
 	if (unlikely(r)) {
 		goto out_cleanup;
 	}
-	r = ttm_bo_move_to_system(bo, ctx);
+	r = ttm_bo_wait_ctx(bo, ctx);
 	if (unlikely(r))
 		goto out_cleanup;
 
+	radeon_ttm_tt_unbind(bo->bdev, bo->ttm);
+	ttm_resource_free(bo, &bo->mem);
 	ttm_bo_assign_mem(bo, new_mem);
 out_cleanup:
 	ttm_resource_free(bo, &tmp_mem);
@@ -329,10 +333,8 @@ static int radeon_bo_move(struct ttm_buffer_object *bo, bool evict,
 
 	if (old_mem->mem_type == TTM_PL_TT &&
 	    new_mem->mem_type == TTM_PL_SYSTEM) {
-		r = ttm_bo_move_to_system(bo, ctx);
-		if (r)
-			return r;
-
+		radeon_ttm_tt_unbind(bo->bdev, bo->ttm);
+		ttm_resource_free(bo, &bo->mem);
 		ttm_bo_assign_mem(bo, new_mem);
 		return 0;
 	}
diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c b/drivers/gpu/drm/ttm/ttm_bo_util.c
index b730e624a220..21811bbda2e4 100644
--- a/drivers/gpu/drm/ttm/ttm_bo_util.c
+++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
@@ -65,27 +65,6 @@ int ttm_bo_move_to_new_tt_mem(struct ttm_buffer_object *bo,
 	return 0;
 }
 
-int ttm_bo_move_to_system(struct ttm_buffer_object *bo,
-			  struct ttm_operation_ctx *ctx)
-{
-	int ret;
-
-	if (bo->mem.mem_type == TTM_PL_SYSTEM)
-		return 0;
-
-	ret = ttm_bo_wait_ctx(bo, ctx);
-	if (unlikely(ret != 0)) {
-		if (ret != -ERESTARTSYS)
-			pr_err("Failed to expire sync object before unbinding TTM\n");
-		return ret;
-	}
-
-	ttm_bo_tt_unbind(bo);
-	ttm_resource_free(bo, &bo->mem);
-	return 0;
-}
-EXPORT_SYMBOL(ttm_bo_move_to_system);
-
 int ttm_mem_io_reserve(struct ttm_bo_device *bdev,
 		       struct ttm_resource *mem)
 {
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c b/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
index c5cf81c09971..1d220a9794e6 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
@@ -742,9 +742,12 @@ static int vmw_move(struct ttm_buffer_object *bo,
 			ttm_bo_assign_mem(bo, new_mem);
 			return 0;
 		}
-		ret = ttm_bo_move_to_system(bo, ctx);
+		ret = ttm_bo_wait_ctx(bo, ctx);
 		if (ret)
 			return ret;
+
+		vmw_ttm_unbind(bo->bdev, bo->ttm);
+		ttm_resource_free(bo, &bo->mem);
 		ttm_bo_assign_mem(bo, new_mem);
 		return 0;
 	} else {
diff --git a/include/drm/ttm/ttm_bo_driver.h b/include/drm/ttm/ttm_bo_driver.h
index a89728cb9a23..81a1618b9535 100644
--- a/include/drm/ttm/ttm_bo_driver.h
+++ b/include/drm/ttm/ttm_bo_driver.h
@@ -574,8 +574,6 @@ void ttm_mem_io_free(struct ttm_bo_device *bdev,
 int ttm_bo_move_to_new_tt_mem(struct ttm_buffer_object *bo,
 			      struct ttm_operation_ctx *ctx,
 			      struct ttm_resource *new_mem);
-int ttm_bo_move_to_system(struct ttm_buffer_object *bo,
-			  struct ttm_operation_ctx *ctx);
 
 /**
  * ttm_bo_move_memcpy
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
