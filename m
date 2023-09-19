Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 10E587A5FC4
	for <lists+dri-devel@lfdr.de>; Tue, 19 Sep 2023 12:38:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE48210E386;
	Tue, 19 Sep 2023 10:38:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 872A110E26B
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Sep 2023 10:37:59 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 31024CE1298;
 Tue, 19 Sep 2023 10:37:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99995C433C8;
 Tue, 19 Sep 2023 10:37:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1695119875;
 bh=NTjLq7+6UbJfoIfUVQks2QbFCC0wzfa7rwllpto2Lu0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=cTI40pOumsiPTz3bMH6Fx/zS2IqpuvjHWNIe3ZDbgYoq6S+g6d89GtIs2ZKNjn9q8
 6EV10HZgPm/bavO5wXUiGOB8KXe6ty1FS5iHzKwMXREL+gHEKKggvzr0elhyR1geVN
 trz4Kpt1eneB13kIYad1ZcMBwMC2oCjiOJkFPFWLa4Ot+/1tzXzFNmHMoPmq5khGJt
 cozzAAfhJtTCPhESQVkywGXCxJyklH+3GJAks0vvycMZDnNo3EMHmJ+m2MKk4AlnBU
 9NqFNGXUf3nz8qsEQtehc0TLfiK3d5gDlpoATlATNsKmNEa94FvrsqWw8KFiAKwcZm
 RKpbzaJ9e/AZg==
From: Oded Gabbay <ogabbay@kernel.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 3/3] accel/habanalabs: trace dma map sgtable
Date: Tue, 19 Sep 2023 13:37:47 +0300
Message-Id: <20230919103747.955418-3-ogabbay@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230919103747.955418-1-ogabbay@kernel.org>
References: <20230919103747.955418-1-ogabbay@kernel.org>
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
Cc: Ohad Sharabi <osharabi@habana.ai>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Ohad Sharabi <osharabi@habana.ai>

Traces the DMA [un]map_sgtable using the new traces we added.

Signed-off-by: Ohad Sharabi <osharabi@habana.ai>
Reviewed-by: Oded Gabbay <ogabbay@kernel.org>
Signed-off-by: Oded Gabbay <ogabbay@kernel.org>
---
 drivers/accel/habanalabs/common/device.c     | 46 +++++++++++++++++++-
 drivers/accel/habanalabs/common/habanalabs.h | 25 +++++++----
 drivers/accel/habanalabs/common/memory.c     |  4 +-
 drivers/accel/habanalabs/gaudi/gaudi.c       |  6 +--
 drivers/accel/habanalabs/gaudi2/gaudi2.c     |  4 +-
 drivers/accel/habanalabs/goya/goya.c         |  6 +--
 6 files changed, 71 insertions(+), 20 deletions(-)

diff --git a/drivers/accel/habanalabs/common/device.c b/drivers/accel/habanalabs/common/device.c
index d31f228533c0..086769a9c551 100644
--- a/drivers/accel/habanalabs/common/device.c
+++ b/drivers/accel/habanalabs/common/device.c
@@ -188,7 +188,31 @@ void hl_cpu_accessible_dma_pool_free(struct hl_device *hdev, size_t size, void *
 	hdev->asic_funcs->cpu_accessible_dma_pool_free(hdev, size, vaddr);
 }
 
