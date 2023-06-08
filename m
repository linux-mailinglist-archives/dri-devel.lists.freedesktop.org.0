Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 33D49728186
	for <lists+dri-devel@lfdr.de>; Thu,  8 Jun 2023 15:39:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF3B810E5C1;
	Thu,  8 Jun 2023 13:39:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DF5610E5C1
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Jun 2023 13:39:06 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D3476615C6;
 Thu,  8 Jun 2023 13:39:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D1FDC4339B;
 Thu,  8 Jun 2023 13:39:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1686231545;
 bh=7ZHCiTls9MnkNYtCwMXWTA4PmUUGgVRiDIYYGQ+f64k=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=kAjJgsfWNY00ZPYiae20gv7GZyxbGVqaJTFmIylH30Ija2+1gkhb2uUEpZ/E7HkmN
 +9ivbLoebCwr+j3w+lhwwzS+K0EFDR4+ZqAfWATD7NuP7dxpmAFXhE1N1dzzF5ccrO
 2cIft5/JSHHwKjJsSlWSt+8rLeHWA9vVsuJs0dtjHCZnPXpHMQxAdFiOwDeJeBNArj
 xBvLvcrjmlOZirD8AqD7nt9FvAt/79qDkK7K0B6IiFP5RQikki2P7R4LUeZwcy9odM
 NPmDLgvS213aWf91G1/gdhsyocrR5eYJZFUrw+O/vNxT7e6IgTTRQjxl2zRS2BpmVm
 asJw8SoMv45XA==
From: Oded Gabbay <ogabbay@kernel.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 08/12] accel/habanalabs: handle arc farm razwi
Date: Thu,  8 Jun 2023 16:38:45 +0300
Message-Id: <20230608133849.2739411-8-ogabbay@kernel.org>
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
Cc: Dani Liberman <dliberman@habana.ai>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Dani Liberman <dliberman@habana.ai>

Implement razwi handling for arc farm and add it to arc farm sei
event handler.

Signed-off-by: Dani Liberman <dliberman@habana.ai>
Reviewed-by: Oded Gabbay <ogabbay@kernel.org>
Signed-off-by: Oded Gabbay <ogabbay@kernel.org>
---
 drivers/accel/habanalabs/gaudi2/gaudi2.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/drivers/accel/habanalabs/gaudi2/gaudi2.c b/drivers/accel/habanalabs/gaudi2/gaudi2.c
index 899b1c4b53f6..1085215ac51d 100644
--- a/drivers/accel/habanalabs/gaudi2/gaudi2.c
+++ b/drivers/accel/habanalabs/gaudi2/gaudi2.c
@@ -2097,7 +2097,8 @@ enum razwi_event_sources {
 	RAZWI_PDMA,
 	RAZWI_NIC,
 	RAZWI_DEC,
-	RAZWI_ROT
+	RAZWI_ROT,
+	RAZWI_ARC_FARM
 };
 
 struct hbm_mc_error_causes {
@@ -8049,6 +8050,9 @@ static enum gaudi2_engine_id gaudi2_razwi_calc_engine_id(struct hl_device *hdev,
 	case RAZWI_ROT:
 		return GAUDI2_ENGINE_ID_ROT_0 + module_idx;
 
+	case RAZWI_ARC_FARM:
+		return GAUDI2_ENGINE_ID_ARC_FARM;
+
 	default:
 		return GAUDI2_ENGINE_ID_SIZE;
 	}
@@ -8158,6 +8162,11 @@ static void gaudi2_ack_module_razwi_event_handler(struct hl_device *hdev,
 		lbw_rtr_id = gaudi2_rot_initiator_lbw_rtr_id[module_idx];
 		sprintf(initiator_name, "ROT_%u", module_idx);
 		break;
+	case RAZWI_ARC_FARM:
+		lbw_rtr_id = DCORE1_RTR5;
+		hbw_rtr_id = DCORE1_RTR7;
+		sprintf(initiator_name, "ARC_FARM_%u", module_idx);
+		break;
 	default:
 		return;
 	}
@@ -8611,7 +8620,7 @@ static int gaudi2_handle_qman_err(struct hl_device *hdev, u16 event_type, u64 *e
 	return error_count;
 }
 
-static int gaudi2_handle_arc_farm_sei_err(struct hl_device *hdev, u16 event_type)
+static int gaudi2_handle_arc_farm_sei_err(struct hl_device *hdev, u16 event_type, u64 *event_mask)
 {
 	u32 i, sts_val, sts_clr_val, error_count = 0, arc_farm;
 
@@ -8633,6 +8642,7 @@ static int gaudi2_handle_arc_farm_sei_err(struct hl_device *hdev, u16 event_type
 				sts_clr_val);
 	}
 
+	gaudi2_ack_module_razwi_event_handler(hdev, RAZWI_ARC_FARM, 0, 0, event_mask);
 	hl_check_for_glbl_errors(hdev);
 
 	return error_count;
@@ -9619,7 +9629,7 @@ static void gaudi2_handle_eqe(struct hl_device *hdev, struct hl_eq_entry *eq_ent
 		break;
 
 	case GAUDI2_EVENT_ARC_AXI_ERROR_RESPONSE_0:
-		error_count = gaudi2_handle_arc_farm_sei_err(hdev, event_type);
+		error_count = gaudi2_handle_arc_farm_sei_err(hdev, event_type, &event_mask);
 		event_mask |= HL_NOTIFIER_EVENT_USER_ENGINE_ERR;
 		break;
 
-- 
2.40.1

