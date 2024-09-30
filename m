Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2166698AD79
	for <lists+dri-devel@lfdr.de>; Mon, 30 Sep 2024 21:54:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A15610E58A;
	Mon, 30 Sep 2024 19:54:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PQHoiEBx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D80810E582
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Sep 2024 19:54:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727726052; x=1759262052;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=TrCTt3Ti10v0cypJSaMZw1L7LWnEPpuW9ZiDlHQIwHQ=;
 b=PQHoiEBx7+Q4akSOTzcS1hfoFdTroDTPQCJHm7A4SAfy4Uv7L4XDymVw
 IIkJrYZ8ToEybR41UKjHh8TZPBPm+VcENbkboScHluc8Vr7f6ca4irpkO
 sjtlL/lD0q4k5xfqkMHJIKsd3p7FeTm7Tm10Uld0x4grPKW5i2sOgCQup
 JxZ3o4GTPttzAlXo5ZkmXUxOsFjuFIwnxnXkH+Ff2O87Ep+XgK9oLRbEj
 0jk5VH+rS8ydZfehFIY8pE3V0J7UpqgcZ0wqbnYuKE49YirGMYwS5rY6C
 2Hbgvyafs3aAqArpNQ6AzsNTFgokoaBp/YBUzF3Prrbf5eaZaSdiIn4x0 Q==;
X-CSE-ConnectionGUID: vfJZmDuYQpCzFCpWJhFpYA==
X-CSE-MsgGUID: ee1lbv9fQuaVvMc36F0h/A==
X-IronPort-AV: E=McAfee;i="6700,10204,11211"; a="26962393"
X-IronPort-AV: E=Sophos;i="6.11,166,1725346800"; d="scan'208";a="26962393"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2024 12:54:12 -0700
X-CSE-ConnectionGUID: h2SYVz8MSxCICNCCmQO1eA==
X-CSE-MsgGUID: G1MdQhsmRhSeJfeASmreoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,166,1725346800"; d="scan'208";a="73370260"
Received: from jlawryno.igk.intel.com ([10.91.220.59])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2024 12:54:10 -0700
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, quic_jhugo@quicinc.com,
 Jakub Pawlak <jakub.pawlak@intel.com>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Subject: [PATCH v2 30/31] accel/ivpu: Add tracing for IPC/PM/JOB
Date: Mon, 30 Sep 2024 21:53:21 +0200
Message-ID: <20240930195322.461209-31-jacek.lawrynowicz@linux.intel.com>
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

From: Jakub Pawlak <jakub.pawlak@intel.com>

Add multiple trace points in couple of key places to enable tracing
with ftrace.

Signed-off-by: Jakub Pawlak <jakub.pawlak@intel.com>
Reviewed-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
---
 drivers/accel/ivpu/Makefile            |  5 +-
 drivers/accel/ivpu/ivpu_ipc.c          |  3 ++
 drivers/accel/ivpu/ivpu_job.c          |  4 ++
 drivers/accel/ivpu/ivpu_pm.c           |  9 ++++
 drivers/accel/ivpu/ivpu_trace.h        | 73 ++++++++++++++++++++++++++
 drivers/accel/ivpu/ivpu_trace_points.c |  9 ++++
 6 files changed, 102 insertions(+), 1 deletion(-)
 create mode 100644 drivers/accel/ivpu/ivpu_trace.h
 create mode 100644 drivers/accel/ivpu/ivpu_trace_points.c

diff --git a/drivers/accel/ivpu/Makefile b/drivers/accel/ivpu/Makefile
index 232ea6d28c6e2..e73937c86d9ad 100644
--- a/drivers/accel/ivpu/Makefile
+++ b/drivers/accel/ivpu/Makefile
@@ -16,9 +16,12 @@ intel_vpu-y := \
 	ivpu_mmu_context.o \
 	ivpu_ms.o \
 	ivpu_pm.o \
-	ivpu_sysfs.o
+	ivpu_sysfs.o \
+	ivpu_trace_points.o
 
 intel_vpu-$(CONFIG_DEBUG_FS) += ivpu_debugfs.o
 intel_vpu-$(CONFIG_DEV_COREDUMP) += ivpu_coredump.o
 
 obj-$(CONFIG_DRM_ACCEL_IVPU) += intel_vpu.o
+
+CFLAGS_ivpu_trace_points.o = -I$(src)
diff --git a/drivers/accel/ivpu/ivpu_ipc.c b/drivers/accel/ivpu/ivpu_ipc.c
index c8ae69a529c0d..01ebf88fe6ef0 100644
--- a/drivers/accel/ivpu/ivpu_ipc.c
+++ b/drivers/accel/ivpu/ivpu_ipc.c
@@ -15,6 +15,7 @@
 #include "ivpu_ipc.h"
 #include "ivpu_jsm_msg.h"
 #include "ivpu_pm.h"
+#include "ivpu_trace.h"
 
 #define IPC_MAX_RX_MSG	128
 
