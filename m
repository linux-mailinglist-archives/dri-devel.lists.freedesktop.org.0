Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 52A489D1147
	for <lists+dri-devel@lfdr.de>; Mon, 18 Nov 2024 14:03:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0545E10E4CC;
	Mon, 18 Nov 2024 13:03:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=imgtec.com header.i=@imgtec.com header.b="o3EadhPo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00376f01.pphosted.com (mx07-00376f01.pphosted.com
 [185.132.180.163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2205D10E4C1
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Nov 2024 13:02:50 +0000 (UTC)
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
 by mx07-00376f01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AICKePk029230;
 Mon, 18 Nov 2024 13:02:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
 :content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=dk201812; bh=W
 /CTGCf37YrKQ7xipA/eXKOe0Krs1+mYNDjHoF/2hM4=; b=o3EadhPolVqiRYqjp
 ljepmZrpGl1YFLGR/hheFO2i6I2n2oiae/Z16tsxJcmZqJKk4bqwJX3FwWwzQuga
 E+mvkbkzd0xe/TpVghIsyQFxt2c8rpfCmMmAgyWnBrhb4sbdaM/EpzVFwEmgeCD+
 dll6NBeWwybhpofBO8ldK0MXpFCSSWslZuj7sB5hJ7E2cYJg0p4oQHXt7uNihAC2
 T/t/dUMX/rJ3/0/wOYrA6wkqUsHUx8X7cjpHpKBUqomDuRDMwhG9vfQT+w2kCntH
 yh13oUARUG6TXQaNhqPoudtRcQFId3eYyUOqPP0u+lJfBkxXygSv/I5RJkp4mUDr
 ba9+A==
Received: from hhmail05.hh.imgtec.org
 (83-244-153-141.cust-83.exponential-e.net [83.244.153.141])
 by mx07-00376f01.pphosted.com (PPS) with ESMTPS id 42xmc1hmj2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Mon, 18 Nov 2024 13:02:38 +0000 (GMT)
Received: from
 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa
 (172.25.16.114) by HHMAIL05.hh.imgtec.org (10.100.10.120) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.37; Mon, 18 Nov 2024 13:02:37 +0000
From: Matt Coster <matt.coster@imgtec.com>
Date: Mon, 18 Nov 2024 13:02:01 +0000
Subject: [PATCH v2 09/21] drm/imagination: Revert to non-threaded IRQs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241118-sets-bxs-4-64-patch-v1-v2-9-3fd45d9fb0cf@imgtec.com>
References: <20241118-sets-bxs-4-64-patch-v1-v2-0-3fd45d9fb0cf@imgtec.com>
In-Reply-To: <20241118-sets-bxs-4-64-patch-v1-v2-0-3fd45d9fb0cf@imgtec.com>
To: Frank Binns <frank.binns@imgtec.com>, Matt Coster <matt.coster@imgtec.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Nishanth Menon <nm@ti.com>, "Vignesh
 Raghavendra" <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>
CC: <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 Randolph Sapp <rs@ti.com>, Darren Etheridge <detheridge@ti.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=12417;
 i=matt.coster@imgtec.com; h=from:subject:message-id;
 bh=fqYyXHPumIuy6+GbVwJYarv1fjdoowD8X4wyH3FYNA0=;
 b=owGbwMvMwCFWuUfy8817WRsYT6slMaRbWz1VM5i7U3LtIs2VP3if7D/dFP5+D5tkRZh05p9VR
 QLSSyVmdpSyMIhxMMiKKbLsWGG5Qu2PmpbEjV/FMHNYmUCGMHBxCsBEyu4w/JVY6OPWeMORZS2L
 fjtr+aMZotdKzmjN+qKQqNjYtDlRt5GR4UADS/KzCSaRT+f4uou9uXXsWPRJnw08ambOT/zDzmv
 PYgEA
X-Developer-Key: i=matt.coster@imgtec.com; a=openpgp;
 fpr=05A40CFCE7269D61D97100A1747F0A9036F90DFA
X-Originating-IP: [172.25.16.114]
X-EXCLAIMER-MD-CONFIG: 15a78312-3e47-46eb-9010-2e54d84a9631
X-Proofpoint-ORIG-GUID: ba_yTsHJh6CK94QP5HOnI4TAZYKhiXRz
X-Authority-Analysis: v=2.4 cv=E4efprdl c=1 sm=1 tr=0 ts=673b3aee cx=c_pps
 a=AKOq//PuzOIrVTIF9yBwbA==:117 a=AKOq//PuzOIrVTIF9yBwbA==:17
 a=hzDjp0mCheYA:10 a=IkcTkHD0fZMA:10 a=VlfZXiiP6vEA:10 a=VwQbUJbxAAAA:8
 a=r_1tXGB3AAAA:8 a=1hQr5poaKPxSApStpg4A:9
 a=QEXdDO2ut3YA:10 a=t8nPyN_e6usw4ciXM-Pk:22
X-Proofpoint-GUID: ba_yTsHJh6CK94QP5HOnI4TAZYKhiXRz
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

For some reason, threaded IRQs do not play nice with the RISC-V firmware
processor in BXS on our test platform (TI AM68).

Until we can resolve this issue, revert to a more traditional workqueue-
based IRQ implementation so the platform is at least functional.

Signed-off-by: Matt Coster <matt.coster@imgtec.com>
---
Changes in v2:
- None
- Link to v1: https://lore.kernel.org/r/20241105-sets-bxs-4-64-patch-v1-v1-9-4ed30e865892@imgtec.com
---
 drivers/gpu/drm/imagination/pvr_ccb.c    | 25 +++++++--
 drivers/gpu/drm/imagination/pvr_device.c | 94 ++++++++++----------------------
 drivers/gpu/drm/imagination/pvr_device.h | 12 ++++
 drivers/gpu/drm/imagination/pvr_fw.c     |  1 +
 drivers/gpu/drm/imagination/pvr_power.c  |  4 +-
 drivers/gpu/drm/imagination/pvr_queue.c  | 23 +++++++-
 6 files changed, 87 insertions(+), 72 deletions(-)

diff --git a/drivers/gpu/drm/imagination/pvr_ccb.c b/drivers/gpu/drm/imagination/pvr_ccb.c
index 2bbdc05a3b97791426fd1f2ffe8f306d15622901..3bc3dc1bcc30ace720a09a2af5cadc1c6ccfd93f 100644
--- a/drivers/gpu/drm/imagination/pvr_ccb.c
+++ b/drivers/gpu/drm/imagination/pvr_ccb.c
@@ -156,6 +156,13 @@ process_fwccb_command(struct pvr_device *pvr_dev, struct rogue_fwif_fwccb_cmd *c
 	}
 }
 
