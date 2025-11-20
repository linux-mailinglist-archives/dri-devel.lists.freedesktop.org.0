Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 383E8C72A19
	for <lists+dri-devel@lfdr.de>; Thu, 20 Nov 2025 08:41:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A2CA10E70A;
	Thu, 20 Nov 2025 07:41:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="QNiHfv2S";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A037410E708
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Nov 2025 07:41:42 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id D72AA6011E;
 Thu, 20 Nov 2025 07:41:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE678C4CEF1;
 Thu, 20 Nov 2025 07:41:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1763624501;
 bh=RzCrc8OP4MQJ51Y3Cp/KnGNHr8pH8H/uOuzXNgsdf0I=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=QNiHfv2SAaFyrrm6ZhCR8ucSYnRrrdzPojcMIcohfbtDqJS/JJSe9Cm0EPsn0RMT1
 9FMh/DEL9DggTQsNRNFC6ZevNso3DG/8cJnjGqx1F973WBJx3zNUrkfRwIJTDtGniq
 T1iBja1OPDeFawU+b9NyxYO1eLXP5bDXy+x7TMExTwuaVkaO9yRhyCB63N85FD3fx7
 OxMoyn5s+7tJhzxI145c0GzmDIWiwooPR63zC0GIQoVhzfmUIy/rjbN0wvDQAasxv8
 4RKMSzrJoBj9dPKY+MZCCAfPLwtiZfQrtzxCUQWESd/6QU20I/oRvqEOXzQEx5F9s1
 fwoUvg48Mzzlw==
Date: Thu, 20 Nov 2025 09:41:37 +0200
From: Leon Romanovsky <leon@kernel.org>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Cc: Jason Gunthorpe <jgg@ziepe.ca>, Bjorn Helgaas <bhelgaas@google.com>,
 Logan Gunthorpe <logang@deltatee.com>, Jens Axboe <axboe@kernel.dk>,
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>,
 Andrew Morton <akpm@linux-foundation.org>,
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
 linux-hardening@vger.kernel.org, Alex Mastro <amastro@fb.com>,
 Nicolin Chen <nicolinc@nvidia.com>
Subject: Re: [Linaro-mm-sig] [PATCH v8 06/11] dma-buf: provide phys_vec to
 scatter-gather mapping routine
Message-ID: <20251120074137.GR18335@unreal>
References: <20251111-dmabuf-vfio-v8-0-fd9aa5df478f@nvidia.com>
 <20251111-dmabuf-vfio-v8-6-fd9aa5df478f@nvidia.com>
 <8a11b605-6ac7-48ac-8f27-22df7072e4ad@amd.com>
 <20251119132511.GK17968@ziepe.ca>
 <69436b2a-108d-4a5a-8025-c94348b74db6@amd.com>
 <20251119193114.GP17968@ziepe.ca>
 <c115432c-b63d-4b99-be18-0bf96398e153@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c115432c-b63d-4b99-be18-0bf96398e153@amd.com>
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

On Thu, Nov 20, 2025 at 08:08:27AM +0100, Christian König wrote:
> On 11/19/25 20:31, Jason Gunthorpe wrote:
> > On Wed, Nov 19, 2025 at 02:42:18PM +0100, Christian König wrote:
> > 
> >>>>> +	case PCI_P2PDMA_MAP_THRU_HOST_BRIDGE:
> >>>>> +		dma->state = kzalloc(sizeof(*dma->state), GFP_KERNEL);
> >>>>> +		if (!dma->state) {
> >>>>> +			ret = -ENOMEM;
> >>>>> +			goto err_free_dma;
> >>>>> +		}
> >>>>> +
> >>>>> +		dma_iova_try_alloc(attach->dev, dma->state, 0, size);
> >>>>
> >>>> Oh, that is a clear no-go for the core DMA-buf code.
> >>>>
> >>>> It's intentionally up to the exporter how to create the DMA
> >>>> addresses the importer can work with.
> >>>
> >>> I can't fully understand this remark?
> >>
> >> The exporter should be able to decide if it actually wants to use
> >> P2P when the transfer has to go through the host bridge (e.g. when
> >> IOMMU/bridge routing bits are enabled).
> > 
> > Sure, but this is a simplified helper for exporters that don't have
> > choices where the memory comes from.
> 
> That is extremely questionable as justification to put that in common DMA-buf code.
> 
> > I fully expet to see changes to this to support more use cases,
> > including the one above. We should do those changes along with users
> > making use of them so we can evaluate what works best.
> 
> Yeah, exactly that's my concern.
> 
> >> But only take that as Acked-by, I would need at least a day (or
> >> week) of free time to wrap my head around all the technical details
> >> again. And that is something I won't have before January or even
> >> later.
> > 
> > Sure, it is alot, and I think DRM community in general should come up
> > to speed on the new DMA API and how we are pushing to see P2P work
> > within Linux.
> > 
> > So thanks, we can take the Acked-by and progress here. Interested
> > parties can pick it up from this point when time allows.
> 
> Wait a second. After sleeping a night over it I think my initial take that we really should not put that into common DMA-buf code seems to hold true.
> 
> This is the use case for VFIO, but I absolutely want to avoid other drivers from re-using this code until be have more experience with that.
> 
> So to move forward I now strongly think we should keep that in VFIO until somebody else comes along and needs that helper.

It was put in VFIO at the beginning, but Christoph objected to it,
because that will require exporting symbol for pci_p2pdma_map_type().
which was universally agreed as not good idea.

https://lore.kernel.org/all/aPYrEroyWVOvAu-5@infradead.org/

Thanks

> 
> Regards,
> Christian.
> 
> > 
> > We can also have a mini-community call to give a summary/etc on these
> > topics.
> > 
> > Thanks,
> > Jason
> 
