Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02AFCB353D1
	for <lists+dri-devel@lfdr.de>; Tue, 26 Aug 2025 08:09:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DA4410E544;
	Tue, 26 Aug 2025 06:09:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="J3W53Pyf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70E9189D5C;
 Tue, 26 Aug 2025 06:09:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756188542; x=1787724542;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Au5T4GRna4OG1YpFOPfA6hs6gR3ChRBcQZ0C5hBo6GA=;
 b=J3W53PyfoH83wKyAM8M3xhPIPX1adDrV9BRX2nSLj5aecExulD2isXQd
 QSzW7+AmGgeq2r9XBxa+pkt3DEdolKQksoJRgDJ9r6axESq5hdorbshsB
 oq2gvXylYyrLhd0mXm5TwRDSNS5SqiyVxUIoog+Zc6BTAFxS4Cq0Rixlv
 JtQeQrYQ5LqDsmHurdl0uJDSsWlvCdYELgrOEnK8qry91EK3n6pGvBUVR
 f9Fzn8nP1AH9V/739HW3CWhA+wgdoBpK684Z3iqLRBzy/7z+FiXwWN8ew
 WYGkGvKNwnfR6oSYg6MfMABhBqPs+GjDv3DpVReXOEBsPvr6E+6aZyBMI A==;
X-CSE-ConnectionGUID: 7MtaVu76SNuVzKgDGEOKow==
X-CSE-MsgGUID: NXheKVVkRy6yZmqtXuPYjg==
X-IronPort-AV: E=McAfee;i="6800,10657,11533"; a="58271966"
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; d="scan'208";a="58271966"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2025 23:09:02 -0700
X-CSE-ConnectionGUID: dKszJI4sTGWsJhqaIb8OBg==
X-CSE-MsgGUID: fvlI0aHLRUmRoiZWxKYQkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; d="scan'208";a="174756739"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2025 23:08:56 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 lucas.demarchi@intel.com, aravind.iddamsetty@linux.intel.com,
 raag.jadav@intel.com, umesh.nerlige.ramappa@intel.com,
 frank.scarbrough@intel.com, sk.anirban@intel.com, simona.vetter@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>
Subject: [PATCH v9 02/10] drm: Add a vendor-specific recovery method to drm
 device wedged uevent
Date: Tue, 26 Aug 2025 12:04:09 +0530
Message-ID: <20250826063419.3022216-3-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250826063419.3022216-1-riana.tauro@intel.com>
References: <20250826063419.3022216-1-riana.tauro@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Address the need for a recovery method (firmware flash on Firmware errors)
introduced in the later patches of Xe KMD.
Whenever XE KMD detects a firmware error, a firmware flash is required to
recover the device to normal operation.

The initial proposal to use 'firmware-flash' as a recovery method was
not applicable to other drivers and could cause multiple recovery
methods specific to vendors to be added.
To address this a more generic 'vendor-specific' method is introduced,
guiding users to refer to vendor specific documentation and system logs
for detailed vendor specific recovery procedure.

Add a recovery method 'WEDGED=vendor-specific' for such errors.
Vendors must provide additional recovery documentation if this method
is used.

It is the responsibility of the consumer to refer to the correct vendor
specific documentation and usecase before attempting a recovery.

For example: If driver is XE KMD, the consumer must refer
to the documentation of 'Device Wedging' under 'Documentation/gpu/xe/'.

v2: fix documentation (Raag)
v3: add more details to commit message (Sima, Rodrigo, Raag)
    add an example script to the documentation (Raag)
v4: use consistent naming (Raag)
v5: fix commit message
v6: add more documentation

Cc: André Almeida <andrealmeid@igalia.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: David Airlie <airlied@gmail.com>
Cc: Simona Vetter <simona.vetter@ffwll.ch>
Cc: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Riana Tauro <riana.tauro@intel.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Acked-by: Maxime Ripard <mripard@kernel.org>
---
 Documentation/gpu/drm-uapi.rst | 49 ++++++++++++++++++++++++++++------
 drivers/gpu/drm/drm_drv.c      |  2 ++
 include/drm/drm_device.h       |  4 +++
 3 files changed, 47 insertions(+), 8 deletions(-)

diff --git a/Documentation/gpu/drm-uapi.rst b/Documentation/gpu/drm-uapi.rst
index 843facf01b2d..8af88feed80c 100644
--- a/Documentation/gpu/drm-uapi.rst
+++ b/Documentation/gpu/drm-uapi.rst
@@ -418,13 +418,12 @@ needed.
 Recovery
 --------
 
