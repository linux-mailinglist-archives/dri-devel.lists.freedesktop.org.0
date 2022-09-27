Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 238AA5EB9FD
	for <lists+dri-devel@lfdr.de>; Tue, 27 Sep 2022 07:48:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D66010E438;
	Tue, 27 Sep 2022 05:48:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E39310E438;
 Tue, 27 Sep 2022 05:47:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1664257675; x=1695793675;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=EE3WqG4lyG3ghTDmGGh65/XmUYbgcL2jGiWK/76q2pk=;
 b=M3s3zEIOiuspyZ02pkbg0aC2umXvlC6vnXhdC+G8U2SLAQ1SDNfpmh+G
 thYwvxpYIGliGlcxPNv2ln6ik9SuYe141QclMKd+oYJF1Z/JcOoc9s//P
 efEHZwcU3iYySX9X3M6RWPdFBgUYzTcC6N3yJIwxomPhURUpAVKUSZ40V
 /jsAkeKtAgIA5Cw1Hfad3SDxFpUWkM8wUVLM+B7HK10yjW3VqInnxNkdr
 2nhHuRnI1ikYyr0yO3mNxugLig6LST9BGMobzalkqhfIMxpKB1EtkQLSo
 d7udHssqucFlihYwlee3JxEGMxzPkR8HaVteYlp4MMfGfwQ87rne4VKTP w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10482"; a="363066409"
X-IronPort-AV: E=Sophos;i="5.93,348,1654585200"; d="scan'208";a="363066409"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2022 22:47:54 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10482"; a="725376849"
X-IronPort-AV: E=Sophos;i="5.93,348,1654585200"; d="scan'208";a="725376849"
Received: from bnilawar-desk1.iind.intel.com ([10.145.169.158])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2022 22:47:52 -0700
From: Badal Nilawar <badal.nilawar@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 5/7] drm/i915/hwmon: Expose card reactive critical power
Date: Tue, 27 Sep 2022 11:20:18 +0530
Message-Id: <20220927055020.3499420-6-badal.nilawar@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220927055020.3499420-1-badal.nilawar@intel.com>
References: <20220927055020.3499420-1-badal.nilawar@intel.com>
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
Cc: linux-hwmon@vger.kernel.org, andi.shyti@intel.com, tvrtko.ursulin@intel.com,
 anshuman.gupta@intel.com, dri-devel@lists.freedesktop.org,
 ashutosh.dixit@intel.com, jon.ewins@intel.com, riana.tauro@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Ashutosh Dixit <ashutosh.dixit@intel.com>

Expose the card reactive critical (I1) power. I1 is exposed as
power1_crit in microwatts (typically for client products) or as
curr1_crit in milliamperes (typically for server).

v2: Add curr1_crit functionality (Ashutosh)
v3: Use HWMON_CHANNEL_INFO to define power1_crit, curr1_crit (Badal)
v4: Use hwm_ prefix for static functions (Ashutosh)
v5: KernelVersion: 6.2, Date: February 2023 in doc (Tvrtko)

Cc: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
Acked-by: Guenter Roeck <linux@roeck-us.net>
Reviewed-by: Anshuman Gupta <anshuman.gupta@intel.com>
---
 .../ABI/testing/sysfs-driver-intel-i915-hwmon | 26 +++++
 drivers/gpu/drm/i915/i915_hwmon.c             | 95 ++++++++++++++++++-
 drivers/gpu/drm/i915/i915_reg.h               |  6 ++
 3 files changed, 126 insertions(+), 1 deletion(-)

diff --git a/Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon b/Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon
index 7525db243d74..f9d6d3b08bba 100644
--- a/Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon
+++ b/Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon
@@ -26,6 +26,32 @@ Description:	RO. Card default power limit (default TDP setting).
 
 		Only supported for particular Intel i915 graphics platforms.
 
+What:		/sys/devices/.../hwmon/hwmon<i>/power1_crit
+Date:		February 2023
+KernelVersion:	6.2
+Contact:	dri-devel@lists.freedesktop.org
+Description:	RW. Card reactive critical (I1) power limit in microwatts.
+
+		Card reactive critical (I1) power limit in microwatts is exposed
+		for client products. The power controller will throttle the
+		operating frequency if the power averaged over a window exceeds
+		this limit.
+
+		Only supported for particular Intel i915 graphics platforms.
+
+What:		/sys/devices/.../hwmon/hwmon<i>/curr1_crit
+Date:		February 2023
+KernelVersion:	6.2
+Contact:	dri-devel@lists.freedesktop.org
+Description:	RW. Card reactive critical (I1) power limit in milliamperes.
+
+		Card reactive critical (I1) power limit in milliamperes is
+		exposed for server products. The power controller will throttle
+		the operating frequency if the power averaged over a window
+		exceeds this limit.
+
+		Only supported for particular Intel i915 graphics platforms.
+
 What:		/sys/devices/.../hwmon/hwmon<i>/energy1_input
 Date:		February 2023
 KernelVersion:	6.2
