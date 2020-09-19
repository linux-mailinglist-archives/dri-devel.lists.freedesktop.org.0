Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD5CE270B93
	for <lists+dri-devel@lfdr.de>; Sat, 19 Sep 2020 09:49:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3CBE6E172;
	Sat, 19 Sep 2020 07:49:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 787116E172
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Sep 2020 07:49:25 +0000 (UTC)
Received: by mail-pl1-x644.google.com with SMTP id e4so4186217pln.10
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Sep 2020 00:49:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=Mo9wAvGILKCqYotrN+tF0XCxTgM5i35wrY/cuVjP5Ps=;
 b=VMlNfIw2pyfJl6rUyI7rAR56tGSa+aICh4WBFHY+FIFO75ETGjU9BpSfSuvERReo5P
 iBm2ls1HWbP1Ta9DHf2/gvdVpOqoqvT1MrKw5egGT3xxIAY4wTAsR7IDrzvnhRIpZDyL
 WJchOoG349il5bAa+xSY3/amWvNYAcvSKTiWjEevs9OhKDNYHiyF29Rtgo11ILK13puX
 72Z2I98soY3kveDkcHzui0pbkc207x80/dySWD4Feuu8xEYaCkPXhJYXzuDOXiJDXy0d
 I/+9rNx5f7pZ+GBw2ienUNvMPB7ev9+FcUqE7bTVxUuDTiSD5JqKOjKPuN60cQ2Lymqn
 rchQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=Mo9wAvGILKCqYotrN+tF0XCxTgM5i35wrY/cuVjP5Ps=;
 b=cUkRL+V6Ef+C1pfizIp3D4bDtBaenQbwU8YfKBxbTefQ0dOqD2oq9o/AhaVVq91Hpo
 9XkOaV8G0bKoEBvIBjEdP1qh7aSmZD2LzQs/NwoaI/MnXQEjRuZSRgMdCsr6j/OpJ6oP
 qsJ2FrqZi+iYoUMI6JbzwI4TPaPe2wag0aKUBn6dBiZlebXICjgPSigflaIxkmrwzj3c
 ESz90So3YRAjvigedbb/wMCDWMaoJBDDIOzWuHZNBNw1KNmZQHdkzAbkZqqvAphuJoFZ
 td7lSRYbDYaA4Cq2SBJko7E4ToyvC17/RgbnZi4MmDxkG9DEwOCt8gIOVvEzACqPAgfp
 dBoA==
X-Gm-Message-State: AOAM531FUMA7dpMWVqT3v8iye10rWkeAgZ9ouxGKUSuxBkD73vB+kUO5
 zdrKSkr99dQixA49bdHWXgyb5A==
X-Google-Smtp-Source: ABdhPJzxtKNJExQxGphWrBSpCp6nPiEtR1WXPnghOp2j+lZr49oGD8LfOwdiVGslVYrJXFathVlwnA==
X-Received: by 2002:a17:90a:ca17:: with SMTP id
 x23mr15392828pjt.96.1600501765011; 
 Sat, 19 Sep 2020 00:49:25 -0700 (PDT)
Received: from localhost.localdomain ([2601:1c2:680:1319:692:26ff:feda:3a81])
 by smtp.gmail.com with ESMTPSA id
 m13sm5688151pfk.103.2020.09.19.00.49.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 19 Sep 2020 00:49:24 -0700 (PDT)
From: John Stultz <john.stultz@linaro.org>
To: lkml <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 2/2] dma-heap: Add a system-uncached heap
Date: Sat, 19 Sep 2020 07:49:05 +0000
Message-Id: <20200919074905.82036-2-john.stultz@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200919074905.82036-1-john.stultz@linaro.org>
References: <20200919074905.82036-1-john.stultz@linaro.org>
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
Cc: dri-devel@lists.freedesktop.org, Ezequiel Garcia <ezequiel@collabora.com>,
 James Jones <jajones@nvidia.com>, Liam Mark <lmark@codeaurora.org>,
 "Andrew F . Davis" <afd@ti.com>, Laura Abbott <labbott@kernel.org>,
 Hridya Valsaraju <hridya@google.com>, Robin Murphy <robin.murphy@arm.com>,
 linux-media@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This adds a heap that allocates non-contiguous buffers that are
marked as writecombined, so they are not cached by the CPU.

