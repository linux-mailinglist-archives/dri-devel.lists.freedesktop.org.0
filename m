Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 19B0E26D2B4
	for <lists+dri-devel@lfdr.de>; Thu, 17 Sep 2020 06:37:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24F8C6E046;
	Thu, 17 Sep 2020 04:37:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 371 seconds by postgrey-1.36 at gabe;
 Thu, 17 Sep 2020 04:37:04 UTC
Received: from us-smtp-delivery-44.mimecast.com
 (us-smtp-delivery-44.mimecast.com [205.139.111.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E70ED6E0AD
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Sep 2020 04:37:04 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-94-unTkQg-NNhyGt8OhnF_ihw-1; Thu, 17 Sep 2020 00:30:47 -0400
X-MC-Unique: unTkQg-NNhyGt8OhnF_ihw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 68282186DD27;
 Thu, 17 Sep 2020 04:30:46 +0000 (UTC)
Received: from tyrion-bne-redhat-com.redhat.com (vpn2-54-25.bne.redhat.com
 [10.64.54.25])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A06E619D61;
 Thu, 17 Sep 2020 04:30:45 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/7] drm/ttm: flip tt destroy ordering.
Date: Thu, 17 Sep 2020 14:30:35 +1000
Message-Id: <20200917043040.146575-3-airlied@gmail.com>
In-Reply-To: <20200917043040.146575-1-airlied@gmail.com>
References: <20200917043040.146575-1-airlied@gmail.com>
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

Call the driver first and have it call the common code cleanup.

This is useful later to fix unbind.

Signed-off-by: Dave Airlie <airlied@redhat.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c    | 1 +
 drivers/gpu/drm/drm_gem_vram_helper.c      | 1 +
 drivers/gpu/drm/nouveau/nouveau_bo.c       | 1 +
 drivers/gpu/drm/nouveau/nouveau_sgdma.c    | 1 +
 drivers/gpu/drm/qxl/qxl_ttm.c              | 1 +
 drivers/gpu/drm/radeon/radeon_ttm.c        | 3 +++
 drivers/gpu/drm/ttm/ttm_tt.c               | 7 ++++++-
 drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c | 1 +
 include/drm/ttm/ttm_tt.h                   | 7 +++++++
 9 files changed, 22 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index 2851cf30091a..dbe3f90a0cf6 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -1267,6 +1267,7 @@ static void amdgpu_ttm_backend_destroy(struct ttm_bo_device *bdev,
 {
 	struct amdgpu_ttm_tt *gtt = (void *)ttm;
 
+	ttm_tt_destroy_common(bdev, ttm);
 	if (gtt->usertask)
 		put_task_struct(gtt->usertask);
 
diff --git a/drivers/gpu/drm/drm_gem_vram_helper.c b/drivers/gpu/drm/drm_gem_vram_helper.c
index f96321509d7e..50cad0e4a92e 100644
--- a/drivers/gpu/drm/drm_gem_vram_helper.c
+++ b/drivers/gpu/drm/drm_gem_vram_helper.c
@@ -922,6 +922,7 @@ static const struct drm_gem_object_funcs drm_gem_vram_object_funcs = {
 
 static void bo_driver_ttm_tt_destroy(struct ttm_bo_device *bdev, struct ttm_tt *tt)
 {
+	ttm_tt_destroy_common(bdev, tt);
 	ttm_tt_fini(tt);
 	kfree(tt);
 }
diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
index 616d8844ba97..b239381498c3 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
@@ -1372,6 +1372,7 @@ nouveau_ttm_tt_destroy(struct ttm_bo_device *bdev,
 #if IS_ENABLED(CONFIG_AGP)
 	struct nouveau_drm *drm = nouveau_bdev(bdev);
 	if (drm->agp.bridge) {
+		ttm_tt_destroy_common(bdev, ttm);
 		ttm_agp_destroy(ttm);
 		return;
 	}
diff --git a/drivers/gpu/drm/nouveau/nouveau_sgdma.c b/drivers/gpu/drm/nouveau/nouveau_sgdma.c
index 21fb92770ea2..0dfaa6fb536e 100644
--- a/drivers/gpu/drm/nouveau/nouveau_sgdma.c
+++ b/drivers/gpu/drm/nouveau/nouveau_sgdma.c
@@ -20,6 +20,7 @@ nouveau_sgdma_destroy(struct ttm_bo_device *bdev, struct ttm_tt *ttm)
 	struct nouveau_sgdma_be *nvbe = (struct nouveau_sgdma_be *)ttm;
 
 	if (ttm) {
+		ttm_tt_destroy_common(bdev, ttm);
 		ttm_dma_tt_fini(&nvbe->ttm);
 		kfree(nvbe);
 	}
diff --git a/drivers/gpu/drm/qxl/qxl_ttm.c b/drivers/gpu/drm/qxl/qxl_ttm.c
index bf3b091d0e2a..fd691fff8394 100644
--- a/drivers/gpu/drm/qxl/qxl_ttm.c
+++ b/drivers/gpu/drm/qxl/qxl_ttm.c
@@ -130,6 +130,7 @@ static void qxl_ttm_backend_destroy(struct ttm_bo_device *bdev,
 {
 	struct qxl_ttm_tt *gtt = (void *)ttm;
 
+	ttm_tt_destroy_common(bdev, ttm);
 	ttm_tt_fini(&gtt->ttm);
 	kfree(gtt);
 }
diff --git a/drivers/gpu/drm/radeon/radeon_ttm.c b/drivers/gpu/drm/radeon/radeon_ttm.c
index fc8bbca28b34..76e24c6058ff 100644
--- a/drivers/gpu/drm/radeon/radeon_ttm.c
+++ b/drivers/gpu/drm/radeon/radeon_ttm.c
@@ -576,6 +576,8 @@ static void radeon_ttm_backend_destroy(struct ttm_bo_device *bdev, struct ttm_tt
 {
 	struct radeon_ttm_tt *gtt = (void *)ttm;
 
+	ttm_tt_destroy_common(bdev, ttm);
+
 	ttm_dma_tt_fini(&gtt->ttm);
 	kfree(gtt);
 }
@@ -755,6 +757,7 @@ static void radeon_ttm_tt_destroy(struct ttm_bo_device *bdev,
 	struct radeon_device *rdev = radeon_get_rdev(bdev);
 
 	if (rdev->flags & RADEON_IS_AGP) {
+		ttm_tt_destroy_common(bdev, ttm);
 		ttm_agp_destroy(ttm);
 		return;
 	}
diff --git a/drivers/gpu/drm/ttm/ttm_tt.c b/drivers/gpu/drm/ttm/ttm_tt.c
index a4f0296effac..f43fa69a1e65 100644
--- a/drivers/gpu/drm/ttm/ttm_tt.c
+++ b/drivers/gpu/drm/ttm/ttm_tt.c
@@ -207,7 +207,7 @@ int ttm_tt_set_placement_caching(struct ttm_tt *ttm, uint32_t placement)
 }
 EXPORT_SYMBOL(ttm_tt_set_placement_caching);
 
-void ttm_tt_destroy(struct ttm_bo_device *bdev, struct ttm_tt *ttm)
+void ttm_tt_destroy_common(struct ttm_bo_device *bdev, struct ttm_tt *ttm)
 {
 	ttm_tt_unpopulate(bdev, ttm);
 
@@ -216,6 +216,11 @@ void ttm_tt_destroy(struct ttm_bo_device *bdev, struct ttm_tt *ttm)
 		fput(ttm->swap_storage);
 
 	ttm->swap_storage = NULL;
+}
+EXPORT_SYMBOL(ttm_tt_destroy_common);
+
+void ttm_tt_destroy(struct ttm_bo_device *bdev, struct ttm_tt *ttm)
+{
 	bdev->driver->ttm_tt_destroy(bdev, ttm);
 }
 
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c b/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
index 01146b27c9a1..d46426164577 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
@@ -636,6 +636,7 @@ static void vmw_ttm_destroy(struct ttm_bo_device *bdev, struct ttm_tt *ttm)
 	struct vmw_ttm_tt *vmw_be =
 		container_of(ttm, struct vmw_ttm_tt, dma_ttm.ttm);
 
+	ttm_tt_destroy_common(bdev, ttm);
 	vmw_ttm_unmap_dma(vmw_be);
 	if (vmw_be->dev_priv->map_mode == vmw_dma_alloc_coherent)
 		ttm_dma_tt_fini(&vmw_be->dma_ttm);
diff --git a/include/drm/ttm/ttm_tt.h b/include/drm/ttm/ttm_tt.h
index 4e906e32d08c..75208c0a0cac 100644
--- a/include/drm/ttm/ttm_tt.h
+++ b/include/drm/ttm/ttm_tt.h
@@ -155,6 +155,13 @@ void ttm_dma_tt_fini(struct ttm_dma_tt *ttm_dma);
  */
 void ttm_tt_destroy(struct ttm_bo_device *bdev, struct ttm_tt *ttm);
 
+/**
+ * ttm_tt_destroy_common:
+ *
+ * Called from driver to destroy common path.
+ */
+void ttm_tt_destroy_common(struct ttm_bo_device *bdev, struct ttm_tt *ttm);
+
 /**
  * ttm_tt_swapin:
  *
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
