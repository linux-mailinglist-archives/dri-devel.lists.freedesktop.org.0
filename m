Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DC0753693FC
	for <lists+dri-devel@lfdr.de>; Fri, 23 Apr 2021 15:46:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 234B46EB94;
	Fri, 23 Apr 2021 13:46:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 70EAF6EB93;
 Fri, 23 Apr 2021 13:46:35 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9E1CE1063;
 Fri, 23 Apr 2021 06:46:34 -0700 (PDT)
Received: from [10.57.62.63] (unknown [10.57.62.63])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 903A33F73B;
 Fri, 23 Apr 2021 06:46:27 -0700 (PDT)
Subject: Re: [PATCH v5 14/16] dma-direct: Allocate memory from restricted DMA
 pool if available
To: Claire Chang <tientzu@chromium.org>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Frank Rowand <frowand.list@gmail.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, boris.ostrovsky@oracle.com,
 jgross@suse.com, Christoph Hellwig <hch@lst.de>,
 Marek Szyprowski <m.szyprowski@samsung.com>
References: <20210422081508.3942748-1-tientzu@chromium.org>
 <20210422081508.3942748-15-tientzu@chromium.org>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <70b895c2-4a39-bbbd-a719-5c8b6b922026@arm.com>
Date: Fri, 23 Apr 2021 14:46:25 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210422081508.3942748-15-tientzu@chromium.org>
Content-Language: en-GB
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
Cc: heikki.krogerus@linux.intel.com, thomas.hellstrom@linux.intel.com,
 peterz@infradead.org, dri-devel@lists.freedesktop.org,
 chris@chris-wilson.co.uk, grant.likely@arm.com, paulus@samba.org,
 mingo@kernel.org, jxgao@google.com, sstabellini@kernel.org,
 Saravana Kannan <saravanak@google.com>, xypron.glpk@gmx.de,
 "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>, bskeggs@redhat.com,
 linux-pci@vger.kernel.org, xen-devel@lists.xenproject.org,
 Thierry Reding <treding@nvidia.com>, intel-gfx@lists.freedesktop.org,
 matthew.auld@intel.com, linux-devicetree <devicetree@vger.kernel.org>,
 airlied@linux.ie, Nicolas Boichat <drinkcat@chromium.org>,
 rodrigo.vivi@intel.com, bhelgaas@google.com,
 Dan Williams <dan.j.williams@intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 nouveau@lists.freedesktop.org, Greg KH <gregkh@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>, lkml <linux-kernel@vger.kernel.org>,
 tfiga@chromium.org,
 "list@263.net:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
 Jim Quinlan <james.quinlan@broadcom.com>, linuxppc-dev@lists.ozlabs.org,
 bauerman@linux.ibm.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2021-04-22 09:15, Claire Chang wrote:
