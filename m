Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D4A3A6F2FF6
	for <lists+dri-devel@lfdr.de>; Mon,  1 May 2023 11:48:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16CE010E28F;
	Mon,  1 May 2023 09:48:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9F3110E317
 for <dri-devel@lists.freedesktop.org>; Mon,  1 May 2023 09:48:08 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 32D2A60B9E;
 Mon,  1 May 2023 09:48:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7A8DC4339B;
 Mon,  1 May 2023 09:48:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1682934487;
 bh=LpsEPzX3v5sPO3o34me3QulIAMOh6n5Q5j+IzRCfXsI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=V0GEflYR0lwokFsW9TR+8lXlzMFN6nu8UpdXcUsel9dQB50bg+ZLEedVSFAPUQcVJ
 GE/OORIgIc7/B0jTtmxJgwavIW+HbTmVEeDZEL6YH7RCDIHLYZMGfcTVS3V9Zu1v25
 sLTizrOHYxjPFQSjTcZClkYWdbX+AiKHODPJRzS/PTd6wek8k4B7wqFdBiuXCJ12tB
 TirgFq82oTovLuEqMfrENyBKMDPbInR7FfeL2DylvJO0yNdMZcr+55TSWXcarsvaJa
 WFPKfGCJ5AbwZNYrnntgbXQ8mhYZUpoDYeIFhMHsrD5xDhf8IKbc9Om6dJoUX+DcOU
 2RL901WOaghuA==
From: Oded Gabbay <ogabbay@kernel.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 6/6] accel/habanalabs: always fetch pci addr_dec error info
Date: Mon,  1 May 2023 12:47:54 +0300
Message-Id: <20230501094754.100030-6-ogabbay@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230501094754.100030-1-ogabbay@kernel.org>
References: <20230501094754.100030-1-ogabbay@kernel.org>
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
Cc: Ofir Bitton <obitton@habana.ai>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Ofir Bitton <obitton@habana.ai>

Due to missing indication of address decode source (LBW/HBW bus),
we should always try and fetch extended information.

Signed-off-by: Ofir Bitton <obitton@habana.ai>
Reviewed-by: Oded Gabbay <ogabbay@kernel.org>
Signed-off-by: Oded Gabbay <ogabbay@kernel.org>
---
 drivers/accel/habanalabs/gaudi2/gaudi2.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/accel/habanalabs/gaudi2/gaudi2.c b/drivers/accel/habanalabs/gaudi2/gaudi2.c
index 240fecfab608..d21ef9997d05 100644
--- a/drivers/accel/habanalabs/gaudi2/gaudi2.c
+++ b/drivers/accel/habanalabs/gaudi2/gaudi2.c
@@ -8892,14 +8892,12 @@ static int gaudi2_print_pcie_addr_dec_info(struct hl_device *hdev, u16 event_typ
 			"err cause: %s", gaudi2_pcie_addr_dec_error_cause[i]);
 		error_count++;
 
-		switch (intr_cause_data & BIT_ULL(i)) {
-		case PCIE_WRAP_PCIE_IC_SEI_INTR_IND_AXI_LBW_ERR_INTR_MASK:
-			hl_check_for_glbl_errors(hdev);
-			break;
-		case PCIE_WRAP_PCIE_IC_SEI_INTR_IND_BAD_ACCESS_INTR_MASK:
-			gaudi2_print_pcie_mstr_rr_mstr_if_razwi_info(hdev, event_mask);
-			break;
-		}
+		/*
+		 * Always check for LBW and HBW additional info as the indication itself is
+		 * sometimes missing
+		 */
+		hl_check_for_glbl_errors(hdev);
+		gaudi2_print_pcie_mstr_rr_mstr_if_razwi_info(hdev, event_mask);
 	}
 
 	return error_count;
-- 
2.40.1

