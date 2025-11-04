Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 624B6C2F89B
	for <lists+dri-devel@lfdr.de>; Tue, 04 Nov 2025 08:00:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3891010E528;
	Tue,  4 Nov 2025 07:00:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="I1UEY/F8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74D8C10E528
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Nov 2025 07:00:30 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 1EE2943791;
 Tue,  4 Nov 2025 07:00:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C40EC4CEF7;
 Tue,  4 Nov 2025 07:00:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1762239630;
 bh=4X+6t70DXpoh2T+5EieuiIaGNQ+Nx/11qPV6DRFYJmY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=I1UEY/F8kb6rmfO1N8znpDwknPo+zoeYokqXc5isZjuBzW2kwNIyURNneL551ILHq
 xB1qlT1GwIRyPrqploIY1BSnrb/M+gayul0auOGaYIzVZ5ipDhkzhnPwCHrtS0f6BC
 z5t1VvB9oLCq/rFMCgCk9VhSiEJuSXID8okNRaVWmbtPOK+n28WqZyhoHpfWmronvf
 FcGjEPq4VK6Yo+LBMfOfTVdislK0QSciIeNRcwvKA5aNqAeghvNKt/yYcDiNo2g9fQ
 ijAwMsISbHre8xNCfIwmhQpHnPPoDWGxgBNbI3zl0/Lwh8StDazLf/AgskMUfBm9kx
 ZlGWIVygzFi3w==
Date: Tue, 4 Nov 2025 09:00:21 +0200
From: Leon Romanovsky <leon@kernel.org>
To: Bjorn Helgaas <bhelgaas@google.com>, Logan Gunthorpe <logang@deltatee.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Jens Axboe <axboe@kernel.dk>, Robin Murphy <robin.murphy@arm.com>,
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Andrew Morton <akpm@linux-foundation.org>,
 Jonathan Corbet <corbet@lwn.net>,
 Alex Williamson <alex.williamson@redhat.com>, Kees Cook <kees@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Ankit Agrawal <ankita@nvidia.com>, Yishai Hadas <yishaih@nvidia.com>,
 Shameer Kolothum <skolothumtho@nvidia.com>,
 Kevin Tian <kevin.tian@intel.com>
Cc: Krishnakant Jaju <kjaju@nvidia.com>, Matt Ochs <mochs@nvidia.com>,
 linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-block@vger.kernel.org, iommu@lists.linux.dev,
 linux-mm@kvack.org, linux-doc@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, kvm@vger.kernel.org,
 linux-hardening@vger.kernel.org,
 Vivek Kasireddy <vivek.kasireddy@intel.com>
Subject: Re: [PATCH v6 00/11] vfio/pci: Allow MMIO regions to be exported
 through dma-buf
Message-ID: <20251104070021.GC50752@unreal>
References: <20251102-dmabuf-vfio-v6-0-d773cff0db9f@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251102-dmabuf-vfio-v6-0-d773cff0db9f@nvidia.com>
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

On Sun, Nov 02, 2025 at 10:00:48AM +0200, Leon Romanovsky wrote:

<...>

> ---
> Jason Gunthorpe (2):
>       PCI/P2PDMA: Document DMABUF model
>       vfio/nvgrace: Support get_dmabuf_phys
> 
> Leon Romanovsky (7):
>       PCI/P2PDMA: Separate the mmap() support from the core logic
>       PCI/P2PDMA: Simplify bus address mapping API
>       PCI/P2PDMA: Refactor to separate core P2P functionality from memory allocation
>       PCI/P2PDMA: Provide an access to pci_p2pdma_map_type() function
>       dma-buf: provide phys_vec to scatter-gather mapping routine
>       vfio/pci: Enable peer-to-peer DMA transactions by default
>       vfio/pci: Add dma-buf export support for MMIO regions
> 
> Vivek Kasireddy (2):
>       vfio: Export vfio device get and put registration helpers
>       vfio/pci: Share the core device pointer while invoking feature functions


Hi,

Can we get Acked-by for p2pdma and DMABUF parts?

Thanks

> 
>  Documentation/driver-api/pci/p2pdma.rst |  95 +++++++---
>  block/blk-mq-dma.c                      |   2 +-
>  drivers/dma-buf/dma-buf.c               | 235 ++++++++++++++++++++++++
>  drivers/iommu/dma-iommu.c               |   4 +-
>  drivers/pci/p2pdma.c                    | 182 +++++++++++++-----
>  drivers/vfio/pci/Kconfig                |   3 +
>  drivers/vfio/pci/Makefile               |   1 +
>  drivers/vfio/pci/nvgrace-gpu/main.c     |  56 ++++++
>  drivers/vfio/pci/vfio_pci.c             |   5 +
>  drivers/vfio/pci/vfio_pci_config.c      |  22 ++-
>  drivers/vfio/pci/vfio_pci_core.c        |  56 ++++--
>  drivers/vfio/pci/vfio_pci_dmabuf.c      | 315 ++++++++++++++++++++++++++++++++
>  drivers/vfio/pci/vfio_pci_priv.h        |  23 +++
>  drivers/vfio/vfio_main.c                |   2 +
>  include/linux/dma-buf.h                 |  18 ++
>  include/linux/pci-p2pdma.h              | 120 +++++++-----
>  include/linux/vfio.h                    |   2 +
>  include/linux/vfio_pci_core.h           |  42 +++++
>  include/uapi/linux/vfio.h               |  27 +++
>  kernel/dma/direct.c                     |   4 +-
>  mm/hmm.c                                |   2 +-
>  21 files changed, 1077 insertions(+), 139 deletions(-)
> ---
> base-commit: 3a8660878839faadb4f1a6dd72c3179c1df56787
> change-id: 20251016-dmabuf-vfio-6cef732adf5a
> 
> Best regards,
> --  
> Leon Romanovsky <leonro@nvidia.com>
> 
> 
