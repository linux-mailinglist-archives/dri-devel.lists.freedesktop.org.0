Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23480BEA897
	for <lists+dri-devel@lfdr.de>; Fri, 17 Oct 2025 18:14:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B64E510EC75;
	Fri, 17 Oct 2025 16:14:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="jTCLpLij";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C85710E14F
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Oct 2025 16:14:04 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 7EC6764789;
 Fri, 17 Oct 2025 16:14:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82A6CC4CEE7;
 Fri, 17 Oct 2025 16:14:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1760717643;
 bh=CFcYtcEk7uP8GckKeqhWU4+P+5/c+ra0lxow6L4SUMs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jTCLpLij/ghgEicXuXTN+FZWe2vozg4SlZDHShFYvfPIUqub9PEm0BZPbrfwhk5Y5
 kHa3fBtd0I8PMX+AkKdag0U4BIzd+49ChSgph58nyWLMOvvlEkwLSjIU2QA34zc5nd
 BpBoDkebgbg0pPisYn/W4PGMd45z0hbP0jVSgkM4MgKyCqfaMb/c3ml+HtbaZZruJK
 9IAS1YwF8RfmI7S0ETdhisl70QdOy43W8iOfuHMtQEZdTi632zsoLdFP1Hd/l02tPB
 yhqVnuCW1LoEbFlWHwImXvx1hZKb3X24VRl34jQQI9Hw9D2yq1wpOpB62Ntmkc5Aj7
 qEnbZ7Op0le6g==
Date: Fri, 17 Oct 2025 19:13:58 +0300
From: Leon Romanovsky <leon@kernel.org>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Alex Williamson <alex.williamson@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, iommu@lists.linux.dev,
 Jens Axboe <axboe@kernel.dk>, Joerg Roedel <joro@8bytes.org>,
 kvm@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-mm@kvack.org,
 linux-pci@vger.kernel.org, Logan Gunthorpe <logang@deltatee.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Robin Murphy <robin.murphy@arm.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Vivek Kasireddy <vivek.kasireddy@intel.com>, Will Deacon <will@kernel.org>
Subject: Re: [PATCH v5 9/9] vfio/pci: Add dma-buf export support for MMIO
 regions
Message-ID: <20251017161358.GC6199@unreal>
References: <cover.1760368250.git.leon@kernel.org>
 <72ecaa13864ca346797e342d23a7929562788148.1760368250.git.leon@kernel.org>
 <20251017130249.GA309181@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251017130249.GA309181@nvidia.com>
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

On Fri, Oct 17, 2025 at 10:02:49AM -0300, Jason Gunthorpe wrote:
> On Mon, Oct 13, 2025 at 06:26:11PM +0300, Leon Romanovsky wrote:
> > +static void dma_ranges_to_p2p_phys(struct vfio_pci_dma_buf *priv,
> > +				   struct vfio_device_feature_dma_buf *dma_buf,
> > +				   struct vfio_region_dma_range *dma_ranges,
> > +				   struct p2pdma_provider *provider)
> > +{
> > +	struct pci_dev *pdev = priv->vdev->pdev;
> > +	phys_addr_t pci_start;
> > +	u32 i;
> > +
> > +	pci_start = pci_resource_start(pdev, dma_buf->region_index);
> > +	for (i = 0; i < dma_buf->nr_ranges; i++) {
> > +		priv->phys_vec[i].len = dma_ranges[i].length;
> > +		priv->phys_vec[i].paddr = pci_start + dma_ranges[i].offset;
> > +		priv->size += priv->phys_vec[i].len;
> > +	}
> 
> This is missing validation, the userspace can pass in any
> length/offset but the resource is of limited size. Like this:
> 
> static int dma_ranges_to_p2p_phys(struct vfio_pci_dma_buf *priv,
> 				  struct vfio_device_feature_dma_buf *dma_buf,
> 				  struct vfio_region_dma_range *dma_ranges,
> 				  struct p2pdma_provider *provider)
> {
> 	struct pci_dev *pdev = priv->vdev->pdev;
> 	phys_addr_t len = pci_resource_len(pdev, dma_buf->region_index);
> 	phys_addr_t pci_start;
> 	phys_addr_t pci_last;
> 	u32 i;
> 
> 	if (!len)
> 		return -EINVAL;
> 	pci_start = pci_resource_start(pdev, dma_buf->region_index);
> 	pci_last = pci_start + len - 1;
> 	for (i = 0; i < dma_buf->nr_ranges; i++) {
> 		phys_addr_t last;
> 
> 		if (!dma_ranges[i].length)
> 			return -EINVAL;
> 
> 		if (check_add_overflow(pci_start, dma_ranges[i].offset,
> 				       &priv->phys_vec[i].paddr) ||
> 		    check_add_overflow(priv->phys_vec[i].paddr,
> 				       dma_ranges[i].length - 1, &last))
> 			return -EOVERFLOW;
> 		if (last > pci_last)
> 			return -EINVAL;
> 
> 		priv->phys_vec[i].len = dma_ranges[i].length;
> 		priv->size += priv->phys_vec[i].len;
> 	}
> 	priv->nr_ranges = dma_buf->nr_ranges;
> 	priv->provider = provider;
> 	return 0;
> }

I have these checks in validate_dmabuf_input(). Do you think that I need
to add extra checks?

Thanks

> 
> Jason
