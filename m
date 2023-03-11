Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 44D5C6B56C3
	for <lists+dri-devel@lfdr.de>; Sat, 11 Mar 2023 01:34:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 793F710E009;
	Sat, 11 Mar 2023 00:34:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C3BD10E009;
 Sat, 11 Mar 2023 00:34:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678494843; x=1710030843;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=wwTDYs50FVbe7RdXLfjd2kDA5zGwPWdVcjlFpvZNpyA=;
 b=JH/jcZjKrllhJdWWK43QGM1MsV3IowbfscgIf2Yimzn0BUt2HpC8q2g/
 bY+jHtWL+gll7hWFd80Ei9O8pD0cCii8o26/Em+uyfWI+YA+OH3DXYDC1
 83hp3Km8LXS1xLyjgwOx6ZVrks0vi9iZzMAiXj5sr9cEx3zkOC8+azxv6
 lxqe06AhW61XIxXud4GAbhBFEm6I8MKyB6FSCV8UAGx7K+tNlR9HnkhJn
 hjbKjq6CuacHYqZVE87iJL/wwIRq1LEch+6+UpngZYFlFcyCYsZqMiXqx
 /IEyeQFlQ3hfbyULhOuRhGJ98uNMWbI/UPDTyTS+5sbKYzepp0sEhM5H3 w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10645"; a="317248715"
X-IronPort-AV: E=Sophos;i="5.98,251,1673942400"; d="scan'208";a="317248715"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2023 16:34:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10645"; a="923869635"
X-IronPort-AV: E=Sophos;i="5.98,251,1673942400"; d="scan'208";a="923869635"
Received: from orsosgc001.jf.intel.com ([10.165.21.138])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2023 16:34:02 -0800
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH] drm/i915/guc: Disable PL1 power limit when loading GuC
 firmware
Date: Fri, 10 Mar 2023 16:33:58 -0800
Message-Id: <20230311003358.1660191-1-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.38.0
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
Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 John Harrison <john.c.harrison@intel.com>,
 Badal Nilawar <badal.nilawar@intel.com>, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On dGfx, the PL1 power limit being enabled and set to a low value results
in a low GPU operating freq. It also negates the freq raise operation which
is done before GuC firmware load. As a result GuC firmware load can time
out. Such timeouts were seen in the GL #8062 bug below (where the PL1 power
limit was enabled and set to a low value). Therefore disable the PL1 power
limit when possible when loading GuC firmware.

Link: https://gitlab.freedesktop.org/drm/intel/-/issues/8062
Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_uc.c |  9 ++++++-
 drivers/gpu/drm/i915/i915_hwmon.c     | 34 +++++++++++++++++++++++++--
 drivers/gpu/drm/i915/i915_hwmon.h     |  7 ++++++
 3 files changed, 47 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc.c b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
index 1b7ecd384a79..8794d54500d7 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_uc.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
@@ -18,6 +18,7 @@
 #include "intel_uc.h"
 
 #include "i915_drv.h"
+#include "i915_hwmon.h"
 
 static const struct intel_uc_ops uc_ops_off;
 static const struct intel_uc_ops uc_ops_on;
@@ -460,7 +461,7 @@ static int __uc_init_hw(struct intel_uc *uc)
 	struct drm_i915_private *i915 = gt->i915;
 	struct intel_guc *guc = &uc->guc;
 	struct intel_huc *huc = &uc->huc;
-	int ret, attempts;
+	int ret, attempts, pl1en;
 
 	GEM_BUG_ON(!intel_uc_supports_guc(uc));
 	GEM_BUG_ON(!intel_uc_wants_guc(uc));
@@ -491,6 +492,9 @@ static int __uc_init_hw(struct intel_uc *uc)
 	else
 		attempts = 1;
 
+	/* Disable PL1 limit before raising freq when possible */
+	hwm_power_max_disable(gt, &pl1en);
+
 	intel_rps_raise_unslice(&uc_to_gt(uc)->rps);
 
 	while (attempts--) {
@@ -544,6 +548,9 @@ static int __uc_init_hw(struct intel_uc *uc)
 		intel_rps_lower_unslice(&uc_to_gt(uc)->rps);
 	}
 