+static void pvr_fwccb_process_worker(struct work_struct *work)
+{
+	struct pvr_device *pvr_dev = container_of_const(work, struct pvr_device, fwccb_work);
+
+	pvr_fwccb_process(pvr_dev);
+}
+
 /**
  * pvr_fwccb_process() - Process any pending FWCCB commands
  * @pvr_dev: Target PowerVR device
@@ -463,19 +470,16 @@ struct pvr_kccb_fence {
 };
 
 /**
- * pvr_kccb_wake_up_waiters() - Check the KCCB waiters
+ * pvr_kccb_check_waiters() - Check the KCCB waiters
  * @pvr_dev: Target PowerVR device
  *
  * Signal as many KCCB fences as we have slots available.
  */
-void pvr_kccb_wake_up_waiters(struct pvr_device *pvr_dev)
+static void pvr_kccb_check_waiters(struct pvr_device *pvr_dev)
 {
 	struct pvr_kccb_fence *fence, *tmp_fence;
 	u32 used_count, available_count;
 
-	/* Wake up those waiting for KCCB slot execution. */
-	wake_up_all(&pvr_dev->kccb.rtn_q);
-
 	/* Then iterate over all KCCB fences and signal as many as we can. */
 	mutex_lock(&pvr_dev->kccb.ccb.lock);
 	used_count = pvr_kccb_used_slot_count_locked(pvr_dev);
@@ -499,12 +503,20 @@ void pvr_kccb_wake_up_waiters(struct pvr_device *pvr_dev)
 	mutex_unlock(&pvr_dev->kccb.ccb.lock);
 }
 