diff --git a/drivers/gpu/drm/i915/i915_hwmon.c b/drivers/gpu/drm/i915/i915_hwmon.c
index 9a49521b358a..2394fa789793 100644
--- a/drivers/gpu/drm/i915/i915_hwmon.c
+++ b/drivers/gpu/drm/i915/i915_hwmon.c
@@ -11,16 +11,19 @@
 #include "i915_hwmon.h"
 #include "i915_reg.h"
 #include "intel_mchbar_regs.h"
+#include "intel_pcode.h"
 #include "gt/intel_gt_regs.h"
 
 /*
  * SF_* - scale factors for particular quantities according to hwmon spec.
  * - voltage  - millivolts
  * - power  - microwatts
+ * - curr   - milliamperes
  * - energy - microjoules
  */
 #define SF_VOLTAGE	1000
 #define SF_POWER	1000000
+#define SF_CURR		1000
 #define SF_ENERGY	1000000
 
 struct hwm_reg {
@@ -160,11 +163,25 @@ hwm_energy(struct hwm_drvdata *ddat, long *energy)
 
 static const struct hwmon_channel_info *hwm_info[] = {
 	HWMON_CHANNEL_INFO(in, HWMON_I_INPUT),
-	HWMON_CHANNEL_INFO(power, HWMON_P_MAX | HWMON_P_RATED_MAX),
+	HWMON_CHANNEL_INFO(power, HWMON_P_MAX | HWMON_P_RATED_MAX | HWMON_P_CRIT),
 	HWMON_CHANNEL_INFO(energy, HWMON_E_INPUT),
+	HWMON_CHANNEL_INFO(curr, HWMON_C_CRIT),
 	NULL
 };
 
+/* I1 is exposed as power_crit or as curr_crit depending on bit 31 */
+static int hwm_pcode_read_i1(struct drm_i915_private *i915, u32 *uval)
+{
+	return snb_pcode_read_p(&i915->uncore, PCODE_POWER_SETUP,
+				POWER_SETUP_SUBCOMMAND_READ_I1, 0, uval);
+}
+
+static int hwm_pcode_write_i1(struct drm_i915_private *i915, u32 uval)
+{
+	return  snb_pcode_write_p(&i915->uncore, PCODE_POWER_SETUP,
+				  POWER_SETUP_SUBCOMMAND_WRITE_I1, 0, uval);
+}
+
 static umode_t
 hwm_in_is_visible(const struct hwm_drvdata *ddat, u32 attr)
 {
@@ -198,13 +215,18 @@ hwm_in_read(struct hwm_drvdata *ddat, u32 attr, long *val)
 static umode_t
 hwm_power_is_visible(const struct hwm_drvdata *ddat, u32 attr, int chan)
 {
+	struct drm_i915_private *i915 = ddat->uncore->i915;
 	struct i915_hwmon *hwmon = ddat->hwmon;
+	u32 uval;
 
 	switch (attr) {
 	case hwmon_power_max:
 		return i915_mmio_reg_valid(hwmon->rg.pkg_rapl_limit) ? 0664 : 0;
 	case hwmon_power_rated_max:
 		return i915_mmio_reg_valid(hwmon->rg.pkg_power_sku) ? 0444 : 0;
+	case hwmon_power_crit:
+		return (hwm_pcode_read_i1(i915, &uval) ||
+			!(uval & POWER_SETUP_I1_WATTS)) ? 0 : 0644;
 	default:
 		return 0;
 	}
@@ -214,6 +236,8 @@ static int
 hwm_power_read(struct hwm_drvdata *ddat, u32 attr, int chan, long *val)
 {
 	struct i915_hwmon *hwmon = ddat->hwmon;
+	int ret;
+	u32 uval;
 
 	switch (attr) {
 	case hwmon_power_max:
@@ -230,6 +254,15 @@ hwm_power_read(struct hwm_drvdata *ddat, u32 attr, int chan, long *val)
 						hwmon->scl_shift_power,
 						SF_POWER);
 		return 0;
+	case hwmon_power_crit:
+		ret = hwm_pcode_read_i1(ddat->uncore->i915, &uval);
+		if (ret)
+			return ret;
+		if (!(uval & POWER_SETUP_I1_WATTS))
+			return -ENODEV;
+		*val = mul_u64_u32_shr(REG_FIELD_GET(POWER_SETUP_I1_DATA_MASK, uval),
+				       SF_POWER, POWER_SETUP_I1_SHIFT);
+		return 0;
 	default:
 		return -EOPNOTSUPP;
 	}
@@ -239,6 +272,7 @@ static int
 hwm_power_write(struct hwm_drvdata *ddat, u32 attr, int chan, long val)
 {
 	struct i915_hwmon *hwmon = ddat->hwmon;
+	u32 uval;
 
 	switch (attr) {
 	case hwmon_power_max:
@@ -248,6 +282,9 @@ hwm_power_write(struct hwm_drvdata *ddat, u32 attr, int chan, long val)
 					  hwmon->scl_shift_power,
 					  SF_POWER, val);
 		return 0;
+	case hwmon_power_crit:
+		uval = DIV_ROUND_CLOSEST_ULL(val << POWER_SETUP_I1_SHIFT, SF_POWER);
+		return hwm_pcode_write_i1(ddat->uncore->i915, uval);
 	default:
 		return -EOPNOTSUPP;
 	}
@@ -279,6 +316,56 @@ hwm_energy_read(struct hwm_drvdata *ddat, u32 attr, long *val)
 	}
 }
 
+static umode_t
+hwm_curr_is_visible(const struct hwm_drvdata *ddat, u32 attr)
+{
+	struct drm_i915_private *i915 = ddat->uncore->i915;
+	u32 uval;
+
+	switch (attr) {
+	case hwmon_curr_crit:
+		return (hwm_pcode_read_i1(i915, &uval) ||
+			(uval & POWER_SETUP_I1_WATTS)) ? 0 : 0644;
+	default:
+		return 0;
+	}
+}
+
+static int
+hwm_curr_read(struct hwm_drvdata *ddat, u32 attr, long *val)
+{
+	int ret;
+	u32 uval;
+
+	switch (attr) {
+	case hwmon_curr_crit:
+		ret = hwm_pcode_read_i1(ddat->uncore->i915, &uval);
+		if (ret)
+			return ret;
+		if (uval & POWER_SETUP_I1_WATTS)
+			return -ENODEV;
+		*val = mul_u64_u32_shr(REG_FIELD_GET(POWER_SETUP_I1_DATA_MASK, uval),
+				       SF_CURR, POWER_SETUP_I1_SHIFT);
+		return 0;
+	default:
+		return -EOPNOTSUPP;
+	}
+}
+
+static int
+hwm_curr_write(struct hwm_drvdata *ddat, u32 attr, long val)
+{
+	u32 uval;
+
+	switch (attr) {
+	case hwmon_curr_crit:
+		uval = DIV_ROUND_CLOSEST_ULL(val << POWER_SETUP_I1_SHIFT, SF_CURR);
+		return hwm_pcode_write_i1(ddat->uncore->i915, uval);
+	default:
+		return -EOPNOTSUPP;
+	}
+}
+
 static umode_t
 hwm_is_visible(const void *drvdata, enum hwmon_sensor_types type,
 	       u32 attr, int channel)
@@ -292,6 +379,8 @@ hwm_is_visible(const void *drvdata, enum hwmon_sensor_types type,
 		return hwm_power_is_visible(ddat, attr, channel);
 	case hwmon_energy:
 		return hwm_energy_is_visible(ddat, attr);
+	case hwmon_curr:
+		return hwm_curr_is_visible(ddat, attr);
 	default:
 		return 0;
 	}
@@ -310,6 +399,8 @@ hwm_read(struct device *dev, enum hwmon_sensor_types type, u32 attr,
 		return hwm_power_read(ddat, attr, channel, val);
 	case hwmon_energy:
 		return hwm_energy_read(ddat, attr, val);
+	case hwmon_curr:
+		return hwm_curr_read(ddat, attr, val);
 	default:
 		return -EOPNOTSUPP;
 	}
@@ -324,6 +415,8 @@ hwm_write(struct device *dev, enum hwmon_sensor_types type, u32 attr,
 	switch (type) {
 	case hwmon_power:
 		return hwm_power_write(ddat, attr, channel, val);
+	case hwmon_curr:
+		return hwm_curr_write(ddat, attr, val);
 	default:
 		return -EOPNOTSUPP;
 	}
diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
index 5003a5ffbc6a..ff3b352c51cd 100644
--- a/drivers/gpu/drm/i915/i915_reg.h
+++ b/drivers/gpu/drm/i915/i915_reg.h
@@ -6655,6 +6655,12 @@
 #define   DG1_PCODE_STATUS			0x7E
 #define     DG1_UNCORE_GET_INIT_STATUS		0x0
 #define     DG1_UNCORE_INIT_STATUS_COMPLETE	0x1
+#define   PCODE_POWER_SETUP			0x7C
+#define     POWER_SETUP_SUBCOMMAND_READ_I1	0x4
+#define     POWER_SETUP_SUBCOMMAND_WRITE_I1	0x5
+#define	    POWER_SETUP_I1_WATTS		REG_BIT(31)
+#define	    POWER_SETUP_I1_SHIFT		6	/* 10.6 fixed point format */
+#define	    POWER_SETUP_I1_DATA_MASK		REG_GENMASK(15, 0)
 #define GEN12_PCODE_READ_SAGV_BLOCK_TIME_US	0x23
 #define   XEHP_PCODE_FREQUENCY_CONFIG		0x6e	/* xehpsdv, pvc */
 /* XEHP_PCODE_FREQUENCY_CONFIG sub-commands (param1) */
-- 
2.25.1

