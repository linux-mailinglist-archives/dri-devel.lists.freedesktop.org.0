Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FA237A4B10
	for <lists+dri-devel@lfdr.de>; Mon, 18 Sep 2023 16:32:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4063610E190;
	Mon, 18 Sep 2023 14:32:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 974CC10E1A4
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Sep 2023 14:32:13 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C7D9861140;
 Mon, 18 Sep 2023 14:32:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F271C32789;
 Mon, 18 Sep 2023 14:32:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1695047532;
 bh=Cto32TG6gL6s//uxAZ/DB7cW9t2kgyOg4eawDG+DdXs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=a7Xk/v4ZcwxIsl5/nejB/vQLxEoJCTKuJshfw8TtfIjPWXeDRQWiqbn+WyEkeG96O
 E8r2fXzbHND+tdpxn/8rjEg/zT8fTQc97QNf4e94OVdApxQEmIrBMEhzpyFmDw1aCl
 brpmoARqwMNiQictfWcAhEkFJ4XE7E3P9yCHbQCpB9f+DuRbUHvRd7RCt8TJv5Lha9
 qzOH+ZeQxmH/JtvyIm/vazC4qSozPjoAL8lbQ3cLrsz00365Oz6dQll3f9Z6c4ZQec
 3cT/DkV8VylT+61CHE44Fgzaenh1bsDxTM9UGzDmIO2c+amr+1epQBtlDaKt4Kgc4t
 FVxlftvdRpqtA==
From: Oded Gabbay <ogabbay@kernel.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 06/10] accel/habanalabs: add missing offset handling for
 dma-buf
Date: Mon, 18 Sep 2023 17:31:54 +0300
Message-Id: <20230918143158.903207-6-ogabbay@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230918143158.903207-1-ogabbay@kernel.org>
References: <20230918143158.903207-1-ogabbay@kernel.org>
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

On devices with virtual device memory (Gaudi2 onwards), user can provide
an offset within an allocated device memory from which he wants to
export a dma-buf object.
The offset value is verified by driver, but it is not taken into
consideration when the importer driver maps the dma-buf and the SG table
it prepared.
Add the missing offset handling.

Signed-off-by: Tomer Tayar <ttayar@habana.ai>
Reviewed-by: Oded Gabbay <ogabbay@kernel.org>
Signed-off-by: Oded Gabbay <ogabbay@kernel.org>
---
 drivers/accel/habanalabs/common/habanalabs.h |  3 +
 drivers/accel/habanalabs/common/memory.c     | 75 +++++++++++---------
 2 files changed, 43 insertions(+), 35 deletions(-)

