Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42C6698D316
	for <lists+dri-devel@lfdr.de>; Wed,  2 Oct 2024 14:24:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCF4710E70E;
	Wed,  2 Oct 2024 12:24:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lNP8KP3W";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 929EF10E70A;
 Wed,  2 Oct 2024 12:24:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727871887; x=1759407887;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=r/ae0DCkNOc7amjgK+BIh/uG2LNAJJJGO2PMP7citmU=;
 b=lNP8KP3WFNtjL5v2JPsTHADW7cD7IDOZ+gaVXHwI0jchAogi+BHXBUi5
 hr1mnf38IzwmQ5WBv+MOSzabQTi38OxPdVaJ1jNaI1zrggTALqctwscFh
 LWg3GSeDpMtr0Hp1OoIzGp+o2TatsIH4iPmIoHpQXJPsYwPrjshAU/lFj
 c0djYjVRvcU3JveVmjG2YUSNJmo0vcUW8KwPTkcIRIRm65rCXwBeIXybq
 1NzaEBe9dEPGC20gFZKga6bmGsXlan6qp7dv2ygsPyANqsa2LZSC0EX2j
 qd9vB8hKpGsQ/qsO5NzftwjN9wuZqg05OSelq5YIrnYipMmepUco/2tIr g==;
X-CSE-ConnectionGUID: XGvHjeLES32WjPP3Bm4aKQ==
X-CSE-MsgGUID: Hlw5/aKGTh6+TaeqtSoXcQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11213"; a="30735383"
X-IronPort-AV: E=Sophos;i="6.11,171,1725346800"; d="scan'208";a="30735383"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2024 05:24:46 -0700
X-CSE-ConnectionGUID: RNdbzWYFT2yjlr6DE2JBRw==
X-CSE-MsgGUID: ZldhgsIqSiegxgVMnJlFxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,171,1725346800"; d="scan'208";a="74221157"
Received: from oandoniu-mobl3.ger.corp.intel.com (HELO fedora..)
 ([10.245.244.67])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2024 05:24:44 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, spice-devel@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Zack Rusin <zack.rusin@broadcom.com>,
 bcm-kernel-feedback-list@broadcom.com,
 Sui Jingfeng <suijingfeng@loongson.cn>,
 Matthew Brost <matthew.brost@intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 1/2] drm/ttm: Change ttm_device_init to use a struct
 instead of multiple bools
Date: Wed,  2 Oct 2024 14:24:21 +0200
Message-ID: <20241002122422.287276-2-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20241002122422.287276-1-thomas.hellstrom@linux.intel.com>
References: <20241002122422.287276-1-thomas.hellstrom@linux.intel.com>
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

The ttm_device_init funcition uses multiple bool arguments. That means
readability in the caller becomes poor, and all callers need to change if
yet another bool is added.

Instead use a struct with multiple single-bit flags. This addresses both
problems. Prefer it over using defines or enums with explicit bit shifts,
since converting to and from these bit values uses logical operations or
tests which are implicit with the struct usage, and ofc type-checking.

This is in preparation of adding yet another bool flag parameter to the
function.

