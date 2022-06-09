Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63A0F545272
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jun 2022 18:52:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCC1211B6D5;
	Thu,  9 Jun 2022 16:52:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 71974 seconds by postgrey-1.36 at gabe;
 Thu, 09 Jun 2022 16:52:26 UTC
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC2CE11A9A4;
 Thu,  9 Jun 2022 16:52:26 +0000 (UTC)
Received: from hermes-devbox.fritz.box (82-71-8-225.dsl.in-addr.zen.co.uk
 [82.71.8.225])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbeckett)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 319E666017DC;
 Thu,  9 Jun 2022 17:52:25 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1654793545;
 bh=5onxy7g3IyKjCCmK9QZL22aFYjquEYO/6uZuRnKxvGo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=VDOKJDX+B0hcYxZ90xCJ5neJYINJfg6uq2y/gPClPdArZfuIrS9P5lSybGK5NLPYb
 z2O54eT4Hr3dMiI5AfkGiyas6YiIByxSWW6QCfPj9zFen/yiU/TOCVllEahJYZ7m3Z
 haveujfK3qaXh39KZCLEUoTaGI2dDOPKEGNJ90rKAUd+7J6yDihq90iASajJDdxSTW
 k83qUz8g7bN3WDM75iqhKF1Sqow311Ho4DxhVlyJhyciRWt3hYnH0LHUrcYTaLzfSx
 wKF3bHzx/O/L4agr6UbcQlupf2JHI8OxzywdGZGbt/W6hhFvq9c8Pqy1BfuyVTtmV5
 fj7GzmtOPoLuQ==
From: Robert Beckett <bob.beckett@collabora.com>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v3 3/8] drm/i915: setup ggtt scratch page after memory regions
Date: Thu,  9 Jun 2022 16:51:55 +0000
Message-Id: <20220609165200.842821-4-bob.beckett@collabora.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220609165200.842821-1-bob.beckett@collabora.com>
References: <20220609165200.842821-1-bob.beckett@collabora.com>
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
Cc: Robert Beckett <bob.beckett@collabora.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 kernel@collabora.com, Matthew Auld <matthew.auld@intel.com>,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Reorder scratch page allocation so that memory regions are available
to allocate the buffers

Signed-off-by: Robert Beckett <bob.beckett@collabora.com>
Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/i915/gt/intel_gt_gmch.c | 20 ++++++++++++++++++--
 drivers/gpu/drm/i915/gt/intel_gt_gmch.h |  6 ++++++
 drivers/gpu/drm/i915/i915_driver.c      | 16 ++++++++++------
 3 files changed, 34 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_gt_gmch.c b/drivers/gpu/drm/i915/gt/intel_gt_gmch.c
index 18e488672d1b..5411df1734ac 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_gmch.c
+++ b/drivers/gpu/drm/i915/gt/intel_gt_gmch.c
@@ -440,8 +440,6 @@ static int ggtt_probe_common(struct i915_ggtt *ggtt, u64 size)
 	struct drm_i915_private *i915 = ggtt->vm.i915;
 	struct pci_dev *pdev = to_pci_dev(i915->drm.dev);
 	phys_addr_t phys_addr;
-	u32 pte_flags;
-	int ret;
 
 	GEM_WARN_ON(pci_resource_len(pdev, 0) != gen6_gttmmadr_size(i915));
 	phys_addr = pci_resource_start(pdev, 0) + gen6_gttadr_offset(i915);
@@ -463,6 +461,24 @@ static int ggtt_probe_common(struct i915_ggtt *ggtt, u64 size)
 	}
 
 	kref_init(&ggtt->vm.resv_ref);
