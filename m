Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ACC67DEBC6
	for <lists+dri-devel@lfdr.de>; Thu,  2 Nov 2023 05:24:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F10EF10E808;
	Thu,  2 Nov 2023 04:24:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D8F310E7FF;
 Thu,  2 Nov 2023 04:24:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698899072; x=1730435072;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=F3OFjU24sUWWNI1HDbZ5mOYwa2qg9nmKmjhkLAPsc9Y=;
 b=Grwg1e1i6vPKj0fZYZBZ27KYdg7nF0dVtZUktY+BEBVlRJo5ac6bmuIh
 FLRok3nrmy4k2CkWTlfKI1c7cl+i0/1GFKfXdoyUiHg9k2WnwnsfQyaHQ
 fdliNMQdylD6DW8JCfZZ0JZ5nrcfGabC6oI3hlIMFbx0p8WaB+EeXpXcN
 CmZH9moaGRR+O72pWsJz07PbGz3TcLAh/GJG1QtsnG0L1pGbiDnN03nFN
 aaau3AcvbY+gYjcw7/TUU2R348Ef0mEyjPnueC2B/y6oP/VDFWTA2H1MS
 YggFf+20RM9Yuk2m3WLj83ikif4AMVCXWqkOIl7OxEWzQejCG3J8VG5iB A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10881"; a="452930923"
X-IronPort-AV: E=Sophos;i="6.03,270,1694761200"; d="scan'208";a="452930923"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Nov 2023 21:24:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10881"; a="884762632"
X-IronPort-AV: E=Sophos;i="6.03,270,1694761200"; d="scan'208";a="884762632"
Received: from szeng-desk.jf.intel.com ([10.165.21.149])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Nov 2023 21:24:30 -0700
From: Oak Zeng <oak.zeng@intel.com>
To: dri-devel@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Subject: [RFC 07/11] drm/ttm: re-parameterize a few ttm functions
Date: Thu,  2 Nov 2023 00:33:02 -0400
Message-Id: <20231102043306.2931989-8-oak.zeng@intel.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20231102043306.2931989-1-oak.zeng@intel.com>
References: <20231102043306.2931989-1-oak.zeng@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Thomas.Hellstrom@linux.intel.com, felix.kuehling@amd.com,
 brian.welty@intel.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add a struct drm_device *drm parameter to function
ttm_range_man_init, ttm_range_man_fini, ttm_sys_man_init,
and ttm_sys_man_free. This drm parameter will be used
in the coming patches to retrieve and initialize drm
lru manager.