Cc: Christian König <christian.koenig@amd.com>
Cc: amd-gfx@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org
Cc: nouveau@lists.freedesktop.org
Cc: spice-devel@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
Cc: Zack Rusin <zack.rusin@broadcom.com>
Cc: <bcm-kernel-feedback-list@broadcom.com>
Cc: Sui Jingfeng <suijingfeng@loongson.cn>
Cc: <intel-xe@lists.freedesktop.org>
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c       |  6 ++++--
 drivers/gpu/drm/drm_gem_vram_helper.c         |  7 ++++---
 drivers/gpu/drm/i915/intel_region_ttm.c       |  3 ++-
 drivers/gpu/drm/loongson/lsdc_ttm.c           |  5 ++++-
 drivers/gpu/drm/nouveau/nouveau_ttm.c         |  7 +++++--
 drivers/gpu/drm/qxl/qxl_ttm.c                 |  2 +-
 drivers/gpu/drm/radeon/radeon_ttm.c           |  6 ++++--
 drivers/gpu/drm/ttm/tests/ttm_bo_test.c       | 16 +++++++--------
 .../gpu/drm/ttm/tests/ttm_bo_validate_test.c  |  3 ++-
 drivers/gpu/drm/ttm/tests/ttm_device_test.c   | 16 ++++++++-------
 drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c | 20 ++++++++-----------
 drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.h |  6 ++----
 drivers/gpu/drm/ttm/ttm_device.c              |  7 +++----
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c           |  4 ++--
 drivers/gpu/drm/xe/xe_device.c                |  3 ++-
 include/drm/ttm/ttm_device.h                  | 12 ++++++++++-
 16 files changed, 71 insertions(+), 52 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index 74adb983ab03..e43635ac54fd 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -1853,8 +1853,10 @@ int amdgpu_ttm_init(struct amdgpu_device *adev)
 	r = ttm_device_init(&adev->mman.bdev, &amdgpu_bo_driver, adev->dev,
 			       adev_to_drm(adev)->anon_inode->i_mapping,
 			       adev_to_drm(adev)->vma_offset_manager,
-			       adev->need_swiotlb,
-			       dma_addressing_limited(adev->dev));
+			       (struct ttm_device_init_flags){
+				       .use_dma_alloc = adev->need_swiotlb,
+				       .use_dma32 = dma_addressing_limited(adev->dev)
+			       });
 	if (r) {
 		DRM_ERROR("failed initializing buffer object driver(%d).\n", r);
 		return r;
diff --git a/drivers/gpu/drm/drm_gem_vram_helper.c b/drivers/gpu/drm/drm_gem_vram_helper.c
index 22b1fe9c03b8..7c3165b00378 100644
--- a/drivers/gpu/drm/drm_gem_vram_helper.c
+++ b/drivers/gpu/drm/drm_gem_vram_helper.c
@@ -931,9 +931,10 @@ static int drm_vram_mm_init(struct drm_vram_mm *vmm, struct drm_device *dev,
 	vmm->vram_size = vram_size;
 
 	ret = ttm_device_init(&vmm->bdev, &bo_driver, dev->dev,
-				 dev->anon_inode->i_mapping,
-				 dev->vma_offset_manager,
-				 false, true);
+			      dev->anon_inode->i_mapping,
+			      dev->vma_offset_manager,
+			      (struct ttm_device_init_flags)
+			      {.use_dma32 = true});
 	if (ret)
 		return ret;
 
diff --git a/drivers/gpu/drm/i915/intel_region_ttm.c b/drivers/gpu/drm/i915/intel_region_ttm.c
index 04525d92bec5..db34da63814c 100644
--- a/drivers/gpu/drm/i915/intel_region_ttm.c
+++ b/drivers/gpu/drm/i915/intel_region_ttm.c
@@ -34,7 +34,8 @@ int intel_region_ttm_device_init(struct drm_i915_private *dev_priv)
 
 	return ttm_device_init(&dev_priv->bdev, i915_ttm_driver(),
 			       drm->dev, drm->anon_inode->i_mapping,
-			       drm->vma_offset_manager, false, false);
+			       drm->vma_offset_manager,
+			       (struct ttm_device_init_flags){});
 }
 
 /**
diff --git a/drivers/gpu/drm/loongson/lsdc_ttm.c b/drivers/gpu/drm/loongson/lsdc_ttm.c
index 2e42c6970c9f..c684f1636f3f 100644
--- a/drivers/gpu/drm/loongson/lsdc_ttm.c
+++ b/drivers/gpu/drm/loongson/lsdc_ttm.c
@@ -544,7 +544,10 @@ int lsdc_ttm_init(struct lsdc_device *ldev)
 
 	ret = ttm_device_init(&ldev->bdev, &lsdc_bo_driver, ddev->dev,
 			      ddev->anon_inode->i_mapping,
-			      ddev->vma_offset_manager, false, true);
+			      ddev->vma_offset_manager,
+			      (struct ttm_device_init_flags){
+				      .use_dma32 = true
+			      });
 	if (ret)
 		return ret;
 
diff --git a/drivers/gpu/drm/nouveau/nouveau_ttm.c b/drivers/gpu/drm/nouveau/nouveau_ttm.c
index e244927eb5d4..5f89d2b40425 100644
--- a/drivers/gpu/drm/nouveau/nouveau_ttm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_ttm.c
@@ -302,8 +302,11 @@ nouveau_ttm_init(struct nouveau_drm *drm)
 	ret = ttm_device_init(&drm->ttm.bdev, &nouveau_bo_driver, drm->dev->dev,
 				  dev->anon_inode->i_mapping,
 				  dev->vma_offset_manager,
-				  drm_need_swiotlb(drm->client.mmu.dmabits),
-				  drm->client.mmu.dmabits <= 32);
+				  (struct ttm_device_init_flags){
+					  .use_dma_alloc =
+					  drm_need_swiotlb(drm->client.mmu.dmabits),
+					  .use_dma32 = (drm->client.mmu.dmabits <= 32)
+				  });
 	if (ret) {
 		NV_ERROR(drm, "error initialising bo driver, %d\n", ret);
 		return ret;
diff --git a/drivers/gpu/drm/qxl/qxl_ttm.c b/drivers/gpu/drm/qxl/qxl_ttm.c
index 765a144cea14..ced4c60c4650 100644
--- a/drivers/gpu/drm/qxl/qxl_ttm.c
+++ b/drivers/gpu/drm/qxl/qxl_ttm.c
@@ -196,7 +196,7 @@ int qxl_ttm_init(struct qxl_device *qdev)
 	r = ttm_device_init(&qdev->mman.bdev, &qxl_bo_driver, NULL,
 			    qdev->ddev.anon_inode->i_mapping,
 			    qdev->ddev.vma_offset_manager,
-			    false, false);
+			    (struct ttm_device_init_flags){});
 	if (r) {
 		DRM_ERROR("failed initializing buffer object driver(%d).\n", r);
 		return r;
diff --git a/drivers/gpu/drm/radeon/radeon_ttm.c b/drivers/gpu/drm/radeon/radeon_ttm.c
index 69d0c12fa419..2915473e4956 100644
--- a/drivers/gpu/drm/radeon/radeon_ttm.c
+++ b/drivers/gpu/drm/radeon/radeon_ttm.c
@@ -684,8 +684,10 @@ int radeon_ttm_init(struct radeon_device *rdev)
 	r = ttm_device_init(&rdev->mman.bdev, &radeon_bo_driver, rdev->dev,
 			       rdev_to_drm(rdev)->anon_inode->i_mapping,
 			       rdev_to_drm(rdev)->vma_offset_manager,
-			       rdev->need_swiotlb,
-			       dma_addressing_limited(&rdev->pdev->dev));
+			       (struct ttm_device_init_flags){
+					.use_dma_alloc = rdev->need_swiotlb,
+					.use_dma32 = dma_addressing_limited(&rdev->pdev->dev)
+				});
 	if (r) {
 		DRM_ERROR("failed initializing buffer object driver(%d).\n", r);
 		return r;
diff --git a/drivers/gpu/drm/ttm/tests/ttm_bo_test.c b/drivers/gpu/drm/ttm/tests/ttm_bo_test.c
index f0a7eb62116c..8a2ab90c6e8f 100644
--- a/drivers/gpu/drm/ttm/tests/ttm_bo_test.c
+++ b/drivers/gpu/drm/ttm/tests/ttm_bo_test.c
@@ -251,7 +251,7 @@ static void ttm_bo_unreserve_basic(struct kunit *test)
 	ttm_dev = kunit_kzalloc(test, sizeof(*ttm_dev), GFP_KERNEL);
 	KUNIT_ASSERT_NOT_NULL(test, ttm_dev);
 
-	err = ttm_device_kunit_init(priv, ttm_dev, false, false);
+	err = ttm_device_kunit_init(priv, ttm_dev, (struct ttm_device_init_flags){});
 	KUNIT_ASSERT_EQ(test, err, 0);
 	priv->ttm_dev = ttm_dev;
 
@@ -290,7 +290,7 @@ static void ttm_bo_unreserve_pinned(struct kunit *test)
 	ttm_dev = kunit_kzalloc(test, sizeof(*ttm_dev), GFP_KERNEL);
 	KUNIT_ASSERT_NOT_NULL(test, ttm_dev);
 
-	err = ttm_device_kunit_init(priv, ttm_dev, false, false);
+	err = ttm_device_kunit_init(priv, ttm_dev, (struct ttm_device_init_flags){});
 	KUNIT_ASSERT_EQ(test, err, 0);
 	priv->ttm_dev = ttm_dev;
 
@@ -342,7 +342,7 @@ static void ttm_bo_unreserve_bulk(struct kunit *test)
 	resv = kunit_kzalloc(test, sizeof(*resv), GFP_KERNEL);
 	KUNIT_ASSERT_NOT_NULL(test, ttm_dev);
 
-	err = ttm_device_kunit_init(priv, ttm_dev, false, false);
+	err = ttm_device_kunit_init(priv, ttm_dev, (struct ttm_device_init_flags){});
 	KUNIT_ASSERT_EQ(test, err, 0);
 	priv->ttm_dev = ttm_dev;
 
@@ -394,7 +394,7 @@ static void ttm_bo_put_basic(struct kunit *test)
 	ttm_dev = kunit_kzalloc(test, sizeof(*ttm_dev), GFP_KERNEL);
 	KUNIT_ASSERT_NOT_NULL(test, ttm_dev);
 
-	err = ttm_device_kunit_init(priv, ttm_dev, false, false);
+	err = ttm_device_kunit_init(priv, ttm_dev, (struct ttm_device_init_flags){});
 	KUNIT_ASSERT_EQ(test, err, 0);
 	priv->ttm_dev = ttm_dev;
 
@@ -437,7 +437,7 @@ static void ttm_bo_put_shared_resv(struct kunit *test)
 	ttm_dev = kunit_kzalloc(test, sizeof(*ttm_dev), GFP_KERNEL);
 	KUNIT_ASSERT_NOT_NULL(test, ttm_dev);
 
-	err = ttm_device_kunit_init(priv, ttm_dev, false, false);
+	err = ttm_device_kunit_init(priv, ttm_dev, (struct ttm_device_init_flags){});
 	KUNIT_ASSERT_EQ(test, err, 0);
 	priv->ttm_dev = ttm_dev;
 
@@ -477,7 +477,7 @@ static void ttm_bo_pin_basic(struct kunit *test)
 	ttm_dev = kunit_kzalloc(test, sizeof(*ttm_dev), GFP_KERNEL);
 	KUNIT_ASSERT_NOT_NULL(test, ttm_dev);
 
-	err = ttm_device_kunit_init(priv, ttm_dev, false, false);
+	err = ttm_device_kunit_init(priv, ttm_dev, (struct ttm_device_init_flags){});
 	KUNIT_ASSERT_EQ(test, err, 0);
 	priv->ttm_dev = ttm_dev;
 
@@ -512,7 +512,7 @@ static void ttm_bo_pin_unpin_resource(struct kunit *test)
 	ttm_dev = kunit_kzalloc(test, sizeof(*ttm_dev), GFP_KERNEL);
 	KUNIT_ASSERT_NOT_NULL(test, ttm_dev);
 
-	err = ttm_device_kunit_init(priv, ttm_dev, false, false);
+	err = ttm_device_kunit_init(priv, ttm_dev, (struct ttm_device_init_flags){});
 	KUNIT_ASSERT_EQ(test, err, 0);
 	priv->ttm_dev = ttm_dev;
 
@@ -563,7 +563,7 @@ static void ttm_bo_multiple_pin_one_unpin(struct kunit *test)
 	ttm_dev = kunit_kzalloc(test, sizeof(*ttm_dev), GFP_KERNEL);
 	KUNIT_ASSERT_NOT_NULL(test, ttm_dev);
 
-	err = ttm_device_kunit_init(priv, ttm_dev, false, false);
+	err = ttm_device_kunit_init(priv, ttm_dev, (struct ttm_device_init_flags){});
 	KUNIT_ASSERT_EQ(test, err, 0);
 	priv->ttm_dev = ttm_dev;
 
diff --git a/drivers/gpu/drm/ttm/tests/ttm_bo_validate_test.c b/drivers/gpu/drm/ttm/tests/ttm_bo_validate_test.c
index 1adf18481ea0..c69b9707e6d2 100644
--- a/drivers/gpu/drm/ttm/tests/ttm_bo_validate_test.c
+++ b/drivers/gpu/drm/ttm/tests/ttm_bo_validate_test.c
@@ -1044,7 +1044,8 @@ static void ttm_bo_validate_busy_domain_evict(struct kunit *test)
 	 */
 	ttm_device_fini(priv->ttm_dev);
 
