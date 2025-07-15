Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E21C5B057B1
	for <lists+dri-devel@lfdr.de>; Tue, 15 Jul 2025 12:23:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5056E10E58E;
	Tue, 15 Jul 2025 10:23:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="j1oal72d";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C02010E58D;
 Tue, 15 Jul 2025 10:23:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752574991; x=1784110991;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Xo9tDHJCZAvF4nbeF+W85tFHgeyJQfEkBuz6ikBKYQI=;
 b=j1oal72dhE/QwLlyQmvWcbc7vsIHQqQbDoUU7qNAVJOKF+E9JrzSORst
 jQCntId6LIDIT/Iz4cfAHofPJ4Cx2cP23M4kfKX8/hinCkNgG0ssawnXe
 Rp7bopSZ23zMPbHKC4HbUID5/OgAwB8h9DRFx4CwI4wgK+LPjH9P2VxPF
 g1ul2xyhF2xiAj7hRm9JjQbxZZJjahquC2fRYGibsvUUa+Gvoiy1qZWDH
 eLWgyh0KE7gK+N89o/L3QF7VvgXfT7rb1RR/JapaR7NxGqikuCx76WIEN
 3els7w6r/jhzcO+c1Azstlk+SxFilBdEDIArbh5gHARXyZ/3H8aOlpK0o A==;
X-CSE-ConnectionGUID: SPGdCNRLQCSgow/Wcol5rQ==
X-CSE-MsgGUID: SiA0ueqlTwy2KlyoaSDKaA==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="54496914"
X-IronPort-AV: E=Sophos;i="6.16,313,1744095600"; d="scan'208";a="54496914"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2025 03:23:10 -0700
X-CSE-ConnectionGUID: BseabsIaQaSJ8284g/XGwg==
X-CSE-MsgGUID: wyU7tHwrRzyw69KLmLu56A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,313,1744095600"; d="scan'208";a="157543073"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2025 03:23:06 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 lucas.demarchi@intel.com, aravind.iddamsetty@linux.intel.com,
 raag.jadav@intel.com, umesh.nerlige.ramappa@intel.com,
 frank.scarbrough@intel.com, sk.anirban@intel.com, simona.vetter@ffwll.ch,
 airlied@gmail.com
Subject: [PATCH v5 5/9] drm/xe/xe_survivability: Add support for Runtime
 survivability mode
Date: Tue, 15 Jul 2025 16:17:25 +0530
Message-ID: <20250715104730.2109506-6-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250715104730.2109506-1-riana.tauro@intel.com>
References: <20250715104730.2109506-1-riana.tauro@intel.com>
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

