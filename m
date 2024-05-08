Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DAAEE8BFEBF
	for <lists+dri-devel@lfdr.de>; Wed,  8 May 2024 15:29:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA70210FEE0;
	Wed,  8 May 2024 13:29:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Kc3L218p";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 026B610FEE0
 for <dri-devel@lists.freedesktop.org>; Wed,  8 May 2024 13:29:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715174977; x=1746710977;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Pq5QutipfO6xHXenHlIWR3Sn+qQM5uqp/EFRADZdUBg=;
 b=Kc3L218pKM2ffzjkk0TUDcJZbZVPHsIT4oth5TFsPOA4BZOOsjt6p97m
 Z0zHDa+NgsI/thoSGS6RNEZphyPbkvkkuPL3cNuONPNr29/JeZzsi6wf2
 l+aY9vowoGhBFAol9CSAD0abZ2steCSF4mX3NXd4n1uT+LGlSIE1igpuB
 Oz68+0ykcRBdmIHHYIg38l1HI5vHBWgbtdi6QuBH19FVvVolWkbDv8Ukc
 MLsAMnOvuD0KTbusdBR2yrfOGHoR7PYU/v0vYQMwaoccgXrIXbttx89QC
 jPMlytsG8i7ZHUcdEQ8agPCES/0X4Mr8uEED4apHWSNA1XyX+dBdW89Al g==;
X-CSE-ConnectionGUID: rw779JCTQjWZMzkeW7dyzw==
X-CSE-MsgGUID: /RCADGoyTRaGWa1PNml4XA==
X-IronPort-AV: E=McAfee;i="6600,9927,11066"; a="21634337"
X-IronPort-AV: E=Sophos;i="6.08,145,1712646000"; d="scan'208";a="21634337"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2024 06:29:35 -0700
X-CSE-ConnectionGUID: 7i0I4vg5R1aZSyEV47I7tQ==
X-CSE-MsgGUID: rD+oxOSqRAafwna592WFBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,145,1712646000"; d="scan'208";a="29470097"
Received: from jlawryno.igk.intel.com ([10.91.220.59])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2024 06:29:33 -0700
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, quic_jhugo@quicinc.com,
 Tomasz Rusinowicz <tomasz.rusinowicz@intel.com>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Subject: [PATCH 12/12] accel/ivpu: Share NPU busy time in sysfs
Date: Wed,  8 May 2024 15:29:31 +0200
Message-ID: <20240508132931.2388996-1-jacek.lawrynowicz@linux.intel.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240508132106.2387464-1-jacek.lawrynowicz@linux.intel.com>
References: <20240508132106.2387464-1-jacek.lawrynowicz@linux.intel.com>
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

From: Tomasz Rusinowicz <tomasz.rusinowicz@intel.com>

The driver tracks the time spent by NPU executing jobs
and shares it through sysfs `npu_busy_time_us` file.
It can be then used by user space applications to monitor device
utilization.

NPU is considered 'busy' starting with a first job submitted
to firmware and ending when there is no more jobs pending/executing.

Signed-off-by: Tomasz Rusinowicz <tomasz.rusinowicz@intel.com>
Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
---
 drivers/accel/ivpu/Makefile     |  3 +-
 drivers/accel/ivpu/ivpu_drv.c   |  2 ++
 drivers/accel/ivpu/ivpu_drv.h   |  3 ++
 drivers/accel/ivpu/ivpu_job.c   | 23 ++++++++++++-
 drivers/accel/ivpu/ivpu_sysfs.c | 58 +++++++++++++++++++++++++++++++++
 drivers/accel/ivpu/ivpu_sysfs.h | 13 ++++++++
 6 files changed, 100 insertions(+), 2 deletions(-)
 create mode 100644 drivers/accel/ivpu/ivpu_sysfs.c
 create mode 100644 drivers/accel/ivpu/ivpu_sysfs.h

