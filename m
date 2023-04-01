Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 431D86D2DC0
	for <lists+dri-devel@lfdr.de>; Sat,  1 Apr 2023 04:41:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCA5F10E23E;
	Sat,  1 Apr 2023 02:41:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6747E10E23E;
 Sat,  1 Apr 2023 02:41:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680316912; x=1711852912;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=4TEJFtEfi0glO/PxL6oYOHpdzwENT5gu4fOpcqV4ZF4=;
 b=INqt47yaAmDAbOIEAs8LPtEbYN80di3p7mieWU88YIZs4+hEGSuWt9bE
 4OsLoApGRPnBwXTNnCFchaDm2LMnmD4oA6v6JYIGwfiDsUfCoDlqTChVX
 USfKPd8qL9b4Z7JnuUvHN8hF6H69SIrwR/jXRmAkoflVyMlhdrwxuINTy
 GNHUYiT8fbwC0fb2PQDpDq0TR7zoOJfAut/tTCTD7agu6bgu/lqWT6Ks5
 R0eTTntU/01+DIPfqqxLWY0HiR7nYCXmLT3RUHNr6CEzhyLTomFZdQy6P
 UtgAfAmRoQ/MxU/AGxRRexz9O3z/WfZ9eFBmjZ+Vh5odUDZfiz6+6BNKe A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10666"; a="404346523"
X-IronPort-AV: E=Sophos;i="5.98,308,1673942400"; d="scan'208";a="404346523"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2023 19:41:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10666"; a="859545224"
X-IronPort-AV: E=Sophos;i="5.98,308,1673942400"; d="scan'208";a="859545224"
Received: from orsosgc001.jf.intel.com ([10.165.21.138])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2023 19:41:51 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v3] drm/i915/hwmon: Use 0 to designate disabled PL1 power limit
Date: Fri, 31 Mar 2023 19:41:46 -0700
Message-Id: <20230401024146.1826092-1-ashutosh.dixit@intel.com>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Badal Nilawar <badal.nilawar@intel.com>, dri-devel@lists.freedesktop.org,
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
v3: Eliminate race during PL1 disable and verify (Tvrtko)
    Change return to -ENODEV if verify fails (Tvrtko)

Link: https://gitlab.freedesktop.org/drm/intel/-/issues/8062
Link: https://gitlab.freedesktop.org/drm/intel/-/issues/8060
Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 .../ABI/testing/sysfs-driver-intel-i915-hwmon |  4 ++-
 drivers/gpu/drm/i915/i915_hwmon.c             | 26 +++++++++++++++++++
 2 files changed, 29 insertions(+), 1 deletion(-)

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
index 596dd2c070106..8e7dccc8d3a0e 100644
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
@@ -385,8 +395,24 @@ static int
 hwm_power_max_write(struct hwm_drvdata *ddat, long val)
 {
 	struct i915_hwmon *hwmon = ddat->hwmon;
+	intel_wakeref_t wakeref;
 	u32 nval;
 
+	/* Disable PL1 limit and verify, because the limit cannot be disabled on all platforms */
+	if (val == PL1_DISABLE) {
+		mutex_lock(&hwmon->hwmon_lock);
+		with_intel_runtime_pm(ddat->uncore->rpm, wakeref) {
+			intel_uncore_rmw(ddat->uncore, hwmon->rg.pkg_rapl_limit,
+					 PKG_PWR_LIM_1_EN, 0);
+			nval = intel_uncore_read(ddat->uncore, hwmon->rg.pkg_rapl_limit);
+		}
+		mutex_unlock(&hwmon->hwmon_lock);
+
+		if (nval & PKG_PWR_LIM_1_EN)
+			return -ENODEV;
+		return 0;
+	}
+
 	/* Computation in 64-bits to avoid overflow. Round to nearest. */
 	nval = DIV_ROUND_CLOSEST_ULL((u64)val << hwmon->scl_shift_power, SF_POWER);
 	nval = PKG_PWR_LIM_1_EN | REG_FIELD_PREP(PKG_PWR_LIM_1, nval);
-- 
2.38.0

