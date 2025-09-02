Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AFAFB3FD4F
	for <lists+dri-devel@lfdr.de>; Tue,  2 Sep 2025 13:07:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1F5110E1BE;
	Tue,  2 Sep 2025 11:06:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="luXQtemq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD87210E1BE
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Sep 2025 11:06:58 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id B389260206;
 Tue,  2 Sep 2025 11:06:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D67BC4CEED;
 Tue,  2 Sep 2025 11:06:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1756811217;
 bh=hCa1C3d5MBR18h+mVpk4RAM474rjo1/g4TQSzEy0Gzo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=luXQtemqwauDCW1OGofW7KOn0Ed3TXz+7wSyh4Rq/4C4pBNfrCav73O7nhlQqKsu9
 pJwS6fgD10XM5MWzc2V32cauwX2xcs5uKtg2Bn+xWgyC8SmOfVZ8jKdythn+ZO4vAa
 0h7EOGiI+UMeKypfX8GCyk9wrCAP4tCX2z8kMskVDMEaLSOSdX6db0uWHaJchKjybu
 MaLbWwVqK1itWBWz4FOiOlTEHChtIjiBEjBS0WHuFG4wArCchdxmDkRdChfk7RgGoF
 PbQcn5XJw0e6Ezn8C5XZTAc61l/+qt/LvKdGUrn6ovVC7JKrzqR3GHSc85H+bG5dhG
 nrqyYFGPfwuJg==
Date: Tue, 2 Sep 2025 14:06:51 +0300
From: Leon Romanovsky <leon@kernel.org>
To: Alex Williamson <alex.williamson@redhat.com>
Cc: Jason Gunthorpe <jgg@nvidia.com>,
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
Subject: Re: [PATCH v1 01/10] PCI/P2PDMA: Remove redundant bus_offset from
 map state
Message-ID: <20250902110651.GF10073@unreal>
References: <cover.1754311439.git.leon@kernel.org>
 <c9b6237964b9606418af400bb6bec5178fcffff2.1754311439.git.leon@kernel.org>
 <20250806145825.2654ee59.alex.williamson@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250806145825.2654ee59.alex.williamson@redhat.com>
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

On Wed, Aug 06, 2025 at 02:58:25PM -0600, Alex Williamson wrote:
> On Mon,  4 Aug 2025 16:00:36 +0300
> Leon Romanovsky <leon@kernel.org> wrote:
> 
> > From: Leon Romanovsky <leonro@nvidia.com>
> > 
> > Remove the bus_off field from pci_p2pdma_map_state since it duplicates
> > information already available in the pgmap structure. The bus_offset
> > is only used in one location (pci_p2pdma_bus_addr_map) and is always
> > identical to pgmap->bus_offset.
> > 
> > Reviewed-by: Christoph Hellwig <hch@lst.de>
> > Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> > Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
> > ---
> >  drivers/pci/p2pdma.c       | 1 -
> >  include/linux/pci-p2pdma.h | 3 +--
> >  2 files changed, 1 insertion(+), 3 deletions(-)
> > 
> > diff --git a/drivers/pci/p2pdma.c b/drivers/pci/p2pdma.c
> > index da5657a020074..274bb7bcc0bc5 100644
> > --- a/drivers/pci/p2pdma.c
> > +++ b/drivers/pci/p2pdma.c
> > @@ -1009,7 +1009,6 @@ void __pci_p2pdma_update_state(struct pci_p2pdma_map_state *state,
> >  {
> >  	state->pgmap = page_pgmap(page);
> >  	state->map = pci_p2pdma_map_type(state->pgmap, dev);
> > -	state->bus_off = to_p2p_pgmap(state->pgmap)->bus_offset;
> >  }
> >  
> >  /**
> > diff --git a/include/linux/pci-p2pdma.h b/include/linux/pci-p2pdma.h
> > index 075c20b161d98..b502fc8b49bf9 100644
> > --- a/include/linux/pci-p2pdma.h
> > +++ b/include/linux/pci-p2pdma.h
> > @@ -146,7 +146,6 @@ enum pci_p2pdma_map_type {
> >  struct pci_p2pdma_map_state {
> >  	struct dev_pagemap *pgmap;
> >  	enum pci_p2pdma_map_type map;
> > -	u64 bus_off;
> >  };
> >  
> >  /* helper for pci_p2pdma_state(), do not use directly */
> > @@ -186,7 +185,7 @@ static inline dma_addr_t
> >  pci_p2pdma_bus_addr_map(struct pci_p2pdma_map_state *state, phys_addr_t paddr)
> >  {
> >  	WARN_ON_ONCE(state->map != PCI_P2PDMA_MAP_BUS_ADDR);
> > -	return paddr + state->bus_off;
> > +	return paddr + to_p2p_pgmap(state->pgmap)->bus_offsetf;
> >  }
> >  
> >  #endif /* _LINUX_PCI_P2P_H */

Sorry for long time to reply, I waited to see what is going on with DMA
phys_vec basic series and together with my summer vacation, it took a
while.

> 
> Looks like you're relying on this bogus code getting resolved in the
> next patch...
> 
> In file included from kernel/dma/direct.c:16:
> ./include/linux/pci-p2pdma.h: In function ‘pci_p2pdma_bus_addr_map’:
> ./include/linux/pci-p2pdma.h:188:24: error: implicit declaration of function ‘to_p2p_pgmap’ [-Wimplicit-function-declaration]
>   188 |         return paddr + to_p2p_pgmap(state->pgmap)->bus_offsetf;
>       |                        ^~~~~~~~~~~~
> ./include/linux/pci-p2pdma.h:188:50: error: invalid type argument of ‘->’ (have ‘int’)
>   188 |         return paddr + to_p2p_pgmap(state->pgmap)->bus_offsetf;
>       |                                                  ^~
> ./include/linux/pci-p2pdma.h:189:1: error: control reaches end of non-void function [-Werror=return-type]
>   189 | }
>       | ^
> 
> to_p2p_pgmap() is a static function and struct pci_p2pdma_pagemap
> doesn't have a bus_offsetf member.  Thanks,

You are right, probably the best way to fix the error is simply squash
this change into the next patch.

Thanks



> 
> Alex
> 