-	err = ttm_device_kunit_init_bad_evict(test->priv, priv->ttm_dev, false, false);
+	err = ttm_device_kunit_init_bad_evict(test->priv, priv->ttm_dev,
+					      (struct ttm_device_init_flags){});
 	KUNIT_ASSERT_EQ(test, err, 0);
 
 	ttm_mock_manager_init(priv->ttm_dev, mem_type, MANAGER_SIZE);
diff --git a/drivers/gpu/drm/ttm/tests/ttm_device_test.c b/drivers/gpu/drm/ttm/tests/ttm_device_test.c
index 1621903818e5..9415c7b76e3b 100644
--- a/drivers/gpu/drm/ttm/tests/ttm_device_test.c
+++ b/drivers/gpu/drm/ttm/tests/ttm_device_test.c
@@ -25,7 +25,7 @@ static void ttm_device_init_basic(struct kunit *test)
 	ttm_dev = kunit_kzalloc(test, sizeof(*ttm_dev), GFP_KERNEL);
 	KUNIT_ASSERT_NOT_NULL(test, ttm_dev);
 
-	err = ttm_device_kunit_init(priv, ttm_dev, false, false);
+	err = ttm_device_kunit_init(priv, ttm_dev, (struct ttm_device_init_flags){});
 	KUNIT_ASSERT_EQ(test, err, 0);
 
 	KUNIT_EXPECT_PTR_EQ(test, ttm_dev->funcs, &ttm_dev_funcs);
