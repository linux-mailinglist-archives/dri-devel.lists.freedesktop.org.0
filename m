Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 753D23BBD47
	for <lists+dri-devel@lfdr.de>; Mon,  5 Jul 2021 15:03:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 410FF89861;
	Mon,  5 Jul 2021 13:03:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D03789701;
 Mon,  5 Jul 2021 13:03:37 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id A37DD61483;
 Mon,  5 Jul 2021 13:03:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1625490217;
 bh=QPfuVRRNetYfxzh8B2RQfAdW+GIv0+LbWhl6t57g7xU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=RiYAV7llMM7rT02L9K95ag+Hku52IB2scj2O4CAoxciWQj/zbjsdX1qgas2PCqYSZ
 iPWC6P4SYbdGVNbN24rerAMGCeBDg4Zib8YqYGZRkeUaw9NDCThMyJLH56PXX7kXzI
 BHuddPRLocYwjCH1B8ARi8OwUg4rFhXQghwj1PPTePw1y+zlilapifQqF3lvy9XJLK
 Lbl7DZI41mtkZ2EulfNmYJi2PfzjUsDwUrD3dp+FA9fpaWMqr4SRTD/AaioxOFRpTt
 5+tSpVw0yl6Hn2Z/2zODAAYeY4BbrSnyYJxEYuOnuzHYe1ivtWPcxK3t0152S6A7gE
 zvypTPEJddZfw==
From: Oded Gabbay <ogabbay@kernel.org>
To: linux-kernel@vger.kernel.org,
	gregkh@linuxfoundation.org
Subject: [PATCH v4 2/2] habanalabs: add support for dma-buf exporter
Date: Mon,  5 Jul 2021 16:03:14 +0300
Message-Id: <20210705130314.11519-3-ogabbay@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210705130314.11519-1-ogabbay@kernel.org>
References: <20210705130314.11519-1-ogabbay@kernel.org>
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
Cc: linux-rdma@vger.kernel.org, daniel.vetter@ffwll.ch, sleybo@amazon.com,
 galpress@amazon.com, dri-devel@lists.freedesktop.org, christian.koenig@amd.com,
 linaro-mm-sig@lists.linaro.org, jgg@ziepe.ca, dledford@redhat.com, hch@lst.de,
 amd-gfx@lists.freedesktop.org, alexander.deucher@amd.com,
 Tomer Tayar <ttayar@habana.ai>, leonro@nvidia.com, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Tomer Tayar <ttayar@habana.ai>

Implement the calls to the dma-buf kernel api to create a dma-buf
object backed by FD.

We block the option to mmap the DMA-BUF object because we don't support
DIRECT_IO and implicit P2P. We only implement support for explicit P2P
through importing the FD of the DMA-BUF.

In the export phase, we provide a static SG list to the DMA-BUF object
because in  Habanalabs's ASICs, the device memory is pinned and
immutable. Therefore, there is no need for dynamic mappings and pinning
callbacks.

Note that in GAUDI we don't have an MMU towards the device memory and
the user works on physical addresses. Therefore, the user doesn't pass
through the kernel driver to allocate memory there. As a result, only
for GAUDI we receive from the user a device memory physical address
(instead of a handle) and a size.

To get the DMA address of the PCI bar, we use the dma_map_resources()
kernel API, because our device memory is not backed by page struct
and this API doesn't need page struct to map the physical address to
a DMA address.

We check the p2p distance using pci_p2pdma_distance_many() and refusing
to map dmabuf in case the distance doesn't allow p2p.

