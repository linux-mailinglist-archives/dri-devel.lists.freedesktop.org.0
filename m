Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9656E6939ED
	for <lists+dri-devel@lfdr.de>; Sun, 12 Feb 2023 21:45:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0766310E477;
	Sun, 12 Feb 2023 20:45:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0988710E474
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Feb 2023 20:45:29 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 90720B80D3A;
 Sun, 12 Feb 2023 20:45:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07129C433EF;
 Sun, 12 Feb 2023 20:45:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1676234726;
 bh=7RfNBOsrrd/Tazd8TQ4LgfUedztS5KpKB8C9vaT7AwM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=myW0PQhy8hASq6ZcXexzHQSbKGtb0eCNhyj/akssBUAcTV6XJ4KQGdaF2g/Ri0v+H
 cq9K84UWVdPy21QIcTnQ0raI6kUGhJuFM4BjE5yrQyvOZ5wsmyRPHzYsm7hZ9GlicA
 ClCsX4g6ZYj9QDe6d2gAkr98oKLtSa/MObj9OFUa8HBO2guHVH+lIoCptPIMReGCIQ
 vM41zGKAY+FMuvWucSi6ZhDAYRdQb3rhcPcZbOmw/E0r997uu2T78feB//rdSkhk/f
 yuq6NyZH1rHUS9pC3xaICOEoKpp77T/x4aB0jq+ncVdLJ0cwWml1VMh2u4xDs/7v85
 EZLjQY/nMSE/g==
From: Oded Gabbay <ogabbay@kernel.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 15/27] habanalabs: enable graceful reset mechanism for
 compute-reset
Date: Sun, 12 Feb 2023 22:44:42 +0200
Message-Id: <20230212204454.2938561-15-ogabbay@kernel.org>
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
Cc: Tomer Tayar <ttayar@habana.ai>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Tomer Tayar <ttayar@habana.ai>

The graceful reset mechanism is currently enabled only for reset
requests that will end up with hard-reset.
In future, reset requests due to errors in some device engines, are
going to be modified to request compute-reset, as the much longer
hard-reset is not really needed there.
To allow it, enable graceful reset also for compute-reset, and reset
after user releases the device won't be escalated to hard-reset in those
cases.
If watchdog expires and user didn't release the device, hard-reset will
be initiated in any case.

Signed-off-by: Tomer Tayar <ttayar@habana.ai>
Reviewed-by: Oded Gabbay <ogabbay@kernel.org>
Signed-off-by: Oded Gabbay <ogabbay@kernel.org>
---
 drivers/accel/habanalabs/common/device.c | 26 +++++++++++-------------
 1 file changed, 12 insertions(+), 14 deletions(-)

diff --git a/drivers/accel/habanalabs/common/device.c b/drivers/accel/habanalabs/common/device.c
index d140eaefc840..2d496cd935b2 100644
--- a/drivers/accel/habanalabs/common/device.c
+++ b/drivers/accel/habanalabs/common/device.c
@@ -778,14 +778,14 @@ static void device_hard_reset_pending(struct work_struct *work)
 
 static void device_release_watchdog_func(struct work_struct *work)
 {
-	struct hl_device_reset_work *device_release_watchdog_work =
-				container_of(work, struct hl_device_reset_work, reset_work.work);
-	struct hl_device *hdev = device_release_watchdog_work->hdev;
+	struct hl_device_reset_work *watchdog_work =
+			container_of(work, struct hl_device_reset_work, reset_work.work);
+	struct hl_device *hdev = watchdog_work->hdev;
 	u32 flags;
 
-	dev_dbg(hdev->dev, "Device wasn't released in time. Initiate device reset.\n");
+	dev_dbg(hdev->dev, "Device wasn't released in time. Initiate hard-reset.\n");
 
-	flags = device_release_watchdog_work->flags | HL_DRV_RESET_FROM_WD_THR;
+	flags = watchdog_work->flags | HL_DRV_RESET_HARD | HL_DRV_RESET_FROM_WD_THR;
 
 	hl_device_reset(hdev, flags);
 }
@@ -1555,15 +1555,17 @@ int hl_device_reset(struct hl_device *hdev, u32 flags)
 
 		/* Cancel the device release watchdog work if required.
 		 * In case of reset-upon-device-release while the release watchdog work is
-		 * scheduled, do hard-reset instead of compute-reset.
+		 * scheduled due to a hard-reset, do hard-reset instead of compute-reset.
 		 */
 		if ((hard_reset || from_dev_release) && hdev->reset_info.watchdog_active) {
+			struct hl_device_reset_work *watchdog_work =
+					&hdev->device_release_watchdog_work;
+
 			hdev->reset_info.watchdog_active = 0;
 			if (!from_watchdog_thread)
-				cancel_delayed_work_sync(
-						&hdev->device_release_watchdog_work.reset_work);
+				cancel_delayed_work_sync(&watchdog_work->reset_work);
 
-			if (from_dev_release) {
+			if (from_dev_release && (watchdog_work->flags & HL_DRV_RESET_HARD)) {
 				hdev->reset_info.in_compute_reset = 0;
 				flags |= HL_DRV_RESET_HARD;
 				flags &= ~HL_DRV_RESET_DEV_RELEASE;
@@ -1890,10 +1892,6 @@ int hl_device_cond_reset(struct hl_device *hdev, u32 flags, u64 event_mask)
 {
 	struct hl_ctx *ctx = NULL;
 
-	/* Device release watchdog is only for hard reset */
-	if (!(flags & HL_DRV_RESET_HARD) && hdev->asic_prop.allow_inference_soft_reset)
-		goto device_reset;
-
 	/* F/W reset cannot be postponed */
 	if (flags & HL_DRV_RESET_BYPASS_REQ_TO_FW)
 		goto device_reset;
@@ -1921,7 +1919,7 @@ int hl_device_cond_reset(struct hl_device *hdev, u32 flags, u64 event_mask)
 		goto out;
 
 	hdev->device_release_watchdog_work.flags = flags;
-	dev_dbg(hdev->dev, "Device is going to be reset in %u sec unless being released\n",
+	dev_dbg(hdev->dev, "Device is going to be hard-reset in %u sec unless being released\n",
 		hdev->device_release_watchdog_timeout_sec);
 	schedule_delayed_work(&hdev->device_release_watchdog_work.reset_work,
 				msecs_to_jiffies(hdev->device_release_watchdog_timeout_sec * 1000));
-- 
2.25.1

