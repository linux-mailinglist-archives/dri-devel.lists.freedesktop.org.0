Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A35A6989BB1
	for <lists+dri-devel@lfdr.de>; Mon, 30 Sep 2024 09:39:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 220D910E3AD;
	Mon, 30 Sep 2024 07:39:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CApce3RB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5877110E3AD;
 Mon, 30 Sep 2024 07:39:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727681977; x=1759217977;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=cji0HqaVHxxAff4YFRcNBaRc8c4+jaWjEWUzYo4hhmg=;
 b=CApce3RBNjEQSyr8vbU+YCgwakjsflAi1aZcSGnWASnk7bsCj123Q9SI
 e9+kz3PtRo8ZyrA0gJ3jxFH15nPqrpsnyjzSNiheLkWHFzrxQoX3UuYgK
 vsazTwfSO05ot0d7aRXsKbsJItGjEYATUf+bsdgIQUViBF3wDJQ1nNcQo
 zJTyxmsHckwQAl9cR2XtBVGz06L7g/IC0iT8vcxViQguHVHe2fJlNcqq5
 wMU6Wffdf9LmPj1ZsolSO2VuzjMJWYQlNKnr0rsYVg63wuSjBvxaBeL5t
 TsnMtl9wmiN311du+jylE2GI6IwN8sbnPV1R6pjMxYK2fi24igYJdmb34 A==;
X-CSE-ConnectionGUID: 39DW+inxRKewQknROnLbhQ==
X-CSE-MsgGUID: SWbfpKH6SJSla6WrMkv4ng==
X-IronPort-AV: E=McAfee;i="6700,10204,11210"; a="37315453"
X-IronPort-AV: E=Sophos;i="6.11,165,1725346800"; d="scan'208";a="37315453"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2024 00:39:37 -0700
X-CSE-ConnectionGUID: N7zqWVSWSL+oIviDCJgJdQ==
X-CSE-MsgGUID: SleehpyWR/iQi0DvhDorgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,165,1725346800"; d="scan'208";a="72797411"
Received: from jraag-nuc8i7beh.iind.intel.com ([10.145.169.79])
 by fmviesa006.fm.intel.com with ESMTP; 30 Sep 2024 00:39:30 -0700
From: Raag Jadav <raag.jadav@intel.com>
To: airlied@gmail.com, simona@ffwll.ch, lucas.demarchi@intel.com,
 thomas.hellstrom@linux.intel.com, rodrigo.vivi@intel.com,
 jani.nikula@linux.intel.com, andriy.shevchenko@linux.intel.com,
 joonas.lahtinen@linux.intel.com, tursulin@ursulin.net, lina@asahilina.net
Cc: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, himal.prasad.ghimiray@intel.com,
 francois.dugast@intel.com, aravind.iddamsetty@linux.intel.com,
 anshuman.gupta@intel.com, andi.shyti@linux.intel.com,
 matthew.d.roper@intel.com, Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v7 1/5] drm: Introduce device wedged event
Date: Mon, 30 Sep 2024 13:08:41 +0530
Message-Id: <20240930073845.347326-2-raag.jadav@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240930073845.347326-1-raag.jadav@intel.com>
References: <20240930073845.347326-1-raag.jadav@intel.com>
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
expected even after a hardware reset and has become unrecoverable from
driver context.

Purpose of this implementation is to provide drivers a generic way to
recover with the help of userspace intervention. Different drivers may
have different ideas of a "wedged device" depending on their hardware
implementation, and hence the vendor agnostic nature of the event.
It is up to the drivers to decide when they see the need for recovery
and how they want to recover from the available methods.

Current implementation defines three recovery methods, out of which,
drivers can choose to support any one or multiple of them. Preferred
recovery method will be sent in the uevent environment as WEDGED=<method>.
Userspace consumers (sysadmin) can define udev rules to parse this event
and take respective action to recover the device.

    =============== ==================================
    Recovery method Consumer expectations
    =============== ==================================
    rebind          unbind + rebind driver
    bus-reset       unbind + reset bus device + rebind
    reboot          reboot system
    =============== ==================================

v4: s/drm_dev_wedged/drm_dev_wedged_event
    Use drm_info() (Jani)
    Kernel doc adjustment (Aravind)
v5: Send recovery method with uevent (Lina)
v6: Access wedge_recovery_opts[] using helper function (Jani)
    Use snprintf() (Jani)
v7: Convert recovery helpers into regular functions (Andy, Jani)
    Aesthetic adjustments (Andy)
    Handle invalid method cases

Signed-off-by: Raag Jadav <raag.jadav@intel.com>
---
 drivers/gpu/drm/drm_drv.c | 77 +++++++++++++++++++++++++++++++++++++++
 include/drm/drm_device.h  | 23 ++++++++++++
 include/drm/drm_drv.h     |  3 ++
 3 files changed, 103 insertions(+)

diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
index ac30b0ec9d93..cfe9600da2ee 100644
--- a/drivers/gpu/drm/drm_drv.c
+++ b/drivers/gpu/drm/drm_drv.c
@@ -26,6 +26,8 @@
  * DEALINGS IN THE SOFTWARE.
  */
 
+#include <linux/array_size.h>
+#include <linux/build_bug.h>
 #include <linux/debugfs.h>
 #include <linux/fs.h>
 #include <linux/module.h>
@@ -33,6 +35,7 @@
 #include <linux/mount.h>
 #include <linux/pseudo_fs.h>
 #include <linux/slab.h>