This is useful, as most graphics buffers are usually not touched
by the CPU or only written into once by the CPU. So when mapping
the buffer over and over between devices, we can skip the CPU
syncing, which saves a lot of cache management overhead, greatly
improving performance.

For folk using ION, there was a ION_FLAG_CACHED flag, which
signaled if the returned buffer should be CPU cacheable or not.
With DMA-BUF heaps, we do not yet have such a flag, and by default
the current heaps (system and cma) produce CPU cachable buffers.
So for folks transitioning from ION to DMA-BUF Heaps, this fills
in some of that missing functionality.

There has been a suggestion to make this functionality a flag
(DMAHEAP_FLAG_UNCACHED?) on the system heap, similar to how
ION used the ION_FLAG_CACHED. But I want to make sure an
_UNCACHED flag would truely be a generic attribute across all
heaps. So far that has been unclear, so having it as a separate
heap seemes better for now. (But I'm open to discussion on this
point!)

Feedback would be very welcome!

Many thanks to Liam Mark for his help to get this working.

Pending opensource users of this code include:
* AOSP HiKey960 gralloc:
  - https://android-review.googlesource.com/c/device/linaro/hikey/+/1399519
  - Visibly improves performance over the system heap
* AOSP Codec2 (possibly, needs more review):
  - https://android-review.googlesource.com/c/platform/frameworks/av/+/1360640/17/media/codec2/vndk/C2DmaBufAllocator.cpp#325

Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: Andrew F. Davis <afd@ti.com>
Cc: Benjamin Gaignard <benjamin.gaignard@linaro.org>
Cc: Liam Mark <lmark@codeaurora.org>
Cc: Laura Abbott <labbott@kernel.org>
Cc: Brian Starkey <Brian.Starkey@arm.com>
Cc: Hridya Valsaraju <hridya@google.com>
Cc: Robin Murphy <robin.murphy@arm.com>
Cc: Ezequiel Garcia <ezequiel@collabora.com>
Cc: Simon Ser <contact@emersion.fr>
Cc: James Jones <jajones@nvidia.com>
Cc: linux-media@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: John Stultz <john.stultz@linaro.org>
---
v2:
* Fix build issue on sh reported-by: kernel test robot <lkp@intel.com>
* Rework to use for_each_sgtable_sg(), dma_map_sgtable(), and
  for_each_sg_page() along with numerous other cleanups suggested
  by Robin Murphy
v3:
* Clarified commit message to address questions from last submission
---
 drivers/dma-buf/heaps/Kconfig                |  10 +
 drivers/dma-buf/heaps/Makefile               |   1 +
 drivers/dma-buf/heaps/system_uncached_heap.c | 371 +++++++++++++++++++
 3 files changed, 382 insertions(+)
 create mode 100644 drivers/dma-buf/heaps/system_uncached_heap.c

diff --git a/drivers/dma-buf/heaps/Kconfig b/drivers/dma-buf/heaps/Kconfig
index a5eef06c4226..420b0ed0a512 100644
--- a/drivers/dma-buf/heaps/Kconfig
+++ b/drivers/dma-buf/heaps/Kconfig
@@ -5,6 +5,16 @@ config DMABUF_HEAPS_SYSTEM
 	  Choose this option to enable the system dmabuf heap. The system heap
 	  is backed by pages from the buddy allocator. If in doubt, say Y.
 
+config DMABUF_HEAPS_SYSTEM_UNCACHED
+	bool "DMA-BUF Uncached System Heap"
+	depends on DMABUF_HEAPS
+	help
+	  Choose this option to enable the uncached system dmabuf heap. This
+	  heap is backed by pages from the buddy allocator, but pages are setup
+	  for write combining. This avoids cache management overhead, and can
+	  be faster if pages are mostly untouched by the cpu.  If in doubt,
+	  say Y.
+
 config DMABUF_HEAPS_CMA
 	bool "DMA-BUF CMA Heap"
 	depends on DMABUF_HEAPS && DMA_CMA
diff --git a/drivers/dma-buf/heaps/Makefile b/drivers/dma-buf/heaps/Makefile
index 6e54cdec3da0..085685ec478f 100644
--- a/drivers/dma-buf/heaps/Makefile
+++ b/drivers/dma-buf/heaps/Makefile
@@ -1,4 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0
 obj-y					+= heap-helpers.o
 obj-$(CONFIG_DMABUF_HEAPS_SYSTEM)	+= system_heap.o
