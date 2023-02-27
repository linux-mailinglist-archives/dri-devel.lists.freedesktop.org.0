Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA9506A405B
	for <lists+dri-devel@lfdr.de>; Mon, 27 Feb 2023 12:13:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEB4810E3B9;
	Mon, 27 Feb 2023 11:13:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 838E110E3B9
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Feb 2023 11:13:17 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 24F63B80C94;
 Mon, 27 Feb 2023 11:13:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B476DC433D2;
 Mon, 27 Feb 2023 11:13:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1677496394;
 bh=3HA4UDfmacoAKX3rqCOb6ySEtFxApwvHCs+X2CaNP44=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=KnlhGzpRXzaIJ+YT9i9CBy2psuLaLrE+i+v5s5IoC5imR+jh5bRhLG4kBNYjrp9ow
 URusC+D7Pm5anJTgWQLHqGxYJE8X08crLQgb2FMBwGixoeaeaWUHK2ZKAQ3aoiBuBd
 k1jAbp9L1VmI6Joj8RhuuBeo79MpvMfEQp3fgSbvktJMV0g5PxdYlvGQb/VxonyNbn
 4gMrV6Wbw+Y+FiVm+Xkz0dDa8MgmXusQEqww18TuK9Vp161GxFkOtzuW+J0mkw6/+s
 aHX5olrFUKocprnWBAmGm+uSWpl3YYX8kEkxoTeLpMMUKdL6WcdvLEyV4SWYpDQ6YH
 dSlNf9DEzxlug==
From: Oded Gabbay <ogabbay@kernel.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 3/6] habanalabs/gaudi2: break is_idle function into per-engine
 sub-routines
Date: Mon, 27 Feb 2023 13:13:03 +0200
Message-Id: <20230227111306.3985896-3-ogabbay@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230227111306.3985896-1-ogabbay@kernel.org>
References: <20230227111306.3985896-1-ogabbay@kernel.org>
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

is_idle() was too long, so break it up for readability.
In addition, we can now use the new sub-routines from other places.

Signed-off-by: Koby Elbaz <kelbaz@habana.ai>
Reviewed-by: Oded Gabbay <ogabbay@kernel.org>
Signed-off-by: Oded Gabbay <ogabbay@kernel.org>
---
 drivers/accel/habanalabs/gaudi2/gaudi2.c | 212 ++++++++++++++++-------
 1 file changed, 146 insertions(+), 66 deletions(-)

diff --git a/drivers/accel/habanalabs/gaudi2/gaudi2.c b/drivers/accel/habanalabs/gaudi2/gaudi2.c
index 2021ef9d4702..82448edfdfa0 100644
--- a/drivers/accel/habanalabs/gaudi2/gaudi2.c
+++ b/drivers/accel/habanalabs/gaudi2/gaudi2.c
@@ -6651,70 +6651,17 @@ static int gaudi2_compute_reset_late_init(struct hl_device *hdev)
 	return hl_fw_unmask_irq_arr(hdev, gaudi2->hw_events, irq_arr_size);
 }
 
