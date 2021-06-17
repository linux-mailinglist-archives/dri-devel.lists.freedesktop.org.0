Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FD253AACA5
	for <lists+dri-devel@lfdr.de>; Thu, 17 Jun 2021 08:43:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26C7B6E87B;
	Thu, 17 Jun 2021 06:43:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98F8B6E86E;
 Thu, 17 Jun 2021 06:43:14 +0000 (UTC)
IronPort-SDR: k3IXSfw1L/6khaiC5IBKTN6oInz30FQTLWruEQOATWi1dJEG9/7Aqf1O8dTKwZxeuhQtNq0Vwd
 zSv2xTwr6t5Q==
X-IronPort-AV: E=McAfee;i="6200,9189,10017"; a="206268633"
X-IronPort-AV: E=Sophos;i="5.83,278,1616482800"; d="scan'208";a="206268633"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2021 23:43:12 -0700
IronPort-SDR: /jTetbp+HYreOcYE10guZ7kCzh1jeFJtfHYmygLKgC6rECRlTmLbZt0lW0XyYEpmmseuidVIsl
 TSKyoIHsraQw==
X-IronPort-AV: E=Sophos;i="5.83,278,1616482800"; d="scan'208";a="443147926"
Received: from dbstims-dev.fm.intel.com ([10.1.27.177])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2021 23:43:12 -0700
From: Dale B Stimson <dale.b.stimson@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v5 0/1] drm/i915/dg1: Add HWMON power sensor support
Date: Wed, 16 Jun 2021 23:43:08 -0700
Message-Id: <20210617064309.33420-1-dale.b.stimson@intel.com>
X-Mailer: git-send-email 2.32.0
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
Cc: Jon Ewins <jon.ewins@intel.com>,
 Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

drm/i915/dg1: Add HWMON power support

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

---------------------

v5  Simplify  header file inclusion requirements by having
    "struct drm_i915_private" definition contain
        "struct i915_hwmon *hwmon"
    instead of
        "struct i915_hwmon hwmon"

v5  Arg 3 (private data pointer) of hwmon_device_register_with_info()
   is now i915.

v5  File i915_hwmon.h rearranged.  New struct i915_energy_info in
    struct i915_hwmon to hold variables energy_counter_prev and
    energy_counter_overflow.

v4  Commit mesage minor rewording

v4  Move call to i915_hwmon_register() to a more appropriate location,
    so that it is done after intel_gt_driver_register().
    The call to i915_perf_unregister() is moved correspondingly.

v4  The proper register to read energy status is PCU_PACKAGE_ENERGY_STATUS.

v4  Attribute power1_max_enable is read-only.

v3  Added documentation of these hwmon attributes in file
        Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon

v3  Commit mesage minor rewording

v3  Function name changes:
    i915_hwmon_init() -> i915_hwmon_register()
    i915_hwmon_fini() -> i915_hwmon_unregister()

v3  i915_hwmon_register and i915_hwmon_unregister now take arg i915.

v3  i915_hwmon_register() now returns void instead of int.

v3  Macro FIELD_SHIFT() added to compute shift value from constant
    field mask.

v3  Certain functions now longer require "inline" due to addition of new
    parameter field_shift, allowing access to constant expressions for
    the field mask at each call site.  These functions now do field
    access via shift and masking and no longer use le32*() functions
    (as le32*() required a local constant expression for the mask).
      _field_read_and_scale()
      _field_read64_and_scale()
      _field_scale_and_write()

v3  Some comments were modified.

v3  Now using sysfs_emit() instead of scnprintf().

V2  Rename local function parameter field_mask to field_msk in order to avoid
    shadowing the name of function field_mask() from include/linux/bitfield.h.

V2  Change a comment introduction from "/**" to "/*", as it is not intended
    to match a pattern that triggers documentation.
    Reported-by: kernel test robot <lkp@intel.com>

