Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4008B7E3E39
	for <lists+dri-devel@lfdr.de>; Tue,  7 Nov 2023 13:35:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2758D10E5ED;
	Tue,  7 Nov 2023 12:35:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F085110E5EB
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Nov 2023 12:35:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699360525; x=1730896525;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=dgMlW8jENWRVJXdwx3AsRWkBeo8Gbx69RP8hvnWFOms=;
 b=ES0kYBGURl8ae6pTwWxmlbp/kMTotOQkuZIw9GRMO0sF6BiytR2UxGui
 OygYxgXJr5zs9BKPdZDAgdLFilDenhfIZIChDImGoNI7Y03J8Q3APTdJY
 snnrtsL2c/Nolks4IuuvSnLTP3QOnASsZkXgepiMDHHxd8bYGg1a4f+e2
 wAa/FATs8x3p4x1lZJZbIt3NQqVBLqRqT6w4mzX0CrtOsEMUIoJrq3yIB
 L5/f5tsiRM6ISVlkawQqvJFx+UxJk31IP53SFTAuLOXHJ2HlxK+BF33xo
 RsX265Rg2b+ZXJiKRG3eA+1GHb9Wabiv5Zwatr/zj/kZkYxyHXe610j4Y w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10886"; a="393396751"
X-IronPort-AV: E=Sophos;i="6.03,283,1694761200"; d="scan'208";a="393396751"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2023 04:35:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,283,1694761200"; 
   d="scan'208";a="3979148"
Received: from jlawryno.igk.intel.com ([10.91.220.59])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2023 04:35:24 -0800
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 5/5] accel/ivpu: Use threaded IRQ to handle JOB done messages
Date: Tue,  7 Nov 2023 13:35:14 +0100
Message-ID: <20231107123514.2218850-6-jacek.lawrynowicz@linux.intel.com>
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
Cc: quic_jhugo@quicinc.com,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Remove job_done thread and replace it with generic callback based
mechanism.

Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
---
 drivers/accel/ivpu/ivpu_drv.c     |  30 ++---
 drivers/accel/ivpu/ivpu_drv.h     |   3 +-
 drivers/accel/ivpu/ivpu_hw_37xx.c |  29 +++--
 drivers/accel/ivpu/ivpu_ipc.c     | 195 +++++++++++++++++-------------
 drivers/accel/ivpu/ivpu_ipc.h     |  22 +++-
 drivers/accel/ivpu/ivpu_job.c     |  84 +++----------
 drivers/accel/ivpu/ivpu_job.h     |   6 +-
 7 files changed, 185 insertions(+), 184 deletions(-)

diff --git a/drivers/accel/ivpu/ivpu_drv.c b/drivers/accel/ivpu/ivpu_drv.c
index c4456abe228c..48cbcb254237 100644
--- a/drivers/accel/ivpu/ivpu_drv.c
+++ b/drivers/accel/ivpu/ivpu_drv.c
@@ -318,13 +318,15 @@ static int ivpu_wait_for_ready(struct ivpu_device *vdev)
 	if (ivpu_test_mode & IVPU_TEST_MODE_FW_TEST)
 		return 0;
 
-	ivpu_ipc_consumer_add(vdev, &cons, IVPU_IPC_CHAN_BOOT_MSG);
+	ivpu_ipc_consumer_add(vdev, &cons, IVPU_IPC_CHAN_BOOT_MSG, NULL);
 
 	timeout = jiffies + msecs_to_jiffies(vdev->timeout.boot);
 	while (1) {
 		ret = ivpu_ipc_irq_handler(vdev);
-		if (ret)
+		if (ret != IRQ_HANDLED) {
+			ret = -EIO;
 			break;
+		}
 		ret = ivpu_ipc_receive(vdev, &cons, &ipc_hdr, NULL, 0);
 		if (ret != -ETIMEDOUT || time_after_eq(jiffies, timeout))
 			break;
@@ -378,7 +380,6 @@ int ivpu_boot(struct ivpu_device *vdev)
 	enable_irq(vdev->irq);
 	ivpu_hw_irq_enable(vdev);
 	ivpu_ipc_enable(vdev);
-	ivpu_job_done_thread_enable(vdev);
 	return 0;
 }
 
@@ -388,7 +389,6 @@ void ivpu_prepare_for_reset(struct ivpu_device *vdev)
 	disable_irq(vdev->irq);
 	ivpu_ipc_disable(vdev);
 	ivpu_mmu_disable(vdev);
-	ivpu_job_done_thread_disable(vdev);
 }
 
 int ivpu_shutdown(struct ivpu_device *vdev)
@@ -433,6 +433,13 @@ static const struct drm_driver driver = {
 	.minor = DRM_IVPU_DRIVER_MINOR,
 };
 
