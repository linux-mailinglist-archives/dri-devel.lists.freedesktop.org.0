Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 097EF6AC0A0
	for <lists+dri-devel@lfdr.de>; Mon,  6 Mar 2023 14:19:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85DAF10E0AC;
	Mon,  6 Mar 2023 13:19:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E563910E0AC
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Mar 2023 13:19:21 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7638460BC8;
 Mon,  6 Mar 2023 13:19:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04FA3C433D2;
 Mon,  6 Mar 2023 13:19:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1678108760;
 bh=joj6nitOoyYBZ0dYmaK4FuFZdv6sOEKBjspb49yB9lw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ho7apJ4qKdaGBKiHkHDTtRzCpYWjUnumd5LqALZsMKdBIzciGeoppcHBfesUhDDND
 ZHTfu9M6jVxGKmDMX4y8InYwF17HrDm4rJ18m37T9RXZgtSTSqaPKdrsT7aO1Dh/k9
 Dt75/nK4mefhIxje5vYSdTAcRpy7WDEQfcGugPbsO1iDXJtPH9xI6z0dDVKydb7qGq
 r9m0DeiM+CQ4Qht7IMw0Mjdceq5P/KBJwkr4daiK8adVeM3JLxrTEqK36Uaf7b9UZk
 gjss9hEKM2+qZpJnKd2s6SO2mmKOswfM0ZjhLU0LPlq+X5wYvPVxDG+rbEGE//5rju
 h7ZJBIvNR2OSw==
From: Oded Gabbay <ogabbay@kernel.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/3] habanalabs/gaudi2: move soft-reset wait to soft-reset
 execute
Date: Mon,  6 Mar 2023 15:19:12 +0200
Message-Id: <20230306131913.346343-2-ogabbay@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230306131913.346343-1-ogabbay@kernel.org>
References: <20230306131913.346343-1-ogabbay@kernel.org>
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
Cc: Dafna Hirschfeld <dhirschfeld@habana.ai>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Dafna Hirschfeld <dhirschfeld@habana.ai>

We plan to do soft-reset either by mmio or by using cpucp packet
depending on the FW version. We don't want to check FW version in two
different places for that (execute soft-reset and wait to soft-reset)
so move the waiting to gaudi2_execute_soft_reset. This also makes sense
because the cpucp also does the waiting.

Signed-off-by: Dafna Hirschfeld <dhirschfeld@habana.ai>
Reviewed-by: Oded Gabbay <ogabbay@kernel.org>
Signed-off-by: Oded Gabbay <ogabbay@kernel.org>
---
 drivers/accel/habanalabs/gaudi2/gaudi2.c | 50 ++++++++++++------------
 1 file changed, 26 insertions(+), 24 deletions(-)

diff --git a/drivers/accel/habanalabs/gaudi2/gaudi2.c b/drivers/accel/habanalabs/gaudi2/gaudi2.c
index 166469179628..4360553362da 100644
--- a/drivers/accel/habanalabs/gaudi2/gaudi2.c
+++ b/drivers/accel/habanalabs/gaudi2/gaudi2.c
@@ -6068,17 +6068,37 @@ static void gaudi2_execute_hard_reset(struct hl_device *hdev, u32 reset_sleep_ms
 	WREG32(mmPSOC_RESET_CONF_SW_ALL_RST, 1);
 }
 
