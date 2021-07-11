Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A840E3C3D32
	for <lists+dri-devel@lfdr.de>; Sun, 11 Jul 2021 16:06:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E46B89CF7;
	Sun, 11 Jul 2021 14:06:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93EAE89CF2;
 Sun, 11 Jul 2021 14:06:48 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id C315061156;
 Sun, 11 Jul 2021 14:06:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1626012408;
 bh=iw7jH15KS6s2lQePQg61VwkqOCYQoQQNgOsHKNwMk8o=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=E1VsLKlb9OFbiJMImHyEPWYELPFhvSgJs1eRw7+827JpKLZyQQZnTDyAJoVihCNES
 azYGNaWV0tfWAwjJyDXyEYx/oBJlixzqTjXp8I4nE9tLEFf45mgtGiSmo60UQmd+Yd
 aAn/KQRB8jPhlLd5hQD08dFDemohGs6lHudaGrOlqBbsfWsH51p+Kmrb7grEsDa+iG
 2PdHcya5guLbhT7BgnTgt+FxPRDXo2DKgcazv7Ladd6NcCiSUUKSfNp7vTySIciaVc
 FdIMdFxbe8IZ3W4PUuj9M8ti2jcc8aijC9nKB6eGd2tR8fkJYqrzlSj6r/IbPVYZ6S
 7I5BkKI3Wk5wA==
From: Oded Gabbay <ogabbay@kernel.org>
To: linux-kernel@vger.kernel.org,
	gregkh@linuxfoundation.org,
	jgg@ziepe.ca
Subject: [PATCH v5 2/2] habanalabs: add support for dma-buf exporter
Date: Sun, 11 Jul 2021 17:06:01 +0300
Message-Id: <20210711140601.7472-3-ogabbay@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210711140601.7472-1-ogabbay@kernel.org>
References: <20210711140601.7472-1-ogabbay@kernel.org>
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
 linaro-mm-sig@lists.linaro.org, dledford@redhat.com, hch@lst.de,
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

In the export phase, we provide to the DMA-BUF object an array of pages
that represent the device's memory area. During the map callback,
we convert the array of pages into an SGT. We split/merge the pages
according to the dma max segment size of the importer.

To get the DMA address of the PCI bar, we use the dma_map_resources()
kernel API, because our device memory is not backed by page struct
and this API doesn't need page struct to map the physical address to
a DMA address.

We set the orig_nents member of the SGT to be 0, to indicate to other
drivers that we don't support CPU mappings.

Note that in Habanalabs's ASICs, the device memory is pinned and
immutable. Therefore, there is no need for dynamic mappings and pinning
callbacks.

Also note that in GAUDI we don't have an MMU towards the device memory
and the user works on physical addresses. Therefore, the user doesn't
pass through the kernel driver to allocate memory there. As a result,
only for GAUDI we receive from the user a device memory physical address
(instead of a handle) and a size.

We check the p2p distance using pci_p2pdma_distance_many() and refusing
to map dmabuf in case the distance doesn't allow p2p.

Signed-off-by: Tomer Tayar <ttayar@habana.ai>
Reviewed-by: Oded Gabbay <ogabbay@kernel.org>
Reviewed-by: Gal Pressman <galpress@amazon.com>
Signed-off-by: Oded Gabbay <ogabbay@kernel.org>
---
Changes in v5:
 - Use dma_get_max_seg_size() to get the max segment size of the importer.
   Use that value when we convert the pages array into an SGT, to make
   sure each SG is not larger than that size.
 - Set orig_nents to be 0 after initializing the SGT. This will hopefully
   tell other drivers to avoid using CPU mapping with this SGT.
 - Remove the allocation of pages array in case we receive an address
   from the user (GAUDI use-case). This was redundant.

 drivers/misc/habanalabs/Kconfig             |   1 +
 drivers/misc/habanalabs/common/habanalabs.h |  22 +
 drivers/misc/habanalabs/common/memory.c     | 522 +++++++++++++++++++-
 drivers/misc/habanalabs/gaudi/gaudi.c       |   1 +
 drivers/misc/habanalabs/goya/goya.c         |   1 +
 5 files changed, 543 insertions(+), 4 deletions(-)

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
index 9782bb50931a..4969495f4788 100644
--- a/drivers/misc/habanalabs/common/habanalabs.h
+++ b/drivers/misc/habanalabs/common/habanalabs.h
@@ -26,6 +26,7 @@
 #include <linux/sched/signal.h>
 #include <linux/io-64-nonatomic-lo-hi.h>
 #include <linux/coresight.h>