+obj-$(CONFIG_DMABUF_HEAPS_SYSTEM_UNCACHED) += system_uncached_heap.o
 obj-$(CONFIG_DMABUF_HEAPS_CMA)		+= cma_heap.o
diff --git a/drivers/dma-buf/heaps/system_uncached_heap.c b/drivers/dma-buf/heaps/system_uncached_heap.c
new file mode 100644
index 000000000000..3b8e699bcae7
--- /dev/null
+++ b/drivers/dma-buf/heaps/system_uncached_heap.c
@@ -0,0 +1,371 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Uncached System DMA-Heap exporter
+ *
+ * Copyright (C) 2020 Linaro Ltd.
+ *
+ * Based off of Andrew Davis' SRAM heap:
+ * Copyright (C) 2019 Texas Instruments Incorporated - http://www.ti.com/
+ *	Andrew F. Davis <afd@ti.com>
+ */
+
+#include <linux/dma-mapping.h>
+#include <linux/err.h>
+#include <linux/highmem.h>
+#include <linux/io.h>
+#include <linux/mm.h>
+#include <linux/scatterlist.h>
+#include <linux/slab.h>
+#include <linux/vmalloc.h>
+#include <linux/dma-buf.h>
+#include <linux/dma-heap.h>
+
+struct uncached_heap {
+	struct dma_heap *heap;
+};
+
+struct uncached_heap_buffer {
+	struct dma_heap *heap;
+	struct list_head attachments;
+	struct mutex lock;
+	unsigned long len;
+	struct sg_table sg_table;
+	int vmap_cnt;
+	void *vaddr;
+};
+
+struct dma_heap_attachment {
+	struct device *dev;
+	struct sg_table *table;
+	struct list_head list;
+};
+
+static struct sg_table *dup_sg_table(struct sg_table *table)
+{
+	struct sg_table *new_table;
+	int ret, i;
+	struct scatterlist *sg, *new_sg;
+
+	new_table = kzalloc(sizeof(*new_table), GFP_KERNEL);
+	if (!new_table)
+		return ERR_PTR(-ENOMEM);
+
+	ret = sg_alloc_table(new_table, table->nents, GFP_KERNEL);
+	if (ret) {
+		kfree(new_table);
+		return ERR_PTR(-ENOMEM);
+	}
+
+	new_sg = new_table->sgl;
+	for_each_sgtable_sg(table, sg, i) {
+		sg_set_page(new_sg, sg_page(sg), sg->length, sg->offset);
+		new_sg = sg_next(new_sg);
+	}
+
+	return new_table;
+}
+
+static int dma_heap_attach(struct dma_buf *dmabuf,
+			   struct dma_buf_attachment *attachment)
+{
+	struct uncached_heap_buffer *buffer = dmabuf->priv;
+	struct dma_heap_attachment *a;
+	struct sg_table *table;
+
+	a = kzalloc(sizeof(*a), GFP_KERNEL);
+	if (!a)
+		return -ENOMEM;
+
+	table = dup_sg_table(&buffer->sg_table);
+	if (IS_ERR(table)) {
+		kfree(a);
+		return -ENOMEM;
+	}
+
+	a->table = table;
+	a->dev = attachment->dev;
+	INIT_LIST_HEAD(&a->list);
+
+	attachment->priv = a;
+
+	mutex_lock(&buffer->lock);
+	list_add(&a->list, &buffer->attachments);
+	mutex_unlock(&buffer->lock);
+
+	return 0;
+}
+
+static void dma_heap_detatch(struct dma_buf *dmabuf,
+			     struct dma_buf_attachment *attachment)
+{
+	struct uncached_heap_buffer *buffer = dmabuf->priv;
+	struct dma_heap_attachment *a = attachment->priv;
+
+	mutex_lock(&buffer->lock);
+	list_del(&a->list);
+	mutex_unlock(&buffer->lock);
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
+	if (dma_map_sgtable(attachment->dev, table, direction, DMA_ATTR_SKIP_CPU_SYNC))
+		return ERR_PTR(-ENOMEM);
+
+	return table;
+}
+
+static void dma_heap_unmap_dma_buf(struct dma_buf_attachment *attachment,
+				   struct sg_table *table,
+				   enum dma_data_direction direction)
+{
+	dma_unmap_sgtable(attachment->dev, table, direction, DMA_ATTR_SKIP_CPU_SYNC);
+}
+
+static int dma_heap_mmap(struct dma_buf *dmabuf, struct vm_area_struct *vma)
+{
+	struct uncached_heap_buffer *buffer = dmabuf->priv;
+	struct sg_table *table = &buffer->sg_table;
+	unsigned long addr = vma->vm_start;
+	struct sg_page_iter piter;
+	int ret;
+
+	vma->vm_page_prot = pgprot_writecombine(vma->vm_page_prot);
+
+	for_each_sgtable_page(table, &piter, vma->vm_pgoff) {
+		struct page *page = sg_page_iter_page(&piter);
+
+		ret = remap_pfn_range(vma, addr, page_to_pfn(page), PAGE_SIZE,
+				      vma->vm_page_prot);
+		if (ret)
+			return ret;
+		addr += PAGE_SIZE;
+		if (addr >= vma->vm_end)
+			return 0;
+	}
+	return 0;
+}
+
+static void *dma_heap_do_vmap(struct uncached_heap_buffer *buffer)
+{
+	struct sg_table *table = &buffer->sg_table;
+	int npages = PAGE_ALIGN(buffer->len) / PAGE_SIZE;
+	struct page **pages = vmalloc(sizeof(struct page *) * npages);
+	struct page **tmp = pages;
+	struct sg_page_iter piter;
+	pgprot_t pgprot;
+	void *vaddr;
+
+	if (!pages)
+		return ERR_PTR(-ENOMEM);
+
+	pgprot = pgprot_writecombine(PAGE_KERNEL);
+
+	for_each_sgtable_page(table, &piter, 0) {
+		WARN_ON(tmp - pages >= npages);
+		*tmp++ = sg_page_iter_page(&piter);
+	}
+
+	vaddr = vmap(pages, npages, VM_MAP, pgprot);
+	vfree(pages);
+
+	if (!vaddr)
+		return ERR_PTR(-ENOMEM);
+
+	return vaddr;
+}
+
+static void *dma_heap_buffer_vmap_get(struct uncached_heap_buffer *buffer)
+{
+	void *vaddr;
+
+	if (buffer->vmap_cnt) {
+		buffer->vmap_cnt++;
+		return buffer->vaddr;
+	}
+
+	vaddr = dma_heap_do_vmap(buffer);
+	if (IS_ERR(vaddr))
+		return vaddr;
+
+	buffer->vaddr = vaddr;
+	buffer->vmap_cnt++;
+	return vaddr;
+}
+
+static void dma_heap_buffer_vmap_put(struct uncached_heap_buffer *buffer)
+{
+	if (!--buffer->vmap_cnt) {
+		vunmap(buffer->vaddr);
+		buffer->vaddr = NULL;
+	}
+}
+
+static void *dma_heap_vmap(struct dma_buf *dmabuf)
+{
+	struct uncached_heap_buffer *buffer = dmabuf->priv;
+	void *vaddr;
+
+	mutex_lock(&buffer->lock);
+	vaddr = dma_heap_buffer_vmap_get(buffer);
+	mutex_unlock(&buffer->lock);
+
+	return vaddr;
+}
+
+static void dma_heap_vunmap(struct dma_buf *dmabuf, void *vaddr)
+{
+	struct uncached_heap_buffer *buffer = dmabuf->priv;
+
+	mutex_lock(&buffer->lock);
+	dma_heap_buffer_vmap_put(buffer);
+	mutex_unlock(&buffer->lock);
+}
+
+static void dma_heap_dma_buf_release(struct dma_buf *dmabuf)
+{
+	struct uncached_heap_buffer *buffer = dmabuf->priv;
+	struct sg_table *table;
+	struct scatterlist *sg;
+	int i;
+
+	table = &buffer->sg_table;
+	dma_unmap_sgtable(dma_heap_get_dev(buffer->heap), table, DMA_BIDIRECTIONAL, 0);
+
+	for_each_sgtable_sg(table, sg, i)
+		__free_page(sg_page(sg));
+	sg_free_table(table);
+	kfree(buffer);
+}
+
+const struct dma_buf_ops uncached_heap_buf_ops = {
+	.attach = dma_heap_attach,
+	.detach = dma_heap_detatch,
+	.map_dma_buf = dma_heap_map_dma_buf,
+	.unmap_dma_buf = dma_heap_unmap_dma_buf,
+	.mmap = dma_heap_mmap,
+	.vmap = dma_heap_vmap,
+	.vunmap = dma_heap_vunmap,
+	.release = dma_heap_dma_buf_release,
+};
+
+static int uncached_heap_allocate(struct dma_heap *heap,
+				  unsigned long len,
+				  unsigned long fd_flags,
+				  unsigned long heap_flags)
+{
+	struct uncached_heap_buffer *buffer;
+	DEFINE_DMA_BUF_EXPORT_INFO(exp_info);
+	struct dma_buf *dmabuf;
+	struct sg_table *table;
+	struct scatterlist *sg;
+	pgoff_t pagecount;
+	pgoff_t pg;
+	int i, ret = -ENOMEM;
+
+	buffer = kzalloc(sizeof(*buffer), GFP_KERNEL);
+	if (!buffer)
+		return -ENOMEM;
+
+	INIT_LIST_HEAD(&buffer->attachments);
+	mutex_init(&buffer->lock);
+	buffer->heap = heap;
+	buffer->len = len;
+
+	table = &buffer->sg_table;
+	pagecount = len / PAGE_SIZE;
+	if (sg_alloc_table(table, pagecount, GFP_KERNEL))
+		goto free_buffer;
+
+	sg = table->sgl;
+	for (pg = 0; pg < pagecount; pg++) {
+		struct page *page;
+		/*
+		 * Avoid trying to allocate memory if the process
+		 * has been killed by SIGKILL
+		 */
+		if (fatal_signal_pending(current))
+			goto free_pages;
+		page = alloc_page(GFP_KERNEL | __GFP_ZERO);
+		if (!page)
+			goto free_pages;
+		sg_set_page(sg, page, page_size(page), 0);
+		sg = sg_next(sg);
+	}
+
+	/* create the dmabuf */
+	exp_info.ops = &uncached_heap_buf_ops;
+	exp_info.size = buffer->len;
+	exp_info.flags = fd_flags;
+	exp_info.priv = buffer;
+	dmabuf = dma_buf_export(&exp_info);
+	if (IS_ERR(dmabuf)) {
+		ret = PTR_ERR(dmabuf);
+		goto free_pages;
+	}
+
+	ret = dma_buf_fd(dmabuf, fd_flags);
+	if (ret < 0) {
+		dma_buf_put(dmabuf);
+		/* just return, as put will call release and that will free */
+		return ret;
+	}
+
+	/*
+	 * XXX This is hackish. While the buffer will be uncached, we need
+	 * to initially flush cpu cache, since the __GFP_ZERO on the
+	 * allocation means the zeroing was done by the cpu and thus it is
+	 * likely cached. Map (and implicitly flush) it out now so we don't
+	 * get corruption later on.
+	 *
+	 * Ideally we could do this without using the heap device as a dummy dev.
+	 */
+	dma_map_sgtable(dma_heap_get_dev(heap), table, DMA_BIDIRECTIONAL, 0);
+
+	return ret;
+
+free_pages:
+	for_each_sgtable_sg(table, sg, i)
+		__free_page(sg_page(sg));
+	sg_free_table(table);
+free_buffer:
+	kfree(buffer);
+
+	return ret;
+}
+
+static struct dma_heap_ops uncached_heap_ops = {
+	.allocate = uncached_heap_allocate,
+};
+
+static int uncached_heap_create(void)
+{
+	struct uncached_heap *heap;
+	struct dma_heap_export_info exp_info;
+
+	heap = kzalloc(sizeof(*heap), GFP_KERNEL);
+	if (!heap)
+		return -ENOMEM;
+
+	exp_info.name = "system-uncached";
+	exp_info.ops = &uncached_heap_ops;
+	exp_info.priv = heap;
+	heap->heap = dma_heap_add(&exp_info);
+	if (IS_ERR(heap->heap)) {
+		int ret = PTR_ERR(heap->heap);
+
+		kfree(heap);
+		return ret;
+	}
+	dma_coerce_mask_and_coherent(dma_heap_get_dev(heap->heap), DMA_BIT_MASK(64));
+
+	return 0;
+}
+device_initcall(uncached_heap_create);
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
