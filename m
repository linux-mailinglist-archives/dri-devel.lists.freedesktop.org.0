Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32A4CB12DDA
	for <lists+dri-devel@lfdr.de>; Sun, 27 Jul 2025 08:16:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C9B010E2F4;
	Sun, 27 Jul 2025 06:16:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="p0n3rAFd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6851B10E2F4
 for <dri-devel@lists.freedesktop.org>; Sun, 27 Jul 2025 06:16:22 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id EC65FA5229C;
 Sun, 27 Jul 2025 06:16:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7EC05C4CEEB;
 Sun, 27 Jul 2025 06:16:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1753596980;
 bh=uyb+7FyuIzMo0UI+mEQEGNm9qjuMtb30fpmryEwM5AA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=p0n3rAFdvPX8SSmrmPGbM3OFcMaPV5tlPd6lSBHW0nfQvfLr5t05u9i0xY+PlQRlr
 RYRm6L/3T+8Yzum1IOO6FuEwCg9bbaROc1fI3BeUrhEcwJTtjTLXnFoEogHoVbqEWr
 n+53AqEFJ1sK6ggO0K644GUqZ8bAkBv9+wjSNvXCqhTOcgOBy3alEhY5GPckrM5VkG
 mwgn4GAdZbM+j8wVP7nsOAB3eS+56hTYprqNgJDscfKHaMRs02RwpMr8LhZDxLDbH9
 mWVU9OyNjSvCkRiurpDskSoZ4dWfvIoXZCW2ZJFAR+xqCkxl3ItEHmgpvoKuBPLlou
 Yij/pATng8pAw==
Date: Sun, 27 Jul 2025 09:16:15 +0300
From: Leon Romanovsky <leon@kernel.org>
To: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
Cc: Alex Williamson <alex.williamson@redhat.com>,
 Christoph Hellwig <hch@lst.de>, Jason Gunthorpe <jgg@nvidia.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "iommu@lists.linux.dev" <iommu@lists.linux.dev>,
 Jens Axboe <axboe@kernel.dk>,
 =?iso-8859-1?B?Suly9G1l?= Glisse <jglisse@redhat.com>,
 Joerg Roedel <joro@8bytes.org>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
 Logan Gunthorpe <logang@deltatee.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Robin Murphy <robin.murphy@arm.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, Will Deacon <will@kernel.org>
Subject: Re: [PATCH 10/10] vfio/pci: Add dma-buf export support for MMIO
 regions
Message-ID: <20250727061615.GW402218@unreal>
References: <cover.1753274085.git.leonro@nvidia.com>
 <aea452cc27ca9e5169f7279d7b524190c39e7260.1753274085.git.leonro@nvidia.com>
 <IA0PR11MB7185E487736B8B4CD70600DEF85EA@IA0PR11MB7185.namprd11.prod.outlook.com>
 <20250724054443.GP402218@unreal>
 <IA0PR11MB71855A080F43E4D657A70311F859A@IA0PR11MB7185.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <IA0PR11MB71855A080F43E4D657A70311F859A@IA0PR11MB7185.namprd11.prod.outlook.com>
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

