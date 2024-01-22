Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA4588362D1
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jan 2024 13:10:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B065910EE2F;
	Mon, 22 Jan 2024 12:09:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFACB10EE2F
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jan 2024 12:09:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705925393; x=1737461393;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1pS0f6QwIT2xkLrX/DUjfYJ+JmO2DrVwbFi5RqrCSRQ=;
 b=S1iUBiPUbYliiAYn/0a4OjaD54vl+zs/KYyZ6OVuEthEzgBqx5V7DHZQ
 5zOu6IM8RagItw03SUFOH6n7fFB6dIy27QbSTfNfZemfO9teFceIUJisv
 OBLAmo8iLjHs3odceb7zRm6Eu4O0vJkIE2pqgKvfrie0KtjRSjP/E6zJn
 vQ/uhkMZAYr5trR2l3ydews9nKI9B14ZkUjOGB5xtcc8Z8GMg52J4zmdA
 myDc8AGj8mjM9RhFwBzGALlzSJHVY2RiNd4Qp4aTmLEqdOFK+UGNOeibI
 V6M7u9G7eMw7ioaiMCzwgpoUrCPOX729SKC4u58Y9wFzLdL22uMTvTzD6 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10960"; a="432353300"
X-IronPort-AV: E=Sophos;i="6.05,211,1701158400"; d="scan'208";a="432353300"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2024 04:09:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10960"; a="904834064"
X-IronPort-AV: E=Sophos;i="6.05,211,1701158400"; d="scan'208";a="904834064"
Received: from jlawryno.igk.intel.com ([10.91.220.59])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2024 04:09:52 -0800
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 3/3] accel/ivpu: Improve recovery and reset support
Date: Mon, 22 Jan 2024 13:09:45 +0100
Message-ID: <20240122120945.1150728-4-jacek.lawrynowicz@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240122120945.1150728-1-jacek.lawrynowicz@linux.intel.com>
References: <20240122120945.1150728-1-jacek.lawrynowicz@linux.intel.com>
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
Cc: oded.gabbay@gmail.com, quic_jhugo@quicinc.com,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

  - Synchronize job submission with reset/recovery using reset_lock
  - Always print recovery reason and call diagnose_failure()
  - Don't allow for autosupend during recovery
  - Prevent immediate autosuspend after reset/recovery
  - Prevent force_recovery for issuing TDR when device is suspended
  - Reset VPU instead triggering recovery after changing debugfs params

Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
---
 drivers/accel/ivpu/ivpu_debugfs.c | 20 ++++++++++---
 drivers/accel/ivpu/ivpu_hw_37xx.c | 14 +++------
 drivers/accel/ivpu/ivpu_hw_40xx.c |  8 +++---
 drivers/accel/ivpu/ivpu_ipc.c     |  6 ++--
 drivers/accel/ivpu/ivpu_job.c     |  2 ++
 drivers/accel/ivpu/ivpu_mmu.c     | 14 ++++-----
 drivers/accel/ivpu/ivpu_pm.c      | 48 ++++++++++++++++++++-----------
 drivers/accel/ivpu/ivpu_pm.h      |  6 ++--
 8 files changed, 70 insertions(+), 48 deletions(-)

diff --git a/drivers/accel/ivpu/ivpu_debugfs.c b/drivers/accel/ivpu/ivpu_debugfs.c
index 19035230563d..7cb962e21453 100644
--- a/drivers/accel/ivpu/ivpu_debugfs.c
+++ b/drivers/accel/ivpu/ivpu_debugfs.c
@@ -102,7 +102,7 @@ static int reset_pending_show(struct seq_file *s, void *v)
 {
 	struct ivpu_device *vdev = seq_to_ivpu(s);
 
-	seq_printf(s, "%d\n", atomic_read(&vdev->pm->in_reset));
+	seq_printf(s, "%d\n", atomic_read(&vdev->pm->reset_pending));
 	return 0;
 }
 
@@ -130,7 +130,9 @@ dvfs_mode_fops_write(struct file *file, const char __user *user_buf, size_t size
 
 	fw->dvfs_mode = dvfs_mode;
 
-	ivpu_pm_schedule_recovery(vdev);
+	ret = pci_try_reset_function(to_pci_dev(vdev->drm.dev));
+	if (ret)
+		return ret;
 
 	return size;
 }