Signed-off-by: Tomer Tayar <ttayar@habana.ai>
Reviewed-by: Oded Gabbay <ogabbay@kernel.org>
Reviewed-by: Gal Pressman <galpress@amazon.com>
Signed-off-by: Oded Gabbay <ogabbay@kernel.org>
---
Changes in v4:
 - Using dma_map_resources() to map the physical address of the PCI BAR
   to a DMA'able address that the other device can use

 - Check the p2p distance using pci_p2pdma_distance_many() and refusing
   to map dmabuf in case the distance doesn't allow p2p.

 - Move the creation of the SGT to the dmabuf map callback to use the
   PCI device of the importer in the call to dma_map_resources()

 - Move validity check whether the device address is exposed on the bar
   to the export phase

 - Allocate sgt per map instead of using single one for dmabuf

 - Move split pages code only to export from address

 - Check this works between two Gaudi devices. For that, I implemented
   a simple import code to import the FD of the DMABUF into Gaudi's MMU.
   This code is not upstreamed as it isn't a functionality I would like
   to support but it was done to verify that the export works correctly
   in real p2p scenario.

 drivers/misc/habanalabs/Kconfig             |   1 +
 drivers/misc/habanalabs/common/habanalabs.h |  26 ++
 drivers/misc/habanalabs/common/memory.c     | 480 +++++++++++++++++++-
 drivers/misc/habanalabs/gaudi/gaudi.c       |   1 +
 drivers/misc/habanalabs/goya/goya.c         |   1 +
 5 files changed, 505 insertions(+), 4 deletions(-)

diff --git a/drivers/misc/habanalabs/Kconfig b/drivers/misc/habanalabs/Kconfig
index 293d79811372..c82d2e7b2035 100644
--- a/drivers/misc/habanalabs/Kconfig
+++ b/drivers/misc/habanalabs/Kconfig
@@ -8,6 +8,7 @@ config HABANA_AI
 	depends on PCI && HAS_IOMEM
 	select GENERIC_ALLOCATOR
 	select HWMON
+	select DMA_SHARED_BUFFER
 	help
 	  Enables PCIe card driver for Habana's AI Processors (AIP) that are
 	  designed to accelerate Deep Learning inference and training workloads.
diff --git a/drivers/misc/habanalabs/common/habanalabs.h b/drivers/misc/habanalabs/common/habanalabs.h
index 9aedea471ebe..f2605030286e 100644
--- a/drivers/misc/habanalabs/common/habanalabs.h
+++ b/drivers/misc/habanalabs/common/habanalabs.h
@@ -26,6 +26,7 @@
 #include <linux/sched/signal.h>
 #include <linux/io-64-nonatomic-lo-hi.h>
 #include <linux/coresight.h>
+#include <linux/dma-buf.h>
 
 #define HL_NAME				"habanalabs"
 
@@ -1326,6 +1327,27 @@ struct hl_pending_cb {
 	u32			hw_queue_id;
 };
 
