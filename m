Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A5FD187617
	for <lists+dri-devel@lfdr.de>; Tue, 17 Mar 2020 00:11:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 262816E500;
	Mon, 16 Mar 2020 23:11:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqnvemgate25.nvidia.com (hqnvemgate25.nvidia.com
 [216.228.121.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9151E89836;
 Mon, 16 Mar 2020 23:11:47 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5e7007820000>; Mon, 16 Mar 2020 16:10:59 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Mon, 16 Mar 2020 16:11:47 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Mon, 16 Mar 2020 16:11:47 -0700
Received: from rcampbell-dev.nvidia.com (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 16 Mar
 2020 23:11:46 +0000
Subject: Re: [PATCH 4/4] mm: check the device private page owner in
 hmm_range_fault
To: Christoph Hellwig <hch@lst.de>, Jason Gunthorpe <jgg@ziepe.ca>, Dan
 Williams <dan.j.williams@intel.com>, Bharata B Rao <bharata@linux.ibm.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>, Ben Skeggs
 <bskeggs@redhat.com>
References: <20200316193216.920734-1-hch@lst.de>
 <20200316193216.920734-5-hch@lst.de>
X-Nvconfidentiality: public
From: Ralph Campbell <rcampbell@nvidia.com>
Message-ID: <a2d0ab4c-2494-297c-3762-af6145a35b05@nvidia.com>
Date: Mon, 16 Mar 2020 16:11:45 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200316193216.920734-5-hch@lst.de>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1584400259; bh=BFbOo6dxY6v+iqwVfEQYtbxUzYcXzSUMoMcJGktV+cc=;
 h=X-PGP-Universal:Subject:To:CC:References:X-Nvconfidentiality:From:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=oVJEhRDKOA0SvoatXQki0C4N9b/oEdW++EJZIqu0fbf16eblobj3Sl0IrkCYYAzv3
 8rLH0K4H1TqGHS+SvhBvYWxDNtHZbX/tzvzsYfTyb9HZP1Js9A4Ru/dEaqcrhFGJgq
 rYA9wNa4sbvuRLr7k0cPoI8Y5MvDQd3z9JnWilpHVbaflORJ2r4WdGrNXgPr3wmRLL
 ihTtFqMmbaG4sfXzFJpul2eoGjwmZGvxs/v9TNACDOzuLLY09xQNnOfxTbzptrBQZx
 EyIed8o2SKpprI0fULtvysMh0Tuu5qFkYh0tI2Mo+PAmhg0SCSDKbFG/YOfdyDhJH0
 fpiMT9nKCEpGQ==
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
Cc: kvm-ppc@vger.kernel.org, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 Jerome Glisse <jglisse@redhat.com>, amd-gfx@lists.freedesktop.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 3/16/20 12:32 PM, Christoph Hellwig wrote:
> Hmm range fault will succeed for any kind of device private memory,
> even if it doesn't belong to the calling entity.  While nouveau
> has some crude checks for that, they are broken because they assume
> nouveau is the only user of device private memory.  Fix this by
> passing in an expected pgmap owner in the hmm_range_fault structure.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> Fixes: 4ef589dc9b10 ("mm/hmm/devmem: device memory hotplug using ZONE_DEVICE")

Looks good.
Reviewed-by: Ralph Campbell <rcampbell@nvidia.com>

> ---
>   drivers/gpu/drm/nouveau/nouveau_dmem.c | 12 ------------
>   include/linux/hmm.h                    |  2 ++
>   mm/hmm.c                               | 10 +++++++++-
>   3 files changed, 11 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nouveau_dmem.c b/drivers/gpu/drm/nouveau/nouveau_dmem.c
> index edfd0805fba4..ad89e09a0be3 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_dmem.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_dmem.c
> @@ -672,12 +672,6 @@ nouveau_dmem_migrate_vma(struct nouveau_drm *drm,
>   	return ret;
>   }
>   
> -static inline bool
> -nouveau_dmem_page(struct nouveau_drm *drm, struct page *page)
> -{
> -	return is_device_private_page(page) && drm->dmem == page_to_dmem(page);
> -}
> -
>   void
>   nouveau_dmem_convert_pfn(struct nouveau_drm *drm,
>   			 struct hmm_range *range)
> @@ -696,12 +690,6 @@ nouveau_dmem_convert_pfn(struct nouveau_drm *drm,
>   		if (!is_device_private_page(page))
>   			continue;
>   
> -		if (!nouveau_dmem_page(drm, page)) {
> -			WARN(1, "Some unknown device memory !\n");
> -			range->pfns[i] = 0;
> -			continue;
> -		}
> -
>   		addr = nouveau_dmem_page_addr(page);
>   		range->pfns[i] &= ((1UL << range->pfn_shift) - 1);
>   		range->pfns[i] |= (addr >> PAGE_SHIFT) << range->pfn_shift;
> diff --git a/include/linux/hmm.h b/include/linux/hmm.h
> index 5e6034f105c3..bb6be4428633 100644
> --- a/include/linux/hmm.h
> +++ b/include/linux/hmm.h
> @@ -132,6 +132,7 @@ enum hmm_pfn_value_e {
>    * @pfn_flags_mask: allows to mask pfn flags so that only default_flags matter
>    * @pfn_shifts: pfn shift value (should be <= PAGE_SHIFT)
>    * @valid: pfns array did not change since it has been fill by an HMM function
> + * @dev_private_owner: owner of device private pages
>    */
>   struct hmm_range {
>   	struct mmu_interval_notifier *notifier;
> @@ -144,6 +145,7 @@ struct hmm_range {
>   	uint64_t		default_flags;
>   	uint64_t		pfn_flags_mask;
>   	uint8_t			pfn_shift;
> +	void			*dev_private_owner;
>   };
>   
>   /*
> diff --git a/mm/hmm.c b/mm/hmm.c
> index cfad65f6a67b..b75b3750e03d 100644
> --- a/mm/hmm.c
> +++ b/mm/hmm.c
> @@ -216,6 +216,14 @@ int hmm_vma_handle_pmd(struct mm_walk *walk, unsigned long addr,
>   		unsigned long end, uint64_t *pfns, pmd_t pmd);
>   #endif /* CONFIG_TRANSPARENT_HUGEPAGE */
>   
> +static inline bool hmm_is_device_private_entry(struct hmm_range *range,
> +		swp_entry_t entry)
> +{
> +	return is_device_private_entry(entry) &&
> +		device_private_entry_to_page(entry)->pgmap->owner ==
> +		range->dev_private_owner;
> +}
> +
>   static inline uint64_t pte_to_hmm_pfn_flags(struct hmm_range *range, pte_t pte)
>   {
>   	if (pte_none(pte) || !pte_present(pte) || pte_protnone(pte))
> @@ -254,7 +262,7 @@ static int hmm_vma_handle_pte(struct mm_walk *walk, unsigned long addr,
>   		 * Never fault in device private pages pages, but just report
>   		 * the PFN even if not present.
>   		 */
> -		if (is_device_private_entry(entry)) {
> +		if (hmm_is_device_private_entry(range, entry)) {
>   			*pfn = hmm_device_entry_from_pfn(range,
>   					    swp_offset(entry));
>   			*pfn |= range->flags[HMM_PFN_VALID];
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