+	/* Restore PL1 limit */
+	hwm_power_max_restore(gt, pl1en);
+
 	guc_info(guc, "submission %s\n", str_enabled_disabled(intel_uc_uses_guc_submission(uc)));
 	guc_info(guc, "SLPC %s\n", str_enabled_disabled(intel_uc_uses_guc_slpc(uc)));
 
diff --git a/drivers/gpu/drm/i915/i915_hwmon.c b/drivers/gpu/drm/i915/i915_hwmon.c
index ee63a8fd88fc..4ce3da7b7adc 100644
--- a/drivers/gpu/drm/i915/i915_hwmon.c
+++ b/drivers/gpu/drm/i915/i915_hwmon.c
@@ -62,20 +62,23 @@ struct i915_hwmon {
 	int scl_shift_time;
 };
 
-static void
+static u32
 hwm_locked_with_pm_intel_uncore_rmw(struct hwm_drvdata *ddat,
 				    i915_reg_t reg, u32 clear, u32 set)
 {
 	struct i915_hwmon *hwmon = ddat->hwmon;
 	struct intel_uncore *uncore = ddat->uncore;
 	intel_wakeref_t wakeref;
+	u32 old;
 
 	mutex_lock(&hwmon->hwmon_lock);
 
 	with_intel_runtime_pm(uncore->rpm, wakeref)
-		intel_uncore_rmw(uncore, reg, clear, set);
+		old = intel_uncore_rmw(uncore, reg, clear, set);
 
 	mutex_unlock(&hwmon->hwmon_lock);
+
+	return old;
 }
 
 /*
@@ -444,6 +447,33 @@ hwm_power_write(struct hwm_drvdata *ddat, u32 attr, int chan, long val)
 	}
 }
 
+void hwm_power_max_disable(struct intel_gt *gt, u32 *old)
+{
+	struct i915_hwmon *hwmon = gt->i915->hwmon;
+	u32 r;
+
+	if (!hwmon || !i915_mmio_reg_valid(hwmon->rg.pkg_rapl_limit))
+		return;
+
+	r = hwm_locked_with_pm_intel_uncore_rmw(&hwmon->ddat,
+						hwmon->rg.pkg_rapl_limit,
+						PKG_PWR_LIM_1_EN, 0);
+	*old = !!(r & PKG_PWR_LIM_1_EN);
+}
+
+void hwm_power_max_restore(struct intel_gt *gt, u32 old)
+{
+	struct i915_hwmon *hwmon = gt->i915->hwmon;
+
+	if (!hwmon || !i915_mmio_reg_valid(hwmon->rg.pkg_rapl_limit))
+		return;
+
+	hwm_locked_with_pm_intel_uncore_rmw(&hwmon->ddat,
+					    hwmon->rg.pkg_rapl_limit,
+					    PKG_PWR_LIM_1_EN,
+					    old ? PKG_PWR_LIM_1_EN : 0);
+}
+
 static umode_t
 hwm_energy_is_visible(const struct hwm_drvdata *ddat, u32 attr)
 {
diff --git a/drivers/gpu/drm/i915/i915_hwmon.h b/drivers/gpu/drm/i915/i915_hwmon.h
index 7ca9cf2c34c9..0c2db11be2e2 100644
--- a/drivers/gpu/drm/i915/i915_hwmon.h
+++ b/drivers/gpu/drm/i915/i915_hwmon.h
@@ -7,14 +7,21 @@
 #ifndef __I915_HWMON_H__
 #define __I915_HWMON_H__
 
+#include <linux/types.h>
+
 struct drm_i915_private;
+struct intel_gt;
 
 #if IS_REACHABLE(CONFIG_HWMON)
 void i915_hwmon_register(struct drm_i915_private *i915);
 void i915_hwmon_unregister(struct drm_i915_private *i915);
+void hwm_power_max_disable(struct intel_gt *gt, u32 *old);
+void hwm_power_max_restore(struct intel_gt *gt, u32 old);
 #else
 static inline void i915_hwmon_register(struct drm_i915_private *i915) { };
 static inline void i915_hwmon_unregister(struct drm_i915_private *i915) { };
+void hwm_power_max_disable(struct intel_gt *gt, u32 *old) { };
+void hwm_power_max_restore(struct intel_gt *gt, u32 old) { };
 #endif
 
 #endif /* __I915_HWMON_H__ */
-- 
2.38.0

