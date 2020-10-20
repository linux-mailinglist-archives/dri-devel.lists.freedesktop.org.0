Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BAF0293294
	for <lists+dri-devel@lfdr.de>; Tue, 20 Oct 2020 03:03:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FF646EE56;
	Tue, 20 Oct 2020 01:03:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-44.mimecast.com
 (us-smtp-delivery-44.mimecast.com [205.139.111.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F378F6EE55
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Oct 2020 01:03:35 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-176-61EIAyKxM_2egMhEpnelvw-1; Mon, 19 Oct 2020 21:03:30 -0400
X-MC-Unique: 61EIAyKxM_2egMhEpnelvw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CD7A48030B9;
 Tue, 20 Oct 2020 01:03:29 +0000 (UTC)
Received: from tyrion-bne-redhat-com.redhat.com (vpn2-54-180.bne.redhat.com
 [10.64.54.180])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1240155775;
 Tue, 20 Oct 2020 01:03:28 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 6/7] drm/ttm: drop move notify around move.
Date: Tue, 20 Oct 2020 11:03:18 +1000
Message-Id: <20201020010319.1692445-7-airlied@gmail.com>
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

The drivers now do this in the move callback.

move_notify is still needed in the destroy path.

Signed-off-by: Dave Airlie <airlied@redhat.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c    | 13 +++++--
 drivers/gpu/drm/drm_gem_vram_helper.c      | 11 +++++-
 drivers/gpu/drm/nouveau/nouveau_bo.c       | 12 ++++--
 drivers/gpu/drm/qxl/qxl_ttm.c              | 45 +++++++++++++---------
 drivers/gpu/drm/radeon/radeon_ttm.c        | 11 +++++-
 drivers/gpu/drm/ttm/ttm_bo.c               | 12 +-----
 drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c | 14 ++++++-
 7 files changed, 78 insertions(+), 40 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index ac93a537f2e2..9aba34b57e60 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -666,6 +666,8 @@ static int amdgpu_bo_move(struct ttm_buffer_object *bo, bool evict,
 	struct ttm_resource *old_mem = &bo->mem;
 	int r;
 
+	amdgpu_bo_move_notify(bo, evict, new_mem);
+
 	/* Can't move a pinned BO */
 	abo = ttm_to_amdgpu_bo(bo);
 	if (WARN_ON_ONCE(abo->tbo.pin_count > 0))
@@ -687,7 +689,7 @@ static int amdgpu_bo_move(struct ttm_buffer_object *bo, bool evict,
 	    new_mem->mem_type == TTM_PL_SYSTEM) {
 		r = ttm_bo_wait_ctx(bo, ctx);
 		if (r)
-			return r;
+			goto fail;
 
 		amdgpu_ttm_backend_unbind(bo->bdev, bo->ttm);
 		ttm_resource_free(bo, &bo->mem);
@@ -728,12 +730,12 @@ static int amdgpu_bo_move(struct ttm_buffer_object *bo, bool evict,
 		if (!amdgpu_mem_visible(adev, old_mem) ||
 		    !amdgpu_mem_visible(adev, new_mem)) {
 			pr_err("Move buffer fallback to memcpy unavailable\n");
-			return r;
+			goto fail;
 		}
 
 		r = ttm_bo_move_memcpy(bo, ctx, new_mem);
 		if (r)
-			return r;
+			goto fail;
 	}
 
 	if (bo->type == ttm_bo_type_device &&
@@ -748,6 +750,11 @@ static int amdgpu_bo_move(struct ttm_buffer_object *bo, bool evict,
 	/* update statistics */
 	atomic64_add((u64)bo->mem.num_pages << PAGE_SHIFT, &adev->num_bytes_moved);
 	return 0;
+fail:
+	swap(*new_mem, bo->mem);
+	amdgpu_bo_move_notify(bo, false, new_mem);
+	swap(*new_mem, bo->mem);
+	return r;
 }
 
 /**
diff --git a/drivers/gpu/drm/drm_gem_vram_helper.c b/drivers/gpu/drm/drm_gem_vram_helper.c
index e99782bc13f1..b4b419732676 100644
--- a/drivers/gpu/drm/drm_gem_vram_helper.c
+++ b/drivers/gpu/drm/drm_gem_vram_helper.c
@@ -590,7 +590,16 @@ static int drm_gem_vram_bo_driver_move(struct drm_gem_vram_object *gbo,
 				       struct ttm_operation_ctx *ctx,
 				       struct ttm_resource *new_mem)
 {
-	return ttm_bo_move_memcpy(&gbo->bo, ctx, new_mem);
+	int ret;
+
+	drm_gem_vram_bo_driver_move_notify(gbo, evict, new_mem);
+	ret = ttm_bo_move_memcpy(&gbo->bo, ctx, new_mem);
+	if (ret) {
+		swap(*new_mem, gbo->bo.mem);
+		drm_gem_vram_bo_driver_move_notify(gbo, false, new_mem);
+		swap(*new_mem, gbo->bo.mem);
+	}
+	return ret;
 }
 
 /*
diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
index 7fb65b87f815..ad0493c5103b 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
@@ -1032,9 +1032,10 @@ nouveau_bo_move(struct ttm_buffer_object *bo, bool evict,
 	struct nouveau_drm_tile *new_tile = NULL;
 	int ret = 0;
 
+	nouveau_bo_move_ntfy(bo, evict, new_reg);
 	ret = ttm_bo_wait_ctx(bo, ctx);
 	if (ret)
-		return ret;
+		goto out_ntfy;
 
 	if (nvbo->bo.pin_count)
 		NV_WARN(drm, "Moving pinned object %p!\n", nvbo);
@@ -1042,7 +1043,7 @@ nouveau_bo_move(struct ttm_buffer_object *bo, bool evict,
 	if (drm->client.device.info.family < NV_DEVICE_INFO_V0_TESLA) {
 		ret = nouveau_bo_vm_bind(bo, new_reg, &new_tile);
 		if (ret)
-			return ret;
+			goto out_ntfy;
 	}
 
 	/* Fake bo copy. */
@@ -1090,7 +1091,12 @@ nouveau_bo_move(struct ttm_buffer_object *bo, bool evict,
 		else
 			nouveau_bo_vm_cleanup(bo, new_tile, &nvbo->tile);
 	}
-
+out_ntfy:
+	if (ret) {
+		swap(*new_reg, bo->mem);
+		nouveau_bo_move_ntfy(bo, false, new_reg);
+		swap(*new_reg, bo->mem);
+	}
 	return ret;
 }
 
diff --git a/drivers/gpu/drm/qxl/qxl_ttm.c b/drivers/gpu/drm/qxl/qxl_ttm.c
index 95c4f2c7ab79..a6149e3cc3d2 100644
--- a/drivers/gpu/drm/qxl/qxl_ttm.c
+++ b/drivers/gpu/drm/qxl/qxl_ttm.c
@@ -136,24 +136,6 @@ static struct ttm_tt *qxl_ttm_tt_create(struct ttm_buffer_object *bo,
 	return ttm;
 }
 
-static int qxl_bo_move(struct ttm_buffer_object *bo, bool evict,
-		       struct ttm_operation_ctx *ctx,
-		       struct ttm_resource *new_mem)
-{
-	struct ttm_resource *old_mem = &bo->mem;
-	int ret;
-
-	ret = ttm_bo_wait_ctx(bo, ctx);
-	if (ret)
-		return ret;
-
-	if (old_mem->mem_type == TTM_PL_SYSTEM && bo->ttm == NULL) {
-		ttm_bo_move_null(bo, new_mem);
-		return 0;
-	}
-	return ttm_bo_move_memcpy(bo, ctx, new_mem);
-}
-
 static void qxl_bo_move_notify(struct ttm_buffer_object *bo,
 			       bool evict,
 			       struct ttm_resource *new_mem)
@@ -170,6 +152,33 @@ static void qxl_bo_move_notify(struct ttm_buffer_object *bo,
 		qxl_surface_evict(qdev, qbo, new_mem ? true : false);
 }
 
+static int qxl_bo_move(struct ttm_buffer_object *bo, bool evict,
+		       struct ttm_operation_ctx *ctx,
+		       struct ttm_resource *new_mem)
+{
+	struct ttm_resource *old_mem = &bo->mem;
+	int ret;
+
+	qxl_bo_move_notify(bo, evict, new_mem);
+
+	ret = ttm_bo_wait_ctx(bo, ctx);
+	if (ret)
+		goto out;
+
+	if (old_mem->mem_type == TTM_PL_SYSTEM && bo->ttm == NULL) {
+		ttm_bo_move_null(bo, new_mem);
+		return 0;
+	}
+	ret = ttm_bo_move_memcpy(bo, ctx, new_mem);
+out:
+	if (ret) {
+		swap(*new_mem, bo->mem);
+		qxl_bo_move_notify(bo, false, new_mem);
+		swap(*new_mem, bo->mem);
+	}
+	return ret;
+}
+
 static struct ttm_bo_driver qxl_bo_driver = {
 	.ttm_tt_create = &qxl_ttm_tt_create,
 	.ttm_tt_bind = &qxl_ttm_backend_bind,
diff --git a/drivers/gpu/drm/radeon/radeon_ttm.c b/drivers/gpu/drm/radeon/radeon_ttm.c
index 7fe4a98ece54..e427194b0b50 100644
--- a/drivers/gpu/drm/radeon/radeon_ttm.c
+++ b/drivers/gpu/drm/radeon/radeon_ttm.c
@@ -311,9 +311,11 @@ static int radeon_bo_move(struct ttm_buffer_object *bo, bool evict,
 	struct ttm_resource *old_mem = &bo->mem;
 	int r;
 
+	radeon_bo_move_notify(bo, evict, new_mem);
+
 	r = ttm_bo_wait_ctx(bo, ctx);
 	if (r)
-		return r;
+		goto fail;
 
 	/* Can't move a pinned BO */
 	rbo = container_of(bo, struct radeon_bo, tbo);
@@ -359,13 +361,18 @@ static int radeon_bo_move(struct ttm_buffer_object *bo, bool evict,
 memcpy:
 		r = ttm_bo_move_memcpy(bo, ctx, new_mem);
 		if (r) {
-			return r;
+			goto fail;
 		}
 	}
 
 	/* update statistics */
 	atomic64_add((u64)bo->mem.num_pages << PAGE_SHIFT, &rdev->num_bytes_moved);
 	return 0;
+fail:
+	swap(*new_mem, bo->mem);
+	radeon_bo_move_notify(bo, false, new_mem);
+	swap(*new_mem, bo->mem);
+	return r;
 }
 
 static int radeon_ttm_io_mem_reserve(struct ttm_bo_device *bdev, struct ttm_resource *mem)
diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index 705ea3ef91f9..e8ac3bc45d95 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -263,19 +263,9 @@ static int ttm_bo_handle_move_mem(struct ttm_buffer_object *bo,
 		}
 	}
 
-	if (bdev->driver->move_notify)
-		bdev->driver->move_notify(bo, evict, mem);
-
 	ret = bdev->driver->move(bo, evict, ctx, mem);
-	if (ret) {
-		if (bdev->driver->move_notify) {
-			swap(*mem, bo->mem);
-			bdev->driver->move_notify(bo, false, mem);
-			swap(*mem, bo->mem);
-		}
-
+	if (ret)
 		goto out_err;
-	}
 
 	ctx->bytes_moved += bo->mem.num_pages << PAGE_SHIFT;
 	return 0;
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c b/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
index 6e07ea982961..fd82c9ba2d77 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
@@ -737,6 +737,8 @@ static int vmw_move(struct ttm_buffer_object *bo,
 	struct ttm_resource_manager *new_man = ttm_manager_type(bo->bdev, new_mem->mem_type);
 	int ret;
 
+	vmw_move_notify(bo, evict, new_mem);
+
 	if (old_man->use_tt && new_man->use_tt) {
 		if (bo->mem.mem_type == TTM_PL_SYSTEM) {
 			ttm_bo_assign_mem(bo, new_mem);
@@ -744,15 +746,23 @@ static int vmw_move(struct ttm_buffer_object *bo,
 		}
 		ret = ttm_bo_wait_ctx(bo, ctx);
 		if (ret)
-			return ret;
+			goto fail;
 
 		vmw_ttm_unbind(bo->bdev, bo->ttm);
 		ttm_resource_free(bo, &bo->mem);
 		ttm_bo_assign_mem(bo, new_mem);
 		return 0;
 	} else {
-		return ttm_bo_move_memcpy(bo, ctx, new_mem);
+		ret = ttm_bo_move_memcpy(bo, ctx, new_mem);
+		if (ret)
+			goto fail;
 	}
+	return 0;
+fail:
+	swap(*new_mem, bo->mem);
+	vmw_move_notify(bo, false, new_mem);
+	swap(*new_mem, bo->mem);
+	return ret;
 }
 
 struct ttm_bo_driver vmw_bo_driver = {
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
