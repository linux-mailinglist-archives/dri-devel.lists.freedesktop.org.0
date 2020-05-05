Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2A2F1C4B87
	for <lists+dri-devel@lfdr.de>; Tue,  5 May 2020 03:30:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F02E96E059;
	Tue,  5 May 2020 01:30:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqnvemgate24.nvidia.com (hqnvemgate24.nvidia.com
 [216.228.121.143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B1FD6E030;
 Tue,  5 May 2020 01:30:02 +0000 (UTC)
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5eb0c1190000>; Mon, 04 May 2020 18:27:53 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate102.nvidia.com (PGP Universal service);
 Mon, 04 May 2020 18:30:01 -0700
X-PGP-Universal: processed;
 by hqpgpgate102.nvidia.com on Mon, 04 May 2020 18:30:01 -0700
Received: from [10.2.56.198] (172.20.13.39) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 5 May
 2020 01:30:01 +0000
Subject: Re: [PATCH hmm v2 5/5] mm/hmm: remove the customizable pfn format
 from hmm_range_fault
To: Jason Gunthorpe <jgg@ziepe.ca>, <linux-mm@kvack.org>, Ralph Campbell
 <rcampbell@nvidia.com>
References: <5-v2-b4e84f444c7d+24f57-hmm_no_flags_jgg@mellanox.com>
X-Nvconfidentiality: public
From: John Hubbard <jhubbard@nvidia.com>
Message-ID: <c0d02b98-c356-60b1-6043-5b8d1a9be19a@nvidia.com>
Date: Mon, 4 May 2020 18:30:00 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <5-v2-b4e84f444c7d+24f57-hmm_no_flags_jgg@mellanox.com>
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1588642074; bh=0RmV3sG8w7ohZ9OHDH/pFQovyGtqFiweq5osGERvRpo=;
 h=X-PGP-Universal:Subject:To:CC:References:X-Nvconfidentiality:From:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=eOY1+0+N16Z8aXdaiKYs4SjvO5ciGMllXCnn4JHvxrMNegzH6IgzBrgMQ6KLknx+2
 NW61WlLixaCXwpAX66FkMFk33D1AZxP9m+6e4xhyt3iViJHKiqZE0yxobywOngahYp
 Oa4t4//YPZ9FBYbFVnWJS7FFUuGNZMQcvthU8XFKEm+qluSRkODN/sHHCRiJUh5bGf
 BKKLGG2OcIR8QibGldQa4e9evirUYK9GxZAkXDoSgZQj+ERLHJV3M/7/AZZ0+IMwVQ
 /QA2kar4rqltVlXZDL6gLT9+eQ5GwMKMARyXGnZEQoIO2rCTlEo8sgwnQQ5HXAkQnM
 O4nW+Hut9230g==
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
Cc: amd-gfx@lists.freedesktop.org, "Yang, Philip" <Philip.Yang@amd.com>,
 nouveau@lists.freedesktop.org, Felix Kuehling <Felix.Kuehling@amd.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Christoph Hellwig <hch@lst.de>,
 =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
 Ben Skeggs <bskeggs@redhat.com>, Alex Deucher <alexander.deucher@amd.com>,
 Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>,
 intel-gfx@lists.freedesktop.org,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2020-05-01 11:20, Jason Gunthorpe wrote:
> From: Jason Gunthorpe <jgg@mellanox.com>
> 
> Presumably the intent here was that hmm_range_fault() could put the data
> into some HW specific format and thus avoid some work. However, nothing
> actually does that, and it isn't clear how anything actually could do that
> as hmm_range_fault() provides CPU addresses which must be DMA mapped.
> 
> Perhaps there is some special HW that does not need DMA mapping, but we
> don't have any examples of this, and the theoretical performance win of
> avoiding an extra scan over the pfns array doesn't seem worth the
> complexity. Plus pfns needs to be scanned anyhow to sort out any
> DEVICE_PRIVATE pages.
> 
> This version replaces the uint64_t with an usigned long containing a pfn
> and fixed flags. On input flags is filled with the HMM_PFN_REQ_* values,
> on successful output it is filled with HMM_PFN_* values, describing the
> state of the pages.
> 

Just some minor stuff below. I wasn't able to spot any errors in the code,
though, so these are just documentation nits.


...

> 
> diff --git a/Documentation/vm/hmm.rst b/Documentation/vm/hmm.rst
> index 9924f2caa0184c..c9f2329113a47f 100644
> --- a/Documentation/vm/hmm.rst
> +++ b/Documentation/vm/hmm.rst
> @@ -185,9 +185,6 @@ The usage pattern is::
>         range.start = ...;
>         range.end = ...;
>         range.pfns = ...;

That should be:

           range.hmm_pfns = ...;


> -      range.flags = ...;
> -      range.values = ...;
> -      range.pfn_shift = ...;
>   
>         if (!mmget_not_zero(interval_sub->notifier.mm))
>             return -EFAULT;
> @@ -229,15 +226,10 @@ The hmm_range struct has 2 fields, default_flags and pfn_flags_mask, that specif
>   fault or snapshot policy for the whole range instead of having to set them
>   for each entry in the pfns array.
>   
> -For instance, if the device flags for range.flags are::
> +For instance if the device driver wants pages for a range with at least read
> +permission, it sets::
>   
> -    range.flags[HMM_PFN_VALID] = (1 << 63);
> -    range.flags[HMM_PFN_WRITE] = (1 << 62);
> -
> -and the device driver wants pages for a range with at least read permission,
> -it sets::
> -
> -    range->default_flags = (1 << 63);
> +    range->default_flags = HMM_PFN_REQ_FAULT;
>       range->pfn_flags_mask = 0;
>   
>   and calls hmm_range_fault() as described above. This will fill fault all pages
> @@ -246,18 +238,18 @@ in the range with at least read permission.
>   Now let's say the driver wants to do the same except for one page in the range for
>   which it wants to have write permission. Now driver set::
>   
> -    range->default_flags = (1 << 63);
> -    range->pfn_flags_mask = (1 << 62);
> -    range->pfns[index_of_write] = (1 << 62);
> +    range->default_flags = HMM_PFN_REQ_FAULT;
> +    range->pfn_flags_mask = HMM_PFN_REQ_WRITE;
> +    range->pfns[index_of_write] = HMM_PFN_REQ_WRITE;


All these choices for _WRITE behavior make it slightly confusing. I mean, it's
better than it was, but there are default flags, a mask, and an index as well,
and it looks like maybe we have a little more power and flexibility than
desirable? Nouveau for example is now just setting the mask only:

// nouveau_range_fault():
     .pfn_flags_mask = HMM_PFN_REQ_FAULT | HMM_PFN_REQ_WRITE,
     (.default_flags is not set, so is zero)

Maybe the example should do what Nouveau is doing? And/or do we want to get rid
of either .default_flags or .pfn_flags_mask?

...

> diff --git a/drivers/gpu/drm/nouveau/nouveau_svm.c b/drivers/gpu/drm/nouveau/nouveau_svm.c
> index cf0d9bd61bebf9..99697df28bfe12 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_svm.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_svm.c

...

> @@ -518,9 +506,45 @@ static const struct mmu_interval_notifier_ops nouveau_svm_mni_ops = {
>   	.invalidate = nouveau_svm_range_invalidate,
>   };
>   
> +static void nouveau_hmm_convert_pfn(struct nouveau_drm *drm,
> +				    struct hmm_range *range, u64 *ioctl_addr)
> +{
> +	unsigned long i, npages;
> +
> +	/*
> +	 * The ioctl_addr prepared here is passed through nvif_object_ioctl()
> +	 * to an eventual DMA map in something like gp100_vmm_pgt_pfn()
> +	 *
> +	 * This is all just encoding the internal hmm reprensetation into a

"representation"

...

> @@ -542,12 +564,15 @@ static int nouveau_range_fault(struct nouveau_svmm *svmm,
>   			return -EBUSY;
>   
>   		range.notifier_seq = mmu_interval_read_begin(range.notifier);
> -		range.default_flags = 0;
> -		range.pfn_flags_mask = -1UL;
>   		down_read(&mm->mmap_sem);
>   		ret = hmm_range_fault(&range);
>   		up_read(&mm->mmap_sem);
>   		if (ret) {
> +			/*
> +			 * FIXME: the input PFN_REQ flags are destroyed on
> +			 * -EBUSY, we need to regenerate them, also for the
> +			 * other continue below
> +			 */


How serious is this FIXME? It seems like we could get stuck in a loop here,
if we're not issuing a new REQ, right?


>   			if (ret == -EBUSY)
>   				continue;
>   			return ret;
> @@ -562,7 +587,7 @@ static int nouveau_range_fault(struct nouveau_svmm *svmm,
>   		break;
>   	}
>   
> -	nouveau_dmem_convert_pfn(drm, &range);
> +	nouveau_hmm_convert_pfn(drm, &range, ioctl_addr);
>   
>   	svmm->vmm->vmm.object.client->super = true;
>   	ret = nvif_object_ioctl(&svmm->vmm->vmm.object, data, size, NULL);
> @@ -589,6 +614,7 @@ nouveau_svm_fault(struct nvif_notify *notify)
>   		} i;
>   		u64 phys[16];
>   	} args;
> +	unsigned long hmm_pfns[ARRAY_SIZE(args.phys)];


Is there a risk of blowing up the stack here?

...

> --- a/include/linux/hmm.h
> +++ b/include/linux/hmm.h
> @@ -19,45 +19,45 @@
>   #include <linux/mmu_notifier.h>
>   
>   /*
> - * hmm_pfn_flag_e - HMM flag enums
> + * On output:
> + * 0             - The page is faultable and a future call with
> + *                 HMM_PFN_REQ_FAULT could succeed.
> + * HMM_PFN_VALID - the pfn field points to a valid PFN. This PFN is at
> + *                 least readable. If dev_private_owner is !NULL then this could
> + *                 point at a DEVICE_PRIVATE page.
> + * HMM_PFN_WRITE - if the page memory can be written to (requires HMM_PFN_VALID)
> + * HMM_PFN_ERROR - accessing the pfn is impossible and the device should
> + *                 fail. ie poisoned memory, special pages, no vma, etc
>    *
> - * Flags:
> - * HMM_PFN_VALID: pfn is valid. It has, at least, read permission.
> - * HMM_PFN_WRITE: CPU page table has write permission set
> - *
> - * The driver provides a flags array for mapping page protections to device
> - * PTE bits. If the driver valid bit for an entry is bit 3,
> - * i.e., (entry & (1 << 3)), then the driver must provide
> - * an array in hmm_range.flags with hmm_range.flags[HMM_PFN_VALID] == 1 << 3.
> - * Same logic apply to all flags. This is the same idea as vm_page_prot in vma
> - * except that this is per device driver rather than per architecture.
> + * On input:
> + * 0                 - Return the current state of the page, do not fault it.
> + * HMM_PFN_REQ_FAULT - The output must have HMM_PFN_VALID or hmm_range_fault()
> + *                     will fail
> + * HMM_PFN_REQ_WRITE - The output must have HMM_PFN_WRITE or hmm_range_fault()
> + *                     will fail. Must be combined with HMM_PFN_REQ_FAULT.
>    */
> -enum hmm_pfn_flag_e {
> -	HMM_PFN_VALID = 0,
> -	HMM_PFN_WRITE,
> -	HMM_PFN_FLAG_MAX
> +enum hmm_pfn_flags {

Let's add:

         /* Output flags: */

> +	HMM_PFN_VALID = 1UL << (BITS_PER_LONG - 1),
> +	HMM_PFN_WRITE = 1UL << (BITS_PER_LONG - 2),
> +	HMM_PFN_ERROR = 1UL << (BITS_PER_LONG - 3),
> +

         /* Input flags: */

...

> @@ -174,44 +162,44 @@ static int hmm_vma_walk_hole(unsigned long addr, unsigned long end,
>   	}
>   	if (required_fault)
>   		return hmm_vma_fault(addr, end, required_fault, walk);
> -	return hmm_pfns_fill(addr, end, range, HMM_PFN_NONE);
> +	return hmm_pfns_fill(addr, end, range, 0);
>   }
>   
> -static inline uint64_t pmd_to_hmm_pfn_flags(struct hmm_range *range, pmd_t pmd)
> +static inline unsigned long pmd_to_hmm_pfn_flags(struct hmm_range *range,
> +						 pmd_t pmd)
>   {
>   	if (pmd_protnone(pmd))
>   		return 0;
> -	return pmd_write(pmd) ? range->flags[HMM_PFN_VALID] |
> -				range->flags[HMM_PFN_WRITE] :
> -				range->flags[HMM_PFN_VALID];
> +	return pmd_write(pmd) ? (HMM_PFN_VALID | HMM_PFN_WRITE) : HMM_PFN_VALID;


I always found the previous range->flags[...] approach hard to remember, so it's
nice to see a simpler version now.


thanks,
-- 
John Hubbard
NVIDIA
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
