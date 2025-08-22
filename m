Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 54170B3115E
	for <lists+dri-devel@lfdr.de>; Fri, 22 Aug 2025 10:15:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3ACF810EA90;
	Fri, 22 Aug 2025 08:15:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.b="XKfzn3o3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AA8710EA8B
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Aug 2025 08:15:09 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20250822081507euoutp011eb6e04748c75467354f864a5b13dcb2~eCLvKXWHt0802008020euoutp01T;
 Fri, 22 Aug 2025 08:15:07 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20250822081507euoutp011eb6e04748c75467354f864a5b13dcb2~eCLvKXWHt0802008020euoutp01T
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1755850507;
 bh=8D7LpAOoviBYk7WIQ6GdtJERZ5Q8as878mTjAUnE/1s=;
 h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
 b=XKfzn3o3WVKTQX9bE3/cpVfy9yW+H778T92W7lBVbU6kRm4mXQcKAfiloG9SVAIl1
 DBMfdB7LnCnsIfysL99KcFBB0FogAV6kQBHI3K43plBR35f6vTvEXBvPziUq5zs0kR
 Az18+L1Qjna/KGD88qj7IvZXFIdKHX7QWAyUJp50=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20250822081507eucas1p2f6977174baf330e1c895de7ac7b91cc1~eCLu2KEdp1444414444eucas1p2a;
 Fri, 22 Aug 2025 08:15:07 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20250822081502eusmtip2e6ed6d47d5194e587353269471a8bda2~eCLqth-G50411104111eusmtip2L;
 Fri, 22 Aug 2025 08:15:02 +0000 (GMT)
Message-ID: <debc61e1-683c-4fcc-9040-d55324f096f7@samsung.com>
Date: Fri, 22 Aug 2025 10:15:01 +0200
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH RFC 22/35] dma-remap: drop nth_page() in
 dma_common_contiguous_remap()
To: David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org
Cc: Robin Murphy <robin.murphy@arm.com>, Alexander Potapenko
 <glider@google.com>, Andrew Morton <akpm@linux-foundation.org>, Brendan
 Jackman <jackmanb@google.com>, Christoph Lameter <cl@gentwo.org>, Dennis
 Zhou <dennis@kernel.org>, Dmitry Vyukov <dvyukov@google.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 iommu@lists.linux.dev, io-uring@vger.kernel.org, Jason Gunthorpe
 <jgg@nvidia.com>, Jens Axboe <axboe@kernel.dk>, Johannes Weiner
 <hannes@cmpxchg.org>, John Hubbard <jhubbard@nvidia.com>,
 kasan-dev@googlegroups.com, kvm@vger.kernel.org, "Liam R. Howlett"
 <Liam.Howlett@oracle.com>, Linus Torvalds <torvalds@linux-foundation.org>,
 linux-arm-kernel@axis.com, linux-arm-kernel@lists.infradead.org,
 linux-crypto@vger.kernel.org, linux-ide@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-mm@kvack.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-scsi@vger.kernel.org, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Marco Elver <elver@google.com>, Michal Hocko <mhocko@suse.com>, Mike
 Rapoport <rppt@kernel.org>, Muchun Song <muchun.song@linux.dev>,
 netdev@vger.kernel.org, Oscar Salvador <osalvador@suse.de>, Peter Xu
 <peterx@redhat.com>, Suren Baghdasaryan <surenb@google.com>, Tejun Heo
 <tj@kernel.org>, virtualization@lists.linux.dev, Vlastimil Babka
 <vbabka@suse.cz>, wireguard@lists.zx2c4.com, x86@kernel.org, Zi Yan
 <ziy@nvidia.com>
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <20250821200701.1329277-23-david@redhat.com>
Content-Transfer-Encoding: 7bit
X-CMS-MailID: 20250822081507eucas1p2f6977174baf330e1c895de7ac7b91cc1
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20250821200816eucas1p1924e60579da49c1dfed300c945894d83
X-EPHeader: CA
X-CMS-RootMailID: 20250821200816eucas1p1924e60579da49c1dfed300c945894d83
References: <20250821200701.1329277-1-david@redhat.com>
 <CGME20250821200816eucas1p1924e60579da49c1dfed300c945894d83@eucas1p1.samsung.com>
 <20250821200701.1329277-23-david@redhat.com>
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

On 21.08.2025 22:06, David Hildenbrand wrote:
> dma_common_contiguous_remap() is used to remap an "allocated contiguous
> region". Within a single allocation, there is no need to use nth_page()
> anymore.
>
> Neither the buddy, nor hugetlb, nor CMA will hand out problematic page
> ranges.
>
> Cc: Marek Szyprowski <m.szyprowski@samsung.com>
> Cc: Robin Murphy <robin.murphy@arm.com>
> Signed-off-by: David Hildenbrand <david@redhat.com>
Acked-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>   kernel/dma/remap.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/kernel/dma/remap.c b/kernel/dma/remap.c
> index 9e2afad1c6152..b7c1c0c92d0c8 100644
> --- a/kernel/dma/remap.c
> +++ b/kernel/dma/remap.c
> @@ -49,7 +49,7 @@ void *dma_common_contiguous_remap(struct page *page, size_t size,
>   	if (!pages)
>   		return NULL;
>   	for (i = 0; i < count; i++)
> -		pages[i] = nth_page(page, i);
> +		pages[i] = page++;
>   	vaddr = vmap(pages, count, VM_DMA_COHERENT, prot);
>   	kvfree(pages);
>   

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

