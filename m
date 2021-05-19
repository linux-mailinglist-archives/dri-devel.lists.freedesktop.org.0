Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FDAB3895CE
	for <lists+dri-devel@lfdr.de>; Wed, 19 May 2021 20:50:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C479C6EE58;
	Wed, 19 May 2021 18:50:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com
 [IPv6:2607:f8b0:4864:20::1033])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F77A6EE58;
 Wed, 19 May 2021 18:50:14 +0000 (UTC)
Received: by mail-pj1-x1033.google.com with SMTP id
 b13-20020a17090a8c8db029015cd97baea9so3976842pjo.0; 
 Wed, 19 May 2021 11:50:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=dYfUs37GH26f9qor1VLh+dBs069CWpkdAXD/ElhmJms=;
 b=TrWBAUFZb5IOcZqvzjceFmBdD//LhG3J/GS/NNJVT3gU+F4jePK2De3KUi6WMq1NHA
 zndANjSseMb1Pp2JRwuG0SKzESIJZgHwjEgadrwQvWeoPO53UCfAxaiTf1Zb6HKEWFg+
 KxvquRqXRHR2JXs6tVsspVphZHfh6QRuiwDBKvnzs/KhFOZgDEomwsEaIwbkEmyXnii1
 Zfxo7hizbKJjteQW7iRhmVRGFo9GFw0B11Cxe44wbA/ziDpsrbDsCg/BzVUrrcWoLnZb
 /YnwocBrRVTzDPZIHZwS44CV6X61m/f/ggI85MB9OD/nN5l0XNYHfp13C3qnJ0yxFZH1
 QMng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=dYfUs37GH26f9qor1VLh+dBs069CWpkdAXD/ElhmJms=;
 b=HEbaPn8ztx0GYd/EZoSARJnZ9sVle7vr2VbYj5T1vQLzTUnM+uO+PrG66vpyY3Hjcr
 qqpAxLz4N2bZMpthMnjbZXlCNq3Crqw+guqraJhV5xiaXnEJQTLsiyYtlMueqhtKefPw
 Nj9RhiIPUsJuBhPXgtpUY+nTZ/yjhqcZGlpws/hkoOTiEOIPJcyCssFaXNifHhd0PlU3
 +fT8JM6PzGOaW8HKGyq2jMvwxZWywniqAq8ATCqWHaR456JIQO+Nv8GkE3aVDos4gO1N
 Pe56w2TK7ZxjH+SYt5a3MlIHvBqZALMOa5YFdqbvJOCdpTf+8iV/2u01VyovIhn4UTuu
 ljrw==
X-Gm-Message-State: AOAM531VCLHrFndW/2be+eMAt4HcFUCllhQW9pVW9goBWjZqk7roiaaG
 eB6Z1jZzBYDiLOS1Amo/EK4=
X-Google-Smtp-Source: ABdhPJxg56VOtjzCy0nTcRzR5TrWV2NzF6pi2y8FSlVZjGvfF9DZQZKizJXSGDAHfIg8aWG5cZking==
X-Received: by 2002:a17:90b:1949:: with SMTP id
 nk9mr742999pjb.220.1621450213929; 
 Wed, 19 May 2021 11:50:13 -0700 (PDT)
Received: from [10.230.29.202] ([192.19.223.252])
 by smtp.gmail.com with ESMTPSA id 204sm126125pfy.56.2021.05.19.11.50.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 May 2021 11:50:13 -0700 (PDT)
Subject: Re: [PATCH v7 01/15] swiotlb: Refactor swiotlb init functions
To: Claire Chang <tientzu@chromium.org>, Rob Herring <robh+dt@kernel.org>,
 mpe@ellerman.id.au, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Frank Rowand <frowand.list@gmail.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, boris.ostrovsky@oracle.com,
 jgross@suse.com, Christoph Hellwig <hch@lst.de>,
 Marek Szyprowski <m.szyprowski@samsung.com>
References: <20210518064215.2856977-1-tientzu@chromium.org>
 <20210518064215.2856977-2-tientzu@chromium.org>
From: Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <170a54f2-be20-ec29-1d7f-3388e5f928c6@gmail.com>
Date: Wed, 19 May 2021 11:50:07 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <20210518064215.2856977-2-tientzu@chromium.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
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
 airlied@linux.ie, Robin Murphy <robin.murphy@arm.com>,
 Nicolas Boichat <drinkcat@chromium.org>, rodrigo.vivi@intel.com,
 bhelgaas@google.com, Dan Williams <dan.j.williams@intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Greg KH <gregkh@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>,
 lkml <linux-kernel@vger.kernel.org>, tfiga@chromium.org,
 "list@263.net:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
 Jim Quinlan <james.quinlan@broadcom.com>, linuxppc-dev@lists.ozlabs.org,
 bauerman@linux.ibm.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 5/17/2021 11:42 PM, Claire Chang wrote:
> Add a new function, swiotlb_init_io_tlb_mem, for the io_tlb_mem struct
> initialization to make the code reusable.
> 
> Note that we now also call set_memory_decrypted in swiotlb_init_with_tbl.
> 
> Signed-off-by: Claire Chang <tientzu@chromium.org>
> ---
>  kernel/dma/swiotlb.c | 51 ++++++++++++++++++++++----------------------
>  1 file changed, 25 insertions(+), 26 deletions(-)
> 
> diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
> index 8ca7d505d61c..d3232fc19385 100644
> --- a/kernel/dma/swiotlb.c
> +++ b/kernel/dma/swiotlb.c
> @@ -168,9 +168,30 @@ void __init swiotlb_update_mem_attributes(void)
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
> +
> +	set_memory_decrypted((unsigned long)vaddr, bytes >> PAGE_SHIFT);
> +	memset(vaddr, 0, bytes);

You are doing an unconditional set_memory_decrypted() followed by a
memset here, and then:

> +}
> +
> +int __init swiotlb_init_with_tbl(char *tlb, unsigned long nslabs, int verbose)
> +{
>  	struct io_tlb_mem *mem;
>  	size_t alloc_size;
>  
> @@ -186,16 +207,8 @@ int __init swiotlb_init_with_tbl(char *tlb, unsigned long nslabs, int verbose)
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

You convert this call site with swiotlb_init_io_tlb_mem() which did not
do the set_memory_decrypted()+memset(). Is this okay or should
swiotlb_init_io_tlb_mem() add an additional argument to do this
conditionally?
-- 
Florian