+static irqreturn_t ivpu_irq_thread_handler(int irq, void *arg)
+{
+	struct ivpu_device *vdev = arg;
+
+	return ivpu_ipc_irq_thread_handler(vdev);
+}
+
 static int ivpu_irq_init(struct ivpu_device *vdev)
 {
 	struct pci_dev *pdev = to_pci_dev(vdev->drm.dev);
@@ -446,8 +453,8 @@ static int ivpu_irq_init(struct ivpu_device *vdev)
 
 	vdev->irq = pci_irq_vector(pdev, 0);
 
-	ret = devm_request_irq(vdev->drm.dev, vdev->irq, vdev->hw->ops->irq_handler,
-			       IRQF_NO_AUTOEN, DRIVER_NAME, vdev);
+	ret = devm_request_threaded_irq(vdev->drm.dev, vdev->irq, vdev->hw->ops->irq_handler,
+					ivpu_irq_thread_handler, IRQF_NO_AUTOEN, DRIVER_NAME, vdev);
 	if (ret)
 		ivpu_err(vdev, "Failed to request an IRQ %d\n", ret);
 
@@ -585,20 +592,15 @@ static int ivpu_dev_init(struct ivpu_device *vdev)
 
 	ivpu_pm_init(vdev);
 
-	ret = ivpu_job_done_thread_init(vdev);
-	if (ret)
-		goto err_ipc_fini;
-
 	ret = ivpu_boot(vdev);
 	if (ret)
-		goto err_job_done_thread_fini;
+		goto err_ipc_fini;
 
+	ivpu_job_done_consumer_init(vdev);
 	ivpu_pm_enable(vdev);
 
 	return 0;
 
-err_job_done_thread_fini:
-	ivpu_job_done_thread_fini(vdev);
 err_ipc_fini:
 	ivpu_ipc_fini(vdev);
 err_fw_fini:
@@ -623,7 +625,7 @@ static void ivpu_dev_fini(struct ivpu_device *vdev)
 	ivpu_shutdown(vdev);
 	if (IVPU_WA(d3hot_after_power_off))
 		pci_set_power_state(to_pci_dev(vdev->drm.dev), PCI_D3hot);
-	ivpu_job_done_thread_fini(vdev);
+	ivpu_job_done_consumer_fini(vdev);
 	ivpu_pm_cancel_recovery(vdev);
 
 	ivpu_ipc_fini(vdev);
diff --git a/drivers/accel/ivpu/ivpu_drv.h b/drivers/accel/ivpu/ivpu_drv.h
index f1e7072449f1..ebc4b84f27b2 100644
--- a/drivers/accel/ivpu/ivpu_drv.h
+++ b/drivers/accel/ivpu/ivpu_drv.h
@@ -17,6 +17,7 @@
 #include <uapi/drm/ivpu_accel.h>
 
 #include "ivpu_mmu_context.h"
+#include "ivpu_ipc.h"
 
 #define DRIVER_NAME "intel_vpu"
 #define DRIVER_DESC "Driver for Intel NPU (Neural Processing Unit)"
@@ -120,7 +121,7 @@ struct ivpu_device {
 	struct list_head bo_list;
 
 	struct xarray submitted_jobs_xa;
-	struct task_struct *job_done_thread;
+	struct ivpu_ipc_consumer job_done_consumer;
 
 	atomic64_t unique_id_counter;
 
diff --git a/drivers/accel/ivpu/ivpu_hw_37xx.c b/drivers/accel/ivpu/ivpu_hw_37xx.c
index a172cfb1c31f..d1795cd6cc09 100644
--- a/drivers/accel/ivpu/ivpu_hw_37xx.c
+++ b/drivers/accel/ivpu/ivpu_hw_37xx.c
@@ -891,9 +891,13 @@ static void ivpu_hw_37xx_irq_noc_firewall_handler(struct ivpu_device *vdev)
 }
 
 /* Handler for IRQs from VPU core (irqV) */
-static u32 ivpu_hw_37xx_irqv_handler(struct ivpu_device *vdev, int irq)
+static irqreturn_t ivpu_hw_37xx_irqv_handler(struct ivpu_device *vdev, int irq)
 {
 	u32 status = REGV_RD32(VPU_37XX_HOST_SS_ICB_STATUS_0) & ICB_0_IRQ_MASK;
+	irqreturn_t ret = IRQ_NONE;
+
+	if (!status)
+		return IRQ_NONE;
 
 	REGV_WR32(VPU_37XX_HOST_SS_ICB_CLEAR_0, status);
 
@@ -901,7 +905,7 @@ static u32 ivpu_hw_37xx_irqv_handler(struct ivpu_device *vdev, int irq)
 		ivpu_mmu_irq_evtq_handler(vdev);
 
 	if (REG_TEST_FLD(VPU_37XX_HOST_SS_ICB_STATUS_0, HOST_IPC_FIFO_INT, status))
-		ivpu_ipc_irq_handler(vdev);
+		ret |= ivpu_ipc_irq_handler(vdev);
 
 	if (REG_TEST_FLD(VPU_37XX_HOST_SS_ICB_STATUS_0, MMU_IRQ_1_INT, status))
 		ivpu_dbg(vdev, IRQ, "MMU sync complete\n");
@@ -918,17 +922,17 @@ static u32 ivpu_hw_37xx_irqv_handler(struct ivpu_device *vdev, int irq)
 	if (REG_TEST_FLD(VPU_37XX_HOST_SS_ICB_STATUS_0, NOC_FIREWALL_INT, status))
 		ivpu_hw_37xx_irq_noc_firewall_handler(vdev);
 
-	return status;
+	return ret;
 }
 
 /* Handler for IRQs from Buttress core (irqB) */
-static u32 ivpu_hw_37xx_irqb_handler(struct ivpu_device *vdev, int irq)
+static irqreturn_t ivpu_hw_37xx_irqb_handler(struct ivpu_device *vdev, int irq)
 {
 	u32 status = REGB_RD32(VPU_37XX_BUTTRESS_INTERRUPT_STAT) & BUTTRESS_IRQ_MASK;
 	bool schedule_recovery = false;
 
-	if (status == 0)
-		return 0;
+	if (!status)
+		return IRQ_NONE;
 
 	if (REG_TEST_FLD(VPU_37XX_BUTTRESS_INTERRUPT_STAT, FREQ_CHANGE, status))
 		ivpu_dbg(vdev, IRQ, "FREQ_CHANGE irq: %08x",
@@ -964,23 +968,26 @@ static u32 ivpu_hw_37xx_irqb_handler(struct ivpu_device *vdev, int irq)
 	if (schedule_recovery)
 		ivpu_pm_schedule_recovery(vdev);
 
-	return status;
+	return IRQ_HANDLED;
 }
 
 static irqreturn_t ivpu_hw_37xx_irq_handler(int irq, void *ptr)
 {
 	struct ivpu_device *vdev = ptr;
-	u32 ret_irqv, ret_irqb;
+	irqreturn_t ret = IRQ_NONE;
 
 	REGB_WR32(VPU_37XX_BUTTRESS_GLOBAL_INT_MASK, 0x1);
 
-	ret_irqv = ivpu_hw_37xx_irqv_handler(vdev, irq);
-	ret_irqb = ivpu_hw_37xx_irqb_handler(vdev, irq);
+	ret |= ivpu_hw_37xx_irqv_handler(vdev, irq);
+	ret |= ivpu_hw_37xx_irqb_handler(vdev, irq);
 
 	/* Re-enable global interrupts to re-trigger MSI for pending interrupts */
 	REGB_WR32(VPU_37XX_BUTTRESS_GLOBAL_INT_MASK, 0x0);
 
-	return IRQ_RETVAL(ret_irqb | ret_irqv);
+	if (ret & IRQ_WAKE_THREAD)
+		return IRQ_WAKE_THREAD;
+
+	return ret;
 }
 
 static void ivpu_hw_37xx_diagnose_failure(struct ivpu_device *vdev)
diff --git a/drivers/accel/ivpu/ivpu_ipc.c b/drivers/accel/ivpu/ivpu_ipc.c
index 1dd4413dc88f..22d9b0f87819 100644
--- a/drivers/accel/ivpu/ivpu_ipc.c
+++ b/drivers/accel/ivpu/ivpu_ipc.c
@@ -5,7 +5,6 @@
 
 #include <linux/genalloc.h>
 #include <linux/highmem.h>
-#include <linux/kthread.h>
 #include <linux/pm_runtime.h>
 #include <linux/wait.h>
 
@@ -18,19 +17,12 @@
 #include "ivpu_pm.h"
 
 #define IPC_MAX_RX_MSG	128
-#define IS_KTHREAD()	(get_current()->flags & PF_KTHREAD)
 
 struct ivpu_ipc_tx_buf {
 	struct ivpu_ipc_hdr ipc;
 	struct vpu_jsm_msg jsm;
 };
 
-struct ivpu_ipc_rx_msg {
-	struct list_head link;
-	struct ivpu_ipc_hdr *ipc_hdr;
-	struct vpu_jsm_msg *jsm_msg;
-};
-
 static void ivpu_ipc_msg_dump(struct ivpu_device *vdev, char *c,
 			      struct ivpu_ipc_hdr *ipc_hdr, u32 vpu_addr)
 {
@@ -140,8 +132,49 @@ static void ivpu_ipc_tx(struct ivpu_device *vdev, u32 vpu_addr)
 	ivpu_hw_reg_ipc_tx_set(vdev, vpu_addr);
 }
 
-void
-ivpu_ipc_consumer_add(struct ivpu_device *vdev, struct ivpu_ipc_consumer *cons, u32 channel)
+static void
+ivpu_ipc_rx_msg_add(struct ivpu_device *vdev, struct ivpu_ipc_consumer *cons,
+		    struct ivpu_ipc_hdr *ipc_hdr, struct vpu_jsm_msg *jsm_msg)
+{
+	struct ivpu_ipc_info *ipc = vdev->ipc;
+	struct ivpu_ipc_rx_msg *rx_msg;
+
+	lockdep_assert_held(&ipc->cons_lock);
+	lockdep_assert_irqs_disabled();
+
+	rx_msg = kzalloc(sizeof(*rx_msg), GFP_ATOMIC);
+	if (!rx_msg) {
+		ivpu_ipc_rx_mark_free(vdev, ipc_hdr, jsm_msg);
+		return;
+	}
+
+	atomic_inc(&ipc->rx_msg_count);
+
+	rx_msg->ipc_hdr = ipc_hdr;
+	rx_msg->jsm_msg = jsm_msg;
+	rx_msg->callback = cons->rx_callback;
+
+	if (rx_msg->callback) {
+		list_add_tail(&rx_msg->link, &ipc->cb_msg_list);
+	} else {
+		spin_lock(&cons->rx_lock);
+		list_add_tail(&rx_msg->link, &cons->rx_msg_list);
+		spin_unlock(&cons->rx_lock);
+		wake_up(&cons->rx_msg_wq);
+	}
+}
+
+static void
+ivpu_ipc_rx_msg_del(struct ivpu_device *vdev, struct ivpu_ipc_rx_msg *rx_msg)
+{
+	list_del(&rx_msg->link);
+	ivpu_ipc_rx_mark_free(vdev, rx_msg->ipc_hdr, rx_msg->jsm_msg);
+	atomic_dec(&vdev->ipc->rx_msg_count);
+	kfree(rx_msg);
+}
+
+void ivpu_ipc_consumer_add(struct ivpu_device *vdev, struct ivpu_ipc_consumer *cons,
+			   u32 channel, ivpu_ipc_rx_callback_t rx_callback)
 {
 	struct ivpu_ipc_info *ipc = vdev->ipc;
 
@@ -150,13 +183,14 @@ ivpu_ipc_consumer_add(struct ivpu_device *vdev, struct ivpu_ipc_consumer *cons,
 	cons->tx_vpu_addr = 0;
 	cons->request_id = 0;
 	cons->aborted = false;
+	cons->rx_callback = rx_callback;
 	spin_lock_init(&cons->rx_lock);
 	INIT_LIST_HEAD(&cons->rx_msg_list);
 	init_waitqueue_head(&cons->rx_msg_wq);
 
-	spin_lock_irq(&ipc->cons_list_lock);
+	spin_lock_irq(&ipc->cons_lock);
 	list_add_tail(&cons->link, &ipc->cons_list);
-	spin_unlock_irq(&ipc->cons_list_lock);
+	spin_unlock_irq(&ipc->cons_lock);
 }
 
 void ivpu_ipc_consumer_del(struct ivpu_device *vdev, struct ivpu_ipc_consumer *cons)
@@ -164,18 +198,13 @@ void ivpu_ipc_consumer_del(struct ivpu_device *vdev, struct ivpu_ipc_consumer *c
 	struct ivpu_ipc_info *ipc = vdev->ipc;
 	struct ivpu_ipc_rx_msg *rx_msg, *r;
 
-	spin_lock_irq(&ipc->cons_list_lock);
+	spin_lock_irq(&ipc->cons_lock);
 	list_del(&cons->link);
-	spin_unlock_irq(&ipc->cons_list_lock);
+	spin_unlock_irq(&ipc->cons_lock);
 
 	spin_lock_irq(&cons->rx_lock);
-	list_for_each_entry_safe(rx_msg, r, &cons->rx_msg_list, link) {
-		list_del(&rx_msg->link);
-		if (!cons->aborted)
-			ivpu_ipc_rx_mark_free(vdev, rx_msg->ipc_hdr, rx_msg->jsm_msg);
-		atomic_dec(&ipc->rx_msg_count);
-		kfree(rx_msg);
-	}
+	list_for_each_entry_safe(rx_msg, r, &cons->rx_msg_list, link)
+		ivpu_ipc_rx_msg_del(vdev, rx_msg);
 	spin_unlock_irq(&cons->rx_lock);
 
 	ivpu_ipc_tx_release(vdev, cons->tx_vpu_addr);
@@ -205,15 +234,12 @@ ivpu_ipc_send(struct ivpu_device *vdev, struct ivpu_ipc_consumer *cons, struct v
 	return ret;
 }
 
-static int ivpu_ipc_rx_need_wakeup(struct ivpu_ipc_consumer *cons)
+static bool ivpu_ipc_rx_need_wakeup(struct ivpu_ipc_consumer *cons)
 {
-	int ret = 0;
-
-	if (IS_KTHREAD())
-		ret |= (kthread_should_stop() || kthread_should_park());
+	bool ret;
 
 	spin_lock_irq(&cons->rx_lock);
-	ret |= !list_empty(&cons->rx_msg_list) || cons->aborted;
+	ret = !list_empty(&cons->rx_msg_list) || cons->aborted;
 	spin_unlock_irq(&cons->rx_lock);
 
 	return ret;
@@ -221,19 +247,18 @@ static int ivpu_ipc_rx_need_wakeup(struct ivpu_ipc_consumer *cons)
 
 int ivpu_ipc_receive(struct ivpu_device *vdev, struct ivpu_ipc_consumer *cons,
 		     struct ivpu_ipc_hdr *ipc_buf,
-		     struct vpu_jsm_msg *ipc_payload, unsigned long timeout_ms)
+		     struct vpu_jsm_msg *jsm_msg, unsigned long timeout_ms)
 {
-	struct ivpu_ipc_info *ipc = vdev->ipc;
 	struct ivpu_ipc_rx_msg *rx_msg;
 	int wait_ret, ret = 0;
 
+	if (drm_WARN_ONCE(&vdev->drm, cons->rx_callback, "Consumer works only in async mode\n"))
+		return -EINVAL;
+
 	wait_ret = wait_event_timeout(cons->rx_msg_wq,
 				      ivpu_ipc_rx_need_wakeup(cons),
 				      msecs_to_jiffies(timeout_ms));
 
-	if (IS_KTHREAD() && kthread_should_stop())
-		return -EINTR;
-
 	if (wait_ret == 0)
 		return -ETIMEDOUT;
 
@@ -247,27 +272,23 @@ int ivpu_ipc_receive(struct ivpu_device *vdev, struct ivpu_ipc_consumer *cons,
 		spin_unlock_irq(&cons->rx_lock);
 		return -EAGAIN;
 	}
-	list_del(&rx_msg->link);
-	spin_unlock_irq(&cons->rx_lock);
 
 	if (ipc_buf)
 		memcpy(ipc_buf, rx_msg->ipc_hdr, sizeof(*ipc_buf));
 	if (rx_msg->jsm_msg) {
-		u32 size = min_t(int, rx_msg->ipc_hdr->data_size, sizeof(*ipc_payload));
+		u32 size = min_t(int, rx_msg->ipc_hdr->data_size, sizeof(*jsm_msg));
 
 		if (rx_msg->jsm_msg->result != VPU_JSM_STATUS_SUCCESS) {
 			ivpu_dbg(vdev, IPC, "IPC resp result error: %d\n", rx_msg->jsm_msg->result);
 			ret = -EBADMSG;
 		}
 
-		if (ipc_payload)
-			memcpy(ipc_payload, rx_msg->jsm_msg, size);
+		if (jsm_msg)
+			memcpy(jsm_msg, rx_msg->jsm_msg, size);
 	}
 
-	ivpu_ipc_rx_mark_free(vdev, rx_msg->ipc_hdr, rx_msg->jsm_msg);
-	atomic_dec(&ipc->rx_msg_count);
-	kfree(rx_msg);
-
+	ivpu_ipc_rx_msg_del(vdev, rx_msg);
+	spin_unlock_irq(&cons->rx_lock);
 	return ret;
 }
 
@@ -280,7 +301,7 @@ ivpu_ipc_send_receive_internal(struct ivpu_device *vdev, struct vpu_jsm_msg *req
 	struct ivpu_ipc_consumer cons;
 	int ret;
 
-	ivpu_ipc_consumer_add(vdev, &cons, channel);
+	ivpu_ipc_consumer_add(vdev, &cons, channel, NULL);
 
 	ret = ivpu_ipc_send(vdev, &cons, req);
 	if (ret) {
@@ -359,35 +380,7 @@ ivpu_ipc_match_consumer(struct ivpu_device *vdev, struct ivpu_ipc_consumer *cons
 	return false;
 }
 
-static void
-ivpu_ipc_dispatch(struct ivpu_device *vdev, struct ivpu_ipc_consumer *cons,
-		  struct ivpu_ipc_hdr *ipc_hdr, struct vpu_jsm_msg *jsm_msg)
-{
-	struct ivpu_ipc_info *ipc = vdev->ipc;
-	struct ivpu_ipc_rx_msg *rx_msg;
-
-	lockdep_assert_held(&ipc->cons_list_lock);
-	lockdep_assert_irqs_disabled();
-
-	rx_msg = kzalloc(sizeof(*rx_msg), GFP_ATOMIC);
-	if (!rx_msg) {
-		ivpu_ipc_rx_mark_free(vdev, ipc_hdr, jsm_msg);
-		return;
-	}
-
-	atomic_inc(&ipc->rx_msg_count);
-
-	rx_msg->ipc_hdr = ipc_hdr;
-	rx_msg->jsm_msg = jsm_msg;
-
-	spin_lock(&cons->rx_lock);
-	list_add_tail(&rx_msg->link, &cons->rx_msg_list);
-	spin_unlock(&cons->rx_lock);
-
-	wake_up(&cons->rx_msg_wq);
-}
-
-int ivpu_ipc_irq_handler(struct ivpu_device *vdev)
+irqreturn_t ivpu_ipc_irq_handler(struct ivpu_device *vdev)
 {
 	struct ivpu_ipc_info *ipc = vdev->ipc;
 	struct ivpu_ipc_consumer *cons;
@@ -405,7 +398,7 @@ int ivpu_ipc_irq_handler(struct ivpu_device *vdev)
 		vpu_addr = ivpu_hw_reg_ipc_rx_addr_get(vdev);
 		if (vpu_addr == REG_IO_ERROR) {
 			ivpu_err_ratelimited(vdev, "Failed to read IPC rx addr register\n");
-			return -EIO;
+			return IRQ_NONE;
 		}
 
 		ipc_hdr = ivpu_to_cpu_addr(ipc->mem_rx, vpu_addr);
@@ -435,15 +428,15 @@ int ivpu_ipc_irq_handler(struct ivpu_device *vdev)
 		}
 
 		dispatched = false;
-		spin_lock_irqsave(&ipc->cons_list_lock, flags);
+		spin_lock_irqsave(&ipc->cons_lock, flags);
 		list_for_each_entry(cons, &ipc->cons_list, link) {
 			if (ivpu_ipc_match_consumer(vdev, cons, ipc_hdr, jsm_msg)) {
-				ivpu_ipc_dispatch(vdev, cons, ipc_hdr, jsm_msg);
+				ivpu_ipc_rx_msg_add(vdev, cons, ipc_hdr, jsm_msg);
 				dispatched = true;
 				break;
 			}
 		}
-		spin_unlock_irqrestore(&ipc->cons_list_lock, flags);
+		spin_unlock_irqrestore(&ipc->cons_lock, flags);
 
 		if (!dispatched) {
 			ivpu_dbg(vdev, IPC, "IPC RX msg 0x%x dropped (no consumer)\n", vpu_addr);
@@ -451,7 +444,27 @@ int ivpu_ipc_irq_handler(struct ivpu_device *vdev)
 		}
 	}
 
-	return 0;
+	return list_empty(&ipc->cb_msg_list) ? IRQ_HANDLED : IRQ_WAKE_THREAD;
+}
+
+irqreturn_t ivpu_ipc_irq_thread_handler(struct ivpu_device *vdev)
+{
+	struct ivpu_ipc_info *ipc = vdev->ipc;
+	struct ivpu_ipc_rx_msg *rx_msg, *r;
+	struct list_head cb_msg_list;
+
+	INIT_LIST_HEAD(&cb_msg_list);
+
+	spin_lock_irq(&ipc->cons_lock);
+	list_splice_tail_init(&ipc->cb_msg_list, &cb_msg_list);
+	spin_unlock_irq(&ipc->cons_lock);
+
+	list_for_each_entry_safe(rx_msg, r, &cb_msg_list, link) {
+		rx_msg->callback(vdev, rx_msg->ipc_hdr, rx_msg->jsm_msg);
+		ivpu_ipc_rx_msg_del(vdev, rx_msg);
+	}
+
+	return IRQ_HANDLED;
 }
 
 int ivpu_ipc_init(struct ivpu_device *vdev)
@@ -486,10 +499,10 @@ int ivpu_ipc_init(struct ivpu_device *vdev)
 		goto err_free_rx;
 	}
 
+	spin_lock_init(&ipc->cons_lock);
 	INIT_LIST_HEAD(&ipc->cons_list);
-	spin_lock_init(&ipc->cons_list_lock);
+	INIT_LIST_HEAD(&ipc->cb_msg_list);
 	drmm_mutex_init(&vdev->drm, &ipc->lock);
-
 	ivpu_ipc_reset(vdev);
 	return 0;
 
@@ -502,6 +515,13 @@ int ivpu_ipc_init(struct ivpu_device *vdev)
 
 void ivpu_ipc_fini(struct ivpu_device *vdev)
 {
+	struct ivpu_ipc_info *ipc = vdev->ipc;
+
+	drm_WARN_ON(&vdev->drm, ipc->on);
+	drm_WARN_ON(&vdev->drm, !list_empty(&ipc->cons_list));
+	drm_WARN_ON(&vdev->drm, !list_empty(&ipc->cb_msg_list));
+	drm_WARN_ON(&vdev->drm, atomic_read(&ipc->rx_msg_count) > 0);
+
 	ivpu_ipc_mem_fini(vdev);
 }
 
@@ -518,22 +538,27 @@ void ivpu_ipc_disable(struct ivpu_device *vdev)
 {
 	struct ivpu_ipc_info *ipc = vdev->ipc;
 	struct ivpu_ipc_consumer *cons, *c;
-	unsigned long flags;
+	struct ivpu_ipc_rx_msg *rx_msg, *r;
+
+	drm_WARN_ON(&vdev->drm, !list_empty(&ipc->cb_msg_list));
 
 	mutex_lock(&ipc->lock);
 	ipc->on = false;
 	mutex_unlock(&ipc->lock);
 
-	spin_lock_irqsave(&ipc->cons_list_lock, flags);
+	spin_lock_irq(&ipc->cons_lock);
 	list_for_each_entry_safe(cons, c, &ipc->cons_list, link) {
-		if (cons->channel != VPU_IPC_CHAN_JOB_RET) {
-			spin_lock(&cons->rx_lock);
+		spin_lock(&cons->rx_lock);
+		if (!cons->rx_callback)
 			cons->aborted = true;
-			spin_unlock(&cons->rx_lock);
-		}
+		list_for_each_entry_safe(rx_msg, r, &cons->rx_msg_list, link)
+			ivpu_ipc_rx_msg_del(vdev, rx_msg);
+		spin_unlock(&cons->rx_lock);
 		wake_up(&cons->rx_msg_wq);
 	}
-	spin_unlock_irqrestore(&ipc->cons_list_lock, flags);
+	spin_unlock_irq(&ipc->cons_lock);
+
+	drm_WARN_ON(&vdev->drm, atomic_read(&ipc->rx_msg_count) > 0);
 }
 
 void ivpu_ipc_reset(struct ivpu_device *vdev)
diff --git a/drivers/accel/ivpu/ivpu_ipc.h b/drivers/accel/ivpu/ivpu_ipc.h
index 71b2e648dffd..6c1119b830aa 100644
--- a/drivers/accel/ivpu/ivpu_ipc.h
+++ b/drivers/accel/ivpu/ivpu_ipc.h
@@ -42,12 +42,24 @@ struct ivpu_ipc_hdr {
 	u8 status;
 } __packed __aligned(IVPU_IPC_ALIGNMENT);
 
+typedef void (*ivpu_ipc_rx_callback_t)(struct ivpu_device *vdev,
+				       struct ivpu_ipc_hdr *ipc_hdr,
+				       struct vpu_jsm_msg *jsm_msg);
+
+struct ivpu_ipc_rx_msg {
+	struct list_head link;
+	struct ivpu_ipc_hdr *ipc_hdr;
+	struct vpu_jsm_msg *jsm_msg;
+	ivpu_ipc_rx_callback_t callback;
+};
+
 struct ivpu_ipc_consumer {
 	struct list_head link;
 	u32 channel;
 	u32 tx_vpu_addr;
 	u32 request_id;
 	bool aborted;
+	ivpu_ipc_rx_callback_t rx_callback;
 
 	spinlock_t rx_lock; /* Protects rx_msg_list and aborted */
 	struct list_head rx_msg_list;
@@ -61,8 +73,9 @@ struct ivpu_ipc_info {
 
 	atomic_t rx_msg_count;
 
-	spinlock_t cons_list_lock; /* Protects cons_list */
+	spinlock_t cons_lock; /* Protects cons_list and cb_msg_list */
 	struct list_head cons_list;
+	struct list_head cb_msg_list;
 
 	atomic_t request_id;
 	struct mutex lock; /* Lock on status */
@@ -76,14 +89,15 @@ void ivpu_ipc_enable(struct ivpu_device *vdev);
 void ivpu_ipc_disable(struct ivpu_device *vdev);
 void ivpu_ipc_reset(struct ivpu_device *vdev);
 
-int ivpu_ipc_irq_handler(struct ivpu_device *vdev);
+irqreturn_t ivpu_ipc_irq_handler(struct ivpu_device *vdev);
+irqreturn_t ivpu_ipc_irq_thread_handler(struct ivpu_device *vdev);
 
 void ivpu_ipc_consumer_add(struct ivpu_device *vdev, struct ivpu_ipc_consumer *cons,
-			   u32 channel);
+			   u32 channel, ivpu_ipc_rx_callback_t callback);
 void ivpu_ipc_consumer_del(struct ivpu_device *vdev, struct ivpu_ipc_consumer *cons);
 
 int ivpu_ipc_receive(struct ivpu_device *vdev, struct ivpu_ipc_consumer *cons,
-		     struct ivpu_ipc_hdr *ipc_buf, struct vpu_jsm_msg *ipc_payload,
+		     struct ivpu_ipc_hdr *ipc_buf, struct vpu_jsm_msg *jsm_msg,
 		     unsigned long timeout_ms);
 
 int ivpu_ipc_send_receive_active(struct ivpu_device *vdev, struct vpu_jsm_msg *req,
diff --git a/drivers/accel/ivpu/ivpu_job.c b/drivers/accel/ivpu/ivpu_job.c
index 796366d67984..7206cf9cdb4a 100644
--- a/drivers/accel/ivpu/ivpu_job.c
+++ b/drivers/accel/ivpu/ivpu_job.c
@@ -7,7 +7,6 @@
 
 #include <linux/bitfield.h>
 #include <linux/highmem.h>
-#include <linux/kthread.h>
 #include <linux/pci.h>
 #include <linux/module.h>
 #include <uapi/drm/ivpu_accel.h>
@@ -344,22 +343,6 @@ static int ivpu_job_done(struct ivpu_device *vdev, u32 job_id, u32 job_status)
 	return 0;
 }
 
-static void ivpu_job_done_message(struct ivpu_device *vdev, void *msg)
-{
-	struct vpu_ipc_msg_payload_job_done *payload;
-	struct vpu_jsm_msg *job_ret_msg = msg;
-	int ret;
-
-	payload = (struct vpu_ipc_msg_payload_job_done *)&job_ret_msg->payload;
-
-	ret = ivpu_job_done(vdev, payload->job_id, payload->job_status);
-	if (ret)
-		ivpu_err(vdev, "Failed to finish job %d: %d\n", payload->job_id, ret);
-
-	if (!ret && !xa_empty(&vdev->submitted_jobs_xa))
-		ivpu_start_job_timeout_detection(vdev);
-}
-
 void ivpu_jobs_abort_all(struct ivpu_device *vdev)
 {
 	struct ivpu_job *job;
@@ -567,65 +550,36 @@ int ivpu_submit_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 	return ret;
 }
 
-static int ivpu_job_done_thread(void *arg)
+static void
+ivpu_job_done_callback(struct ivpu_device *vdev, struct ivpu_ipc_hdr *ipc_hdr,
+		       struct vpu_jsm_msg *jsm_msg)
 {
-	struct ivpu_device *vdev = (struct ivpu_device *)arg;
-	struct ivpu_ipc_consumer cons;
-	struct vpu_jsm_msg jsm_msg;
-	unsigned int timeout;
+	struct vpu_ipc_msg_payload_job_done *payload;
 	int ret;
 
-	ivpu_dbg(vdev, JOB, "Started %s\n", __func__);
-
-	ivpu_ipc_consumer_add(vdev, &cons, VPU_IPC_CHAN_JOB_RET);
-
-	while (!kthread_should_stop()) {
-		ret = ivpu_ipc_receive(vdev, &cons, NULL, &jsm_msg, timeout);
-		if (!ret)
-			ivpu_job_done_message(vdev, &jsm_msg);
-
-		if (kthread_should_park()) {
-			ivpu_dbg(vdev, JOB, "Parked %s\n", __func__);
-			kthread_parkme();
-			ivpu_dbg(vdev, JOB, "Unparked %s\n", __func__);
-		}
+	if (!jsm_msg) {
+		ivpu_err(vdev, "IPC message has no JSM payload\n");
+		return;
 	}
 
-	ivpu_ipc_consumer_del(vdev, &cons);
-
-	ivpu_jobs_abort_all(vdev);
-
-	ivpu_dbg(vdev, JOB, "Stopped %s\n", __func__);
-	return 0;
-}
-
-int ivpu_job_done_thread_init(struct ivpu_device *vdev)
-{
-	struct task_struct *thread;
-
-	thread = kthread_run(&ivpu_job_done_thread, (void *)vdev, "ivpu_job_done_thread");
-	if (IS_ERR(thread)) {
-		ivpu_err(vdev, "Failed to start job completion thread\n");
-		return -EIO;
+	if (jsm_msg->result != VPU_JSM_STATUS_SUCCESS) {
+		ivpu_err(vdev, "Invalid JSM message result: %d\n", jsm_msg->result);
+		return;
 	}
 
-	vdev->job_done_thread = thread;
-
-	return 0;
-}
-
-void ivpu_job_done_thread_fini(struct ivpu_device *vdev)
-{
-	kthread_unpark(vdev->job_done_thread);
-	kthread_stop(vdev->job_done_thread);
+	payload = (struct vpu_ipc_msg_payload_job_done *)&jsm_msg->payload;
+	ret = ivpu_job_done(vdev, payload->job_id, payload->job_status);
+	if (!ret && !xa_empty(&vdev->submitted_jobs_xa))
+		ivpu_start_job_timeout_detection(vdev);
 }
 
-void ivpu_job_done_thread_disable(struct ivpu_device *vdev)
+void ivpu_job_done_consumer_init(struct ivpu_device *vdev)
 {
-	kthread_park(vdev->job_done_thread);
+	ivpu_ipc_consumer_add(vdev, &vdev->job_done_consumer,
+			      VPU_IPC_CHAN_JOB_RET, ivpu_job_done_callback);
 }
 
-void ivpu_job_done_thread_enable(struct ivpu_device *vdev)
+void ivpu_job_done_consumer_fini(struct ivpu_device *vdev)
 {
-	kthread_unpark(vdev->job_done_thread);
+	ivpu_ipc_consumer_del(vdev, &vdev->job_done_consumer);
 }
diff --git a/drivers/accel/ivpu/ivpu_job.h b/drivers/accel/ivpu/ivpu_job.h
index a8e914e5affc..2281f394f6d3 100644
--- a/drivers/accel/ivpu/ivpu_job.h
+++ b/drivers/accel/ivpu/ivpu_job.h
@@ -59,10 +59,8 @@ int ivpu_submit_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 void ivpu_cmdq_release_all(struct ivpu_file_priv *file_priv);
 void ivpu_cmdq_reset_all_contexts(struct ivpu_device *vdev);
 
-int ivpu_job_done_thread_init(struct ivpu_device *vdev);
-void ivpu_job_done_thread_fini(struct ivpu_device *vdev);
-void ivpu_job_done_thread_disable(struct ivpu_device *vdev);
-void ivpu_job_done_thread_enable(struct ivpu_device *vdev);
+void ivpu_job_done_consumer_init(struct ivpu_device *vdev);
+void ivpu_job_done_consumer_fini(struct ivpu_device *vdev);
 
 void ivpu_jobs_abort_all(struct ivpu_device *vdev);
 
-- 
2.42.0