@@ -227,6 +228,7 @@ int ivpu_ipc_send(struct ivpu_device *vdev, struct ivpu_ipc_consumer *cons, stru
 		goto unlock;
 
 	ivpu_ipc_tx(vdev, cons->tx_vpu_addr);
+	trace_jsm("[tx]", req);
 
 unlock:
 	mutex_unlock(&ipc->lock);
@@ -284,6 +286,7 @@ int ivpu_ipc_receive(struct ivpu_device *vdev, struct ivpu_ipc_consumer *cons,
 
 		if (jsm_msg)
 			memcpy(jsm_msg, rx_msg->jsm_msg, size);
+		trace_jsm("[rx]", rx_msg->jsm_msg);
 	}
 
 	ivpu_ipc_rx_msg_del(vdev, rx_msg);
diff --git a/drivers/accel/ivpu/ivpu_job.c b/drivers/accel/ivpu/ivpu_job.c
index cd41b87715056..98e0b7b614071 100644
--- a/drivers/accel/ivpu/ivpu_job.c
+++ b/drivers/accel/ivpu/ivpu_job.c
@@ -18,6 +18,7 @@
 #include "ivpu_job.h"
 #include "ivpu_jsm_msg.h"
 #include "ivpu_pm.h"
+#include "ivpu_trace.h"
 #include "vpu_boot_api.h"
 
 #define CMD_BUF_IDX	     0
@@ -482,6 +483,7 @@ ivpu_job_create(struct ivpu_file_priv *file_priv, u32 engine_idx, u32 bo_count)
 
 	job->file_priv = ivpu_file_priv_get(file_priv);
 
+	trace_job("create", job);
 	ivpu_dbg(vdev, JOB, "Job created: ctx %2d engine %d", file_priv->ctx.id, job->engine_idx);
 	return job;
 
@@ -521,6 +523,7 @@ static int ivpu_job_signal_and_destroy(struct ivpu_device *vdev, u32 job_id, u32
 	job->bos[CMD_BUF_IDX]->job_status = job_status;
 	dma_fence_signal(job->done_fence);
 
+	trace_job("done", job);
 	ivpu_dbg(vdev, JOB, "Job complete:  id %3u ctx %2d engine %d status 0x%x\n",
 		 job->job_id, job->file_priv->ctx.id, job->engine_idx, job_status);
 
@@ -588,6 +591,7 @@ static int ivpu_job_submit(struct ivpu_job *job, u8 priority)
 			vdev->busy_start_ts = ktime_get();
 	}
 
+	trace_job("submit", job);
 	ivpu_dbg(vdev, JOB, "Job submitted: id %3u ctx %2d engine %d prio %d addr 0x%llx next %d\n",
 		 job->job_id, file_priv->ctx.id, job->engine_idx, priority,
 		 job->cmd_buf_vpu_addr, cmdq->jobq->header.tail);
diff --git a/drivers/accel/ivpu/ivpu_pm.c b/drivers/accel/ivpu/ivpu_pm.c
index b5a69941e6e0a..6d180c81e6df9 100644
--- a/drivers/accel/ivpu/ivpu_pm.c
+++ b/drivers/accel/ivpu/ivpu_pm.c
@@ -20,6 +20,7 @@
 #include "ivpu_mmu.h"
 #include "ivpu_ms.h"
 #include "ivpu_pm.h"
+#include "ivpu_trace.h"
 #include "vpu_boot_api.h"
 
 static bool ivpu_disable_recovery;
@@ -198,6 +199,7 @@ int ivpu_pm_suspend_cb(struct device *dev)
 	struct ivpu_device *vdev = to_ivpu_device(drm);
 	unsigned long timeout;
 
+	trace_pm("suspend");
 	ivpu_dbg(vdev, PM, "Suspend..\n");
 
 	timeout = jiffies + msecs_to_jiffies(vdev->timeout.tdr);
@@ -215,6 +217,7 @@ int ivpu_pm_suspend_cb(struct device *dev)
 	ivpu_pm_prepare_warm_boot(vdev);
 
 	ivpu_dbg(vdev, PM, "Suspend done.\n");
+	trace_pm("suspend done");
 
 	return 0;
 }
@@ -225,6 +228,7 @@ int ivpu_pm_resume_cb(struct device *dev)
 	struct ivpu_device *vdev = to_ivpu_device(drm);
 	int ret;
 
+	trace_pm("resume");
 	ivpu_dbg(vdev, PM, "Resume..\n");
 
 	ret = ivpu_resume(vdev);
@@ -232,6 +236,7 @@ int ivpu_pm_resume_cb(struct device *dev)
 		ivpu_err(vdev, "Failed to resume: %d\n", ret);
 
 	ivpu_dbg(vdev, PM, "Resume done.\n");
+	trace_pm("resume done");
 
 	return ret;
 }
