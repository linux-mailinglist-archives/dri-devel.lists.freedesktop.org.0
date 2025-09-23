Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D891B96F84
	for <lists+dri-devel@lfdr.de>; Tue, 23 Sep 2025 19:12:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E04310E078;
	Tue, 23 Sep 2025 17:12:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="flQS1hBB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9FCB10E078
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Sep 2025 17:12:35 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id A728460052;
 Tue, 23 Sep 2025 17:12:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7895C4CEF5;
 Tue, 23 Sep 2025 17:12:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1758647554;
 bh=gmK1CGGOGWIE5mxCSSz01jl9806+Hkknw/PF7Rft5eg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=flQS1hBBI4YVkOhHIOLPDHNMtlCkyfUNIFD9Y3j56A129eJQ7ulgbOQABWCzap9Hj
 rl/VZtmwxWaxs1PMRUvTjPUNwlEZn88V/RLG5Kuc+XdNGA5TeIjqOIi+B4X9/FCt4c
 Qx+OujTVF/ZwyQKONCRLVjz52uX0o7GV547cRdBjsiAgj+ycng1QAEkqJ6m+YLzWAq
 DCNZoSbiGk6YER29JJC0HRMAOqBwNSUqMZUTv1sjBpzIQQgtNOUDKZTBiXF4eLwe8A
 xvmArCpm9L4VMxDuuM+3Hd13ks3PqY62OM41EKtcVNBQBVyEfRahPW/H/CtiWATpbl
 ddW7gMC2jEh9A==
Date: Tue, 23 Sep 2025 20:12:28 +0300
From: Leon Romanovsky <leon@kernel.org>
To: Alex Williamson <alex.williamson@redhat.com>
Cc: Jason Gunthorpe <jgg@nvidia.com>,
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
Subject: Re: [PATCH v2 03/10] PCI/P2PDMA: Refactor to separate core P2P
 functionality from memory allocation
Message-ID: <20250923171228.GL10800@unreal>
References: <cover.1757589589.git.leon@kernel.org>
 <1e2cb89ea76a92949d06a804e3ab97478e7cacbb.1757589589.git.leon@kernel.org>
 <20250922150032.3e3da410.alex.williamson@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250922150032.3e3da410.alex.williamson@redhat.com>
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

On Mon, Sep 22, 2025 at 03:00:32PM -0600, Alex Williamson wrote:
> On Thu, 11 Sep 2025 14:33:07 +0300
> Leon Romanovsky <leon@kernel.org> wrote:
> 
> > From: Leon Romanovsky <leonro@nvidia.com>
> > 
> > Refactor the PCI P2PDMA subsystem to separate the core peer-to-peer DMA
> > functionality from the optional memory allocation layer. This creates a
> > two-tier architecture:
> > 
> > The core layer provides P2P mapping functionality for physical addresses
> > based on PCI device MMIO BARs and integrates with the DMA API for
> > mapping operations. This layer is required for all P2PDMA users.
> > 
> > The optional upper layer provides memory allocation capabilities
> > including gen_pool allocator, struct page support, and sysfs interface
> > for user space access.
> > 
> > This separation allows subsystems like VFIO to use only the core P2P
> > mapping functionality without the overhead of memory allocation features
> > they don't need. The core functionality is now available through the
> > new pci_p2pdma_enable() function that returns a p2pdma_provider
> > structure.
> > 
> > Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
> > ---
> >  drivers/pci/p2pdma.c       | 129 +++++++++++++++++++++++++++----------
> >  include/linux/pci-p2pdma.h |   5 ++
> >  2 files changed, 100 insertions(+), 34 deletions(-)

<...>

> > -static int pci_p2pdma_setup(struct pci_dev *pdev)
> > +/**
> > + * pcim_p2pdma_enable - Enable peer-to-peer DMA support for a PCI device
> > + * @pdev: The PCI device to enable P2PDMA for
> > + * @bar: BAR index to get provider
> > + *
> > + * This function initializes the peer-to-peer DMA infrastructure for a PCI
> > + * device. It allocates and sets up the necessary data structures to support
> > + * P2PDMA operations, including mapping type tracking.
> > + */
> > +struct p2pdma_provider *pcim_p2pdma_enable(struct pci_dev *pdev, int bar)
> >  {
> > -	int error = -ENOMEM;
> >  	struct pci_p2pdma *p2p;
> > +	int i, ret;
> > +
> > +	p2p = rcu_dereference_protected(pdev->p2pdma, 1);
> > +	if (p2p)
> > +		/* PCI device was "rebound" to the driver */
> > +		return &p2p->mem[bar];
> >  
> 
> This seems like two separate functions rolled into one, an 'initialize
> providers' and a 'get provider for BAR'.  The comment above even makes
> it sound like only a driver re-probing a device would encounter this
> branch, but the use case later in vfio-pci shows it to be the common
> case to iterate BARs for a device.
> 
> But then later in patch 8/ and again in 10/ why exactly do we cache
> the provider on the vfio_pci_core_device rather than ask for it on
> demand from the p2pdma?

In addition to what Jason said about locking. The whole p2pdma.c is
written with assumption that "pdev->p2pdma" pointer is assigned only
once during PCI device lifetime. For example, see how sysfs files
are exposed and accessed in p2pdma.c.

Once you initialize p2pdma, it is much easier to initialize all BARs at
the same time.

Thanks