+static void gaudi2_get_soft_rst_done_indication(struct hl_device *hdev, u32 poll_timeout_us)
+{
+	int i, rc = 0;
+	u32 reg_val;
+
+	for (i = 0 ; i < GAUDI2_RESET_POLL_CNT ; i++)
+		rc = hl_poll_timeout(
+			hdev,
+			mmCPU_RST_STATUS_TO_HOST,
+			reg_val,
+			reg_val == CPU_RST_STATUS_SOFT_RST_DONE,
+			1000,
+			poll_timeout_us);
+
+	if (rc)
+		dev_err(hdev->dev, "Timeout while waiting for FW to complete soft reset (0x%x)\n",
+				reg_val);
+}
+
 /**
  * gaudi2_execute_soft_reset - execute soft reset by driver/FW
  *
  * @hdev: pointer to the habanalabs device structure
  * @reset_sleep_ms: sleep time in msec after reset
  * @driver_performs_reset: true if driver should perform reset instead of f/w.
+ * @poll_timeout_us: time to wait for response from f/w.
  *
  * This function executes soft reset based on if driver/FW should do the reset
  */
 static void gaudi2_execute_soft_reset(struct hl_device *hdev, u32 reset_sleep_ms,
-						bool driver_performs_reset)
+						bool driver_performs_reset, u32 poll_timeout_us)
 {
 	struct cpu_dyn_regs *dyn_regs = &hdev->fw_loader.dynamic_loader.comm_desc.cpu_dyn_regs;
 
@@ -6091,6 +6111,7 @@ static void gaudi2_execute_soft_reset(struct hl_device *hdev, u32 reset_sleep_ms
 
 		WREG32(le32_to_cpu(dyn_regs->gic_host_soft_rst_irq),
 			gaudi2_irq_map_table[GAUDI2_EVENT_CPU_SOFT_RESET].cpu_id);
+		gaudi2_get_soft_rst_done_indication(hdev, poll_timeout_us);
 		return;
 	}
 
@@ -6133,25 +6154,6 @@ static void gaudi2_poll_btm_indication(struct hl_device *hdev, u32 reset_sleep_m
 		dev_err(hdev->dev, "Timeout while waiting for device to reset 0x%x\n", reg_val);
 }
 
-static void gaudi2_get_soft_rst_done_indication(struct hl_device *hdev, u32 poll_timeout_us)
-{
-	int i, rc = 0;
-	u32 reg_val;
-
-	for (i = 0 ; i < GAUDI2_RESET_POLL_CNT ; i++)
-		rc = hl_poll_timeout(
-			hdev,
-			mmCPU_RST_STATUS_TO_HOST,
-			reg_val,
-			reg_val == CPU_RST_STATUS_SOFT_RST_DONE,
-			1000,
-			poll_timeout_us);
-
-	if (rc)
-		dev_err(hdev->dev, "Timeout while waiting for FW to complete soft reset (0x%x)\n",
-				reg_val);
-}
-
 static int gaudi2_hw_fini(struct hl_device *hdev, bool hard_reset, bool fw_reset)
 {
 	struct gaudi2_device *gaudi2 = hdev->asic_specific;
@@ -6184,11 +6186,12 @@ static int gaudi2_hw_fini(struct hl_device *hdev, bool hard_reset, bool fw_reset
 		 */
 		driver_performs_reset = (hdev->fw_components == FW_TYPE_PREBOOT_CPU &&
 							!hdev->asic_prop.fw_security_enabled);
-		gaudi2_execute_soft_reset(hdev, reset_sleep_ms, driver_performs_reset);
+		gaudi2_execute_soft_reset(hdev, reset_sleep_ms, driver_performs_reset,
+						poll_timeout_us);
 	}
 
 skip_reset:
-	if (driver_performs_reset || hard_reset)
+	if (driver_performs_reset || hard_reset) {
 		/*
 		 * Instead of waiting for BTM indication we should wait for preboot ready:
 		 * Consider the below scenario:
@@ -6214,8 +6217,7 @@ static int gaudi2_hw_fini(struct hl_device *hdev, bool hard_reset, bool fw_reset
 		} else {
 			gaudi2_poll_btm_indication(hdev, reset_sleep_ms, poll_timeout_us);
 		}
-	else
-		gaudi2_get_soft_rst_done_indication(hdev, poll_timeout_us);
+	}
 
 	if (!gaudi2)
 		return 0;
-- 
2.39.2