+
+	return 0;
+}
+
+/**
+ * i915_ggtt_setup_scratch_page - setup ggtt scratch page
+ * @i915: i915 device
+ */
+int i915_ggtt_setup_scratch_page(struct drm_i915_private *i915)
+{
+	struct i915_ggtt *ggtt = to_gt(i915)->ggtt;
+	u32 pte_flags;
+	int ret;
+
+	/* gen5- scratch setup currently happens in @intel_gtt_init */
+	if (GRAPHICS_VER(i915) <= 5)
+		return 0;
+
 	ret = setup_scratch_page(&ggtt->vm);
 	if (ret) {
 		drm_err(&i915->drm, "Scratch setup failed\n");
diff --git a/drivers/gpu/drm/i915/gt/intel_gt_gmch.h b/drivers/gpu/drm/i915/gt/intel_gt_gmch.h
index 75ed55c1f30a..c6b79cb78637 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_gmch.h
+++ b/drivers/gpu/drm/i915/gt/intel_gt_gmch.h
@@ -15,6 +15,7 @@ int intel_gt_gmch_gen6_probe(struct i915_ggtt *ggtt);
 int intel_gt_gmch_gen8_probe(struct i915_ggtt *ggtt);
 int intel_gt_gmch_gen5_probe(struct i915_ggtt *ggtt);
 int intel_gt_gmch_gen5_enable_hw(struct drm_i915_private *i915);
+int i915_ggtt_setup_scratch_page(struct drm_i915_private *i915);
 
 /* Stubs for non-x86 platforms */
 #else
@@ -41,6 +42,11 @@ static inline int intel_gt_gmch_gen5_enable_hw(struct drm_i915_private *i915)
 	/* No HW should be enabled for this case yet, return fail */
 	return -ENODEV;
 }
+
+static inline int i915_ggtt_setup_scratch_page(struct drm_i915_private *i915)
+{
+	return 0;
+}
 #endif
 
 #endif /* __INTEL_GT_GMCH_H__ */
diff --git a/drivers/gpu/drm/i915/i915_driver.c b/drivers/gpu/drm/i915/i915_driver.c
index d26dcca7e654..4e8a92ffbfe9 100644
--- a/drivers/gpu/drm/i915/i915_driver.c
+++ b/drivers/gpu/drm/i915/i915_driver.c
@@ -69,6 +69,7 @@
 #include "gem/i915_gem_mman.h"
 #include "gem/i915_gem_pm.h"
 #include "gt/intel_gt.h"
+#include "gt/intel_gt_gmch.h"
 #include "gt/intel_gt_pm.h"
 #include "gt/intel_rc6.h"
 
@@ -605,12 +606,16 @@ static int i915_driver_hw_probe(struct drm_i915_private *dev_priv)
 
 	ret = intel_gt_tiles_init(dev_priv);
 	if (ret)
-		goto err_mem_regions;
+		goto err_ggtt;
+
+	ret = i915_ggtt_setup_scratch_page(dev_priv);
+	if (ret)
+		goto err_ggtt;
 
 	ret = i915_ggtt_enable_hw(dev_priv);
 	if (ret) {
 		drm_err(&dev_priv->drm, "failed to enable GGTT\n");
-		goto err_mem_regions;
+		goto err_ggtt;
 	}
 
 	pci_set_master(pdev);
@@ -662,11 +667,10 @@ static int i915_driver_hw_probe(struct drm_i915_private *dev_priv)
 err_msi:
 	if (pdev->msi_enabled)
 		pci_disable_msi(pdev);
-err_mem_regions:
-	intel_memory_regions_driver_release(dev_priv);
 err_ggtt:
 	i915_ggtt_driver_release(dev_priv);
 	i915_gem_drain_freed_objects(dev_priv);
+	intel_memory_regions_driver_release(dev_priv);
 	i915_ggtt_driver_late_release(dev_priv);
 err_perf:
 	i915_perf_fini(dev_priv);
@@ -912,9 +916,9 @@ int i915_driver_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	intel_modeset_driver_remove_nogem(i915);
 out_cleanup_hw:
 	i915_driver_hw_remove(i915);
-	intel_memory_regions_driver_release(i915);
 	i915_ggtt_driver_release(i915);
 	i915_gem_drain_freed_objects(i915);
+	intel_memory_regions_driver_release(i915);
 	i915_ggtt_driver_late_release(i915);
 out_cleanup_mmio:
 	i915_driver_mmio_release(i915);
@@ -971,9 +975,9 @@ static void i915_driver_release(struct drm_device *dev)
 
 	i915_gem_driver_release(dev_priv);
 
-	intel_memory_regions_driver_release(dev_priv);
 	i915_ggtt_driver_release(dev_priv);
 	i915_gem_drain_freed_objects(dev_priv);
+	intel_memory_regions_driver_release(dev_priv);
 	i915_ggtt_driver_late_release(dev_priv);
 
 	i915_driver_mmio_release(dev_priv);
-- 
2.25.1

