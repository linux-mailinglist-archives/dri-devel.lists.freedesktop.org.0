Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1615029476F
	for <lists+dri-devel@lfdr.de>; Wed, 21 Oct 2020 06:40:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82FA96E877;
	Wed, 21 Oct 2020 04:40:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-44.mimecast.com
 (us-smtp-delivery-44.mimecast.com [207.211.30.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 605A16E877
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Oct 2020 04:40:43 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-121-cS7QdOMOOu-YflLXMs5Ekw-1; Wed, 21 Oct 2020 00:40:36 -0400
X-MC-Unique: cS7QdOMOOu-YflLXMs5Ekw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D5D3F1006C96;
 Wed, 21 Oct 2020 04:40:35 +0000 (UTC)
Received: from tyrion-bne-redhat-com.redhat.com (vpn2-54-180.bne.redhat.com
 [10.64.54.180])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1873A27C29;
 Wed, 21 Oct 2020 04:40:34 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/3] drm/ttm: replace last move_notify with delete_mem_notify
Date: Wed, 21 Oct 2020 14:40:29 +1000
Message-Id: <20201021044031.1752624-2-airlied@gmail.com>
In-Reply-To: <20201021044031.1752624-1-airlied@gmail.com>
References: <20201021044031.1752624-1-airlied@gmail.com>
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
Cc: christian.koenig@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Dave Airlie <airlied@redhat.com>

The move notify callback is only used in one place, this should
be removed in the future, but for now just rename it to the use
case which is to notify the driver that the GPU memory is to be
deleted.

Drivers can be cleaned up after this separately.

Signed-off-by: Dave Airlie <airlied@redhat.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c    |  8 +++++++-
 drivers/gpu/drm/drm_gem_vram_helper.c      |  8 +++-----
 drivers/gpu/drm/nouveau/nouveau_bo.c       |  8 +++++++-
 drivers/gpu/drm/qxl/qxl_ttm.c              |  7 ++++++-
 drivers/gpu/drm/radeon/radeon_ttm.c        |  8 +++++++-
 drivers/gpu/drm/ttm/ttm_bo.c               |  4 ++--
 drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c |  8 +++++++-
 include/drm/ttm/ttm_bo_driver.h            | 10 ++--------
 8 files changed, 41 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index 87e10a212b8a..62f9194b1dd1 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -1730,6 +1730,12 @@ static int amdgpu_ttm_access_memory(struct ttm_buffer_object *bo,
 	return ret;
 }
 
+static void
+amdgpu_bo_delete_mem_notify(struct ttm_buffer_object *bo)
+{
+	amdgpu_bo_move_notify(bo, false, NULL);
+}
+
 static struct ttm_bo_driver amdgpu_bo_driver = {
 	.ttm_tt_create = &amdgpu_ttm_tt_create,
 	.ttm_tt_populate = &amdgpu_ttm_tt_populate,
@@ -1739,7 +1745,7 @@ static struct ttm_bo_driver amdgpu_bo_driver = {
 	.evict_flags = &amdgpu_evict_flags,
 	.move = &amdgpu_bo_move,
 	.verify_access = &amdgpu_verify_access,
-	.move_notify = &amdgpu_bo_move_notify,
+	.delete_mem_notify = &amdgpu_bo_delete_mem_notify,
 	.release_notify = &amdgpu_bo_release_notify,
 	.io_mem_reserve = &amdgpu_ttm_io_mem_reserve,
 	.io_mem_pfn = amdgpu_ttm_io_mem_pfn,
diff --git a/drivers/gpu/drm/drm_gem_vram_helper.c b/drivers/gpu/drm/drm_gem_vram_helper.c
index 19087b22bdbb..9da823eb0edd 100644
--- a/drivers/gpu/drm/drm_gem_vram_helper.c
+++ b/drivers/gpu/drm/drm_gem_vram_helper.c
@@ -949,9 +949,7 @@ static void bo_driver_evict_flags(struct ttm_buffer_object *bo,
 	drm_gem_vram_bo_driver_evict_flags(gbo, placement);
 }
 
-static void bo_driver_move_notify(struct ttm_buffer_object *bo,
-				  bool evict,
-				  struct ttm_resource *new_mem)
+static void bo_driver_delete_mem_notify(struct ttm_buffer_object *bo)
 {
 	struct drm_gem_vram_object *gbo;
 
@@ -961,7 +959,7 @@ static void bo_driver_move_notify(struct ttm_buffer_object *bo,
 
 	gbo = drm_gem_vram_of_bo(bo);
 
-	drm_gem_vram_bo_driver_move_notify(gbo, evict, new_mem);
+	drm_gem_vram_bo_driver_move_notify(gbo, false, NULL);
 }
 
 static int bo_driver_move(struct ttm_buffer_object *bo,
@@ -1002,7 +1000,7 @@ static struct ttm_bo_driver bo_driver = {
 	.eviction_valuable = ttm_bo_eviction_valuable,
 	.evict_flags = bo_driver_evict_flags,
 	.move = bo_driver_move,
-	.move_notify = bo_driver_move_notify,
+	.delete_mem_notify = bo_driver_delete_mem_notify,
 	.io_mem_reserve = bo_driver_io_mem_reserve,
 };
 
diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
index 70b6f3b1ae85..acff82afe260 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
@@ -1401,6 +1401,12 @@ nouveau_bo_fence(struct nouveau_bo *nvbo, struct nouveau_fence *fence, bool excl
 		dma_resv_add_shared_fence(resv, &fence->base);
 }
 
+static void
+nouveau_bo_delete_mem_notify(struct ttm_buffer_object *bo)
+{
+	nouveau_bo_move_ntfy(bo, false, NULL);
+}
+
 struct ttm_bo_driver nouveau_bo_driver = {
 	.ttm_tt_create = &nouveau_ttm_tt_create,
 	.ttm_tt_populate = &nouveau_ttm_tt_populate,
@@ -1408,7 +1414,7 @@ struct ttm_bo_driver nouveau_bo_driver = {
 	.ttm_tt_destroy = &nouveau_ttm_tt_destroy,
 	.eviction_valuable = ttm_bo_eviction_valuable,
 	.evict_flags = nouveau_bo_evict_flags,
-	.move_notify = nouveau_bo_move_ntfy,
+	.delete_mem_notify = nouveau_bo_delete_mem_notify,
 	.move = nouveau_bo_move,
 	.verify_access = nouveau_bo_verify_access,
 	.io_mem_reserve = &nouveau_ttm_io_mem_reserve,
diff --git a/drivers/gpu/drm/qxl/qxl_ttm.c b/drivers/gpu/drm/qxl/qxl_ttm.c
index 1cc3c14bc684..b52a4563b47b 100644
--- a/drivers/gpu/drm/qxl/qxl_ttm.c
+++ b/drivers/gpu/drm/qxl/qxl_ttm.c
@@ -166,6 +166,11 @@ static int qxl_bo_move(struct ttm_buffer_object *bo, bool evict,
 	return ret;
 }
 
+static void qxl_bo_delete_mem_notify(struct ttm_buffer_object *bo)
+{
+	qxl_bo_move_notify(bo, false, NULL);
+}
+
 static struct ttm_bo_driver qxl_bo_driver = {
 	.ttm_tt_create = &qxl_ttm_tt_create,
 	.ttm_tt_destroy = &qxl_ttm_backend_destroy,
@@ -173,7 +178,7 @@ static struct ttm_bo_driver qxl_bo_driver = {
 	.evict_flags = &qxl_evict_flags,
 	.move = &qxl_bo_move,
 	.io_mem_reserve = &qxl_ttm_io_mem_reserve,
-	.move_notify = &qxl_bo_move_notify,
+	.delete_mem_notify = &qxl_bo_delete_mem_notify,
 };
 
 static int qxl_ttm_init_mem_type(struct qxl_device *qdev,
diff --git a/drivers/gpu/drm/radeon/radeon_ttm.c b/drivers/gpu/drm/radeon/radeon_ttm.c
index cd454e5c802f..321c09d20c6c 100644
--- a/drivers/gpu/drm/radeon/radeon_ttm.c
+++ b/drivers/gpu/drm/radeon/radeon_ttm.c
@@ -824,6 +824,12 @@ bool radeon_ttm_tt_is_readonly(struct radeon_device *rdev,
 	return !!(gtt->userflags & RADEON_GEM_USERPTR_READONLY);
 }
 
+static void
+radeon_bo_delete_mem_notify(struct ttm_buffer_object *bo)
+{
+	radeon_bo_move_notify(bo, false, NULL);
+}
+
 static struct ttm_bo_driver radeon_bo_driver = {
 	.ttm_tt_create = &radeon_ttm_tt_create,
 	.ttm_tt_populate = &radeon_ttm_tt_populate,
@@ -833,7 +839,7 @@ static struct ttm_bo_driver radeon_bo_driver = {
 	.evict_flags = &radeon_evict_flags,
 	.move = &radeon_bo_move,
 	.verify_access = &radeon_verify_access,
-	.move_notify = &radeon_bo_move_notify,
+	.delete_mem_notify = &radeon_bo_delete_mem_notify,
 	.io_mem_reserve = &radeon_ttm_io_mem_reserve,
 };
 
diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index 2b578012cdef..e2afab3d97ee 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -284,8 +284,8 @@ static int ttm_bo_handle_move_mem(struct ttm_buffer_object *bo,
 
 static void ttm_bo_cleanup_memtype_use(struct ttm_buffer_object *bo)
 {
-	if (bo->bdev->driver->move_notify)
-		bo->bdev->driver->move_notify(bo, false, NULL);
+	if (bo->bdev->driver->delete_mem_notify)
+		bo->bdev->driver->delete_mem_notify(bo);
 
 	ttm_bo_tt_destroy(bo);
 	ttm_resource_free(bo, &bo->mem);
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c b/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
index de25cf016be2..88be48ad0344 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
@@ -771,6 +771,12 @@ static int vmw_move(struct ttm_buffer_object *bo,
 	return ret;
 }
 
+static void
+vmw_delete_mem_notify(struct ttm_buffer_object *bo)
+{
+	vmw_move_notify(bo, false, NULL);
+}
+
 struct ttm_bo_driver vmw_bo_driver = {
 	.ttm_tt_create = &vmw_ttm_tt_create,
 	.ttm_tt_populate = &vmw_ttm_populate,
@@ -780,7 +786,7 @@ struct ttm_bo_driver vmw_bo_driver = {
 	.evict_flags = vmw_evict_flags,
 	.move = vmw_move,
 	.verify_access = vmw_verify_access,
-	.move_notify = vmw_move_notify,
+	.delete_mem_notify = vmw_delete_mem_notify,
 	.swap_notify = vmw_swap_notify,
 	.io_mem_reserve = &vmw_ttm_io_mem_reserve,
 };
diff --git a/include/drm/ttm/ttm_bo_driver.h b/include/drm/ttm/ttm_bo_driver.h
index 72f106b335e9..29f6a1d1c853 100644
--- a/include/drm/ttm/ttm_bo_driver.h
+++ b/include/drm/ttm/ttm_bo_driver.h
@@ -156,15 +156,9 @@ struct ttm_bo_driver {
 			     struct file *filp);
 
 	/**
-	 * Hook to notify driver about a driver move so it
-	 * can do tiling things and book-keeping.
-	 *
-	 * @evict: whether this move is evicting the buffer from the graphics
-	 * address space
+	 * Hook to notify driver about a resource delete.
 	 */
-	void (*move_notify)(struct ttm_buffer_object *bo,
-			    bool evict,
-			    struct ttm_resource *new_mem);
+	void (*delete_mem_notify)(struct ttm_buffer_object *bo);
 
 	/**
 	 * notify the driver that we're about to swap out this bo
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
