Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 06721B13881
	for <lists+dri-devel@lfdr.de>; Mon, 28 Jul 2025 12:03:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D1E710E4CC;
	Mon, 28 Jul 2025 10:03:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="M9hVGd5H";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0417110E4BE;
 Mon, 28 Jul 2025 10:03:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753697024; x=1785233024;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Y7o4/YZ4K4E0UecrVtzh7Mq0wWWyhjFI6eHOD1nuc24=;
 b=M9hVGd5HZf8LmHgwuaRqtCgHXss3KGLTxtDOMLSZtuaJpubfcKbEq8pg
 T7uCnZCKzexQnMEvqAmFtRCdBDPHCbx5fmEZa/sHIVvjAL5mtjQJWog3j
 Zdo5Woy22Z6/BZeN2gbbaFqF6j4Wu8AJOCne1LCFni0PaJ1V7ehmMUYRT
 v7RuiU6homFWS2d+BTsnyfmwxyXkExSlx5TUrMRzFxYu/APYCF3uqF6/w
 nCjK1tgAa/YTx8qfU0QTj9tv6LJdHHh+NoKEN3cgTfXetLeDllLLVnbpU
 21k5F2h1i/l9qFDQ8dv2O7L1CMaJjrlhMtFtOXPIefLo48dKiegaGbLPP g==;
X-CSE-ConnectionGUID: ayMWbbH2QkG4/JWzy1eeUw==
X-CSE-MsgGUID: DZBlGFtkTAW1HR99s1qajw==
X-IronPort-AV: E=McAfee;i="6800,10657,11504"; a="55641682"
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; d="scan'208";a="55641682"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2025 03:03:43 -0700
X-CSE-ConnectionGUID: 0tU/cpLxTuqc/UZv+dKvhQ==
X-CSE-MsgGUID: crZJHKd7TY+PaueS2TdZjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; d="scan'208";a="162739505"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2025 03:03:40 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 lucas.demarchi@intel.com, aravind.iddamsetty@linux.intel.com,
 raag.jadav@intel.com, umesh.nerlige.ramappa@intel.com,
 frank.scarbrough@intel.com, sk.anirban@intel.com, simona.vetter@ffwll.ch
Subject: [PATCH v7 6/9] drm/xe/doc: Document device wedged and runtime
 survivability
Date: Mon, 28 Jul 2025 15:57:56 +0530
Message-ID: <20250728102809.502324-7-riana.tauro@intel.com>
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

Add documentation for vendor specific device wedged recovery method
and runtime survivability.

v2: fix documentation (Raag)
v3: add userspace tool for firmware update (Raag)
v4: use consistent documentation (Raag)

Signed-off-by: Riana Tauro <riana.tauro@intel.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Reviewed-by: Raag Jadav <raag.jadav@intel.com>
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
index df29b87ffc5f..09a0941749b6 100644
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
+ *         like fwupd to restore device to normal operation.
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

