Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A31F6939F6
	for <lists+dri-devel@lfdr.de>; Sun, 12 Feb 2023 21:45:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F08DE10E480;
	Sun, 12 Feb 2023 20:45:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C93510E475
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Feb 2023 20:45:36 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id DAD84B80D8E;
 Sun, 12 Feb 2023 20:45:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A07DCC4339E;
 Sun, 12 Feb 2023 20:45:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1676234733;
 bh=rrCNHeoMbZuQZ9K3FYI+6UIoEDMrVRhnx7r5joH7/eA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=XmrlAnRpCBnYa9w8O/03qZk4iN3LU45WXeLHSF2eTeM91YlVacdCER+Dil9RYdmUa
 M7faGGqi9np8VH1xxvJUmxVQtlTl+Ts2c+NWt071rS0k2EA6M842anHFQ8ptd9m/sk
 /umjz2BQpfQWqesi+BljkSZal2qkcXv9h9dTsQ5/2iq80fUQWfrf7c65NTIwgRuybx
 T2IxuIyi3+VYRnsoF5cJNWGqmGK7eHUSGKQgMM9YZJSKXc2qyuKx2mzOJNBuVNfE/R
 2/hIjp2wVg/CefjenUQ78eIF/6txSuY+TXuyofR+rmkos60gGBWYfWGg0ULZFxojDt
 gq17xybe0OEfA==
From: Oded Gabbay <ogabbay@kernel.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 19/27] habanalabs: capture interrupt timestamp in handler
Date: Sun, 12 Feb 2023 22:44:46 +0200
Message-Id: <20230212204454.2938561-19-ogabbay@kernel.org>
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
Cc: Ofir Bitton <obitton@habana.ai>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Ofir Bitton <obitton@habana.ai>

In order for interrupt timestamp to be more accurate we should
capture it during the interrupt handling rather than in threaded
irq context.

Signed-off-by: Ofir Bitton <obitton@habana.ai>
Reviewed-by: Oded Gabbay <ogabbay@kernel.org>
Signed-off-by: Oded Gabbay <ogabbay@kernel.org>
---
 drivers/accel/habanalabs/common/habanalabs.h | 2 ++
 drivers/accel/habanalabs/common/irq.c        | 9 ++++++---
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/accel/habanalabs/common/habanalabs.h b/drivers/accel/habanalabs/common/habanalabs.h
index 5624ea19ec0b..24ad15272040 100644
--- a/drivers/accel/habanalabs/common/habanalabs.h
+++ b/drivers/accel/habanalabs/common/habanalabs.h
@@ -1107,6 +1107,7 @@ enum hl_user_interrupt_type {
  * @type: user interrupt type
  * @wait_list_head: head to the list of user threads pending on this interrupt
  * @wait_list_lock: protects wait_list_head
+ * @timestamp: last timestamp taken upon interrupt
  * @interrupt_id: msix interrupt id
  */
 struct hl_user_interrupt {
@@ -1114,6 +1115,7 @@ struct hl_user_interrupt {
 	enum hl_user_interrupt_type	type;
 	struct list_head		wait_list_head;
 	spinlock_t			wait_list_lock;
+	ktime_t				timestamp;
 	u32				interrupt_id;
 };
 
diff --git a/drivers/accel/habanalabs/common/irq.c b/drivers/accel/habanalabs/common/irq.c
index c61c9a294ab8..716228291b46 100644
--- a/drivers/accel/habanalabs/common/irq.c
+++ b/drivers/accel/habanalabs/common/irq.c
@@ -280,7 +280,6 @@ static void handle_user_interrupt(struct hl_device *hdev, struct hl_user_interru
 	struct list_head *ts_reg_free_list_head = NULL;
 	struct timestamp_reg_work_obj *job;
 	bool reg_node_handle_fail = false;
-	ktime_t now = ktime_get();
 	int rc;
 
 	/* For registration nodes:
@@ -303,13 +302,13 @@ static void handle_user_interrupt(struct hl_device *hdev, struct hl_user_interru
 			if (pend->ts_reg_info.buf) {
 				if (!reg_node_handle_fail) {
 					rc = handle_registration_node(hdev, pend,
-								&ts_reg_free_list_head, now);
+							&ts_reg_free_list_head, intr->timestamp);
 					if (rc)
 						reg_node_handle_fail = true;
 				}
 			} else {
 				/* Handle wait target value node */
-				pend->fence.timestamp = now;
+				pend->fence.timestamp = intr->timestamp;
 				complete_all(&pend->fence.completion);
 			}
 		}
@@ -335,6 +334,10 @@ static void handle_user_interrupt(struct hl_device *hdev, struct hl_user_interru
  */
 irqreturn_t hl_irq_handler_user_interrupt(int irq, void *arg)
 {
+	struct hl_user_interrupt *user_int = arg;
+
+	user_int->timestamp = ktime_get();
+
 	return IRQ_WAKE_THREAD;
 }
 
-- 
2.25.1

