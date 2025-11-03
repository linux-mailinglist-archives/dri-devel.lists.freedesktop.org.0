Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BFEFC2A795
	for <lists+dri-devel@lfdr.de>; Mon, 03 Nov 2025 09:05:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B354D10E386;
	Mon,  3 Nov 2025 08:05:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="YNIMhHK+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A14710E386
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Nov 2025 08:05:27 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 9C7BA43DBB;
 Mon,  3 Nov 2025 08:05:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDBE8C4CEE7;
 Mon,  3 Nov 2025 08:05:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1762157126;
 bh=/Z00hsFx0kFKgS/fH2fkWOXPCRXDBSY3j5PVFskPLtY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=YNIMhHK+TIAw9S8epUQRLJ0hHWrXGrX021AASru7kQYHYuMFC6zo5jxbc7KUmJ0L3
 YNEe1nE+4ae3JtQxcTTez3gXWgSy2u2msyRHFv6Ufnrx2bt2n0+8KYqma3OyMomdHy
 Und0omT0toRmHQSOMJHh8FIiBDSXmNrLx8mv1uScrl9HdFKsXLarM713jjbRgR+/v4
 7/jTF678ISrptDm6AzMN9ALIVAtiWOrlbYsGz2TuzZPwPoiteJ/wA8NnfdkaDlmCac
 R8sanushWpLqk/uQd051eoYlDOALHHRNHhGhWZBT9cBCKpSLGzr/fRIrMBO19/jAvs
 SiEU4tXpMsS3Q==
Date: Mon, 3 Nov 2025 10:05:18 +0200
From: Leon Romanovsky <leon@kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Bjorn Helgaas <bhelgaas@google.com>,
 Logan Gunthorpe <logang@deltatee.com>, Jens Axboe <axboe@kernel.dk>,
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Andrew Morton <akpm@linux-foundation.org>,
 Jonathan Corbet <corbet@lwn.net>, Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Alex Williamson <alex.williamson@redhat.com>, Kees Cook <kees@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Ankit Agrawal <ankita@nvidia.com>, Yishai Hadas <yishaih@nvidia.com>,
 Shameer Kolothum <skolothumtho@nvidia.com>,
 Kevin Tian <kevin.tian@intel.com>,
 Krishnakant Jaju <kjaju@nvidia.com>, Matt Ochs <mochs@nvidia.com>,
 linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-block@vger.kernel.org, iommu@lists.linux.dev,
 linux-mm@kvack.org, linux-doc@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, kvm@vger.kernel.org,
 linux-hardening@vger.kernel.org
Subject: Re: [PATCH v6 05/11] PCI/P2PDMA: Document DMABUF model
Message-ID: <20251103080518.GB50752@unreal>
References: <20251102-dmabuf-vfio-v6-0-d773cff0db9f@nvidia.com>
 <20251102-dmabuf-vfio-v6-5-d773cff0db9f@nvidia.com>
 <86383031-807e-43d9-976e-dd955d79dc52@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <86383031-807e-43d9-976e-dd955d79dc52@infradead.org>
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

On Sun, Nov 02, 2025 at 10:16:59AM -0800, Randy Dunlap wrote:
> 
> 
> On 11/2/25 1:00 AM, Leon Romanovsky wrote:
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

> > +guarentee that the consuming driver has stopped using the MMIO during a removal
> 
>    guarantee

<...>

> > +if are used with mmap() must create special PTEs. As such there are very few
> 
>    if used

<...>

> > +pggmap of MEMORY_DEVICE_PCI_P2PDMA to create struct pages. The lifecylce of
> 
>    pgmap ?                                                        lifecycle

<...>

> > +architectures, others will experiance corruption or just crash in the kernel.
> 
>                               experience

<...>

> > +In this case the initator and target pci_devices are known and the P2P subsystem
> 
>                     initiator

<...>

> > +exporting driver has destroyed it's p2p_provider.
>                                   its

Thanks a lot, fixed.

> 
> -- 
> ~Randy
> 
> 
