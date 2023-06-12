Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EC99872C1AA
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jun 2023 12:59:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E80210E03F;
	Mon, 12 Jun 2023 10:59:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86B1B10E1FC
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jun 2023 10:59:29 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id EF668626B7;
 Mon, 12 Jun 2023 10:59:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7AAD3C4339B;
 Mon, 12 Jun 2023 10:59:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1686567568;
 bh=oNeJ57bGZpknWefxn3bNYaNxHZ1zfcNo8SvnRW2vpLU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Clggvddeiga8hRfkdhPaQDQBggZhll1GdR10iGxscdFlyS0NXiYVYi/2XbniFdytx
 PFyWqg3ezn+/UpzeveLtqHyzQaL28TGYfCBsHeF1z/Yf9gOsQCyU5Q849iVQ/Qg9aL
 JexTgCfB8XrPk72cnXaAyP2a98vbEQWfGWKiikwfygyTtK4PQ+vpsdjC3hQY09qezZ
 MrrwI+Is3uIo4GmdJW/d8WKlYFXivMvuPwnPYAlzJKx39edO5tJQlJn+jPkJWwCW6i
 skGrj2IvwSOkTAvOAhSfNGgcARDluYl71735WzWDcff2Ehbs0TCHSfButc+WkSCPJF
 SPi5RJnKsdk9w==
From: Oded Gabbay <ogabbay@kernel.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/3] accel/habanalabs: fix wait_for_interrupt abortion flow
Date: Mon, 12 Jun 2023 13:59:20 +0300
Message-Id: <20230612105921.3043768-2-ogabbay@kernel.org>
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
Cc: farah kassabri <fkassabri@habana.ai>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: farah kassabri <fkassabri@habana.ai>

When the driver needs to abort waiters for interrupts, for cases
such as critical events that occur and driver need to do hard reset,
in such scenario the driver will complete the fence to wake up the
waiting thread, and will set the fence error indication.
The return value of the completion API will be greater than 0
since it will return the timeout, but as this indicates successful
completion, the driver should mark it as aborted.

Signed-off-by: farah kassabri <fkassabri@habana.ai>
Reviewed-by: Oded Gabbay <ogabbay@kernel.org>
Signed-off-by: Oded Gabbay <ogabbay@kernel.org>
---
 .../habanalabs/common/command_submission.c    | 32 +++++++++----------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/drivers/accel/habanalabs/common/command_submission.c b/drivers/accel/habanalabs/common/command_submission.c
index 02ac6d754fba..396bbf8652b7 100644
--- a/drivers/accel/habanalabs/common/command_submission.c
+++ b/drivers/accel/habanalabs/common/command_submission.c
@@ -3449,7 +3449,15 @@ static int _hl_interrupt_wait_ioctl(struct hl_device *hdev, struct hl_ctx *ctx,
 	completion_rc = wait_for_completion_interruptible_timeout(&pend->fence.completion,
 								timeout);
 	if (completion_rc > 0) {
-		*status = HL_WAIT_CS_STATUS_COMPLETED;
+		if (pend->fence.error == -EIO) {
+			dev_err_ratelimited(hdev->dev,
+					"interrupt based wait ioctl aborted(error:%d) due to a reset cycle initiated\n",
+					pend->fence.error);
+			rc = -EIO;
+			*status = HL_WAIT_CS_STATUS_ABORTED;
+		} else {
+			*status = HL_WAIT_CS_STATUS_COMPLETED;
+		}
 	} else {
 		if (completion_rc == -ERESTARTSYS) {
 			dev_err_ratelimited(hdev->dev,
@@ -3458,21 +3466,13 @@ static int _hl_interrupt_wait_ioctl(struct hl_device *hdev, struct hl_ctx *ctx,
 			rc = -EINTR;
 			*status = HL_WAIT_CS_STATUS_ABORTED;
 		} else {
-			if (pend->fence.error == -EIO) {
-				dev_err_ratelimited(hdev->dev,
-						"interrupt based wait ioctl aborted(error:%d) due to a reset cycle initiated\n",
-						pend->fence.error);
-				rc = -EIO;
-				*status = HL_WAIT_CS_STATUS_ABORTED;
-			} else {
-				/* The wait has timed-out. We don't know anything beyond that
-				 * because the workload wasn't submitted through the driver.
-				 * Therefore, from driver's perspective, the workload is still
-				 * executing.
-				 */
-				rc = 0;
-				*status = HL_WAIT_CS_STATUS_BUSY;
-			}
+			/* The wait has timed-out. We don't know anything beyond that
+			 * because the workload was not submitted through the driver.
+			 * Therefore, from driver's perspective, the workload is still
+			 * executing.
+			 */
+			rc = 0;
+			*status = HL_WAIT_CS_STATUS_BUSY;
 		}
 	}
 
-- 
2.40.1

