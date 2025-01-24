Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D8319A1B01A
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jan 2025 06:53:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0024F10E8E0;
	Fri, 24 Jan 2025 05:53:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OJ/yWjZb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B84610E8DD;
 Fri, 24 Jan 2025 05:53:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737697983; x=1769233983;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=42+ihl6xW5wSrYGj/aO2Kyuw7IZBD3abROgAjP83NsQ=;
 b=OJ/yWjZbAR5nU/106jOqQVtmJV9CukFsvvpnXkDDqOZ+5mau80EdeSO7
 nI/DhEFbRlGmh+79wRM8odjI2etToQC3uUBfrlLUUQ8iE41FwcWxkOLm5
 dTFA/Sz2Ki0MGx6syBnx10PrH1GTLSwPm/LiSkaV/lUMpPPZHp1K7Y7Kz
 VIKIg//5gQ09LvXGTg2ShA0QchIMgOaAyBZoZb8+jv3nubrVjMazbjdP4
 L6HhEmnPhzjOwDJGBeJ1uPqwu/rGPLNA3sVsAMD78dyekUtSSkilwgFMR
 e+3IKMnbGb5TogLwO6IaGXYDBvaOcUuH+t+40+ilI/QjOnZJ3mVRSO7ho g==;
X-CSE-ConnectionGUID: frBNqSmvTAaSfsKXELugDg==
X-CSE-MsgGUID: vxmk0vlwQ1ewhHHB7oYXVQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11324"; a="60689143"
X-IronPort-AV: E=Sophos;i="6.13,230,1732608000"; d="scan'208";a="60689143"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2025 21:53:02 -0800
X-CSE-ConnectionGUID: nW5m3JZkT+SvgKRnEPaeNg==
X-CSE-MsgGUID: JCsz6fPRRz2VZKQC2+SXRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,230,1732608000"; d="scan'208";a="108218679"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by fmviesa010.fm.intel.com with ESMTP; 23 Jan 2025 21:52:55 -0800
From: Raag Jadav <raag.jadav@intel.com>
To: airlied@gmail.com, simona@ffwll.ch, lucas.demarchi@intel.com,
 rodrigo.vivi@intel.com, jani.nikula@linux.intel.com,
 andriy.shevchenko@linux.intel.com, michal.wajdeczko@intel.com,
 christian.koenig@amd.com, xaver.hugl@kde.org
Cc: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, himal.prasad.ghimiray@intel.com,
 aravind.iddamsetty@linux.intel.com, anshuman.gupta@intel.com,
 lina@asahilina.net, alexander.deucher@amd.com, andrealmeid@igalia.com,
 amd-gfx@lists.freedesktop.org, kernel-dev@igalia.com,
 Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v11 1/5] drm: Introduce device wedged event
Date: Fri, 24 Jan 2025 11:22:56 +0530
Message-Id: <20250124055300.1111274-2-raag.jadav@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250124055300.1111274-1-raag.jadav@intel.com>
References: <20250124055300.1111274-1-raag.jadav@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Introduce device wedged event, which notifies userspace of 'wedged'
(hanged/unusable) state of the DRM device through a uevent. This is
useful especially in cases where the device is no longer operating as
expected and has become unrecoverable from driver context. Purpose of
this implementation is to provide drivers a generic way to recover with
the help of userspace intervention without taking any drastic measures
in the driver.

A 'wedged' device is basically a dead device that needs attention. The
uevent is the notification that is sent to userspace along with a hint
about what could possibly be attempted to recover the device and bring
it back to usable state. Different drivers may have different ideas of
a 'wedged' device depending on their hardware implementation, and hence
the vendor agnostic nature of the event. It is up to the drivers to
decide when they see the need for device recovery and how they want to
recover from the available methods.

Driver prerequisites
--------------------

The driver, before opting for recovery, needs to make sure that the
'wedged' device doesn't harm the system as a whole by taking care of the
prerequisites. Necessary actions must include disabling DMA to system
memory as well as any communication channels with other devices. Further,
the driver must ensure that all dma_fences are signalled and any device
state that the core kernel might depend on is cleaned up. Any existing
mmap should be invalidated and page faults should be redirected to a
dummy page. Once the event is sent, the device must be kept in 'wedged'
state until the recovery is performed. New accesses to the device
(IOCTLs) should be blocked, preferably with an error code that resembles
the type of failure the device has encountered. This will signify the
reason for wedging, which can be reported to the application if needed.

