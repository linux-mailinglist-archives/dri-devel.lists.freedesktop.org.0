Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 312EDBD2026
	for <lists+dri-devel@lfdr.de>; Mon, 13 Oct 2025 10:23:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 516A010E3F9;
	Mon, 13 Oct 2025 08:22:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="X1pMSAXI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA26F10E3F7;
 Mon, 13 Oct 2025 08:22:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=RGqbVTFwze/ZzvIVqdenEZQ4Kdh8wjX7kXPG3SINDLc=; b=X1pMSAXIBOMMZ+4IjWfXZaPUwE
 XQPe87XCPLCQBHxWVd+GX967BBjkb1PS4ujr8Hy+suVMT8kw0rkfE9RI+oZmo9iVekxge+n3CE/F8
 m+Gn/URFjFwnupPpB0hYCssp7ul/JrNRFJgeJBDbiLQJ5Q7N3JGA0+B/0PtHCDyzUN84doJOFDq4V
 QI8mZDvtiFo80pOuZc7nEtC9NI1ErGXuhJbxEStkeLkzxvxO/ssaxj10aAsGy2Vizx7rqotmJCpUS
 OUulxVQuMvR9VKbDfdyrke6LkCXHZRFzaxruYsLKsx/hEM0Mdf0NdRx/gH++TaobmvlMl3ukJyCu3
 ICWekCvQ==;
Received: from [84.66.36.92] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1v8DpS-008qJJ-Aw; Mon, 13 Oct 2025 10:22:50 +0200
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Danilo Krummrich <dakr@kernel.org>, Dave Airlie <airlied@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>, Lyude Paul <lyude@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Sui Jingfeng <suijingfeng@loongson.cn>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Zack Rusin <zack.rusin@broadcom.com>
Subject: [PATCH v4 3/5] drm/ttm: Replace multiple booleans with flags in
 device init
Date: Mon, 13 Oct 2025 09:22:38 +0100
Message-ID: <20251013082240.55263-4-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20251013082240.55263-1-tvrtko.ursulin@igalia.com>
References: <20251013082240.55263-1-tvrtko.ursulin@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Multiple consecutive boolean function arguments are usually not very
readable.

