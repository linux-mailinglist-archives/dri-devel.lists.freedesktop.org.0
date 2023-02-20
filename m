Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2483769C791
	for <lists+dri-devel@lfdr.de>; Mon, 20 Feb 2023 10:19:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B019B10E631;
	Mon, 20 Feb 2023 09:19:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF0B610E62E
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Feb 2023 09:19:50 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 41B0F60C5D;
 Mon, 20 Feb 2023 09:19:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1667C4339B;
 Mon, 20 Feb 2023 09:19:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1676884789;
 bh=V4TVZxh0REU06owZbOBfkGb6UcK0GUmZ8CruRKAvwHs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=jDrIbG1ZmKGYo+C5Cbe5njIPMZxZvvvgBvWOZqRk0+gtsAV5bPjsq0iBELremF1cW
 Xk/O85gKgXp5x8go7Qkl4maTHX0EUUYpxJAwyI61ztFqg/KzXljbsPyrcztZ8Ac/Lj
 +yVp2upm5AwhfdiexN/eq7wBlXGb/U2WVAhOnnwcnwLcvnyppqbiGZig5RlOdcUW4q
 bBYmkPwczSfcptth6t1y8jEmjYBGt3VZMDoS0bG7sQW9kbUxWzV6m05t1135aGLCUX
 3/IqLrstPGqUKz6BRjJU1FTbsy3d07cuk50jxgl5lbUZuiZPuN/8G9uD+9rJH0CXxY
 tiGTuXjjHuo/A==
From: Oded Gabbay <ogabbay@kernel.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 4/4] habanalabs/gaudi2: remove unneeded irq_handler variable
Date: Mon, 20 Feb 2023 11:19:39 +0200
Message-Id: <20230220091939.3467487-4-ogabbay@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230220091939.3467487-1-ogabbay@kernel.org>
References: <20230220091939.3467487-1-ogabbay@kernel.org>
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

'irq_handler' in gaudi2_enable_msix(), is just assigned with a function
name and then used when calling request_threaded_irq().
Remove the variable and use the function name directly as an argument.

Signed-off-by: Tomer Tayar <ttayar@habana.ai>
Reviewed-by: Oded Gabbay <ogabbay@kernel.org>
Signed-off-by: Oded Gabbay <ogabbay@kernel.org>
---
 drivers/accel/habanalabs/gaudi2/gaudi2.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/accel/habanalabs/gaudi2/gaudi2.c b/drivers/accel/habanalabs/gaudi2/gaudi2.c
index 5a225f23961b..2021ef9d4702 100644
--- a/drivers/accel/habanalabs/gaudi2/gaudi2.c
+++ b/drivers/accel/habanalabs/gaudi2/gaudi2.c
@@ -3974,7 +3974,6 @@ static int gaudi2_enable_msix(struct hl_device *hdev)
 	struct asic_fixed_properties *prop = &hdev->asic_prop;
 	struct gaudi2_device *gaudi2 = hdev->asic_specific;
 	int rc, irq, i, j, user_irq_init_cnt;
-	irq_handler_t irq_handler;
 	struct hl_cq *cq;
 
 	if (gaudi2->hw_cap_initialized & HW_CAP_MSIX)
@@ -4024,10 +4023,9 @@ static int gaudi2_enable_msix(struct hl_device *hdev)
 			i++, j++, user_irq_init_cnt++) {
 
 		irq = pci_irq_vector(hdev->pdev, i);
-		irq_handler = hl_irq_handler_user_interrupt;
-
-		rc = request_threaded_irq(irq, irq_handler, hl_irq_user_interrupt_thread_handler,
-				IRQF_ONESHOT, gaudi2_irq_name(i), &hdev->user_interrupt[j]);
+		rc = request_threaded_irq(irq, hl_irq_handler_user_interrupt,
+						hl_irq_user_interrupt_thread_handler, IRQF_ONESHOT,
+						gaudi2_irq_name(i), &hdev->user_interrupt[j]);
 
 		if (rc) {
 			dev_err(hdev->dev, "Failed to request IRQ %d", irq);
-- 
2.25.1