+#include <linux/sprintf.h>
 #include <linux/srcu.h>
 #include <linux/xarray.h>
 
@@ -70,6 +73,42 @@ static struct dentry *drm_debugfs_root;
 
 DEFINE_STATIC_SRCU(drm_unplug_srcu);
 
+/*
+ * Available recovery methods for wedged device. To be sent along with device
+ * wedged uevent.
+ */
+static const char *const drm_wedge_recovery_opts[] = {
+	[DRM_WEDGE_RECOVERY_REBIND] = "rebind",
+	[DRM_WEDGE_RECOVERY_BUS_RESET] = "bus-reset",
+	[DRM_WEDGE_RECOVERY_REBOOT] = "reboot",
+};
+
+static bool drm_wedge_recovery_is_valid(enum drm_wedge_recovery method)
+{
+	static_assert(ARRAY_SIZE(drm_wedge_recovery_opts) == DRM_WEDGE_RECOVERY_MAX);
+
+	return method >= DRM_WEDGE_RECOVERY_REBIND && method < DRM_WEDGE_RECOVERY_MAX;
+}
+
+/**
+ * drm_wedge_recovery_name - provide wedge recovery name
+ * @method: method to be used for recovery
+ *
+ * This validates wedge recovery @method against the available ones in
+ * drm_wedge_recovery_opts[] and provides respective recovery name in string
+ * format if found valid.
+ *
+ * Returns: pointer to const recovery string on success, NULL otherwise.
+ */
+const char *drm_wedge_recovery_name(enum drm_wedge_recovery method)
+{
+	if (drm_wedge_recovery_is_valid(method))
+		return drm_wedge_recovery_opts[method];
+
+	return NULL;
+}
+EXPORT_SYMBOL(drm_wedge_recovery_name);
+
 /*
  * DRM Minors
  * A DRM device can provide several char-dev interfaces on the DRM-Major. Each
@@ -497,6 +536,44 @@ void drm_dev_unplug(struct drm_device *dev)
 }
 EXPORT_SYMBOL(drm_dev_unplug);
 
+/**
+ * drm_dev_wedged_event - generate a device wedged uevent
+ * @dev: DRM device
+ * @method: method to be used for recovery
+ *
+ * This generates a device wedged uevent for the DRM device specified by @dev.
+ * Recovery @method from drm_wedge_recovery_opts[] (if supprted by the device)
+ * is sent in the uevent environment as WEDGED=<method>, on the basis of which,
+ * userspace may take respective action to recover the device.
+ *
+ * Returns: 0 on success, or negative error code otherwise.
+ */
+int drm_dev_wedged_event(struct drm_device *dev, enum drm_wedge_recovery method)
+{
+	/* Event string length up to 16+ characters with available methods */
+	char event_string[32] = {};
+	char *envp[] = { event_string, NULL };
+	const char *recovery;
+
+	recovery = drm_wedge_recovery_name(method);
+	if (!recovery) {
+		drm_err(dev, "device wedged, invalid recovery method %d\n", method);
+		return -EINVAL;
+	}
+
+	if (!test_bit(method, &dev->wedge_recovery)) {
+		drm_err(dev, "device wedged, %s based recovery not supported\n",
+			drm_wedge_recovery_name(method));
+		return -EOPNOTSUPP;
+	}
+
+	snprintf(event_string, sizeof(event_string), "WEDGED=%s", recovery);
+
+	drm_info(dev, "device wedged, generating uevent for %s based recovery\n", recovery);
+	return kobject_uevent_env(&dev->primary->kdev->kobj, KOBJ_CHANGE, envp);
+}
+EXPORT_SYMBOL(drm_dev_wedged_event);
+
 /*
  * DRM internal mount
  * We want to be able to allocate our own "struct address_space" to control
diff --git a/include/drm/drm_device.h b/include/drm/drm_device.h
index c91f87b5242d..fed6f20e52fb 100644
--- a/include/drm/drm_device.h
+++ b/include/drm/drm_device.h
@@ -40,6 +40,26 @@ enum switch_power_state {
 	DRM_SWITCH_POWER_DYNAMIC_OFF = 3,
 };
 
+/**
+ * enum drm_wedge_recovery - Recovery method for wedged device in order of
+ * severity. To be set as bit fields in drm_device.wedge_recovery variable.
+ * Drivers can choose to support any one or multiple of them depending on
+ * their needs.
+ */
+enum drm_wedge_recovery {
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
@@ -317,6 +337,9 @@ struct drm_device {
 	 * Root directory for debugfs files.
 	 */
 	struct dentry *debugfs_root;
+
+	/** @wedge_recovery: Supported recovery methods for wedged device */
+	unsigned long wedge_recovery;
 };
 
 #endif
diff --git a/include/drm/drm_drv.h b/include/drm/drm_drv.h
index 02ea4e3248fd..d8dbc77010b0 100644
--- a/include/drm/drm_drv.h
+++ b/include/drm/drm_drv.h
@@ -462,6 +462,9 @@ bool drm_dev_enter(struct drm_device *dev, int *idx);
 void drm_dev_exit(int idx);
 void drm_dev_unplug(struct drm_device *dev);
 
+const char *drm_wedge_recovery_name(enum drm_wedge_recovery method);
+int drm_dev_wedged_event(struct drm_device *dev, enum drm_wedge_recovery method);
+
 /**
  * drm_dev_is_unplugged - is a DRM device unplugged
  * @dev: DRM device
-- 
2.34.1