+#include <linux/dma-buf.h>
 
 #define HL_NAME				"habanalabs"
 
@@ -1329,6 +1330,23 @@ struct hl_pending_cb {
 	u32			hw_queue_id;
 };
 
+/**
+ * struct hl_dmabuf_wrapper - a dma-buf wrapper object.
+ * @dmabuf: pointer to dma-buf object.
+ * @ctx: pointer to the dma-buf owner's context.
+ * @phys_pg_pack: pointer to physical page pack if the dma-buf was exported for
+ *                memory allocation handle.
+ * @device_address: physical address of the device's memory. Relevant only
+ *                  if phys_pg_pack is NULL (dma-buf was exported from address).
+ *                  The total size can be taken from the dmabuf object.
+ */
+struct hl_dmabuf_wrapper {
+	struct dma_buf			*dmabuf;
+	struct hl_ctx			*ctx;
+	struct hl_vm_phys_pg_pack	*phys_pg_pack;
+	uint64_t			device_address;
+};
+
 /**
  * struct hl_ctx - user/kernel context.
  * @mem_hash: holds mapping from virtual address to virtual memory area
@@ -1637,6 +1655,7 @@ struct hl_vm_hw_block_list_node {
  * @npages: num physical pages in the pack.
  * @total_size: total size of all the pages in this list.
  * @mapping_cnt: number of shared mappings.
+ * @exporting_cnt: number of dma-buf exporting.
  * @asid: the context related to this list.
  * @page_size: size of each page in the pack.
  * @flags: HL_MEM_* flags related to this list.
@@ -1651,6 +1670,7 @@ struct hl_vm_phys_pg_pack {
 	u64			npages;
 	u64			total_size;
 	atomic_t		mapping_cnt;
+	u32			exporting_cnt;
 	u32			asid;
 	u32			page_size;
 	u32			flags;
@@ -2314,6 +2334,7 @@ struct hl_mmu_funcs {
  *                          the error will be ignored by the driver during
  *                          device initialization. Mainly used to debug and
  *                          workaround firmware bugs
+ * @dram_pci_bar_start: start bus address of PCIe bar towards DRAM.
  * @last_successful_open_jif: timestamp (jiffies) of the last successful
  *                            device open.
  * @last_open_session_duration_jif: duration (jiffies) of the last device open
@@ -2451,6 +2472,7 @@ struct hl_device {
 	u64				max_power;
 	u64				clock_gating_mask;
 	u64				boot_error_status_mask;
+	u64				dram_pci_bar_start;
 	u64				last_successful_open_jif;
 	u64				last_open_session_duration_jif;
 	u64				open_counter;
diff --git a/drivers/misc/habanalabs/common/memory.c b/drivers/misc/habanalabs/common/memory.c
index a05d98db4857..8453ec89f83a 100644
--- a/drivers/misc/habanalabs/common/memory.c
+++ b/drivers/misc/habanalabs/common/memory.c
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 
 /*
- * Copyright 2016-2019 HabanaLabs, Ltd.
+ * Copyright 2016-2021 HabanaLabs, Ltd.
  * All Rights Reserved.
  */
 
@@ -11,11 +11,13 @@
 
 #include <linux/uaccess.h>
 #include <linux/slab.h>
+#include <linux/pci-p2pdma.h>
 
 #define HL_MMU_DEBUG	0
 
 /* use small pages for supporting non-pow2 (32M/40M/48M) DRAM phys page sizes */
