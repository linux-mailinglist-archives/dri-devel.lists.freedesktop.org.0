Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC582984024
	for <lists+dri-devel@lfdr.de>; Tue, 24 Sep 2024 10:18:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BBB610E651;
	Tue, 24 Sep 2024 08:18:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="awHMo4rg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 048FA10E656
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Sep 2024 08:18:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727165897; x=1758701897;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Xx98evn1RGk3I0LGN6BFjnVjI2NASiSUZT7e0Noq670=;
 b=awHMo4rgIfGnSW51XSuHMmp0r9ph+AxBSEEjJGfRKjcE2hbjtqahnkUG
 +TVedChCULorJbGSEEqf233ODviMzR5tZA1AFckGPzRPtRGo9oU3DMxv7
 2VBlEbg/C45EF/M4ZTJdDHf4CyEycryc2ncyJwiQGWyiitYPxhM0MRA4V
 5ZnxdBnezNZVR5oyNfUy32Xc/942z/M/dhxax9KUhlJ45TLVviyFo/l55
 A4+r+1RWjYVCXT1yIfq55WpwnlgYFJC4db6El/DRXoyT5BViwFojDxSGc
 qRuj59g9Jj6Ykd00x69++ym9gvhZH0NPMHJg2YE0f3DLmJ8tN8/x/5En6 g==;
X-CSE-ConnectionGUID: oJSRRHHKTNKNk6jWd7DBRQ==
X-CSE-MsgGUID: fx9phtKiShitbwQk6i8kbQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11204"; a="37506897"
X-IronPort-AV: E=Sophos;i="6.10,253,1719903600"; d="scan'208";a="37506897"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2024 01:18:16 -0700
X-CSE-ConnectionGUID: P8dHdYmMTVmwA8eNZyJtVw==
X-CSE-MsgGUID: 6wzEM6QZSjmi2lHPBP1J1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,253,1719903600"; d="scan'208";a="102170619"
Received: from jlawryno.igk.intel.com ([10.91.220.59])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2024 01:18:14 -0700
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, quic_jhugo@quicinc.com,
 "Wachowski, Karol" <karol.wachowski@intel.com>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Subject: [PATCH 05/29] accel/ivpu: Add coredump support
Date: Tue, 24 Sep 2024 10:17:30 +0200
Message-ID: <20240924081754.209728-6-jacek.lawrynowicz@linux.intel.com>
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

From: "Wachowski, Karol" <karol.wachowski@intel.com>

Use coredump (if available) to collect FW logs in case of a FW crash.
This makes dmesg more readable and allows to collect more log data.

Signed-off-by: Wachowski, Karol <karol.wachowski@intel.com>
Reviewed-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
---
 drivers/accel/ivpu/Kconfig         |  1 +
 drivers/accel/ivpu/Makefile        |  1 +
 drivers/accel/ivpu/ivpu_coredump.c | 39 ++++++++++++++++++++++++++++++
 drivers/accel/ivpu/ivpu_coredump.h | 25 +++++++++++++++++++
 drivers/accel/ivpu/ivpu_drv.c      |  5 ++--
 drivers/accel/ivpu/ivpu_fw.c       |  1 -
 drivers/accel/ivpu/ivpu_fw.h       |  2 ++
 drivers/accel/ivpu/ivpu_fw_log.h   |  8 ------
 drivers/accel/ivpu/ivpu_pm.c       |  9 ++++---
 9 files changed, 76 insertions(+), 15 deletions(-)
 create mode 100644 drivers/accel/ivpu/ivpu_coredump.c
 create mode 100644 drivers/accel/ivpu/ivpu_coredump.h

diff --git a/drivers/accel/ivpu/Kconfig b/drivers/accel/ivpu/Kconfig
index 682c532452863..e4d418b44626e 100644
--- a/drivers/accel/ivpu/Kconfig
+++ b/drivers/accel/ivpu/Kconfig
@@ -8,6 +8,7 @@ config DRM_ACCEL_IVPU
 	select FW_LOADER
 	select DRM_GEM_SHMEM_HELPER
 	select GENERIC_ALLOCATOR
+	select WANT_DEV_COREDUMP
 	help
 	  Choose this option if you have a system with an 14th generation
 	  Intel CPU (Meteor Lake) or newer. Intel NPU (formerly called Intel VPU)
diff --git a/drivers/accel/ivpu/Makefile b/drivers/accel/ivpu/Makefile
index ebd682a42eb12..232ea6d28c6e2 100644
--- a/drivers/accel/ivpu/Makefile
+++ b/drivers/accel/ivpu/Makefile
@@ -19,5 +19,6 @@ intel_vpu-y := \
 	ivpu_sysfs.o
 
 intel_vpu-$(CONFIG_DEBUG_FS) += ivpu_debugfs.o