+static void pvr_kccb_process_worker(struct work_struct *work)
+{
+	struct pvr_device *pvr_dev = container_of_const(work, struct pvr_device, kccb.work);
+
+	pvr_kccb_check_waiters(pvr_dev);
+}
+
 /**
  * pvr_kccb_fini() - Cleanup device KCCB
  * @pvr_dev: Target PowerVR device
  */
 void pvr_kccb_fini(struct pvr_device *pvr_dev)
 {
+	cancel_work_sync(&pvr_dev->kccb.work);
 	pvr_ccb_fini(&pvr_dev->kccb.ccb);
 	WARN_ON(!list_empty(&pvr_dev->kccb.waiters));
 	WARN_ON(pvr_dev->kccb.reserved_count);
@@ -525,6 +537,7 @@ pvr_kccb_init(struct pvr_device *pvr_dev)
 	INIT_LIST_HEAD(&pvr_dev->kccb.waiters);
 	pvr_dev->kccb.fence_ctx.id = dma_fence_context_alloc(1);
 	spin_lock_init(&pvr_dev->kccb.fence_ctx.lock);
+	INIT_WORK(&pvr_dev->kccb.work, pvr_kccb_process_worker);
 
 	return pvr_ccb_init(pvr_dev, &pvr_dev->kccb.ccb,
 			    ROGUE_FWIF_KCCB_NUMCMDS_LOG2_DEFAULT,
@@ -639,6 +652,8 @@ void pvr_kccb_release_slot(struct pvr_device *pvr_dev)
 int
 pvr_fwccb_init(struct pvr_device *pvr_dev)
 {
+	INIT_WORK(&pvr_dev->fwccb_work, pvr_fwccb_process_worker);
+
 	return pvr_ccb_init(pvr_dev, &pvr_dev->fwccb,
 			    ROGUE_FWIF_FWCCB_NUMCMDS_LOG2,
 			    sizeof(struct rogue_fwif_fwccb_cmd));
diff --git a/drivers/gpu/drm/imagination/pvr_device.c b/drivers/gpu/drm/imagination/pvr_device.c
index 1704c0268589bdeb65fa6535f9ec63182b0a3e94..43411fe64fcecd8f84c0ceabb329f2901d63ed93 100644
--- a/drivers/gpu/drm/imagination/pvr_device.c
+++ b/drivers/gpu/drm/imagination/pvr_device.c
@@ -120,72 +120,24 @@ static int pvr_device_clk_init(struct pvr_device *pvr_dev)
 	return 0;
 }
 
-/**
- * pvr_device_process_active_queues() - Process all queue related events.
- * @pvr_dev: PowerVR device to check
- *
- * This is called any time we receive a FW event. It iterates over all
- * active queues and calls pvr_queue_process() on them.
- */
-static void pvr_device_process_active_queues(struct pvr_device *pvr_dev)
-{
-	struct pvr_queue *queue, *tmp_queue;
-	LIST_HEAD(active_queues);
-
-	mutex_lock(&pvr_dev->queues.lock);
-
-	/* Move all active queues to a temporary list. Queues that remain
-	 * active after we're done processing them are re-inserted to
-	 * the queues.active list by pvr_queue_process().
-	 */
-	list_splice_init(&pvr_dev->queues.active, &active_queues);
-
-	list_for_each_entry_safe(queue, tmp_queue, &active_queues, node)
-		pvr_queue_process(queue);
-
-	mutex_unlock(&pvr_dev->queues.lock);
-}
-
-static irqreturn_t pvr_device_irq_thread_handler(int irq, void *data)
+static irqreturn_t pvr_device_irq_handler(int irq, void *data)
 {
 	struct pvr_device *pvr_dev = data;
-	irqreturn_t ret = IRQ_NONE;
-
-	/* We are in the threaded handler, we can keep dequeuing events until we
-	 * don't see any. This should allow us to reduce the number of interrupts
-	 * when the GPU is receiving a massive amount of short jobs.
-	 */
-	while (pvr_fw_irq_pending(pvr_dev)) {
-		pvr_fw_irq_clear(pvr_dev);
 
-		if (pvr_dev->fw_dev.booted) {
-			pvr_fwccb_process(pvr_dev);
-			pvr_kccb_wake_up_waiters(pvr_dev);
-			pvr_device_process_active_queues(pvr_dev);
-		}
+	if (!pvr_fw_irq_pending(pvr_dev))
+		return IRQ_NONE; /* Spurious IRQ - ignore */
 
-		pm_runtime_mark_last_busy(from_pvr_device(pvr_dev)->dev);
+	pvr_fw_irq_clear(pvr_dev);
 
-		ret = IRQ_HANDLED;
+	/* Only process IRQ work if FW is currently running */
+	if (pvr_dev->fw_dev.booted) {
+		queue_work(pvr_dev->irq_wq, &pvr_dev->fwccb_work);
+		wake_up_all(&pvr_dev->kccb.rtn_q);
+		queue_work(pvr_dev->irq_wq, &pvr_dev->kccb.work);
+		queue_work(pvr_dev->irq_wq, &pvr_dev->queues.work);
 	}
 
-	/* Unmask FW irqs before returning, so new interrupts can be received. */
-	pvr_fw_irq_enable(pvr_dev);
-	return ret;
-}
-
-static irqreturn_t pvr_device_irq_handler(int irq, void *data)
-{
-	struct pvr_device *pvr_dev = data;
-
-	if (!pvr_fw_irq_pending(pvr_dev))
-		return IRQ_NONE; /* Spurious IRQ - ignore. */
-
-	/* Mask the FW interrupts before waking up the thread. Will be unmasked
-	 * when the thread handler is done processing events.
-	 */
-	pvr_fw_irq_disable(pvr_dev);
-	return IRQ_WAKE_THREAD;
+	return IRQ_HANDLED;
 }
 
 /**
@@ -202,20 +154,33 @@ pvr_device_irq_init(struct pvr_device *pvr_dev)
 {
 	struct drm_device *drm_dev = from_pvr_device(pvr_dev);
 	struct platform_device *plat_dev = to_platform_device(drm_dev->dev);
+	int err;
 
 	init_waitqueue_head(&pvr_dev->kccb.rtn_q);
 
+	pvr_dev->irq_wq = alloc_workqueue("powervr-irq", WQ_UNBOUND, 0);
+	if (!pvr_dev->irq_wq) {
+		err = -ENOMEM;
+		goto err_out;
+	}
+
 	pvr_dev->irq = platform_get_irq(plat_dev, 0);
-	if (pvr_dev->irq < 0)
-		return pvr_dev->irq;
+	if (pvr_dev->irq < 0) {
+		err = pvr_dev->irq;
+		goto err_destroy_wq;
+	}
 
 	/* Clear any pending events before requesting the IRQ line. */
 	pvr_fw_irq_clear(pvr_dev);
 	pvr_fw_irq_enable(pvr_dev);
 
-	return request_threaded_irq(pvr_dev->irq, pvr_device_irq_handler,
-				    pvr_device_irq_thread_handler,
-				    IRQF_SHARED, "gpu", pvr_dev);
+	return request_irq(pvr_dev->irq, pvr_device_irq_handler, 0, "gpu", pvr_dev);
+
+err_destroy_wq:
+	destroy_workqueue(pvr_dev->irq_wq);
+
+err_out:
+	return err;
 }
 
 /**
@@ -226,6 +191,7 @@ static void
 pvr_device_irq_fini(struct pvr_device *pvr_dev)
 {
 	free_irq(pvr_dev->irq, pvr_dev);
+	destroy_workqueue(pvr_dev->irq_wq);
 }
 
 /**
diff --git a/drivers/gpu/drm/imagination/pvr_device.h b/drivers/gpu/drm/imagination/pvr_device.h
index 470945ccfcac7ce91161aa6c70d33177fbb3533f..930129334807168cf11ee843f446eb5063464d55 100644
--- a/drivers/gpu/drm/imagination/pvr_device.h
+++ b/drivers/gpu/drm/imagination/pvr_device.h
@@ -141,9 +141,15 @@ struct pvr_device {
 	/** @irq: IRQ number. */
 	int irq;
 
+	/** @irq_wq: Workqueue for actions triggered off the IRQ handler. */
+	struct workqueue_struct *irq_wq;
+
 	/** @fwccb: Firmware CCB. */
 	struct pvr_ccb fwccb;
 
+	/** @fwccb_work: Work item for FWCCB processing. */
+	struct work_struct fwccb_work;
+
 	/**
 	 * @kernel_vm_ctx: Virtual memory context used for kernel mappings.
 	 *
@@ -210,6 +216,9 @@ struct pvr_device {
 		/** @queues.lock: Lock protecting access to the active/idle
 		 *  lists. */
 		struct mutex lock;
+
+		/** @queues.work: Work item for queue processing. */
+		struct work_struct work;
 	} queues;
 
 	/**
@@ -258,6 +267,9 @@ struct pvr_device {
 		 *  future use. */
 		u32 reserved_count;
 
+		/** @kccb.work: Work item for KCCB processing. */
+		struct work_struct work;
+
 		/**
 		 * @kccb.waiters: List of KCCB slot waiters.
 		 */
diff --git a/drivers/gpu/drm/imagination/pvr_fw.c b/drivers/gpu/drm/imagination/pvr_fw.c
index 3debc9870a82ae7de9b2dc173df84c466c137bb3..9c8929d8602ead3390aa5c1b2505845b961b1406 100644
--- a/drivers/gpu/drm/imagination/pvr_fw.c
+++ b/drivers/gpu/drm/imagination/pvr_fw.c
@@ -1036,6 +1036,7 @@ pvr_fw_fini(struct pvr_device *pvr_dev)
 	 * Ensure FWCCB worker has finished executing before destroying FWCCB. The IRQ handler has
 	 * been unregistered at this point so no new work should be being submitted.
 	 */
+	flush_work(&pvr_dev->fwccb_work);
 	pvr_ccb_fini(&pvr_dev->fwccb);
 	pvr_kccb_fini(pvr_dev);
 	pvr_fw_cleanup(pvr_dev);
diff --git a/drivers/gpu/drm/imagination/pvr_power.c b/drivers/gpu/drm/imagination/pvr_power.c
index 19b079b357df78e8bcdecfa377fc9c05b6e8e4b0..000ded17f7ca4c5cdadc5aba4f4d76fac0bbcc0c 100644
--- a/drivers/gpu/drm/imagination/pvr_power.c
+++ b/drivers/gpu/drm/imagination/pvr_power.c
@@ -122,7 +122,7 @@ pvr_power_fw_enable(struct pvr_device *pvr_dev)
 		return err;
 	}
 
