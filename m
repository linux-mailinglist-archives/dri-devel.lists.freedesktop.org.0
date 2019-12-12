Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C9EE111D271
	for <lists+dri-devel@lfdr.de>; Thu, 12 Dec 2019 17:40:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2331789819;
	Thu, 12 Dec 2019 16:39:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1142 seconds by postgrey-1.36 at gabe;
 Thu, 12 Dec 2019 16:39:58 UTC
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A4DD89755
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Dec 2019 16:39:58 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id xBCGKWO6078658;
 Thu, 12 Dec 2019 10:20:32 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1576167632;
 bh=EKhrusKd8zolIN/dSgAeFtf+NFVJE7omodOrb2uPQao=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=PTPsLbZkU+LYWZth6gT92ENS9jsuDmdsQ2+BynzTlMp1996SW3hXaObEk9PqyBCBU
 rV+8bRDE9Ipj347tirJLk04/IqlF4yldZsiwcpGkTJGYNIY4PJvjD0ia1O/IiVdXpj
 f6bvlP35kZ2DwjhcPS7a884aIwCgJ+2+keHa24S8=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xBCGKW93024506
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 12 Dec 2019 10:20:32 -0600
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Thu, 12
 Dec 2019 10:20:32 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Thu, 12 Dec 2019 10:20:32 -0600
Received: from [10.250.79.55] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id xBCGKTM7057596;
 Thu, 12 Dec 2019 10:20:29 -0600
Subject: Re: [RESEND][PATCH v16 3/5] dma-buf: heaps: Add system heap to dmabuf
 heaps
To: John Stultz <john.stultz@linaro.org>, lkml <linux-kernel@vger.kernel.org>
References: <20191203172641.66642-1-john.stultz@linaro.org>
 <20191203172641.66642-4-john.stultz@linaro.org>
From: "Andrew F. Davis" <afd@ti.com>
Message-ID: <59d42752-e5b1-a1e0-0978-dff0824e2ebd@ti.com>
Date: Thu, 12 Dec 2019 11:20:28 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <20191203172641.66642-4-john.stultz@linaro.org>
Content-Language: en-US
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
Cc: Hillf Danton <hdanton@sina.com>, Sudipto Paul <Sudipto.Paul@arm.com>,
 Sandeep Patil <sspatil@google.com>,
 Vincent Donnefort <Vincent.Donnefort@arm.com>, Chenbo Feng <fengc@google.com>,
 Alistair Strachan <astrachan@google.com>, Liam Mark <lmark@codeaurora.org>,
 Christoph Hellwig <hch@infradead.org>, dri-devel@lists.freedesktop.org,
 Hridya Valsaraju <hridya@google.com>, Pratik Patel <pratikp@codeaurora.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 12/3/19 12:26 PM, John Stultz wrote:
