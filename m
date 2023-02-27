Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 529B16A405C
	for <lists+dri-devel@lfdr.de>; Mon, 27 Feb 2023 12:13:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 104B310E3C2;
	Mon, 27 Feb 2023 11:13:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA68D10E3B3
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Feb 2023 11:13:18 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4054A60DC4;
 Mon, 27 Feb 2023 11:13:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2802C4339B;
 Mon, 27 Feb 2023 11:13:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1677496397;
 bh=uT+fzBYrbET5ZYuU3bEXEmVr1RkgKfTwP1oIHHM5mSY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=WNpaTWA+pbzK6lp4CImKAoyGSpsaL8Gn2AD4VSyUtDgZE5R+cN4SniVUPtAHdhLrT
 0x+guraXgULajVKr4uAXkBd7cMWfDJntQXsU5EuTwVQ/qYyMVmlsn5EAknu/WaJDl6
 vlMMu7CsXLc2yP5zo9PDAfSD2nfoPuf+snaZsdCYeIo2JNtxy+x+uxlcaqd6LonOZ3
 8zLyv0BXjI4fst37o1T52ellFtd1HkZMGr8B/Ja6OhGru7rJVxOV78HaZZ9ciI1pfJ
 nqWbIp/rdrx9plImmBalhWu4y9cQLzSVrgyEDhXkiQznoXux35M5BNVeAj8gmXYcog
 mWQpyciHQ9hQQ==
From: Oded Gabbay <ogabbay@kernel.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 5/6] habanalabs: use notifications and graceful reset for
 decoder
Date: Mon, 27 Feb 2023 13:13:05 +0200
Message-Id: <20230227111306.3985896-5-ogabbay@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230227111306.3985896-1-ogabbay@kernel.org>
References: <20230227111306.3985896-1-ogabbay@kernel.org>
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

Add notifications to user in case of decoder abnormal interrupts, and
use the graceful reset mechanism if reset is required.

Signed-off-by: Tomer Tayar <ttayar@habana.ai>
Reviewed-by: Oded Gabbay <ogabbay@kernel.org>
Signed-off-by: Oded Gabbay <ogabbay@kernel.org>
---
 drivers/accel/habanalabs/common/decoder.c | 22 ++++++++++++++++------
 1 file changed, 16 insertions(+), 6 deletions(-)

diff --git a/drivers/accel/habanalabs/common/decoder.c b/drivers/accel/habanalabs/common/decoder.c
index 2aab14d74b53..69c78c1784b4 100644
--- a/drivers/accel/habanalabs/common/decoder.c
+++ b/drivers/accel/habanalabs/common/decoder.c
@@ -46,7 +46,7 @@ static void dec_print_abnrm_intr_source(struct hl_device *hdev, u32 irq_status)
 static void dec_error_intr_work(struct hl_device *hdev, u32 base_addr, u32 core_id)
 {
 	bool reset_required = false;
-	u32 irq_status;
+	u32 irq_status, event_mask;
 
 	irq_status = RREG32(base_addr + VCMD_IRQ_STATUS_OFFSET);
 
@@ -54,17 +54,27 @@ static void dec_error_intr_work(struct hl_device *hdev, u32 base_addr, u32 core_
 
 	dec_print_abnrm_intr_source(hdev, irq_status);
 
-	if (irq_status & VCMD_IRQ_STATUS_TIMEOUT_MASK)
-		reset_required = true;
-
 	/* Clear the interrupt */
 	WREG32(base_addr + VCMD_IRQ_STATUS_OFFSET, irq_status);
 
 	/* Flush the interrupt clear */
 	RREG32(base_addr + VCMD_IRQ_STATUS_OFFSET);
 
-	if (reset_required)
-		hl_device_reset(hdev, HL_DRV_RESET_HARD);
+	if (irq_status & VCMD_IRQ_STATUS_TIMEOUT_MASK) {
+		reset_required = true;
+		event_mask = HL_NOTIFIER_EVENT_GENERAL_HW_ERR;
+	} else if (irq_status & VCMD_IRQ_STATUS_CMDERR_MASK) {
+		event_mask = HL_NOTIFIER_EVENT_UNDEFINED_OPCODE;
+	} else {
+		event_mask = HL_NOTIFIER_EVENT_USER_ENGINE_ERR;
+	}
+
+	if (reset_required) {
+		event_mask |= HL_NOTIFIER_EVENT_DEVICE_RESET;
+		hl_device_cond_reset(hdev, 0, event_mask);
+	} else {
+		hl_notifier_event_send_all(hdev, event_mask);
+	}
 }
 
 static void dec_completion_abnrm(struct work_struct *work)
-- 
2.39.2

