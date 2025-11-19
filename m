Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B1F43C6EC17
	for <lists+dri-devel@lfdr.de>; Wed, 19 Nov 2025 14:13:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CE1610E5FC;
	Wed, 19 Nov 2025 13:13:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="GHF1Aqwk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CA9410E5FC
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Nov 2025 13:13:19 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 29B3B43352;
 Wed, 19 Nov 2025 13:13:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B4F4C113D0;
 Wed, 19 Nov 2025 13:13:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1763557998;
 bh=0Xx39uDqzjZbL4y1fEwlUfWXemPTGRgOd4dvOT2DUMg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=GHF1Aqwk7stwCyykVPT1YGqLL0q2EFkbo6kN9EUrvLJCQ171txGNyAbhz/88FHaZv
 9Rhg1BgJ1o6pwk5sbN0PfEDJwC3hklbr2bavfyxMzT01HhF0wF93D31LJijcoJ6gLx
 RRFCtGxIX1DwUcuBAwzEstv8DSzzM37P+t2zpedyyLBnUf7WSsyc8s20B6dfTtZtYP
 n3SeovgFnfzZ6hZLrcxPGnzG7gO49j5G0yZ+xF76uYa69LzleVp3n0yOevVQXsxKub
 cmKcRZl2oO6LkMOz/QRS9gfCL6+6UFT9W06hc6fG68egCXsf1a6inlsq6trLGvRe00
 zTHjfAjfnTUJQ==
Date: Wed, 19 Nov 2025 15:13:13 +0200
From: Leon Romanovsky <leon@kernel.org>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>,
 Logan Gunthorpe <logang@deltatee.com>, Jens Axboe <axboe@kernel.dk>,
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Andrew Morton <akpm@linux-foundation.org>,
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
 linux-hardening@vger.kernel.org
Subject: Re: [PATCH v8 05/11] PCI/P2PDMA: Document DMABUF model
Message-ID: <20251119131313.GA18335@unreal>
References: <20251111-dmabuf-vfio-v8-0-fd9aa5df478f@nvidia.com>
 <20251111-dmabuf-vfio-v8-5-fd9aa5df478f@nvidia.com>
 <9798b34c-618b-4e89-82b0-803bc655c82b@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9798b34c-618b-4e89-82b0-803bc655c82b@amd.com>
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

On Wed, Nov 19, 2025 at 10:18:08AM +0100, Christian König wrote:
> 
> 
> On 11/11/25 10:57, Leon Romanovsky wrote:
> > From: Jason Gunthorpe <jgg@nvidia.com>
> > 
> > Reflect latest changes in p2p implementation to support DMABUF lifecycle.
> > 
> > Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
> > Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> > ---
> >  Documentation/driver-api/pci/p2pdma.rst | 95 +++++++++++++++++++++++++--------
> >  1 file changed, 72 insertions(+), 23 deletions(-)

<...>

> > These MMIO pages have no struct page, and
> 
> Well please drop "pages" here. Just say MMIO addresses.
> 
> > +if used with mmap() must create special PTEs. As such there are very few
> > +kernel uAPIs that can accept pointers to them; in particular they cannot be used
> > +with read()/write(), including O_DIRECT.

<...>

> > +DMABUF provides an alternative to the above struct page-based
> > +client/provider/orchestrator system. In this mode the exporting driver will wrap
> > +some of its MMIO in a DMABUF and give the DMABUF FD to userspace.
> > +
> > +Userspace can then pass the FD to an importing driver which will ask the
> > +exporting driver to map it.
> 
> "to map it to the importer".

No problem, changed.

> 
> Regards,
> Christian.
> 
> > +
> > +In this case the initiator and target pci_devices are known and the P2P subsystem
> > +is used to determine the mapping type. The phys_addr_t-based DMA API is used to
> > +establish the dma_addr_t.
> > +
> > +Lifecycle is controlled by DMABUF move_notify(). When the exporting driver wants
> > +to remove() it must deliver an invalidation shutdown to all DMABUF importing
> > +drivers through move_notify() and synchronously DMA unmap all the MMIO.
> > +
> > +No importing driver can continue to have a DMA map to the MMIO after the
> > +exporting driver has destroyed its p2p_provider.
> >  
> >  
> >  P2P DMA Support Library
> > 
> 
