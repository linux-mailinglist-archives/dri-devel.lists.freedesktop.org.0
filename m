Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A39D2922D7
	for <lists+dri-devel@lfdr.de>; Mon, 19 Oct 2020 09:13:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C20016E8E1;
	Mon, 19 Oct 2020 07:13:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-44.mimecast.com
 (us-smtp-delivery-44.mimecast.com [207.211.30.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5570D6E8E1
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Oct 2020 07:13:28 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-425-dkepT9sRPgm3PAgi7AKB4Q-1; Mon, 19 Oct 2020 03:13:24 -0400
X-MC-Unique: dkepT9sRPgm3PAgi7AKB4Q-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A8C3210E2187;
 Mon, 19 Oct 2020 07:13:23 +0000 (UTC)
Received: from tyrion-bne-redhat-com.redhat.com (vpn2-54-180.bne.redhat.com
 [10.64.54.180])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B18601992D;
 Mon, 19 Oct 2020 07:13:22 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 4/5] drm/ttm: add move old to system to drivers.
Date: Mon, 19 Oct 2020 17:13:13 +1000
Message-Id: <20201019071314.1671485-5-airlied@gmail.com>
In-Reply-To: <20201019071314.1671485-1-airlied@gmail.com>
References: <20201019071314.1671485-1-airlied@gmail.com>
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
Cc: christian.koenig@amd.com, rscheidegger.oss@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Dave Airlie <airlied@redhat.com>

Uninline ttm_bo_move_ttm. Eventually want to unhook the unbind out.

Reviewed-by: Ben Skeggs <bskeggs@redhat.com>
Signed-off-by: Dave Airlie <airlied@redhat.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c    | 15 ++++++++++++---
 drivers/gpu/drm/nouveau/nouveau_bo.c       | 11 +++++++++--
 drivers/gpu/drm/radeon/radeon_ttm.c        | 15 ++++++++++++---
 drivers/gpu/drm/ttm/ttm_bo_util.c          |  5 +++--
 drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c |  7 ++++++-
 include/drm/ttm/ttm_bo_driver.h            |  2 ++
 6 files changed, 44 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index f8c9d66d3ef7..b052d3e6f635 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -562,7 +562,11 @@ static int amdgpu_move_vram_ram(struct ttm_buffer_object *bo, bool evict,
 	}
 
 	/* move BO (in tmp_mem) to new_mem */
-	r = ttm_bo_move_ttm(bo, ctx, new_mem);
+	r = ttm_bo_move_old_to_system(bo, ctx);
+	if (unlikely(r))
+		goto out_cleanup;
+
+	ttm_bo_assign_mem(bo, new_mem);
 out_cleanup:
 	ttm_resource_free(bo, &tmp_mem);
 	return r;
@@ -672,8 +676,13 @@ static int amdgpu_bo_move(struct ttm_buffer_object *bo, bool evict,
 	}
 
 	if (old_mem->mem_type == TTM_PL_TT &&
-	    new_mem->mem_type == TTM_PL_SYSTEM)
-		return ttm_bo_move_ttm(bo, ctx, new_mem);
+	    new_mem->mem_type == TTM_PL_SYSTEM) {
+		r = ttm_bo_move_old_to_system(bo, ctx);
+		if (r)
+			return r;
+		ttm_bo_assign_mem(bo, new_mem);
+		return 0;
+	}
 
 	if (old_mem->mem_type == AMDGPU_PL_GDS ||
 	    old_mem->mem_type == AMDGPU_PL_GWS ||
diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
index 63baa9367851..e7e83f00674e 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
@@ -897,7 +897,11 @@ nouveau_bo_move_flipd(struct ttm_buffer_object *bo, bool evict,
 	if (ret)
 		goto out;
 
-	ret = ttm_bo_move_ttm(bo, ctx, new_reg);
+	ret = ttm_bo_move_old_to_system(bo, ctx);
+	if (ret)
+		goto out;
+
+	ttm_bo_assign_mem(bo, &tmp_reg);
 out:
 	ttm_resource_free(bo, &tmp_reg);
 	return ret;
@@ -1048,7 +1052,10 @@ nouveau_bo_move(struct ttm_buffer_object *bo, bool evict,
 
 	if (old_reg->mem_type == TTM_PL_TT &&
 	    new_reg->mem_type == TTM_PL_SYSTEM) {
-		ret = ttm_bo_move_ttm(bo, ctx, new_reg);
+		ret = ttm_bo_move_old_to_system(bo, ctx);
+		if (ret)
+			return ret;
+		ttm_bo_assign_mem(bo, new_reg);
 		goto out;
 	}
 
diff --git a/drivers/gpu/drm/radeon/radeon_ttm.c b/drivers/gpu/drm/radeon/radeon_ttm.c
index 9437d29248fd..4274f5ea56e4 100644
--- a/drivers/gpu/drm/radeon/radeon_ttm.c
+++ b/drivers/gpu/drm/radeon/radeon_ttm.c
@@ -244,7 +244,11 @@ static int radeon_move_vram_ram(struct ttm_buffer_object *bo,
 	if (unlikely(r)) {
 		goto out_cleanup;
 	}
-	r = ttm_bo_move_ttm(bo, ctx, new_mem);
+	r = ttm_bo_move_old_to_system(bo, ctx);
+	if (unlikely(r))
+		goto out_cleanup;
+
+	ttm_bo_assign_mem(bo, new_mem);
 out_cleanup:
 	ttm_resource_free(bo, &tmp_mem);
 	return r;
@@ -319,9 +323,14 @@ static int radeon_bo_move(struct ttm_buffer_object *bo, bool evict,
 	}
 
 	if (old_mem->mem_type == TTM_PL_TT &&
-	    new_mem->mem_type == TTM_PL_SYSTEM)
-		return ttm_bo_move_ttm(bo, ctx, new_mem);
+	    new_mem->mem_type == TTM_PL_SYSTEM) {
+		r = ttm_bo_move_old_to_system(bo, ctx);
+		if (r)
+			return r;
 
+		ttm_bo_assign_mem(bo, new_mem);
+		return 0;
+	}
 	if (!rdev->ring[radeon_copy_ring_index(rdev)].ready ||
 	    rdev->asic->copy.copy == NULL) {
 		/* use memcpy */
diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c b/drivers/gpu/drm/ttm/ttm_bo_util.c
index 39e03d99a377..1c1055a500cd 100644
--- a/drivers/gpu/drm/ttm/ttm_bo_util.c
+++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
@@ -66,8 +66,8 @@ int ttm_bo_move_to_new_tt_mem(struct ttm_buffer_object *bo,
 }
 EXPORT_SYMBOL(ttm_bo_move_to_new_tt_mem);
 
-static int ttm_bo_move_old_to_system(struct ttm_buffer_object *bo,
-				     struct ttm_operation_ctx *ctx)
+int ttm_bo_move_old_to_system(struct ttm_buffer_object *bo,
+			      struct ttm_operation_ctx *ctx)
 {
 	struct ttm_resource *old_mem = &bo->mem;
 	int ret;
@@ -87,6 +87,7 @@ static int ttm_bo_move_old_to_system(struct ttm_buffer_object *bo,
 	old_mem->mem_type = TTM_PL_SYSTEM;
 	return 0;
 }
+EXPORT_SYMBOL(ttm_bo_move_old_to_system);
 
 int ttm_bo_move_ttm(struct ttm_buffer_object *bo,
 		   struct ttm_operation_ctx *ctx,
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c b/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
index 112253246f08..b55b28b4faa2 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
@@ -735,13 +735,18 @@ static int vmw_move(struct ttm_buffer_object *bo,
 {
 	struct ttm_resource_manager *old_man = ttm_manager_type(bo->bdev, bo->mem.mem_type);
 	struct ttm_resource_manager *new_man = ttm_manager_type(bo->bdev, new_mem->mem_type);
+	int ret;
 
 	if (old_man->use_tt && new_man->use_tt) {
 		if (bo->mem.mem_type == TTM_PL_SYSTEM) {
 			ttm_bo_assign_mem(bo, new_mem);
 			return 0;
 		}
-		return ttm_bo_move_ttm(bo, ctx, new_mem);
+		ret = ttm_bo_move_old_to_system(bo, ctx);
+		if (ret)
+			return ret;
+		ttm_bo_assign_mem(bo, new_mem);
+		return 0;
 	} else {
 		return ttm_bo_move_memcpy(bo, ctx, new_mem);
 	}
diff --git a/include/drm/ttm/ttm_bo_driver.h b/include/drm/ttm/ttm_bo_driver.h
index 1f4d2b1febd0..4b341914858b 100644
--- a/include/drm/ttm/ttm_bo_driver.h
+++ b/include/drm/ttm/ttm_bo_driver.h
@@ -596,6 +596,8 @@ int ttm_bo_move_ttm(struct ttm_buffer_object *bo,
 int ttm_bo_move_to_new_tt_mem(struct ttm_buffer_object *bo,
 			      struct ttm_operation_ctx *ctx,
 			      struct ttm_resource *new_mem);
+int ttm_bo_move_old_to_system(struct ttm_buffer_object *bo,
+			      struct ttm_operation_ctx *ctx);
 
 /**
  * ttm_bo_move_memcpy
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
