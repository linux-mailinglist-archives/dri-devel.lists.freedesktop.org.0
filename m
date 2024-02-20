Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B194B85C083
	for <lists+dri-devel@lfdr.de>; Tue, 20 Feb 2024 17:01:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A35B10E4D3;
	Tue, 20 Feb 2024 16:01:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="fRUGaNxT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F41C10E4CC
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Feb 2024 16:01:40 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id D309F611D7;
 Tue, 20 Feb 2024 16:01:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AF41C433F1;
 Tue, 20 Feb 2024 16:01:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1708444899;
 bh=MXw5mtakAsN2KGERNoMcdt1TmIcnXzEjipcYgllps+M=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=fRUGaNxTDlkcl38NZlpwehCkkIrZuPrjZDmW8Od+5xiNnTLg1HG/1/Mxb/br07tR5
 W+sPskKHRJjdNMTDNiJP0+jRggx+ESudVC/VEoz0qQkC+5GPqE3uXvuT7kaxQfX+8e
 3kpDpOaVAoylHiawikSyEVsBqgSneWiGvwftk+AEn8OVchTEeKEp/sEAb69KcQnfRx
 OtYvwJ1t1+t1jwcnrXdje5WBmmJLCkf3RJ3ur4twpjAKcmJwFFRiFziDR0x44HvRMy
 g8KQpaE26rfNbkU/qLhmMKZMYe5+28jbr7pDNyB8tpQL+EkDxRn/AUJ8yE5/v8FsRE
 J2MpN+9NEepMw==
From: Oded Gabbay <ogabbay@kernel.org>
To: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Cc: Tomer Tayar <ttayar@habana.ai>
Subject: [PATCH 04/13] accel/habanalabs/gaudi2: check extended errors
 according to PCIe addr_dec interrupt info
Date: Tue, 20 Feb 2024 18:01:20 +0200
Message-Id: <20240220160129.909714-4-ogabbay@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240220160129.909714-1-ogabbay@kernel.org>
References: <20240220160129.909714-1-ogabbay@kernel.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Tomer Tayar <ttayar@habana.ai>

The FW interrupt info for a PCIe addr_dec event is set correctly, so
check for either global errors or razwi according to the indications
there.

Signed-off-by: Tomer Tayar <ttayar@habana.ai>
Reviewed-by: Oded Gabbay <ogabbay@kernel.org>
Signed-off-by: Oded Gabbay <ogabbay@kernel.org>
---
 drivers/accel/habanalabs/gaudi2/gaudi2.c | 18 ++++++++----------
 1 file changed, 8 insertions(+), 10 deletions(-)

diff --git a/drivers/accel/habanalabs/gaudi2/gaudi2.c b/drivers/accel/habanalabs/gaudi2/gaudi2.c
index 26975179763a..671241735a6e 100644
--- a/drivers/accel/habanalabs/gaudi2/gaudi2.c
+++ b/drivers/accel/habanalabs/gaudi2/gaudi2.c
@@ -8942,9 +8942,6 @@ static int gaudi2_print_pcie_addr_dec_info(struct hl_device *hdev, u16 event_typ
 	u32 error_count = 0;
 	int i;
 
-	gaudi2_print_event(hdev, event_type, true,
-		"intr_cause_data: %#llx", intr_cause_data);
-
 	for (i = 0 ; i < GAUDI2_NUM_OF_PCIE_ADDR_DEC_ERR_CAUSE ; i++) {
 		if (!(intr_cause_data & BIT_ULL(i)))
 			continue;
@@ -8953,15 +8950,16 @@ static int gaudi2_print_pcie_addr_dec_info(struct hl_device *hdev, u16 event_typ
 			"err cause: %s", gaudi2_pcie_addr_dec_error_cause[i]);
 		error_count++;
 
-		/*
-		 * Always check for LBW and HBW additional info as the indication itself is
-		 * sometimes missing
-		 */
+		switch (intr_cause_data & BIT_ULL(i)) {
+		case PCIE_WRAP_PCIE_IC_SEI_INTR_IND_AXI_LBW_ERR_INTR_MASK:
+			hl_check_for_glbl_errors(hdev);
+			break;
+		case PCIE_WRAP_PCIE_IC_SEI_INTR_IND_BAD_ACCESS_INTR_MASK:
+			gaudi2_print_pcie_mstr_rr_mstr_if_razwi_info(hdev, event_mask);
+			break;
+		}
 	}
 
-	hl_check_for_glbl_errors(hdev);
-	gaudi2_print_pcie_mstr_rr_mstr_if_razwi_info(hdev, event_mask);
-
 	return error_count;
 }
 
-- 
2.34.1

