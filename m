Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AA6493ACB17
	for <lists+dri-devel@lfdr.de>; Fri, 18 Jun 2021 14:36:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F8226E9FB;
	Fri, 18 Jun 2021 12:36:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A38596E9FB
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Jun 2021 12:36:30 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2043C613EB;
 Fri, 18 Jun 2021 12:36:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1624019790;
 bh=RjqDkRu9SBVBghjLyRc4uVf8AZbHUInC3i4aQa0YsU0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=hs4Aezg6nN37RTR61HnXdnywJvSwfsTWxQ+n38LTI5oDZz8y1fev5ZfZKnEKCzqUI
 ge5TH2uwu0G14K/0hM7tdYWQF4soslj271UKy1uNTOWXh4mgemyY/5gBJ+njX6bVwg
 9ipQroUJL3yIGWC71zckCjKydqCxC1Q88weJF0/l4pCP/4jS9BsCF0A59h/UR6Wp4L
 tyXnV96kMS6l0Je7aKiyl677DdRuMUF/4plYLarzzPDeBqgkh51O0KK2bAcBHoa0Vc
 JLHzofH4SHTrsiCB8tNESExxdKPmwmTZfAQIHb4VsMF1W0/QhiIlcp7pDZToDR0u9I
 /SaGo4TAmcxaw==
From: Oded Gabbay <ogabbay@kernel.org>
To: linux-kernel@vger.kernel.org,
	gregkh@linuxfoundation.org
Subject: [PATCH v3 2/2] habanalabs: add support for dma-buf exporter
Date: Fri, 18 Jun 2021 15:36:14 +0300
Message-Id: <20210618123615.11456-2-ogabbay@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210618123615.11456-1-ogabbay@kernel.org>
References: <20210618123615.11456-1-ogabbay@kernel.org>
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
Cc: daniel.vetter@ffwll.ch, sleybo@amazon.com, galpress@amazon.com,
 dri-devel@lists.freedesktop.org, christian.koenig@amd.com,
 Tomer Tayar <ttayar@habana.ai>
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

Signed-off-by: Tomer Tayar <ttayar@habana.ai>
Reviewed-by: Oded Gabbay <ogabbay@kernel.org>
Reviewed-by: Gal Pressman <galpress@amazon.com>
Signed-off-by: Oded Gabbay <ogabbay@kernel.org>
---
Changes in v3:
 - remove calls to dev_dbg()
 - remove hl_dmabuf_wrapper.fd as it is only for debug prints
 - clear attachment->priv in the detach callback
 - add a comment to why an empty unmap_dma_buf callback is needed
 - modify exporting_cnt from atomic_t to u32 and add a lock when missing
 - remove hl_ctx.dmabuf_list which wasn't really used
 - replace dev_err with dev_err_ratelimited when checking user's inputs
 - read vm_type directly from phys_pg_pack instead of casting the struct

 drivers/misc/habanalabs/Kconfig             |   1 +
 drivers/misc/habanalabs/common/habanalabs.h |  24 ++
 drivers/misc/habanalabs/common/memory.c     | 400 +++++++++++++++++++-
 drivers/misc/habanalabs/gaudi/gaudi.c       |   1 +
 drivers/misc/habanalabs/goya/goya.c         |   1 +
 5 files changed, 424 insertions(+), 3 deletions(-)

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
index 09b89fdeba0b..0e418be61727 100644
--- a/drivers/misc/habanalabs/common/habanalabs.h
+++ b/drivers/misc/habanalabs/common/habanalabs.h
@@ -20,6 +20,7 @@
 #include <linux/scatterlist.h>
 #include <linux/hashtable.h>
 #include <linux/debugfs.h>
+#include <linux/dma-buf.h>
 #include <linux/bitfield.h>
 #include <linux/genalloc.h>
 #include <linux/sched/signal.h>
@@ -1290,6 +1291,25 @@ struct hl_pending_cb {
 	u32			hw_queue_id;
 };
 