@@ -246,6 +251,7 @@ int ivpu_pm_runtime_suspend_cb(struct device *dev)
 	drm_WARN_ON(&vdev->drm, !xa_empty(&vdev->submitted_jobs_xa));
 	drm_WARN_ON(&vdev->drm, work_pending(&vdev->pm->recovery_work));
 
+	trace_pm("runtime suspend");
 	ivpu_dbg(vdev, PM, "Runtime suspend..\n");
 
 	ivpu_mmu_disable(vdev);
@@ -272,6 +278,7 @@ int ivpu_pm_runtime_suspend_cb(struct device *dev)
 	}
 
 	ivpu_dbg(vdev, PM, "Runtime suspend done.\n");
+	trace_pm("runtime suspend done");
 
 	return 0;
 }
@@ -282,6 +289,7 @@ int ivpu_pm_runtime_resume_cb(struct device *dev)
 	struct ivpu_device *vdev = to_ivpu_device(drm);
 	int ret;
 
+	trace_pm("runtime resume");
 	ivpu_dbg(vdev, PM, "Runtime resume..\n");
 
 	ret = ivpu_resume(vdev);
@@ -289,6 +297,7 @@ int ivpu_pm_runtime_resume_cb(struct device *dev)
 		ivpu_err(vdev, "Failed to set RESUME state: %d\n", ret);
 
 	ivpu_dbg(vdev, PM, "Runtime resume done.\n");
+	trace_pm("runtime resume done");
 
 	return ret;
 }
diff --git a/drivers/accel/ivpu/ivpu_trace.h b/drivers/accel/ivpu/ivpu_trace.h
new file mode 100644
index 0000000000000..eb792038e7010
--- /dev/null
+++ b/drivers/accel/ivpu/ivpu_trace.h
@@ -0,0 +1,73 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2020-2024 Intel Corporation
+ */
+
+#if !defined(__IVPU_TRACE_H__) || defined(TRACE_HEADER_MULTI_READ)
+#define __IVPU_TRACE_H__
+
+#include <linux/tracepoint.h>
+#include "ivpu_drv.h"
+#include "ivpu_job.h"
+#include "vpu_jsm_api.h"
+#include "ivpu_jsm_msg.h"
+#include "ivpu_ipc.h"
+
+#undef TRACE_SYSTEM
+#define TRACE_SYSTEM vpu
+#define TRACE_INCLUDE_FILE ivpu_trace
+
+TRACE_EVENT(pm,
+	    TP_PROTO(const char *event),
+	    TP_ARGS(event),
+	    TP_STRUCT__entry(__field(const char *, event)),
+	    TP_fast_assign(__entry->event = event;),
+	    TP_printk("%s", __entry->event)
+);
+
+TRACE_EVENT(job,
+	    TP_PROTO(const char *event, struct ivpu_job *job),
+	    TP_ARGS(event, job),
+	    TP_STRUCT__entry(__field(const char *, event)
+		__field(u32, ctx_id)
+		__field(u32, engine_id)
+		__field(u32, job_id)
+		),
+	    TP_fast_assign(__entry->event = event;
+		__entry->ctx_id = job->file_priv->ctx.id;
+		__entry->engine_id = job->engine_idx;
+		__entry->job_id = job->job_id;),
+	    TP_printk("%s context:%d engine:%d job:%d",
+		      __entry->event,
+		      __entry->ctx_id,
+		      __entry->engine_id,
+		      __entry->job_id)
+);
+
+TRACE_EVENT(jsm,
+	    TP_PROTO(const char *event, struct vpu_jsm_msg *msg),
+	    TP_ARGS(event, msg),
+	    TP_STRUCT__entry(__field(const char *, event)
+		__field(const char *, type)
+		__field(enum vpu_ipc_msg_status, status)
+		__field(u32, request_id)
+		__field(u32, result)
+		),
+	    TP_fast_assign(__entry->event = event;
+		__entry->type = ivpu_jsm_msg_type_to_str(msg->type);
+		__entry->status = msg->status;
+		__entry->request_id = msg->request_id;
+		__entry->result = msg->result;),
+	    TP_printk("%s type:%s, status:%#x, id:%#x, result:%#x",
+		      __entry->event,
+		      __entry->type,
+		      __entry->status,
+		      __entry->request_id,
+		      __entry->result)
+);
+
+#endif /* __IVPU_TRACE_H__ */
+
+#undef TRACE_INCLUDE_PATH
+#define TRACE_INCLUDE_PATH .
+#include <trace/define_trace.h>
diff --git a/drivers/accel/ivpu/ivpu_trace_points.c b/drivers/accel/ivpu/ivpu_trace_points.c
new file mode 100644
index 0000000000000..f8fb99de0de32
--- /dev/null
+++ b/drivers/accel/ivpu/ivpu_trace_points.c
@@ -0,0 +1,9 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2020-2024 Intel Corporation
+ */
+
+#ifndef __CHECKER__
+#define CREATE_TRACE_POINTS
+#include "ivpu_trace.h"
+#endif
-- 
2.45.1

