Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D8CD6939EE
	for <lists+dri-devel@lfdr.de>; Sun, 12 Feb 2023 21:45:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33EC210E47A;
	Sun, 12 Feb 2023 20:45:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FE8C10E471
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Feb 2023 20:45:26 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A03FC60B35;
 Sun, 12 Feb 2023 20:45:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 888ADC433D2;
 Sun, 12 Feb 2023 20:45:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1676234725;
 bh=Fl2W8vGJzqQK58hxRte2sg9erclbdbR6StNmgewCfHk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=S9WyBKKMooypK2Ogx2ywUZWwa7CMy5T+dSUGP/IW9P/mDooLM+k+CVhAoNJU7yC8s
 wIwXKwIKfdtTkTnwthNSGU7+EHCX+J7wIvDQGncKZzuFbGDPZhkJ9uPxo+Ap/Vl/Y8
 2lUjwVE8qyzgpEzfj/2WI+vTSYLoIq5mDgxq226KfeusnwVGOXjlwsTmii57y55Y9l
 kECylcr3r5M8Q0+IVQ1iBjizsxg0gXn4bXANJpu9rhO1oytGV0vmrhcmG4iV5TdEew
 PjuJWaPwWKf4Sr0UXHSWj5Xwkd3rxZjU8fQ9E1Rsr3rxbL6pLD8rqfvw1tOw8fraRw
 ShbD0himq5/mQ==
From: Oded Gabbay <ogabbay@kernel.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 14/27] habanalabs: disable PCI when escalating compute to
 hard-reset
Date: Sun, 12 Feb 2023 22:44:41 +0200
Message-Id: <20230212204454.2938561-14-ogabbay@kernel.org>
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
Cc: Koby Elbaz <kelbaz@habana.ai>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Koby Elbaz <kelbaz@habana.ai>

In case a compute reset has failed or a request for a hard reset has
just arrived, then we escalate current reset procedure from compute
to hard-reset.
In such a case, the FW should be aware of the updated error cause,
and if LKD is the one who performs the reset (rather than the FW),
then we ask the FW to disable PCI access.

We would also like to have relevant debug info and therefore
we print the currently escalating reset type.

Signed-off-by: Koby Elbaz <kelbaz@habana.ai>
Reviewed-by: Oded Gabbay <ogabbay@kernel.org>
Signed-off-by: Oded Gabbay <ogabbay@kernel.org>
---
 drivers/accel/habanalabs/common/device.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/accel/habanalabs/common/device.c b/drivers/accel/habanalabs/common/device.c
index f91f3509336f..d140eaefc840 100644
--- a/drivers/accel/habanalabs/common/device.c
+++ b/drivers/accel/habanalabs/common/device.c
@@ -1452,7 +1452,7 @@ static void handle_reset_trigger(struct hl_device *hdev, u32 flags)
 		 */
 		if (hl_fw_send_pci_access_msg(hdev, CPUCP_PACKET_DISABLE_PCI_ACCESS, 0x0))
 			dev_warn(hdev->dev,
-				"Failed to disable PCI access by F/W\n");
+				"Failed to disable FW's PCI access\n");
 	}
 }
 
@@ -1530,14 +1530,14 @@ int hl_device_reset(struct hl_device *hdev, u32 flags)
 
 	/*
 	 * Prevent concurrency in this function - only one reset should be
-	 * done at any given time. Only need to perform this if we didn't
-	 * get from the dedicated hard reset thread
+	 * done at any given time. We need to perform this only if we didn't
+	 * get here from a dedicated hard reset thread.
 	 */
 	if (!from_hard_reset_thread) {
 		/* Block future CS/VM/JOB completion operations */
 		spin_lock(&hdev->reset_info.lock);
 		if (hdev->reset_info.in_reset) {
-			/* We only allow scheduling of a hard reset during compute reset */
+			/* We allow scheduling of a hard reset only during a compute reset */
 			if (hard_reset && hdev->reset_info.in_compute_reset)
 				hdev->reset_info.hard_reset_schedule_flags = flags;
 			spin_unlock(&hdev->reset_info.lock);
@@ -1574,6 +1574,7 @@ int hl_device_reset(struct hl_device *hdev, u32 flags)
 		if (delay_reset)
 			usleep_range(HL_RESET_DELAY_USEC, HL_RESET_DELAY_USEC << 1);
 
+escalate_reset_flow:
 		handle_reset_trigger(hdev, flags);
 
 		/* This also blocks future CS/VM/JOB completion operations */
@@ -1589,7 +1590,6 @@ int hl_device_reset(struct hl_device *hdev, u32 flags)
 			dev_dbg(hdev->dev, "Going to reset engines of inference device\n");
 	}
 
-again:
 	if ((hard_reset) && (!from_hard_reset_thread)) {
 		hdev->reset_info.hard_reset_pending = true;
 
@@ -1837,7 +1837,7 @@ int hl_device_reset(struct hl_device *hdev, u32 flags)
 			hdev->disabled = true;
 			hard_reset = true;
 			handle_reset_trigger(hdev, flags);
-			goto again;
+			goto escalate_reset_flow;
 		}
 	}
 
@@ -1860,14 +1860,14 @@ int hl_device_reset(struct hl_device *hdev, u32 flags)
 		flags |= HL_DRV_RESET_HARD;
 		flags &= ~HL_DRV_RESET_DEV_RELEASE;
 		hard_reset = true;
-		goto again;
+		goto escalate_reset_flow;
 	} else {
 		spin_unlock(&hdev->reset_info.lock);
 		dev_err(hdev->dev, "Failed to do compute reset\n");
 		hdev->reset_info.compute_reset_cnt++;
 		flags |= HL_DRV_RESET_HARD;
 		hard_reset = true;
-		goto again;
+		goto escalate_reset_flow;
 	}
 
 	hdev->reset_info.in_reset = 0;
-- 
2.25.1

