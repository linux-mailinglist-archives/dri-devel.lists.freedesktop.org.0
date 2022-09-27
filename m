Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B073F5EB9F2
	for <lists+dri-devel@lfdr.de>; Tue, 27 Sep 2022 07:48:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 988CE10E439;
	Tue, 27 Sep 2022 05:47:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC2FC10E3D8;
 Tue, 27 Sep 2022 05:47:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1664257665; x=1695793665;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=72MW387bWxRHGDNjikZs6vQHO7rTYMd+2DtfGtpHAQk=;
 b=iUR9p3yd9M4i25dhwRG9Ph1rrCwmPmfP33ub467TkMPQTlGQ3YSfIxzt
 54T21UyxhziP23r7EEg1GPKtr44eQ5suCveUg75oQuk1EXmHzYpnbI3gq
 xjz33e9U6s7ij9Lk0ZI89YQWnGTxQVpZKrSiZaKe1M8HCE5itUBpNYJYi
 Qobbzb6N1zbqXBjsztcF+1wHfTld7SocTJxfn+GIj4ZyuF4q+qCU8/p2M
 bSuvGcm64DCtf4cA1nLRSWveL8nblobUqSzJlr4/YUIlfk4eCfm4tk1uw
 k6kp4//CSJZsjTVbGpdg8bnyFJWmYABHlrxfHXZEJbDHxxBjcZPiY4y2c g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10482"; a="363066391"
X-IronPort-AV: E=Sophos;i="5.93,348,1654585200"; d="scan'208";a="363066391"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2022 22:47:45 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10482"; a="725376821"
X-IronPort-AV: E=Sophos;i="5.93,348,1654585200"; d="scan'208";a="725376821"
Received: from bnilawar-desk1.iind.intel.com ([10.145.169.158])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2022 22:47:42 -0700
From: Badal Nilawar <badal.nilawar@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 2/7] drm/i915/hwmon: Add HWMON current voltage support
Date: Tue, 27 Sep 2022 11:20:15 +0530
Message-Id: <20220927055020.3499420-3-badal.nilawar@intel.com>
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

From: Riana Tauro <riana.tauro@intel.com>

Use i915 HWMON subsystem to display current input voltage.

v2:
  - Updated date and kernel version in feature description
  - Fixed review comments (Ashutosh)
v3: Use macro HWMON_CHANNEL_INFO to define hwmon channel (Guenter)
v4:
  - Fixed review comments (Ashutosh)
  - Use hwm_ prefix for static functions (Ashutosh)
v5: Added unit of voltage as millivolts (Ashutosh)
v6: KernelVersion: 6.2, Date: February 2023 in doc (Tvrtko)

Cc: Guenter Roeck <linux@roeck-us.net>
Cc: Anshuman Gupta <anshuman.gupta@intel.com>
Signed-off-by: Riana Tauro <riana.tauro@intel.com>
Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
Acked-by: Guenter Roeck <linux@roeck-us.net>
Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
Reviewed-by: Anshuman Gupta <anshuman.gupta@intel.com>
---
 .../ABI/testing/sysfs-driver-intel-i915-hwmon |  7 +++
 drivers/gpu/drm/i915/gt/intel_gt_regs.h       |  3 ++
 drivers/gpu/drm/i915/i915_hwmon.c             | 53 +++++++++++++++++++
 3 files changed, 63 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon

diff --git a/Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon b/Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon
new file mode 100644
index 000000000000..cd9554c1a4f8
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon
@@ -0,0 +1,7 @@
+What:		/sys/devices/.../hwmon/hwmon<i>/in0_input
+Date:		February 2023
+KernelVersion:	6.2
+Contact:	dri-devel@lists.freedesktop.org
+Description:	RO. Current Voltage in millivolt.
+
+		Only supported for particular Intel i915 graphics platforms.
diff --git a/drivers/gpu/drm/i915/gt/intel_gt_regs.h b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
index 7f79bbf97828..fcf5f9012852 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_regs.h
+++ b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
@@ -1519,6 +1519,9 @@
 #define VLV_RENDER_C0_COUNT			_MMIO(0x138118)
 #define VLV_MEDIA_C0_COUNT			_MMIO(0x13811c)
 
