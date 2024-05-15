Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CCE068C67F1
	for <lists+dri-devel@lfdr.de>; Wed, 15 May 2024 15:57:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0C4710E7C0;
	Wed, 15 May 2024 13:57:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="WxSnfSTm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7E7410E3F8
 for <dri-devel@lists.freedesktop.org>; Wed, 15 May 2024 13:57:47 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id C5908614CB;
 Wed, 15 May 2024 13:57:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FAD3C4AF19;
 Wed, 15 May 2024 13:57:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1715781464;
 bh=y4c5Ovhy94byqgEWHicSc3d/PAkjnLlMSsPZmPA2CY4=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=WxSnfSTmQ/csjEC2fejH+PymBQ7/2Gv2FU3ve4/QA2kxCOURBe1IcIN3l7T56t2uo
 m0dglIusTz5Ckpsvo0Rawk7iFM8OAo9r7czY2FuhmGIwYDWUpT/KauDYo355CHhV9Z
 igQJoWElO4xiLoUIQ/DzdfS3+kgD7l5VVR89N0b/5ckoAUz39/6AO3bu1I/3b/WuHa
 KORhwnw0kV8jAfZuqnqzj02bt85XjEdZp8N7snX6wUgbfdk1m+tcaCGGA2zEBxBvq/
 BYqFU9tddtWMy9s28lvy8+AjgUpK9NEQqPNnPG0XX78WlWnvpSRVGTR7t+klSSeiAU
 XwD1+9VdLQT1w==
From: Maxime Ripard <mripard@kernel.org>
Date: Wed, 15 May 2024 15:56:56 +0200
Subject: [PATCH 1/8] dma-buf: heaps: Introduce a new heap for reserved memory
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240515-dma-buf-ecc-heap-v1-1-54cbbd049511@kernel.org>
References: <20240515-dma-buf-ecc-heap-v1-0-54cbbd049511@kernel.org>
In-Reply-To: <20240515-dma-buf-ecc-heap-v1-0-54cbbd049511@kernel.org>
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>, 
 "T.J. Mercier" <tjmercier@google.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Mattijs Korpershoek <mkorpershoek@baylibre.com>, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linaro-mm-sig@lists.linaro.org, Maxime Ripard <mripard@kernel.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=9483; i=mripard@kernel.org;
 h=from:subject:message-id; bh=y4c5Ovhy94byqgEWHicSc3d/PAkjnLlMSsPZmPA2CY4=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDGku+30tkivZGtj+2vRlvdih5t2+sUmOa28rw7qJs/4/b
 mTJ9zvZMZWFQZiTQVZMkeWJTNjp5e2LqxzsV/6AmcPKBDKEgYtTACaS5cBYn3Fzof6U71OkEm4s
 XePqtdGj8sCHmS9fFS23yHdbtP5D/T3F37vSzB43HYg9LZZ71vGFF2PDBLPK1M6/gokbFULVbHa
 byT7/G6TGYTg7XX7uH9uQKRMDt900VbkeslZxtf9TFedz/8oB
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
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

Some reserved memory regions might have particular memory setup or
attributes that make them good candidates for heaps.

Let's provide a heap type that will create a new heap for each reserved
memory region flagged as such.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/dma-buf/heaps/Kconfig         |   8 +
 drivers/dma-buf/heaps/Makefile        |   1 +
 drivers/dma-buf/heaps/carveout_heap.c | 314 ++++++++++++++++++++++++++++++++++
 3 files changed, 323 insertions(+)

diff --git a/drivers/dma-buf/heaps/Kconfig b/drivers/dma-buf/heaps/Kconfig
index a5eef06c4226..c6981d696733 100644
--- a/drivers/dma-buf/heaps/Kconfig
+++ b/drivers/dma-buf/heaps/Kconfig
@@ -1,5 +1,13 @@
+config DMABUF_HEAPS_CARVEOUT
+	bool "Carveout Heaps"
+	depends on DMABUF_HEAPS
+	help
+	  Choose this option to enable the carveout dmabuf heap. The carveout
+	  heap is backed by pages from reserved memory regions flagged as
+	  exportable. If in doubt, say Y.
+
 config DMABUF_HEAPS_SYSTEM
 	bool "DMA-BUF System Heap"
 	depends on DMABUF_HEAPS
 	help
 	  Choose this option to enable the system dmabuf heap. The system heap
diff --git a/drivers/dma-buf/heaps/Makefile b/drivers/dma-buf/heaps/Makefile
index 974467791032..b734647ad5c8 100644
--- a/drivers/dma-buf/heaps/Makefile
+++ b/drivers/dma-buf/heaps/Makefile
@@ -1,3 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0
+obj-$(CONFIG_DMABUF_HEAPS_CARVEOUT)	+= carveout_heap.o
 obj-$(CONFIG_DMABUF_HEAPS_SYSTEM)	+= system_heap.o
 obj-$(CONFIG_DMABUF_HEAPS_CMA)		+= cma_heap.o
