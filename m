Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 408916939F9
	for <lists+dri-devel@lfdr.de>; Sun, 12 Feb 2023 21:46:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61CDD10E474;
	Sun, 12 Feb 2023 20:46:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CCC810E474
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Feb 2023 20:45:44 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id AB299B80B1A;
 Sun, 12 Feb 2023 20:45:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71E8FC433D2;
 Sun, 12 Feb 2023 20:45:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1676234742;
 bh=uk7Qdc9u/HXiUGE+OxQ+HfS8nUguF2JzSSeyDcIXwRs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ndBaqgHMkjN+8EV7OJKx9FHKAnZYfffbZ4yuYSfmwr73R8WyXAcuDxUelkWYYA01n
 b5+h50t89gXu+5MxNoB1eXsGrAP35cX89gmW1TQ0C4nhjl4jymSLsb8d4vIm361Luo
 TGSRGTCIY8Hbtn3mFClXtaYnumpw2a2MnHsqydwHoPxvL2jld8JC1zD5EOHC6NgGKF
 5fpdEVQJhBIU9yZwDSvBhzib3sac5k7MhzQ9ZyNSW1bwGNuF1mQgSMpy8Pw9stPU8I
 +ZxeRvtA1w0zj0KxChD3cYBf+EvT8gf3hNpP6EaRnFA/X4nAkk/QShoJK1BwhJCGKe
 pfJ7EyyNvNsyQ==
From: Oded Gabbay <ogabbay@kernel.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 25/27] habanalabs: in hl_device_reset remove
 'hard_instead_of_soft'
Date: Sun, 12 Feb 2023 22:44:52 +0200
Message-Id: <20230212204454.2938561-25-ogabbay@kernel.org>
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
Cc: Dafna Hirschfeld <dhirschfeld@habana.ai>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Dafna Hirschfeld <dhirschfeld@habana.ai>

Because this field is only used for debug print,
we can do more precise debug directly instead.

Signed-off-by: Dafna Hirschfeld <dhirschfeld@habana.ai>
Reviewed-by: Oded Gabbay <ogabbay@kernel.org>
Signed-off-by: Oded Gabbay <ogabbay@kernel.org>
---
 drivers/accel/habanalabs/common/device.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/drivers/accel/habanalabs/common/device.c b/drivers/accel/habanalabs/common/device.c
index 0e405e4c4b32..47ed2fec68bc 100644
--- a/drivers/accel/habanalabs/common/device.c
+++ b/drivers/accel/habanalabs/common/device.c
@@ -1474,9 +1474,8 @@ static void handle_reset_trigger(struct hl_device *hdev, u32 flags)
  */
 int hl_device_reset(struct hl_device *hdev, u32 flags)
 {
-	bool hard_reset, from_hard_reset_thread, fw_reset, hard_instead_soft = false,
-			reset_upon_device_release, schedule_hard_reset = false,
-			delay_reset, from_dev_release, from_watchdog_thread;
+	bool hard_reset, from_hard_reset_thread, fw_reset, reset_upon_device_release,
+		schedule_hard_reset = false, delay_reset, from_dev_release, from_watchdog_thread;
 	u64 idle_mask[HL_BUSY_ENGINES_MASK_EXT_SIZE] = {0};
 	struct hl_ctx *ctx;
 	int i, rc;
@@ -1500,7 +1499,7 @@ int hl_device_reset(struct hl_device *hdev, u32 flags)
 	}
 
 	if (!hard_reset && !hdev->asic_prop.supports_compute_reset) {
-		hard_instead_soft = true;
+		dev_dbg(hdev->dev, "asic doesn't support compute reset - do hard-reset instead\n");
 		hard_reset = true;
 	}
 
@@ -1515,13 +1514,11 @@ int hl_device_reset(struct hl_device *hdev, u32 flags)
 	}
 
 	if (!hard_reset && !hdev->asic_prop.allow_inference_soft_reset) {
-		hard_instead_soft = true;
+		dev_dbg(hdev->dev,
+			"asic doesn't allow inference soft reset - do hard-reset instead\n");
 		hard_reset = true;
 	}
 
-	if (hard_instead_soft)
-		dev_dbg(hdev->dev, "Doing hard-reset instead of compute reset\n");
-
 do_reset:
 	/* Re-entry of reset thread */
 	if (from_hard_reset_thread && hdev->process_kill_trial_cnt)
-- 
2.25.1

