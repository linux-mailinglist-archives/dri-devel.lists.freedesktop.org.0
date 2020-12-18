Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D7F4A2DE419
	for <lists+dri-devel@lfdr.de>; Fri, 18 Dec 2020 15:36:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91527897F9;
	Fri, 18 Dec 2020 14:36:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A82B897F9
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Dec 2020 14:36:21 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id g185so2794861wmf.3
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Dec 2020 06:36:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to; bh=YWmqcLqIz38MWpPJhReutWXbyy1oVWYK/A38RJq0qsI=;
 b=lZhtw4YVxqpHai4JdTeB2XrEhV07UVXh4y06cpjxeZXmu0zybW6wx/zJTsTei8FO8Y
 yqNOOxnpygr6dwpi2uMVNgYRv/lcmczfh2IpIqToLi2GT9xxuycSKDH2UplkwMTMfYn1
 WI4iNR58MRcmQv8P3hEOIAOF9kDiKSQ62FLPY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to;
 bh=YWmqcLqIz38MWpPJhReutWXbyy1oVWYK/A38RJq0qsI=;
 b=DY8koWsSw55yaU/rieZdnTxgpvz0EdSGXnm2aWPiktIST0hCEra/X/Tdjb5/w/wKCi
 ZNX4MLESJJe1f2u6h7JLh4K7ZyRETE1Ute1ikEgGWNNc425UGFevqqdJvP/IbhITRNAU
 JASjaNGsv1xKO1rYTRoNg8H6/nXro/H5D+kOPHbOwSz7uVLpD956693AW6OxozPgp81V
 FeevPIuTBuP9QPT0mAx2GevcE5pkEWDeGr/OpgefffYxzq2crG7WEzp5Wmn+Vk4oIZor
 NuAgEIijik2X4b5k1Lh2mvwBw0HiQSf6WokKhQU1JHtW8oQ+AzIGONnvwcKFeqnCsLjR
 1Xiw==
X-Gm-Message-State: AOAM532sdgxP8lVgz/VPEzoC5Yq930xhwupYNVmhVISnVZYvwBYZ6zlx
 MgUxBjdJGr4WW1Q9h/vsvKk1vQ==
X-Google-Smtp-Source: ABdhPJyqSRESDqSGQsY84t7M09sfQ8lcUyY2DVr2zPqGMIH/QznauwStZ8c9xSk3OEOK/jBzpLA9Jw==
X-Received: by 2002:a1c:7d94:: with SMTP id y142mr4537787wmc.105.1608302180213; 
 Fri, 18 Dec 2020 06:36:20 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id t1sm14644464wro.27.2020.12.18.06.36.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Dec 2020 06:36:19 -0800 (PST)
Date: Fri, 18 Dec 2020 15:36:17 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: John Stultz <john.stultz@linaro.org>
Subject: Re: [RFC][PATCH 2/3] dma-buf: system_heap: Add pagepool support to
 system heap
Message-ID: <X9y+YZujWBTHMuH3@phenom.ffwll.local>
Mail-Followup-To: John Stultz <john.stultz@linaro.org>,
 lkml <linux-kernel@vger.kernel.org>,
 Sandeep Patil <sspatil@google.com>, dri-devel@lists.freedesktop.org,
 Ezequiel Garcia <ezequiel@collabora.com>,
 Robin Murphy <robin.murphy@arm.com>,
 James Jones <jajones@nvidia.com>, Liam Mark <lmark@codeaurora.org>,
 Laura Abbott <labbott@kernel.org>,
 Chris Goldsworthy <cgoldswo@codeaurora.org>,
 Hridya Valsaraju <hridya@google.com>,
 =?iso-8859-1?Q?=D8rjan?= Eide <orjan.eide@arm.com>,
 linux-media@vger.kernel.org, Suren Baghdasaryan <surenb@google.com>,
 Daniel Mentz <danielmentz@google.com>
References: <20201217230612.32397-1-john.stultz@linaro.org>
 <20201217230612.32397-2-john.stultz@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201217230612.32397-2-john.stultz@linaro.org>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
