Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 822296BCE62
	for <lists+dri-devel@lfdr.de>; Thu, 16 Mar 2023 12:37:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8891210ECAB;
	Thu, 16 Mar 2023 11:37:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE03910ECAB
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Mar 2023 11:36:57 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 360F861FDF;
 Thu, 16 Mar 2023 11:36:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6FC5C433EF;
 Thu, 16 Mar 2023 11:36:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1678966616;
 bh=viLl54Uy0wuPZRG1trDxvPd8IJCSu5zoT8+cLeZfoQY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=NhqUIvSQhQUPh7XiIkQ9c85U7HGZpF5WN21r5IxMptEI64fpOnZ1Vk4tgNX2SNvVO
 mJu4RHZ76TKtSy5zmX2cz07ezQ3m96PIR43NIKi7xAhwPvhBe8JhXFKT0phjRcHnB4
 WqrxYs1j1R7/nrU0hzrwNyYBf4A+4mcDjt/972/E5MdGFntaLCIbGhGDGNTuk/3TqD
 9FjN/T8X6dV8vFNTxwVOJwfEZCfCac7pWCUd9speVTqqflfUDUfsfWvY7TIzxm7LIA
 IRG1tkf3whJ+cOtkyiXtMQlqCSHCYnb50MCn9IjXXYp8FVy6Z8CQL2tUu+dKK9QQEB
 3QUlSWghwk0tg==
From: Oded Gabbay <ogabbay@kernel.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 09/10] accel/habanalabs: remove '\n' when passing strings to
 gaudi2_print_event()
Date: Thu, 16 Mar 2023 13:36:39 +0200
Message-Id: <20230316113640.499267-9-ogabbay@kernel.org>
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
Cc: Tomer Tayar <ttayar@habana.ai>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Tomer Tayar <ttayar@habana.ai>

Remove all '\n' from strings which are passed as arguments to
gaudi2_print_event(), because the newline character is added internally
in this function.

Signed-off-by: Tomer Tayar <ttayar@habana.ai>
Reviewed-by: Oded Gabbay <ogabbay@kernel.org>
Signed-off-by: Oded Gabbay <ogabbay@kernel.org>
---
 drivers/accel/habanalabs/gaudi2/gaudi2.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/accel/habanalabs/gaudi2/gaudi2.c b/drivers/accel/habanalabs/gaudi2/gaudi2.c
