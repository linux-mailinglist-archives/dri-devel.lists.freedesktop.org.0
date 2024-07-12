Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A246892F9CE
	for <lists+dri-devel@lfdr.de>; Fri, 12 Jul 2024 14:00:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCC7710ECCB;
	Fri, 12 Jul 2024 12:00:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JGu4pv6U";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1B9410E049;
 Fri, 12 Jul 2024 12:00:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720785652; x=1752321652;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=o7vz8xVIkT+hBTZntG1OJYZ9jPasws2I0t685Uabb5E=;
 b=JGu4pv6Uf37XGdVlYvspH4QPqeqgQmJId7awWSS/z0+q3oqCQQ5QHp+r
 mUb8haatWIDK6/GL3mixwaQtOgjxUq6s4zMYXDh/iH7F2VALPruMNAouN
 ruXOVlluZNTwJBosjqcU81jqWOX49UZSW6/R5VA/vqYHidkrDU58aDdTX
 +Dhzu0SGAXee924Umwb5OK8Io6SFXA49+exJ9hu6gL5NUaTGaXWTbPxjj
 BmnQr6LubwUTei0OHl13zjvIDvy8ZGj6nvl5Vw0EX2LqkhNRuj8TEG+KR
 IML4tfTF0rTMQIjAB0PGbKowEhA4HWo02VC0PsdHKHq8P3KdQlGhnBtw1 w==;
X-CSE-ConnectionGUID: SHOlMMleQCOZQkQFCmhd4Q==
X-CSE-MsgGUID: F5i7LuP3Tf6fLBxFI5d5+A==
X-IronPort-AV: E=McAfee;i="6700,10204,11130"; a="18339974"
X-IronPort-AV: E=Sophos;i="6.09,202,1716274800"; d="scan'208";a="18339974"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jul 2024 05:00:52 -0700
X-CSE-ConnectionGUID: HMd4kqDCQjiGtIZmjDF6ww==
X-CSE-MsgGUID: Xeebi1Q7QgOkf+GzHUNpUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,202,1716274800"; d="scan'208";a="53463344"
Received: from jraag-nuc8i7beh.iind.intel.com ([10.145.169.79])
 by fmviesa004.fm.intel.com with ESMTP; 12 Jul 2024 05:00:45 -0700
From: Raag Jadav <raag.jadav@intel.com>
To: jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com, tursulin@ursulin.net, airlied@gmail.com,
 daniel@ffwll.ch
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, anshuman.gupta@intel.com,
 badal.nilawar@intel.com, riana.tauro@intel.com, ashutosh.dixit@intel.com,
 karthik.poosa@intel.com, andriy.shevchenko@linux.intel.com,
 Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v1] drm/i915/hwmon: expose fan speed
Date: Fri, 12 Jul 2024 17:53:56 +0530
Message-Id: <20240712122356.360613-1-raag.jadav@intel.com>
X-Mailer: git-send-email 2.34.1
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add hwmon support for fan1_input attribute, which will expose fan speed
in RPM. With this in place we can monitor fan speed using lm-sensors tool.

$ sensors
i915-pci-0300
Adapter: PCI adapter
in0:         653.00 mV
fan1:        3833 RPM
power1:           N/A  (max =  43.00 W)
energy1:      32.02 kJ

Signed-off-by: Raag Jadav <raag.jadav@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_gt_regs.h |  2 +
 drivers/gpu/drm/i915/i915_hwmon.c       | 71 +++++++++++++++++++++++++
 2 files changed, 73 insertions(+)

diff --git a/drivers/gpu/drm/i915/gt/intel_gt_regs.h b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
index e42b3a5d4e63..407d8152755a 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_regs.h
+++ b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
@@ -1553,6 +1553,8 @@
 #define VLV_RENDER_C0_COUNT			_MMIO(0x138118)
 #define VLV_MEDIA_C0_COUNT			_MMIO(0x13811c)
 
+#define GEN12_PWM_FAN_SPEED			_MMIO(0x138140)
+
 #define GEN12_RPSTAT1				_MMIO(0x1381b4)
 #define   GEN12_VOLTAGE_MASK			REG_GENMASK(10, 0)
 #define   GEN12_CAGF_MASK			REG_GENMASK(19, 11)
diff --git a/drivers/gpu/drm/i915/i915_hwmon.c b/drivers/gpu/drm/i915/i915_hwmon.c
index 49db3e09826c..f829c7837d83 100644
--- a/drivers/gpu/drm/i915/i915_hwmon.c
+++ b/drivers/gpu/drm/i915/i915_hwmon.c
@@ -36,6 +36,7 @@ struct hwm_reg {
 	i915_reg_t pkg_rapl_limit;
 	i915_reg_t energy_status_all;
 	i915_reg_t energy_status_tile;
+	i915_reg_t fan_speed;
 };
 
 struct hwm_energy_info {
@@ -43,11 +44,17 @@ struct hwm_energy_info {
 	long accum_energy;			/* Accumulated energy for energy1_input */
 };
 
+struct hwm_fan_info {
+	u32 reg_val_prev;
+	u32 time_prev;
+};
+
 struct hwm_drvdata {
 	struct i915_hwmon *hwmon;
 	struct intel_uncore *uncore;
 	struct device *hwmon_dev;
 	struct hwm_energy_info ei;		/*  Energy info for energy1_input */
+	struct hwm_fan_info fi;			/*  Fan info for fan1_input */
 	char name[12];
 	int gt_n;
 	bool reset_in_progress;
@@ -276,6 +283,7 @@ static const struct hwmon_channel_info * const hwm_info[] = {
 	HWMON_CHANNEL_INFO(power, HWMON_P_MAX | HWMON_P_RATED_MAX | HWMON_P_CRIT),
 	HWMON_CHANNEL_INFO(energy, HWMON_E_INPUT),
 	HWMON_CHANNEL_INFO(curr, HWMON_C_CRIT),
+	HWMON_CHANNEL_INFO(fan, HWMON_F_INPUT),
 	NULL
 };
 
@@ -613,6 +621,55 @@ hwm_curr_write(struct hwm_drvdata *ddat, u32 attr, long val)
 	}
 }
 
