Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B3A7C72EF5
	for <lists+dri-devel@lfdr.de>; Thu, 20 Nov 2025 09:43:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA96810E708;
	Thu, 20 Nov 2025 08:43:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="XwM9VF0/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95B1E10E708
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Nov 2025 08:43:02 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 4E49743EDD;
 Thu, 20 Nov 2025 08:43:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FADBC4CEF1;
 Thu, 20 Nov 2025 08:43:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1763628182;
 bh=P5XvCfo2kL1FT8lQd/duz2IZNp+Bc6vjBcFoBDexpxA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=XwM9VF0/MdzjJFRWGcTU+as96VZEq0Zb/fyLDF58ZfSH35uzQmxfr4TmytcS6mL88
 d1t0Wx0u0jj7fsdr5rg1/N1bGUYv7dvnAc1Es+H74RFvNwnWfKaQ53LvyByCAGFAAh
 I7jNUZW/ydTTb1ZZicgEeQDolVmPtWGgW50zR3zu9NFkWMcO7PFAgTiTBGYnctFDzH
 v2CUO+Rk+ConUzbB/bRLLrMZJhBmYdtxZm/7TcQa12wKM5gP+hl5DNE9M+GLA4aAZ+
 uB36oeBHPnhbuuXsBWdkmnKZN9coakgPW2EmMZJTa1WNpabXyaPUyQmy381pCUWWJD
 qzDxtYKxcztcQ==
Date: Thu, 20 Nov 2025 10:42:57 +0200
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
Message-ID: <20251120084257.GU18335@unreal>
References: <20251111-dmabuf-vfio-v8-6-fd9aa5df478f@nvidia.com>
 <8a11b605-6ac7-48ac-8f27-22df7072e4ad@amd.com>
 <20251119132511.GK17968@ziepe.ca>
 <69436b2a-108d-4a5a-8025-c94348b74db6@amd.com>
 <20251119193114.GP17968@ziepe.ca>
 <c115432c-b63d-4b99-be18-0bf96398e153@amd.com>
 <20251120074137.GR18335@unreal>
 <209499e2-6a06-4291-ad4c-77230926c665@amd.com>
 <20251120080635.GT18335@unreal>
 <1e238415-1080-40b3-abb4-7fd31033d6de@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1e238415-1080-40b3-abb4-7fd31033d6de@amd.com>
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

