Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E87BC1E9DF
	for <lists+dri-devel@lfdr.de>; Thu, 30 Oct 2025 07:48:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D85010E88C;
	Thu, 30 Oct 2025 06:48:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Jvaq5XNT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C4E910E88C
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Oct 2025 06:48:24 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 1340543ADE;
 Thu, 30 Oct 2025 06:48:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26554C4CEF1;
 Thu, 30 Oct 2025 06:48:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1761806903;
 bh=Hh7skkg065ylczpCr0Iv292nYGj50H++UlcoJlqnTFg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Jvaq5XNTepDILhgg1JjU/RUVDN3aAiAJIkCA81z5TSuHPckkaF3X0SyKZTH4NiHLo
 x+finAT9AqYTJiYKAczU3VWRnf+rm3VE20OrKWYI/Xxc5hFGsCXFzXGxlRgl84S3cn
 1erdjEeAotdXzH15cDoYeVH+bTlS6vCEewWmlIP12FHqqmKW1wIhJVbVTWmVOPGJrX
 RJ5aoNnkrAbFiXF+dpmpZF6tfJYJwn+YpHGgTwxQxqrtPlhVJhYtSdcxvt/ny5ubyp
 08qX3boYwst6Z/pSklUkGal7BAeNf8rJyf2PuG4I88FPZtBaphc13e3GPPIzUbz0sz
 yNDwwG6BUC0cA==
Date: Thu, 30 Oct 2025 08:48:18 +0200
From: Leon Romanovsky <leon@kernel.org>
To: Samiullah Khawaja <skhawaja@google.com>
Cc: Alex Williamson <alex.williamson@redhat.com>,
 Jason Gunthorpe <jgg@nvidia.com>,
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
Message-ID: <20251030064818.GA60090@unreal>
References: <cover.1760368250.git.leon@kernel.org>
 <72ecaa13864ca346797e342d23a7929562788148.1760368250.git.leon@kernel.org>
 <CAAywjhRb6Nwmzy+QWFPH9Zkn-xvtvOktNjAZ8HMpM2wmVw2rjw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAAywjhRb6Nwmzy+QWFPH9Zkn-xvtvOktNjAZ8HMpM2wmVw2rjw@mail.gmail.com>
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

On Wed, Oct 29, 2025 at 05:25:03PM -0700, Samiullah Khawaja wrote:
> On Mon, Oct 13, 2025 at 8:27 AM Leon Romanovsky <leon@kernel.org> wrote:
> >
> > From: Leon Romanovsky <leonro@nvidia.com>
> >
> > Add support for exporting PCI device MMIO regions through dma-buf,
> > enabling safe sharing of non-struct page memory with controlled
> > lifetime management. This allows RDMA and other subsystems to import
> > dma-buf FDs and build them into memory regions for PCI P2P operations.
> >
> > The implementation provides a revocable attachment mechanism using
> > dma-buf move operations. MMIO regions are normally pinned as BARs
> > don't change physical addresses, but access is revoked when the VFIO
> > device is closed or a PCI reset is issued. This ensures kernel
> > self-defense against potentially hostile userspace.
> >
> > Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> > Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
> > Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
> > ---
> >  drivers/vfio/pci/Kconfig           |   3 +
> >  drivers/vfio/pci/Makefile          |   2 +
> >  drivers/vfio/pci/vfio_pci_config.c |  22 +-
> >  drivers/vfio/pci/vfio_pci_core.c   |  28 ++
> >  drivers/vfio/pci/vfio_pci_dmabuf.c | 446 +++++++++++++++++++++++++++++
> >  drivers/vfio/pci/vfio_pci_priv.h   |  23 ++
> >  include/linux/vfio_pci_core.h      |   1 +
> >  include/uapi/linux/vfio.h          |  25 ++
> >  8 files changed, 546 insertions(+), 4 deletions(-)
> >  create mode 100644 drivers/vfio/pci/vfio_pci_dmabuf.c

<...>

> > +void vfio_pci_dma_buf_move(struct vfio_pci_core_device *vdev, bool revoked)
> > +{
> > +       struct vfio_pci_dma_buf *priv;
> > +       struct vfio_pci_dma_buf *tmp;
> > +
> > +       lockdep_assert_held_write(&vdev->memory_lock);
> > +
> > +       list_for_each_entry_safe(priv, tmp, &vdev->dmabufs, dmabufs_elm) {
> > +               if (!get_file_active(&priv->dmabuf->file))
> > +                       continue;
> > +
> > +               if (priv->revoked != revoked) {
> > +                       dma_resv_lock(priv->dmabuf->resv, NULL);
> > +                       priv->revoked = revoked;
> > +                       dma_buf_move_notify(priv->dmabuf);
> 
> I think this should only be called when revoked is true, otherwise
> this will be calling move_notify on the already revoked dmabuf
> attachments.

This case is protected by "if (priv->revoked)" check both in vfio_pci_dma_buf_map
and vfio_pci_dma_buf_attach. They will prevent DMABUF recreation if revoked is false.

VTW, please trim your replies, it is time consuming to find your reply
among 600 lines of unrelated text.

Thanks

> > +                       dma_resv_unlock(priv->dmabuf->resv);
> > +               }
> > +               dma_buf_put(priv->dmabuf);
> > +       }
> > +}