-	queue_delayed_work(pvr_dev->sched_wq, &pvr_dev->watchdog.work,
+	queue_delayed_work(pvr_dev->irq_wq, &pvr_dev->watchdog.work,
 			   msecs_to_jiffies(WATCHDOG_TIME_MS));
 
 	return 0;
@@ -212,7 +212,7 @@ pvr_watchdog_worker(struct work_struct *work)
 
 out_requeue:
 	if (!pvr_dev->lost) {
-		queue_delayed_work(pvr_dev->sched_wq, &pvr_dev->watchdog.work,
+		queue_delayed_work(pvr_dev->irq_wq, &pvr_dev->watchdog.work,
 				   msecs_to_jiffies(WATCHDOG_TIME_MS));
 	}
 }
diff --git a/drivers/gpu/drm/imagination/pvr_queue.c b/drivers/gpu/drm/imagination/pvr_queue.c
index c4f08432882b12f5cdfeb7fc991fd941f0946676..5f6a880987d9f35804da60e1258efa30beed56ab 100644
--- a/drivers/gpu/drm/imagination/pvr_queue.c
+++ b/drivers/gpu/drm/imagination/pvr_queue.c
@@ -838,7 +838,7 @@ pvr_queue_timedout_job(struct drm_sched_job *s_job)
 	} else {
 		atomic_set(&queue->in_flight_job_count, job_count);
 		list_move_tail(&queue->node, &pvr_dev->queues.active);
-		pvr_queue_process(queue);
+		queue_work(pvr_dev->irq_wq, &pvr_dev->queues.work);
 	}
 	mutex_unlock(&pvr_dev->queues.lock);
 
