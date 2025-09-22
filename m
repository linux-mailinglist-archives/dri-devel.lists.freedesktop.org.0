Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA3DBB934F8
	for <lists+dri-devel@lfdr.de>; Mon, 22 Sep 2025 23:00:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB12E10E0CF;
	Mon, 22 Sep 2025 21:00:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Sk3QsOA2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5D9010E0CF
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Sep 2025 21:00:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1758574840;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=u976ILMXRioS/uyYdClouLABKNXfjZw/zLt8Qjs8X1U=;
 b=Sk3QsOA2IfYgMm0AH1Flzlz1ewz8ckckXRAxXkpyTfMgkItXwznMRfi24LrbgGAkzuQr9z
 r80rO59K2Lg40pbRgmGsILJDZbk5HyY/rATmqHKf8rdLglwnA/5Tn3aN9GD4fOF+YXmzAR
 flTghDfRAi7P2kGVcSB5LK2MRorS6vk=
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com
 [209.85.166.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-329-tv6SS89qMOC6kGR1knAHnw-1; Mon, 22 Sep 2025 17:00:37 -0400
X-MC-Unique: tv6SS89qMOC6kGR1knAHnw-1
X-Mimecast-MFC-AGG-ID: tv6SS89qMOC6kGR1knAHnw_1758574837
Received: by mail-il1-f200.google.com with SMTP id
 e9e14a558f8ab-4248bfd20faso7641255ab.2
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Sep 2025 14:00:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758574837; x=1759179637;
 h=content-transfer-encoding:mime-version:organization:references
 :in-reply-to:message-id:subject:cc:to:from:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=u976ILMXRioS/uyYdClouLABKNXfjZw/zLt8Qjs8X1U=;
 b=asbFAhDDhsBm5WdCXhBrJA6n9JAOrhf1QT0q6IeVKiiypTWQ29GPmKbGIwZSZU7s53
 ChzK/imxCWg4Dfjif3p8xvSqnkBnD/cn1h/UmMDb12t5rCBoVVby+mLpdMpiSsppShTS
 /cBlatOhZQ+pjMwkJX8y80f297apvOBximfVSU8hxse+yzxiG/yIfF4YSzh3Wt9kj+zi
 la5vnLb/0aD70x+UcNbeqWpK+CC5S5LOuY0lP2MdYxU9YaPyPGLuIkUHvt5eJUyAZZC7
 aweKx73ZBk8WhQg+4TuF70GqiV7L1wlK7Q16+57mbiOi0cEuQC2y++qeeIokJkxTPa1o
 Y/NQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWR9C/EDDnvycJKuCKf/4Avi08HuzeYjc+cvOe+eZmNXujgDofSWA+uMCSCz4ILy1HeZsVCNE8JmAk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YylTMwuR1P278+4LY4MnksrXcO3rHI2r7Rn7HoaTPDyFEnenqvu
 2QIZwvWH0XDLcJHaen/xJlW2aZ9Otr+JOKs1q8Tz95Ew6JvxdkIUdR6koSblOJFJMP3iBRKNvGw
 T8Ar0DkZxbA/JndNfDl2342wHuafZJGyyt15OMxVE5gAM3Iqp7iagTfbzCepSKE3urT1wfQ==
X-Gm-Gg: ASbGnct8dIMOTrAdpeRK+IBHqIwIPUeLabUH0Aogd4/NGgFTaJBTLvr504rj/AX51ki
 fai8PZZxiXgxlygFfmaUN35lvk44+eANAfr5mL5p5Y1IQmrCiEMdITx4y/GeC21BziSd+LQYkp0
 MnMt2laD2fIpJR0e+JjjX+P0VjRtbta2sLyrN1qYz9lu6jfKx2dtm7wGnhwFrbagmmWnksYjEYy
 KGPdWK6kd6YWWd2zdwS6jxG9K6eIncQb6B6EppcDRasUYKcxSztJQDqTHGdKnnac7pSN2mUujOV
 o302GVyg2sao6AlEdhPEYDFIbKKB/Y+FlqNaI2kj9Rk=
X-Received: by 2002:a05:6e02:1564:b0:424:1774:6908 with SMTP id
 e9e14a558f8ab-42581d411aemr2507475ab.0.1758574836524; 
 Mon, 22 Sep 2025 14:00:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEHevCmO0qja9+CaJmqTAnyT70ByyebOs+GgzBvQQPshgkX8jExSjBAAuoPEqWA6rRJFVM2cg==
X-Received: by 2002:a05:6e02:1564:b0:424:1774:6908 with SMTP id
 e9e14a558f8ab-42581d411aemr2507095ab.0.1758574835992; 
 Mon, 22 Sep 2025 14:00:35 -0700 (PDT)
Received: from redhat.com ([38.15.36.11]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-53d3e337bebsm6192605173.28.2025.09.22.14.00.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Sep 2025 14:00:35 -0700 (PDT)
Date: Mon, 22 Sep 2025 15:00:32 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Leon Romanovsky <leon@kernel.org>
Cc: Leon Romanovsky <leonro@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Andrew Morton <akpm@linux-foundation.org>, Bjorn Helgaas
 <bhelgaas@google.com>, Christian =?UTF-8?B?S8O2bmln?=
 <christian.koenig@amd.com>, dri-devel@lists.freedesktop.org,
 iommu@lists.linux.dev, Jens Axboe <axboe@kernel.dk>, Joerg Roedel
 <joro@8bytes.org>, kvm@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-mm@kvack.org, linux-pci@vger.kernel.org,
 Logan Gunthorpe <logang@deltatee.com>, Marek Szyprowski
 <m.szyprowski@samsung.com>, Robin Murphy <robin.murphy@arm.com>, Sumit
 Semwal <sumit.semwal@linaro.org>, Vivek Kasireddy
 <vivek.kasireddy@intel.com>, Will Deacon <will@kernel.org>
Subject: Re: [PATCH v2 03/10] PCI/P2PDMA: Refactor to separate core P2P
 functionality from memory allocation
Message-ID: <20250922150032.3e3da410.alex.williamson@redhat.com>
In-Reply-To: <1e2cb89ea76a92949d06a804e3ab97478e7cacbb.1757589589.git.leon@kernel.org>
References: <cover.1757589589.git.leon@kernel.org>
 <1e2cb89ea76a92949d06a804e3ab97478e7cacbb.1757589589.git.leon@kernel.org>
Organization: Red Hat
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: C7rjrlH1H3TTp35d_UEuwcN_1qeTvdZ8EDdWJ24qA8o_1758574837
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
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

On Thu, 11 Sep 2025 14:33:07 +0300
Leon Romanovsky <leon@kernel.org> wrote:

> From: Leon Romanovsky <leonro@nvidia.com>
> 
> Refactor the PCI P2PDMA subsystem to separate the core peer-to-peer DMA
> functionality from the optional memory allocation layer. This creates a
> two-tier architecture:
> 
> The core layer provides P2P mapping functionality for physical addresses
> based on PCI device MMIO BARs and integrates with the DMA API for
> mapping operations. This layer is required for all P2PDMA users.
> 
> The optional upper layer provides memory allocation capabilities
> including gen_pool allocator, struct page support, and sysfs interface
> for user space access.
> 
> This separation allows subsystems like VFIO to use only the core P2P
> mapping functionality without the overhead of memory allocation features
> they don't need. The core functionality is now available through the
> new pci_p2pdma_enable() function that returns a p2pdma_provider
> structure.
> 
> Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
> ---
>  drivers/pci/p2pdma.c       | 129 +++++++++++++++++++++++++++----------
>  include/linux/pci-p2pdma.h |   5 ++
>  2 files changed, 100 insertions(+), 34 deletions(-)
> 
> diff --git a/drivers/pci/p2pdma.c b/drivers/pci/p2pdma.c
> index 176a99232fdca..c22cbb3a26030 100644
> --- a/drivers/pci/p2pdma.c
> +++ b/drivers/pci/p2pdma.c
> @@ -25,11 +25,12 @@ struct pci_p2pdma {
>  	struct gen_pool *pool;
>  	bool p2pmem_published;
>  	struct xarray map_types;
> +	struct p2pdma_provider mem[PCI_STD_NUM_BARS];
>  };
>  
>  struct pci_p2pdma_pagemap {
>  	struct dev_pagemap pgmap;
> -	struct p2pdma_provider mem;
> +	struct p2pdma_provider *mem;
>  };
>  
>  static struct pci_p2pdma_pagemap *to_p2p_pgmap(struct dev_pagemap *pgmap)
> @@ -204,7 +205,7 @@ static void p2pdma_page_free(struct page *page)
>  	struct pci_p2pdma_pagemap *pgmap = to_p2p_pgmap(page_pgmap(page));
>  	/* safe to dereference while a reference is held to the percpu ref */
>  	struct pci_p2pdma *p2pdma = rcu_dereference_protected(
> -		to_pci_dev(pgmap->mem.owner)->p2pdma, 1);
> +		to_pci_dev(pgmap->mem->owner)->p2pdma, 1);
>  	struct percpu_ref *ref;
>  
>  	gen_pool_free_owner(p2pdma->pool, (uintptr_t)page_to_virt(page),
> @@ -227,44 +228,93 @@ static void pci_p2pdma_release(void *data)
>  
>  	/* Flush and disable pci_alloc_p2p_mem() */
>  	pdev->p2pdma = NULL;
> -	synchronize_rcu();
> +	if (p2pdma->pool)
> +		synchronize_rcu();
> +	xa_destroy(&p2pdma->map_types);
> +
> +	if (!p2pdma->pool)
> +		return;
>  
>  	gen_pool_destroy(p2pdma->pool);
>  	sysfs_remove_group(&pdev->dev.kobj, &p2pmem_group);
> -	xa_destroy(&p2pdma->map_types);
>  }
>  
> -static int pci_p2pdma_setup(struct pci_dev *pdev)
> +/**
> + * pcim_p2pdma_enable - Enable peer-to-peer DMA support for a PCI device
> + * @pdev: The PCI device to enable P2PDMA for
> + * @bar: BAR index to get provider
> + *
> + * This function initializes the peer-to-peer DMA infrastructure for a PCI
> + * device. It allocates and sets up the necessary data structures to support
> + * P2PDMA operations, including mapping type tracking.
> + */
> +struct p2pdma_provider *pcim_p2pdma_enable(struct pci_dev *pdev, int bar)
>  {
> -	int error = -ENOMEM;
>  	struct pci_p2pdma *p2p;
> +	int i, ret;
> +
> +	p2p = rcu_dereference_protected(pdev->p2pdma, 1);
> +	if (p2p)
> +		/* PCI device was "rebound" to the driver */
> +		return &p2p->mem[bar];
>  

This seems like two separate functions rolled into one, an 'initialize
providers' and a 'get provider for BAR'.  The comment above even makes
it sound like only a driver re-probing a device would encounter this
branch, but the use case later in vfio-pci shows it to be the common
case to iterate BARs for a device.

But then later in patch 8/ and again in 10/ why exactly do we cache
the provider on the vfio_pci_core_device rather than ask for it on
demand from the p2pdma?

It also seems like the coordination of a valid provider is ad-hoc
between p2pdma and vfio-pci.  For example, this only fills providers
for MMIO BARs and vfio-pci validates that dmabuf operations are for
MMIO BARs, but it would be more consistent if vfio-pci relied on p2pdma
to give it a valid provider for a given BAR.  Thanks,

Alex

>  	p2p = devm_kzalloc(&pdev->dev, sizeof(*p2p), GFP_KERNEL);
>  	if (!p2p)
> -		return -ENOMEM;
> +		return ERR_PTR(-ENOMEM);
>  
>  	xa_init(&p2p->map_types);
> +	/*
> +	 * Iterate over all standard PCI BARs and record only those that
> +	 * correspond to MMIO regions. Skip non-memory resources (e.g. I/O
> +	 * port BARs) since they cannot be used for peer-to-peer (P2P)
> +	 * transactions.
> +	 */
> +	for (i = 0; i < PCI_STD_NUM_BARS; i++) {
> +		if (!(pci_resource_flags(pdev, i) & IORESOURCE_MEM))
> +			continue;
>  
> -	p2p->pool = gen_pool_create(PAGE_SHIFT, dev_to_node(&pdev->dev));
> -	if (!p2p->pool)
> -		goto out;
> +		p2p->mem[i].owner = &pdev->dev;
> +		p2p->mem[i].bus_offset =
> +			pci_bus_address(pdev, i) - pci_resource_start(pdev, i);
> +	}
>  
> -	error = devm_add_action_or_reset(&pdev->dev, pci_p2pdma_release, pdev);
> -	if (error)
> -		goto out_pool_destroy;
> +	ret = devm_add_action_or_reset(&pdev->dev, pci_p2pdma_release, pdev);
> +	if (ret)
> +		goto out_p2p;
>  
> -	error = sysfs_create_group(&pdev->dev.kobj, &p2pmem_group);
> -	if (error)
> +	rcu_assign_pointer(pdev->p2pdma, p2p);
> +	return &p2p->mem[bar];
> +
> +out_p2p:
> +	devm_kfree(&pdev->dev, p2p);
> +	return ERR_PTR(ret);
> +}
> +EXPORT_SYMBOL_GPL(pcim_p2pdma_enable);
> +
> +static int pci_p2pdma_setup_pool(struct pci_dev *pdev)
> +{
> +	struct pci_p2pdma *p2pdma;
> +	int ret;
> +
> +	p2pdma = rcu_dereference_protected(pdev->p2pdma, 1);
> +	if (p2pdma->pool)
> +		/* We already setup pools, do nothing, */
> +		return 0;
> +
> +	p2pdma->pool = gen_pool_create(PAGE_SHIFT, dev_to_node(&pdev->dev));
> +	if (!p2pdma->pool)
> +		return -ENOMEM;
> +
> +	ret = sysfs_create_group(&pdev->dev.kobj, &p2pmem_group);
> +	if (ret)
>  		goto out_pool_destroy;
>  
> -	rcu_assign_pointer(pdev->p2pdma, p2p);
>  	return 0;
>  
>  out_pool_destroy:
> -	gen_pool_destroy(p2p->pool);
> -out:
> -	devm_kfree(&pdev->dev, p2p);
> -	return error;
> +	gen_pool_destroy(p2pdma->pool);
> +	p2pdma->pool = NULL;
> +	return ret;
>  }
>  
>  static void pci_p2pdma_unmap_mappings(void *data)
> @@ -276,7 +326,7 @@ static void pci_p2pdma_unmap_mappings(void *data)
>  	 * unmap_mapping_range() on the inode, teardown any existing userspace
>  	 * mappings and prevent new ones from being created.
>  	 */
> -	sysfs_remove_file_from_group(&p2p_pgmap->mem.owner->kobj,
> +	sysfs_remove_file_from_group(&p2p_pgmap->mem->owner->kobj,
>  				     &p2pmem_alloc_attr.attr,
>  				     p2pmem_group.name);
>  }
> @@ -295,6 +345,7 @@ int pci_p2pdma_add_resource(struct pci_dev *pdev, int bar, size_t size,
>  			    u64 offset)
>  {
>  	struct pci_p2pdma_pagemap *p2p_pgmap;
> +	struct p2pdma_provider *mem;
>  	struct dev_pagemap *pgmap;
>  	struct pci_p2pdma *p2pdma;
>  	void *addr;
> @@ -312,15 +363,25 @@ int pci_p2pdma_add_resource(struct pci_dev *pdev, int bar, size_t size,
>  	if (size + offset > pci_resource_len(pdev, bar))
>  		return -EINVAL;
>  
> -	if (!pdev->p2pdma) {
> -		error = pci_p2pdma_setup(pdev);
> +	p2pdma = rcu_dereference_protected(pdev->p2pdma, 1);
> +	if (!p2pdma) {
> +		mem = pcim_p2pdma_enable(pdev, bar);
> +		if (IS_ERR(mem))
> +			return PTR_ERR(mem);
> +
> +		error = pci_p2pdma_setup_pool(pdev);
>  		if (error)
>  			return error;
> -	}
> +
> +		p2pdma = rcu_dereference_protected(pdev->p2pdma, 1);
> +	} else
> +		mem = &p2pdma->mem[bar];
>  
>  	p2p_pgmap = devm_kzalloc(&pdev->dev, sizeof(*p2p_pgmap), GFP_KERNEL);
> -	if (!p2p_pgmap)
> -		return -ENOMEM;
> +	if (!p2p_pgmap) {
> +		error = -ENOMEM;
> +		goto free_pool;
> +	}
>  
>  	pgmap = &p2p_pgmap->pgmap;
>  	pgmap->range.start = pci_resource_start(pdev, bar) + offset;
> @@ -328,9 +389,7 @@ int pci_p2pdma_add_resource(struct pci_dev *pdev, int bar, size_t size,
>  	pgmap->nr_range = 1;
>  	pgmap->type = MEMORY_DEVICE_PCI_P2PDMA;
>  	pgmap->ops = &p2pdma_pgmap_ops;
> -	p2p_pgmap->mem.owner = &pdev->dev;
> -	p2p_pgmap->mem.bus_offset =
> -		pci_bus_address(pdev, bar) - pci_resource_start(pdev, bar);
> +	p2p_pgmap->mem = mem;
>  
>  	addr = devm_memremap_pages(&pdev->dev, pgmap);
>  	if (IS_ERR(addr)) {
> @@ -343,7 +402,6 @@ int pci_p2pdma_add_resource(struct pci_dev *pdev, int bar, size_t size,
>  	if (error)
>  		goto pages_free;
>  
> -	p2pdma = rcu_dereference_protected(pdev->p2pdma, 1);
>  	error = gen_pool_add_owner(p2pdma->pool, (unsigned long)addr,
>  			pci_bus_address(pdev, bar) + offset,
>  			range_len(&pgmap->range), dev_to_node(&pdev->dev),
> @@ -359,7 +417,10 @@ int pci_p2pdma_add_resource(struct pci_dev *pdev, int bar, size_t size,
>  pages_free:
>  	devm_memunmap_pages(&pdev->dev, pgmap);
>  pgmap_free:
> -	devm_kfree(&pdev->dev, pgmap);
> +	devm_kfree(&pdev->dev, p2p_pgmap);
> +free_pool:
> +	sysfs_remove_group(&pdev->dev.kobj, &p2pmem_group);
> +	gen_pool_destroy(p2pdma->pool);
>  	return error;
>  }
>  EXPORT_SYMBOL_GPL(pci_p2pdma_add_resource);
> @@ -1008,11 +1069,11 @@ void __pci_p2pdma_update_state(struct pci_p2pdma_map_state *state,
>  {
>  	struct pci_p2pdma_pagemap *p2p_pgmap = to_p2p_pgmap(page_pgmap(page));
>  
> -	if (state->mem == &p2p_pgmap->mem)
> +	if (state->mem == p2p_pgmap->mem)
>  		return;
>  
> -	state->mem = &p2p_pgmap->mem;
> -	state->map = pci_p2pdma_map_type(&p2p_pgmap->mem, dev);
> +	state->mem = p2p_pgmap->mem;
> +	state->map = pci_p2pdma_map_type(p2p_pgmap->mem, dev);
>  }
>  
>  /**
> diff --git a/include/linux/pci-p2pdma.h b/include/linux/pci-p2pdma.h
> index eef96636c67e6..888ad7b0c54cf 100644
> --- a/include/linux/pci-p2pdma.h
> +++ b/include/linux/pci-p2pdma.h
> @@ -27,6 +27,7 @@ struct p2pdma_provider {
>  };
>  
>  #ifdef CONFIG_PCI_P2PDMA
> +struct p2pdma_provider *pcim_p2pdma_enable(struct pci_dev *pdev, int bar);
>  int pci_p2pdma_add_resource(struct pci_dev *pdev, int bar, size_t size,
>  		u64 offset);
>  int pci_p2pdma_distance_many(struct pci_dev *provider, struct device **clients,
> @@ -45,6 +46,10 @@ int pci_p2pdma_enable_store(const char *page, struct pci_dev **p2p_dev,
>  ssize_t pci_p2pdma_enable_show(char *page, struct pci_dev *p2p_dev,
>  			       bool use_p2pdma);
>  #else /* CONFIG_PCI_P2PDMA */
> +static inline struct p2pdma_provider *pcim_p2pdma_enable(struct pci_dev *pdev, int bar)
> +{
> +	return ERR_PTR(-EOPNOTSUPP);
> +}
>  static inline int pci_p2pdma_add_resource(struct pci_dev *pdev, int bar,
>  		size_t size, u64 offset)
>  {

