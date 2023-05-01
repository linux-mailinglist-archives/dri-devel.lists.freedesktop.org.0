Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 405056F2FF3
	for <lists+dri-devel@lfdr.de>; Mon,  1 May 2023 11:48:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDF1F10E223;
	Mon,  1 May 2023 09:48:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F000B10E317
 for <dri-devel@lists.freedesktop.org>; Mon,  1 May 2023 09:48:05 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5C86060B9E;
 Mon,  1 May 2023 09:48:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7A8BC4339B;
 Mon,  1 May 2023 09:48:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1682934484;
 bh=NMm0YcU+N5c7ZMiwUlWzPWemYIlkFYmYd+Og7A9ZcFU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=XEMzaU5fy8nzJiPJfIZ/mU4zivqxHMVGwPAndtecZZFR2/xw7FezA+UuCvwzhYwth
 8roYffr0cZlMQiykmU86Rh6zwvp6I/fqvaExs3wMaTjgErCQ1LrH2LjVcJC0uH0gEa
 m8Tk3nY0qKjs0l/yhMtiD/8e9OCWMtq7lB3GD3Wy4GksDdey+JYTLelpJ7H9ungaxz
 NIF5S68UoyQP6He6p0wIDmaTZy0zW1z5HVCNlnCGtn/X0kw+NnAFbjBo2uPe3NoWzG
 W5Wq5i1L2zLaU9RpnSYbFC78+BRZps5/hHdVLbuVE/SyIL5ysVnd67ReWa6eL9uCPV
 eZY+rcMhOv6Bw==
From: Oded Gabbay <ogabbay@kernel.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 4/6] accel/habanalabs: poll for device status update following
 WFE cmd
Date: Mon,  1 May 2023 12:47:52 +0300
Message-Id: <20230501094754.100030-4-ogabbay@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230501094754.100030-1-ogabbay@kernel.org>
References: <20230501094754.100030-1-ogabbay@kernel.org>
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

Currently, we rely on COMMS protocol's ack to verify that WFE command
has been acknowledged by the FW. However, this does not guarantee that
the device status has been updated.
Although unlikely, this could trigger a race since the driver expects
the device to be halted at that stage, but it might not be.
Therefore, we increase WFE's robustness by polling on the status
register that will be updated once the device is actually halted.

Signed-off-by: Koby Elbaz <kelbaz@habana.ai>
Reviewed-by: Oded Gabbay <ogabbay@kernel.org>
Signed-off-by: Oded Gabbay <ogabbay@kernel.org>
---
 drivers/accel/habanalabs/common/firmware_if.c | 28 +++++++++++++++----
 1 file changed, 23 insertions(+), 5 deletions(-)

diff --git a/drivers/accel/habanalabs/common/firmware_if.c b/drivers/accel/habanalabs/common/firmware_if.c
index e48f024d8649..eb51d7f70aec 100644
--- a/drivers/accel/habanalabs/common/firmware_if.c
+++ b/drivers/accel/habanalabs/common/firmware_if.c
@@ -1368,8 +1368,10 @@ void hl_fw_ask_hard_reset_without_linux(struct hl_device *hdev)
 
 void hl_fw_ask_halt_machine_without_linux(struct hl_device *hdev)
 {
-	struct static_fw_load_mgr *static_loader =
-			&hdev->fw_loader.static_loader;
+	struct fw_load_mgr *fw_loader = &hdev->fw_loader;
+	u32 status, cpu_boot_status_reg, cpu_timeout;
+	struct static_fw_load_mgr *static_loader;
+	struct pre_fw_load_props *pre_fw_load;
 	int rc;
 
 	if (hdev->device_cpu_is_halted)
@@ -1377,12 +1379,28 @@ void hl_fw_ask_halt_machine_without_linux(struct hl_device *hdev)
 
 	/* Stop device CPU to make sure nothing bad happens */
 	if (hdev->asic_prop.dynamic_fw_load) {
+		pre_fw_load = &fw_loader->pre_fw_load;
+		cpu_timeout = fw_loader->cpu_timeout;
+		cpu_boot_status_reg = pre_fw_load->cpu_boot_status_reg;
+
 		rc = hl_fw_dynamic_send_protocol_cmd(hdev, &hdev->fw_loader,
-				COMMS_GOTO_WFE, 0, false,
-				hdev->fw_loader.cpu_timeout);
-		if (rc)
+				COMMS_GOTO_WFE, 0, false, cpu_timeout);
+		if (rc) {
 			dev_err(hdev->dev, "Failed sending COMMS_GOTO_WFE\n");
+		} else {
+			rc = hl_poll_timeout(
+				hdev,
+				cpu_boot_status_reg,
+				status,
+				status == CPU_BOOT_STATUS_IN_WFE,
+				hdev->fw_poll_interval_usec,
+				cpu_timeout);
+			if (rc)
+				dev_err(hdev->dev, "Current status=%u. Timed-out updating to WFE\n",
+						status);
+		}
 	} else {
+		static_loader = &hdev->fw_loader.static_loader;
 		WREG32(static_loader->kmd_msg_to_cpu_reg, KMD_MSG_GOTO_WFE);
 		msleep(static_loader->cpu_reset_wait_msec);
 
-- 
2.40.1

