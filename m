Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5041A6A6C69
	for <lists+dri-devel@lfdr.de>; Wed,  1 Mar 2023 13:35:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 730A110E243;
	Wed,  1 Mar 2023 12:35:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AD0810E0BB
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Mar 2023 12:35:00 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9A9A5612F3;
 Wed,  1 Mar 2023 12:34:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BF4DC433EF;
 Wed,  1 Mar 2023 12:34:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1677674099;
 bh=DLEnjkpD/ZjuD/B05WZPADVS9XrHrjqIF/jvlAl3sdg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=AFoG7OxbvYeRvZX8lg+1DWuKgl5W3MkrheXUvRkFYh7aozkMmAyxqqdXALTE2ofaf
 MDdhDtfGYGCuKSouwv1CWKB+e39xOd2fXPPr9zg6hYDEg+2520EZqUzKvmp41yRlws
 CViMb401gvgX56SEXCGElciS76RPRTHksOptDIPEKB/v0bPysVEeBzj7nJ/OAVH3p+
 uYTbz3DSXFsZd2GwuIiwoMdmX7eBe6hXS5HjVsAq5a/eTxQKlZUjXfOARqze+BXbhc
 CYZHwv7SDOnHFdNNr2DZuD+Vw6L9ne9wGpdLyHaHKIkRQe5AZGmSNBdJZoJLbD5Lt0
 h5p/EDVBn1xww==
From: Oded Gabbay <ogabbay@kernel.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 3/5] habanalabs/gaudi2: fix register address on PDMA/EDMA idle
 check
Date: Wed,  1 Mar 2023 14:34:48 +0200
Message-Id: <20230301123450.4127848-3-ogabbay@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230301123450.4127848-1-ogabbay@kernel.org>
References: <20230301123450.4127848-1-ogabbay@kernel.org>
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

The PDMA/EDMA is_idle routines didn't check the correct CORE register
in order to get the accurate idle state.
Moreover, it's better to make the is_idle routine more robust by adding
additional checks (IS_HALTED) before announcing that the core is idle.

Signed-off-by: Koby Elbaz <kelbaz@habana.ai>
Reviewed-by: Oded Gabbay <ogabbay@kernel.org>
Signed-off-by: Oded Gabbay <ogabbay@kernel.org>
---
 drivers/accel/habanalabs/gaudi2/gaudi2.c | 44 ++++++++++++------------
 1 file changed, 22 insertions(+), 22 deletions(-)

diff --git a/drivers/accel/habanalabs/gaudi2/gaudi2.c b/drivers/accel/habanalabs/gaudi2/gaudi2.c
index 2186f8bd547e..58e3bffb8c25 100644
--- a/drivers/accel/habanalabs/gaudi2/gaudi2.c
+++ b/drivers/accel/habanalabs/gaudi2/gaudi2.c
@@ -86,10 +86,11 @@
 
 #define KDMA_TIMEOUT_USEC			USEC_PER_SEC
 
-#define IS_DMA_IDLE(dma_core_idle_ind_mask)	\
-	(!((dma_core_idle_ind_mask) &		\
-	((DCORE0_EDMA0_CORE_IDLE_IND_MASK_DESC_CNT_STS_MASK) | \
-	(DCORE0_EDMA0_CORE_IDLE_IND_MASK_COMP_MASK))))
+#define IS_DMA_IDLE(dma_core_sts0)	\
+	(!((dma_core_sts0) & (DCORE0_EDMA0_CORE_STS0_BUSY_MASK)))
+
+#define IS_DMA_HALTED(dma_core_sts1)	\
+	((dma_core_sts1) & (DCORE0_EDMA0_CORE_STS1_IS_HALT_MASK))
 
 #define IS_MME_IDLE(mme_arch_sts) (((mme_arch_sts) & MME_ARCH_IDLE_MASK) == MME_ARCH_IDLE_MASK)
 