On Fri, Jul 25, 2025 at 05:34:40AM +0000, Kasireddy, Vivek wrote:
> Hi Leon,
> 
> > Subject: Re: [PATCH 10/10] vfio/pci: Add dma-buf export support for MMIO
> > regions
> > 
> > > >
> > > > From: Leon Romanovsky <leonro@nvidia.com>
> > > >
> > > > Add support for exporting PCI device MMIO regions through dma-buf,
> > > > enabling safe sharing of non-struct page memory with controlled
> > > > lifetime management. This allows RDMA and other subsystems to
> > import
> > > > dma-buf FDs and build them into memory regions for PCI P2P
> > operations.
> > > >
> > > > The implementation provides a revocable attachment mechanism using
> > > > dma-buf move operations. MMIO regions are normally pinned as BARs
> > > > don't change physical addresses, but access is revoked when the VFIO
> > > > device is closed or a PCI reset is issued. This ensures kernel
> > > > self-defense against potentially hostile userspace.
> > > >
> > > > Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> > > > Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
> > > > Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
> > > > ---
> > > >  drivers/vfio/pci/Kconfig           |  20 ++
> > > >  drivers/vfio/pci/Makefile          |   2 +
> > > >  drivers/vfio/pci/vfio_pci_config.c |  22 +-
> > > >  drivers/vfio/pci/vfio_pci_core.c   |  25 ++-
> > > >  drivers/vfio/pci/vfio_pci_dmabuf.c | 321
> > +++++++++++++++++++++++++++++
> > > >  drivers/vfio/pci/vfio_pci_priv.h   |  23 +++
> > > >  include/linux/dma-buf.h            |   1 +
> > > >  include/linux/vfio_pci_core.h      |   3 +
> > > >  include/uapi/linux/vfio.h          |  19 ++
> > > >  9 files changed, 431 insertions(+), 5 deletions(-)
> > > >  create mode 100644 drivers/vfio/pci/vfio_pci_dmabuf.c
> > 
> > <...>
> > 
> > > > +static int validate_dmabuf_input(struct vfio_pci_core_device *vdev,
> > > > +				 struct vfio_device_feature_dma_buf
> > *dma_buf)
> > > > +{
> > > > +	struct pci_dev *pdev = vdev->pdev;
> > > > +	u32 bar = dma_buf->region_index;
> > > > +	u64 offset = dma_buf->offset;
> > > > +	u64 len = dma_buf->length;
> > > > +	resource_size_t bar_size;
> > > > +	u64 sum;
> > > > +
> > > > +	/*
> > > > +	 * For PCI the region_index is the BAR number like  everything else.
> > > > +	 */
> > > > +	if (bar >= VFIO_PCI_ROM_REGION_INDEX)
> > > > +		return -ENODEV;
> > 
> > <...>
> > 
> > > > +/**
> > > > + * Upon VFIO_DEVICE_FEATURE_GET create a dma_buf fd for the
> > > > + * regions selected.
> > > > + *
> > > > + * open_flags are the typical flags passed to open(2), eg O_RDWR,
> > > > O_CLOEXEC,
> > > > + * etc. offset/length specify a slice of the region to create the dmabuf
> > from.
> > > > + * nr_ranges is the total number of (P2P DMA) ranges that comprise the
> > > > dmabuf.
> > > Any particular reason why you dropped the option (nr_ranges) of creating
> > a
> > > single dmabuf from multiple ranges of an MMIO region?
> > 
> > I did it for two reasons. First, I wanted to simplify the code in order
> > to speed-up discussion over the patchset itself. Second, I failed to
> > find justification for need of multiple ranges, as the number of BARs
> > are limited by VFIO_PCI_ROM_REGION_INDEX (6) and same functionality
> > can be achieved by multiple calls to DMABUF import.
> I don't think the same functionality can be achieved by multiple calls to
> dmabuf import. AFAIU, a dmabuf (as of today) is backed by a SGL that can
> have multiple entries because it represents a scattered buffer (multiple
> non-contiguous entries in System RAM or an MMIO region). 

I don't know all the reasons why SG was chosen, but one of the main
reasons is that DMA SG API was the only one possible way to handle p2p
transfers (peer2peer flag).


> But in this patch you are constraining it such that only one entry associated with a
> buffer would be included, which effectively means that we cannot create
> a dmabuf to represent scattered buffers (located in a single MMIO region
> such as VRAM or other device memory) anymore. 

Yes

> 
> > 
> > >
> > > Restricting the dmabuf to a single range (or having to create multiple
> > dmabufs
> > > to represent multiple regions/ranges associated with a single scattered
> > buffer)
> > > would be very limiting and may not work in all cases. For instance, in my
> > use-case,
> > > I am trying to share a large (4k mode) framebuffer (FB) located in GPU's
> > VRAM
> > > between two (p2p compatible) GPU devices. And, this would probably not
> > work
> > > given that allocating a large contiguous FB (nr_ranges = 1) in VRAM may
> > not be
> > > feasible when there is memory pressure.
> > 
> > Can you please help me and point to the place in the code where this can
> > fail?
> > I'm probably missing something basic as there are no large allocations
> > in the current patchset.
> Sorry, I was not very clear. What I meant is that it is not prudent to assume that
> there will only be one range associated with an MMIO region which we need to
> consider while creating a dmabuf. And, I was pointing out my use-case as an
> example where vfio-pci needs to create a dmabuf for a large buffer (FB) that
> would likely be scattered (and not contiguous) in an MMIO region (such as VRAM).
> 
> Let me further explain with my use-case. Here is a link to my Qemu-based test:
> https://gitlab.freedesktop.org/Vivek/qemu/-/commit/b2bdb16d9cfaf55384c95b1f060f175ad1c89e95#81dc845f0babf39649c4e086e173375614111b4a_29_46

Ohh, thanks. I'll add nr_ranges in next version. I see that you are
using same region_index for all ranges and this is how I would like to
keep it: "multiple nr_ranges, same region_index".

Thanks
