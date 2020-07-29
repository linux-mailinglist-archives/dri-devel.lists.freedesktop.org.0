Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CB4082318FD
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jul 2020 07:16:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 700236E43C;
	Wed, 29 Jul 2020 05:16:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com
 [IPv6:2607:f8b0:4864:20::1042])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F19D06E43C
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jul 2020 05:16:37 +0000 (UTC)
Received: by mail-pj1-x1042.google.com with SMTP id k71so1338372pje.0
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jul 2020 22:16:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=IJt9l6I/NtxzWzpcAmtt5rbjESaZJw7vS/myKKozjx0=;
 b=VnL1jfsXksTVrDQJOr7DSLlMDr5xrc3dajnCE5KyP8XUCcvvCmYGZrUMuMaE/WZz2v
 iv7KT/p8/EO75vduI+dolDVUMaq3cf3xFa4usfSXuZCGTTQ/U8VSBN5lMpOpUXL521b6
 /EA1zYOn5gLIsms8UTe/Nf7qGUeCPk32mkvrvrks/+mOLmFRg744IJUSjzeKILAqH45r
 DMi5smIdEcBxkLdkvE+Ipq7x8vnIE6uxL0OO9na2GOz30xVnH09qoRcqenWZeUn0ZFso
 f/Jy94FFOo2R0amQKYFsA8yJxFmiWp74cbLJRLGc6KS7RE07vC2IP0HM6GRgA6ftsXkn
 bLaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=IJt9l6I/NtxzWzpcAmtt5rbjESaZJw7vS/myKKozjx0=;
 b=G2XinjMFcf17MxNIfkV4yqVbUjkD3qPGsB0WCOq9NiNyTYyes/vGHgMvJd3OGIh4st
 PO3qXg7jeb0+OocaMsDx7YjumepTWdPuzbB6YY8c/pcEWDCBaVAVwEO6Di+i8su2Cyv4
 BmpADJm4RKC4SkDzL1quv+U/CuBqG7QX9mimZHOPt/zSs2E2fYF7gyBiR0BPbOXNxEOM
 pKGy0xyakaBmYK/GFkxK+I/AW4ez/QZlZppX59WPNVDbJQ1wy5wUXeXx8P7UaRxQ845m
 jlZ2eImi8EK28NPM4IGpgFScNtqF9ngCfNAZOusm3VUFLwaaeti9mi0tBqDN+ZBwmEv9
 fviQ==
X-Gm-Message-State: AOAM5301I/VSDrf19+CjCCZrA68wyZ+AuM+V17q+G8IjvBMBjg62A30i
 i18n+BgfAQ8hMMcW5s2PbO4Qog==
X-Google-Smtp-Source: ABdhPJzd3HMuyq/3eZBZ5lHjmZI5C8PbakCFhEkbOS3TSIg8plkY0shqPkYESe6C1DPS1Y8X8JJP/w==
X-Received: by 2002:a17:90b:378d:: with SMTP id
 mz13mr7793862pjb.98.1595999797447; 
 Tue, 28 Jul 2020 22:16:37 -0700 (PDT)
Received: from localhost.localdomain ([2601:1c2:680:1319:692:26ff:feda:3a81])
 by smtp.gmail.com with ESMTPSA id q5sm762750pgv.1.2020.07.28.22.16.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jul 2020 22:16:36 -0700 (PDT)
From: John Stultz <john.stultz@linaro.org>
To: lkml <linux-kernel@vger.kernel.org>
Subject: [RFC][PATCH 2/2] dma-heap: Add a system-uncached heap
Date: Wed, 29 Jul 2020 05:16:32 +0000
Message-Id: <20200729051632.66040-2-john.stultz@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200729051632.66040-1-john.stultz@linaro.org>
References: <20200729051632.66040-1-john.stultz@linaro.org>
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
Cc: dri-devel@lists.freedesktop.org, Liam Mark <lmark@codeaurora.org>,
 "Andrew F . Davis" <afd@ti.com>, Laura Abbott <labbott@kernel.org>,
 Hridya Valsaraju <hridya@google.com>, linux-media@vger.kernel.org
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
With DMA-BUF heaps, we have no such flag, and by default the
current heaps (system and cma) produce CPU cachable buffers.
So for folks transitioning from ION to DMA-BUF Heaps, this fills
in some of that missing functionality.

This does have a few "ugly" bits that were required to get
the buffer properly flushed out initially which I'd like to
improve. So feedback would be very welcome!

