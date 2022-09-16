Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D4E315BAFC9
	for <lists+dri-devel@lfdr.de>; Fri, 16 Sep 2022 16:59:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1A3C10ED6D;
	Fri, 16 Sep 2022 14:59:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 085AF10ED5D;
 Fri, 16 Sep 2022 14:58:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663340323; x=1694876323;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=YvQPCTw0kN+WVRD3umx1QAKNdDfhYHXZaauHSzZwNqc=;
 b=UieCuoIvOR7K8h7RIxM6XgRYA0Qky+//DBxgs41NjHgHXDvTd5MJturI
 KRNTkoZQRy9qnqIyPCwMdZXe9yqc6/wZJUzrnAn1M007UWUTkXwJXV1+i
 o3D0KNCmGoPVA/6NNwJiJWSaR55bvXF6LrH1tXp7L6ZVLzu3ti2h9jbCR
 NHzIDENPWSmCt0b0TAuo4jtM4jFI6/DVS16mck8iTr/5stvG+OlRh3SCI
 3LjeuitEZXRCtpSA42piEBDbKjLsqs0JyfJ3oUXc/t0Q/C6L6H09cxX1m
 PTIgxGUy9GD57KWxT4DhaeundoQ3asTE3JKLMJ70zkaWIHdW8x3AG2khU Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10472"; a="360747650"
X-IronPort-AV: E=Sophos;i="5.93,320,1654585200"; d="scan'208";a="360747650"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2022 07:58:42 -0700
X-IronPort-AV: E=Sophos;i="5.93,320,1654585200"; d="scan'208";a="862761638"
Received: from bnilawar-desk1.iind.intel.com ([10.145.169.158])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2022 07:58:39 -0700
From: Badal Nilawar <badal.nilawar@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 7/7] drm/i915/hwmon: Extend power/energy for XEHPSDV
Date: Fri, 16 Sep 2022 20:30:54 +0530
Message-Id: <20220916150054.807590-8-badal.nilawar@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220916150054.807590-1-badal.nilawar@intel.com>
References: <20220916150054.807590-1-badal.nilawar@intel.com>
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
Cc: linux-hwmon@vger.kernel.org, anshuman.gupta@intel.com,
 dri-devel@lists.freedesktop.org, ashutosh.dixit@intel.com, jon.ewins@intel.com,
 riana.tauro@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Dale B Stimson <dale.b.stimson@intel.com>

Extend hwmon power/energy for XEHPSDV especially per gt level energy
usage.

v2: Update to latest HWMON spec (Ashutosh)
v3: Fixed review comments (Ashutosh)

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
Signed-off-by: Dale B Stimson <dale.b.stimson@intel.com>
Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
Acked-by: Guenter Roeck <linux@roeck-us.net>
Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 .../ABI/testing/sysfs-driver-intel-i915-hwmon |   7 +-
 drivers/gpu/drm/i915/gt/intel_gt_regs.h       |   5 +
 drivers/gpu/drm/i915/i915_hwmon.c             | 114 +++++++++++++++++-
 3 files changed, 123 insertions(+), 3 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon b/Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon
index 7995a885c9d6..851525d2117d 100644
--- a/Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon
+++ b/Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon
@@ -65,6 +65,11 @@ What:		/sys/devices/.../hwmon/hwmon<i>/energy1_input
 Date:		September 2022
 KernelVersion:	6
 Contact:	dri-devel@lists.freedesktop.org
-Description:	RO. Energy input of device in microjoules.
+Description:	RO. Energy input of device or gt in microjoules.
+
+		For i915 device level hwmon devices (name "i915") this
+		reflects energy input for the entire device. For gt level
+		hwmon devices (name "i915_gtN") this reflects energy input
+		for the gt.
 
 		Only supported for particular Intel i915 graphics platforms.
diff --git a/drivers/gpu/drm/i915/gt/intel_gt_regs.h b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
index 65336514554d..3c385395aaef 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_regs.h
+++ b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
@@ -1591,4 +1591,9 @@
  */
 #define MTL_MEDIA_GSI_BASE			0x380000
 
+#define GT0_PACKAGE_ENERGY_STATUS		_MMIO(0x250004)
+#define GT0_PACKAGE_RAPL_LIMIT			_MMIO(0x250008)
+#define GT0_PACKAGE_POWER_SKU_UNIT		_MMIO(0x250068)
+#define GT0_PLATFORM_ENERGY_STATUS		_MMIO(0x25006c)
+
 #endif /* __INTEL_GT_REGS__ */
diff --git a/drivers/gpu/drm/i915/i915_hwmon.c b/drivers/gpu/drm/i915/i915_hwmon.c
index 7d85a81bc39b..4a4aec1c67ab 100644
--- a/drivers/gpu/drm/i915/i915_hwmon.c
+++ b/drivers/gpu/drm/i915/i915_hwmon.c
@@ -12,6 +12,7 @@
 #include "i915_reg.h"
 #include "intel_mchbar_regs.h"
 #include "intel_pcode.h"
