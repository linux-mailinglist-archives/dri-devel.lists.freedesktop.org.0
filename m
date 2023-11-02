Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D4747DEBC1
	for <lists+dri-devel@lfdr.de>; Thu,  2 Nov 2023 05:24:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25C2210E7FD;
	Thu,  2 Nov 2023 04:24:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18DF510E7F9;
 Thu,  2 Nov 2023 04:24:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698899071; x=1730435071;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=633an+sC7R5RcLrkrKMH9N1hMZcmLC3khbxtaiNAfjY=;
 b=eNGUnQXuieCftfuy8xWv4BX82cE2JnMDTXK0KY7YRrN7ccsNzW8sR++j
 M9wLPHCGnV3UqBI4VmbFq36PjVQWlx4Omm4VEwMNlCUwtjxM9wOkREQoO
 s8r3K6jW7F5pgkMgUWQ8pRANPvRveTwZNiaDQjDV+DaJv4+08reZTuOZh
 FJaivSe9WPn1diApJFH5u04+0JQFMOdZDdF2od60RY7La0zwslcAFHUoL
 xhC6xE7ZOfBfCV4Lc2JRUoqFBnb3RGzwGugrt2/pVZTjD91xcNm2gfbpn
 7MtNTabL1RKhaYNZBQkv4uPwfouEh5Wz5l5MUKAWVoE9AZuyokzLEmVA4 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10881"; a="452930901"
X-IronPort-AV: E=Sophos;i="6.03,270,1694761200"; d="scan'208";a="452930901"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Nov 2023 21:24:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10881"; a="884762613"
X-IronPort-AV: E=Sophos;i="6.03,270,1694761200"; d="scan'208";a="884762613"
Received: from szeng-desk.jf.intel.com ([10.165.21.149])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Nov 2023 21:24:30 -0700
From: Oak Zeng <oak.zeng@intel.com>
To: dri-devel@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Subject: [RFC 01/11] drm/ttm: re-parameter ttm_device_init
Date: Thu,  2 Nov 2023 00:32:56 -0400
Message-Id: <20231102043306.2931989-2-oak.zeng@intel.com>
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

Change the 3rd parameter of ttm_device_init from
struct device * to struct drm_device *. This is
a prepare work for moving lru_lock from ttm_device
to drm_device.

Signed-off-by: Oak Zeng <oak.zeng@intel.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c       | 2 +-
 drivers/gpu/drm/drm_gem_vram_helper.c         | 2 +-
 drivers/gpu/drm/i915/intel_region_ttm.c       | 2 +-
 drivers/gpu/drm/loongson/lsdc_ttm.c           | 2 +-
 drivers/gpu/drm/nouveau/nouveau_ttm.c         | 2 +-
 drivers/gpu/drm/radeon/radeon_ttm.c           | 2 +-
 drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c | 2 +-
 drivers/gpu/drm/ttm/ttm_device.c              | 7 ++++---
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c           | 2 +-
 drivers/gpu/drm/xe/xe_device.c                | 2 +-
 include/drm/ttm/ttm_device.h                  | 3 ++-
 11 files changed, 15 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index 4e51dce3aab5..5cdbc901cbe2 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -1817,7 +1817,7 @@ int amdgpu_ttm_init(struct amdgpu_device *adev)
 	mutex_init(&adev->mman.gtt_window_lock);
 
 	/* No others user of address space so set it to 0 */
