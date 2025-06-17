Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E28BADCB5E
	for <lists+dri-devel@lfdr.de>; Tue, 17 Jun 2025 14:26:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF90610E618;
	Tue, 17 Jun 2025 12:25:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="MTQarxXz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6436210E60D
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Jun 2025 12:25:57 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 420055C6682;
 Tue, 17 Jun 2025 12:23:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18BD3C4CEF1;
 Tue, 17 Jun 2025 12:25:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1750163156;
 bh=tgcleMRQWGHM0pb97MCLzewTOhGGUbIwWzMi/hXglrg=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=MTQarxXzYp3O/7pLf05csV0/dbMIaF8hwUdOhtAKQNzSKBlCJwKa3+wE8kcz1SLoZ
 lQOkcBOdaj1AeTFM8HjjOPIHiV9SQzCiQ+MEBYga4Uk2XKO5CQE+Bb0wjHxtmCmS67
 9cKBjhKnoXowxpJknSvtotnqaDUX6Qodr48nNjy6tSlaobDopfKDLWPF5SwSQDfgOe
 DGWR5hzoH5cSSY8xoCit4c8bdxD4ZVeTDXgUxpDLAD1WAnvDFFv5eg8kSGK+1BFpIZ
 xN5Mr9X+M+wmFq0xb0xpPAsWf/9uHZODUQzLd/83md5fE+h0cjU2MnB/9mGB9LR3oO
 knxmJKZ/rbTHQ==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 17 Jun 2025 14:25:41 +0200
Subject: [PATCH v5 2/2] dma-buf: heaps: Introduce a new heap for reserved
 memory
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250617-dma-buf-ecc-heap-v5-2-0abdc5863a4f@kernel.org>
References: <20250617-dma-buf-ecc-heap-v5-0-0abdc5863a4f@kernel.org>
In-Reply-To: <20250617-dma-buf-ecc-heap-v5-0-0abdc5863a4f@kernel.org>
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>, 
 "T.J. Mercier" <tjmercier@google.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Andrew Davis <afd@ti.com>, Jared Kangas <jkangas@redhat.com>, 
 Mattijs Korpershoek <mkorpershoek@kernel.org>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
 Maxime Ripard <mripard@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=10750; i=mripard@kernel.org;
 h=from:subject:message-id; bh=tgcleMRQWGHM0pb97MCLzewTOhGGUbIwWzMi/hXglrg=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDBmBcSfNt0/432eecGfWf/udTvZeG30XqLx6Fix/svikW
 c/WCeesOqayMAhzMsiKKbI8kQk7vbx9cZWD/cofMHNYmUCGMHBxCsBE1nswNmxPivtwddmph9sC
 T0tObdh/vIx1+6vJb22t6gTVf+YdOzj/so+G+uz7M3T5XeznGCQ92MBYH5PzUcd179+n/to3ijI
 WdP3nz31xavulmdwRAtuLUm5f2Tc1ciPjj8yyeZ+Ub52T+DUvFAA=
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
 drivers/dma-buf/heaps/carveout_heap.c | 362 ++++++++++++++++++++++++++++++++++
 3 files changed, 371 insertions(+)

diff --git a/drivers/dma-buf/heaps/Kconfig b/drivers/dma-buf/heaps/Kconfig
index a5eef06c422644e8aadaf5aff2bd9a33c49c1ba3..1ce4f6828d8c06bfdd7bc2e5127707f1778586e6 100644
--- a/drivers/dma-buf/heaps/Kconfig
+++ b/drivers/dma-buf/heaps/Kconfig
@@ -1,5 +1,13 @@
+config DMABUF_HEAPS_CARVEOUT
+	bool "DMA-BUF Carveout Heaps"
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
index 974467791032ffb8a7aba17b1407d9a19b3f3b44..b734647ad5c84f449106748160258e372f153df2 100644
--- a/drivers/dma-buf/heaps/Makefile
+++ b/drivers/dma-buf/heaps/Makefile
@@ -1,3 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0
+obj-$(CONFIG_DMABUF_HEAPS_CARVEOUT)	+= carveout_heap.o
 obj-$(CONFIG_DMABUF_HEAPS_SYSTEM)	+= system_heap.o
 obj-$(CONFIG_DMABUF_HEAPS_CMA)		+= cma_heap.o