+intel_vpu-$(CONFIG_DEV_COREDUMP) += ivpu_coredump.o
 
 obj-$(CONFIG_DRM_ACCEL_IVPU) += intel_vpu.o
diff --git a/drivers/accel/ivpu/ivpu_coredump.c b/drivers/accel/ivpu/ivpu_coredump.c
new file mode 100644
index 0000000000000..a8fcddb106750
--- /dev/null
+++ b/drivers/accel/ivpu/ivpu_coredump.c
@@ -0,0 +1,39 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2020-2024 Intel Corporation
+ */
+
+#include <linux/devcoredump.h>
+#include <linux/firmware.h>
+
+#include "ivpu_coredump.h"
+#include "ivpu_fw.h"
+#include "ivpu_gem.h"
+#include "vpu_boot_api.h"
+
+#define CRASH_DUMP_HEADER "Intel NPU crash dump"
+#define CRASH_DUMP_HEADERS_SIZE SZ_4K
+
+void ivpu_dev_coredump(struct ivpu_device *vdev)
+{
+	struct drm_print_iterator pi = {};
+	struct drm_printer p;
+	size_t coredump_size;
+	char *coredump;
+
+	coredump_size = CRASH_DUMP_HEADERS_SIZE + FW_VERSION_HEADER_SIZE +
+			ivpu_bo_size(vdev->fw->mem_log_crit) + ivpu_bo_size(vdev->fw->mem_log_verb);
+	coredump = vmalloc(coredump_size);
+	if (!coredump)
+		return;
+
+	pi.data = coredump;
+	pi.remain = coredump_size;
+	p = drm_coredump_printer(&pi);
+
+	drm_printf(&p, "%s\n", CRASH_DUMP_HEADER);
+	drm_printf(&p, "FW version: %s\n", (const char *)vdev->fw->file->data + VPU_FW_HEADER_SIZE);
+	ivpu_fw_log_print(vdev, false, &p);
+
+	dev_coredumpv(vdev->drm.dev, coredump, pi.offset, GFP_KERNEL);
+}
diff --git a/drivers/accel/ivpu/ivpu_coredump.h b/drivers/accel/ivpu/ivpu_coredump.h
new file mode 100644
index 0000000000000..8efb09d024411
--- /dev/null
+++ b/drivers/accel/ivpu/ivpu_coredump.h
@@ -0,0 +1,25 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2020-2024 Intel Corporation
+ */
+
+#ifndef __IVPU_COREDUMP_H__
+#define __IVPU_COREDUMP_H__
+
+#include <drm/drm_print.h>
+
+#include "ivpu_drv.h"
+#include "ivpu_fw_log.h"
+
+#ifdef CONFIG_DEV_COREDUMP
+void ivpu_dev_coredump(struct ivpu_device *vdev);
+#else
+static inline void ivpu_dev_coredump(struct ivpu_device *vdev)
+{
+	struct drm_printer p = drm_info_printer(vdev->drm.dev);
+
+	ivpu_fw_log_print(vdev, false, &p);
+}
+#endif
+
+#endif /* __IVPU_COREDUMP_H__ */
diff --git a/drivers/accel/ivpu/ivpu_drv.c b/drivers/accel/ivpu/ivpu_drv.c
index c91400ecf9265..38b4158f52784 100644
--- a/drivers/accel/ivpu/ivpu_drv.c
+++ b/drivers/accel/ivpu/ivpu_drv.c
@@ -14,7 +14,7 @@
 #include <drm/drm_ioctl.h>
 #include <drm/drm_prime.h>
 
-#include "vpu_boot_api.h"
+#include "ivpu_coredump.h"
 #include "ivpu_debugfs.h"
 #include "ivpu_drv.h"
 #include "ivpu_fw.h"
@@ -29,6 +29,7 @@
 #include "ivpu_ms.h"
 #include "ivpu_pm.h"
 #include "ivpu_sysfs.h"
+#include "vpu_boot_api.h"
 
 #ifndef DRIVER_VERSION_STR
 #define DRIVER_VERSION_STR __stringify(DRM_IVPU_DRIVER_MAJOR) "." \
@@ -382,7 +383,7 @@ int ivpu_boot(struct ivpu_device *vdev)
 		ivpu_err(vdev, "Failed to boot the firmware: %d\n", ret);
 		ivpu_hw_diagnose_failure(vdev);
 		ivpu_mmu_evtq_dump(vdev);
-		ivpu_fw_log_dump(vdev);
+		ivpu_dev_coredump(vdev);
 		return ret;
 	}
 