diff --git a/drivers/accel/habanalabs/common/habanalabs.h b/drivers/accel/habanalabs/common/habanalabs.h
index 43e682cdeb75..874ae76cbd78 100644
--- a/drivers/accel/habanalabs/common/habanalabs.h
+++ b/drivers/accel/habanalabs/common/habanalabs.h
@@ -1811,6 +1811,8 @@ struct hl_cs_counters_atomic {
  * @phys_pg_pack: pointer to physical page pack if the dma-buf was exported
  *                where virtual memory is supported.
  * @memhash_hnode: pointer to the memhash node. this object holds the export count.
+ * @offset: the offset into the buffer from which the memory is exported.
+ *          Relevant only if virtual memory is supported and phys_pg_pack is being used.
  * device_phys_addr: physical address of the device's memory. Relevant only
  *                   if phys_pg_pack is NULL (dma-buf was exported from address).
  *                   The total size can be taken from the dmabuf object.
@@ -1820,6 +1822,7 @@ struct hl_dmabuf_priv {
 	struct hl_ctx			*ctx;
 	struct hl_vm_phys_pg_pack	*phys_pg_pack;
 	struct hl_vm_hash_node		*memhash_hnode;
+	u64				offset;
 	u64				device_phys_addr;
 };
 
diff --git a/drivers/accel/habanalabs/common/memory.c b/drivers/accel/habanalabs/common/memory.c
index dc5ff3e74c39..00e73b5573be 100644
--- a/drivers/accel/habanalabs/common/memory.c
+++ b/drivers/accel/habanalabs/common/memory.c
@@ -1532,11 +1532,11 @@ static int set_dma_sg(struct scatterlist *sg, u64 bar_address, u64 chunk_size,
 }
 
 static struct sg_table *alloc_sgt_from_device_pages(struct hl_device *hdev, u64 *pages, u64 npages,
-						u64 page_size, u64 exported_size,
+						u64 page_size, u64 exported_size, u64 offset,
 						struct device *dev, enum dma_data_direction dir)
 {
 	u64 dma_max_seg_size, curr_page, size, chunk_size, left_size_to_export, left_size_in_page,
-		left_size_in_dma_seg, device_address, bar_address;
+		left_size_in_dma_seg, device_address, bar_address, start_page;
 	struct asic_fixed_properties *prop = &hdev->asic_prop;
 	struct scatterlist *sg;
 	unsigned int nents, i;
@@ -1557,11 +1557,20 @@ static struct sg_table *alloc_sgt_from_device_pages(struct hl_device *hdev, u64
 	if (!sgt)
 		return ERR_PTR(-ENOMEM);
 
+	/* Use the offset to move to the actual first page that is exported */
+	for (start_page = 0 ; start_page < npages ; ++start_page) {
+		if (offset < page_size)
+			break;
+
+		/* The offset value was validated so there can't be an underflow */
+		offset -= page_size;
+	}
+
 	/* Calculate the required number of entries for the SG table */
-	curr_page = 0;
+	curr_page = start_page;
 	nents = 1;
 	left_size_to_export = exported_size;
-	left_size_in_page = page_size;
+	left_size_in_page = page_size - offset;
 	left_size_in_dma_seg = dma_max_seg_size;
 	next_sg_entry = false;
 
@@ -1599,10 +1608,10 @@ static struct sg_table *alloc_sgt_from_device_pages(struct hl_device *hdev, u64
 		goto err_free_sgt;
 
 	/* Prepare the SG table entries */
-	curr_page = 0;
-	device_address = pages[curr_page];
+	curr_page = start_page;
+	device_address = pages[curr_page] + offset;
 	left_size_to_export = exported_size;
-	left_size_in_page = page_size;
+	left_size_in_page = page_size - offset;
 	left_size_in_dma_seg = dma_max_seg_size;
 	next_sg_entry = false;
 
@@ -1708,7 +1717,7 @@ static int hl_dmabuf_attach(struct dma_buf *dmabuf,
 static struct sg_table *hl_map_dmabuf(struct dma_buf_attachment *attachment,
 					enum dma_data_direction dir)
 {
-	u64 *pages, npages, page_size, exported_size;
+	u64 *pages, npages, page_size, exported_size, offset;
 	struct dma_buf *dma_buf = attachment->dmabuf;
 	struct hl_vm_phys_pg_pack *phys_pg_pack;
 	struct hl_dmabuf_priv *hl_dmabuf;
@@ -1723,6 +1732,7 @@ static struct sg_table *hl_map_dmabuf(struct dma_buf_attachment *attachment,
 	hl_dmabuf = dma_buf->priv;
 	hdev = hl_dmabuf->ctx->hdev;
 	exported_size = hl_dmabuf->dmabuf->size;
+	offset = hl_dmabuf->offset;
 	phys_pg_pack = hl_dmabuf->phys_pg_pack;
 
 	if (phys_pg_pack) {
@@ -1735,7 +1745,7 @@ static struct sg_table *hl_map_dmabuf(struct dma_buf_attachment *attachment,
 		page_size = hl_dmabuf->dmabuf->size;
 	}
 
-	sgt = alloc_sgt_from_device_pages(hdev, pages, npages, page_size, exported_size,
+	sgt = alloc_sgt_from_device_pages(hdev, pages, npages, page_size, exported_size, offset,
 						attachment->dev, dir);
 	if (IS_ERR(sgt))
 		dev_err(hdev->dev, "failed (%ld) to initialize sgt for dmabuf\n", PTR_ERR(sgt));
@@ -1881,12 +1891,12 @@ static int export_dmabuf(struct hl_ctx *ctx,
 	return rc;
 }
 
-static int validate_export_params_common(struct hl_device *hdev, u64 device_addr, u64 size)
+static int validate_export_params_common(struct hl_device *hdev, u64 addr, u64 size, u64 offset)
 {
-	if (!PAGE_ALIGNED(device_addr)) {
+	if (!PAGE_ALIGNED(addr)) {
 		dev_dbg(hdev->dev,
 			"exported device memory address 0x%llx should be aligned to PAGE_SIZE 0x%lx\n",
-			device_addr, PAGE_SIZE);
+			addr, PAGE_SIZE);
 		return -EINVAL;
 	}
 
@@ -1897,6 +1907,13 @@ static int validate_export_params_common(struct hl_device *hdev, u64 device_addr
 		return -EINVAL;
 	}
 
+	if (!PAGE_ALIGNED(offset)) {
+		dev_dbg(hdev->dev,
+			"exported device memory offset %llu should be a multiple of PAGE_SIZE %lu\n",
+			offset, PAGE_SIZE);
+		return -EINVAL;
+	}
+
 	return 0;
 }
 
@@ -1906,13 +1923,13 @@ static int validate_export_params_no_mmu(struct hl_device *hdev, u64 device_addr
 	u64 bar_address;
 	int rc;
 
-	rc = validate_export_params_common(hdev, device_addr, size);
+	rc = validate_export_params_common(hdev, device_addr, size, 0);
 	if (rc)
 		return rc;
 
 	if (device_addr < prop->dram_user_base_address ||
-				(device_addr + size) > prop->dram_end_address ||
-				(device_addr + size) < device_addr) {
+			(device_addr + size) > prop->dram_end_address ||
+			(device_addr + size) < device_addr) {
 		dev_dbg(hdev->dev,
 			"DRAM memory range 0x%llx (+0x%llx) is outside of DRAM boundaries\n",
 			device_addr, size);
@@ -1939,36 +1956,26 @@ static int validate_export_params(struct hl_device *hdev, u64 device_addr, u64 s
 	u64 bar_address;
 	int i, rc;
 
-	rc = validate_export_params_common(hdev, device_addr, size);
+	rc = validate_export_params_common(hdev, device_addr, size, offset);
 	if (rc)
 		return rc;
 
-	if (!PAGE_ALIGNED(offset)) {
-		dev_dbg(hdev->dev,
-			"exported device memory offset %llu should be a multiple of PAGE_SIZE %lu\n",
-			offset, PAGE_SIZE);
-		return -EINVAL;
-	}
-
 	if ((offset + size) > phys_pg_pack->total_size) {
 		dev_dbg(hdev->dev, "offset %#llx and size %#llx exceed total map size %#llx\n",
-				offset, size, phys_pg_pack->total_size);
+			offset, size, phys_pg_pack->total_size);
 		return -EINVAL;
 	}
 
 	for (i = 0 ; i < phys_pg_pack->npages ; i++) {
-
 		bar_address = hdev->dram_pci_bar_start +
-					(phys_pg_pack->pages[i] - prop->dram_base_address);
+				(phys_pg_pack->pages[i] - prop->dram_base_address);
 
 		if ((bar_address + phys_pg_pack->page_size) >
 				(hdev->dram_pci_bar_start + prop->dram_pci_bar_size) ||
 				(bar_address + phys_pg_pack->page_size) < bar_address) {
 			dev_dbg(hdev->dev,
 				"DRAM memory range 0x%llx (+0x%x) is outside of PCI BAR boundaries\n",
-					phys_pg_pack->pages[i],
-					phys_pg_pack->page_size);
-
+				phys_pg_pack->pages[i], phys_pg_pack->page_size);
 			return -EINVAL;
 		}
 	}
@@ -2024,7 +2031,6 @@ static int export_dmabuf_from_addr(struct hl_ctx *ctx, u64 addr, u64 size, u64 o
 	struct asic_fixed_properties *prop;
 	struct hl_dmabuf_priv *hl_dmabuf;
 	struct hl_device *hdev;
-	u64 export_addr;
 	int rc;
 
 	hdev = ctx->hdev;
@@ -2036,8 +2042,6 @@ static int export_dmabuf_from_addr(struct hl_ctx *ctx, u64 addr, u64 size, u64 o
 		return -EINVAL;
 	}
 
-	export_addr = addr + offset;
-
 	hl_dmabuf = kzalloc(sizeof(*hl_dmabuf), GFP_KERNEL);
 	if (!hl_dmabuf)
 		return -ENOMEM;
@@ -2053,18 +2057,19 @@ static int export_dmabuf_from_addr(struct hl_ctx *ctx, u64 addr, u64 size, u64 o
 			rc = PTR_ERR(phys_pg_pack);
 			goto dec_memhash_export_cnt;
 		}
-		rc = validate_export_params(hdev, export_addr, size, offset, phys_pg_pack);
+		rc = validate_export_params(hdev, addr, size, offset, phys_pg_pack);
 		if (rc)
 			goto dec_memhash_export_cnt;
 
 		hl_dmabuf->phys_pg_pack = phys_pg_pack;
 		hl_dmabuf->memhash_hnode = hnode;
+		hl_dmabuf->offset = offset;
 	} else {
-		rc = validate_export_params_no_mmu(hdev, export_addr, size);
+		rc = validate_export_params_no_mmu(hdev, addr, size);
 		if (rc)
 			goto err_free_dmabuf_wrapper;
 
-		hl_dmabuf->device_phys_addr = export_addr;
+		hl_dmabuf->device_phys_addr = addr;
 	}
 
 	rc = export_dmabuf(ctx, hl_dmabuf, size, flags, dmabuf_fd);
-- 
2.34.1

