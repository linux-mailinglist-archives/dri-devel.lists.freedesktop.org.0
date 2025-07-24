Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E4B60B10CC6
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jul 2025 16:10:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5720E10E967;
	Thu, 24 Jul 2025 14:10:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mlFY5ixs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E6DA10E967;
 Thu, 24 Jul 2025 14:10:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753366215; x=1784902215;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=oCwhigJcIyDrYTYReNbsElCX1xqccnyZ6CuFLymWgLQ=;
 b=mlFY5ixsd2cjgyAk9YzSJ43pR2v4CaOF4jOxjrmEh//hRY3JYX9O2WHo
 KKbtTnYh9b9OwwAfKyAx2EX/KGdbTsXWfnnjbj77x7YcTrfJSgemiiuXE
 r2jC89DEj+5MaQprQ1ho0ZPAufpyVhDPlnCSv103uJ9gFxn50Q+PpHMUd
 YKbMnFolUPLgC/oi4I43y3cSA2dAHwDyiaTQjRIgMUQiQL1/fMd31zZx/
 TnmQdvDUxe5Af7w1HGQCUMjhPSSUGDk3+0EXB6zZXdZFVIQI3g+MS2WD/
 /9YldaPOswLJvcvTyRnwE+eKTpAhgMgC3hldJORjqR/tEQxXEaC9rVTLb A==;
X-CSE-ConnectionGUID: VQKuNaDbSHKhJgvlxAj5Zw==
X-CSE-MsgGUID: fM6rXtMcQpeLPxTjWt9oWg==
X-IronPort-AV: E=McAfee;i="6800,10657,11501"; a="73145988"
X-IronPort-AV: E=Sophos;i="6.16,337,1744095600"; d="scan'208";a="73145988"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2025 07:10:15 -0700
X-CSE-ConnectionGUID: ILhnSlZ3Rg2joEbiohAzsQ==
X-CSE-MsgGUID: AazBnfUfT+qqH5NhCOKsQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,337,1744095600"; d="scan'208";a="160010930"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2025 07:10:12 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 lucas.demarchi@intel.com, aravind.iddamsetty@linux.intel.com,
 raag.jadav@intel.com, umesh.nerlige.ramappa@intel.com,
 frank.scarbrough@intel.com, sk.anirban@intel.com, simona.vetter@ffwll.ch
Subject: [PATCH v6 6/9] drm/xe/doc: Document device wedged and runtime
 survivability
Date: Thu, 24 Jul 2025 20:04:35 +0530
Message-ID: <20250724143440.232862-7-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250724143440.232862-1-riana.tauro@intel.com>
References: <20250724143440.232862-1-riana.tauro@intel.com>
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

Add documentation for vendor specific device wedged recovery method
and runtime survivability.

v2: fix documentation (Raag)
v3: add userspace tool for firmware update (Raag)
v4: use consistent documentation (Raag)

Signed-off-by: Riana Tauro <riana.tauro@intel.com>
---
 Documentation/gpu/xe/index.rst             |  1 +
 Documentation/gpu/xe/xe_device.rst         | 10 +++++++
 Documentation/gpu/xe/xe_pcode.rst          |  6 ++--
 drivers/gpu/drm/xe/xe_device.c             | 22 ++++++++++++++
 drivers/gpu/drm/xe/xe_survivability_mode.c | 35 +++++++++++++++++-----
 5 files changed, 64 insertions(+), 10 deletions(-)
 create mode 100644 Documentation/gpu/xe/xe_device.rst

diff --git a/Documentation/gpu/xe/index.rst b/Documentation/gpu/xe/index.rst
index 42ba6c263cd0..88b22fad880e 100644
--- a/Documentation/gpu/xe/index.rst
+++ b/Documentation/gpu/xe/index.rst
@@ -25,5 +25,6 @@ DG2, etc is provided to prototype the driver.
    xe_tile
    xe_debugging
    xe_devcoredump
+   xe_device
    xe-drm-usage-stats.rst
    xe_configfs
diff --git a/Documentation/gpu/xe/xe_device.rst b/Documentation/gpu/xe/xe_device.rst
new file mode 100644
index 000000000000..39a937b97cd3
--- /dev/null
+++ b/Documentation/gpu/xe/xe_device.rst
@@ -0,0 +1,10 @@
+.. SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+
+.. _xe-device-wedging:
+
+==================
+Xe Device Wedging
+==================
+
+.. kernel-doc:: drivers/gpu/drm/xe/xe_device.c
+   :doc: Xe Device Wedging
diff --git a/Documentation/gpu/xe/xe_pcode.rst b/Documentation/gpu/xe/xe_pcode.rst
index 5937ef3599b0..2a43601123cb 100644
--- a/Documentation/gpu/xe/xe_pcode.rst
+++ b/Documentation/gpu/xe/xe_pcode.rst
@@ -13,9 +13,11 @@ Internal API
 .. kernel-doc:: drivers/gpu/drm/xe/xe_pcode.c
    :internal:
 
