Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42E3597AA8C
	for <lists+dri-devel@lfdr.de>; Tue, 17 Sep 2024 06:03:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9ABE10E332;
	Tue, 17 Sep 2024 04:03:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m1E5+AiB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A28310E332;
 Tue, 17 Sep 2024 04:03:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726545813; x=1758081813;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=U5X7DprDXAM1iIvXBrPSSCmo6qVTMWAwY4c3tE8APrM=;
 b=m1E5+AiBR2uglG6Ecf2N4f/QuBt83HxMppmTNqxocjAjEx5XNIg6KJjb
 dF4cHeYnR0WvpJITCEl8N0IsQTLfPVdI73fGbbAOlC/XpJor+TLzI4qzf
 2OWlfeip+jEm1bWhSSC2q1oHoK1f/NoxciM/k6Ql8jgFvQq5pjlvH3Ejc
 K6PcG4lpnjkEQN+E4AKy2ZAcslc5DhFl21/zP8HVH9VAFsRjYO5FBGdYf
 +C8trPWA1UXQJrftrWCQo/mFuzGg03kXN9MANZNJEOfLja53TKqEouAsF
 Ny3vQFYnfjHjO43cqkwlExGVHF5Xe0zCSkrtJFFQu3eC97M4eYnN2pMa1 A==;
X-CSE-ConnectionGUID: yB9zzmQcQjGe6yqu7AfFHw==
X-CSE-MsgGUID: ZIarDkW8QPuC3gRHZQnkrA==
X-IronPort-AV: E=McAfee;i="6700,10204,11197"; a="42865168"
X-IronPort-AV: E=Sophos;i="6.10,234,1719903600"; d="scan'208";a="42865168"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2024 21:03:33 -0700
X-CSE-ConnectionGUID: sxM0JrslTDWH6C8FByS9Hw==
X-CSE-MsgGUID: pcT8D/UiRpCciO3NmKNsUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,234,1719903600"; d="scan'208";a="69168595"
Received: from jraag-nuc8i7beh.iind.intel.com ([10.145.169.79])
 by fmviesa008.fm.intel.com with ESMTP; 16 Sep 2024 21:03:28 -0700
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
Subject: [PATCH v5 2/4] drm: Expose wedge recovery methods
Date: Tue, 17 Sep 2024 09:32:33 +0530
Message-Id: <20240917040235.197019-3-raag.jadav@intel.com>
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
 drivers/gpu/drm/drm_sysfs.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/drivers/gpu/drm/drm_sysfs.c b/drivers/gpu/drm/drm_sysfs.c
index fb3bbb6adcd1..b88cdbfa3b5e 100644
--- a/drivers/gpu/drm/drm_sysfs.c
+++ b/drivers/gpu/drm/drm_sysfs.c
@@ -36,6 +36,8 @@
 #define to_drm_minor(d) dev_get_drvdata(d)
 #define to_drm_connector(d) dev_get_drvdata(d)
 
+extern const char *const wedge_recovery_opts[];
+
 /**
  * DOC: overview
  *
@@ -508,6 +510,26 @@ void drm_sysfs_connector_property_event(struct drm_connector *connector,
 }
 EXPORT_SYMBOL(drm_sysfs_connector_property_event);
 
+static ssize_t wedge_recovery_show(struct device *device,
+				   struct device_attribute *attr, char *buf)
+{
+	struct drm_minor *minor = to_drm_minor(device);
+	struct drm_device *dev = minor->dev;
+	int opt, count = 0;
+
+	for_each_set_bit(opt, &dev->wedge_recovery, DRM_WEDGE_RECOVERY_MAX)
+		count += sysfs_emit_at(buf, count, "%s\n", wedge_recovery_opts[opt]);
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
@@ -532,6 +554,7 @@ struct device *drm_sysfs_minor_alloc(struct drm_minor *minor)
 		kdev->devt = MKDEV(DRM_MAJOR, minor->index);
 		kdev->class = drm_class;
 		kdev->type = &drm_sysfs_device_minor;
+		kdev->groups = minor_dev_groups;
 	}
 
 	kdev->parent = minor->dev->dev;
-- 
2.34.1

