Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D64A6939E1
	for <lists+dri-devel@lfdr.de>; Sun, 12 Feb 2023 21:45:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78C2810E047;
	Sun, 12 Feb 2023 20:45:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA25010E05F
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Feb 2023 20:45:07 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 2283260DD5;
 Sun, 12 Feb 2023 20:45:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9EB77C433D2;
 Sun, 12 Feb 2023 20:45:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1676234706;
 bh=YYk+iaUvmm5ACGOk+Bgu/Nqfdovc1sfBdH0DQEtyrN4=;
 h=From:To:Cc:Subject:Date:From;
 b=Z3iIBGsJpQxkYir1tBm9HDq6AhYpeWLeAWoBJcwUM2g3XJOxAsGtkQ4hYq1zjcvIU
 28bdu/s3YjESPXIQgAJA+EroI4qphOROIw1nVVJlErsxeNNY/nVOHKUS6BPbu3pzmv
 6kYm0e3DP7A2Zp2hSMaAjUnxmNLHSCcuROp1x4PlhO8tudO3xletesEhSTdvgkYJ9O
 cOACBeE9meUzNtUkaTXMDLF2ZAbDB3DopHQXubSsyx/PGHq+GDO+1zVVnlIbu5cBv0
 z8Y1EXb1hICP2Ao/LmwdielCeDfzUV+q0g07fYfKnY8jwR0LrCDbApNmzRajm9mzYc
 T/qpGzYQSYONw==
From: Oded Gabbay <ogabbay@kernel.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 01/27] habanalabs/gaudi2: increase user interrupt grace time
Date: Sun, 12 Feb 2023 22:44:28 +0200
Message-Id: <20230212204454.2938561-1-ogabbay@kernel.org>
X-Mailer: git-send-email 2.25.1
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

Currently we support scenarios where a timestamp registration request
of a certain offset is received during the interrupt handling of the
same offset. In this case we give a grace period of up to 100us for
the interrupt handler to finish.
It seems that sometimes the interrupt handling takes more than expected,
and therefore this path should be optimized. Until that happens, let's
increase the grace period in order not to reach timeout which will
cause user call to be rejected.

Signed-off-by: Ofir Bitton <obitton@habana.ai>
Reviewed-by: Oded Gabbay <ogabbay@kernel.org>
Signed-off-by: Oded Gabbay <ogabbay@kernel.org>
---
 drivers/accel/habanalabs/common/command_submission.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/accel/habanalabs/common/command_submission.c b/drivers/accel/habanalabs/common/command_submission.c
index 8270db0a72a2..e313ff8af7cc 100644
--- a/drivers/accel/habanalabs/common/command_submission.c
+++ b/drivers/accel/habanalabs/common/command_submission.c
@@ -17,7 +17,7 @@
 			HL_CS_FLAGS_FLUSH_PCI_HBW_WRITES)
 
 
-#define MAX_TS_ITER_NUM 10
+#define MAX_TS_ITER_NUM 100
 
 /**
  * enum hl_cs_wait_status - cs wait status
@@ -3145,6 +3145,7 @@ static int ts_buff_get_kernel_ts_record(struct hl_mmap_mem_buf *buf,
 			(ts_buff->kernel_buff_size / sizeof(struct hl_user_pending_interrupt));
 	unsigned long flags, iter_counter = 0;
 	u64 current_cq_counter;
+	ktime_t timestamp;
 
 	/* Validate ts_offset not exceeding last max */
 	if (requested_offset_record >= cb_last) {
@@ -3153,6 +3154,8 @@ static int ts_buff_get_kernel_ts_record(struct hl_mmap_mem_buf *buf,
 		return -EINVAL;
 	}
 
+	timestamp = ktime_get();
+
 start_over:
 	spin_lock_irqsave(wait_list_lock, flags);
 
@@ -3178,11 +3181,12 @@ static int ts_buff_get_kernel_ts_record(struct hl_mmap_mem_buf *buf,
 
 			/* irq handling in the middle give it time to finish */
 			spin_unlock_irqrestore(wait_list_lock, flags);
-			usleep_range(1, 10);
+			usleep_range(100, 1000);
 			if (++iter_counter == MAX_TS_ITER_NUM) {
 				dev_err(buf->mmg->dev,
-					"handling registration interrupt took too long!!\n");
-				return -EINVAL;
+					"Timestamp offest processing reached timeout of %lld ms\n",
+					ktime_ms_delta(ktime_get(), timestamp));
+				return -EAGAIN;
 			}
 
 			goto start_over;
-- 
2.25.1

