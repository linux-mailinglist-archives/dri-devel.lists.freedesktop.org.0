Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B67352482A1
	for <lists+dri-devel@lfdr.de>; Tue, 18 Aug 2020 12:11:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C05C189067;
	Tue, 18 Aug 2020 10:11:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B2D389067
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Aug 2020 10:11:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597745479;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=5+LNGe3P77nOid9aGh0wWrFIBhKNtuqgoxOKNAwq2vc=;
 b=FObPhrHSll7EPsuUlhARm091IMihQgchr3w56O4lg+BJ0XQ++KLXsl8eHcSN9vBJdKbVRp
 UHMr9SFkSaxPQ6+pmqitIlwEp4tbzTTob+fZuo9EIkG4utpr5HNgeYNgrRIIpekj0sb888
 eZYOw+eUp3iJJuJ317PbU+dJ6tLrQuc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-460-zT6RmIalO42FbkliyL6ECA-1; Tue, 18 Aug 2020 06:11:17 -0400
X-MC-Unique: zT6RmIalO42FbkliyL6ECA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1F6881DDEE;
 Tue, 18 Aug 2020 10:11:12 +0000 (UTC)
Received: from [10.36.113.168] (ovpn-113-168.ams2.redhat.com [10.36.113.168])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4098A5D9D2;
 Tue, 18 Aug 2020 10:11:04 +0000 (UTC)
Subject: Re: [PATCH 2/3] dma-buf: heaps: add chunk heap to dmabuf heaps
To: Hyesoo Yu <hyesoo.yu@samsung.com>, sumit.semwal@linaro.org
References: <20200818080415.7531-1-hyesoo.yu@samsung.com>
 <CGME20200818074553epcas2p240c2129fb8186f53e03abb0a0725461c@epcas2p2.samsung.com>
 <20200818080415.7531-3-hyesoo.yu@samsung.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; prefer-encrypt=mutual; keydata=
 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
 WNyWQQ==
