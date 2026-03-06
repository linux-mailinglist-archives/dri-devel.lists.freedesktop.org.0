Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EIA7DH+uqmluVQEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 11:37:51 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D51021EEA5
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 11:37:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 619EB10ECD6;
	Fri,  6 Mar 2026 10:37:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="DNTNsCvH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64ED110ECD4
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Mar 2026 10:37:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1772793465;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3GaZ0Gxwr7V6iRLWanA72Vhzb8OR1VOC64yNTo9eMhE=;
 b=DNTNsCvHMUQKTYEQZxkZIh3VyiTKg8Tzu2GfQB+bR52o8Q8Xl7ukTzizDGkQkcE0zrvmue
 WWu8PcRFD6yGYNZaB+gffunNTiyz4Jq52yjWl4smLoHirN1J8owF2cjKVVrXjDEDjKQ7CB
 KF1evjhKVJ/5EhKR1sjE/Y9XACk6MLc=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-80-Odv7rigsP1-zrUB-y2fFCw-1; Fri,
 06 Mar 2026 05:37:41 -0500
X-MC-Unique: Odv7rigsP1-zrUB-y2fFCw-1
X-Mimecast-MFC-AGG-ID: Odv7rigsP1-zrUB-y2fFCw_1772793459
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 5D81D1956063; Fri,  6 Mar 2026 10:37:39 +0000 (UTC)
Received: from [192.168.1.153] (unknown [10.45.226.103])
 by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 30CD01800576; Fri,  6 Mar 2026 10:37:32 +0000 (UTC)
From: Albert Esteve <aesteve@redhat.com>
Date: Fri, 06 Mar 2026 11:36:36 +0100
Subject: [PATCH v3 5/6] dma-buf: heaps: Add Coherent heap to dmabuf heaps
MIME-Version: 1.0
Message-Id: <20260306-b4-dmabuf-heap-coherent-rmem-v3-5-3d00d36c9bc4@redhat.com>
References: <20260306-b4-dmabuf-heap-coherent-rmem-v3-0-3d00d36c9bc4@redhat.com>
In-Reply-To: <20260306-b4-dmabuf-heap-coherent-rmem-v3-0-3d00d36c9bc4@redhat.com>
To: Sumit Semwal <sumit.semwal@linaro.org>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>, 
 "T.J. Mercier" <tjmercier@google.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>, 
 Saravana Kannan <saravanak@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
 iommu@lists.linux.dev, devicetree@vger.kernel.org, 
 Albert Esteve <aesteve@redhat.com>, mripard@redhat.com, echanude@redhat.com
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772793417; l=12946;
 i=aesteve@redhat.com; s=20260303; h=from:subject:message-id;
 bh=kg7v50c/flgdrIKZTgprBZYfSYOYoRG93RIqsiK+UG4=;
 b=DCFgmPif9LMVPvQq3TQyWAwfQLGxptuqTbHlhHQ99DjIcwsBfb9nF/tNDxypZiH+iCg5otnZ7
 UY9S5DyFLMrCo7cwomveRiiUeoHZpp/ma1WjxMeFNYC66DELxg03654
