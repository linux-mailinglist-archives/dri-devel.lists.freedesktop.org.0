Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GOi6EmfVpmnHWgAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 13:34:47 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A89F01EF849
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 13:34:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1327B10E7BD;
	Tue,  3 Mar 2026 12:34:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="FAcZ6kTK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6421210E7B8
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Mar 2026 12:34:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1772541282;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mjxxnI+eqW3NrszpVBs1Ajj0xf1dVGpAUt1pVC1eJHg=;
 b=FAcZ6kTKig/LSub9t41E3SbmJzByNW1YmkOgtlPeRKGR8SM8i/c9TxrNWnEBzVyuvBgvG2
 kTJwCCoTDRe1sZ+5BLAGpHBmD+4GA93hzDxOiZZpumfVKecM1/iMWVdvJ51gCM29UYIlrP
 OjyJyuhkvnczVdpbqM6uV+8OmA9Qzks=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-457-1jncD2fROhS_FLNijQCAog-1; Tue,
 03 Mar 2026 07:34:39 -0500
X-MC-Unique: 1jncD2fROhS_FLNijQCAog-1
X-Mimecast-MFC-AGG-ID: 1jncD2fROhS_FLNijQCAog_1772541277
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 2260A1956051; Tue,  3 Mar 2026 12:34:37 +0000 (UTC)
Received: from [192.168.1.153] (unknown [10.44.32.231])
 by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 0BAD930001B9; Tue,  3 Mar 2026 12:34:30 +0000 (UTC)
From: Albert Esteve <aesteve@redhat.com>
Date: Tue, 03 Mar 2026 13:33:47 +0100
Subject: [PATCH v2 4/6] dma-buf: heaps: Add Coherent heap to dmabuf heaps
MIME-Version: 1.0
Message-Id: <20260303-b4-dmabuf-heap-coherent-rmem-v2-4-65a4653b3378@redhat.com>
References: <20260303-b4-dmabuf-heap-coherent-rmem-v2-0-65a4653b3378@redhat.com>
In-Reply-To: <20260303-b4-dmabuf-heap-coherent-rmem-v2-0-65a4653b3378@redhat.com>
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
 Albert Esteve <aesteve@redhat.com>, echanude@redhat.com, mripard@redhat.com
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772541243; l=15787;
 i=aesteve@redhat.com; s=20260303; h=from:subject:message-id;
 bh=18y4x/nLAqgzJYKxeW2JDPFLaF5fjF4DUyDLeQZpv+4=;
 b=Ag+cUxlOfd+bLmQ01YcjKbckD1ff3JcNKZtnNG0aEMhEqPQOitYS91lYUT4uOS87eHg3u8w2b
 GMImy3dGNWUD+vbNL8Sy3kJaM5HwrbruSuJuiTNjXC5QAIRI7w6dbOs