Organization: Red Hat GmbH
Message-ID: <e6a50ebb-3299-77da-757a-3380e9d0ef87@redhat.com>
Date: Tue, 18 Aug 2020 12:11:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200818080415.7531-3-hyesoo.yu@samsung.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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
Cc: devicetree@vger.kernel.org, labbott@redhat.com, linux-media@vger.kernel.org,
 minchan@kernel.org, linux-kernel@vger.kernel.org, christian.koenig@amd.com,
 lmark@codeaurora.org, afd@ti.com, linaro-mm-sig@lists.linaro.org,
 linux-mm@kvack.org, robh+dt@kernel.org, dri-devel@lists.freedesktop.org,
 joaodias@google.com, akpm@linux-foundation.org, pullip.cho@samsung.com,
 surenb@google.com, iamjoonsoo.kim@lge.com, vbabka@suse.cz
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 18.08.20 10:04, Hyesoo Yu wrote:
> This patch adds support for a chunk heap that allows for buffers
> that are made up of a list of fixed size chunks taken from a CMA.
> Chunk sizes are configuratd when the heaps are created.
> 
> Signed-off-by: Hyesoo Yu <hyesoo.yu@samsung.com>
> ---
>  drivers/dma-buf/heaps/Kconfig      |   9 ++
>  drivers/dma-buf/heaps/Makefile     |   1 +
>  drivers/dma-buf/heaps/chunk_heap.c | 222 +++++++++++++++++++++++++++++++++++++
>  3 files changed, 232 insertions(+)
>  create mode 100644 drivers/dma-buf/heaps/chunk_heap.c
> 
> diff --git a/drivers/dma-buf/heaps/Kconfig b/drivers/dma-buf/heaps/Kconfig
> index a5eef06..98552fa 100644
> --- a/drivers/dma-buf/heaps/Kconfig
> +++ b/drivers/dma-buf/heaps/Kconfig
> @@ -12,3 +12,12 @@ config DMABUF_HEAPS_CMA
>  	  Choose this option to enable dma-buf CMA heap. This heap is backed
>  	  by the Contiguous Memory Allocator (CMA). If your system has these
>  	  regions, you should say Y here.
> +
> +config DMABUF_HEAPS_CHUNK
> +	tristate "DMA-BUF CHUNK Heap"
> +	depends on DMABUF_HEAPS && DMA_CMA
> +	help
> +	  Choose this option to enable dma-buf CHUNK heap. This heap is backed
> +	  by the Contiguous Memory Allocator (CMA) and allocate the buffers that
> +	  are made up to a list of fixed size chunks tasken from CMA. Chunk sizes
> +	  are configurated when the heaps are created.
> diff --git a/drivers/dma-buf/heaps/Makefile b/drivers/dma-buf/heaps/Makefile
> index 6e54cde..3b2a0986 100644
> --- a/drivers/dma-buf/heaps/Makefile
> +++ b/drivers/dma-buf/heaps/Makefile
> @@ -2,3 +2,4 @@
>  obj-y					+= heap-helpers.o
>  obj-$(CONFIG_DMABUF_HEAPS_SYSTEM)	+= system_heap.o
>  obj-$(CONFIG_DMABUF_HEAPS_CMA)		+= cma_heap.o
> +obj-$(CONFIG_DMABUF_HEAPS_CHUNK)	+= chunk_heap.o
> diff --git a/drivers/dma-buf/heaps/chunk_heap.c b/drivers/dma-buf/heaps/chunk_heap.c
> new file mode 100644
> index 0000000..1eefaec
> --- /dev/null
> +++ b/drivers/dma-buf/heaps/chunk_heap.c
> @@ -0,0 +1,222 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * ION Memory Allocator chunk heap exporter
> + *
> + * Copyright (c) 2020 Samsung Electronics Co., Ltd.
> + * Author: <hyesoo.yu@samsung.com> for Samsung Electronics.
> + */
> +
> +#include <linux/platform_device.h>
> +#include <linux/cma.h>
> +#include <linux/device.h>
> +#include <linux/dma-buf.h>
> +#include <linux/dma-heap.h>
> +#include <linux/dma-contiguous.h>
> +#include <linux/err.h>
> +#include <linux/errno.h>
> +#include <linux/highmem.h>
> +#include <linux/module.h>
> +#include <linux/slab.h>
> +#include <linux/scatterlist.h>
> +#include <linux/sched/signal.h>
> +#include <linux/of_reserved_mem.h>
> +#include <linux/of.h>
> +
> +#include "heap-helpers.h"
> +
> +struct chunk_heap {
> +	struct dma_heap *heap;
> +	phys_addr_t base;
> +	phys_addr_t size;
> +	atomic_t cur_pageblock_idx;
> +	unsigned int max_num_pageblocks;
> +	unsigned int order;
> +};
> +
> +static void chunk_heap_free(struct heap_helper_buffer *buffer)
> +{
> +	struct chunk_heap *chunk_heap = dma_heap_get_drvdata(buffer->heap);
> +	pgoff_t pg;
> +
> +	for (pg = 0; pg < buffer->pagecount; pg++)
> +		__free_pages(buffer->pages[pg], chunk_heap->order);
> +	kvfree(buffer->pages);
> +	kfree(buffer);
> +}
> +
> +static inline unsigned long chunk_get_next_pfn(struct chunk_heap *chunk_heap)
> +{
> +	unsigned long i = atomic_inc_return(&chunk_heap->cur_pageblock_idx) %
> +		chunk_heap->max_num_pageblocks;
> +
> +	return PHYS_PFN(chunk_heap->base) + i * pageblock_nr_pages;
> +}
> +
> +static int chunk_alloc_pages(struct chunk_heap *chunk_heap, struct page **pages,
> +			     unsigned int order, unsigned int count)
> +{
> +	unsigned long base;
> +	unsigned int i = 0, nr_block = 0, nr_elem, ret;
> +
> +	while (count) {
> +		/*
> +		 * If the number of scanned page block is the same as max block,
> +		 * the tries of allocation fails.
> +		 */
> +		if (nr_block++ == chunk_heap->max_num_pageblocks) {
> +			ret = -ENOMEM;
> +			goto err_bulk;
> +		}
> +		base = chunk_get_next_pfn(chunk_heap);
> +		nr_elem = min_t(unsigned int, count, pageblock_nr_pages >> order);
> +		ret = alloc_pages_bulk(base, base + pageblock_nr_pages, MIGRATE_CMA,
> +				       GFP_KERNEL, order, nr_elem, pages + i);

So you are bypassing the complete cma allocator here. This all smells
like a complete hack to me. No, I don't think this is the right way to
support (or rather speed up allocations for) special, weird hardware.

-- 
Thanks,

David / dhildenb

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
