Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F18F752AC7
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jul 2023 21:13:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AC7E10E774;
	Thu, 13 Jul 2023 19:13:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7731210E774
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jul 2023 19:13:25 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 36DJDIvV093725;
 Thu, 13 Jul 2023 14:13:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1689275598;
 bh=XH4Ljo8L46/j+/3v1jXpRnNkBOj15a8CHCxd368zirM=;
 h=From:To:CC:Subject:Date;
 b=vIHOlPAniBUptKbBo7NLpAKimcBIv4zdxO9LUpHD1cv6l3DHyZbNgFh5Cd8RYHqz1
 ig3VHnS8SxUqjJGdU2y0hxV4mS5C4bKcqRHC11lj+qgpuENKb7MVx5iBg4arBuUBC9
 /Kl7OTk5rz34bumZ/du0pxTz1xO+SwH+wPXyQQcg=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 36DJDIQR063235
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 13 Jul 2023 14:13:18 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 13
 Jul 2023 14:13:18 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 13 Jul 2023 14:13:18 -0500
Received: from lelv0327.itg.ti.com (ileaxei01-snat2.itg.ti.com [10.180.69.6])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 36DJDHwl023141; 
 Thu, 13 Jul 2023 14:13:17 -0500
From: Andrew Davis <afd@ti.com>
To: Arnd Bergmann <arnd@arndb.de>, Christian Gmeiner
 <christian.gmeiner@gmail.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, John Stultz <jstultz@google.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Sumit Semwal <sumit.semwal@linaro.org>
Subject: [PATCH v3] misc: sram: Add DMA-BUF Heap exporting of SRAM areas
Date: Thu, 13 Jul 2023 14:13:16 -0500
Message-ID: <20230713191316.116019-1-afd@ti.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
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
Cc: linaro-mm-sig@lists.linaro.org, Andrew Davis <afd@ti.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This new export type exposes to userspace the SRAM area as a DMA-BUF Heap,
this allows for allocations of DMA-BUFs that can be consumed by various
DMA-BUF supporting devices.

Signed-off-by: Andrew Davis <afd@ti.com>
---

Changes from v2:
 - Make sram_dma_heap_allocate static (kernel test robot)
 - Rebase on v6.5-rc1

 drivers/misc/Kconfig         |   7 +
 drivers/misc/Makefile        |   1 +
 drivers/misc/sram-dma-heap.c | 245 +++++++++++++++++++++++++++++++++++
 drivers/misc/sram.c          |   6 +
 drivers/misc/sram.h          |  16 +++
 5 files changed, 275 insertions(+)
 create mode 100644 drivers/misc/sram-dma-heap.c

diff --git a/drivers/misc/Kconfig b/drivers/misc/Kconfig
index 75e427f124b28..ee34dfb61605f 100644
--- a/drivers/misc/Kconfig
+++ b/drivers/misc/Kconfig
@@ -448,6 +448,13 @@ config SRAM
 config SRAM_EXEC
 	bool
 
+config SRAM_DMA_HEAP
+	bool "Export on-chip SRAM pools using DMA-Heaps"
+	depends on DMABUF_HEAPS && SRAM
+	help
+	  This driver allows the export of on-chip SRAM marked as both pool
+	  and exportable to userspace using the DMA-Heaps interface.
+
 config DW_XDATA_PCIE
 	depends on PCI
 	tristate "Synopsys DesignWare xData PCIe driver"
diff --git a/drivers/misc/Makefile b/drivers/misc/Makefile
index f2a4d1ff65d46..5e7516bfaa8de 100644
--- a/drivers/misc/Makefile
+++ b/drivers/misc/Makefile
@@ -47,6 +47,7 @@ obj-$(CONFIG_VMWARE_VMCI)	+= vmw_vmci/
 obj-$(CONFIG_LATTICE_ECP3_CONFIG)	+= lattice-ecp3-config.o
 obj-$(CONFIG_SRAM)		+= sram.o
 obj-$(CONFIG_SRAM_EXEC)		+= sram-exec.o
+obj-$(CONFIG_SRAM_DMA_HEAP)	+= sram-dma-heap.o
 obj-$(CONFIG_GENWQE)		+= genwqe/
 obj-$(CONFIG_ECHO)		+= echo/
 obj-$(CONFIG_CXL_BASE)		+= cxl/
