Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 72BFB6BCE60
	for <lists+dri-devel@lfdr.de>; Thu, 16 Mar 2023 12:36:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99AD610ECAD;
	Thu, 16 Mar 2023 11:36:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB5BD10E0A8
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Mar 2023 11:36:50 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5A5D961FDF;
 Thu, 16 Mar 2023 11:36:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DEE63C433D2;
 Thu, 16 Mar 2023 11:36:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1678966609;
 bh=HM2+yJx8qRBCNqa+qY+UBfgaPfnado1JrJfh1o9ix4I=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Ya7G8Q5hXLomFM4KMzOPS1yfoGKCO9iPUT4FPGwzCJfjF4uESfw0pd1jCdTmHy6ET
 B/hMXZpKV8PEDirvY/q0heo0B887OzZUgX/Cewb6Lu1FBDVyylk3Tyrhf1TOcbRBvf
 I6kj110UNeQ9/HJdFiU4Nlz9nR5rob6QZduUVR8LoAqVQDPoERaGx3YxhYwS0CdrAH
 yGEhaqIe4H+lSqmykW/QklEpZEerW0z29Hfw/GszmVQcwTNTJ4SxhlMCadZucmGWjb
 SrCwj3zHWl04zgOWrJpzD07mAUEkuF5J2IxjQLSO/4vaZQ+OwFs3MIyAFK5VbAfg8p
 lkBfwYSGODu3g==
From: Oded Gabbay <ogabbay@kernel.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 04/10] accel/habanalabs: in hw_fini return error code if
 polling timed-out
Date: Thu, 16 Mar 2023 13:36:34 +0200
Message-Id: <20230316113640.499267-4-ogabbay@kernel.org>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230316113640.499267-1-ogabbay@kernel.org>
References: <20230316113640.499267-1-ogabbay@kernel.org>
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

In hw_fini callback, we use either the cpucp packet method or polling a
register. Currently we return error only in the case of cpucp packet
failure. In this patch we also return error if polling timed out.

Signed-off-by: Dafna Hirschfeld <dhirschfeld@habana.ai>
Reviewed-by: Oded Gabbay <ogabbay@kernel.org>
Signed-off-by: Oded Gabbay <ogabbay@kernel.org>
---
 drivers/accel/habanalabs/gaudi/gaudi.c   |  8 ++++----
 drivers/accel/habanalabs/gaudi2/gaudi2.c | 10 ++++++----
 drivers/accel/habanalabs/goya/goya.c     |  8 ++++----
 3 files changed, 14 insertions(+), 12 deletions(-)

diff --git a/drivers/accel/habanalabs/gaudi/gaudi.c b/drivers/accel/habanalabs/gaudi/gaudi.c
index 004846bc086e..a9d84675b407 100644
--- a/drivers/accel/habanalabs/gaudi/gaudi.c
+++ b/drivers/accel/habanalabs/gaudi/gaudi.c
@@ -4206,10 +4206,10 @@ static int gaudi_hw_fini(struct hl_device *hdev, bool hard_reset, bool fw_reset)
 	msleep(reset_timeout_ms);
 
 	status = RREG32(mmPSOC_GLOBAL_CONF_BTM_FSM);
