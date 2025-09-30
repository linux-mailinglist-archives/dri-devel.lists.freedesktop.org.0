Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ED0EBABEE3
	for <lists+dri-devel@lfdr.de>; Tue, 30 Sep 2025 09:57:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FA5010E51E;
	Tue, 30 Sep 2025 07:57:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="lKEnQkLh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC27310E292
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Sep 2025 07:57:53 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 6F41843B90;
 Tue, 30 Sep 2025 07:57:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 879DEC4CEF0;
 Tue, 30 Sep 2025 07:57:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1759219073;
 bh=i3BtTTr7nZIJz33RyVUpfLlfxu4epWOssHy+VLrcscQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=lKEnQkLh/7QlrpMJsb5yRxE5AbBpzJMJNRvLELIbdmZqsMudIfJkl5IIjVlvWd45t
 9CdHZPBwdsFyTXltr7C+E/ikvBD8M3GKILT1uJbM/dqVtkzxxeI95NEbtW/zrd+Ep5
 UJKj7ByQ5cHM7iDUE5YdLldljkvDneKjj7T0/Jl4BAwLIv6rMPS82rffMeFvtqMlii
 rJtHqvVmDH+CUonBV/bnseaOumQHFjDS8yuzzqj15+2YNU8QWaz2EfS70aqZHG3yUz
 GrVG3wKTr88ok96rH2QGVO9OvriGTC+fSkO/DeP0k5odor2Iw88fzatiG+tDDQkt+a
 OH7f8EY3JlCxQ==
Date: Tue, 30 Sep 2025 10:57:48 +0300
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
Message-ID: <20250930075748.GF324804@unreal>
References: <cover.1759070796.git.leon@kernel.org>
 <b1b44823f93fd9e7fa73dc165141d716cb74fa90.1759070796.git.leon@kernel.org>
 <20250929151740.21f001e3.alex.williamson@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250929151740.21f001e3.alex.williamson@redhat.com>
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

On Mon, Sep 29, 2025 at 03:17:40PM -0600, Alex Williamson wrote:
> On Sun, 28 Sep 2025 17:50:17 +0300
> Leon Romanovsky <leon@kernel.org> wrote:
> 
> > From: Leon Romanovsky <leonro@nvidia.com>
> > 
> > Add new kernel config which indicates support for dma-buf export
> > of MMIO regions, which implementation is provided in next patches.
> > 
> > Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
> > ---
> >  drivers/vfio/pci/Kconfig | 20 ++++++++++++++++++++
> >  1 file changed, 20 insertions(+)
> > 
> > diff --git a/drivers/vfio/pci/Kconfig b/drivers/vfio/pci/Kconfig
> > index 2b0172f54665..55ae888bf26a 100644
> > --- a/drivers/vfio/pci/Kconfig
> > +++ b/drivers/vfio/pci/Kconfig
> > @@ -55,6 +55,26 @@ config VFIO_PCI_ZDEV_KVM
> >  
> >  	  To enable s390x KVM vfio-pci extensions, say Y.
> >  
> > +config VFIO_PCI_DMABUF
> > +	bool "VFIO PCI extensions for DMA-BUF"
> > +	depends on VFIO_PCI_CORE
> > +	depends on PCI_P2PDMA && DMA_SHARED_BUFFER
> > +	default y
> > +	help
> > +	  Enable support for VFIO PCI extensions that allow exporting
> > +	  device MMIO regions as DMA-BUFs for peer devices to access via
> > +	  peer-to-peer (P2P) DMA.
> > +
> > +	  This feature enables a VFIO-managed PCI device to export a portion
> > +	  of its MMIO BAR as a DMA-BUF file descriptor, which can be passed
> > +	  to other userspace drivers or kernel subsystems capable of
> > +	  initiating DMA to that region.
> > +
> > +	  Say Y here if you want to enable VFIO DMABUF-based MMIO export
> > +	  support for peer-to-peer DMA use cases.
> > +
> > +	  If unsure, say N.
> > +
> >  source "drivers/vfio/pci/mlx5/Kconfig"
> >  
> >  source "drivers/vfio/pci/hisilicon/Kconfig"
> 
> This is only necessary if we think there's a need to build a kernel with
> P2PDMA and VFIO_PCI, but not VFIO_PCI_DMABUF.  Does that need really
> exist?

It is used to filter build of vfio_pci_dmabuf.c - drivers/vfio/pci/Makefile:
vfio-pci-core-$(CONFIG_VFIO_PCI_DMABUF) += vfio_pci_dmabuf.o

> 
> I also find it unusual to create the Kconfig before adding the
> supporting code.  Maybe this could be popped to the end or rolled into
> the last patch if we decided to keep it.  Thanks,

It is leftover from previous version, I can squash it, but first we need
to decide what to do with pcim_p2pdma_init() call, if it needs to be
guarded or not.

Thanks

> 
> Alex
> 
> 
