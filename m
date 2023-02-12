Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F0EF6939F1
	for <lists+dri-devel@lfdr.de>; Sun, 12 Feb 2023 21:45:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60D9310E47B;
	Sun, 12 Feb 2023 20:45:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D389810E479
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Feb 2023 20:45:40 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 69A5EB80D4D;
 Sun, 12 Feb 2023 20:45:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0EF50C4339B;
 Sun, 12 Feb 2023 20:45:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1676234738;
 bh=nAftUuLlh5cjHI/G1BKs3rr50tLgI8xJrA2b3dZPizU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=uwlXOhJFXJyV73Nxtz5FKAOrPA6QeNITHyFWWUVUSLSYIIWjZoj1HIW8zKEKPMhUH
 36rUnUHCyPPHbyGz+TCmact/sgmqg+CgQdwvm99TyKTEZ3tbl2hJGtiuyIkJlPC1/Y
 9x9cw5chtkGE0lEwQ56GPu0YLELAvysw3B7kOelp05+bWbrZO3cPXdibnK2f1BVSBe
 CdevC38FWj/PN+OdP7T83LTq2G1fuI461Z4aISRG9tcF4/oOOkpoKZt3BPy1JGgWbl
 R12DbJsfjNNsipfYXvH8Qu/f/LoVVaeUT9gZE+DCZVC8yauu7CIFEaGkk+3fMTyuEI
 B+ZcKFFiyzN9Q==
From: Oded Gabbay <ogabbay@kernel.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 22/27] habanalabs: remove hl_irq_handler_default()
Date: Sun, 12 Feb 2023 22:44:49 +0200
Message-Id: <20230212204454.2938561-22-ogabbay@kernel.org>
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

hl_irq_handler_default() is not used and can be removed.

Signed-off-by: Tomer Tayar <ttayar@habana.ai>
Reviewed-by: Oded Gabbay <ogabbay@kernel.org>
Signed-off-by: Oded Gabbay <ogabbay@kernel.org>
---
 drivers/accel/habanalabs/common/habanalabs.h |  1 -
 drivers/accel/habanalabs/common/irq.c        | 18 ------------------
 2 files changed, 19 deletions(-)

diff --git a/drivers/accel/habanalabs/common/habanalabs.h b/drivers/accel/habanalabs/common/habanalabs.h
index ed6987a0050f..ec0879168adf 100644
--- a/drivers/accel/habanalabs/common/habanalabs.h
+++ b/drivers/accel/habanalabs/common/habanalabs.h
@@ -3656,7 +3656,6 @@ irqreturn_t hl_irq_handler_cq(int irq, void *arg);
 irqreturn_t hl_irq_handler_eq(int irq, void *arg);
 irqreturn_t hl_irq_handler_dec_abnrm(int irq, void *arg);
 irqreturn_t hl_irq_handler_user_interrupt(int irq, void *arg);
-irqreturn_t hl_irq_handler_default(int irq, void *arg);
 irqreturn_t hl_irq_user_interrupt_thread_handler(int irq, void *arg);
 u32 hl_cq_inc_ptr(u32 ptr);
 
diff --git a/drivers/accel/habanalabs/common/irq.c b/drivers/accel/habanalabs/common/irq.c
index 4b062e8520f1..8c6705cf958e 100644
--- a/drivers/accel/habanalabs/common/irq.c
+++ b/drivers/accel/habanalabs/common/irq.c
@@ -392,24 +392,6 @@ irqreturn_t hl_irq_user_interrupt_thread_handler(int irq, void *arg)
 	return IRQ_HANDLED;
 }
 
-/**
- * hl_irq_handler_default - default irq handler
- *
- * @irq: irq number
- * @arg: pointer to user interrupt structure
- *
- */
-irqreturn_t hl_irq_handler_default(int irq, void *arg)
-{
-	struct hl_user_interrupt *user_interrupt = arg;
-	struct hl_device *hdev = user_interrupt->hdev;
-	u32 interrupt_id = user_interrupt->interrupt_id;
-
-	dev_err(hdev->dev, "got invalid user interrupt %u", interrupt_id);
-
-	return IRQ_HANDLED;
-}
-
 /**
  * hl_irq_handler_eq - irq handler for event queue
  *
-- 
2.25.1

