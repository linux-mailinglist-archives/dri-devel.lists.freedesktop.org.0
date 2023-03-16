Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 913126BC50C
	for <lists+dri-devel@lfdr.de>; Thu, 16 Mar 2023 05:00:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1ABC610E065;
	Thu, 16 Mar 2023 04:00:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7852B10E065;
 Thu, 16 Mar 2023 04:00:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678939200; x=1710475200;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=sXKsa6dMBDiAtLll8BwboZhsbKtZrgpSDENQ6zggi6U=;
 b=ZoU5zmkqpVZbUhjnEXsBjyOXomyBOIl6wBJ+yNgsC1JM7/drCOwYWm5u
 chDjy/94njmFGRXxIu1fG13jo0aRUzFLNp0R9UNsblGkVBes7ALy8MAtP
 YVctq6ZTtq4URUKBj1Kmi10w5lQJjEBp+NChKL+/Dv0fYiZL0Gx+qJJ76
 BWoJu1P79rVFiXxlvg4OllL7IZEo5KqBrMITuzKePRBVRSOyjjQUwNK5h
 Y3GUMeaQslJh6sSr0UDKaQTIMqdYv3ZctpbHwRwQcb+czNgoYxONa/XiQ
 +xE36tpjs7Ohvp5AQBcIKPC3ZDmteIQEB/V8Qg7jWJTyEFzCbqxRIU8rN w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10650"; a="365571972"
X-IronPort-AV: E=Sophos;i="5.98,264,1673942400"; d="scan'208";a="365571972"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Mar 2023 21:00:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10650"; a="748701390"
X-IronPort-AV: E=Sophos;i="5.98,264,1673942400"; d="scan'208";a="748701390"
Received: from orsosgc001.jf.intel.com ([10.165.21.138])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Mar 2023 20:59:59 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH] drm/i915/guc: Disable PL1 power limit when loading GuC
 firmware
Date: Wed, 15 Mar 2023 20:59:54 -0700
Message-Id: <20230316035954.2593843-1-ashutosh.dixit@intel.com>
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
Cc: dri-devel@lists.freedesktop.org, Badal Nilawar <badal.nilawar@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 John Harrison <john.c.harrison@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On dGfx, the PL1 power limit being enabled and set to a low value results
in a low GPU operating freq. It also negates the freq raise operation which
is done before GuC firmware load. As a result GuC firmware load can time
out. Such timeouts were seen in the GL #8062 bug below (where the PL1 power
limit was enabled and set to a low value). Therefore disable the PL1 power
limit when allowed by HW when loading GuC firmware.

v2:
 - Take mutex (to disallow writes to power1_max) across GuC reset/fw load
 - Add hwm_power_max_restore to error return code path

v3 (Jani N):
 - Add/remove explanatory comments
 - Function renames
 - Type corrections
 - Locking annotation

Link: https://gitlab.freedesktop.org/drm/intel/-/issues/8062
Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_uc.c |  9 +++++++
 drivers/gpu/drm/i915/i915_hwmon.c     | 39 +++++++++++++++++++++++++++
 drivers/gpu/drm/i915/i915_hwmon.h     |  7 +++++
 3 files changed, 55 insertions(+)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc.c b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
index 4ccb4be4c9cba..aa8e35a5636a0 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_uc.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
@@ -18,6 +18,7 @@
 #include "intel_uc.h"
 
 #include "i915_drv.h"
+#include "i915_hwmon.h"
 
 static const struct intel_uc_ops uc_ops_off;
 static const struct intel_uc_ops uc_ops_on;
@@ -461,6 +462,7 @@ static int __uc_init_hw(struct intel_uc *uc)
 	struct intel_guc *guc = &uc->guc;
 	struct intel_huc *huc = &uc->huc;
 	int ret, attempts;
+	bool pl1en;
 
 	GEM_BUG_ON(!intel_uc_supports_guc(uc));
 	GEM_BUG_ON(!intel_uc_wants_guc(uc));
@@ -491,6 +493,9 @@ static int __uc_init_hw(struct intel_uc *uc)
 	else
 		attempts = 1;
 