Replace the ones in ttm_device_init() with flags with the additional
benefit of soon being able to pass in more data with just a one off
code base churning cost.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: Danilo Krummrich <dakr@kernel.org>
Cc: Dave Airlie <airlied@redhat.com>
Cc: Gerd Hoffmann <kraxel@redhat.com>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Lyude Paul <lyude@redhat.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Sui Jingfeng <suijingfeng@loongson.cn>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Zack Rusin <zack.rusin@broadcom.com>
Acked-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c       |  4 ++--
 drivers/gpu/drm/drm_gem_vram_helper.c         |  2 +-
 drivers/gpu/drm/i915/intel_region_ttm.c       |  2 +-
 drivers/gpu/drm/loongson/lsdc_ttm.c           |  2 +-
 drivers/gpu/drm/nouveau/nouveau_ttm.c         |  4 ++--
 drivers/gpu/drm/qxl/qxl_ttm.c                 |  2 +-
 drivers/gpu/drm/radeon/radeon_ttm.c           |  4 ++--
 drivers/gpu/drm/ttm/tests/ttm_bo_test.c       | 16 +++++++-------
 .../gpu/drm/ttm/tests/ttm_bo_validate_test.c  |  2 +-
 drivers/gpu/drm/ttm/tests/ttm_device_test.c   | 12 +++++-----
 drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c | 22 ++++++++-----------
 drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.h |  7 ++----
 drivers/gpu/drm/ttm/ttm_device.c              |  9 +++-----
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c           |  4 ++--
 drivers/gpu/drm/xe/xe_device.c                |  2 +-
 include/drm/ttm/ttm_device.h                  |  2 +-
 16 files changed, 42 insertions(+), 54 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index 8f6d331e1ea2..948c6d0a422b 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -1930,8 +1930,8 @@ int amdgpu_ttm_init(struct amdgpu_device *adev)
 	r = ttm_device_init(&adev->mman.bdev, &amdgpu_bo_driver, adev->dev,
 			       adev_to_drm(adev)->anon_inode->i_mapping,
 			       adev_to_drm(adev)->vma_offset_manager,
-			       adev->need_swiotlb,
-			       dma_addressing_limited(adev->dev));
+			       (adev->need_swiotlb ? TTM_POOL_USE_DMA_ALLOC : 0) |
+			       (dma_addressing_limited(adev->dev) ? TTM_POOL_USE_DMA32 : 0));
 	if (r) {
 		dev_err(adev->dev,
 			"failed initializing buffer object driver(%d).\n", r);
diff --git a/drivers/gpu/drm/drm_gem_vram_helper.c b/drivers/gpu/drm/drm_gem_vram_helper.c
index 0bec6f66682b..efbd823443c0 100644
--- a/drivers/gpu/drm/drm_gem_vram_helper.c
+++ b/drivers/gpu/drm/drm_gem_vram_helper.c
@@ -859,7 +859,7 @@ static int drm_vram_mm_init(struct drm_vram_mm *vmm, struct drm_device *dev,
 	ret = ttm_device_init(&vmm->bdev, &bo_driver, dev->dev,
 				 dev->anon_inode->i_mapping,
 				 dev->vma_offset_manager,
-				 false, true);
+				 TTM_POOL_USE_DMA32);
 	if (ret)
 		return ret;
 
diff --git a/drivers/gpu/drm/i915/intel_region_ttm.c b/drivers/gpu/drm/i915/intel_region_ttm.c
index 04525d92bec5..47a69aad5c3f 100644
--- a/drivers/gpu/drm/i915/intel_region_ttm.c
+++ b/drivers/gpu/drm/i915/intel_region_ttm.c
@@ -34,7 +34,7 @@ int intel_region_ttm_device_init(struct drm_i915_private *dev_priv)
 
 	return ttm_device_init(&dev_priv->bdev, i915_ttm_driver(),
 			       drm->dev, drm->anon_inode->i_mapping,
-			       drm->vma_offset_manager, false, false);
+			       drm->vma_offset_manager, 0);
 }
 
 /**
diff --git a/drivers/gpu/drm/loongson/lsdc_ttm.c b/drivers/gpu/drm/loongson/lsdc_ttm.c
index 2e42c6970c9f..b74dadd1a9c6 100644
--- a/drivers/gpu/drm/loongson/lsdc_ttm.c
+++ b/drivers/gpu/drm/loongson/lsdc_ttm.c
@@ -544,7 +544,7 @@ int lsdc_ttm_init(struct lsdc_device *ldev)
 
 	ret = ttm_device_init(&ldev->bdev, &lsdc_bo_driver, ddev->dev,
 			      ddev->anon_inode->i_mapping,
-			      ddev->vma_offset_manager, false, true);
+			      ddev->vma_offset_manager, TTM_POOL_USE_DMA32);
 	if (ret)
 		return ret;
 
diff --git a/drivers/gpu/drm/nouveau/nouveau_ttm.c b/drivers/gpu/drm/nouveau/nouveau_ttm.c
index 7d2436e5d50d..34649eb2b7c5 100644
--- a/drivers/gpu/drm/nouveau/nouveau_ttm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_ttm.c
@@ -302,8 +302,8 @@ nouveau_ttm_init(struct nouveau_drm *drm)
 	ret = ttm_device_init(&drm->ttm.bdev, &nouveau_bo_driver, drm->dev->dev,
 				  dev->anon_inode->i_mapping,
 				  dev->vma_offset_manager,
-				  drm_need_swiotlb(drm->client.mmu.dmabits),
-				  drm->client.mmu.dmabits <= 32);
+				  (drm_need_swiotlb(drm->client.mmu.dmabits) ? TTM_POOL_USE_DMA_ALLOC : 0 ) |
+				  (drm->client.mmu.dmabits <= 32 ? TTM_POOL_USE_DMA32 : 0));
 	if (ret) {
 		NV_ERROR(drm, "error initialising bo driver, %d\n", ret);
 		return ret;
diff --git a/drivers/gpu/drm/qxl/qxl_ttm.c b/drivers/gpu/drm/qxl/qxl_ttm.c
index 765a144cea14..85d9df48affa 100644
--- a/drivers/gpu/drm/qxl/qxl_ttm.c
+++ b/drivers/gpu/drm/qxl/qxl_ttm.c
@@ -196,7 +196,7 @@ int qxl_ttm_init(struct qxl_device *qdev)
 	r = ttm_device_init(&qdev->mman.bdev, &qxl_bo_driver, NULL,
 			    qdev->ddev.anon_inode->i_mapping,
 			    qdev->ddev.vma_offset_manager,
-			    false, false);
+			    0);
 	if (r) {
 		DRM_ERROR("failed initializing buffer object driver(%d).\n", r);
 		return r;
diff --git a/drivers/gpu/drm/radeon/radeon_ttm.c b/drivers/gpu/drm/radeon/radeon_ttm.c
index 616d25c8c2de..95758054db65 100644
--- a/drivers/gpu/drm/radeon/radeon_ttm.c
+++ b/drivers/gpu/drm/radeon/radeon_ttm.c
@@ -683,8 +683,8 @@ int radeon_ttm_init(struct radeon_device *rdev)
 	r = ttm_device_init(&rdev->mman.bdev, &radeon_bo_driver, rdev->dev,
 			       rdev_to_drm(rdev)->anon_inode->i_mapping,
 			       rdev_to_drm(rdev)->vma_offset_manager,
-			       rdev->need_swiotlb,
-			       dma_addressing_limited(&rdev->pdev->dev));
+			       (rdev->need_swiotlb ? TTM_POOL_USE_DMA_ALLOC : 0 ) |
+			       (dma_addressing_limited(&rdev->pdev->dev) ? TTM_POOL_USE_DMA32 : 0));
 	if (r) {
 		DRM_ERROR("failed initializing buffer object driver(%d).\n", r);
 		return r;
diff --git a/drivers/gpu/drm/ttm/tests/ttm_bo_test.c b/drivers/gpu/drm/ttm/tests/ttm_bo_test.c
index 5426b435f702..d468f8322072 100644
--- a/drivers/gpu/drm/ttm/tests/ttm_bo_test.c
+++ b/drivers/gpu/drm/ttm/tests/ttm_bo_test.c
@@ -251,7 +251,7 @@ static void ttm_bo_unreserve_basic(struct kunit *test)
 	ttm_dev = kunit_kzalloc(test, sizeof(*ttm_dev), GFP_KERNEL);
 	KUNIT_ASSERT_NOT_NULL(test, ttm_dev);
 
-	err = ttm_device_kunit_init(priv, ttm_dev, false, false);
+	err = ttm_device_kunit_init(priv, ttm_dev, 0);
 	KUNIT_ASSERT_EQ(test, err, 0);
 	priv->ttm_dev = ttm_dev;
 
@@ -290,7 +290,7 @@ static void ttm_bo_unreserve_pinned(struct kunit *test)
 	ttm_dev = kunit_kzalloc(test, sizeof(*ttm_dev), GFP_KERNEL);
 	KUNIT_ASSERT_NOT_NULL(test, ttm_dev);
 
-	err = ttm_device_kunit_init(priv, ttm_dev, false, false);
+	err = ttm_device_kunit_init(priv, ttm_dev, 0);
 	KUNIT_ASSERT_EQ(test, err, 0);
 	priv->ttm_dev = ttm_dev;
 
@@ -342,7 +342,7 @@ static void ttm_bo_unreserve_bulk(struct kunit *test)
 	resv = kunit_kzalloc(test, sizeof(*resv), GFP_KERNEL);
 	KUNIT_ASSERT_NOT_NULL(test, resv);
 
-	err = ttm_device_kunit_init(priv, ttm_dev, false, false);
+	err = ttm_device_kunit_init(priv, ttm_dev, 0);
 	KUNIT_ASSERT_EQ(test, err, 0);
 	priv->ttm_dev = ttm_dev;
 
@@ -394,7 +394,7 @@ static void ttm_bo_fini_basic(struct kunit *test)
 	ttm_dev = kunit_kzalloc(test, sizeof(*ttm_dev), GFP_KERNEL);
 	KUNIT_ASSERT_NOT_NULL(test, ttm_dev);
 
-	err = ttm_device_kunit_init(priv, ttm_dev, false, false);
+	err = ttm_device_kunit_init(priv, ttm_dev, 0);
 	KUNIT_ASSERT_EQ(test, err, 0);
 	priv->ttm_dev = ttm_dev;
 
@@ -437,7 +437,7 @@ static void ttm_bo_fini_shared_resv(struct kunit *test)
 	ttm_dev = kunit_kzalloc(test, sizeof(*ttm_dev), GFP_KERNEL);
 	KUNIT_ASSERT_NOT_NULL(test, ttm_dev);
 
-	err = ttm_device_kunit_init(priv, ttm_dev, false, false);
+	err = ttm_device_kunit_init(priv, ttm_dev, 0);
 	KUNIT_ASSERT_EQ(test, err, 0);
 	priv->ttm_dev = ttm_dev;
 
@@ -477,7 +477,7 @@ static void ttm_bo_pin_basic(struct kunit *test)
 	ttm_dev = kunit_kzalloc(test, sizeof(*ttm_dev), GFP_KERNEL);
 	KUNIT_ASSERT_NOT_NULL(test, ttm_dev);
 
-	err = ttm_device_kunit_init(priv, ttm_dev, false, false);
+	err = ttm_device_kunit_init(priv, ttm_dev, 0);
 	KUNIT_ASSERT_EQ(test, err, 0);
 	priv->ttm_dev = ttm_dev;
 
@@ -512,7 +512,7 @@ static void ttm_bo_pin_unpin_resource(struct kunit *test)
 	ttm_dev = kunit_kzalloc(test, sizeof(*ttm_dev), GFP_KERNEL);
 	KUNIT_ASSERT_NOT_NULL(test, ttm_dev);
 
-	err = ttm_device_kunit_init(priv, ttm_dev, false, false);
+	err = ttm_device_kunit_init(priv, ttm_dev, 0);
 	KUNIT_ASSERT_EQ(test, err, 0);
 	priv->ttm_dev = ttm_dev;
 
@@ -563,7 +563,7 @@ static void ttm_bo_multiple_pin_one_unpin(struct kunit *test)
 	ttm_dev = kunit_kzalloc(test, sizeof(*ttm_dev), GFP_KERNEL);
 	KUNIT_ASSERT_NOT_NULL(test, ttm_dev);
 
-	err = ttm_device_kunit_init(priv, ttm_dev, false, false);
+	err = ttm_device_kunit_init(priv, ttm_dev, 0);
 	KUNIT_ASSERT_EQ(test, err, 0);
 	priv->ttm_dev = ttm_dev;
 
diff --git a/drivers/gpu/drm/ttm/tests/ttm_bo_validate_test.c b/drivers/gpu/drm/ttm/tests/ttm_bo_validate_test.c
index 3a1eef83190c..17a570af296c 100644
--- a/drivers/gpu/drm/ttm/tests/ttm_bo_validate_test.c
+++ b/drivers/gpu/drm/ttm/tests/ttm_bo_validate_test.c
@@ -995,7 +995,7 @@ static void ttm_bo_validate_busy_domain_evict(struct kunit *test)
 	 */
 	ttm_device_fini(priv->ttm_dev);
 