+#define GEN12_RPSTAT1				_MMIO(0x1381b4)
+#define   GEN12_VOLTAGE_MASK			REG_GENMASK(10, 0)
+
 #define GEN11_GT_INTR_DW(x)			_MMIO(0x190018 + ((x) * 4))
 #define   GEN11_CSME				(31)
 #define   GEN11_GUNIT				(28)
diff --git a/drivers/gpu/drm/i915/i915_hwmon.c b/drivers/gpu/drm/i915/i915_hwmon.c
index 231552fda374..9fcff6a884ee 100644
--- a/drivers/gpu/drm/i915/i915_hwmon.c
+++ b/drivers/gpu/drm/i915/i915_hwmon.c
@@ -11,8 +11,16 @@
 #include "i915_hwmon.h"
 #include "i915_reg.h"
 #include "intel_mchbar_regs.h"
+#include "gt/intel_gt_regs.h"
+
+/*
+ * SF_* - scale factors for particular quantities according to hwmon spec.
+ * - voltage  - millivolts
+ */
+#define SF_VOLTAGE	1000
 
 struct hwm_reg {
+	i915_reg_t gt_perf_status;
 };
 
 struct hwm_drvdata {
@@ -29,14 +37,49 @@ struct i915_hwmon {
 };
 
 static const struct hwmon_channel_info *hwm_info[] = {
+	HWMON_CHANNEL_INFO(in, HWMON_I_INPUT),
 	NULL
 };
 
+static umode_t
+hwm_in_is_visible(const struct hwm_drvdata *ddat, u32 attr)
+{
+	switch (attr) {
+	case hwmon_in_input:
+		return i915_mmio_reg_valid(ddat->hwmon->rg.gt_perf_status) ? 0444 : 0;
+	default:
+		return 0;
+	}
+}
+
+static int
+hwm_in_read(struct hwm_drvdata *ddat, u32 attr, long *val)
+{
+	struct i915_hwmon *hwmon = ddat->hwmon;
+	intel_wakeref_t wakeref;
+	u32 reg_value;
+
+	switch (attr) {
+	case hwmon_in_input:
+		with_intel_runtime_pm(ddat->uncore->rpm, wakeref)
+			reg_value = intel_uncore_read(ddat->uncore, hwmon->rg.gt_perf_status);
+		/* HW register value in units of 2.5 millivolt */
+		*val = DIV_ROUND_CLOSEST(REG_FIELD_GET(GEN12_VOLTAGE_MASK, reg_value) * 25, 10);
+		return 0;
+	default:
+		return -EOPNOTSUPP;
+	}
+}
+
 static umode_t
 hwm_is_visible(const void *drvdata, enum hwmon_sensor_types type,
 	       u32 attr, int channel)
 {
+	struct hwm_drvdata *ddat = (struct hwm_drvdata *)drvdata;
+
 	switch (type) {
+	case hwmon_in:
+		return hwm_in_is_visible(ddat, attr);
 	default:
 		return 0;
 	}
@@ -46,7 +89,11 @@ static int
 hwm_read(struct device *dev, enum hwmon_sensor_types type, u32 attr,
 	 int channel, long *val)
 {
+	struct hwm_drvdata *ddat = dev_get_drvdata(dev);
+
 	switch (type) {
+	case hwmon_in:
+		return hwm_in_read(ddat, attr, val);
 	default:
 		return -EOPNOTSUPP;
 	}
@@ -76,6 +123,12 @@ static const struct hwmon_chip_info hwm_chip_info = {
 static void
 hwm_get_preregistration_info(struct drm_i915_private *i915)
 {
+	struct i915_hwmon *hwmon = i915->hwmon;
+
+	if (IS_DG1(i915) || IS_DG2(i915))
+		hwmon->rg.gt_perf_status = GEN12_RPSTAT1;
+	else
+		hwmon->rg.gt_perf_status = INVALID_MMIO_REG;
 }
 
 void i915_hwmon_register(struct drm_i915_private *i915)
-- 
2.25.1