-	r = ttm_device_init(&adev->mman.bdev, &amdgpu_bo_driver, adev->dev,
+	r = ttm_device_init(&adev->mman.bdev, &amdgpu_bo_driver, adev_to_drm(adev),
 			       adev_to_drm(adev)->anon_inode->i_mapping,
 			       adev_to_drm(adev)->vma_offset_manager,
 			       adev->need_swiotlb,
diff --git a/drivers/gpu/drm/drm_gem_vram_helper.c b/drivers/gpu/drm/drm_gem_vram_helper.c
index b67eafa55715..56749e40459f 100644
--- a/drivers/gpu/drm/drm_gem_vram_helper.c
+++ b/drivers/gpu/drm/drm_gem_vram_helper.c
@@ -1002,7 +1002,7 @@ static int drm_vram_mm_init(struct drm_vram_mm *vmm, struct drm_device *dev,
 	vmm->vram_base = vram_base;
 	vmm->vram_size = vram_size;
 
-	ret = ttm_device_init(&vmm->bdev, &bo_driver, dev->dev,
+	ret = ttm_device_init(&vmm->bdev, &bo_driver, dev,
 				 dev->anon_inode->i_mapping,
 				 dev->vma_offset_manager,
 				 false, true);
diff --git a/drivers/gpu/drm/i915/intel_region_ttm.c b/drivers/gpu/drm/i915/intel_region_ttm.c
index bf6097e7433d..b845782c9859 100644
--- a/drivers/gpu/drm/i915/intel_region_ttm.c
+++ b/drivers/gpu/drm/i915/intel_region_ttm.c
@@ -33,7 +33,7 @@ int intel_region_ttm_device_init(struct drm_i915_private *dev_priv)
 	struct drm_device *drm = &dev_priv->drm;
 
 	return ttm_device_init(&dev_priv->bdev, i915_ttm_driver(),
-			       drm->dev, drm->anon_inode->i_mapping,
+			       drm, drm->anon_inode->i_mapping,
 			       drm->vma_offset_manager, false, false);
 }
 
diff --git a/drivers/gpu/drm/loongson/lsdc_ttm.c b/drivers/gpu/drm/loongson/lsdc_ttm.c
index bf79dc55afa4..bd68cb9366b5 100644
--- a/drivers/gpu/drm/loongson/lsdc_ttm.c
+++ b/drivers/gpu/drm/loongson/lsdc_ttm.c
@@ -548,7 +548,7 @@ int lsdc_ttm_init(struct lsdc_device *ldev)
 	unsigned long num_gtt_pages;
 	int ret;
 
-	ret = ttm_device_init(&ldev->bdev, &lsdc_bo_driver, ddev->dev,
+	ret = ttm_device_init(&ldev->bdev, &lsdc_bo_driver, ddev,
 			      ddev->anon_inode->i_mapping,
 			      ddev->vma_offset_manager, false, true);
 	if (ret)
diff --git a/drivers/gpu/drm/nouveau/nouveau_ttm.c b/drivers/gpu/drm/nouveau/nouveau_ttm.c
index 486f39f31a38..831918437850 100644
--- a/drivers/gpu/drm/nouveau/nouveau_ttm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_ttm.c
@@ -299,7 +299,7 @@ nouveau_ttm_init(struct nouveau_drm *drm)
 		drm->agp.cma = pci->agp.cma;
 	}
 
-	ret = ttm_device_init(&drm->ttm.bdev, &nouveau_bo_driver, drm->dev->dev,
+	ret = ttm_device_init(&drm->ttm.bdev, &nouveau_bo_driver, dev,
 				  dev->anon_inode->i_mapping,
 				  dev->vma_offset_manager,
 				  drm_need_swiotlb(drm->client.mmu.dmabits),
diff --git a/drivers/gpu/drm/radeon/radeon_ttm.c b/drivers/gpu/drm/radeon/radeon_ttm.c
index 4eb83ccc4906..77ca50187162 100644
--- a/drivers/gpu/drm/radeon/radeon_ttm.c
+++ b/drivers/gpu/drm/radeon/radeon_ttm.c
@@ -688,7 +688,7 @@ int radeon_ttm_init(struct radeon_device *rdev)
 	int r;
 
 	/* No others user of address space so set it to 0 */
-	r = ttm_device_init(&rdev->mman.bdev, &radeon_bo_driver, rdev->dev,
+	r = ttm_device_init(&rdev->mman.bdev, &radeon_bo_driver, rdev->ddev,
 			       rdev->ddev->anon_inode->i_mapping,
 			       rdev->ddev->vma_offset_manager,
 			       rdev->need_swiotlb,
diff --git a/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c b/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c
index 81661d8827aa..63eb6fdc3460 100644
--- a/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c
+++ b/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c
@@ -16,7 +16,7 @@ int ttm_device_kunit_init(struct ttm_test_devices *priv,
 	struct drm_device *drm = priv->drm;
 	int err;
 
-	err = ttm_device_init(ttm, &ttm_dev_funcs, drm->dev,
+	err = ttm_device_init(ttm, &ttm_dev_funcs, drm,
 			      drm->anon_inode->i_mapping,
 			      drm->vma_offset_manager,
 			      use_dma_alloc, use_dma32);
diff --git a/drivers/gpu/drm/ttm/ttm_device.c b/drivers/gpu/drm/ttm/ttm_device.c
index 7726a72befc5..12014788b595 100644
--- a/drivers/gpu/drm/ttm/ttm_device.c
+++ b/drivers/gpu/drm/ttm/ttm_device.c
@@ -179,7 +179,7 @@ EXPORT_SYMBOL(ttm_device_swapout);
  *
  * @bdev: A pointer to a struct ttm_device to initialize.
  * @funcs: Function table for the device.
- * @dev: The core kernel device pointer for DMA mappings and allocations.
+ * @drm: drm_device pointer
  * @mapping: The address space to use for this bo.
  * @vma_manager: A pointer to a vma manager.
  * @use_dma_alloc: If coherent DMA allocation API should be used.
@@ -190,7 +190,7 @@ EXPORT_SYMBOL(ttm_device_swapout);
  * !0: Failure.
  */
 int ttm_device_init(struct ttm_device *bdev, const struct ttm_device_funcs *funcs,
-		    struct device *dev, struct address_space *mapping,
+		    struct drm_device *drm, struct address_space *mapping,
 		    struct drm_vma_offset_manager *vma_manager,
 		    bool use_dma_alloc, bool use_dma32)
 {
@@ -213,7 +213,8 @@ int ttm_device_init(struct ttm_device *bdev, const struct ttm_device_funcs *func
 	bdev->funcs = funcs;
 
 	ttm_sys_man_init(bdev);
-	ttm_pool_init(&bdev->pool, dev, NUMA_NO_NODE, use_dma_alloc, use_dma32);
+	ttm_pool_init(&bdev->pool, drm?drm->dev:NULL, NUMA_NO_NODE,
+				use_dma_alloc, use_dma32);
 
 	bdev->vma_manager = vma_manager;
 	spin_lock_init(&bdev->lru_lock);
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
index 8b24ecf60e3e..cf1c1f16102a 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
@@ -1047,7 +1047,7 @@ static int vmw_driver_load(struct vmw_private *dev_priv, u32 pci_id)
 	}
 
 	ret = ttm_device_init(&dev_priv->bdev, &vmw_bo_driver,
-			      dev_priv->drm.dev,
+			      &dev_priv->drm,
 			      dev_priv->drm.anon_inode->i_mapping,
 			      dev_priv->drm.vma_offset_manager,
 			      dev_priv->map_mode == vmw_dma_alloc_coherent,
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index a964dc205da9..3377bfd5b1a1 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -191,7 +191,7 @@ struct xe_device *xe_device_create(struct pci_dev *pdev,
 	if (IS_ERR(xe))
 		return xe;
 
-	err = ttm_device_init(&xe->ttm, &xe_ttm_funcs, xe->drm.dev,
+	err = ttm_device_init(&xe->ttm, &xe_ttm_funcs, &xe->drm,
 			      xe->drm.anon_inode->i_mapping,
 			      xe->drm.vma_offset_manager, false, false);
 	if (WARN_ON(err))
diff --git a/include/drm/ttm/ttm_device.h b/include/drm/ttm/ttm_device.h
index c22f30535c84..bab868d55383 100644
--- a/include/drm/ttm/ttm_device.h
+++ b/include/drm/ttm/ttm_device.h
@@ -29,6 +29,7 @@
 #include <linux/workqueue.h>
 #include <drm/ttm/ttm_resource.h>
 #include <drm/ttm/ttm_pool.h>
+#include <drm/drm_device.h>
 
 struct ttm_device;
 struct ttm_placement;
@@ -288,7 +289,7 @@ static inline void ttm_set_driver_manager(struct ttm_device *bdev, int type,
 }
 
 int ttm_device_init(struct ttm_device *bdev, const struct ttm_device_funcs *funcs,
-		    struct device *dev, struct address_space *mapping,
+		    struct drm_device *drm, struct address_space *mapping,
 		    struct drm_vma_offset_manager *vma_manager,
 		    bool use_dma_alloc, bool use_dma32);
 void ttm_device_fini(struct ttm_device *bdev);
-- 
2.26.3

