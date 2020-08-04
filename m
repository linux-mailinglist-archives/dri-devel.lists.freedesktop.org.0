Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A39323B30D
	for <lists+dri-devel@lfdr.de>; Tue,  4 Aug 2020 04:58:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 773416E3F9;
	Tue,  4 Aug 2020 02:58:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4A7F6E3F5
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Aug 2020 02:58:43 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-223-ksDyfsAOOPCwuQsdRXyYfQ-1; Mon, 03 Aug 2020 22:58:36 -0400
X-MC-Unique: ksDyfsAOOPCwuQsdRXyYfQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 615DC1005504;
 Tue,  4 Aug 2020 02:58:35 +0000 (UTC)
Received: from tyrion-bne-redhat-com.redhat.com (vpn2-54-17.bne.redhat.com
 [10.64.54.17])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C63808AD1C;
 Tue,  4 Aug 2020 02:58:30 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 46/59] drm/ttm: make ttm_range_man_init/takedown take type +
 args
Date: Tue,  4 Aug 2020 12:56:19 +1000
Message-Id: <20200804025632.3868079-47-airlied@gmail.com>
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

This makes it easier to move these to a driver allocated system

Signed-off-by: Dave Airlie <airlied@redhat.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 15 +++++-------
 drivers/gpu/drm/drm_gem_vram_helper.c   | 10 ++++----
 drivers/gpu/drm/nouveau/nouveau_ttm.c   | 22 +++++++++++-------
 drivers/gpu/drm/qxl/qxl_ttm.c           | 13 ++++-------
 drivers/gpu/drm/radeon/radeon_ttm.c     | 31 ++++++++++++-------------
 drivers/gpu/drm/ttm/ttm_bo_manager.c    | 19 +++++++++++----
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c     | 13 ++++-------
 include/drm/ttm/ttm_bo_driver.h         | 12 +++++++---
 8 files changed, 70 insertions(+), 65 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index 1bd860877f1e..b190d50dc9bb 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -67,12 +67,9 @@ static int amdgpu_ttm_init_on_chip(struct amdgpu_device *adev,
 				    unsigned int type,
 				    uint64_t size)
 {
-	struct ttm_mem_type_manager *man = ttm_manager_type(&adev->mman.bdev, type);
-
-	man->available_caching = TTM_PL_FLAG_UNCACHED;
-	man->default_caching = TTM_PL_FLAG_UNCACHED;
-
-	return ttm_range_man_init(&adev->mman.bdev, man, size >> PAGE_SHIFT);
+	return ttm_range_man_init(&adev->mman.bdev, type,
+				  TTM_PL_FLAG_UNCACHED, TTM_PL_FLAG_UNCACHED,
+				  false, size >> PAGE_SHIFT);
 }
 
 /**
@@ -2014,9 +2011,9 @@ void amdgpu_ttm_fini(struct amdgpu_device *adev)
 
 	amdgpu_vram_mgr_fini(adev);
 	amdgpu_gtt_mgr_fini(adev);
-	ttm_range_man_fini(&adev->mman.bdev, ttm_manager_type(&adev->mman.bdev, AMDGPU_PL_GDS));
-	ttm_range_man_fini(&adev->mman.bdev, ttm_manager_type(&adev->mman.bdev, AMDGPU_PL_GWS));
-	ttm_range_man_fini(&adev->mman.bdev, ttm_manager_type(&adev->mman.bdev, AMDGPU_PL_OA));
+	ttm_range_man_fini(&adev->mman.bdev, AMDGPU_PL_GDS);
+	ttm_range_man_fini(&adev->mman.bdev, AMDGPU_PL_GWS);
+	ttm_range_man_fini(&adev->mman.bdev, AMDGPU_PL_OA);
 	ttm_bo_device_release(&adev->mman.bdev);
 	adev->mman.initialized = false;
 	DRM_INFO("amdgpu: ttm finalized\n");
diff --git a/drivers/gpu/drm/drm_gem_vram_helper.c b/drivers/gpu/drm/drm_gem_vram_helper.c
index a01768adb96d..2187787f397e 100644
--- a/drivers/gpu/drm/drm_gem_vram_helper.c
+++ b/drivers/gpu/drm/drm_gem_vram_helper.c
@@ -1103,7 +1103,6 @@ EXPORT_SYMBOL(drm_vram_mm_debugfs_init);
 static int drm_vram_mm_init(struct drm_vram_mm *vmm, struct drm_device *dev,
 			    uint64_t vram_base, size_t vram_size)
 {
-	struct ttm_mem_type_manager *man = ttm_manager_type(&vmm->bdev, TTM_PL_VRAM);
 	int ret;
 
 	vmm->vram_base = vram_base;
@@ -1116,9 +1115,10 @@ static int drm_vram_mm_init(struct drm_vram_mm *vmm, struct drm_device *dev,
 	if (ret)
 		return ret;
 
-	man->available_caching = TTM_PL_FLAG_UNCACHED | TTM_PL_FLAG_WC;
-	man->default_caching = TTM_PL_FLAG_WC;
-	ret = ttm_range_man_init(&vmm->bdev, man, vram_size >> PAGE_SHIFT);
+	ret = ttm_range_man_init(&vmm->bdev, TTM_PL_VRAM,
+				 TTM_PL_FLAG_UNCACHED | TTM_PL_FLAG_WC,
+				 TTM_PL_FLAG_WC, false,
+				 vram_size >> PAGE_SHIFT);
 	if (ret)
 		return ret;
 
@@ -1127,7 +1127,7 @@ static int drm_vram_mm_init(struct drm_vram_mm *vmm, struct drm_device *dev,
 
 static void drm_vram_mm_cleanup(struct drm_vram_mm *vmm)
 {
-	ttm_range_man_fini(&vmm->bdev, ttm_manager_type(&vmm->bdev, TTM_PL_VRAM));
+	ttm_range_man_fini(&vmm->bdev, TTM_PL_VRAM);
 	ttm_bo_device_release(&vmm->bdev);
 }
 
diff --git a/drivers/gpu/drm/nouveau/nouveau_ttm.c b/drivers/gpu/drm/nouveau/nouveau_ttm.c
index cc6cf04553dd..1c636723823c 100644
--- a/drivers/gpu/drm/nouveau/nouveau_ttm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_ttm.c
@@ -156,16 +156,17 @@ nouveau_ttm_init_host(struct nouveau_drm *drm, u8 kind)
 static int
 nouveau_ttm_init_vram(struct nouveau_drm *drm)
 {
-	struct ttm_mem_type_manager *man = ttm_manager_type(&drm->ttm.bdev, TTM_PL_VRAM);
 	struct nvif_mmu *mmu = &drm->client.mmu;
 
-	man->available_caching = TTM_PL_FLAG_UNCACHED | TTM_PL_FLAG_WC;
-	man->default_caching = TTM_PL_FLAG_WC;
-
 	if (drm->client.device.info.family >= NV_DEVICE_INFO_V0_TESLA) {
+		struct ttm_mem_type_manager *man = ttm_manager_type(&drm->ttm.bdev, TTM_PL_VRAM);
+
 		/* Some BARs do not support being ioremapped WC */
 		const u8 type = mmu->type[drm->ttm.type_vram].type;
 
