Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D6CC38147E
	for <lists+dri-devel@lfdr.de>; Sat, 15 May 2021 02:23:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51F506F4BF;
	Sat, 15 May 2021 00:23:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 110A56F4BF;
 Sat, 15 May 2021 00:23:03 +0000 (UTC)
IronPort-SDR: NbNnE3b8JLYYzzv7Y5psEvnOgUvRL5HRMkqyanySe1V7CWyp845LyloL0LwfEujrpO9qQRaX0p
 TJ/h7ZSqADoQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9984"; a="199942412"
X-IronPort-AV: E=Sophos;i="5.82,300,1613462400"; d="scan'208";a="199942412"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2021 17:23:02 -0700
IronPort-SDR: mb2On1/KPwoQRt9qD3GSLX83jE2RxnAzNbA+ZAlPpXPaYtpbBSinUdZbqTK/QrlkxQ7pHyumX5
 LYbvzNJ8OPSA==
X-IronPort-AV: E=Sophos;i="5.82,300,1613462400"; d="scan'208";a="436735090"
Received: from dbstims-dev.fm.intel.com ([10.1.27.177])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2021 17:23:02 -0700
From: Dale B Stimson <dale.b.stimson@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v3 0/1] drm/i915/dg1: Add HWMON power support
Date: Fri, 14 May 2021 17:22:46 -0700
Message-Id: <20210515002247.94609-1-dale.b.stimson@intel.com>
X-Mailer: git-send-email 2.31.1
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
  drm/i915/dg1: Add HWMON power support

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

