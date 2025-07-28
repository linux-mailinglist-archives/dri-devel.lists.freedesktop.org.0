Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CED8B13880
	for <lists+dri-devel@lfdr.de>; Mon, 28 Jul 2025 12:03:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB06410E4C1;
	Mon, 28 Jul 2025 10:03:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Nph9Xp0V";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA30C10E4BA;
 Mon, 28 Jul 2025 10:03:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753697017; x=1785233017;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=R+7TB+FuU9rUgq37cWdUQeEsMvg00igDK6lHLvz/kUo=;
 b=Nph9Xp0VTfX8jxusAJKdJd+OJ3EG/O0XFfsSIssUFX9PVCCOQ5kyvznB
 t93LDInAAmsWzwuS65Nue/gBBUsvmEWKkrU285ZdlnhCSxA32LwUbs5ih
 7sN/GCf9Fm+LZkj13pG9OdYJHa1Us1fRhod86Q12l6K60RqQeq7L1iy/n
 q7zFYk4HaSkXZG5q9MLij6KrTuPoQ0Fo4EYu+YVocs8/mbZ0hVb4sBp4v
 TMJRV6q4eKZXeS4z5f9Y7tMbrS1e4sN+b8AR2O4Z/5TLdRm1Q+NHH1mP3
 ZS+582DZTcqz0YO6ddFhazM+se/avyHxqEElS3sEY/XOEkBcE15lH3F9R g==;
X-CSE-ConnectionGUID: f5S0YhKiTrOWXZugKi7v4A==
X-CSE-MsgGUID: tQ4FBDzXSciHoa5VuM8qOg==
X-IronPort-AV: E=McAfee;i="6800,10657,11504"; a="55641676"
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; d="scan'208";a="55641676"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2025 03:03:37 -0700
X-CSE-ConnectionGUID: YVx/7OWWSHqaUygj4izoMg==
X-CSE-MsgGUID: LiHfp0p9Qtmjidi0rbfwFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; d="scan'208";a="162739501"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2025 03:03:34 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 lucas.demarchi@intel.com, aravind.iddamsetty@linux.intel.com,
 raag.jadav@intel.com, umesh.nerlige.ramappa@intel.com,
 frank.scarbrough@intel.com, sk.anirban@intel.com, simona.vetter@ffwll.ch
Subject: [PATCH v7 5/9] drm/xe/xe_survivability: Add support for Runtime
 survivability mode
Date: Mon, 28 Jul 2025 15:57:55 +0530
Message-ID: <20250728102809.502324-6-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250728102809.502324-1-riana.tauro@intel.com>
References: <20250728102809.502324-1-riana.tauro@intel.com>
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

Certain runtime firmware errors can cause the device to be in a unusable
state requiring a firmware flash to restore normal operation.
Runtime Survivability Mode indicates firmware flash is necessary by
wedging the device and exposing survivability mode sysfs.

The below sysfs is an indication that device is in survivability mode

/sys/bus/pci/devices/<device>/survivability_mode

v2: Fix kernel-doc (Umesh)
v3: Add user friendly dmesg (Frank)

Signed-off-by: Riana Tauro <riana.tauro@intel.com>
Reviewed-by: Raag Jadav <raag.jadav@intel.com>
---
 drivers/gpu/drm/xe/xe_survivability_mode.c    | 43 ++++++++++++++++++-
 drivers/gpu/drm/xe/xe_survivability_mode.h    |  1 +
 .../gpu/drm/xe/xe_survivability_mode_types.h  |  1 +
 3 files changed, 44 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_survivability_mode.c b/drivers/gpu/drm/xe/xe_survivability_mode.c
index 4a2d1cff65d2..267d0e3fd85a 100644
--- a/drivers/gpu/drm/xe/xe_survivability_mode.c
+++ b/drivers/gpu/drm/xe/xe_survivability_mode.c
@@ -138,7 +138,8 @@ static ssize_t survivability_mode_show(struct device *dev,
 	struct xe_survivability_info *info = survivability->info;
 	int index = 0, count = 0;
 
-	count += sysfs_emit_at(buff, count, "Survivability mode type: Boot\n");
+	count += sysfs_emit_at(buff, count, "Survivability mode type: %s\n",
+			       survivability->type ? "Runtime" : "Boot");
 
 	if (!check_boot_failure(xe))
 		return count;
@@ -291,6 +292,46 @@ bool xe_survivability_mode_is_requested(struct xe_device *xe)
 	return check_boot_failure(xe);
 }
 
+/**
+ * xe_survivability_mode_runtime_enable - Initialize and enable runtime survivability mode
+ * @xe: xe device instance
+ *
+ * Initialize survivability information and enable runtime survivability mode.
+ * Runtime survivability mode is enabled when certain errors cause the device to be
+ * in non-recoverable state. The device is declared wedged with the appropriate
+ * recovery method and survivability mode sysfs exposed to userspace
+ *
+ * Return: 0 if runtime survivability mode is enabled, negative error code otherwise.
+ */
+int xe_survivability_mode_runtime_enable(struct xe_device *xe)
+{
+	struct xe_survivability *survivability = &xe->survivability;
+	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
+	int ret;
+
+	if (!IS_DGFX(xe) || IS_SRIOV_VF(xe) || xe->info.platform < XE_BATTLEMAGE) {
+		dev_err(&pdev->dev, "Runtime Survivability Mode not supported\n");
+		return -EINVAL;
+	}
+
+	ret = init_survivability_mode(xe);
+	if (ret)
+		return ret;
+
+	ret = create_survivability_sysfs(pdev);
+	if (ret)
+		dev_err(&pdev->dev, "Failed to create survivability mode sysfs\n");
+
+	survivability->type = XE_SURVIVABILITY_TYPE_RUNTIME;
+	dev_err(&pdev->dev, "Runtime Survivability mode enabled\n");
+
+	xe_device_set_wedged_method(xe, DRM_WEDGE_RECOVERY_VENDOR);
+	xe_device_declare_wedged(xe);
+	dev_err(&pdev->dev, "Firmware update required, Refer the userspace documentation for more details!\n");
+
+	return 0;
+}
+
 /**
  * xe_survivability_mode_boot_enable - Initialize and enable boot survivability mode
  * @xe: xe device instance
diff --git a/drivers/gpu/drm/xe/xe_survivability_mode.h b/drivers/gpu/drm/xe/xe_survivability_mode.h
index f6ee283ea5e8..1cc94226aa82 100644
--- a/drivers/gpu/drm/xe/xe_survivability_mode.h
+++ b/drivers/gpu/drm/xe/xe_survivability_mode.h
@@ -11,6 +11,7 @@
 struct xe_device;
 
 int xe_survivability_mode_boot_enable(struct xe_device *xe);
+int xe_survivability_mode_runtime_enable(struct xe_device *xe);
 bool xe_survivability_mode_is_boot_enabled(struct xe_device *xe);
 bool xe_survivability_mode_is_requested(struct xe_device *xe);
 
diff --git a/drivers/gpu/drm/xe/xe_survivability_mode_types.h b/drivers/gpu/drm/xe/xe_survivability_mode_types.h
index 5dce393498da..cd65a5d167c9 100644
--- a/drivers/gpu/drm/xe/xe_survivability_mode_types.h
+++ b/drivers/gpu/drm/xe/xe_survivability_mode_types.h
@@ -11,6 +11,7 @@
 
 enum xe_survivability_type {
 	XE_SURVIVABILITY_TYPE_BOOT,
+	XE_SURVIVABILITY_TYPE_RUNTIME,
 };
 
 struct xe_survivability_info {
-- 
2.47.1

