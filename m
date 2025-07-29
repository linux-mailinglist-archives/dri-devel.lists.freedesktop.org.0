Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38D11B153C2
	for <lists+dri-devel@lfdr.de>; Tue, 29 Jul 2025 21:44:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F84710E2A9;
	Tue, 29 Jul 2025 19:44:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 6C65210E2A9
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Jul 2025 19:44:48 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BA8F71516;
 Tue, 29 Jul 2025 12:44:39 -0700 (PDT)
Received: from [10.57.1.109] (unknown [10.57.1.109])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C2D313F66E;
 Tue, 29 Jul 2025 12:44:43 -0700 (PDT)
Message-ID: <8f912671-f1d9-4f73-9c1d-e39938bfc09f@arm.com>
Date: Tue, 29 Jul 2025 20:44:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/10] vfio/pci: Add dma-buf export support for MMIO
 regions
To: Leon Romanovsky <leon@kernel.org>,
 Alex Williamson <alex.williamson@redhat.com>
Cc: Leon Romanovsky <leonro@nvidia.com>, Christoph Hellwig <hch@lst.de>,
 Jason Gunthorpe <jgg@nvidia.com>, Andrew Morton <akpm@linux-foundation.org>,
 Bjorn Helgaas <bhelgaas@google.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, iommu@lists.linux.dev,
 Jens Axboe <axboe@kernel.dk>, =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?=
 <jglisse@redhat.com>, Joerg Roedel <joro@8bytes.org>, kvm@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, linux-block@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-mm@kvack.org, linux-pci@vger.kernel.org,
 Logan Gunthorpe <logang@deltatee.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Vivek Kasireddy <vivek.kasireddy@intel.com>, Will Deacon <will@kernel.org>
References: <cover.1753274085.git.leonro@nvidia.com>
 <aea452cc27ca9e5169f7279d7b524190c39e7260.1753274085.git.leonro@nvidia.com>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <aea452cc27ca9e5169f7279d7b524190c39e7260.1753274085.git.leonro@nvidia.com>
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

On 2025-07-23 2:00 pm, Leon Romanovsky wrote:
[...]
> +static struct sg_table *
> +vfio_pci_dma_buf_map(struct dma_buf_attachment *attachment,
> +		     enum dma_data_direction dir)
> +{
> +	struct vfio_pci_dma_buf *priv = attachment->dmabuf->priv;
> +	struct p2pdma_provider *provider = priv->vdev->provider;
> +	struct dma_iova_state *state = attachment->priv;
> +	struct phys_vec *phys_vec = &priv->phys_vec;
> +	struct scatterlist *sgl;
> +	struct sg_table *sgt;
> +	dma_addr_t addr;
> +	int ret;
> +
> +	dma_resv_assert_held(priv->dmabuf->resv);
> +
> +	sgt = kzalloc(sizeof(*sgt), GFP_KERNEL);
> +	if (!sgt)
> +		return ERR_PTR(-ENOMEM);
> +
> +	ret = sg_alloc_table(sgt, 1, GFP_KERNEL | __GFP_ZERO);
> +	if (ret)
> +		goto err_kfree_sgt;
> +
> +	sgl = sgt->sgl;
> +
> +	if (!state) {
> +		addr = pci_p2pdma_bus_addr_map(provider, phys_vec->paddr);
> +	} else if (dma_use_iova(state)) {
> +		ret = dma_iova_link(attachment->dev, state, phys_vec->paddr, 0,
> +				    phys_vec->len, dir, DMA_ATTR_SKIP_CPU_SYNC);

The supposed benefits of this API are only for replacing scatterlists 
where multiple disjoint pages are being mapped. In this case with just 
one single contiguous mapping, it is clearly objectively worse to have 
to bounce in and out of the IOMMU layer 3 separate times and store a 
dma_map_state, to achieve the exact same operations that a single call 
to iommu_dma_map_resource() will perform more efficiently and with no 
external state required.

Oh yeah, and mapping MMIO with regular memory attributes (IOMMU_CACHE) 
rather than appropriate ones (IOMMU_MMIO), as this will end up doing, 
isn't guaranteed not to end badly either (e.g. if the system 
interconnect ends up merging consecutive write bursts and exceeding the 
target root port's MPS.)

> +		if (ret)
> +			goto err_free_table;
> +
> +		ret = dma_iova_sync(attachment->dev, state, 0, phys_vec->len);
> +		if (ret)
> +			goto err_unmap_dma;
> +
> +		addr = state->addr;
> +	} else {
> +		addr = dma_map_phys(attachment->dev, phys_vec->paddr,
> +				    phys_vec->len, dir, DMA_ATTR_SKIP_CPU_SYNC);

And again, if the IOMMU is in bypass (the idea of P2P with vfio-noiommu 
simply isn't worth entertaining) then what purpose do you imagine this 
call serves at all, other than to hilariously crash under 
"swiotlb=force"? Even in the case that phys_to_dma(phys_vec->paddr) != 
phys_vec->paddr, in almost all circumstances (both hardware offsets and 
CoCo environments with address-based aliasing), it is more likely than 
not that the latter is still the address you want and the former is 
wrong (and liable to lead to corruption or fatal system errors), because 
MMIO and memory remain fundamentally different things.

AFAICS you're *depending* on this call being an effective no-op, and 
thus only demonstrating that the dma_map_phys() idea is still entirely 
unnecessary.

> +		ret = dma_mapping_error(attachment->dev, addr);
> +		if (ret)
> +			goto err_free_table;
> +	}
> +
> +	fill_sg_entry(sgl, phys_vec->len, addr);
> +	return sgt;
> +
> +err_unmap_dma:
> +	dma_iova_destroy(attachment->dev, state, phys_vec->len, dir,
> +			 DMA_ATTR_SKIP_CPU_SYNC);
> +err_free_table:
> +	sg_free_table(sgt);
> +err_kfree_sgt:
> +	kfree(sgt);
> +	return ERR_PTR(ret);
> +}
> +
> +static void vfio_pci_dma_buf_unmap(struct dma_buf_attachment *attachment,
> +				   struct sg_table *sgt,
> +				   enum dma_data_direction dir)
> +{
> +	struct vfio_pci_dma_buf *priv = attachment->dmabuf->priv;
> +	struct dma_iova_state *state = attachment->priv;
> +	struct scatterlist *sgl;
> +	int i;
> +
> +	if (!state)
> +		; /* Do nothing */
> +	else if (dma_use_iova(state))
> +		dma_iova_destroy(attachment->dev, state, priv->phys_vec.len,
> +				 dir, DMA_ATTR_SKIP_CPU_SYNC);
> +	else
> +		for_each_sgtable_dma_sg(sgt, sgl, i)

The table always has exactly one entry...

Thanks,
Robin.

> +			dma_unmap_phys(attachment->dev, sg_dma_address(sgl),
> +				       sg_dma_len(sgl), dir,
> +				       DMA_ATTR_SKIP_CPU_SYNC);
> +
> +	sg_free_table(sgt);
> +	kfree(sgt);
> +}
