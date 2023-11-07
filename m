Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 31A1F7E3E37
	for <lists+dri-devel@lfdr.de>; Tue,  7 Nov 2023 13:35:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CC3010E5EB;
	Tue,  7 Nov 2023 12:35:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6291D10E5EB
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Nov 2023 12:35:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699360524; x=1730896524;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hFThxDtnAm0AWolW4vGGVnsHZXFHtERXAdVORAMzMx4=;
 b=ZmgdTS40AUOi9PaSSRwXuwIJrOBTm2mdxaxtVJUarkXkwwLKRCtULsIe
 pDnRfLOMcB1ArauiEV34fs1tdXBCUtiRLHDumY603Gj/0uh2QqJXf19bk
 cRIv7Yx958FBTNPImj8DcbiylCPMxX7b7jFzrCZj516sc4KsHQu2u/6Zq
 fhykxN0v1ps3C4qzfJBg/EBa0FK7iSBM82KU9Dephi6qfYE6eWUkU/w1o
 MGnUBNehdASM3JaVNXNgHimpKEpzN+YLaVU8vJzk0F3Amku129tcxfugd
 vprcgjfAeov/hSPrLRs/Pf9LLfPoLH34hjm7aqJ5Nda/VDDS+UXg2qZrW Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10886"; a="393396743"
X-IronPort-AV: E=Sophos;i="6.03,283,1694761200"; d="scan'208";a="393396743"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2023 04:35:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,283,1694761200"; 
   d="scan'208";a="3979145"
Received: from jlawryno.igk.intel.com ([10.91.220.59])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2023 04:35:23 -0800
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 4/5] accel/ivpu: Use dedicated work for job timeout detection
Date: Tue,  7 Nov 2023 13:35:13 +0100
Message-ID: <20231107123514.2218850-5-jacek.lawrynowicz@linux.intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231107123514.2218850-1-jacek.lawrynowicz@linux.intel.com>
References: <20231107123514.2218850-1-jacek.lawrynowicz@linux.intel.com>
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
Cc: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
 quic_jhugo@quicinc.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>

Change to use work for timeout detection. Needed for thread_irq
conversion.

Signed-off-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
---
 drivers/accel/ivpu/ivpu_job.c | 24 +++++++++---------------
 drivers/accel/ivpu/ivpu_pm.c  | 31 +++++++++++++++++++++++++++++++
 drivers/accel/ivpu/ivpu_pm.h  |  3 +++
 3 files changed, 43 insertions(+), 15 deletions(-)

diff --git a/drivers/accel/ivpu/ivpu_job.c b/drivers/accel/ivpu/ivpu_job.c
index 77b1b8abadd6..796366d67984 100644
--- a/drivers/accel/ivpu/ivpu_job.c
+++ b/drivers/accel/ivpu/ivpu_job.c
@@ -24,10 +24,6 @@
 #define JOB_ID_CONTEXT_MASK  GENMASK(31, 8)
 #define JOB_MAX_BUFFER_COUNT 65535
 
-static unsigned int ivpu_tdr_timeout_ms;
-module_param_named(tdr_timeout_ms, ivpu_tdr_timeout_ms, uint, 0644);
-MODULE_PARM_DESC(tdr_timeout_ms, "Timeout for device hang detection, in milliseconds, 0 - default");
-
 static void ivpu_cmdq_ring_db(struct ivpu_device *vdev, struct ivpu_cmdq *cmdq)
 {
 	ivpu_hw_reg_db_set(vdev, cmdq->db_id);
@@ -342,6 +338,8 @@ static int ivpu_job_done(struct ivpu_device *vdev, u32 job_id, u32 job_status)
 	ivpu_dbg(vdev, JOB, "Job complete:  id %3u ctx %2d engine %d status 0x%x\n",
 		 job->job_id, job->file_priv->ctx.id, job->engine_idx, job_status);
 
+	ivpu_stop_job_timeout_detection(vdev);
+
 	job_put(job);
 	return 0;
 }
@@ -357,6 +355,9 @@ static void ivpu_job_done_message(struct ivpu_device *vdev, void *msg)
 	ret = ivpu_job_done(vdev, payload->job_id, payload->job_status);
 	if (ret)
 		ivpu_err(vdev, "Failed to finish job %d: %d\n", payload->job_id, ret);
+
+	if (!ret && !xa_empty(&vdev->submitted_jobs_xa))
+		ivpu_start_job_timeout_detection(vdev);
 }
 
 void ivpu_jobs_abort_all(struct ivpu_device *vdev)
@@ -400,6 +401,8 @@ static int ivpu_direct_job_submission(struct ivpu_job *job)
 	if (ret)
 		goto err_xa_erase;
 
+	ivpu_start_job_timeout_detection(vdev);
+
 	ivpu_dbg(vdev, JOB, "Job submitted: id %3u addr 0x%llx ctx %2d engine %d next %d\n",
 		 job->job_id, job->cmd_buf_vpu_addr, file_priv->ctx.id,
 		 job->engine_idx, cmdq->jobq->header.tail);
@@ -569,7 +572,6 @@ static int ivpu_job_done_thread(void *arg)
 	struct ivpu_device *vdev = (struct ivpu_device *)arg;
 	struct ivpu_ipc_consumer cons;
 	struct vpu_jsm_msg jsm_msg;
-	bool jobs_submitted;
 	unsigned int timeout;
 	int ret;
 