X-Developer-Key: i=aesteve@redhat.com; a=ed25519;
 pk=YSFz6sOHd2L45+Fr8DIvHTi6lSIjhLZ5T+rkxspJt1s=
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-Mimecast-MFC-PROC-ID: 2OE3QmCaVWiFaReqQwtt8M87-Zv8dy92x0LZAAhjEJk_1772541277
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
X-Rspamd-Queue-Id: A89F01EF849
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:sumit.semwal@linaro.org,m:benjamin.gaignard@collabora.com,m:Brian.Starkey@arm.com,m:jstultz@google.com,m:tjmercier@google.com,m:christian.koenig@amd.com,m:m.szyprowski@samsung.com,m:robin.murphy@arm.com,m:robh@kernel.org,m:saravanak@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:linaro-mm-sig@lists.linaro.org,m:iommu@lists.linux.dev,m:devicetree@vger.kernel.org,m:aesteve@redhat.com,m:echanude@redhat.com,m:mripard@redhat.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	URIBL_MULTI_FAIL(0.00)[exp_info.name:server fail,gabe.freedesktop.org:server fail];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_SENDER(0.00)[aesteve@redhat.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	DKIM_TRACE(0.00)[redhat.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[aesteve@redhat.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,exp_info.name:url]
X-Rspamd-Action: no action

Add a dma-buf heap for DT coherent reserved-memory
(i.e., 'shared-dma-pool' without 'reusable' property),
exposing one heap per region for userspace buffers.

The heap binds the heap device to each memory region so
coherent allocations use the correct dev->dma_mem, and
it defers registration until module_init when normal
allocators are available.

Signed-off-by: Albert Esteve <aesteve@redhat.com>
---
 drivers/dma-buf/dma-heap.c            |   4 +-
 drivers/dma-buf/heaps/Kconfig         |   9 +
 drivers/dma-buf/heaps/Makefile        |   1 +
 drivers/dma-buf/heaps/coherent_heap.c | 426 ++++++++++++++++++++++++++++++++++
 include/linux/dma-heap.h              |  11 +
 include/linux/dma-map-ops.h           |   7 +
 6 files changed, 456 insertions(+), 2 deletions(-)

diff --git a/drivers/dma-buf/dma-heap.c b/drivers/dma-buf/dma-heap.c
index 88189d4e48561..ba87e5ac16ae2 100644
--- a/drivers/dma-buf/dma-heap.c
+++ b/drivers/dma-buf/dma-heap.c
@@ -390,8 +390,8 @@ struct dma_heap *dma_heap_add(const struct dma_heap_export_info *exp_info)
 
 	heap = dma_heap_create(exp_info);
 	if (IS_ERR(heap)) {
-		pr_err("dma_heap: failed to create heap (%d)\n", PTR_ERR(heap));
-		return PTR_ERR(heap);
+		pr_err("dma_heap: failed to create heap (%ld)\n", PTR_ERR(heap));
+		return ERR_CAST(heap);
 	}
 
 	ret = dma_heap_register(heap);
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
index 0000000000000..d033d737bb9df
--- /dev/null
+++ b/drivers/dma-buf/heaps/coherent_heap.c
@@ -0,0 +1,426 @@
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
+static int coherent_heap_init_dma_mask(struct device *dev)
+{
+	int ret;
+
+	ret = dma_coerce_mask_and_coherent(dev, DMA_BIT_MASK(64));
+	if (!ret)
+		return 0;
+
+	/* Fallback to 32-bit DMA mask */
+	return dma_coerce_mask_and_coherent(dev, DMA_BIT_MASK(32));
+}
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
+	ret = coherent_heap_init_dma_mask(heap_dev);
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
diff --git a/include/linux/dma-heap.h b/include/linux/dma-heap.h
index 1b0ea43ba66c3..77e6cb66ffce1 100644
--- a/include/linux/dma-heap.h
+++ b/include/linux/dma-heap.h
@@ -9,10 +9,12 @@
 #ifndef _DMA_HEAPS_H
 #define _DMA_HEAPS_H
 
+#include <linux/errno.h>
 #include <linux/types.h>
 
 struct dma_heap;
 struct device;
+struct reserved_mem;
 
 /**
  * struct dma_heap_ops - ops to operate on a given heap
@@ -53,4 +55,13 @@ struct dma_heap *dma_heap_add(const struct dma_heap_export_info *exp_info);
 
 extern bool mem_accounting;
 
+#if IS_ENABLED(CONFIG_DMABUF_HEAPS_COHERENT)
+int dma_heap_coherent_register(struct reserved_mem *rmem);
+#else
+static inline int dma_heap_coherent_register(struct reserved_mem *rmem)
+{
+	return -EOPNOTSUPP;
+}
+#endif
+
 #endif /* _DMA_HEAPS_H */
diff --git a/include/linux/dma-map-ops.h b/include/linux/dma-map-ops.h
index 60b63756df821..c87e5e44e5383 100644
--- a/include/linux/dma-map-ops.h
+++ b/include/linux/dma-map-ops.h
@@ -12,6 +12,7 @@
 
 struct cma;
 struct iommu_ops;
+struct reserved_mem;
 
 struct dma_map_ops {
 	void *(*alloc)(struct device *dev, size_t size,
@@ -161,6 +162,7 @@ int dma_alloc_from_dev_coherent(struct device *dev, ssize_t size,
 int dma_release_from_dev_coherent(struct device *dev, int order, void *vaddr);
 int dma_mmap_from_dev_coherent(struct device *dev, struct vm_area_struct *vma,
 		void *cpu_addr, size_t size, int *ret);
+struct reserved_mem *dma_coherent_get_reserved_region(unsigned int idx);
 #else
 static inline int dma_declare_coherent_memory(struct device *dev,
 		phys_addr_t phys_addr, dma_addr_t device_addr, size_t size)
@@ -172,6 +174,11 @@ static inline int dma_declare_coherent_memory(struct device *dev,
 #define dma_release_from_dev_coherent(dev, order, vaddr) (0)
 #define dma_mmap_from_dev_coherent(dev, vma, vaddr, order, ret) (0)
 static inline void dma_release_coherent_memory(struct device *dev) { }
+static inline
+struct reserved_mem *dma_coherent_get_reserved_region(unsigned int idx)
+{
+	return NULL;
+}
 #endif /* CONFIG_DMA_DECLARE_COHERENT */
 
 #ifdef CONFIG_DMA_GLOBAL_POOL

-- 
2.52.0