-	err = ttm_device_kunit_init_bad_evict(test->priv, priv->ttm_dev, false, false);
+	err = ttm_device_kunit_init_bad_evict(test->priv, priv->ttm_dev);
 	KUNIT_ASSERT_EQ(test, err, 0);
 
 	ttm_mock_manager_init(priv->ttm_dev, mem_type, MANAGER_SIZE);
diff --git a/drivers/gpu/drm/ttm/tests/ttm_device_test.c b/drivers/gpu/drm/ttm/tests/ttm_device_test.c
index a7f2d303ef02..42ea010848ee 100644
--- a/drivers/gpu/drm/ttm/tests/ttm_device_test.c
+++ b/drivers/gpu/drm/ttm/tests/ttm_device_test.c
@@ -25,7 +25,7 @@ static void ttm_device_init_basic(struct kunit *test)
 	ttm_dev = kunit_kzalloc(test, sizeof(*ttm_dev), GFP_KERNEL);
 	KUNIT_ASSERT_NOT_NULL(test, ttm_dev);
 
-	err = ttm_device_kunit_init(priv, ttm_dev, false, false);
+	err = ttm_device_kunit_init(priv, ttm_dev, 0);
 	KUNIT_ASSERT_EQ(test, err, 0);
 
 	KUNIT_EXPECT_PTR_EQ(test, ttm_dev->funcs, &ttm_dev_funcs);
