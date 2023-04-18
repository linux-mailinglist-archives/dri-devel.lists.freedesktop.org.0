Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 25B586E5DA3
	for <lists+dri-devel@lfdr.de>; Tue, 18 Apr 2023 11:39:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42FBA10E732;
	Tue, 18 Apr 2023 09:39:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DB1F10E725
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Apr 2023 09:39:35 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0DF0162661;
 Tue, 18 Apr 2023 09:39:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8FDE1C433EF;
 Tue, 18 Apr 2023 09:39:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1681810774;
 bh=RlAnk0HIEtpPzMhoDosalgTSMbhgAkI4oI3YyC2FN/U=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=NNDTIxRBJyRhdSIkm5m0kbqUZrl4CYMrcuOvbrM8Ty9LYD5uQ6YKsOZpqnkZ0O2sK
 9SMubPUXPkAuTa8LqOObnD4aYy9e+0392lixkn+7mcv6WSyEWmRHlbr8iRRJfdAGL3
 KnHZnalg2666Naq0Cnk8brYxLjh41R1NrXiItCEva0AbCM3cLlgDZd59c086WxEgJv
 fkus7eG0i3sTEwud9hX0IduCSAO6V1wgAwkxewYwpR6c0LbbN2Xcr0eGqDnr0V416W
 f1Vf2+/j6jLw47A7y8CmstzHrP+Sw2L16iitpLTt3YgsDR4nKKAXj3vRGJ/5nudDjS
 eAKt1hKb0qBUA==
From: Oded Gabbay <ogabbay@kernel.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 10/10] accel/habanalabs: refactor abort of completions and
 waits
Date: Tue, 18 Apr 2023 12:39:16 +0300
Message-Id: <20230418093916.2979728-10-ogabbay@kernel.org>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230418093916.2979728-1-ogabbay@kernel.org>
References: <20230418093916.2979728-1-ogabbay@kernel.org>
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
Cc: Koby Elbaz <kelbaz@habana.ai>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Koby Elbaz <kelbaz@habana.ai>

Aborting CS completions should be in command_submission.c but aborting
waiting for user interrupts should be in device.c.

This separation is also for adding more abort operations in the future.

Signed-off-by: Koby Elbaz <kelbaz@habana.ai>
Reviewed-by: Oded Gabbay <ogabbay@kernel.org>
Signed-off-by: Oded Gabbay <ogabbay@kernel.org>
---
 .../habanalabs/common/command_submission.c      |  3 +--
 drivers/accel/habanalabs/common/device.c        | 17 ++++++++++++-----
 drivers/accel/habanalabs/common/habanalabs.h    |  2 +-
 3 files changed, 14 insertions(+), 8 deletions(-)

diff --git a/drivers/accel/habanalabs/common/command_submission.c b/drivers/accel/habanalabs/common/command_submission.c
index 56bc115e1b83..ccf68f482948 100644
--- a/drivers/accel/habanalabs/common/command_submission.c
+++ b/drivers/accel/habanalabs/common/command_submission.c
@@ -1139,11 +1139,10 @@ static void force_complete_cs(struct hl_device *hdev)
 	spin_unlock(&hdev->cs_mirror_lock);
 }
 
-void hl_abort_waitings_for_completion(struct hl_device *hdev)
+void hl_abort_waiting_for_cs_completions(struct hl_device *hdev)
 {
 	force_complete_cs(hdev);
 	force_complete_multi_cs(hdev);
-	hl_release_pending_user_interrupts(hdev);
 }
 
 static void job_wq_completion(struct work_struct *work)
diff --git a/drivers/accel/habanalabs/common/device.c b/drivers/accel/habanalabs/common/device.c
index fabfc501ef54..c8f4a34d2831 100644
--- a/drivers/accel/habanalabs/common/device.c
+++ b/drivers/accel/habanalabs/common/device.c
@@ -1157,6 +1157,16 @@ static void take_release_locks(struct hl_device *hdev)
 	mutex_unlock(&hdev->fpriv_ctrl_list_lock);
 }
 
+static void hl_abort_waiting_for_completions(struct hl_device *hdev)
+{
+	hl_abort_waiting_for_cs_completions(hdev);
+
+	/* Release all pending user interrupts, each pending user interrupt
+	 * holds a reference to a user context.
+	 */
+	hl_release_pending_user_interrupts(hdev);
+}
+
 static void cleanup_resources(struct hl_device *hdev, bool hard_reset, bool fw_reset,
 				bool skip_wq_flush)
 {
@@ -1176,10 +1186,7 @@ static void cleanup_resources(struct hl_device *hdev, bool hard_reset, bool fw_r
 	/* flush the MMU prefetch workqueue */
 	flush_workqueue(hdev->prefetch_wq);
 
-	/* Release all pending user interrupts, each pending user interrupt
-	 * holds a reference to user context
-	 */
-	hl_release_pending_user_interrupts(hdev);
+	hl_abort_waiting_for_completions(hdev);
 }
 
 /*
@@ -1921,7 +1928,7 @@ int hl_device_cond_reset(struct hl_device *hdev, u32 flags, u64 event_mask)
 
 	hl_ctx_put(ctx);
 
-	hl_abort_waitings_for_completion(hdev);
+	hl_abort_waiting_for_completions(hdev);
 
 	return 0;
 
diff --git a/drivers/accel/habanalabs/common/habanalabs.h b/drivers/accel/habanalabs/common/habanalabs.h
index 6b102947cb90..f83ea96c6530 100644
--- a/drivers/accel/habanalabs/common/habanalabs.h
+++ b/drivers/accel/habanalabs/common/habanalabs.h
@@ -3934,7 +3934,7 @@ void hl_dec_fini(struct hl_device *hdev);
 void hl_dec_ctx_fini(struct hl_ctx *ctx);
 
 void hl_release_pending_user_interrupts(struct hl_device *hdev);
-void hl_abort_waitings_for_completion(struct hl_device *hdev);
+void hl_abort_waiting_for_cs_completions(struct hl_device *hdev);
 int hl_cs_signal_sob_wraparound_handler(struct hl_device *hdev, u32 q_idx,
 			struct hl_hw_sob **hw_sob, u32 count, bool encaps_sig);
 
-- 
2.40.0

