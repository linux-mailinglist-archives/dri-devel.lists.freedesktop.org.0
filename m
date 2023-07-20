Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AC67475AC78
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jul 2023 12:58:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44DCF10E5AD;
	Thu, 20 Jul 2023 10:58:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FDE310E5AD
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jul 2023 10:58:10 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9E38861A04;
 Thu, 20 Jul 2023 10:58:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0323BC433C7;
 Thu, 20 Jul 2023 10:58:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1689850688;
 bh=aIIczyBWtyT6s/zO9ylgT4pnPHWsP3x1edH+Q2TRMI4=;
 h=From:To:Cc:Subject:Date:From;
 b=OGf8IYp70yfbdkvzwzWNastjQ0DJqVM7odvzd8Z05vI4lvpXQm5B3d1+rUtijIFBY
 pglO4FdCYnQVl1/96dy6UkYP7w8QbDQcEIQiXQ3t2aMzQK0TGQ6MrppOJIuTKWxaNG
 fkw/ny7CHpSXBHYVqxQR67mjF6MTgNp7jXSMzIbIIQzkS0Ufr36yl8hhbfBteiUB5n
 Ihu5BDtLJpPS192YrKpZfAOyvG5+iJMZZ/wWGaUePOKfScJh8mNsNUC6PpOHnrlNrW
 gTeQRcC0Y4f1J1col/6fPEw/ThcQcXL0SzoNINlZPB32cF8a48ipQMZMXW6oNo8qkz
 Yrq1NWq7APLqg==
From: Oded Gabbay <ogabbay@kernel.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] accel/habanalabs/gaudi2: prepare to remove cpu_rst_status
Date: Thu, 20 Jul 2023 13:58:03 +0300
Message-Id: <20230720105803.690745-1-ogabbay@kernel.org>
X-Mailer: git-send-email 2.34.1
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
As a preparation for removing the cpu_rst_status field from
struct cpu_dyn_regs, switch to use the plain macro - this keeps the
backward compatibility.

Signed-off-by: Igor Grinberg <igrinberg@habana.ai>
Reviewed-by: Oded Gabbay <ogabbay@kernel.org>
Signed-off-by: Oded Gabbay <ogabbay@kernel.org>
---
 drivers/accel/habanalabs/gaudi2/gaudi2.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/accel/habanalabs/gaudi2/gaudi2.c b/drivers/accel/habanalabs/gaudi2/gaudi2.c
index 222310bf1098..dc96e34b72ef 100644
--- a/drivers/accel/habanalabs/gaudi2/gaudi2.c
+++ b/drivers/accel/habanalabs/gaudi2/gaudi2.c
@@ -6253,16 +6253,12 @@ static int gaudi2_get_soft_rst_done_indication(struct hl_device *hdev, u32 poll_
 static int gaudi2_execute_soft_reset(struct hl_device *hdev, bool driver_performs_reset,
 						u32 poll_timeout_us)
 {
-	struct cpu_dyn_regs *dyn_regs = &hdev->fw_loader.dynamic_loader.comm_desc.cpu_dyn_regs;
-	int rc = 0;
+	int rc;
 
 	if (!driver_performs_reset) {
 		if (hl_is_fw_sw_ver_below(hdev, 1, 10)) {
 			/* set SP to indicate reset request sent to FW */
-			if (dyn_regs->cpu_rst_status)
-				WREG32(le32_to_cpu(dyn_regs->cpu_rst_status), CPU_RST_STATUS_NA);
-			else
-				WREG32(mmCPU_RST_STATUS_TO_HOST, CPU_RST_STATUS_NA);
+			WREG32(mmCPU_RST_STATUS_TO_HOST, CPU_RST_STATUS_NA);
 
 			WREG32(mmGIC_HOST_SOFT_RST_IRQ_POLL_REG,
 				gaudi2_irq_map_table[GAUDI2_EVENT_CPU_SOFT_RESET].cpu_id);
-- 
2.34.1