+#include "gt/intel_gt.h"
 #include "gt/intel_gt_regs.h"
 
 /*
@@ -34,6 +35,7 @@ struct hwm_reg {
 	i915_reg_t pkg_power_sku;
 	i915_reg_t pkg_rapl_limit;
 	i915_reg_t energy_status_all;
+	i915_reg_t energy_status_tile;
 };
 
 struct hwm_energy_info {
@@ -47,10 +49,12 @@ struct hwm_drvdata {
 	struct device *hwmon_dev;
 	struct hwm_energy_info ei;		/*  Energy info for energy1_input */
 	char name[12];
+	int gt_n;
 };
 
 struct i915_hwmon {
 	struct hwm_drvdata ddat;
+	struct hwm_drvdata ddat_gt[I915_MAX_GT];
 	struct mutex hwmon_lock;		/* counter overflow logic and rmw */
 	struct hwm_reg rg;
 	int scl_shift_power;
@@ -144,7 +148,10 @@ hwm_energy(struct hwm_drvdata *ddat, long *energy)
 	i915_reg_t rgaddr;
 	u32 reg_val;
 
-	rgaddr = hwmon->rg.energy_status_all;
+	if (ddat->gt_n >= 0)
+		rgaddr = hwmon->rg.energy_status_tile;
+	else
+		rgaddr = hwmon->rg.energy_status_all;
 
 	mutex_lock(&hwmon->hwmon_lock);
 
@@ -280,6 +287,11 @@ static const struct hwmon_channel_info *hwm_info[] = {
 	NULL
 };
 
+static const struct hwmon_channel_info *hwm_gt_info[] = {
+	HWMON_CHANNEL_INFO(energy, HWMON_E_INPUT),
+	NULL
+};
+
 /* I1 is exposed as power_crit or as curr_crit depending on bit 31 */
 static int hwm_pcode_read_i1(struct drm_i915_private *i915, u32 *uval)
 {
@@ -409,7 +421,10 @@ hwm_energy_is_visible(const struct hwm_drvdata *ddat, u32 attr)
 
 	switch (attr) {
 	case hwmon_energy_input:
-		rgaddr = hwmon->rg.energy_status_all;
+		if (ddat->gt_n >= 0)
+			rgaddr = hwmon->rg.energy_status_tile;
+		else
+			rgaddr = hwmon->rg.energy_status_all;
 		return i915_mmio_reg_valid(rgaddr) ? 0444 : 0;
 	default:
 		return 0;
@@ -544,6 +559,44 @@ static const struct hwmon_chip_info hwm_chip_info = {
 	.info = hwm_info,
 };
 
+static umode_t
+hwm_gt_is_visible(const void *drvdata, enum hwmon_sensor_types type,
+		  u32 attr, int channel)
+{
+	struct hwm_drvdata *ddat = (struct hwm_drvdata *)drvdata;
+
+	switch (type) {
+	case hwmon_energy:
+		return hwm_energy_is_visible(ddat, attr);
+	default:
+		return 0;
+	}
+}
+
+static int
+hwm_gt_read(struct device *dev, enum hwmon_sensor_types type, u32 attr,
+	    int channel, long *val)
+{
+	struct hwm_drvdata *ddat = dev_get_drvdata(dev);
+
+	switch (type) {
+	case hwmon_energy:
+		return hwm_energy_read(ddat, attr, val);
+	default:
+		return -EOPNOTSUPP;
+	}
+}
+
+static const struct hwmon_ops hwm_gt_ops = {
+	.is_visible = hwm_gt_is_visible,
+	.read = hwm_gt_read,
+};
+
+static const struct hwmon_chip_info hwm_gt_chip_info = {
+	.ops = &hwm_gt_ops,
+	.info = hwm_gt_info,
+};
+
 static void
 hwm_get_preregistration_info(struct drm_i915_private *i915)
 {
@@ -552,7 +605,9 @@ hwm_get_preregistration_info(struct drm_i915_private *i915)
 	struct hwm_drvdata *ddat = &hwmon->ddat;
 	intel_wakeref_t wakeref;
 	u32 val_sku_unit;
+	struct intel_gt *gt;
 	long energy;
+	int i;
 
 	if (IS_DG1(i915) || IS_DG2(i915)) {
 		hwmon->rg.gt_perf_status = GEN12_RPSTAT1;
@@ -560,12 +615,21 @@ hwm_get_preregistration_info(struct drm_i915_private *i915)
 		hwmon->rg.pkg_power_sku = INVALID_MMIO_REG;
 		hwmon->rg.pkg_rapl_limit = PCU_PACKAGE_RAPL_LIMIT;
 		hwmon->rg.energy_status_all = PCU_PACKAGE_ENERGY_STATUS;
+		hwmon->rg.energy_status_tile = INVALID_MMIO_REG;
+	} else if (IS_XEHPSDV(i915)) {
+		hwmon->rg.pkg_power_sku_unit = GT0_PACKAGE_POWER_SKU_UNIT;
+		hwmon->rg.pkg_power_sku = INVALID_MMIO_REG;
+		hwmon->rg.pkg_rapl_limit = GT0_PACKAGE_RAPL_LIMIT;
+		hwmon->rg.energy_status_all = GT0_PLATFORM_ENERGY_STATUS;
+		hwmon->rg.energy_status_tile = GT0_PACKAGE_ENERGY_STATUS;
+		hwmon->rg.gt_perf_status = INVALID_MMIO_REG;
 	} else {
 		hwmon->rg.gt_perf_status = INVALID_MMIO_REG;
 		hwmon->rg.pkg_power_sku_unit = INVALID_MMIO_REG;
 		hwmon->rg.pkg_power_sku = INVALID_MMIO_REG;
 		hwmon->rg.pkg_rapl_limit = INVALID_MMIO_REG;
 		hwmon->rg.energy_status_all = INVALID_MMIO_REG;
+		hwmon->rg.energy_status_tile = INVALID_MMIO_REG;
 	}
 
 	with_intel_runtime_pm(uncore->rpm, wakeref) {
@@ -591,6 +655,10 @@ hwm_get_preregistration_info(struct drm_i915_private *i915)
 	 */
 	if (i915_mmio_reg_valid(hwmon->rg.energy_status_all))
 		hwm_energy(ddat, &energy);
+	if (i915_mmio_reg_valid(hwmon->rg.energy_status_tile)) {
+		for_each_gt(gt, i915, i)
+			hwm_energy(&hwmon->ddat_gt[i], &energy);
+	}
 }
 
 void i915_hwmon_register(struct drm_i915_private *i915)
@@ -599,6 +667,9 @@ void i915_hwmon_register(struct drm_i915_private *i915)
 	struct i915_hwmon *hwmon;
 	struct device *hwmon_dev;
 	struct hwm_drvdata *ddat;
+	struct hwm_drvdata *ddat_gt;
+	struct intel_gt *gt;
+	int i;
 
 	/* hwmon is available only for dGfx */
 	if (!IS_DGFX(i915))
@@ -615,6 +686,16 @@ void i915_hwmon_register(struct drm_i915_private *i915)
 	ddat->hwmon = hwmon;
 	ddat->uncore = &i915->uncore;
 	snprintf(ddat->name, sizeof(ddat->name), "i915");
+	ddat->gt_n = -1;
+
+	for_each_gt(gt, i915, i) {
+		ddat_gt = hwmon->ddat_gt + i;
+
+		ddat_gt->hwmon = hwmon;
+		ddat_gt->uncore = gt->uncore;
+		snprintf(ddat_gt->name, sizeof(ddat_gt->name), "i915_gt%u", i);
+		ddat_gt->gt_n = i;
+	}
 
 	hwm_get_preregistration_info(i915);
 
@@ -631,18 +712,47 @@ void i915_hwmon_register(struct drm_i915_private *i915)
 	}
 
 	ddat->hwmon_dev = hwmon_dev;
+
+	for_each_gt(gt, i915, i) {
+		ddat_gt = hwmon->ddat_gt + i;
+		/*
+		 * Create per-gt directories only if a per-gt attribute is
+		 * visible. Currently this is only energy
+		 */
+		if (!hwm_gt_is_visible(ddat_gt, hwmon_energy, hwmon_energy_input, 0))
+			continue;
+
+		hwmon_dev = hwmon_device_register_with_info(dev, ddat_gt->name,
+							    ddat_gt,
+							    &hwm_gt_chip_info,
+							    NULL);
+		if (!IS_ERR(hwmon_dev))
+			ddat_gt->hwmon_dev = hwmon_dev;
+	}
 }
 
 void i915_hwmon_unregister(struct drm_i915_private *i915)
 {
 	struct i915_hwmon *hwmon;
 	struct hwm_drvdata *ddat;
+	struct intel_gt *gt;
+	int i;
 
 	hwmon = fetch_and_zero(&i915->hwmon);
 	if (!hwmon)
 		return;
 
 	ddat = &hwmon->ddat;
+
+	for_each_gt(gt, i915, i) {
+		struct hwm_drvdata *ddat_gt;
+
+		ddat_gt = hwmon->ddat_gt + i;
+
+		if (ddat_gt->hwmon_dev)
+			hwmon_device_unregister(ddat_gt->hwmon_dev);
+	}
+
 	if (ddat->hwmon_dev)
 		hwmon_device_unregister(ddat->hwmon_dev);
 
-- 
2.25.1

