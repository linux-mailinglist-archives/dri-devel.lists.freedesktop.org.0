Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BBD72B353DA
	for <lists+dri-devel@lfdr.de>; Tue, 26 Aug 2025 08:09:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C70610E5C3;
	Tue, 26 Aug 2025 06:09:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cghZFtM5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC53110E5B9;
 Tue, 26 Aug 2025 06:09:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756188566; x=1787724566;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=R+7TB+FuU9rUgq37cWdUQeEsMvg00igDK6lHLvz/kUo=;
 b=cghZFtM5/+MkIrAjC0K5qJtxGJdgNSl0QzuSYnMer6y9gzy4GeExlBKY
 4yh/c08SeBA4IlXkJTVbNjespe87pEN/5A6PRnjq9EO/ed+u2stJGZJDY
 ARnxshO1i0OO4LiJw7hEPydbqIBtDR9xIWLqC/CE/URhH6I5otyLLRFqI
 oi+OR1YuxvnmYmu/eXCtpU/ZNDbUO4TIh9naYpAnzM3EiBbxJcB32UChe
 VUYKxnzAg1kcI/wcV9H4F4pnBmf3Pd0JfPE2FSW25EEHKdyFWCei06NRQ
 hJwayCpGJXN22JdTboIU0N1rfjfReYjg4L5S4m8F9yh8VxtwImAPtOvWd Q==;
X-CSE-ConnectionGUID: T1RkiLP+R1+r7zN+e0Wdxg==
X-CSE-MsgGUID: t4aLmnoRSwi1CeOt//l+2Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11533"; a="58272035"
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; d="scan'208";a="58272035"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2025 23:09:25 -0700
X-CSE-ConnectionGUID: W35SGGRpRNeiRubbuJXw7g==
X-CSE-MsgGUID: oJNeniL3SHy7fM314sIrgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; d="scan'208";a="174756875"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2025 23:09:21 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 lucas.demarchi@intel.com, aravind.iddamsetty@linux.intel.com,
 raag.jadav@intel.com, umesh.nerlige.ramappa@intel.com,
 frank.scarbrough@intel.com, sk.anirban@intel.com, simona.vetter@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de
Subject: [PATCH v9 06/10] drm/xe/xe_survivability: Add support for Runtime
 survivability mode
Date: Tue, 26 Aug 2025 12:04:13 +0530
Message-ID: <20250826063419.3022216-7-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250826063419.3022216-1-riana.tauro@intel.com>
References: <20250826063419.3022216-1-riana.tauro@intel.com>
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

