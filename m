Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC382728187
	for <lists+dri-devel@lfdr.de>; Thu,  8 Jun 2023 15:39:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBA8D10E5C2;
	Thu,  8 Jun 2023 13:39:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07F3710E5C1
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Jun 2023 13:39:05 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 60B6B64D9A;
 Thu,  8 Jun 2023 13:39:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6753C433D2;
 Thu,  8 Jun 2023 13:39:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1686231543;
 bh=4V9m4mnF2OraU5/DuHOxAsUUy7WLcLlakAg0H8UcBek=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=QBAjWrw9t0VZ7bJupREs/xh4lIrVcpc01LO4OajXOBycteW92tbfuulth/PDozHUy
 BeHPq7iwkdFvbxVjfICVntevvwnSLjDDOFUxdhLVx3YUjWa0Csz56LvdQ0aaKlsgLh
 mF5zGjVaz1584IhkscRuH0lNq3dHr9kxbrt4mt4vzPdDDTLIEzfmc8c/RboYH2jk3J
 0AjYC1S4RfbsOxseHrCRS8kFi8iQewfWkIUBu7EVZ8WNwimYm90qG1QKlvx4PeVnHC
 QWiV5PnpRfV6DkphnqQFemH0teveu30wM+Jyt9z9IN6PLD067uwZcEeaWQbIBhcz5v
 LyslruGqf2Nfw==
From: Oded Gabbay <ogabbay@kernel.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 07/12] accel/habanalabs: stop fetching MME SBTE error cause
Date: Thu,  8 Jun 2023 16:38:44 +0300
Message-Id: <20230608133849.2739411-7-ogabbay@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230608133849.2739411-1-ogabbay@kernel.org>
References: <20230608133849.2739411-1-ogabbay@kernel.org>
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

Because in this case we have only a single possible cause, we can
safely stop fetching the cause from firmware.

Signed-off-by: Ofir Bitton <obitton@habana.ai>
Reviewed-by: Oded Gabbay <ogabbay@kernel.org>
Signed-off-by: Oded Gabbay <ogabbay@kernel.org>
---
 drivers/accel/habanalabs/gaudi2/gaudi2.c | 31 ++++++------------------
 1 file changed, 8 insertions(+), 23 deletions(-)

diff --git a/drivers/accel/habanalabs/gaudi2/gaudi2.c b/drivers/accel/habanalabs/gaudi2/gaudi2.c
index ed3b0b6225d2..899b1c4b53f6 100644
--- a/drivers/accel/habanalabs/gaudi2/gaudi2.c
+++ b/drivers/accel/habanalabs/gaudi2/gaudi2.c
@@ -66,7 +66,6 @@
 #define GAUDI2_NUM_OF_TPC_INTR_CAUSE		31
 #define GAUDI2_NUM_OF_DEC_ERR_CAUSE		25
 #define GAUDI2_NUM_OF_MME_ERR_CAUSE		16
-#define GAUDI2_NUM_OF_MME_SBTE_ERR_CAUSE	5
 #define GAUDI2_NUM_OF_MME_WAP_ERR_CAUSE		7
 #define GAUDI2_NUM_OF_DMA_CORE_INTR_CAUSE	8
 #define GAUDI2_NUM_OF_MMU_SPI_SEI_CAUSE		19
@@ -916,14 +915,6 @@ static const char * const guadi2_mme_error_cause[GAUDI2_NUM_OF_MME_ERR_CAUSE] =
 	"sbte_prtn_intr_4",
 };
 
-static const char * const guadi2_mme_sbte_error_cause[GAUDI2_NUM_OF_MME_SBTE_ERR_CAUSE] = {
-	"i0",
-	"i1",
-	"i2",
-	"i3",
-	"i4",
-};
-
 static const char * const guadi2_mme_wap_error_cause[GAUDI2_NUM_OF_MME_WAP_ERR_CAUSE] = {
 	"WBC ERR RESP_0",
 	"WBC ERR RESP_1",
@@ -8781,21 +8772,16 @@ static int gaudi2_handle_mme_err(struct hl_device *hdev, u8 mme_index, u16 event
 	return error_count;
 }
 
-static int gaudi2_handle_mme_sbte_err(struct hl_device *hdev, u16 event_type,
-					u64 intr_cause_data)
+static int gaudi2_handle_mme_sbte_err(struct hl_device *hdev, u16 event_type)
 {
-	int i, error_count = 0;
-
-	for (i = 0 ; i < GAUDI2_NUM_OF_MME_SBTE_ERR_CAUSE ; i++)
-		if (intr_cause_data & BIT(i)) {
-			gaudi2_print_event(hdev, event_type, true,
-				"err cause: %s", guadi2_mme_sbte_error_cause[i]);
-			error_count++;
-		}
-
+	/*
+	 * We have a single error cause here but the report mechanism is
+	 * buggy. Hence there is no good reason to fetch the cause so we
+	 * just check for glbl_errors and exit.
+	 */
 	hl_check_for_glbl_errors(hdev);
 
-	return error_count;
+	return GAUDI2_NA_EVENT_CAUSE;
 }
 
 static int gaudi2_handle_mme_wap_err(struct hl_device *hdev, u8 mme_index, u16 event_type,
@@ -9856,8 +9842,7 @@ static void gaudi2_handle_eqe(struct hl_device *hdev, struct hl_eq_entry *eq_ent
 	case GAUDI2_EVENT_MME1_SBTE0_AXI_ERR_RSP ... GAUDI2_EVENT_MME1_SBTE4_AXI_ERR_RSP:
 	case GAUDI2_EVENT_MME2_SBTE0_AXI_ERR_RSP ... GAUDI2_EVENT_MME2_SBTE4_AXI_ERR_RSP:
 	case GAUDI2_EVENT_MME3_SBTE0_AXI_ERR_RSP ... GAUDI2_EVENT_MME3_SBTE4_AXI_ERR_RSP:
-		error_count = gaudi2_handle_mme_sbte_err(hdev, event_type,
-						le64_to_cpu(eq_entry->intr_cause.intr_cause_data));
+		error_count = gaudi2_handle_mme_sbte_err(hdev, event_type);
 		event_mask |= HL_NOTIFIER_EVENT_USER_ENGINE_ERR;
 		break;
 	case GAUDI2_EVENT_VM0_ALARM_A ... GAUDI2_EVENT_VM3_ALARM_B:
-- 
2.40.1

