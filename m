Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D14BD276841
	for <lists+dri-devel@lfdr.de>; Thu, 24 Sep 2020 07:19:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BA396EA81;
	Thu, 24 Sep 2020 05:19:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-44.mimecast.com
 (us-smtp-delivery-44.mimecast.com [207.211.30.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FC966EA7A
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Sep 2020 05:19:29 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-431-lUd52JFmPAqwmw8FGyy-_w-1; Thu, 24 Sep 2020 01:19:26 -0400
X-MC-Unique: lUd52JFmPAqwmw8FGyy-_w-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 071138030B8;
 Thu, 24 Sep 2020 05:19:25 +0000 (UTC)
Received: from tyrion-bne-redhat-com.redhat.com (vpn2-54-60.bne.redhat.com
 [10.64.54.60])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0D18A19652;
 Thu, 24 Sep 2020 05:19:23 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 26/45] drm/ttm: remove bind/unbind callbacks.
Date: Thu, 24 Sep 2020 15:18:26 +1000
Message-Id: <20200924051845.397177-27-airlied@gmail.com>
In-Reply-To: <20200924051845.397177-1-airlied@gmail.com>
References: <20200924051845.397177-1-airlied@gmail.com>
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
Cc: christian.koenig@amd.com, bskeggs@redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Dave Airlie <airlied@redhat.com>

If a driver wants to bind/unbind then it should implement a move
callback.

Signed-off-by: Dave Airlie <airlied@redhat.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c    |  8 +++--
 drivers/gpu/drm/nouveau/nouveau_bo.c       |  8 ++---
 drivers/gpu/drm/qxl/qxl_ttm.c              | 20 -----------
 drivers/gpu/drm/radeon/radeon_ttm.c        |  8 ++---
 drivers/gpu/drm/ttm/ttm_bo.c               | 17 ----------
 drivers/gpu/drm/ttm/ttm_bo_util.c          |  1 -
 drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c |  8 +++--
 include/drm/ttm/ttm_bo_driver.h            | 39 ----------------------
 8 files changed, 16 insertions(+), 93 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index 50362f56d2d0..a729bdcdd017 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -701,6 +701,7 @@ static int amdgpu_bo_move(struct ttm_buffer_object *bo, bool evict,
 		ttm_bo_move_null(bo, new_mem);
 		return 0;
 	}
+
 	if (old_mem->mem_type == TTM_PL_SYSTEM &&
 	    new_mem->mem_type == TTM_PL_TT) {
 		ttm_bo_move_null(bo, new_mem);
@@ -709,9 +710,12 @@ static int amdgpu_bo_move(struct ttm_buffer_object *bo, bool evict,
 
 	if (old_mem->mem_type == TTM_PL_TT &&
 	    new_mem->mem_type == TTM_PL_SYSTEM) {
-		r = ttm_bo_move_old_to_system(bo, ctx);
+		r = ttm_bo_wait_ctx(bo, ctx);
 		if (r)
 			return r;
+		amdgpu_ttm_backend_unbind(bo->bdev, bo->ttm);
+		ttm_resource_free(bo, &bo->mem);
+
 		r = ttm_tt_set_placement_caching(bo->ttm, new_mem->placement);
 		if (r)
 			return r;
@@ -1740,8 +1744,6 @@ static struct ttm_bo_driver amdgpu_bo_driver = {
 	.ttm_tt_create = &amdgpu_ttm_tt_create,
 	.ttm_tt_populate = &amdgpu_ttm_tt_populate,
 	.ttm_tt_unpopulate = &amdgpu_ttm_tt_unpopulate,
-	.ttm_tt_bind = &amdgpu_ttm_backend_bind,
-	.ttm_tt_unbind = &amdgpu_ttm_backend_unbind,
 	.ttm_tt_destroy = &amdgpu_ttm_backend_destroy,
 	.eviction_valuable = amdgpu_ttm_bo_eviction_valuable,
 	.evict_flags = &amdgpu_evict_flags,
diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
index fc0f9e9232db..cb2a0f1bf7ff 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
@@ -1107,9 +1107,9 @@ nouveau_bo_move(struct ttm_buffer_object *bo, bool evict,
 
 	if (old_reg->mem_type == TTM_PL_TT &&
 	    new_reg->mem_type == TTM_PL_SYSTEM) {
-		ret = ttm_bo_move_old_to_system(bo, ctx);
-		if (ret)
-			goto out;
+		nouveau_ttm_tt_unbind(bo->bdev, bo->ttm);
+		ttm_resource_free(bo, &bo->mem);
+
 		ret = ttm_tt_set_placement_caching(bo->ttm, new_reg->placement);
 		if (ret)
 			goto out;
@@ -1438,8 +1438,6 @@ struct ttm_bo_driver nouveau_bo_driver = {
 	.ttm_tt_create = &nouveau_ttm_tt_create,
 	.ttm_tt_populate = &nouveau_ttm_tt_populate,
 	.ttm_tt_unpopulate = &nouveau_ttm_tt_unpopulate,
-	.ttm_tt_bind = &nouveau_ttm_tt_bind,
-	.ttm_tt_unbind = &nouveau_ttm_tt_unbind,
 	.ttm_tt_destroy = &nouveau_ttm_tt_destroy,
 	.eviction_valuable = ttm_bo_eviction_valuable,
 	.evict_flags = nouveau_bo_evict_flags,
diff --git a/drivers/gpu/drm/qxl/qxl_ttm.c b/drivers/gpu/drm/qxl/qxl_ttm.c
index 378b6827b7a3..3bca5f8d8ac5 100644
--- a/drivers/gpu/drm/qxl/qxl_ttm.c
+++ b/drivers/gpu/drm/qxl/qxl_ttm.c
@@ -102,24 +102,6 @@ struct qxl_ttm_tt {
 	struct ttm_tt		        ttm;
 };
 
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
-static void qxl_ttm_backend_unbind(struct ttm_bo_device *bdev,
-				   struct ttm_tt *ttm)
-{
-	/* Not implemented */
-}
-
 static void qxl_ttm_backend_destroy(struct ttm_bo_device *bdev,
 				    struct ttm_tt *ttm)
 {
@@ -186,9 +168,7 @@ static void qxl_bo_move_notify(struct ttm_buffer_object *bo,
 
 static struct ttm_bo_driver qxl_bo_driver = {
 	.ttm_tt_create = &qxl_ttm_tt_create,
-	.ttm_tt_bind = &qxl_ttm_backend_bind,
 	.ttm_tt_destroy = &qxl_ttm_backend_destroy,
-	.ttm_tt_unbind = &qxl_ttm_backend_unbind,
 	.eviction_valuable = ttm_bo_eviction_valuable,
 	.evict_flags = &qxl_evict_flags,
 	.move = &qxl_bo_move,
diff --git a/drivers/gpu/drm/radeon/radeon_ttm.c b/drivers/gpu/drm/radeon/radeon_ttm.c
index 0ea20dc15cb2..496e7b1e14ad 100644
--- a/drivers/gpu/drm/radeon/radeon_ttm.c
+++ b/drivers/gpu/drm/radeon/radeon_ttm.c
@@ -354,9 +354,9 @@ static int radeon_bo_move(struct ttm_buffer_object *bo, bool evict,
 
 	if (old_mem->mem_type == TTM_PL_TT &&
 	    new_mem->mem_type == TTM_PL_SYSTEM) {
-		r = ttm_bo_move_old_to_system(bo, ctx);
-		if (r)
-			return r;
+		radeon_ttm_tt_unbind(bo->bdev, bo->ttm);
+		ttm_resource_free(bo, &bo->mem);
+
 		r = ttm_tt_set_placement_caching(bo->ttm, new_mem->placement);
 		if (r)
 			return r;
@@ -835,8 +835,6 @@ static struct ttm_bo_driver radeon_bo_driver = {
 	.ttm_tt_create = &radeon_ttm_tt_create,
 	.ttm_tt_populate = &radeon_ttm_tt_populate,
 	.ttm_tt_unpopulate = &radeon_ttm_tt_unpopulate,
-	.ttm_tt_bind = &radeon_ttm_tt_bind,
-	.ttm_tt_unbind = &radeon_ttm_tt_unbind,
 	.ttm_tt_destroy = &radeon_ttm_tt_destroy,
 	.eviction_valuable = ttm_bo_eviction_valuable,
 	.evict_flags = &radeon_evict_flags,
diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index 82ea0abb5070..a2a61a8d1394 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -255,13 +255,6 @@ static int ttm_bo_handle_move_mem(struct ttm_buffer_object *bo,
 		ret = ttm_bo_move_to_new_tt_mem(bo, ctx, mem);
 		if (ret)
 			goto out_err;
-
-		if (mem->mem_type != TTM_PL_SYSTEM) {
-			ret = ttm_bo_tt_bind(bo, mem);
-			if (ret)
-				goto out_err;
-		}
-
 	}
 
 	ret = bdev->driver->move(bo, evict, ctx, mem);
@@ -1548,13 +1541,3 @@ void ttm_bo_tt_destroy(struct ttm_buffer_object *bo)
 	ttm_tt_destroy(bo->bdev, bo->ttm);
 	bo->ttm = NULL;
 }
-
-int ttm_bo_tt_bind(struct ttm_buffer_object *bo, struct ttm_resource *mem)
-{
-	return bo->bdev->driver->ttm_tt_bind(bo->bdev, bo->ttm, mem);
-}
-
-void ttm_bo_tt_unbind(struct ttm_buffer_object *bo)
-{
-	bo->bdev->driver->ttm_tt_unbind(bo->bdev, bo->ttm);
-}
diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c b/drivers/gpu/drm/ttm/ttm_bo_util.c
index 4ceef9f7dce6..05768decb24c 100644
--- a/drivers/gpu/drm/ttm/ttm_bo_util.c
+++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
@@ -82,7 +82,6 @@ int ttm_bo_move_old_to_system(struct ttm_buffer_object *bo,
 		return ret;
 	}
 
-	ttm_bo_tt_unbind(bo);
 	ttm_resource_free(bo, &bo->mem);
 	old_mem->mem_type = TTM_PL_SYSTEM;
 	return 0;
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c b/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
index 0b8d5655e416..0ff8feac6ba4 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
@@ -742,10 +742,14 @@ static int vmw_move(struct ttm_buffer_object *bo,
 			ttm_bo_assign_mem(bo, new_mem);
 			return 0;
 		}
-		ret = ttm_bo_move_old_to_system(bo, ctx);
+
+		ret = ttm_bo_wait_ctx(bo, ctx);
 		if (ret)
 			return ret;
 
+		vmw_ttm_unbind(bo->bdev, bo->ttm);
+		ttm_resource_free(bo, &bo->mem);
+
 		ret = ttm_bo_move_to_new_tt_mem(bo, ctx, new_mem);
 		if (ret)
 			return ret;
@@ -763,8 +767,6 @@ struct ttm_bo_driver vmw_bo_driver = {
 	.ttm_tt_create = &vmw_ttm_tt_create,
 	.ttm_tt_populate = &vmw_ttm_populate,
 	.ttm_tt_unpopulate = &vmw_ttm_unpopulate,
-	.ttm_tt_bind = &vmw_ttm_bind,
-	.ttm_tt_unbind = &vmw_ttm_unbind,
 	.ttm_tt_destroy = &vmw_ttm_destroy,
 	.eviction_valuable = ttm_bo_eviction_valuable,
 	.evict_flags = vmw_evict_flags,
diff --git a/include/drm/ttm/ttm_bo_driver.h b/include/drm/ttm/ttm_bo_driver.h
index 58d2d3a5ed20..e400dbd2a143 100644
--- a/include/drm/ttm/ttm_bo_driver.h
+++ b/include/drm/ttm/ttm_bo_driver.h
@@ -90,31 +90,6 @@ struct ttm_bo_driver {
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
-	/**
-	 * ttm_tt_unbind
-	 *
-	 * @bdev: Pointer to a ttm device
-	 * @ttm: Pointer to a struct ttm_tt.
-	 *
-	 * Unbind previously bound backend pages. This function should be
-	 * able to handle differences between aperture and system page sizes.
-	 */
-	void (*ttm_tt_unbind)(struct ttm_bo_device *bdev, struct ttm_tt *ttm);
-
 	/**
 	 * ttm_tt_destroy
 	 *
@@ -652,20 +627,6 @@ int ttm_bo_pipeline_gutting(struct ttm_buffer_object *bo);
  */
 pgprot_t ttm_io_prot(uint32_t caching_flags, pgprot_t tmp);
 
-/**
- * ttm_bo_tt_bind
- *
- * Bind the object tt to a memory resource.
- */
-int ttm_bo_tt_bind(struct ttm_buffer_object *bo, struct ttm_resource *mem);
-
-/**
- * ttm_bo_tt_bind
- *
- * Unbind the object tt from a memory resource.
- */
-void ttm_bo_tt_unbind(struct ttm_buffer_object *bo);
-
 /**
  * ttm_bo_tt_destroy.
  */
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
