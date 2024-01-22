Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4006E836651
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jan 2024 16:01:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A2AC10F2CE;
	Mon, 22 Jan 2024 15:00:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA63010F2D1
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jan 2024 15:00:46 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 42A25B80E70;
 Mon, 22 Jan 2024 15:00:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A926BC433A6;
 Mon, 22 Jan 2024 15:00:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1705935614;
 bh=kOnajDdCG2w3ab9S/kUTAjC7AbVcgzSsg+UPepbB180=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=qf7BUyYQSGN1m6VY2a+cl+8vRwUWtQwOkFKNotZwoV4QDesbOkJer0q32tiRWRn1S
 xn5CU11Z2I8arMw2uDfzJRgGcfJl2W5Q1uPp7SkAbq8uczey5Z+8wA8z4/mJRdUB+R
 BDAwSy+LwU7+4rsO7dn48oA9T4ntevkDYFOpgYhRMK+U83V7MrQq6PgH3A1+n9H1zO
 KnLRw9liFkMaxHQT8L8iOsbQBm2lBGtOZbfulxCquEpfaTjnxlt/toHG1THnpLb5Fy
 GzCA+OOO0smBBfxAm1N5mEm2ksYx+UherJerk30N6gnykn/H6PvSTr3se61Ha0twxs
 RcIbp7pdm1NJQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.7 64/88] accel/habanalabs: fix EQ heartbeat mechanism
Date: Mon, 22 Jan 2024 09:51:37 -0500
Message-ID: <20240122145608.990137-64-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240122145608.990137-1-sashal@kernel.org>
References: <20240122145608.990137-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.7.1
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
Cc: Sasha Levin <sashal@kernel.org>, Oded Gabbay <ogabbay@kernel.org>,
 kelbaz@habana.ai, dri-devel@lists.freedesktop.org, dhirschfeld@habana.ai,
 stanislaw.gruszka@linux.intel.com, ttayar@habana.ai,
 Farah Kassabri <fkassabri@habana.ai>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Farah Kassabri <fkassabri@habana.ai>

[ Upstream commit d1958dce5ab6a3e089c60cf474e8c9b7e96e70ad ]

Stop rescheduling another heartbeat check when EQ heartbeat check fails
as it generates confusing logs in dmesg that the heartbeat fails.

Signed-off-by: Farah Kassabri <fkassabri@habana.ai>
Reviewed-by: Oded Gabbay <ogabbay@kernel.org>
Signed-off-by: Oded Gabbay <ogabbay@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/accel/habanalabs/common/device.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/accel/habanalabs/common/device.c b/drivers/accel/habanalabs/common/device.c
index 9e461c03e705..9290d4374551 100644
--- a/drivers/accel/habanalabs/common/device.c
+++ b/drivers/accel/habanalabs/common/device.c
@@ -1044,18 +1044,19 @@ static bool is_pci_link_healthy(struct hl_device *hdev)
 	return (vendor_id == PCI_VENDOR_ID_HABANALABS);
 }
 
-static void hl_device_eq_heartbeat(struct hl_device *hdev)
+static int hl_device_eq_heartbeat_check(struct hl_device *hdev)
 {
-	u64 event_mask = HL_NOTIFIER_EVENT_DEVICE_RESET | HL_NOTIFIER_EVENT_DEVICE_UNAVAILABLE;
 	struct asic_fixed_properties *prop = &hdev->asic_prop;
 
 	if (!prop->cpucp_info.eq_health_check_supported)
-		return;
+		return 0;
 
 	if (hdev->eq_heartbeat_received)
 		hdev->eq_heartbeat_received = false;
 	else
-		hl_device_cond_reset(hdev, HL_DRV_RESET_HARD, event_mask);
+		return -EIO;
+
+	return 0;
 }
 
 static void hl_device_heartbeat(struct work_struct *work)
@@ -1072,10 +1073,9 @@ static void hl_device_heartbeat(struct work_struct *work)
 	/*
 	 * For EQ health check need to check if driver received the heartbeat eq event
 	 * in order to validate the eq is working.
+	 * Only if both the EQ is healthy and we managed to send the next heartbeat reschedule.
 	 */
-	hl_device_eq_heartbeat(hdev);
-
-	if (!hdev->asic_funcs->send_heartbeat(hdev))
+	if ((!hl_device_eq_heartbeat_check(hdev)) && (!hdev->asic_funcs->send_heartbeat(hdev)))
 		goto reschedule;
 
 	if (hl_device_operational(hdev, NULL))
-- 
2.43.0

