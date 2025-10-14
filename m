Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AB11BD8041
	for <lists+dri-devel@lfdr.de>; Tue, 14 Oct 2025 09:54:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92E6E10E033;
	Tue, 14 Oct 2025 07:54:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.b="rFDo5Ulp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48E5C10E033
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Oct 2025 07:54:42 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20251014075440euoutp012291d67729a2d807bf322eeb3e4d0048~uTGArgE5K0161801618euoutp01H
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Oct 2025 07:54:40 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20251014075440euoutp012291d67729a2d807bf322eeb3e4d0048~uTGArgE5K0161801618euoutp01H
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1760428480;
 bh=JOoWy2TOH/HfwMyNVGGIpIsyLOQO7Ec5UY2tpwzKToc=;
 h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
 b=rFDo5Ulpk/N2rsM7tt353fcS/+GCTpW3dmbQIXB7/Qe+QTMFvkBPDPu3LBqQdNzEE
 yQ9SOgut5u2/NEoLzVlCbP6bah80bMipVkR8lzdR2pwPQjAYMjbOB7Je2JgkMmAs48
 Po3UyQyQuH9iAcw7cfFxOZKqAEuKpoybz4GdB68w=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20251014075439eucas1p1a0347c3c70491684dd09a88171c5bdfe~uTGASgFS_1159211592eucas1p1b;
 Tue, 14 Oct 2025 07:54:39 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20251014075438eusmtip1da3f2669673b5a70103143b6d02ac1a8~uTF-T-zpl1304013040eusmtip1V;
 Tue, 14 Oct 2025 07:54:38 +0000 (GMT)
Message-ID: <e549a9a3-6038-4a9a-aa2a-404fa8fad5c9@samsung.com>
Date: Tue, 14 Oct 2025 09:54:38 +0200
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH v8 3/5] dma: contiguous: Register reusable CMA regions
 at boot
To: Maxime Ripard <mripard@kernel.org>, Sumit Semwal
 <sumit.semwal@linaro.org>, Benjamin Gaignard
 <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>,
 John Stultz <jstultz@google.com>, "T.J. Mercier" <tjmercier@google.com>,
 Jonathan Corbet <corbet@lwn.net>, =?UTF-8?Q?Christian_K=C3=B6nig?=
 <christian.koenig@amd.com>, Robin Murphy <robin.murphy@arm.com>
Cc: Andrew Davis <afd@ti.com>, Jared Kangas <jkangas@redhat.com>, Mattijs
 Korpershoek <mkorpershoek@kernel.org>, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 iommu@lists.linux.dev
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <20251013-dma-buf-ecc-heap-v8-3-04ce150ea3d9@kernel.org>
Content-Transfer-Encoding: 7bit
X-CMS-MailID: 20251014075439eucas1p1a0347c3c70491684dd09a88171c5bdfe
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20251013083534eucas1p10ed51d5c1d836cb573d959a8c83a750a
X-EPHeader: CA
X-CMS-RootMailID: 20251013083534eucas1p10ed51d5c1d836cb573d959a8c83a750a
References: <20251013-dma-buf-ecc-heap-v8-0-04ce150ea3d9@kernel.org>
 <CGME20251013083534eucas1p10ed51d5c1d836cb573d959a8c83a750a@eucas1p1.samsung.com>
 <20251013-dma-buf-ecc-heap-v8-3-04ce150ea3d9@kernel.org>
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

On 13.10.2025 10:35, Maxime Ripard wrote:
> In order to create a CMA dma-buf heap instance for each CMA heap region
> in the system, we need to collect all of them during boot.
>
> They are created from two main sources: the reserved-memory regions in
> the device tree, and the default CMA region created from the
> configuration or command line parameters, if no default region is
> provided in the device tree.
>
> Let's collect all the device-tree defined CMA regions flagged as
> reusable.
>
> Reviewed-by: T.J. Mercier <tjmercier@google.com>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
Acked-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>   kernel/dma/contiguous.c | 5 +++++
>   1 file changed, 5 insertions(+)
>
> diff --git a/kernel/dma/contiguous.c b/kernel/dma/contiguous.c
> index d9b9dcba6ff7cf5904ac93b72c061fd59072c41b..d67e95094749d45f43c1809c175e491a3f55b2e1 100644
> --- a/kernel/dma/contiguous.c
> +++ b/kernel/dma/contiguous.c
> @@ -40,10 +40,11 @@
>   #include <asm/page.h>
>   
>   #include <linux/memblock.h>
>   #include <linux/err.h>
>   #include <linux/sizes.h>
> +#include <linux/dma-buf/heaps/cma.h>
>   #include <linux/dma-map-ops.h>
>   #include <linux/cma.h>
>   #include <linux/nospec.h>
>   
>   #ifdef CONFIG_CMA_SIZE_MBYTES
> @@ -491,9 +492,13 @@ static int __init rmem_cma_setup(struct reserved_mem *rmem)
>   	rmem->priv = cma;
>   
>   	pr_info("Reserved memory: created CMA memory pool at %pa, size %ld MiB\n",
>   		&rmem->base, (unsigned long)rmem->size / SZ_1M);
>   
> +	err = dma_heap_cma_register_heap(cma);
> +	if (err)
> +		pr_warn("Couldn't register CMA heap.");
> +
>   	return 0;
>   }
>   RESERVEDMEM_OF_DECLARE(cma, "shared-dma-pool", rmem_cma_setup);
>   #endif
>
Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

