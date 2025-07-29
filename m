Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED79AB14A7A
	for <lists+dri-devel@lfdr.de>; Tue, 29 Jul 2025 10:53:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2992C10E27B;
	Tue, 29 Jul 2025 08:53:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="FY4CeHlP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C21C510E27B
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Jul 2025 08:53:42 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 885C55C6062;
 Tue, 29 Jul 2025 08:53:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50444C4CEEF;
 Tue, 29 Jul 2025 08:53:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1753779221;
 bh=yu/bVYFPs5NHquFn45Bc9xbptKoY+Y8L/DXBiDm3w50=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=FY4CeHlPxqEQY3ggQahQUSoRRGfmVjinO49I5sJuOGjcPHAj8mklTAkSCG4Zakzuo
 CvWjQEOC2+odKsm58x6VrEU4e8noHt+BTQbIa+b8nP0QopI+HxgtYaxzEYSMyMyP1i
 OBLiuqeEwUGzRceBsbP3L3NpTi5My4ZIkmooTnlb/vqma7yjemisxCsOOiwn0jdZcv
 57/GCBU5FjqNrGAV4nlmMOjD9QCbx2JTS2GDjEJ1QU42jdlN+Mb3IRDi9GqqvzA6Or
 K07AZpyONe96SwTYWZo5V9aAQimkHX1XB5pFni7jy4mTsr/t5VjM2AL0Q5t4DXy+76
 S/PGBqWqDL1RA==
Date: Tue, 29 Jul 2025 11:53:36 +0300
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
Message-ID: <20250729085336.GG402218@unreal>
References: <cover.1753274085.git.leonro@nvidia.com>
 <c2307cb4c3f1af46da138f3410738754691fbb3d.1753274085.git.leonro@nvidia.com>
 <20250724075145.GB30590@lst.de> <20250724075533.GR402218@unreal>
 <20250724075922.GD30590@lst.de> <20250727185158.GE7551@nvidia.com>
 <20250729075209.GA23823@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250729075209.GA23823@lst.de>
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

On Tue, Jul 29, 2025 at 09:52:09AM +0200, Christoph Hellwig wrote:
> On Sun, Jul 27, 2025 at 03:51:58PM -0300, Jason Gunthorpe wrote:
> > On Thu, Jul 24, 2025 at 09:59:22AM +0200, Christoph Hellwig wrote:
> > > On Thu, Jul 24, 2025 at 10:55:33AM +0300, Leon Romanovsky wrote:
> > > > Please, see last patch in the series https://lore.kernel.org/all/aea452cc27ca9e5169f7279d7b524190c39e7260.1753274085.git.leonro@nvidia.com
> > > > It gives me a way to call p2p code with stable pointer for whole BAR.
> > > > 
> > > 
> > > That simply can't work.
> > 
> > Why not?
> > 
> > That's the whole point of this, to remove struct page and use
> > something else as a handle for the p2p when doing the DMA API stuff.
> 
> Because the struct page is the only thing that:
> 
>  a) dma-mapping works on
>  b) is the only place we can discover the routing information, but also
>     more importantly ensure that the underlying page is still present
>     and the device is not hot unplugged, or in a very theoretical worst
>     case replaced by something else.

It is correct in general case, but here we are talking about MMIO
memory, which is "connected" to device X and routing information is
stable.

Thanks

> 
> 
