Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AC87B353D8
	for <lists+dri-devel@lfdr.de>; Tue, 26 Aug 2025 08:09:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E75810E5C2;
	Tue, 26 Aug 2025 06:09:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Roqd4I9z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE28910E5C2;
 Tue, 26 Aug 2025 06:09:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756188560; x=1787724560;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6tHGtp7sWftyTr8qU+JGUkjTTKDc4J5BUJr3LdQX6Y0=;
 b=Roqd4I9zN6f2f0VXhIkKMnycGQQuV85mpRm5Qs4Gd6MSNtzPe6HV/S81
 iVfRlzTVFdannrYemFo7uH3gRryr7it5+DP30LSfbEaqJD5wzjs8MbJFt
 he5jJqSp7+LVPTVjG3immFVBsk2nz27qHQyDOa59sgmR/BTdfXeaDApyB
 Ta3dAxD4juypsJ8DwpN6HB/4LSetfOlEjXesnm8khKpAA7S1QbsdK7jqb
 q2Vzuz7bFXdZ/B6yB+CjU6X+QGXZ4OCUxx+cD9l6lgCZGEyOT9m2buWss
 0RXrOmQYXLWJnAbeQvrrFdrcU2uBYN/i0BiB9Ctcj7wGe+vs8zGE/Vb9Y w==;
X-CSE-ConnectionGUID: tYjrurw2ReiBZ50+LoZFWQ==
X-CSE-MsgGUID: 0e6sDYw2TNmoovW02K55oA==
X-IronPort-AV: E=McAfee;i="6800,10657,11533"; a="58272026"
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; d="scan'208";a="58272026"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2025 23:09:19 -0700
X-CSE-ConnectionGUID: ywSvZyaXQlWjtlDmUN9ONQ==
X-CSE-MsgGUID: aPrTzNwvQFSsjsGX3h9uzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; d="scan'208";a="174756872"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2025 23:09:15 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 lucas.demarchi@intel.com, aravind.iddamsetty@linux.intel.com,
 raag.jadav@intel.com, umesh.nerlige.ramappa@intel.com,
 frank.scarbrough@intel.com, sk.anirban@intel.com, simona.vetter@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de
Subject: [PATCH v9 05/10] drm/xe/xe_survivability: Refactor survivability mode
Date: Tue, 26 Aug 2025 12:04:12 +0530
Message-ID: <20250826063419.3022216-6-riana.tauro@intel.com>
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

Refactor survivability mode code to support both boot
and runtime survivability.

Signed-off-by: Riana Tauro <riana.tauro@intel.com>
Reviewed-by: Raag Jadav <raag.jadav@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c                |  2 +-
 drivers/gpu/drm/xe/xe_heci_gsc.c              |  2 +-
 drivers/gpu/drm/xe/xe_pci.c                   |  6 +-
 drivers/gpu/drm/xe/xe_survivability_mode.c    | 93 +++++++++++++------
 drivers/gpu/drm/xe/xe_survivability_mode.h    |  4 +-
 .../gpu/drm/xe/xe_survivability_mode_types.h  |  7 ++
 6 files changed, 81 insertions(+), 33 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 06cc8f72be2b..7a3a3106f8bb 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -739,7 +739,7 @@ int xe_device_probe_early(struct xe_device *xe)
 		 * possible, but still return the previous error for error
 		 * propagation
 		 */
-		err = xe_survivability_mode_enable(xe);
+		err = xe_survivability_mode_boot_enable(xe);
 		if (err)
 			return err;
 
diff --git a/drivers/gpu/drm/xe/xe_heci_gsc.c b/drivers/gpu/drm/xe/xe_heci_gsc.c
index 6d7b62724126..a415ca488791 100644
--- a/drivers/gpu/drm/xe/xe_heci_gsc.c
+++ b/drivers/gpu/drm/xe/xe_heci_gsc.c
@@ -197,7 +197,7 @@ int xe_heci_gsc_init(struct xe_device *xe)
 	if (ret)
 		return ret;
 
