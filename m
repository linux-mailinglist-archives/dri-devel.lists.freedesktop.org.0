Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3243E3939D2
	for <lists+dri-devel@lfdr.de>; Fri, 28 May 2021 01:57:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAB256F519;
	Thu, 27 May 2021 23:57:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 173E76F519;
 Thu, 27 May 2021 23:57:31 +0000 (UTC)
IronPort-SDR: 86JwQaHb/T9v+XrLmICbyp//zNSoITP4XWfHfZBDoKJYJR+3BvNkxP3Erns3Jhv0wVWe81LzeD
 +8L0tUGJVngw==
X-IronPort-AV: E=McAfee;i="6200,9189,9997"; a="200969196"
X-IronPort-AV: E=Sophos;i="5.83,228,1616482800"; d="scan'208";a="200969196"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2021 16:57:30 -0700
IronPort-SDR: S4Wchfkc+L+diXHCumGEbzGIBXfu8fzIs4wSbMnllnjkSuyr4rvBE1tBcfVHVlOF+zuVKfaJGm
 hbSoUPy0wf9Q==
X-IronPort-AV: E=Sophos;i="5.83,228,1616482800"; d="scan'208";a="477705300"
Received: from dbstims-dev.fm.intel.com ([10.1.27.177])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2021 16:57:30 -0700
From: Dale B Stimson <dale.b.stimson@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v4 0/1] drm/i915/dg1: Add HWMON power sensor support
Date: Thu, 27 May 2021 16:57:22 -0700
Message-Id: <20210527235723.35003-1-dale.b.stimson@intel.com>
X-Mailer: git-send-email 2.31.1
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
 Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
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
 drivers/gpu/drm/i915/i915_drv.h               |   3 +
 drivers/gpu/drm/i915/i915_hwmon.c             | 757 ++++++++++++++++++
 drivers/gpu/drm/i915/i915_hwmon.h             |  42 +
 drivers/gpu/drm/i915/i915_reg.h               |  52 ++
 8 files changed, 978 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon
 create mode 100644 drivers/gpu/drm/i915/i915_hwmon.c
 create mode 100644 drivers/gpu/drm/i915/i915_hwmon.h

