Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DAF4B9DBE5
	for <lists+dri-devel@lfdr.de>; Thu, 25 Sep 2025 09:03:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4064510E84E;
	Thu, 25 Sep 2025 07:03:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="qHutfg7p";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E69F10E84E
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Sep 2025 07:03:20 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 161F540817;
 Thu, 25 Sep 2025 07:03:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 476E0C4CEF4;
 Thu, 25 Sep 2025 07:03:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1758783799;
 bh=IfFjt1sIn89xjUeeoV2zJsvE3bTjSj86lJ2QWvNYz8w=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qHutfg7p0MJiJzKdbXS/d6R3kdEqDhdXcGmgxvkwI4AM6XuKyeIpgR1GSCsEqIGVB
 9ZrAilO0Zj59EMAXR1lQlcpWEMA28nquUz1IKkduHGuS4dyD2OJmp5f3UxncKmQ8+I
 Dp30uxy2wGUYE3Hja5f4XS00BFzuj+WaXq60qYIzodUdV2tvE04uI5a85RPL6mAqR7
 MWKPSQplfkMcH9/nRS03UG60TJBwCq9ZQRhoS60sk8FdhiE0kifJqWTjrMUqN9REZV
 kUzpbXtt2XKNZVaDT/F1inIn9vj+we8Gfm9meFs0BUoq+pahNKDPioVkPIFajbcBnM
 waHnKaEouWGfQ==
Date: Thu, 25 Sep 2025 10:03:14 +0300
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
Message-ID: <20250925070314.GA12165@unreal>
References: <cover.1757589589.git.leon@kernel.org>
 <1e2cb89ea76a92949d06a804e3ab97478e7cacbb.1757589589.git.leon@kernel.org>
 <20250922150032.3e3da410.alex.williamson@redhat.com>
 <20250923150414.GA2608121@nvidia.com>
 <20250923113041.38bee711.alex.williamson@redhat.com>
 <20250923174333.GE2608121@nvidia.com>
 <20250923120932.47df57b2.alex.williamson@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250923120932.47df57b2.alex.williamson@redhat.com>
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

On Tue, Sep 23, 2025 at 12:09:32PM -0600, Alex Williamson wrote:
> On Tue, 23 Sep 2025 14:43:33 -0300
> Jason Gunthorpe <jgg@nvidia.com> wrote:
> 
> > On Tue, Sep 23, 2025 at 11:30:41AM -0600, Alex Williamson wrote:
> > > On Tue, 23 Sep 2025 12:04:14 -0300
> > > Jason Gunthorpe <jgg@nvidia.com> wrote:
> > >   
> > > > On Mon, Sep 22, 2025 at 03:00:32PM -0600, Alex Williamson wrote:  
> > > > > But then later in patch 8/ and again in 10/ why exactly do we cache
> > > > > the provider on the vfio_pci_core_device rather than ask for it on
> > > > > demand from the p2pdma?    
> > > > 
> > > > It makes the most sense if the P2P is activated once during probe(),
> > > > it is just a cheap memory allocation, so no reason not to.
> > > > 
> > > > If you try to do it on-demand then it will require more locking.  
> > > 
> > > I'm only wondering about splitting to an "initialize/setup" function
> > > where providers for each BAR are setup, and a "get provider" interface,
> > > which doesn't really seem to be a hot path anyway.  Batching could
> > > still be done to setup all BAR providers at once.  
> > 
> > I agree it is a weird interface, but it is close to the existing weird
> > interface :\
> 
> Seems like it would help if we just positioned it as a "get provider
> for BAR" function that happens to initialize all the providers on the
> first call, rather than an "enable" function with some strange BAR
> argument and provider return.  pcim_p2pdma_provider(pdev, bar)?
> 
> It would at least make sense to me then to store the provider on the
> vfio_pci_dma_buf object at the time of the get feature call rather than
> vfio_pci_core_init_dev() though.  That would eliminate patch 08/ and
> the inline #ifdefs.

I'll change it now. If "enable" function goes to be "get" function, we
won't need to store anything in vfio_pci_dma_buf too. At the end, we
have exactly two lines "provider = priv->vdev->provider[priv->bar];",
which can easily be changed to be "provider = pcim_p2pdma_provider(priv->vdev->pdev, priv->bar)"

> 
> > > However, the setup isn't really once per probe(), even in the case of a
> > > new driver probing we re-use the previously setup providers.    
> > 
> > It uses devm to call pci_p2pdma_release() which NULL's pdev->p2pdma.
> 
> Ah, right.  So the /* PCI device was "rebound" to the driver */ comment
> is further misleading, a new probe would do a new setup.  Thanks,

I will fix the comment.

Thanks

> 
> Alex
> 
