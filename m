Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 317A270494D
	for <lists+dri-devel@lfdr.de>; Tue, 16 May 2023 11:30:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D31F10E337;
	Tue, 16 May 2023 09:30:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14C2C10E338
 for <dri-devel@lists.freedesktop.org>; Tue, 16 May 2023 09:30:50 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 79CC7636F4;
 Tue, 16 May 2023 09:30:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09BD7C433EF;
 Tue, 16 May 2023 09:30:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1684229448;
 bh=ooReeZ5+kBujY43SDe+Smpl9tq5puUb27DPld+ryF5I=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ShzN8oG6HDWKXMcy7QVXbHfWHws7Un7awqDIHpPI3cOWxFl+objDqcL8yJK+4UoOo
 weqf1tuN1faAEQtq6GAGMacyvGRk/5rmCK+AduoOVq8Mz9oQNKhfdiK/37w1h+gMh1
 pv3+iCNm/IfpR8mlJIseGW/HazRHfrCEWn4Nq8Bzpmf4fJvyx6aDqFDMuxMihAkX+X
 UwsKMR50W8y55mAeLcvlOe4oQaH5f5LPfDyIRsz+VrZt4SznzlMMtl9YWQ7rTtSA74
 gKawkna4Azz4XbvqXmirlNlHc4UISRRTXbFmQol9ENOsDJzL55/+2qvhQxRDXB2xen
 8CVsnvXpJ9mkA==
From: Oded Gabbay <ogabbay@kernel.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 10/12] accel/habanalabs: print qman data on error only for
 lower qman
Date: Tue, 16 May 2023 12:30:28 +0300
Message-Id: <20230516093030.1220526-10-ogabbay@kernel.org>
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
Cc: Tomer Tayar <ttayar@habana.ai>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Tomer Tayar <ttayar@habana.ai>

By default, the upper QMANs are not used, and instead engines ARCs
access the lower QMANs directly.
Errors for upper QMANs are therefore not expected, and the debug print
of the PQ entries is not needed.

Modify the QMAN debug data print on errors to include only information
for the lower QMAN.

Signed-off-by: Tomer Tayar <ttayar@habana.ai>
Reviewed-by: Oded Gabbay <ogabbay@kernel.org>
Signed-off-by: Oded Gabbay <ogabbay@kernel.org>
---
 drivers/accel/habanalabs/gaudi2/gaudi2.c      | 146 +++---------------
 drivers/accel/habanalabs/gaudi2/gaudi2P.h     |   2 +-
 .../include/gaudi2/asic_reg/gaudi2_regs.h     |  11 ++
 3 files changed, 31 insertions(+), 128 deletions(-)

diff --git a/drivers/accel/habanalabs/gaudi2/gaudi2.c b/drivers/accel/habanalabs/gaudi2/gaudi2.c
index 6e2561ead546..4981b8eb0ff5 100644
--- a/drivers/accel/habanalabs/gaudi2/gaudi2.c
+++ b/drivers/accel/habanalabs/gaudi2/gaudi2.c
@@ -7744,137 +7744,28 @@ static bool gaudi2_handle_ecc_event(struct hl_device *hdev, u16 event_type,
 	return !!ecc_data->is_critical;
 }
 
