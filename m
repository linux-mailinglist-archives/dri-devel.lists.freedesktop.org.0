Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D4FBE249579
	for <lists+dri-devel@lfdr.de>; Wed, 19 Aug 2020 08:57:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C56EC6E1A8;
	Wed, 19 Aug 2020 06:56:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8008789D77
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Aug 2020 07:51:50 +0000 (UTC)
Received: from epcas2p1.samsung.com (unknown [182.195.41.53])
 by mailout3.samsung.com (KnoxPortal) with ESMTP id
 20200818074555epoutp03aef8ad4f9f96f869dbdee7ba0bbad237~sTR0X_8W00307303073epoutp03A
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Aug 2020 07:45:55 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com
 20200818074555epoutp03aef8ad4f9f96f869dbdee7ba0bbad237~sTR0X_8W00307303073epoutp03A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1597736755;
 bh=Zxep55EI+fppSvUl8AKpPiN+7XzgmmMwtuEKgBYUiB0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=mUxAmzYyDZXN2OVAnK8fTCoKkWip8Z8iRYkD9O7mrmmoP5+z5Tdqfn++6UPySz9Pj
 RliTkdCeTmZ3bd6VXHSjuOtXToXhD9WwSTEcDg9nKdPq8ln6vYlbULEUdAPqF0Jd4P
 V6tUQT+pm4lN53XzIDYMA1jIYtbv9QBVgcKzk+ts=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
 epcas2p1.samsung.com (KnoxPortal) with ESMTP id
 20200818074554epcas2p1744ee5e7179005b3e00bb6e7d517dc66~sTRz3Wuvn1835918359epcas2p1D;
 Tue, 18 Aug 2020 07:45:54 +0000 (GMT)
Received: from epsmges2p1.samsung.com (unknown [182.195.40.181]) by
 epsnrtp4.localdomain (Postfix) with ESMTP id 4BW2yn2rp7zMqYkb; Tue, 18 Aug
 2020 07:45:53 +0000 (GMT)
Received: from epcas2p2.samsung.com ( [182.195.41.54]) by
 epsmges2p1.samsung.com (Symantec Messaging Gateway) with SMTP id
 27.CD.19322.1378B3F5; Tue, 18 Aug 2020 16:45:53 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
 epcas2p2.samsung.com (KnoxPortal) with ESMTPA id
 20200818074553epcas2p240c2129fb8186f53e03abb0a0725461c~sTRyXolaO2912929129epcas2p2J;
 Tue, 18 Aug 2020 07:45:53 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
 epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20200818074552epsmtrp2846013684148a5d9ba9ca9a6e668269c~sTRyWiEey3172931729epsmtrp2V;
 Tue, 18 Aug 2020 07:45:52 +0000 (GMT)
X-AuditID: b6c32a45-797ff70000004b7a-eb-5f3b87318684
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 A7.6D.08382.0378B3F5; Tue, 18 Aug 2020 16:45:52 +0900 (KST)
Received: from Dabang.dsn.sec.samsung.com (unknown [12.36.155.59]) by
 epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20200818074552epsmtip258a1346d0159ab3ee30e951ffa88b795~sTRyEiSmV2522325223epsmtip2d;
 Tue, 18 Aug 2020 07:45:52 +0000 (GMT)