-	if (!def->use_polling && !xe_survivability_mode_is_enabled(xe)) {
+	if (!def->use_polling && !xe_survivability_mode_is_boot_enabled(xe)) {
 		ret = heci_gsc_irq_setup(xe);
 		if (ret)
 			return ret;
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 85841442f7d5..524ed0d75a9f 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -785,7 +785,7 @@ static void xe_pci_remove(struct pci_dev *pdev)
 	if (IS_SRIOV_PF(xe))
 		xe_pci_sriov_configure(pdev, 0);
 
-	if (xe_survivability_mode_is_enabled(xe))
+	if (xe_survivability_mode_is_boot_enabled(xe))
 		return;
 
 	xe_device_remove(xe);
@@ -867,7 +867,7 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	 * flashed through mei. Return success, if survivability mode
 	 * is enabled due to pcode failure or configfs being set
 	 */
-	if (xe_survivability_mode_is_enabled(xe))
+	if (xe_survivability_mode_is_boot_enabled(xe))
 		return 0;
 
 	if (err)
@@ -961,7 +961,7 @@ static int xe_pci_suspend(struct device *dev)
 	struct xe_device *xe = pdev_to_xe_device(pdev);
 	int err;
 
-	if (xe_survivability_mode_is_enabled(xe))
+	if (xe_survivability_mode_is_boot_enabled(xe))
 		return -EBUSY;
 
 	err = xe_pm_suspend(xe);
diff --git a/drivers/gpu/drm/xe/xe_survivability_mode.c b/drivers/gpu/drm/xe/xe_survivability_mode.c
index 41705f5d52e3..4a2d1cff65d2 100644
--- a/drivers/gpu/drm/xe/xe_survivability_mode.c
+++ b/drivers/gpu/drm/xe/xe_survivability_mode.c
@@ -121,6 +121,14 @@ static void log_survivability_info(struct pci_dev *pdev)
 	}
 }
 
