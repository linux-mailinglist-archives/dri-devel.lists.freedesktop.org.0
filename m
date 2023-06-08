Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A40272818D
	for <lists+dri-devel@lfdr.de>; Thu,  8 Jun 2023 15:39:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DB6610E5C6;
	Thu,  8 Jun 2023 13:39:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37FBA10E5C5
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Jun 2023 13:39:09 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B380B63C24;
 Thu,  8 Jun 2023 13:39:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F0BFC433A1;
 Thu,  8 Jun 2023 13:39:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1686231548;
 bh=tPgS4W6BVvhcsvRzGf8flPuxmFCvKCtSMb1q1vTZ9rI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=CI0C1u4sOVhSkbAlwQP2xniWuFTxhUruT01V8LMSa/7+QuNrgmVhOI+6CPfrJKXt3
 mtt+c1FOxV/knUgnJ/rjh/R09L8k0vioy64ppWkzPc0fMNmr6+Z3kk8BYe8/7cgOI7
 Z2A+Ke6dpNJYr9/JguZcsU2tMAHbwYzxtv8y/lwupQPpkPvRqsc4inphZJZ4NkfSYo
 i5cVD0P9O+noXEeFz04caL2ZSwqSrHxpjXMfZnrW8d4GyFB1YUWdr4D0zVfHJScsH2
 4QQYY/JsUBm6+53kflBNMT+ltLdTKpgRRXYQAGPDHEpvXa43O6jfPWg0xGa7mFV7jh
 crznnwkoI9ZOA==
From: Oded Gabbay <ogabbay@kernel.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 10/12] accel/habanalabs: print return code when process
 termination fails
Date: Thu,  8 Jun 2023 16:38:47 +0300
Message-Id: <20230608133849.2739411-10-ogabbay@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230608133849.2739411-1-ogabbay@kernel.org>
References: <20230608133849.2739411-1-ogabbay@kernel.org>
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

As part of driver teardown, we attempt to kill all user processes.
It shouldn't fail, but if it does we want to print the error code that
the kapi returned to us.

Signed-off-by: Koby Elbaz <kelbaz@habana.ai>
Reviewed-by: Oded Gabbay <ogabbay@kernel.org>
Signed-off-by: Oded Gabbay <ogabbay@kernel.org>
---
 drivers/accel/habanalabs/common/device.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/accel/habanalabs/common/device.c b/drivers/accel/habanalabs/common/device.c
index 5973e4d64e19..764d40c0d666 100644
--- a/drivers/accel/habanalabs/common/device.c
+++ b/drivers/accel/habanalabs/common/device.c
@@ -1352,7 +1352,8 @@ static int device_kill_open_processes(struct hl_device *hdev, u32 timeout, bool
 			 * we don't need to kill it.
 			 */
 			dev_dbg(hdev->dev,
-				"Can't get task struct for user process, assuming process was killed from outside the driver\n");
+				"Can't get task struct for user process %d, assuming process was killed from outside the driver\n",
+				pid_nr(hpriv->taskpid));
 		}
 	}
 
@@ -2438,14 +2439,14 @@ void hl_device_fini(struct hl_device *hdev)
 	hdev->process_kill_trial_cnt = 0;
 	rc = device_kill_open_processes(hdev, HL_WAIT_PROCESS_KILL_ON_DEVICE_FINI, false);
 	if (rc) {
-		dev_crit(hdev->dev, "Failed to kill all open processes\n");
+		dev_crit(hdev->dev, "Failed to kill all open processes (%d)\n", rc);
 		device_disable_open_processes(hdev, false);
 	}
 
 	hdev->process_kill_trial_cnt = 0;
 	rc = device_kill_open_processes(hdev, 0, true);
 	if (rc) {
-		dev_crit(hdev->dev, "Failed to kill all control device open processes\n");
+		dev_crit(hdev->dev, "Failed to kill all control device open processes (%d)\n", rc);
 		device_disable_open_processes(hdev, true);
 	}
 
-- 
2.40.1