+/**
+ * struct hl_dmabuf_wrapper - a dma-buf wrapper object.
+ * @dmabuf: pointer to dma-buf object.
+ * @ctx: pointer to the dma-buf owner's context.
+ * @phys_pg_pack: pointer to physical page pack if the dma-buf was exported for
+ *                memory allocation handle.
+ * @sgt: scatter-gather table that holds the exported pages.
+ * @total_size: total size of all exported pages.
+ * @handle: allocation handle or physical address of the exported memory.
+ */
+struct hl_dmabuf_wrapper {
+	struct dma_buf			*dmabuf;
+	struct hl_ctx			*ctx;
+	struct hl_vm_phys_pg_pack	*phys_pg_pack;
+	struct sg_table			sgt;
+	u64				total_size;
+	u64				handle;
+};
+
 /**
  * struct hl_ctx - user/kernel context.
  * @mem_hash: holds mapping from virtual address to virtual memory area
@@ -1598,6 +1618,7 @@ struct hl_vm_hw_block_list_node {
  * @npages: num physical pages in the pack.
  * @total_size: total size of all the pages in this list.
  * @mapping_cnt: number of shared mappings.
+ * @exporting_cnt: number of dma-buf exporting.
  * @asid: the context related to this list.
  * @page_size: size of each page in the pack.
  * @flags: HL_MEM_* flags related to this list.
@@ -1612,6 +1633,7 @@ struct hl_vm_phys_pg_pack {
 	u64			npages;
 	u64			total_size;
 	atomic_t		mapping_cnt;
+	u32			exporting_cnt;
 	u32			asid;
 	u32			page_size;
 	u32			flags;
@@ -2137,6 +2159,7 @@ struct hl_mmu_funcs {
  *                          the error will be ignored by the driver during
  *                          device initialization. Mainly used to debug and
  *                          workaround firmware bugs
+ * @dram_pci_bar_start: start bus address of PCIe bar towards DRAM.
  * @last_successful_open_jif: timestamp (jiffies) of the last successful
  *                            device open.
  * @last_open_session_duration_jif: duration (jiffies) of the last device open
@@ -2266,6 +2289,7 @@ struct hl_device {
 	u64				max_power;
 	u64				clock_gating_mask;
 	u64				boot_error_status_mask;
+	u64				dram_pci_bar_start;
 	u64				last_successful_open_jif;
 	u64				last_open_session_duration_jif;
 	u64				open_counter;
diff --git a/drivers/misc/habanalabs/common/memory.c b/drivers/misc/habanalabs/common/memory.c
index af339ce1ab4f..45d663f746a3 100644
--- a/drivers/misc/habanalabs/common/memory.c
+++ b/drivers/misc/habanalabs/common/memory.c
@@ -15,7 +15,14 @@
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
@@ -347,6 +354,13 @@ static int free_device_memory(struct hl_ctx *ctx, struct hl_mem_in *args)
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
@@ -1411,13 +1425,367 @@ int hl_hw_block_mmap(struct hl_fpriv *hpriv, struct vm_area_struct *vma)
 	return 0;
 }
 
+static int hl_dmabuf_attach(struct dma_buf *dmabuf,
+				struct dma_buf_attachment *attachment)
+{
+	struct hl_dmabuf_wrapper *hl_dmabuf = dmabuf->priv;
+
+	attachment->priv = hl_dmabuf;
+
+	return 0;
+}
+
+static void hl_dmabuf_detach(struct dma_buf *dmabuf,
+				struct dma_buf_attachment *attachment)
+{
+	attachment->priv = NULL;
+}
+
+static struct sg_table *hl_map_dmabuf(struct dma_buf_attachment *attachment,
+					enum dma_data_direction dir)
+{
+	struct hl_dmabuf_wrapper *hl_dmabuf = attachment->priv;
+
+	return &hl_dmabuf->sgt;
+}
+
+static void hl_unmap_dmabuf(struct dma_buf_attachment *attachment,
+				  struct sg_table *table,
+				  enum dma_data_direction dir)
+{
+	/* Nothing to do here but the "unmap_dma_buf" callback is mandatory */
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
+	sg_free_table(&hl_dmabuf->sgt);
+	kfree(hl_dmabuf);
+}
+
+static const struct dma_buf_ops habanalabs_dmabuf_ops = {
+	.attach = hl_dmabuf_attach,
+	.detach = hl_dmabuf_detach,
+	.map_dma_buf = hl_map_dmabuf,
+	.unmap_dma_buf = hl_unmap_dmabuf,
+	.release = hl_release_dmabuf,
+};
+
+static int alloc_sgt_from_device_pages(struct hl_ctx *ctx, struct sg_table *sgt,
+					u64 *pages, u64 npages, u64 page_size)
+{
+	struct hl_device *hdev = ctx->hdev;
+	struct asic_fixed_properties *prop = &hdev->asic_prop;
+	u64 chunk_size, bar_address;
+	struct scatterlist *sg;
+	int rc, i, j, nents, cur_page;
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
+	rc = sg_alloc_table(sgt, nents, GFP_KERNEL | __GFP_ZERO);
+	if (rc)
+		return rc;
+
+	/* Merge pages and put them into the scatterlist */
+	cur_page = 0;
+	for_each_sg(sgt->sgl, sg, nents, i) {
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
+		if (bar_address + chunk_size >
+				hdev->dram_pci_bar_start +
+						prop->dram_pci_bar_size) {
+			dev_err_ratelimited(hdev->dev,
+				"DRAM memory range is outside of PCI BAR boundaries, address 0x%llx, size 0x%llx\n",
+				pages[cur_page], chunk_size);
+			rc = -EINVAL;
+			goto err_sg_free_table;
+		}
+
+		sg_set_page(sg, NULL, chunk_size, 0);
+		sg_dma_address(sg) = bar_address;
+		sg_dma_len(sg) = chunk_size;
+
+		cur_page = j;
+	}
+
+	return 0;
+
+err_sg_free_table:
+	sg_free_table(sgt);
+	return rc;
+}
+
+static int _export_dmabuf_common(struct hl_ctx *ctx,
+			struct hl_dmabuf_wrapper *hl_dmabuf, u64 *pages,
+			u64 npages, u64 page_size, int flags, int *dmabuf_fd)
+{
+	struct hl_device *hdev = ctx->hdev;
+	DEFINE_DMA_BUF_EXPORT_INFO(exp_info);
+	int rc, fd;
+
+	rc = alloc_sgt_from_device_pages(ctx, &hl_dmabuf->sgt, pages, npages,
+						page_size);
+	if (rc) {
+		dev_err(hdev->dev,
+			"failed to create a scatterlist table for exported device memory\n");
+		return rc;
+	}
+
+	exp_info.ops = &habanalabs_dmabuf_ops;
+	exp_info.size = hl_dmabuf->total_size;
+	exp_info.flags = flags;
+	exp_info.priv = hl_dmabuf;
+	hl_dmabuf->dmabuf = dma_buf_export(&exp_info);
+	if (IS_ERR(hl_dmabuf->dmabuf)) {
+		dev_err(hdev->dev, "failed to export dma-buf\n");
+		rc = PTR_ERR(hl_dmabuf->dmabuf);
+		goto err_sg_free_table;
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
+err_sg_free_table:
+	sg_free_table(&hl_dmabuf->sgt);
+	return rc;
+}
+
+static int export_dmabuf_common(struct hl_ctx *ctx,
+			struct hl_dmabuf_wrapper *hl_dmabuf, u64 *pages,
+			u64 npages, u64 page_size, int flags, int *dmabuf_fd)
+{
+	u64 *split_pages, npages_orig;
+	u32 split_factor;
+	int rc, i, j;
+
+	if (page_size <= DMA_BUF_CHUNK_MAX_SIZE)
+		return _export_dmabuf_common(ctx, hl_dmabuf, pages, npages,
+						page_size, flags, dmabuf_fd);
+
+	/* page_size is a multiple of DMA_BUF_MEM_SIZE_ALIGNMENT */
+	split_factor = (u32) div_u64(page_size, DMA_BUF_MEM_SIZE_ALIGNMENT);
+	npages_orig = npages;
+	npages *= split_factor;
+	page_size = DMA_BUF_MEM_SIZE_ALIGNMENT;
+
+	split_pages = kcalloc(npages, sizeof(*split_pages), GFP_KERNEL);
+	if (!split_pages)
+		return -ENOMEM;
+
+	for (i = 0 ; i < npages_orig ; i++)
+		for (j = 0 ; j < split_factor ; j++)
+			split_pages[i * split_factor + j] =
+					pages[i] + j * page_size;
+
+	rc = _export_dmabuf_common(ctx, hl_dmabuf, split_pages, npages,
+					page_size, flags, dmabuf_fd);
+
+	kfree(split_pages);
+
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
+	struct hl_device *hdev = ctx->hdev;
+	struct asic_fixed_properties *prop = &hdev->asic_prop;
+	struct hl_dmabuf_wrapper *hl_dmabuf;
+	int rc;
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
+			device_addr + size > prop->dram_end_address) {
+		dev_err_ratelimited(hdev->dev,
+			"DRAM memory range is outside of DRAM boundaries, address 0x%llx, size 0x%llx\n",
+			device_addr, size);
+		return -EINVAL;
+	}
+
+	hl_dmabuf = kzalloc(sizeof(*hl_dmabuf), GFP_KERNEL);
+	if (!hl_dmabuf)
+		return -ENOMEM;
+
+	hl_dmabuf->handle = device_addr;
+	hl_dmabuf->total_size = size;
+
+	rc = export_dmabuf_common(ctx, hl_dmabuf, &device_addr, 1, size, flags,
+					dmabuf_fd);
+	if (rc)
+		goto err_free_dmabuf_wrapper;
+
+	return 0;
+
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
+	struct hl_device *hdev = ctx->hdev;
+	struct hl_vm_phys_pg_pack *phys_pg_pack;
+	struct hl_dmabuf_wrapper *hl_dmabuf;
+	struct hl_vm *vm = &hdev->vm;
+	u32 idr_handle;
+	int rc;
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
+	hl_dmabuf = kzalloc(sizeof(*hl_dmabuf), GFP_KERNEL);
+	if (!hl_dmabuf) {
+		rc = -ENOMEM;
+		goto err_dec_exporting_cnt;
+	}
+
+	hl_dmabuf->phys_pg_pack = phys_pg_pack;
+	hl_dmabuf->handle = handle;
+	hl_dmabuf->total_size = phys_pg_pack->total_size;
+
+	rc = export_dmabuf_common(ctx, hl_dmabuf, phys_pg_pack->pages,
+				phys_pg_pack->npages, phys_pg_pack->page_size,
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
@@ -1466,6 +1834,16 @@ static int mem_ioctl_no_mmu(struct hl_fpriv *hpriv, union hl_mem_args *args)
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
@@ -1484,7 +1862,7 @@ int hl_mem_ioctl(struct hl_fpriv *hpriv, void *data)
 	struct hl_ctx *ctx = hpriv->ctx;
 	u64 block_handle, device_addr = 0;
 	u32 handle = 0, block_size;
-	int rc;
+	int rc, dmabuf_fd = -EBADF;
 
 	if (!hl_device_operational(hdev, &status)) {
 		dev_warn_ratelimited(hdev->dev,
@@ -1575,6 +1953,22 @@ int hl_mem_ioctl(struct hl_fpriv *hpriv, void *data)
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
index be830948e051..33f36da766fc 100644
--- a/drivers/misc/habanalabs/gaudi/gaudi.c
+++ b/drivers/misc/habanalabs/gaudi/gaudi.c
@@ -685,6 +685,7 @@ static int gaudi_early_init(struct hl_device *hdev)
 	}
 
 	prop->dram_pci_bar_size = pci_resource_len(pdev, HBM_BAR_ID);
+	hdev->dram_pci_bar_start = pci_resource_start(pdev, HBM_BAR_ID);
 
 	/* If FW security is enabled at this point it means no access to ELBI */
 	if (hdev->asic_prop.fw_security_enabled) {
diff --git a/drivers/misc/habanalabs/goya/goya.c b/drivers/misc/habanalabs/goya/goya.c
index 5a837c0b4d76..ad2c6f788030 100644
--- a/drivers/misc/habanalabs/goya/goya.c
+++ b/drivers/misc/habanalabs/goya/goya.c
@@ -617,6 +617,7 @@ static int goya_early_init(struct hl_device *hdev)
 	}
 
 	prop->dram_pci_bar_size = pci_resource_len(pdev, DDR_BAR_ID);
+	hdev->dram_pci_bar_start = pci_resource_start(pdev, DDR_BAR_ID);
 
 	/* If FW security is enabled at this point it means no access to ELBI */
 	if (hdev->asic_prop.fw_security_enabled) {
-- 
2.25.1

