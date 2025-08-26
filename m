Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4580CB353DB
	for <lists+dri-devel@lfdr.de>; Tue, 26 Aug 2025 08:09:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F3CF10E5CA;
	Tue, 26 Aug 2025 06:09:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iMMN/riv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADE0D10E5C5;
 Tue, 26 Aug 2025 06:09:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756188571; x=1787724571;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Pp+U19HErVcnWX/2a6FMc//Uocol6EpUgWV8d67xCHI=;
 b=iMMN/rivh0Ut85QOKthcMXj0sdSfgInxSCjwQR979YBuQUvoiPD7ZFy0
 nGUyISbhekm0U5JIGXbrq+Lc8mY9xWCSZhI4yv1+VoVWsRep7hsIHRGmE
 uiSLxVJp7RIYehFZzWj0+AoMEDNCIqjcG9CvqF4DX6Lv64h4u+EwSy1cF
 vY4Y33NlqiG4k/N3WhMae69o3AAfUbdVLbWycCgmBXRpLjOWPhaaQwIMF
 FSNHzP2j2qmMVdtLf2PQLWry2niAx8ItZZ1HAS7nsI06az/kt5h4gDhBl
 OoVCl/1AqOtJw8Xx3KSjtROk/YvVIKn7QIFnpvRavkH3qTiYUCwcBog+g g==;
X-CSE-ConnectionGUID: 7r5sYYtZSXGQBnlJAeR6wg==
X-CSE-MsgGUID: 3grUV2o3SXuESZbMN5kSaQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11533"; a="58272041"
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; d="scan'208";a="58272041"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2025 23:09:30 -0700
X-CSE-ConnectionGUID: KEYULLcLQ/S4VeNJElmwzA==
X-CSE-MsgGUID: G5h7CnC9Q0CTtNcumizkOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; d="scan'208";a="174756879"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2025 23:09:26 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 lucas.demarchi@intel.com, aravind.iddamsetty@linux.intel.com,
 raag.jadav@intel.com, umesh.nerlige.ramappa@intel.com,
 frank.scarbrough@intel.com, sk.anirban@intel.com, simona.vetter@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de
Subject: [PATCH v9 07/10] drm/xe/doc: Document device wedged and runtime
 survivability
Date: Tue, 26 Aug 2025 12:04:14 +0530
Message-ID: <20250826063419.3022216-8-riana.tauro@intel.com>
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

Add documentation for vendor specific device wedged recovery method
and runtime survivability.

v2: fix documentation (Raag)
v3: add userspace tool for firmware update (Raag)
v4: use consistent documentation (Raag)
v5: add more documentation

Signed-off-by: Riana Tauro <riana.tauro@intel.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Reviewed-by: Raag Jadav <raag.jadav@intel.com>
---
 Documentation/gpu/xe/xe_pcode.rst          |  6 ++--
 drivers/gpu/drm/xe/xe_device.c             | 27 +++++++++++++++++
 drivers/gpu/drm/xe/xe_survivability_mode.c | 35 +++++++++++++++++-----
 3 files changed, 58 insertions(+), 10 deletions(-)

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
index 7a3a3106f8bb..3bf086ec2fdb 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -1170,6 +1170,33 @@ static void xe_device_wedged_fini(struct drm_device *drm, void *arg)
  * used. Certain critical errors like gt reset failure, firmware failures can cause
  * the device to be wedged. The default recovery method for a wedged state
  * is rebind/bus-reset.
+ *
+ * Another recovery method is vendor-specific. Below are the cases that send
+ * ``WEDGED=vendor-specific`` recovery method in drm device wedged uevent.
+ *
+ * Case: Firmware Flash
+ * --------------------
+ *
+ * Identification Hint
+ * +++++++++++++++++++
+ *
+ * ``WEDGED=vendor-specific`` drm device wedged uevent with
+ * :ref:`Runtime Survivability mode <xe-survivability-mode>` is used to notify
+ * admin/userspace consumer about the need for a firmware flash.
+ *
+ * Recovery Procedure
+ * ++++++++++++++++++
+ *
+ * Once ``WEDGED=vendor-specific`` drm device wedged uevent is received, follow
+ * the below steps
+ *
+ * - Check Runtime Survivability mode sysfs.
+ *   If enabled, firmware flash is required to recover the device.
+ *
+ *   /sys/bus/pci/devices/<device>/survivability_mode
+ *
+ * - Admin/userpsace consumer can use firmware flashing tools like fwupd to flash
+ *   firmware and restore device to normal operation.
  */
 
 /**
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

