Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81FAA23B314
	for <lists+dri-devel@lfdr.de>; Tue,  4 Aug 2020 04:58:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE5AE6E406;
	Tue,  4 Aug 2020 02:58:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B7416E3FE
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Aug 2020 02:58:53 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-129-9-F3_pnYOn-j9CUv9xoJpg-1; Mon, 03 Aug 2020 22:58:50 -0400
X-MC-Unique: 9-F3_pnYOn-j9CUv9xoJpg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A3FAA80046B;
 Tue,  4 Aug 2020 02:58:49 +0000 (UTC)
Received: from tyrion-bne-redhat-com.redhat.com (vpn2-54-17.bne.redhat.com
 [10.64.54.17])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 064B78AD1C;
 Tue,  4 Aug 2020 02:58:47 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 53/59] drm/ttm: drop man->bdev link.
Date: Tue,  4 Aug 2020 12:56:26 +1000
Message-Id: <20200804025632.3868079-54-airlied@gmail.com>
In-Reply-To: <20200804025632.3868079-1-airlied@gmail.com>
References: <20200804025632.3868079-1-airlied@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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
Cc: sroland@vmware.com, christian.koenig@amd.com,
 linux-graphics-maintainer@vmware.com, bskeggs@redhat.com, kraxel@redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Dave Airlie <airlied@redhat.com>

This link isn't needed anymore, drop it from the init interface.

Signed-off-by: Dave Airlie <airlied@redhat.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c   | 2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c  | 2 +-
 drivers/gpu/drm/nouveau/nouveau_ttm.c         | 6 ++----
 drivers/gpu/drm/ttm/ttm_bo.c                  | 6 ++----
 drivers/gpu/drm/ttm/ttm_bo_manager.c          | 2 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_gmrid_manager.c | 2 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_thp.c           | 2 +-
 include/drm/ttm/ttm_bo_api.h                  | 6 ++----
 include/drm/ttm/ttm_bo_driver.h               | 2 --
 9 files changed, 11 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
index b664c5cb13ce..9fc3d876ed38 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
@@ -108,7 +108,7 @@ int amdgpu_gtt_mgr_init(struct amdgpu_device *adev, uint64_t gtt_size)
 	man->available_caching = TTM_PL_MASK_CACHING;
 	man->default_caching = TTM_PL_FLAG_CACHED;
 
-	ttm_mem_type_manager_init(&adev->mman.bdev, man, gtt_size >> PAGE_SHIFT);
+	ttm_mem_type_manager_init(man, gtt_size >> PAGE_SHIFT);
 
 	start = AMDGPU_GTT_MAX_TRANSFER_SIZE * AMDGPU_GTT_NUM_TRANSFER_WINDOWS;
 	size = (adev->gmc.gart_size >> PAGE_SHIFT) - start;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
index bbc528c0ed3e..684698cdf772 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
@@ -190,7 +190,7 @@ int amdgpu_vram_mgr_init(struct amdgpu_device *adev)
 	man->available_caching = TTM_PL_FLAG_UNCACHED | TTM_PL_FLAG_WC;
 	man->default_caching = TTM_PL_FLAG_WC;
 
-	ttm_mem_type_manager_init(&adev->mman.bdev, man, adev->gmc.real_vram_size >> PAGE_SHIFT);
+	ttm_mem_type_manager_init(man, adev->gmc.real_vram_size >> PAGE_SHIFT);
 
 	man->func = &amdgpu_vram_mgr_func;
 
diff --git a/drivers/gpu/drm/nouveau/nouveau_ttm.c b/drivers/gpu/drm/nouveau/nouveau_ttm.c
index 58d9bd708e95..d408e1485cce 100644
--- a/drivers/gpu/drm/nouveau/nouveau_ttm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_ttm.c
@@ -175,7 +175,7 @@ nouveau_ttm_init_vram(struct nouveau_drm *drm)
 		man->func = &nouveau_vram_manager;
 		man->use_io_reserve_lru = true;
 
-		ttm_mem_type_manager_init(&drm->ttm.bdev, man,
+		ttm_mem_type_manager_init(man,
 					  drm->gem.vram_available >> PAGE_SHIFT);
 		ttm_set_driver_manager(&drm->ttm.bdev, TTM_PL_VRAM, man);
 		ttm_mem_type_manager_set_used(man, true);
@@ -237,9 +237,7 @@ nouveau_ttm_init_gtt(struct nouveau_drm *drm)
 	man->available_caching = available_caching;
 	man->default_caching = default_caching;
 	man->use_tt = true;
-	ttm_mem_type_manager_init(&drm->ttm.bdev, man,
-				  size_pages);
-
+	ttm_mem_type_manager_init(man, size_pages);
 	ttm_set_driver_manager(&drm->ttm.bdev, TTM_PL_TT, man);
 	ttm_mem_type_manager_set_used(man, true);
 
diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index 3a3a4dfb0fff..78b72443a9ef 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -1471,8 +1471,7 @@ int ttm_bo_evict_mm(struct ttm_bo_device *bdev, unsigned mem_type)
 }
 EXPORT_SYMBOL(ttm_bo_evict_mm);
 