> The restricted DMA pool is preferred if available.
> 
> The restricted DMA pools provide a basic level of protection against the
> DMA overwriting buffer contents at unexpected times. However, to protect
> against general data leakage and system memory corruption, the system
> needs to provide a way to lock down the memory access, e.g., MPU.
> 
> Signed-off-by: Claire Chang <tientzu@chromium.org>
> ---
>   kernel/dma/direct.c | 35 ++++++++++++++++++++++++++---------
>   1 file changed, 26 insertions(+), 9 deletions(-)
> 
> diff --git a/kernel/dma/direct.c b/kernel/dma/direct.c
> index 7a27f0510fcc..29523d2a9845 100644
> --- a/kernel/dma/direct.c
> +++ b/kernel/dma/direct.c
> @@ -78,6 +78,10 @@ static bool dma_coherent_ok(struct device *dev, phys_addr_t phys, size_t size)
>   static void __dma_direct_free_pages(struct device *dev, struct page *page,
>   				    size_t size)
>   {
> +#ifdef CONFIG_DMA_RESTRICTED_POOL
> +	if (swiotlb_free(dev, page, size))
> +		return;
> +#endif
>   	dma_free_contiguous(dev, page, size);
>   }
>   
> @@ -92,7 +96,17 @@ static struct page *__dma_direct_alloc_pages(struct device *dev, size_t size,
>   
>   	gfp |= dma_direct_optimal_gfp_mask(dev, dev->coherent_dma_mask,
>   					   &phys_limit);
> -	page = dma_alloc_contiguous(dev, size, gfp);
> +
> +#ifdef CONFIG_DMA_RESTRICTED_POOL
> +	page = swiotlb_alloc(dev, size);
> +	if (page && !dma_coherent_ok(dev, page_to_phys(page), size)) {
> +		__dma_direct_free_pages(dev, page, size);
> +		page = NULL;
> +	}
> +#endif
> +
> +	if (!page)
> +		page = dma_alloc_contiguous(dev, size, gfp);
>   	if (page && !dma_coherent_ok(dev, page_to_phys(page), size)) {
>   		dma_free_contiguous(dev, page, size);
>   		page = NULL;
> @@ -148,7 +162,7 @@ void *dma_direct_alloc(struct device *dev, size_t size,
>   		gfp |= __GFP_NOWARN;
>   
>   	if ((attrs & DMA_ATTR_NO_KERNEL_MAPPING) &&
> -	    !force_dma_unencrypted(dev)) {
> +	    !force_dma_unencrypted(dev) && !is_dev_swiotlb_force(dev)) {
>   		page = __dma_direct_alloc_pages(dev, size, gfp & ~__GFP_ZERO);
>   		if (!page)
>   			return NULL;
> @@ -161,8 +175,8 @@ void *dma_direct_alloc(struct device *dev, size_t size,
>   	}
>   
>   	if (!IS_ENABLED(CONFIG_ARCH_HAS_DMA_SET_UNCACHED) &&
> -	    !IS_ENABLED(CONFIG_DMA_DIRECT_REMAP) &&
> -	    !dev_is_dma_coherent(dev))
> +	    !IS_ENABLED(CONFIG_DMA_DIRECT_REMAP) && !dev_is_dma_coherent(dev) &&
> +	    !is_dev_swiotlb_force(dev))
>   		return arch_dma_alloc(dev, size, dma_handle, gfp, attrs);
>   
>   	/*
> @@ -172,7 +186,9 @@ void *dma_direct_alloc(struct device *dev, size_t size,
>   	if (IS_ENABLED(CONFIG_DMA_COHERENT_POOL) &&
>   	    !gfpflags_allow_blocking(gfp) &&
>   	    (force_dma_unencrypted(dev) ||
> -	     (IS_ENABLED(CONFIG_DMA_DIRECT_REMAP) && !dev_is_dma_coherent(dev))))
> +	     (IS_ENABLED(CONFIG_DMA_DIRECT_REMAP) &&
> +	      !dev_is_dma_coherent(dev))) &&
> +	    !is_dev_swiotlb_force(dev))
>   		return dma_direct_alloc_from_pool(dev, size, dma_handle, gfp);
>   
>   	/* we always manually zero the memory once we are done */
> @@ -253,15 +269,15 @@ void dma_direct_free(struct device *dev, size_t size,
>   	unsigned int page_order = get_order(size);
>   
>   	if ((attrs & DMA_ATTR_NO_KERNEL_MAPPING) &&
> -	    !force_dma_unencrypted(dev)) {
> +	    !force_dma_unencrypted(dev) && !is_dev_swiotlb_force(dev)) {
>   		/* cpu_addr is a struct page cookie, not a kernel address */
>   		dma_free_contiguous(dev, cpu_addr, size);
>   		return;
>   	}
>   
>   	if (!IS_ENABLED(CONFIG_ARCH_HAS_DMA_SET_UNCACHED) &&
> -	    !IS_ENABLED(CONFIG_DMA_DIRECT_REMAP) &&
> -	    !dev_is_dma_coherent(dev)) {
> +	    !IS_ENABLED(CONFIG_DMA_DIRECT_REMAP) && !dev_is_dma_coherent(dev) &&
> +	    !is_dev_swiotlb_force(dev)) {
>   		arch_dma_free(dev, size, cpu_addr, dma_addr, attrs);
>   		return;
>   	}
> @@ -289,7 +305,8 @@ struct page *dma_direct_alloc_pages(struct device *dev, size_t size,
>   	void *ret;
>   
>   	if (IS_ENABLED(CONFIG_DMA_COHERENT_POOL) &&
> -	    force_dma_unencrypted(dev) && !gfpflags_allow_blocking(gfp))
> +	    force_dma_unencrypted(dev) && !gfpflags_allow_blocking(gfp) &&
> +	    !is_dev_swiotlb_force(dev))
>   		return dma_direct_alloc_from_pool(dev, size, dma_handle, gfp);

Wait, this seems broken for non-coherent devices - in that case we need 
to return a non-cacheable address, but we can't simply fall through into 
the remapping path below in GFP_ATOMIC context. That's why we need the 
atomic pool concept in the first place :/

Unless I've overlooked something, we're still using the regular 
cacheable linear map address of the dma_io_tlb_mem buffer, no?

Robin.

>   
>   	page = __dma_direct_alloc_pages(dev, size, gfp);
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
