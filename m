Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 415C497AA8A
	for <lists+dri-devel@lfdr.de>; Tue, 17 Sep 2024 06:03:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D87110E335;
	Tue, 17 Sep 2024 04:03:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="I4QwjTte";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBB6010E332;
 Tue, 17 Sep 2024 04:03:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726545808; x=1758081808;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=m2N4j0llPmm34l7ZiHh4OR6yipWx4AYR3N6HhqTLp7I=;
 b=I4QwjTteJt0KbTrcjIfiNnthR8K6nVKJweolDUl1YcARW4s1h/mOYcP2
 kpKBJXhsaCwYjB6KF3Q1ScEj7NTEB/HfQxB/8pmwaNj4utj9y0zeqRuVc
 KensSLPs+LqqXE7WUNnYFuliC4LHPAjCFym8pA+Nm5hs6Kvr5fLZW0ww5
 K2XoS5Rlynvu3JXPsIX3DC7In2xbbgym5h6dmCGDZbR2dj8FfiRm5+4fu
 rrhJgrGIh8+kl/EP68lzQzlKZ1ZOozgJMW1G3EkVx24F1bAqwKm6naSCZ
 LX96vbhp589INIj5tLQ5sXw5z3rpwRKjxeLHtRXmNXgOXRWovqkRVjsx/ A==;
X-CSE-ConnectionGUID: RS5AA+zxRViK23ULr+5Cpg==
X-CSE-MsgGUID: ZgCqHWlaQReNDgiN5R4Zxg==
X-IronPort-AV: E=McAfee;i="6700,10204,11197"; a="42865156"
X-IronPort-AV: E=Sophos;i="6.10,234,1719903600"; d="scan'208";a="42865156"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2024 21:03:27 -0700
X-CSE-ConnectionGUID: qj+4KXXYR4KWlNzmb5bb0A==
X-CSE-MsgGUID: SJKbRyWTRDCo7Ggaqw0HoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,234,1719903600"; d="scan'208";a="69168560"
Received: from jraag-nuc8i7beh.iind.intel.com ([10.145.169.79])
 by fmviesa008.fm.intel.com with ESMTP; 16 Sep 2024 21:03:22 -0700
From: Raag Jadav <raag.jadav@intel.com>
To: airlied@gmail.com, simona@ffwll.ch, lucas.demarchi@intel.com,
 thomas.hellstrom@linux.intel.com, rodrigo.vivi@intel.com,
 jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 tursulin@ursulin.net, lina@asahilina.net
Cc: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, himal.prasad.ghimiray@intel.com,
 francois.dugast@intel.com, aravind.iddamsetty@linux.intel.com,
 anshuman.gupta@intel.com, andi.shyti@linux.intel.com,
 andriy.shevchenko@linux.intel.com, matthew.d.roper@intel.com,
 Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v5 1/4] drm: Introduce device wedged event
Date: Tue, 17 Sep 2024 09:32:32 +0530
Message-Id: <20240917040235.197019-2-raag.jadav@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240917040235.197019-1-raag.jadav@intel.com>
References: <20240917040235.197019-1-raag.jadav@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Introduce device wedged event, which will notify userspace of wedged
(hanged/unusable) state of the DRM device through a uevent. This is
useful especially in cases where the device is no longer operating as
expected and has become unrecoverable from driver context.

Purpose of this implementation is to provide drivers a way to recover
through userspace intervention. Different drivers may have different
ideas of a "wedged device" depending on their hardware implementation,
and hence the vendor agnostic nature of the event. It is upto the drivers
to decide when they see the need for recovery and how they want to recover
from the available methods.

Current implementation defines three recovery methods, out of which,
drivers can choose to support any one or multiple of them. Preferred
recovery method will be sent in the uevent environment as WEDGED=<method>.
Userspace consumers (sysadmin) can define udev rules to parse this event
and take respective action to recover the device.

 Method    | Consumer expectations
-----------|-----------------------------------
 rebind    | unbind + rebind driver
 bus-reset | unbind + reset bus device + rebind
 reboot    | reboot system

v4: s/drm_dev_wedged/drm_dev_wedged_event
    Use drm_info() (Jani)
    Kernel doc adjustment (Aravind)
v5: Send recovery method with uevent (Lina)

Signed-off-by: Raag Jadav <raag.jadav@intel.com>
---
 drivers/gpu/drm/drm_drv.c | 37 +++++++++++++++++++++++++++++++++++++
 include/drm/drm_device.h  | 24 ++++++++++++++++++++++++
 include/drm/drm_drv.h     |  1 +
 3 files changed, 62 insertions(+)

diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
index ac30b0ec9d93..1e850a9f608d 100644
--- a/drivers/gpu/drm/drm_drv.c
+++ b/drivers/gpu/drm/drm_drv.c
@@ -497,6 +497,43 @@ void drm_dev_unplug(struct drm_device *dev)
 }
 EXPORT_SYMBOL(drm_dev_unplug);
 
+const char *const wedge_recovery_opts[] = {
+	[DRM_WEDGE_RECOVERY_REBIND] = "rebind",
+	[DRM_WEDGE_RECOVERY_BUS_RESET] = "bus-reset",
+	[DRM_WEDGE_RECOVERY_REBOOT] = "reboot",
+};
+
+/**
+ * drm_dev_wedged_event - generate a device wedged uevent
+ * @dev: DRM device
+ * @method: method to be used for recovery
+ *
+ * This generates a device wedged uevent for the DRM device specified by @dev.
+ * Recovery @method from wedge_recovery_opts[] (if supprted by the device) is
+ * sent in the uevent environment as WEDGED=<method>, on the basis of which,
+ * userspace may take respective action to recover the device.
+ *
+ * Returns: 0 on success, or negative error code otherwise.
+ */
+int drm_dev_wedged_event(struct drm_device *dev, enum wedge_recovery_method method)
+{
+	char event_string[32] = "WEDGED=";
+	char *envp[] = { event_string, NULL };
+	bool supported;
+
+	supported = test_bit(method, &dev->wedge_recovery);
+	if (unlikely(!supported)) {
+		drm_err(dev, "device wedged, recovery method not supported\n");
+		return -EOPNOTSUPP;
+	}
+
+	strcat(event_string, wedge_recovery_opts[method]);
+
+	drm_info(dev, "device wedged, generating uevent\n");
+	return kobject_uevent_env(&dev->primary->kdev->kobj, KOBJ_CHANGE, envp);
+}
+EXPORT_SYMBOL(drm_dev_wedged_event);
+
 /*
  * DRM internal mount
  * We want to be able to allocate our own "struct address_space" to control
diff --git a/include/drm/drm_device.h b/include/drm/drm_device.h
index c91f87b5242d..e4f32967b5ae 100644
--- a/include/drm/drm_device.h
+++ b/include/drm/drm_device.h
@@ -40,6 +40,27 @@ enum switch_power_state {
 	DRM_SWITCH_POWER_DYNAMIC_OFF = 3,
 };
 
+/**
+ * enum wedge_recovery_method - Recovery method for wedged device in order
+ * of severity. To be set as bit fields in drm_device.wedge_recovery variable.
+ * Drivers can choose to support any one or multiple of them depending on their
+ * needs.
+ */
+
+enum wedge_recovery_method {
+	/** @DRM_WEDGE_RECOVERY_REBIND: unbind + rebind driver */
+	DRM_WEDGE_RECOVERY_REBIND = 0,
+
+	/** @DRM_WEDGE_RECOVERY_BUS_RESET: unbind + reset bus device + rebind */
+	DRM_WEDGE_RECOVERY_BUS_RESET = 1,
+
+	/** @DRM_WEDGE_RECOVERY_REBOOT: reboot system */
+	DRM_WEDGE_RECOVERY_REBOOT = 2,
+
+	/** @DRM_WEDGE_RECOVERY_MAX: for bounds checking, do not use */
+	DRM_WEDGE_RECOVERY_MAX = 3,
+};
+
 /**
  * struct drm_device - DRM device structure
  *
@@ -317,6 +338,9 @@ struct drm_device {
 	 * Root directory for debugfs files.
 	 */
 	struct dentry *debugfs_root;
+
+	/** @wedge_recovery: Supported recovery methods for wedged device */
+	unsigned long wedge_recovery;
 };
 
 #endif
diff --git a/include/drm/drm_drv.h b/include/drm/drm_drv.h
index 02ea4e3248fd..6e02187f1f6c 100644
--- a/include/drm/drm_drv.h
+++ b/include/drm/drm_drv.h
@@ -461,6 +461,7 @@ void drm_put_dev(struct drm_device *dev);
 bool drm_dev_enter(struct drm_device *dev, int *idx);
 void drm_dev_exit(int idx);
 void drm_dev_unplug(struct drm_device *dev);
+int drm_dev_wedged_event(struct drm_device *dev, enum wedge_recovery_method method);
 
 /**
  * drm_dev_is_unplugged - is a DRM device unplugged
-- 
2.34.1