+.. _xe-survivability-mode:
+
 ==================
-Boot Survivability
+Survivability Mode
 ==================
 
 .. kernel-doc:: drivers/gpu/drm/xe/xe_survivability_mode.c
-   :doc: Xe Boot Survivability
+   :doc: Survivability Mode
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index df29b87ffc5f..4a34b15f9527 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -1157,6 +1157,28 @@ static void xe_device_wedged_fini(struct drm_device *drm, void *arg)
 }
 
 /**
+ * DOC: Xe Device Wedging
+ *
+ * Xe driver uses drm device wedged uevent as documented in Documentation/gpu/drm-uapi.rst.
+ *
+ * When device is in wedged state, every IOCTL will be blocked and GT cannot be
+ * used. Certain critical errors like gt reset failure, firmware failures can cause
+ * the device to be wedged. The default recovery method for a wedged state
+ * is rebind/bus-reset.
+ *
+ * Another recovery method is vendor-specific. Below are the usecases that trigger
+ * vendor-specific drm device wedged uevent and the procedure to be performed
+ * to recover the device.
+ *
+ * Case 1: CSC firmware errors require a firmware flash to restore normal device
+ *         operation. Since firmware flash is a vendor-specific action
+ *         ``WEDGED=vendor-specific`` recovery method along with
+ *         :ref:`runtime survivability mode <xe-survivability-mode>` is used to
+ *         notify userspace. User can then initiate a firmware flash using userspace tools
+ *         like fwupd to restore device to normal situation.
+ */
+
+/*
  * xe_device_set_wedged_method - Set wedged recovery method
  * @xe: xe device instance
  * @method: recovery method to set
diff --git a/drivers/gpu/drm/xe/xe_survivability_mode.c b/drivers/gpu/drm/xe/xe_survivability_mode.c
index 267d0e3fd85a..86ba767c4e44 100644
--- a/drivers/gpu/drm/xe/xe_survivability_mode.c
+++ b/drivers/gpu/drm/xe/xe_survivability_mode.c
@@ -22,15 +22,18 @@
 #define MAX_SCRATCH_MMIO 8
 
 /**
- * DOC: Xe Boot Survivability
+ * DOC: Survivability Mode
  *
- * Boot Survivability is a software based workflow for recovering a system in a failed boot state
+ * Survivability Mode is a software based workflow for recovering a system in a failed boot state
  * Here system recoverability is concerned with recovering the firmware responsible for boot.
  *
- * This is implemented by loading the driver with bare minimum (no drm card) to allow the firmware
- * to be flashed through mei and collect telemetry. The driver's probe flow is modified
- * such that it enters survivability mode when pcode initialization is incomplete and boot status
- * denotes a failure.
+ * Boot Survivability
+ * ===================
+ *
+ * Boot Survivability is implemented by loading the driver with bare minimum (no drm card) to allow
+ * the firmware to be flashed through mei driver and collect telemetry. The driver's probe flow is
+ * modified such that it enters survivability mode when pcode initialization is incomplete and boot
+ * status denotes a failure.
  *
  * Survivability mode can also be entered manually using the survivability mode attribute available
  * through configfs which is beneficial in several usecases. It can be used to address scenarios
@@ -46,7 +49,7 @@
  * Survivability mode is indicated by the below admin-only readable sysfs which provides additional
  * debug information::
  *
- *	/sys/bus/pci/devices/<device>/surivability_mode
+ *	/sys/bus/pci/devices/<device>/survivability_mode
  *
  * Capability Information:
  *	Provides boot status
@@ -56,6 +59,22 @@
  *	Provides history of previous failures
  * Auxiliary Information
  *	Certain failures may have information in addition to postcode information
+ *
+ * Runtime Survivability
+ * =====================
+ *
+ * Certain runtime firmware errors can cause the device to enter a wedged state
+ * (:ref:`xe-device-wedging`) requiring a firmware flash to restore normal operation.
+ * Runtime Survivability Mode indicates that a firmware flash is necessary to recover the device and
+ * is indicated by the presence of survivability mode sysfs::
+ *
+ *	/sys/bus/pci/devices/<device>/survivability_mode
+ *
+ * Survivability mode sysfs provides information about the type of survivability mode.
+ *
+ * When such errors occur, userspace is notified with the drm device wedged uevent and runtime
+ * survivability mode. User can then initiate a firmware flash using userspace tools like fwupd
+ * to restore device to normal operation.
  */
 
 static u32 aux_history_offset(u32 reg_value)
@@ -327,7 +346,7 @@ int xe_survivability_mode_runtime_enable(struct xe_device *xe)
 
 	xe_device_set_wedged_method(xe, DRM_WEDGE_RECOVERY_VENDOR);
 	xe_device_declare_wedged(xe);
-	dev_err(&pdev->dev, "Firmware update required, Refer the userspace documentation for more details!\n");
+	dev_err(&pdev->dev, "Firmware flash required, Refer the userspace documentation for more details!\n");
 
 	return 0;
 }
-- 
2.47.1

