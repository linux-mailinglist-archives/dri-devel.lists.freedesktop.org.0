Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14201B10CBB
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jul 2025 16:09:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AEFE10E951;
	Thu, 24 Jul 2025 14:09:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AuKC9Db7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B98D510E953;
 Thu, 24 Jul 2025 14:09:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753366177; x=1784902177;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=i450byNVERrLqoU1VxsBljWeil7tFU8TuoY388Zw4yI=;
 b=AuKC9Db78CzT0Izzs8r/M7sxG1ohblyz7K3Jgom1tTDAdk7cfStp1c3g
 vTafy27FtGy5YBXoko0d1trF/p3oHb7LicDhHot+sIAyilnVAcnhMkIOX
 CuXgRo0OnO63rVS97gynsJj9DkVZVj5G0L6EkMioITY4b5rDhFabg2okR
 YtmwhMj2U623dSq3KH/N87CeCRx3rhUvy2WnAxfv0KfOpDyau+usHI4pb
 TakE+gQe/3aBzO9ezD8Kanu+/mvOUVwS/jocN2fyHkb6dU7SKbflMlY/a
 6zNZn5t+RPRokqc5Zm/0ea5KEi/IMBFGyNuG5Cn3c5Vvagir+GXa3hmzY g==;
X-CSE-ConnectionGUID: fqKzNIAPSk+a6uVqFE962A==
X-CSE-MsgGUID: 2iOXQzZtTNmuq7e0t1mkvA==
X-IronPort-AV: E=McAfee;i="6800,10657,11501"; a="73145915"
X-IronPort-AV: E=Sophos;i="6.16,337,1744095600"; d="scan'208";a="73145915"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2025 07:09:37 -0700
X-CSE-ConnectionGUID: MIlMWhBoRT+convNtLMIEQ==
X-CSE-MsgGUID: eYZfmzNiRNKpUKeWyX4+Ow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,337,1744095600"; d="scan'208";a="160010880"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2025 07:09:34 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 lucas.demarchi@intel.com, aravind.iddamsetty@linux.intel.com,
 raag.jadav@intel.com, umesh.nerlige.ramappa@intel.com,
 frank.scarbrough@intel.com, sk.anirban@intel.com, simona.vetter@ffwll.ch,
 =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>
Subject: [PATCH v6 1/9] drm: Add a vendor-specific recovery method to drm
 device wedged uevent
Date: Thu, 24 Jul 2025 20:04:30 +0530
Message-ID: <20250724143440.232862-2-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250724143440.232862-1-riana.tauro@intel.com>
References: <20250724143440.232862-1-riana.tauro@intel.com>
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

This patch addresses the need for a recovery method (firmware flash
on Firmware errors) introduced in the later patches of Xe KMD. Whenever
XE KMD detects a firmware error, a drm device wedged uevent needs to be sent
to the system administrator/userspace to trigger a firmware flash.

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

Recovery script contributed by Raag.

v2: fix documentation (Raag)
v3: add more details to commit message (Sima, Rodrigo, Raag)
    add an example script to the documentation (Raag)
v4: use consistent naming (Raag)

Cc: André Almeida <andrealmeid@igalia.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: David Airlie <airlied@gmail.com>
Co-developed-by: Raag Jadav <raag.jadav@intel.com>
Signed-off-by: Raag Jadav <raag.jadav@intel.com>
Signed-off-by: Riana Tauro <riana.tauro@intel.com>
---
 Documentation/gpu/drm-uapi.rst | 42 ++++++++++++++++++++++++++++------
 drivers/gpu/drm/drm_drv.c      |  2 ++
 include/drm/drm_device.h       |  4 ++++
 3 files changed, 41 insertions(+), 7 deletions(-)

diff --git a/Documentation/gpu/drm-uapi.rst b/Documentation/gpu/drm-uapi.rst
index 843facf01b2d..5691b29acde3 100644
--- a/Documentation/gpu/drm-uapi.rst
+++ b/Documentation/gpu/drm-uapi.rst
@@ -418,13 +418,15 @@ needed.
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
+more side-effects. If recovery method is specific to vendor
+``WEDGED=vendor-specific`` will be sent and userspace should refer to vendor
+specific documentation for the recovery procedure. As an example if the driver
+is 'Xe' then the documentation for 'Device Wedging' of Xe driver needs to be
+referred for the recovery procedure. If driver is unsure about recovery or
+method is unknown, ``WEDGED=unknown`` will be sent instead.
 
 Userspace consumers can parse this event and attempt recovery as per the
 following expectations.
@@ -435,6 +437,7 @@ following expectations.
     none            optional telemetry collection
     rebind          unbind + bind driver
     bus-reset       unbind + bus reset/re-enumeration + bind
+    vendor-specific vendor specific recovery method
     unknown         consumer policy
     =============== ========================================
 
@@ -472,8 +475,12 @@ erroring out, all device memory should be unmapped and file descriptors should
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
 
@@ -491,6 +498,27 @@ Recovery script::
     echo -n $DEVICE > $DRIVER/unbind
     echo -n $DEVICE > $DRIVER/bind
 
+Example - vendor-specific
+-------------------------
+
+Udev rule::
+
+    SUBSYSTEM=="drm", ENV{WEDGED}=="vendor-specific", DEVPATH=="*/drm/card[0-9]",
+    RUN+="/path/to/vendor_specific_recovery.sh $env{DEVPATH}"
+
+Recovery script::
+
+    #!/bin/sh
+
+    DEVPATH=$(readlink -f /sys/$1/device)
+    DRIVERPATH=$(readlink -f $DEVPATH/driver)
+    DRIVER=$(basename $DRIVERPATH)
+
+    if [ "$DRIVER" = "xe" ]; then
+        # Refer XE documentation and check usecase and recovery procedure
+    fi
+
+
 Customization
 -------------
 
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