@@ -6677,18 +6678,18 @@ static int gaudi2_compute_reset_late_init(struct hl_device *hdev)
 static bool gaudi2_get_edma_idle_status(struct hl_device *hdev, u64 *mask_arr, u8 mask_len,
 		struct engines_data *e)
 {
-	u32 qm_glbl_sts0, qm_glbl_sts1, qm_cgm_sts, dma_core_idle_ind_mask;
+	u32 qm_glbl_sts0, qm_glbl_sts1, qm_cgm_sts, dma_core_sts0, dma_core_sts1;
 	struct asic_fixed_properties *prop = &hdev->asic_prop;
 	unsigned long *mask = (unsigned long *) mask_arr;
-	const char *edma_fmt = "%-6d%-6d%-9s%#-14x%#x\n";
+	const char *edma_fmt = "%-6d%-6d%-9s%#-14x%#-15x%#x\n";
 	bool is_idle = true, is_eng_idle;
 	int engine_idx, i, j;
 	u64 offset;
 
 	if (e)
 		hl_engine_data_sprintf(e,
-			"\nCORE  EDMA  is_idle  QM_GLBL_STS0  DMA_CORE_IDLE_IND_MASK\n"
-			"----  ----  -------  ------------  ----------------------\n");
+			"\nCORE  EDMA  is_idle  QM_GLBL_STS0  DMA_CORE_STS0  DMA_CORE_STS1\n"
+			"----  ----  -------  ------------  -------------  -------------\n");
 
 	for (i = 0; i < NUM_OF_DCORES; i++) {
 		for (j = 0 ; j < NUM_OF_EDMA_PER_DCORE ; j++) {
@@ -6701,25 +6702,23 @@ static bool gaudi2_get_edma_idle_status(struct hl_device *hdev, u64 *mask_arr, u
 					i * GAUDI2_ENGINE_ID_DCORE_OFFSET + j;
 			offset = i * DCORE_OFFSET + j * DCORE_EDMA_OFFSET;
 
-			dma_core_idle_ind_mask =
-			RREG32(mmDCORE0_EDMA0_CORE_IDLE_IND_MASK + offset);
+			dma_core_sts0 = RREG32(mmDCORE0_EDMA0_CORE_STS0 + offset);
+			dma_core_sts1 = RREG32(mmDCORE0_EDMA0_CORE_STS1 + offset);
 
 			qm_glbl_sts0 = RREG32(mmDCORE0_EDMA0_QM_GLBL_STS0 + offset);
 			qm_glbl_sts1 = RREG32(mmDCORE0_EDMA0_QM_GLBL_STS1 + offset);
 			qm_cgm_sts = RREG32(mmDCORE0_EDMA0_QM_CGM_STS + offset);
 
 			is_eng_idle = IS_QM_IDLE(qm_glbl_sts0, qm_glbl_sts1, qm_cgm_sts) &&
-					IS_DMA_IDLE(dma_core_idle_ind_mask);
+					IS_DMA_IDLE(dma_core_sts0) && !IS_DMA_HALTED(dma_core_sts1);
 			is_idle &= is_eng_idle;
 
 			if (mask && !is_eng_idle)
 				set_bit(engine_idx, mask);
 
 			if (e)
-				hl_engine_data_sprintf(e, edma_fmt, i, j,
-							is_eng_idle ? "Y" : "N",
-							qm_glbl_sts0,
-							dma_core_idle_ind_mask);
+				hl_engine_data_sprintf(e, edma_fmt, i, j, is_eng_idle ? "Y" : "N",
+							qm_glbl_sts0, dma_core_sts0, dma_core_sts1);
 		}
 	}
 
@@ -6729,29 +6728,30 @@ static bool gaudi2_get_edma_idle_status(struct hl_device *hdev, u64 *mask_arr, u
 static bool gaudi2_get_pdma_idle_status(struct hl_device *hdev, u64 *mask_arr, u8 mask_len,
 		struct engines_data *e)
 {
-	u32 qm_glbl_sts0, qm_glbl_sts1, qm_cgm_sts, dma_core_idle_ind_mask;
+	u32 qm_glbl_sts0, qm_glbl_sts1, qm_cgm_sts, dma_core_sts0, dma_core_sts1;
 	unsigned long *mask = (unsigned long *) mask_arr;
-	const char *pdma_fmt = "%-6d%-9s%#-14x%#x\n";
+	const char *pdma_fmt = "%-6d%-9s%#-14x%#-15x%#x\n";
 	bool is_idle = true, is_eng_idle;
 	int engine_idx, i;
 	u64 offset;
 
 	if (e)
 		hl_engine_data_sprintf(e,
-					"\nPDMA  is_idle  QM_GLBL_STS0  DMA_CORE_IDLE_IND_MASK\n"
-					"----  -------  ------------  ----------------------\n");
+					"\nPDMA  is_idle  QM_GLBL_STS0  DMA_CORE_STS0  DMA_CORE_STS1\n"
+					"----  -------  ------------  -------------  -------------\n");
 
 	for (i = 0 ; i < NUM_OF_PDMA ; i++) {
 		engine_idx = GAUDI2_ENGINE_ID_PDMA_0 + i;
 		offset = i * PDMA_OFFSET;
-		dma_core_idle_ind_mask = RREG32(mmPDMA0_CORE_IDLE_IND_MASK + offset);
+		dma_core_sts0 = RREG32(mmPDMA0_CORE_STS0 + offset);
+		dma_core_sts1 = RREG32(mmPDMA0_CORE_STS1 + offset);
 
 		qm_glbl_sts0 = RREG32(mmPDMA0_QM_GLBL_STS0 + offset);
 		qm_glbl_sts1 = RREG32(mmPDMA0_QM_GLBL_STS1 + offset);
 		qm_cgm_sts = RREG32(mmPDMA0_QM_CGM_STS + offset);
 
 		is_eng_idle = IS_QM_IDLE(qm_glbl_sts0, qm_glbl_sts1, qm_cgm_sts) &&
-				IS_DMA_IDLE(dma_core_idle_ind_mask);
+				IS_DMA_IDLE(dma_core_sts0) && !IS_DMA_HALTED(dma_core_sts1);
 		is_idle &= is_eng_idle;
 
 		if (mask && !is_eng_idle)
@@ -6759,7 +6759,7 @@ static bool gaudi2_get_pdma_idle_status(struct hl_device *hdev, u64 *mask_arr, u
 
 		if (e)
 			hl_engine_data_sprintf(e, pdma_fmt, i, is_eng_idle ? "Y" : "N",
-						qm_glbl_sts0, dma_core_idle_ind_mask);
+						qm_glbl_sts0, dma_core_sts0, dma_core_sts1);
 	}
 
 	return is_idle;
-- 
2.39.2