+	/* Disable a potentially low PL1 power limit to allow freq to be raised */
+	i915_hwmon_power_max_disable(gt->i915, &pl1en);
+
 	intel_rps_raise_unslice(&uc_to_gt(uc)->rps);
 
 	while (attempts--) {
@@ -547,6 +552,8 @@ static int __uc_init_hw(struct intel_uc *uc)
 		intel_rps_lower_unslice(&uc_to_gt(uc)->rps);
 	}
 
+	i915_hwmon_power_max_restore(gt->i915, pl1en);
+
 	guc_info(guc, "submission %s\n", str_enabled_disabled(intel_uc_uses_guc_submission(uc)));
 	guc_info(guc, "SLPC %s\n", str_enabled_disabled(intel_uc_uses_guc_slpc(uc)));
 
@@ -563,6 +570,8 @@ static int __uc_init_hw(struct intel_uc *uc)
 	/* Return GT back to RPn */
 	intel_rps_lower_unslice(&uc_to_gt(uc)->rps);
 
+	i915_hwmon_power_max_restore(gt->i915, pl1en);
+
 	__uc_sanitize(uc);
 
 	if (!ret) {
diff --git a/drivers/gpu/drm/i915/i915_hwmon.c b/drivers/gpu/drm/i915/i915_hwmon.c
index ee63a8fd88fc1..769b5bda4d53f 100644
--- a/drivers/gpu/drm/i915/i915_hwmon.c
+++ b/drivers/gpu/drm/i915/i915_hwmon.c
@@ -444,6 +444,45 @@ hwm_power_write(struct hwm_drvdata *ddat, u32 attr, int chan, long val)
 	}
 }
 
+void i915_hwmon_power_max_disable(struct drm_i915_private *i915, bool *old)
+	__acquires(i915->hwmon->hwmon_lock)
+{
+	struct i915_hwmon *hwmon = i915->hwmon;
+	intel_wakeref_t wakeref;
+	u32 r;
+
+	if (!hwmon || !i915_mmio_reg_valid(hwmon->rg.pkg_rapl_limit))
+		return;
+
+	/* Take mutex to prevent concurrent hwm_power_max_write */
+	mutex_lock(&hwmon->hwmon_lock);
+
+	with_intel_runtime_pm(hwmon->ddat.uncore->rpm, wakeref)
+		r = intel_uncore_rmw(hwmon->ddat.uncore,
+				     hwmon->rg.pkg_rapl_limit,
+				     PKG_PWR_LIM_1_EN, 0);
+
+	*old = !!(r & PKG_PWR_LIM_1_EN);
+}
+
+void i915_hwmon_power_max_restore(struct drm_i915_private *i915, bool old)
+	__releases(i915->hwmon->hwmon_lock)
+{
+	struct i915_hwmon *hwmon = i915->hwmon;
+	intel_wakeref_t wakeref;
+
+	if (!hwmon || !i915_mmio_reg_valid(hwmon->rg.pkg_rapl_limit))
+		return;
+
+	with_intel_runtime_pm(hwmon->ddat.uncore->rpm, wakeref)
+		intel_uncore_rmw(hwmon->ddat.uncore,
+				 hwmon->rg.pkg_rapl_limit,
+				 PKG_PWR_LIM_1_EN,
+				 old ? PKG_PWR_LIM_1_EN : 0);
+
+	mutex_unlock(&hwmon->hwmon_lock);
+}
+
 static umode_t
 hwm_energy_is_visible(const struct hwm_drvdata *ddat, u32 attr)
 {
diff --git a/drivers/gpu/drm/i915/i915_hwmon.h b/drivers/gpu/drm/i915/i915_hwmon.h
index 7ca9cf2c34c96..0fcb7de844061 100644
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
+void i915_hwmon_power_max_disable(struct drm_i915_private *i915, bool *old);
+void i915_hwmon_power_max_restore(struct drm_i915_private *i915, bool old);
 #else
 static inline void i915_hwmon_register(struct drm_i915_private *i915) { };
 static inline void i915_hwmon_unregister(struct drm_i915_private *i915) { };
+static inline void i915_hwmon_power_max_disable(struct drm_i915_private *i915, bool *old) { };
+static inline void i915_hwmon_power_max_restore(struct drm_i915_private *i915, bool old) { };
 #endif
 
 #endif /* __I915_HWMON_H__ */
-- 
2.38.0

