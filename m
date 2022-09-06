Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2671C5AF8A0
	for <lists+dri-devel@lfdr.de>; Wed,  7 Sep 2022 01:51:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AED010E0E2;
	Tue,  6 Sep 2022 23:50:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D82B510E0A4;
 Tue,  6 Sep 2022 23:49:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662508186; x=1694044186;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=BSCekh+HUZw/Vz/OnKHfgLQaLmjEss9enoBLaoEg5jM=;
 b=e4NBhmbQjoac0njPnaRsyU/Udj6A74WywcORl41he0ERfd8dSvHmrwyw
 fM0+sUJfMed8p45U9WR1QyPF1V4LrSS3nAm2gM7byWoyzMTkYXZ/mJa5q
 znEke2mJ0uVqr/lKvnG4f6LyARs5HDfZyBR4+YfqyZ3MnIeA1MxYWL9Do
 OzAOdgetUawlyf79lm0S8btIlhb2a3BPS9VHDXBPI30T7067L1z02DdMX
 C2gBacocN1B5P0vu+eK+m5K69jhn8RVnxEGIomXy51zTK1borshHIGtBT
 HY8IG/DMkfy6kVnsvQ5960t7amIjaa5/EnPAzWthUwaF0VcdZeePM+0zp A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10462"; a="276477208"
X-IronPort-AV: E=Sophos;i="5.93,295,1654585200"; d="scan'208";a="276477208"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2022 16:49:45 -0700
X-IronPort-AV: E=Sophos;i="5.93,295,1654585200"; d="scan'208";a="675920319"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2022 16:49:45 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v3 05/14] drm/i915: Prepare more multi-GT initialization
Date: Tue,  6 Sep 2022 16:49:25 -0700
Message-Id: <20220906234934.3655440-6-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220906234934.3655440-1-matthew.d.roper@intel.com>
References: <20220906234934.3655440-1-matthew.d.roper@intel.com>
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

v3:
 - Move intel_gt_definition struct to intel_gt_types.h.  (Jani)
 - Drop gtdef->setup().  For now we'll just use a switch() based on GT
   type since we don't have too many different handlers for the
   forseeable future.  (Jani)

Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
Reviewed-by: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_engine_cs.c     |  2 +-
 drivers/gpu/drm/i915/gt/intel_gt.c            | 59 ++++++++++++++++++-
 drivers/gpu/drm/i915/gt/intel_gt.h            |  1 -
 drivers/gpu/drm/i915/gt/intel_gt_types.h      | 15 +++++
 drivers/gpu/drm/i915/i915_drv.h               |  2 +
 drivers/gpu/drm/i915/intel_device_info.h      |  3 +
 .../gpu/drm/i915/selftests/mock_gem_device.c  |  1 +
 7 files changed, 80 insertions(+), 3 deletions(-)

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
index 663a4798fb2e..85c75375391c 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt.c
+++ b/drivers/gpu/drm/i915/gt/intel_gt.c
@@ -807,8 +807,10 @@ int intel_gt_probe_all(struct drm_i915_private *i915)
 {
 	struct pci_dev *pdev = to_pci_dev(i915->drm.dev);
 	struct intel_gt *gt = &i915->gt0;
+	const struct intel_gt_definition *gtdef;
 	phys_addr_t phys_addr;
 	unsigned int mmio_bar;
+	unsigned int i;
 	int ret;
 
 	mmio_bar = GRAPHICS_VER(i915) == 2 ? GEN2_GTTMMADR_BAR : GTTMMADR_BAR;
@@ -819,14 +821,69 @@ int intel_gt_probe_all(struct drm_i915_private *i915)
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
+	     gtdef->name != NULL;
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
+		switch (gtdef->type) {
+		case GT_TILE:
+			ret = intel_gt_tile_setup(gt, phys_addr + gtdef->mapping_base);
+			break;
+
+		case GT_PRIMARY:
+			/* Primary GT should not appear in extra GT list */
+		default:
+			MISSING_CASE(gtdef->type);
+			ret = -ENODEV;
+		}
+
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
index 4d56f7d5a3be..0e139f7d75ed 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_types.h
+++ b/drivers/gpu/drm/i915/gt/intel_gt_types.h
@@ -81,8 +81,16 @@ struct gt_defaults {
 	u32 max_freq;
 };
 
+enum intel_gt_type {
+	GT_PRIMARY,
+	GT_TILE,
+};
+
 struct intel_gt {
 	struct drm_i915_private *i915;
+	const char *name;
+	enum intel_gt_type type;
+
 	struct intel_uncore *uncore;
 	struct i915_ggtt *ggtt;
 
@@ -262,6 +270,13 @@ struct intel_gt {
 	struct kobject *sysfs_defaults;
 };
 
+struct intel_gt_definition {
+	enum intel_gt_type type;
+	char *name;
+	u32 mapping_base;
+	intel_engine_mask_t engine_mask;
+};
+
 enum intel_gt_scratch_field {
 	/* 8 bytes */
 	INTEL_GT_SCRATCH_FIELD_DEFAULT = 0,
diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
index befb167b3c49..f010be8df851 100644
--- a/drivers/gpu/drm/i915/i915_drv.h
+++ b/drivers/gpu/drm/i915/i915_drv.h
@@ -916,6 +916,8 @@ IS_SUBPLATFORM(const struct drm_i915_private *i915,
 #define HAS_REGION(i915, i) (RUNTIME_INFO(i915)->memory_regions & (i))
 #define HAS_LMEM(i915) HAS_REGION(i915, REGION_LMEM)
 
+#define HAS_EXTRA_GT_LIST(dev_priv)   (INTEL_INFO(dev_priv)->extra_gt_list)
+
 /*
  * Platform has the dedicated compression control state for each lmem surfaces
  * stored in lmem to support the 3D and media compression formats.
diff --git a/drivers/gpu/drm/i915/intel_device_info.h b/drivers/gpu/drm/i915/intel_device_info.h
index 6904ad03ca19..deaa07d8df2c 100644
--- a/drivers/gpu/drm/i915/intel_device_info.h
+++ b/drivers/gpu/drm/i915/intel_device_info.h
@@ -37,6 +37,7 @@
 
 struct drm_printer;
 struct drm_i915_private;
+struct intel_gt_definition;
 
 /* Keep in gen based order, and chronological order within a gen */
 enum intel_platform {
@@ -252,6 +253,8 @@ struct intel_device_info {
 
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

