Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 610AF866B7D
	for <lists+dri-devel@lfdr.de>; Mon, 26 Feb 2024 08:56:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2128B10EF1E;
	Mon, 26 Feb 2024 07:56:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="NkvaB7ep";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19EA210EF1C
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Feb 2024 07:56:40 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 8248F60F37;
 Mon, 26 Feb 2024 07:56:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E11EBC433C7;
 Mon, 26 Feb 2024 07:56:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1708934199;
 bh=7XdcGmZNj1k6DExpdbc9NvMvOv0pQ+9MNUQsEGhjmcI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=NkvaB7epOzkGg6ZLIEVHY1/ogvmzwZ53OSJnnA5us7C7/hGmDO/maAtcAV5IDsStL
 RosjIHdOEr5pTmoElxwwhA5DUpvcU+TmHFCXhQ5SBLeEJw1KK53DHxjHmqSD6yqOMM
 aya2qsm64esw3l/zZlIXiUu+wwmOO332rZNhbnmkyVdmmbL571xHaKHJFyNo1b2xuE
 gT/5JJm8Qy42JIIiGF7sw0K+DctEgILfWL3cOB017AoP+/KHxPyEM+ITOZtwMoe4l/
 CWgEIGote6IkqOkO5EEhg+KqZQOyAKVvEBrr5LBsGeg/HlAhSEW0MzauGTY5bkPYpb
 YV+/7iLXPW3+w==
From: Oded Gabbay <ogabbay@kernel.org>
To: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Carl Vanderlip <quic_carlv@quicinc.com>
Cc: Ohad Sharabi <osharabi@habana.ai>
Subject: [PATCH 2/3] accel/habanalabs/gaudi2: drop support for never released
 firmware
Date: Mon, 26 Feb 2024 09:56:25 +0200
Message-Id: <20240226075626.1222534-2-ogabbay@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240226075626.1222534-1-ogabbay@kernel.org>
References: <20240226075626.1222534-1-ogabbay@kernel.org>
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

From: Ohad Sharabi <osharabi@habana.ai>

Firmware files below 1.11 were never released to customers so no need
to support them externally.

Signed-off-by: Ohad Sharabi <osharabi@habana.ai>
Reviewed-by: Oded Gabbay <ogabbay@kernel.org>
Signed-off-by: Oded Gabbay <ogabbay@kernel.org>
---
 drivers/accel/habanalabs/gaudi2/gaudi2.c | 47 ++----------------------
 1 file changed, 3 insertions(+), 44 deletions(-)

diff --git a/drivers/accel/habanalabs/gaudi2/gaudi2.c b/drivers/accel/habanalabs/gaudi2/gaudi2.c
index 5be3432d29b3..c99edbf9f4ca 100644
--- a/drivers/accel/habanalabs/gaudi2/gaudi2.c
+++ b/drivers/accel/habanalabs/gaudi2/gaudi2.c
@@ -6314,26 +6314,6 @@ static void gaudi2_execute_hard_reset(struct hl_device *hdev)
 	WREG32(mmPSOC_RESET_CONF_SW_ALL_RST, 1);
 }
 
-static int gaudi2_get_soft_rst_done_indication(struct hl_device *hdev, u32 poll_timeout_us)
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
-	return rc;
-}
-
 /**
  * gaudi2_execute_soft_reset - execute soft reset by driver/FW
  *
@@ -6346,23 +6326,8 @@ static int gaudi2_get_soft_rst_done_indication(struct hl_device *hdev, u32 poll_
 static int gaudi2_execute_soft_reset(struct hl_device *hdev, bool driver_performs_reset,
 						u32 poll_timeout_us)
 {
-	int rc;
-
-	if (!driver_performs_reset) {
-		if (hl_is_fw_sw_ver_below(hdev, 1, 10)) {
-			/* set SP to indicate reset request sent to FW */
-			WREG32(mmCPU_RST_STATUS_TO_HOST, CPU_RST_STATUS_NA);
-
-			WREG32(mmGIC_HOST_SOFT_RST_IRQ_POLL_REG,
-				gaudi2_irq_map_table[GAUDI2_EVENT_CPU_SOFT_RESET].cpu_id);
-
-			/* wait for f/w response */
-			rc = gaudi2_get_soft_rst_done_indication(hdev, poll_timeout_us);
-		} else {
-			rc = hl_fw_send_soft_reset(hdev);
-		}
-		return rc;
-	}
+	if (!driver_performs_reset)
+		return hl_fw_send_soft_reset(hdev);
 
 	/* Block access to engines, QMANs and SM during reset, these
 	 * RRs will be reconfigured after soft reset.
@@ -8165,13 +8130,7 @@ static void gaudi2_ack_module_razwi_event_handler(struct hl_device *hdev,
 		}
 
 		hbw_rtr_id = gaudi2_tpc_initiator_hbw_rtr_id[module_idx];
-
-		if (hl_is_fw_sw_ver_below(hdev, 1, 9) &&
-				!hdev->asic_prop.fw_security_enabled &&
-				((module_idx == 0) || (module_idx == 1)))
-			lbw_rtr_id = DCORE0_RTR0;
-		else
-			lbw_rtr_id = gaudi2_tpc_initiator_lbw_rtr_id[module_idx];
+		lbw_rtr_id = gaudi2_tpc_initiator_lbw_rtr_id[module_idx];
 		break;
 	case RAZWI_MME:
 		sprintf(initiator_name, "MME_%u", module_idx);
-- 
2.34.1