X-Developer-Key: i=aesteve@redhat.com; a=ed25519;
 pk=YSFz6sOHd2L45+Fr8DIvHTi6lSIjhLZ5T+rkxspJt1s=
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
X-Mimecast-MFC-PROC-ID: 4Q-tgg554BLM_n1hQSVL1xObcE7_4EXI_LapJeaQlWc_1772793459
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
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
X-Rspamd-Queue-Id: 7D51021EEA5
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:sumit.semwal@linaro.org,m:benjamin.gaignard@collabora.com,m:Brian.Starkey@arm.com,m:jstultz@google.com,m:tjmercier@google.com,m:christian.koenig@amd.com,m:m.szyprowski@samsung.com,m:robin.murphy@arm.com,m:robh@kernel.org,m:saravanak@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:linaro-mm-sig@lists.linaro.org,m:iommu@lists.linux.dev,m:devicetree@vger.kernel.org,m:aesteve@redhat.com,m:mripard@redhat.com,m:echanude@redhat.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[aesteve@redhat.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[redhat.com:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[aesteve@redhat.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action

Expose DT coherent reserved-memory pools ("shared-dma-pool"
without "reusable") as dma-buf heaps, creating one heap per
region so userspace can allocate from the exact device-local
pool intended for coherent DMA.

This is a missing backend in the long-term effort to steer
userspace buffer allocations (DRM, v4l2, dma-buf heaps)
through heaps for clearer cgroup accounting. CMA and system
heaps already exist; non-reusable coherent reserved memory
did not.

The heap binds the heap device to each memory region so
coherent allocations use the correct dev->dma_mem, and
it defers registration until module_init when normal
allocators are available.

Signed-off-by: Albert Esteve <aesteve@redhat.com>
---
 drivers/dma-buf/heaps/Kconfig         |   9 +
 drivers/dma-buf/heaps/Makefile        |   1 +
 drivers/dma-buf/heaps/coherent_heap.c | 414 ++++++++++++++++++++++++++++++++++
 3 files changed, 424 insertions(+)

diff --git a/drivers/dma-buf/heaps/Kconfig b/drivers/dma-buf/heaps/Kconfig
index a5eef06c42264..aeb475e585048 100644
--- a/drivers/dma-buf/heaps/Kconfig
+++ b/drivers/dma-buf/heaps/Kconfig
@@ -12,3 +12,12 @@ config DMABUF_HEAPS_CMA
 	  Choose this option to enable dma-buf CMA heap. This heap is backed
 	  by the Contiguous Memory Allocator (CMA). If your system has these
 	  regions, you should say Y here.
+
+config DMABUF_HEAPS_COHERENT
+	bool "DMA-BUF Coherent Reserved-Memory Heap"
+	depends on DMABUF_HEAPS && OF_RESERVED_MEM && DMA_DECLARE_COHERENT
+	help
+	  Choose this option to enable coherent reserved-memory dma-buf heaps.
+	  This heap is backed by non-reusable DT "shared-dma-pool" regions.
+	  If your system defines coherent reserved-memory regions, you should
+	  say Y here.
diff --git a/drivers/dma-buf/heaps/Makefile b/drivers/dma-buf/heaps/Makefile
index 974467791032f..96bda7a65f041 100644
--- a/drivers/dma-buf/heaps/Makefile
+++ b/drivers/dma-buf/heaps/Makefile
@@ -1,3 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0
 obj-$(CONFIG_DMABUF_HEAPS_SYSTEM)	+= system_heap.o
 obj-$(CONFIG_DMABUF_HEAPS_CMA)		+= cma_heap.o
+obj-$(CONFIG_DMABUF_HEAPS_COHERENT)	+= coherent_heap.o
diff --git a/drivers/dma-buf/heaps/coherent_heap.c b/drivers/dma-buf/heaps/coherent_heap.c
new file mode 100644
index 0000000000000..55f53f87c4c15
--- /dev/null
+++ b/drivers/dma-buf/heaps/coherent_heap.c
@@ -0,0 +1,414 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * DMABUF heap for coherent reserved-memory regions
+ *
+ * Copyright (C) 2026 Red Hat, Inc.
+ * Author: Albert Esteve <aesteve@redhat.com>
+ *
+ */
+
+#include <linux/dma-buf.h>
+#include <linux/dma-heap.h>
+#include <linux/dma-map-ops.h>
+#include <linux/dma-mapping.h>
+#include <linux/err.h>
+#include <linux/highmem.h>
+#include <linux/iosys-map.h>
+#include <linux/of_reserved_mem.h>
+#include <linux/scatterlist.h>
+#include <linux/slab.h>
+#include <linux/vmalloc.h>
+
+struct coherent_heap {
+	struct dma_heap *heap;
+	struct reserved_mem *rmem;
+	char *name;
+};
+
+struct coherent_heap_buffer {
+	struct coherent_heap *heap;
+	struct list_head attachments;
+	struct mutex lock;
+	unsigned long len;
+	dma_addr_t dma_addr;
+	void *alloc_vaddr;
+	struct page **pages;
+	pgoff_t pagecount;
+	int vmap_cnt;
+	void *vaddr;
+};
+
+struct dma_heap_attachment {
+	struct device *dev;
+	struct sg_table table;
+	struct list_head list;
+	bool mapped;
+};
+
+static int coherent_heap_attach(struct dma_buf *dmabuf,
+				struct dma_buf_attachment *attachment)
+{
+	struct coherent_heap_buffer *buffer = dmabuf->priv;
+	struct dma_heap_attachment *a;
+	int ret;
+
+	a = kzalloc_obj(*a);
+	if (!a)
+		return -ENOMEM;
+
+	ret = sg_alloc_table_from_pages(&a->table, buffer->pages,
+					buffer->pagecount, 0,
+					buffer->pagecount << PAGE_SHIFT,
+					GFP_KERNEL);
+	if (ret) {
+		kfree(a);
+		return ret;
+	}
+
+	a->dev = attachment->dev;
+	INIT_LIST_HEAD(&a->list);
+	a->mapped = false;
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
+static void coherent_heap_detach(struct dma_buf *dmabuf,
+				 struct dma_buf_attachment *attachment)
+{
+	struct coherent_heap_buffer *buffer = dmabuf->priv;
+	struct dma_heap_attachment *a = attachment->priv;
+
+	mutex_lock(&buffer->lock);
+	list_del(&a->list);
+	mutex_unlock(&buffer->lock);
+
+	sg_free_table(&a->table);
+	kfree(a);
+}
+
+static struct sg_table *coherent_heap_map_dma_buf(struct dma_buf_attachment *attachment,
+						  enum dma_data_direction direction)
+{
+	struct dma_heap_attachment *a = attachment->priv;
+	struct sg_table *table = &a->table;
+	int ret;
+
+	ret = dma_map_sgtable(attachment->dev, table, direction, 0);
+	if (ret)
+		return ERR_PTR(-ENOMEM);
+	a->mapped = true;
+
+	return table;
+}
+
+static void coherent_heap_unmap_dma_buf(struct dma_buf_attachment *attachment,
+					struct sg_table *table,
+					enum dma_data_direction direction)
+{
+	struct dma_heap_attachment *a = attachment->priv;
+
+	a->mapped = false;
+	dma_unmap_sgtable(attachment->dev, table, direction, 0);
+}
+
+static int coherent_heap_dma_buf_begin_cpu_access(struct dma_buf *dmabuf,
+						  enum dma_data_direction direction)
+{
+	struct coherent_heap_buffer *buffer = dmabuf->priv;
+	struct dma_heap_attachment *a;
+
+	mutex_lock(&buffer->lock);
+	if (buffer->vmap_cnt)
+		invalidate_kernel_vmap_range(buffer->vaddr, buffer->len);
+
+	list_for_each_entry(a, &buffer->attachments, list) {
+		if (!a->mapped)
+			continue;
+		dma_sync_sgtable_for_cpu(a->dev, &a->table, direction);
+	}
+	mutex_unlock(&buffer->lock);
+
+	return 0;
+}
+
+static int coherent_heap_dma_buf_end_cpu_access(struct dma_buf *dmabuf,
+						enum dma_data_direction direction)
+{
+	struct coherent_heap_buffer *buffer = dmabuf->priv;
+	struct dma_heap_attachment *a;
+
+	mutex_lock(&buffer->lock);
+	if (buffer->vmap_cnt)
+		flush_kernel_vmap_range(buffer->vaddr, buffer->len);
+
+	list_for_each_entry(a, &buffer->attachments, list) {
+		if (!a->mapped)
+			continue;
+		dma_sync_sgtable_for_device(a->dev, &a->table, direction);
+	}
+	mutex_unlock(&buffer->lock);
+
+	return 0;
+}
+
+static int coherent_heap_mmap(struct dma_buf *dmabuf, struct vm_area_struct *vma)
+{
+	struct coherent_heap_buffer *buffer = dmabuf->priv;
+	struct coherent_heap *coh_heap = buffer->heap;
+	struct device *heap_dev = dma_heap_get_dev(coh_heap->heap);
+
+	return dma_mmap_coherent(heap_dev, vma, buffer->alloc_vaddr,
+				 buffer->dma_addr, buffer->len);
+}
+
+static void *coherent_heap_do_vmap(struct coherent_heap_buffer *buffer)
+{
+	void *vaddr;
+
+	vaddr = vmap(buffer->pages, buffer->pagecount, VM_MAP, PAGE_KERNEL);
+	if (!vaddr)
+		return ERR_PTR(-ENOMEM);
+
+	return vaddr;
+}
+
+static int coherent_heap_vmap(struct dma_buf *dmabuf, struct iosys_map *map)
+{
+	struct coherent_heap_buffer *buffer = dmabuf->priv;
+	void *vaddr;
+	int ret = 0;
+
+	mutex_lock(&buffer->lock);
+	if (buffer->vmap_cnt) {
+		buffer->vmap_cnt++;
+		iosys_map_set_vaddr(map, buffer->vaddr);
+		goto out;
+	}
+
+	vaddr = coherent_heap_do_vmap(buffer);
+	if (IS_ERR(vaddr)) {
+		ret = PTR_ERR(vaddr);
+		goto out;
+	}
+
+	buffer->vaddr = vaddr;
+	buffer->vmap_cnt++;
+	iosys_map_set_vaddr(map, buffer->vaddr);
+out:
+	mutex_unlock(&buffer->lock);
+
+	return ret;
+}
+
+static void coherent_heap_vunmap(struct dma_buf *dmabuf, struct iosys_map *map)
+{
+	struct coherent_heap_buffer *buffer = dmabuf->priv;
+
+	mutex_lock(&buffer->lock);
+	if (!--buffer->vmap_cnt) {
+		vunmap(buffer->vaddr);
+		buffer->vaddr = NULL;
+	}
+	mutex_unlock(&buffer->lock);
+	iosys_map_clear(map);
+}
+
+static void coherent_heap_dma_buf_release(struct dma_buf *dmabuf)
+{
+	struct coherent_heap_buffer *buffer = dmabuf->priv;
+	struct coherent_heap *coh_heap = buffer->heap;
+	struct device *heap_dev = dma_heap_get_dev(coh_heap->heap);
+
+	if (buffer->vmap_cnt > 0) {
+		WARN(1, "%s: buffer still mapped in the kernel\n", __func__);
+		vunmap(buffer->vaddr);
+		buffer->vaddr = NULL;
+		buffer->vmap_cnt = 0;
+	}
+
+	if (buffer->alloc_vaddr)
+		dma_free_coherent(heap_dev, buffer->len, buffer->alloc_vaddr,
+				  buffer->dma_addr);
+	kfree(buffer->pages);
+	kfree(buffer);
+}
+
+static const struct dma_buf_ops coherent_heap_buf_ops = {
+	.attach = coherent_heap_attach,
+	.detach = coherent_heap_detach,
+	.map_dma_buf = coherent_heap_map_dma_buf,
+	.unmap_dma_buf = coherent_heap_unmap_dma_buf,
+	.begin_cpu_access = coherent_heap_dma_buf_begin_cpu_access,
+	.end_cpu_access = coherent_heap_dma_buf_end_cpu_access,
+	.mmap = coherent_heap_mmap,
+	.vmap = coherent_heap_vmap,
+	.vunmap = coherent_heap_vunmap,
+	.release = coherent_heap_dma_buf_release,
+};
+
+static struct dma_buf *coherent_heap_allocate(struct dma_heap *heap,
+					      unsigned long len,
+					      u32 fd_flags,
+					      u64 heap_flags)
+{
+	struct coherent_heap *coh_heap;
+	struct coherent_heap_buffer *buffer;
+	struct device *heap_dev;
+	DEFINE_DMA_BUF_EXPORT_INFO(exp_info);
+	size_t size = PAGE_ALIGN(len);
+	pgoff_t pagecount = size >> PAGE_SHIFT;
+	struct dma_buf *dmabuf;
+	int ret = -ENOMEM;
+	pgoff_t pg;
+
+	coh_heap = dma_heap_get_drvdata(heap);
+	if (!coh_heap)
+		return ERR_PTR(-EINVAL);
+
+	heap_dev = dma_heap_get_dev(coh_heap->heap);
+	if (!heap_dev)
+		return ERR_PTR(-ENODEV);
+
+	buffer = kzalloc_obj(*buffer);
+	if (!buffer)
+		return ERR_PTR(-ENOMEM);
+
+	INIT_LIST_HEAD(&buffer->attachments);
+	mutex_init(&buffer->lock);
+	buffer->len = size;
+	buffer->heap = coh_heap;
+	buffer->pagecount = pagecount;
+
+	buffer->alloc_vaddr = dma_alloc_coherent(heap_dev, buffer->len,
+						 &buffer->dma_addr, GFP_KERNEL);
+	if (!buffer->alloc_vaddr) {
+		ret = -ENOMEM;
+		goto free_buffer;
+	}
+
+	buffer->pages = kmalloc_array(pagecount, sizeof(*buffer->pages),
+				      GFP_KERNEL);
+	if (!buffer->pages) {
+		ret = -ENOMEM;
+		goto free_dma;
+	}
+
+	for (pg = 0; pg < pagecount; pg++)
+		buffer->pages[pg] = virt_to_page((char *)buffer->alloc_vaddr +
+						 (pg * PAGE_SIZE));
+
+	/* create the dmabuf */
+	exp_info.exp_name = dma_heap_get_name(heap);
+	exp_info.ops = &coherent_heap_buf_ops;
+	exp_info.size = buffer->len;
+	exp_info.flags = fd_flags;
+	exp_info.priv = buffer;
+	dmabuf = dma_buf_export(&exp_info);
+	if (IS_ERR(dmabuf)) {
+		ret = PTR_ERR(dmabuf);
+		goto free_pages;
+	}
+	return dmabuf;
+
+free_pages:
+	kfree(buffer->pages);
+free_dma:
+	dma_free_coherent(heap_dev, buffer->len, buffer->alloc_vaddr,
+			  buffer->dma_addr);
+free_buffer:
+	kfree(buffer);
+	return ERR_PTR(ret);
+}
+
+static const struct dma_heap_ops coherent_heap_ops = {
+	.allocate = coherent_heap_allocate,
+};
+
+static int __coherent_heap_register(struct reserved_mem *rmem)
+{
+	struct dma_heap_export_info exp_info;
+	struct coherent_heap *coh_heap;
+	struct device *heap_dev;
+	int ret;
+
+	if (!rmem || !rmem->name)
+		return -EINVAL;
+
+	coh_heap = kzalloc_obj(*coh_heap);
+	if (!coh_heap)
+		return -ENOMEM;
+
+	coh_heap->rmem = rmem;
+	coh_heap->name = kstrdup(rmem->name, GFP_KERNEL);
+	if (!coh_heap->name) {
+		ret = -ENOMEM;
+		goto free_coherent_heap;
+	}
+
+	exp_info.name = coh_heap->name;
+	exp_info.ops = &coherent_heap_ops;
+	exp_info.priv = coh_heap;
+
+	coh_heap->heap = dma_heap_create(&exp_info);
+	if (IS_ERR(coh_heap->heap)) {
+		ret = PTR_ERR(coh_heap->heap);
+		goto free_name;
+	}
+
+	heap_dev = dma_heap_get_dev(coh_heap->heap);
+	ret = dma_coerce_mask_and_coherent(heap_dev, DMA_BIT_MASK(64));
+	if (ret) {
+		pr_err("coherent_heap: failed to set DMA mask (%d)\n", ret);
+		goto destroy_heap;
+	}
+
+	ret = of_reserved_mem_device_init_with_mem(heap_dev, rmem);
+	if (ret) {
+		pr_err("coherent_heap: failed to initialize memory (%d)\n", ret);
+		goto destroy_heap;
+	}
+
+	ret = dma_heap_register(coh_heap->heap);
+	if (ret) {
+		pr_err("coherent_heap: failed to register heap (%d)\n", ret);
+		goto destroy_heap;
+	}
+
+	return 0;
+
+destroy_heap:
+	dma_heap_destroy(coh_heap->heap);
+	coh_heap->heap = NULL;
+free_name:
+	kfree(coh_heap->name);
+free_coherent_heap:
+	kfree(coh_heap);
+
+	return ret;
+}
+
+static int __init coherent_heap_register(void)
+{
+	struct reserved_mem *rmem;
+	unsigned int i;
+	int ret;
+
+	for (i = 0; (rmem = dma_coherent_get_reserved_region(i)) != NULL; i++) {
+		ret = __coherent_heap_register(rmem);
+		if (ret) {
+			pr_warn("Failed to add coherent heap %s",
+				rmem->name ? rmem->name : "unknown");
+			continue;
+		}
+	}
+
+	return 0;
+}
+module_init(coherent_heap_register);
+MODULE_DESCRIPTION("DMA-BUF heap for coherent reserved-memory regions");

-- 
2.52.0

