Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A24C6939F3
	for <lists+dri-devel@lfdr.de>; Sun, 12 Feb 2023 21:45:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8527B10E47E;
	Sun, 12 Feb 2023 20:45:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C5C210E474
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Feb 2023 20:45:33 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A817260DD5;
 Sun, 12 Feb 2023 20:45:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E65DC4339C;
 Sun, 12 Feb 2023 20:45:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1676234732;
 bh=EDV8QJpbg3dCygecYyfA86nWbgWOzlfoPOV3adDDzPk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=cMvTHi3eeJ4Kz9TCR+DJ7bVe7uSgebVyzIg8wr7uB38iJXdHOqdbOpns8aE4e0PPl
 TtbOSNIJ7CWeQFTGC+ntjsQMGdNNhVkhHMUh1X8E8VFgrEA4HCx+L6ja3RnsHAi0k5
 A8+6XfPQJGpHVrp0T71CTfh31mV5uXJfMN58DcVvb+V3EH+8eo2CXfOD4kTHDXGQWF
 ePOPhfoIZHOtdSPBZ+Uyu1iGz9Yll+kPLIoYM42ot7pnEHtKX/KB7+lYEcJKUOaV7N
 /2LJRXeU+/Rx6OTATbpIdvYvMBhGMg2hXmShv0itxUYOfvEVLTBMuicMbNQWQwBuPo
 v96Zd71wira4Q==
From: Oded Gabbay <ogabbay@kernel.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 18/27] habanalabs: change user interrupt to threaded IRQ
Date: Sun, 12 Feb 2023 22:44:45 +0200
Message-Id: <20230212204454.2938561-18-ogabbay@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230212204454.2938561-1-ogabbay@kernel.org>
References: <20230212204454.2938561-1-ogabbay@kernel.org>
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
Cc: Tal Cohen <talcohen@habana.ai>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Tal Cohen <talcohen@habana.ai>

We prefer not to handle the user interrupt job inside the interrupt
context. Instead, use threaded IRQ to handle the user interrupts.
This will allow to avoid disabling interrupts when the user process
registers for a new event and to avoid long handling inside an
interrupt.

Signed-off-by: Tal Cohen <talcohen@habana.ai>
Reviewed-by: Oded Gabbay <ogabbay@kernel.org>
Signed-off-by: Oded Gabbay <ogabbay@kernel.org>
---
 .../habanalabs/common/command_submission.c    | 45 +++++++++----------
 drivers/accel/habanalabs/common/habanalabs.h  |  1 +
 drivers/accel/habanalabs/common/irq.c         | 13 ++++++
 drivers/accel/habanalabs/gaudi2/gaudi2.c      | 29 +++++++-----
 4 files changed, 53 insertions(+), 35 deletions(-)

diff --git a/drivers/accel/habanalabs/common/command_submission.c b/drivers/accel/habanalabs/common/command_submission.c
index 24f3d82ee4cb..6c4d9b1aa5de 100644
--- a/drivers/accel/habanalabs/common/command_submission.c
+++ b/drivers/accel/habanalabs/common/command_submission.c
@@ -1082,9 +1082,8 @@ static void
 wake_pending_user_interrupt_threads(struct hl_user_interrupt *interrupt)
 {
 	struct hl_user_pending_interrupt *pend, *temp;
-	unsigned long flags;
 
-	spin_lock_irqsave(&interrupt->wait_list_lock, flags);
+	spin_lock(&interrupt->wait_list_lock);
 	list_for_each_entry_safe(pend, temp, &interrupt->wait_list_head, wait_list_node) {
 		if (pend->ts_reg_info.buf) {
 			list_del(&pend->wait_list_node);
@@ -1095,7 +1094,7 @@ wake_pending_user_interrupt_threads(struct hl_user_interrupt *interrupt)
 			complete_all(&pend->fence.completion);
 		}
 	}
-	spin_unlock_irqrestore(&interrupt->wait_list_lock, flags);
+	spin_unlock(&interrupt->wait_list_lock);
 }
 
 void hl_release_pending_user_interrupts(struct hl_device *hdev)
