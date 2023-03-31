Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ACD256D1595
	for <lists+dri-devel@lfdr.de>; Fri, 31 Mar 2023 04:26:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9888810E1AA;
	Fri, 31 Mar 2023 02:26:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A542010E1AA;
 Fri, 31 Mar 2023 02:26:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680229611; x=1711765611;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=HBWWKgEghOX43a9J0LyTn43+TRA3ldnTjJBuSzbau+w=;
 b=c1i4F6SO8XRKqHWuR4mPSQcnJ2gfZX0vKBKfebV78yhOyPVCm0PTUy5k
 Zk3v2wLo1H+oU85H/O43JRYcy41sRqt3kt5hXdmZ3aUAd3kE337VCPGor
 2CF4u+4HRfZtUk0V5Pn1wW2SCF73yDsBrO46odYbWkydz6R/WMf+kigsd
 W/LcwtlnilCyQqR34NOSq1F8P4wTJ3yJnV16fyadLRbZluxzk/Qej/qO3
 DPz+enp7Xrrm3L/b4ENyleMii3IZnw0zuDeqCy7d5nCQeKJRHaiGSPFGi
 2aSkQxkTzRHBUaqUF74dPrF1D4SkJaVis/Ez29wSETTCdhGVx1x5BCo1+ A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10665"; a="320986382"
X-IronPort-AV: E=Sophos;i="5.98,306,1673942400"; d="scan'208";a="320986382"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2023 19:26:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10665"; a="749434122"
X-IronPort-AV: E=Sophos;i="5.98,306,1673942400"; d="scan'208";a="749434122"
Received: from orsosgc001.jf.intel.com ([10.165.21.138])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2023 19:26:40 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2] drm/i915/hwmon: Use 0 to designate disabled PL1 power limit
Date: Thu, 30 Mar 2023 19:26:32 -0700
Message-Id: <20230331022632.1388175-1-ashutosh.dixit@intel.com>
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
Cc: Badal Nilawar <badal.nilawar@intel.com>, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On ATSM the PL1 limit is disabled at power up. The previous uapi assumed
that the PL1 limit is always enabled and therefore did not have a notion of
a disabled PL1 limit. This results in erroneous PL1 limit values when the
PL1 limit is disabled. For example at power up, the disabled ATSM PL1 limit
was previously shown as 0 which means a low PL1 limit whereas the limit
being disabled actually implies a high effective PL1 limit value.

To get round this problem, the PL1 limit uapi is expanded to include a
special value 0 to designate a disabled PL1 limit. A read value of 0 means
that the PL1 power limit is disabled, writing 0 disables the limit.

The link between this patch and the bugs mentioned below is as follows:
* Because on ATSM the PL1 power limit is disabled on power up and there
  were no means to enable it, we previously implemented the means to
  enable the limit when the PL1 hwmon entry (power1_max) was written to.
* Now there is a IGT igt@i915_hwmon@hwmon_write which (a) reads orig value
  from all hwmon sysfs  (b) does a bunch of random writes and finally (c)
  restores the orig value read. On ATSM since the orig value is 0, when
  the IGT restores the 0 value, the PL1 limit is now enabled with a value
  of 0.
* PL1 limit of 0 implies a low PL1 limit which causes GPU freq to fall to
  100 MHz. This causes GuC FW load and several IGT's to start timing out
  and gives rise to these Intel CI bugs. After this patch, writing 0 would
  disable the PL1 limit instead of enabling it, avoiding the freq drop
  issue.

v2: Add explanation for bugs mentioned below (Rodrigo)

Link: https://gitlab.freedesktop.org/drm/intel/-/issues/8062
Link: https://gitlab.freedesktop.org/drm/intel/-/issues/8060
Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 .../ABI/testing/sysfs-driver-intel-i915-hwmon |  4 +++-
 drivers/gpu/drm/i915/i915_hwmon.c             | 24 +++++++++++++++++++
 2 files changed, 27 insertions(+), 1 deletion(-)

diff --git a/Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon b/Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon
index 2d6a472eef885..8d7d8f05f6cd0 100644
--- a/Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon
+++ b/Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon
@@ -14,7 +14,9 @@ Description:	RW. Card reactive sustained  (PL1/Tau) power limit in microwatts.
 
 		The power controller will throttle the operating frequency
 		if the power averaged over a window (typically seconds)
-		exceeds this limit.
+		exceeds this limit. A read value of 0 means that the PL1
+		power limit is disabled, writing 0 disables the
+		limit. Writing values > 0 will enable the power limit.
 
 		Only supported for particular Intel i915 graphics platforms.
 
diff --git a/drivers/gpu/drm/i915/i915_hwmon.c b/drivers/gpu/drm/i915/i915_hwmon.c
index 596dd2c070106..c099057888914 100644
--- a/drivers/gpu/drm/i915/i915_hwmon.c
+++ b/drivers/gpu/drm/i915/i915_hwmon.c
@@ -349,6 +349,8 @@ hwm_power_is_visible(const struct hwm_drvdata *ddat, u32 attr, int chan)
 	}
 }
 
+#define PL1_DISABLE 0
+
 /*
  * HW allows arbitrary PL1 limits to be set but silently clamps these values to
  * "typical but not guaranteed" min/max values in rg.pkg_power_sku. Follow the
@@ -362,6 +364,14 @@ hwm_power_max_read(struct hwm_drvdata *ddat, long *val)
 	intel_wakeref_t wakeref;
 	u64 r, min, max;
 
+	/* Check if PL1 limit is disabled */
+	with_intel_runtime_pm(ddat->uncore->rpm, wakeref)
+		r = intel_uncore_read(ddat->uncore, hwmon->rg.pkg_rapl_limit);
+	if (!(r & PKG_PWR_LIM_1_EN)) {
+		*val = PL1_DISABLE;
+		return 0;
+	}
+
 	*val = hwm_field_read_and_scale(ddat,
 					hwmon->rg.pkg_rapl_limit,
 					PKG_PWR_LIM_1,
@@ -385,8 +395,22 @@ static int
 hwm_power_max_write(struct hwm_drvdata *ddat, long val)
 {
 	struct i915_hwmon *hwmon = ddat->hwmon;
+	intel_wakeref_t wakeref;
 	u32 nval;
 
+	if (val == PL1_DISABLE) {
+		/* Disable PL1 limit */
+		hwm_locked_with_pm_intel_uncore_rmw(ddat, hwmon->rg.pkg_rapl_limit,
+						    PKG_PWR_LIM_1_EN, 0);
+
+		/* Verify, because PL1 limit cannot be disabled on all platforms */
+		with_intel_runtime_pm(ddat->uncore->rpm, wakeref)
+			nval = intel_uncore_read(ddat->uncore, hwmon->rg.pkg_rapl_limit);
+		if (nval & PKG_PWR_LIM_1_EN)
+			return -EPERM;
+		return 0;
+	}
+
 	/* Computation in 64-bits to avoid overflow. Round to nearest. */
 	nval = DIV_ROUND_CLOSEST_ULL((u64)val << hwmon->scl_shift_power, SF_POWER);
 	nval = PKG_PWR_LIM_1_EN | REG_FIELD_PREP(PKG_PWR_LIM_1, nval);
-- 
2.38.0

