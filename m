Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 978703B0F29
	for <lists+dri-devel@lfdr.de>; Tue, 22 Jun 2021 23:03:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76B296E0D7;
	Tue, 22 Jun 2021 21:03:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34A6D6E0D7;
 Tue, 22 Jun 2021 21:03:01 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id B82596108E;
 Tue, 22 Jun 2021 21:02:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1624395780;
 bh=v96U5qnlOhDf3w1FKsu7SjrxREMp2X2HSv3JOsCkgmU=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=jp86WFjWXckU//EExyz6NMfilYlNSGD/Sp+e74iycIMnJPnrnvb2f/IMZhcf30u/Y
 nZN/eIYPHlNFb7aaAK4BGrzQ8h60A0DeuaUctP8s9mDpf/LCXTiw3xhjYNzVwnhtzX
 TCr/gTHfn3WY41P/JfXANtN8uFlsPQPDxHmgwY0xOxtbMzYm2w8bezm6pQenS5mO9T
 QACOuqiKoEaVeTvNfrREoxgLiMZfrcQDhTBPBD0g1ngPW8KyWNjA64wNxxoLTDCtna
 okD7zfnO67pIIlP+aLcNDcQOeKWv20TpkQkk9C2UIZdw5p+0AdNoxQDYVfglebC4DR
 9wbHzTawfV26w==
Date: Tue, 22 Jun 2021 14:02:58 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Claire Chang <tientzu@chromium.org>
Subject: Re: [PATCH v14 01/12] swiotlb: Refactor swiotlb init functions
In-Reply-To: <20210619034043.199220-2-tientzu@chromium.org>
Message-ID: <alpine.DEB.2.21.2106221402390.24906@sstabellini-ThinkPad-T480s>
References: <20210619034043.199220-1-tientzu@chromium.org>
 <20210619034043.199220-2-tientzu@chromium.org>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
 Frank Rowand <frowand.list@gmail.com>, mingo@kernel.org,
 Marek Szyprowski <m.szyprowski@samsung.com>, sstabellini@kernel.org,
 Saravana Kannan <saravanak@google.com>, mpe@ellerman.id.au,
 Joerg Roedel <joro@8bytes.org>,
 "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
 Christoph Hellwig <hch@lst.de>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>, bskeggs@redhat.com,
 linux-pci@vger.kernel.org, xen-devel@lists.xenproject.org,
 Thierry Reding <treding@nvidia.com>, intel-gfx@lists.freedesktop.org,
 matthew.auld@intel.com, linux-devicetree <devicetree@vger.kernel.org>,
 jxgao@google.com, Will Deacon <will@kernel.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, airlied@linux.ie,
 Dan Williams <dan.j.williams@intel.com>, linuxppc-dev@lists.ozlabs.org,
 Rob Herring <robh+dt@kernel.org>, rodrigo.vivi@intel.com, bhelgaas@google.com,
 boris.ostrovsky@oracle.com,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, jgross@suse.com,
 Nicolas Boichat <drinkcat@chromium.org>, Greg KH <gregkh@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>, lkml <linux-kernel@vger.kernel.org>,
 tfiga@chromium.org,
 "list@263.net:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
 Jim Quinlan <james.quinlan@broadcom.com>, xypron.glpk@gmx.de,
 thomas.lendacky@amd.com, Robin Murphy <robin.murphy@arm.com>,
 bauerman@linux.ibm.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, 19 Jun 2021, Claire Chang wrote:
> Add a new function, swiotlb_init_io_tlb_mem, for the io_tlb_mem struct
> initialization to make the code reusable.
> 
> Signed-off-by: Claire Chang <tientzu@chromium.org>
> Reviewed-by: Christoph Hellwig <hch@lst.de>
> Tested-by: Stefano Stabellini <sstabellini@kernel.org>
> Tested-by: Will Deacon <will@kernel.org>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  kernel/dma/swiotlb.c | 50 ++++++++++++++++++++++----------------------
>  1 file changed, 25 insertions(+), 25 deletions(-)
> 
> diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
> index 52e2ac526757..1f9b2b9e7490 100644
> --- a/kernel/dma/swiotlb.c
> +++ b/kernel/dma/swiotlb.c
> @@ -168,9 +168,28 @@ void __init swiotlb_update_mem_attributes(void)
>  	memset(vaddr, 0, bytes);
>  }
>  
> -int __init swiotlb_init_with_tbl(char *tlb, unsigned long nslabs, int verbose)
> +static void swiotlb_init_io_tlb_mem(struct io_tlb_mem *mem, phys_addr_t start,
> +				    unsigned long nslabs, bool late_alloc)
>  {
> +	void *vaddr = phys_to_virt(start);
>  	unsigned long bytes = nslabs << IO_TLB_SHIFT, i;
> +
> +	mem->nslabs = nslabs;
> +	mem->start = start;
> +	mem->end = mem->start + bytes;
> +	mem->index = 0;
> +	mem->late_alloc = late_alloc;
> +	spin_lock_init(&mem->lock);
> +	for (i = 0; i < mem->nslabs; i++) {
> +		mem->slots[i].list = IO_TLB_SEGSIZE - io_tlb_offset(i);
> +		mem->slots[i].orig_addr = INVALID_PHYS_ADDR;
> +		mem->slots[i].alloc_size = 0;
> +	}
> +	memset(vaddr, 0, bytes);
> +}
> +
> +int __init swiotlb_init_with_tbl(char *tlb, unsigned long nslabs, int verbose)
> +{
>  	struct io_tlb_mem *mem;
>  	size_t alloc_size;
>  
> @@ -186,16 +205,8 @@ int __init swiotlb_init_with_tbl(char *tlb, unsigned long nslabs, int verbose)
>  	if (!mem)
>  		panic("%s: Failed to allocate %zu bytes align=0x%lx\n",
>  		      __func__, alloc_size, PAGE_SIZE);
> -	mem->nslabs = nslabs;
> -	mem->start = __pa(tlb);
> -	mem->end = mem->start + bytes;
> -	mem->index = 0;
> -	spin_lock_init(&mem->lock);
> -	for (i = 0; i < mem->nslabs; i++) {
> -		mem->slots[i].list = IO_TLB_SEGSIZE - io_tlb_offset(i);
> -		mem->slots[i].orig_addr = INVALID_PHYS_ADDR;
> -		mem->slots[i].alloc_size = 0;
> -	}
> +
> +	swiotlb_init_io_tlb_mem(mem, __pa(tlb), nslabs, false);
>  
>  	io_tlb_default_mem = mem;
>  	if (verbose)
> @@ -282,8 +293,8 @@ swiotlb_late_init_with_default_size(size_t default_size)
>  int
>  swiotlb_late_init_with_tbl(char *tlb, unsigned long nslabs)
>  {
> -	unsigned long bytes = nslabs << IO_TLB_SHIFT, i;
>  	struct io_tlb_mem *mem;
> +	unsigned long bytes = nslabs << IO_TLB_SHIFT;
>  
>  	if (swiotlb_force == SWIOTLB_NO_FORCE)
>  		return 0;
> @@ -297,20 +308,9 @@ swiotlb_late_init_with_tbl(char *tlb, unsigned long nslabs)
>  	if (!mem)
>  		return -ENOMEM;
>  
> -	mem->nslabs = nslabs;
> -	mem->start = virt_to_phys(tlb);
> -	mem->end = mem->start + bytes;
> -	mem->index = 0;
> -	mem->late_alloc = 1;
> -	spin_lock_init(&mem->lock);
> -	for (i = 0; i < mem->nslabs; i++) {
> -		mem->slots[i].list = IO_TLB_SEGSIZE - io_tlb_offset(i);
> -		mem->slots[i].orig_addr = INVALID_PHYS_ADDR;
> -		mem->slots[i].alloc_size = 0;
> -	}
> -
> +	memset(mem, 0, sizeof(*mem));
>  	set_memory_decrypted((unsigned long)tlb, bytes >> PAGE_SHIFT);
> -	memset(tlb, 0, bytes);
> +	swiotlb_init_io_tlb_mem(mem, virt_to_phys(tlb), nslabs, true);
>  
>  	io_tlb_default_mem = mem;
>  	swiotlb_print_info();
> -- 
> 2.32.0.288.g62a8d224e6-goog
> 