Signed-off-by: Oak Zeng <oak.zeng@intel.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c |  8 ++++----
 drivers/gpu/drm/drm_gem_vram_helper.c   |  8 ++++----
 drivers/gpu/drm/loongson/lsdc_ttm.c     |  8 ++++----
 drivers/gpu/drm/nouveau/nouveau_ttm.c   |  8 ++++----
 drivers/gpu/drm/qxl/qxl_ttm.c           |  6 +++---
 drivers/gpu/drm/radeon/radeon_ttm.c     |  8 ++++----
 drivers/gpu/drm/ttm/ttm_device.c        |  2 +-
 drivers/gpu/drm/ttm/ttm_module.h        |  3 ++-
 drivers/gpu/drm/ttm/ttm_range_manager.c |  6 ++++--
 drivers/gpu/drm/ttm/ttm_sys_manager.c   |  6 +++++-
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c     |  4 ++--
 include/drm/ttm/ttm_range_manager.h     | 13 +++++++------
 12 files changed, 44 insertions(+), 36 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index 5cdbc901cbe2..cc0736f82a80 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -75,7 +75,7 @@ static int amdgpu_ttm_init_on_chip(struct amdgpu_device *adev,
 				    unsigned int type,
 				    uint64_t size_in_page)
 {
-	return ttm_range_man_init(&adev->mman.bdev, type,
+	return ttm_range_man_init(adev_to_drm(adev), &adev->mman.bdev, type,
 				  false, size_in_page);
 }
 
@@ -2026,9 +2026,9 @@ void amdgpu_ttm_fini(struct amdgpu_device *adev)
 	amdgpu_vram_mgr_fini(adev);
 	amdgpu_gtt_mgr_fini(adev);
 	amdgpu_preempt_mgr_fini(adev);
-	ttm_range_man_fini(&adev->mman.bdev, AMDGPU_PL_GDS);
-	ttm_range_man_fini(&adev->mman.bdev, AMDGPU_PL_GWS);
-	ttm_range_man_fini(&adev->mman.bdev, AMDGPU_PL_OA);
+	ttm_range_man_fini(adev_to_drm(adev), &adev->mman.bdev, AMDGPU_PL_GDS);
+	ttm_range_man_fini(adev_to_drm(adev), &adev->mman.bdev, AMDGPU_PL_GWS);
+	ttm_range_man_fini(adev_to_drm(adev), &adev->mman.bdev, AMDGPU_PL_OA);
 	ttm_device_fini(&adev->mman.bdev);
 	adev->mman.initialized = false;
 	DRM_INFO("amdgpu: ttm finalized\n");
diff --git a/drivers/gpu/drm/drm_gem_vram_helper.c b/drivers/gpu/drm/drm_gem_vram_helper.c
index 56749e40459f..5b18db72cc96 100644
--- a/drivers/gpu/drm/drm_gem_vram_helper.c
+++ b/drivers/gpu/drm/drm_gem_vram_helper.c
@@ -1009,7 +1009,7 @@ static int drm_vram_mm_init(struct drm_vram_mm *vmm, struct drm_device *dev,
 	if (ret)
 		return ret;
 
-	ret = ttm_range_man_init(&vmm->bdev, TTM_PL_VRAM,
+	ret = ttm_range_man_init(dev, &vmm->bdev, TTM_PL_VRAM,
 				 false, vram_size >> PAGE_SHIFT);
 	if (ret)
 		return ret;
@@ -1017,9 +1017,9 @@ static int drm_vram_mm_init(struct drm_vram_mm *vmm, struct drm_device *dev,
 	return 0;
 }
 
-static void drm_vram_mm_cleanup(struct drm_vram_mm *vmm)
+static void drm_vram_mm_cleanup(struct drm_device *drm, struct drm_vram_mm *vmm)
 {
-	ttm_range_man_fini(&vmm->bdev, TTM_PL_VRAM);
+	ttm_range_man_fini(drm, &vmm->bdev, TTM_PL_VRAM);
 	ttm_device_fini(&vmm->bdev);
 }
 
@@ -1056,7 +1056,7 @@ static void drm_vram_helper_release_mm(struct drm_device *dev)
 	if (!dev->vram_mm)
 		return;
 
-	drm_vram_mm_cleanup(dev->vram_mm);
+	drm_vram_mm_cleanup(dev, dev->vram_mm);
 	kfree(dev->vram_mm);
 	dev->vram_mm = NULL;
 }
diff --git a/drivers/gpu/drm/loongson/lsdc_ttm.c b/drivers/gpu/drm/loongson/lsdc_ttm.c
index bd68cb9366b5..f7f226314a09 100644
--- a/drivers/gpu/drm/loongson/lsdc_ttm.c
+++ b/drivers/gpu/drm/loongson/lsdc_ttm.c
@@ -533,8 +533,8 @@ static void lsdc_ttm_fini(struct drm_device *ddev, void *data)
 {
 	struct lsdc_device *ldev = (struct lsdc_device *)data;
 
-	ttm_range_man_fini(&ldev->bdev, TTM_PL_VRAM);
-	ttm_range_man_fini(&ldev->bdev, TTM_PL_TT);
+	ttm_range_man_fini(ddev, &ldev->bdev, TTM_PL_VRAM);
+	ttm_range_man_fini(ddev, &ldev->bdev, TTM_PL_TT);
 
 	ttm_device_fini(&ldev->bdev);
 
@@ -556,7 +556,7 @@ int lsdc_ttm_init(struct lsdc_device *ldev)
 
 	num_vram_pages = ldev->vram_size >> PAGE_SHIFT;
 
-	ret = ttm_range_man_init(&ldev->bdev, TTM_PL_VRAM, false, num_vram_pages);
+	ret = ttm_range_man_init(&ldev->base, &ldev->bdev, TTM_PL_VRAM, false, num_vram_pages);
 	if (unlikely(ret))
 		return ret;
 
@@ -567,7 +567,7 @@ int lsdc_ttm_init(struct lsdc_device *ldev)
 
 	num_gtt_pages = ldev->gtt_size >> PAGE_SHIFT;
 
-	ret = ttm_range_man_init(&ldev->bdev, TTM_PL_TT, true, num_gtt_pages);
+	ret = ttm_range_man_init(&ldev->base, &ldev->bdev, TTM_PL_TT, true, num_gtt_pages);
 	if (unlikely(ret))
 		return ret;
 
diff --git a/drivers/gpu/drm/nouveau/nouveau_ttm.c b/drivers/gpu/drm/nouveau/nouveau_ttm.c
index 831918437850..1898f27f0510 100644
--- a/drivers/gpu/drm/nouveau/nouveau_ttm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_ttm.c
@@ -194,7 +194,7 @@ nouveau_ttm_init_vram(struct nouveau_drm *drm)
 		ttm_resource_manager_set_used(man, true);
 		return 0;
 	} else {
-		return ttm_range_man_init(&drm->ttm.bdev, TTM_PL_VRAM, false,
+		return ttm_range_man_init(drm->dev, &drm->ttm.bdev, TTM_PL_VRAM, false,
 					  drm->gem.vram_available >> PAGE_SHIFT);
 	}
 }
@@ -211,7 +211,7 @@ nouveau_ttm_fini_vram(struct nouveau_drm *drm)
 		ttm_set_driver_manager(&drm->ttm.bdev, TTM_PL_VRAM, NULL);
 		kfree(man);
 	} else
-		ttm_range_man_fini(&drm->ttm.bdev, TTM_PL_VRAM);
+		ttm_range_man_fini(drm->dev, &drm->ttm.bdev, TTM_PL_VRAM);
 }
 
 static int