diff --git a/drivers/dma-buf/heaps/carveout_heap.c b/drivers/dma-buf/heaps/carveout_heap.c
new file mode 100644
index 0000000000000000000000000000000000000000..c01abc72c09d4f2a373462fded2856d975a36c8f
--- /dev/null
+++ b/drivers/dma-buf/heaps/carveout_heap.c
@@ -0,0 +1,362 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <linux/dma-buf.h>
+#include <linux/dma-heap.h>
+#include <linux/genalloc.h>
+#include <linux/highmem.h>
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
+	unsigned long num_pages;
+	struct carveout_heap_priv *heap;
+	phys_addr_t paddr;
+	void *vaddr;
+	unsigned int vmap_cnt;
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
+	struct sg_table *sgt;
+	unsigned long len = priv->num_pages * PAGE_SIZE;
+	int ret;
+
+	a = kzalloc(sizeof(*a), GFP_KERNEL);
+	if (!a)
+		return -ENOMEM;
+	INIT_LIST_HEAD(&a->head);
+	a->dev = attachment->dev;
+	attachment->priv = a;
+
+	sgt = &a->table;
+	ret = sg_alloc_table(sgt, 1, GFP_KERNEL);
+	if (ret)
+		goto err_cleanup_attach;
+
+	sg_set_buf(sgt->sgl, priv->vaddr, len);
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
+		return ERR_PTR(ret);
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
+	unsigned long len = priv->num_pages * PAGE_SIZE;
+
+	mutex_lock(&priv->lock);
+
+	if (priv->vmap_cnt)
+		invalidate_kernel_vmap_range(priv->vaddr, len);
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
+	unsigned long len = priv->num_pages * PAGE_SIZE;
+
+	mutex_lock(&priv->lock);
+
+	if (priv->vmap_cnt)
+		flush_kernel_vmap_range(priv->vaddr, len);
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
+	unsigned long len = priv->num_pages * PAGE_SIZE;
+
+	return vm_iomap_memory(vma, priv->paddr, len);
+}
+
+static int carveout_heap_vmap(struct dma_buf *dmabuf, struct iosys_map *map)
+{
+	struct carveout_heap_buffer_priv *priv = dmabuf->priv;
+	unsigned long len = priv->num_pages * PAGE_SIZE;
+
+	mutex_lock(&priv->lock);
+
+	if (!priv->vmap_cnt) {
+		void *vaddr = memremap(priv->paddr, len, MEMREMAP_WB);
+
+		if (!vaddr) {
+			mutex_unlock(&priv->lock);
+			return -ENOMEM;
+		}
+
+		priv->vaddr = vaddr;
+	}
+
+	WARN_ON(!priv->vaddr);
+	iosys_map_set_vaddr(map, priv->vaddr);
+	priv->vmap_cnt++;
+
+	mutex_unlock(&priv->lock);
+
+	return 0;
+}
+
+static void carveout_heap_vunmap(struct dma_buf *dmabuf, struct iosys_map *map)
+{
+	struct carveout_heap_buffer_priv *priv = dmabuf->priv;
+
+	mutex_lock(&priv->lock);
+
+	priv->vmap_cnt--;
+	if (!priv->vmap_cnt) {
+		memunmap(priv->vaddr);
+		priv->vaddr = NULL;
+	}
+
+	mutex_unlock(&priv->lock);
+
+	iosys_map_clear(map);
+}
+
+static void carveout_heap_dma_buf_release(struct dma_buf *buf)
+{
+	struct carveout_heap_buffer_priv *buffer_priv = buf->priv;
+	struct carveout_heap_priv *heap_priv = buffer_priv->heap;
+	unsigned long len = buffer_priv->num_pages * PAGE_SIZE;
+
+	gen_pool_free(heap_priv->pool, buffer_priv->paddr, len);
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
+	.vmap		= carveout_heap_vmap,
+	.vunmap		= carveout_heap_vunmap,
+	.release	= carveout_heap_dma_buf_release,
+};
+
+static struct dma_buf *carveout_heap_allocate(struct dma_heap *heap,
+					      unsigned long len,
+					      u32 fd_flags,
+					      u64 heap_flags)
+{
+	struct carveout_heap_priv *heap_priv = dma_heap_get_drvdata(heap);
+	struct carveout_heap_buffer_priv *buffer_priv;
+	DEFINE_DMA_BUF_EXPORT_INFO(exp_info);
+	struct dma_buf *buf;
+	phys_addr_t paddr;
+	/* len is guaranteed to be page-aligned by the framework, so we can use it as is. */
+	size_t size = len;
+	int ret;
+
+	buffer_priv = kzalloc(sizeof(*buffer_priv), GFP_KERNEL);
+	if (!buffer_priv)
+		return ERR_PTR(-ENOMEM);
+
+	INIT_LIST_HEAD(&buffer_priv->attachments);
+	mutex_init(&buffer_priv->lock);
+
+	paddr = gen_pool_alloc(heap_priv->pool, size);
+	if (!paddr) {
+		ret = -ENOMEM;
+		goto err_free_buffer_priv;
+	}
+
+	buffer_priv->paddr = paddr;
+	buffer_priv->heap = heap_priv;
+	buffer_priv->num_pages = size >> PAGE_SHIFT;
+
+	/* create the dmabuf */
+	exp_info.exp_name = dma_heap_get_name(heap);
+	exp_info.ops = &carveout_heap_buf_ops;
+	exp_info.size = size;
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
+	gen_pool_free(heap_priv->pool, paddr, len);
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
+	ret = gen_pool_add(pool, rmem->base, rmem->size, NUMA_NO_NODE);
+	if (ret)
+		goto err_release_mem_region;
+
+	exp_info.name = node->full_name;
+	exp_info.ops = &carveout_heap_ops;
+	exp_info.priv = priv;
+
+	heap = dma_heap_add(&exp_info);
+	if (IS_ERR(heap)) {
+		ret = PTR_ERR(heap);
+		goto err_release_mem_region;
+	}
+	priv->heap = heap;
+
+	return 0;
+
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
+		if (!of_device_is_compatible(node, "carved-out"))
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
2.49.0