-Current implementation defines three recovery methods, out of which, drivers
+Current implementation defines four recovery methods, out of which, drivers
 can use any one, multiple or none. Method(s) of choice will be sent in the
 uevent environment as ``WEDGED=<method1>[,..,<methodN>]`` in order of less to
-more side-effects. If driver is unsure about recovery or method is unknown
-(like soft/hard system reboot, firmware flashing, physical device replacement
-or any other procedure which can't be attempted on the fly), ``WEDGED=unknown``
-will be sent instead.
+more side-effects. See the section `Vendor Specific Recovery`_
+for ``WEDGED=vendor-specific``. If driver is unsure about recovery or
+method is unknown, ``WEDGED=unknown`` will be sent instead.
 
 Userspace consumers can parse this event and attempt recovery as per the
 following expectations.
@@ -435,6 +434,7 @@ following expectations.
     none            optional telemetry collection
     rebind          unbind + bind driver
     bus-reset       unbind + bus reset/re-enumeration + bind
+    vendor-specific vendor specific recovery method
     unknown         consumer policy
     =============== ========================================
 
@@ -446,6 +446,35 @@ telemetry information (devcoredump, syslog). This is useful because the first
 hang is usually the most critical one which can result in consequential hangs or
 complete wedging.
 
+
+Vendor Specific Recovery
+------------------------
+
+When ``WEDGED=vendor-specific`` is sent, it indicates that the device requires
+a recovery procedure specific to the hardware vendor and is not one of the
+standardized approaches.
+
+``WEDGED=vendor-specific`` may be used to indicate different cases within a
+single vendor driver, each requiring a distinct recovery procedure.
+In such scenarios, the vendor driver must provide comprehensive documentation
+that describes each case, include additional hints to identify specific case and
+outline the corresponding recovery procedure. The documentation includes:
+
+Case - A list of all cases that sends the ``WEDGED=vendor-specific`` recovery method.
+
+Hints - Additional Information to assist the userspace consumer in identifying and
+differentiating between different cases. This can be exposed through sysfs, debugfs,
+traces, dmesg etc.
+
+Recovery Procedure - Clear instructions and guidance for recovering each case.
+This may include userspace scripts, tools needed for the recovery procedure.
+
+It is the responsibility of the admin/userspace consumer to identify the case and
+verify additional identification hints before attempting a recovery procedure.
+
+Example: If the device uses the Xe driver, then userspace consumer should refer to
+:ref:`Xe Device Wedging <xe-device-wedging>` for the detailed documentation.
+
 Task information
 ----------------
 
@@ -472,8 +501,12 @@ erroring out, all device memory should be unmapped and file descriptors should
 be closed to prevent leaks or undefined behaviour. The idea here is to clear the
 device of all user context beforehand and set the stage for a clean recovery.
 
-Example
--------
+For ``WEDGED=vendor-specific`` recovery method, it is the responsibility of the
+consumer to check the driver documentation and the usecase before attempting
+a recovery.
+
+Example - rebind
+----------------
 
 Udev rule::
 
diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
index cdd591b11488..0ac723a46a91 100644
--- a/drivers/gpu/drm/drm_drv.c
+++ b/drivers/gpu/drm/drm_drv.c
@@ -532,6 +532,8 @@ static const char *drm_get_wedge_recovery(unsigned int opt)
 		return "rebind";
 	case DRM_WEDGE_RECOVERY_BUS_RESET:
 		return "bus-reset";
+	case DRM_WEDGE_RECOVERY_VENDOR:
+		return "vendor-specific";
 	default:
 		return NULL;
 	}
diff --git a/include/drm/drm_device.h b/include/drm/drm_device.h
index a33aedd5e9ec..59fd3f4d5995 100644
--- a/include/drm/drm_device.h
+++ b/include/drm/drm_device.h
@@ -26,10 +26,14 @@ struct pci_controller;
  * Recovery methods for wedged device in order of less to more side-effects.
  * To be used with drm_dev_wedged_event() as recovery @method. Callers can
  * use any one, multiple (or'd) or none depending on their needs.
+ *
+ * Refer to "Device Wedging" chapter in Documentation/gpu/drm-uapi.rst for more
+ * details.
  */
 #define DRM_WEDGE_RECOVERY_NONE		BIT(0)	/* optional telemetry collection */
 #define DRM_WEDGE_RECOVERY_REBIND	BIT(1)	/* unbind + bind driver */
 #define DRM_WEDGE_RECOVERY_BUS_RESET	BIT(2)	/* unbind + reset bus device + bind */
+#define DRM_WEDGE_RECOVERY_VENDOR	BIT(3)	/* vendor specific recovery method */
 
 /**
  * struct drm_wedge_task_info - information about the guilty task of a wedge dev
-- 
2.47.1