diff --git a/drivers/dma-buf/heaps/carveout_heap.c b/drivers/dma-buf/heaps/carveout_heap.c
new file mode 100644
index 000000000000..896ca67e6bd9
--- /dev/null
+++ b/drivers/dma-buf/heaps/carveout_heap.c
@@ -0,0 +1,314 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <linux/dma-buf.h>
+#include <linux/dma-heap.h>
+#include <linux/genalloc.h>
+#include <linux/of_reserved_mem.h>
+
+struct carveout_heap_priv {
+	struct dma_heap *heap;
+	struct gen_pool *pool;
+};
+
+struct carveout_heap_buffer_priv {
+	struct mutex lock;
+	struct list_head attachments;
+
+	unsigned long len;
+	unsigned long num_pages;
+	struct carveout_heap_priv *heap;
+	void *buffer;
+};
+
+struct carveout_heap_attachment {
+	struct list_head head;
+	struct sg_table table;
+
+	struct device *dev;
+	bool mapped;
+};
+
+static int carveout_heap_attach(struct dma_buf *buf,
+				struct dma_buf_attachment *attachment)
+{
+	struct carveout_heap_buffer_priv *priv = buf->priv;
+	struct carveout_heap_attachment *a;
+	int ret;
+
+	a = kzalloc(sizeof(*a), GFP_KERNEL);
+	if (!a)
+		return -ENOMEM;
+	INIT_LIST_HEAD(&a->head);
+	a->dev = attachment->dev;
+	attachment->priv = a;
+
+	ret = sg_alloc_table(&a->table, priv->num_pages, GFP_KERNEL);
+	if (ret)
+		goto err_cleanup_attach;
+
+	mutex_lock(&priv->lock);
+	list_add(&a->head, &priv->attachments);
+	mutex_unlock(&priv->lock);
+
+	return 0;
+
+err_cleanup_attach:
+	kfree(a);
+	return ret;
+}
+
+static void carveout_heap_detach(struct dma_buf *dmabuf,
+				 struct dma_buf_attachment *attachment)
+{
+	struct carveout_heap_buffer_priv *priv = dmabuf->priv;
+	struct carveout_heap_attachment *a = attachment->priv;
+
+	mutex_lock(&priv->lock);
+	list_del(&a->head);
+	mutex_unlock(&priv->lock);
+
+	sg_free_table(&a->table);
+	kfree(a);
+}
+
+static struct sg_table *
+carveout_heap_map_dma_buf(struct dma_buf_attachment *attachment,
+			  enum dma_data_direction direction)
+{
+	struct carveout_heap_attachment *a = attachment->priv;
+	struct sg_table *table = &a->table;
+	int ret;
+
+	ret = dma_map_sgtable(a->dev, table, direction, 0);
+	if (ret)
+		return ERR_PTR(-ENOMEM);
+
+	a->mapped = true;
+
+	return table;
+}
+
+static void carveout_heap_unmap_dma_buf(struct dma_buf_attachment *attachment,
+					struct sg_table *table,
+					enum dma_data_direction direction)
+{
+	struct carveout_heap_attachment *a = attachment->priv;
+
+	a->mapped = false;
+	dma_unmap_sgtable(a->dev, table, direction, 0);
+}
+
+static int
+carveout_heap_dma_buf_begin_cpu_access(struct dma_buf *dmabuf,
+				       enum dma_data_direction direction)
+{
+	struct carveout_heap_buffer_priv *priv = dmabuf->priv;
+	struct carveout_heap_attachment *a;
+
+	mutex_lock(&priv->lock);
+
+	list_for_each_entry(a, &priv->attachments, head) {
+		if (!a->mapped)
+			continue;
+
+		dma_sync_sgtable_for_cpu(a->dev, &a->table, direction);
+	}
+
+	mutex_unlock(&priv->lock);
+
+	return 0;
+}
+
+static int
+carveout_heap_dma_buf_end_cpu_access(struct dma_buf *dmabuf,
+				     enum dma_data_direction direction)
+{
+	struct carveout_heap_buffer_priv *priv = dmabuf->priv;
+	struct carveout_heap_attachment *a;
+
+	mutex_lock(&priv->lock);
+
+	list_for_each_entry(a, &priv->attachments, head) {
+		if (!a->mapped)
+			continue;
+
+		dma_sync_sgtable_for_device(a->dev, &a->table, direction);
+	}
+
+	mutex_unlock(&priv->lock);
+
+	return 0;
+}
+
+static int carveout_heap_mmap(struct dma_buf *dmabuf,
+			      struct vm_area_struct *vma)
+{
+	struct carveout_heap_buffer_priv *priv = dmabuf->priv;
+	struct page *page = virt_to_page(priv->buffer);
+
+	return remap_pfn_range(vma, vma->vm_start, page_to_pfn(page),
+			       priv->num_pages * PAGE_SIZE, vma->vm_page_prot);
+}
+
+static void carveout_heap_dma_buf_release(struct dma_buf *buf)
+{
+	struct carveout_heap_buffer_priv *buffer_priv = buf->priv;
+	struct carveout_heap_priv *heap_priv = buffer_priv->heap;
+
+	gen_pool_free(heap_priv->pool, (unsigned long)buffer_priv->buffer,
+		      buffer_priv->len);
+	kfree(buffer_priv);
+}
+
+static const struct dma_buf_ops carveout_heap_buf_ops = {
+	.attach		= carveout_heap_attach,
+	.detach		= carveout_heap_detach,
+	.map_dma_buf	= carveout_heap_map_dma_buf,
+	.unmap_dma_buf	= carveout_heap_unmap_dma_buf,
+	.begin_cpu_access	= carveout_heap_dma_buf_begin_cpu_access,
+	.end_cpu_access	= carveout_heap_dma_buf_end_cpu_access,
+	.mmap		= carveout_heap_mmap,
+	.release	= carveout_heap_dma_buf_release,
+};
+
+static struct dma_buf *carveout_heap_allocate(struct dma_heap *heap,
+					      unsigned long len,
+					      unsigned long fd_flags,
+					      unsigned long heap_flags)
+{
+	struct carveout_heap_priv *heap_priv = dma_heap_get_drvdata(heap);
+	struct carveout_heap_buffer_priv *buffer_priv;
+	DEFINE_DMA_BUF_EXPORT_INFO(exp_info);
+	struct dma_buf *buf;
+	dma_addr_t daddr;
+	void *buffer;
+	int ret;
+
+	buffer_priv = kzalloc(sizeof(*buffer_priv), GFP_KERNEL);
+	if (!buffer_priv)
+		return ERR_PTR(-ENOMEM);
+
+	INIT_LIST_HEAD(&buffer_priv->attachments);
+	mutex_init(&buffer_priv->lock);
+
+	buffer = gen_pool_dma_zalloc(heap_priv->pool, len, &daddr);
+	if (!buffer) {
+		ret = -ENOMEM;
+		goto err_free_buffer_priv;
+	}
+
+	buffer_priv->buffer = buffer;
+	buffer_priv->heap = heap_priv;
+	buffer_priv->len = len;
+	buffer_priv->num_pages = len / PAGE_SIZE;
+
+	/* create the dmabuf */
+	exp_info.exp_name = dma_heap_get_name(heap);
+	exp_info.ops = &carveout_heap_buf_ops;
+	exp_info.size = buffer_priv->len;
+	exp_info.flags = fd_flags;
+	exp_info.priv = buffer_priv;
+
+	buf = dma_buf_export(&exp_info);
+	if (IS_ERR(buf)) {
+		ret = PTR_ERR(buf);
+		goto err_free_buffer;
+	}
+
+	return buf;
+
+err_free_buffer:
+	gen_pool_free(heap_priv->pool, (unsigned long)buffer, len);
+err_free_buffer_priv:
+	kfree(buffer_priv);
+
+	return ERR_PTR(ret);
+}
+
+static const struct dma_heap_ops carveout_heap_ops = {
+	.allocate = carveout_heap_allocate,
+};
+
+static int __init carveout_heap_setup(struct device_node *node)
+{
+	struct dma_heap_export_info exp_info = {};
+	const struct reserved_mem *rmem;
+	struct carveout_heap_priv *priv;
+	struct dma_heap *heap;
+	struct gen_pool *pool;
+	void *base;
+	int ret;
+
+	rmem = of_reserved_mem_lookup(node);
+	if (!rmem)
+		return -EINVAL;
+
+	priv = kzalloc(sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	pool = gen_pool_create(PAGE_SHIFT, NUMA_NO_NODE);
+	if (!pool) {
+		ret = -ENOMEM;
+		goto err_cleanup_heap;
+	}
+	priv->pool = pool;
+
+	base = memremap(rmem->base, rmem->size, MEMREMAP_WB);
+	if (!base) {
+		ret = -ENOMEM;
+		goto err_release_mem_region;
+	}
+
+	ret = gen_pool_add_virt(pool, (unsigned long)base, rmem->base,
+				rmem->size, NUMA_NO_NODE);
+	if (ret)
+		goto err_unmap;
+
+	exp_info.name = node->full_name;
+	exp_info.ops = &carveout_heap_ops;
+	exp_info.priv = priv;
+
+	heap = dma_heap_add(&exp_info);
+	if (IS_ERR(heap)) {
+		ret = PTR_ERR(heap);
+		goto err_cleanup_pool_region;
+	}
+	priv->heap = heap;
+
+	return 0;
+
+err_cleanup_pool_region:
+	gen_pool_free(pool, (unsigned long)base, rmem->size);
+err_unmap:
+	memunmap(base);
+err_release_mem_region:
+	gen_pool_destroy(pool);
+err_cleanup_heap:
+	kfree(priv);
+	return ret;
+}
+
+static int __init carveout_heap_init(void)
+{
+	struct device_node *rmem_node;
+	struct device_node *node;
+	int ret;
+
+	rmem_node = of_find_node_by_path("/reserved-memory");
+	if (!rmem_node)
+		return 0;
+
+	for_each_child_of_node(rmem_node, node) {
+		if (!of_property_read_bool(node, "export"))
+			continue;
+
+		ret = carveout_heap_setup(node);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+module_init(carveout_heap_init);

-- 
2.44.0

