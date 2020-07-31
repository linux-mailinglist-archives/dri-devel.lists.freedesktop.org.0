Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A27C1233E0C
	for <lists+dri-devel@lfdr.de>; Fri, 31 Jul 2020 06:07:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E52366E9BE;
	Fri, 31 Jul 2020 04:07:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1A236E9BE
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Jul 2020 04:07:22 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-408-HwZVyl1yOJG1eKV88O42Qg-1; Fri, 31 Jul 2020 00:07:16 -0400
X-MC-Unique: HwZVyl1yOJG1eKV88O42Qg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 83B6F8064AF;
 Fri, 31 Jul 2020 04:07:15 +0000 (UTC)
Received: from tyrion-bne-redhat-com.redhat.com (vpn2-54-17.bne.redhat.com
 [10.64.54.17])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 159121001281;
 Fri, 31 Jul 2020 04:07:13 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 49/49] drm/ttm: consolidate manager used apis into a set and
 get.
Date: Fri, 31 Jul 2020 14:05:20 +1000
Message-Id: <20200731040520.3701599-50-airlied@gmail.com>
In-Reply-To: <20200731040520.3701599-1-airlied@gmail.com>
References: <20200731040520.3701599-1-airlied@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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
Cc: christian.koenig@amd.com, sroland@vmware.com, bskeggs@redhat.com,
 kraxel@redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Dave Airlie <airlied@redhat.com>

This is probably something we could consider removing, vmwgfx
is the only user, and we might be able to faciliate it another way

but for now just consolidate it all into accessors.

Signed-off-by: Dave Airlie <airlied@redhat.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c   |  4 ++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c  |  4 ++--
 drivers/gpu/drm/nouveau/nouveau_ttm.c         |  8 ++++----
 drivers/gpu/drm/ttm/ttm_bo.c                  |  6 +++---
 drivers/gpu/drm/ttm/ttm_bo_manager.c          |  4 ++--
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c           | 14 +++++++-------
 drivers/gpu/drm/vmwgfx/vmwgfx_gmrid_manager.c |  4 ++--
 drivers/gpu/drm/vmwgfx/vmwgfx_thp.c           |  4 ++--
 include/drm/ttm/ttm_bo_driver.h               |  8 ++++----
 9 files changed, 28 insertions(+), 28 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
index b4480ca30988..7e84aa2c0064 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
@@ -128,7 +128,7 @@ int amdgpu_gtt_mgr_init(struct amdgpu_device *adev, uint64_t gtt_size)
 	}
 
 	ttm_set_driver_manager(&adev->mman.bdev, TTM_PL_TT, &mgr->manager);
-	ttm_bo_use_mm(man);
+	ttm_mm_set_use(man, true);
 	return 0;
 }
 
@@ -146,7 +146,7 @@ void amdgpu_gtt_mgr_fini(struct amdgpu_device *adev)
 	struct amdgpu_gtt_mgr *mgr = to_gtt_mgr(man);
 	int ret;
 
-	ttm_bo_disable_mm(man);
+	ttm_mm_set_use(man, false);
 
 	ret = ttm_bo_force_list_clean(&adev->mman.bdev, man);
 	if (ret)
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
index f0e65a6fdf88..50949aa968fd 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
@@ -205,7 +205,7 @@ int amdgpu_vram_mgr_init(struct amdgpu_device *adev)
 		DRM_ERROR("Failed to register sysfs\n");
 
 	ttm_set_driver_manager(&adev->mman.bdev, TTM_PL_VRAM, &mgr->manager);
-	ttm_bo_use_mm(man);
+	ttm_mm_set_use(man, true);
 	return 0;
 }
 
@@ -223,7 +223,7 @@ void amdgpu_vram_mgr_fini(struct amdgpu_device *adev)
 	struct amdgpu_vram_mgr *mgr = to_vram_mgr(man);
 	int ret;
 
-	ttm_bo_disable_mm(man);
+	ttm_mm_set_use(man, false);
 
 	ret = ttm_bo_force_list_clean(&adev->mman.bdev, man);
 	if (ret)
diff --git a/drivers/gpu/drm/nouveau/nouveau_ttm.c b/drivers/gpu/drm/nouveau/nouveau_ttm.c
index 89521d3ed9da..32ce930d1bd8 100644
--- a/drivers/gpu/drm/nouveau/nouveau_ttm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_ttm.c
@@ -176,7 +176,7 @@ nouveau_ttm_init_vram(struct nouveau_drm *drm)
 		man->use_io_reserve_lru = true;
 		ttm_bo_init_mm_base(man, drm->gem.vram_available >> PAGE_SHIFT);
 		ttm_set_driver_manager(&drm->ttm.bdev, TTM_PL_VRAM, man);
