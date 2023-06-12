Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9622F72C1A9
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jun 2023 12:59:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0581B10E1FC;
	Mon, 12 Jun 2023 10:59:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E38DE10E03F
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jun 2023 10:59:30 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6721B626F1;
 Mon, 12 Jun 2023 10:59:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E84F4C4339C;
 Mon, 12 Jun 2023 10:59:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1686567569;
 bh=FSNB6SVMxkYxCHCyY/ZbQSfO1kbL4WnslSJ5t8aWpH0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=FOr9pVkWc8IuyG9ufiTB0DTwB5zo7yAguQCRcTIEvkd6JNFt+wcFs1YBHTSYh8jVz
 k8xpyo18LI3/HcS6dLyhMRjEg+R2HAgNQRvTXH6xomb4wTrGr1LaeBBrXDXrt5FE3F
 XE4I5WmVzFRjd1d5BHLGPqj5DJL2gd6GqUqvheXx+YcS3h8UmG4HnkPm6+Us1YYf6Z
 lpdQm3ew2cIpw1vRtHcwKhjs2gPnk7k+YFc4Ww/b58QPzKJIngn3hVXc0Og20O9UTH
 vnm91UVkS1ANfFjWORE1/fbNmiWFNbVo4yGiisMGQK6yu4xHluTG+9cu2iLOH3lKR1
 CXJ5VHaSMz3ig==
From: Oded Gabbay <ogabbay@kernel.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 3/3] accel/habanalabs: change user interrupt to threaded IRQ
Date: Mon, 12 Jun 2023 13:59:21 +0300
Message-Id: <20230612105921.3043768-3-ogabbay@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230612105921.3043768-1-ogabbay@kernel.org>
References: <20230612105921.3043768-1-ogabbay@kernel.org>
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

It is preferable to handle the user interrupt job from a threaded IRQ
context. This will allow to avoid disabling interrupts when the user
process registers for a new event and to avoid long handling inside an
interrupt.

Signed-off-by: Tal Cohen <talcohen@habana.ai>
Reviewed-by: Oded Gabbay <ogabbay@kernel.org>
Signed-off-by: Oded Gabbay <ogabbay@kernel.org>
---
 .../habanalabs/common/command_submission.c    | 22 +++++++++----------
 drivers/accel/habanalabs/common/habanalabs.h  |  1 -
 drivers/accel/habanalabs/common/irq.c         | 17 +-------------
 drivers/accel/habanalabs/gaudi2/gaudi2.c      | 17 +++++++-------
 4 files changed, 20 insertions(+), 37 deletions(-)

diff --git a/drivers/accel/habanalabs/common/command_submission.c b/drivers/accel/habanalabs/common/command_submission.c
index 396bbf8652b7..cfbf5fe72bb1 100644
--- a/drivers/accel/habanalabs/common/command_submission.c
+++ b/drivers/accel/habanalabs/common/command_submission.c
@@ -47,7 +47,6 @@ struct wait_interrupt_data {
 	u64 cq_offset;
 	u64 target_value;
 	u64 intr_timeout_us;
-	unsigned long flags;
 };
 
 static void job_wq_completion(struct work_struct *work);
@@ -3324,11 +3323,12 @@ static int ts_get_and_handle_kernel_record(struct hl_device *hdev, struct hl_ctx
 		 * on, and we don't wan't to lock two lists while we're doing unregister, so
 		 * unlock the new interrupt wait list here and acquire the lock again after you done
 		 */
-		spin_unlock_irqrestore(&data->interrupt->wait_list_lock, data->flags);
+		spin_unlock(&data->interrupt->wait_list_lock);
 
 		unregister_timestamp_node(hdev, ctx, data->mmg, data->ts_handle,
 				data->ts_offset, req_offset_record->ts_reg_info.interrupt);
-		spin_lock_irqsave(&data->interrupt->wait_list_lock, data->flags);
+
+		spin_lock(&data->interrupt->wait_list_lock);
 	}
 
 	/* Fill up the new registration node info and add it to the list */
@@ -3383,12 +3383,12 @@ static int _hl_interrupt_wait_ioctl(struct hl_device *hdev, struct hl_ctx *ctx,
 			goto put_cq_cb;
 		}
 
