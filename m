Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB353AA9FB3
	for <lists+dri-devel@lfdr.de>; Tue,  6 May 2025 00:26:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B3F710E486;
	Mon,  5 May 2025 22:26:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="LNcbw4NW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D048B10E486
 for <dri-devel@lists.freedesktop.org>; Mon,  5 May 2025 22:26:29 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 2476B5C5A8C;
 Mon,  5 May 2025 22:24:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDC05C4CEE4;
 Mon,  5 May 2025 22:26:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1746483989;
 bh=TTd+8ysUx/6ibcYEyRnivVxH2TcvNiwagqLhEVpIm5A=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=LNcbw4NW4rIBI7SqjWDmna3Hn9uj9Q5NxZ+IqpPtv0RYB7Ne8oDNCWKXSKSapHI8f
 ejyBLOnXtRe4WMjRatpVYFfVhEDgcVhvWGw7kFfw/jIXBKUD1t5n2YL+VzYoI+x0y5
 uJ9QS5yFmFjVLgTNcElFPweD+Fb/OP43z93dgkkbVtWHPyu6cX03W+f3F+/I/HNXCl
 zaLcQVoqUdhLD3k7h2pvDJ8a2+Lt1L8atl6a+Sq2TPBmioYzgi99+FhFx2aFpQ2Voq
 1ZI7k8dgwJhhjAgH9ne7MNY3qCofneRej/iQitcpnz4WzYZ/kWIL3AQJ25C89TsgxL
 Wi6MJciIB7MSg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Lizhi Hou <lizhi.hou@amd.com>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Sasha Levin <sashal@kernel.org>, min.ma@amd.com, ogabbay@kernel.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.14 307/642] accel/amdxdna: Check interrupt register
 before mailbox_rx_worker exits
Date: Mon,  5 May 2025 18:08:43 -0400
Message-Id: <20250505221419.2672473-307-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505221419.2672473-1-sashal@kernel.org>
References: <20250505221419.2672473-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.14.5
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

From: Lizhi Hou <lizhi.hou@amd.com>

[ Upstream commit cd740b873f8f6f5f4558723241ba9c09eb36d0ba ]

There is a timeout failure been found during stress tests. If the firmware
generates a mailbox response right after driver clears the mailbox channel
interrupt register, the hardware will not generate an interrupt for the
response. This causes the unexpected mailbox command timeout.

To handle this failure, driver checks the interrupt register before
exiting mailbox_rx_worker(). If there is a new response, driver goes back
to process it.

Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
Reviewed-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20250226161810.4188334-1-lizhi.hou@amd.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/accel/amdxdna/amdxdna_mailbox.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/drivers/accel/amdxdna/amdxdna_mailbox.c b/drivers/accel/amdxdna/amdxdna_mailbox.c
index e5301fac13971..2879e4149c937 100644
--- a/drivers/accel/amdxdna/amdxdna_mailbox.c
+++ b/drivers/accel/amdxdna/amdxdna_mailbox.c
@@ -349,8 +349,6 @@ static irqreturn_t mailbox_irq_handler(int irq, void *p)
 	trace_mbox_irq_handle(MAILBOX_NAME, irq);
 	/* Schedule a rx_work to call the callback functions */
 	queue_work(mb_chann->work_q, &mb_chann->rx_work);
-	/* Clear IOHUB register */
-	mailbox_reg_write(mb_chann, mb_chann->iohub_int_addr, 0);
 
 	return IRQ_HANDLED;
 }
@@ -367,6 +365,9 @@ static void mailbox_rx_worker(struct work_struct *rx_work)
 		return;
 	}
 
+again:
+	mailbox_reg_write(mb_chann, mb_chann->iohub_int_addr, 0);
+
 	while (1) {
 		/*
 		 * If return is 0, keep consuming next message, until there is
@@ -380,10 +381,18 @@ static void mailbox_rx_worker(struct work_struct *rx_work)
 		if (unlikely(ret)) {
 			MB_ERR(mb_chann, "Unexpected ret %d, disable irq", ret);
 			WRITE_ONCE(mb_chann->bad_state, true);
-			disable_irq(mb_chann->msix_irq);
-			break;
+			return;
 		}
 	}
+
+	/*
+	 * The hardware will not generate interrupt if firmware creates a new
+	 * response right after driver clears interrupt register. Check
+	 * the interrupt register to make sure there is not any new response
+	 * before exiting.
+	 */
+	if (mailbox_reg_read(mb_chann, mb_chann->iohub_int_addr))
+		goto again;
 }
 
 int xdna_mailbox_send_msg(struct mailbox_channel *mb_chann,
-- 
2.39.5