+		man->available_caching = TTM_PL_FLAG_UNCACHED | TTM_PL_FLAG_WC;
+		man->default_caching = TTM_PL_FLAG_WC;
+
 		if (type & NVIF_MEM_UNCACHED) {
 			man->available_caching = TTM_PL_FLAG_UNCACHED;
 			man->default_caching = TTM_PL_FLAG_UNCACHED;
@@ -178,7 +179,9 @@ nouveau_ttm_init_vram(struct nouveau_drm *drm)
 		ttm_mem_type_manager_set_used(man, true);
 		return 0;
 	} else {
-		return ttm_range_man_init(&drm->ttm.bdev, man,
+		return ttm_range_man_init(&drm->ttm.bdev, TTM_PL_VRAM,
+					  TTM_PL_FLAG_UNCACHED | TTM_PL_FLAG_WC,
+					  TTM_PL_FLAG_WC, false,
 					  drm->gem.vram_available >> PAGE_SHIFT);
 	}
 }
@@ -193,7 +196,7 @@ nouveau_ttm_fini_vram(struct nouveau_drm *drm)
 		ttm_mem_type_manager_force_list_clean(&drm->ttm.bdev, man);
 		ttm_mem_type_manager_cleanup(man);
 	} else
-		ttm_range_man_fini(&drm->ttm.bdev, man);
+		ttm_range_man_fini(&drm->ttm.bdev, TTM_PL_VRAM);
 }
 
 static int