-		ttm_bo_use_mm(man);
+		ttm_mm_set_use(man, true);
 		return 0;
 	} else {
 		return ttm_bo_man_init(&drm->ttm.bdev, TTM_PL_VRAM,
@@ -192,7 +192,7 @@ nouveau_ttm_fini_vram(struct nouveau_drm *drm)
 	struct ttm_mem_type_manager *man = ttm_manager_type(&drm->ttm.bdev, TTM_PL_VRAM);
 
 	if (drm->client.device.info.family >= NV_DEVICE_INFO_V0_TESLA) {
-		ttm_bo_disable_mm(man);
+		ttm_mm_set_use(man, false);
 		ttm_bo_force_list_clean(&drm->ttm.bdev, man);
 		ttm_bo_man_cleanup(man);
 		ttm_set_driver_manager(&drm->ttm.bdev, TTM_PL_VRAM, NULL);
@@ -237,7 +237,7 @@ nouveau_ttm_init_gtt(struct nouveau_drm *drm)
 	man->use_tt = true;
 	ttm_bo_init_mm_base(man, size_pages);
 	ttm_set_driver_manager(&drm->ttm.bdev, TTM_PL_TT, man);
-	ttm_bo_use_mm(man);
+	ttm_mm_set_use(man, true);
 	return 0;
 }
 
@@ -250,7 +250,7 @@ nouveau_ttm_fini_gtt(struct nouveau_drm *drm)
 	    drm->agp.bridge)
 		ttm_bo_man_takedown(&drm->ttm.bdev, TTM_PL_TT);
 	else {
-		ttm_bo_disable_mm(man);
+		ttm_mm_set_use(man, false);
 		ttm_bo_force_list_clean(&drm->ttm.bdev, man);
 		ttm_bo_man_cleanup(man);
 		ttm_set_driver_manager(&drm->ttm.bdev, TTM_PL_TT, NULL);
diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index bfc20cb27ed6..3bec6e4bc87d 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -996,7 +996,7 @@ static int ttm_bo_mem_placement(struct ttm_buffer_object *bo,
 		return ret;
 
 	man = ttm_manager_type(bdev, mem_type);
-	if (!man || !man->use_type)
+	if (!man || !ttm_mm_used(man))
 		return -EBUSY;
 
 	if (!ttm_bo_mt_compatible(man, mem_type, place, &cur_flags))
@@ -1548,7 +1548,7 @@ int ttm_bo_device_release(struct ttm_bo_device *bdev)
 	struct ttm_mem_type_manager *man;
 
 	man = ttm_manager_type(bdev, TTM_PL_SYSTEM);
-	ttm_bo_disable_mm(man);
+	ttm_mm_set_use(man, false);
 
 	mutex_lock(&ttm_global_mutex);
 	list_del(&bdev->device_list);
@@ -1585,7 +1585,7 @@ static void ttm_bo_init_sysman(struct ttm_bo_device *bdev)
 	man->default_caching = TTM_PL_FLAG_CACHED;
 
 	ttm_bo_init_mm_base(man, 0);
-	ttm_bo_use_mm(man);
+	ttm_mm_set_use(man, true);
 }
 
 int ttm_bo_device_init(struct ttm_bo_device *bdev,
diff --git a/drivers/gpu/drm/ttm/ttm_bo_manager.c b/drivers/gpu/drm/ttm/ttm_bo_manager.c
index 6c6eedf84ca6..5ed4e4317789 100644
--- a/drivers/gpu/drm/ttm/ttm_bo_manager.c
+++ b/drivers/gpu/drm/ttm/ttm_bo_manager.c
@@ -139,7 +139,7 @@ int ttm_bo_man_init(struct ttm_bo_device *bdev,
 	spin_lock_init(&rman->lock);
 
 	ttm_set_driver_manager(bdev, type, &rman->manager);
-	ttm_bo_use_mm(man);
+	ttm_mm_set_use(man, true);
 	return 0;
 }
 EXPORT_SYMBOL(ttm_bo_man_init);
@@ -152,7 +152,7 @@ int ttm_bo_man_takedown(struct ttm_bo_device *bdev,
 	struct drm_mm *mm = &rman->mm;
 	int ret;
 
-	ttm_bo_disable_mm(man);
+	ttm_mm_set_use(man, false);
 
 	ret = ttm_bo_force_list_clean(bdev, man);
 	if (ret)
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
index 1849d913d521..9b9cc3b57a24 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
@@ -630,7 +630,7 @@ static int vmw_init_vram_manager(struct vmw_private *dev_priv)
 			      TTM_PL_FLAG_CACHED, TTM_PL_FLAG_CACHED,
 			      false, dev_priv->vram_size >> PAGE_SHIFT);
 #endif
-	ttm_manager_type(&dev_priv->bdev, TTM_PL_VRAM)->use_type = false;
+	ttm_mm_set_use(ttm_manager_type(&dev_priv->bdev, TTM_PL_VRAM), false);
 	return ret;
 }
 
@@ -1190,9 +1190,9 @@ static void __vmw_svga_enable(struct vmw_private *dev_priv)
 	struct ttm_mem_type_manager *man = ttm_manager_type(&dev_priv->bdev, TTM_PL_VRAM);
 
 	spin_lock(&dev_priv->svga_lock);
-	if (!man->use_type) {
+	if (!ttm_mm_used(man)) {
 		vmw_write(dev_priv, SVGA_REG_ENABLE, SVGA_REG_ENABLE);
-		man->use_type = true;
+		ttm_mm_set_use(man, true);
 	}
 	spin_unlock(&dev_priv->svga_lock);
 }
@@ -1221,8 +1221,8 @@ static void __vmw_svga_disable(struct vmw_private *dev_priv)
 	struct ttm_mem_type_manager *man = ttm_manager_type(&dev_priv->bdev, TTM_PL_VRAM);
 
 	spin_lock(&dev_priv->svga_lock);
-	if (man->use_type) {
-		man->use_type = false;
+	if (ttm_mm_used(man)) {
+		ttm_mm_set_use(man, false);
 		vmw_write(dev_priv, SVGA_REG_ENABLE,
 			  SVGA_REG_ENABLE_HIDE |
 			  SVGA_REG_ENABLE_ENABLE);
@@ -1255,8 +1255,8 @@ void vmw_svga_disable(struct vmw_private *dev_priv)
 	vmw_kms_lost_device(dev_priv->dev);
 	ttm_write_lock(&dev_priv->reservation_sem, false);
 	spin_lock(&dev_priv->svga_lock);
-	if (man->use_type) {
-		man->use_type = false;
+	if (ttm_mm_used(man)) {
+		ttm_mm_set_use(man, false);
 		spin_unlock(&dev_priv->svga_lock);
 		if (ttm_bo_evict_mm(&dev_priv->bdev, TTM_PL_VRAM))
 			DRM_ERROR("Failed evicting VRAM buffers.\n");
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_gmrid_manager.c b/drivers/gpu/drm/vmwgfx/vmwgfx_gmrid_manager.c
index 2b60957f7c4a..aff7767762ed 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_gmrid_manager.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_gmrid_manager.c
@@ -135,7 +135,7 @@ int vmw_gmrid_man_init(struct vmw_private *dev_priv, int type)
 	}
 
 	ttm_set_driver_manager(&dev_priv->bdev, type, &gman->manager);
-	ttm_bo_use_mm(man);
+	ttm_mm_set_use(man, true);
 	return 0;
 }
 
@@ -144,7 +144,7 @@ void vmw_gmrid_man_takedown(struct vmw_private *dev_priv, int type)
 	struct ttm_mem_type_manager *man = ttm_manager_type(&dev_priv->bdev, type);
 	struct vmwgfx_gmrid_man *gman = to_gmrid_manager(man);
 
-	ttm_bo_disable_mm(man);
+	ttm_mm_set_use(man, false);
 
 	ttm_bo_force_list_clean(&dev_priv->bdev, man);
 
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_thp.c b/drivers/gpu/drm/vmwgfx/vmwgfx_thp.c
index d5a3eb709384..5a7b9b09785c 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_thp.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_thp.c
@@ -142,7 +142,7 @@ int vmw_thp_init(struct vmw_private *dev_priv)
 	spin_lock_init(&rman->lock);
 
 	ttm_set_driver_manager(&dev_priv->bdev, TTM_PL_VRAM, &rman->manager);
-	ttm_bo_use_mm(man);
+	ttm_mm_set_use(man, true);
 	return 0;
 }
 
@@ -153,7 +153,7 @@ void vmw_thp_takedown(struct vmw_private *dev_priv)
 	struct drm_mm *mm = &rman->mm;
 	int ret;
 
-	ttm_bo_disable_mm(man);
+	ttm_mm_set_use(man, false);
 
 	ret = ttm_bo_force_list_clean(&dev_priv->bdev, man);
 	if (ret)
diff --git a/include/drm/ttm/ttm_bo_driver.h b/include/drm/ttm/ttm_bo_driver.h
index 702b3b056eda..6210acd5c651 100644
--- a/include/drm/ttm/ttm_bo_driver.h
+++ b/include/drm/ttm/ttm_bo_driver.h
@@ -668,14 +668,14 @@ static inline void ttm_bo_unreserve(struct ttm_buffer_object *bo)
 	dma_resv_unlock(bo->base.resv);
 }
 
-static inline void ttm_bo_use_mm(struct ttm_mem_type_manager *man)
+static inline void ttm_mm_set_use(struct ttm_mem_type_manager *man, bool use)
 {
-	man->use_type = true;
+	man->use_type = use;
 }
 
-static inline void ttm_bo_disable_mm(struct ttm_mem_type_manager *man)
+static inline bool ttm_mm_used(struct ttm_mem_type_manager *man)
 {
-	man->use_type = false;
+	return man->use_type;
 }
 
 static inline void ttm_bo_man_cleanup(struct ttm_mem_type_manager *man)
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
