Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C87970494F
	for <lists+dri-devel@lfdr.de>; Tue, 16 May 2023 11:30:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 986B510E339;
	Tue, 16 May 2023 09:30:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D37310E332
 for <dri-devel@lists.freedesktop.org>; Tue, 16 May 2023 09:30:44 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9136E61943;
 Tue, 16 May 2023 09:30:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1EA7FC433AA;
 Tue, 16 May 2023 09:30:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1684229443;
 bh=cy7OeZLQUgf4kW2LuGZxOx3z1sBFlRSM3kzL86KSvDA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=sTVutRy6X+PjdOrOeEUzePZQdsjjp0mlWN2Qg8DFVVPKmRZW/v69lzU8GtVmuP3+e
 uzLx1DsnyWBneBb233bfad+Rf04a3SfKu7zOe5noyOiI4YIk4FO4xNR+h1ZZPnGeaE
 EVYGSNBrjE888/nA5UWJ5xt7bTeiCXUUVRl6kvETeNpMIXwe1v2Cjo8QHniYEZ2dK2
 PPKQJXkj9Ak0d2CHyIfyvSqMwIPq6ZJAWSdV3y1re9Q5FsJMhZaEb0X6f3D/y/ryFJ
 Yry4JFt9EjLbGCxcN/A0s74BBJYyYT/tYaT8OuedDhFRkNnQUDYNHjlMgOz0+RGj8k
 SNcYWWm+1c+LA==
From: Oded Gabbay <ogabbay@kernel.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 06/12] accel/habanalabs: upon DMA errors,
 use FW-extracted error cause
Date: Tue, 16 May 2023 12:30:24 +0300
Message-Id: <20230516093030.1220526-6-ogabbay@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230516093030.1220526-1-ogabbay@kernel.org>
References: <20230516093030.1220526-1-ogabbay@kernel.org>
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
Cc: Koby Elbaz <kelbaz@habana.ai>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Koby Elbaz <kelbaz@habana.ai>

Initially, the driver used to read the error cause data directly from
the ASIC. However, the FW now clears it before the driver could read
it. Therefore we should use the error cause data that is extracted by
the FW.

Signed-off-by: Koby Elbaz <kelbaz@habana.ai>
Reviewed-by: Oded Gabbay <ogabbay@kernel.org>
Signed-off-by: Oded Gabbay <ogabbay@kernel.org>
---
 drivers/accel/habanalabs/gaudi2/gaudi2.c | 37 +++++-------------------
 1 file changed, 8 insertions(+), 29 deletions(-)

diff --git a/drivers/accel/habanalabs/gaudi2/gaudi2.c b/drivers/accel/habanalabs/gaudi2/gaudi2.c
index e900017f4ff7..b8644d87f817 100644
--- a/drivers/accel/habanalabs/gaudi2/gaudi2.c
+++ b/drivers/accel/habanalabs/gaudi2/gaudi2.c
@@ -8807,13 +8807,13 @@ static int gaudi2_handle_kdma_core_event(struct hl_device *hdev, u16 event_type,
 	return error_count;
 }
 
-static int gaudi2_handle_dma_core_event(struct hl_device *hdev, u16 event_type, int sts_addr)
+static int gaudi2_handle_dma_core_event(struct hl_device *hdev, u16 event_type, u64 intr_cause)
 {
-	u32 error_count = 0, sts_val = RREG32(sts_addr);
+	u32 error_count = 0;
 	int i;
 
 	for (i = 0 ; i < GAUDI2_NUM_OF_DMA_CORE_INTR_CAUSE ; i++)
-		if (sts_val & BIT(i)) {
+		if (intr_cause & BIT(i)) {
 			gaudi2_print_event(hdev, event_type, true,
 				"err cause: %s", gaudi2_dma_core_interrupts_cause[i]);
 			error_count++;
@@ -8824,27 +8824,6 @@ static int gaudi2_handle_dma_core_event(struct hl_device *hdev, u16 event_type,
 	return error_count;
 }
 
-static int gaudi2_handle_pdma_core_event(struct hl_device *hdev, u16 event_type, int pdma_idx)
-{
-	u32 sts_addr;
-
-	sts_addr = mmPDMA0_CORE_ERR_CAUSE + pdma_idx * PDMA_OFFSET;
-	return gaudi2_handle_dma_core_event(hdev, event_type, sts_addr);
-}
-
-static int gaudi2_handle_edma_core_event(struct hl_device *hdev, u16 event_type, int edma_idx)
-{
-	static const int edma_event_index_map[] = {2, 3, 0, 1, 6, 7, 4, 5};
-	u32 sts_addr, index;
-
-	index = edma_event_index_map[edma_idx];
-
-	sts_addr = mmDCORE0_EDMA0_CORE_ERR_CAUSE +
-				DCORE_OFFSET * (index / NUM_OF_EDMA_PER_DCORE) +
-				DCORE_EDMA_OFFSET * (index % NUM_OF_EDMA_PER_DCORE);
-	return gaudi2_handle_dma_core_event(hdev, event_type, sts_addr);
-}
-
 static void gaudi2_print_pcie_mstr_rr_mstr_if_razwi_info(struct hl_device *hdev, u64 *event_mask)
 {
 	u32 mstr_if_base_addr = mmPCIE_MSTR_RR_MSTR_IF_RR_SHRD_HBW_BASE, razwi_happened_addr;
@@ -9725,19 +9704,19 @@ static void gaudi2_handle_eqe(struct hl_device *hdev, struct hl_eq_entry *eq_ent
 	case GAUDI2_EVENT_KDMA_CH0_AXI_ERR_RSP:
 	case GAUDI2_EVENT_KDMA0_CORE:
 		error_count = gaudi2_handle_kdma_core_event(hdev, event_type,
-					le64_to_cpu(eq_entry->intr_cause.intr_cause_data));
+				le64_to_cpu(eq_entry->intr_cause.intr_cause_data));
 		event_mask |= HL_NOTIFIER_EVENT_GENERAL_HW_ERR;
 		break;
 
 	case GAUDI2_EVENT_HDMA2_CORE ... GAUDI2_EVENT_HDMA5_CORE:
-		index = event_type - GAUDI2_EVENT_HDMA2_CORE;
-		error_count = gaudi2_handle_edma_core_event(hdev, event_type, index);
+		error_count = gaudi2_handle_dma_core_event(hdev, event_type,
+				le64_to_cpu(eq_entry->intr_cause.intr_cause_data));
 		event_mask |= HL_NOTIFIER_EVENT_USER_ENGINE_ERR;
 		break;
 
 	case GAUDI2_EVENT_PDMA0_CORE ... GAUDI2_EVENT_PDMA1_CORE:
-		index = event_type - GAUDI2_EVENT_PDMA0_CORE;
-		error_count = gaudi2_handle_pdma_core_event(hdev, event_type, index);
+		error_count = gaudi2_handle_dma_core_event(hdev, event_type,
+				le64_to_cpu(eq_entry->intr_cause.intr_cause_data));
 		event_mask |= HL_NOTIFIER_EVENT_USER_ENGINE_ERR;
 		break;
 
-- 
2.40.1

