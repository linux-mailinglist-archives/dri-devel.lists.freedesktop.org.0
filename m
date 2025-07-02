Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D83E4AF59E8
	for <lists+dri-devel@lfdr.de>; Wed,  2 Jul 2025 15:46:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 149A510E702;
	Wed,  2 Jul 2025 13:46:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ML87Zvhl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D55F10E242;
 Wed,  2 Jul 2025 13:46:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751464005; x=1783000005;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4ZwgBBe8A7kkBdfCIMHlG41Lc626+r6HSOcOum4l/zI=;
 b=ML87ZvhlmYujcnfZ2Ehjd+y/sGBx9205Fv2wVkLciffZL2H09Xc6lJHr
 T1bNMNKdqFfR3v1I+OBJHkNyxtGerYwy8nS2wqi8Z1bi4D9kDSwT5Nc7f
 r4MqcpM1MOz7aN7XnzI61uhaiqfidun7TuJxwtJlsq50euSbeXwMDmXjv
 sdcEQ8vak41ZT4iM39vtqZ/PT/YP5LNocp7WxkmJIWqUHkrhSD3BXjqDx
 dNk2kmWifcP/o9L4OZAzLyHn7UzsaK0fdSdl4XG2hT0rFmDshDj9fPIK+
 lCfMtaf0DbbMePrhALmQcYP+wsOWUMZFxDioCb+MSED+VjCKYg8rgGf6t w==;
X-CSE-ConnectionGUID: 9GAp818jRtmVbjQ/POaNRQ==
X-CSE-MsgGUID: FS/Od/1qT/2Mjd4ZvjNtAw==
X-IronPort-AV: E=McAfee;i="6800,10657,11482"; a="71186051"
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; d="scan'208";a="71186051"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2025 06:46:44 -0700
X-CSE-ConnectionGUID: iK3QLsonTZmW0ROAg8ciog==
X-CSE-MsgGUID: Yz+IjZ4LS6O7ptkDV2Rwbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; d="scan'208";a="177755968"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2025 06:46:40 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 lucas.demarchi@intel.com, aravind.iddamsetty@linux.intel.com,
 raag.jadav@intel.com, umesh.nerlige.ramappa@intel.com,
 frank.scarbrough@intel.com, sk.anirban@intel.com,
 =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org
Subject: [PATCH v3 1/7] drm: Add a vendor-specific recovery method to device
 wedged uevent
Date: Wed,  2 Jul 2025 19:41:11 +0530
Message-ID: <20250702141118.3564242-2-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250702141118.3564242-1-riana.tauro@intel.com>
References: <20250702141118.3564242-1-riana.tauro@intel.com>
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

Certain errors can cause the device to be wedged and may
require a vendor specific recovery method to restore normal
operation.

Add a recovery method 'WEDGED=vendor-specific' for such errors. Vendors
must provide additional recovery documentation if this method
is used.

Cc: André Almeida <andrealmeid@igalia.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: David Airlie <airlied@gmail.com>
Cc: <dri-devel@lists.freedesktop.org>
Suggested-by: Raag Jadav <raag.jadav@intel.com>
Signed-off-by: Riana Tauro <riana.tauro@intel.com>
---
 Documentation/gpu/drm-uapi.rst | 5 ++++-
 drivers/gpu/drm/drm_drv.c      | 2 ++
 include/drm/drm_device.h       | 4 ++++
 3 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/Documentation/gpu/drm-uapi.rst b/Documentation/gpu/drm-uapi.rst
index 263e5a97c080..1ea835a3fc66 100644
--- a/Documentation/gpu/drm-uapi.rst
+++ b/Documentation/gpu/drm-uapi.rst
@@ -424,7 +424,9 @@ uevent environment as ``WEDGED=<method1>[,..,<methodN>]`` in order of less to
 more side-effects. If driver is unsure about recovery or method is unknown
 (like soft/hard system reboot, firmware flashing, physical device replacement
 or any other procedure which can't be attempted on the fly), ``WEDGED=unknown``
-will be sent instead.
+will be sent instead. If recovery method is specific to vendor
+``WEDGED=vendor-specific`` will be sent and userspace should refer to vendor
+specific documentation for further recovery steps.
 
 Userspace consumers can parse this event and attempt recovery as per the
 following expectations.
@@ -435,6 +437,7 @@ following expectations.
     none            optional telemetry collection
     rebind          unbind + bind driver
     bus-reset       unbind + bus reset/re-enumeration + bind
+    vendor-specific vendor specific recovery method
     unknown         consumer policy
     =============== ========================================
 
diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
index 02556363e918..c72e5c67479d 100644
--- a/drivers/gpu/drm/drm_drv.c
+++ b/drivers/gpu/drm/drm_drv.c
@@ -535,6 +535,8 @@ static const char *drm_get_wedge_recovery(unsigned int opt)
 		return "rebind";
 	case DRM_WEDGE_RECOVERY_BUS_RESET:
 		return "bus-reset";
+	case DRM_WEDGE_RECOVERY_VENDOR:
+		return "vendor-specific";
 	default:
 		return NULL;
 	}
diff --git a/include/drm/drm_device.h b/include/drm/drm_device.h
index 08b3b2467c4c..40a4caaa6313 100644
--- a/include/drm/drm_device.h
+++ b/include/drm/drm_device.h
@@ -26,10 +26,14 @@ struct pci_controller;
  * Recovery methods for wedged device in order of less to more side-effects.
  * To be used with drm_dev_wedged_event() as recovery @method. Callers can
  * use any one, multiple (or'd) or none depending on their needs.
+ *
+ * If DRM_WEDGE_RECOVERY_VENDOR method is used, vendors must provide additional
+ * documentation outlining further recovery steps.
  */
 #define DRM_WEDGE_RECOVERY_NONE		BIT(0)	/* optional telemetry collection */
 #define DRM_WEDGE_RECOVERY_REBIND	BIT(1)	/* unbind + bind driver */
 #define DRM_WEDGE_RECOVERY_BUS_RESET	BIT(2)	/* unbind + reset bus device + bind */
+#define DRM_WEDGE_RECOVERY_VENDOR	BIT(3)	/* vendor specific recovery method */
 
 /**
  * struct drm_wedge_task_info - information about the guilty task of a wedge dev
-- 
2.47.1

