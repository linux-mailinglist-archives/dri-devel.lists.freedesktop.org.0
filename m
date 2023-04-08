Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9BA36DB952
	for <lists+dri-devel@lfdr.de>; Sat,  8 Apr 2023 09:45:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66F1610E030;
	Sat,  8 Apr 2023 07:45:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F2B310E030
 for <dri-devel@lists.freedesktop.org>; Sat,  8 Apr 2023 07:45:20 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5CFFB61551;
 Sat,  8 Apr 2023 07:45:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8867C433EF;
 Sat,  8 Apr 2023 07:45:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1680939917;
 bh=YaUho/VPCOlj4Q5FLtGuBi+JUcU0gM9iFb8ECZ4FFUY=;
 h=From:To:Cc:Subject:Date:From;
 b=ZJYsFRm5B4geOWjbbW2yQTk7T1ewa9lHzFlIwtzeaWy7b8wJXymcqq9kGCLF23Umv
 VXdGr8bjPdptYir1fMghajJnJBXJLskb0zv71V/5V4R57+BkPAleqjxF/gVs4vI+op
 uL3hDKFYAQOZbIjhPEO6I1NXRv2B31Bqh7ZJJHY4XKdFYX94wCdXxuGM0HP6yJsTM2
 QIZqIjrZW9l5UyotEhv0A/D0t4gBc94N+GHtVVDsx1kzrCE/oCyN/kPUUcEr95rbYk
 881tIuYS2Bi16RM6y8K8vzlKYZBQuG21BBKqgtfU9GyYeEFa5Uu0aumAteUn5lp2MA
 RoyaUmjXVgQ8w==
From: Oded Gabbay <ogabbay@kernel.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/4] accel/habanalabs: remove Gaudi1 multi MSI code
Date: Sat,  8 Apr 2023 10:45:09 +0300
Message-Id: <20230408074512.2277163-1-ogabbay@kernel.org>
X-Mailer: git-send-email 2.40.0
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

Multi MSI interrupts aren't working in Gaudi1 and because of that,
we are only using a single MSI interrupt. Therefore, let's remove this
dead code in order to avoid confusion.

Signed-off-by: Ofir Bitton <obitton@habana.ai>
Reviewed-by: Oded Gabbay <ogabbay@kernel.org>
Signed-off-by: Oded Gabbay <ogabbay@kernel.org>
---
 drivers/accel/habanalabs/gaudi/gaudi.c  | 83 ++-----------------------
 drivers/accel/habanalabs/gaudi/gaudiP.h | 15 -----
 2 files changed, 5 insertions(+), 93 deletions(-)

diff --git a/drivers/accel/habanalabs/gaudi/gaudi.c b/drivers/accel/habanalabs/gaudi/gaudi.c
index 2ad8e4efce7f..a29aa8f7b6f3 100644
--- a/drivers/accel/habanalabs/gaudi/gaudi.c
+++ b/drivers/accel/habanalabs/gaudi/gaudi.c
@@ -2020,38 +2020,6 @@ static int gaudi_enable_msi_single(struct hl_device *hdev)
 	return rc;
 }
 
-static int gaudi_enable_msi_multi(struct hl_device *hdev)
-{
-	int cq_cnt = hdev->asic_prop.completion_queues_count;
-	int rc, i, irq_cnt_init, irq;
-
-	for (i = 0, irq_cnt_init = 0 ; i < cq_cnt ; i++, irq_cnt_init++) {
-		irq = gaudi_pci_irq_vector(hdev, i, false);
-		rc = request_irq(irq, hl_irq_handler_cq, 0, gaudi_irq_name[i],
-				&hdev->completion_queue[i]);
-		if (rc) {
-			dev_err(hdev->dev, "Failed to request IRQ %d", irq);
-			goto free_irqs;
-		}
-	}
-
-	irq = gaudi_pci_irq_vector(hdev, GAUDI_EVENT_QUEUE_MSI_IDX, true);
-	rc = request_irq(irq, hl_irq_handler_eq, 0, gaudi_irq_name[cq_cnt],
-				&hdev->event_queue);
-	if (rc) {
-		dev_err(hdev->dev, "Failed to request IRQ %d", irq);
-		goto free_irqs;
-	}
-
-	return 0;
-
-free_irqs:
-	for (i = 0 ; i < irq_cnt_init ; i++)
-		free_irq(gaudi_pci_irq_vector(hdev, i, false),
-				&hdev->completion_queue[i]);
-	return rc;
-}
-
 static int gaudi_enable_msi(struct hl_device *hdev)
 {
 	struct gaudi_device *gaudi = hdev->asic_specific;
@@ -2066,14 +2034,7 @@ static int gaudi_enable_msi(struct hl_device *hdev)
 		return rc;
 	}
 