-static void gaudi2_is_tpc_engine_idle(struct hl_device *hdev, int dcore, int inst, u32 offset,
-					struct iterate_module_ctx *ctx)
-{
-	struct gaudi2_tpc_idle_data *idle_data = ctx->data;
-	u32 tpc_cfg_sts, qm_glbl_sts0, qm_glbl_sts1, qm_cgm_sts;
-	bool is_eng_idle;
-	int engine_idx;
-
-	if ((dcore == 0) && (inst == (NUM_DCORE0_TPC - 1)))
-		engine_idx = GAUDI2_DCORE0_ENGINE_ID_TPC_6;
-	else
-		engine_idx = GAUDI2_DCORE0_ENGINE_ID_TPC_0 +
-				dcore * GAUDI2_ENGINE_ID_DCORE_OFFSET + inst;
-
-	tpc_cfg_sts = RREG32(mmDCORE0_TPC0_CFG_STATUS + offset);
-	qm_glbl_sts0 = RREG32(mmDCORE0_TPC0_QM_GLBL_STS0 + offset);
-	qm_glbl_sts1 = RREG32(mmDCORE0_TPC0_QM_GLBL_STS1 + offset);
-	qm_cgm_sts = RREG32(mmDCORE0_TPC0_QM_CGM_STS + offset);
-
-	is_eng_idle = IS_QM_IDLE(qm_glbl_sts0, qm_glbl_sts1, qm_cgm_sts) &&
-						IS_TPC_IDLE(tpc_cfg_sts);
-	*(idle_data->is_idle) &= is_eng_idle;
-
-	if (idle_data->mask && !is_eng_idle)
-		set_bit(engine_idx, idle_data->mask);
-
-	if (idle_data->e)
-		hl_engine_data_sprintf(idle_data->e,
-					idle_data->tpc_fmt, dcore, inst,
-					is_eng_idle ? "Y" : "N",
-					qm_glbl_sts0, qm_cgm_sts, tpc_cfg_sts);
-}
-
-static bool gaudi2_is_device_idle(struct hl_device *hdev, u64 *mask_arr, u8 mask_len,
-					struct engines_data *e)
+static bool gaudi2_get_edma_idle_status(struct hl_device *hdev, u64 *mask_arr, u8 mask_len,
+		struct engines_data *e)
 {
-	u32 qm_glbl_sts0, qm_glbl_sts1, qm_cgm_sts, dma_core_idle_ind_mask,
-		mme_arch_sts, dec_swreg15, dec_enabled_bit;
+	u32 qm_glbl_sts0, qm_glbl_sts1, qm_cgm_sts, dma_core_idle_ind_mask;
 	struct asic_fixed_properties *prop = &hdev->asic_prop;
-	const char *rot_fmt = "%-6d%-5d%-9s%#-14x%#-12x%s\n";
 	unsigned long *mask = (unsigned long *) mask_arr;
 	const char *edma_fmt = "%-6d%-6d%-9s%#-14x%#x\n";
-	const char *mme_fmt = "%-5d%-6s%-9s%#-14x%#x\n";
-	const char *nic_fmt = "%-5d%-9s%#-14x%#-12x\n";
-	const char *pdma_fmt = "%-6d%-9s%#-14x%#x\n";
-	const char *pcie_dec_fmt = "%-10d%-9s%#x\n";
-	const char *dec_fmt = "%-6d%-5d%-9s%#x\n";
 	bool is_idle = true, is_eng_idle;
-	u64 offset;
-
-	struct gaudi2_tpc_idle_data tpc_idle_data = {
-		.tpc_fmt = "%-6d%-5d%-9s%#-14x%#-12x%#x\n",
-		.e = e,
-		.mask = mask,
-		.is_idle = &is_idle,
-	};
-	struct iterate_module_ctx tpc_iter = {
-		.fn = &gaudi2_is_tpc_engine_idle,
-		.data = &tpc_idle_data,
-	};
-
 	int engine_idx, i, j;
+	u64 offset;
 
-	/* EDMA, Two engines per Dcore */
 	if (e)
 		hl_engine_data_sprintf(e,
 			"\nCORE  EDMA  is_idle  QM_GLBL_STS0  DMA_CORE_IDLE_IND_MASK\n"
@@ -6753,7 +6700,19 @@ static bool gaudi2_is_device_idle(struct hl_device *hdev, u64 *mask_arr, u8 mask
 		}
 	}
 
-	/* PDMA, Two engines in Full chip */
+	return is_idle;
+}
+
+static bool gaudi2_get_pdma_idle_status(struct hl_device *hdev, u64 *mask_arr, u8 mask_len,
+		struct engines_data *e)
+{
+	u32 qm_glbl_sts0, qm_glbl_sts1, qm_cgm_sts, dma_core_idle_ind_mask;
+	unsigned long *mask = (unsigned long *) mask_arr;
+	const char *pdma_fmt = "%-6d%-9s%#-14x%#x\n";
+	bool is_idle = true, is_eng_idle;
+	int engine_idx, i;
+	u64 offset;
+
 	if (e)
 		hl_engine_data_sprintf(e,
 					"\nPDMA  is_idle  QM_GLBL_STS0  DMA_CORE_IDLE_IND_MASK\n"
@@ -6780,6 +6739,19 @@ static bool gaudi2_is_device_idle(struct hl_device *hdev, u64 *mask_arr, u8 mask
 						qm_glbl_sts0, dma_core_idle_ind_mask);
 	}
 
+	return is_idle;
+}
+
+static bool gaudi2_get_nic_idle_status(struct hl_device *hdev, u64 *mask_arr, u8 mask_len,
+		struct engines_data *e)
+{
+	unsigned long *mask = (unsigned long *) mask_arr;
+	const char *nic_fmt = "%-5d%-9s%#-14x%#-12x\n";
+	u32 qm_glbl_sts0, qm_glbl_sts1, qm_cgm_sts;
+	bool is_idle = true, is_eng_idle;
+	int engine_idx, i;
+	u64 offset;
+
 	/* NIC, twelve macros in Full chip */
 	if (e && hdev->nic_ports_mask)
 		hl_engine_data_sprintf(e,
@@ -6813,6 +6785,19 @@ static bool gaudi2_is_device_idle(struct hl_device *hdev, u64 *mask_arr, u8 mask
 						qm_glbl_sts0, qm_cgm_sts);
 	}
 
+	return is_idle;
+}
+
+static bool gaudi2_get_mme_idle_status(struct hl_device *hdev, u64 *mask_arr, u8 mask_len,
+		struct engines_data *e)
+{
+	u32 qm_glbl_sts0, qm_glbl_sts1, qm_cgm_sts, mme_arch_sts;
+	unsigned long *mask = (unsigned long *) mask_arr;
+	const char *mme_fmt = "%-5d%-6s%-9s%#-14x%#x\n";
+	bool is_idle = true, is_eng_idle;
+	int engine_idx, i;
+	u64 offset;
+
 	if (e)
 		hl_engine_data_sprintf(e,
 					"\nMME  Stub  is_idle  QM_GLBL_STS0  MME_ARCH_STATUS\n"
@@ -6843,16 +6828,82 @@ static bool gaudi2_is_device_idle(struct hl_device *hdev, u64 *mask_arr, u8 mask
 			set_bit(engine_idx, mask);
 	}
 
-	/*
-	 * TPC
-	 */
+	return is_idle;
+}
+
+static void gaudi2_is_tpc_engine_idle(struct hl_device *hdev, int dcore, int inst, u32 offset,
+					struct iterate_module_ctx *ctx)
+{
+	struct gaudi2_tpc_idle_data *idle_data = ctx->data;
+	u32 tpc_cfg_sts, qm_glbl_sts0, qm_glbl_sts1, qm_cgm_sts;
+	bool is_eng_idle;
+	int engine_idx;
+
+	if ((dcore == 0) && (inst == (NUM_DCORE0_TPC - 1)))
+		engine_idx = GAUDI2_DCORE0_ENGINE_ID_TPC_6;
+	else
+		engine_idx = GAUDI2_DCORE0_ENGINE_ID_TPC_0 +
+				dcore * GAUDI2_ENGINE_ID_DCORE_OFFSET + inst;
+
+	tpc_cfg_sts = RREG32(mmDCORE0_TPC0_CFG_STATUS + offset);
+	qm_glbl_sts0 = RREG32(mmDCORE0_TPC0_QM_GLBL_STS0 + offset);
+	qm_glbl_sts1 = RREG32(mmDCORE0_TPC0_QM_GLBL_STS1 + offset);
+	qm_cgm_sts = RREG32(mmDCORE0_TPC0_QM_CGM_STS + offset);
+
+	is_eng_idle = IS_QM_IDLE(qm_glbl_sts0, qm_glbl_sts1, qm_cgm_sts) &&
+						IS_TPC_IDLE(tpc_cfg_sts);
+	*(idle_data->is_idle) &= is_eng_idle;
+
+	if (idle_data->mask && !is_eng_idle)
+		set_bit(engine_idx, idle_data->mask);
+
+	if (idle_data->e)
+		hl_engine_data_sprintf(idle_data->e,
+					idle_data->tpc_fmt, dcore, inst,
+					is_eng_idle ? "Y" : "N",
+					qm_glbl_sts0, qm_cgm_sts, tpc_cfg_sts);
+}
+
+static bool gaudi2_get_tpc_idle_status(struct hl_device *hdev, u64 *mask_arr, u8 mask_len,
+		struct engines_data *e)
+{
+	struct asic_fixed_properties *prop = &hdev->asic_prop;
+	unsigned long *mask = (unsigned long *) mask_arr;
+	bool is_idle = true;
+
+	struct gaudi2_tpc_idle_data tpc_idle_data = {
+		.tpc_fmt = "%-6d%-5d%-9s%#-14x%#-12x%#x\n",
+		.e = e,
+		.mask = mask,
+		.is_idle = &is_idle,
+	};
+	struct iterate_module_ctx tpc_iter = {
+		.fn = &gaudi2_is_tpc_engine_idle,
+		.data = &tpc_idle_data,
+	};
+
 	if (e && prop->tpc_enabled_mask)
 		hl_engine_data_sprintf(e,
-			"\nCORE  TPC   is_idle  QM_GLBL_STS0  QM_CGM_STS  DMA_CORE_IDLE_IND_MASK\n"
-			"----  ---  --------  ------------  ----------  ----------------------\n");
+			"\nCORE  TPC  is_idle  QM_GLBL_STS0  QM_CGM_STS  STATUS\n"
+			"----  ---  -------  ------------  ----------  ------\n");
 
 	gaudi2_iterate_tpcs(hdev, &tpc_iter);
 
+	return tpc_idle_data.is_idle;
+}
+
+static bool gaudi2_get_decoder_idle_status(struct hl_device *hdev, u64 *mask_arr, u8 mask_len,
+		struct engines_data *e)
+{
+	struct asic_fixed_properties *prop = &hdev->asic_prop;
+	unsigned long *mask = (unsigned long *) mask_arr;
+	const char *pcie_dec_fmt = "%-10d%-9s%#x\n";
+	const char *dec_fmt = "%-6d%-5d%-9s%#x\n";
+	bool is_idle = true, is_eng_idle;
+	u32 dec_swreg15, dec_enabled_bit;
+	int engine_idx, i, j;
+	u64 offset;
+
 	/* Decoders, two each Dcore and two shared PCIe decoders */
 	if (e && (prop->decoder_enabled_mask & (~PCIE_DEC_EN_MASK)))
 		hl_engine_data_sprintf(e,
@@ -6907,10 +6958,23 @@ static bool gaudi2_is_device_idle(struct hl_device *hdev, u64 *mask_arr, u8 mask
 						is_eng_idle ? "Y" : "N", dec_swreg15);
 	}
 
+	return is_idle;
+}
+
+static bool gaudi2_get_rotator_idle_status(struct hl_device *hdev, u64 *mask_arr, u8 mask_len,
+		struct engines_data *e)
+{
+	const char *rot_fmt = "%-6d%-5d%-9s%#-14x%#-14x%#x\n";
+	unsigned long *mask = (unsigned long *) mask_arr;
+	u32 qm_glbl_sts0, qm_glbl_sts1, qm_cgm_sts;
+	bool is_idle = true, is_eng_idle;
+	int engine_idx, i;
+	u64 offset;
+
 	if (e)
 		hl_engine_data_sprintf(e,
-			"\nCORE  ROT  is_idle  QM_GLBL_STS0  QM_CGM_STS  DMA_CORE_STS0\n"
-			"----  ----  -------  ------------  ----------  -------------\n");
+			"\nCORE  ROT  is_idle  QM_GLBL_STS0  QM_GLBL_STS1  QM_CGM_STS\n"
+			"----  ---  -------  ------------  ------------  ----------\n");
 
 	for (i = 0 ; i < NUM_OF_ROT ; i++) {
 		engine_idx = GAUDI2_ENGINE_ID_ROT_0 + i;
@@ -6929,12 +6993,28 @@ static bool gaudi2_is_device_idle(struct hl_device *hdev, u64 *mask_arr, u8 mask
 
 		if (e)
 			hl_engine_data_sprintf(e, rot_fmt, i, 0, is_eng_idle ? "Y" : "N",
-					qm_glbl_sts0, qm_cgm_sts, "-");
+						qm_glbl_sts0, qm_glbl_sts1, qm_cgm_sts);
 	}
 
 	return is_idle;
 }
 
+bool gaudi2_is_device_idle(struct hl_device *hdev, u64 *mask_arr, u8 mask_len,
+					struct engines_data *e)
+{
+	bool is_idle = true;
+
+	is_idle &= gaudi2_get_edma_idle_status(hdev, mask_arr, mask_len, e);
+	is_idle &= gaudi2_get_pdma_idle_status(hdev, mask_arr, mask_len, e);
+	is_idle &= gaudi2_get_nic_idle_status(hdev, mask_arr, mask_len, e);
+	is_idle &= gaudi2_get_mme_idle_status(hdev, mask_arr, mask_len, e);
+	is_idle &= gaudi2_get_tpc_idle_status(hdev, mask_arr, mask_len, e);
+	is_idle &= gaudi2_get_decoder_idle_status(hdev, mask_arr, mask_len, e);
+	is_idle &= gaudi2_get_rotator_idle_status(hdev, mask_arr, mask_len, e);
+
+	return is_idle;
+}
+
 static void gaudi2_hw_queues_lock(struct hl_device *hdev)
 	__acquires(&gaudi2->hw_queues_lock)
 {
-- 
2.39.2