-	if (status & PSOC_GLOBAL_CONF_BTM_FSM_STATE_MASK)
-		dev_err(hdev->dev,
-			"Timeout while waiting for device to reset 0x%x\n",
-			status);
+	if (status & PSOC_GLOBAL_CONF_BTM_FSM_STATE_MASK) {
+		dev_err(hdev->dev, "Timeout while waiting for device to reset 0x%x\n", status);
+		return -ETIMEDOUT;
+	}
 
 	if (gaudi) {
 		gaudi->hw_cap_initialized &= ~(HW_CAP_CPU | HW_CAP_CPU_Q | HW_CAP_HBM |
diff --git a/drivers/accel/habanalabs/gaudi2/gaudi2.c b/drivers/accel/habanalabs/gaudi2/gaudi2.c
index 652f12a058c7..15a06beea065 100644
--- a/drivers/accel/habanalabs/gaudi2/gaudi2.c
+++ b/drivers/accel/habanalabs/gaudi2/gaudi2.c
@@ -6036,7 +6036,7 @@ static void gaudi2_execute_hard_reset(struct hl_device *hdev, u32 reset_sleep_ms
 	WREG32(mmPSOC_RESET_CONF_SW_ALL_RST, 1);
 }
 
-static void gaudi2_get_soft_rst_done_indication(struct hl_device *hdev, u32 poll_timeout_us)
+static int gaudi2_get_soft_rst_done_indication(struct hl_device *hdev, u32 poll_timeout_us)
 {
 	int i, rc = 0;
 	u32 reg_val;
@@ -6053,6 +6053,7 @@ static void gaudi2_get_soft_rst_done_indication(struct hl_device *hdev, u32 poll
 	if (rc)
 		dev_err(hdev->dev, "Timeout while waiting for FW to complete soft reset (0x%x)\n",
 				reg_val);
+	return rc;
 }
 
 /**
@@ -6065,7 +6066,7 @@ static void gaudi2_get_soft_rst_done_indication(struct hl_device *hdev, u32 poll
  *
  * This function executes soft reset based on if driver/FW should do the reset
  */
-static void gaudi2_execute_soft_reset(struct hl_device *hdev, u32 reset_sleep_ms,
+static int gaudi2_execute_soft_reset(struct hl_device *hdev, u32 reset_sleep_ms,
 						bool driver_performs_reset, u32 poll_timeout_us)
 {
 	struct cpu_dyn_regs *dyn_regs = &hdev->fw_loader.dynamic_loader.comm_desc.cpu_dyn_regs;
@@ -6079,8 +6080,8 @@ static void gaudi2_execute_soft_reset(struct hl_device *hdev, u32 reset_sleep_ms
 
 		WREG32(le32_to_cpu(dyn_regs->gic_host_soft_rst_irq),
 			gaudi2_irq_map_table[GAUDI2_EVENT_CPU_SOFT_RESET].cpu_id);
-		gaudi2_get_soft_rst_done_indication(hdev, poll_timeout_us);
-		return;
+
+		return gaudi2_get_soft_rst_done_indication(hdev, poll_timeout_us);
 	}
 
 	/* Block access to engines, QMANs and SM during reset, these
@@ -6095,6 +6096,7 @@ static void gaudi2_execute_soft_reset(struct hl_device *hdev, u32 reset_sleep_ms
 				mmPCIE_VDEC1_MSTR_IF_RR_SHRD_HBW_BASE + HL_BLOCK_SIZE);
 
 	WREG32(mmPSOC_RESET_CONF_SOFT_RST, 1);
+	return 0;
 }
 
 static void gaudi2_poll_btm_indication(struct hl_device *hdev, u32 reset_sleep_ms,
diff --git a/drivers/accel/habanalabs/goya/goya.c b/drivers/accel/habanalabs/goya/goya.c
index e02de936b7b5..07d67878eac5 100644
--- a/drivers/accel/habanalabs/goya/goya.c
+++ b/drivers/accel/habanalabs/goya/goya.c
@@ -2834,10 +2834,10 @@ static int goya_hw_fini(struct hl_device *hdev, bool hard_reset, bool fw_reset)
 	msleep(reset_timeout_ms);
 
 	status = RREG32(mmPSOC_GLOBAL_CONF_BTM_FSM);
-	if (status & PSOC_GLOBAL_CONF_BTM_FSM_STATE_MASK)
-		dev_err(hdev->dev,
-			"Timeout while waiting for device to reset 0x%x\n",
-			status);
+	if (status & PSOC_GLOBAL_CONF_BTM_FSM_STATE_MASK) {
+		dev_err(hdev->dev, "Timeout while waiting for device to reset 0x%x\n", status);
+		return -ETIMEDOUT;
+	}
 
 	if (!hard_reset && goya) {
 		goya->hw_cap_initialized &= ~(HW_CAP_DMA | HW_CAP_MME |
-- 
2.40.0

