Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BAABF98402B
	for <lists+dri-devel@lfdr.de>; Tue, 24 Sep 2024 10:18:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2995910E653;
	Tue, 24 Sep 2024 08:18:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ItpB4ICd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1328010E653
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Sep 2024 08:18:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727165909; x=1758701909;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ZRGC/1OpusJdvpdAZk46NQ7+uD6xcKOCq4QKN19jOSo=;
 b=ItpB4ICdXdi0Hrj2Hf8ZB6cAyXU/d1g6uDruXV8wCSWGz20pq0u/8V9/
 CCuCfZ0J1jgPcjUUW76nzPZYQKbwQMn/5olCWvy1rlTK8hJzmfX3agTNQ
 8rwSaIv7eZSLnfK9S8KhjBM3+r4UZjUm07DnuFxT65ILFGD2I0HGTt3zn
 8Hg3b9lrb+vFkHe7zzfjmGjPg3/Im9aqCX2TbPhbHRYFVQXcScnZzKeDC
 K3wrMBiTidD+z6qtOBrnIj67rSFPMocqjyj1L1f8wsViJCkV+kAxeYI+z
 /adO0Xx38VDt2AMBi1ntwH48QH4J+mkYavu7f7Va6xZWwS6yEz/4lVQNk w==;
X-CSE-ConnectionGUID: cHqWXOOkRgmvnHKLEBPE+A==
X-CSE-MsgGUID: +jsSvdgWRvWy0Q2aTtW+yw==
X-IronPort-AV: E=McAfee;i="6700,10204,11204"; a="37506922"
X-IronPort-AV: E=Sophos;i="6.10,253,1719903600"; d="scan'208";a="37506922"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2024 01:18:29 -0700
X-CSE-ConnectionGUID: xFfg7+mfRuG+HOEF1yJIsw==
X-CSE-MsgGUID: z4sgtX37TWugwywyJOmBNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,253,1719903600"; d="scan'208";a="102170680"
Received: from jlawryno.igk.intel.com ([10.91.220.59])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2024 01:18:27 -0700
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, quic_jhugo@quicinc.com,
	Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
	Wludzik@freedesktop.org, Jozef <jozef.wludzik@intel.com>
Subject: [PATCH 10/29] accel/ivpu: Stop using hardcoded DRIVER_DATE
Date: Tue, 24 Sep 2024 10:17:35 +0200
Message-ID: <20240924081754.209728-11-jacek.lawrynowicz@linux.intel.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240924081754.209728-1-jacek.lawrynowicz@linux.intel.com>
References: <20240924081754.209728-1-jacek.lawrynowicz@linux.intel.com>
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

Hardcoded driver date is useless, so use kernel version as a driver date
to make identifying .ko file easier. Also allow to pass DRIVER_DATE
on build time to allow versioning the driver in case it is built out
of the tree.

Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Reviewed-by: Wludzik, Jozef <jozef.wludzik@intel.com>
---
 drivers/accel/ivpu/ivpu_drv.c | 15 +++++++++++----
 drivers/accel/ivpu/ivpu_drv.h |  1 -
 include/uapi/drm/ivpu_accel.h |  3 ---
 3 files changed, 11 insertions(+), 8 deletions(-)

diff --git a/drivers/accel/ivpu/ivpu_drv.c b/drivers/accel/ivpu/ivpu_drv.c
index 38b4158f52784..9fd371af5814c 100644
--- a/drivers/accel/ivpu/ivpu_drv.c
+++ b/drivers/accel/ivpu/ivpu_drv.c
@@ -7,6 +7,7 @@
 #include <linux/module.h>
 #include <linux/pci.h>
 #include <linux/pm_runtime.h>
+#include <generated/utsrelease.h>
 
 #include <drm/drm_accel.h>
 #include <drm/drm_file.h>
@@ -32,8 +33,7 @@
 #include "vpu_boot_api.h"
 
 #ifndef DRIVER_VERSION_STR
-#define DRIVER_VERSION_STR __stringify(DRM_IVPU_DRIVER_MAJOR) "." \
-			   __stringify(DRM_IVPU_DRIVER_MINOR) "."
+#define DRIVER_VERSION_STR "1.0.0 " UTS_RELEASE
 #endif
 
 static struct lock_class_key submitted_jobs_xa_lock_class_key;
@@ -447,9 +447,16 @@ static const struct drm_driver driver = {
 
 	.name = DRIVER_NAME,
 	.desc = DRIVER_DESC,
+
+#ifdef DRIVER_DATE
 	.date = DRIVER_DATE,
-	.major = DRM_IVPU_DRIVER_MAJOR,
-	.minor = DRM_IVPU_DRIVER_MINOR,
+	.major = DRIVER_MAJOR,
+	.minor = DRIVER_MINOR,
+	.patchlevel = DRIVER_PATCHLEVEL,
+#else
+	.date = UTS_RELEASE,
+	.major = 1,
+#endif
 };
 
 static void ivpu_context_abort_invalid(struct ivpu_device *vdev)
diff --git a/drivers/accel/ivpu/ivpu_drv.h b/drivers/accel/ivpu/ivpu_drv.h
index 2b30cc2e9272e..471478281021d 100644
--- a/drivers/accel/ivpu/ivpu_drv.h
+++ b/drivers/accel/ivpu/ivpu_drv.h
@@ -21,7 +21,6 @@
 
 #define DRIVER_NAME "intel_vpu"
 #define DRIVER_DESC "Driver for Intel NPU (Neural Processing Unit)"
-#define DRIVER_DATE "20230117"
 
 #define PCI_DEVICE_ID_MTL   0x7d1d
 #define PCI_DEVICE_ID_ARL   0xad1d
diff --git a/include/uapi/drm/ivpu_accel.h b/include/uapi/drm/ivpu_accel.h
index 084fb529e1e96..234664d352507 100644
--- a/include/uapi/drm/ivpu_accel.h
+++ b/include/uapi/drm/ivpu_accel.h
@@ -12,9 +12,6 @@
 extern "C" {
 #endif
 
-#define DRM_IVPU_DRIVER_MAJOR 1
-#define DRM_IVPU_DRIVER_MINOR 0
-
 #define DRM_IVPU_GET_PARAM		  0x00
 #define DRM_IVPU_SET_PARAM		  0x01
 #define DRM_IVPU_BO_CREATE		  0x02
-- 
2.45.1