Recovery
--------

Current implementation defines three recovery methods, out of which,
drivers can use any one, multiple or none. Method(s) of choice will be
sent in the uevent environment as ``WEDGED=<method1>[,<method2>]`` in
order of less to more side-effects. If driver is unsure about recovery
or method is unknown (like soft/hard reboot, firmware flashing, hardware
replacement or any other procedure which can't be attempted on the fly),
``WEDGED=unknown`` will be sent instead.

Userspace consumers can parse this event and attempt recovery as per the
following expectations.

    =============== ================================
    Recovery method Consumer expectations
    =============== ================================
    none            optional telemetry collection
    rebind          unbind + bind driver
    bus-reset       unbind + reset bus device + bind
    unknown         admin/user policy
    =============== ================================

The only exception to this is ``WEDGED=none``, which signifies that the
device was temporarily 'wedged' at some point but was able to recover using
device specific methods like reset. No explicit device recovery is expected
from the consumer in this case, but it can still take additional steps like
gathering telemetry information (devcoredump, syslog). This is useful
because the first hang is usually the most critical one which can result in
consequential hangs or complete wedging.

Consumer prerequisites
----------------------

It is the responsibility of the consumer to make sure that the device or
its resources are not in use by any process before attempting recovery.
With IOCTLs blocked and device already 'wedged', all device memory should
be unmapped and file descriptors should be closed to prevent leaks or
undefined behavior.

Example
-------

Udev rule::

    SUBSYSTEM=="drm", ENV{WEDGED}=="rebind", DEVPATH=="*/drm/card[0-9]",
    RUN+="/path/to/rebind.sh $env{DEVPATH}"

Recovery script::

    #!/bin/sh

    DEVPATH=$(readlink -f /sys/$1/device)
    DEVICE=$(basename $DEVPATH)
    DRIVER=$(readlink -f $DEVPATH/driver)

    echo -n $DEVICE > $DRIVER/unbind
    echo -n $DEVICE > $DRIVER/bind

Customization
-------------

Although basic recovery is possible with a simple script, admin/users can
define custom policies around recovery action. For example, if the driver
supports multiple recovery methods, consumers can opt for the suitable one
based on policy definition. Consumers can also choose to have the device
available for debugging or additional data collection before attempting
recovery. This is useful especially when the driver is unsure about
recovery or method is unknown.

 v4: s/drm_dev_wedged/drm_dev_wedged_event
     Use drm_info() (Jani)
     Kernel doc adjustment (Aravind)
 v5: Send recovery method with uevent (Lina)
 v6: Access wedge_recovery_opts[] using helper function (Jani)
     Use snprintf() (Jani)
 v7: Convert recovery helpers into regular functions (Andy, Jani)
     Aesthetic adjustments (Andy)
     Handle invalid method cases
 v8: Allow sending multiple methods with uevent (Lucas, Michal)
     static_assert() globally (Andy)
 v9: Provide 'none' method for device reset (Christian)
     Provide recovery opts using switch cases
v11: Log device reset (André)

Signed-off-by: Raag Jadav <raag.jadav@intel.com>
Reviewed-by: André Almeida <andrealmeid@igalia.com>
---
 drivers/gpu/drm/drm_drv.c | 68 +++++++++++++++++++++++++++++++++++++++
 include/drm/drm_device.h  |  8 +++++
 include/drm/drm_drv.h     |  1 +
 3 files changed, 77 insertions(+)

diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
index 3cf440eee8a2..9eb1f236a03f 100644
--- a/drivers/gpu/drm/drm_drv.c
+++ b/drivers/gpu/drm/drm_drv.c
@@ -26,6 +26,7 @@
  * DEALINGS IN THE SOFTWARE.
  */
 
+#include <linux/bitops.h>
 #include <linux/cgroup_dmem.h>
 #include <linux/debugfs.h>
 #include <linux/fs.h>
@@ -34,6 +35,7 @@
 #include <linux/mount.h>
 #include <linux/pseudo_fs.h>
 #include <linux/slab.h>
+#include <linux/sprintf.h>
 #include <linux/srcu.h>
 #include <linux/xarray.h>
 
@@ -498,6 +500,72 @@ void drm_dev_unplug(struct drm_device *dev)
 }
 EXPORT_SYMBOL(drm_dev_unplug);
 