-		spin_lock_irqsave(&data->interrupt->wait_list_lock, data->flags);
+		spin_lock(&data->interrupt->wait_list_lock);
 
 		/* get ts buffer record */
 		rc = ts_get_and_handle_kernel_record(hdev, ctx, data, &pend);
 		if (rc) {
-			spin_unlock_irqrestore(&data->interrupt->wait_list_lock, data->flags);
+			spin_unlock(&data->interrupt->wait_list_lock);
 			goto put_ts_buff;
 		}
 	} else {
@@ -3400,14 +3400,14 @@ static int _hl_interrupt_wait_ioctl(struct hl_device *hdev, struct hl_ctx *ctx,
 		hl_fence_init(&pend->fence, ULONG_MAX);
 		pend->cq_kernel_addr = (u64 *) data->cq_cb->kernel_address + data->cq_offset;
 		pend->cq_target_value = data->target_value;
-		spin_lock_irqsave(&data->interrupt->wait_list_lock, data->flags);
+		spin_lock(&data->interrupt->wait_list_lock);
 	}
 
 	/* We check for completion value as interrupt could have been received
 	 * before we add the wait/timestamp node to the wait list.
 	 */
 	if (*pend->cq_kernel_addr >= data->target_value) {
-		spin_unlock_irqrestore(&data->interrupt->wait_list_lock, data->flags);
+		spin_unlock(&data->interrupt->wait_list_lock);
 
 		if (register_ts_record) {
 			dev_dbg(hdev->dev, "Target value already reached release ts record: pend: %p, offset: %llu, interrupt: %u\n",
@@ -3425,7 +3425,7 @@ static int _hl_interrupt_wait_ioctl(struct hl_device *hdev, struct hl_ctx *ctx,
 			goto set_timestamp;
 		}
 	} else if (!data->intr_timeout_us) {
-		spin_unlock_irqrestore(&data->interrupt->wait_list_lock, data->flags);
+		spin_unlock(&data->interrupt->wait_list_lock);
 		*status = HL_WAIT_CS_STATUS_BUSY;
 		pend->fence.timestamp = ktime_get();
 		goto set_timestamp;
@@ -3438,7 +3438,7 @@ static int _hl_interrupt_wait_ioctl(struct hl_device *hdev, struct hl_ctx *ctx,
 	 * same list could have nodes for different cq counter handle.
 	 */
 	list_add_tail(&pend->wait_list_node, &data->interrupt->wait_list_head);
-	spin_unlock_irqrestore(&data->interrupt->wait_list_lock, data->flags);
+	spin_unlock(&data->interrupt->wait_list_lock);
 
 	if (register_ts_record) {
 		rc = *status = HL_WAIT_CS_STATUS_COMPLETED;
@@ -3482,9 +3482,9 @@ static int _hl_interrupt_wait_ioctl(struct hl_device *hdev, struct hl_ctx *ctx,
 	 * for ts record, the node will be deleted in the irq handler after
 	 * we reach the target value.
 	 */
-	spin_lock_irqsave(&data->interrupt->wait_list_lock, data->flags);
+	spin_lock(&data->interrupt->wait_list_lock);
 	list_del(&pend->wait_list_node);
-	spin_unlock_irqrestore(&data->interrupt->wait_list_lock, data->flags);
+	spin_unlock(&data->interrupt->wait_list_lock);
 
 set_timestamp:
 	*timestamp = ktime_to_ns(pend->fence.timestamp);
diff --git a/drivers/accel/habanalabs/common/habanalabs.h b/drivers/accel/habanalabs/common/habanalabs.h
index 43f59d36069c..16bea0a3f3a4 100644
--- a/drivers/accel/habanalabs/common/habanalabs.h
+++ b/drivers/accel/habanalabs/common/habanalabs.h
@@ -3656,7 +3656,6 @@ void hl_eq_reset(struct hl_device *hdev, struct hl_eq *q);
 irqreturn_t hl_irq_handler_cq(int irq, void *arg);
 irqreturn_t hl_irq_handler_eq(int irq, void *arg);
 irqreturn_t hl_irq_handler_dec_abnrm(int irq, void *arg);
-irqreturn_t hl_irq_handler_user_interrupt(int irq, void *arg);
 irqreturn_t hl_irq_user_interrupt_thread_handler(int irq, void *arg);
 u32 hl_cq_inc_ptr(u32 ptr);
 
diff --git a/drivers/accel/habanalabs/common/irq.c b/drivers/accel/habanalabs/common/irq.c
index 10ac100bf9e2..4f2762ea00ab 100644
--- a/drivers/accel/habanalabs/common/irq.c
+++ b/drivers/accel/habanalabs/common/irq.c
@@ -346,22 +346,6 @@ static void handle_unexpected_user_interrupt(struct hl_device *hdev)
 	dev_err_ratelimited(hdev->dev, "Received unexpected user error interrupt\n");
 }
 
-/**
- * hl_irq_handler_user_interrupt - irq handler for user interrupts
- *
- * @irq: irq number
- * @arg: pointer to user interrupt structure
- *
- */
-irqreturn_t hl_irq_handler_user_interrupt(int irq, void *arg)
-{
-	struct hl_user_interrupt *user_int = arg;
-
-	user_int->timestamp = ktime_get();
-
-	return IRQ_WAKE_THREAD;
-}
-
 /**
  * hl_irq_user_interrupt_thread_handler - irq thread handler for user interrupts.
  * This function is invoked by threaded irq mechanism
@@ -375,6 +359,7 @@ irqreturn_t hl_irq_user_interrupt_thread_handler(int irq, void *arg)
 	struct hl_user_interrupt *user_int = arg;
 	struct hl_device *hdev = user_int->hdev;
 
+	user_int->timestamp = ktime_get();
 	switch (user_int->type) {
 	case HL_USR_INTERRUPT_CQ:
 		handle_user_interrupt(hdev, &hdev->common_user_cq_interrupt);
diff --git a/drivers/accel/habanalabs/gaudi2/gaudi2.c b/drivers/accel/habanalabs/gaudi2/gaudi2.c
index 1085215ac51d..1e22c7a47358 100644
--- a/drivers/accel/habanalabs/gaudi2/gaudi2.c
+++ b/drivers/accel/habanalabs/gaudi2/gaudi2.c
@@ -4224,7 +4224,7 @@ static int gaudi2_dec_enable_msix(struct hl_device *hdev)
 			rc = request_irq(irq, hl_irq_handler_dec_abnrm, 0,
 						gaudi2_irq_name(i), (void *) dec);
 		} else {
-			rc = request_threaded_irq(irq, hl_irq_handler_user_interrupt,
+			rc = request_threaded_irq(irq, NULL,
 					hl_irq_user_interrupt_thread_handler, IRQF_ONESHOT,
 					gaudi2_irq_name(i),
 					(void *) &hdev->user_interrupt[dec->core_id]);
@@ -4284,17 +4284,17 @@ static int gaudi2_enable_msix(struct hl_device *hdev)
 	}
 
 	irq = pci_irq_vector(hdev->pdev, GAUDI2_IRQ_NUM_TPC_ASSERT);
-	rc = request_threaded_irq(irq, hl_irq_handler_user_interrupt,
-			hl_irq_user_interrupt_thread_handler, IRQF_ONESHOT,
-			gaudi2_irq_name(GAUDI2_IRQ_NUM_TPC_ASSERT), &hdev->tpc_interrupt);
+	rc = request_threaded_irq(irq, NULL, hl_irq_user_interrupt_thread_handler, IRQF_ONESHOT,
+					gaudi2_irq_name(GAUDI2_IRQ_NUM_TPC_ASSERT),
+					&hdev->tpc_interrupt);
 	if (rc) {
 		dev_err(hdev->dev, "Failed to request IRQ %d", irq);
 		goto free_dec_irq;
 	}
 
 	irq = pci_irq_vector(hdev->pdev, GAUDI2_IRQ_NUM_UNEXPECTED_ERROR);
-	rc = request_irq(irq, hl_irq_handler_user_interrupt, 0,
-			gaudi2_irq_name(GAUDI2_IRQ_NUM_UNEXPECTED_ERROR),
+	rc = request_threaded_irq(irq, NULL, hl_irq_user_interrupt_thread_handler, IRQF_ONESHOT,
+					gaudi2_irq_name(GAUDI2_IRQ_NUM_UNEXPECTED_ERROR),
 					&hdev->unexpected_error_interrupt);
 	if (rc) {
 		dev_err(hdev->dev, "Failed to request IRQ %d", irq);
@@ -4306,9 +4306,8 @@ static int gaudi2_enable_msix(struct hl_device *hdev)
 			i++, j++, user_irq_init_cnt++) {
 
 		irq = pci_irq_vector(hdev->pdev, i);
-		rc = request_threaded_irq(irq, hl_irq_handler_user_interrupt,
-						hl_irq_user_interrupt_thread_handler, IRQF_ONESHOT,
-						gaudi2_irq_name(i), &hdev->user_interrupt[j]);
+		rc = request_threaded_irq(irq, NULL, hl_irq_user_interrupt_thread_handler,
+				IRQF_ONESHOT, gaudi2_irq_name(i), &hdev->user_interrupt[j]);
 
 		if (rc) {
 			dev_err(hdev->dev, "Failed to request IRQ %d", irq);
-- 
2.40.1