Range-diff against v2:
1:  6e841c4d62a5a ! 1:  afa81d35e1c55 drm/i915/dg1: Add HWMON power sensor support
    @@ Metadata
     Author: Dale B Stimson <dale.b.stimson@intel.com>
     
      ## Commit message ##
    -    drm/i915/dg1: Add HWMON power sensor support
    +    drm/i915/dg1: Add HWMON power support
     
         As part of the System Managemenent Interface (SMI), use the HWMON
         subsystem to display power utilization.
     
    -    The following standard HWMON power sensors are currently supported
    +    The following standard HWMON entries are currently supported
         (and appropriately scaled):
           /sys/class/drm/card0/device/hwmon/hwmon<i>
                 - energy1_input
    @@ drivers/gpu/drm/i915/i915_drv.c: static void i915_driver_register(struct drm_i91
      	i915_debugfs_register(dev_priv);
      	i915_setup_sysfs(dev_priv);
      
    -+	/* Register with hwmon */
    -+	if (i915_hwmon_init(&dev_priv->drm))
    -+		drm_err(&dev_priv->drm, "Failed to register driver hwmon!\n");
    ++	i915_hwmon_register(dev_priv);
     +
      	/* Depends on sysfs having been initialized */
      	i915_perf_register(dev_priv);
    @@ drivers/gpu/drm/i915/i915_drv.c: static void i915_driver_unregister(struct drm_i
      
      	i915_perf_unregister(dev_priv);
     +
    -+	i915_hwmon_fini(&dev_priv->drm);
    ++	i915_hwmon_unregister(dev_priv);
     +
      	i915_pmu_unregister(dev_priv);
      
      	i915_teardown_sysfs(dev_priv);
    -+
    - 	drm_dev_unplug(&dev_priv->drm);
    - 
    - 	i915_gem_driver_unregister(dev_priv);
     
      ## drivers/gpu/drm/i915/i915_drv.h ##
     @@
    @@ drivers/gpu/drm/i915/i915_drv.h: struct drm_i915_private {
      ## drivers/gpu/drm/i915/i915_hwmon.c (new) ##
     @@
     +// SPDX-License-Identifier: MIT
    -+
     +/*
     + * Copyright © 2020 Intel Corporation
     + */
    @@ drivers/gpu/drm/i915/i915_hwmon.c (new)
     +#define SF_POWER	1000000
     +#define SF_ENERGY	1000000
     +
    ++#define FIELD_SHIFT(__mask)				    \
    ++	(BUILD_BUG_ON_ZERO(!__builtin_constant_p(__mask)) + \
    ++		BUILD_BUG_ON_ZERO((__mask) == 0) +	    \
    ++		__bf_shf(__mask))
    ++
     +static void
     +_locked_with_pm_intel_uncore_rmw(struct intel_uncore *uncore,
     +				 i915_reg_t reg, u32 clear, u32 set)
    @@ drivers/gpu/drm/i915/i915_hwmon.c (new)
     +}
     +
     +/*
    -+ * _field_read_and_scale()
    -+ * Return type of u64 allows for the case where the scaling might cause a
    -+ * result exceeding 32 bits.
    ++ * This function's return type of u64 allows for the case where the scaling
    ++ * of the field taken from the 32-bit register value might cause a result to
    ++ * exceed 32 bits.
     + */
    -+static __always_inline u64
    ++static u64
     +_field_read_and_scale(struct intel_uncore *uncore, i915_reg_t rgadr,
    -+		      u32 field_msk, int nshift, unsigned int scale_factor)
    ++		      u32 field_msk, int field_shift,
    ++		      int nshift, unsigned int scale_factor)
     +{
     +	intel_wakeref_t wakeref;
     +	u32 reg_value;
    @@ drivers/gpu/drm/i915/i915_hwmon.c (new)
     +	with_intel_runtime_pm(uncore->rpm, wakeref)
     +		reg_value = intel_uncore_read(uncore, rgadr);
     +
    -+	reg_value = le32_get_bits(cpu_to_le32(reg_value), field_msk);
    ++	reg_value = (reg_value & field_msk) >> field_shift;
     +	scaled_val = mul_u32_u32(scale_factor, reg_value);
     +
     +	/* Shift, rounding to nearest */
    @@ drivers/gpu/drm/i915/i915_hwmon.c (new)
     +	return scaled_val;
     +}
     +
    -+/*
    -+ * _field_read64_and_scale() - read a 64-bit register and scale.
    -+ */
    -+static __always_inline u64
    ++static u64
     +_field_read64_and_scale(struct intel_uncore *uncore, i915_reg_t rgadr,
    -+			u64 field_msk, int nshift, unsigned int scale_factor)
    ++			u64 field_msk, int field_shift,
    ++			int nshift, unsigned int scale_factor)
     +{
     +	intel_wakeref_t wakeref;
     +	u64 reg_value;
    @@ drivers/gpu/drm/i915/i915_hwmon.c (new)
     +	with_intel_runtime_pm(uncore->rpm, wakeref)
     +		reg_value = intel_uncore_read64(uncore, rgadr);
     +
    -+	reg_value = le64_get_bits(cpu_to_le64(reg_value), field_msk);
    ++	reg_value = (reg_value & field_msk) >> field_shift;
     +	scaled_val = scale_factor * reg_value;
     +
     +	/* Shift, rounding to nearest */
    @@ drivers/gpu/drm/i915/i915_hwmon.c (new)
     +	return scaled_val;
     +}
     +
    -+/*
    -+ * _field_scale_and_write()
    -+ */
    -+static __always_inline void
    ++static void
     +_field_scale_and_write(struct intel_uncore *uncore,
     +		       i915_reg_t rgadr,
    -+		       u32 field_msk, int nshift,
    -+		       unsigned int scale_factor, long lval)
    ++		       u32 field_msk, int field_shift,
    ++		       int nshift, unsigned int scale_factor, long lval)
     +{
     +	u32 nval;
     +	u32 bits_to_clear;
    @@ drivers/gpu/drm/i915/i915_hwmon.c (new)
     +	nval = DIV_ROUND_CLOSEST_ULL((u64)lval << nshift, scale_factor);
     +
     +	bits_to_clear = field_msk;
    -+	bits_to_set = le32_to_cpu(le32_encode_bits(nval, field_msk));
    ++	bits_to_set = (nval << field_shift) | field_msk;
     +
     +	_locked_with_pm_intel_uncore_rmw(uncore, rgadr,
     +					 bits_to_clear, bits_to_set);
    @@ drivers/gpu/drm/i915/i915_hwmon.c (new)
     +
     +	ullval = _field_read_and_scale(uncore, hwmon->rg.pkg_rapl_limit,
     +				       PKG_PWR_LIM_1_TIME,
    ++				       FIELD_SHIFT(PKG_PWR_LIM_1_TIME),
     +				       hwmon->scl_shift_time, SF_TIME);
     +
     +	ret = sysfs_emit(buf, "%llu\n", ullval);
    @@ drivers/gpu/drm/i915/i915_hwmon.c (new)
     +
     +	_field_scale_and_write(uncore, hwmon->rg.pkg_rapl_limit,
     +			       PKG_PWR_LIM_2_TIME,
    ++			       FIELD_SHIFT(PKG_PWR_LIM_2_TIME),
     +			       hwmon->scl_shift_time, SF_TIME, val);
     +
     +	return count;
    @@ drivers/gpu/drm/i915/i915_hwmon.c (new)
     +		uval = (u32)_field_read64_and_scale(uncore,
     +						    hwmon->rg.pkg_power_sku,
     +						    PKG_MIN_PWR,
    ++						    FIELD_SHIFT(PKG_MIN_PWR),
     +						    hwmon->scl_shift_power,
     +						    SF_POWER);
     +	else
    @@ drivers/gpu/drm/i915/i915_hwmon.c (new)
     +		uval = (u32)_field_read64_and_scale(uncore,
     +						    hwmon->rg.pkg_power_sku,
     +						    PKG_MAX_PWR,
    ++						    FIELD_SHIFT(PKG_MAX_PWR),
     +						    hwmon->scl_shift_power,
     +						    SF_POWER);
     +	else
    @@ drivers/gpu/drm/i915/i915_hwmon.c (new)
     +		*val = (long)_field_read_and_scale(uncore,
     +						   hwmon->rg.pkg_rapl_limit,
     +						   PKG_PWR_LIM_1,
    ++						   FIELD_SHIFT(PKG_PWR_LIM_1),
     +						   hwmon->scl_shift_power,
     +						   SF_POWER);
     +		break;
    @@ drivers/gpu/drm/i915/i915_hwmon.c (new)
     +		*val = (long)_field_read_and_scale(uncore,
     +						   hwmon->rg.pkg_rapl_limit_udw,
     +						   PKG_PWR_LIM_2,
    ++						   FIELD_SHIFT(PKG_PWR_LIM_2),
     +						   hwmon->scl_shift_power,
     +						   SF_POWER);
     +		break;
    @@ drivers/gpu/drm/i915/i915_hwmon.c (new)
     +		_field_scale_and_write(uncore,
     +				       hwmon->rg.pkg_rapl_limit,
     +				       PKG_PWR_LIM_1,
    ++				       FIELD_SHIFT(PKG_PWR_LIM_1),
     +				       hwmon->scl_shift_power,
     +				       SF_POWER, val);
     +		break;
    @@ drivers/gpu/drm/i915/i915_hwmon.c (new)
     +		_field_scale_and_write(uncore,
     +				       hwmon->rg.pkg_rapl_limit_udw,
     +				       PKG_PWR_LIM_2,
    ++				       FIELD_SHIFT(PKG_PWR_LIM_2),
     +				       hwmon->scl_shift_power,
     +				       SF_POWER, val);
     +		break;
    @@ drivers/gpu/drm/i915/i915_hwmon.c (new)
     +	 * not reset by a module unload/load sequence.  To allow proper
     +	 * functioning after a module reload, the value for power1_max is
     +	 * restored to its original value at module unload time in
    -+	 * i915_hwmon_fini().
    ++	 * i915_hwmon_unregister().
     +	 */
     +	hwmon->power_max_initial_value =
     +		(u32)_field_read_and_scale(uncore,
     +					   hwmon->rg.pkg_rapl_limit,
     +					   PKG_PWR_LIM_1,
    ++					   FIELD_SHIFT(PKG_PWR_LIM_1),
     +					   hwmon->scl_shift_power, SF_POWER);
     +}
     +
    -+int i915_hwmon_init(struct drm_device *drm_dev)
    ++void i915_hwmon_register(struct drm_i915_private *i915)
     +{
    -+	struct drm_i915_private *i915 = to_i915(drm_dev);
    ++	struct drm_device *drm_dev = &i915->drm;
     +	struct i915_hwmon *hwmon = &i915->hwmon;
     +	struct device *hwmon_dev;
     +
    @@ drivers/gpu/drm/i915/i915_hwmon.c (new)
     +
     +	if (IS_ERR(hwmon_dev)) {
     +		mutex_destroy(&hwmon->hwmon_lock);
    -+		return PTR_ERR(hwmon_dev);
    ++		drm_info(&i915->drm, "Failed to register hwmon for i915\n");
    ++		return;
     +	}
     +
     +	hwmon->dev = hwmon_dev;
     +
    -+	return 0;
    ++	return;
     +}
     +
    -+void i915_hwmon_fini(struct drm_device *drm_dev)
    ++void i915_hwmon_unregister(struct drm_i915_private *i915)
     +{
    -+	struct drm_i915_private *i915 = to_i915(drm_dev);
     +	struct i915_hwmon *hwmon = &i915->hwmon;
     +
     +	if (hwmon->power_max_initial_value) {
     +		/* Restore power1_max. */
     +		_field_scale_and_write(&i915->uncore, hwmon->rg.pkg_rapl_limit,
    -+				       PKG_PWR_LIM_1, hwmon->scl_shift_power,
    ++				       PKG_PWR_LIM_1,
    ++				       FIELD_SHIFT(PKG_PWR_LIM_1),
    ++				       hwmon->scl_shift_power,
     +				       SF_POWER,
     +				       hwmon->power_max_initial_value);
     +	}
    @@ drivers/gpu/drm/i915/i915_hwmon.h (new)
     +#ifndef __INTEL_HWMON_H__
     +#define __INTEL_HWMON_H__
     +
    -+#include <drm/drm_device.h>
    ++#include <linux/types.h>
    ++#include <linux/mutex.h>
     +#include "i915_reg.h"
     +
     +struct i915_hwmon_reg {
    @@ drivers/gpu/drm/i915/i915_hwmon.h (new)
     +	int scl_shift_time;
     +};
     +
    -+int i915_hwmon_init(struct drm_device *drm_dev);
    -+void i915_hwmon_fini(struct drm_device *drm_dev);
    ++struct drm_i915_private;
    ++
    ++void i915_hwmon_register(struct drm_i915_private *i915);
    ++void i915_hwmon_unregister(struct drm_i915_private *i915);
     +
     +#endif
     

base-commit: 862fd1b1e347451a075873c26e8b5a3e1f0fcbbb
-- 
2.31.1

