Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A384A5988B
	for <lists+dri-devel@lfdr.de>; Mon, 10 Mar 2025 15:56:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83A7010E0CA;
	Mon, 10 Mar 2025 14:56:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 042F910E0CA
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Mar 2025 14:56:43 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C18D226BC;
 Mon, 10 Mar 2025 07:56:54 -0700 (PDT)
Received: from [10.57.39.174] (unknown [10.57.39.174])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B0B203F5A1;
 Mon, 10 Mar 2025 07:56:39 -0700 (PDT)
Message-ID: <2af9ea85-b31d-49c9-b574-38c33cc89cef@arm.com>
Date: Mon, 10 Mar 2025 14:56:37 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 06/12] dma: direct: Provide accessor to dmem region
To: Maxime Ripard <mripard@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>,
 "T.J. Mercier" <tjmercier@google.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Tomasz Figa <tfiga@chromium.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Hans Verkuil <hverkuil@xs4all.nl>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org
References: <20250310-dmem-cgroups-v1-0-2984c1bc9312@kernel.org>
 <20250310-dmem-cgroups-v1-6-2984c1bc9312@kernel.org>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <20250310-dmem-cgroups-v1-6-2984c1bc9312@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

On 2025-03-10 12:06 pm, Maxime Ripard wrote:
> Consumers of the direct DMA API will have to know which region their
> device allocate from in order for them to charge the memory allocation
> in the right one.

This doesn't seem to make much sense - dma-direct is not an allocator 
itself, it just provides the high-level 
dma_alloc_attrs/dma_alloc_pages/etc. interfaces wherein the underlying 
allocations _could_ come from CMA, but also a per-device 
coherent/restricted pool, or a global coherent/atomic pool, or the 
regular page allocator, or in one weird corner case the SWIOTLB buffer, 
or...

Thanks,
Robin.

> Let's provide an accessor for that region.
> 
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>   include/linux/dma-direct.h | 2 ++
>   kernel/dma/direct.c        | 8 ++++++++
>   2 files changed, 10 insertions(+)
> 
> diff --git a/include/linux/dma-direct.h b/include/linux/dma-direct.h
> index d7e30d4f7503a898a456df8eedf6a2cd284c35ff..2dd7cbccfaeed81c18c67aae877417fe89f2f2f5 100644
> --- a/include/linux/dma-direct.h
> +++ b/include/linux/dma-direct.h
> @@ -145,6 +145,8 @@ void dma_direct_free_pages(struct device *dev, size_t size,
>   		enum dma_data_direction dir);
>   int dma_direct_supported(struct device *dev, u64 mask);
>   dma_addr_t dma_direct_map_resource(struct device *dev, phys_addr_t paddr,
>   		size_t size, enum dma_data_direction dir, unsigned long attrs);
>   
> +struct dmem_cgroup_region *dma_direct_get_dmem_cgroup_region(struct device *dev);
> +
>   #endif /* _LINUX_DMA_DIRECT_H */
> diff --git a/kernel/dma/direct.c b/kernel/dma/direct.c
> index 5b4e6d3bf7bcca8930877ba078aed4ce26828f06..ece1361077b6efeec5b202d838750afd967d473f 100644
> --- a/kernel/dma/direct.c
> +++ b/kernel/dma/direct.c
> @@ -42,10 +42,18 @@ u64 dma_direct_get_required_mask(struct device *dev)
>   	u64 max_dma = phys_to_dma_direct(dev, phys);
>   
>   	return (1ULL << (fls64(max_dma) - 1)) * 2 - 1;
>   }
>   
> +#if IS_ENABLED(CONFIG_CGROUP_DMEM)
> +struct dmem_cgroup_region *
> +dma_direct_get_dmem_cgroup_region(struct device *dev)
> +{
> +	return dma_contiguous_get_dmem_cgroup_region(dev);
> +}
> +#endif
> +
>   static gfp_t dma_direct_optimal_gfp_mask(struct device *dev, u64 *phys_limit)
>   {
>   	u64 dma_limit = min_not_zero(
>   		dev->coherent_dma_mask,
>   		dev->bus_dma_limit);
> 