@@ -190,7 +192,10 @@ fw_profiling_freq_fops_write(struct file *file, const char __user *user_buf,
 		return ret;
 
 	ivpu_hw_profiling_freq_drive(vdev, enable);
-	ivpu_pm_schedule_recovery(vdev);
+
+	ret = pci_try_reset_function(to_pci_dev(vdev->drm.dev));
+	if (ret)
+		return ret;
 
 	return size;
 }
@@ -301,11 +306,18 @@ static ssize_t
 ivpu_force_recovery_fn(struct file *file, const char __user *user_buf, size_t size, loff_t *pos)
 {
 	struct ivpu_device *vdev = file->private_data;
+	int ret;
 
 	if (!size)
 		return -EINVAL;
 
-	ivpu_pm_schedule_recovery(vdev);
+	ret = ivpu_rpm_get(vdev);
+	if (ret)
+		return ret;
+
+	ivpu_pm_trigger_recovery(vdev, "debugfs");
+	flush_work(&vdev->pm->recovery_work);
+	ivpu_rpm_put(vdev);
 	return size;
 }
 
diff --git a/drivers/accel/ivpu/ivpu_hw_37xx.c b/drivers/accel/ivpu/ivpu_hw_37xx.c
index 574cdeefb66b..f15a93d83057 100644
--- a/drivers/accel/ivpu/ivpu_hw_37xx.c
+++ b/drivers/accel/ivpu/ivpu_hw_37xx.c
@@ -875,24 +875,18 @@ static void ivpu_hw_37xx_irq_disable(struct ivpu_device *vdev)
 
 static void ivpu_hw_37xx_irq_wdt_nce_handler(struct ivpu_device *vdev)
 {
-	ivpu_err_ratelimited(vdev, "WDT NCE irq\n");
-
-	ivpu_pm_schedule_recovery(vdev);
+	ivpu_pm_trigger_recovery(vdev, "WDT NCE IRQ");
 }
 
 static void ivpu_hw_37xx_irq_wdt_mss_handler(struct ivpu_device *vdev)
 {
-	ivpu_err_ratelimited(vdev, "WDT MSS irq\n");
-
 	ivpu_hw_wdt_disable(vdev);
-	ivpu_pm_schedule_recovery(vdev);
+	ivpu_pm_trigger_recovery(vdev, "WDT MSS IRQ");
 }
 
 static void ivpu_hw_37xx_irq_noc_firewall_handler(struct ivpu_device *vdev)
 {
-	ivpu_err_ratelimited(vdev, "NOC Firewall irq\n");
-
-	ivpu_pm_schedule_recovery(vdev);
+	ivpu_pm_trigger_recovery(vdev, "NOC Firewall IRQ");
 }
 
 /* Handler for IRQs from VPU core (irqV) */
@@ -970,7 +964,7 @@ static bool ivpu_hw_37xx_irqb_handler(struct ivpu_device *vdev, int irq)
 		REGB_WR32(VPU_37XX_BUTTRESS_INTERRUPT_STAT, status);
 
 	if (schedule_recovery)
-		ivpu_pm_schedule_recovery(vdev);
+		ivpu_pm_trigger_recovery(vdev, "Buttress IRQ");
 
 	return true;
 }
diff --git a/drivers/accel/ivpu/ivpu_hw_40xx.c b/drivers/accel/ivpu/ivpu_hw_40xx.c
index eba2fdef2ace..af7081cadaae 100644
--- a/drivers/accel/ivpu/ivpu_hw_40xx.c
+++ b/drivers/accel/ivpu/ivpu_hw_40xx.c
@@ -1032,18 +1032,18 @@ static void ivpu_hw_40xx_irq_disable(struct ivpu_device *vdev)
 static void ivpu_hw_40xx_irq_wdt_nce_handler(struct ivpu_device *vdev)
 {
 	/* TODO: For LNN hang consider engine reset instead of full recovery */
-	ivpu_pm_schedule_recovery(vdev);
+	ivpu_pm_trigger_recovery(vdev, "WDT NCE IRQ");
 }
 
 static void ivpu_hw_40xx_irq_wdt_mss_handler(struct ivpu_device *vdev)
 {
 	ivpu_hw_wdt_disable(vdev);
-	ivpu_pm_schedule_recovery(vdev);
+	ivpu_pm_trigger_recovery(vdev, "WDT MSS IRQ");
 }
 
 static void ivpu_hw_40xx_irq_noc_firewall_handler(struct ivpu_device *vdev)
 {
-	ivpu_pm_schedule_recovery(vdev);
+	ivpu_pm_trigger_recovery(vdev, "NOC Firewall IRQ");
 }
 
 /* Handler for IRQs from VPU core (irqV) */