V2  Slight movement of calls:
    - i915_hwmon_init slightly later, after call to i915_setup_sysfs()
    - i915_hwmon_fini slightly earlier, before i915_teardown_sysfs()

V2  Fixed some strong typing issues with le32 functions.
    Detected by sparse in a run by kernel test robot:
    Reported-by: kernel test robot <lkp@intel.com>

Dale B Stimson (1):
  drm/i915/dg1: Add HWMON power sensor support

 .../ABI/testing/sysfs-driver-intel-i915-hwmon | 116 +++
 drivers/gpu/drm/i915/Kconfig                  |   1 +
 drivers/gpu/drm/i915/Makefile                 |   1 +
 drivers/gpu/drm/i915/i915_drv.c               |   6 +
 drivers/gpu/drm/i915/i915_drv.h               |   2 +
 drivers/gpu/drm/i915/i915_hwmon.c             | 770 ++++++++++++++++++
 drivers/gpu/drm/i915/i915_hwmon.h             |  49 ++
 drivers/gpu/drm/i915/i915_reg.h               |  52 ++
 8 files changed, 997 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon
 create mode 100644 drivers/gpu/drm/i915/i915_hwmon.c
 create mode 100644 drivers/gpu/drm/i915/i915_hwmon.h

Range-diff against v4:
1:  a2f69c455f908 ! 1:  99a80043ae127 drm/i915/dg1: Add HWMON power sensor support
    @@ drivers/gpu/drm/i915/i915_drv.c: static void i915_driver_unregister(struct drm_i
      	i915_teardown_sysfs(dev_priv);
     
      ## drivers/gpu/drm/i915/i915_drv.h ##
    -@@
    - #include <drm/i915_mei_hdcp_interface.h>
    - #include <drm/ttm/ttm_device.h>
    - 
    -+#include "i915_hwmon.h"
    - #include "i915_params.h"
    - #include "i915_reg.h"
    - #include "i915_utils.h"
     @@ drivers/gpu/drm/i915/i915_drv.h: struct drm_i915_private {
      
      	struct i915_perf perf;
      
    -+	struct i915_hwmon hwmon;
    ++	struct i915_hwmon *hwmon;
     +
      	/* Abstract the submission mechanism (legacy ringbuffer or execlists) away */
      	struct intel_gt gt;
    @@ drivers/gpu/drm/i915/i915_hwmon.c (new)
     +				 i915_reg_t reg, u32 clear, u32 set)
     +{
     +	struct drm_i915_private *i915 = uncore->i915;
    -+	struct i915_hwmon *hwmon = &i915->hwmon;
    ++	struct i915_hwmon *hwmon = i915->hwmon;
     +	intel_wakeref_t wakeref;
     +
     +	mutex_lock(&hwmon->hwmon_lock);
    @@ drivers/gpu/drm/i915/i915_hwmon.c (new)
     +{
     +	struct drm_i915_private *i915 = dev_get_drvdata(dev);
     +	struct intel_uncore *uncore = &i915->uncore;
    -+	struct i915_hwmon *hwmon = &i915->hwmon;
    ++	struct i915_hwmon *hwmon = i915->hwmon;
     +	int nshift = hwmon->scl_shift_energy;
     +	ssize_t ret;
     +	intel_wakeref_t wakeref;
    @@ drivers/gpu/drm/i915/i915_hwmon.c (new)
     +	 * overflow after 584 years.
     +	 */
     +
    -+	if (hwmon->energy_counter_prev > reg_value)
    -+		hwmon->energy_counter_overflow++;
    ++	if (hwmon->ei.energy_counter_prev > reg_value)
    ++		hwmon->ei.energy_counter_overflow++;
     +
    -+	hwmon->energy_counter_prev = reg_value;
    ++	hwmon->ei.energy_counter_prev = reg_value;
     +
     +	/*
     +	 * 64-bit variables vlo and vhi are used for the scaling process.
    @@ drivers/gpu/drm/i915/i915_hwmon.c (new)
     +	 */
     +
     +	vlo = reg_value;
    -+	vhi = hwmon->energy_counter_overflow;
    ++	vhi = hwmon->ei.energy_counter_overflow;
     +
     +	mutex_unlock(&hwmon->hwmon_lock);
     +
    @@ drivers/gpu/drm/i915/i915_hwmon.c (new)
     +			    char *buf)
     +{
     +	struct drm_i915_private *i915 = dev_get_drvdata(dev);
    ++	struct i915_hwmon *hwmon = i915->hwmon;
     +	struct intel_uncore *uncore = &i915->uncore;
     +	intel_wakeref_t wakeref;
     +	ssize_t ret;
    @@ drivers/gpu/drm/i915/i915_hwmon.c (new)
     +
     +	with_intel_runtime_pm(uncore->rpm, wakeref)
     +		reg_value = intel_uncore_read(uncore,
    -+					      i915->hwmon.rg.pkg_rapl_limit);
    ++					      hwmon->rg.pkg_rapl_limit);
     +
     +	is_enabled = !!(reg_value & PKG_PWR_LIM_1_EN);
     +
    @@ drivers/gpu/drm/i915/i915_hwmon.c (new)
     +{
     +	struct drm_i915_private *i915 = dev_get_drvdata(dev);
     +	struct intel_uncore *uncore = &i915->uncore;
    -+	struct i915_hwmon *hwmon = &i915->hwmon;
    ++	struct i915_hwmon *hwmon = i915->hwmon;
     +	ssize_t ret;
     +	u64 ullval;
     +
    @@ drivers/gpu/drm/i915/i915_hwmon.c (new)
     +{
     +	struct drm_i915_private *i915 = dev_get_drvdata(dev);
     +	struct intel_uncore *uncore = &i915->uncore;
    -+	struct i915_hwmon *hwmon = &i915->hwmon;
    ++	struct i915_hwmon *hwmon = i915->hwmon;
     +	ssize_t ret;
     +	long val;
     +
    @@ drivers/gpu/drm/i915/i915_hwmon.c (new)
     +{
     +	struct drm_i915_private *i915 = dev_get_drvdata(dev);
     +	struct intel_uncore *uncore = &i915->uncore;
    -+	struct i915_hwmon *hwmon = &i915->hwmon;
    ++	struct i915_hwmon *hwmon = i915->hwmon;
     +	intel_wakeref_t wakeref;
     +	ssize_t ret;
     +	u32 reg_value;
    @@ drivers/gpu/drm/i915/i915_hwmon.c (new)
     +{
     +	struct drm_i915_private *i915 = dev_get_drvdata(dev);
     +	struct intel_uncore *uncore = &i915->uncore;
    -+	struct i915_hwmon *hwmon = &i915->hwmon;
    ++	struct i915_hwmon *hwmon = i915->hwmon;
     +	ssize_t ret;
     +	u32 val;
     +	u32 bits_to_clear;
    @@ drivers/gpu/drm/i915/i915_hwmon.c (new)
     +			      char *buf)
     +{
     +	struct drm_i915_private *i915 = dev_get_drvdata(dev);
    -+	struct i915_hwmon *hwmon = &i915->hwmon;
    ++	struct i915_hwmon *hwmon = i915->hwmon;
     +	ssize_t ret;
     +
     +	ret = sysfs_emit(buf, "%u\n", hwmon->power_max_initial_value);
    @@ drivers/gpu/drm/i915/i915_hwmon.c (new)
     +{
     +	struct drm_i915_private *i915 = dev_get_drvdata(dev);
     +	struct intel_uncore *uncore = &i915->uncore;
    -+	struct i915_hwmon *hwmon = &i915->hwmon;
    ++	struct i915_hwmon *hwmon = i915->hwmon;
     +	ssize_t ret;
     +	u32 uval;
     +
    @@ drivers/gpu/drm/i915/i915_hwmon.c (new)
     +{
     +	struct drm_i915_private *i915 = dev_get_drvdata(dev);
     +	struct intel_uncore *uncore = &i915->uncore;
    -+	struct i915_hwmon *hwmon = &i915->hwmon;
    ++	struct i915_hwmon *hwmon = i915->hwmon;
     +	ssize_t ret;
     +	u32 uval;
     +
    @@ drivers/gpu/drm/i915/i915_hwmon.c (new)
     +{
     +	struct device *dev = kobj_to_dev(kobj);
     +	struct drm_i915_private *i915 = dev_get_drvdata(dev);
    -+	struct i915_hwmon *hwmon = &i915->hwmon;
    ++	struct i915_hwmon *hwmon = i915->hwmon;
     +	i915_reg_t rgadr;
     +
     +	if (attr == &sensor_dev_attr_energy1_input.dev_attr.attr)
    @@ drivers/gpu/drm/i915/i915_hwmon.c (new)
     +static umode_t
     +i915_power_is_visible(const struct drm_i915_private *i915, u32 attr, int chan)
     +{
    ++	struct i915_hwmon *hwmon = i915->hwmon;
     +	i915_reg_t rgadr;
     +
     +	switch (attr) {
     +	case hwmon_power_max:
    -+		rgadr = i915->hwmon.rg.pkg_rapl_limit;
    ++		rgadr = hwmon->rg.pkg_rapl_limit;
     +		break;
     +	case hwmon_power_cap:
    -+		rgadr = i915->hwmon.rg.pkg_rapl_limit_udw;
    ++		rgadr = hwmon->rg.pkg_rapl_limit_udw;
     +		break;
     +	default:
     +		return 0;
    @@ drivers/gpu/drm/i915/i915_hwmon.c (new)
     +i915_power_read(struct drm_i915_private *i915, u32 attr, int chan, long *val)
     +{
     +	struct intel_uncore *uncore = &i915->uncore;
    -+	struct i915_hwmon *hwmon = &i915->hwmon;
    ++	struct i915_hwmon *hwmon = i915->hwmon;
     +	int ret = 0;
     +
     +	switch (attr) {
    @@ drivers/gpu/drm/i915/i915_hwmon.c (new)
     +i915_power_write(struct drm_i915_private *i915, u32 attr, int chan, long val)
     +{
     +	struct intel_uncore *uncore = &i915->uncore;
    -+	struct i915_hwmon *hwmon = &i915->hwmon;
    ++	struct i915_hwmon *hwmon = i915->hwmon;
     +	int ret = 0;
     +
     +	switch (attr) {
    @@ drivers/gpu/drm/i915/i915_hwmon.c (new)
     +static void
     +i915_hwmon_get_preregistration_info(struct drm_i915_private *i915)
     +{
    -+	struct i915_hwmon *hwmon = &i915->hwmon;
    ++	struct i915_hwmon *hwmon = i915->hwmon;
     +	struct intel_uncore *uncore = &i915->uncore;
     +	intel_wakeref_t wakeref;
     +	u32 val_sku_unit;
    @@ drivers/gpu/drm/i915/i915_hwmon.c (new)
     +	else
     +		val_sku_unit = 0;
     +
    -+	hwmon->energy_counter_overflow = 0;
    ++	hwmon->ei.energy_counter_overflow = 0;
     +
     +	if (i915_mmio_reg_valid(hwmon->rg.pkg_energy_status))
    -+		hwmon->energy_counter_prev =
    ++		hwmon->ei.energy_counter_prev =
     +			intel_uncore_read(uncore, hwmon->rg.pkg_energy_status);
     +	else
    -+		hwmon->energy_counter_prev = 0;
    ++		hwmon->ei.energy_counter_prev = 0;
     +
     +	intel_runtime_pm_put(uncore->rpm, wakeref);
     +
    @@ drivers/gpu/drm/i915/i915_hwmon.c (new)
     +
     +void i915_hwmon_register(struct drm_i915_private *i915)
     +{
    -+	struct drm_device *drm_dev = &i915->drm;
    -+	struct i915_hwmon *hwmon = &i915->hwmon;
    ++	struct device *dev = i915->drm.dev;
    ++	struct i915_hwmon *hwmon;
     +	struct device *hwmon_dev;
     +
    ++	hwmon = kzalloc(sizeof(*hwmon), GFP_KERNEL);
    ++	if (!hwmon)
    ++		return;
    ++
    ++	i915->hwmon = hwmon;
    ++
     +	mutex_init(&hwmon->hwmon_lock);
     +
     +	i915_hwmon_get_preregistration_info(i915);
     +
    -+	hwmon_dev = hwmon_device_register_with_info(drm_dev->dev, "i915",
    -+						    drm_dev,
    ++	hwmon_dev = hwmon_device_register_with_info(dev, "i915",
    ++						    i915,
     +						    &i915_chip_info,
     +						    hwmon_groups);
     +
     +	if (IS_ERR(hwmon_dev)) {
     +		mutex_destroy(&hwmon->hwmon_lock);
    -+		drm_info(&i915->drm, "Failed to register hwmon for i915\n");
    ++		i915->hwmon = NULL;
    ++		kfree(hwmon);
     +		return;
     +	}
     +
    @@ drivers/gpu/drm/i915/i915_hwmon.c (new)
     +
     +void i915_hwmon_unregister(struct drm_i915_private *i915)
     +{
    -+	struct i915_hwmon *hwmon = &i915->hwmon;
    ++	struct i915_hwmon *hwmon;
    ++
    ++	hwmon = fetch_and_zero(&i915->hwmon);
    ++	if (!hwmon)
    ++		return;
     +
     +	if (hwmon->power_max_initial_value) {
     +		/* Restore power1_max. */
    @@ drivers/gpu/drm/i915/i915_hwmon.c (new)
     +
     +	mutex_destroy(&hwmon->hwmon_lock);
     +
    -+	memset(hwmon, 0, sizeof(*hwmon));
    ++	kfree(hwmon);
     +}
     
      ## drivers/gpu/drm/i915/i915_hwmon.h (new) ##
    @@ drivers/gpu/drm/i915/i915_hwmon.h (new)
     +
     +#include <linux/types.h>
     +#include <linux/mutex.h>
    ++#include <linux/device.h>
     +#include "i915_reg.h"
     +
    ++struct drm_i915_private;
    ++
     +struct i915_hwmon_reg {
     +	i915_reg_t pkg_power_sku_unit;
     +	i915_reg_t pkg_power_sku;
    @@ drivers/gpu/drm/i915/i915_hwmon.h (new)
     +	i915_reg_t pkg_rapl_limit_udw;
     +};
     +
    ++struct i915_energy_info {
    ++	u32 energy_counter_overflow;
    ++	u32 energy_counter_prev;
    ++};
    ++
     +struct i915_hwmon {
     +	struct device *dev;
    ++
    ++	struct i915_energy_info ei;
    ++
     +	struct mutex hwmon_lock;	/* counter overflow logic and rmw */
     +
     +	struct i915_hwmon_reg rg;
     +
    -+	u32 energy_counter_overflow;
    -+	u32 energy_counter_prev;
     +	u32 power_max_initial_value;
     +
     +	int scl_shift_power;
    @@ drivers/gpu/drm/i915/i915_hwmon.h (new)
     +	int scl_shift_time;
     +};
     +
    -+struct drm_i915_private;
    -+
     +void i915_hwmon_register(struct drm_i915_private *i915);
     +void i915_hwmon_unregister(struct drm_i915_private *i915);
     +

base-commit: d5450ac48f6bda7ae55f8295881d3d3349b88148
-- 
2.32.0

