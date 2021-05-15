Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CE16381482
	for <lists+dri-devel@lfdr.de>; Sat, 15 May 2021 02:23:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E00D6F4C2;
	Sat, 15 May 2021 00:23:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35BDA6F4C2;
 Sat, 15 May 2021 00:23:20 +0000 (UTC)
IronPort-SDR: iZnjq8bQhO/TNVkQVLEJ2f3jId1Hd84+0T7hhUCt8lQttSvhcygyZBvRcwSuzQLGJsgLra9Bpl
 oxdLmX4d93Gg==
X-IronPort-AV: E=McAfee;i="6200,9189,9984"; a="199942446"
X-IronPort-AV: E=Sophos;i="5.82,300,1613462400"; d="scan'208";a="199942446"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2021 17:23:19 -0700
IronPort-SDR: PD6X7ziFQQQG3vIwH64YuXGIf5oP7HIh/OrdU1AOlGGvPa7GDKb/yZvlDJDGt7/ypwY7KTm5tr
 yg5scKNRwQVA==
X-IronPort-AV: E=Sophos;i="5.82,300,1613462400"; d="scan'208";a="539189442"
Received: from dbstims-dev.fm.intel.com ([10.1.27.177])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2021 17:23:19 -0700
From: Dale B Stimson <dale.b.stimson@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v3 1/1] drm/i915/dg1: Add HWMON power support
Date: Fri, 14 May 2021 17:22:47 -0700
Message-Id: <20210515002247.94609-2-dale.b.stimson@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210515002247.94609-1-dale.b.stimson@intel.com>
References: <20210515002247.94609-1-dale.b.stimson@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf8
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
Cc: Jon Ewins <jon.ewins@intel.com>,
 Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

As part of the System Managemenent Interface (SMI), use the HWMON
subsystem to display power utilization.

The following standard HWMON entries are currently supported
(and appropriately scaled):
  /sys/class/drm/card0/device/hwmon/hwmon<i>
	- energy1_input
	- power1_cap
	- power1_max

Some non-standard HWMON power information is also provided, such as
enable bits and intervals.

Signed-off-by: Dale B Stimson <dale.b.stimson@intel.com>
---
 .../ABI/testing/sysfs-driver-intel-i915-hwmon | 116 +++
 drivers/gpu/drm/i915/Kconfig                  |   1 +
 drivers/gpu/drm/i915/Makefile                 |   1 +
 drivers/gpu/drm/i915/i915_drv.c               |   6 +
 drivers/gpu/drm/i915/i915_drv.h               |   3 +
 drivers/gpu/drm/i915/i915_hwmon.c             | 799 ++++++++++++++++++
 drivers/gpu/drm/i915/i915_hwmon.h             |  44 +
 drivers/gpu/drm/i915/i915_reg.h               |  53 ++
 8 files changed, 1023 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon
 create mode 100644 drivers/gpu/drm/i915/i915_hwmon.c
 create mode 100644 drivers/gpu/drm/i915/i915_hwmon.h

diff --git a/Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon b/Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon
new file mode 100644
index 0000000000000..2ee7c413ca190
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon
@@ -0,0 +1,116 @@
+What:           /sys/devices/.../hwmon/hwmon<i>/energy1_input
+Date:           June 2021
+KernelVersion:  5.14
+Contact:        dri-devel@lists.freedesktop.org
+Description:
+                RO. Energy input of device in microjoules.
+
+		The returned textual representation is an unsigned integer
+		number that can be stored in 64-bits.  Warning: The hardware
+		register is 32-bits wide and can overflow by wrapping around.
+		A single wrap-around between calls to read this value can
+		be detected and will be accounted for in the returned value.
+		At a power consumption of 1 watt, the 32-bit hardware register
+		would wrap-around approximately every 3 days.
+
+		Only supported for particular Intel i915 graphics platforms.
+
+What:           /sys/devices/.../hwmon/hwmon<i>/power1_max_enable
+Date:           June 2021
+KernelVersion:  5.14
+Contact:        dri-devel@lists.freedesktop.org
+Description:
+                RW.  Sustained power limit is enabled - true or false.
+
+                The power controller will throttle the operating frequency
+                if the power averaged over a window (typically seconds)
+                exceeds this limit.
+
+                See power1_max_enable power1_max power1_max_interval
+
+		Only supported for particular Intel i915 graphics platforms.
+
+What:           /sys/devices/.../hwmon/hwmon<i>/power1_max
+Date:           June 2021
+KernelVersion:  5.14
+Contact:        dri-devel@lists.freedesktop.org
+Description:
+                RW.  Sustained power limit in milliwatts
+
+                The power controller will throttle the operating frequency
+                if the power averaged over a window (typically seconds)
+                exceeds this limit.
+
+                See power1_max_enable power1_max power1_max_interval
+
+		Only supported for particular Intel i915 graphics platforms.
+
+What:           /sys/devices/.../hwmon/hwmon<i>/power1_max_interval
+Date:           June 2021
+KernelVersion:  5.14
+Contact:        dri-devel@lists.freedesktop.org
+Description:
+                RW. Sustained power limit interval in milliseconds over
+                which sustained power is averaged.
+
+                See power1_max_enable power1_max power1_max_interval
+
+		Only supported for particular Intel i915 graphics platforms.
+
+What:           /sys/devices/.../hwmon/hwmon<i>/power1_cap_enable
+Date:           June 2021
+KernelVersion:  5.14
+Contact:        dri-devel@lists.freedesktop.org
+Description:
+		RW.  Power burst limit is enabled - true or false
+
+                See power1_cap_enable power1_cap
+
+		Only supported for particular Intel i915 graphics platforms.
+
+What:           /sys/devices/.../hwmon/hwmon<i>/power1_cap
+Date:           June 2021
+KernelVersion:  5.14
+Contact:        dri-devel@lists.freedesktop.org
+Description:
+		RW.  Power burst limit in milliwatts.
+
+                See power1_cap_enable power1_cap
+
+		Only supported for particular Intel i915 graphics platforms.
+
+What:           /sys/devices/.../hwmon/hwmon<i>/power_default_limit
+Date:           June 2021
+KernelVersion:  5.14
+Contact:        dri-devel@lists.freedesktop.org
+Description:
+                RO.  Default power limit.
+
+		Only supported for particular Intel i915 graphics platforms.
+
+What:           /sys/devices/.../hwmon/hwmon<i>/power_min_limit
+Date:           June 2021
+KernelVersion:  5.14
+Contact:        dri-devel@lists.freedesktop.org
+Description:
+                RO.  Default minimum power limit.
+
+		Only supported for particular Intel i915 graphics platforms.
+
+		If not supported, then attribute will be absent, or attempted
+		access will give error return or return value as 0.
+
+What:           /sys/devices/.../hwmon/hwmon<i>/power_max_limit
+Date:           June 2021
+KernelVersion:  5.14
+Contact:        dri-devel@lists.freedesktop.org
+Description:
+                RO.  Default maximum power limit.
+
+		Only supported for particular Intel i915 graphics platforms.
+
+		If not supported, then one of: absent, error return or value
+		returned as 0 or UINT_MAX.
+
+		If not supported, then attribute will be absent, or attempted
+		access will give error return or return value as 0 or UINT_MAX.
diff --git a/drivers/gpu/drm/i915/Kconfig b/drivers/gpu/drm/i915/Kconfig
index 69f57ca9c68d7..60bd27f69227d 100644
--- a/drivers/gpu/drm/i915/Kconfig
+++ b/drivers/gpu/drm/i915/Kconfig
@@ -14,6 +14,7 @@ config DRM_I915
 	select DRM_MIPI_DSI
 	select RELAY
 	select IRQ_WORK