index 247a6e2c2e91..57c94f9a6042 100644
--- a/drivers/accel/habanalabs/gaudi2/gaudi2.c
+++ b/drivers/accel/habanalabs/gaudi2/gaudi2.c
@@ -7634,7 +7634,7 @@ static bool gaudi2_handle_ecc_event(struct hl_device *hdev, u16 event_type,
 	memory_wrapper_idx = ecc_data->memory_wrapper_idx;
 
 	gaudi2_print_event(hdev, event_type, !ecc_data->is_critical,
-		"ECC error detected. address: %#llx. Syndrom: %#llx. block id %u. critical %u.\n",
+		"ECC error detected. address: %#llx. Syndrom: %#llx. block id %u. critical %u.",
 		ecc_address, ecc_syndrom, memory_wrapper_idx, ecc_data->is_critical);
 
 	return !!ecc_data->is_critical;
@@ -8925,7 +8925,7 @@ static int gaudi2_handle_sm_err(struct hl_device *hdev, u16 event_type, u8 sm_in
 				continue;
 
 			gaudi2_print_event(hdev, event_type, true,
-				"err cause: %s. %s: 0x%X\n",
+				"err cause: %s. %s: 0x%X",
 				gaudi2_sm_sei_cause[i].cause_name,
 				gaudi2_sm_sei_cause[i].log_name,
 				sei_cause_log);
@@ -9131,12 +9131,12 @@ static bool gaudi2_handle_hbm_mc_sei_err(struct hl_device *hdev, u16 event_type,
 	if (cause_idx > GAUDI2_NUM_OF_HBM_SEI_CAUSE - 1) {
 		gaudi2_print_event(hdev, event_type, true,
 			"err cause: %s",
-			"Invalid HBM SEI event cause (%d) provided by FW\n", cause_idx);
+			"Invalid HBM SEI event cause (%d) provided by FW", cause_idx);
 		return true;
 	}
 
 	gaudi2_print_event(hdev, event_type, !sei_data->hdr.is_critical,
-		"System %s Error Interrupt - HBM(%u) MC(%u) MC_CH(%u) MC_PC(%u). Error cause: %s\n",
+		"System %s Error Interrupt - HBM(%u) MC(%u) MC_CH(%u) MC_PC(%u). Error cause: %s",
 		sei_data->hdr.is_critical ? "Critical" : "Non-critical",
 		hbm_id, mc_id, sei_data->hdr.mc_channel, sei_data->hdr.mc_pseudo_channel,
 		hbm_mc_sei_cause[cause_idx]);
@@ -9260,7 +9260,7 @@ static void gaudi2_print_out_of_sync_info(struct hl_device *hdev, u16 event_type
 	struct hl_hw_queue *q = &hdev->kernel_queues[GAUDI2_QUEUE_ID_CPU_PQ];
 
 	gaudi2_print_event(hdev, event_type, false,
-		"FW: pi=%u, ci=%u, LKD: pi=%u, ci=%d\n",
+		"FW: pi=%u, ci=%u, LKD: pi=%u, ci=%d",
 		le32_to_cpu(sync_err->pi), le32_to_cpu(sync_err->ci),
 		q->pi, atomic_read(&q->ci));
 }
@@ -9274,7 +9274,7 @@ static int gaudi2_handle_pcie_p2p_msix(struct hl_device *hdev, u16 event_type)
 
 	if (p2p_intr) {
 		gaudi2_print_event(hdev, event_type, true,
-			"pcie p2p transaction terminated due to security, req_id(0x%x)\n",
+			"pcie p2p transaction terminated due to security, req_id(0x%x)",
 			RREG32(mmPCIE_WRAP_P2P_REQ_ID));
 
 		WREG32(mmPCIE_WRAP_P2P_INTR, 0x1);
@@ -9283,7 +9283,7 @@ static int gaudi2_handle_pcie_p2p_msix(struct hl_device *hdev, u16 event_type)
 
 	if (msix_gw_intr) {
 		gaudi2_print_event(hdev, event_type, true,
-			"pcie msi-x gen denied due to vector num check failure, vec(0x%X)\n",
+			"pcie msi-x gen denied due to vector num check failure, vec(0x%X)",
 			RREG32(mmPCIE_WRAP_MSIX_GW_VEC));
 
 		WREG32(mmPCIE_WRAP_MSIX_GW_INTR, 0x1);
@@ -9345,7 +9345,7 @@ static void gaudi2_print_cpu_pkt_failure_info(struct hl_device *hdev, u16 event_
 	struct hl_hw_queue *q = &hdev->kernel_queues[GAUDI2_QUEUE_ID_CPU_PQ];
 
 	gaudi2_print_event(hdev, event_type, false,
-		"FW reported sanity check failure, FW: pi=%u, ci=%u, LKD: pi=%u, ci=%d\n",
+		"FW reported sanity check failure, FW: pi=%u, ci=%u, LKD: pi=%u, ci=%d",
 		le32_to_cpu(sync_err->pi), le32_to_cpu(sync_err->ci), q->pi, atomic_read(&q->ci));
 }
 
@@ -9365,11 +9365,11 @@ static int hl_arc_event_handle(struct hl_device *hdev, u16 event_type,
 		q = (struct hl_engine_arc_dccm_queue_full_irq *) &payload;
 
 		gaudi2_print_event(hdev, event_type, true,
-				"ARC DCCM Full event: EngId: %u, Intr_type: %u, Qidx: %u\n",
+				"ARC DCCM Full event: EngId: %u, Intr_type: %u, Qidx: %u",
 				engine_id, intr_type, q->queue_index);
 		return 1;
 	default:
-		gaudi2_print_event(hdev, event_type, true, "Unknown ARC event type\n");
+		gaudi2_print_event(hdev, event_type, true, "Unknown ARC event type");
 		return 0;
 	}
 }
@@ -9800,7 +9800,7 @@ static void gaudi2_handle_eqe(struct hl_device *hdev, struct hl_eq_entry *eq_ent
 		gaudi2_print_event(hdev, event_type, true, "%d", event_type);
 	else if (error_count == 0)
 		gaudi2_print_event(hdev, event_type, true,
-				"No error cause for H/W event %u\n", event_type);
+				"No error cause for H/W event %u", event_type);
 
 	if ((gaudi2_irq_map_table[event_type].reset != EVENT_RESET_TYPE_NONE) ||
 				reset_required) {
-- 
2.40.0

