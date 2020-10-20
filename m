Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B964293293
	for <lists+dri-devel@lfdr.de>; Tue, 20 Oct 2020 03:03:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DC536EE55;
	Tue, 20 Oct 2020 01:03:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-44.mimecast.com
 (us-smtp-delivery-44.mimecast.com [207.211.30.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0D986EE53
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Oct 2020 01:03:33 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-17-AK3KWP6_NcirHQIDRaKj2A-1; Mon, 19 Oct 2020 21:03:28 -0400
X-MC-Unique: AK3KWP6_NcirHQIDRaKj2A-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 901FA8049C8;
 Tue, 20 Oct 2020 01:03:27 +0000 (UTC)
Received: from tyrion-bne-redhat-com.redhat.com (vpn2-54-180.bne.redhat.com
 [10.64.54.180])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CA9D555775;
 Tue, 20 Oct 2020 01:03:26 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 4/7] drm/ttm: drop unbind callback.
Date: Tue, 20 Oct 2020 11:03:16 +1000
Message-Id: <20201020010319.1692445-5-airlied@gmail.com>
In-Reply-To: <20201020010319.1692445-1-airlied@gmail.com>
References: <20201020010319.1692445-1-airlied@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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

The drivers now control this, so drop unbinding.

Signed-off-by: Dave Airlie <airlied@redhat.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c    |  1 -
 drivers/gpu/drm/nouveau/nouveau_bo.c       |  1 -
 drivers/gpu/drm/qxl/qxl_ttm.c              |  7 -------
 drivers/gpu/drm/radeon/radeon_ttm.c        |  1 -
 drivers/gpu/drm/ttm/ttm_bo.c               |  5 -----
 drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c |  1 -
 include/drm/ttm/ttm_bo_driver.h            | 18 ------------------
 7 files changed, 34 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index fcec99aea019..ac93a537f2e2 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -1722,7 +1722,6 @@ static struct ttm_bo_driver amdgpu_bo_driver = {
 	.ttm_tt_populate = &amdgpu_ttm_tt_populate,
 	.ttm_tt_unpopulate = &amdgpu_ttm_tt_unpopulate,
 	.ttm_tt_bind = &amdgpu_ttm_backend_bind,
-	.ttm_tt_unbind = &amdgpu_ttm_backend_unbind,
 	.ttm_tt_destroy = &amdgpu_ttm_backend_destroy,
 	.eviction_valuable = amdgpu_ttm_bo_eviction_valuable,
 	.evict_flags = &amdgpu_evict_flags,
diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
index c58c8951f72f..7fb65b87f815 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
@@ -1394,7 +1394,6 @@ struct ttm_bo_driver nouveau_bo_driver = {
 	.ttm_tt_populate = &nouveau_ttm_tt_populate,
 	.ttm_tt_unpopulate = &nouveau_ttm_tt_unpopulate,
 	.ttm_tt_bind = &nouveau_ttm_tt_bind,
-	.ttm_tt_unbind = &nouveau_ttm_tt_unbind,
 	.ttm_tt_destroy = &nouveau_ttm_tt_destroy,
 	.eviction_valuable = ttm_bo_eviction_valuable,
 	.evict_flags = nouveau_bo_evict_flags,
diff --git a/drivers/gpu/drm/qxl/qxl_ttm.c b/drivers/gpu/drm/qxl/qxl_ttm.c
index e3ed20215f18..95c4f2c7ab79 100644
--- a/drivers/gpu/drm/qxl/qxl_ttm.c
+++ b/drivers/gpu/drm/qxl/qxl_ttm.c
@@ -113,12 +113,6 @@ static int qxl_ttm_backend_bind(struct ttm_bo_device *bdev,
 	return -1;
 }
 
-static void qxl_ttm_backend_unbind(struct ttm_bo_device *bdev,
-				   struct ttm_tt *ttm)
-{
-	/* Not implemented */
-}
-
 static void qxl_ttm_backend_destroy(struct ttm_bo_device *bdev,
 				    struct ttm_tt *ttm)
 {
@@ -180,7 +174,6 @@ static struct ttm_bo_driver qxl_bo_driver = {
 	.ttm_tt_create = &qxl_ttm_tt_create,
 	.ttm_tt_bind = &qxl_ttm_backend_bind,
 	.ttm_tt_destroy = &qxl_ttm_backend_destroy,
-	.ttm_tt_unbind = &qxl_ttm_backend_unbind,
 	.eviction_valuable = ttm_bo_eviction_valuable,
 	.evict_flags = &qxl_evict_flags,
 	.move = &qxl_bo_move,
diff --git a/drivers/gpu/drm/radeon/radeon_ttm.c b/drivers/gpu/drm/radeon/radeon_ttm.c
index d3d39823b69f..7fe4a98ece54 100644
--- a/drivers/gpu/drm/radeon/radeon_ttm.c
+++ b/drivers/gpu/drm/radeon/radeon_ttm.c
@@ -817,7 +817,6 @@ static struct ttm_bo_driver radeon_bo_driver = {
 	.ttm_tt_populate = &radeon_ttm_tt_populate,
 	.ttm_tt_unpopulate = &radeon_ttm_tt_unpopulate,
 	.ttm_tt_bind = &radeon_ttm_tt_bind,
-	.ttm_tt_unbind = &radeon_ttm_tt_unbind,
 	.ttm_tt_destroy = &radeon_ttm_tt_destroy,
 	.eviction_valuable = ttm_bo_eviction_valuable,
 	.evict_flags = &radeon_evict_flags,
diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index 7602d7734d38..358d09ef852a 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -1493,8 +1493,3 @@ int ttm_bo_tt_bind(struct ttm_buffer_object *bo, struct ttm_resource *mem)
 {
 	return bo->bdev->driver->ttm_tt_bind(bo->bdev, bo->ttm, mem);
 }
-
-void ttm_bo_tt_unbind(struct ttm_buffer_object *bo)
-{
-	bo->bdev->driver->ttm_tt_unbind(bo->bdev, bo->ttm);
-}
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c b/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
index 1d220a9794e6..6e07ea982961 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
@@ -760,7 +760,6 @@ struct ttm_bo_driver vmw_bo_driver = {
 	.ttm_tt_populate = &vmw_ttm_populate,
 	.ttm_tt_unpopulate = &vmw_ttm_unpopulate,
 	.ttm_tt_bind = &vmw_ttm_bind,
-	.ttm_tt_unbind = &vmw_ttm_unbind,
 	.ttm_tt_destroy = &vmw_ttm_destroy,
 	.eviction_valuable = ttm_bo_eviction_valuable,
 	.evict_flags = vmw_evict_flags,
diff --git a/include/drm/ttm/ttm_bo_driver.h b/include/drm/ttm/ttm_bo_driver.h
index 81a1618b9535..fbbcf10670c1 100644
--- a/include/drm/ttm/ttm_bo_driver.h
+++ b/include/drm/ttm/ttm_bo_driver.h
@@ -104,17 +104,6 @@ struct ttm_bo_driver {
 	 */
 	int (*ttm_tt_bind)(struct ttm_bo_device *bdev, struct ttm_tt *ttm, struct ttm_resource *bo_mem);
 
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
@@ -647,13 +636,6 @@ pgprot_t ttm_io_prot(struct ttm_buffer_object *bo, struct ttm_resource *res,
  */
 int ttm_bo_tt_bind(struct ttm_buffer_object *bo, struct ttm_resource *mem);
 
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
