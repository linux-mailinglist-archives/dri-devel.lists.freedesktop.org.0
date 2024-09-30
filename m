Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F335798AD6E
	for <lists+dri-devel@lfdr.de>; Mon, 30 Sep 2024 21:53:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40E1110E585;
	Mon, 30 Sep 2024 19:53:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WNY/rdXW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B5B010E57D
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Sep 2024 19:53:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727726025; x=1759262025;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=NvpWagD5Vi0rF1gLLRo5do4qEyWv03CZTvNUBwK6P5U=;
 b=WNY/rdXW/5z3H8CMkEQ9m0MYtOJrRRtzJ3co9Mwea7I32E3HEtb2hU4S
 lIk1Mn5tD/mDdEd1nc2IkgZ+0gWn46Z8GTYpBhjfD/S0rwFPOyE6zSTEz
 JuwDWq4RDXiPa8NXc1v/gitS6+CS5ZkzUhbyGhMmIG6IQQOBX2XxemDfX
 MyIBZaixMKuCq+fNiNlx/eMXjLxP+dyJy1urK+KnT2BOi//cYeOB0Soo1
 OrxzNffCI3KV/tRu3YK7C0ZJO4fRVBWyd23jZs/VxRIt4ZvUkqMbEbB8r
 JabTClwVAlO8PagtTczxgbj7vfFzYwm62gquUtR23Ou07G5ujIPhCURbZ w==;
X-CSE-ConnectionGUID: zC8ZZGvMQQiRVBkK7rfijw==
X-CSE-MsgGUID: LY3hMcYVR06rRC4D+G9Wgg==
X-IronPort-AV: E=McAfee;i="6700,10204,11211"; a="26962321"
X-IronPort-AV: E=Sophos;i="6.11,166,1725346800"; d="scan'208";a="26962321"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2024 12:53:44 -0700
X-CSE-ConnectionGUID: fiyijmQcS4uiJY9hWLSBGQ==
X-CSE-MsgGUID: qQ5Qq/oNQqSW+Wj7QiatKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,166,1725346800"; d="scan'208";a="73370041"
Received: from jlawryno.igk.intel.com ([10.91.220.59])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2024 12:53:43 -0700
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, quic_jhugo@quicinc.com,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 Karol Wachowski <karol.wachowski@intel.com>
Subject: [PATCH v2 12/31] accel/ivpu: Stop using hardcoded DRIVER_DATE
Date: Mon, 30 Sep 2024 21:53:03 +0200
Message-ID: <20240930195322.461209-13-jacek.lawrynowicz@linux.intel.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240930195322.461209-1-jacek.lawrynowicz@linux.intel.com>
References: <20240930195322.461209-1-jacek.lawrynowicz@linux.intel.com>
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

Reviewed-by: Karol Wachowski <karol.wachowski@intel.com>
Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
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