> This patch adds system heap to the dma-buf heaps framework.
> 
> This allows applications to get a page-allocator backed dma-buf
> for non-contiguous memory.
> 
> This code is an evolution of the Android ION implementation, so
> thanks to its original authors and maintainters:
>   Rebecca Schultz Zavin, Colin Cross, Laura Abbott, and others!
> 
> Cc: Laura Abbott <labbott@redhat.com>
> Cc: Benjamin Gaignard <benjamin.gaignard@linaro.org>
> Cc: Sumit Semwal <sumit.semwal@linaro.org>
> Cc: Liam Mark <lmark@codeaurora.org>
> Cc: Pratik Patel <pratikp@codeaurora.org>
> Cc: Brian Starkey <Brian.Starkey@arm.com>
> Cc: Vincent Donnefort <Vincent.Donnefort@arm.com>
> Cc: Sudipto Paul <Sudipto.Paul@arm.com>
> Cc: Andrew F. Davis <afd@ti.com>
> Cc: Christoph Hellwig <hch@infradead.org>
> Cc: Chenbo Feng <fengc@google.com>
> Cc: Alistair Strachan <astrachan@google.com>
> Cc: Hridya Valsaraju <hridya@google.com>
> Cc: Sandeep Patil <sspatil@google.com>
> Cc: Hillf Danton <hdanton@sina.com>
> Cc: Dave Airlie <airlied@gmail.com>
> Cc: dri-devel@lists.freedesktop.org
> Reviewed-by: Benjamin Gaignard <benjamin.gaignard@linaro.org>
> Reviewed-by: Brian Starkey <brian.starkey@arm.com>
> Acked-by: Sandeep Patil <sspatil@android.com>
> Acked-by: Laura Abbott <labbott@redhat.com>
> Tested-by: Ayan Kumar Halder <ayan.halder@arm.com>
> Signed-off-by: John Stultz <john.stultz@linaro.org>
> ---
> v2:
> * Switch allocate to return dmabuf fd
> * Simplify init code
> * Checkpatch fixups
> * Droped dead system-contig code
> v3:
> * Whitespace fixups from Benjamin
> * Make sure we're zeroing the allocated pages (from Liam)
> * Use PAGE_ALIGN() consistently (suggested by Brian)
> * Fold in new registration style from Andrew
> * Avoid needless dynamic allocation of sys_heap (suggested by
>   Christoph)
> * Minor cleanups
> * Folded in changes from Andrew to use simplified page list
>   from the heap helpers
> v4:
> * Optimization to allocate pages in chunks, similar to old
>   pagepool code
> * Use fd_flags when creating dmabuf fd (Suggested by Benjamin)
> v5:
> * Back out large order page allocations (was leaking memory,
>   as the page array didn't properly track order size)
> v6:
> * Minor whitespace change suggested by Brian
> * Remove unused variable
> v7:
> * Use newly lower-cased init_heap_helper_buffer helper
> * Add system heap DOS avoidance suggested by Laura from ION code
> * Use new dmabuf export helper
> v8:
> * Make struct dma_heap_ops consts (suggested by Christoph)
> * Get rid of needless struct system_heap (suggested by Christoph)
> * Condense dma_heap_buffer and heap_helper_buffer (suggested by
>   Christoph)
> * Add forgotten include file to fix build issue on x86
> v12:
> * Minor tweaks to prep loading heap from module
> v14:
> * Fix "redundant assignment to variable ret" issue reported
>   by Colin King and fixed by Andrew Davis
> v15:
> * Drop unused heap flag from heap_helper_buffer as suggested
>   by Sandeep Patil
> ---
>  drivers/dma-buf/Kconfig             |   2 +
>  drivers/dma-buf/heaps/Kconfig       |   6 ++
>  drivers/dma-buf/heaps/Makefile      |   1 +
>  drivers/dma-buf/heaps/system_heap.c | 123 ++++++++++++++++++++++++++++
>  4 files changed, 132 insertions(+)
>  create mode 100644 drivers/dma-buf/heaps/Kconfig
>  create mode 100644 drivers/dma-buf/heaps/system_heap.c
> 
> diff --git a/drivers/dma-buf/Kconfig b/drivers/dma-buf/Kconfig
> index bffa58fc3e6e..0613bb7770f5 100644
> --- a/drivers/dma-buf/Kconfig
> +++ b/drivers/dma-buf/Kconfig
> @@ -53,4 +53,6 @@ menuconfig DMABUF_HEAPS
>  	  allows userspace to allocate dma-bufs that can be shared
>  	  between drivers.
>  
> +source "drivers/dma-buf/heaps/Kconfig"
> +
>  endmenu
> diff --git a/drivers/dma-buf/heaps/Kconfig b/drivers/dma-buf/heaps/Kconfig
> new file mode 100644
> index 000000000000..205052744169
> --- /dev/null
> +++ b/drivers/dma-buf/heaps/Kconfig
> @@ -0,0 +1,6 @@
> +config DMABUF_HEAPS_SYSTEM
> +	bool "DMA-BUF System Heap"
> +	depends on DMABUF_HEAPS
> +	help
> +	  Choose this option to enable the system dmabuf heap. The system heap
> +	  is backed by pages from the buddy allocator. If in doubt, say Y.
> diff --git a/drivers/dma-buf/heaps/Makefile b/drivers/dma-buf/heaps/Makefile
> index de49898112db..d1808eca2581 100644
> --- a/drivers/dma-buf/heaps/Makefile
> +++ b/drivers/dma-buf/heaps/Makefile
> @@ -1,2 +1,3 @@
>  # SPDX-License-Identifier: GPL-2.0
>  obj-y					+= heap-helpers.o
> +obj-$(CONFIG_DMABUF_HEAPS_SYSTEM)	+= system_heap.o
> diff --git a/drivers/dma-buf/heaps/system_heap.c b/drivers/dma-buf/heaps/system_heap.c
> new file mode 100644
> index 000000000000..1aa01e98c595
> --- /dev/null
> +++ b/drivers/dma-buf/heaps/system_heap.c
> @@ -0,0 +1,123 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * DMABUF System heap exporter
> + *
> + * Copyright (C) 2011 Google, Inc.
> + * Copyright (C) 2019 Linaro Ltd.
> + */
> +
> +#include <linux/dma-buf.h>
> +#include <linux/dma-mapping.h>
> +#include <linux/dma-heap.h>
> +#include <linux/err.h>
> +#include <linux/highmem.h>
> +#include <linux/mm.h>
> +#include <linux/module.h>
> +#include <linux/scatterlist.h>
> +#include <linux/slab.h>
> +#include <linux/sched/signal.h>
> +#include <asm/page.h>
> +
> +#include "heap-helpers.h"
> +
> +struct dma_heap *sys_heap;
> +
> +static void system_heap_free(struct heap_helper_buffer *buffer)
> +{
> +	pgoff_t pg;
> +
> +	for (pg = 0; pg < buffer->pagecount; pg++)
> +		__free_page(buffer->pages[pg]);
> +	kfree(buffer->pages);
> +	kfree(buffer);
> +}
> +
> +static int system_heap_allocate(struct dma_heap *heap,
> +				unsigned long len,
> +				unsigned long fd_flags,
> +				unsigned long heap_flags)
> +{
> +	struct heap_helper_buffer *helper_buffer;
> +	struct dma_buf *dmabuf;
> +	int ret = -ENOMEM;
> +	pgoff_t pg;
> +
> +	helper_buffer = kzalloc(sizeof(*helper_buffer), GFP_KERNEL);
> +	if (!helper_buffer)
> +		return -ENOMEM;
> +
> +	init_heap_helper_buffer(helper_buffer, system_heap_free);
> +	helper_buffer->heap = heap;
> +	helper_buffer->size = len;
> +
> +	helper_buffer->pagecount = len / PAGE_SIZE;
> +	helper_buffer->pages = kmalloc_array(helper_buffer->pagecount,
> +					     sizeof(*helper_buffer->pages),
> +					     GFP_KERNEL);
> +	if (!helper_buffer->pages) {
> +		ret = -ENOMEM;
> +		goto err0;
> +	}
> +
> +	for (pg = 0; pg < helper_buffer->pagecount; pg++) {
> +		/*
> +		 * Avoid trying to allocate memory if the process
> +		 * has been killed by by SIGKILL
> +		 */
> +		if (fatal_signal_pending(current))
> +			goto err1;
> +
> +		helper_buffer->pages[pg] = alloc_page(GFP_KERNEL | __GFP_ZERO);
> +		if (!helper_buffer->pages[pg])
> +			goto err1;
> +	}
> +
> +	/* create the dmabuf */
> +	dmabuf = heap_helper_export_dmabuf(helper_buffer, fd_flags);
> +	if (IS_ERR(dmabuf)) {
> +		ret = PTR_ERR(dmabuf);
> +		goto err1;
> +	}
> +
> +	helper_buffer->dmabuf = dmabuf;
> +
> +	ret = dma_buf_fd(dmabuf, fd_flags);
> +	if (ret < 0) {
> +		dma_buf_put(dmabuf);
> +		/* just return, as put will call release and that will free */
> +		return ret;
> +	}
> +
> +	return ret;
> +
> +err1:
> +	while (pg > 0)
> +		__free_page(helper_buffer->pages[--pg]);
> +	kfree(helper_buffer->pages);
> +err0:
> +	kfree(helper_buffer);
> +
> +	return ret;
> +}
> +
> +static const struct dma_heap_ops system_heap_ops = {
> +	.allocate = system_heap_allocate,
> +};
> +
> +static int system_heap_create(void)
> +{
> +	struct dma_heap_export_info exp_info;
> +	int ret = 0;
> +
> +	exp_info.name = "system_heap";


nit: Would prefer the name just be "system", the heap part is redundant
given it will be in a "heaps" directory, other heaps don't have that. As
the heap will be accessed by users using this name:
(/sys/dma_heap/system_heap) we need to think of it like an ABI and get
it right the first time. The directory name should probably also be
plural "heaps" as it is a collection of heaps..

Andrew


> +	exp_info.ops = &system_heap_ops;
> +	exp_info.priv = NULL;
> +
> +	sys_heap = dma_heap_add(&exp_info);
> +	if (IS_ERR(sys_heap))
> +		ret = PTR_ERR(sys_heap);
> +
> +	return ret;
> +}
> +module_init(system_heap_create);
> +MODULE_LICENSE("GPL v2");
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