-/*
- * gaudi2_queue_idx_dec - decrement queue index (pi/ci) and handle wrap
- *
- * @idx: the current pi/ci value
- * @q_len: the queue length (power of 2)
- *
- * @return the cyclically decremented index
- */
-static inline u32 gaudi2_queue_idx_dec(u32 idx, u32 q_len)
-{
-	u32 mask = q_len - 1;
-
-	/*
-	 * modular decrement is equivalent to adding (queue_size -1)
-	 * later we take LSBs to make sure the value is in the
-	 * range [0, queue_len - 1]
-	 */
-	return (idx + q_len - 1) & mask;
-}
-
-/**
- * gaudi2_print_sw_config_stream_data - print SW config stream data
- *
- * @hdev: pointer to the habanalabs device structure
- * @stream: the QMAN's stream
- * @qman_base: base address of QMAN registers block
- */
-static void gaudi2_print_sw_config_stream_data(struct hl_device *hdev,
-						u32 stream, u64 qman_base)
+static void print_lower_qman_data_on_err(struct hl_device *hdev, u64 qman_base)
 {
-	u64 cq_ptr_lo, cq_ptr_hi, cq_tsize, cq_ptr;
-	u32 cq_ptr_lo_off, size;
+	u32 lo, hi, cq_ptr_size, arc_cq_ptr_size;
+	u64 cq_ptr, arc_cq_ptr, cp_current_inst;
 
-	cq_ptr_lo_off = mmDCORE0_TPC0_QM_CQ_PTR_LO_1 - mmDCORE0_TPC0_QM_CQ_PTR_LO_0;
-
-	cq_ptr_lo = qman_base + (mmDCORE0_TPC0_QM_CQ_PTR_LO_0 - mmDCORE0_TPC0_QM_BASE) +
-									stream * cq_ptr_lo_off;
-
-	cq_ptr_hi = cq_ptr_lo + (mmDCORE0_TPC0_QM_CQ_PTR_HI_0 - mmDCORE0_TPC0_QM_CQ_PTR_LO_0);
-
-	cq_tsize = cq_ptr_lo + (mmDCORE0_TPC0_QM_CQ_TSIZE_0 - mmDCORE0_TPC0_QM_CQ_PTR_LO_0);
-
-	cq_ptr = (((u64) RREG32(cq_ptr_hi)) << 32) | RREG32(cq_ptr_lo);
-	size = RREG32(cq_tsize);
-	dev_info(hdev->dev, "stop on err: stream: %u, addr: %#llx, size: %x\n",
-		stream, cq_ptr, size);
-}
-
-/**
- * gaudi2_print_last_pqes_on_err - print last PQEs on error
- *
- * @hdev: pointer to the habanalabs device structure
- * @qid_base: first QID of the QMAN (out of 4 streams)
- * @stream: the QMAN's stream
- * @qman_base: base address of QMAN registers block
- * @pr_sw_conf: if true print the SW config stream data (CQ PTR and SIZE)
- */
-static void gaudi2_print_last_pqes_on_err(struct hl_device *hdev, u32 qid_base, u32 stream,
-						u64 qman_base, bool pr_sw_conf)
-{
-	u32 ci, qm_ci_stream_off;
-	struct hl_hw_queue *q;
-	u64 pq_ci;
-	int i;
+	lo = RREG32(qman_base + QM_CQ_PTR_LO_4_OFFSET);
+	hi = RREG32(qman_base + QM_CQ_PTR_HI_4_OFFSET);
+	cq_ptr = ((u64) hi) << 32 | lo;
+	cq_ptr_size = RREG32(qman_base + QM_CQ_TSIZE_4_OFFSET);
 
-	q = &hdev->kernel_queues[qid_base + stream];
-
-	qm_ci_stream_off = mmDCORE0_TPC0_QM_PQ_CI_1 - mmDCORE0_TPC0_QM_PQ_CI_0;
-	pq_ci = qman_base + (mmDCORE0_TPC0_QM_PQ_CI_0 - mmDCORE0_TPC0_QM_BASE) +
-						stream * qm_ci_stream_off;
-
-	hdev->asic_funcs->hw_queues_lock(hdev);
-
-	if (pr_sw_conf)
-		gaudi2_print_sw_config_stream_data(hdev, stream, qman_base);
-
-	ci = RREG32(pq_ci);
-
-	/* we should start printing form ci -1 */
-	ci = gaudi2_queue_idx_dec(ci, HL_QUEUE_LENGTH);
-
-	for (i = 0; i < PQ_FETCHER_CACHE_SIZE; i++) {
-		struct hl_bd *bd;
-		u64 addr;
-		u32 len;
-
-		bd = q->kernel_address;
-		bd += ci;
-
-		len = le32_to_cpu(bd->len);
-		/* len 0 means uninitialized entry- break */
-		if (!len)
-			break;
-
-		addr = le64_to_cpu(bd->ptr);
-
-		dev_info(hdev->dev, "stop on err PQE(stream %u): ci: %u, addr: %#llx, size: %x\n",
-			stream, ci, addr, len);
-
-		/* get previous ci, wrap if needed */
-		ci = gaudi2_queue_idx_dec(ci, HL_QUEUE_LENGTH);
-	}
-
-	hdev->asic_funcs->hw_queues_unlock(hdev);
-}
-
-/**
- * print_qman_data_on_err - extract QMAN data on error
- *
- * @hdev: pointer to the habanalabs device structure
- * @qid_base: first QID of the QMAN (out of 4 streams)
- * @stream: the QMAN's stream
- * @qman_base: base address of QMAN registers block
- *
- * This function attempt to extract as much data as possible on QMAN error.
- * On upper CP print the SW config stream data and last 8 PQEs.
- * On lower CP print SW config data and last PQEs of ALL 4 upper CPs
- */
-static void print_qman_data_on_err(struct hl_device *hdev, u32 qid_base, u32 stream, u64 qman_base)
-{
-	u32 i;
-
-	if (stream != QMAN_STREAMS) {
-		gaudi2_print_last_pqes_on_err(hdev, qid_base, stream, qman_base, true);
-		return;
-	}
+	lo = RREG32(qman_base + QM_ARC_CQ_PTR_LO_OFFSET);
+	hi = RREG32(qman_base + QM_ARC_CQ_PTR_HI_OFFSET);
+	arc_cq_ptr = ((u64) hi) << 32 | lo;
+	arc_cq_ptr_size = RREG32(qman_base + QM_ARC_CQ_TSIZE_OFFSET);
 
-	gaudi2_print_sw_config_stream_data(hdev, stream, qman_base);
+	lo = RREG32(qman_base + QM_CP_CURRENT_INST_LO_4_OFFSET);
+	hi = RREG32(qman_base + QM_CP_CURRENT_INST_HI_4_OFFSET);
+	cp_current_inst = ((u64) hi) << 32 | lo;
 
-	for (i = 0 ; i < QMAN_STREAMS ; i++)
-		gaudi2_print_last_pqes_on_err(hdev, qid_base, i, qman_base, false);
+	dev_info(hdev->dev,
+		"LowerQM. CQ: {ptr %#llx, size %u}, ARC_CQ: {ptr %#llx, size %u}, CP: {instruction %#llx}\n",
+		cq_ptr, cq_ptr_size, arc_cq_ptr, arc_cq_ptr_size, cp_current_inst);
 }
 
 static int gaudi2_handle_qman_err_generic(struct hl_device *hdev, u16 event_type,
@@ -7912,7 +7803,8 @@ static int gaudi2_handle_qman_err_generic(struct hl_device *hdev, u16 event_type
 				error_count++;
 			}
 
-		print_qman_data_on_err(hdev, qid_base, i, qman_base);
+		if (i == QMAN_STREAMS)
+			print_lower_qman_data_on_err(hdev, qman_base);
 	}
 
 	arb_err_val = RREG32(arb_err_addr);