From: Hyesoo Yu <hyesoo.yu@samsung.com>
To: sumit.semwal@linaro.org
Subject: [PATCH 2/3] dma-buf: heaps: add chunk heap to dmabuf heaps
Date: Tue, 18 Aug 2020 17:04:14 +0900
Message-Id: <20200818080415.7531-3-hyesoo.yu@samsung.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200818080415.7531-1-hyesoo.yu@samsung.com>
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA01Te0xTZxTfd297W3S4a0X8VuboypYNHNgWi1/RMo2M3bkRWIhbIsm6Du6A
 rK+0RWEki4gIIu9u6AAV9uBZwlYQ0FGZlY1aX7wkZKKMMpg6EQIDYQiu9GrGf79zzu93ft85
 Xw4X5xVy+NwkjZHWa5QqIbGG1XLJPyRQnLVDIVp4QqJJRxEHlTeaCXTY5iCQ09EN0MTwz2x0
 pvM6G/XPThJo6Vg3G9UezyDQowonjq4uBqLa9nkM/dM/gqG+8+UEyv3xLBvdMT9ho9LLAxiq
 mp3koOW8iwBlWjs5yHF7hoNMvRUEKkvPB7s2UZm9SwRlPm0GVF9+HkZVWJIpS90xgrJMF3Oo
 nIl+jBoaaCco+8lFFjV8vAujbi2P4tTkhZsEld9cB6irFZ0cqmuwFaNmLC9Hk/tVOxNpZTyt
 F9CaOG18kiZBLnwvRrFHIQ0RiQPFMrRdKNAo1bRcGP5+dGBEksq1C6HggFKV7EpFKw0G4daw
 nXptspEWJGoNRrmQ1sWrdGKxLsigVBuSNQlBcVp1qFgkkkhdzE9UiVW5YTqbPMX0Uz/rEMgL
 zgEeXEhug/W5c0QOWMPlkW0AzsyPcphgGsD7putsJpgD8ErrL+CZZKb+V4wpWAG8aE3HmeCR
 S9JQS6ywCPJ1aG+uciu8SB94oqbG3Qona1lwwDToLmwg98CJ9gx8BbPI12C23c5awZ6kDPZM
 lbAZO19YVHbbxedyPchQOFYvYyjr4eVv/nTTcRcl42yZ+xGQrPeAhSYLvsKHZDhsP/km02YD
 vN/VzGEwH848tBIMPgivHXGyGe0RAHtKbj4tBMPS8Sy3L076w8bzW5mWfrDz96e262D2pSUO
 k/aE2Ud5jNAPdlSdZjH4RehsyGIzFAqOlPgxm8oDcLrLyi4EgtJVw5SuGqb0f98KgNcBb1pn
 UCfQBolOvPp/LcB9GgFvtwHTxFSQDWBcYAOQiwu9PD+1b1fwPOOVqV/Qeq1Cn6yiDTYgdW26
 COdvjNO6bktjVIilkpAQkUyKpCESJNzkqX6l+2MemaA00p/TtI7WP9NhXA/+ISwqEvSEhWoL
 qgNfCr3bsDf6+YwzP9SNXHv3XLH4gxPvfPXHPtbS2EP/yRZnsXTb7I60jgHf4oLRUxdS09VN
 EW8dfnW66BTm0xhXXhm1gNdd8fNSB8sXb8QexdcdTEmS3B35cGJwWLNL0hTebP+3sumzPin+
 tczHNi+tHPy+fC5VkpZZIvJVVDs+Wu43U9/ZBW8Qt57z2owKrK29MuRxI3Fh7e5vhV1BW74s
 Hy94zNX+tU9dyb8XlQuF++36zd4pxoCNTv7jLS/EOmPHeL/xqwvP5YKhHIk5gWyLGa+Zmh83
 FKzPdPwdUxV5J0L+YO8slhSpCF0Ia/EfPzCU9qC+495avbeQZUhUigNwvUH5H5NjC5ujBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA02Ra0xSYRjHe885HI401gltvmqzRtOWW4Zl9VpptbY8NbNc37oZ1fFSogha
 SWWE2QXEVLqJldiK5WVdmJWl1QKaQMZMrdnSXHadaWpK6QxLZG19++/5/Z7n/+GhcMFzIpBK
 Tc9iZeniNCHJI+5ZhLPmi04uTxQVqSNRv6OYiy7dqiGRyuwgUbejGaC+rnoOKrc6OajN1U8i
 9+lmDqrU5JHol6EbR01j81FlwwiGhtveY6j14SUSFdy+y0Hvav5wkN7+GkNGVz8XjWufApT/
 yMpFjs4hLtK1GEhUdqwQrPJn8lvcJFNzpQYwrYVajDGYshlT1WmSMf0o4TLqvjaM6XjdQDK2
 i2ME06VpxJi34x9wpv/xK5IprK0CTJPBymUa2+9jzJApeBO9hbdiD5uWup+VLYjZyUsxFsRI
 zdEHdXfaCCXQLlIDHwrSkXCo+hmmBjxKQNcDWPyygvCCAKgfsmPe7Au7jls5XskFYLlDw/UA
 kp4LbbVG4Ml+dBC8cOPGpITTFgJabraTHuBLr4F9DXm4JxN0CDxls0028Oko+HLgPMfbMAsW
 l3VOHKIoH3oZ/FQd5RkLJpS6hjrMq0+H9tKPk6v4hJ53twwvArT+P6T/DxkAVgUCWKlckiyR
 R0gj0tkD4XKxRJ6dnhy+O0NiApP/DptXB+5XDYSbAUYBM4AULvTj77ItTRTw94hzFKwsI1GW
 ncbKzSCIIoT+/PbMih0COlmcxe5jWSkr+0cxyidQiTUlLc9ykjO3hk11SBzHS066SWGMujrn
 Q+QXFVv2bU1C0JjhnTLiqWLUh3tG9PV79kpXbsgjRzxv/5ty1x/ntMWquJbS+lSdZmeFtrVS
 81BZmRiqXyTNwfoWP1joTjqnTwiNFfHqZ3SonMrqsVErNjhSe/Z3HG2OXjc7cHWK0ZLrLF9n
 P1GYYVzvwm3JuXP8lRvzBzLj30cVDD+e8iaB/bn5VrDad8nS3ICuhMsdPbrg8OsdcV9CYjcQ
 n16datzuriih5/QeWhup0CqKUtngHlf3UXlvr+jzeZWzc29Sz5Fa9ALu1Rf4fbNP79nGb99x
 7yq/eVD3JDbTojgcOoW9JiTkKeKIMFwmF/8F/6eiT14DAAA=
