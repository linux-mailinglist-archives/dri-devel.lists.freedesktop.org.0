Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23C616CFC98
	for <lists+dri-devel@lfdr.de>; Thu, 30 Mar 2023 09:22:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED6C510ECF1;
	Thu, 30 Mar 2023 07:22:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF14010E144
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Mar 2023 07:22:22 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0A89061F0D;
 Thu, 30 Mar 2023 07:22:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8701BC4339B;
 Thu, 30 Mar 2023 07:22:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1680160941;
 bh=lLkkzx8QZDfliHcbKc1Gc7JmXlI0aBIc9z4+No5kV+8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=XUcefq5mCvcmHTX2Oy/5dqlORUJranIVc4LchuOkxAOEXqlueWtweBb2vQLb6i2/4
 4cEPWY28JZr/5wSLm36S5PdYa3U9hnKbXm93a2G5g4ErS9Am2H/6K2ogZLF4tX9ZAB
 R7k/AlDUBDNhxblkDWuPYL9uRmQdOvF1dVr+R7NyJRwUjzXGLLe3mT5IDfDBCgriBd
 T/eTETwzH/cXGLBRZBua2wmI6ZR+Aw/D8Zif9vykK0pKXyCKkra4Z05C2ckZnbD0Uw
 TWawAmcVME9TpX/OwiWowjnU3jBCgKfU4M7tKW660EV0uj3HZVdevyvaH0eJ10JsD1
 cq5l8eIHS0SyQ==
From: Oded Gabbay <ogabbay@kernel.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 3/7] accel/habanalabs: fix events mask of decoder abnormal
 interrupts
Date: Thu, 30 Mar 2023 10:22:09 +0300
Message-Id: <20230330072213.1596318-3-ogabbay@kernel.org>
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
Cc: Tomer Tayar <ttayar@habana.ai>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Tomer Tayar <ttayar@habana.ai>

The decoder IRQ status register may have several set bits upon an
abnormal interrupt. Therefore, when setting the events mask, need to
check all bits and not using if-else.

Signed-off-by: Tomer Tayar <ttayar@habana.ai>
Reviewed-by: Oded Gabbay <ogabbay@kernel.org>
Signed-off-by: Oded Gabbay <ogabbay@kernel.org>
---
 drivers/accel/habanalabs/common/decoder.c | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/drivers/accel/habanalabs/common/decoder.c b/drivers/accel/habanalabs/common/decoder.c
index 59a1ecb20c04..c03a6da45d00 100644
--- a/drivers/accel/habanalabs/common/decoder.c
+++ b/drivers/accel/habanalabs/common/decoder.c
@@ -47,8 +47,8 @@ static void dec_abnrm_intr_work(struct work_struct *work)
 {
 	struct hl_dec *dec = container_of(work, struct hl_dec, abnrm_intr_work);
 	struct hl_device *hdev = dec->hdev;
+	u32 irq_status, event_mask = 0;
 	bool reset_required = false;
-	u32 irq_status, event_mask;
 
 	irq_status = RREG32(dec->base_addr + VCMD_IRQ_STATUS_OFFSET);
 
@@ -64,17 +64,21 @@ static void dec_abnrm_intr_work(struct work_struct *work)
 
 	if (irq_status & VCMD_IRQ_STATUS_TIMEOUT_MASK) {
 		reset_required = true;
-		event_mask = HL_NOTIFIER_EVENT_GENERAL_HW_ERR;
-	} else if (irq_status & VCMD_IRQ_STATUS_CMDERR_MASK) {
-		event_mask = HL_NOTIFIER_EVENT_UNDEFINED_OPCODE;
-	} else {
-		event_mask = HL_NOTIFIER_EVENT_USER_ENGINE_ERR;
+		event_mask |= HL_NOTIFIER_EVENT_GENERAL_HW_ERR;
 	}
 
+	if (irq_status & VCMD_IRQ_STATUS_CMDERR_MASK)
+		event_mask |= HL_NOTIFIER_EVENT_UNDEFINED_OPCODE;
+
+	if (irq_status & (VCMD_IRQ_STATUS_ENDCMD_MASK |
+				VCMD_IRQ_STATUS_BUSERR_MASK |
+				VCMD_IRQ_STATUS_ABORT_MASK))
+		event_mask |= HL_NOTIFIER_EVENT_USER_ENGINE_ERR;
+
 	if (reset_required) {
 		event_mask |= HL_NOTIFIER_EVENT_DEVICE_RESET;
 		hl_device_cond_reset(hdev, 0, event_mask);
-	} else {
+	} else if (event_mask) {
 		hl_notifier_event_send_all(hdev, event_mask);
 	}
 }
-- 
2.40.0

