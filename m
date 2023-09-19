Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88B167A5FC2
	for <lists+dri-devel@lfdr.de>; Tue, 19 Sep 2023 12:38:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F63810E0B7;
	Tue, 19 Sep 2023 10:37:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DCC110E0B7
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Sep 2023 10:37:53 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A1C2661595
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Sep 2023 10:37:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 411EDC433C7
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Sep 2023 10:37:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1695119871;
 bh=tesCEbtPcVZgw3Z16K6lPNfPF98JWxFalyPC21OvM+g=;
 h=From:To:Subject:Date:From;
 b=AgETvc9pGw3vwqFyXBfv6MFtoBJnOF2XTEJbL+Gu82z9kZWopTyornplh2HJk9TA3
 01Zi2xvYlBE96C6M9AImq+Z2uqdw2sPqsrR7Cus4B3fp7NIeIh1CktalAw4XyS36eH
 4UayNr/jSAtuGGO0d5DUXS0yM17Ib5HdkVP7V1t+EAAXAf0lEf7wynxsI7KRm6PHgG
 OWq4lpm9XptXz5Wn7xARoT0jzZN6pQClGUFnGtQiyPFVP4+phwabF6sc5vSDW+2eHV
 KfeIpxs1iZkCFtGNhb2r2OqHzAl/dT+WRPa74RAFeJy9JjacwCTYQFMSLZfZWHPAVD
 HPq66qgSCi5mQ==
From: Oded Gabbay <ogabbay@kernel.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/3] accel/habanalabs: remove unused asic functions
Date: Tue, 19 Sep 2023 13:37:45 +0300
Message-Id: <20230919103747.955418-1-ogabbay@kernel.org>
X-Mailer: git-send-email 2.34.1
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

asic_dma_{un}map_single() asic-specific functions are no longer called
from the common code, so delete these functions.

In addition, delete the gaudi2 implementation as they are also not
called.

Signed-off-by: Oded Gabbay <ogabbay@kernel.org>
---
 drivers/accel/habanalabs/common/habanalabs.h |  8 --------
 drivers/accel/habanalabs/gaudi2/gaudi2.c     | 20 --------------------
 2 files changed, 28 deletions(-)

diff --git a/drivers/accel/habanalabs/common/habanalabs.h b/drivers/accel/habanalabs/common/habanalabs.h
index 3c224942a758..4f667ac46301 100644
--- a/drivers/accel/habanalabs/common/habanalabs.h
+++ b/drivers/accel/habanalabs/common/habanalabs.h
@@ -1520,8 +1520,6 @@ struct engines_data {
  * @asic_dma_pool_free: free small DMA allocation from pool.
  * @cpu_accessible_dma_pool_alloc: allocate CPU PQ packet from DMA pool.
  * @cpu_accessible_dma_pool_free: free CPU PQ packet from DMA pool.
- * @asic_dma_unmap_single: unmap a single DMA buffer
- * @asic_dma_map_single: map a single buffer to a DMA
  * @hl_dma_unmap_sgtable: DMA unmap scatter-gather table.
  * @cs_parser: parse Command Submission.
  * @asic_dma_map_sgtable: DMA map scatter-gather table.
@@ -1645,12 +1643,6 @@ struct hl_asic_funcs {
 				size_t size, dma_addr_t *dma_handle);
 	void (*cpu_accessible_dma_pool_free)(struct hl_device *hdev,
 				size_t size, void *vaddr);
-	void (*asic_dma_unmap_single)(struct hl_device *hdev,
-				dma_addr_t dma_addr, int len,
-				enum dma_data_direction dir);
-	dma_addr_t (*asic_dma_map_single)(struct hl_device *hdev,
-				void *addr, int len,
-				enum dma_data_direction dir);
 	void (*hl_dma_unmap_sgtable)(struct hl_device *hdev,
 				struct sg_table *sgt,
 				enum dma_data_direction dir);
diff --git a/drivers/accel/habanalabs/gaudi2/gaudi2.c b/drivers/accel/habanalabs/gaudi2/gaudi2.c
index 35db02e5010b..be4a745f8548 100644
--- a/drivers/accel/habanalabs/gaudi2/gaudi2.c
+++ b/drivers/accel/habanalabs/gaudi2/gaudi2.c
@@ -6731,24 +6731,6 @@ static void gaudi2_cpu_accessible_dma_pool_free(struct hl_device *hdev, size_t s
 	hl_fw_cpu_accessible_dma_pool_free(hdev, size, vaddr);
 }
 
-static dma_addr_t gaudi2_dma_map_single(struct hl_device *hdev, void *addr, int len,
-					enum dma_data_direction dir)
-{
-	dma_addr_t dma_addr;
-
-	dma_addr = dma_map_single(&hdev->pdev->dev, addr, len, dir);
-	if (unlikely(dma_mapping_error(&hdev->pdev->dev, dma_addr)))
-		return 0;
-
-	return dma_addr;
-}
-
-static void gaudi2_dma_unmap_single(struct hl_device *hdev, dma_addr_t addr, int len,
-					enum dma_data_direction dir)
-{
-	dma_unmap_single(&hdev->pdev->dev, addr, len, dir);
-}
-
 static int gaudi2_validate_cb_address(struct hl_device *hdev, struct hl_cs_parser *parser)
 {
 	struct asic_fixed_properties *asic_prop = &hdev->asic_prop;
@@ -11515,8 +11497,6 @@ static const struct hl_asic_funcs gaudi2_funcs = {
 	.asic_dma_pool_free = gaudi2_dma_pool_free,
 	.cpu_accessible_dma_pool_alloc = gaudi2_cpu_accessible_dma_pool_alloc,
 	.cpu_accessible_dma_pool_free = gaudi2_cpu_accessible_dma_pool_free,
-	.asic_dma_unmap_single = gaudi2_dma_unmap_single,
-	.asic_dma_map_single = gaudi2_dma_map_single,
 	.hl_dma_unmap_sgtable = hl_dma_unmap_sgtable,
 	.cs_parser = gaudi2_cs_parser,
 	.asic_dma_map_sgtable = hl_dma_map_sgtable,
-- 
2.34.1

