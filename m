Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35BE797E52E
	for <lists+dri-devel@lfdr.de>; Mon, 23 Sep 2024 05:59:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2AD910E36D;
	Mon, 23 Sep 2024 03:59:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ez1gtRFK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AB0810E36D;
 Mon, 23 Sep 2024 03:59:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727063980; x=1758599980;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=tKbIYASP1CsvFDUuFBHMLMuWYnHOaHy/2dJpg4EAGPg=;
 b=ez1gtRFK/S4mIlfHE/rUUBD+Q8YhTTbBKFVLFY6bbVYD+QE3xk3dQ1V/
 /bZfM0Lvs7jrqq7qeEzOMQxndB/C5+jdKQ6fO0N8vofK9PL7/fhD6nbSI
 mZiudBgw+71J2yuWDGuzbMv0TwTdTMQEZ3l3CgsDMilCthKqNgr0QTAml
 mYKmU6AhA1Ih8doxtWtqKLQm7fvHSEcZF+mmGWBvjWtwy5PHb+sGNoqU5
 qkDI/SUdCdg4eSXSLXYDoBIZk3zbG6+ByZHSEwoE3VB40I/rcjTxZoxCr
 t/FYRkfx0sZIH9i/+u54Ct+qSO40pcfDWgYs/Wsg/ID9/0fETzJJb/YJF A==;
X-CSE-ConnectionGUID: vbHB/i4VTbeCJYotqmYhAQ==
X-CSE-MsgGUID: v0I8D9AwSDax6RoS8VZRsQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11202"; a="29718244"
X-IronPort-AV: E=Sophos;i="6.10,250,1719903600"; d="scan'208";a="29718244"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2024 20:59:39 -0700
X-CSE-ConnectionGUID: KIiWMSXfSPyXE2uA2DWKoA==
X-CSE-MsgGUID: 5vNNpbThQIOzFpZOR9V3Xw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,250,1719903600"; d="scan'208";a="101667463"
Received: from jraag-nuc8i7beh.iind.intel.com ([10.145.169.79])
 by orviesa002.jf.intel.com with ESMTP; 22 Sep 2024 20:59:34 -0700
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
Subject: [PATCH v6 2/4] drm: Expose wedge recovery methods
Date: Mon, 23 Sep 2024 09:28:24 +0530
Message-Id: <20240923035826.624196-3-raag.jadav@intel.com>
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

Now that we have device wedged event in place, add wedge_recovery sysfs
attribute which will expose recovery methods supported by the DRM device.
This is useful for userspace consumers in cases where the device supports
multiple recovery methods which can be used as fallbacks.

$ cat /sys/class/drm/card0/wedge_recovery
rebind
bus-reset
reboot

Signed-off-by: Raag Jadav <raag.jadav@intel.com>
---
 drivers/gpu/drm/drm_sysfs.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/gpu/drm/drm_sysfs.c b/drivers/gpu/drm/drm_sysfs.c
index fb3bbb6adcd1..99767de9e685 100644
--- a/drivers/gpu/drm/drm_sysfs.c
+++ b/drivers/gpu/drm/drm_sysfs.c
@@ -24,6 +24,7 @@
 #include <drm/drm_accel.h>
 #include <drm/drm_connector.h>
 #include <drm/drm_device.h>
+#include <drm/drm_drv.h>
 #include <drm/drm_file.h>
 #include <drm/drm_modes.h>
 #include <drm/drm_print.h>
@@ -508,6 +509,26 @@ void drm_sysfs_connector_property_event(struct drm_connector *connector,
 }
 EXPORT_SYMBOL(drm_sysfs_connector_property_event);
 
+static ssize_t wedge_recovery_show(struct device *device,
+				   struct device_attribute *attr, char *buf)
+{
+	struct drm_minor *minor = to_drm_minor(device);
+	struct drm_device *dev = minor->dev;
+	int method, count = 0;
+
+	for_each_set_bit(method, &dev->wedge_recovery, DRM_WEDGE_RECOVERY_MAX)
+		count += sysfs_emit_at(buf, count, "%s\n", recovery_method_name(method));
+
+	return count;
+}
+static DEVICE_ATTR_RO(wedge_recovery);
+
+static struct attribute *minor_dev_attrs[] = {
+	&dev_attr_wedge_recovery.attr,
+	NULL
+};
+ATTRIBUTE_GROUPS(minor_dev);
+
 struct device *drm_sysfs_minor_alloc(struct drm_minor *minor)
 {
 	const char *minor_str;
@@ -532,6 +553,7 @@ struct device *drm_sysfs_minor_alloc(struct drm_minor *minor)
 		kdev->devt = MKDEV(DRM_MAJOR, minor->index);
 		kdev->class = drm_class;
 		kdev->type = &drm_sysfs_device_minor;
+		kdev->groups = minor_dev_groups;
 	}
 
 	kdev->parent = minor->dev->dev;
-- 
2.34.1