+/**
+ * struct hl_dmabuf_wrapper - a dma-buf wrapper object.
+ * @dmabuf: pointer to dma-buf object.
+ * @ctx: pointer to the dma-buf owner's context.
+ * @phys_pg_pack: pointer to physical page pack if the dma-buf was exported for
+ *                memory allocation handle.
+ * @pages: array of pages that represents the physical addresses in the device
+ *         memory. This is relevant in case phys_pg_pack is NULL (For Gaudi).
+ *         If phys_pg_pack is valid, we take the pages array from there.
+ * @npages: number of entries in pages array, relevant if phys_pg_pack is NULL
+ * @page_size: size of page in pages array, relevant if phys_pg_pack is NULL
+ */
+struct hl_dmabuf_wrapper {
+	struct dma_buf			*dmabuf;
+	struct hl_ctx			*ctx;
+	struct hl_vm_phys_pg_pack	*phys_pg_pack;
+	u64				*pages;
+	u64				npages;
+	u32				page_size;
+};
+
 /**
  * struct hl_ctx - user/kernel context.
  * @mem_hash: holds mapping from virtual address to virtual memory area
@@ -1634,6 +1656,7 @@ struct hl_vm_hw_block_list_node {
  * @npages: num physical pages in the pack.
  * @total_size: total size of all the pages in this list.
  * @mapping_cnt: number of shared mappings.
+ * @exporting_cnt: number of dma-buf exporting.
  * @asid: the context related to this list.
  * @page_size: size of each page in the pack.
  * @flags: HL_MEM_* flags related to this list.
@@ -1648,6 +1671,7 @@ struct hl_vm_phys_pg_pack {
 	u64			npages;
 	u64			total_size;
 	atomic_t		mapping_cnt;
+	u32			exporting_cnt;
 	u32			asid;
 	u32			page_size;
 	u32			flags;
@@ -2311,6 +2335,7 @@ struct hl_mmu_funcs {
  *                          the error will be ignored by the driver during
  *                          device initialization. Mainly used to debug and
  *                          workaround firmware bugs
+ * @dram_pci_bar_start: start bus address of PCIe bar towards DRAM.
  * @last_successful_open_jif: timestamp (jiffies) of the last successful
  *                            device open.
  * @last_open_session_duration_jif: duration (jiffies) of the last device open
@@ -2448,6 +2473,7 @@ struct hl_device {
 	u64				max_power;
 	u64				clock_gating_mask;
 	u64				boot_error_status_mask;
+	u64				dram_pci_bar_start;
 	u64				last_successful_open_jif;
 	u64				last_open_session_duration_jif;
 	u64				open_counter;
diff --git a/drivers/misc/habanalabs/common/memory.c b/drivers/misc/habanalabs/common/memory.c
index a05d98db4857..68e27a853812 100644
--- a/drivers/misc/habanalabs/common/memory.c
+++ b/drivers/misc/habanalabs/common/memory.c
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 
 /*
- * Copyright 2016-2019 HabanaLabs, Ltd.
+ * Copyright 2016-2021 HabanaLabs, Ltd.
  * All Rights Reserved.
  */
 
@@ -11,11 +11,19 @@
 
 #include <linux/uaccess.h>
 #include <linux/slab.h>
+#include <linux/pci-p2pdma.h>
 
 #define HL_MMU_DEBUG	0
 
 /* use small pages for supporting non-pow2 (32M/40M/48M) DRAM phys page sizes */
