Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F167C6BCE65
	for <lists+dri-devel@lfdr.de>; Thu, 16 Mar 2023 12:37:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3222C10ECAF;
	Thu, 16 Mar 2023 11:37:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4501D10ECAB
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Mar 2023 11:36:55 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id DC21BB820ED;
 Thu, 16 Mar 2023 11:36:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA998C4339E;
 Thu, 16 Mar 2023 11:36:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1678966612;
 bh=KBp9khRfIFEnAh+0IX1vp3rN20E9xNLpYGp92OwePug=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=QIUmGg2eGiwAruKzSAlakJrmc6ByD1rs54OUvFDG++Pzm4s+qFs8Uens0+sropZLm
 lMe/NOZNxoiQ9+vqBzu1beg8uyyNWWPFKF0g+Mcb/Zy52oc/+zjI+VQhPcPMXLHZx0
 W7ecnDcZ7B3+Bunc5yCvNs9+6s4OILhzrs/vax7VCaQKOKyy9UjDjpYU1qaVNlewFM
 OcZ7dGnJ19wWP9xpgXgdYHm2z+OnhuKt5PTCC+sIvaf6B0TbQ99UwauH/FYHGb1SCs
 GpPEDeBzu1fUVljEXbtWN71e+gLFpWFGZolrQTbcMNlHX/xI9NvOMaBYSGAMGf5KHM
 bf9tbSuuU0AFQ==
From: Oded Gabbay <ogabbay@kernel.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 06/10] accel/habanalabs: in {e/p}dma_core events read the err
 cause reg
Date: Thu, 16 Mar 2023 13:36:36 +0200
Message-Id: <20230316113640.499267-6-ogabbay@kernel.org>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230316113640.499267-1-ogabbay@kernel.org>
References: <20230316113640.499267-1-ogabbay@kernel.org>
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
Cc: Dafna Hirschfeld <dhirschfeld@habana.ai>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Dafna Hirschfeld <dhirschfeld@habana.ai>

Since the err_cause register is unprivileged, we should read it from
the driver instead of using the param that came from the FW.

Signed-off-by: Dafna Hirschfeld <dhirschfeld@habana.ai>
Reviewed-by: Oded Gabbay <ogabbay@kernel.org>
Signed-off-by: Oded Gabbay <ogabbay@kernel.org>
---
 drivers/accel/habanalabs/gaudi2/gaudi2.c | 40 +++++++++++++++++++-----
 1 file changed, 33 insertions(+), 7 deletions(-)

diff --git a/drivers/accel/habanalabs/gaudi2/gaudi2.c b/drivers/accel/habanalabs/gaudi2/gaudi2.c
index 224eaafe953f..94d53cd1b0ff 100644
--- a/drivers/accel/habanalabs/gaudi2/gaudi2.c
+++ b/drivers/accel/habanalabs/gaudi2/gaudi2.c
@@ -8689,14 +8689,13 @@ static int gaudi2_handle_kdma_core_event(struct hl_device *hdev, u16 event_type,
 	return error_count;
 }
 
-static int gaudi2_handle_dma_core_event(struct hl_device *hdev, u16 event_type,
-					u64 intr_cause_data)
+static int gaudi2_handle_dma_core_event(struct hl_device *hdev, u16 event_type, int sts_addr)
 {
-	u32 error_count = 0;
+	u32 error_count = 0, sts_val = RREG32(sts_addr);
 	int i;
 
 	for (i = 0 ; i < GAUDI2_NUM_OF_DMA_CORE_INTR_CAUSE ; i++)
-		if (intr_cause_data & BIT(i)) {
+		if (sts_val & BIT(i)) {
 			gaudi2_print_event(hdev, event_type, true,
 				"err cause: %s", gaudi2_dma_core_interrupts_cause[i]);
 			error_count++;
@@ -8707,6 +8706,27 @@ static int gaudi2_handle_dma_core_event(struct hl_device *hdev, u16 event_type,
 	return error_count;
 }
 
+static int gaudi2_handle_pdma_core_event(struct hl_device *hdev, u16 event_type, int pdma_idx)
+{
+	u32 sts_addr;
+
+	sts_addr = mmPDMA0_CORE_ERR_CAUSE + pdma_idx * PDMA_OFFSET;
+	return gaudi2_handle_dma_core_event(hdev, event_type, sts_addr);
+}
+
+static int gaudi2_handle_edma_core_event(struct hl_device *hdev, u16 event_type, int edma_idx)
+{
+	static const int edma_event_index_map[] = {2, 3, 0, 1, 6, 7, 4, 5};
+	u32 sts_addr, index;
+
+	index = edma_event_index_map[edma_idx];
+
+	sts_addr = mmDCORE0_EDMA0_CORE_ERR_CAUSE +
+				DCORE_OFFSET * (index / NUM_OF_EDMA_PER_DCORE) +
+				DCORE_EDMA_OFFSET * (index % NUM_OF_EDMA_PER_DCORE);
+	return gaudi2_handle_dma_core_event(hdev, event_type, sts_addr);
+}
+
 static void gaudi2_print_pcie_mstr_rr_mstr_if_razwi_info(struct hl_device *hdev, u64 *event_mask)
 {
 	u32 mstr_if_base_addr = mmPCIE_MSTR_RR_MSTR_IF_RR_SHRD_HBW_BASE, razwi_happened_addr;
@@ -9524,9 +9544,15 @@ static void gaudi2_handle_eqe(struct hl_device *hdev, struct hl_eq_entry *eq_ent
 		event_mask |= HL_NOTIFIER_EVENT_GENERAL_HW_ERR;
 		break;
 
-	case GAUDI2_EVENT_HDMA2_CORE ... GAUDI2_EVENT_PDMA1_CORE:
-		error_count = gaudi2_handle_dma_core_event(hdev, event_type,
-					le64_to_cpu(eq_entry->intr_cause.intr_cause_data));
+	case GAUDI2_EVENT_HDMA2_CORE ... GAUDI2_EVENT_HDMA5_CORE:
+		index = event_type - GAUDI2_EVENT_HDMA2_CORE;
+		error_count = gaudi2_handle_edma_core_event(hdev, event_type, index);
+		event_mask |= HL_NOTIFIER_EVENT_USER_ENGINE_ERR;
+		break;
+
+	case GAUDI2_EVENT_PDMA0_CORE ... GAUDI2_EVENT_PDMA1_CORE:
+		index = event_type - GAUDI2_EVENT_PDMA0_CORE;
+		error_count = gaudi2_handle_pdma_core_event(hdev, event_type, index);
 		event_mask |= HL_NOTIFIER_EVENT_USER_ENGINE_ERR;
 		break;
 
-- 
2.40.0