@@ -55,7 +55,7 @@ static void ttm_device_init_multiple(struct kunit *test)
 	KUNIT_ASSERT_NOT_NULL(test, ttm_devs);
 
 	for (i = 0; i < num_dev; i++) {
-		err = ttm_device_kunit_init(priv, &ttm_devs[i], false, false);
+		err = ttm_device_kunit_init(priv, &ttm_devs[i], 0);
 		KUNIT_ASSERT_EQ(test, err, 0);
 
 		KUNIT_EXPECT_PTR_EQ(test, ttm_devs[i].dev_mapping,
@@ -81,7 +81,7 @@ static void ttm_device_fini_basic(struct kunit *test)
 	ttm_dev = kunit_kzalloc(test, sizeof(*ttm_dev), GFP_KERNEL);
 	KUNIT_ASSERT_NOT_NULL(test, ttm_dev);
 
-	err = ttm_device_kunit_init(priv, ttm_dev, false, false);
+	err = ttm_device_kunit_init(priv, ttm_dev, 0);
 	KUNIT_ASSERT_EQ(test, err, 0);
 
 	man = ttm_manager_type(ttm_dev, TTM_PL_SYSTEM);
@@ -109,7 +109,7 @@ static void ttm_device_init_no_vma_man(struct kunit *test)
 	vma_man = drm->vma_offset_manager;
 	drm->vma_offset_manager = NULL;
 
-	err = ttm_device_kunit_init(priv, ttm_dev, false, false);
+	err = ttm_device_kunit_init(priv, ttm_dev, 0);
 	KUNIT_EXPECT_EQ(test, err, -EINVAL);
 
 	/* Bring the manager back for a graceful cleanup */
@@ -157,9 +157,7 @@ static void ttm_device_init_pools(struct kunit *test)
 	ttm_dev = kunit_kzalloc(test, sizeof(*ttm_dev), GFP_KERNEL);
 	KUNIT_ASSERT_NOT_NULL(test, ttm_dev);
 
-	err = ttm_device_kunit_init(priv, ttm_dev,
-				    params->flags & TTM_POOL_USE_DMA_ALLOC,
-				    params->flags & TTM_POOL_USE_DMA32);
+	err = ttm_device_kunit_init(priv, ttm_dev, params->flags);
 	KUNIT_ASSERT_EQ(test, err, 0);
 
 	pool = &ttm_dev->pool;
diff --git a/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c b/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c
index 7aaf0d1395ff..4b0fc4f5fcbf 100644
--- a/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c
+++ b/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c
@@ -117,8 +117,7 @@ static void bad_evict_flags(struct ttm_buffer_object *bo,
 
 static int ttm_device_kunit_init_with_funcs(struct ttm_test_devices *priv,
 					    struct ttm_device *ttm,
-					    bool use_dma_alloc,
-					    bool use_dma32,
+					    unsigned int pool_flags,
 					    struct ttm_device_funcs *funcs)
 {
 	struct drm_device *drm = priv->drm;
@@ -127,7 +126,7 @@ static int ttm_device_kunit_init_with_funcs(struct ttm_test_devices *priv,
 	err = ttm_device_init(ttm, funcs, drm->dev,
 			      drm->anon_inode->i_mapping,
 			      drm->vma_offset_manager,
-			      use_dma_alloc, use_dma32);
+			      pool_flags);
 
 	return err;
 }
@@ -143,11 +142,10 @@ EXPORT_SYMBOL_GPL(ttm_dev_funcs);
 
 int ttm_device_kunit_init(struct ttm_test_devices *priv,
 			  struct ttm_device *ttm,
-			  bool use_dma_alloc,
-			  bool use_dma32)
+			  unsigned int pool_flags)
 {
-	return ttm_device_kunit_init_with_funcs(priv, ttm, use_dma_alloc,
-						use_dma32, &ttm_dev_funcs);
+	return ttm_device_kunit_init_with_funcs(priv, ttm, pool_flags,
+						&ttm_dev_funcs);
 }
 EXPORT_SYMBOL_GPL(ttm_device_kunit_init);
 
@@ -161,12 +159,10 @@ struct ttm_device_funcs ttm_dev_funcs_bad_evict = {
 EXPORT_SYMBOL_GPL(ttm_dev_funcs_bad_evict);
 
 int ttm_device_kunit_init_bad_evict(struct ttm_test_devices *priv,
-				    struct ttm_device *ttm,
-				    bool use_dma_alloc,
-				    bool use_dma32)
+				    struct ttm_device *ttm)
 {
-	return ttm_device_kunit_init_with_funcs(priv, ttm, use_dma_alloc,
-						use_dma32, &ttm_dev_funcs_bad_evict);
+	return ttm_device_kunit_init_with_funcs(priv, ttm, 0,
+						&ttm_dev_funcs_bad_evict);
 }
 EXPORT_SYMBOL_GPL(ttm_device_kunit_init_bad_evict);
 
@@ -252,7 +248,7 @@ struct ttm_test_devices *ttm_test_devices_all(struct kunit *test)
 	ttm_dev = kunit_kzalloc(test, sizeof(*ttm_dev), GFP_KERNEL);
 	KUNIT_ASSERT_NOT_NULL(test, ttm_dev);
 
-	err = ttm_device_kunit_init(devs, ttm_dev, false, false);
+	err = ttm_device_kunit_init(devs, ttm_dev, 0);
 	KUNIT_ASSERT_EQ(test, err, 0);
 
 	devs->ttm_dev = ttm_dev;
diff --git a/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.h b/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.h
index c7da23232ffa..8112892ba290 100644
--- a/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.h
+++ b/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.h
@@ -28,12 +28,9 @@ struct ttm_test_devices {
 /* Building blocks for test-specific init functions */
 int ttm_device_kunit_init(struct ttm_test_devices *priv,
 			  struct ttm_device *ttm,
-			  bool use_dma_alloc,
-			  bool use_dma32);
+			  unsigned int pool_flags);
 int ttm_device_kunit_init_bad_evict(struct ttm_test_devices *priv,
-				    struct ttm_device *ttm,
-				    bool use_dma_alloc,
-				    bool use_dma32);
+				    struct ttm_device *ttm);
 struct ttm_buffer_object *ttm_bo_kunit_init(struct kunit *test,
 					    struct ttm_test_devices *devs,
 					    size_t size,
diff --git a/drivers/gpu/drm/ttm/ttm_device.c b/drivers/gpu/drm/ttm/ttm_device.c
index 250e9f10145d..43f9cab186b1 100644
--- a/drivers/gpu/drm/ttm/ttm_device.c
+++ b/drivers/gpu/drm/ttm/ttm_device.c
@@ -198,8 +198,7 @@ EXPORT_SYMBOL(ttm_device_swapout);
  * @dev: The core kernel device pointer for DMA mappings and allocations.
  * @mapping: The address space to use for this bo.
  * @vma_manager: A pointer to a vma manager.
- * @use_dma_alloc: If coherent DMA allocation API should be used.
- * @use_dma32: If we should use GFP_DMA32 for device memory allocations.
+ * @pool_flags: TTM_POOL_ flags.
  *
  * Initializes a struct ttm_device:
  * Returns:
@@ -208,7 +207,7 @@ EXPORT_SYMBOL(ttm_device_swapout);
 int ttm_device_init(struct ttm_device *bdev, const struct ttm_device_funcs *funcs,
 		    struct device *dev, struct address_space *mapping,
 		    struct drm_vma_offset_manager *vma_manager,
-		    bool use_dma_alloc, bool use_dma32)
+		    unsigned int pool_flags)
 {
 	struct ttm_global *glob = &ttm_glob;
 	int ret, nid;
@@ -236,9 +235,7 @@ int ttm_device_init(struct ttm_device *bdev, const struct ttm_device_funcs *func
 	else
 		nid = NUMA_NO_NODE;
 
-	ttm_pool_init(&bdev->pool, dev, nid,
-		      (use_dma_alloc ? TTM_POOL_USE_DMA_ALLOC : 0) |
-		      (use_dma32 ? TTM_POOL_USE_DMA32 : 0));
+	ttm_pool_init(&bdev->pool, dev, nid, pool_flags);
 
 	bdev->vma_manager = vma_manager;
 	spin_lock_init(&bdev->lru_lock);
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
index 8ff958d119be..b5e0ba3c02b9 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
@@ -1023,8 +1023,8 @@ static int vmw_driver_load(struct vmw_private *dev_priv, u32 pci_id)
 			      dev_priv->drm.dev,
 			      dev_priv->drm.anon_inode->i_mapping,
 			      dev_priv->drm.vma_offset_manager,
-			      dev_priv->map_mode == vmw_dma_alloc_coherent,
-			      false);
+			      (dev_priv->map_mode == vmw_dma_alloc_coherent) ?
+			      TTM_POOL_USE_DMA_ALLOC : 0);
 	if (unlikely(ret != 0)) {
 		drm_err(&dev_priv->drm,
 			"Failed initializing TTM buffer object driver.\n");
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 6f8f72fd1b13..6813fd75226e 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -437,7 +437,7 @@ struct xe_device *xe_device_create(struct pci_dev *pdev,
 
 	err = ttm_device_init(&xe->ttm, &xe_ttm_funcs, xe->drm.dev,
 			      xe->drm.anon_inode->i_mapping,
-			      xe->drm.vma_offset_manager, false, false);
+			      xe->drm.vma_offset_manager, 0);
 	if (WARN_ON(err))
 		goto err;
 
diff --git a/include/drm/ttm/ttm_device.h b/include/drm/ttm/ttm_device.h
index 592b5f802859..baa1c0c3ed86 100644
--- a/include/drm/ttm/ttm_device.h
+++ b/include/drm/ttm/ttm_device.h
@@ -292,7 +292,7 @@ static inline void ttm_set_driver_manager(struct ttm_device *bdev, int type,
 int ttm_device_init(struct ttm_device *bdev, const struct ttm_device_funcs *funcs,
 		    struct device *dev, struct address_space *mapping,
 		    struct drm_vma_offset_manager *vma_manager,
-		    bool use_dma_alloc, bool use_dma32);
+		    unsigned int pool_flags);
 void ttm_device_fini(struct ttm_device *bdev);
 void ttm_device_clear_dma_mappings(struct ttm_device *bdev);
 
-- 
2.48.0

