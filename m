Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 436EFB1631D
	for <lists+dri-devel@lfdr.de>; Wed, 30 Jul 2025 16:49:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B250010E6AE;
	Wed, 30 Jul 2025 14:49:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 457F110E6B8
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Jul 2025 14:49:52 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A671E1BC0;
 Wed, 30 Jul 2025 07:49:43 -0700 (PDT)
Received: from [10.57.3.116] (unknown [10.57.3.116])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9B8B53F673;
 Wed, 30 Jul 2025 07:49:47 -0700 (PDT)
Message-ID: <6c5fb9f0-c608-4e19-8c60-5d8cef3efbdf@arm.com>
Date: Wed, 30 Jul 2025 15:49:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/10] vfio/pci: Add dma-buf export support for MMIO
 regions
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Leon Romanovsky <leon@kernel.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 Leon Romanovsky <leonro@nvidia.com>, Christoph Hellwig <hch@lst.de>,
 Andrew Morton <akpm@linux-foundation.org>,
 Bjorn Helgaas <bhelgaas@google.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, iommu@lists.linux.dev,
 Jens Axboe <axboe@kernel.dk>, =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?=
 <jglisse@redhat.com>, Joerg Roedel <joro@8bytes.org>, kvm@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, linux-block@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-mm@kvack.org, linux-pci@vger.kernel.org,
 Logan Gunthorpe <logang@deltatee.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Vivek Kasireddy <vivek.kasireddy@intel.com>, Will Deacon <will@kernel.org>
References: <cover.1753274085.git.leonro@nvidia.com>
 <aea452cc27ca9e5169f7279d7b524190c39e7260.1753274085.git.leonro@nvidia.com>
 <8f912671-f1d9-4f73-9c1d-e39938bfc09f@arm.com>
 <20250729201351.GA82395@nvidia.com>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <20250729201351.GA82395@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

On 2025-07-29 9:13 pm, Jason Gunthorpe wrote:
> On Tue, Jul 29, 2025 at 08:44:21PM +0100, Robin Murphy wrote:
> 
>> In this case with just one single
>> contiguous mapping, it is clearly objectively worse to have to bounce in and
>> out of the IOMMU layer 3 separate times and store a dma_map_state,
> 
> The non-contiguous mappings are comming back, it was in earlier drafts
> of this. Regardless, the point is to show how to use the general API
> that we would want to bring into the DRM drivers that don't have
> contiguity even though VFIO is a bit special.
> 
>> Oh yeah, and mapping MMIO with regular memory attributes (IOMMU_CACHE)
>> rather than appropriate ones (IOMMU_MMIO), as this will end up doing, isn't
>> guaranteed not to end badly either (e.g. if the system interconnect ends up
>> merging consecutive write bursts and exceeding the target root port's MPS.)
> 
> Yes, I recently noticed this too, it should be fixed..
> 
> But so we are all on the same page, alot of the PCI P2P systems are
> setup so P2P does not transit through the iommu. It either takes the
> ACS path through a switch or it uses ATS and takes a different ACS
> path through a switch. It only transits through the iommu in
> misconfigured systems or in the rarer case of P2P between root ports.

For non-ATS (and ATS Untranslated traffic), my understanding is that we 
rely on ACS upstream redirect to send transactions all the way up to the 
root port for translation (and without that then they are indeed pure 
bus addresses, take the pci_p2pdma_bus_addr_map() case, and the rest of 
this is all irrelevant). In Arm system terms, simpler root ports may 
well have to run that traffic out to an external SMMU TBU, at which 
point any P2P would loop back externally through the memory space window 
in the system interconnect PA space, as opposed to DTI-ATS root 
complexes that effectively implement their own internal translation 
agent on the PCIe side. Thus on some systems, even P2P behind a single 
root port may end up looking functionally the same as the cross-RP case, 
but in general cross-RP *is* something that people seem to care about as 
well. We're seeing more and more systems where each slot has its own RP 
as a separate segment, rather than giant root complexes with a host 
bridge and everyone on one big happy root bus together.

>> And again, if the IOMMU is in bypass (the idea of P2P with vfio-noiommu simply
>> isn't worth entertaining)
> 
> Not quite. DMABUF is sort of upside down.
> 
> For example if we are exporting a DMABUF from VFIO and importing it to
> RDMA then RDMA will call VFIO to make an attachment and the above VFIO
> code will perform the DMA map to the RDMA struct device. DMABUF
> returns a dma mapped scatterlist back to the RDMA driver.
> 
> The above dma_map_phys(rdma_dev,...) can be in bypass because the rdma
> device can legitimately be in bypass, or not have a iommu, or
> whatever.

I understand how dma-buf works - obviously DMA mapping for the VFIO 
device itself while it's not even attached to its default domain would 
be silly. I mean that any system that has 64-bit coherent PCIe behind an 
IOMMU such that this VFIO exporter could exist, is realistically going 
to have the same (or equivalent) IOMMU in front of any potential 
importers as well. *Especially* if you expect the normal case for P2P to 
be within a single hierarchy. Thus I was simply commenting that 
IOMMU_DOMAIN_IDENTITY is the *only* realistic reason to actually expect 
to interact with dma-direct here.

But of course, if it's not dma-direct because we're on POWER with TCE, 
rather than VFIO Type1 implying an iommu-dma/dma-direct arch, then who 
knows? I imagine the complete absence of any mention means this hasn't 
been tried, or possibly even considered?

>> AFAICS you're *depending* on this call being an effective no-op, and thus
>> only demonstrating that the dma_map_phys() idea is still entirely
>> unnecessary.
> 
> It should not be a full no-op, and it should be closer to
> dma map resource to avoid the mmio issues.

I don't get what you mean by "not be a full no-op", can you clarify 
exactly what you think it should be doing? Even if it's just the 
dma_capable() mask check equivalent to dma_direct_map_resource(), you 
don't actually want that here either - in that case you'd want to fail 
the entire attachment to begin with since it can never work.

> It should be failing for cases where it is not supported (ie
> swiotlb=force), it should still be calling the legacy dma_ops, and it
> should be undoing any CC mangling with the address. (also the
> pci_p2pdma_bus_addr_map() needs to deal with any CC issues too)

Um, my whole point is that the "legacy DMA ops" cannot be called, 
because they still assume page-backed memory, so at best are guaranteed 
to fail; any "CC mangling" assumed for memory is most likely wrong for 
MMIO, and there simply is no "deal with" at this point.

A device BAR is simply not under control of the trusted hypervisor the 
same way memory is; whatever (I/G)PA it is at must already be the 
correct address, if the aliasing scheme even applies at all. Sticking to 
Arm CCA terminology for example, if a device in shared state tries to 
import a BAR from a device in locked/private state, there is no notion 
of touching the shared alias and hoping it somehow magically works (at 
best it might throw the exporting device into TDISP error state 
terminally); that attachment simply cannot be allowed. If an shared 
resource exists in the shared IPA space to begin with, dma_to_phys() 
will do the wrong thing, and even phys_to_dma() would technically not 
walk dma_range_map correctly, because both assume "phys" represents 
kernel memory. However it's also all moot since any attempt at any 
combination will fail anyway due to SWIOTLB being forced by 
is_realm_world().

(OK, I admit "crash" wasn't strictly the right word to use there - I 
keep forgetting that some of the P2P scatterlist support in dma-direct 
ended up affecting the map_page path too, even though that was never 
really the functional intent - but hey, the overall result of failing to 
work as expected is the same.)

Thanks,
Robin.
