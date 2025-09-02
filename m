Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA8C7B40196
	for <lists+dri-devel@lfdr.de>; Tue,  2 Sep 2025 14:58:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 003BF10E6D4;
	Tue,  2 Sep 2025 12:58:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Y03rLipQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A1E410E6D4
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Sep 2025 12:58:30 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id BD99743995;
 Tue,  2 Sep 2025 12:58:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08555C4CEED;
 Tue,  2 Sep 2025 12:58:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1756817909;
 bh=CM1gzdTND9tJKwW5aJTGTYza7PZbOeFeI+0kiHDsfk0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Y03rLipQ172HNCWdzae1SvWeUKEZCuyy4iT/sxqmRUG2Mk9XAm0JD2Cf43Q4ccXI4
 vJ3zCW+7bhV2I/8W3AQ/zj+cPA9rZhBtVccOf2Syvu2xP3GZZOcRUzTwD1l9Dszm61
 coTmrjtssASLghJ0YobZBbn3b5yvo1gmHUuMYKl3N+eOUDvW9dLkEd42uz6ExoscbL
 AN9nGwSWGJAg2aXnrk/T8mIOnh8SJFTLZoRnFwoAw9p/ZVbj1um54ETkG1UmVJ0yaX
 k1mi0ufFXvprbr0GmTrnZJZPMNtSonfXc/UWWvtDhkzWmzN/ZJ+J57M3aRwqpyvkrT
 ePb8jIU/SceyA==
Date: Tue, 2 Sep 2025 15:58:24 +0300
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
Subject: Re: [PATCH v1 08/10] vfio/pci: Enable peer-to-peer DMA transactions
 by default
Message-ID: <20250902125824.GH10073@unreal>
References: <cover.1754311439.git.leon@kernel.org>
 <edb2ec654fc27ba8f73695382ab0a029f18422b5.1754311439.git.leon@kernel.org>
 <20250806160201.2b72e7a0.alex.williamson@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250806160201.2b72e7a0.alex.williamson@redhat.com>
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

On Wed, Aug 06, 2025 at 04:02:01PM -0600, Alex Williamson wrote:
> On Mon,  4 Aug 2025 16:00:43 +0300
> Leon Romanovsky <leon@kernel.org> wrote:
> 
> > From: Leon Romanovsky <leonro@nvidia.com>
> > 
> > Make sure that all VFIO PCI devices have peer-to-peer capabilities
> > enables, so we would be able to export their MMIO memory through DMABUF,
> > 
> > Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
> > ---
> >  drivers/vfio/pci/vfio_pci_core.c | 4 ++++
> >  include/linux/vfio_pci_core.h    | 1 +
> >  2 files changed, 5 insertions(+)
> > 
> > diff --git a/drivers/vfio/pci/vfio_pci_core.c b/drivers/vfio/pci/vfio_pci_core.c
> > index 31bdb9110cc0f..df9a32d3deac9 100644
> > --- a/drivers/vfio/pci/vfio_pci_core.c
> > +++ b/drivers/vfio/pci/vfio_pci_core.c
> > @@ -28,6 +28,7 @@
> >  #include <linux/nospec.h>
> >  #include <linux/sched/mm.h>
> >  #include <linux/iommufd.h>
> > +#include <linux/pci-p2pdma.h>
> >  #if IS_ENABLED(CONFIG_EEH)
> >  #include <asm/eeh.h>
> >  #endif
> > @@ -2088,6 +2089,9 @@ int vfio_pci_core_init_dev(struct vfio_device *core_vdev)
> >  	INIT_LIST_HEAD(&vdev->dummy_resources_list);
> >  	INIT_LIST_HEAD(&vdev->ioeventfds_list);
> >  	INIT_LIST_HEAD(&vdev->sriov_pfs_item);
> > +	vdev->provider = pci_p2pdma_enable(vdev->pdev);
> > +	if (IS_ERR(vdev->provider))
> > +		return PTR_ERR(vdev->provider);
> 
> I think this just made all vfio-pci drivers functionally dependent on
> CONFIG_PCI_P2PDMA.  Seems at best exporting a dma-buf should be
> restricted if this fails.  Thanks,

It is temporary solution in next patch "vfio/pci: Add dma-buf export
support for MMIO regions", the strict ifdef is added.

  2107 #ifdef CONFIG_VFIO_PCI_DMABUF
  2108         vdev->provider = pci_p2pdma_enable(vdev->pdev);
  2109         if (IS_ERR(vdev->provider))
  2110                 return PTR_ERR(vdev->provider);
  2111
  2112         INIT_LIST_HEAD(&vdev->dmabufs);
  2113 #endif

I will split "vfio/pci: Add dma-buf export ..." patch to introduce CONFIG_VFIO_PCI_DMABUF
before this "vfio/pci: Enable peer-to-peer ..." patch.

Thanks

> 
> Alex
> 
> >  	init_rwsem(&vdev->memory_lock);
> >  	xa_init(&vdev->ctx);
> >  
> > diff --git a/include/linux/vfio_pci_core.h b/include/linux/vfio_pci_core.h
> > index fbb472dd99b36..b017fae251811 100644
> > --- a/include/linux/vfio_pci_core.h
> > +++ b/include/linux/vfio_pci_core.h
> > @@ -94,6 +94,7 @@ struct vfio_pci_core_device {
> >  	struct vfio_pci_core_device	*sriov_pf_core_dev;
> >  	struct notifier_block	nb;
> >  	struct rw_semaphore	memory_lock;
> > +	struct p2pdma_provider  *provider;
> >  };
> >  
> >  /* Will be exported for vfio pci drivers usage */
> 
