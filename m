Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F0497B1708
	for <lists+dri-devel@lfdr.de>; Thu, 28 Sep 2023 11:20:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E631010E0A3;
	Thu, 28 Sep 2023 09:20:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EF2A10E095
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Sep 2023 09:20:05 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 25FD3B81B73;
 Thu, 28 Sep 2023 09:20:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63BC0C433C9;
 Thu, 28 Sep 2023 09:20:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1695892803;
 bh=Vyr3UyZZ56ptALGkLm5eY95Jkj8E0OURUt5Ep5UjUSw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=fWvw/wPiff/w5nZ05hgT3Q5bBjC92yz+6Tn8DSykvtTgZ1x7o/N9qDR6pezkqCnVy
 7mcUOaGNqemrx5WMZkRtV7KU+jz3+qBZlF3eZWJsgrA3sbX9n/1/ZIetV8lF1j8sga
 3sXmBdjrzopQ3NLEllo5CDvoYCETqSpjy1XYqUQLbi4uNt8A/mXDP7M22Wk/6HvDC2
 o+nbirwXjZ0PdHTfO4NZBy44ZRJ6Ja/TZdA0/nT6ns+7004DLHZmUlPppKc6AkEK4+
 JxAVgwTI4OXZ797dcURyFyLsHVFbIOE7Z5DNzQFhHC2hL2OP2AiQfHZjkeji7jB6hF
 BlQH1Leh1yU7g==
From: Oded Gabbay <ogabbay@kernel.org>
To: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] accel/habanalabs: fix bug in decoder wait for cs
 completion
Date: Thu, 28 Sep 2023 12:19:55 +0300
Message-Id: <20230928091956.47762-2-ogabbay@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230928091956.47762-1-ogabbay@kernel.org>
References: <20230928091956.47762-1-ogabbay@kernel.org>
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
Cc: farah kassabri <fkassabri@habana.ai>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: farah kassabri <fkassabri@habana.ai>

The decoder interrupts are handled in the interrupt context
same as all user interrupts.
In such case, the wait list should be protected by
spin_lock_irqsave in order to avoid deadlock that might happen
with the user submission flow.

Signed-off-by: farah kassabri <fkassabri@habana.ai>
Reviewed-by: Oded Gabbay <ogabbay@kernel.org>
Signed-off-by: Oded Gabbay <ogabbay@kernel.org>
---
 .../accel/habanalabs/common/command_submission.c   | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/accel/habanalabs/common/command_submission.c b/drivers/accel/habanalabs/common/command_submission.c
index 4f7b70d9754c..3aa6eeef443b 100644
--- a/drivers/accel/habanalabs/common/command_submission.c
+++ b/drivers/accel/habanalabs/common/command_submission.c
@@ -3526,7 +3526,7 @@ static int _hl_interrupt_wait_ioctl_user_addr(struct hl_device *hdev, struct hl_
 				u64 *timestamp)
 {
 	struct hl_user_pending_interrupt *pend;
-	unsigned long timeout;
+	unsigned long timeout, flags;
 	u64 completion_value;
 	long completion_rc;
 	int rc = 0;
@@ -3546,9 +3546,9 @@ static int _hl_interrupt_wait_ioctl_user_addr(struct hl_device *hdev, struct hl_
 	/* Add pending user interrupt to relevant list for the interrupt
 	 * handler to monitor
 	 */
-	spin_lock(&interrupt->wait_list_lock);
+	spin_lock_irqsave(&interrupt->wait_list_lock, flags);
 	list_add_tail(&pend->list_node, &interrupt->wait_list_head);
-	spin_unlock(&interrupt->wait_list_lock);
+	spin_unlock_irqrestore(&interrupt->wait_list_lock, flags);
 
 	/* We check for completion value as interrupt could have been received
 	 * before we added the node to the wait list
@@ -3579,14 +3579,14 @@ static int _hl_interrupt_wait_ioctl_user_addr(struct hl_device *hdev, struct hl_
 	 * If comparison fails, keep waiting until timeout expires
 	 */
 	if (completion_rc > 0) {
-		spin_lock(&interrupt->wait_list_lock);
+		spin_lock_irqsave(&interrupt->wait_list_lock, flags);
 		/* reinit_completion must be called before we check for user
 		 * completion value, otherwise, if interrupt is received after
 		 * the comparison and before the next wait_for_completion,
 		 * we will reach timeout and fail
 		 */
 		reinit_completion(&pend->fence.completion);
-		spin_unlock(&interrupt->wait_list_lock);
+		spin_unlock_irqrestore(&interrupt->wait_list_lock, flags);
 
 		if (copy_from_user(&completion_value, u64_to_user_ptr(user_address), 8)) {
 			dev_err(hdev->dev, "Failed to copy completion value from user\n");
@@ -3623,9 +3623,9 @@ static int _hl_interrupt_wait_ioctl_user_addr(struct hl_device *hdev, struct hl_
 	}
 
 remove_pending_user_interrupt:
-	spin_lock(&interrupt->wait_list_lock);
+	spin_lock_irqsave(&interrupt->wait_list_lock, flags);
 	list_del(&pend->list_node);
-	spin_unlock(&interrupt->wait_list_lock);
+	spin_unlock_irqrestore(&interrupt->wait_list_lock, flags);
 
 	*timestamp = ktime_to_ns(pend->fence.timestamp);
 
-- 
2.34.1