diff --git a/drivers/accel/habanalabs/gaudi2/gaudi2P.h b/drivers/accel/habanalabs/gaudi2/gaudi2P.h
index 1cebe707772e..5f3ce086928e 100644
--- a/drivers/accel/habanalabs/gaudi2/gaudi2P.h
+++ b/drivers/accel/habanalabs/gaudi2/gaudi2P.h
@@ -98,7 +98,7 @@
 #define GAUDI2_DEFAULT_CARD_NAME		"HL225"
 
 #define QMAN_STREAMS				4
-#define PQ_FETCHER_CACHE_SIZE			8
+
 #define NUM_OF_MME_SBTE_PORTS			5
 #define NUM_OF_MME_WB_PORTS			2
 
diff --git a/drivers/accel/habanalabs/include/gaudi2/asic_reg/gaudi2_regs.h b/drivers/accel/habanalabs/include/gaudi2/asic_reg/gaudi2_regs.h
index 6c58af614236..a08378d0802b 100644
--- a/drivers/accel/habanalabs/include/gaudi2/asic_reg/gaudi2_regs.h
+++ b/drivers/accel/habanalabs/include/gaudi2/asic_reg/gaudi2_regs.h
@@ -242,6 +242,17 @@
 #define QM_FENCE2_OFFSET		(mmPDMA0_QM_CP_FENCE2_RDATA_0 - mmPDMA0_QM_BASE)
 #define QM_SEI_STATUS_OFFSET		(mmPDMA0_QM_SEI_STATUS - mmPDMA0_QM_BASE)
 
+#define QM_CQ_PTR_LO_4_OFFSET		(mmPDMA0_QM_CQ_PTR_LO_4 - mmPDMA0_QM_BASE)
+#define QM_CQ_PTR_HI_4_OFFSET		(mmPDMA0_QM_CQ_PTR_HI_4 - mmPDMA0_QM_BASE)
+#define QM_CQ_TSIZE_4_OFFSET		(mmPDMA0_QM_CQ_TSIZE_4 - mmPDMA0_QM_BASE)
+
+#define QM_ARC_CQ_PTR_LO_OFFSET		(mmPDMA0_QM_ARC_CQ_PTR_LO - mmPDMA0_QM_BASE)
+#define QM_ARC_CQ_PTR_HI_OFFSET		(mmPDMA0_QM_ARC_CQ_PTR_HI - mmPDMA0_QM_BASE)
+#define QM_ARC_CQ_TSIZE_OFFSET		(mmPDMA0_QM_ARC_CQ_TSIZE - mmPDMA0_QM_BASE)
+
+#define QM_CP_CURRENT_INST_LO_4_OFFSET	(mmPDMA0_QM_CP_CURRENT_INST_LO_4 - mmPDMA0_QM_BASE)
+#define QM_CP_CURRENT_INST_HI_4_OFFSET	(mmPDMA0_QM_CP_CURRENT_INST_HI_4 - mmPDMA0_QM_BASE)
+
 #define SFT_OFFSET		(mmSFT1_HBW_RTR_IF0_RTR_H3_BASE - mmSFT0_HBW_RTR_IF0_RTR_H3_BASE)
 #define SFT_IF_RTR_OFFSET	(mmSFT0_HBW_RTR_IF1_RTR_H3_BASE - mmSFT0_HBW_RTR_IF0_RTR_H3_BASE)
 
-- 
2.40.1