-#define DRAM_POOL_PAGE_SIZE SZ_8M
+#define DRAM_POOL_PAGE_SIZE		SZ_8M
+
 
 /*
  * The va ranges in context object contain a list with the available chunks of
@@ -347,6 +349,13 @@ static int free_device_memory(struct hl_ctx *ctx, struct hl_mem_in *args)
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
@@ -1504,13 +1513,492 @@ int hl_hw_block_mmap(struct hl_fpriv *hpriv, struct vm_area_struct *vma)
 	return 0;
 }
 
+static int set_dma_sg(struct scatterlist *sg, u64 bar_address, u64 chunk_size,
+			struct device *dev, enum dma_data_direction dir)
+{
+	dma_addr_t addr;
+	int rc;
+
+	addr = dma_map_resource(dev, bar_address, chunk_size, dir,
+				DMA_ATTR_SKIP_CPU_SYNC);
+	rc = dma_mapping_error(dev, addr);
+	if (rc)
+		return rc;
+
+	sg_set_page(sg, NULL, chunk_size, 0);
+	sg_dma_address(sg) = addr;
+	sg_dma_len(sg) = chunk_size;
+
+	return 0;
+}
+
+static int alloc_sgt_from_device_pages(struct hl_device *hdev,
+					struct sg_table **sgt, u64 *pages,
+					u64 npages, u64 page_size,
+					struct device *dev,
+					enum dma_data_direction dir)
+{
+	u64 chunk_size, bar_address, dma_max_seg_size;
+	struct asic_fixed_properties *prop;
+	int rc, i, j, nents, cur_page;
+	struct scatterlist *sg;
+
+	prop = &hdev->asic_prop;
+
+	dma_max_seg_size = dma_get_max_seg_size(dev);
+
+	/* We would like to align the max segment size to PAGE_SIZE, so the
+	 * SGL will contain aligned addresses that can be easily mapped to
+	 * an MMU
+	 */
+	dma_max_seg_size = ALIGN_DOWN(dma_max_seg_size, PAGE_SIZE);
+	if (dma_max_seg_size < PAGE_SIZE) {
+		dev_err_ratelimited(hdev->dev,
+				"dma_max_seg_size %llu can't be smaller than PAGE_SIZE\n",
+				dma_max_seg_size);
+		return -EINVAL;
+	}
+
+	*sgt = kzalloc(sizeof(**sgt), GFP_KERNEL);
+	if (!*sgt)
+		return -ENOMEM;
+
+	/* If the size of each page is larger than the dma max segment size,
+	 * then we can't combine pages and the number of entries in the SGL
+	 * will just be the
+	 * <number of pages> * <chunks of max segment size in each page>
+	 */
+	if (page_size > dma_max_seg_size)
+		nents = npages * DIV_ROUND_UP_ULL(page_size, dma_max_seg_size);
+	else
+		/* Get number of non-contiguous chunks */
+		for (i = 1, nents = 1, chunk_size = page_size ; i < npages ; i++) {
+			if (pages[i - 1] + page_size != pages[i] ||
+					chunk_size + page_size > dma_max_seg_size) {
+				nents++;
+				chunk_size = page_size;
+				continue;
+			}
+
+			chunk_size += page_size;
+		}
+
+	rc = sg_alloc_table(*sgt, nents, GFP_KERNEL | __GFP_ZERO);
+	if (rc)
+		goto error_free;
+
+	/* Because we are not going to include a CPU list we want to have some
+	 * chance that other users will detect this by setting the orig_nents
+	 * to 0 and using only nents (length of DMA list) when going over the
+	 * sgl
+	 */
+	(*sgt)->orig_nents = 0;
+
+	cur_page = 0;
+
+	if (page_size > dma_max_seg_size) {
+		u64 size_left, cur_device_address = 0;
+
+		size_left = page_size;
+
+		/* Need to split each page into the number of chunks of
+		 * dma_max_seg_size
+		 */
+		for_each_sgtable_dma_sg((*sgt), sg, i) {
+			if (size_left == page_size)
+				cur_device_address =
+					pages[cur_page] - prop->dram_base_address;
+			else
+				cur_device_address += dma_max_seg_size;
+
+			chunk_size = min(size_left, dma_max_seg_size);
+
+			bar_address = hdev->dram_pci_bar_start + cur_device_address;
+
+			rc = set_dma_sg(sg, bar_address, chunk_size, dev, dir);
+			if (rc)
+				goto error_unmap;
+
+			if (size_left >= dma_max_seg_size) {
+				size_left -= dma_max_seg_size;
+			} else {
+				cur_page++;
+				size_left = page_size;
+			}
+		}
+	} else {
+		/* Merge pages and put them into the scatterlist */
+		for_each_sgtable_dma_sg((*sgt), sg, i) {
+			chunk_size = page_size;
+			for (j = cur_page + 1 ; j < npages ; j++) {
+				if (pages[j - 1] + page_size != pages[j] ||
+						chunk_size + page_size > dma_max_seg_size)
+					break;
+
+				chunk_size += page_size;
+			}
+
+			bar_address = hdev->dram_pci_bar_start +
+					(pages[cur_page] - prop->dram_base_address);
+
+			rc = set_dma_sg(sg, bar_address, chunk_size, dev, dir);
+			if (rc)
+				goto error_unmap;
+
+			cur_page = j;
+		}
+	}
+
+	return 0;
+
+error_unmap:
+	for_each_sgtable_dma_sg((*sgt), sg, i) {
+		if (!sg_dma_len(sg))
+			continue;
+
+		dma_unmap_resource(dev, sg_dma_address(sg),
+					sg_dma_len(sg), dir,
+					DMA_ATTR_SKIP_CPU_SYNC);
+	}
+
+	/* Need to restore orig_nents because sg_free_table use that field */
+	(*sgt)->orig_nents = nents;
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
+						&hl_dmabuf->device_address,
+						1,
+						hl_dmabuf->dmabuf->size,
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
+	for_each_sgtable_dma_sg(sgt, sg, i)
+		dma_unmap_resource(attachment->dev, sg_dma_address(sg),
+					sg_dma_len(sg), dir,
+					DMA_ATTR_SKIP_CPU_SYNC);
+
+	/* Need to restore orig_nents because sg_free_table use that field */
+	sgt->orig_nents = sgt->nents;
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
+	int rc;
+
+	prop = &hdev->asic_prop;
+
+	if (!IS_ALIGNED(device_addr, PAGE_SIZE)) {
+		dev_err_ratelimited(hdev->dev,
+			"address of exported device memory should be aligned to 0x%lx, address 0x%llx\n",
+			PAGE_SIZE, device_addr);
+		return -EINVAL;
+	}
+
+	if (size < PAGE_SIZE) {
+		dev_err_ratelimited(hdev->dev,
+			"size %llu of exported device memory should be equal to or greater than %lu\n",
+			size, PAGE_SIZE);
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
+	hl_dmabuf->device_address = device_addr;
+
+	rc = export_dmabuf_common(ctx, hl_dmabuf, size, flags, dmabuf_fd);
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
@@ -1559,6 +2047,16 @@ static int mem_ioctl_no_mmu(struct hl_fpriv *hpriv, union hl_mem_args *args)
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
@@ -1577,7 +2075,7 @@ int hl_mem_ioctl(struct hl_fpriv *hpriv, void *data)
 	struct hl_ctx *ctx = hpriv->ctx;
 	u64 block_handle, device_addr = 0;
 	u32 handle = 0, block_size;
-	int rc;
+	int rc, dmabuf_fd = -EBADF;
 
 	if (!hl_device_operational(hdev, &status)) {
 		dev_warn_ratelimited(hdev->dev,
@@ -1668,6 +2166,22 @@ int hl_mem_ioctl(struct hl_fpriv *hpriv, void *data)
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
index fdbe8155ef3c..669e1bf47fb1 100644
--- a/drivers/misc/habanalabs/gaudi/gaudi.c
+++ b/drivers/misc/habanalabs/gaudi/gaudi.c
@@ -773,6 +773,7 @@ static int gaudi_early_init(struct hl_device *hdev)
 	}
 
 	prop->dram_pci_bar_size = pci_resource_len(pdev, HBM_BAR_ID);
+	hdev->dram_pci_bar_start = pci_resource_start(pdev, HBM_BAR_ID);
 
 	/* If FW security is enabled at this point it means no access to ELBI */
 	if (hdev->asic_prop.fw_security_enabled) {
diff --git a/drivers/misc/habanalabs/goya/goya.c b/drivers/misc/habanalabs/goya/goya.c
index ae9871928369..f903eb2232d6 100644
--- a/drivers/misc/habanalabs/goya/goya.c
+++ b/drivers/misc/habanalabs/goya/goya.c
@@ -620,6 +620,7 @@ static int goya_early_init(struct hl_device *hdev)
 	}
 
 	prop->dram_pci_bar_size = pci_resource_len(pdev, DDR_BAR_ID);
+	hdev->dram_pci_bar_start = pci_resource_start(pdev, DDR_BAR_ID);
 
 	/* If FW security is enabled at this point it means no access to ELBI */
 	if (hdev->asic_prop.fw_security_enabled) {
-- 
2.25.1