diff --git a/drivers/accel/ivpu/ivpu_fw.c b/drivers/accel/ivpu/ivpu_fw.c
index 00e27e2c14779..95ea9ff7eb256 100644
--- a/drivers/accel/ivpu/ivpu_fw.c
+++ b/drivers/accel/ivpu/ivpu_fw.c
@@ -25,7 +25,6 @@
 #define FW_SHAVE_NN_MAX_SIZE	SZ_2M
 #define FW_RUNTIME_MIN_ADDR	(FW_GLOBAL_MEM_START)
 #define FW_RUNTIME_MAX_ADDR	(FW_GLOBAL_MEM_END - FW_SHARED_MEM_SIZE)
-#define FW_VERSION_HEADER_SIZE	SZ_4K
 #define FW_FILE_IMAGE_OFFSET	(VPU_FW_HEADER_SIZE + FW_VERSION_HEADER_SIZE)
 
 #define WATCHDOG_MSS_REDIRECT	32
diff --git a/drivers/accel/ivpu/ivpu_fw.h b/drivers/accel/ivpu/ivpu_fw.h
index 40d9d17be3f52..5941150d4aa50 100644
--- a/drivers/accel/ivpu/ivpu_fw.h
+++ b/drivers/accel/ivpu/ivpu_fw.h
@@ -6,6 +6,8 @@
 #ifndef __IVPU_FW_H__
 #define __IVPU_FW_H__
 
+#define FW_VERSION_HEADER_SIZE	SZ_4K
+
 struct ivpu_device;
 struct ivpu_bo;
 struct vpu_boot_params;
diff --git a/drivers/accel/ivpu/ivpu_fw_log.h b/drivers/accel/ivpu/ivpu_fw_log.h
index 41c85b74cc7fd..8bb528a73cb7e 100644
--- a/drivers/accel/ivpu/ivpu_fw_log.h
+++ b/drivers/accel/ivpu/ivpu_fw_log.h
@@ -8,8 +8,6 @@
 
 #include <linux/types.h>
 
-#include <drm/drm_print.h>
-
 #include "ivpu_drv.h"
 
 #define IVPU_FW_LOG_DEFAULT 0
@@ -29,11 +27,5 @@ void ivpu_fw_log_print(struct ivpu_device *vdev, bool only_new_msgs, struct drm_
 void ivpu_fw_log_mark_read(struct ivpu_device *vdev);
 void ivpu_fw_log_reset(struct ivpu_device *vdev);
 
-static inline void ivpu_fw_log_dump(struct ivpu_device *vdev)
-{
-	struct drm_printer p = drm_info_printer(vdev->drm.dev);
-
-	ivpu_fw_log_print(vdev, false, &p);
-}
 
 #endif /* __IVPU_FW_LOG_H__ */
diff --git a/drivers/accel/ivpu/ivpu_pm.c b/drivers/accel/ivpu/ivpu_pm.c
index 3c36b55c01d51..bf77395ffcb7c 100644
--- a/drivers/accel/ivpu/ivpu_pm.c
+++ b/drivers/accel/ivpu/ivpu_pm.c
@@ -9,17 +9,18 @@
 #include <linux/pm_runtime.h>
 #include <linux/reboot.h>
 
-#include "vpu_boot_api.h"
+#include "ivpu_coredump.h"
 #include "ivpu_drv.h"
-#include "ivpu_hw.h"
 #include "ivpu_fw.h"
 #include "ivpu_fw_log.h"
+#include "ivpu_hw.h"
 #include "ivpu_ipc.h"
 #include "ivpu_job.h"
 #include "ivpu_jsm_msg.h"
 #include "ivpu_mmu.h"
 #include "ivpu_ms.h"
 #include "ivpu_pm.h"
+#include "vpu_boot_api.h"
 
 static bool ivpu_disable_recovery;
 module_param_named_unsafe(disable_recovery, ivpu_disable_recovery, bool, 0644);
@@ -124,7 +125,7 @@ static void ivpu_pm_recovery_work(struct work_struct *work)
 	if (ret)
 		ivpu_err(vdev, "Failed to resume NPU: %d\n", ret);
 
-	ivpu_fw_log_dump(vdev);
+	ivpu_dev_coredump(vdev);
 
 	atomic_inc(&vdev->pm->reset_counter);
 	atomic_set(&vdev->pm->reset_pending, 1);
@@ -263,7 +264,7 @@ int ivpu_pm_runtime_suspend_cb(struct device *dev)
 	if (!is_idle || ret_d0i3) {
 		ivpu_err(vdev, "Forcing cold boot due to previous errors\n");
 		atomic_inc(&vdev->pm->reset_counter);
-		ivpu_fw_log_dump(vdev);
+		ivpu_dev_coredump(vdev);
 		ivpu_pm_prepare_cold_boot(vdev);
 	} else {
 		ivpu_pm_prepare_warm_boot(vdev);
-- 
2.45.1