diff --git a/drivers/accel/ivpu/Makefile b/drivers/accel/ivpu/Makefile
index 726cf8f28ea3..f61d8d3320e2 100644
--- a/drivers/accel/ivpu/Makefile
+++ b/drivers/accel/ivpu/Makefile
@@ -14,7 +14,8 @@ intel_vpu-y := \
 	ivpu_mmu.o \
 	ivpu_mmu_context.o \
 	ivpu_ms.o \
-	ivpu_pm.o
+	ivpu_pm.o \
+	ivpu_sysfs.o
 
 intel_vpu-$(CONFIG_DEBUG_FS) += ivpu_debugfs.o
 
diff --git a/drivers/accel/ivpu/ivpu_drv.c b/drivers/accel/ivpu/ivpu_drv.c
index 87c48fa8d719..b34d1766891c 100644
--- a/drivers/accel/ivpu/ivpu_drv.c
+++ b/drivers/accel/ivpu/ivpu_drv.c
@@ -28,6 +28,7 @@
 #include "ivpu_mmu_context.h"
 #include "ivpu_ms.h"
 #include "ivpu_pm.h"
+#include "ivpu_sysfs.h"
 
 #ifndef DRIVER_VERSION_STR
 #define DRIVER_VERSION_STR __stringify(DRM_IVPU_DRIVER_MAJOR) "." \
@@ -696,6 +697,7 @@ static int ivpu_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 		return ret;
 
 	ivpu_debugfs_init(vdev);
