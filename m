Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 655E4B56FCE
	for <lists+dri-devel@lfdr.de>; Mon, 15 Sep 2025 07:48:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C807510E2AD;
	Mon, 15 Sep 2025 05:48:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="nHe7Ty6+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4F9510E2AD
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Sep 2025 05:48:30 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 664E643F68;
 Mon, 15 Sep 2025 05:48:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9696EC4CEF1;
 Mon, 15 Sep 2025 05:48:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1757915310;
 bh=pNhpXvcF7LKn5UVncvyxPjpBkffgzOi8e5YEIYnOU1E=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=nHe7Ty6+c/JGvDY+UydwDMZNts0Mvoe5CmZXEM3wRbXlJQZsiKQbiHX1dqED8BM6L
 jhMyqCWP4HV33158JPyukMw9azmtNrGpkymRgEWzH8txAsk0rOblpfGqGH9ecTIJff
 SsLxSOkvzP5SEsR+y+RlPv8/wUQ9v3p6CHq91exxQSTUKjsxYQ6lnV1GyfIF3fLnn7
 aD6U1ucW6cOBHuGB2utJFKkQvvAjc/DWH2//axsYKrHMDRKhgk/Ut1ZqFbNUGkItPt
 mky2sisAv2UghibJpCApHoRxj04wcBuUhqn0dWEmz2sHkq/6x1znCKDKs3Y1Qa1pZc
 pNH0C9osgWH6A==
Date: Sat, 13 Sep 2025 13:19:33 +0300
From: Leon Romanovsky <leon@kernel.org>
To: Alex Mastro <amastro@fb.com>
Cc: Alex Williamson <alex.williamson@redhat.com>,
 Jason Gunthorpe <jgg@nvidia.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Christoph Hellwig <hch@lst.de>, dri-devel@lists.freedesktop.org,
 iommu@lists.linux.dev, Jens Axboe <axboe@kernel.dk>,
 Joerg Roedel <joro@8bytes.org>, kvm@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, linux-block@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-mm@kvack.org, linux-pci@vger.kernel.org,
 Logan Gunthorpe <logang@deltatee.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Robin Murphy <robin.murphy@arm.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Vivek Kasireddy <vivek.kasireddy@intel.com>, Will Deacon <will@kernel.org>
Subject: Re: [PATCH v1 10/10] vfio/pci: Add dma-buf export support for MMIO
 regions
Message-ID: <20250913101933.GW341237@unreal>
References: <cover.1754311439.git.leon@kernel.org>
 <5e043d8b95627441db6156e7f15e6e1658e9d537.1754311439.git.leon@kernel.org>
 <aMRsoUx/NH/Dspm9@devgpu015.cco6.facebook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aMRsoUx/NH/Dspm9@devgpu015.cco6.facebook.com>
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

On Fri, Sep 12, 2025 at 11:55:29AM -0700, Alex Mastro wrote:
> On Mon, Aug 04, 2025 at 04:00:45PM +0300, Leon Romanovsky wrote:
> > +static void dma_ranges_to_p2p_phys(struct vfio_pci_dma_buf *priv,
> > +				   struct vfio_device_feature_dma_buf *dma_buf,
> > +				   struct vfio_region_dma_range *dma_ranges)
> > +{
> > +	struct pci_dev *pdev = priv->vdev->pdev;
> > +	phys_addr_t pci_start;
> > +	int i;
> > +
> > +	pci_start = pci_resource_start(pdev, dma_buf->region_index);
> > +	for (i = 0; i < dma_buf->nr_ranges; i++) {
> > +		priv->phys_vec[i].len = dma_ranges[i].length;
> > +		priv->phys_vec[i].paddr += pci_start + dma_ranges[i].offset;
> 
> Is the intent really to += paddr? I would have expected a plain assignment.

In this specific case, there is no difference, because phys_vec is
initialized to 0, but It needs to be "=" and not "+=".

> 
> > +		priv->size += priv->phys_vec[i].len;
> > +	}
> > +	priv->nr_ranges = dma_buf->nr_ranges;
> > +}
> 
> ...
> 
> > +	priv->phys_vec = kcalloc(get_dma_buf.nr_ranges, sizeof(*priv->phys_vec),
> > +				 GFP_KERNEL);
> > +	if (!priv->phys_vec) {
> > +		ret = -ENOMEM;
> > +		goto err_free_priv;
> > +	}
> > +
> > +	priv->vdev = vdev;
> > +	dma_ranges_to_p2p_phys(priv, &get_dma_buf, dma_ranges);
> 
