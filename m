Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 00D6A293296
	for <lists+dri-devel@lfdr.de>; Tue, 20 Oct 2020 03:03:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 066A86EE5C;
	Tue, 20 Oct 2020 01:03:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-44.mimecast.com
 (us-smtp-delivery-44.mimecast.com [207.211.30.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 471AB6EE56
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Oct 2020 01:03:35 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-165-hsLe6FE_OJW0tO1iESU-ug-1; Mon, 19 Oct 2020 21:03:32 -0400
X-MC-Unique: hsLe6FE_OJW0tO1iESU-ug-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EC38510E2180;
 Tue, 20 Oct 2020 01:03:30 +0000 (UTC)
Received: from tyrion-bne-redhat-com.redhat.com (vpn2-54-180.bne.redhat.com
 [10.64.54.180])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3147355775;
 Tue, 20 Oct 2020 01:03:30 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 7/7] drm/ttm: move last binding into the drivers.
Date: Tue, 20 Oct 2020 11:03:19 +1000
Message-Id: <20201020010319.1692445-8-airlied@gmail.com>
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

This moves the call to tt binding into the driver move,
and drops the driver callback.

Signed-off-by: Dave Airlie <airlied@redhat.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c    |  7 ++++++-
 drivers/gpu/drm/nouveau/nouveau_bo.c       |  7 ++++++-
 drivers/gpu/drm/qxl/qxl_ttm.c              | 14 --------------
 drivers/gpu/drm/radeon/radeon_ttm.c        |  6 +++++-
 drivers/gpu/drm/ttm/ttm_bo.c               |  4 ----
 drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c |  7 ++++++-
 include/drm/ttm/ttm_bo_driver.h            | 14 --------------
 7 files changed, 23 insertions(+), 36 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index 9aba34b57e60..d1d1bd656153 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -666,6 +666,12 @@ static int amdgpu_bo_move(struct ttm_buffer_object *bo, bool evict,
 	struct ttm_resource *old_mem = &bo->mem;
 	int r;
 
+	if (new_mem->mem_type == TTM_PL_TT) {
+		r = amdgpu_ttm_backend_bind(bo->bdev, bo->ttm, new_mem);
+		if (r)
+			return r;
+	}
+
 	amdgpu_bo_move_notify(bo, evict, new_mem);
 
 	/* Can't move a pinned BO */
@@ -1728,7 +1734,6 @@ static struct ttm_bo_driver amdgpu_bo_driver = {
 	.ttm_tt_create = &amdgpu_ttm_tt_create,
 	.ttm_tt_populate = &amdgpu_ttm_tt_populate,
 	.ttm_tt_unpopulate = &amdgpu_ttm_tt_unpopulate,
-	.ttm_tt_bind = &amdgpu_ttm_backend_bind,
 	.ttm_tt_destroy = &amdgpu_ttm_backend_destroy,
 	.eviction_valuable = amdgpu_ttm_bo_eviction_valuable,
 	.evict_flags = &amdgpu_evict_flags,
diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
index ad0493c5103b..a69bd4098984 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
@@ -1032,6 +1032,12 @@ nouveau_bo_move(struct ttm_buffer_object *bo, bool evict,
 	struct nouveau_drm_tile *new_tile = NULL;
 	int ret = 0;
 
+	if (new_reg->mem_type == TTM_PL_TT) {
+		ret = nouveau_ttm_tt_bind(bo->bdev, bo->ttm, new_reg);
+		if (ret)
+			return ret;
+	}
+
 	nouveau_bo_move_ntfy(bo, evict, new_reg);
 	ret = ttm_bo_wait_ctx(bo, ctx);
 	if (ret)
@@ -1399,7 +1405,6 @@ struct ttm_bo_driver nouveau_bo_driver = {
 	.ttm_tt_create = &nouveau_ttm_tt_create,
 	.ttm_tt_populate = &nouveau_ttm_tt_populate,
 	.ttm_tt_unpopulate = &nouveau_ttm_tt_unpopulate,
-	.ttm_tt_bind = &nouveau_ttm_tt_bind,
 	.ttm_tt_destroy = &nouveau_ttm_tt_destroy,
 	.eviction_valuable = ttm_bo_eviction_valuable,
 	.evict_flags = nouveau_bo_evict_flags,
diff --git a/drivers/gpu/drm/qxl/qxl_ttm.c b/drivers/gpu/drm/qxl/qxl_ttm.c
index a6149e3cc3d2..1cc3c14bc684 100644
--- a/drivers/gpu/drm/qxl/qxl_ttm.c
+++ b/drivers/gpu/drm/qxl/qxl_ttm.c
@@ -100,19 +100,6 @@ int qxl_ttm_io_mem_reserve(struct ttm_bo_device *bdev,
 /*
  * TTM backend functions.
  */
-
-static int qxl_ttm_backend_bind(struct ttm_bo_device *bdev,
-				struct ttm_tt *ttm,
-				struct ttm_resource *bo_mem)
-{
-	if (!ttm->num_pages) {
-		WARN(1, "nothing to bind %lu pages for mreg %p back %p!\n",
-		     ttm->num_pages, bo_mem, ttm);
-	}
-	/* Not implemented */
-	return -1;
-}
-
 static void qxl_ttm_backend_destroy(struct ttm_bo_device *bdev,
 				    struct ttm_tt *ttm)
 {
@@ -181,7 +168,6 @@ static int qxl_bo_move(struct ttm_buffer_object *bo, bool evict,
 
 static struct ttm_bo_driver qxl_bo_driver = {
 	.ttm_tt_create = &qxl_ttm_tt_create,
-	.ttm_tt_bind = &qxl_ttm_backend_bind,
 	.ttm_tt_destroy = &qxl_ttm_backend_destroy,
 	.eviction_valuable = ttm_bo_eviction_valuable,
 	.evict_flags = &qxl_evict_flags,
diff --git a/drivers/gpu/drm/radeon/radeon_ttm.c b/drivers/gpu/drm/radeon/radeon_ttm.c
index e427194b0b50..ac916fdd54d1 100644
--- a/drivers/gpu/drm/radeon/radeon_ttm.c
+++ b/drivers/gpu/drm/radeon/radeon_ttm.c
@@ -311,6 +311,11 @@ static int radeon_bo_move(struct ttm_buffer_object *bo, bool evict,
 	struct ttm_resource *old_mem = &bo->mem;
 	int r;
 
+	if (new_mem->mem_type == TTM_PL_TT) {
+		r = radeon_ttm_tt_bind(bo->bdev, bo->ttm, new_mem);
+		if (r)
+			return r;
+	}
 	radeon_bo_move_notify(bo, evict, new_mem);
 
 	r = ttm_bo_wait_ctx(bo, ctx);
@@ -823,7 +828,6 @@ static struct ttm_bo_driver radeon_bo_driver = {
 	.ttm_tt_create = &radeon_ttm_tt_create,
 	.ttm_tt_populate = &radeon_ttm_tt_populate,
 	.ttm_tt_unpopulate = &radeon_ttm_tt_unpopulate,
-	.ttm_tt_bind = &radeon_ttm_tt_bind,
 	.ttm_tt_destroy = &radeon_ttm_tt_destroy,
 	.eviction_valuable = ttm_bo_eviction_valuable,
 	.evict_flags = &radeon_evict_flags,
diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index e8ac3bc45d95..4b7fdb49df52 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -256,10 +256,6 @@ static int ttm_bo_handle_move_mem(struct ttm_buffer_object *bo,
 			ret = ttm_tt_populate(bo->bdev, bo->ttm, ctx);
 			if (ret)
 				goto out_err;
-
-			ret = bdev->driver->ttm_tt_bind(bo->bdev, bo->ttm, mem);
-			if (ret)
-				goto out_err;
 		}
 	}
 
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c b/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
index fd82c9ba2d77..de25cf016be2 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
@@ -737,6 +737,12 @@ static int vmw_move(struct ttm_buffer_object *bo,
 	struct ttm_resource_manager *new_man = ttm_manager_type(bo->bdev, new_mem->mem_type);
 	int ret;
 
+	if (new_man->use_tt && new_mem->mem_type != TTM_PL_SYSTEM) {
+		ret = vmw_ttm_bind(bo->bdev, bo->ttm, new_mem);
+		if (ret)
+			return ret;
+	}
+
 	vmw_move_notify(bo, evict, new_mem);
 
 	if (old_man->use_tt && new_man->use_tt) {
@@ -769,7 +775,6 @@ struct ttm_bo_driver vmw_bo_driver = {
 	.ttm_tt_create = &vmw_ttm_tt_create,
 	.ttm_tt_populate = &vmw_ttm_populate,
 	.ttm_tt_unpopulate = &vmw_ttm_unpopulate,
-	.ttm_tt_bind = &vmw_ttm_bind,
 	.ttm_tt_destroy = &vmw_ttm_destroy,
 	.eviction_valuable = ttm_bo_eviction_valuable,
 	.evict_flags = vmw_evict_flags,
diff --git a/include/drm/ttm/ttm_bo_driver.h b/include/drm/ttm/ttm_bo_driver.h
index 0c4efc169f46..72f106b335e9 100644
--- a/include/drm/ttm/ttm_bo_driver.h
+++ b/include/drm/ttm/ttm_bo_driver.h
@@ -90,20 +90,6 @@ struct ttm_bo_driver {
 	 */
 	void (*ttm_tt_unpopulate)(struct ttm_bo_device *bdev, struct ttm_tt *ttm);
 
-	/**
-	 * ttm_tt_bind
-	 *
-	 * @bdev: Pointer to a ttm device
-	 * @ttm: Pointer to a struct ttm_tt.
-	 * @bo_mem: Pointer to a struct ttm_resource describing the
-	 * memory type and location for binding.
-	 *
-	 * Bind the backend pages into the aperture in the location
-	 * indicated by @bo_mem. This function should be able to handle
-	 * differences between aperture and system page sizes.
-	 */
-	int (*ttm_tt_bind)(struct ttm_bo_device *bdev, struct ttm_tt *ttm, struct ttm_resource *bo_mem);
-
 	/**
 	 * ttm_tt_destroy
 	 *
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