@@ -578,18 +580,10 @@ static int ivpu_job_done_thread(void *arg)
 	ivpu_ipc_consumer_add(vdev, &cons, VPU_IPC_CHAN_JOB_RET);
 
 	while (!kthread_should_stop()) {
-		timeout = ivpu_tdr_timeout_ms ? ivpu_tdr_timeout_ms : vdev->timeout.tdr;
-		jobs_submitted = !xa_empty(&vdev->submitted_jobs_xa);
 		ret = ivpu_ipc_receive(vdev, &cons, NULL, &jsm_msg, timeout);
-		if (!ret) {
+		if (!ret)
 			ivpu_job_done_message(vdev, &jsm_msg);
-		} else if (ret == -ETIMEDOUT) {
-			if (jobs_submitted && !xa_empty(&vdev->submitted_jobs_xa)) {
-				ivpu_err(vdev, "TDR detected, timeout %d ms", timeout);
-				ivpu_hw_diagnose_failure(vdev);
-				ivpu_pm_schedule_recovery(vdev);
-			}
-		}
+
 		if (kthread_should_park()) {
 			ivpu_dbg(vdev, JOB, "Parked %s\n", __func__);
 			kthread_parkme();
diff --git a/drivers/accel/ivpu/ivpu_pm.c b/drivers/accel/ivpu/ivpu_pm.c
index d915f3c2991f..0af8864cb3b5 100644
--- a/drivers/accel/ivpu/ivpu_pm.c
+++ b/drivers/accel/ivpu/ivpu_pm.c
@@ -23,6 +23,10 @@ static bool ivpu_disable_recovery;
 module_param_named_unsafe(disable_recovery, ivpu_disable_recovery, bool, 0644);
 MODULE_PARM_DESC(disable_recovery, "Disables recovery when VPU hang is detected");
 
+static unsigned long ivpu_tdr_timeout_ms;
+module_param_named(tdr_timeout_ms, ivpu_tdr_timeout_ms, ulong, 0644);
+MODULE_PARM_DESC(tdr_timeout_ms, "Timeout for device hang detection, in milliseconds, 0 - default");
+
 #define PM_RESCHEDULE_LIMIT     5
 
 static void ivpu_pm_prepare_cold_boot(struct ivpu_device *vdev)
@@ -141,6 +145,31 @@ void ivpu_pm_schedule_recovery(struct ivpu_device *vdev)
 	}
 }
 
+static void ivpu_job_timeout_work(struct work_struct *work)
+{
+	struct ivpu_pm_info *pm = container_of(work, struct ivpu_pm_info, job_timeout_work.work);
+	struct ivpu_device *vdev = pm->vdev;
+	unsigned long timeout_ms = ivpu_tdr_timeout_ms ? ivpu_tdr_timeout_ms : vdev->timeout.tdr;
+
+	ivpu_err(vdev, "TDR detected, timeout %lu ms", timeout_ms);
+	ivpu_hw_diagnose_failure(vdev);
+
+	ivpu_pm_schedule_recovery(vdev);
+}
+
+void ivpu_start_job_timeout_detection(struct ivpu_device *vdev)
+{
+	unsigned long timeout_ms = ivpu_tdr_timeout_ms ? ivpu_tdr_timeout_ms : vdev->timeout.tdr;
+
+	/* No-op if already queued */
+	queue_delayed_work(system_wq, &vdev->pm->job_timeout_work, msecs_to_jiffies(timeout_ms));
+}
+
+void ivpu_stop_job_timeout_detection(struct ivpu_device *vdev)
+{
+	cancel_delayed_work_sync(&vdev->pm->job_timeout_work);
+}
+
 int ivpu_pm_suspend_cb(struct device *dev)
 {
 	struct drm_device *drm = dev_get_drvdata(dev);
@@ -317,6 +346,7 @@ void ivpu_pm_init(struct ivpu_device *vdev)
 
 	atomic_set(&pm->in_reset, 0);
 	INIT_WORK(&pm->recovery_work, ivpu_pm_recovery_work);
+	INIT_DELAYED_WORK(&pm->job_timeout_work, ivpu_job_timeout_work);
 
 	if (ivpu_disable_recovery)
 		delay = -1;
@@ -331,6 +361,7 @@ void ivpu_pm_init(struct ivpu_device *vdev)
 
 void ivpu_pm_cancel_recovery(struct ivpu_device *vdev)
 {
+	drm_WARN_ON(&vdev->drm, delayed_work_pending(&vdev->pm->job_timeout_work));
 	cancel_work_sync(&vdev->pm->recovery_work);
 }
 
diff --git a/drivers/accel/ivpu/ivpu_pm.h b/drivers/accel/ivpu/ivpu_pm.h
index 044db150be07..97c6e0b0aa42 100644
--- a/drivers/accel/ivpu/ivpu_pm.h
+++ b/drivers/accel/ivpu/ivpu_pm.h
@@ -12,6 +12,7 @@ struct ivpu_device;
 
 struct ivpu_pm_info {
 	struct ivpu_device *vdev;
+	struct delayed_work job_timeout_work;
 	struct work_struct recovery_work;
 	atomic_t in_reset;
 	atomic_t reset_counter;
@@ -37,5 +38,7 @@ int __must_check ivpu_rpm_get_if_active(struct ivpu_device *vdev);
 void ivpu_rpm_put(struct ivpu_device *vdev);
 
 void ivpu_pm_schedule_recovery(struct ivpu_device *vdev);
+void ivpu_start_job_timeout_detection(struct ivpu_device *vdev);
+void ivpu_stop_job_timeout_detection(struct ivpu_device *vdev);
 
 #endif /* __IVPU_PM_H__ */
-- 
2.42.0