@@ -216,9 +219,10 @@ nouveau_ttm_init_gtt(struct nouveau_drm *drm)
 	else if (!drm->agp.bridge)
 		man->func = &nv04_gart_manager;
 	else
-		return ttm_range_man_init(&drm->ttm.bdev, man,
+		return ttm_range_man_init(&drm->ttm.bdev, TTM_PL_TT,
+					  TTM_PL_FLAG_UNCACHED | TTM_PL_FLAG_WC,
+					  TTM_PL_FLAG_WC, true,
 					  size_pages);
-
 	ttm_mem_type_manager_init(&drm->ttm.bdev, man,
 				  size_pages);
 	ttm_mem_type_manager_set_used(man, true);
@@ -232,7 +236,7 @@ nouveau_ttm_fini_gtt(struct nouveau_drm *drm)
 
 	if (drm->client.device.info.family < NV_DEVICE_INFO_V0_TESLA &&
 	    drm->agp.bridge)
-		ttm_range_man_fini(&drm->ttm.bdev, man);
+		ttm_range_man_fini(&drm->ttm.bdev, TTM_PL_TT);
 	else {
 		ttm_mem_type_manager_disable(man);
 		ttm_mem_type_manager_force_list_clean(&drm->ttm.bdev, man);
diff --git a/drivers/gpu/drm/qxl/qxl_ttm.c b/drivers/gpu/drm/qxl/qxl_ttm.c
index 57c96f7271db..b7365b2e4c7f 100644
--- a/drivers/gpu/drm/qxl/qxl_ttm.c
+++ b/drivers/gpu/drm/qxl/qxl_ttm.c
@@ -219,12 +219,8 @@ static int qxl_ttm_init_mem_type(struct qxl_device *qdev,
 				 unsigned int type,
 				 uint64_t size)
 {
-	struct ttm_mem_type_manager *man = ttm_manager_type(&qdev->mman.bdev, type);
-
-	man->available_caching = TTM_PL_MASK_CACHING;
-	man->default_caching = TTM_PL_FLAG_CACHED;
-
-	return ttm_range_man_init(&qdev->mman.bdev, man, size);
+	return ttm_range_man_init(&qdev->mman.bdev, type, TTM_PL_MASK_CACHING,
+				  TTM_PL_FLAG_CACHED, false, size);
 }
 
 int qxl_ttm_init(struct qxl_device *qdev)
@@ -266,9 +262,8 @@ int qxl_ttm_init(struct qxl_device *qdev)
 
 void qxl_ttm_fini(struct qxl_device *qdev)
 {
-
-	ttm_range_man_fini(&qdev->mman.bdev, ttm_manager_type(&qdev->mman.bdev, TTM_PL_VRAM));
-	ttm_range_man_fini(&qdev->mman.bdev, ttm_manager_type(&qdev->mman.bdev, TTM_PL_PRIV));
+	ttm_range_man_fini(&qdev->mman.bdev, TTM_PL_VRAM);
+	ttm_range_man_fini(&qdev->mman.bdev, TTM_PL_PRIV);
 	ttm_bo_device_release(&qdev->mman.bdev);
 	DRM_INFO("qxl: ttm finalized\n");
 }
diff --git a/drivers/gpu/drm/radeon/radeon_ttm.c b/drivers/gpu/drm/radeon/radeon_ttm.c
index 03c0a24e74c4..474d2161da1e 100644
--- a/drivers/gpu/drm/radeon/radeon_ttm.c
+++ b/drivers/gpu/drm/radeon/radeon_ttm.c
@@ -68,35 +68,34 @@ struct radeon_device *radeon_get_rdev(struct ttm_bo_device *bdev)
 
 static int radeon_ttm_init_vram(struct radeon_device *rdev)
 {
-	struct ttm_mem_type_manager *man = ttm_manager_type(&rdev->mman.bdev, TTM_PL_VRAM);
-
-	man->available_caching = TTM_PL_FLAG_UNCACHED | TTM_PL_FLAG_WC;
-	man->default_caching = TTM_PL_FLAG_WC;
-
-	return ttm_range_man_init(&rdev->mman.bdev, man,
+	return ttm_range_man_init(&rdev->mman.bdev, TTM_PL_VRAM,
+				  TTM_PL_FLAG_UNCACHED | TTM_PL_FLAG_WC,
+				  TTM_PL_FLAG_WC, false,
 				  rdev->mc.real_vram_size >> PAGE_SHIFT);
 }
 
 static int radeon_ttm_init_gtt(struct radeon_device *rdev)
 {
-	struct ttm_mem_type_manager *man = ttm_manager_type(&rdev->mman.bdev, TTM_PL_TT);
+	uint32_t available_caching, default_caching;
+
+	available_caching = TTM_PL_MASK_CACHING;
+	default_caching = TTM_PL_FLAG_CACHED;
 
-	man->available_caching = TTM_PL_MASK_CACHING;
-	man->default_caching = TTM_PL_FLAG_CACHED;
-	man->use_tt = true;
 #if IS_ENABLED(CONFIG_AGP)
 	if (rdev->flags & RADEON_IS_AGP) {
 		if (!rdev->ddev->agp) {
 			DRM_ERROR("AGP is not enabled\n");
 			return -EINVAL;
 		}
-		man->available_caching = TTM_PL_FLAG_UNCACHED |
-					 TTM_PL_FLAG_WC;
-		man->default_caching = TTM_PL_FLAG_WC;
+		available_caching = TTM_PL_FLAG_UNCACHED |
+			TTM_PL_FLAG_WC;
+		default_caching = TTM_PL_FLAG_WC;
 	}
 #endif
 
-	return ttm_range_man_init(&rdev->mman.bdev, man,
+	return ttm_range_man_init(&rdev->mman.bdev, TTM_PL_TT,
+				  available_caching,
+				  default_caching, true,
 				  rdev->mc.gtt_size >> PAGE_SHIFT);
 }
 
@@ -825,8 +824,8 @@ void radeon_ttm_fini(struct radeon_device *rdev)
 		}
 		radeon_bo_unref(&rdev->stolen_vga_memory);
 	}
-	ttm_range_man_fini(&rdev->mman.bdev, ttm_manager_type(&rdev->mman.bdev, TTM_PL_VRAM));
-	ttm_range_man_fini(&rdev->mman.bdev, ttm_manager_type(&rdev->mman.bdev, TTM_PL_TT));
+	ttm_range_man_fini(&rdev->mman.bdev, TTM_PL_VRAM);
+	ttm_range_man_fini(&rdev->mman.bdev, TTM_PL_TT);
 	ttm_bo_device_release(&rdev->mman.bdev);
 	radeon_gart_fini(rdev);
 	rdev->mman.initialized = false;
diff --git a/drivers/gpu/drm/ttm/ttm_bo_manager.c b/drivers/gpu/drm/ttm/ttm_bo_manager.c
index 86bf5e71e959..d83cb967a107 100644
--- a/drivers/gpu/drm/ttm/ttm_bo_manager.c
+++ b/drivers/gpu/drm/ttm/ttm_bo_manager.c
@@ -107,19 +107,27 @@ static void ttm_bo_man_put_node(struct ttm_mem_type_manager *man,
 static const struct ttm_mem_type_manager_func ttm_bo_manager_func;
 
 int ttm_range_man_init(struct ttm_bo_device *bdev,
-		       struct ttm_mem_type_manager *man,
+		       unsigned type,
+		       uint32_t available_caching,
+		       uint32_t default_caching,
+		       bool use_tt,
 		       unsigned long p_size)
 {
+	struct ttm_mem_type_manager *man = ttm_manager_type(bdev, type);
 	struct ttm_range_manager *rman;
 
-	man->func = &ttm_bo_manager_func;
-
-	ttm_mem_type_manager_init(bdev, man, p_size);
+	man->available_caching = available_caching;
+	man->default_caching = default_caching;
+	man->use_tt = use_tt;
 
 	rman = kzalloc(sizeof(*rman), GFP_KERNEL);
 	if (!rman)
 		return -ENOMEM;
 
+	man->func = &ttm_bo_manager_func;
+
+	ttm_mem_type_manager_init(bdev, man, p_size);
+
 	drm_mm_init(&rman->mm, 0, p_size);
 	spin_lock_init(&rman->lock);
 	man->priv = rman;
@@ -130,8 +138,9 @@ int ttm_range_man_init(struct ttm_bo_device *bdev,
 EXPORT_SYMBOL(ttm_range_man_init);
 
 int ttm_range_man_fini(struct ttm_bo_device *bdev,
-		       struct ttm_mem_type_manager *man)
+		       unsigned type)
 {
+	struct ttm_mem_type_manager *man = ttm_manager_type(bdev, type);
 	struct ttm_range_manager *rman = (struct ttm_range_manager *) man->priv;
 	struct drm_mm *mm = &rman->mm;
 	int ret;
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
index 6ed92f38b54b..7168403fb4f8 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
@@ -626,13 +626,9 @@ static int vmw_vram_manager_init(struct vmw_private *dev_priv)
 #ifdef CONFIG_TRANSPARENT_HUGEPAGE
 	ret = vmw_thp_init(dev_priv);
 #else
-	struct ttm_mem_type_manager *man = &dev_priv->bdev.man[TTM_PL_VRAM];
-
-	man->available_caching = TTM_PL_FLAG_CACHED;
-	man->default_caching = TTM_PL_FLAG_CACHED;
-
-	ret = ttm_range_man_init(&dev_priv->bdev, man,
-				 dev_priv->vram_size >> PAGE_SHIFT);
+	ret = ttm_range_man_init(&dev_priv->bdev, TTM_PL_VRAM,
+				 TTM_PL_FLAG_CACHED, TTM_PL_FLAG_CACHED,
+				 false, dev_priv->vram_size >> PAGE_SHIFT);
 #endif
 	ttm_manager_type(&dev_priv->bdev, TTM_PL_VRAM)->use_type = false;
 	return ret;
@@ -643,8 +639,7 @@ static void vmw_vram_manager_fini(struct vmw_private *dev_priv)
 #ifdef CONFIG_TRANSPARENT_HUGEPAGE
 	vmw_thp_fini(dev_priv);
 #else
-	ttm_bo_man_fini(&dev_priv->bdev,
-			ttm_manager_type(&dev_priv->bdev, TTM_PL_VRAM));
+	ttm_bo_man_fini(&dev_priv->bdev, TTM_PL_VRAM);
 #endif
 }
 
diff --git a/include/drm/ttm/ttm_bo_driver.h b/include/drm/ttm/ttm_bo_driver.h
index 6940d85a531a..789c1eb26859 100644
--- a/include/drm/ttm/ttm_bo_driver.h
+++ b/include/drm/ttm/ttm_bo_driver.h
@@ -845,14 +845,20 @@ pgprot_t ttm_io_prot(uint32_t caching_flags, pgprot_t tmp);
  * ttm_range_man_init
  *
  * @bdev: ttm device
- * @man: the manager to initialise with the range manager.
+ * @type: memory manager type
+ * @available_caching: TTM_PL_FLAG_* for allowed caching modes
+ * @default_caching: default caching mode
+ * @use_tt: if the memory manager uses tt
  * @p_size: size of area to be managed in pages.
  *
  * Initialise a generic range manager for the selected memory type.
  * The range manager is installed for this device in the type slot.
  */
 int ttm_range_man_init(struct ttm_bo_device *bdev,
-		       struct ttm_mem_type_manager *man,
+		       unsigned type,
+		       uint32_t available_caching,
+		       uint32_t default_caching,
+		       bool use_tt,
 		       unsigned long p_size);
 
 /**
@@ -864,7 +870,7 @@ int ttm_range_man_init(struct ttm_bo_device *bdev,
  * Remove the generic range manager from a slot and tear it down.
  */
 int ttm_range_man_fini(struct ttm_bo_device *bdev,
-		       struct ttm_mem_type_manager *man);
+		       unsigned type);
 
 /**
  * ttm_mem_type_manager_debug
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