@@ -1137,7 +1137,7 @@ static bool ivpu_hw_40xx_irqb_handler(struct ivpu_device *vdev, int irq)
 	REGB_WR32(VPU_40XX_BUTTRESS_INTERRUPT_STAT, status);
 
 	if (schedule_recovery)
-		ivpu_pm_schedule_recovery(vdev);
+		ivpu_pm_trigger_recovery(vdev, "Buttress IRQ");
 
 	return true;
 }
diff --git a/drivers/accel/ivpu/ivpu_ipc.c b/drivers/accel/ivpu/ivpu_ipc.c
index e86621f16f85..fa66c39b57ec 100644
--- a/drivers/accel/ivpu/ivpu_ipc.c
+++ b/drivers/accel/ivpu/ivpu_ipc.c
@@ -343,10 +343,8 @@ int ivpu_ipc_send_receive_active(struct ivpu_device *vdev, struct vpu_jsm_msg *r
 	hb_ret = ivpu_ipc_send_receive_internal(vdev, &hb_req, VPU_JSM_MSG_QUERY_ENGINE_HB_DONE,
 						&hb_resp, VPU_IPC_CHAN_ASYNC_CMD,
 						vdev->timeout.jsm);
-	if (hb_ret == -ETIMEDOUT) {
-		ivpu_hw_diagnose_failure(vdev);
-		ivpu_pm_schedule_recovery(vdev);
-	}
+	if (hb_ret == -ETIMEDOUT)
+		ivpu_pm_trigger_recovery(vdev, "IPC timeout");
 
 	return ret;
 }
diff --git a/drivers/accel/ivpu/ivpu_job.c b/drivers/accel/ivpu/ivpu_job.c
index d9b47a04b35f..0440bee3ecaf 100644
--- a/drivers/accel/ivpu/ivpu_job.c
+++ b/drivers/accel/ivpu/ivpu_job.c
@@ -515,7 +515,9 @@ int ivpu_submit_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 		goto err_destroy_job;
 	}
 
+	down_read(&vdev->pm->reset_lock);
 	ret = ivpu_job_submit(job);
+	up_read(&vdev->pm->reset_lock);
 	if (ret)
 		goto err_signal_fence;
 
diff --git a/drivers/accel/ivpu/ivpu_mmu.c b/drivers/accel/ivpu/ivpu_mmu.c
index 1f813625aab3..9a3122ffce03 100644
--- a/drivers/accel/ivpu/ivpu_mmu.c
+++ b/drivers/accel/ivpu/ivpu_mmu.c
@@ -887,7 +887,6 @@ static u32 *ivpu_mmu_get_event(struct ivpu_device *vdev)
 
 void ivpu_mmu_irq_evtq_handler(struct ivpu_device *vdev)
 {
-	bool schedule_recovery = false;
 	u32 *event;
 	u32 ssid;
 
@@ -897,14 +896,13 @@ void ivpu_mmu_irq_evtq_handler(struct ivpu_device *vdev)
 		ivpu_mmu_dump_event(vdev, event);
 
 		ssid = FIELD_GET(IVPU_MMU_EVT_SSID_MASK, event[0]);
-		if (ssid == IVPU_GLOBAL_CONTEXT_MMU_SSID)
-			schedule_recovery = true;
-		else
-			ivpu_mmu_user_context_mark_invalid(vdev, ssid);
-	}
+		if (ssid == IVPU_GLOBAL_CONTEXT_MMU_SSID) {
+			ivpu_pm_trigger_recovery(vdev, "MMU event");
+			return;
+		}
 