@@ -226,7 +226,7 @@ nouveau_ttm_init_gtt(struct nouveau_drm *drm)
 	else if (!drm->agp.bridge)
 		func = &nv04_gart_manager;
 	else
-		return ttm_range_man_init(&drm->ttm.bdev, TTM_PL_TT, true,
+		return ttm_range_man_init(drm->dev, &drm->ttm.bdev, TTM_PL_TT, true,
 					  size_pages);
 
 	man = kzalloc(sizeof(*man), GFP_KERNEL);
@@ -248,7 +248,7 @@ nouveau_ttm_fini_gtt(struct nouveau_drm *drm)
 
 	if (drm->client.device.info.family < NV_DEVICE_INFO_V0_TESLA &&
 	    drm->agp.bridge)
-		ttm_range_man_fini(&drm->ttm.bdev, TTM_PL_TT);
+		ttm_range_man_fini(drm->dev, &drm->ttm.bdev, TTM_PL_TT);
 	else {
 		ttm_resource_manager_set_used(man, false);
 		ttm_resource_manager_evict_all(&drm->ttm.bdev, man);
diff --git a/drivers/gpu/drm/qxl/qxl_ttm.c b/drivers/gpu/drm/qxl/qxl_ttm.c
index 1a82629bce3f..9f984afca831 100644
--- a/drivers/gpu/drm/qxl/qxl_ttm.c
+++ b/drivers/gpu/drm/qxl/qxl_ttm.c
@@ -186,7 +186,7 @@ static int qxl_ttm_init_mem_type(struct qxl_device *qdev,
 				 unsigned int type,
 				 uint64_t size)
 {
-	return ttm_range_man_init(&qdev->mman.bdev, type, false, size);
+	return ttm_range_man_init(&qdev->ddev, &qdev->mman.bdev, type, false, size);
 }
 
 int qxl_ttm_init(struct qxl_device *qdev)
@@ -227,8 +227,8 @@ int qxl_ttm_init(struct qxl_device *qdev)
 
 void qxl_ttm_fini(struct qxl_device *qdev)
 {
-	ttm_range_man_fini(&qdev->mman.bdev, TTM_PL_VRAM);
-	ttm_range_man_fini(&qdev->mman.bdev, TTM_PL_PRIV);
+	ttm_range_man_fini(&qdev->ddev, &qdev->mman.bdev, TTM_PL_VRAM);
+	ttm_range_man_fini(&qdev->ddev, &qdev->mman.bdev, TTM_PL_PRIV);
 	ttm_device_fini(&qdev->mman.bdev);
 	DRM_INFO("qxl: ttm finalized\n");
 }
diff --git a/drivers/gpu/drm/radeon/radeon_ttm.c b/drivers/gpu/drm/radeon/radeon_ttm.c
index 77ca50187162..5ab3f229082e 100644
--- a/drivers/gpu/drm/radeon/radeon_ttm.c
+++ b/drivers/gpu/drm/radeon/radeon_ttm.c
@@ -68,13 +68,13 @@ struct radeon_device *radeon_get_rdev(struct ttm_device *bdev)
 
 static int radeon_ttm_init_vram(struct radeon_device *rdev)
 {
-	return ttm_range_man_init(&rdev->mman.bdev, TTM_PL_VRAM,
+	return ttm_range_man_init(rdev->ddev, &rdev->mman.bdev, TTM_PL_VRAM,
 				  false, rdev->mc.real_vram_size >> PAGE_SHIFT);
 }
 
 static int radeon_ttm_init_gtt(struct radeon_device *rdev)
 {
-	return ttm_range_man_init(&rdev->mman.bdev, TTM_PL_TT,
+	return ttm_range_man_init(rdev->ddev, &rdev->mman.bdev, TTM_PL_TT,
 				  true, rdev->mc.gtt_size >> PAGE_SHIFT);
 }
 
@@ -753,8 +753,8 @@ void radeon_ttm_fini(struct radeon_device *rdev)
 		}
 		radeon_bo_unref(&rdev->stolen_vga_memory);
 	}
-	ttm_range_man_fini(&rdev->mman.bdev, TTM_PL_VRAM);
-	ttm_range_man_fini(&rdev->mman.bdev, TTM_PL_TT);
+	ttm_range_man_fini(rdev->ddev, &rdev->mman.bdev, TTM_PL_VRAM);
+	ttm_range_man_fini(rdev->ddev, &rdev->mman.bdev, TTM_PL_TT);
 	ttm_device_fini(&rdev->mman.bdev);
 	radeon_gart_fini(rdev);
 	rdev->mman.initialized = false;
diff --git a/drivers/gpu/drm/ttm/ttm_device.c b/drivers/gpu/drm/ttm/ttm_device.c
index e8c8006ba748..393c3e27016e 100644
--- a/drivers/gpu/drm/ttm/ttm_device.c
+++ b/drivers/gpu/drm/ttm/ttm_device.c
@@ -212,7 +212,7 @@ int ttm_device_init(struct ttm_device *bdev, const struct ttm_device_funcs *func
 
 	bdev->funcs = funcs;
 
-	ttm_sys_man_init(bdev);
+	ttm_sys_man_init(drm, bdev);
 	ttm_pool_init(&bdev->pool, drm?drm->dev:NULL, NUMA_NO_NODE,
 				use_dma_alloc, use_dma32);
 
diff --git a/drivers/gpu/drm/ttm/ttm_module.h b/drivers/gpu/drm/ttm/ttm_module.h
index 767fe22aed48..6c1443704a35 100644
--- a/drivers/gpu/drm/ttm/ttm_module.h
+++ b/drivers/gpu/drm/ttm/ttm_module.h
@@ -35,9 +35,10 @@
 
 struct dentry;
 struct ttm_device;
+struct drm_device;
 
 extern struct dentry *ttm_debugfs_root;
 
-void ttm_sys_man_init(struct ttm_device *bdev);
+void ttm_sys_man_init(struct drm_device *drm, struct ttm_device *bdev);
 
 #endif /* _TTM_MODULE_H_ */
diff --git a/drivers/gpu/drm/ttm/ttm_range_manager.c b/drivers/gpu/drm/ttm/ttm_range_manager.c
index ae11d07eb63a..db1ae370580d 100644
--- a/drivers/gpu/drm/ttm/ttm_range_manager.c
+++ b/drivers/gpu/drm/ttm/ttm_range_manager.c
@@ -166,6 +166,7 @@ static const struct ttm_resource_manager_func ttm_range_manager_func = {
  * ttm_range_man_init_nocheck - Initialise a generic range manager for the
  * selected memory type.
  *
+ * @drm: drm device
  * @bdev: ttm device
  * @type: memory manager type
  * @use_tt: if the memory manager uses tt
@@ -175,7 +176,7 @@ static const struct ttm_resource_manager_func ttm_range_manager_func = {
  *
  * Return: %0 on success or a negative error code on failure
  */
-int ttm_range_man_init_nocheck(struct ttm_device *bdev,
+int ttm_range_man_init_nocheck(struct drm_device *drm, struct ttm_device *bdev,
 		       unsigned type, bool use_tt,
 		       unsigned long p_size)
 {
@@ -206,12 +207,13 @@ EXPORT_SYMBOL(ttm_range_man_init_nocheck);
  * ttm_range_man_fini_nocheck - Remove the generic range manager from a slot
  * and tear it down.
  *
+ * @drm: drm device
  * @bdev: ttm device
  * @type: memory manager type
  *
  * Return: %0 on success or a negative error code on failure
  */
-int ttm_range_man_fini_nocheck(struct ttm_device *bdev,
+int ttm_range_man_fini_nocheck(struct drm_device *drm, struct ttm_device *bdev,
 		       unsigned type)
 {
 	struct ttm_resource_manager *man = ttm_manager_type(bdev, type);
diff --git a/drivers/gpu/drm/ttm/ttm_sys_manager.c b/drivers/gpu/drm/ttm/ttm_sys_manager.c
index 2ced169513cb..f0f026d40a69 100644
--- a/drivers/gpu/drm/ttm/ttm_sys_manager.c
+++ b/drivers/gpu/drm/ttm/ttm_sys_manager.c
@@ -20,6 +20,10 @@ static int ttm_sys_man_alloc(struct ttm_resource_manager *man,
 	return 0;
 }
 
+/* FIXME: Need to call drm_lru_mgr_fini. This requires a
+ * struct drm_device *drm parameter which need the change
+ * the definition of struct ttm_resource_manager_func. A
+ * very intrusive change. Leave it for now */
 static void ttm_sys_man_free(struct ttm_resource_manager *man,
 			     struct ttm_resource *res)
 {
@@ -32,7 +36,7 @@ static const struct ttm_resource_manager_func ttm_sys_manager_func = {
 	.free = ttm_sys_man_free,
 };
 
-void ttm_sys_man_init(struct ttm_device *bdev)
+void ttm_sys_man_init(struct drm_device *drm, struct ttm_device *bdev)
 {
 	struct ttm_resource_manager *man = &bdev->sysman;
 
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
index cf1c1f16102a..1a0c161e9977 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
@@ -708,7 +708,7 @@ static int vmw_dma_masks(struct vmw_private *dev_priv)
 static int vmw_vram_manager_init(struct vmw_private *dev_priv)
 {
 	int ret;
-	ret = ttm_range_man_init(&dev_priv->bdev, TTM_PL_VRAM, false,
+	ret = ttm_range_man_init(&dev_priv->drm, &dev_priv->bdev, TTM_PL_VRAM, false,
 				 dev_priv->vram_size >> PAGE_SHIFT);
 	ttm_resource_manager_set_used(ttm_manager_type(&dev_priv->bdev, TTM_PL_VRAM), false);
 	return ret;
@@ -716,7 +716,7 @@ static int vmw_vram_manager_init(struct vmw_private *dev_priv)
 
 static void vmw_vram_manager_fini(struct vmw_private *dev_priv)
 {
-	ttm_range_man_fini(&dev_priv->bdev, TTM_PL_VRAM);
+	ttm_range_man_fini(&dev_priv->drm, &dev_priv->bdev, TTM_PL_VRAM);
 }
 
 static int vmw_setup_pci_resources(struct vmw_private *dev,
diff --git a/include/drm/ttm/ttm_range_manager.h b/include/drm/ttm/ttm_range_manager.h
index becdb88c4d84..33cb5016bde6 100644
--- a/include/drm/ttm/ttm_range_manager.h
+++ b/include/drm/ttm/ttm_range_manager.h
@@ -34,23 +34,24 @@ to_ttm_range_mgr_node(struct ttm_resource *res)
 	return container_of(res, struct ttm_range_mgr_node, base);
 }
 
-int ttm_range_man_init_nocheck(struct ttm_device *bdev,
+int ttm_range_man_init_nocheck(struct drm_device *drm, struct ttm_device *bdev,
 		       unsigned type, bool use_tt,
 		       unsigned long p_size);
-int ttm_range_man_fini_nocheck(struct ttm_device *bdev,
+int ttm_range_man_fini_nocheck(struct drm_device *drm, struct ttm_device *bdev,
 		       unsigned type);
-static __always_inline int ttm_range_man_init(struct ttm_device *bdev,
+static __always_inline int ttm_range_man_init(struct drm_device *drm,
+			   struct ttm_device *bdev,
 		       unsigned int type, bool use_tt,
 		       unsigned long p_size)
 {
 	BUILD_BUG_ON(__builtin_constant_p(type) && type >= DRM_NUM_MEM_TYPES);
-	return ttm_range_man_init_nocheck(bdev, type, use_tt, p_size);
+	return ttm_range_man_init_nocheck(drm, bdev, type, use_tt, p_size);
 }
 
-static __always_inline int ttm_range_man_fini(struct ttm_device *bdev,
+static __always_inline int ttm_range_man_fini(struct drm_device *drm, struct ttm_device *bdev,
 		       unsigned int type)
 {
 	BUILD_BUG_ON(__builtin_constant_p(type) && type >= DRM_NUM_MEM_TYPES);
-	return ttm_range_man_fini_nocheck(bdev, type);
+	return ttm_range_man_fini_nocheck(drm, bdev, type);
 }
 #endif
-- 
2.26.3

