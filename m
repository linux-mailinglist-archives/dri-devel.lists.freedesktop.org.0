Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F0A76CCE20
	for <lists+dri-devel@lfdr.de>; Wed, 29 Mar 2023 01:36:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A70910E13D;
	Tue, 28 Mar 2023 23:36:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B7CD10E13D;
 Tue, 28 Mar 2023 23:36:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680046562; x=1711582562;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=tDVH8RDqRu0zI89/KRom/DN3qLs+DojynELDAVNwNC0=;
 b=QBtk4AInstsgv/LD3sdd13teYthHw/TRpc0Ora9iojzLu+IreH1HmOkq
 auA9W9UJ4NggzdTFnMclkoCuWYpFVQTPwgsBd6yiFDAjM/gciHr/89DvQ
 6Zdi+00pEqg0K8bKDHLY72ZoBhTDi12r3l+/FoP0EREoOnUJSLVAs+mfx
 Z5kiZZH/nnJ3vR0AexQD0YYnyUCuD+jtl3QAhxmApDkEip8ZkMeBRnDoA
 eVboU7l3rMBvPQZinjW9uaMIT2/NzVtXcgE4JGowCsR7fhTPaQYTuuIyi
 MzRCmSSLAHSWn7hAdWPkFWb0yV/pQYESANVHEkKeIucxshTyw1ukejss2 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10663"; a="338228424"
X-IronPort-AV: E=Sophos;i="5.98,299,1673942400"; d="scan'208";a="338228424"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2023 16:35:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10663"; a="686610521"
X-IronPort-AV: E=Sophos;i="5.98,299,1673942400"; d="scan'208";a="686610521"
Received: from orsosgc001.jf.intel.com ([10.165.21.138])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2023 16:35:48 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH] drm/i915/hwmon: Use 0 to designate disabled PL1 power limit
Date: Tue, 28 Mar 2023 16:35:43 -0700
Message-Id: <20230328233543.1091127-1-ashutosh.dixit@intel.com>
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
Cc: John Harrison <john.c.harrison@intel.com>,
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
special value 0 to designate a disabled PL1 limit.

Bug: https://gitlab.freedesktop.org/drm/intel/-/issues/8062
Bug: https://gitlab.freedesktop.org/drm/intel/-/issues/8060
Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 .../ABI/testing/sysfs-driver-intel-i915-hwmon |  3 ++-
 drivers/gpu/drm/i915/i915_hwmon.c             | 24 +++++++++++++++++++
 2 files changed, 26 insertions(+), 1 deletion(-)

diff --git a/Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon b/Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon
index 2d6a472eef885..96fec0bb74c2c 100644
--- a/Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon
+++ b/Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon
@@ -14,7 +14,8 @@ Description:	RW. Card reactive sustained  (PL1/Tau) power limit in microwatts.
 
 		The power controller will throttle the operating frequency
 		if the power averaged over a window (typically seconds)
-		exceeds this limit.
+		exceeds this limit. A read value of 0 means that the PL1 power
+		limit is disabled. Writing 0 disables the limit if possible.
 
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