@@ -3159,7 +3158,7 @@ static int ts_buff_get_kernel_ts_record(struct hl_mmap_mem_buf *buf,
 	struct hl_user_pending_interrupt *cb_last =
 			(struct hl_user_pending_interrupt *)ts_buff->kernel_buff_address +
 			(ts_buff->kernel_buff_size / sizeof(struct hl_user_pending_interrupt));
-	unsigned long flags, iter_counter = 0;
+	unsigned long iter_counter = 0;
 	u64 current_cq_counter;
 	ktime_t timestamp;
 
@@ -3173,7 +3172,7 @@ static int ts_buff_get_kernel_ts_record(struct hl_mmap_mem_buf *buf,
 	timestamp = ktime_get();
 
 start_over:
-	spin_lock_irqsave(wait_list_lock, flags);
+	spin_lock(wait_list_lock);
 
 	/* Unregister only if we didn't reach the target value
 	 * since in this case there will be no handling in irq context
@@ -3184,7 +3183,7 @@ static int ts_buff_get_kernel_ts_record(struct hl_mmap_mem_buf *buf,
 		current_cq_counter = *requested_offset_record->cq_kernel_addr;
 		if (current_cq_counter < requested_offset_record->cq_target_value) {
 			list_del(&requested_offset_record->wait_list_node);
-			spin_unlock_irqrestore(wait_list_lock, flags);
+			spin_unlock(wait_list_lock);
 
 			hl_mmap_mem_buf_put(requested_offset_record->ts_reg_info.buf);
 			hl_cb_put(requested_offset_record->ts_reg_info.cq_cb);
@@ -3195,8 +3194,8 @@ static int ts_buff_get_kernel_ts_record(struct hl_mmap_mem_buf *buf,
 			dev_dbg(buf->mmg->dev,
 				"ts node in middle of irq handling\n");
 
-			/* irq handling in the middle give it time to finish */
-			spin_unlock_irqrestore(wait_list_lock, flags);
+			/* irq thread handling in the middle give it time to finish */
+			spin_unlock(wait_list_lock);
 			usleep_range(100, 1000);
 			if (++iter_counter == MAX_TS_ITER_NUM) {
 				dev_err(buf->mmg->dev,
@@ -3217,7 +3216,7 @@ static int ts_buff_get_kernel_ts_record(struct hl_mmap_mem_buf *buf,
 				(u64 *) cq_cb->kernel_address + cq_offset;
 		requested_offset_record->cq_target_value = target_value;
 
-		spin_unlock_irqrestore(wait_list_lock, flags);
+		spin_unlock(wait_list_lock);
 	}
 
 	*pend = requested_offset_record;
@@ -3237,7 +3236,7 @@ static int _hl_interrupt_wait_ioctl(struct hl_device *hdev, struct hl_ctx *ctx,
 	struct hl_user_pending_interrupt *pend;
 	struct hl_mmap_mem_buf *buf;
 	struct hl_cb *cq_cb;
-	unsigned long timeout, flags;
+	unsigned long timeout;
 	long completion_rc;
 	int rc = 0;
 
@@ -3284,7 +3283,7 @@ static int _hl_interrupt_wait_ioctl(struct hl_device *hdev, struct hl_ctx *ctx,
 		pend->cq_target_value = target_value;
 	}
 
-	spin_lock_irqsave(&interrupt->wait_list_lock, flags);
+	spin_lock(&interrupt->wait_list_lock);
 
 	/* We check for completion value as interrupt could have been received
 	 * before we added the node to the wait list
@@ -3292,7 +3291,7 @@ static int _hl_interrupt_wait_ioctl(struct hl_device *hdev, struct hl_ctx *ctx,
 	if (*pend->cq_kernel_addr >= target_value) {
 		if (register_ts_record)
 			pend->ts_reg_info.in_use = 0;
-		spin_unlock_irqrestore(&interrupt->wait_list_lock, flags);
+		spin_unlock(&interrupt->wait_list_lock);
 
 		*status = HL_WAIT_CS_STATUS_COMPLETED;
 
@@ -3304,7 +3303,7 @@ static int _hl_interrupt_wait_ioctl(struct hl_device *hdev, struct hl_ctx *ctx,
 			goto set_timestamp;
 		}
 	} else if (!timeout_us) {
-		spin_unlock_irqrestore(&interrupt->wait_list_lock, flags);
+		spin_unlock(&interrupt->wait_list_lock);
 		*status = HL_WAIT_CS_STATUS_BUSY;
 		pend->fence.timestamp = ktime_get();
 		goto set_timestamp;
@@ -3329,7 +3328,7 @@ static int _hl_interrupt_wait_ioctl(struct hl_device *hdev, struct hl_ctx *ctx,
 		pend->ts_reg_info.in_use = 1;
 
 	list_add_tail(&pend->wait_list_node, &interrupt->wait_list_head);
-	spin_unlock_irqrestore(&interrupt->wait_list_lock, flags);
+	spin_unlock(&interrupt->wait_list_lock);
 
 	if (register_ts_record) {
 		rc = *status = HL_WAIT_CS_STATUS_COMPLETED;
@@ -3373,9 +3372,9 @@ static int _hl_interrupt_wait_ioctl(struct hl_device *hdev, struct hl_ctx *ctx,
 	 * for ts record, the node will be deleted in the irq handler after
 	 * we reach the target value.
 	 */
-	spin_lock_irqsave(&interrupt->wait_list_lock, flags);
+	spin_lock(&interrupt->wait_list_lock);
 	list_del(&pend->wait_list_node);
-	spin_unlock_irqrestore(&interrupt->wait_list_lock, flags);
+	spin_unlock(&interrupt->wait_list_lock);
 
 set_timestamp:
 	*timestamp = ktime_to_ns(pend->fence.timestamp);
@@ -3403,7 +3402,7 @@ static int _hl_interrupt_wait_ioctl_user_addr(struct hl_device *hdev, struct hl_
 				u64 *timestamp)
 {
 	struct hl_user_pending_interrupt *pend;
-	unsigned long timeout, flags;
+	unsigned long timeout;
 	u64 completion_value;
 	long completion_rc;
 	int rc = 0;
@@ -3423,9 +3422,9 @@ static int _hl_interrupt_wait_ioctl_user_addr(struct hl_device *hdev, struct hl_
 	/* Add pending user interrupt to relevant list for the interrupt
 	 * handler to monitor
 	 */
-	spin_lock_irqsave(&interrupt->wait_list_lock, flags);
+	spin_lock(&interrupt->wait_list_lock);
 	list_add_tail(&pend->wait_list_node, &interrupt->wait_list_head);
-	spin_unlock_irqrestore(&interrupt->wait_list_lock, flags);
+	spin_unlock(&interrupt->wait_list_lock);
 
 	/* We check for completion value as interrupt could have been received
 	 * before we added the node to the wait list
@@ -3456,14 +3455,14 @@ static int _hl_interrupt_wait_ioctl_user_addr(struct hl_device *hdev, struct hl_
 	 * If comparison fails, keep waiting until timeout expires
 	 */
 	if (completion_rc > 0) {
-		spin_lock_irqsave(&interrupt->wait_list_lock, flags);
+		spin_lock(&interrupt->wait_list_lock);
 		/* reinit_completion must be called before we check for user
 		 * completion value, otherwise, if interrupt is received after
 		 * the comparison and before the next wait_for_completion,
 		 * we will reach timeout and fail
 		 */
 		reinit_completion(&pend->fence.completion);
-		spin_unlock_irqrestore(&interrupt->wait_list_lock, flags);
+		spin_unlock(&interrupt->wait_list_lock);
 
 		if (copy_from_user(&completion_value, u64_to_user_ptr(user_address), 8)) {
 			dev_err(hdev->dev, "Failed to copy completion value from user\n");
@@ -3500,9 +3499,9 @@ static int _hl_interrupt_wait_ioctl_user_addr(struct hl_device *hdev, struct hl_
 	}
 
 remove_pending_user_interrupt:
-	spin_lock_irqsave(&interrupt->wait_list_lock, flags);
+	spin_lock(&interrupt->wait_list_lock);
 	list_del(&pend->wait_list_node);
-	spin_unlock_irqrestore(&interrupt->wait_list_lock, flags);
+	spin_unlock(&interrupt->wait_list_lock);
 
 	*timestamp = ktime_to_ns(pend->fence.timestamp);
 
diff --git a/drivers/accel/habanalabs/common/habanalabs.h b/drivers/accel/habanalabs/common/habanalabs.h
index bf81eda88e2e..5624ea19ec0b 100644
--- a/drivers/accel/habanalabs/common/habanalabs.h
+++ b/drivers/accel/habanalabs/common/habanalabs.h
@@ -3650,6 +3650,7 @@ irqreturn_t hl_irq_handler_eq(int irq, void *arg);
 irqreturn_t hl_irq_handler_dec_abnrm(int irq, void *arg);
 irqreturn_t hl_irq_handler_user_interrupt(int irq, void *arg);
 irqreturn_t hl_irq_handler_default(int irq, void *arg);
+irqreturn_t hl_irq_user_interrupt_thread_handler(int irq, void *arg);
 u32 hl_cq_inc_ptr(u32 ptr);
 
 int hl_asid_init(struct hl_device *hdev);
diff --git a/drivers/accel/habanalabs/common/irq.c b/drivers/accel/habanalabs/common/irq.c
index 04844e843a7b..c61c9a294ab8 100644
--- a/drivers/accel/habanalabs/common/irq.c
+++ b/drivers/accel/habanalabs/common/irq.c
@@ -334,6 +334,19 @@ static void handle_user_interrupt(struct hl_device *hdev, struct hl_user_interru
  *
  */
 irqreturn_t hl_irq_handler_user_interrupt(int irq, void *arg)
+{
+	return IRQ_WAKE_THREAD;
+}
+
+/**
+ * hl_irq_user_interrupt_thread_handler - irq thread handler for user interrupts.
+ * This function is invoked by threaded irq mechanism
+ *
+ * @irq: irq number
+ * @arg: pointer to user interrupt structure
+ *
+ */
+irqreturn_t hl_irq_user_interrupt_thread_handler(int irq, void *arg)
 {
 	struct hl_user_interrupt *user_int = arg;
 	struct hl_device *hdev = user_int->hdev;
diff --git a/drivers/accel/habanalabs/gaudi2/gaudi2.c b/drivers/accel/habanalabs/gaudi2/gaudi2.c
index 8e3cb761219f..a3e01e287f9d 100644
--- a/drivers/accel/habanalabs/gaudi2/gaudi2.c
+++ b/drivers/accel/habanalabs/gaudi2/gaudi2.c
@@ -3923,7 +3923,6 @@ static void gaudi2_dec_disable_msix(struct hl_device *hdev, u32 max_irq_num)
 static int gaudi2_dec_enable_msix(struct hl_device *hdev)
 {
 	int rc, i, irq_init_cnt, irq, relative_idx;
-	irq_handler_t irq_handler;
 	struct hl_dec *dec;
 
 	for (i = GAUDI2_IRQ_NUM_DCORE0_DEC0_NRM, irq_init_cnt = 0;
@@ -3933,20 +3932,24 @@ static int gaudi2_dec_enable_msix(struct hl_device *hdev)
 		irq = pci_irq_vector(hdev->pdev, i);
 		relative_idx = i - GAUDI2_IRQ_NUM_DCORE0_DEC0_NRM;
 
-		irq_handler = (relative_idx % 2) ?
-				hl_irq_handler_dec_abnrm :
-				hl_irq_handler_user_interrupt;
-
-		dec = hdev->dec + relative_idx / 2;
-
 		/* We pass different structures depending on the irq handler. For the abnormal
 		 * interrupt we pass hl_dec and for the regular interrupt we pass the relevant
 		 * user_interrupt entry
+		 *
+		 * TODO: change the dec abnrm to threaded irq
 		 */
-		rc = request_irq(irq, irq_handler, 0, gaudi2_irq_name(i),
-				((relative_idx % 2) ?
-				(void *) dec :
-				(void *) &hdev->user_interrupt[dec->core_id]));
+
+		dec = hdev->dec + relative_idx / 2;
+		if (relative_idx % 2) {
+			rc = request_irq(irq, hl_irq_handler_dec_abnrm, 0,
+						gaudi2_irq_name(i), (void *) dec);
+		} else {
+			rc = request_threaded_irq(irq, hl_irq_handler_user_interrupt,
+					hl_irq_user_interrupt_thread_handler, IRQF_ONESHOT,
+					gaudi2_irq_name(i),
+					(void *) &hdev->user_interrupt[dec->core_id]);
+		}
+
 		if (rc) {
 			dev_err(hdev->dev, "Failed to request IRQ %d", irq);
 			goto free_dec_irqs;
@@ -4008,7 +4011,9 @@ static int gaudi2_enable_msix(struct hl_device *hdev)
 		irq = pci_irq_vector(hdev->pdev, i);
 		irq_handler = hl_irq_handler_user_interrupt;
 
-		rc = request_irq(irq, irq_handler, 0, gaudi2_irq_name(i), &hdev->user_interrupt[j]);
+		rc = request_threaded_irq(irq, irq_handler, hl_irq_user_interrupt_thread_handler,
+				IRQF_ONESHOT, gaudi2_irq_name(i), &hdev->user_interrupt[j]);
+
 		if (rc) {
 			dev_err(hdev->dev, "Failed to request IRQ %d", irq);
 			goto free_user_irq;
-- 
2.25.1