-	if (schedule_recovery)
-		ivpu_pm_schedule_recovery(vdev);
+		ivpu_mmu_user_context_mark_invalid(vdev, ssid);
+	}
 }
 
 void ivpu_mmu_evtq_dump(struct ivpu_device *vdev)
diff --git a/drivers/accel/ivpu/ivpu_pm.c b/drivers/accel/ivpu/ivpu_pm.c
index 8407f1d8c99c..f501f27ebafd 100644
--- a/drivers/accel/ivpu/ivpu_pm.c
+++ b/drivers/accel/ivpu/ivpu_pm.c
@@ -112,6 +112,14 @@ static void ivpu_pm_recovery_work(struct work_struct *work)
 	char *evt[2] = {"IVPU_PM_EVENT=IVPU_RECOVER", NULL};
 	int ret;
 
+	ivpu_err(vdev, "Recovering the VPU (reset #%d)\n", atomic_read(&vdev->pm->reset_counter));
+
+	ret = pm_runtime_resume_and_get(vdev->drm.dev);
+	if (ret)
+		ivpu_err(vdev, "Failed to resume VPU: %d\n", ret);
+
+	ivpu_fw_log_dump(vdev);
+
 retry:
 	ret = pci_try_reset_function(to_pci_dev(vdev->drm.dev));
 	if (ret == -EAGAIN && !drm_dev_is_unplugged(&vdev->drm)) {
@@ -123,11 +131,13 @@ static void ivpu_pm_recovery_work(struct work_struct *work)
 		ivpu_err(vdev, "Failed to reset VPU: %d\n", ret);
 
 	kobject_uevent_env(&vdev->drm.dev->kobj, KOBJ_CHANGE, evt);
+	pm_runtime_mark_last_busy(vdev->drm.dev);
+	pm_runtime_put_autosuspend(vdev->drm.dev);
 }
 