Cc: Sandeep Patil <sspatil@google.com>, Robin Murphy <robin.murphy@arm.com>,
 James Jones <jajones@nvidia.com>, Daniel Mentz <danielmentz@google.com>,
 lkml <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 Suren Baghdasaryan <surenb@google.com>, Liam Mark <lmark@codeaurora.org>,
 Chris Goldsworthy <cgoldswo@codeaurora.org>,
 Hridya Valsaraju <hridya@google.com>,
 =?iso-8859-1?Q?=D8rjan?= Eide <orjan.eide@arm.com>,
 linux-media@vger.kernel.org, Ezequiel Garcia <ezequiel@collabora.com>,
 Laura Abbott <labbott@kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Dec 17, 2020 at 11:06:11PM +0000, John Stultz wrote:
> Reuse/abuse the pagepool code from the network code to speed
> up allocation performance.
> =

> This is similar to the ION pagepool usage, but tries to
> utilize generic code instead of a custom implementation.
> =

> Cc: Sumit Semwal <sumit.semwal@linaro.org>
> Cc: Liam Mark <lmark@codeaurora.org>
> Cc: Chris Goldsworthy <cgoldswo@codeaurora.org>
> Cc: Laura Abbott <labbott@kernel.org>
> Cc: Brian Starkey <Brian.Starkey@arm.com>
> Cc: Hridya Valsaraju <hridya@google.com>
> Cc: Suren Baghdasaryan <surenb@google.com>
> Cc: Sandeep Patil <sspatil@google.com>
> Cc: Daniel Mentz <danielmentz@google.com>
> Cc: =D8rjan Eide <orjan.eide@arm.com>
> Cc: Robin Murphy <robin.murphy@arm.com>
> Cc: Ezequiel Garcia <ezequiel@collabora.com>
> Cc: Simon Ser <contact@emersion.fr>
> Cc: James Jones <jajones@nvidia.com>
> Cc: linux-media@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Signed-off-by: John Stultz <john.stultz@linaro.org>

We also have one of these in ttm. I think we should have at most one of
these for the gpu ecosystem overall, maybe as a helper that can be plugged
into all the places.

Or I'm kinda missing something, which could be since I only glanced at
yours for a bit. But it's also called page pool for buffer allocations,
and I don't think there's that many ways to implement that really :-)
-Daniel

> ---
>  drivers/dma-buf/heaps/Kconfig       |  1 +
>  drivers/dma-buf/heaps/system_heap.c | 68 +++++++++++++++++++++++++++--
>  2 files changed, 65 insertions(+), 4 deletions(-)
> =

> diff --git a/drivers/dma-buf/heaps/Kconfig b/drivers/dma-buf/heaps/Kconfig
> index ecf65204f714..fa5e1c330cce 100644
> --- a/drivers/dma-buf/heaps/Kconfig
> +++ b/drivers/dma-buf/heaps/Kconfig
> @@ -4,6 +4,7 @@ config DMABUF_HEAPS_DEFERRED_FREE
>  config DMABUF_HEAPS_SYSTEM
>  	bool "DMA-BUF System Heap"
>  	depends on DMABUF_HEAPS
> +	select PAGE_POOL
>  	help
>  	  Choose this option to enable the system dmabuf heap. The system heap
>  	  is backed by pages from the buddy allocator. If in doubt, say Y.
> diff --git a/drivers/dma-buf/heaps/system_heap.c b/drivers/dma-buf/heaps/=
system_heap.c
> index 17e0e9a68baf..885e30894b77 100644
> --- a/drivers/dma-buf/heaps/system_heap.c
> +++ b/drivers/dma-buf/heaps/system_heap.c
> @@ -20,6 +20,7 @@
>  #include <linux/scatterlist.h>
>  #include <linux/slab.h>
>  #include <linux/vmalloc.h>
> +#include <net/page_pool.h>
>  =

>  static struct dma_heap *sys_heap;
>  =