+static umode_t
+hwm_fan_is_visible(const struct hwm_drvdata *ddat, u32 attr)
+{
+	struct i915_hwmon *hwmon = ddat->hwmon;
+
+	switch (attr) {
+	case hwmon_fan_input:
+		return i915_mmio_reg_valid(hwmon->rg.fan_speed) ? 0444 : 0;
+	default:
+		return 0;
+	}
+}
+
+static int
+hwm_fan_read(struct hwm_drvdata *ddat, u32 attr, long *val)
+{
+	struct i915_hwmon *hwmon = ddat->hwmon;
+	u32 reg_val, rotation, time, time_now;
+	intel_wakeref_t wakeref;
+
+	switch (attr) {
+	case hwmon_fan_input:
+		with_intel_runtime_pm(ddat->uncore->rpm, wakeref)
+			reg_val = intel_uncore_read(ddat->uncore, hwmon->rg.fan_speed);
+
+		time_now = jiffies_to_msecs(jiffies);
+
+		/*
+		 * HW register value is accumulated count of pulses from
+		 * PWM fan with the scale of 2 pulses per rotation.
+		 */
+		rotation = (reg_val - ddat->fi.reg_val_prev) >> 1;
+		time = time_now - ddat->fi.time_prev;
+
+		if (!time)
+			return -EAGAIN;
+
+		/* Convert to minutes for calculating RPM. */
+		*val = DIV_ROUND_UP((long)rotation * (60 * 1000), time);
+
+		ddat->fi.reg_val_prev = reg_val;
+		ddat->fi.time_prev = time_now;
+
+		return 0;
+	default:
+		return -EOPNOTSUPP;
+	}
+}
+
 static umode_t
 hwm_is_visible(const void *drvdata, enum hwmon_sensor_types type,
 	       u32 attr, int channel)
@@ -628,6 +685,8 @@ hwm_is_visible(const void *drvdata, enum hwmon_sensor_types type,
 		return hwm_energy_is_visible(ddat, attr);
 	case hwmon_curr:
 		return hwm_curr_is_visible(ddat, attr);
+	case hwmon_fan:
+		return hwm_fan_is_visible(ddat, attr);
 	default:
 		return 0;
 	}
@@ -648,6 +707,8 @@ hwm_read(struct device *dev, enum hwmon_sensor_types type, u32 attr,
 		return hwm_energy_read(ddat, attr, val);
 	case hwmon_curr:
 		return hwm_curr_read(ddat, attr, val);
+	case hwmon_fan:
+		return hwm_fan_read(ddat, attr, val);
 	default:
 		return -EOPNOTSUPP;
 	}
@@ -739,12 +800,14 @@ hwm_get_preregistration_info(struct drm_i915_private *i915)
 		hwmon->rg.pkg_rapl_limit = PCU_PACKAGE_RAPL_LIMIT;
 		hwmon->rg.energy_status_all = PCU_PACKAGE_ENERGY_STATUS;
 		hwmon->rg.energy_status_tile = INVALID_MMIO_REG;
+		hwmon->rg.fan_speed = GEN12_PWM_FAN_SPEED;
 	} else {
 		hwmon->rg.pkg_power_sku_unit = INVALID_MMIO_REG;
 		hwmon->rg.pkg_power_sku = INVALID_MMIO_REG;
 		hwmon->rg.pkg_rapl_limit = INVALID_MMIO_REG;
 		hwmon->rg.energy_status_all = INVALID_MMIO_REG;
 		hwmon->rg.energy_status_tile = INVALID_MMIO_REG;
+		hwmon->rg.fan_speed = INVALID_MMIO_REG;
 	}
 
 	with_intel_runtime_pm(uncore->rpm, wakeref) {
@@ -771,6 +834,14 @@ hwm_get_preregistration_info(struct drm_i915_private *i915)
 		for_each_gt(gt, i915, i)
 			hwm_energy(&hwmon->ddat_gt[i], &energy);
 	}
+
+	if (i915_mmio_reg_valid(hwmon->rg.fan_speed)) {
+		/* Take initial readings and use it while calculating actual fan speed. */
+		with_intel_runtime_pm(uncore->rpm, wakeref)
+			ddat->fi.reg_val_prev = intel_uncore_read(ddat->uncore,
+								  hwmon->rg.fan_speed);
+		ddat->fi.time_prev = jiffies_to_msecs(jiffies);
+	}
 }
 
 void i915_hwmon_register(struct drm_i915_private *i915)
-- 
2.34.1

