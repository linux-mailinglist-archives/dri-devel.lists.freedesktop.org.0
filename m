Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3759F8D051E
	for <lists+dri-devel@lfdr.de>; Mon, 27 May 2024 17:02:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2001110E3BD;
	Mon, 27 May 2024 15:02:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=habana.ai header.i=@habana.ai header.b="TKWMqcx5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail02.habana.ai (habanamailrelay.habana.ai [213.57.90.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7233310E46D
 for <dri-devel@lists.freedesktop.org>; Mon, 27 May 2024 15:02:35 +0000 (UTC)
Received: internal info suppressed
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=habana.ai; s=default;
 t=1716822162; bh=02pFJ4y+owr0x7FFw2etdAv6pcbCk5FXca4Qfvfnw+g=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=TKWMqcx5DTK7U7vLjrOjrJjsNrRegt9cGkaRBW7kWR57UXGu1LfUgeQqhqZKbdm5d
 ERZbDKCjJhlNnvDHsW6keNX06sjUqufeJRPw91ZE2k8MfPKSoAN4hGen6dGe8SI4IY
 T8fc1Ub7cDSlNBXLSdJYBE7a47OQarX7w7Bx7PH8az86YG2BY2ZYF2XPkzeQFMNfjn
 PE3Gc8FoLNFwGNyKCIQZh5fZtoE6RDGt4r1kCDoU/dqTd+hDJOcqe4nyHX6B1UvBWz
 caAv4+Dr9M2TCIA4178jBoorl5xabZd8q40U7elnDjVDIJLTF0rsvPX52dkdYy1E7T
 HSftQMRlPiMCw==
Received: from obitton-vm-u22.habana-labs.com (localhost [127.0.0.1])
 by obitton-vm-u22.habana-labs.com (8.15.2/8.15.2/Debian-22ubuntu3) with ESMTP
 id 44RF2PiY1954007; Mon, 27 May 2024 18:02:26 +0300
From: Ofir Bitton <obitton@habana.ai>
To: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: Farah Kassabri <fkassabri@habana.ai>
Subject: [PATCH 7/8] accel/habanalabs: change the heartbeat scheduling point
Date: Mon, 27 May 2024 18:02:23 +0300
Message-Id: <20240527150224.1953969-7-obitton@habana.ai>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240527150224.1953969-1-obitton@habana.ai>
References: <20240527150224.1953969-1-obitton@habana.ai>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Farah Kassabri <fkassabri@habana.ai>

Currently we schedule the heartbeat thread at late init, only then
we set the INTS_REGISTER packet which enables events to be received
from firmware.

Init may take some time and we want to give firmware 2 full cycles of
heartbeat thread after it received INTS_REGISTER.

The patch will move the heartbeat thread scheduling to be after driver
is done with all initializations.

Signed-off-by: Farah Kassabri <fkassabri@habana.ai>
Reviewed-by: Ofir Bitton <obitton@habana.ai>
---
 drivers/accel/habanalabs/common/device.c | 54 +++++++++++++++---------
 1 file changed, 33 insertions(+), 21 deletions(-)

diff --git a/drivers/accel/habanalabs/common/device.c b/drivers/accel/habanalabs/common/device.c
index 31daa9184537..5ca7014def00 100644
--- a/drivers/accel/habanalabs/common/device.c
+++ b/drivers/accel/habanalabs/common/device.c
@@ -1150,23 +1150,6 @@ static int device_late_init(struct hl_device *hdev)
 	}
 
 	hdev->high_pll = hdev->asic_prop.high_pll;
-
-	if (hdev->heartbeat) {
-		hdev->heartbeat_debug_info.heartbeat_event_counter = 0;
-
-		/*
-		 * Before scheduling the heartbeat driver will check if eq event has received.
-		 * for the first schedule we need to set the indication as true then for the next
-		 * one this indication will be true only if eq event was sent by FW.
-		 */
-		hdev->eq_heartbeat_received = true;
-
-		INIT_DELAYED_WORK(&hdev->work_heartbeat, hl_device_heartbeat);
-
-		schedule_delayed_work(&hdev->work_heartbeat,
-				usecs_to_jiffies(HL_HEARTBEAT_PER_USEC));
-	}
-
 	hdev->late_init_done = true;
 
 	return 0;
@@ -1183,9 +1166,6 @@ static void device_late_fini(struct hl_device *hdev)
 	if (!hdev->late_init_done)
 		return;
 
-	if (hdev->heartbeat)
-		cancel_delayed_work_sync(&hdev->work_heartbeat);
-
 	if (hdev->asic_funcs->late_fini)
 		hdev->asic_funcs->late_fini(hdev);
 
@@ -1286,8 +1266,12 @@ static void hl_abort_waiting_for_completions(struct hl_device *hdev)
 static void cleanup_resources(struct hl_device *hdev, bool hard_reset, bool fw_reset,
 				bool skip_wq_flush)
 {
-	if (hard_reset)
+	if (hard_reset) {
+		if (hdev->heartbeat)
+			cancel_delayed_work_sync(&hdev->work_heartbeat);
+
 		device_late_fini(hdev);
+	}
 
 	/*
 	 * Halt the engines and disable interrupts so we won't get any more
@@ -1565,6 +1549,26 @@ static void handle_reset_trigger(struct hl_device *hdev, u32 flags)
 	}
 }
 
+static inline void device_heartbeat_schedule(struct hl_device *hdev)
+{
+	if (!hdev->heartbeat)
+		return;
+
+	hdev->heartbeat_debug_info.heartbeat_event_counter = 0;
+
+	/*
+	 * Before scheduling the heartbeat driver will check if eq event has received.
+	 * for the first schedule we need to set the indication as true then for the next
+	 * one this indication will be true only if eq event was sent by FW.
+	 */
+	hdev->eq_heartbeat_received = true;
+
+	INIT_DELAYED_WORK(&hdev->work_heartbeat, hl_device_heartbeat);
+
+	schedule_delayed_work(&hdev->work_heartbeat,
+			usecs_to_jiffies(HL_HEARTBEAT_PER_USEC));
+}
+
 /*
  * hl_device_reset - reset the device
  *
@@ -1934,6 +1938,8 @@ int hl_device_reset(struct hl_device *hdev, u32 flags)
 	if (hard_reset) {
 		hdev->reset_info.hard_reset_cnt++;
 
+		device_heartbeat_schedule(hdev);
+
 		/* After reset is done, we are ready to receive events from
 		 * the F/W. We can't do it before because we will ignore events
 		 * and if those events are fatal, we won't know about it and
@@ -2368,6 +2374,12 @@ int hl_device_init(struct hl_device *hdev)
 		goto out_disabled;
 	}
 
+	/* Scheduling the EQ heartbeat thread must come after driver is done with all
+	 * initializations, as we want to make sure the FW gets enough time to be prepared
+	 * to respond to heartbeat packets.
+	 */
+	device_heartbeat_schedule(hdev);
+
 	dev_notice(hdev->dev,
 		"Successfully added device %s to habanalabs driver\n",
 		dev_name(&(hdev)->pdev->dev));
-- 
2.34.1

