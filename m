Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 88E686CFC9F
	for <lists+dri-devel@lfdr.de>; Thu, 30 Mar 2023 09:22:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 522FC10ECFA;
	Thu, 30 Mar 2023 07:22:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8974310E17D
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Mar 2023 07:22:25 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D9A0E61F1E;
 Thu, 30 Mar 2023 07:22:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A7EFC4339B;
 Thu, 30 Mar 2023 07:22:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1680160944;
 bh=chrwLezMyvGqmZzavxb9yrYa+qnWps8r1rcF+aR76Vo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=t9qhaDbu6xpTISobJLQUH4nc019ZJ8udz+tg+RGNOVAS0YImTp5TDu4wYoWZ5JdoJ
 CyX31+YE2jg35ibjd0LnKXLJu6iSKd5P6geIlVKuSCYphPkBGdKMAh7Ed/+1Lk3Oss
 g3sGUjDhcuW0GdLTFzEGQaN98ykxs/eJAwPoWQwfjz8bMyHQrT3nNlDdR1oILSjj2N
 kN66YfHr/sHW9UuNIgfL00j1bDS9GxHFazYvd7/BQq9cWCexEmIBPp1a7I1u5Qe5nl
 +hwo4ZGuHX7dY2oArkV4Kp0fWQk+lrqpXTbYB3t4ohuTeulQUY0C/dbKwgGzVJXIrf
 b/9qlVRJBWm8A==
From: Oded Gabbay <ogabbay@kernel.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 5/7] accel/habanalabs: sync f/w events interrupt in hard reset
Date: Thu, 30 Mar 2023 10:22:11 +0300
Message-Id: <20230330072213.1596318-5-ogabbay@kernel.org>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230330072213.1596318-1-ogabbay@kernel.org>
References: <20230330072213.1596318-1-ogabbay@kernel.org>
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
Cc: Tal Cohen <talcohen@habana.ai>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Tal Cohen <talcohen@habana.ai>

Receiving events from FW, while the device is in hard reset, causes
a warning message in Driver log. The message may point to a
problem in the Driver or FW. But It also can appear as a result
of events that have been sent from FW just before the hard reset.
In order to avoid receiving events from FW while the device is in reset
and is already in 'disabled' mode, sync the f/w events interrupt right
before setting the device to 'disabled'.

Signed-off-by: Tal Cohen <talcohen@habana.ai>
Reviewed-by: Oded Gabbay <ogabbay@kernel.org>
Signed-off-by: Oded Gabbay <ogabbay@kernel.org>
---
 drivers/accel/habanalabs/common/device.c     | 55 +++++++++++---------
 drivers/accel/habanalabs/common/habanalabs.h |  2 +
 drivers/accel/habanalabs/gaudi/gaudi.c       |  3 ++
 drivers/accel/habanalabs/gaudi2/gaudi2.c     |  1 +
 drivers/accel/habanalabs/goya/goya.c         |  1 +
 5 files changed, 37 insertions(+), 25 deletions(-)

diff --git a/drivers/accel/habanalabs/common/device.c b/drivers/accel/habanalabs/common/device.c
index 3c1af9d43b65..fabfc501ef54 100644
--- a/drivers/accel/habanalabs/common/device.c
+++ b/drivers/accel/habanalabs/common/device.c
@@ -1380,13 +1380,41 @@ static void device_disable_open_processes(struct hl_device *hdev, bool control_d
 	mutex_unlock(fd_lock);
 }
 
+static void send_disable_pci_access(struct hl_device *hdev, u32 flags)
+{
+	/* If reset is due to heartbeat, device CPU is no responsive in
+	 * which case no point sending PCI disable message to it.
+	 */
+	if ((flags & HL_DRV_RESET_HARD) &&
+			!(flags & (HL_DRV_RESET_HEARTBEAT | HL_DRV_RESET_BYPASS_REQ_TO_FW))) {
+		/* Disable PCI access from device F/W so he won't send
+		 * us additional interrupts. We disable MSI/MSI-X at
+		 * the halt_engines function and we can't have the F/W
+		 * sending us interrupts after that. We need to disable
+		 * the access here because if the device is marked
+		 * disable, the message won't be send. Also, in case
+		 * of heartbeat, the device CPU is marked as disable
+		 * so this message won't be sent
+		 */
+		if (hl_fw_send_pci_access_msg(hdev, CPUCP_PACKET_DISABLE_PCI_ACCESS, 0x0)) {
+			dev_warn(hdev->dev, "Failed to disable FW's PCI access\n");
+			return;
+		}
+
+		/* verify that last EQs are handled before disabled is set */
+		if (hdev->cpu_queues_enable)
+			synchronize_irq(pci_irq_vector(hdev->pdev,
+					hdev->asic_prop.eq_interrupt_id));
+	}
+}
+
 static void handle_reset_trigger(struct hl_device *hdev, u32 flags)
 {
 	u32 cur_reset_trigger = HL_RESET_TRIGGER_DEFAULT;
 
 	/* No consecutive mechanism when user context exists */
 	if (hdev->is_compute_ctx_active)
-		goto disable_pci;
+		return;
 
 	/*
 	 * 'reset cause' is being updated here, because getting here
@@ -1418,30 +1446,6 @@ static void handle_reset_trigger(struct hl_device *hdev, u32 flags)
 	} else {
 		hdev->reset_info.reset_trigger_repeated = 1;
 	}
-
-	/* If reset is due to heartbeat, device CPU is no responsive in
-	 * which case no point sending PCI disable message to it.
-	 *
-	 * If F/W is performing the reset, no need to send it a message to disable
-	 * PCI access
-	 */
-
-disable_pci:
-	if ((flags & HL_DRV_RESET_HARD) &&
-			!(flags & (HL_DRV_RESET_HEARTBEAT | HL_DRV_RESET_BYPASS_REQ_TO_FW))) {
-		/* Disable PCI access from device F/W so he won't send
-		 * us additional interrupts. We disable MSI/MSI-X at
-		 * the halt_engines function and we can't have the F/W
-		 * sending us interrupts after that. We need to disable
-		 * the access here because if the device is marked
-		 * disable, the message won't be send. Also, in case
-		 * of heartbeat, the device CPU is marked as disable
-		 * so this message won't be sent
-		 */
-		if (hl_fw_send_pci_access_msg(hdev, CPUCP_PACKET_DISABLE_PCI_ACCESS, 0x0))
-			dev_warn(hdev->dev,
-				"Failed to disable FW's PCI access\n");
-	}
 }
 
 /*
@@ -1562,6 +1566,7 @@ int hl_device_reset(struct hl_device *hdev, u32 flags)
 
 escalate_reset_flow:
 		handle_reset_trigger(hdev, flags);
+		send_disable_pci_access(hdev, flags);
 
 		/* This also blocks future CS/VM/JOB completion operations */
 		hdev->disabled = true;
