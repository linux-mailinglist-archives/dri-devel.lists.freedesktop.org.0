Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF01364E12D
	for <lists+dri-devel@lfdr.de>; Thu, 15 Dec 2022 19:44:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5AAB10E4DA;
	Thu, 15 Dec 2022 18:44:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B178D10E4D3;
 Thu, 15 Dec 2022 18:44:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1671129853; x=1702665853;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=86vO0KLZMv7KO84HkROPRiSKu/hJwzd8f8pHk2y9gNQ=;
 b=XbqWLb97KBs2QcwES0EVof/WWHBlzJOhMwvK+MFfVnd8nA00l0zt/p32
 aPBWGrXHq+oQS88MR5vHRlup5iUX2zu4epbfE3QNImXq4JKbG5m+tJxcC
 zhg7hLwKOXRDphIiF++ePp02ovY61czIIkb6t7uukgl72TOXK1SLInKQp
 I2PjyNy3o6v/HCxrLKSiTFPjpLH13ES66FwOHSOcIoQBKSc3fBQ6TaYms
 tdgrZYJ+rnodnPhqiXqQ+cen16mRuaY5cQaP1nqZFX08lfiy5gCco3dpB
 NhT9QxUlQTtkkNQtGUf4ViOIdomtcKeVCzEiEDZlqERF84Zy4igR6A5HH A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10562"; a="405028888"
X-IronPort-AV: E=Sophos;i="5.96,248,1665471600"; d="scan'208";a="405028888"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2022 10:44:13 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10562"; a="649537880"
X-IronPort-AV: E=Sophos;i="5.96,248,1665471600"; d="scan'208";a="649537880"
Received: from unerlige-ril.jf.intel.com ([10.165.21.138])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2022 10:44:12 -0800
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH] drm/i915/hwmon: Display clamped PL1 limit
Date: Thu, 15 Dec 2022 10:44:09 -0800
Message-Id: <20221215184409.2467595-1-ashutosh.dixit@intel.com>
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
Cc: Anshuman Gupta <anshuman.gupta@intel.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

HW allows arbitrary PL1 limits to be set but silently clamps these values
to "typical but not guaranteed" min/max values in pkg_power_sku
register. Follow the same pattern for sysfs, allow arbitrary PL1 limits to
be set but display clamped values when read.

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 drivers/gpu/drm/i915/i915_hwmon.c        | 39 ++++++++++++++++++++----
 drivers/gpu/drm/i915/intel_mchbar_regs.h |  2 ++
 2 files changed, 35 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_hwmon.c b/drivers/gpu/drm/i915/i915_hwmon.c
index cca7a4350ec8f..1225bc432f0d5 100644
--- a/drivers/gpu/drm/i915/i915_hwmon.c
+++ b/drivers/gpu/drm/i915/i915_hwmon.c
@@ -359,6 +359,38 @@ hwm_power_is_visible(const struct hwm_drvdata *ddat, u32 attr, int chan)
 	}
 }
 
+/*
+ * HW allows arbitrary PL1 limits to be set but silently clamps these values to
+ * "typical but not guaranteed" min/max values in rg.pkg_power_sku. Follow the
+ * same pattern for sysfs, allow arbitrary PL1 limits to be set but display
+ * clamped values when read. Write/read I1 also follows the same pattern.
+ */
+static int
+hwm_power_max_read(struct hwm_drvdata *ddat, long *val)
+{
+	struct i915_hwmon *hwmon = ddat->hwmon;
+	intel_wakeref_t wakeref;
+	u64 r, min, max;
+
+	*val = hwm_field_read_and_scale(ddat,
+					hwmon->rg.pkg_rapl_limit,
+					PKG_PWR_LIM_1,
+					hwmon->scl_shift_power,
+					SF_POWER);
+
+	with_intel_runtime_pm(ddat->uncore->rpm, wakeref)
+		r = intel_uncore_read64(ddat->uncore, hwmon->rg.pkg_power_sku);
+	min = REG_FIELD_GET(PKG_MIN_PWR, r);
+	min = mul_u64_u32_shr(min, SF_POWER, hwmon->scl_shift_power);
+	max = REG_FIELD_GET(PKG_MAX_PWR, r);
+	max = mul_u64_u32_shr(max, SF_POWER, hwmon->scl_shift_power);
+
+	if (min && max)
+		*val = clamp_t(u64, *val, min, max);
+
+	return 0;
+}
+
 static int
 hwm_power_read(struct hwm_drvdata *ddat, u32 attr, int chan, long *val)
 {
@@ -368,12 +400,7 @@ hwm_power_read(struct hwm_drvdata *ddat, u32 attr, int chan, long *val)
 
 	switch (attr) {
 	case hwmon_power_max:
-		*val = hwm_field_read_and_scale(ddat,
-						hwmon->rg.pkg_rapl_limit,
-						PKG_PWR_LIM_1,
-						hwmon->scl_shift_power,
-						SF_POWER);
-		return 0;
+		return hwm_power_max_read(ddat, val);
 	case hwmon_power_rated_max:
 		*val = hwm_field_read_and_scale(ddat,
 						hwmon->rg.pkg_power_sku,
diff --git a/drivers/gpu/drm/i915/intel_mchbar_regs.h b/drivers/gpu/drm/i915/intel_mchbar_regs.h
index f93e9af43ac35..73900c098d591 100644
--- a/drivers/gpu/drm/i915/intel_mchbar_regs.h
+++ b/drivers/gpu/drm/i915/intel_mchbar_regs.h
@@ -194,6 +194,8 @@
  */
 #define PCU_PACKAGE_POWER_SKU			_MMIO(MCHBAR_MIRROR_BASE_SNB + 0x5930)
 #define   PKG_PKG_TDP				GENMASK_ULL(14, 0)
+#define   PKG_MIN_PWR				GENMASK_ULL(30, 16)
+#define   PKG_MAX_PWR				GENMASK_ULL(46, 32)
 #define   PKG_MAX_WIN				GENMASK_ULL(54, 48)
 #define     PKG_MAX_WIN_X			GENMASK_ULL(54, 53)
 #define     PKG_MAX_WIN_Y			GENMASK_ULL(52, 48)
-- 
2.38.0