Many thanks to Liam Mark for his help to get this working.

Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: Andrew F. Davis <afd@ti.com>
Cc: Benjamin Gaignard <benjamin.gaignard@linaro.org>
Cc: Liam Mark <lmark@codeaurora.org>
Cc: Laura Abbott <labbott@kernel.org>
Cc: Brian Starkey <Brian.Starkey@arm.com>
Cc: Hridya Valsaraju <hridya@google.com>
Cc: linux-media@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: John Stultz <john.stultz@linaro.org>
---
 drivers/dma-buf/heaps/Kconfig                |  10 +
 drivers/dma-buf/heaps/Makefile               |   1 +
 drivers/dma-buf/heaps/system_uncached_heap.c | 392 +++++++++++++++++++
 3 files changed, 403 insertions(+)
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
index 000000000000..d23908038376
--- /dev/null
+++ b/drivers/dma-buf/heaps/system_uncached_heap.c
@@ -0,0 +1,392 @@
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
+	for_each_sg(table->sgl, sg, table->nents, i) {
+		memcpy(new_sg, sg, sizeof(*sg));
+		new_sg->dma_address = 0;
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
+	if (!dma_map_sg_attrs(attachment->dev, table->sgl, table->nents, direction,
+			      DMA_ATTR_SKIP_CPU_SYNC | DMA_ATTR_WRITE_COMBINE))
+		return ERR_PTR(-ENOMEM);
+
+	return table;
+}
+
+static void dma_heap_unmap_dma_buf(struct dma_buf_attachment *attachment,
+				   struct sg_table *table,
+				   enum dma_data_direction direction)
+{
+	dma_unmap_sg_attrs(attachment->dev, table->sgl, table->nents, direction,
+			   DMA_ATTR_SKIP_CPU_SYNC | DMA_ATTR_WRITE_COMBINE);
+}
+
+static int dma_heap_mmap(struct dma_buf *dmabuf, struct vm_area_struct *vma)
+{
+	struct uncached_heap_buffer *buffer = dmabuf->priv;
+	struct sg_table *table = &buffer->sg_table;
+	unsigned long addr = vma->vm_start;
+	unsigned long offset = vma->vm_pgoff * PAGE_SIZE;
+	struct scatterlist *sg;
+	int i;
+	int ret;
+
+	vma->vm_page_prot = pgprot_writecombine(vma->vm_page_prot);
+
+	for_each_sg(table->sgl, sg, table->nents, i) {
+		struct page *page = sg_page(sg);
+		unsigned long remainder = vma->vm_end - addr;
+		unsigned long len = sg->length;
+
+		if (offset >= sg->length) {
+			offset -= sg->length;
+			continue;
+		} else if (offset) {
+			page += offset / PAGE_SIZE;
+			len = sg->length - offset;
+			offset = 0;
+		}
+		len = min(len, remainder);
+		ret = remap_pfn_range(vma, addr, page_to_pfn(page), len,
+				      vma->vm_page_prot);
+		if (ret)
+			return ret;
+		addr += len;
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
+	struct scatterlist *sg;
+	pgprot_t pgprot;
+	void *vaddr;
+	int i, j;
+
+	if (!pages)
+		return ERR_PTR(-ENOMEM);
+
+	pgprot = pgprot_writecombine(PAGE_KERNEL);
+
+	for_each_sg(table->sgl, sg, table->nents, i) {
+		int npages_this_entry = PAGE_ALIGN(sg->length) / PAGE_SIZE;
+		struct page *page = sg_page(sg);
+
+		WARN_ON(i >= npages);
+		for (j = 0; j < npages_this_entry; j++)
+			*(tmp++) = page++;
+	}
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
+	for_each_sg(table->sgl, sg, table->nents, i)
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
+		 * has been killed by by SIGKILL
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
+	 * to initially flush cpu cache, since the the __GFP_ZERO on the
+	 * allocation means the zeroing was done by the cpu and thus it is likely
+	 * cached. Map & flush it out now so we don't get corruption later on.
+	 *
+	 * Ideally we could do this without using the heap device as a dummy dev.
+	 */
+	dma_map_sg_attrs(dma_heap_get_dev(heap), table->sgl, table->nents,
+			 DMA_BIDIRECTIONAL, DMA_ATTR_WRITE_COMBINE);
+	dma_sync_sg_for_device(dma_heap_get_dev(heap), table->sgl, table->nents,
+			       DMA_BIDIRECTIONAL);
+
+	return ret;
+
+free_pages:
+	for_each_sg(table->sgl, sg, table->nents, i)
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
+	static u64 dummy_mask;
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
+	dma_heap_get_dev(heap->heap)->dma_mask = &dummy_mask;
+	dma_set_mask(dma_heap_get_dev(heap->heap), DMA_BIT_MASK(64));
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
