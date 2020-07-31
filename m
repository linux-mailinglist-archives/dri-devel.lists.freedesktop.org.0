Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 37F26233E05
	for <lists+dri-devel@lfdr.de>; Fri, 31 Jul 2020 06:07:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 665F86E9BB;
	Fri, 31 Jul 2020 04:07:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EDB76E9A2
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Jul 2020 04:07:00 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-436-wJMYTG9yMbuUv8VtoxVUiQ-1; Fri, 31 Jul 2020 00:06:55 -0400
X-MC-Unique: wJMYTG9yMbuUv8VtoxVUiQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1F7F480183C;
 Fri, 31 Jul 2020 04:06:54 +0000 (UTC)
Received: from tyrion-bne-redhat-com.redhat.com (vpn2-54-17.bne.redhat.com
 [10.64.54.17])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A75971001281;
 Fri, 31 Jul 2020 04:06:52 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 39/49] drm/ttm: make ttm_bo_man_init/takedown take type + args
Date: Fri, 31 Jul 2020 14:05:10 +1000
Message-Id: <20200731040520.3701599-40-airlied@gmail.com>
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

This makes it easier to move these to a driver allocated system

Signed-off-by: Dave Airlie <airlied@redhat.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 15 +++++------
 drivers/gpu/drm/drm_gem_vram_helper.c   | 10 ++++----
 drivers/gpu/drm/nouveau/nouveau_ttm.c   | 21 ++++++++++------
 drivers/gpu/drm/qxl/qxl_ttm.c           | 12 +++------
 drivers/gpu/drm/radeon/radeon_ttm.c     | 33 ++++++++++++-------------
 drivers/gpu/drm/ttm/ttm_bo_manager.c    | 19 ++++++++++----
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c     | 13 +++-------
 include/drm/ttm/ttm_bo_driver.h         |  7 ++++--
 8 files changed, 67 insertions(+), 63 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index 4beec1c4e037..d4d81f808b01 100644
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
-	return ttm_bo_man_init(&adev->mman.bdev, man, size >> PAGE_SHIFT);
+	return ttm_bo_man_init(&adev->mman.bdev, type,
+			       TTM_PL_FLAG_UNCACHED, TTM_PL_FLAG_UNCACHED,
+			       false, size >> PAGE_SHIFT);
 }
 
 /**
@@ -2014,9 +2011,9 @@ void amdgpu_ttm_fini(struct amdgpu_device *adev)
 
 	amdgpu_vram_mgr_fini(adev);
 	amdgpu_gtt_mgr_fini(adev);
-	ttm_bo_man_takedown(&adev->mman.bdev, ttm_manager_type(&adev->mman.bdev, AMDGPU_PL_GDS));
-	ttm_bo_man_takedown(&adev->mman.bdev, ttm_manager_type(&adev->mman.bdev, AMDGPU_PL_GWS));
-	ttm_bo_man_takedown(&adev->mman.bdev, ttm_manager_type(&adev->mman.bdev, AMDGPU_PL_OA));
+	ttm_bo_man_takedown(&adev->mman.bdev, AMDGPU_PL_GDS);
+	ttm_bo_man_takedown(&adev->mman.bdev, AMDGPU_PL_GWS);
+	ttm_bo_man_takedown(&adev->mman.bdev, AMDGPU_PL_OA);
 	ttm_bo_device_release(&adev->mman.bdev);
 	adev->mman.initialized = false;
 	DRM_INFO("amdgpu: ttm finalized\n");
diff --git a/drivers/gpu/drm/drm_gem_vram_helper.c b/drivers/gpu/drm/drm_gem_vram_helper.c
index 08fbfa32540a..b98af8daa540 100644
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
-	ret = ttm_bo_man_init(&vmm->bdev, man, vram_size >> PAGE_SHIFT);
+	ret = ttm_bo_man_init(&vmm->bdev, TTM_PL_VRAM,
+			      TTM_PL_FLAG_UNCACHED | TTM_PL_FLAG_WC,
+			      TTM_PL_FLAG_WC, false,
+			      vram_size >> PAGE_SHIFT);
 	if (ret)
 		return ret;
 
@@ -1127,7 +1127,7 @@ static int drm_vram_mm_init(struct drm_vram_mm *vmm, struct drm_device *dev,
 
 static void drm_vram_mm_cleanup(struct drm_vram_mm *vmm)
 {
-	ttm_bo_man_takedown(&vmm->bdev, ttm_manager_type(&vmm->bdev, TTM_PL_VRAM));
+	ttm_bo_man_takedown(&vmm->bdev, TTM_PL_VRAM);
 	ttm_bo_device_release(&vmm->bdev);
 }
 
diff --git a/drivers/gpu/drm/nouveau/nouveau_ttm.c b/drivers/gpu/drm/nouveau/nouveau_ttm.c
index 1b9d9362132d..225f9af2eaa1 100644
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
 		ttm_bo_use_mm(man);
 		return 0;
 	} else {
-		return ttm_bo_man_init(&drm->ttm.bdev, man,
+		return ttm_bo_man_init(&drm->ttm.bdev, TTM_PL_VRAM,
+				       TTM_PL_FLAG_UNCACHED | TTM_PL_FLAG_WC,
+				       TTM_PL_FLAG_WC, false,
 				       drm->gem.vram_available >> PAGE_SHIFT);
 	}
 }
@@ -193,7 +196,7 @@ nouveau_ttm_fini_vram(struct nouveau_drm *drm)
 		ttm_bo_force_list_clean(&drm->ttm.bdev, man);
 		ttm_bo_man_cleanup(man);
 	} else
-		ttm_bo_man_takedown(&drm->ttm.bdev, man);
+		ttm_bo_man_takedown(&drm->ttm.bdev, TTM_PL_VRAM);
 }
 
 static int
@@ -216,7 +219,9 @@ nouveau_ttm_init_gtt(struct nouveau_drm *drm)
 	else if (!drm->agp.bridge)
 		man->func = &nv04_gart_manager;
 	else
-		return ttm_bo_man_init(&drm->ttm.bdev, man,
+		return ttm_bo_man_init(&drm->ttm.bdev, TTM_PL_TT,
+				       TTM_PL_FLAG_UNCACHED | TTM_PL_FLAG_WC,
+				       TTM_PL_FLAG_WC, true,
 				       size_pages);
 
 	ttm_bo_init_mm_base(&drm->ttm.bdev, man,
@@ -232,7 +237,7 @@ nouveau_ttm_fini_gtt(struct nouveau_drm *drm)
 
 	if (drm->client.device.info.family < NV_DEVICE_INFO_V0_TESLA &&
 	    drm->agp.bridge)
-		ttm_bo_man_takedown(&drm->ttm.bdev, man);
+		ttm_bo_man_takedown(&drm->ttm.bdev, TTM_PL_TT);
 	else {
 		ttm_bo_disable_mm(man);
 		ttm_bo_force_list_clean(&drm->ttm.bdev, man);
diff --git a/drivers/gpu/drm/qxl/qxl_ttm.c b/drivers/gpu/drm/qxl/qxl_ttm.c
index 9aea35a66e25..5b569415854e 100644
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
-	return ttm_bo_man_init(&qdev->mman.bdev, man, size);
+	return ttm_bo_man_init(&qdev->mman.bdev, type, TTM_PL_MASK_CACHING,
+			       TTM_PL_FLAG_CACHED, false, size);
 }
 
 int qxl_ttm_init(struct qxl_device *qdev)
@@ -266,8 +262,8 @@ int qxl_ttm_init(struct qxl_device *qdev)
 
 void qxl_ttm_fini(struct qxl_device *qdev)
 {
-	ttm_bo_man_takedown(&qdev->mman.bdev, ttm_manager_type(&qdev->mman.bdev, TTM_PL_VRAM));
-	ttm_bo_man_takedown(&qdev->mman.bdev, ttm_manager_type(&qdev->mman.bdev, TTM_PL_PRIV));
+	ttm_bo_man_takedown(&qdev->mman.bdev, TTM_PL_VRAM);
+	ttm_bo_man_takedown(&qdev->mman.bdev, TTM_PL_PRIV);
 	ttm_bo_device_release(&qdev->mman.bdev);
 	DRM_INFO("qxl: ttm finalized\n");
 }
diff --git a/drivers/gpu/drm/radeon/radeon_ttm.c b/drivers/gpu/drm/radeon/radeon_ttm.c
index 3849d0e852bc..793031bb9bd2 100644
--- a/drivers/gpu/drm/radeon/radeon_ttm.c
+++ b/drivers/gpu/drm/radeon/radeon_ttm.c
@@ -68,36 +68,35 @@ struct radeon_device *radeon_get_rdev(struct ttm_bo_device *bdev)
 
 static int radeon_ttm_init_vram(struct radeon_device *rdev)
 {
-	struct ttm_mem_type_manager *man = ttm_manager_type(&rdev->mman.bdev, TTM_PL_VRAM);
-
-	man->available_caching = TTM_PL_FLAG_UNCACHED | TTM_PL_FLAG_WC;
-	man->default_caching = TTM_PL_FLAG_WC;
-
-	return ttm_bo_man_init(&rdev->mman.bdev, man,
+	return ttm_bo_man_init(&rdev->mman.bdev, TTM_PL_VRAM,
+			       TTM_PL_FLAG_UNCACHED | TTM_PL_FLAG_WC,
+			       TTM_PL_FLAG_WC, false,
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
 
-	return ttm_bo_man_init(&rdev->mman.bdev, man,
-			      rdev->mc.gtt_size >> PAGE_SHIFT);
+	return ttm_bo_man_init(&rdev->mman.bdev, TTM_PL_TT,
+			       available_caching,
+			       default_caching, true,
+			       rdev->mc.gtt_size >> PAGE_SHIFT);
 }
 
 static void radeon_evict_flags(struct ttm_buffer_object *bo,
@@ -825,8 +824,8 @@ void radeon_ttm_fini(struct radeon_device *rdev)
 		}
 		radeon_bo_unref(&rdev->stolen_vga_memory);
 	}
-	ttm_bo_man_takedown(&rdev->mman.bdev, ttm_manager_type(&rdev->mman.bdev, TTM_PL_VRAM));
-	ttm_bo_man_takedown(&rdev->mman.bdev, ttm_manager_type(&rdev->mman.bdev, TTM_PL_TT));
+	ttm_bo_man_takedown(&rdev->mman.bdev, TTM_PL_VRAM);
+	ttm_bo_man_takedown(&rdev->mman.bdev, TTM_PL_TT);
 	ttm_bo_device_release(&rdev->mman.bdev);
 	radeon_gart_fini(rdev);
 	rdev->mman.initialized = false;
diff --git a/drivers/gpu/drm/ttm/ttm_bo_manager.c b/drivers/gpu/drm/ttm/ttm_bo_manager.c
index f60a9a5d429d..2f5fa44b6474 100644
--- a/drivers/gpu/drm/ttm/ttm_bo_manager.c
+++ b/drivers/gpu/drm/ttm/ttm_bo_manager.c
@@ -107,19 +107,27 @@ static void ttm_bo_man_put_node(struct ttm_mem_type_manager *man,
 static const struct ttm_mem_type_manager_func ttm_bo_manager_func;
 
 int ttm_bo_man_init(struct ttm_bo_device *bdev,
-		    struct ttm_mem_type_manager *man,
+		    unsigned type,
+		    uint32_t available_caching,
+		    uint32_t default_caching,
+		    bool use_tt,
 		    unsigned long p_size)
 {
+	struct ttm_mem_type_manager *man = ttm_manager_type(bdev, type);
 	struct ttm_range_manager *rman;
 
-	man->func = &ttm_bo_manager_func;
-
-	ttm_bo_init_mm_base(bdev, man, p_size);
+	man->available_caching = available_caching;
+	man->default_caching = default_caching;
+	man->use_tt = use_tt;
 
 	rman = kzalloc(sizeof(*rman), GFP_KERNEL);
 	if (!rman)
 		return -ENOMEM;
 
+	man->func = &ttm_bo_manager_func;
+
+	ttm_bo_init_mm_base(bdev, man, p_size);
+
 	drm_mm_init(&rman->mm, 0, p_size);
 	spin_lock_init(&rman->lock);
 	man->priv = rman;
@@ -130,8 +138,9 @@ int ttm_bo_man_init(struct ttm_bo_device *bdev,
 EXPORT_SYMBOL(ttm_bo_man_init);
 
 int ttm_bo_man_takedown(struct ttm_bo_device *bdev,
-			struct ttm_mem_type_manager *man)
+			unsigned type)
 {
+	struct ttm_mem_type_manager *man = ttm_manager_type(bdev, type);
 	struct ttm_range_manager *rman = (struct ttm_range_manager *) man->priv;
 	struct drm_mm *mm = &rman->mm;
 	int ret;
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
index dff6990ff9ed..1849d913d521 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
@@ -626,13 +626,9 @@ static int vmw_init_vram_manager(struct vmw_private *dev_priv)
 #ifdef CONFIG_TRANSPARENT_HUGEPAGE
 	ret = vmw_thp_init(dev_priv);
 #else
-	struct ttm_mem_type_manager *man = &dev_priv->bdev.man[TTM_PL_VRAM];
-
-	man->available_caching = TTM_PL_FLAG_CACHED;
-	man->default_caching = TTM_PL_FLAG_CACHED;
-
-	ret = ttm_bo_man_init(&dev_priv->bdev, man,
-			      dev_priv->vram_size >> PAGE_SHIFT);
+	ret = ttm_bo_man_init(&dev_priv->bdev, TTM_PL_VRAM,
+			      TTM_PL_FLAG_CACHED, TTM_PL_FLAG_CACHED,
+			      false, dev_priv->vram_size >> PAGE_SHIFT);
 #endif
 	ttm_manager_type(&dev_priv->bdev, TTM_PL_VRAM)->use_type = false;
 	return ret;
@@ -643,8 +639,7 @@ static void vmw_takedown_vram_manager(struct vmw_private *dev_priv)
 #ifdef CONFIG_TRANSPARENT_HUGEPAGE
 	vmw_thp_takedown(dev_priv);
 #else
-	ttm_bo_man_takedown(&dev_priv->bdev,
-			    ttm_manager_type(&dev_priv->bdev, TTM_PL_VRAM));
+	ttm_bo_man_takedown(&dev_priv->bdev, TTM_PL_VRAM);
 #endif
 }
 
diff --git a/include/drm/ttm/ttm_bo_driver.h b/include/drm/ttm/ttm_bo_driver.h
index 723171fd94da..6319d85d7270 100644
--- a/include/drm/ttm/ttm_bo_driver.h
+++ b/include/drm/ttm/ttm_bo_driver.h
@@ -809,8 +809,11 @@ int ttm_bo_pipeline_gutting(struct ttm_buffer_object *bo);
 pgprot_t ttm_io_prot(uint32_t caching_flags, pgprot_t tmp);
 
 int ttm_bo_man_init(struct ttm_bo_device *bdev,
-		    struct ttm_mem_type_manager *man,
+		    unsigned type,
+		    uint32_t available_caching,
+		    uint32_t default_caching,
+		    bool use_tt,
 		    unsigned long p_size);
 int ttm_bo_man_takedown(struct ttm_bo_device *bdev,
-			struct ttm_mem_type_manager *man);
+			unsigned type);
 #endif
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
