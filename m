Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E3A15ABB3D
	for <lists+dri-devel@lfdr.de>; Sat,  3 Sep 2022 01:34:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1EC410E953;
	Fri,  2 Sep 2022 23:33:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C8C710E93A;
 Fri,  2 Sep 2022 23:33:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662161593; x=1693697593;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hSH8zyHienPPBubFUjdigcouHO2Gxz1P8313a5/CRus=;
 b=aiW2/1jZIdo9VzSKeiP7myqEMxKIHqtpZ1/D/nuc0u0lTiwAZPm1AuRt
 Bm8cjaUsVwluZje6tyrjgfxNKIVBJIfxlBiX6C+BWlfgIapgPXBDmZ++J
 shNnkgs4Gu6+vqHs7eDiQSNww6xVb87MHeihO5ybhlphP7SGIwBD2Vh11
 4P8IfzTcOasKAKd3saFTs2TEE5LsEFRjqbgPu1ZXcLRm942BnqhKEs4Wn
 U6oRGOtY861gFH+YFVTrdniF270Ekz0Tnf1PiHBM/Kt56QD6LwNmVoKAb
 QpFietAl+J8a09u//AABZS9beN+J+HtiwTPIIMoSC6tXY6MnaFEVbPfhG g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10458"; a="360064662"
X-IronPort-AV: E=Sophos;i="5.93,285,1654585200"; d="scan'208";a="360064662"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2022 16:33:12 -0700
X-IronPort-AV: E=Sophos;i="5.93,285,1654585200"; d="scan'208";a="941464192"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2022 16:33:11 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 04/12] drm/i915: Prepare more multi-GT initialization
Date: Fri,  2 Sep 2022 16:32:49 -0700
Message-Id: <20220902233257.3088492-5-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220902233257.3088492-1-matthew.d.roper@intel.com>
References: <20220902233257.3088492-1-matthew.d.roper@intel.com>
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
Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>,
 dri-devel@lists.freedesktop.org,
 Radhakrishna Sripada <radhakrishna.sripada@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We're going to introduce an additional intel_gt for MTL's media unit
soon.  Let's provide a bit more multi-GT initialization framework in
preparation for that.  The initialization will pull the list of GTs for
a platform from the device info structure.  Although necessary for the
immediate MTL media enabling, this same framework will also be used
farther down the road when we enable remote tiles on xehpsdv and pvc.

v2:
 - Re-add missing test for !HAS_EXTRA_GT_LIST in intel_gt_probe_all().

Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
Reviewed-by: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_engine_cs.c     |  2 +-
 drivers/gpu/drm/i915/gt/intel_gt.c            | 51 +++++++++++++++++--
 drivers/gpu/drm/i915/gt/intel_gt.h            |  1 -
 drivers/gpu/drm/i915/gt/intel_gt_types.h      |  3 ++
 drivers/gpu/drm/i915/i915_drv.h               |  2 +
 drivers/gpu/drm/i915/intel_device_info.h      | 16 ++++++
 .../gpu/drm/i915/selftests/mock_gem_device.c  |  1 +
 7 files changed, 70 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_engine_cs.c b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
index 275ad72940c1..41acc285e8bf 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine_cs.c
+++ b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
@@ -736,7 +736,7 @@ static intel_engine_mask_t init_engine_mask(struct intel_gt *gt)
 	u16 vdbox_mask;
 	u16 vebox_mask;
 
-	info->engine_mask = RUNTIME_INFO(i915)->platform_engine_mask;
+	GEM_BUG_ON(!info->engine_mask);
 
 	if (GRAPHICS_VER(i915) < 11)
 		return info->engine_mask;
diff --git a/drivers/gpu/drm/i915/gt/intel_gt.c b/drivers/gpu/drm/i915/gt/intel_gt.c
index cf7aab7adb30..7b880dbed6ce 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt.c
+++ b/drivers/gpu/drm/i915/gt/intel_gt.c
@@ -807,17 +807,16 @@ static void
 intel_gt_tile_cleanup(struct intel_gt *gt)
 {
 	intel_uncore_cleanup_mmio(gt->uncore);
-
-	if (!gt_is_root(gt))
-		kfree(gt);
 }
 
 int intel_gt_probe_all(struct drm_i915_private *i915)
 {
 	struct pci_dev *pdev = to_pci_dev(i915->drm.dev);
 	struct intel_gt *gt = &i915->gt0;
+	const struct intel_gt_definition *gtdef;
 	phys_addr_t phys_addr;
 	unsigned int mmio_bar;
+	unsigned int i;
 	int ret;
 
 	mmio_bar = GRAPHICS_VER(i915) == 2 ? GEN2_GTTMMADR_BAR : GTTMMADR_BAR;
@@ -828,14 +827,58 @@ int intel_gt_probe_all(struct drm_i915_private *i915)
 	 * and it has been already initialized early during probe
 	 * in i915_driver_probe()
 	 */
+	gt->i915 = i915;
+	gt->name = "Primary GT";
+	gt->info.engine_mask = RUNTIME_INFO(i915)->platform_engine_mask;
+
+	drm_dbg(&i915->drm, "Setting up %s\n", gt->name);
 	ret = intel_gt_tile_setup(gt, phys_addr);
 	if (ret)
 		return ret;
 
 	i915->gt[0] = gt;
 
-	/* TODO: add more tiles */
+	if (!HAS_EXTRA_GT_LIST(i915))
+		return 0;
+
+	for (i = 1, gtdef = &INTEL_INFO(i915)->extra_gt_list[i - 1];
+	     gtdef->setup != NULL;
+	     i++, gtdef = &INTEL_INFO(i915)->extra_gt_list[i - 1]) {
+		gt = drmm_kzalloc(&i915->drm, sizeof(*gt), GFP_KERNEL);
+		if (!gt) {
+			ret = -ENOMEM;
+			goto err;
+		}
+
+		gt->i915 = i915;
+		gt->name = gtdef->name;
+		gt->type = gtdef->type;
+		gt->info.engine_mask = gtdef->engine_mask;
+		gt->info.id = i;
+
+		drm_dbg(&i915->drm, "Setting up %s\n", gt->name);
+		if (GEM_WARN_ON(range_overflows_t(resource_size_t,
+						  gtdef->mapping_base,
+						  SZ_16M,
+						  pci_resource_len(pdev, mmio_bar)))) {
+			ret = -ENODEV;
+			goto err;
+		}
+
+		ret = gtdef->setup(gt, phys_addr + gtdef->mapping_base);
+		if (ret)
+			goto err;
+
+		i915->gt[i] = gt;
+	}
+
 	return 0;
+
+err:
+	i915_probe_error(i915, "Failed to initialize %s! (%d)\n", gtdef->name, ret);
+	intel_gt_release_all(i915);
+
+	return ret;
 }
 
 int intel_gt_tiles_init(struct drm_i915_private *i915)
