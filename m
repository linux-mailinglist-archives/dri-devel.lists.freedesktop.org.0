Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4AF5B264A6
	for <lists+dri-devel@lfdr.de>; Thu, 14 Aug 2025 13:50:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BEF510E873;
	Thu, 14 Aug 2025 11:50:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ll7DK1Kk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFD9210E875;
 Thu, 14 Aug 2025 11:50:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755172203; x=1786708203;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=lF4LHf6mDUU7ek5IpKnLqnVFIVzMeGWh+Nrz+r0lfqo=;
 b=ll7DK1Kk0eHP/8lVsYJMjJvOxmkIP36RfIGqTASiX3847Va8x3eBrg3/
 +rn7HLc19eVAEABw2x4ivNxYrrITjpqGsV4RoxH+1bm04FQlPk86ZXKiE
 SleqA6rVEOMCb1J85LT9Up5kPnkwhQkd63CWh59MrnD03UOslIjWdkaNY
 DJ2nXJXQZeiycC0e48EUym14j+lC27HJrZlDwExTzcVOdO2iGiJtlWUzM
 LcIgt8tk7lZtJF4gfeebbMejIBKaVIYBVEaWYGSTZBF3NBKsaWTgConwl
 KnynTyicL0x6YqfSccXvMM0imafXLebb0oxxJQw46JWjkv9EnO+XrjE3U w==;
X-CSE-ConnectionGUID: Y032ramGRtSs1pYjY/24xA==
X-CSE-MsgGUID: 2ok3JPjxQw2IvVjkTNJItQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11520"; a="57388515"
X-IronPort-AV: E=Sophos;i="6.17,287,1747724400"; d="scan'208";a="57388515"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2025 04:50:02 -0700
X-CSE-ConnectionGUID: wneVta91TbO6HbQq7IcgXA==
X-CSE-MsgGUID: hKdB9mFvTvO458z6cM/rVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,287,1747724400"; d="scan'208";a="171967203"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2025 04:49:57 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 lucas.demarchi@intel.com, aravind.iddamsetty@linux.intel.com,
 raag.jadav@intel.com, umesh.nerlige.ramappa@intel.com,
 frank.scarbrough@intel.com, sk.anirban@intel.com, simona.vetter@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de
Subject: [PATCH v8 07/10] drm/xe/doc: Document device wedged and runtime
 survivability
Date: Thu, 14 Aug 2025 17:44:37 +0530
Message-ID: <20250814121448.3380784-8-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250814121448.3380784-1-riana.tauro@intel.com>
References: <20250814121448.3380784-1-riana.tauro@intel.com>
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
index c413323fb696..6bd296ea2476 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -1165,6 +1165,33 @@ static void xe_device_wedged_fini(struct drm_device *drm, void *arg)
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