-void ivpu_pm_schedule_recovery(struct ivpu_device *vdev)
+void ivpu_pm_trigger_recovery(struct ivpu_device *vdev, const char *reason)
 {
-	struct ivpu_pm_info *pm = vdev->pm;
+	ivpu_err(vdev, "Recovery triggered by %s\n", reason);
 
 	if (ivpu_disable_recovery) {
 		ivpu_err(vdev, "Recovery not available when disable_recovery param is set\n");
@@ -139,10 +149,11 @@ void ivpu_pm_schedule_recovery(struct ivpu_device *vdev)
 		return;
 	}
 
-	/* Schedule recovery if it's not in progress */
-	if (atomic_cmpxchg(&pm->in_reset, 0, 1) == 0) {
-		ivpu_hw_irq_disable(vdev);
-		queue_work(system_long_wq, &pm->recovery_work);
+	/* Trigger recovery if it's not in progress */
+	if (atomic_cmpxchg(&vdev->pm->reset_pending, 0, 1) == 0) {
+		ivpu_hw_diagnose_failure(vdev);
+		ivpu_hw_irq_disable(vdev); /* Disable IRQ early to protect from IRQ storm */
+		queue_work(system_long_wq, &vdev->pm->recovery_work);
 	}
 }
 
@@ -150,12 +161,8 @@ static void ivpu_job_timeout_work(struct work_struct *work)
 {
 	struct ivpu_pm_info *pm = container_of(work, struct ivpu_pm_info, job_timeout_work.work);
 	struct ivpu_device *vdev = pm->vdev;
-	unsigned long timeout_ms = ivpu_tdr_timeout_ms ? ivpu_tdr_timeout_ms : vdev->timeout.tdr;
 
-	ivpu_err(vdev, "TDR detected, timeout %lu ms", timeout_ms);
-	ivpu_hw_diagnose_failure(vdev);
-
-	ivpu_pm_schedule_recovery(vdev);
+	ivpu_pm_trigger_recovery(vdev, "TDR");
 }
 
 void ivpu_start_job_timeout_detection(struct ivpu_device *vdev)
@@ -228,6 +235,9 @@ int ivpu_pm_runtime_suspend_cb(struct device *dev)
 	bool hw_is_idle = true;
 	int ret;
 
+	drm_WARN_ON(&vdev->drm, !xa_empty(&vdev->submitted_jobs_xa));
+	drm_WARN_ON(&vdev->drm, work_pending(&vdev->pm->recovery_work));
+
 	ivpu_dbg(vdev, PM, "Runtime suspend..\n");
 
 	if (!ivpu_hw_is_idle(vdev) && vdev->pm->suspend_reschedule_counter) {
@@ -310,11 +320,12 @@ void ivpu_pm_reset_prepare_cb(struct pci_dev *pdev)
 {
 	struct ivpu_device *vdev = pci_get_drvdata(pdev);
 
-	pm_runtime_get_sync(vdev->drm.dev);
-
 	ivpu_dbg(vdev, PM, "Pre-reset..\n");
 	atomic_inc(&vdev->pm->reset_counter);
-	atomic_set(&vdev->pm->in_reset, 1);
+	atomic_set(&vdev->pm->reset_pending, 1);
+
+	pm_runtime_get_sync(vdev->drm.dev);
+	down_write(&vdev->pm->reset_lock);
 	ivpu_prepare_for_reset(vdev);
 	ivpu_hw_reset(vdev);
 	ivpu_pm_prepare_cold_boot(vdev);
@@ -331,9 +342,11 @@ void ivpu_pm_reset_done_cb(struct pci_dev *pdev)
 	ret = ivpu_resume(vdev);
 	if (ret)
 		ivpu_err(vdev, "Failed to set RESUME state: %d\n", ret);
-	atomic_set(&vdev->pm->in_reset, 0);
+	up_write(&vdev->pm->reset_lock);
+	atomic_set(&vdev->pm->reset_pending, 0);
 	ivpu_dbg(vdev, PM, "Post-reset done.\n");
 
+	pm_runtime_mark_last_busy(vdev->drm.dev);
 	pm_runtime_put_autosuspend(vdev->drm.dev);
 }
 
@@ -346,7 +359,10 @@ void ivpu_pm_init(struct ivpu_device *vdev)
 	pm->vdev = vdev;
 	pm->suspend_reschedule_counter = PM_RESCHEDULE_LIMIT;
 
-	atomic_set(&pm->in_reset, 0);
+	init_rwsem(&pm->reset_lock);
+	atomic_set(&pm->reset_pending, 0);
+	atomic_set(&pm->reset_counter, 0);
+
 	INIT_WORK(&pm->recovery_work, ivpu_pm_recovery_work);
 	INIT_DELAYED_WORK(&pm->job_timeout_work, ivpu_job_timeout_work);
 
diff --git a/drivers/accel/ivpu/ivpu_pm.h b/drivers/accel/ivpu/ivpu_pm.h
index 97c6e0b0aa42..ec60fbeefefc 100644
--- a/drivers/accel/ivpu/ivpu_pm.h
+++ b/drivers/accel/ivpu/ivpu_pm.h
@@ -6,6 +6,7 @@
 #ifndef __IVPU_PM_H__
 #define __IVPU_PM_H__
 
+#include <linux/rwsem.h>
 #include <linux/types.h>
 
 struct ivpu_device;
@@ -14,8 +15,9 @@ struct ivpu_pm_info {
 	struct ivpu_device *vdev;
 	struct delayed_work job_timeout_work;
 	struct work_struct recovery_work;
-	atomic_t in_reset;
+	struct rw_semaphore reset_lock;
 	atomic_t reset_counter;
+	atomic_t reset_pending;
 	bool is_warmboot;
 	u32 suspend_reschedule_counter;
 };
@@ -37,7 +39,7 @@ int __must_check ivpu_rpm_get(struct ivpu_device *vdev);
 int __must_check ivpu_rpm_get_if_active(struct ivpu_device *vdev);
 void ivpu_rpm_put(struct ivpu_device *vdev);
 
-void ivpu_pm_schedule_recovery(struct ivpu_device *vdev);
+void ivpu_pm_trigger_recovery(struct ivpu_device *vdev, const char *reason);
 void ivpu_start_job_timeout_detection(struct ivpu_device *vdev);
 void ivpu_stop_job_timeout_detection(struct ivpu_device *vdev);
 
-- 
2.43.0

