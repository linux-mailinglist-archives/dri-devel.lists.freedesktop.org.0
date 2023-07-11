Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63C9074EC68
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jul 2023 13:12:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1D0110E376;
	Tue, 11 Jul 2023 11:12:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9173910E371
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jul 2023 11:12:36 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6E37061449;
 Tue, 11 Jul 2023 11:12:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 015ECC433C8;
 Tue, 11 Jul 2023 11:12:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1689073954;
 bh=zeVtVw6gaq3RvqYHwpxtIYNqzLZ3ywjrmMXlBceG7eU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Ta40R8u0r7OzXHfPvkNv+EPje3BSNZ7U9u+7R5GU9f/imaugb2Bfm3vAVO+KowFD/
 tqnmBbY7hfia/oN7nh98yFPdKZiPnUti5U+PVT+i8RG5sdaJmADCKA9LlR33djibRw
 1RSpymtd8l/ZlYb0INurRxyXn0IZwUxObvwgY8n9+BqpMFK5352lh+gmgKPDjPvFUS
 1ihHk2qTyLiIT/RZEhCQZUDiYtH/CyJpIV+wzc9x/r2ymEFK9wvnTY490Ag3tPhmgv
 pcynQT3nQ37bCBauOFZ5XjlAZLCvwr9vlz3+7bgYeMWjQYqxEj1JcHJC3cW1ST3GTC
 E+UdTsqVms3+g==
From: Oded Gabbay <ogabbay@kernel.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 03/12] accel/habanalabs/gaudi2: prepare to remove soft_rst_irq
Date: Tue, 11 Jul 2023 14:12:17 +0300
Message-Id: <20230711111226.163670-3-ogabbay@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230711111226.163670-1-ogabbay@kernel.org>
References: <20230711111226.163670-1-ogabbay@kernel.org>
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
Cc: Igor Grinberg <igrinberg@habana.ai>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Igor Grinberg <igrinberg@habana.ai>

The soft reset has transitioned to CPUCP packet instead of plain
register write and is about to be removed from the struct cpu_dyn_regs.
As a preparation for removing the gic_host_soft_rst_irq field from
struct cpu_dyn_regs, switch to use the plain macro - this keeps the
backward compatibility.

Signed-off-by: Igor Grinberg <igrinberg@habana.ai>
Reviewed-by: Oded Gabbay <ogabbay@kernel.org>
Signed-off-by: Oded Gabbay <ogabbay@kernel.org>
---
 drivers/accel/habanalabs/gaudi2/gaudi2.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/accel/habanalabs/gaudi2/gaudi2.c b/drivers/accel/habanalabs/gaudi2/gaudi2.c
index 1e22c7a47358..0f9e9522233f 100644
--- a/drivers/accel/habanalabs/gaudi2/gaudi2.c
+++ b/drivers/accel/habanalabs/gaudi2/gaudi2.c
@@ -6263,7 +6263,8 @@ static int gaudi2_execute_soft_reset(struct hl_device *hdev, bool driver_perform
 				WREG32(le32_to_cpu(dyn_regs->cpu_rst_status), CPU_RST_STATUS_NA);
 			else
 				WREG32(mmCPU_RST_STATUS_TO_HOST, CPU_RST_STATUS_NA);
-			WREG32(le32_to_cpu(dyn_regs->gic_host_soft_rst_irq),
+
+			WREG32(mmGIC_HOST_SOFT_RST_IRQ_POLL_REG,
 				gaudi2_irq_map_table[GAUDI2_EVENT_CPU_SOFT_RESET].cpu_id);
 
 			/* wait for f/w response */
-- 
2.34.1

