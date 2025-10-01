Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 75B42BB0342
	for <lists+dri-devel@lfdr.de>; Wed, 01 Oct 2025 13:39:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F3E610E34E;
	Wed,  1 Oct 2025 11:39:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="hyfhWXjK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8916D10E34E
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Oct 2025 11:39:43 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id B93506062C;
 Wed,  1 Oct 2025 11:39:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB4B8C4CEF4;
 Wed,  1 Oct 2025 11:39:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1759318782;
 bh=Ezy7+mtT4eps9wTpBlbZkP1mFfCZBHTp5E+V6UHQD4c=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=hyfhWXjKKeqTsPAKqst9VMRZTuHnr79Sn85JR9oApnhJZe1TO5oXMimv1OZ2K5t1Q
 9MiMpANH+0eOS4bcbwboljFqvrlf7T7uAAqpI3hYX8SgDpEKW89XvVN/UZ5DYJEoku
 FCsdu0jIgr5dBxYfu2TGJvAqsoQRkfMXMl/1F9lyU95/QyzDKaMdhpvL1V7Ya/B2mh
 pfedbt0u93fTYkQVaxWkIHD9fK5BbrTidNe/CqVFgP1WMiwVDvBVcc7cf3aq3rnWzp
 eISxrrXcYtNF0j6R+nLIOAcxLwM1v6bQ7c0J8gD109M3HZIzW3eQE3Urg+TrWFUG6k
 2FEfVcfX3pxjQ==
Date: Wed, 1 Oct 2025 14:39:37 +0300
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
Subject: Re: [PATCH v4 07/10] vfio/pci: Add dma-buf export config for MMIO
 regions
Message-ID: <20251001113937.GH324804@unreal>
References: <cover.1759070796.git.leon@kernel.org>
 <b1b44823f93fd9e7fa73dc165141d716cb74fa90.1759070796.git.leon@kernel.org>
 <20250929151740.21f001e3.alex.williamson@redhat.com>
 <20250930075748.GF324804@unreal>
 <20250930100758.1605d5a5.alex.williamson@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250930100758.1605d5a5.alex.williamson@redhat.com>
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

On Tue, Sep 30, 2025 at 10:07:58AM -0600, Alex Williamson wrote:
> On Tue, 30 Sep 2025 10:57:48 +0300
> Leon Romanovsky <leon@kernel.org> wrote:
> 
> > On Mon, Sep 29, 2025 at 03:17:40PM -0600, Alex Williamson wrote:
> > > On Sun, 28 Sep 2025 17:50:17 +0300
> > > Leon Romanovsky <leon@kernel.org> wrote:
> > >   
> > > > From: Leon Romanovsky <leonro@nvidia.com>
> > > > 
> > > > Add new kernel config which indicates support for dma-buf export
> > > > of MMIO regions, which implementation is provided in next patches.
> > > > 
> > > > Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
> > > > ---
> > > >  drivers/vfio/pci/Kconfig | 20 ++++++++++++++++++++
> > > >  1 file changed, 20 insertions(+)
> > > > 
> > > > diff --git a/drivers/vfio/pci/Kconfig b/drivers/vfio/pci/Kconfig
> > > > index 2b0172f54665..55ae888bf26a 100644
> > > > --- a/drivers/vfio/pci/Kconfig
> > > > +++ b/drivers/vfio/pci/Kconfig
> > > > @@ -55,6 +55,26 @@ config VFIO_PCI_ZDEV_KVM
> > > >  
> > > >  	  To enable s390x KVM vfio-pci extensions, say Y.
> > > >  
> > > > +config VFIO_PCI_DMABUF
> > > > +	bool "VFIO PCI extensions for DMA-BUF"
> > > > +	depends on VFIO_PCI_CORE
> > > > +	depends on PCI_P2PDMA && DMA_SHARED_BUFFER
> > > > +	default y
> > > > +	help
> > > > +	  Enable support for VFIO PCI extensions that allow exporting
> > > > +	  device MMIO regions as DMA-BUFs for peer devices to access via
> > > > +	  peer-to-peer (P2P) DMA.
> > > > +
> > > > +	  This feature enables a VFIO-managed PCI device to export a portion
> > > > +	  of its MMIO BAR as a DMA-BUF file descriptor, which can be passed
> > > > +	  to other userspace drivers or kernel subsystems capable of
> > > > +	  initiating DMA to that region.
> > > > +
> > > > +	  Say Y here if you want to enable VFIO DMABUF-based MMIO export
> > > > +	  support for peer-to-peer DMA use cases.
> > > > +
> > > > +	  If unsure, say N.
> > > > +
> > > >  source "drivers/vfio/pci/mlx5/Kconfig"
> > > >  
> > > >  source "drivers/vfio/pci/hisilicon/Kconfig"  
> > > 
> > > This is only necessary if we think there's a need to build a kernel with
> > > P2PDMA and VFIO_PCI, but not VFIO_PCI_DMABUF.  Does that need really
> > > exist?  
> > 
> > It is used to filter build of vfio_pci_dmabuf.c - drivers/vfio/pci/Makefile:
> > vfio-pci-core-$(CONFIG_VFIO_PCI_DMABUF) += vfio_pci_dmabuf.o
> 
> Maybe my question of whether it needs to exist at all is too broad.
> Does it need to be a user visible Kconfig option?  Where do we see the
> need to preclude this feature from vfio-pci if the dependencies are
> enabled?

The dependencies are for the platform and not for the devices. For
example, hisilicon device mentioned in other email doesn't support
p2p, but the platform most likely support.

I don't have strong feelings about this config and at least for our use
case will always be enabled. I can hide it from the users.

> 
> > > I also find it unusual to create the Kconfig before adding the
> > > supporting code.  Maybe this could be popped to the end or rolled into
> > > the last patch if we decided to keep it.  Thanks,  
> > 
> > It is leftover from previous version, I can squash it, but first we need
> > to decide what to do with pcim_p2pdma_init() call, if it needs to be
> > guarded or not.
> 
> As in the other thread, I think it would be cleaner in an IS_ENABLED
> branch.  I'm tempted to suggest we filter out EOPNOTSUPP to allow it to
> be unconditional, but I understand your point with the list_head
> initialization.  Thanks,

We can add dmabuf list to struct unconditionally, as memory overhead is
negligible. It will allow us to drop IS_ENABLED() too.

Thanks

> 
> Alex
> 
> 