X-CMS-MailID: 20200818074553epcas2p240c2129fb8186f53e03abb0a0725461c
X-Msg-Generator: CA
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20200818074553epcas2p240c2129fb8186f53e03abb0a0725461c
References: <20200818080415.7531-1-hyesoo.yu@samsung.com>
 <CGME20200818074553epcas2p240c2129fb8186f53e03abb0a0725461c@epcas2p2.samsung.com>
X-Mailman-Approved-At: Wed, 19 Aug 2020 06:56:51 +0000
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
Cc: dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 Hyesoo Yu <hyesoo.yu@samsung.com>, labbott@redhat.com,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, robh+dt@kernel.org, pullip.cho@samsung.com,
 surenb@google.com, iamjoonsoo.kim@lge.com, vbabka@suse.cz,
 linux-kernel@vger.kernel.org, lmark@codeaurora.org, afd@ti.com,
 minchan@kernel.org, joaodias@google.com, akpm@linux-foundation.org,
 christian.koenig@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch adds support for a chunk heap that allows for buffers
that are made up of a list of fixed size chunks taken from a CMA.
Chunk sizes are configuratd when the heaps are created.

Signed-off-by: Hyesoo Yu <hyesoo.yu@samsung.com>
---
 drivers/dma-buf/heaps/Kconfig      |   9 ++
 drivers/dma-buf/heaps/Makefile     |   1 +
 drivers/dma-buf/heaps/chunk_heap.c | 222 +++++++++++++++++++++++++++++++++++++
 3 files changed, 232 insertions(+)
 create mode 100644 drivers/dma-buf/heaps/chunk_heap.c

diff --git a/drivers/dma-buf/heaps/Kconfig b/drivers/dma-buf/heaps/Kconfig
index a5eef06..98552fa 100644
--- a/drivers/dma-buf/heaps/Kconfig
+++ b/drivers/dma-buf/heaps/Kconfig
@@ -12,3 +12,12 @@ config DMABUF_HEAPS_CMA
 	  Choose this option to enable dma-buf CMA heap. This heap is backed
 	  by the Contiguous Memory Allocator (CMA). If your system has these
 	  regions, you should say Y here.
+
+config DMABUF_HEAPS_CHUNK
+	tristate "DMA-BUF CHUNK Heap"
+	depends on DMABUF_HEAPS && DMA_CMA
+	help
+	  Choose this option to enable dma-buf CHUNK heap. This heap is backed
+	  by the Contiguous Memory Allocator (CMA) and allocate the buffers that
+	  are made up to a list of fixed size chunks tasken from CMA. Chunk sizes
+	  are configurated when the heaps are created.
diff --git a/drivers/dma-buf/heaps/Makefile b/drivers/dma-buf/heaps/Makefile
index 6e54cde..3b2a0986 100644
--- a/drivers/dma-buf/heaps/Makefile
+++ b/drivers/dma-buf/heaps/Makefile
@@ -2,3 +2,4 @@
 obj-y					+= heap-helpers.o
 obj-$(CONFIG_DMABUF_HEAPS_SYSTEM)	+= system_heap.o
 obj-$(CONFIG_DMABUF_HEAPS_CMA)		+= cma_heap.o