+/*
+ * Available recovery methods for wedged device. To be sent along with device
+ * wedged uevent.
+ */
+static const char *drm_get_wedge_recovery(unsigned int opt)
+{
+	switch (BIT(opt)) {
+	case DRM_WEDGE_RECOVERY_NONE:
+		return "none";
+	case DRM_WEDGE_RECOVERY_REBIND:
+		return "rebind";
+	case DRM_WEDGE_RECOVERY_BUS_RESET:
+		return "bus-reset";
+	default:
+		return NULL;
+	}
+}
+
+/**
+ * drm_dev_wedged_event - generate a device wedged uevent
+ * @dev: DRM device
+ * @method: method(s) to be used for recovery
+ *
+ * This generates a device wedged uevent for the DRM device specified by @dev.
+ * Recovery @method\(s) of choice will be sent in the uevent environment as
+ * ``WEDGED=<method1>[,<method2>]`` in order of less to more side-effects. If
+ * caller is unsure about recovery or @method is unknown (0), ``WEDGED=unknown``
+ * will be sent instead.
+ *
+ * Refer to 'Device Wedging' chapter in Documentation/gpu/drm-uapi.rst for more
+ * details.
+ *
+ * Returns: 0 on success, negative error code otherwise.
+ */
+int drm_dev_wedged_event(struct drm_device *dev, unsigned long method)
+{
+	const char *recovery = NULL;
+	unsigned int len, opt;
+	/* Event string length up to 28+ characters with available methods */
+	char event_string[32];
+	char *envp[] = { event_string, NULL };
+
+	len = scnprintf(event_string, sizeof(event_string), "%s", "WEDGED=");
+
+	for_each_set_bit(opt, &method, BITS_PER_TYPE(method)) {
+		recovery = drm_get_wedge_recovery(opt);
+		if (drm_WARN_ONCE(dev, !recovery, "invalid recovery method %u\n", opt))
+			break;
+
+		len += scnprintf(event_string + len, sizeof(event_string), "%s,", recovery);
+	}
+
+	if (recovery)
+		/* Get rid of trailing comma */
+		event_string[len - 1] = '\0';
+	else
+		/* Caller is unsure about recovery, do the best we can at this point. */
+		snprintf(event_string, sizeof(event_string), "%s", "WEDGED=unknown");
+
+	drm_info(dev, "device wedged, %s\n", method == DRM_WEDGE_RECOVERY_NONE ?
+		 "but recovered through reset" : "needs recovery");
+
+	return kobject_uevent_env(&dev->primary->kdev->kobj, KOBJ_CHANGE, envp);
+}
+EXPORT_SYMBOL(drm_dev_wedged_event);
+
 /*
  * DRM internal mount
  * We want to be able to allocate our own "struct address_space" to control
diff --git a/include/drm/drm_device.h b/include/drm/drm_device.h
index c91f87b5242d..6ea54a578cda 100644
--- a/include/drm/drm_device.h
+++ b/include/drm/drm_device.h
@@ -21,6 +21,14 @@ struct inode;
 struct pci_dev;
 struct pci_controller;
 
+/*
+ * Recovery methods for wedged device in order of less to more side-effects.
+ * To be used with drm_dev_wedged_event() as recovery @method. Callers can
+ * use any one, multiple (or'd) or none depending on their needs.
+ */
+#define DRM_WEDGE_RECOVERY_NONE		BIT(0)	/* optional telemetry collection */
+#define DRM_WEDGE_RECOVERY_REBIND	BIT(1)	/* unbind + bind driver */
+#define DRM_WEDGE_RECOVERY_BUS_RESET	BIT(2)	/* unbind + reset bus device + bind */
 
 /**
  * enum switch_power_state - power state of drm device
diff --git a/include/drm/drm_drv.h b/include/drm/drm_drv.h
index 9952b846c170..a43d707b5f36 100644
--- a/include/drm/drm_drv.h
+++ b/include/drm/drm_drv.h
@@ -482,6 +482,7 @@ void drm_put_dev(struct drm_device *dev);
 bool drm_dev_enter(struct drm_device *dev, int *idx);
 void drm_dev_exit(int idx);
 void drm_dev_unplug(struct drm_device *dev);
+int drm_dev_wedged_event(struct drm_device *dev, unsigned long method);
 
 /**
  * drm_dev_is_unplugged - is a DRM device unplugged
-- 
2.34.1

