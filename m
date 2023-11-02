Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D0EC7DEBC7
	for <lists+dri-devel@lfdr.de>; Thu,  2 Nov 2023 05:24:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C9FE10E80D;
	Thu,  2 Nov 2023 04:24:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7349E10E7FA;
 Thu,  2 Nov 2023 04:24:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698899072; x=1730435072;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=AacnrrassvtP4cpr0jl++LRZndhOkoKuF+0l1IzrsrU=;
 b=WxLZo4QJeD2Do5qoyNLaFqgrXD3/73IdMd0Mf7NQpnXD0a7LP4pn9d8M
 YMXgXCs7lIN9od4yb6QRqNQBWjji9xeyAvKkE9Xcdichh2DUBSBwIL0FJ
 RWILE3XOA0jfWosvzKVQV+gTkww24tkwbFedpVIYlvAkSSEYcxRKL0ahr
 O19gbYVTqTeIyYaTFQhoGZTbP+3bZ+o2A2EGHJa8FPqkbuw1syVU1tS36
 Yd30oTZA4E13XkXYA+3wkYaRSzH2MrKf/OBIMFibM0qDySbOcQHHC0uYi
 JZ6zqb5FnhR556g1t1TmQmbmVBfwu58YlabzJtoH8N9ho18892IGxDTVZ A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10881"; a="452930926"
X-IronPort-AV: E=Sophos;i="6.03,270,1694761200"; d="scan'208";a="452930926"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Nov 2023 21:24:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10881"; a="884762636"
X-IronPort-AV: E=Sophos;i="6.03,270,1694761200"; d="scan'208";a="884762636"
Received: from szeng-desk.jf.intel.com ([10.165.21.149])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Nov 2023 21:24:30 -0700
From: Oak Zeng <oak.zeng@intel.com>
To: dri-devel@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Subject: [RFC 08/11] drm: Initialize drm lru manager
Date: Thu,  2 Nov 2023 00:33:03 -0400
Message-Id: <20231102043306.2931989-9-oak.zeng@intel.com>
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

Initialize lru_mgr for each memory type or memory region. Also set
ttm_resource_manager's weak reference to drm lru manager.

Signed-off-by: Oak Zeng <oak.zeng@intel.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c     |  6 ++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_preempt_mgr.c |  6 ++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c    |  6 ++++++
 drivers/gpu/drm/i915/i915_ttm_buddy_manager.c   | 10 ++++++++++
 drivers/gpu/drm/nouveau/nouveau_ttm.c           | 12 ++++++++++++
 drivers/gpu/drm/ttm/ttm_range_manager.c         |  6 ++++++
 drivers/gpu/drm/ttm/ttm_sys_manager.c           |  2 ++
 drivers/gpu/drm/vmwgfx/vmwgfx_system_manager.c  |  6 ++++++
 drivers/gpu/drm/xe/xe_ttm_sys_mgr.c             |  6 ++++++
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.c            |  6 ++++++
 10 files changed, 66 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
index 44367f03316f..57e8b1688977 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
@@ -278,6 +278,7 @@ int amdgpu_gtt_mgr_init(struct amdgpu_device *adev, uint64_t gtt_size)
 {
 	struct amdgpu_gtt_mgr *mgr = &adev->mman.gtt_mgr;
 	struct ttm_resource_manager *man = &mgr->manager;
+	struct drm_device *drm = adev_to_drm(adev);
 	uint64_t start, size;
 
 	man->use_tt = true;
@@ -292,6 +293,9 @@ int amdgpu_gtt_mgr_init(struct amdgpu_device *adev, uint64_t gtt_size)
 
 	ttm_set_driver_manager(&adev->mman.bdev, TTM_PL_TT, &mgr->manager);
 	ttm_resource_manager_set_used(man, true);
+
+	drm_lru_mgr_init(&drm->lru_mgr[TTM_PL_TT], gtt_size, &drm->lru_lock);
+	ttm_resource_manager_set_lru_mgr(man, &drm->lru_mgr[TTM_PL_TT]);
 	return 0;
 }
 
