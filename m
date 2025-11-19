Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B5C1AC6F05B
	for <lists+dri-devel@lfdr.de>; Wed, 19 Nov 2025 14:48:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90D7110E618;
	Wed, 19 Nov 2025 13:48:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="KA20TCoH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A2D910E618
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Nov 2025 13:48:42 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id A17B64064E;
 Wed, 19 Nov 2025 13:48:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92F90C2BCB3;
 Wed, 19 Nov 2025 13:48:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1763560121;
 bh=WBVxdPHFlyOgnD3YarukkHOdXbptm0KrfxkS3OxiyOA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KA20TCoHh4xBpJsET+frUdvFAC1/PD10QEHBCIMaao0WAnseVamH90obusp+eQ5o2
 JrhR8HX77yzaqJbG7RbbqAQs3awsq4Yvi7P4lQEZ99DLZaMLoKH1/O5e8/LLveXrkv
 HCKoHyda54qc27+KsHvuXB6+0wPcCgAO6rsNtdaEMFdpPZjPGtqLRxBnqe3Arlb9EG
 osGef8+spXexQcAOPEgMRnoYG//AXXDg2MNWYqsnZOs0wHsYLRrmAJ/9zE8Pdo+dbS
 CMLK4jt8qhrjL3QY8uNgMZwKArml4umHyJINrVhyQzJ9qdxF59lBOeH32HAdcfhxrX
 lBCpSzaidWhXw==
Date: Wed, 19 Nov 2025 15:48:36 +0200
From: Leon Romanovsky <leon@kernel.org>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Cc: Jason Gunthorpe <jgg@ziepe.ca>, Bjorn Helgaas <bhelgaas@google.com>,
 Logan Gunthorpe <logang@deltatee.com>, Jens Axboe <axboe@kernel.dk>,
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Jonathan Corbet <corbet@lwn.net>,
 Sumit Semwal <sumit.semwal@linaro.org>, Kees Cook <kees@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Ankit Agrawal <ankita@nvidia.com>, Yishai Hadas <yishaih@nvidia.com>,
 Shameer Kolothum <skolothumtho@nvidia.com>,
 Kevin Tian <kevin.tian@intel.com>, Alex Williamson <alex@shazbot.org>,
 Krishnakant Jaju <kjaju@nvidia.com>, Matt Ochs <mochs@nvidia.com>,
 linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-block@vger.kernel.org, iommu@lists.linux.dev,
 linux-mm@kvack.org, linux-doc@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, kvm@vger.kernel.org,
 linux-hardening@vger.kernel.org, Alex Mastro <amastro@fb.com>,
 Nicolin Chen <nicolinc@nvidia.com>
Subject: Re: [Linaro-mm-sig] [PATCH v8 06/11] dma-buf: provide phys_vec to
 scatter-gather mapping routine
Message-ID: <20251119134836.GF18335@unreal>
References: <20251111-dmabuf-vfio-v8-0-fd9aa5df478f@nvidia.com>
 <20251111-dmabuf-vfio-v8-6-fd9aa5df478f@nvidia.com>
 <8a11b605-6ac7-48ac-8f27-22df7072e4ad@amd.com>
 <20251119132511.GK17968@ziepe.ca>
 <69436b2a-108d-4a5a-8025-c94348b74db6@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <69436b2a-108d-4a5a-8025-c94348b74db6@amd.com>
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

