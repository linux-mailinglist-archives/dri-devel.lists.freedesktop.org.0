Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C67376939F4
	for <lists+dri-devel@lfdr.de>; Sun, 12 Feb 2023 21:45:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 884F410E481;
	Sun, 12 Feb 2023 20:45:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2451410E479
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Feb 2023 20:45:37 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A6F5160DDC;
 Sun, 12 Feb 2023 20:45:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9094FC433EF;
 Sun, 12 Feb 2023 20:45:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1676234736;
 bh=ZtvimvaS2Naes9ZNu9LD3FSQk8HbiB/AXFGomSkzFJk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=FlfaNbNGaJIWGuLQI6gQanWheFW9pcFz3O8JVv3YV9EYm8NbCGWnm9d+MeEdHS6QK
 JdspQBHFbkoDlSgok+L8Ke0tyLxsdVL1UzJEY98cKPJm0igtNCCEbcHJLcF5mfxW14
 Kceg+LFwB9lJtx7sUtt3Z4dzJpjFDyBbH5BorSf8bK2Uixy1dP+VY9XWhrBeab6d/f
 HfJqZbtK6kNOgdpsgpPLbW9gcskmEcB72rUl+2bPNwh3+ocr5mY64eWjRfvqH5q9eW
 2U5gZhPwe3SF0wArDSG974lKjJojfIeYVSH7/+MgUwQGjZT9GFPvDHYZnMK0HvJhni
 gXygGW5XMeaig==
From: Oded Gabbay <ogabbay@kernel.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 21/27] habanalabs: fix print in hl_irq_handler_eq()
Date: Sun, 12 Feb 2023 22:44:48 +0200
Message-Id: <20230212204454.2938561-21-ogabbay@kernel.org>
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
Cc: Tomer Tayar <ttayar@habana.ai>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Tomer Tayar <ttayar@habana.ai>

"eq_base[eq->ci].hdr.ctl" is used directly in a print without a
le32_to_cpu() conversion.

Signed-off-by: Tomer Tayar <ttayar@habana.ai>
Reviewed-by: Oded Gabbay <ogabbay@kernel.org>
Signed-off-by: Oded Gabbay <ogabbay@kernel.org>
---
 drivers/accel/habanalabs/common/irq.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/accel/habanalabs/common/irq.c b/drivers/accel/habanalabs/common/irq.c
index bd0e3413721b..4b062e8520f1 100644
--- a/drivers/accel/habanalabs/common/irq.c
+++ b/drivers/accel/habanalabs/common/irq.c
@@ -439,11 +439,10 @@ irqreturn_t hl_irq_handler_eq(int irq, void *arg)
 
 		cur_eqe_index = FIELD_GET(EQ_CTL_INDEX_MASK, cur_eqe);
 		if ((hdev->event_queue.check_eqe_index) &&
-				(((eq->prev_eqe_index + 1) & EQ_CTL_INDEX_MASK)
-							!= cur_eqe_index)) {
+				(((eq->prev_eqe_index + 1) & EQ_CTL_INDEX_MASK) != cur_eqe_index)) {
 			dev_dbg(hdev->dev,
-				"EQE 0x%x in queue is ready but index does not match %d!=%d",
-				eq_base[eq->ci].hdr.ctl,
+				"EQE %#x in queue is ready but index does not match %d!=%d",
+				cur_eqe,
 				((eq->prev_eqe_index + 1) & EQ_CTL_INDEX_MASK),
 				cur_eqe_index);
 			break;
-- 
2.25.1