-void ttm_mem_type_manager_init(struct ttm_bo_device *bdev,
-			       struct ttm_mem_type_manager *man,
+void ttm_mem_type_manager_init(struct ttm_mem_type_manager *man,
 			       unsigned long p_size)
 {
 	unsigned i;
@@ -1482,7 +1481,6 @@ void ttm_mem_type_manager_init(struct ttm_bo_device *bdev,
 	mutex_init(&man->io_reserve_mutex);
 	spin_lock_init(&man->move_lock);
 	INIT_LIST_HEAD(&man->io_reserve_lru);
-	man->bdev = bdev;
 	man->size = p_size;
 
 	for (i = 0; i < TTM_MAX_BO_PRIORITY; ++i)
@@ -1595,7 +1593,7 @@ static void ttm_bo_init_sysman(struct ttm_bo_device *bdev)
 	man->available_caching = TTM_PL_MASK_CACHING;
 	man->default_caching = TTM_PL_FLAG_CACHED;
 
-	ttm_mem_type_manager_init(bdev, man, 0);
+	ttm_mem_type_manager_init(man, 0);
 	ttm_mem_type_manager_set_used(man, true);
 }
 
diff --git a/drivers/gpu/drm/ttm/ttm_bo_manager.c b/drivers/gpu/drm/ttm/ttm_bo_manager.c
index 01d41c6f2f7b..1b7245ce3356 100644
--- a/drivers/gpu/drm/ttm/ttm_bo_manager.c
+++ b/drivers/gpu/drm/ttm/ttm_bo_manager.c
@@ -133,7 +133,7 @@ int ttm_range_man_init(struct ttm_bo_device *bdev,
 
 	man->func = &ttm_bo_manager_func;
 
-	ttm_mem_type_manager_init(bdev, man, p_size);
+	ttm_mem_type_manager_init(man, p_size);
 
 	drm_mm_init(&rman->mm, 0, p_size);
 	spin_lock_init(&rman->lock);
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_gmrid_manager.c b/drivers/gpu/drm/vmwgfx/vmwgfx_gmrid_manager.c
index bc51b7773084..c3fa25161fd0 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_gmrid_manager.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_gmrid_manager.c
@@ -116,7 +116,7 @@ int vmw_gmrid_man_init(struct vmw_private *dev_priv, int type)
 	man->default_caching = TTM_PL_FLAG_CACHED;
 	/* TODO: This is most likely not correct */
 	man->use_tt = true;
-	ttm_mem_type_manager_init(&dev_priv->bdev, man, 0);
+	ttm_mem_type_manager_init(man, 0);
 	spin_lock_init(&gman->lock);
 	gman->used_gmr_pages = 0;
 	ida_init(&gman->gmr_ida);
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_thp.c b/drivers/gpu/drm/vmwgfx/vmwgfx_thp.c
index 1cefd9c1e8ea..0b9c29249393 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_thp.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_thp.c
@@ -134,7 +134,7 @@ int vmw_thp_init(struct vmw_private *dev_priv)
 	man->available_caching = TTM_PL_FLAG_CACHED;
 	man->default_caching = TTM_PL_FLAG_CACHED;
 
-	ttm_mem_type_manager_init(&dev_priv->bdev, man,
+	ttm_mem_type_manager_init(man,
 				  dev_priv->vram_size >> PAGE_SHIFT);
 
 	drm_mm_init(&rman->mm, 0, man->size);
diff --git a/include/drm/ttm/ttm_bo_api.h b/include/drm/ttm/ttm_bo_api.h
index 9c55eafd0e7d..eb465e9ca0c1 100644
--- a/include/drm/ttm/ttm_bo_api.h
+++ b/include/drm/ttm/ttm_bo_api.h
@@ -536,14 +536,12 @@ int ttm_bo_create(struct ttm_bo_device *bdev, unsigned long size,
 /**
  * ttm_mem_type_manager_init
  *
- * @bdev: Pointer to a ttm_bo_device struct.
  * @man: memory manager object to init
  * @p_size: size managed area in pages.
  *
- * Initialise core parts of a a manager object.
+ * Initialise core parts of a manager object.
  */
-void ttm_mem_type_manager_init(struct ttm_bo_device *bdev,
-			       struct ttm_mem_type_manager *man,
+void ttm_mem_type_manager_init(struct ttm_mem_type_manager *man,
 			       unsigned long p_size);
 
 /**
diff --git a/include/drm/ttm/ttm_bo_driver.h b/include/drm/ttm/ttm_bo_driver.h
index b477c1ad5c3e..bfd19400372f 100644
--- a/include/drm/ttm/ttm_bo_driver.h
+++ b/include/drm/ttm/ttm_bo_driver.h
@@ -138,8 +138,6 @@ struct ttm_mem_type_manager_func {
 
 
 struct ttm_mem_type_manager {
-	struct ttm_bo_device *bdev;
-
 	/*
 	 * No protection. Constant from start.
 	 */
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
