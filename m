Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 039C76C66B6
	for <lists+dri-devel@lfdr.de>; Thu, 23 Mar 2023 12:35:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E5F410E46E;
	Thu, 23 Mar 2023 11:35:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10E4410E46E
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Mar 2023 11:35:35 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 69C5C62609;
 Thu, 23 Mar 2023 11:35:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E384FC433EF;
 Thu, 23 Mar 2023 11:35:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1679571333;
 bh=26GGfpqebp+jBczWyB97hblNZUF38ckgczf+y3PXm+s=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=en+5pSIig5Sjv95Z0FiaEOJKyeQxWuhkh9EDa92KXPshdTXR1Z5CpOyTH/+fquNx5
 4BIv5s/W3uV93XZ2/LVMrR2McVHjF20AkrDgaBviBaPk6oojkNfkJ6YupEMnSASNWd
 DAQaM+aZaSGLAhEVX000s2W2C4GW7X5pYMBMsIuIwRJiq6UkMZx2TWdWNXNLsDg92B
 wdUfHQAMqrKloSKm6hEYTj3ifjLmaOKiFBOMr3p+duKAoAG8460oer3OsA/JnwDTJo
 xw85Uy2gfFP+TtD/25N73l+eYN+81UhO+QXLNUrmxvX9duDbzeCH4W1Ut68wbgkMWm
 5sxqmuOFD10PA==
From: Oded Gabbay <ogabbay@kernel.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/6] accel/habanalabs: print event type when device is disabled
Date: Thu, 23 Mar 2023 13:35:21 +0200
Message-Id: <20230323113525.959176-2-ogabbay@kernel.org>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230323113525.959176-1-ogabbay@kernel.org>
References: <20230323113525.959176-1-ogabbay@kernel.org>
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
Cc: Tal Cohen <talcohen@habana.ai>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Tal Cohen <talcohen@habana.ai>

When the device is in disabled state, the driver isn't suppose to
receive any events from FW. Printing the event type, as part of the
message that was already printed, shall help to get more info if this
unexpected message is received.

Signed-off-by: Tal Cohen <talcohen@habana.ai>
Reviewed-by: Oded Gabbay <ogabbay@kernel.org>
Signed-off-by: Oded Gabbay <ogabbay@kernel.org>
---
 drivers/accel/habanalabs/common/irq.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/accel/habanalabs/common/irq.c b/drivers/accel/habanalabs/common/irq.c
index fab1abc5c910..0d59bb7c9063 100644
--- a/drivers/accel/habanalabs/common/irq.c
+++ b/drivers/accel/habanalabs/common/irq.c
@@ -415,8 +415,8 @@ irqreturn_t hl_irq_handler_eq(int irq, void *arg)
 	struct hl_eq_entry *eq_base;
 	struct hl_eqe_work *handle_eqe_work;
 	bool entry_ready;
-	u32 cur_eqe;
-	u16 cur_eqe_index;
+	u32 cur_eqe, ctl;
+	u16 cur_eqe_index, event_type;
 
 	eq_base = eq->kernel_address;
 
@@ -449,7 +449,10 @@ irqreturn_t hl_irq_handler_eq(int irq, void *arg)
 		dma_rmb();
 
 		if (hdev->disabled && !hdev->reset_info.in_compute_reset) {
-			dev_warn(hdev->dev, "Device disabled but received an EQ event\n");
+			ctl = le32_to_cpu(eq_entry->hdr.ctl);
+			event_type = ((ctl & EQ_CTL_EVENT_TYPE_MASK) >> EQ_CTL_EVENT_TYPE_SHIFT);
+			dev_warn(hdev->dev,
+				"Device disabled but received an EQ event (%u)\n", event_type);
 			goto skip_irq;
 		}
 
-- 
2.40.0