+static int check_boot_failure(struct xe_device *xe)
+{
+	struct xe_survivability *survivability = &xe->survivability;
+
+	return survivability->boot_status == NON_CRITICAL_FAILURE ||
+		survivability->boot_status == CRITICAL_FAILURE;
+}
+
 static ssize_t survivability_mode_show(struct device *dev,
 				       struct device_attribute *attr, char *buff)
 {
@@ -130,6 +138,11 @@ static ssize_t survivability_mode_show(struct device *dev,
 	struct xe_survivability_info *info = survivability->info;
 	int index = 0, count = 0;
 
+	count += sysfs_emit_at(buff, count, "Survivability mode type: Boot\n");
+
+	if (!check_boot_failure(xe))
+		return count;
+
 	for (index = 0; index < MAX_SCRATCH_MMIO; index++) {
 		if (info[index].reg)
 			count += sysfs_emit_at(buff, count, "%s: 0x%x - 0x%x\n", info[index].name,
@@ -151,12 +164,11 @@ static void xe_survivability_mode_fini(void *arg)
 	sysfs_remove_file(&dev->kobj, &dev_attr_survivability_mode.attr);
 }
 
-static int enable_survivability_mode(struct pci_dev *pdev)
+static int create_survivability_sysfs(struct pci_dev *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct xe_device *xe = pdev_to_xe_device(pdev);
-	struct xe_survivability *survivability = &xe->survivability;
-	int ret = 0;
+	int ret;
 
 	/* create survivability mode sysfs */
 	ret = sysfs_create_file(&dev->kobj, &dev_attr_survivability_mode.attr);
@@ -170,6 +182,20 @@ static int enable_survivability_mode(struct pci_dev *pdev)
 	if (ret)
 		return ret;
 
+	return 0;
+}
+
+static int enable_boot_survivability_mode(struct pci_dev *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct xe_device *xe = pdev_to_xe_device(pdev);
+	struct xe_survivability *survivability = &xe->survivability;
+	int ret = 0;
+
+	ret = create_survivability_sysfs(pdev);
+	if (ret)
+		return ret;
+
 	/* Make sure xe_heci_gsc_init() knows about survivability mode */
 	survivability->mode = true;
 
@@ -192,15 +218,36 @@ static int enable_survivability_mode(struct pci_dev *pdev)
 	return ret;
 }
 
+static int init_survivability_mode(struct xe_device *xe)
+{
+	struct xe_survivability *survivability = &xe->survivability;
+	struct xe_survivability_info *info;
+
+	survivability->size = MAX_SCRATCH_MMIO;
+
+	info = devm_kcalloc(xe->drm.dev, survivability->size, sizeof(*info),
+			    GFP_KERNEL);
+	if (!info)
+		return -ENOMEM;
+
+	survivability->info = info;
+
+	populate_survivability_info(xe);
+
+	return 0;
+}
+
 /**
- * xe_survivability_mode_is_enabled - check if survivability mode is enabled
+ * xe_survivability_mode_is_boot_enabled- check if boot survivability mode is enabled
  * @xe: xe device instance
  *
- * Returns true if in survivability mode, false otherwise
+ * Returns true if in boot survivability mode of type, else false
  */
-bool xe_survivability_mode_is_enabled(struct xe_device *xe)
+bool xe_survivability_mode_is_boot_enabled(struct xe_device *xe)
 {
-	return xe->survivability.mode;
+	struct xe_survivability *survivability = &xe->survivability;
+
+	return survivability->mode && survivability->type == XE_SURVIVABILITY_TYPE_BOOT;
 }
 
 /**
@@ -241,44 +288,38 @@ bool xe_survivability_mode_is_requested(struct xe_device *xe)
 	data = xe_mmio_read32(mmio, PCODE_SCRATCH(0));
 	survivability->boot_status = REG_FIELD_GET(BOOT_STATUS, data);
 
-	return survivability->boot_status == NON_CRITICAL_FAILURE ||
-		survivability->boot_status == CRITICAL_FAILURE;
+	return check_boot_failure(xe);
 }
 
 /**
- * xe_survivability_mode_enable - Initialize and enable the survivability mode
+ * xe_survivability_mode_boot_enable - Initialize and enable boot survivability mode
  * @xe: xe device instance
  *
- * Initialize survivability information and enable survivability mode
+ * Initialize survivability information and enable boot survivability mode
  *
- * Return: 0 if survivability mode is enabled or not requested; negative error
+ * Return: 0 if boot survivability mode is enabled or not requested, negative error
  * code otherwise.
  */
-int xe_survivability_mode_enable(struct xe_device *xe)
+int xe_survivability_mode_boot_enable(struct xe_device *xe)
 {
 	struct xe_survivability *survivability = &xe->survivability;
-	struct xe_survivability_info *info;
 	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
+	int ret;
 
 	if (!xe_survivability_mode_is_requested(xe))
 		return 0;
 
-	survivability->size = MAX_SCRATCH_MMIO;
-
-	info = devm_kcalloc(xe->drm.dev, survivability->size, sizeof(*info),
-			    GFP_KERNEL);
-	if (!info)
-		return -ENOMEM;
-
-	survivability->info = info;
-
-	populate_survivability_info(xe);
+	ret = init_survivability_mode(xe);
+	if (ret)
+		return ret;
 
-	/* Only log debug information and exit if it is a critical failure */
+	/* Log breadcrumbs but do not enter survivability mode for Critical boot errors */
 	if (survivability->boot_status == CRITICAL_FAILURE) {
 		log_survivability_info(pdev);
 		return -ENXIO;
 	}
 
-	return enable_survivability_mode(pdev);
+	survivability->type = XE_SURVIVABILITY_TYPE_BOOT;
+
+	return enable_boot_survivability_mode(pdev);
 }
diff --git a/drivers/gpu/drm/xe/xe_survivability_mode.h b/drivers/gpu/drm/xe/xe_survivability_mode.h
index 02231c2bf008..f6ee283ea5e8 100644
--- a/drivers/gpu/drm/xe/xe_survivability_mode.h
+++ b/drivers/gpu/drm/xe/xe_survivability_mode.h
@@ -10,8 +10,8 @@
 
 struct xe_device;
 
-int xe_survivability_mode_enable(struct xe_device *xe);
-bool xe_survivability_mode_is_enabled(struct xe_device *xe);
+int xe_survivability_mode_boot_enable(struct xe_device *xe);
+bool xe_survivability_mode_is_boot_enabled(struct xe_device *xe);
 bool xe_survivability_mode_is_requested(struct xe_device *xe);
 
 #endif /* _XE_SURVIVABILITY_MODE_H_ */
diff --git a/drivers/gpu/drm/xe/xe_survivability_mode_types.h b/drivers/gpu/drm/xe/xe_survivability_mode_types.h
index 19d433e253df..5dce393498da 100644
--- a/drivers/gpu/drm/xe/xe_survivability_mode_types.h
+++ b/drivers/gpu/drm/xe/xe_survivability_mode_types.h
@@ -9,6 +9,10 @@
 #include <linux/limits.h>
 #include <linux/types.h>
 
+enum xe_survivability_type {
+	XE_SURVIVABILITY_TYPE_BOOT,
+};
+
 struct xe_survivability_info {
 	char name[NAME_MAX];
 	u32 reg;
@@ -30,6 +34,9 @@ struct xe_survivability {
 
 	/** @mode: boolean to indicate survivability mode */
 	bool mode;
+
+	/** @type: survivability type */
+	enum xe_survivability_type type;
 };
 
 #endif /* _XE_SURVIVABILITY_MODE_TYPES_H_ */
-- 
2.47.1

