Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D70269588D
	for <lists+dri-devel@lfdr.de>; Tue, 14 Feb 2023 06:34:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B44710E0B7;
	Tue, 14 Feb 2023 05:33:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F28FE10E0B7;
 Tue, 14 Feb 2023 05:33:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676352828; x=1707888828;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=D/DB8ssistwkFOCctlaSKlXWf6HIBZVDLjugqwQLmoE=;
 b=OZ/CA7cNrj8oyt4qPeNXsofB6Vr1XIAN44pYhOPmPJk2LcoHAS0cXtlW
 yRxcF58ZwWsPGXm1is3O9dSwRevf2WIoQdiy+p7Vlsmx2byyC/f+F3YDS
 NgZMjteJv+GLUbLk6T+DDKnaOrjEqSM8i718tkXihkuwj2xnKnD0cEMCz
 qMprGSj7sW4//3KtGXZip+01Z+uUgKi6k7b4T5uxQtiaxZ0setenR/cgD
 HNCJr1/YU5yq4T0HQuCdTPHACXolaYpf3PU698+zNGLq6jFJGV9VEeJ+q
 IMJUu/4lQokdaEVUuXPU/wKEI7OuE48inBB+7VUgc1u8cpHTcYVcUOxUq g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10620"; a="358491797"
X-IronPort-AV: E=Sophos;i="5.97,294,1669104000"; d="scan'208";a="358491797"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2023 21:33:47 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10620"; a="669047084"
X-IronPort-AV: E=Sophos;i="5.97,294,1669104000"; d="scan'208";a="669047084"
Received: from orsosgc001.jf.intel.com ([10.165.21.138])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2023 21:33:46 -0800
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 3/3] drm/i915/hwmon: Expose power1_max_enable
Date: Mon, 13 Feb 2023 21:33:42 -0800
Message-Id: <20230214053342.1952226-4-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.38.0
In-Reply-To: <20230214053342.1952226-1-ashutosh.dixit@intel.com>
References: <20230214053342.1952226-1-ashutosh.dixit@intel.com>
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
Cc: linux-hwmon@vger.kernel.org, Anshuman Gupta <anshuman.gupta@intel.com>,
 dri-devel@lists.freedesktop.org, gwan-gyeong.mun@intel.com,
 Badal Nilawar <badal.nilawar@intel.com>, Riana Tauro <riana.tauro@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On ATSM the PL1 power limit is disabled at power up. The previous uapi
assumed that the PL1 limit is always enabled and therefore did not have a
notion of a disabled PL1 limit. This results in erroneous PL1 limit values
when PL1 limit is disabled. For example at power up, the disabled ATSM PL1
limit is shown as 0 which means a low PL1 limit whereas the limit being
disabled actually implies a high effective PL1 limit value.

To get round this problem, expose power1_max_enable as a custom hwmon
attribute. power1_max_enable can be used in conjunction with power1_max to
interpret power1_max (PL1 limit) values correctly. It can also be used to
enable/disable the PL1 power limit.

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 .../ABI/testing/sysfs-driver-intel-i915-hwmon |  7 +++
 drivers/gpu/drm/i915/i915_hwmon.c             | 48 +++++++++++++++++--
 2 files changed, 51 insertions(+), 4 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon b/Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon
index 2d6a472eef885..edd94a44b4570 100644
--- a/Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon
+++ b/Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon
@@ -18,6 +18,13 @@ Description:	RW. Card reactive sustained  (PL1/Tau) power limit in microwatts.
 
 		Only supported for particular Intel i915 graphics platforms.
 
+What:		/sys/devices/.../hwmon/hwmon<i>/power1_max_enable
+Date:		May 2023
+KernelVersion:	6.3
+Contact:	intel-gfx@lists.freedesktop.org
+Description:	RW. Enable/disable the PL1 power limit (power1_max).
+
+		Only supported for particular Intel i915 graphics platforms.
 What:		/sys/devices/.../hwmon/hwmon<i>/power1_rated_max
 Date:		February 2023
 KernelVersion:	6.2
diff --git a/drivers/gpu/drm/i915/i915_hwmon.c b/drivers/gpu/drm/i915/i915_hwmon.c
index 7c20a6f47b92e..5665869d8602b 100644
--- a/drivers/gpu/drm/i915/i915_hwmon.c
+++ b/drivers/gpu/drm/i915/i915_hwmon.c
@@ -230,13 +230,52 @@ hwm_power1_max_interval_store(struct device *dev,
 					    PKG_PWR_LIM_1_TIME, rxy);
 	return count;
 }
+static SENSOR_DEVICE_ATTR_RW(power1_max_interval, hwm_power1_max_interval, 0);
 
-static SENSOR_DEVICE_ATTR(power1_max_interval, 0664,
-			  hwm_power1_max_interval_show,
-			  hwm_power1_max_interval_store, 0);
+static ssize_t
+hwm_power1_max_enable_show(struct device *dev, struct device_attribute *attr, char *buf)
+{
+	struct hwm_drvdata *ddat = dev_get_drvdata(dev);
+	intel_wakeref_t wakeref;
+	u32 r;
+
+	with_intel_runtime_pm(ddat->uncore->rpm, wakeref)
+		r = intel_uncore_read(ddat->uncore, ddat->hwmon->rg.pkg_rapl_limit);
+
+	return sysfs_emit(buf, "%u\n", !!(r & PKG_PWR_LIM_1_EN));
+}
+
+static ssize_t
+hwm_power1_max_enable_store(struct device *dev, struct device_attribute *attr,
+			    const char *buf, size_t count)
+{
+	struct hwm_drvdata *ddat = dev_get_drvdata(dev);
+	intel_wakeref_t wakeref;
+	u32 en, r;
+	bool _en;
+	int ret;
+
+	ret = kstrtobool(buf, &_en);
+	if (ret)
+		return ret;
+
+	en = REG_FIELD_PREP(PKG_PWR_LIM_1_EN, _en);
+	hwm_locked_with_pm_intel_uncore_rmw(ddat, ddat->hwmon->rg.pkg_rapl_limit,
+					    PKG_PWR_LIM_1_EN, en);
+
+	/* Verify, because PL1 limit cannot be disabled on all platforms */
+	with_intel_runtime_pm(ddat->uncore->rpm, wakeref)
+		r = intel_uncore_read(ddat->uncore, ddat->hwmon->rg.pkg_rapl_limit);
+	if ((r & PKG_PWR_LIM_1_EN) != en)
+		return -EPERM;
+
+	return count;
+}
+static SENSOR_DEVICE_ATTR_RW(power1_max_enable, hwm_power1_max_enable, 0);
 
 static struct attribute *hwm_attributes[] = {
 	&sensor_dev_attr_power1_max_interval.dev_attr.attr,
+	&sensor_dev_attr_power1_max_enable.dev_attr.attr,
 	NULL
 };
 
@@ -247,7 +286,8 @@ static umode_t hwm_attributes_visible(struct kobject *kobj,
 	struct hwm_drvdata *ddat = dev_get_drvdata(dev);
 	struct i915_hwmon *hwmon = ddat->hwmon;
 
-	if (attr == &sensor_dev_attr_power1_max_interval.dev_attr.attr)
+	if (attr == &sensor_dev_attr_power1_max_interval.dev_attr.attr ||
+	    attr == &sensor_dev_attr_power1_max_enable.dev_attr.attr)
 		return i915_mmio_reg_valid(hwmon->rg.pkg_rapl_limit) ? attr->mode : 0;
 
 	return 0;
-- 
2.38.0