diff --git a/drivers/accel/habanalabs/common/habanalabs.h b/drivers/accel/habanalabs/common/habanalabs.h
index 7b6ad3d7dbaa..8c3bcc50e560 100644
--- a/drivers/accel/habanalabs/common/habanalabs.h
+++ b/drivers/accel/habanalabs/common/habanalabs.h
@@ -662,6 +662,7 @@ struct hl_hints_range {
  * @user_interrupt_count: number of user interrupts.
  * @user_dec_intr_count: number of decoder interrupts exposed to user.
  * @tpc_interrupt_id: interrupt id for TPC to use in order to raise events towards the host.
+ * @eq_interrupt_id: interrupt id for EQ, uses to synchronize EQ interrupts in hard-reset.
  * @unexpected_user_error_interrupt_id: interrupt id used to indicate an unexpected user error.
  * @cache_line_size: device cache line size.
  * @server_type: Server type that the ASIC is currently installed in.
@@ -793,6 +794,7 @@ struct asic_fixed_properties {
 	u16				user_interrupt_count;
 	u16				user_dec_intr_count;
 	u16				tpc_interrupt_id;
+	u16				eq_interrupt_id;
 	u16				unexpected_user_error_interrupt_id;
 	u16				cache_line_size;
 	u16				server_type;
diff --git a/drivers/accel/habanalabs/gaudi/gaudi.c b/drivers/accel/habanalabs/gaudi/gaudi.c
index 08a4b1cf2b42..2ad8e4efce7f 100644
--- a/drivers/accel/habanalabs/gaudi/gaudi.c
+++ b/drivers/accel/habanalabs/gaudi/gaudi.c
@@ -682,6 +682,9 @@ static int gaudi_set_fixed_properties(struct hl_device *hdev)
 	prop->first_available_user_interrupt = USHRT_MAX;
 	prop->tpc_interrupt_id = USHRT_MAX;
 
+	/* single msi */
+	prop->eq_interrupt_id = 0;
+
 	for (i = 0 ; i < HL_MAX_DCORES ; i++)
 		prop->first_available_cq[i] = USHRT_MAX;
 
diff --git a/drivers/accel/habanalabs/gaudi2/gaudi2.c b/drivers/accel/habanalabs/gaudi2/gaudi2.c
index ce85308d03e9..554020026da8 100644
--- a/drivers/accel/habanalabs/gaudi2/gaudi2.c
+++ b/drivers/accel/habanalabs/gaudi2/gaudi2.c
@@ -2439,6 +2439,7 @@ static int gaudi2_set_fixed_properties(struct hl_device *hdev)
 
 	prop->first_available_user_interrupt = GAUDI2_IRQ_NUM_USER_FIRST;
 	prop->tpc_interrupt_id = GAUDI2_IRQ_NUM_TPC_ASSERT;
+	prop->eq_interrupt_id = GAUDI2_IRQ_NUM_EVENT_QUEUE;
 	prop->unexpected_user_error_interrupt_id = GAUDI2_IRQ_NUM_UNEXPECTED_ERROR;
 
 	prop->first_available_cq[0] = GAUDI2_RESERVED_CQ_NUMBER;
diff --git a/drivers/accel/habanalabs/goya/goya.c b/drivers/accel/habanalabs/goya/goya.c
index 07d67878eac5..fb0ac9df841a 100644
--- a/drivers/accel/habanalabs/goya/goya.c
+++ b/drivers/accel/habanalabs/goya/goya.c
@@ -473,6 +473,7 @@ int goya_set_fixed_properties(struct hl_device *hdev)
 
 	prop->first_available_user_interrupt = USHRT_MAX;
 	prop->tpc_interrupt_id = USHRT_MAX;
+	prop->eq_interrupt_id = GOYA_EVENT_QUEUE_MSIX_IDX;
 
 	for (i = 0 ; i < HL_MAX_DCORES ; i++)
 		prop->first_available_cq[i] = USHRT_MAX;
-- 
2.40.0