Range-diff against v3:
1:  ed34d683a0ef1 ! 1:  bc8bd78b2c006 drm/i915/dg1: Add HWMON power support
    @@ Metadata
     Author: Dale B Stimson <dale.b.stimson@intel.com>
     
      ## Commit message ##
    -    drm/i915/dg1: Add HWMON power support
    +    drm/i915/dg1: Add HWMON power sensor support
     
         As part of the System Managemenent Interface (SMI), use the HWMON
         subsystem to display power utilization.
     
    -    The following standard HWMON entries are currently supported
    +    The following standard HWMON power sensors are currently supported
         (and appropriately scaled):
           /sys/class/drm/card0/device/hwmon/hwmon<i>
                 - energy1_input
    @@ drivers/gpu/drm/i915/i915_drv.c
      #include "i915_irq.h"
      #include "i915_memcpy.h"
     @@ drivers/gpu/drm/i915/i915_drv.c: static void i915_driver_register(struct drm_i915_private *dev_priv)
    - 	i915_debugfs_register(dev_priv);
    - 	i915_setup_sysfs(dev_priv);
    + 
    + 	intel_gt_driver_register(&dev_priv->gt);
      
     +	i915_hwmon_register(dev_priv);
     +
    - 	/* Depends on sysfs having been initialized */
    - 	i915_perf_register(dev_priv);
    + 	intel_display_driver_register(dev_priv);
      
    + 	intel_power_domains_enable(dev_priv);
     @@ drivers/gpu/drm/i915/i915_drv.c: static void i915_driver_unregister(struct drm_i915_private *dev_priv)
    + 
    + 	intel_display_driver_unregister(dev_priv);
    + 
    ++	i915_hwmon_unregister(dev_priv);
    ++
      	intel_gt_driver_unregister(&dev_priv->gt);
      
      	i915_perf_unregister(dev_priv);
    -+
    -+	i915_hwmon_unregister(dev_priv);
     +
      	i915_pmu_unregister(dev_priv);
      
    @@ drivers/gpu/drm/i915/i915_hwmon.c (new)
     +
     +	with_intel_runtime_pm(uncore->rpm, wakeref)
     +		reg_value = intel_uncore_read(uncore,
    -+					      hwmon->rg.reg_energy_status);
    ++					      hwmon->rg.pkg_energy_status);
     +
     +	/*
     +	 * The u32 register concatenated with the u32 overflow counter
    @@ drivers/gpu/drm/i915/i915_hwmon.c (new)
     +}
     +
     +static ssize_t
    -+i915_power1_max_enable_store(struct device *dev, struct device_attribute *attr,
    -+			     const char *buf, size_t count)
    -+{
    -+	struct drm_i915_private *i915 = dev_get_drvdata(dev);
    -+	struct intel_uncore *uncore = &i915->uncore;
    -+	struct i915_hwmon *hwmon = &i915->hwmon;
    -+	ssize_t ret;
    -+	u32 val;
    -+	u32 bits_to_clear;
    -+	u32 bits_to_set;
    -+
    -+	ret = kstrtou32(buf, 0, &val);
    -+	if (ret)
    -+		return ret;
    -+
    -+	bits_to_clear = PKG_PWR_LIM_1_EN;
    -+	if (!val)
    -+		bits_to_set = 0;
    -+	else
    -+		bits_to_set = PKG_PWR_LIM_1_EN;
    -+
    -+	_locked_with_pm_intel_uncore_rmw(uncore, hwmon->rg.pkg_rapl_limit,
    -+					 bits_to_clear, bits_to_set);
    -+
    -+	return count;
    -+}
    -+
    -+static ssize_t
     +i915_power1_max_interval_show(struct device *dev, struct device_attribute *attr,
     +			      char *buf)
     +{
    @@ drivers/gpu/drm/i915/i915_hwmon.c (new)
     +	return ret;
     +}
     +
    -+static SENSOR_DEVICE_ATTR(power1_max_enable, 0664,
    -+			  i915_power1_max_enable_show,
    -+			  i915_power1_max_enable_store, 0);
    ++static SENSOR_DEVICE_ATTR(power1_max_enable, 0444,
    ++			  i915_power1_max_enable_show, NULL, 0);
     +static SENSOR_DEVICE_ATTR(power1_max_interval, 0664,
     +			  i915_power1_max_interval_show,
     +			  i915_power1_max_interval_store, 0);
    @@ drivers/gpu/drm/i915/i915_hwmon.c (new)
     +	i915_reg_t rgadr;
     +
     +	if (attr == &sensor_dev_attr_energy1_input.dev_attr.attr)
    -+		rgadr = hwmon->rg.reg_energy_status;
    ++		rgadr = hwmon->rg.pkg_energy_status;
     +	else if (attr == &sensor_dev_attr_power1_max_enable.dev_attr.attr)
     +		rgadr = hwmon->rg.pkg_rapl_limit;
     +	else if (attr == &sensor_dev_attr_power1_max_interval.dev_attr.attr)
    @@ drivers/gpu/drm/i915/i915_hwmon.c (new)
     +		hwmon->rg.pkg_energy_status = PCU_PACKAGE_ENERGY_STATUS;
     +		hwmon->rg.pkg_rapl_limit = PCU_PACKAGE_RAPL_LIMIT;
     +		hwmon->rg.pkg_rapl_limit_udw = PCU_PACKAGE_RAPL_LIMIT_UDW;
    -+		hwmon->rg.plt_energy_status = PCU_PLATFORM_ENERGY_STATUS;
     +	} else {
     +		hwmon->rg.pkg_power_sku_unit = INVALID_MMIO_REG;
     +		hwmon->rg.pkg_power_sku = INVALID_MMIO_REG;
     +		hwmon->rg.pkg_energy_status = INVALID_MMIO_REG;
     +		hwmon->rg.pkg_rapl_limit = INVALID_MMIO_REG;
     +		hwmon->rg.pkg_rapl_limit_udw = INVALID_MMIO_REG;
    -+		hwmon->rg.plt_energy_status = INVALID_MMIO_REG;
     +	}
     +
    -+	/*
    -+	 * If a platform does not support *_PLATFORM_ENERGY_STATUS,
    -+	 * try *PACKAGE_ENERGY_STATUS.
    -+	 */
    -+	if (i915_mmio_reg_valid(hwmon->rg.plt_energy_status))
    -+		hwmon->rg.reg_energy_status = hwmon->rg.plt_energy_status;
    -+	else
    -+		hwmon->rg.reg_energy_status = hwmon->rg.pkg_energy_status;
    -+
     +	wakeref = intel_runtime_pm_get(uncore->rpm);
     +
     +	/*
    @@ drivers/gpu/drm/i915/i915_hwmon.c (new)
     +
     +	hwmon->energy_counter_overflow = 0;
     +
    -+	if (i915_mmio_reg_valid(hwmon->rg.reg_energy_status))
    ++	if (i915_mmio_reg_valid(hwmon->rg.pkg_energy_status))
     +		hwmon->energy_counter_prev =
    -+			intel_uncore_read(uncore, hwmon->rg.reg_energy_status);
    ++			intel_uncore_read(uncore, hwmon->rg.pkg_energy_status);
     +	else
     +		hwmon->energy_counter_prev = 0;
     +
    @@ drivers/gpu/drm/i915/i915_hwmon.c (new)
     +	}
     +
     +	hwmon->dev = hwmon_dev;
    -+
    -+	return;
     +}
     +
     +void i915_hwmon_unregister(struct drm_i915_private *i915)
    @@ drivers/gpu/drm/i915/i915_hwmon.h (new)
     +	i915_reg_t pkg_energy_status;
     +	i915_reg_t pkg_rapl_limit;
     +	i915_reg_t pkg_rapl_limit_udw;
    -+	i915_reg_t plt_energy_status;
    -+	i915_reg_t reg_energy_status;
     +};
     +
     +struct i915_hwmon {
    @@ drivers/gpu/drm/i915/i915_reg.h: static inline bool i915_mmio_reg_valid(i915_reg
     +#define PCU_PACKAGE_RAPL_LIMIT		_MMIO(MCHBAR_MIRROR_BASE_SNB + 0x59a0)
     +#define PCU_PACKAGE_RAPL_LIMIT_UDW	_MMIO(MCHBAR_MIRROR_BASE_SNB + 0x59a4)
     +#define PCU_PACKAGE_POWER_SKU		INVALID_MMIO_REG
    -+#define PCU_PLATFORM_ENERGY_STATUS	INVALID_MMIO_REG
     +
     +/* Fields for *_PACKAGE_RAPL_LIMIT: */
     +#define   PKG_PWR_LIM_1			REG_GENMASK(14, 0)

base-commit: 0b2064a4b2783bffdaf30e49bf40c38f6abae3ec
-- 
2.31.1