-int hl_dma_map_sgtable(struct hl_device *hdev, struct sg_table *sgt, enum dma_data_direction dir)
+int hl_dma_map_sgtable_caller(struct hl_device *hdev, struct sg_table *sgt,
+				enum dma_data_direction dir, const char *caller)
+{
+	struct asic_fixed_properties *prop = &hdev->asic_prop;
+	struct scatterlist *sg;
+	int rc, i;
+
+	rc = hdev->asic_funcs->dma_map_sgtable(hdev, sgt, dir);
+	if (rc)
+		return rc;
+
+	if (!trace_habanalabs_dma_map_page_enabled())
+		return 0;
+
+	for_each_sgtable_dma_sg(sgt, sg, i)
+		trace_habanalabs_dma_map_page(hdev->dev,
+				page_to_phys(sg_page(sg)),
+				sg->dma_address - prop->device_dma_offset_for_host_access,
+				sg->dma_length, dir, caller);
+
+	return 0;
+}
+
+int hl_asic_dma_map_sgtable(struct hl_device *hdev, struct sg_table *sgt,
+				enum dma_data_direction dir)
 {
 	struct asic_fixed_properties *prop = &hdev->asic_prop;
 	struct scatterlist *sg;
@@ -206,7 +230,25 @@ int hl_dma_map_sgtable(struct hl_device *hdev, struct sg_table *sgt, enum dma_da
 	return 0;
 }
 
-void hl_dma_unmap_sgtable(struct hl_device *hdev, struct sg_table *sgt, enum dma_data_direction dir)
+void hl_dma_unmap_sgtable_caller(struct hl_device *hdev, struct sg_table *sgt,
+					enum dma_data_direction dir, const char *caller)
+{
+	struct asic_fixed_properties *prop = &hdev->asic_prop;
+	struct scatterlist *sg;
+	int i;
+
+	hdev->asic_funcs->dma_unmap_sgtable(hdev, sgt, dir);
+
+	if (trace_habanalabs_dma_unmap_page_enabled()) {
+		for_each_sgtable_dma_sg(sgt, sg, i)
+			trace_habanalabs_dma_unmap_page(hdev->dev, page_to_phys(sg_page(sg)),
+					sg->dma_address - prop->device_dma_offset_for_host_access,
+					sg->dma_length, dir, caller);
+	}
+}
+
+void hl_asic_dma_unmap_sgtable(struct hl_device *hdev, struct sg_table *sgt,
+				enum dma_data_direction dir)
 {
 	struct asic_fixed_properties *prop = &hdev->asic_prop;
 	struct scatterlist *sg;
diff --git a/drivers/accel/habanalabs/common/habanalabs.h b/drivers/accel/habanalabs/common/habanalabs.h
index 4f667ac46301..b1b1c51aa5b1 100644
--- a/drivers/accel/habanalabs/common/habanalabs.h
+++ b/drivers/accel/habanalabs/common/habanalabs.h
@@ -159,6 +159,11 @@ enum hl_mmu_page_table_location {
 #define hl_asic_dma_pool_free(hdev, vaddr, dma_addr) \
 	hl_asic_dma_pool_free_caller(hdev, vaddr, dma_addr, __func__)
 
+#define hl_dma_map_sgtable(hdev, sgt, dir) \
+	hl_dma_map_sgtable_caller(hdev, sgt, dir, __func__)
+#define hl_dma_unmap_sgtable(hdev, sgt, dir) \
+	hl_dma_unmap_sgtable_caller(hdev, sgt, dir, __func__)
+
 /*
  * Reset Flags
  *
@@ -1520,9 +1525,9 @@ struct engines_data {
  * @asic_dma_pool_free: free small DMA allocation from pool.
  * @cpu_accessible_dma_pool_alloc: allocate CPU PQ packet from DMA pool.
  * @cpu_accessible_dma_pool_free: free CPU PQ packet from DMA pool.
- * @hl_dma_unmap_sgtable: DMA unmap scatter-gather table.
+ * @dma_unmap_sgtable: DMA unmap scatter-gather table.
+ * @dma_map_sgtable: DMA map scatter-gather table.
  * @cs_parser: parse Command Submission.
- * @asic_dma_map_sgtable: DMA map scatter-gather table.
  * @add_end_of_cb_packets: Add packets to the end of CB, if device requires it.
  * @update_eq_ci: update event queue CI.
  * @context_switch: called upon ASID context switch.
@@ -1643,12 +1648,11 @@ struct hl_asic_funcs {
 				size_t size, dma_addr_t *dma_handle);
 	void (*cpu_accessible_dma_pool_free)(struct hl_device *hdev,
 				size_t size, void *vaddr);
-	void (*hl_dma_unmap_sgtable)(struct hl_device *hdev,
-				struct sg_table *sgt,
+	void (*dma_unmap_sgtable)(struct hl_device *hdev, struct sg_table *sgt,
 				enum dma_data_direction dir);
-	int (*cs_parser)(struct hl_device *hdev, struct hl_cs_parser *parser);
-	int (*asic_dma_map_sgtable)(struct hl_device *hdev, struct sg_table *sgt,
+	int (*dma_map_sgtable)(struct hl_device *hdev, struct sg_table *sgt,
 				enum dma_data_direction dir);
+	int (*cs_parser)(struct hl_device *hdev, struct hl_cs_parser *parser);
 	void (*add_end_of_cb_packets)(struct hl_device *hdev,
 					void *kernel_address, u32 len,
 					u32 original_len,
@@ -3670,8 +3674,13 @@ void *hl_asic_dma_pool_zalloc_caller(struct hl_device *hdev, size_t size, gfp_t
 					dma_addr_t *dma_handle, const char *caller);
 void hl_asic_dma_pool_free_caller(struct hl_device *hdev, void *vaddr, dma_addr_t dma_addr,
 					const char *caller);
-int hl_dma_map_sgtable(struct hl_device *hdev, struct sg_table *sgt, enum dma_data_direction dir);
-void hl_dma_unmap_sgtable(struct hl_device *hdev, struct sg_table *sgt,
+int hl_dma_map_sgtable_caller(struct hl_device *hdev, struct sg_table *sgt,
+				enum dma_data_direction dir, const char *caller);
+void hl_dma_unmap_sgtable_caller(struct hl_device *hdev, struct sg_table *sgt,
+					enum dma_data_direction dir, const char *caller);
+int hl_asic_dma_map_sgtable(struct hl_device *hdev, struct sg_table *sgt,
+				enum dma_data_direction dir);
+void hl_asic_dma_unmap_sgtable(struct hl_device *hdev, struct sg_table *sgt,
 				enum dma_data_direction dir);
 int hl_access_sram_dram_region(struct hl_device *hdev, u64 addr, u64 *val,
 	enum debugfs_access_type acc_type, enum pci_region region_type, bool set_dram_bar);
diff --git a/drivers/accel/habanalabs/common/memory.c b/drivers/accel/habanalabs/common/memory.c
index 33fb78aba812..dff755614a65 100644
--- a/drivers/accel/habanalabs/common/memory.c
+++ b/drivers/accel/habanalabs/common/memory.c
@@ -244,7 +244,7 @@ static int dma_map_host_va(struct hl_device *hdev, u64 addr, u64 size,
 
 	*p_userptr = userptr;
 
-	rc = hdev->asic_funcs->asic_dma_map_sgtable(hdev, userptr->sgt, DMA_BIDIRECTIONAL);
+	rc = hl_dma_map_sgtable(hdev, userptr->sgt, DMA_BIDIRECTIONAL);
 	if (rc) {
 		dev_err(hdev->dev, "failed to map sgt with DMA region\n");
 		goto dma_map_err;
@@ -2444,7 +2444,7 @@ void hl_unpin_host_memory(struct hl_device *hdev, struct hl_userptr *userptr)
 	hl_debugfs_remove_userptr(hdev, userptr);
 
 	if (userptr->dma_mapped)
-		hdev->asic_funcs->hl_dma_unmap_sgtable(hdev, userptr->sgt, userptr->dir);
+		hl_dma_unmap_sgtable(hdev, userptr->sgt, userptr->dir);
 
 	unpin_user_pages_dirty_lock(userptr->pages, userptr->npages, true);
 	kvfree(userptr->pages);
diff --git a/drivers/accel/habanalabs/gaudi/gaudi.c b/drivers/accel/habanalabs/gaudi/gaudi.c
index 29fb71c8b47f..31e04af46876 100644
--- a/drivers/accel/habanalabs/gaudi/gaudi.c
+++ b/drivers/accel/habanalabs/gaudi/gaudi.c
@@ -4908,7 +4908,7 @@ static int gaudi_pin_memory_before_cs(struct hl_device *hdev,
 
 	list_add_tail(&userptr->job_node, parser->job_userptr_list);
 
-	rc = hdev->asic_funcs->asic_dma_map_sgtable(hdev, userptr->sgt, dir);
+	rc = hl_dma_map_sgtable(hdev, userptr->sgt, dir);
 	if (rc) {
 		dev_err(hdev->dev, "failed to map sgt with DMA region\n");
 		goto unpin_memory;
@@ -9144,9 +9144,9 @@ static const struct hl_asic_funcs gaudi_funcs = {
 	.asic_dma_pool_free = gaudi_dma_pool_free,
 	.cpu_accessible_dma_pool_alloc = gaudi_cpu_accessible_dma_pool_alloc,
 	.cpu_accessible_dma_pool_free = gaudi_cpu_accessible_dma_pool_free,
-	.hl_dma_unmap_sgtable = hl_dma_unmap_sgtable,
+	.dma_unmap_sgtable = hl_asic_dma_unmap_sgtable,
 	.cs_parser = gaudi_cs_parser,
-	.asic_dma_map_sgtable = hl_dma_map_sgtable,
+	.dma_map_sgtable = hl_asic_dma_map_sgtable,
 	.add_end_of_cb_packets = gaudi_add_end_of_cb_packets,
 	.update_eq_ci = gaudi_update_eq_ci,
 	.context_switch = gaudi_context_switch,
diff --git a/drivers/accel/habanalabs/gaudi2/gaudi2.c b/drivers/accel/habanalabs/gaudi2/gaudi2.c
index be4a745f8548..819660c684cf 100644
--- a/drivers/accel/habanalabs/gaudi2/gaudi2.c
+++ b/drivers/accel/habanalabs/gaudi2/gaudi2.c
@@ -11497,9 +11497,9 @@ static const struct hl_asic_funcs gaudi2_funcs = {
 	.asic_dma_pool_free = gaudi2_dma_pool_free,
 	.cpu_accessible_dma_pool_alloc = gaudi2_cpu_accessible_dma_pool_alloc,
 	.cpu_accessible_dma_pool_free = gaudi2_cpu_accessible_dma_pool_free,
-	.hl_dma_unmap_sgtable = hl_dma_unmap_sgtable,
+	.dma_unmap_sgtable = hl_asic_dma_unmap_sgtable,
 	.cs_parser = gaudi2_cs_parser,
-	.asic_dma_map_sgtable = hl_dma_map_sgtable,
+	.dma_map_sgtable = hl_asic_dma_map_sgtable,
 	.add_end_of_cb_packets = NULL,
 	.update_eq_ci = gaudi2_update_eq_ci,
 	.context_switch = gaudi2_context_switch,
diff --git a/drivers/accel/habanalabs/goya/goya.c b/drivers/accel/habanalabs/goya/goya.c
index 024ccf2e159b..1322cb330c57 100644
--- a/drivers/accel/habanalabs/goya/goya.c
+++ b/drivers/accel/habanalabs/goya/goya.c
@@ -3358,7 +3358,7 @@ static int goya_pin_memory_before_cs(struct hl_device *hdev,
 
 	list_add_tail(&userptr->job_node, parser->job_userptr_list);
 
-	rc = hdev->asic_funcs->asic_dma_map_sgtable(hdev, userptr->sgt, dir);
+	rc = hl_dma_map_sgtable(hdev, userptr->sgt, dir);
 	if (rc) {
 		dev_err(hdev->dev, "failed to map sgt with DMA region\n");
 		goto unpin_memory;
@@ -5465,9 +5465,9 @@ static const struct hl_asic_funcs goya_funcs = {
 	.asic_dma_pool_free = goya_dma_pool_free,
 	.cpu_accessible_dma_pool_alloc = goya_cpu_accessible_dma_pool_alloc,
 	.cpu_accessible_dma_pool_free = goya_cpu_accessible_dma_pool_free,
-	.hl_dma_unmap_sgtable = hl_dma_unmap_sgtable,
+	.dma_unmap_sgtable = hl_asic_dma_unmap_sgtable,
 	.cs_parser = goya_cs_parser,
-	.asic_dma_map_sgtable = hl_dma_map_sgtable,
+	.dma_map_sgtable = hl_asic_dma_map_sgtable,
 	.add_end_of_cb_packets = goya_add_end_of_cb_packets,
 	.update_eq_ci = goya_update_eq_ci,
 	.context_switch = goya_context_switch,
-- 
2.34.1