+	select HWMON
 	# i915 depends on ACPI_VIDEO when ACPI is enabled
 	# but for select to work, need to select ACPI_VIDEO's dependencies, ick
 	select BACKLIGHT_CLASS_DEVICE if ACPI
diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
index d0d936d9137bc..e213e2b129e20 100644
--- a/drivers/gpu/drm/i915/Makefile
+++ b/drivers/gpu/drm/i915/Makefile
@@ -37,6 +37,7 @@ i915-y += i915_drv.o \
 	  i915_config.o \
 	  i915_irq.o \
 	  i915_getparam.o \
+	  i915_hwmon.o \
 	  i915_mitigations.o \
 	  i915_params.o \
 	  i915_pci.o \
diff --git a/drivers/gpu/drm/i915/i915_drv.c b/drivers/gpu/drm/i915/i915_drv.c
index 5118dc8386b27..54335b9047fcd 100644
--- a/drivers/gpu/drm/i915/i915_drv.c
+++ b/drivers/gpu/drm/i915/i915_drv.c
@@ -70,6 +70,7 @@
 
 #include "i915_debugfs.h"
 #include "i915_drv.h"
+#include "i915_hwmon.h"
 #include "i915_ioc32.h"
 #include "i915_irq.h"
 #include "i915_memcpy.h"
@@ -676,6 +677,8 @@ static void i915_driver_register(struct drm_i915_private *dev_priv)
 	i915_debugfs_register(dev_priv);
 	i915_setup_sysfs(dev_priv);
 
+	i915_hwmon_register(dev_priv);
+
 	/* Depends on sysfs having been initialized */
 	i915_perf_register(dev_priv);
 
@@ -710,6 +713,9 @@ static void i915_driver_unregister(struct drm_i915_private *dev_priv)
 	intel_gt_driver_unregister(&dev_priv->gt);
 
 	i915_perf_unregister(dev_priv);
+
+	i915_hwmon_unregister(dev_priv);
+
 	i915_pmu_unregister(dev_priv);
 
 	i915_teardown_sysfs(dev_priv);
diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
index 61308ce190593..dedd3c5943aab 100644
--- a/drivers/gpu/drm/i915/i915_drv.h
+++ b/drivers/gpu/drm/i915/i915_drv.h
@@ -61,6 +61,7 @@
 #include <drm/drm_connector.h>
 #include <drm/i915_mei_hdcp_interface.h>
 
+#include "i915_hwmon.h"
 #include "i915_params.h"
 #include "i915_reg.h"
 #include "i915_utils.h"