> @@ -53,6 +54,7 @@ static gfp_t order_flags[] =3D {HIGH_ORDER_GFP, LOW_ORD=
ER_GFP, LOW_ORDER_GFP};
>   */
>  static const unsigned int orders[] =3D {8, 4, 0};
>  #define NUM_ORDERS ARRAY_SIZE(orders)
> +struct page_pool *pools[NUM_ORDERS];
>  =

>  static struct sg_table *dup_sg_table(struct sg_table *table)
>  {
> @@ -281,18 +283,59 @@ static void system_heap_vunmap(struct dma_buf *dmab=
uf, struct dma_buf_map *map)
>  	dma_buf_map_clear(map);
>  }
>  =

> +static int system_heap_clear_pages(struct page **pages, int num, pgprot_=
t pgprot)
> +{
> +	void *addr =3D vmap(pages, num, VM_MAP, pgprot);
> +
> +	if (!addr)
> +		return -ENOMEM;
> +	memset(addr, 0, PAGE_SIZE * num);
> +	vunmap(addr);
> +	return 0;
> +}
> +
> +static int system_heap_zero_buffer(struct system_heap_buffer *buffer)
> +{
> +	struct sg_table *sgt =3D &buffer->sg_table;
> +	struct sg_page_iter piter;
> +	struct page *pages[32];
> +	int p =3D 0;
> +	int ret =3D 0;
> +
> +	for_each_sgtable_page(sgt, &piter, 0) {
> +		pages[p++] =3D sg_page_iter_page(&piter);
> +		if (p =3D=3D ARRAY_SIZE(pages)) {
> +			ret =3D system_heap_clear_pages(pages, p, PAGE_KERNEL);
> +			if (ret)
> +				return ret;
> +			p =3D 0;
> +		}
> +	}
> +	if (p)
> +		ret =3D system_heap_clear_pages(pages, p, PAGE_KERNEL);
> +
> +	return ret;
> +}
> +
>  static void system_heap_dma_buf_release(struct dma_buf *dmabuf)
>  {
>  	struct system_heap_buffer *buffer =3D dmabuf->priv;
>  	struct sg_table *table;
>  	struct scatterlist *sg;
> -	int i;
> +	int i, j;
> +
> +	/* Zero the buffer pages before adding back to the pool */
> +	system_heap_zero_buffer(buffer);
>  =

>  	table =3D &buffer->sg_table;
>  	for_each_sg(table->sgl, sg, table->nents, i) {
>  		struct page *page =3D sg_page(sg);
>  =

> -		__free_pages(page, compound_order(page));
> +		for (j =3D 0; j < NUM_ORDERS; j++) {
> +			if (compound_order(page) =3D=3D orders[j])
> +				break;
> +		}
> +		page_pool_put_full_page(pools[j], page, false);
>  	}
>  	sg_free_table(table);
>  	kfree(buffer);
> @@ -322,8 +365,7 @@ static struct page *alloc_largest_available(unsigned =
long size,
>  			continue;
>  		if (max_order < orders[i])
>  			continue;
> -
> -		page =3D alloc_pages(order_flags[i], orders[i]);
> +		page =3D page_pool_alloc_pages(pools[i], order_flags[i]);
>  		if (!page)
>  			continue;
>  		return page;
> @@ -428,6 +470,24 @@ static const struct dma_heap_ops system_heap_ops =3D=
 {
>  static int system_heap_create(void)
>  {
>  	struct dma_heap_export_info exp_info;
> +	int i;
> +
> +	for (i =3D 0; i < NUM_ORDERS; i++) {
> +		struct page_pool_params pp;
> +
> +		memset(&pp, 0, sizeof(pp));
> +		pp.order =3D orders[i];
> +		pools[i] =3D page_pool_create(&pp);
> +
> +		if (IS_ERR(pools[i])) {
> +			int j;
> +
> +			pr_err("%s: page pool creation failed!\n", __func__);
> +			for (j =3D 0; j < i; j++)
> +				page_pool_destroy(pools[j]);
> +			return PTR_ERR(pools[i]);
> +		}
> +	}
>  =

>  	exp_info.name =3D "system";
>  	exp_info.ops =3D &system_heap_ops;
> -- =

> 2.17.1
> =

> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