-#define DRAM_POOL_PAGE_SIZE SZ_8M
+#define DRAM_POOL_PAGE_SIZE		SZ_8M
+
+/* dma-buf alignment requirements when exporting memory with address/size */
+#define DMA_BUF_MEM_ADDR_ALIGNMENT	SZ_32M
+#define DMA_BUF_MEM_SIZE_ALIGNMENT	SZ_32M
+
+/* dma-buf chunk size cannot exceed the scatterlist "unsigned int" length */
+#define DMA_BUF_CHUNK_MAX_SIZE		SZ_512M
 
 /*
  * The va ranges in context object contain a list with the available chunks of
@@ -347,6 +355,13 @@ static int free_device_memory(struct hl_ctx *ctx, struct hl_mem_in *args)
 			return -EINVAL;
 		}
 
+		if (phys_pg_pack->exporting_cnt) {
+			dev_err(hdev->dev,
+				"handle %u is exported, cannot free\n",	handle);
+			spin_unlock(&vm->idr_lock);
+			return -EINVAL;
+		}
+
 		/*
 		 * must remove from idr before the freeing of the physical
 		 * pages as the refcount of the pool is also the trigger of the
@@ -1504,13 +1519,444 @@ int hl_hw_block_mmap(struct hl_fpriv *hpriv, struct vm_area_struct *vma)
 	return 0;
 }
 
+static int alloc_sgt_from_device_pages(struct hl_device *hdev,
+					struct sg_table **sgt, u64 *pages,
+					u64 npages, u64 page_size,
+					struct device *dev,
+					enum dma_data_direction dir)
+{
+	struct asic_fixed_properties *prop;
+	int rc, i, j, nents, cur_page;
+	u64 chunk_size, bar_address;
+	struct scatterlist *sg;
+	dma_addr_t addr;
+
+	prop = &hdev->asic_prop;
+
+	*sgt = kzalloc(sizeof(**sgt), GFP_KERNEL);
+	if (!*sgt)
+		return -ENOMEM;
+
+	/* Get number of non-contiguous chunks */
+	for (i = 1, nents = 1, chunk_size = page_size ; i < npages ; i++) {
+		if (pages[i - 1] + page_size != pages[i] ||
+				chunk_size + page_size >
+					DMA_BUF_CHUNK_MAX_SIZE) {
+			nents++;
+			chunk_size = page_size;
+			continue;
+		}
+
+		chunk_size += page_size;
+	}
+
+	rc = sg_alloc_table(*sgt, nents, GFP_KERNEL | __GFP_ZERO);
+	if (rc)
+		goto error_free;
+
+	/* Merge pages and put them into the scatterlist */
+	cur_page = 0;
+	for_each_sgtable_sg((*sgt), sg, i) {
+		chunk_size = page_size;
+		for (j = cur_page + 1 ; j < npages ; j++) {
+			if (pages[j - 1] + page_size != pages[j] ||
+					chunk_size + page_size >
+						DMA_BUF_CHUNK_MAX_SIZE)
+				break;
+			chunk_size += page_size;
+		}
+
+		bar_address = hdev->dram_pci_bar_start +
+				(pages[cur_page] - prop->dram_base_address);
+
+		addr = dma_map_resource(dev, bar_address, chunk_size, dir,
+					DMA_ATTR_SKIP_CPU_SYNC);
+		rc = dma_mapping_error(dev, addr);
+		if (rc)
+			goto error_unmap;
+
+		sg_set_page(sg, NULL, chunk_size, 0);
+		sg_dma_address(sg) = addr;
+		sg_dma_len(sg) = chunk_size;
+
+		cur_page = j;
+	}
+
+	return 0;
+
+error_unmap:
+	for_each_sgtable_sg((*sgt), sg, i) {
+		if (!sg_dma_len(sg))
+			continue;
+
+		dma_unmap_resource(dev, sg_dma_address(sg),
+					sg_dma_len(sg), dir,
+					DMA_ATTR_SKIP_CPU_SYNC);
+	}
+
+	sg_free_table(*sgt);
+
+error_free:
+	kfree(*sgt);
+	return rc;
+}
+
+static int hl_dmabuf_attach(struct dma_buf *dmabuf,
+				struct dma_buf_attachment *attachment)
+{
+	struct hl_dmabuf_wrapper *hl_dmabuf;
+	struct hl_device *hdev;
+	int rc;
+
+	hl_dmabuf = dmabuf->priv;
+	hdev = hl_dmabuf->ctx->hdev;
+
+	rc = pci_p2pdma_distance_many(hdev->pdev, &attachment->dev, 1, true);
+
+	if (rc < 0)
+		attachment->peer2peer = false;
+
+	return 0;
+}
+
+static struct sg_table *hl_map_dmabuf(struct dma_buf_attachment *attachment,
+					enum dma_data_direction dir)
+{
+	struct dma_buf *dma_buf = attachment->dmabuf;
+	struct hl_vm_phys_pg_pack *phys_pg_pack;
+	struct hl_dmabuf_wrapper *hl_dmabuf;
+	struct hl_device *hdev;
+	struct sg_table *sgt;
+	int rc;
+
+	hl_dmabuf = dma_buf->priv;
+	hdev = hl_dmabuf->ctx->hdev;
+	phys_pg_pack = hl_dmabuf->phys_pg_pack;
+
+	if (!attachment->peer2peer) {
+		dev_err(hdev->dev,
+			"Failed to map dmabuf because p2p is disabled\n");
+		return ERR_PTR(-EPERM);
+	}
+
+	if (phys_pg_pack)
+		rc = alloc_sgt_from_device_pages(hdev, &sgt,
+						phys_pg_pack->pages,
+						phys_pg_pack->npages,
+						phys_pg_pack->page_size,
+						attachment->dev,
+						dir);
+	else
+		rc = alloc_sgt_from_device_pages(hdev, &sgt,
+						hl_dmabuf->pages,
+						hl_dmabuf->npages,
+						hl_dmabuf->page_size,
+						attachment->dev,
+						dir);
+
+	if (rc) {
+		dev_err(hdev->dev,
+			"failed (%d) to initialize sgt for dmabuf\n",
+			rc);
+		return ERR_PTR(rc);
+	}
+
+	return sgt;
+}
+
+static void hl_unmap_dmabuf(struct dma_buf_attachment *attachment,
+				  struct sg_table *sgt,
+				  enum dma_data_direction dir)
+{
+	struct scatterlist *sg;
+	int i;
+
+	for_each_sgtable_sg(sgt, sg, i)
+		dma_unmap_resource(attachment->dev, sg_dma_address(sg),
+					sg_dma_len(sg), dir,
+					DMA_ATTR_SKIP_CPU_SYNC);
+	sg_free_table(sgt);
+	kfree(sgt);
+}
+
+static void hl_release_dmabuf(struct dma_buf *dmabuf)
+{
+	struct hl_dmabuf_wrapper *hl_dmabuf = dmabuf->priv;
+	struct hl_ctx *ctx = hl_dmabuf->ctx;
+	struct hl_device *hdev = ctx->hdev;
+	struct hl_vm *vm = &hdev->vm;
+
+	if (hl_dmabuf->phys_pg_pack) {
+		spin_lock(&vm->idr_lock);
+		hl_dmabuf->phys_pg_pack->exporting_cnt--;
+		spin_unlock(&vm->idr_lock);
+	}
+
+	hl_ctx_put(hl_dmabuf->ctx);
+
+	kfree(hl_dmabuf->pages);
+	kfree(hl_dmabuf);
+}
+
+static const struct dma_buf_ops habanalabs_dmabuf_ops = {
+	.attach = hl_dmabuf_attach,
+	.map_dma_buf = hl_map_dmabuf,
+	.unmap_dma_buf = hl_unmap_dmabuf,
+	.release = hl_release_dmabuf,
+};
+
+static int export_dmabuf_common(struct hl_ctx *ctx,
+				struct hl_dmabuf_wrapper *hl_dmabuf,
+				u64 total_size, int flags, int *dmabuf_fd)
+{
+	DEFINE_DMA_BUF_EXPORT_INFO(exp_info);
+	struct hl_device *hdev = ctx->hdev;
+	int rc, fd;
+
+	exp_info.ops = &habanalabs_dmabuf_ops;
+	exp_info.size = total_size;
+	exp_info.flags = flags;
+	exp_info.priv = hl_dmabuf;
+
+	hl_dmabuf->dmabuf = dma_buf_export(&exp_info);
+	if (IS_ERR(hl_dmabuf->dmabuf)) {
+		dev_err(hdev->dev, "failed to export dma-buf\n");
+		return PTR_ERR(hl_dmabuf->dmabuf);
+	}
+
+	fd = dma_buf_fd(hl_dmabuf->dmabuf, flags);
+	if (fd < 0) {
+		dev_err(hdev->dev,
+			"failed to get a file descriptor for a dma-buf\n");
+		rc = fd;
+		goto err_dma_buf_put;
+	}
+
+	hl_dmabuf->ctx = ctx;
+	hl_ctx_get(hdev, hl_dmabuf->ctx);
+
+	*dmabuf_fd = fd;
+
+	return 0;
+
+err_dma_buf_put:
+	dma_buf_put(hl_dmabuf->dmabuf);
+	return rc;
+}
+
+/**
+ * export_dmabuf_from_addr() - export a dma-buf object for the given memory
+ *                             address and size.
+ * @ctx: pointer to the context structure.
+ * @device_addr:  device memory physical address.
+ * @size: size of device memory.
+ * @flags: DMA-BUF file/FD flags.
+ * @dmabuf_fd: pointer to result FD that represents the dma-buf object.
+ *
+ * Create and export a dma-buf object for an existing memory allocation inside
+ * the device memory, and return a FD which is associated with the dma-buf
+ * object.
+ *
+ * Return: 0 on success, non-zero for failure.
+ */
+static int export_dmabuf_from_addr(struct hl_ctx *ctx, u64 device_addr,
+					u64 size, int flags, int *dmabuf_fd)
+{
+	struct hl_dmabuf_wrapper *hl_dmabuf;
+	struct hl_device *hdev = ctx->hdev;
+	struct asic_fixed_properties *prop;
+	u64 bar_address;
+	int rc, i;
+
+	prop = &hdev->asic_prop;
+
+	if (!IS_ALIGNED(device_addr, DMA_BUF_MEM_ADDR_ALIGNMENT)) {
+		dev_err_ratelimited(hdev->dev,
+			"address of exported device memory should be aligned to 0x%x, address 0x%llx\n",
+			DMA_BUF_MEM_ADDR_ALIGNMENT, device_addr);
+		return -EINVAL;
+	}
+
+	if (!size) {
+		dev_err_ratelimited(hdev->dev,
+			"size of exported device memory should be greater than 0\n");
+		return -EINVAL;
+	}
+
+	if (!IS_ALIGNED(size, DMA_BUF_MEM_SIZE_ALIGNMENT)) {
+		dev_err_ratelimited(hdev->dev,
+			"size of exported device memory should be aligned to 0x%x, size 0x%llx\n",
+			DMA_BUF_MEM_SIZE_ALIGNMENT, device_addr);
+		return -EINVAL;
+	}
+
+	if (device_addr < prop->dram_user_base_address ||
+				device_addr + size > prop->dram_end_address ||
+				device_addr + size < device_addr) {
+		dev_err_ratelimited(hdev->dev,
+			"DRAM memory range is outside of DRAM boundaries, address 0x%llx, size 0x%llx\n",
+			device_addr, size);
+		return -EINVAL;
+	}
+
+	bar_address = hdev->dram_pci_bar_start +
+			(device_addr - prop->dram_base_address);
+
+	if (bar_address + size >
+			hdev->dram_pci_bar_start + prop->dram_pci_bar_size ||
+			bar_address + size < bar_address) {
+		dev_err_ratelimited(hdev->dev,
+			"DRAM memory range is outside of PCI BAR boundaries, address 0x%llx, size 0x%llx\n",
+			device_addr, size);
+		return -EINVAL;
+	}
+
+	hl_dmabuf = kzalloc(sizeof(*hl_dmabuf), GFP_KERNEL);
+	if (!hl_dmabuf)
+		return -ENOMEM;
+
+	/* In case we got a large memory area to export, we need to divide it
+	 * to smaller areas because each entry in the dmabuf sgt can only
+	 * describe unsigned int.
+	 */
+	if (size > DMA_BUF_CHUNK_MAX_SIZE) {
+		hl_dmabuf->page_size = DMA_BUF_MEM_SIZE_ALIGNMENT;
+		hl_dmabuf->npages = div_u64(size, hl_dmabuf->page_size);
+	} else {
+		hl_dmabuf->page_size = size;
+		hl_dmabuf->npages = 1;
+	}
+
+	hl_dmabuf->pages = kcalloc(hl_dmabuf->npages, sizeof(*hl_dmabuf->pages),
+								GFP_KERNEL);
+	if (!hl_dmabuf->pages) {
+		rc = -ENOMEM;
+		goto err_free_dmabuf_wrapper;
+	}
+
+	for (i = 0 ; i < hl_dmabuf->npages ; i++)
+		hl_dmabuf->pages[i] = device_addr +
+					i * hl_dmabuf->page_size;
+
+	rc = export_dmabuf_common(ctx, hl_dmabuf, size, flags, dmabuf_fd);
+	if (rc)
+		goto err_free_pages;
+
+	return 0;
+
+err_free_pages:
+	kfree(hl_dmabuf->pages);
+err_free_dmabuf_wrapper:
+	kfree(hl_dmabuf);
+	return rc;
+}
+
+/**
+ * export_dmabuf_from_handle() - export a dma-buf object for the given memory
+ *                               handle.
+ * @ctx: pointer to the context structure.
+ * @handle: device memory allocation handle.
+ * @flags: DMA-BUF file/FD flags.
+ * @dmabuf_fd: pointer to result FD that represents the dma-buf object.
+ *
+ * Create and export a dma-buf object for an existing memory allocation inside
+ * the device memory, and return a FD which is associated with the dma-buf
+ * object.
+ *
+ * Return: 0 on success, non-zero for failure.
+ */
+static int export_dmabuf_from_handle(struct hl_ctx *ctx, u64 handle, int flags,
+					int *dmabuf_fd)
+{
+	struct hl_vm_phys_pg_pack *phys_pg_pack;
+	struct hl_dmabuf_wrapper *hl_dmabuf;
+	struct hl_device *hdev = ctx->hdev;
+	struct asic_fixed_properties *prop;
+	struct hl_vm *vm = &hdev->vm;
+	u64 bar_address;
+	u32 idr_handle;
+	int rc, i;
+
+	prop = &hdev->asic_prop;
+
+	idr_handle = lower_32_bits(handle);
+
+	spin_lock(&vm->idr_lock);
+
+	phys_pg_pack = idr_find(&vm->phys_pg_pack_handles, idr_handle);
+	if (!phys_pg_pack) {
+		spin_unlock(&vm->idr_lock);
+		dev_err_ratelimited(hdev->dev, "no match for handle 0x%x\n",
+				idr_handle);
+		return -EINVAL;
+	}
+
+	/* increment now to avoid freeing device memory while exporting */
+	phys_pg_pack->exporting_cnt++;
+
+	spin_unlock(&vm->idr_lock);
+
+	if (phys_pg_pack->vm_type != VM_TYPE_PHYS_PACK) {
+		dev_err_ratelimited(hdev->dev,
+				"handle 0x%llx is not for DRAM memory\n",
+				handle);
+		rc = -EINVAL;
+		goto err_dec_exporting_cnt;
+	}
+
+	for (i = 0 ; i < phys_pg_pack->npages ; i++) {
+
+		bar_address = hdev->dram_pci_bar_start +
+						(phys_pg_pack->pages[i] -
+						prop->dram_base_address);
+
+		if (bar_address + phys_pg_pack->page_size >
+			hdev->dram_pci_bar_start + prop->dram_pci_bar_size ||
+			bar_address + phys_pg_pack->page_size < bar_address) {
+
+			dev_err_ratelimited(hdev->dev,
+				"DRAM memory range is outside of PCI BAR boundaries, address 0x%llx, size 0x%x\n",
+				phys_pg_pack->pages[i],
+				phys_pg_pack->page_size);
+
+			rc = -EINVAL;
+			goto err_dec_exporting_cnt;
+		}
+	}
+
+	hl_dmabuf = kzalloc(sizeof(*hl_dmabuf), GFP_KERNEL);
+	if (!hl_dmabuf) {
+		rc = -ENOMEM;
+		goto err_dec_exporting_cnt;
+	}
+
+	hl_dmabuf->phys_pg_pack = phys_pg_pack;
+
+	rc = export_dmabuf_common(ctx, hl_dmabuf, phys_pg_pack->total_size,
+				flags, dmabuf_fd);
+	if (rc)
+		goto err_free_dmabuf_wrapper;
+
+	return 0;
+
+err_free_dmabuf_wrapper:
+	kfree(hl_dmabuf);
+
+err_dec_exporting_cnt:
+	spin_lock(&vm->idr_lock);
+	phys_pg_pack->exporting_cnt--;
+	spin_unlock(&vm->idr_lock);
+
+	return rc;
+}
+
 static int mem_ioctl_no_mmu(struct hl_fpriv *hpriv, union hl_mem_args *args)
 {
 	struct hl_device *hdev = hpriv->hdev;
 	struct hl_ctx *ctx = hpriv->ctx;
 	u64 block_handle, device_addr = 0;
 	u32 handle = 0, block_size;
-	int rc;
+	int rc, dmabuf_fd = -EBADF;
 
 	switch (args->in.op) {
 	case HL_MEM_OP_ALLOC:
@@ -1559,6 +2005,16 @@ static int mem_ioctl_no_mmu(struct hl_fpriv *hpriv, union hl_mem_args *args)
 		args->out.block_size = block_size;
 		break;
 
+	case HL_MEM_OP_EXPORT_DMABUF_FD:
+		rc = export_dmabuf_from_addr(ctx,
+				args->in.export_dmabuf_fd.handle,
+				args->in.export_dmabuf_fd.mem_size,
+				args->in.flags,
+				&dmabuf_fd);
+		memset(args, 0, sizeof(*args));
+		args->out.fd = dmabuf_fd;
+		break;
+
 	default:
 		dev_err(hdev->dev, "Unknown opcode for memory IOCTL\n");
 		rc = -ENOTTY;
@@ -1577,7 +2033,7 @@ int hl_mem_ioctl(struct hl_fpriv *hpriv, void *data)
 	struct hl_ctx *ctx = hpriv->ctx;
 	u64 block_handle, device_addr = 0;
 	u32 handle = 0, block_size;
-	int rc;
+	int rc, dmabuf_fd = -EBADF;
 
 	if (!hl_device_operational(hdev, &status)) {
 		dev_warn_ratelimited(hdev->dev,
@@ -1668,6 +2124,22 @@ int hl_mem_ioctl(struct hl_fpriv *hpriv, void *data)
 		args->out.block_size = block_size;
 		break;
 
+	case HL_MEM_OP_EXPORT_DMABUF_FD:
+		if (hdev->asic_prop.dram_supports_virtual_memory)
+			rc = export_dmabuf_from_handle(ctx,
+					args->in.export_dmabuf_fd.handle,
+					args->in.flags,
+					&dmabuf_fd);
+		else
+			rc = export_dmabuf_from_addr(ctx,
+					args->in.export_dmabuf_fd.handle,
+					args->in.export_dmabuf_fd.mem_size,
+					args->in.flags,
+					&dmabuf_fd);
+		memset(args, 0, sizeof(*args));
+		args->out.fd = dmabuf_fd;
+		break;
+
 	default:
 		dev_err(hdev->dev, "Unknown opcode for memory IOCTL\n");
 		rc = -ENOTTY;
diff --git a/drivers/misc/habanalabs/gaudi/gaudi.c b/drivers/misc/habanalabs/gaudi/gaudi.c
index 7dd36d1cb39e..b2ac0e9f10cb 100644
--- a/drivers/misc/habanalabs/gaudi/gaudi.c
+++ b/drivers/misc/habanalabs/gaudi/gaudi.c
@@ -772,6 +772,7 @@ static int gaudi_early_init(struct hl_device *hdev)
 	}
 
 	prop->dram_pci_bar_size = pci_resource_len(pdev, HBM_BAR_ID);
+	hdev->dram_pci_bar_start = pci_resource_start(pdev, HBM_BAR_ID);
 
 	/* If FW security is enabled at this point it means no access to ELBI */
 	if (hdev->asic_prop.fw_security_enabled) {
diff --git a/drivers/misc/habanalabs/goya/goya.c b/drivers/misc/habanalabs/goya/goya.c
index 4144a8445eef..522f66146458 100644
--- a/drivers/misc/habanalabs/goya/goya.c
+++ b/drivers/misc/habanalabs/goya/goya.c
@@ -619,6 +619,7 @@ static int goya_early_init(struct hl_device *hdev)
 	}
 
 	prop->dram_pci_bar_size = pci_resource_len(pdev, DDR_BAR_ID);
+	hdev->dram_pci_bar_start = pci_resource_start(pdev, DDR_BAR_ID);
 
 	/* If FW security is enabled at this point it means no access to ELBI */
 	if (hdev->asic_prop.fw_security_enabled) {
-- 
2.25.1

