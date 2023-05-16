Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D2B97704957
	for <lists+dri-devel@lfdr.de>; Tue, 16 May 2023 11:31:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4ACB810E33D;
	Tue, 16 May 2023 09:30:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24C8810E332
 for <dri-devel@lists.freedesktop.org>; Tue, 16 May 2023 09:30:47 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9E6F061943;
 Tue, 16 May 2023 09:30:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F277C433D2;
 Tue, 16 May 2023 09:30:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1684229446;
 bh=j8JPpe5z4kKX6LBvE2fhN30j+2bbtjGRbliObItIk/Q=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=VTsQUpNAAxz4u8bTSCEHfGenrlL/6SRqI12RcZ6MPTeicHhArPlDTAYaPa4DVvYFU
 nTlle3K3bsv5S+R38EF4mo95LFS/4MLI1+BwX/Xkg6VXnSc0b900HCseo+xnBxW67r
 mlUpY0qFRfezDragmHQNMhtNQ2StQXDnSB4aS5uYx/qlFg43krC7Drs+4IZrYA2swn
 VDb9jMdmBtETFLYikKXx/toYrg5ue44Uz7AxJpAoQ6BgsjsDapn9S/32ocGFhfioON
 BMtdKD4TWLvKpRt4ENGG2EUGxrYvWKJbu1Z4+ifTLm46mKKQJFQcyHm+olFW8iQt9F
 VLvoL5hbm10kw==
From: Oded Gabbay <ogabbay@kernel.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 08/12] accel/habanalabs: use binning info when handling razwi
Date: Tue, 16 May 2023 12:30:26 +0300
Message-Id: <20230516093030.1220526-8-ogabbay@kernel.org>
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
Cc: Dani Liberman <dliberman@habana.ai>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Dani Liberman <dliberman@habana.ai>

When receiving sei interrupt from tpc or decoder, we need to check
the binning mask because if the engine is binned, the razwi info
won't be in the router of the binned engine, instead will be in the
router of the substitute engine.

Signed-off-by: Dani Liberman <dliberman@habana.ai>
Reviewed-by: Oded Gabbay <ogabbay@kernel.org>
Signed-off-by: Oded Gabbay <ogabbay@kernel.org>
---
 drivers/accel/habanalabs/gaudi2/gaudi2.c | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/drivers/accel/habanalabs/gaudi2/gaudi2.c b/drivers/accel/habanalabs/gaudi2/gaudi2.c
index b8644d87f817..a6aa17d86820 100644
--- a/drivers/accel/habanalabs/gaudi2/gaudi2.c
+++ b/drivers/accel/habanalabs/gaudi2/gaudi2.c
@@ -8040,7 +8040,7 @@ static void gaudi2_ack_module_razwi_event_handler(struct hl_device *hdev,
 				u8 module_sub_idx, u64 *event_mask)
 {
 	bool via_sft = false;
-	u32 hbw_rtr_id, lbw_rtr_id, dcore_id, dcore_rtr_id, eng_id;
+	u32 hbw_rtr_id, lbw_rtr_id, dcore_id, dcore_rtr_id, eng_id, binned_idx;
 	u64 hbw_rtr_mstr_if_base_addr, lbw_rtr_mstr_if_base_addr;
 	u32 hbw_shrd_aw = 0, hbw_shrd_ar = 0;
 	u32 lbw_shrd_aw = 0, lbw_shrd_ar = 0;
@@ -8048,6 +8048,13 @@ static void gaudi2_ack_module_razwi_event_handler(struct hl_device *hdev,
 
 	switch (module) {
 	case RAZWI_TPC:
+		sprintf(initiator_name, "TPC_%u", module_idx);
+		if (hdev->tpc_binning) {
+			binned_idx = __ffs(hdev->tpc_binning);
+			if (binned_idx == module_idx)
+				module_idx = TPC_ID_DCORE0_TPC6;
+		}
+
 		hbw_rtr_id = gaudi2_tpc_initiator_hbw_rtr_id[module_idx];
 
 		if (hl_is_fw_sw_ver_below(hdev, 1, 9) &&
@@ -8056,7 +8063,6 @@ static void gaudi2_ack_module_razwi_event_handler(struct hl_device *hdev,
 			lbw_rtr_id = DCORE0_RTR0;
 		else
 			lbw_rtr_id = gaudi2_tpc_initiator_lbw_rtr_id[module_idx];
-		sprintf(initiator_name, "TPC_%u", module_idx);
 		break;
 	case RAZWI_MME:
 		sprintf(initiator_name, "MME_%u", module_idx);
@@ -8115,9 +8121,14 @@ static void gaudi2_ack_module_razwi_event_handler(struct hl_device *hdev,
 		sprintf(initiator_name, "NIC_%u", module_idx);
 		break;
 	case RAZWI_DEC:
+		sprintf(initiator_name, "DEC_%u", module_idx);
+		if (hdev->decoder_binning) {
+			binned_idx = __ffs(hdev->decoder_binning);
+			if (binned_idx == module_idx)
+				module_idx = DEC_ID_PCIE_VDEC1;
+		}
 		hbw_rtr_id = gaudi2_dec_initiator_hbw_rtr_id[module_idx];
 		lbw_rtr_id = gaudi2_dec_initiator_lbw_rtr_id[module_idx];
-		sprintf(initiator_name, "DEC_%u", module_idx);
 		break;
 	case RAZWI_ROT:
 		hbw_rtr_id = gaudi2_rot_initiator_hbw_rtr_id[module_idx];
-- 
2.40.1

