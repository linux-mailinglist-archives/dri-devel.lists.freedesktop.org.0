Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CDFAC70BBBA
	for <lists+dri-devel@lfdr.de>; Mon, 22 May 2023 13:26:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F26B10E2CF;
	Mon, 22 May 2023 11:26:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DB3310E2CE
 for <dri-devel@lists.freedesktop.org>; Mon, 22 May 2023 11:25:59 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5CECB61B96;
 Mon, 22 May 2023 11:25:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42ECBC4339B;
 Mon, 22 May 2023 11:25:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1684754757;
 bh=R1P2/ucp7TDbsTq4bzrfBRYaCSWtuTrpzzww9c4qIko=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=eU8X6K74sKRMUZS9jBEwchJKBwWoWB6ZcFKY8ccovglwlZITZ0Vhv/NorSMbxgKha
 9+Xs8JEejKhQUvS92w5BHfPnIDJsrCiQhKeM+NOqNdngMU0TmtHGLjhP6NO0VSiraW
 jyI28dU97ixipT2FKqsK4DrhjssVpJpscrHVVD2zbzEaAETb0gXd3cqu+Vc+NjHiZN
 cG8VNXixi+wEXGWIoSAADzy9VlwErEhh1fXKw3bbqAd4cqW6dPsn7/WPYt9pqHQWYp
 ch9wqxaEluwUpoX5feu8PcD+ayAh8e2mo6o7tT7XMiQzNOppVSI69V/ZVJB7O2jec3
 Lp7FVLa7TjaqQ==
From: Oded Gabbay <ogabbay@kernel.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 3/4] accel/habanalabs: fix bug of not fetching addr_dec info
Date: Mon, 22 May 2023 14:25:47 +0300
Message-Id: <20230522112548.1577359-3-ogabbay@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230522112548.1577359-1-ogabbay@kernel.org>
References: <20230522112548.1577359-1-ogabbay@kernel.org>
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

addr_dec info should always be fetched, regardless of cause value.

Signed-off-by: Ofir Bitton <obitton@habana.ai>
Reviewed-by: Oded Gabbay <ogabbay@kernel.org>
Signed-off-by: Oded Gabbay <ogabbay@kernel.org>
---
 drivers/accel/habanalabs/gaudi2/gaudi2.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/accel/habanalabs/gaudi2/gaudi2.c b/drivers/accel/habanalabs/gaudi2/gaudi2.c
index 1cb2b72e1cd2..0d41adf4792c 100644
--- a/drivers/accel/habanalabs/gaudi2/gaudi2.c
+++ b/drivers/accel/habanalabs/gaudi2/gaudi2.c
@@ -8769,6 +8769,9 @@ static int gaudi2_print_pcie_addr_dec_info(struct hl_device *hdev, u16 event_typ
 	u32 error_count = 0;
 	int i;
 
+	gaudi2_print_event(hdev, event_type, true,
+		"intr_cause_data: %#llx", intr_cause_data);
+
 	for (i = 0 ; i < GAUDI2_NUM_OF_PCIE_ADDR_DEC_ERR_CAUSE ; i++) {
 		if (!(intr_cause_data & BIT_ULL(i)))
 			continue;
@@ -8781,10 +8784,11 @@ static int gaudi2_print_pcie_addr_dec_info(struct hl_device *hdev, u16 event_typ
 		 * Always check for LBW and HBW additional info as the indication itself is
 		 * sometimes missing
 		 */
-		hl_check_for_glbl_errors(hdev);
-		gaudi2_print_pcie_mstr_rr_mstr_if_razwi_info(hdev, event_mask);
 	}
 
+	hl_check_for_glbl_errors(hdev);
+	gaudi2_print_pcie_mstr_rr_mstr_if_razwi_info(hdev, event_mask);
+
 	return error_count;
 }
 
-- 
2.40.1

