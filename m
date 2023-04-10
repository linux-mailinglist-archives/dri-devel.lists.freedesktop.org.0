Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 583046DCD7E
	for <lists+dri-devel@lfdr.de>; Tue, 11 Apr 2023 00:35:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 536B010E340;
	Mon, 10 Apr 2023 22:35:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E1C410E340;
 Mon, 10 Apr 2023 22:35:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681166116; x=1712702116;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=LQeSDitdwM/hJUka0+QuVOi+kcvzWio8Ay+7oJ2CdG0=;
 b=h0tUdeOvKc2YiZM/MHBrECW1fkKDY05fcrdvUp/Qs0Q+qBq++bccD5KE
 n/pdCAbfK7TgYoypJK5c5uYEMcN283wsR0vJMwb2r0xWVluc8DlygRMyu
 hDghuzRhoYJ/q5h/WXGVRoHaUmFMy2DeoDKkSv0arkrZgpGot0FB4Mo5H
 wlujYNqp72t8ks/t7gy+GCPuyGpz8VZToJtfDYkm6KDsZAKmjHQp1+Kj9
 W4osjGviXN91km2Uy1lUwCGnRyvA/tXMCeGDyryf4omQSXvRKSFuyo0vo
 bShHpo62w7zwFBB/m999t8yB6xNbkXfwY9tGSVGruhjy5+3XysBW3ArHe g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10676"; a="342233894"
X-IronPort-AV: E=Sophos;i="5.98,333,1673942400"; d="scan'208";a="342233894"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2023 15:35:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10676"; a="777682128"
X-IronPort-AV: E=Sophos;i="5.98,333,1673942400"; d="scan'208";a="777682128"
Received: from orsosgc001.jf.intel.com ([10.165.21.138])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2023 15:35:15 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 2/3] drm/i915/guc: Disable PL1 power limit when loading GuC
 firmware
Date: Mon, 10 Apr 2023 15:35:08 -0700
Message-Id: <20230410223509.3593109-3-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.38.0
In-Reply-To: <20230410223509.3593109-1-ashutosh.dixit@intel.com>
References: <20230410223509.3593109-1-ashutosh.dixit@intel.com>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
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

v4:
 - Don't hold the lock across GuC reset (Rodrigo)
 - New locking scheme (suggested by Rodrigo)
 - Eliminate rpm_get in power_max_disable/restore, not needed (Tvrtko)

v5:
 - Fix uninitialized pl1en variable compile warning reported by kernel
   build robot by creating new err_rps label

Link: https://gitlab.freedesktop.org/drm/intel/-/issues/8062
Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_uc.c | 13 +++++++--
 drivers/gpu/drm/i915/i915_hwmon.c     | 40 +++++++++++++++++++++++++++
 drivers/gpu/drm/i915/i915_hwmon.h     |  7 +++++
 3 files changed, 58 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc.c b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
index 4ccb4be4c9cba..996168312340e 100644
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
@@ -500,7 +505,7 @@ static int __uc_init_hw(struct intel_uc *uc)
 		 */
 		ret = __uc_sanitize(uc);
 		if (ret)
-			goto err_out;
+			goto err_rps;
 
 		intel_huc_fw_upload(huc);
 		intel_guc_ads_reset(guc);
@@ -547,6 +552,8 @@ static int __uc_init_hw(struct intel_uc *uc)
 		intel_rps_lower_unslice(&uc_to_gt(uc)->rps);
 	}
 
+	i915_hwmon_power_max_restore(gt->i915, pl1en);
+
 	guc_info(guc, "submission %s\n", str_enabled_disabled(intel_uc_uses_guc_submission(uc)));
 	guc_info(guc, "SLPC %s\n", str_enabled_disabled(intel_uc_uses_guc_slpc(uc)));
 
@@ -559,10 +566,12 @@ static int __uc_init_hw(struct intel_uc *uc)
 	intel_guc_submission_disable(guc);
 err_log_capture:
 	__uc_capture_load_err_log(uc);
-err_out:
+err_rps:
 	/* Return GT back to RPn */
 	intel_rps_lower_unslice(&uc_to_gt(uc)->rps);
 
+	i915_hwmon_power_max_restore(gt->i915, pl1en);
+err_out:
 	__uc_sanitize(uc);
 
 	if (!ret) {
diff --git a/drivers/gpu/drm/i915/i915_hwmon.c b/drivers/gpu/drm/i915/i915_hwmon.c
index 7f44e809ca155..9ab8971679fe3 100644
--- a/drivers/gpu/drm/i915/i915_hwmon.c
+++ b/drivers/gpu/drm/i915/i915_hwmon.c
@@ -50,6 +50,7 @@ struct hwm_drvdata {
 	struct hwm_energy_info ei;		/*  Energy info for energy1_input */
 	char name[12];
 	int gt_n;
+	bool reset_in_progress;
 };
 
 struct i915_hwmon {
@@ -400,6 +401,10 @@ hwm_power_max_write(struct hwm_drvdata *ddat, long val)
 	u32 nval;
 
 	mutex_lock(&hwmon->hwmon_lock);
+	if (hwmon->ddat.reset_in_progress) {
+		ret = -EAGAIN;
+		goto unlock;
+	}
 	wakeref = intel_runtime_pm_get(ddat->uncore->rpm);
 
 	/* Disable PL1 limit and verify, because the limit cannot be disabled on all platforms */
@@ -421,6 +426,7 @@ hwm_power_max_write(struct hwm_drvdata *ddat, long val)
 			 PKG_PWR_LIM_1_EN | PKG_PWR_LIM_1, nval);
 exit:
 	intel_runtime_pm_put(ddat->uncore->rpm, wakeref);
+unlock:
 	mutex_unlock(&hwmon->hwmon_lock);
 	return ret;
 }
@@ -472,6 +478,40 @@ hwm_power_write(struct hwm_drvdata *ddat, u32 attr, int chan, long val)
 	}
 }
 
+void i915_hwmon_power_max_disable(struct drm_i915_private *i915, bool *old)
+{
+	struct i915_hwmon *hwmon = i915->hwmon;
+	u32 r;
+
+	if (!hwmon || !i915_mmio_reg_valid(hwmon->rg.pkg_rapl_limit))
+		return;
+
+	mutex_lock(&hwmon->hwmon_lock);
+
+	hwmon->ddat.reset_in_progress = true;
+	r = intel_uncore_rmw(hwmon->ddat.uncore, hwmon->rg.pkg_rapl_limit,
+			     PKG_PWR_LIM_1_EN, 0);
+	*old = !!(r & PKG_PWR_LIM_1_EN);
+
+	mutex_unlock(&hwmon->hwmon_lock);
+}
+
+void i915_hwmon_power_max_restore(struct drm_i915_private *i915, bool old)
+{
+	struct i915_hwmon *hwmon = i915->hwmon;
+
+	if (!hwmon || !i915_mmio_reg_valid(hwmon->rg.pkg_rapl_limit))
+		return;
+
+	mutex_lock(&hwmon->hwmon_lock);
+
+	intel_uncore_rmw(hwmon->ddat.uncore, hwmon->rg.pkg_rapl_limit,
+			 PKG_PWR_LIM_1_EN, old ? PKG_PWR_LIM_1_EN : 0);
+	hwmon->ddat.reset_in_progress = false;
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