diff --git a/drivers/gpu/drm/i915/gt/intel_gt.h b/drivers/gpu/drm/i915/gt/intel_gt.h
index 40b06adf509a..4d8779529cc2 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt.h
+++ b/drivers/gpu/drm/i915/gt/intel_gt.h
@@ -54,7 +54,6 @@ void intel_gt_driver_register(struct intel_gt *gt);
 void intel_gt_driver_unregister(struct intel_gt *gt);
 void intel_gt_driver_remove(struct intel_gt *gt);
 void intel_gt_driver_release(struct intel_gt *gt);
-
 void intel_gt_driver_late_release_all(struct drm_i915_private *i915);
 
 int intel_gt_wait_for_idle(struct intel_gt *gt, long timeout);
diff --git a/drivers/gpu/drm/i915/gt/intel_gt_types.h b/drivers/gpu/drm/i915/gt/intel_gt_types.h
index 4d56f7d5a3be..3bd36caee321 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_types.h
+++ b/drivers/gpu/drm/i915/gt/intel_gt_types.h
@@ -83,6 +83,9 @@ struct gt_defaults {
 
 struct intel_gt {
 	struct drm_i915_private *i915;
+	const char *name;
+	enum intel_gt_type type;
+
 	struct intel_uncore *uncore;
 	struct i915_ggtt *ggtt;
 
diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
index c9cca165bf5d..d4b45c7e931d 100644
--- a/drivers/gpu/drm/i915/i915_drv.h
+++ b/drivers/gpu/drm/i915/i915_drv.h
@@ -918,6 +918,8 @@ IS_SUBPLATFORM(const struct drm_i915_private *i915,
 #define HAS_REGION(i915, i) (RUNTIME_INFO(i915)->memory_regions & (i))
 #define HAS_LMEM(i915) HAS_REGION(i915, REGION_LMEM)
 
+#define HAS_EXTRA_GT_LIST(dev_priv)   (INTEL_INFO(dev_priv)->extra_gt_list)
+
 /*
  * Platform has the dedicated compression control state for each lmem surfaces
  * stored in lmem to support the 3D and media compression formats.
diff --git a/drivers/gpu/drm/i915/intel_device_info.h b/drivers/gpu/drm/i915/intel_device_info.h
index 6904ad03ca19..b408ce384cd7 100644
--- a/drivers/gpu/drm/i915/intel_device_info.h
+++ b/drivers/gpu/drm/i915/intel_device_info.h
@@ -245,6 +245,20 @@ struct intel_runtime_info {
 	};
 };
 
+enum intel_gt_type {
+	GT_PRIMARY,
+	GT_TILE,
+};
+
+struct intel_gt_definition {
+	enum intel_gt_type type;
+	char *name;
+	int (*setup)(struct intel_gt *gt,
+		     phys_addr_t phys_addr);
+	u32 mapping_base;
+	intel_engine_mask_t engine_mask;
+};
+
 struct intel_device_info {
 	struct ip_version media;
 
@@ -252,6 +266,8 @@ struct intel_device_info {
 
 	unsigned int dma_mask_size; /* available DMA address bits */
 
+	const struct intel_gt_definition *extra_gt_list;
+
 	u8 gt; /* GT number, 0 if undefined */
 
 #define DEFINE_FLAG(name) u8 name:1
diff --git a/drivers/gpu/drm/i915/selftests/mock_gem_device.c b/drivers/gpu/drm/i915/selftests/mock_gem_device.c
index f5904e659ef2..915d58ba383e 100644
--- a/drivers/gpu/drm/i915/selftests/mock_gem_device.c
+++ b/drivers/gpu/drm/i915/selftests/mock_gem_device.c
@@ -115,6 +115,7 @@ static struct dev_pm_domain pm_domain = {
 static void mock_gt_probe(struct drm_i915_private *i915)
 {
 	i915->gt[0] = &i915->gt0;
+	i915->gt[0]->name = "Mock GT";
 }
 
 struct drm_i915_private *mock_gem_device(void)
-- 
2.37.2