@@ -991,6 +991,26 @@ void pvr_queue_process(struct pvr_queue *queue)
 	pvr_queue_update_active_state_locked(queue);
 }
 
+static void pvr_queue_process_worker(struct work_struct *work)
+{
+	struct pvr_device *pvr_dev = container_of_const(work, struct pvr_device, queues.work);
+	struct pvr_queue *queue, *tmp_queue;
+	LIST_HEAD(active_queues);
+
+	mutex_lock(&pvr_dev->queues.lock);
+
+	list_splice_init(&pvr_dev->queues.active, &active_queues);
+
+	list_for_each_entry_safe(queue, tmp_queue, &active_queues, node) {
+		pvr_queue_check_job_waiting_for_cccb_space(queue);
+		pvr_queue_signal_done_fences(queue);
+
+		pvr_queue_update_active_state_locked(queue);
+	}
+
+	mutex_unlock(&pvr_dev->queues.lock);
+}
+
 static u32 get_dm_type(struct pvr_queue *queue)
 {
 	switch (queue->type) {
@@ -1407,6 +1427,7 @@ int pvr_queue_device_init(struct pvr_device *pvr_dev)
 {
 	int err;
 
+	INIT_WORK(&pvr_dev->queues.work, pvr_queue_process_worker);
 	INIT_LIST_HEAD(&pvr_dev->queues.active);
 	INIT_LIST_HEAD(&pvr_dev->queues.idle);
 	err = drmm_mutex_init(from_pvr_device(pvr_dev), &pvr_dev->queues.lock);

-- 
2.47.0