diff --git a/drivers/misc/sram-dma-heap.c b/drivers/misc/sram-dma-heap.c
new file mode 100644
index 0000000000000..c054c04dff33e
--- /dev/null
+++ b/drivers/misc/sram-dma-heap.c
@@ -0,0 +1,245 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * SRAM DMA-Heap userspace exporter
+ *
+ * Copyright (C) 2019-2022 Texas Instruments Incorporated - https://www.ti.com/
+ *	Andrew Davis <afd@ti.com>
+ */
+
+#include <linux/dma-mapping.h>
+#include <linux/err.h>
+#include <linux/genalloc.h>
+#include <linux/io.h>
+#include <linux/mm.h>
+#include <linux/scatterlist.h>
+#include <linux/slab.h>
+#include <linux/dma-buf.h>
+#include <linux/dma-heap.h>
+
+#include "sram.h"
+
+struct sram_dma_heap {
+	struct dma_heap *heap;
+	struct gen_pool *pool;
+};
+
+struct sram_dma_heap_buffer {
+	struct gen_pool *pool;
+	struct list_head attachments;
+	struct mutex attachments_lock;
+	unsigned long len;
+	void *vaddr;
+	phys_addr_t paddr;
+};
+
+struct dma_heap_attachment {
+	struct device *dev;
+	struct sg_table *table;
+	struct list_head list;
+};
+
+static int dma_heap_attach(struct dma_buf *dmabuf,
+			   struct dma_buf_attachment *attachment)
+{
+	struct sram_dma_heap_buffer *buffer = dmabuf->priv;
+	struct dma_heap_attachment *a;
+	struct sg_table *table;
+
+	a = kzalloc(sizeof(*a), GFP_KERNEL);
+	if (!a)
+		return -ENOMEM;
+
+	table = kmalloc(sizeof(*table), GFP_KERNEL);
+	if (!table) {
+		kfree(a);
+		return -ENOMEM;
+	}
+	if (sg_alloc_table(table, 1, GFP_KERNEL)) {
+		kfree(table);
+		kfree(a);
+		return -ENOMEM;
+	}
+	sg_set_page(table->sgl, pfn_to_page(PFN_DOWN(buffer->paddr)), buffer->len, 0);
+
+	a->table = table;
+	a->dev = attachment->dev;
+	INIT_LIST_HEAD(&a->list);
+
+	attachment->priv = a;
+
+	mutex_lock(&buffer->attachments_lock);
+	list_add(&a->list, &buffer->attachments);
+	mutex_unlock(&buffer->attachments_lock);
+
+	return 0;
+}
+
+static void dma_heap_detatch(struct dma_buf *dmabuf,
+			     struct dma_buf_attachment *attachment)
+{
+	struct sram_dma_heap_buffer *buffer = dmabuf->priv;
+	struct dma_heap_attachment *a = attachment->priv;
+
+	mutex_lock(&buffer->attachments_lock);
+	list_del(&a->list);
+	mutex_unlock(&buffer->attachments_lock);
+
+	sg_free_table(a->table);
+	kfree(a->table);
+	kfree(a);
+}
+
+static struct sg_table *dma_heap_map_dma_buf(struct dma_buf_attachment *attachment,
+					     enum dma_data_direction direction)
+{
+	struct dma_heap_attachment *a = attachment->priv;
+	struct sg_table *table = a->table;
+
+	/*
+	 * As this heap is backed by uncached SRAM memory we do not need to
+	 * perform any sync operations on the buffer before allowing device
+	 * domain access. For this reason we use SKIP_CPU_SYNC and also do
+	 * not use or provide begin/end_cpu_access() dma-buf functions.
+	 */
+	if (!dma_map_sg_attrs(attachment->dev, table->sgl, table->nents,
+			      direction, DMA_ATTR_SKIP_CPU_SYNC))
+		return ERR_PTR(-ENOMEM);
+
+	return table;
+}
+
+static void dma_heap_unmap_dma_buf(struct dma_buf_attachment *attachment,
+				   struct sg_table *table,
+				   enum dma_data_direction direction)
+{
+	dma_unmap_sg_attrs(attachment->dev, table->sgl, table->nents,
+			   direction, DMA_ATTR_SKIP_CPU_SYNC);
+}
+
+static void dma_heap_dma_buf_release(struct dma_buf *dmabuf)
+{
+	struct sram_dma_heap_buffer *buffer = dmabuf->priv;
+
+	gen_pool_free(buffer->pool, (unsigned long)buffer->vaddr, buffer->len);
+	kfree(buffer);
+}
+
+static int dma_heap_mmap(struct dma_buf *dmabuf, struct vm_area_struct *vma)
+{
+	struct sram_dma_heap_buffer *buffer = dmabuf->priv;
+	int ret;
+
+	/* SRAM mappings are not cached */
+	vma->vm_page_prot = pgprot_writecombine(vma->vm_page_prot);
+
+	ret = vm_iomap_memory(vma, buffer->paddr, buffer->len);
+	if (ret)
+		pr_err("Could not map buffer to userspace\n");
+
+	return ret;
+}
+
+static int dma_heap_vmap(struct dma_buf *dmabuf, struct iosys_map *map)
+{
+	struct sram_dma_heap_buffer *buffer = dmabuf->priv;
+
+	iosys_map_set_vaddr(map, buffer->vaddr);
+
+	return 0;
+}
+
+static const struct dma_buf_ops sram_dma_heap_buf_ops = {
+	.attach = dma_heap_attach,
+	.detach = dma_heap_detatch,
+	.map_dma_buf = dma_heap_map_dma_buf,
+	.unmap_dma_buf = dma_heap_unmap_dma_buf,
+	.release = dma_heap_dma_buf_release,
+	.mmap = dma_heap_mmap,
+	.vmap = dma_heap_vmap,
+};
+
+static struct dma_buf *sram_dma_heap_allocate(struct dma_heap *heap,
+					      unsigned long len,
+					      unsigned long fd_flags,
+					      unsigned long heap_flags)
+{
+	struct sram_dma_heap *sram_dma_heap = dma_heap_get_drvdata(heap);
+	struct sram_dma_heap_buffer *buffer;
+
+	DEFINE_DMA_BUF_EXPORT_INFO(exp_info);
+	struct dma_buf *dmabuf;
+	int ret = 0;
+
+	buffer = kzalloc(sizeof(*buffer), GFP_KERNEL);
+	if (!buffer)
+		return ERR_PTR(-ENOMEM);
+	buffer->pool = sram_dma_heap->pool;
+	INIT_LIST_HEAD(&buffer->attachments);
+	mutex_init(&buffer->attachments_lock);
+	buffer->len = len;
+
+	buffer->vaddr = (void *)gen_pool_alloc(buffer->pool, buffer->len);
+	if (!buffer->vaddr) {
+		ret = -ENOMEM;
+		goto free_buffer;
+	}
+
+	buffer->paddr = gen_pool_virt_to_phys(buffer->pool, (unsigned long)buffer->vaddr);
+	if (buffer->paddr == -1) {
+		ret = -ENOMEM;
+		goto free_pool;
+	}
+
+	/* create the dmabuf */
+	exp_info.exp_name = dma_heap_get_name(heap);
+	exp_info.ops = &sram_dma_heap_buf_ops;
+	exp_info.size = buffer->len;
+	exp_info.flags = fd_flags;
+	exp_info.priv = buffer;
+	dmabuf = dma_buf_export(&exp_info);
+	if (IS_ERR(dmabuf)) {
+		ret = PTR_ERR(dmabuf);
+		goto free_pool;
+	}
+
+	return dmabuf;
+
+free_pool:
+	gen_pool_free(buffer->pool, (unsigned long)buffer->vaddr, buffer->len);
+free_buffer:
+	kfree(buffer);
+
+	return ERR_PTR(ret);
+}
+
+static struct dma_heap_ops sram_dma_heap_ops = {
+	.allocate = sram_dma_heap_allocate,
+};
+
+int sram_add_dma_heap(struct sram_dev *sram,
+		      struct sram_reserve *block,
+		      phys_addr_t start,
+		      struct sram_partition *part)
+{
+	struct sram_dma_heap *sram_dma_heap;
+	struct dma_heap_export_info exp_info;
+
+	dev_info(sram->dev, "Exporting SRAM Heap '%s'\n", block->label);
+
+	sram_dma_heap = kzalloc(sizeof(*sram_dma_heap), GFP_KERNEL);
+	if (!sram_dma_heap)
+		return -ENOMEM;
+	sram_dma_heap->pool = part->pool;
+
+	exp_info.name = kasprintf(GFP_KERNEL, "sram_%s", block->label);
+	exp_info.ops = &sram_dma_heap_ops;
+	exp_info.priv = sram_dma_heap;
+	sram_dma_heap->heap = dma_heap_add(&exp_info);
+	if (IS_ERR(sram_dma_heap->heap)) {
+		int ret = PTR_ERR(sram_dma_heap->heap);
+		kfree(sram_dma_heap);
+		return ret;
+	}
+
+	return 0;
+}
diff --git a/drivers/misc/sram.c b/drivers/misc/sram.c
index 5757adf418b1d..6dd173a2fba8e 100644
--- a/drivers/misc/sram.c
+++ b/drivers/misc/sram.c
@@ -120,6 +120,12 @@ static int sram_add_partition(struct sram_dev *sram, struct sram_reserve *block,
 		ret = sram_add_pool(sram, block, start, part);
 		if (ret)
 			return ret;
+
+		if (block->export) {
+			ret = sram_add_dma_heap(sram, block, start, part);
+			if (ret)
+				return ret;
+		}
 	}
 	if (block->export) {
 		ret = sram_add_export(sram, block, start, part);
diff --git a/drivers/misc/sram.h b/drivers/misc/sram.h
index 397205b8bf6ff..062bdd25fa068 100644
--- a/drivers/misc/sram.h
+++ b/drivers/misc/sram.h
@@ -60,4 +60,20 @@ static inline int sram_add_protect_exec(struct sram_partition *part)
 	return -ENODEV;
 }
 #endif /* CONFIG_SRAM_EXEC */
+
+#ifdef CONFIG_SRAM_DMA_HEAP
+int sram_add_dma_heap(struct sram_dev *sram,
+		      struct sram_reserve *block,
+		      phys_addr_t start,
+		      struct sram_partition *part);
+#else
+static inline int sram_add_dma_heap(struct sram_dev *sram,
+				    struct sram_reserve *block,
+				    phys_addr_t start,
+				    struct sram_partition *part)
+{
+	return 0;
+}
+#endif /* CONFIG_SRAM_DMA_HEAP */
+
 #endif /* __SRAM_H */
-- 
2.39.2