+obj-$(CONFIG_DMABUF_HEAPS_CHUNK)	+= chunk_heap.o
diff --git a/drivers/dma-buf/heaps/chunk_heap.c b/drivers/dma-buf/heaps/chunk_heap.c
new file mode 100644
index 0000000..1eefaec
--- /dev/null
+++ b/drivers/dma-buf/heaps/chunk_heap.c
@@ -0,0 +1,222 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * ION Memory Allocator chunk heap exporter
+ *
+ * Copyright (c) 2020 Samsung Electronics Co., Ltd.
+ * Author: <hyesoo.yu@samsung.com> for Samsung Electronics.
+ */
+
+#include <linux/platform_device.h>
+#include <linux/cma.h>
+#include <linux/device.h>
+#include <linux/dma-buf.h>
+#include <linux/dma-heap.h>
+#include <linux/dma-contiguous.h>
+#include <linux/err.h>
+#include <linux/errno.h>
+#include <linux/highmem.h>
+#include <linux/module.h>
+#include <linux/slab.h>
+#include <linux/scatterlist.h>
+#include <linux/sched/signal.h>
+#include <linux/of_reserved_mem.h>
+#include <linux/of.h>
+
+#include "heap-helpers.h"
+
+struct chunk_heap {
+	struct dma_heap *heap;
+	phys_addr_t base;
+	phys_addr_t size;
+	atomic_t cur_pageblock_idx;
+	unsigned int max_num_pageblocks;
+	unsigned int order;
+};
+
+static void chunk_heap_free(struct heap_helper_buffer *buffer)
+{
+	struct chunk_heap *chunk_heap = dma_heap_get_drvdata(buffer->heap);
+	pgoff_t pg;
+
+	for (pg = 0; pg < buffer->pagecount; pg++)
+		__free_pages(buffer->pages[pg], chunk_heap->order);
+	kvfree(buffer->pages);
+	kfree(buffer);
+}
+
+static inline unsigned long chunk_get_next_pfn(struct chunk_heap *chunk_heap)
+{
+	unsigned long i = atomic_inc_return(&chunk_heap->cur_pageblock_idx) %
+		chunk_heap->max_num_pageblocks;
+
+	return PHYS_PFN(chunk_heap->base) + i * pageblock_nr_pages;
+}
+
+static int chunk_alloc_pages(struct chunk_heap *chunk_heap, struct page **pages,
+			     unsigned int order, unsigned int count)
+{
+	unsigned long base;
+	unsigned int i = 0, nr_block = 0, nr_elem, ret;
+
+	while (count) {
+		/*
+		 * If the number of scanned page block is the same as max block,
+		 * the tries of allocation fails.
+		 */
+		if (nr_block++ == chunk_heap->max_num_pageblocks) {
+			ret = -ENOMEM;
+			goto err_bulk;
+		}
+		base = chunk_get_next_pfn(chunk_heap);
+		nr_elem = min_t(unsigned int, count, pageblock_nr_pages >> order);
+		ret = alloc_pages_bulk(base, base + pageblock_nr_pages, MIGRATE_CMA,
+				       GFP_KERNEL, order, nr_elem, pages + i);
+		if (ret < 0)
+			goto err_bulk;
+
+		i += ret;
+		count -= ret;
+	}
+
+	return 0;
+
+err_bulk:
+	while (i-- > 0)
+		__free_pages(pages[i], order);
+
+	return ret;
+}
+
+static int chunk_heap_allocate(struct dma_heap *heap, unsigned long len,
+			     unsigned long fd_flags, unsigned long heap_flags)
+{
+
+	struct chunk_heap *chunk_heap = dma_heap_get_drvdata(heap);
+	struct heap_helper_buffer *helper_buffer;
+	struct dma_buf *dmabuf;
+	unsigned int count = DIV_ROUND_UP(len, PAGE_SIZE << chunk_heap->order);
+	int ret = -ENOMEM;
+
+	helper_buffer = kzalloc(sizeof(*helper_buffer), GFP_KERNEL);
+	if (!helper_buffer)
+		return ret;
+
+	init_heap_helper_buffer(helper_buffer, chunk_heap_free);
+
+	helper_buffer->heap = heap;
+	helper_buffer->size = ALIGN(len, PAGE_SIZE << chunk_heap->order);
+	helper_buffer->pagecount = count;
+	helper_buffer->pages = kvmalloc_array(helper_buffer->pagecount,
+					      sizeof(*helper_buffer->pages), GFP_KERNEL);
+	if (!helper_buffer->pages)
+		goto err0;
+
+	ret = chunk_alloc_pages(chunk_heap, helper_buffer->pages,
+				chunk_heap->order, helper_buffer->pagecount);
+	if (ret < 0)
+		goto err1;
+
+	dmabuf = heap_helper_export_dmabuf(helper_buffer, fd_flags);
+	if (IS_ERR(dmabuf)) {
+		ret = PTR_ERR(dmabuf);
+		goto err2;
+	}
+
+	helper_buffer->dmabuf = dmabuf;
+
+	ret = dma_buf_fd(dmabuf, fd_flags);
+	if (ret < 0) {
+		dma_buf_put(dmabuf);
+		return ret;
+	}
+
+	return ret;
+
+err2:
+	while (count-- > 0)
+		__free_pages(helper_buffer->pages[count], chunk_heap->order);
+err1:
+	kvfree(helper_buffer->pages);
+err0:
+	kfree(helper_buffer);
+
+	return ret;
+}
+
+static void rmem_remove_callback(void *p)
+{
+	of_reserved_mem_device_release((struct device *)p);
+}
+
+static const struct dma_heap_ops chunk_heap_ops = {
+	.allocate = chunk_heap_allocate,
+};
+
+static int chunk_heap_probe(struct platform_device *pdev)
+{
+	struct chunk_heap *chunk_heap;
+	struct reserved_mem *rmem;
+	struct device_node *rmem_np;
+	struct dma_heap_export_info exp_info;
+	unsigned int alignment;
+	int ret;
+
+	ret = of_reserved_mem_device_init(&pdev->dev);
+	if (ret || !pdev->dev.cma_area) {
+		dev_err(&pdev->dev, "The CMA reserved area is not assigned (ret %d)", ret);
+		return -EINVAL;
+	}
+
+	ret = devm_add_action(&pdev->dev, rmem_remove_callback, &pdev->dev);
+	if (ret) {
+		of_reserved_mem_device_release(&pdev->dev);
+		return ret;
+	}
+
+	rmem_np = of_parse_phandle(pdev->dev.of_node, "memory-region", 0);
+	rmem = of_reserved_mem_lookup(rmem_np);
+
+	chunk_heap = devm_kzalloc(&pdev->dev, sizeof(*chunk_heap), GFP_KERNEL);
+	if (!chunk_heap)
+		return -ENOMEM;
+
+	chunk_heap->base = rmem->base;
+	chunk_heap->size = rmem->size;
+	chunk_heap->max_num_pageblocks = rmem->size >> (pageblock_order + PAGE_SHIFT);
+
+	of_property_read_u32(pdev->dev.of_node, "alignment", &alignment);
+	chunk_heap->order = get_order(alignment);
+
+	exp_info.name = rmem->name;
+	exp_info.ops = &chunk_heap_ops;
+	exp_info.priv = chunk_heap;
+
+	chunk_heap->heap = dma_heap_add(&exp_info);
+	if (IS_ERR(chunk_heap->heap))
+		return PTR_ERR(chunk_heap->heap);
+
+	return 0;
+}
+
+static const struct of_device_id chunk_heap_of_match[] = {
+	{ .compatible = "dma_heap,chunk", },
+	{ },
+};
+
+MODULE_DEVICE_TABLE(of, chunk_heap_of_match);
+
+static struct platform_driver chunk_heap_driver = {
+	.driver		= {
+		.name	= "chunk_heap",
+		.of_match_table = chunk_heap_of_match,
+	},
+	.probe		= chunk_heap_probe,
+};
+
+static int __init chunk_heap_init(void)
+{
+	return platform_driver_register(&chunk_heap_driver);
+}
+module_init(chunk_heap_init);
+MODULE_DESCRIPTION("DMA-BUF Chunk Heap");
+MODULE_LICENSE("GPL v2");
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