-	if (rc < NUMBER_OF_INTERRUPTS) {
-		gaudi->multi_msi_mode = false;
-		rc = gaudi_enable_msi_single(hdev);
-	} else {
-		gaudi->multi_msi_mode = true;
-		rc = gaudi_enable_msi_multi(hdev);
-	}
-
+	rc = gaudi_enable_msi_single(hdev);
 	if (rc)
 		goto free_pci_irq_vectors;
 
@@ -2089,47 +2050,23 @@ static int gaudi_enable_msi(struct hl_device *hdev)
 static void gaudi_sync_irqs(struct hl_device *hdev)
 {
 	struct gaudi_device *gaudi = hdev->asic_specific;
-	int i, cq_cnt = hdev->asic_prop.completion_queues_count;
 
 	if (!(gaudi->hw_cap_initialized & HW_CAP_MSI))
 		return;
 
 	/* Wait for all pending IRQs to be finished */
-	if (gaudi->multi_msi_mode) {
-		for (i = 0 ; i < cq_cnt ; i++)
-			synchronize_irq(gaudi_pci_irq_vector(hdev, i, false));
-
-		synchronize_irq(gaudi_pci_irq_vector(hdev,
-						GAUDI_EVENT_QUEUE_MSI_IDX,
-						true));
-	} else {
-		synchronize_irq(gaudi_pci_irq_vector(hdev, 0, false));
-	}
+	synchronize_irq(gaudi_pci_irq_vector(hdev, 0, false));
 }
 
 static void gaudi_disable_msi(struct hl_device *hdev)
 {
 	struct gaudi_device *gaudi = hdev->asic_specific;
-	int i, irq, cq_cnt = hdev->asic_prop.completion_queues_count;
 
 	if (!(gaudi->hw_cap_initialized & HW_CAP_MSI))
 		return;
 
 	gaudi_sync_irqs(hdev);
-
-	if (gaudi->multi_msi_mode) {
-		irq = gaudi_pci_irq_vector(hdev, GAUDI_EVENT_QUEUE_MSI_IDX,
-						true);
-		free_irq(irq, &hdev->event_queue);
-
-		for (i = 0 ; i < cq_cnt ; i++) {
-			irq = gaudi_pci_irq_vector(hdev, i, false);
-			free_irq(irq, &hdev->completion_queue[i]);
-		}
-	} else {
-		free_irq(gaudi_pci_irq_vector(hdev, 0, false), hdev);
-	}
-
+	free_irq(gaudi_pci_irq_vector(hdev, 0, false), hdev);
 	pci_free_irq_vectors(hdev->pdev);
 
 	gaudi->hw_cap_initialized &= ~HW_CAP_MSI;
@@ -3924,11 +3861,7 @@ static int gaudi_init_cpu_queues(struct hl_device *hdev, u32 cpu_timeout)
 
 	WREG32(mmCPU_IF_PF_PQ_PI, 0);
 
-	if (gaudi->multi_msi_mode)
-		WREG32(mmCPU_IF_QUEUE_INIT, PQ_INIT_STATUS_READY_FOR_CP);
-	else
-		WREG32(mmCPU_IF_QUEUE_INIT,
-			PQ_INIT_STATUS_READY_FOR_CP_SINGLE_MSI);
+	WREG32(mmCPU_IF_QUEUE_INIT, PQ_INIT_STATUS_READY_FOR_CP_SINGLE_MSI);
 
 	irq_handler_offset = prop->gic_interrupts_enable ?
 			mmGIC_DISTRIBUTOR__5_GICD_SETSPI_NSR :
@@ -5605,7 +5538,6 @@ static void gaudi_add_end_of_cb_packets(struct hl_device *hdev, void *kernel_add
 				u32 len, u32 original_len, u64 cq_addr, u32 cq_val,
 				u32 msi_vec, bool eb)
 {
-	struct gaudi_device *gaudi = hdev->asic_specific;
 	struct packet_msg_prot *cq_pkt;
 	struct packet_nop *cq_padding;
 	u64 msi_addr;
@@ -5635,12 +5567,7 @@ static void gaudi_add_end_of_cb_packets(struct hl_device *hdev, void *kernel_add
 	tmp |= FIELD_PREP(GAUDI_PKT_CTL_MB_MASK, 1);
 	cq_pkt->ctl = cpu_to_le32(tmp);
 	cq_pkt->value = cpu_to_le32(1);
-
-	if (gaudi->multi_msi_mode)
-		msi_addr = mmPCIE_MSI_INTR_0 + msi_vec * 4;
-	else
-		msi_addr = mmPCIE_CORE_MSI_REQ;
-
+	msi_addr = hdev->pdev ? mmPCIE_CORE_MSI_REQ : mmPCIE_MSI_INTR_0 + msi_vec * 4;
 	cq_pkt->addr = cpu_to_le64(CFG_BASE + msi_addr);
 }
 
diff --git a/drivers/accel/habanalabs/gaudi/gaudiP.h b/drivers/accel/habanalabs/gaudi/gaudiP.h
index 3d88d56c8eb3..b8fa724be5a1 100644
--- a/drivers/accel/habanalabs/gaudi/gaudiP.h
+++ b/drivers/accel/habanalabs/gaudi/gaudiP.h
@@ -28,20 +28,8 @@
 #define NUMBER_OF_COLLECTIVE_QUEUES	12
 #define NUMBER_OF_SOBS_IN_GRP		11
 
-/*
- * Number of MSI interrupts IDS:
- * Each completion queue has 1 ID
- * The event queue has 1 ID
- */
-#define NUMBER_OF_INTERRUPTS		(NUMBER_OF_CMPLT_QUEUES + \
-						NUMBER_OF_CPU_HW_QUEUES)
-
 #define GAUDI_STREAM_MASTER_ARR_SIZE	8
 
-#if (NUMBER_OF_INTERRUPTS > GAUDI_MSI_ENTRIES)
-#error "Number of MSI interrupts must be smaller or equal to GAUDI_MSI_ENTRIES"
-#endif
-
 #define CORESIGHT_TIMEOUT_USEC		100000		/* 100 ms */
 
 #define GAUDI_MAX_CLK_FREQ		2200000000ull	/* 2200 MHz */
@@ -324,8 +312,6 @@ struct gaudi_internal_qman_info {
  *                      signal we can use this engine in later code paths.
  *                      Each bit is cleared upon reset of its corresponding H/W
  *                      engine.
- * @multi_msi_mode: whether we are working in multi MSI single MSI mode.
- *                  Multi MSI is possible only with IOMMU enabled.
  * @mmu_cache_inv_pi: PI for MMU cache invalidation flow. The H/W expects an
  *                    8-bit value so use u8.
  */
@@ -345,7 +331,6 @@ struct gaudi_device {
 	u32				events_stat[GAUDI_EVENT_SIZE];
 	u32				events_stat_aggregate[GAUDI_EVENT_SIZE];
 	u32				hw_cap_initialized;
-	u8				multi_msi_mode;
 	u8				mmu_cache_inv_pi;
 };
 
-- 
2.40.0

