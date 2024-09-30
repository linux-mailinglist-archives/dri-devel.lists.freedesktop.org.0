Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64171989BB3
	for <lists+dri-devel@lfdr.de>; Mon, 30 Sep 2024 09:39:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D741710E3AA;
	Mon, 30 Sep 2024 07:39:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ad6woCvv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6839710E3B1;
 Mon, 30 Sep 2024 07:39:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727681982; x=1759217982;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=zBfj6l/LDRVXnzgkyVxes51ZF+Xrnbm5dhhr663CIvs=;
 b=ad6woCvvuHwwIN23FIwhqyZ0OxA9Jcw5orVhCFyjGmBkoDmHJiMvOSVC
 027KjKWUh5YW6tkJyESfQS9rk1XC755fSyF6tpyYUKFcwqqsZO9+j5REB
 jg425afxyOjjBEQ7vBdghBcm4DPMMqR54T+zD1z2B28bBAWw8M3aAtKFY
 NycIQbYo70fd7IzVsN/KReGXojKih9YziST0J4L2WMc/Z58T7as9PO4Oa
 n37+lvSII/xNcMWwDY/yeyDt5xQPGfh4+dLeLz2fwQdTXabWh2mbhUtet
 bCWq6od4rwFIf/2svrSNQMrHECdNCdoo8Le+1jcrVWS2z68RHklNF18Qq w==;
X-CSE-ConnectionGUID: URG+Xx4MQX+5i6up3i/NoQ==
X-CSE-MsgGUID: eRMA4fJ9S7mDTnFLSwyUlw==
X-IronPort-AV: E=McAfee;i="6700,10204,11210"; a="37315477"
X-IronPort-AV: E=Sophos;i="6.11,165,1725346800"; d="scan'208";a="37315477"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2024 00:39:42 -0700
X-CSE-ConnectionGUID: xIGQS4jqTZu+c19v925Fgg==
X-CSE-MsgGUID: vFFskLctSZaS9zFwN/49Ug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,165,1725346800"; d="scan'208";a="72797435"
Received: from jraag-nuc8i7beh.iind.intel.com ([10.145.169.79])
 by fmviesa006.fm.intel.com with ESMTP; 30 Sep 2024 00:39:36 -0700
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
Subject: [PATCH v7 2/5] drm: Expose wedge recovery methods
Date: Mon, 30 Sep 2024 13:08:42 +0530
Message-Id: <20240930073845.347326-3-raag.jadav@intel.com>
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

Now that we have device wedged event in place, add wedge_recovery sysfs
attribute which will expose recovery methods supported by the DRM device.
This is useful for userspace consumers in cases where the device supports
multiple recovery methods which can be used as fallbacks.

  $ cat /sys/class/drm/card<N>/wedge_recovery
  rebind
  bus-reset
  reboot

Signed-off-by: Raag Jadav <raag.jadav@intel.com>
---
 drivers/gpu/drm/drm_sysfs.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/gpu/drm/drm_sysfs.c b/drivers/gpu/drm/drm_sysfs.c
index fb3bbb6adcd1..bd77b35ceb8a 100644
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
+	unsigned int method, count = DRM_WEDGE_RECOVERY_REBIND;
+
+	for_each_set_bit(method, &dev->wedge_recovery, DRM_WEDGE_RECOVERY_MAX)
+		count += sysfs_emit_at(buf, count, "%s\n", drm_wedge_recovery_name(method));
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