+	ivpu_sysfs_init(vdev);
 
 	ret = drm_dev_register(&vdev->drm, 0);
 	if (ret) {
diff --git a/drivers/accel/ivpu/ivpu_drv.h b/drivers/accel/ivpu/ivpu_drv.h
index d55f0bdffd71..04a054080eff 100644
--- a/drivers/accel/ivpu/ivpu_drv.h
+++ b/drivers/accel/ivpu/ivpu_drv.h
@@ -135,6 +135,9 @@ struct ivpu_device {
 
 	atomic64_t unique_id_counter;
 
+	ktime_t busy_start_ts;
+	ktime_t busy_time;
+
 	struct {
 		int boot;
 		int jsm;
diff --git a/drivers/accel/ivpu/ivpu_job.c b/drivers/accel/ivpu/ivpu_job.c
index 1d7b4388eb3b..845181b48b3a 100644
--- a/drivers/accel/ivpu/ivpu_job.c
+++ b/drivers/accel/ivpu/ivpu_job.c
@@ -438,11 +438,28 @@ ivpu_job_create(struct ivpu_file_priv *file_priv, u32 engine_idx, u32 bo_count)
 	return NULL;
 }
 
+static struct ivpu_job *ivpu_job_remove_from_submitted_jobs(struct ivpu_device *vdev, u32 job_id)
+{
+	struct ivpu_job *job;
+
+	xa_lock(&vdev->submitted_jobs_xa);
+	job = __xa_erase(&vdev->submitted_jobs_xa, job_id);
+
+	if (xa_empty(&vdev->submitted_jobs_xa) && job) {
+		vdev->busy_time = ktime_add(ktime_sub(ktime_get(), vdev->busy_start_ts),
+					    vdev->busy_time);
+	}
+
+	xa_unlock(&vdev->submitted_jobs_xa);
+
+	return job;
+}
+
 static int ivpu_job_signal_and_destroy(struct ivpu_device *vdev, u32 job_id, u32 job_status)
 {
 	struct ivpu_job *job;
 
-	job = xa_erase(&vdev->submitted_jobs_xa, job_id);
+	job = ivpu_job_remove_from_submitted_jobs(vdev, job_id);
 	if (!job)
 		return -ENOENT;
 
@@ -477,6 +494,7 @@ static int ivpu_job_submit(struct ivpu_job *job, u8 priority)
 	struct ivpu_device *vdev = job->vdev;
 	struct xa_limit job_id_range;
 	struct ivpu_cmdq *cmdq;
+	bool is_first_job;
 	int ret;
 
 	ret = ivpu_rpm_get(vdev);
@@ -497,6 +515,7 @@ static int ivpu_job_submit(struct ivpu_job *job, u8 priority)
 	job_id_range.max = job_id_range.min | JOB_ID_JOB_MASK;
 
 	xa_lock(&vdev->submitted_jobs_xa);
+	is_first_job = xa_empty(&vdev->submitted_jobs_xa);
 	ret = __xa_alloc(&vdev->submitted_jobs_xa, &job->job_id, job, job_id_range, GFP_KERNEL);
 	if (ret) {
 		ivpu_dbg(vdev, JOB, "Too many active jobs in ctx %d\n",
@@ -516,6 +535,8 @@ static int ivpu_job_submit(struct ivpu_job *job, u8 priority)
 		wmb(); /* Flush WC buffer for jobq header */
 	} else {
 		ivpu_cmdq_ring_db(vdev, cmdq);
+		if (is_first_job)
+			vdev->busy_start_ts = ktime_get();
 	}
 
 	ivpu_dbg(vdev, JOB, "Job submitted: id %3u ctx %2d engine %d prio %d addr 0x%llx next %d\n",
diff --git a/drivers/accel/ivpu/ivpu_sysfs.c b/drivers/accel/ivpu/ivpu_sysfs.c
new file mode 100644
index 000000000000..913669f1786e
--- /dev/null
+++ b/drivers/accel/ivpu/ivpu_sysfs.c
@@ -0,0 +1,58 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2024 Intel Corporation
+ */
+
+#include <linux/device.h>
+#include <linux/err.h>
+
+#include "ivpu_hw.h"
+#include "ivpu_sysfs.h"
+
+/*
+ * npu_busy_time_us is the time that the device spent executing jobs.
+ * The time is counted when and only when there are jobs submitted to firmware.
+ *
+ * This time can be used to measure the utilization of NPU, either by calculating
+ * npu_busy_time_us difference between two timepoints (i.e. measuring the time
+ * that the NPU was active during some workload) or monitoring utilization percentage
+ * by reading npu_busy_time_us periodically.
+ *
+ * When reading the value periodically, it shouldn't be read too often as it may have
+ * an impact on job submission performance. Recommended period is 1 second.
+ */
+static ssize_t
+npu_busy_time_us_show(struct device *dev, struct device_attribute *attr, char *buf)
+{
+	struct drm_device *drm = dev_get_drvdata(dev);
+	struct ivpu_device *vdev = to_ivpu_device(drm);
+	ktime_t total, now = 0;
+
+	xa_lock(&vdev->submitted_jobs_xa);
+	total = vdev->busy_time;
+	if (!xa_empty(&vdev->submitted_jobs_xa))
+		now = ktime_sub(ktime_get(), vdev->busy_start_ts);
+	xa_unlock(&vdev->submitted_jobs_xa);
+
+	return sysfs_emit(buf, "%lld\n", ktime_to_us(ktime_add(total, now)));
+}
+
+static DEVICE_ATTR_RO(npu_busy_time_us);
+
+static struct attribute *ivpu_dev_attrs[] = {
+	&dev_attr_npu_busy_time_us.attr,
+	NULL,
+};
+
+static struct attribute_group ivpu_dev_attr_group = {
+	.attrs = ivpu_dev_attrs,
+};
+
+void ivpu_sysfs_init(struct ivpu_device *vdev)
+{
+	int ret;
+
+	ret = devm_device_add_group(vdev->drm.dev, &ivpu_dev_attr_group);
+	if (ret)
+		ivpu_warn(vdev, "Failed to add group to device, ret %d", ret);
+}
diff --git a/drivers/accel/ivpu/ivpu_sysfs.h b/drivers/accel/ivpu/ivpu_sysfs.h
new file mode 100644
index 000000000000..9836f09b35a3
--- /dev/null
+++ b/drivers/accel/ivpu/ivpu_sysfs.h
@@ -0,0 +1,13 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2024 Intel Corporation
+ */
+
+#ifndef __IVPU_SYSFS_H__
+#define __IVPU_SYSFS_H__
+
+#include "ivpu_drv.h"
+
+void ivpu_sysfs_init(struct ivpu_device *vdev);
+
+#endif /* __IVPU_SYSFS_H__ */
-- 
2.43.2