@@ -1117,6 +1118,8 @@ struct drm_i915_private {
 
 	struct i915_perf perf;
 
+	struct i915_hwmon hwmon;
+
 	/* Abstract the submission mechanism (legacy ringbuffer or execlists) away */
 	struct intel_gt gt;
 
diff --git a/drivers/gpu/drm/i915/i915_hwmon.c b/drivers/gpu/drm/i915/i915_hwmon.c
new file mode 100644
index 0000000000000..a51985e3b38a5
--- /dev/null
+++ b/drivers/gpu/drm/i915/i915_hwmon.c
@@ -0,0 +1,799 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2020 Intel Corporation
+ */
+
+/*
+ * Power-related hwmon entries.
+ */
+
+#include <linux/hwmon.h>
+#include <linux/hwmon-sysfs.h>
+#include <linux/types.h>
+
+#include "i915_drv.h"
+#include "gt/intel_gt.h"
+#include "i915_hwmon.h"
+
+/*
+ * SF_* - scale factors for particular quantities.
+ * The hwmon standard says that quantities of the given types are specified
+ * in the given units:
+ * - time   - milliseconds
+ * - power  - microwatts
+ * - energy - microjoules
+ */
+
+#define SF_TIME		   1000
+#define SF_POWER	1000000
+#define SF_ENERGY	1000000
+
+#define FIELD_SHIFT(__mask)				    \
+	(BUILD_BUG_ON_ZERO(!__builtin_constant_p(__mask)) + \
+		BUILD_BUG_ON_ZERO((__mask) == 0) +	    \
+		__bf_shf(__mask))
+
+static void
+_locked_with_pm_intel_uncore_rmw(struct intel_uncore *uncore,
+				 i915_reg_t reg, u32 clear, u32 set)
+{
+	struct drm_i915_private *i915 = uncore->i915;
+	struct i915_hwmon *hwmon = &i915->hwmon;
+	intel_wakeref_t wakeref;
+
+	mutex_lock(&hwmon->hwmon_lock);
+
+	with_intel_runtime_pm(uncore->rpm, wakeref)
+		intel_uncore_rmw(uncore, reg, clear, set);
+
+	mutex_unlock(&hwmon->hwmon_lock);
+}
+
+/*
+ * This function's return type of u64 allows for the case where the scaling
+ * of the field taken from the 32-bit register value might cause a result to
+ * exceed 32 bits.
+ */
+static u64
+_field_read_and_scale(struct intel_uncore *uncore, i915_reg_t rgadr,
+		      u32 field_msk, int field_shift,
+		      int nshift, unsigned int scale_factor)
+{
+	intel_wakeref_t wakeref;
+	u32 reg_value;
+	u64 scaled_val;
+
+	with_intel_runtime_pm(uncore->rpm, wakeref)
+		reg_value = intel_uncore_read(uncore, rgadr);
+
+	reg_value = (reg_value & field_msk) >> field_shift;
+	scaled_val = mul_u32_u32(scale_factor, reg_value);
+
+	/* Shift, rounding to nearest */
+	if (nshift > 0)
+		scaled_val = (scaled_val + (1 << (nshift - 1))) >> nshift;
+
+	return scaled_val;
+}
+
+static u64
+_field_read64_and_scale(struct intel_uncore *uncore, i915_reg_t rgadr,
+			u64 field_msk, int field_shift,
+			int nshift, unsigned int scale_factor)
+{
+	intel_wakeref_t wakeref;
+	u64 reg_value;
+	u64 scaled_val;
+
+	with_intel_runtime_pm(uncore->rpm, wakeref)
+		reg_value = intel_uncore_read64(uncore, rgadr);
+
+	reg_value = (reg_value & field_msk) >> field_shift;
+	scaled_val = scale_factor * reg_value;
+
+	/* Shift, rounding to nearest */
+	if (nshift > 0)
+		scaled_val = (scaled_val + (1 << (nshift - 1))) >> nshift;
+
+	return scaled_val;
+}
+
+static void
+_field_scale_and_write(struct intel_uncore *uncore,
+		       i915_reg_t rgadr,
+		       u32 field_msk, int field_shift,
+		       int nshift, unsigned int scale_factor, long lval)
+{
+	u32 nval;
+	u32 bits_to_clear;
+	u32 bits_to_set;
+
+	/* Computation in 64-bits to avoid overflow. Round to nearest. */
+	nval = DIV_ROUND_CLOSEST_ULL((u64)lval << nshift, scale_factor);
+
+	bits_to_clear = field_msk;
+	bits_to_set = (nval << field_shift) | field_msk;
+
+	_locked_with_pm_intel_uncore_rmw(uncore, rgadr,
+					 bits_to_clear, bits_to_set);
+}
+
+/*
+ * i915_energy1_input_show - A custom function to obtain energy1_input.
+ * Use a custom function instead of the usual hwmon helpers in order to
+ * guarantee 64-bits of result to user-space.
+ * Units are microjoules.
+ *
+ * The underlying hardware register is 32-bits and is subject to overflow.
+ * This function compensates for overflow of the 32-bit register by detecting
+ * wrap-around and incrementing an overflow counter.
+ * This only works if the register is sampled often enough to avoid
+ * missing an instance of overflow - achieved either by repeated
+ * queries through the API, or via a possible timer (future - TBD) that
+ * ensures values are read often enough to catch all overflows.
+ *
+ * How long before overflow?  For example, with an example scaling bit
+ * shift of 14 bits (see register *PACKAGE_POWER_SKU_UNIT) and a power draw of
+ * 1000 watts, the 32-bit counter will overflow in approximately 4.36 minutes.
+ *
+ * Examples:
+ *    1 watt:  (2^32 >> 14) /    1 W / (60 * 60 * 24) secs/day -> 3 days
+ * 1000 watts: (2^32 >> 14) / 1000 W / 60             secs/min -> 4.36 minutes
+ */
+static ssize_t
+i915_energy1_input_show(struct device *dev, struct device_attribute *attr,
+			char *buf)
+{
+	struct drm_i915_private *i915 = dev_get_drvdata(dev);
+	struct intel_uncore *uncore = &i915->uncore;
+	struct i915_hwmon *hwmon = &i915->hwmon;
+	int nshift = hwmon->scl_shift_energy;
+	ssize_t ret;
+	intel_wakeref_t wakeref;
+	u32 reg_value;
+	u64 vlo;
+	u64 vhi;
+
+	mutex_lock(&hwmon->hwmon_lock);
+
+	with_intel_runtime_pm(uncore->rpm, wakeref)
+		reg_value = intel_uncore_read(uncore,
+					      hwmon->rg.reg_energy_status);
+
+	/*
+	 * The u32 register concatenated with the u32 overflow counter
+	 * gives an effective energy counter size of 64-bits.  However, the
+	 * computations below are done modulo 2^96 to avoid overflow during
+	 * scaling in the conversion to microjoules.
+	 *
+	 * The low-order 64-bits of the resulting quantity are returned to
+	 * the caller in units of microjoules, encoded into a decimal string.
+	 *
+	 * For a power of 1000 watts, 64 bits in units of microjoules will
+	 * overflow after 584 years.
+	 */
+
+	if (hwmon->energy_counter_prev > reg_value)
+		hwmon->energy_counter_overflow++;
+
+	hwmon->energy_counter_prev = reg_value;
+
+	/*
+	 * 64-bit variables vlo and vhi are used for the scaling process.
+	 * The 96-bit counter value is composed from the two 64-bit variables
+	 * vhi and vlo thusly:  counter == vhi << 32 + vlo .
+	 * The 32-bits of overlap between the two variables is convenient for
+	 * handling overflows out of vlo.
+	 */
+
+	vlo = reg_value;
+	vhi = hwmon->energy_counter_overflow;
+
+	mutex_unlock(&hwmon->hwmon_lock);
+
+	vlo = SF_ENERGY * vlo;
+
+	/* Prepare to round to nearest */
+	if (nshift > 0)
+		vlo += 1 << (nshift - 1);
+
+	/*
+	 * Anything in the upper-32 bits of vlo gets added into vhi here,
+	 * and then cleared from vlo.
+	 */
+	vhi = (SF_ENERGY * vhi) + (vlo >> 32);
+	vlo &= 0xffffffffULL;
+
+	/*
+	 * Apply the right shift.
+	 * - vlo shifted by itself.
+	 * - vlo receiving what's shifted out of vhi.
+	 * - vhi shifted by itself
+	 */
+	vlo = vlo >> nshift;
+	vlo |= (vhi << (32 - nshift)) & 0xffffffffULL;
+	vhi = vhi >> nshift;
+
+	/* Combined to get a 64-bit result in vlo. */
+	vlo |= (vhi << 32);
+
+	ret = sysfs_emit(buf, "%llu\n", vlo);
+
+	return ret;
+}
+
+static ssize_t
+i915_power1_max_enable_show(struct device *dev, struct device_attribute *attr,
+			    char *buf)
+{
+	struct drm_i915_private *i915 = dev_get_drvdata(dev);
+	struct intel_uncore *uncore = &i915->uncore;
+	intel_wakeref_t wakeref;
+	ssize_t ret;
+	u32 reg_value;
+	bool is_enabled;
+
+	with_intel_runtime_pm(uncore->rpm, wakeref)
+		reg_value = intel_uncore_read(uncore,
+					      i915->hwmon.rg.pkg_rapl_limit);
+
+	is_enabled = !!(reg_value & PKG_PWR_LIM_1_EN);
+
+	ret = sysfs_emit(buf, "%u\n", is_enabled);
+
+	return ret;
+}
+
+static ssize_t
+i915_power1_max_enable_store(struct device *dev, struct device_attribute *attr,
+			     const char *buf, size_t count)
+{
+	struct drm_i915_private *i915 = dev_get_drvdata(dev);
+	struct intel_uncore *uncore = &i915->uncore;
+	struct i915_hwmon *hwmon = &i915->hwmon;
+	ssize_t ret;
+	u32 val;
+	u32 bits_to_clear;
+	u32 bits_to_set;
+
+	ret = kstrtou32(buf, 0, &val);
+	if (ret)
+		return ret;
+
+	bits_to_clear = PKG_PWR_LIM_1_EN;
+	if (!val)
+		bits_to_set = 0;
+	else
+		bits_to_set = PKG_PWR_LIM_1_EN;
+
+	_locked_with_pm_intel_uncore_rmw(uncore, hwmon->rg.pkg_rapl_limit,
+					 bits_to_clear, bits_to_set);
+
+	return count;
+}
+
+static ssize_t
+i915_power1_max_interval_show(struct device *dev, struct device_attribute *attr,
+			      char *buf)
+{
+	struct drm_i915_private *i915 = dev_get_drvdata(dev);
+	struct intel_uncore *uncore = &i915->uncore;
+	struct i915_hwmon *hwmon = &i915->hwmon;
+	ssize_t ret;
+	u64 ullval;
+
+	ullval = _field_read_and_scale(uncore, hwmon->rg.pkg_rapl_limit,
+				       PKG_PWR_LIM_1_TIME,
+				       FIELD_SHIFT(PKG_PWR_LIM_1_TIME),
+				       hwmon->scl_shift_time, SF_TIME);
+
+	ret = sysfs_emit(buf, "%llu\n", ullval);
+
+	return ret;
+}
+
+static ssize_t
+i915_power1_max_interval_store(struct device *dev,
+			       struct device_attribute *attr,
+			       const char *buf, size_t count)
+{
+	struct drm_i915_private *i915 = dev_get_drvdata(dev);
+	struct intel_uncore *uncore = &i915->uncore;
+	struct i915_hwmon *hwmon = &i915->hwmon;
+	ssize_t ret;
+	long val;
+
+	ret = kstrtoul(buf, 0, &val);
+	if (ret)
+		return ret;
+
+	_field_scale_and_write(uncore, hwmon->rg.pkg_rapl_limit,
+			       PKG_PWR_LIM_2_TIME,
+			       FIELD_SHIFT(PKG_PWR_LIM_2_TIME),
+			       hwmon->scl_shift_time, SF_TIME, val);
+
+	return count;
+}
+
+static ssize_t
+i915_power1_cap_enable_show(struct device *dev, struct device_attribute *attr,
+			    char *buf)
+{
+	struct drm_i915_private *i915 = dev_get_drvdata(dev);
+	struct intel_uncore *uncore = &i915->uncore;
+	struct i915_hwmon *hwmon = &i915->hwmon;
+	intel_wakeref_t wakeref;
+	ssize_t ret;
+	u32 reg_value;
+	bool is_enabled;
+
+	with_intel_runtime_pm(uncore->rpm, wakeref)
+		reg_value = intel_uncore_read(uncore,
+					      hwmon->rg.pkg_rapl_limit_udw);
+
+	is_enabled = !!(reg_value & PKG_PWR_LIM_2_EN);
+
+	ret = sysfs_emit(buf, "%u\n", is_enabled);
+
+	return ret;
+}
+
+static ssize_t
+i915_power1_cap_enable_store(struct device *dev, struct device_attribute *attr,
+			     const char *buf, size_t count)
+{
+	struct drm_i915_private *i915 = dev_get_drvdata(dev);
+	struct intel_uncore *uncore = &i915->uncore;
+	struct i915_hwmon *hwmon = &i915->hwmon;
+	ssize_t ret;
+	u32 val;
+	u32 bits_to_clear;
+	u32 bits_to_set;
+
+	ret = kstrtou32(buf, 0, &val);
+	if (ret)
+		return ret;
+
+	bits_to_clear = PKG_PWR_LIM_2_EN;
+	if (!val)
+		bits_to_set = 0;
+	else
+		bits_to_set = PKG_PWR_LIM_2_EN;
+
+	_locked_with_pm_intel_uncore_rmw(uncore, hwmon->rg.pkg_rapl_limit_udw,
+					 bits_to_clear, bits_to_set);
+
+	return count;
+}
+
+static ssize_t
+i915_power_default_limit_show(struct device *dev, struct device_attribute *attr,
+			      char *buf)
+{
+	struct drm_i915_private *i915 = dev_get_drvdata(dev);
+	struct i915_hwmon *hwmon = &i915->hwmon;
+	ssize_t ret;
+
+	ret = sysfs_emit(buf, "%u\n", hwmon->power_max_initial_value);
+
+	return ret;
+}
+
+static ssize_t
+i915_power_min_limit_show(struct device *dev, struct device_attribute *attr,
+			  char *buf)
+{
+	struct drm_i915_private *i915 = dev_get_drvdata(dev);
+	struct intel_uncore *uncore = &i915->uncore;
+	struct i915_hwmon *hwmon = &i915->hwmon;
+	ssize_t ret;
+	u32 uval;
+
+	/*
+	 * This is a 64-bit register but the individual fields are under 32 bits
+	 * in size even after scaling.
+	 * The UAPI specifies a size of 32 bits.
+	 * The UAPI specifies that 0 should be returned if unsupported.
+	 * So, using u32 and %u is sufficient.
+	 */
+	if (i915_mmio_reg_valid(hwmon->rg.pkg_power_sku))
+		uval = (u32)_field_read64_and_scale(uncore,
+						    hwmon->rg.pkg_power_sku,
+						    PKG_MIN_PWR,
+						    FIELD_SHIFT(PKG_MIN_PWR),
+						    hwmon->scl_shift_power,
+						    SF_POWER);
+	else
+		uval = 0;
+
+	ret = sysfs_emit(buf, "%u\n", uval);
+
+	return ret;
+}
+
+static ssize_t
+i915_power_max_limit_show(struct device *dev, struct device_attribute *attr,
+			  char *buf)
+{
+	struct drm_i915_private *i915 = dev_get_drvdata(dev);
+	struct intel_uncore *uncore = &i915->uncore;
+	struct i915_hwmon *hwmon = &i915->hwmon;
+	ssize_t ret;
+	u32 uval;
+
+	/*
+	 * This is a 64-bit register but the individual fields are under 32 bits
+	 * in size even after scaling.
+	 * The UAPI specifies a size of 32 bits.
+	 * The UAPI specifies that UINT_MAX should be returned if unsupported.
+	 * So, using u32 and %u is sufficient.
+	 */
+	if (i915_mmio_reg_valid(hwmon->rg.pkg_power_sku))
+		uval = (u32)_field_read64_and_scale(uncore,
+						    hwmon->rg.pkg_power_sku,
+						    PKG_MAX_PWR,
+						    FIELD_SHIFT(PKG_MAX_PWR),
+						    hwmon->scl_shift_power,
+						    SF_POWER);
+	else
+		uval = UINT_MAX;
+
+	ret = sysfs_emit(buf, "%u\n", uval);
+
+	return ret;
+}
+
+static SENSOR_DEVICE_ATTR(power1_max_enable, 0664,
+			  i915_power1_max_enable_show,
+			  i915_power1_max_enable_store, 0);
+static SENSOR_DEVICE_ATTR(power1_max_interval, 0664,
+			  i915_power1_max_interval_show,
+			  i915_power1_max_interval_store, 0);
+static SENSOR_DEVICE_ATTR(power1_cap_enable, 0664,
+			  i915_power1_cap_enable_show,
+			  i915_power1_cap_enable_store, 0);
+static SENSOR_DEVICE_ATTR(power_default_limit, 0444,
+			  i915_power_default_limit_show, NULL, 0);
+static SENSOR_DEVICE_ATTR(power_min_limit, 0444,
+			  i915_power_min_limit_show, NULL, 0);
+static SENSOR_DEVICE_ATTR(power_max_limit, 0444,
+			  i915_power_max_limit_show, NULL, 0);
+static SENSOR_DEVICE_ATTR(energy1_input, 0444,
+			  i915_energy1_input_show, NULL, 0);
+
+static struct attribute *hwmon_attributes[] = {
+	&sensor_dev_attr_power1_max_enable.dev_attr.attr,
+	&sensor_dev_attr_power1_max_interval.dev_attr.attr,
+	&sensor_dev_attr_power1_cap_enable.dev_attr.attr,
+	&sensor_dev_attr_power_default_limit.dev_attr.attr,
+	&sensor_dev_attr_power_min_limit.dev_attr.attr,
+	&sensor_dev_attr_power_max_limit.dev_attr.attr,
+	&sensor_dev_attr_energy1_input.dev_attr.attr,
+	NULL
+};
+
+static umode_t hwmon_attributes_visible(struct kobject *kobj,
+					struct attribute *attr, int index)
+{
+	struct device *dev = kobj_to_dev(kobj);
+	struct drm_i915_private *i915 = dev_get_drvdata(dev);
+	struct i915_hwmon *hwmon = &i915->hwmon;
+	i915_reg_t rgadr;
+
+	if (attr == &sensor_dev_attr_energy1_input.dev_attr.attr)
+		rgadr = hwmon->rg.reg_energy_status;
+	else if (attr == &sensor_dev_attr_power1_max_enable.dev_attr.attr)
+		rgadr = hwmon->rg.pkg_rapl_limit;
+	else if (attr == &sensor_dev_attr_power1_max_interval.dev_attr.attr)
+		rgadr = hwmon->rg.pkg_rapl_limit;
+	else if (attr == &sensor_dev_attr_power1_cap_enable.dev_attr.attr)
+		rgadr = hwmon->rg.pkg_rapl_limit_udw;
+	else if (attr == &sensor_dev_attr_power_default_limit.dev_attr.attr)
+		rgadr = hwmon->rg.pkg_rapl_limit;
+	else if (attr == &sensor_dev_attr_power_min_limit.dev_attr.attr)
+		return attr->mode;
+	else if (attr == &sensor_dev_attr_power_max_limit.dev_attr.attr)
+		return attr->mode;
+	else
+		return 0;
+
+	if (!i915_mmio_reg_valid(rgadr))
+		return 0;
+
+	return attr->mode;
+}
+
+static const struct attribute_group hwmon_attrgroup = {
+	.attrs = hwmon_attributes,
+	.is_visible = hwmon_attributes_visible,
+};
+
+static const struct attribute_group *hwmon_groups[] = {
+	&hwmon_attrgroup,
+	NULL
+};
+
+/*
+ * HWMON SENSOR TYPE = hwmon_power
+ *  - Sustained Power (power1_max)
+ *  - Burst power     (power1_cap)
+ *  - Peak power      (power1_crit)
+ */
+static const u32 i915_config_power[] = {
+	HWMON_P_CAP | HWMON_P_MAX,
+	0
+};
+
+static const struct hwmon_channel_info i915_power = {
+	.type = hwmon_power,
+	.config = i915_config_power,
+};
+
+static const struct hwmon_channel_info *i915_info[] = {
+	&i915_power,
+	NULL
+};
+
+static umode_t
+i915_power_is_visible(const struct drm_i915_private *i915, u32 attr, int chan)
+{
+	i915_reg_t rgadr;
+
+	switch (attr) {
+	case hwmon_power_max:
+		rgadr = i915->hwmon.rg.pkg_rapl_limit;
+		break;
+	case hwmon_power_cap:
+		rgadr = i915->hwmon.rg.pkg_rapl_limit_udw;
+		break;
+	default:
+		return 0;
+	}
+
+	if (!i915_mmio_reg_valid(rgadr))
+		return 0;
+
+	return 0664;
+}
+
+static int
+i915_power_read(struct drm_i915_private *i915, u32 attr, int chan, long *val)
+{
+	struct intel_uncore *uncore = &i915->uncore;
+	struct i915_hwmon *hwmon = &i915->hwmon;
+	int ret = 0;
+
+	switch (attr) {
+	case hwmon_power_max:
+		*val = (long)_field_read_and_scale(uncore,
+						   hwmon->rg.pkg_rapl_limit,
+						   PKG_PWR_LIM_1,
+						   FIELD_SHIFT(PKG_PWR_LIM_1),
+						   hwmon->scl_shift_power,
+						   SF_POWER);
+		break;
+	case hwmon_power_cap:
+		*val = (long)_field_read_and_scale(uncore,
+						   hwmon->rg.pkg_rapl_limit_udw,
+						   PKG_PWR_LIM_2,
+						   FIELD_SHIFT(PKG_PWR_LIM_2),
+						   hwmon->scl_shift_power,
+						   SF_POWER);
+		break;
+	default:
+		ret = -EOPNOTSUPP;
+	}
+
+	return ret;
+}
+
+static int
+i915_power_write(struct drm_i915_private *i915, u32 attr, int chan, long val)
+{
+	struct intel_uncore *uncore = &i915->uncore;
+	struct i915_hwmon *hwmon = &i915->hwmon;
+	int ret = 0;
+
+	switch (attr) {
+	case hwmon_power_max:
+		_field_scale_and_write(uncore,
+				       hwmon->rg.pkg_rapl_limit,
+				       PKG_PWR_LIM_1,
+				       FIELD_SHIFT(PKG_PWR_LIM_1),
+				       hwmon->scl_shift_power,
+				       SF_POWER, val);
+		break;
+	case hwmon_power_cap:
+		_field_scale_and_write(uncore,
+				       hwmon->rg.pkg_rapl_limit_udw,
+				       PKG_PWR_LIM_2,
+				       FIELD_SHIFT(PKG_PWR_LIM_2),
+				       hwmon->scl_shift_power,
+				       SF_POWER, val);
+		break;
+	default:
+		ret = -EOPNOTSUPP;
+	}
+
+	return ret;
+}
+
+static umode_t
+i915_is_visible(const void *data, enum hwmon_sensor_types type,
+		u32 attr, int channel)
+{
+	struct drm_i915_private *i915 = (struct drm_i915_private *)data;
+
+	switch (type) {
+	case hwmon_power:
+		return i915_power_is_visible(i915, attr, channel);
+	default:
+		return 0;
+	}
+}
+
+static int
+i915_read(struct device *dev, enum hwmon_sensor_types type, u32 attr,
+	  int channel, long *val)
+{
+	struct drm_i915_private *i915 = kdev_to_i915(dev);
+
+	switch (type) {
+	case hwmon_power:
+		return i915_power_read(i915, attr, channel, val);
+	default:
+		return -EOPNOTSUPP;
+	}
+}
+
+static int
+i915_write(struct device *dev, enum hwmon_sensor_types type, u32 attr,
+	   int channel, long val)
+{
+	struct drm_i915_private *i915 = kdev_to_i915(dev);
+
+	switch (type) {
+	case hwmon_power:
+		return i915_power_write(i915, attr, channel, val);
+	default:
+		return -EOPNOTSUPP;
+	}
+}
+
+static const struct hwmon_ops i915_hwmon_ops = {
+	.is_visible = i915_is_visible,
+	.read = i915_read,
+	.write = i915_write,
+};
+
+static const struct hwmon_chip_info i915_chip_info = {
+	.ops = &i915_hwmon_ops,
+	.info = i915_info,
+};
+
+static void
+i915_hwmon_get_preregistration_info(struct drm_i915_private *i915)
+{
+	struct i915_hwmon *hwmon = &i915->hwmon;
+	struct intel_uncore *uncore = &i915->uncore;
+	intel_wakeref_t wakeref;
+	u32 val_sku_unit;
+	__le32 le_sku_unit;
+
+	if (IS_DG1(i915)) {
+		hwmon->rg.pkg_power_sku_unit = PCU_PACKAGE_POWER_SKU_UNIT;
+		hwmon->rg.pkg_power_sku = PCU_PACKAGE_POWER_SKU;
+		hwmon->rg.pkg_energy_status = PCU_PACKAGE_ENERGY_STATUS;
+		hwmon->rg.pkg_rapl_limit = PCU_PACKAGE_RAPL_LIMIT;
+		hwmon->rg.pkg_rapl_limit_udw = PCU_PACKAGE_RAPL_LIMIT_UDW;
+		hwmon->rg.plt_energy_status = PCU_PLATFORM_ENERGY_STATUS;
+	} else {
+		hwmon->rg.pkg_power_sku_unit = INVALID_MMIO_REG;
+		hwmon->rg.pkg_power_sku = INVALID_MMIO_REG;
+		hwmon->rg.pkg_energy_status = INVALID_MMIO_REG;
+		hwmon->rg.pkg_rapl_limit = INVALID_MMIO_REG;
+		hwmon->rg.pkg_rapl_limit_udw = INVALID_MMIO_REG;
+		hwmon->rg.plt_energy_status = INVALID_MMIO_REG;
+	}
+
+	/*
+	 * If a platform does not support *_PLATFORM_ENERGY_STATUS,
+	 * try *PACKAGE_ENERGY_STATUS.
+	 */
+	if (i915_mmio_reg_valid(hwmon->rg.plt_energy_status))
+		hwmon->rg.reg_energy_status = hwmon->rg.plt_energy_status;
+	else
+		hwmon->rg.reg_energy_status = hwmon->rg.pkg_energy_status;
+
+	wakeref = intel_runtime_pm_get(uncore->rpm);
+
+	/*
+	 * The contents of register hwmon->rg.pkg_power_sku_unit do not change,
+	 * so read it once and store the shift values.
+	 */
+	if (i915_mmio_reg_valid(hwmon->rg.pkg_power_sku_unit))
+		val_sku_unit = intel_uncore_read(uncore,
+						 hwmon->rg.pkg_power_sku_unit);
+	else
+		val_sku_unit = 0;
+
+	hwmon->energy_counter_overflow = 0;
+
+	if (i915_mmio_reg_valid(hwmon->rg.reg_energy_status))
+		hwmon->energy_counter_prev =
+			intel_uncore_read(uncore, hwmon->rg.reg_energy_status);
+	else
+		hwmon->energy_counter_prev = 0;
+
+	intel_runtime_pm_put(uncore->rpm, wakeref);
+
+	le_sku_unit = cpu_to_le32(val_sku_unit);
+	hwmon->scl_shift_power = le32_get_bits(le_sku_unit, PKG_PWR_UNIT);
+	hwmon->scl_shift_energy = le32_get_bits(le_sku_unit, PKG_ENERGY_UNIT);
+	hwmon->scl_shift_time = le32_get_bits(le_sku_unit, PKG_TIME_UNIT);
+
+	/*
+	 * There is no direct way to obtain the power default_limit.
+	 * The best known workaround is to use the initial value of power1_max.
+	 *
+	 * The value of power1_max is reset to the default on reboot, but is
+	 * not reset by a module unload/load sequence.  To allow proper
+	 * functioning after a module reload, the value for power1_max is
+	 * restored to its original value at module unload time in
+	 * i915_hwmon_unregister().
+	 */
+	hwmon->power_max_initial_value =
+		(u32)_field_read_and_scale(uncore,
+					   hwmon->rg.pkg_rapl_limit,
+					   PKG_PWR_LIM_1,
+					   FIELD_SHIFT(PKG_PWR_LIM_1),
+					   hwmon->scl_shift_power, SF_POWER);
+}
+
+void i915_hwmon_register(struct drm_i915_private *i915)
+{
+	struct drm_device *drm_dev = &i915->drm;
+	struct i915_hwmon *hwmon = &i915->hwmon;
+	struct device *hwmon_dev;
+
+	mutex_init(&hwmon->hwmon_lock);
+
+	i915_hwmon_get_preregistration_info(i915);
+
+	hwmon_dev = hwmon_device_register_with_info(drm_dev->dev, "i915",
+						    drm_dev,
+						    &i915_chip_info,
+						    hwmon_groups);
+
+	if (IS_ERR(hwmon_dev)) {
+		mutex_destroy(&hwmon->hwmon_lock);
+		drm_info(&i915->drm, "Failed to register hwmon for i915\n");
+		return;
+	}
+
+	hwmon->dev = hwmon_dev;
+
+	return;
+}
+
+void i915_hwmon_unregister(struct drm_i915_private *i915)
+{
+	struct i915_hwmon *hwmon = &i915->hwmon;
+
+	if (hwmon->power_max_initial_value) {
+		/* Restore power1_max. */
+		_field_scale_and_write(&i915->uncore, hwmon->rg.pkg_rapl_limit,
+				       PKG_PWR_LIM_1,
+				       FIELD_SHIFT(PKG_PWR_LIM_1),
+				       hwmon->scl_shift_power,
+				       SF_POWER,
+				       hwmon->power_max_initial_value);
+	}
+
+	if (hwmon->dev)
+		hwmon_device_unregister(hwmon->dev);
+
+	mutex_destroy(&hwmon->hwmon_lock);
+
+	memset(hwmon, 0, sizeof(*hwmon));
+}
diff --git a/drivers/gpu/drm/i915/i915_hwmon.h b/drivers/gpu/drm/i915/i915_hwmon.h
new file mode 100644
index 0000000000000..0ba41a526e3bd
--- /dev/null
+++ b/drivers/gpu/drm/i915/i915_hwmon.h
@@ -0,0 +1,44 @@
+/* SPDX-License-Identifier: MIT */
+
+/*
+ * Copyright © 2020 Intel Corporation
+ */
+
+#ifndef __INTEL_HWMON_H__
+#define __INTEL_HWMON_H__
+
+#include <linux/types.h>
+#include <linux/mutex.h>
+#include "i915_reg.h"
+
+struct i915_hwmon_reg {
+	i915_reg_t pkg_power_sku_unit;
+	i915_reg_t pkg_power_sku;
+	i915_reg_t pkg_energy_status;
+	i915_reg_t pkg_rapl_limit;
+	i915_reg_t pkg_rapl_limit_udw;
+	i915_reg_t plt_energy_status;
+	i915_reg_t reg_energy_status;
+};
+
+struct i915_hwmon {
+	struct device *dev;
+	struct mutex hwmon_lock;	/* counter overflow logic and rmw */
+
+	struct i915_hwmon_reg rg;
+
+	u32 energy_counter_overflow;
+	u32 energy_counter_prev;
+	u32 power_max_initial_value;
+
+	int scl_shift_power;
+	int scl_shift_energy;
+	int scl_shift_time;
+};
+
+struct drm_i915_private;
+
+void i915_hwmon_register(struct drm_i915_private *i915);
+void i915_hwmon_unregister(struct drm_i915_private *i915);
+
+#endif
diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
index 871d839dfcb86..7d4c50ff360d4 100644
--- a/drivers/gpu/drm/i915/i915_reg.h
+++ b/drivers/gpu/drm/i915/i915_reg.h
@@ -4074,6 +4074,59 @@ static inline bool i915_mmio_reg_valid(i915_reg_t reg)
 #define BXT_RP_STATE_CAP        _MMIO(0x138170)
 #define GEN9_RP_STATE_LIMITS	_MMIO(0x138148)
 
+/* DG1 */
+
+/* based on MCHBAR_MIRROR_BASE_SNB == 0x140000 */
+#define PCU_PACKAGE_POWER_SKU_UNIT	_MMIO(MCHBAR_MIRROR_BASE_SNB + 0x5938)
+#define PCU_PACKAGE_ENERGY_STATUS	_MMIO(MCHBAR_MIRROR_BASE_SNB + 0x593c)
+#define PCU_PACKAGE_RAPL_LIMIT		_MMIO(MCHBAR_MIRROR_BASE_SNB + 0x59a0)
+#define PCU_PACKAGE_RAPL_LIMIT_UDW	_MMIO(MCHBAR_MIRROR_BASE_SNB + 0x59a4)
+#define PCU_PACKAGE_POWER_SKU		INVALID_MMIO_REG
+#define PCU_PLATFORM_ENERGY_STATUS	INVALID_MMIO_REG
+
+/* Fields for *_PACKAGE_RAPL_LIMIT: */
+#define   PKG_PWR_LIM_1			REG_GENMASK(14, 0)
+#define   PKG_PWR_LIM_1_EN		REG_BIT(15)
+#define   PKG_PWR_LIM_1_TIME		REG_GENMASK(23, 17)
+
+/*
+ * Fields for *_PACKAGE_RAPL_LIMIT_UDW:
+ * In docs, these fields may be defined relative to the entire 64-bit
+ * register, but here they are defined relative to the 32-bit boundary.
+ */
+#define   PKG_PWR_LIM_2			REG_GENMASK(14, 0)	// 46:32
+#define   PKG_PWR_LIM_2_EN		REG_BIT(15)		// 47:47
+#define   PKG_PWR_LIM_2_TIME		REG_GENMASK(23, 17)	// 55:49
+
+/*
+ * *_PACKAGE_POWER_SKU_UNIT - fields specifying scaling for PCU quantities.
+ * - PKG_PWR_UNIT - Power Units used for power control registers. The
+ *   actual unit value is calculated by 1 W / Power(2,PKG_PWR_UNIT).
+ * - PKG_ENERGY_UNIT - Energy Units used for power control registers. The
+ *   actual unit value is calculated by 1 J / Power(2,PKG_ENERGY_UNIT).
+ * - PKG_TIME_UNIT - Time Units used for power control registers. The
+ *   actual unit value is calculated by 1 s / Power(2,PKG_TIME_UNIT).
+ */
+#define   PKG_PWR_UNIT			REG_GENMASK(3, 0)
+#define   PKG_ENERGY_UNIT		REG_GENMASK(12, 8)
+#define   PKG_TIME_UNIT			REG_GENMASK(19, 16)
+
+/*
+ * *_PACKAGE_POWER_SKU - SKU power and timing parameters.
+ * Used herein as a 64-bit bit register.
+ * These masks are defined using GENMASK_ULL as REG_GENMASK is limited to u32
+ * and as GENMASK is "long" and therefore 32-bits on a 32-bit system.
+ * PKG_PKG_TDP, PKG_MIN_PWR, and PKG_MAX_PWR are scaled in the same way as
+ * PKG_PWR_LIM_*, above.
+ * PKG_MAX_WIN has sub-fields for x and y, and has the value: is 1.x * 2^y.
+ */
+#define   PKG_PKG_TDP			GENMASK_ULL(14, 0)
+#define   PKG_MIN_PWR			GENMASK_ULL(30, 16)
+#define   PKG_MAX_PWR			GENMASK_ULL(46, 32)
+#define   PKG_MAX_WIN			GENMASK_ULL(54, 48)
+#define     PKG_MAX_WIN_Y		GENMASK_ULL(54, 53)
+#define     PKG_MAX_WIN_X		GENMASK_ULL(52, 48)
+
 /*
  * Logical Context regs
  */
-- 
2.31.1