On Thu, Nov 20, 2025 at 09:32:22AM +0100, Christian König wrote:
> On 11/20/25 09:06, Leon Romanovsky wrote:
> > On Thu, Nov 20, 2025 at 08:54:37AM +0100, Christian König wrote:
> >> On 11/20/25 08:41, Leon Romanovsky wrote:
> >>> On Thu, Nov 20, 2025 at 08:08:27AM +0100, Christian König wrote:
> >>>> On 11/19/25 20:31, Jason Gunthorpe wrote:
> >>>>> On Wed, Nov 19, 2025 at 02:42:18PM +0100, Christian König wrote:
> >>>>>
> >>>>>>>>> +	case PCI_P2PDMA_MAP_THRU_HOST_BRIDGE:
> >>>>>>>>> +		dma->state = kzalloc(sizeof(*dma->state), GFP_KERNEL);
> >>>>>>>>> +		if (!dma->state) {
> >>>>>>>>> +			ret = -ENOMEM;
> >>>>>>>>> +			goto err_free_dma;
> >>>>>>>>> +		}
> >>>>>>>>> +
> >>>>>>>>> +		dma_iova_try_alloc(attach->dev, dma->state, 0, size);
> >>>>>>>>
> >>>>>>>> Oh, that is a clear no-go for the core DMA-buf code.
> >>>>>>>>
> >>>>>>>> It's intentionally up to the exporter how to create the DMA
> >>>>>>>> addresses the importer can work with.
> >>>>>>>
> >>>>>>> I can't fully understand this remark?
> >>>>>>
> >>>>>> The exporter should be able to decide if it actually wants to use
> >>>>>> P2P when the transfer has to go through the host bridge (e.g. when
> >>>>>> IOMMU/bridge routing bits are enabled).
> >>>>>
> >>>>> Sure, but this is a simplified helper for exporters that don't have
> >>>>> choices where the memory comes from.
> >>>>
> >>>> That is extremely questionable as justification to put that in common DMA-buf code.
> >>>>
> >>>>> I fully expet to see changes to this to support more use cases,
> >>>>> including the one above. We should do those changes along with users
> >>>>> making use of them so we can evaluate what works best.
> >>>>
> >>>> Yeah, exactly that's my concern.
> >>>>
> >>>>>> But only take that as Acked-by, I would need at least a day (or
> >>>>>> week) of free time to wrap my head around all the technical details
> >>>>>> again. And that is something I won't have before January or even
> >>>>>> later.
> >>>>>
> >>>>> Sure, it is alot, and I think DRM community in general should come up
> >>>>> to speed on the new DMA API and how we are pushing to see P2P work
> >>>>> within Linux.
> >>>>>
> >>>>> So thanks, we can take the Acked-by and progress here. Interested
> >>>>> parties can pick it up from this point when time allows.
> >>>>
> >>>> Wait a second. After sleeping a night over it I think my initial take that we really should not put that into common DMA-buf code seems to hold true.
> >>>>
> >>>> This is the use case for VFIO, but I absolutely want to avoid other drivers from re-using this code until be have more experience with that.
> >>>>
> >>>> So to move forward I now strongly think we should keep that in VFIO until somebody else comes along and needs that helper.
> >>>
> >>> It was put in VFIO at the beginning, but Christoph objected to it,
> >>> because that will require exporting symbol for pci_p2pdma_map_type().
> >>> which was universally agreed as not good idea.
> >>
> >> Yeah, that is exactly what I object here :)
> >>
> >> We can have the helper in DMA-buf *if* pci_p2pdma_map_type() is called by drivers or at least accessible. That's what I pointed out in the other mail before as well.
> >>
> >> The exporter must be able to make decisions based on if the transaction would go over the host bridge or not.
> >>
> >> Background is that in a lot of use cases you rather want to move the backing store into system memory instead of keeping it in local memory if the driver doesn't have direct access over a common upstream bridge.
> >>
> >> Currently drivers decide that based on if IOMMU is enabled or not (and a few other quirks), but essentially you absolutely want a function which gives this information to exporters. For the VFIO use case it doesn't matter because you can't switch the BAR for system memory.
> >>
> >> To unblock you, please add a big fat comment in the kerneldoc of the mapping explaining this and that it might be necessary for exporters to call pci_p2pdma_map_type() as well.
> > 
> > Thanks,
> > 
> > What do you think about it?
> > 
> > diff --git a/drivers/dma-buf/dma-buf-mapping.c b/drivers/dma-buf/dma-buf-mapping.c
> > index a69bb73db86d..05ec84a0157b 100644
> > --- a/drivers/dma-buf/dma-buf-mapping.c
> > +++ b/drivers/dma-buf/dma-buf-mapping.c
> > @@ -84,6 +84,11 @@ struct dma_buf_dma {
> >   * PAGE_SIZE aligned.
> >   *
> >   * A mapping must be unmapped by using dma_buf_free_sgt().
> > + *
> > + * NOTE: While this function is intended for DMA-buf importers, it is critical
> > + * that the DMA-buf exporter is capable of performing peer-to-peer (P2P) DMA
> > + * directly between PCI devices, without routing transactions through the host
> > + * bridge.
> 
> Well first of all this function is intended for exporters not importers.
> 
> Maybe write something like "This function is intended for exporters. If direct traffic routing is mandatory exporter should call routing pci_p2pdma_map_type() before calling this function.".

Sure, no problem.

Thanks

> 
> Regards,
> Christian.
> 
> >   */
> >  struct sg_table *dma_buf_phys_vec_to_sgt(struct dma_buf_attachment *attach,
> >                                          struct p2pdma_provider *provider,
> > (END)
> > 
> > 
> >>
> >> Regards,
> >> Christian.
> >>
> >>>
> >>> https://lore.kernel.org/all/aPYrEroyWVOvAu-5@infradead.org/
> >>>
> >>> Thanks
> >>>
> >>>>
> >>>> Regards,
> >>>> Christian.
> >>>>
> >>>>>
> >>>>> We can also have a mini-community call to give a summary/etc on these
> >>>>> topics.
> >>>>>
> >>>>> Thanks,
> >>>>> Jason
> >>>>
> >>
> 
