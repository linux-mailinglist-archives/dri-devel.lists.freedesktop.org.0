Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C08E2BD805C
	for <lists+dri-devel@lfdr.de>; Tue, 14 Oct 2025 09:55:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05E4D10E572;
	Tue, 14 Oct 2025 07:55:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.b="G+rUOrf2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4981010E572
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Oct 2025 07:55:24 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20251014075523euoutp01118705a9e7112d5a1709a4f17e239b52~uTGoe9HKH0161101611euoutp01W
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Oct 2025 07:55:23 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20251014075523euoutp01118705a9e7112d5a1709a4f17e239b52~uTGoe9HKH0161101611euoutp01W
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1760428523;
 bh=DjNnE0OoknK6AVx8/+2pbe/xE5HGwUdWMg8IvkZJLyo=;
 h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
 b=G+rUOrf2VbGmEo75oZTr8zkHDSf9qXNFiVP/3Geln7oDTNzZhKeAJ+8xTAeQk66wY
 YnOFNQy8N4KGw2ezBJx23mxi++aZtbo1xA3NKbRYDiojplQAcf6JadRin7gyIOf0wN
 zmcKlLsUmXtJTEmYJ6f5tGtRVxECHry28uYmwA14=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20251014075522eucas1p1ee4792f47a967cac07e306140aa77ebd~uTGoAVtc01507915079eucas1p1h;
 Tue, 14 Oct 2025 07:55:22 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20251014075521eusmtip15224e89e824cfe715eb663fc5921579f~uTGnLE7qI1606716067eusmtip1W;
 Tue, 14 Oct 2025 07:55:21 +0000 (GMT)
Message-ID: <a321abc5-fba3-45a5-a99a-73a542fc35c9@samsung.com>
Date: Tue, 14 Oct 2025 09:55:20 +0200
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH v8 4/5] dma: contiguous: Reserve default CMA heap
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
In-Reply-To: <20251013-dma-buf-ecc-heap-v8-4-04ce150ea3d9@kernel.org>
Content-Transfer-Encoding: 7bit
X-CMS-MailID: 20251014075522eucas1p1ee4792f47a967cac07e306140aa77ebd
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20251013083535eucas1p2d80c3c6a03cdbdf79a67f983b2724bea
X-EPHeader: CA
X-CMS-RootMailID: 20251013083535eucas1p2d80c3c6a03cdbdf79a67f983b2724bea
References: <20251013-dma-buf-ecc-heap-v8-0-04ce150ea3d9@kernel.org>
 <CGME20251013083535eucas1p2d80c3c6a03cdbdf79a67f983b2724bea@eucas1p2.samsung.com>
 <20251013-dma-buf-ecc-heap-v8-4-04ce150ea3d9@kernel.org>
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
> The CMA code, in addition to the reserved-memory regions in the device
> tree, will also register a default CMA region if the device tree doesn't
> provide any, with its size and position coming from either the kernel
> command-line or configuration.
>
> Let's register that one for use to create a heap for it.
>
> Reviewed-by: T.J. Mercier <tjmercier@google.com>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
Acked-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>   kernel/dma/contiguous.c | 6 ++++++
>   1 file changed, 6 insertions(+)
>
> diff --git a/kernel/dma/contiguous.c b/kernel/dma/contiguous.c
> index d67e95094749d45f43c1809c175e491a3f55b2e1..d8fd6f779f797f711b8e0fd628f868d644b8f784 100644
> --- a/kernel/dma/contiguous.c
> +++ b/kernel/dma/contiguous.c
> @@ -240,17 +240,23 @@ void __init dma_contiguous_reserve(phys_addr_t limit)
>   		selected_size = max(size_bytes, cma_early_percent_memory());
>   #endif
>   	}
>   
>   	if (selected_size && !dma_contiguous_default_area) {
> +		int ret;
> +
>   		pr_debug("%s: reserving %ld MiB for global area\n", __func__,
>   			 (unsigned long)selected_size / SZ_1M);
>   
>   		dma_contiguous_reserve_area(selected_size, selected_base,
>   					    selected_limit,
>   					    &dma_contiguous_default_area,
>   					    fixed);
> +
> +		ret = dma_heap_cma_register_heap(dma_contiguous_default_area);
> +		if (ret)
> +			pr_warn("Couldn't register default CMA heap.");
>   	}
>   }
>   
>   void __weak
>   dma_contiguous_early_fixup(phys_addr_t base, unsigned long size)
>
Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

