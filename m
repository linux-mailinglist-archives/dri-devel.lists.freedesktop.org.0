Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 56356675E08
	for <lists+dri-devel@lfdr.de>; Fri, 20 Jan 2023 20:28:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1486710E13F;
	Fri, 20 Jan 2023 19:28:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 1B06F10E13F;
 Fri, 20 Jan 2023 19:28:28 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CB11511FB;
 Fri, 20 Jan 2023 11:29:08 -0800 (PST)
Received: from [10.57.89.132] (unknown [10.57.89.132])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A6FF03F445;
 Fri, 20 Jan 2023 11:28:23 -0800 (PST)
Message-ID: <f24fcba7-2fcb-ed43-05da-60763dbb07bf@arm.com>
Date: Fri, 20 Jan 2023 19:28:19 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2 04/10] iommu/dma: Use the gfp parameter in
 __iommu_dma_alloc_noncontiguous()
Content-Language: en-GB
To: Jason Gunthorpe <jgg@nvidia.com>, Lu Baolu <baolu.lu@linux.intel.com>,
 Joerg Roedel <joro@8bytes.org>, Kevin Tian <kevin.tian@intel.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>
References: <4-v2-ce66f632bd0d+484-iommu_map_gfp_jgg@nvidia.com>
From: Robin Murphy <robin.murphy@arm.com>
In-Reply-To: <4-v2-ce66f632bd0d+484-iommu_map_gfp_jgg@nvidia.com>
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
Cc: linux-s390@vger.kernel.org, kvm@vger.kernel.org,
 nouveau@lists.freedesktop.org, linux-rdma@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, Niklas Schnelle <schnelle@linux.ibm.com>,
 linux-remoteproc@vger.kernel.org, iommu@lists.linux.dev,
 dri-devel@lists.freedesktop.org, linux-stm32@st-md-mailman.stormreply.com,
 Alex Williamson <alex.williamson@redhat.com>, netdev@vger.kernel.org,
 ath10k@lists.infradead.org, linux-wireless@vger.kernel.org,
 linux-tegra@vger.kernel.org, Christian Borntraeger <borntraeger@linux.ibm.com>,
 virtualization@lists.linux-foundation.org, ath11k@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-01-18 18:00, Jason Gunthorpe wrote:
> Change the sg_alloc_table_from_pages() allocation that was hardwired to
> GFP_KERNEL to use the gfp parameter like the other allocations in this
> function.
> 
> Auditing says this is never called from an atomic context, so it is safe
> as is, but reads wrong.

I think the point may have been that the sgtable metadata is a 
logically-distinct allocation from the buffer pages themselves. Much 
like the allocation of the pages array itself further down in 
__iommu_dma_alloc_pages(). I see these days it wouldn't be catastrophic 
to pass GFP_HIGHMEM into __get_free_page() via sg_kmalloc(), but still, 
allocating implementation-internal metadata with all the same 
constraints as a DMA buffer has just as much smell of wrong about it IMO.

I'd say the more confusing thing about this particular context is why 
we're using iommu_map_sg_atomic() further down - that seems to have been 
an oversight in 781ca2de89ba, since this particular path has never 
supported being called in atomic context.

Overall I'm starting to wonder if it might not be better to stick a "use 
GFP_KERNEL_ACCOUNT if you allocate" flag in the domain for any level of 
the API internals to pick up as appropriate, rather than propagate 
per-call gfp flags everywhere. As it stands we're still missing 
potential pagetable and other domain-related allocations by drivers in 
.attach_dev and even (in probably-shouldn't-really-happen cases) 
.unmap_pages...

Thanks,
Robin.

> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> ---
>   drivers/iommu/dma-iommu.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/iommu/dma-iommu.c b/drivers/iommu/dma-iommu.c
> index 8c2788633c1766..e4bf1bb159f7c7 100644
> --- a/drivers/iommu/dma-iommu.c
> +++ b/drivers/iommu/dma-iommu.c
> @@ -822,7 +822,7 @@ static struct page **__iommu_dma_alloc_noncontiguous(struct device *dev,
>   	if (!iova)
>   		goto out_free_pages;
>   
> -	if (sg_alloc_table_from_pages(sgt, pages, count, 0, size, GFP_KERNEL))
> +	if (sg_alloc_table_from_pages(sgt, pages, count, 0, size, gfp))
>   		goto out_free_iova;
>   
>   	if (!(ioprot & IOMMU_CACHE)) {
