Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7410B14D17
	for <lists+dri-devel@lfdr.de>; Tue, 29 Jul 2025 13:39:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 356EA10E04D;
	Tue, 29 Jul 2025 11:39:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="qpcxA/u9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FD1D10E04D
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Jul 2025 11:39:49 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 5F36F5C0F2E;
 Tue, 29 Jul 2025 11:39:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D158C4CEEF;
 Tue, 29 Jul 2025 11:39:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1753789188;
 bh=RPpvSK/8qiFnebjIGVvl4LqDX43VTor4nmtafMFjlfU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qpcxA/u9Tznj7llG4bq8FgGR6n8loB2QOxor+6SdCBhDOlGqqCbPcbo6ut4+3zXzL
 O5B+31lN4CYNt7zw8YTEfSBOXxZFWo+0AsNmp1TdE0XL16apisn11dsrtPqTtYAHln
 VCS+YdU5DPkiycpCq/fSNmsqkqr8kFs7KFT5s5fsNGA/S8X9xcFgGaDoBgAo4DoPRF
 aMN7RJsq0IlBv4/1hktW6Ljb6F9jYory7s2E+kTM/3t3aXsuUFLKZRJBPZxHTdv1oc
 KuceSjXps91R6vKXxveoKFcrxBdr11X2quBjbA9AraUBemCTyZvSzA7Y7ok9Ir4LiX
 qadsSroZsSBiw==
Date: Tue, 29 Jul 2025 14:39:43 +0300
From: Leon Romanovsky <leon@kernel.org>
To: Christoph Hellwig <hch@lst.de>
Cc: Jason Gunthorpe <jgg@nvidia.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, iommu@lists.linux.dev,
 Jens Axboe <axboe@kernel.dk>,
 =?iso-8859-1?B?Suly9G1l?= Glisse <jglisse@redhat.com>,
 Joerg Roedel <joro@8bytes.org>, kvm@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, linux-block@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-mm@kvack.org, linux-pci@vger.kernel.org,
 Logan Gunthorpe <logang@deltatee.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Robin Murphy <robin.murphy@arm.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Vivek Kasireddy <vivek.kasireddy@intel.com>, Will Deacon <will@kernel.org>
Subject: Re: [PATCH 02/10] PCI/P2PDMA: Introduce p2pdma_provider structure
 for cleaner abstraction
Message-ID: <20250729113943.GJ402218@unreal>
References: <cover.1753274085.git.leonro@nvidia.com>
 <c2307cb4c3f1af46da138f3410738754691fbb3d.1753274085.git.leonro@nvidia.com>
 <20250724075145.GB30590@lst.de> <20250724075533.GR402218@unreal>
 <20250724075922.GD30590@lst.de> <20250727185158.GE7551@nvidia.com>
 <20250729075209.GA23823@lst.de> <20250729085336.GG402218@unreal>
 <20250729104100.GA29053@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250729104100.GA29053@lst.de>
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

On Tue, Jul 29, 2025 at 12:41:00PM +0200, Christoph Hellwig wrote:
> On Tue, Jul 29, 2025 at 11:53:36AM +0300, Leon Romanovsky wrote:
> > > Because the struct page is the only thing that:
> > > 
> > >  a) dma-mapping works on
> > >  b) is the only place we can discover the routing information, but also
> > >     more importantly ensure that the underlying page is still present
> > >     and the device is not hot unplugged, or in a very theoretical worst
> > >     case replaced by something else.
> > 
> > It is correct in general case, but here we are talking about MMIO
> > memory, which is "connected" to device X and routing information is
> > stable.
> 
> MMIO is literally the only thing we support to P2P to/from as that is
> how PCIe P2P is defined.  And not, it's not stable - devices can be
> unplugged, and BARs can be reenumerated.

I have a feeling that we are drifting from the current patchset to more
general discussion.

The whole idea of new DMA API is to provide flexibility to the callers
(subsystems) who are perfectly aware of their data and limitations to
implement direct addressing natively.

In this series, device is controlled by VFIO and DMABUF. It is not
possible to unplug it without VFIO notices it. In such case, p2pdma_provider
and related routing information (DMABUF) will be reevaluated.

So for VFIO + DMABUF, the pointer is very stable.

For other cases (general case), the flow is not changed.
Users  will continue to call to old and well-known pci_p2pdma_state()
to calculate p2p type.

Thanks

> 
