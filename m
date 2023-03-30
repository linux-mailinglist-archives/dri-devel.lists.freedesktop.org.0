Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48F9B6CFCA0
	for <lists+dri-devel@lfdr.de>; Thu, 30 Mar 2023 09:22:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D12510ECF8;
	Thu, 30 Mar 2023 07:22:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06E5010E17D
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Mar 2023 07:22:24 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6FD7D61F1A;
 Thu, 30 Mar 2023 07:22:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3BF2C433EF;
 Thu, 30 Mar 2023 07:22:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1680160942;
 bh=+RuqCEK9yjJnr6UPQ0g/Y7KFiGEoBYLFg3d/ffhLo4s=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=cLJMLLCuFHMi+aAJEMoNeU/UQAoCI99/2E89+cvP6kplf+ChJ1NCNSbSleDD5XcCw
 UOrSa0Kmbzsy5A1h09217BAPffV90ebNL2G3WURREI/RqJa+1U3qj9sxBncvPF5gIX
 6hKHNAQ0zogzzS6hZRbT9jiGlBH3NdJnHL1XI6GuMp3jqdGwIB4EaEkDD5pUABSamw
 zcbx6VCRHPrIgenwwyykr2iocAtYvuKajvFGZFNTx6bvsytYwsAmY7oDfqYxUzHR1c
 nlOTFwXcy/P2HFGbdsnQE15Yd9CdrGzAsxyqBqXOqg6dTc5m4lxrNA4dzJJXN0INTB
 Ct0JzXli3+oPg==
From: Oded Gabbay <ogabbay@kernel.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 4/7] accel/habanalabs: fix wrong reset and event flags
Date: Thu, 30 Mar 2023 10:22:10 +0300
Message-Id: <20230330072213.1596318-4-ogabbay@kernel.org>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230330072213.1596318-1-ogabbay@kernel.org>
References: <20230330072213.1596318-1-ogabbay@kernel.org>
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

During event handling, driver sets relevant reset and user event
notifier flags. Fix few wrong flags settings.

Signed-off-by: Ofir Bitton <obitton@habana.ai>
Reviewed-by: Oded Gabbay <ogabbay@kernel.org>
Signed-off-by: Oded Gabbay <ogabbay@kernel.org>
---
 drivers/accel/habanalabs/gaudi2/gaudi2.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/accel/habanalabs/gaudi2/gaudi2.c b/drivers/accel/habanalabs/gaudi2/gaudi2.c
index ea9fdc616de4..ce85308d03e9 100644
--- a/drivers/accel/habanalabs/gaudi2/gaudi2.c
+++ b/drivers/accel/habanalabs/gaudi2/gaudi2.c
@@ -9510,19 +9510,18 @@ static void gaudi2_handle_eqe(struct hl_device *hdev, struct hl_eq_entry *eq_ent
 		break;
 
 	case GAUDI2_EVENT_ARC_AXI_ERROR_RESPONSE_0:
-		reset_flags |= HL_DRV_RESET_FW_FATAL_ERR;
 		error_count = gaudi2_handle_arc_farm_sei_err(hdev, event_type);
-		event_mask |= HL_NOTIFIER_EVENT_GENERAL_HW_ERR;
+		event_mask |= HL_NOTIFIER_EVENT_USER_ENGINE_ERR;
 		break;
 
 	case GAUDI2_EVENT_CPU_AXI_ERR_RSP:
 		error_count = gaudi2_handle_cpu_sei_err(hdev, event_type);
-		event_mask |= HL_NOTIFIER_EVENT_GENERAL_HW_ERR;
+		reset_flags |= HL_DRV_RESET_FW_FATAL_ERR;
+		event_mask |= HL_NOTIFIER_EVENT_CRITICL_FW_ERR;
 		break;
 
 	case GAUDI2_EVENT_PDMA_CH0_AXI_ERR_RSP:
 	case GAUDI2_EVENT_PDMA_CH1_AXI_ERR_RSP:
-		reset_flags |= HL_DRV_RESET_FW_FATAL_ERR;
 		error_count = gaudi2_handle_qm_sei_err(hdev, event_type, true, &event_mask);
 		event_mask |= HL_NOTIFIER_EVENT_USER_ENGINE_ERR;
 		break;
@@ -9709,12 +9708,14 @@ static void gaudi2_handle_eqe(struct hl_device *hdev, struct hl_eq_entry *eq_ent
 
 	case GAUDI2_EVENT_PCIE_DRAIN_COMPLETE:
 		error_count = gaudi2_handle_pcie_drain(hdev, &eq_entry->pcie_drain_ind_data);
+		reset_flags |= HL_DRV_RESET_FW_FATAL_ERR;
 		event_mask |= HL_NOTIFIER_EVENT_GENERAL_HW_ERR;
 		break;
 
 	case GAUDI2_EVENT_PSOC59_RPM_ERROR_OR_DRAIN:
 		error_count = gaudi2_handle_psoc_drain(hdev,
 				le64_to_cpu(eq_entry->intr_cause.intr_cause_data));
+		reset_flags |= HL_DRV_RESET_FW_FATAL_ERR;
 		event_mask |= HL_NOTIFIER_EVENT_GENERAL_HW_ERR;
 		break;
 
@@ -9743,6 +9744,7 @@ static void gaudi2_handle_eqe(struct hl_device *hdev, struct hl_eq_entry *eq_ent
 		break;
 	case GAUDI2_EVENT_PSOC_AXI_ERR_RSP:
 		error_count = GAUDI2_NA_EVENT_CAUSE;
+		reset_flags |= HL_DRV_RESET_FW_FATAL_ERR;
 		event_mask |= HL_NOTIFIER_EVENT_GENERAL_HW_ERR;
 		break;
 	case GAUDI2_EVENT_PSOC_PRSTN_FALL:
@@ -9756,6 +9758,7 @@ static void gaudi2_handle_eqe(struct hl_device *hdev, struct hl_eq_entry *eq_ent
 		break;
 	case GAUDI2_EVENT_PCIE_FATAL_ERR:
 		error_count = GAUDI2_NA_EVENT_CAUSE;
+		reset_flags |= HL_DRV_RESET_FW_FATAL_ERR;
 		event_mask |= HL_NOTIFIER_EVENT_GENERAL_HW_ERR;
 		break;
 	case GAUDI2_EVENT_TPC0_BMON_SPMU:
@@ -9823,6 +9826,7 @@ static void gaudi2_handle_eqe(struct hl_device *hdev, struct hl_eq_entry *eq_ent
 	case GAUDI2_EVENT_CPU_PKT_QUEUE_OUT_SYNC:
 		gaudi2_print_out_of_sync_info(hdev, event_type, &eq_entry->pkt_sync_err);
 		error_count = GAUDI2_NA_EVENT_CAUSE;
+		reset_flags |= HL_DRV_RESET_FW_FATAL_ERR;
 		event_mask |= HL_NOTIFIER_EVENT_GENERAL_HW_ERR;
 		break;
 
@@ -9864,6 +9868,7 @@ static void gaudi2_handle_eqe(struct hl_device *hdev, struct hl_eq_entry *eq_ent
 	case GAUDI2_EVENT_CPU_PKT_SANITY_FAILED:
 		gaudi2_print_cpu_pkt_failure_info(hdev, event_type, &eq_entry->pkt_sync_err);
 		error_count = GAUDI2_NA_EVENT_CAUSE;
+		reset_flags |= HL_DRV_RESET_FW_FATAL_ERR;
 		event_mask |= HL_NOTIFIER_EVENT_GENERAL_HW_ERR;
 		break;
 
-- 
2.40.0

