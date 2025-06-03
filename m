Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE91CACC171
	for <lists+dri-devel@lfdr.de>; Tue,  3 Jun 2025 09:50:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0851210E692;
	Tue,  3 Jun 2025 07:50:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AFG15xrQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D15010E690;
 Tue,  3 Jun 2025 07:50:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748937013; x=1780473013;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=n1JUwF/h6syBEXm4XsNF8GQSzURPWdS+r8cHnGjEVbc=;
 b=AFG15xrQ+5SnILUix6cGqK1yhrMRQlg7WXGB058Ns0ZtetxmBH4l61sm
 oeIuADkeYlCQIMonIZpV3Higso0NujYjtBwiPkJ9Puo2Cn9xaShUjOrpX
 LZ/ZCXofBuP24/saz6YkU047LYVNyQ3Z67AHw87qgyKOWdxs+5YRef82n
 iIYym+p0FFmIwCpUYF8v9IKObIQQXooRTmpMQVetxBFzl3BwyE+hkDLNH
 u4+j6QusWYnawlaTFRRs5K6dqmHvW6Hy/vtuItHG7CEv0QbTjJfFwcZOn
 r3KQacjj5v9beDc3rTPyKOs22q7PllHugMHk2+rVaX6CEHdgAoWyi/xSB w==;
X-CSE-ConnectionGUID: 1P+A6oxbTd+mMUsxRaS9sg==
X-CSE-MsgGUID: 3p3guvVmQfSNmsBgvbi/cg==
X-IronPort-AV: E=McAfee;i="6700,10204,11451"; a="76356193"
X-IronPort-AV: E=Sophos;i="6.16,205,1744095600"; d="scan'208";a="76356193"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2025 00:50:13 -0700
X-CSE-ConnectionGUID: t/O7j/1pRE6NqTAkIJGD3A==
X-CSE-MsgGUID: gAJi/N/nQnevZYLTa3BUQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,205,1744095600"; d="scan'208";a="144671505"
Received: from unknown (HELO rtauro-desk.iind.intel.com) ([10.227.90.111])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2025 00:50:11 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 lucas.demarchi@intel.com, aravind.iddamsetty@linux.intel.com,
 raag.jadav@intel.com, himal.prasad.ghimiray@intel.com,
 frank.scarbrough@intel.com
Subject: [PATCH 1/4] drm: Add a firmware flash method to device wedged uevent
Date: Tue,  3 Jun 2025 13:43:57 +0530
Message-ID: <20250603081409.1509709-2-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250603081409.1509709-1-riana.tauro@intel.com>
References: <20250603081409.1509709-1-riana.tauro@intel.com>
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

A device is declared wedged when it is non-recoverable from
the driver context. Some firmware errors can also cause
the device to enter this state and the only method to recover
from this would be to do a firmware flash

Signed-off-by: Riana Tauro <riana.tauro@intel.com>
---
 Documentation/gpu/drm-uapi.rst | 6 +++---
 drivers/gpu/drm/drm_drv.c      | 2 ++
 include/drm/drm_device.h       | 1 +
 3 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/Documentation/gpu/drm-uapi.rst b/Documentation/gpu/drm-uapi.rst
index 4863a4deb0ee..524224afb09f 100644
--- a/Documentation/gpu/drm-uapi.rst
+++ b/Documentation/gpu/drm-uapi.rst
@@ -422,9 +422,8 @@ Current implementation defines three recovery methods, out of which, drivers
 can use any one, multiple or none. Method(s) of choice will be sent in the
 uevent environment as ``WEDGED=<method1>[,..,<methodN>]`` in order of less to
 more side-effects. If driver is unsure about recovery or method is unknown
-(like soft/hard system reboot, firmware flashing, physical device replacement
-or any other procedure which can't be attempted on the fly), ``WEDGED=unknown``
-will be sent instead.
+(like soft/hard system reboot, physical device replacement or any other procedure
+which can't be attempted on the fly), ``WEDGED=unknown`` will be sent instead.
 
 Userspace consumers can parse this event and attempt recovery as per the
 following expectations.
@@ -435,6 +434,7 @@ following expectations.
     none            optional telemetry collection
     rebind          unbind + bind driver
     bus-reset       unbind + bus reset/re-enumeration + bind
+    firmware-flash  unbind + firmware flash + bind
     unknown         consumer policy
     =============== ========================================
 
diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
index 56dd61f8e05a..e287424db753 100644
--- a/drivers/gpu/drm/drm_drv.c
+++ b/drivers/gpu/drm/drm_drv.c
@@ -533,6 +533,8 @@ static const char *drm_get_wedge_recovery(unsigned int opt)
 		return "rebind";
 	case DRM_WEDGE_RECOVERY_BUS_RESET:
 		return "bus-reset";
+	case DRM_WEDGE_RECOVERY_FW_FLASH:
+		return "firmware-flash";
 	default:
 		return NULL;
 	}
diff --git a/include/drm/drm_device.h b/include/drm/drm_device.h
index e2f894f1b90a..e446e40f8306 100644
--- a/include/drm/drm_device.h
+++ b/include/drm/drm_device.h
@@ -29,6 +29,7 @@ struct pci_controller;
 #define DRM_WEDGE_RECOVERY_NONE		BIT(0)	/* optional telemetry collection */
 #define DRM_WEDGE_RECOVERY_REBIND	BIT(1)	/* unbind + bind driver */
 #define DRM_WEDGE_RECOVERY_BUS_RESET	BIT(2)	/* unbind + reset bus device + bind */
+#define DRM_WEDGE_RECOVERY_FW_FLASH	BIT(3)  /* unbind + firmware flash + bind */
 
 /**
  * enum switch_power_state - power state of drm device
-- 
2.47.1