@@ -307,6 +311,7 @@ void amdgpu_gtt_mgr_fini(struct amdgpu_device *adev)
 {
 	struct amdgpu_gtt_mgr *mgr = &adev->mman.gtt_mgr;
 	struct ttm_resource_manager *man = &mgr->manager;
+	struct drm_device *drm = adev_to_drm(adev);
 	int ret;
 
 	ttm_resource_manager_set_used(man, false);
@@ -321,4 +326,5 @@ void amdgpu_gtt_mgr_fini(struct amdgpu_device *adev)
 
 	ttm_resource_manager_cleanup(man);
 	ttm_set_driver_manager(&adev->mman.bdev, TTM_PL_TT, NULL);
+	drm_lru_mgr_fini(&drm->lru_mgr[TTM_PL_TT]);
 }
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_preempt_mgr.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_preempt_mgr.c
index e8adfd0a570a..f989aca2bfc4 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_preempt_mgr.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_preempt_mgr.c
@@ -100,6 +100,7 @@ static const struct ttm_resource_manager_func amdgpu_preempt_mgr_func = {
 int amdgpu_preempt_mgr_init(struct amdgpu_device *adev)
 {
 	struct ttm_resource_manager *man = &adev->mman.preempt_mgr;
+	struct drm_device *drm = adev_to_drm(adev);
 	int ret;
 
 	man->use_tt = true;
@@ -115,6 +116,9 @@ int amdgpu_preempt_mgr_init(struct amdgpu_device *adev)
 
 	ttm_set_driver_manager(&adev->mman.bdev, AMDGPU_PL_PREEMPT, man);
 	ttm_resource_manager_set_used(man, true);
+
+	drm_lru_mgr_init(&drm->lru_mgr[AMDGPU_PL_PREEMPT], (1 << 30), &drm->lru_lock);
+	ttm_resource_manager_set_lru_mgr(man, &drm->lru_mgr[VMW_PL_SYSTEM]);
 	return 0;
 }
 
@@ -129,6 +133,7 @@ int amdgpu_preempt_mgr_init(struct amdgpu_device *adev)
 void amdgpu_preempt_mgr_fini(struct amdgpu_device *adev)
 {
 	struct ttm_resource_manager *man = &adev->mman.preempt_mgr;
+	struct drm_device *drm = adev_to_drm(adev);
 	int ret;
 
 	ttm_resource_manager_set_used(man, false);
@@ -141,4 +146,5 @@ void amdgpu_preempt_mgr_fini(struct amdgpu_device *adev)
 
 	ttm_resource_manager_cleanup(man);
 	ttm_set_driver_manager(&adev->mman.bdev, AMDGPU_PL_PREEMPT, NULL);
+	drm_lru_mgr_fini(&drm->lru_mgr[AMDGPU_PL_PREEMPT]);
 }
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
index b83e1741905e..0792d22508c9 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
@@ -884,6 +884,7 @@ int amdgpu_vram_mgr_init(struct amdgpu_device *adev)
 {
 	struct amdgpu_vram_mgr *mgr = &adev->mman.vram_mgr;
 	struct ttm_resource_manager *man = &mgr->manager;
+	struct drm_device *drm = adev_to_drm(adev);
 	int err;
 
 	ttm_resource_manager_init(man, &adev->mman.bdev,
@@ -907,6 +908,9 @@ int amdgpu_vram_mgr_init(struct amdgpu_device *adev)
 
 	ttm_set_driver_manager(&adev->mman.bdev, TTM_PL_VRAM, &mgr->manager);
 	ttm_resource_manager_set_used(man, true);
+	drm_lru_mgr_init(&drm->lru_mgr[TTM_PL_VRAM], adev->gmc.real_vram_size,
+						&drm->lru_lock);
+	ttm_resource_manager_set_lru_mgr(man, &drm->lru_mgr[TTM_PL_VRAM]);
 	return 0;
 }
 
@@ -922,6 +926,7 @@ void amdgpu_vram_mgr_fini(struct amdgpu_device *adev)
 {
 	struct amdgpu_vram_mgr *mgr = &adev->mman.vram_mgr;
 	struct ttm_resource_manager *man = &mgr->manager;
+	struct drm_device *drm = adev_to_drm(adev);
 	int ret;
 	struct amdgpu_vram_reservation *rsv, *temp;
 
@@ -945,4 +950,5 @@ void amdgpu_vram_mgr_fini(struct amdgpu_device *adev)
 
 	ttm_resource_manager_cleanup(man);
 	ttm_set_driver_manager(&adev->mman.bdev, TTM_PL_VRAM, NULL);
+	drm_lru_mgr_fini(&drm->lru_mgr[TTM_PL_VRAM]);
 }
diff --git a/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c b/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
index a1bc804cfa15..968f9c01152e 100644
--- a/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
+++ b/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
@@ -304,6 +304,9 @@ int i915_ttm_buddy_man_init(struct ttm_device *bdev,
 {
 	struct ttm_resource_manager *man;
 	struct i915_ttm_buddy_manager *bman;
+	struct drm_i915_private *i915 = container_of(bdev,
+							struct drm_i915_private, bdev);
+	struct drm_device *drm = &i915->drm;
 	int err;
 
 	bman = kzalloc(sizeof(*bman), GFP_KERNEL);
@@ -329,6 +332,9 @@ int i915_ttm_buddy_man_init(struct ttm_device *bdev,
 	ttm_resource_manager_set_used(man, true);
 	ttm_set_driver_manager(bdev, type, man);
 
+	drm_lru_mgr_init(&drm->lru_mgr[type], bman->mm.size >> PAGE_SHIFT, &drm->lru_lock);
+	ttm_resource_manager_set_lru_mgr(man, &drm->lru_mgr[type]);
+
 	return 0;
 
 err_free_bman:
@@ -350,6 +356,9 @@ int i915_ttm_buddy_man_fini(struct ttm_device *bdev, unsigned int type)
 {
 	struct ttm_resource_manager *man = ttm_manager_type(bdev, type);
 	struct i915_ttm_buddy_manager *bman = to_buddy_manager(man);
+	struct drm_i915_private *i915 = container_of(bdev,
+							struct drm_i915_private, bdev);
+	struct drm_device *drm = &i915->drm;
 	struct drm_buddy *mm = &bman->mm;
 	int ret;
 
@@ -369,6 +378,7 @@ int i915_ttm_buddy_man_fini(struct ttm_device *bdev, unsigned int type)
 	mutex_unlock(&bman->lock);
 
 	ttm_resource_manager_cleanup(man);
+	drm_lru_mgr_fini(&drm->lru_mgr[type]);
 	kfree(bman);
 
 	return 0;
diff --git a/drivers/gpu/drm/nouveau/nouveau_ttm.c b/drivers/gpu/drm/nouveau/nouveau_ttm.c
index 1898f27f0510..b0936c235ff6 100644
--- a/drivers/gpu/drm/nouveau/nouveau_ttm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_ttm.c
@@ -182,6 +182,7 @@ nouveau_ttm_init_vram(struct nouveau_drm *drm)
 {
 	if (drm->client.device.info.family >= NV_DEVICE_INFO_V0_TESLA) {
 		struct ttm_resource_manager *man = kzalloc(sizeof(*man), GFP_KERNEL);
+		struct drm_device *drm_dev = drm->dev;
 
 		if (!man)
 			return -ENOMEM;
@@ -192,6 +193,9 @@ nouveau_ttm_init_vram(struct nouveau_drm *drm)
 					  drm->gem.vram_available >> PAGE_SHIFT);
 		ttm_set_driver_manager(&drm->ttm.bdev, TTM_PL_VRAM, man);
 		ttm_resource_manager_set_used(man, true);
+		drm_lru_mgr_init(&drm_dev->lru_mgr[TTM_PL_VRAM],
+			drm->gem.vram_available >> PAGE_SHIFT, &drm_dev->lru_lock);
+		ttm_resource_manager_set_lru_mgr(man, &drm_dev->lru_mgr[TTM_PL_VRAM]);
 		return 0;
 	} else {
 		return ttm_range_man_init(drm->dev, &drm->ttm.bdev, TTM_PL_VRAM, false,
@@ -205,10 +209,13 @@ nouveau_ttm_fini_vram(struct nouveau_drm *drm)
 	struct ttm_resource_manager *man = ttm_manager_type(&drm->ttm.bdev, TTM_PL_VRAM);
 
 	if (drm->client.device.info.family >= NV_DEVICE_INFO_V0_TESLA) {
+		struct drm_device *drm_dev = drm->dev;
+
 		ttm_resource_manager_set_used(man, false);
 		ttm_resource_manager_evict_all(&drm->ttm.bdev, man);
 		ttm_resource_manager_cleanup(man);
 		ttm_set_driver_manager(&drm->ttm.bdev, TTM_PL_VRAM, NULL);
+		drm_lru_mgr_fini(&drm_dev->lru_mgr[TTM_PL_VRAM]);
 		kfree(man);
 	} else
 		ttm_range_man_fini(drm->dev, &drm->ttm.bdev, TTM_PL_VRAM);
@@ -220,6 +227,7 @@ nouveau_ttm_init_gtt(struct nouveau_drm *drm)
 	struct ttm_resource_manager *man;
 	unsigned long size_pages = drm->gem.gart_available >> PAGE_SHIFT;
 	const struct ttm_resource_manager_func *func = NULL;
+	struct drm_device *drm_dev = drm->dev;
 
 	if (drm->client.device.info.family >= NV_DEVICE_INFO_V0_TESLA)
 		func = &nouveau_gart_manager;
@@ -238,6 +246,8 @@ nouveau_ttm_init_gtt(struct nouveau_drm *drm)
 	ttm_resource_manager_init(man, &drm->ttm.bdev, size_pages);
 	ttm_set_driver_manager(&drm->ttm.bdev, TTM_PL_TT, man);
 	ttm_resource_manager_set_used(man, true);
+	drm_lru_mgr_init(&drm_dev->lru_mgr[TTM_PL_TT], size_pages, &drm_dev->lru_lock);
+	ttm_resource_manager_set_lru_mgr(man, &drm_dev->lru_mgr[TTM_PL_TT]);
 	return 0;
 }
 
@@ -245,6 +255,7 @@ static void
 nouveau_ttm_fini_gtt(struct nouveau_drm *drm)
 {
 	struct ttm_resource_manager *man = ttm_manager_type(&drm->ttm.bdev, TTM_PL_TT);
+	struct drm_device *drm_dev = drm->dev;
 
 	if (drm->client.device.info.family < NV_DEVICE_INFO_V0_TESLA &&
 	    drm->agp.bridge)
@@ -254,6 +265,7 @@ nouveau_ttm_fini_gtt(struct nouveau_drm *drm)
 		ttm_resource_manager_evict_all(&drm->ttm.bdev, man);
 		ttm_resource_manager_cleanup(man);
 		ttm_set_driver_manager(&drm->ttm.bdev, TTM_PL_TT, NULL);
+		drm_lru_mgr_fini(&drm_dev->lru_mgr[TTM_PL_TT]);
 		kfree(man);
 	}
 }
diff --git a/drivers/gpu/drm/ttm/ttm_range_manager.c b/drivers/gpu/drm/ttm/ttm_range_manager.c
index db1ae370580d..898ede7d25c4 100644
--- a/drivers/gpu/drm/ttm/ttm_range_manager.c
+++ b/drivers/gpu/drm/ttm/ttm_range_manager.c
@@ -36,6 +36,7 @@
 #include <drm/drm_mm.h>
 #include <linux/slab.h>
 #include <linux/spinlock.h>
+#include <drm/drm_evictable_lru.h>
 
 /*
  * Currently we use a spinlock for the lock, but a mutex *may* be
@@ -199,6 +200,10 @@ int ttm_range_man_init_nocheck(struct drm_device *drm, struct ttm_device *bdev,
 
 	ttm_set_driver_manager(bdev, type, &rman->manager);
 	ttm_resource_manager_set_used(man, true);
+
+	drm_lru_mgr_init(&drm->lru_mgr[type], p_size, &drm->lru_lock);
+	ttm_resource_manager_set_lru_mgr(man, &drm->lru_mgr[type]);
+
 	return 0;
 }
 EXPORT_SYMBOL(ttm_range_man_init_nocheck);
@@ -236,6 +241,7 @@ int ttm_range_man_fini_nocheck(struct drm_device *drm, struct ttm_device *bdev,
 
 	ttm_resource_manager_cleanup(man);
 	ttm_set_driver_manager(bdev, type, NULL);
+	drm_lru_mgr_fini(&drm->lru_mgr[type]);
 	kfree(rman);
 	return 0;
 }
diff --git a/drivers/gpu/drm/ttm/ttm_sys_manager.c b/drivers/gpu/drm/ttm/ttm_sys_manager.c
index f0f026d40a69..db410c7f73fe 100644
--- a/drivers/gpu/drm/ttm/ttm_sys_manager.c
+++ b/drivers/gpu/drm/ttm/ttm_sys_manager.c
@@ -50,4 +50,6 @@ void ttm_sys_man_init(struct drm_device *drm, struct ttm_device *bdev)
 	ttm_resource_manager_init(man, bdev, 0);
 	ttm_set_driver_manager(bdev, TTM_PL_SYSTEM, man);
 	ttm_resource_manager_set_used(man, true);
+	drm_lru_mgr_init(&drm->lru_mgr[TTM_PL_SYSTEM], 0, &drm->lru_lock);
+	ttm_resource_manager_set_lru_mgr(man, &drm->lru_mgr[TTM_PL_SYSTEM]);
 }
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_system_manager.c b/drivers/gpu/drm/vmwgfx/vmwgfx_system_manager.c
index ee7964cbdaca..102296399e00 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_system_manager.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_system_manager.c
@@ -62,6 +62,7 @@ int vmw_sys_man_init(struct vmw_private *dev_priv)
 	struct ttm_device *bdev = &dev_priv->bdev;
 	struct ttm_resource_manager *man =
 			kzalloc(sizeof(*man), GFP_KERNEL);
+	struct drm_device *drm = &dev_priv->drm;
 
 	if (!man)
 		return -ENOMEM;
@@ -72,6 +73,9 @@ int vmw_sys_man_init(struct vmw_private *dev_priv)
 	ttm_resource_manager_init(man, bdev, 0);
 	ttm_set_driver_manager(bdev, VMW_PL_SYSTEM, man);
 	ttm_resource_manager_set_used(man, true);
+
+	drm_lru_mgr_init(&drm->lru_mgr[WMW_PL_SYSTEM], 0, &drm->lru_lock);
+	ttm_resource_manager_set_lru_mgr(man, &drm->lru_mgr[VMW_PL_SYSTEM]);
 	return 0;
 }
 
@@ -79,6 +83,7 @@ void vmw_sys_man_fini(struct vmw_private *dev_priv)
 {
 	struct ttm_resource_manager *man = ttm_manager_type(&dev_priv->bdev,
 							    VMW_PL_SYSTEM);
+	struct drm_device *drm = &dev_priv->drm;
 
 	ttm_resource_manager_evict_all(&dev_priv->bdev, man);
 
@@ -86,5 +91,6 @@ void vmw_sys_man_fini(struct vmw_private *dev_priv)
 	ttm_resource_manager_cleanup(man);
 
 	ttm_set_driver_manager(&dev_priv->bdev, VMW_PL_SYSTEM, NULL);
+	drm_lru_mgr_fini(&drm->lru_mgr[VMW_PL_SYSTEM]);
 	kfree(man);
 }
diff --git a/drivers/gpu/drm/xe/xe_ttm_sys_mgr.c b/drivers/gpu/drm/xe/xe_ttm_sys_mgr.c
index 3e1fa0c832ca..ace42852a419 100644
--- a/drivers/gpu/drm/xe/xe_ttm_sys_mgr.c
+++ b/drivers/gpu/drm/xe/xe_ttm_sys_mgr.c
@@ -96,11 +96,13 @@ static void ttm_sys_mgr_fini(struct drm_device *drm, void *arg)
 
 	ttm_resource_manager_cleanup(man);
 	ttm_set_driver_manager(&xe->ttm, XE_PL_TT, NULL);
+	drm_lru_mgr_fini(&drm->lru_mgr[XE_PL_TT]);
 }
 
 int xe_ttm_sys_mgr_init(struct xe_device *xe)
 {
 	struct ttm_resource_manager *man = &xe->mem.sys_mgr;
+	struct drm_device *drm = &xe->drm;
 	struct sysinfo si;
 	u64 gtt_size;
 
@@ -114,5 +116,9 @@ int xe_ttm_sys_mgr_init(struct xe_device *xe)
 	ttm_resource_manager_init(man, &xe->ttm, gtt_size >> PAGE_SHIFT);
 	ttm_set_driver_manager(&xe->ttm, XE_PL_TT, man);
 	ttm_resource_manager_set_used(man, true);
+
+	drm_lru_mgr_init(&drm->lru_mgr[XE_PL_TT], gtt_size >> PAGE_SHIFT, &drm->lru_lock);
+	ttm_resource_manager_set_lru_mgr(man, &drm->lru_mgr[XE_PL_TT]);
+
 	return drmm_add_action_or_reset(&xe->drm, ttm_sys_mgr_fini, xe);
 }
diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
index 06a54c8bd46f..a3c1bf555c06 100644
--- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
+++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
@@ -328,6 +328,8 @@ static void ttm_vram_mgr_fini(struct drm_device *dev, void *arg)
 	ttm_resource_manager_cleanup(&mgr->manager);
 
 	ttm_set_driver_manager(&xe->ttm, mgr->mem_type, NULL);
+
+	drm_lru_mgr_fini(&dev->lru_mgr[mgr->mem_type]);
 }
 
 int __xe_ttm_vram_mgr_init(struct xe_device *xe, struct xe_ttm_vram_mgr *mgr,
@@ -335,6 +337,7 @@ int __xe_ttm_vram_mgr_init(struct xe_device *xe, struct xe_ttm_vram_mgr *mgr,
 			   u64 default_page_size)
 {
 	struct ttm_resource_manager *man = &mgr->manager;
+	struct drm_device *drm = &xe->drm;
 	int err;
 
 	man->func = &xe_ttm_vram_mgr_func;
@@ -350,6 +353,9 @@ int __xe_ttm_vram_mgr_init(struct xe_device *xe, struct xe_ttm_vram_mgr *mgr,
 	ttm_set_driver_manager(&xe->ttm, mem_type, &mgr->manager);
 	ttm_resource_manager_set_used(&mgr->manager, true);
 
+	drm_lru_mgr_init(&drm->lru_mgr[mem_type], size, &drm->lru_lock);
+	ttm_resource_manager_set_lru_mgr(man, &drm->lru_mgr[mem_type]);
+
 	return drmm_add_action_or_reset(&xe->drm, ttm_vram_mgr_fini, mgr);
 }
 
-- 
2.26.3

