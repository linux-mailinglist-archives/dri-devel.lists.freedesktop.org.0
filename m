Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD7E297E52C
	for <lists+dri-devel@lfdr.de>; Mon, 23 Sep 2024 05:59:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D447A10E36C;
	Mon, 23 Sep 2024 03:59:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="N87iDxOV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56EEB10E36A;
 Mon, 23 Sep 2024 03:59:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727063974; x=1758599974;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=YRrOwSAxG99z4hcVsg7rqtAZxr7q7fvuHbElT7nv3T8=;
 b=N87iDxOVNQB6kJy/fF5WAssN1USnic/53gPmwzQwkhUivdyYphAF2iEc
 3wAfY6UKtfVuei450xEKwolMrcy5k2jKLJb0n2YN8sZCEA2i13FHMSxRG
 Zci+wEpJJ+YVpIsWP97/snR3vPJW0EJz3H9vZeb/1MUt+ZQPxJw2DS3ky
 s/csLEYnyC1k38hjvRiu6SHGYZkQXV0o7SEQhJrVFYdtBesQ2ADISSrdz
 mnDA4rAF3GAJp+HV+aJK3GpTdNMg4AsqpsFPYNvLpTSB8eXhw88wVBVsh
 tEqIZ/aB2pKOAmq3tldrO0tnRAsfSNHDa70wTkzwRoZgIDcxUqmObeTb2 w==;
X-CSE-ConnectionGUID: Xu/iApwLS/6zugwZK0c8tw==
X-CSE-MsgGUID: UIabIh1PShSeSMrDuR4HXw==
X-IronPort-AV: E=McAfee;i="6700,10204,11202"; a="29718240"
X-IronPort-AV: E=Sophos;i="6.10,250,1719903600"; d="scan'208";a="29718240"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2024 20:59:34 -0700
X-CSE-ConnectionGUID: PU9mv7TUQSm48Ze3brSBcQ==
X-CSE-MsgGUID: XfTqgX24RUK1tfV/1PHyYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,250,1719903600"; d="scan'208";a="101667451"
Received: from jraag-nuc8i7beh.iind.intel.com ([10.145.169.79])
 by orviesa002.jf.intel.com with ESMTP; 22 Sep 2024 20:59:27 -0700
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
Subject: [PATCH v6 1/4] drm: Introduce device wedged event
Date: Mon, 23 Sep 2024 09:28:23 +0530
Message-Id: <20240923035826.624196-2-raag.jadav@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240923035826.624196-1-raag.jadav@intel.com>
References: <20240923035826.624196-1-raag.jadav@intel.com>
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
and hence the vendor agnostic nature of the event. It is up to the drivers
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
v6: Access wedge_recovery_opts[] using helper function (Jani)
    Use snprintf() (Jani)

Signed-off-by: Raag Jadav <raag.jadav@intel.com>
---
 drivers/gpu/drm/drm_drv.c | 41 +++++++++++++++++++++++++++++++++++++++
 include/drm/drm_device.h  | 24 +++++++++++++++++++++++
 include/drm/drm_drv.h     | 18 +++++++++++++++++
 3 files changed, 83 insertions(+)

diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
index ac30b0ec9d93..03a5d9009689 100644
--- a/drivers/gpu/drm/drm_drv.c
+++ b/drivers/gpu/drm/drm_drv.c
@@ -70,6 +70,18 @@ static struct dentry *drm_debugfs_root;
 
 DEFINE_STATIC_SRCU(drm_unplug_srcu);
 
+/*
+ * Available recovery methods for wedged device. To be sent along with device
+ * wedged uevent.
+ */
+#define WEDGE_LEN	32	/* Need 16+ */
+
+const char *const wedge_recovery_opts[] = {
+	[DRM_WEDGE_RECOVERY_REBIND] = "rebind",
+	[DRM_WEDGE_RECOVERY_BUS_RESET] = "bus-reset",
+	[DRM_WEDGE_RECOVERY_REBOOT] = "reboot",
+};
+
 /*
  * DRM Minors
  * A DRM device can provide several char-dev interfaces on the DRM-Major. Each
@@ -497,6 +509,35 @@ void drm_dev_unplug(struct drm_device *dev)
 }
 EXPORT_SYMBOL(drm_dev_unplug);
 
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
+	char event_string[WEDGE_LEN] = {};
+	char *envp[] = { event_string, NULL };
+
+	if (!test_bit(method, &dev->wedge_recovery)) {
+		drm_err(dev, "device wedged, recovery method not supported\n");
+		return -EOPNOTSUPP;
+	}
+
+	snprintf(event_string, sizeof(event_string), "WEDGED=%s", recovery_method_name(method));
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
index c91f87b5242d..f1a71763c22a 100644
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
+	DRM_WEDGE_RECOVERY_REBIND,
+
+	/** @DRM_WEDGE_RECOVERY_BUS_RESET: unbind + reset bus device + rebind */
+	DRM_WEDGE_RECOVERY_BUS_RESET,
+
+	/** @DRM_WEDGE_RECOVERY_REBOOT: reboot system */
+	DRM_WEDGE_RECOVERY_REBOOT,
+
+	/** @DRM_WEDGE_RECOVERY_MAX: for bounds checking, do not use */
+	DRM_WEDGE_RECOVERY_MAX
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
index 02ea4e3248fd..83d44e153557 100644
--- a/include/drm/drm_drv.h
+++ b/include/drm/drm_drv.h
@@ -45,6 +45,8 @@ struct drm_mode_create_dumb;
 struct drm_printer;
 struct sg_table;
 
+extern const char *const wedge_recovery_opts[];
+
 /**
  * enum drm_driver_feature - feature flags
  *
@@ -461,6 +463,7 @@ void drm_put_dev(struct drm_device *dev);
 bool drm_dev_enter(struct drm_device *dev, int *idx);
 void drm_dev_exit(int idx);
 void drm_dev_unplug(struct drm_device *dev);
+int drm_dev_wedged_event(struct drm_device *dev, enum wedge_recovery_method method);
 
 /**
  * drm_dev_is_unplugged - is a DRM device unplugged
@@ -551,4 +554,19 @@ static inline void drm_debugfs_dev_init(struct drm_device *dev, struct dentry *r
 }
 #endif
 
+static inline bool recovery_method_is_valid(enum wedge_recovery_method method)
+{
+	if (method >= DRM_WEDGE_RECOVERY_REBIND && method < DRM_WEDGE_RECOVERY_MAX)
+		return true;
+
+	return false;
+}
+
+static inline const char *recovery_method_name(enum wedge_recovery_method method)
+{
+	if (recovery_method_is_valid(method))
+		return wedge_recovery_opts[method];
+
+	return NULL;
+}
 #endif
-- 
2.34.1