On Wed, Nov 19, 2025 at 02:42:18PM +0100, Christian König wrote:
> On 11/19/25 14:25, Jason Gunthorpe wrote:
> > On Wed, Nov 19, 2025 at 02:16:57PM +0100, Christian König wrote:
> >>> +/**
> >>> + * dma_buf_map - Returns the scatterlist table of the attachment from arrays
> >>> + * of physical vectors. This funciton is intended for MMIO memory only.
> >>> + * @attach:	[in]	attachment whose scatterlist is to be returned
> >>> + * @provider:	[in]	p2pdma provider
> >>> + * @phys_vec:	[in]	array of physical vectors
> >>> + * @nr_ranges:	[in]	number of entries in phys_vec array
> >>> + * @size:	[in]	total size of phys_vec
> >>> + * @dir:	[in]	direction of DMA transfer
> >>> + *
> >>> + * Returns sg_table containing the scatterlist to be returned; returns ERR_PTR
> >>> + * on error. May return -EINTR if it is interrupted by a signal.
> >>> + *
> >>> + * On success, the DMA addresses and lengths in the returned scatterlist are
> >>> + * PAGE_SIZE aligned.
> >>> + *
> >>> + * A mapping must be unmapped by using dma_buf_unmap().
> >>> + */
> >>> +struct sg_table *dma_buf_map(struct dma_buf_attachment *attach,
> >>
> >> That is clearly not a good name for this function. We already have overloaded the term *mapping* with something completely different.
> >>
> >>> +			     struct p2pdma_provider *provider,
> >>> +			     struct dma_buf_phys_vec *phys_vec,
> >>> +			     size_t nr_ranges, size_t size,
> >>> +			     enum dma_data_direction dir)
> >>> +{
> >>> +	unsigned int nents, mapped_len = 0;
> >>> +	struct dma_buf_dma *dma;
> >>> +	struct scatterlist *sgl;
> >>> +	dma_addr_t addr;
> >>> +	size_t i;
> >>> +	int ret;
> >>> +
> >>> +	dma_resv_assert_held(attach->dmabuf->resv);
> >>> +
> >>> +	if (WARN_ON(!attach || !attach->dmabuf || !provider))
> >>> +		/* This function is supposed to work on MMIO memory only */
> >>> +		return ERR_PTR(-EINVAL);
> >>> +
> >>> +	dma = kzalloc(sizeof(*dma), GFP_KERNEL);
> >>> +	if (!dma)
> >>> +		return ERR_PTR(-ENOMEM);
> >>> +
> >>> +	switch (pci_p2pdma_map_type(provider, attach->dev)) {
> >>> +	case PCI_P2PDMA_MAP_BUS_ADDR:
> >>> +		/*
> >>> +		 * There is no need in IOVA at all for this flow.
> >>> +		 */
> >>> +		break;
> >>> +	case PCI_P2PDMA_MAP_THRU_HOST_BRIDGE:
> >>> +		dma->state = kzalloc(sizeof(*dma->state), GFP_KERNEL);
> >>> +		if (!dma->state) {
> >>> +			ret = -ENOMEM;
> >>> +			goto err_free_dma;
> >>> +		}
> >>> +
> >>> +		dma_iova_try_alloc(attach->dev, dma->state, 0, size);
> >>
> >> Oh, that is a clear no-go for the core DMA-buf code.
> >>
> >> It's intentionally up to the exporter how to create the DMA
> >> addresses the importer can work with.
> > 
> > I can't fully understand this remark?
> 
> The exporter should be able to decide if it actually wants to use P2P when the transfer has to go through the host bridge (e.g. when IOMMU/bridge routing bits are enabled).
> 
> Thinking more about it exporters can now probably call pci_p2pdma_map_type(provider, attach->dev) before calling this function so that is probably ok.
> 
> >> We could add something like a dma_buf_sg_helper.c or similar and put it in there.
> > 
> > Yes, the intention is this function is an "exporter helper" that an
> > exporter can call if it wants to help generate the scatterlist.
> > 
> > So your "no-go" is just about what file it is in, not anything about
> > how it works?
> 
> Yes, exactly that. Just move it into a separate file somewhere and it's probably good to go as far as I can see.
> 
> But only take that as Acked-by, I would need at least a day (or week) of free time to wrap my head around all the technical details again. And that is something I won't have before January or even later.

If it helps, we can meet at LPC. Jason and/or I will be happy to assist.

Thanks

> 
> Regards,
> Christian.
> 
> > 
> > Thanks,
> > Jason
> 