@@ -55,7 +55,8 @@ static void ttm_device_init_multiple(struct kunit *test)
 	KUNIT_ASSERT_NOT_NULL(test, ttm_devs);
 
 	for (i = 0; i < num_dev; i++) {
-		err = ttm_device_kunit_init(priv, &ttm_devs[i], false, false);
+		err = ttm_device_kunit_init(priv, &ttm_devs[i],
+					    (struct ttm_device_init_flags){});
 		KUNIT_ASSERT_EQ(test, err, 0);
 
 		KUNIT_EXPECT_PTR_EQ(test, ttm_devs[i].dev_mapping,
@@ -81,7 +82,7 @@ static void ttm_device_fini_basic(struct kunit *test)
 	ttm_dev = kunit_kzalloc(test, sizeof(*ttm_dev), GFP_KERNEL);
 	KUNIT_ASSERT_NOT_NULL(test, ttm_dev);
 
-	err = ttm_device_kunit_init(priv, ttm_dev, false, false);
+	err = ttm_device_kunit_init(priv, ttm_dev, (struct ttm_device_init_flags){});
 	KUNIT_ASSERT_EQ(test, err, 0);
 
 	man = ttm_manager_type(ttm_dev, TTM_PL_SYSTEM);
@@ -109,7 +110,7 @@ static void ttm_device_init_no_vma_man(struct kunit *test)
 	vma_man = drm->vma_offset_manager;
 	drm->vma_offset_manager = NULL;
 
-	err = ttm_device_kunit_init(priv, ttm_dev, false, false);
+	err = ttm_device_kunit_init(priv, ttm_dev, (struct ttm_device_init_flags){});
 	KUNIT_EXPECT_EQ(test, err, -EINVAL);
 
 	/* Bring the manager back for a graceful cleanup */
@@ -162,9 +163,10 @@ static void ttm_device_init_pools(struct kunit *test)
 	ttm_dev = kunit_kzalloc(test, sizeof(*ttm_dev), GFP_KERNEL);
 	KUNIT_ASSERT_NOT_NULL(test, ttm_dev);
 
-	err = ttm_device_kunit_init(priv, ttm_dev,
-				    params->use_dma_alloc,
-				    params->use_dma32);
+	err = ttm_device_kunit_init(priv, ttm_dev, (struct ttm_device_init_flags){
+			.use_dma_alloc = params->use_dma_alloc,
+			.use_dma32 = params->use_dma32
+		});
 	KUNIT_ASSERT_EQ(test, err, 0);
 
 	pool = &ttm_dev->pool;
diff --git a/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c b/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c
index b91c13f46225..24706fabb1c9 100644
--- a/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c
+++ b/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c
@@ -114,8 +114,7 @@ static void bad_evict_flags(struct ttm_buffer_object *bo,
 
 static int ttm_device_kunit_init_with_funcs(struct ttm_test_devices *priv,
 					    struct ttm_device *ttm,
-					    bool use_dma_alloc,
-					    bool use_dma32,
+					    const struct ttm_device_init_flags flags,
 					    struct ttm_device_funcs *funcs)
 {
 	struct drm_device *drm = priv->drm;
@@ -124,7 +123,7 @@ static int ttm_device_kunit_init_with_funcs(struct ttm_test_devices *priv,
 	err = ttm_device_init(ttm, funcs, drm->dev,
 			      drm->anon_inode->i_mapping,
 			      drm->vma_offset_manager,
-			      use_dma_alloc, use_dma32);
+			      flags);
 
 	return err;
 }
@@ -140,11 +139,9 @@ EXPORT_SYMBOL_GPL(ttm_dev_funcs);
 
 int ttm_device_kunit_init(struct ttm_test_devices *priv,
 			  struct ttm_device *ttm,
-			  bool use_dma_alloc,
-			  bool use_dma32)
+			  const struct ttm_device_init_flags flags)
 {
-	return ttm_device_kunit_init_with_funcs(priv, ttm, use_dma_alloc,
-						use_dma32, &ttm_dev_funcs);
+	return ttm_device_kunit_init_with_funcs(priv, ttm, flags, &ttm_dev_funcs);
 }
 EXPORT_SYMBOL_GPL(ttm_device_kunit_init);
 
@@ -159,11 +156,10 @@ EXPORT_SYMBOL_GPL(ttm_dev_funcs_bad_evict);
 
 int ttm_device_kunit_init_bad_evict(struct ttm_test_devices *priv,
 				    struct ttm_device *ttm,
-				    bool use_dma_alloc,
-				    bool use_dma32)
+				    const struct ttm_device_init_flags flags)
 {
-	return ttm_device_kunit_init_with_funcs(priv, ttm, use_dma_alloc,
-						use_dma32, &ttm_dev_funcs_bad_evict);
+	return ttm_device_kunit_init_with_funcs(priv, ttm, flags,
+						&ttm_dev_funcs_bad_evict);
 }
 EXPORT_SYMBOL_GPL(ttm_device_kunit_init_bad_evict);
 
@@ -249,7 +245,7 @@ struct ttm_test_devices *ttm_test_devices_all(struct kunit *test)
 	ttm_dev = kunit_kzalloc(test, sizeof(*ttm_dev), GFP_KERNEL);
 	KUNIT_ASSERT_NOT_NULL(test, ttm_dev);
 
-	err = ttm_device_kunit_init(devs, ttm_dev, false, false);
+	err = ttm_device_kunit_init(devs, ttm_dev, (struct ttm_device_init_flags){});
 	KUNIT_ASSERT_EQ(test, err, 0);
 
 	devs->ttm_dev = ttm_dev;
diff --git a/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.h b/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.h
index c7da23232ffa..fbf0d3984f25 100644
--- a/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.h
+++ b/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.h
@@ -28,12 +28,10 @@ struct ttm_test_devices {
 /* Building blocks for test-specific init functions */
 int ttm_device_kunit_init(struct ttm_test_devices *priv,
 			  struct ttm_device *ttm,
-			  bool use_dma_alloc,
-			  bool use_dma32);
+			  const struct ttm_device_init_flags flags);
 int ttm_device_kunit_init_bad_evict(struct ttm_test_devices *priv,
 				    struct ttm_device *ttm,
-				    bool use_dma_alloc,
-				    bool use_dma32);
+				    const struct ttm_device_init_flags flags);
 struct ttm_buffer_object *ttm_bo_kunit_init(struct kunit *test,
 					    struct ttm_test_devices *devs,
 					    size_t size,
diff --git a/drivers/gpu/drm/ttm/ttm_device.c b/drivers/gpu/drm/ttm/ttm_device.c
index e7cc4954c1bc..0c85d10e5e0b 100644
--- a/drivers/gpu/drm/ttm/ttm_device.c
+++ b/drivers/gpu/drm/ttm/ttm_device.c
@@ -174,8 +174,7 @@ EXPORT_SYMBOL(ttm_device_swapout);
  * @dev: The core kernel device pointer for DMA mappings and allocations.
  * @mapping: The address space to use for this bo.
  * @vma_manager: A pointer to a vma manager.
- * @use_dma_alloc: If coherent DMA allocation API should be used.
- * @use_dma32: If we should use GFP_DMA32 for device memory allocations.
+ * @flags: Flags governing the device behaviour.
  *
  * Initializes a struct ttm_device:
  * Returns:
@@ -184,7 +183,7 @@ EXPORT_SYMBOL(ttm_device_swapout);
 int ttm_device_init(struct ttm_device *bdev, const struct ttm_device_funcs *funcs,
 		    struct device *dev, struct address_space *mapping,
 		    struct drm_vma_offset_manager *vma_manager,
-		    bool use_dma_alloc, bool use_dma32)
+		    const struct ttm_device_init_flags flags)
 {
 	struct ttm_global *glob = &ttm_glob;
 	int ret, nid;
@@ -212,7 +211,7 @@ int ttm_device_init(struct ttm_device *bdev, const struct ttm_device_funcs *func
 	else
 		nid = NUMA_NO_NODE;
 
-	ttm_pool_init(&bdev->pool, dev, nid, use_dma_alloc, use_dma32);
+	ttm_pool_init(&bdev->pool, dev, nid, flags.use_dma_alloc, flags.use_dma32);
 
 	bdev->vma_manager = vma_manager;
 	spin_lock_init(&bdev->lru_lock);
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
index cf7a89d002e4..7ff7e5d7a9f3 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
@@ -1049,8 +1049,8 @@ static int vmw_driver_load(struct vmw_private *dev_priv, u32 pci_id)
 			      dev_priv->drm.dev,
 			      dev_priv->drm.anon_inode->i_mapping,
 			      dev_priv->drm.vma_offset_manager,
-			      dev_priv->map_mode == vmw_dma_alloc_coherent,
-			      false);
+			      (struct ttm_device_init_flags)
+			      {.use_dma_alloc = (dev_priv->map_mode == vmw_dma_alloc_coherent)});
 	if (unlikely(ret != 0)) {
 		drm_err(&dev_priv->drm,
 			"Failed initializing TTM buffer object driver.\n");
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 09a7ad830e69..f9317f56ff9c 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -320,7 +320,8 @@ struct xe_device *xe_device_create(struct pci_dev *pdev,
 
 	err = ttm_device_init(&xe->ttm, &xe_ttm_funcs, xe->drm.dev,
 			      xe->drm.anon_inode->i_mapping,
-			      xe->drm.vma_offset_manager, false, false);
+			      xe->drm.vma_offset_manager,
+			      (struct ttm_device_init_flags){});
 	if (WARN_ON(err))
 		goto err;
 
diff --git a/include/drm/ttm/ttm_device.h b/include/drm/ttm/ttm_device.h
index c22f30535c84..1534bd946c78 100644
--- a/include/drm/ttm/ttm_device.h
+++ b/include/drm/ttm/ttm_device.h
@@ -287,10 +287,20 @@ static inline void ttm_set_driver_manager(struct ttm_device *bdev, int type,
 	bdev->man_drv[type] = manager;
 }
 
+/**
+ * struct ttm_device_init_flags - Flags for ttm device creation
+ */
+struct ttm_device_init_flags {
+	/** @use_dma_alloc: Whether coherent DMA allocation API should be used. */
+	u32 use_dma_alloc : 1;
+	/** @use_dma32: If we should use GFP_DMA32 for device memory allocations. */
+	u32 use_dma32 : 1;
+};
+
 int ttm_device_init(struct ttm_device *bdev, const struct ttm_device_funcs *funcs,
 		    struct device *dev, struct address_space *mapping,
 		    struct drm_vma_offset_manager *vma_manager,
-		    bool use_dma_alloc, bool use_dma32);
+		    const struct ttm_device_init_flags flags);
 void ttm_device_fini(struct ttm_device *bdev);
 void ttm_device_clear_dma_mappings(struct ttm_device *bdev);
 
-- 
2.46.0

