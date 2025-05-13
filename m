Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9839FAB4EDA
	for <lists+dri-devel@lfdr.de>; Tue, 13 May 2025 11:10:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2766710E1D4;
	Tue, 13 May 2025 09:10:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="LOZsfC9+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB95510E1D4
 for <dri-devel@lists.freedesktop.org>; Tue, 13 May 2025 09:10:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1747127451;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=xRw8K0GCG9Y9Bw/zOLR2bmWzH8I8Xdc1bw9RZcjFhAY=;
 b=LOZsfC9++8IoCCqHs5Yuz7SBE1k+Ule1KT4H46q+Dk1z/4yQa60xJgCOjYmoLtnzcv5C8z
 CQrbvDuyuKsLvrv8svTIyFlJvVahmH4Bmxc9nlK0DMFO1iAl2kGRfU8Ot2gXRziSGsQgTN
 wD6G0MFfShmEnu8WbiTKVlaJxRXEi5s=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-576-ae2wqB4uOBq3NXt5R4elTA-1; Tue, 13 May 2025 05:10:49 -0400
X-MC-Unique: ae2wqB4uOBq3NXt5R4elTA-1
X-Mimecast-MFC-AGG-ID: ae2wqB4uOBq3NXt5R4elTA_1747127448
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-3a0b9bbfb0fso2949217f8f.1
 for <dri-devel@lists.freedesktop.org>; Tue, 13 May 2025 02:10:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747127448; x=1747732248;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:from:references:cc:to:subject:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=xRw8K0GCG9Y9Bw/zOLR2bmWzH8I8Xdc1bw9RZcjFhAY=;
 b=kImsgiCWk9cBaR/wRBzXTgDTL+TZ0jYLLs6YIOht3bzZ81X05JMnuQHKGyzOQgCJT6
 ZqAZN/e/2AXyhjj//AjyXfKsiQ5nhljfrhIx2//8b4XdObG88LHEHO988c7CmRjrFD+X
 a3U3/cRDZpq5uLfuw1BkHZlZsARpu/PSWaiWPDaBpOAALF7KZ2nXd6OHGI5d71BS6psR
 hq/3Yt5waaXFw5ZjCIr5Zpr3zWuHoFwqRwvvdxLsZm5OVY6+A1lSaic3M4A8iex8v6xB
 7fLOc3ixPm1jvXmPoo3FwRmwgRCckMz91UTge1wIanrAI45lx7WmHZkE+oEPizGzXP3O
 iGhA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXFjDyITShfkGbHERUB/in+5FV/+aZssi727OuMYEGrsH8L+h4cqqPviZpx/hBKvjrOwqa8+gd8mew=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywcq+gtv6rQIQwgtew+WARXHFoI5GYWtezTzI2Q1s3vk8ysaE/C
 9SxJNYwIW3CHdDRcohs3kH6tkRISrJRc3AmLGCWPL5h92Ji9rf96zszDFeEb6gVy8yzb9VuLxdj
 EF/DgjcQUj825zRrXV04pUP75ZF3AlDBW/L6gm2yXxb4XDXkgYSSbxQFOHZDZtLncMQ==
X-Gm-Gg: ASbGncusFhR+1u+8VWLqCyJW1InPI4l2sit7e8I08wtWPrTARw4s5tiFr1ubpfUxpxW
 CPFYfLdqq7dTFaeiZzY37WLrr1uCqNv5WTJtb0jDAV2lSauIm00+5rkjZheMZK7mjEEtsxhva1U
 iFGhMLfJVkB4BIELcQ05BvXJq07e1JkV6U0/PYYtdi+Vfs2O27KvakANjwqpCemy7TUsSe3Fjva
 BH0KyLZq9btq3blJuHcJuAAODZP7VtyjxJdIENZlS/sDb9HosqcXiGIEpgrBKEEL1boH7p1vDL+
 zN63HAXpNCK6CC5d6fwNo3mCZQWOM2w9NFmjlBAmtLTphLXhUocOKW1gN/mMGOXFv9z5g7sPIpQ
 ebsvps8CnIFBgIzBdpDZi29nTsU2Mp+nZWk6747s=
X-Received: by 2002:a05:6000:3102:b0:39c:cd5:4bc0 with SMTP id
 ffacd0b85a97d-3a1f64ae7bamr14020828f8f.52.1747127448207; 
 Tue, 13 May 2025 02:10:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHhMfGXX+LfoTaRmQxDRv9M6jlSovi0I1OJwxnluMn2RG9cmrKRWpV5jdZZJbJOGzf1wyCCZw==
X-Received: by 2002:a05:6000:3102:b0:39c:cd5:4bc0 with SMTP id
 ffacd0b85a97d-3a1f64ae7bamr14020781f8f.52.1747127447724; 
 Tue, 13 May 2025 02:10:47 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f4d:1a00:4fdf:53e2:1a36:ba34?
 (p200300d82f4d1a004fdf53e21a36ba34.dip0.t-ipconnect.de.
 [2003:d8:2f4d:1a00:4fdf:53e2:1a36:ba34])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a1f58f2a07sm15737321f8f.50.2025.05.13.02.10.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 May 2025 02:10:47 -0700 (PDT)
Message-ID: <c7a4d470-16a7-423f-b9a4-a73210596d8b@redhat.com>
Date: Tue, 13 May 2025 11:10:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 04/11] mm: convert VM_PFNMAP tracking to pfnmap_track()
 + pfnmap_untrack()
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org, x86@kernel.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-trace-kernel@vger.kernel.org, Dave Hansen
 <dave.hansen@linux.intel.com>, Andy Lutomirski <luto@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 "H. Peter Anvin" <hpa@zytor.com>, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Andrew Morton <akpm@linux-foundation.org>,
 Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu
 <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka
 <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
 Pedro Falcato <pfalcato@suse.de>, Peter Xu <peterx@redhat.com>,
 Ingo Molnar <mingo@kernel.org>
References: <20250512123424.637989-1-david@redhat.com>
 <20250512123424.637989-5-david@redhat.com>
 <d180a8d2-87e2-4878-bca1-e6986b7fc110@lucifer.local>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <d180a8d2-87e2-4878-bca1-e6986b7fc110@lucifer.local>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: GwegWb3WI93Wb-X2jQT1Y803G_3buNewdKBlPaE-6YI_1747127448
X-Mimecast-Originator: redhat.com
Content-Language: en-US
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

On 12.05.25 18:42, Lorenzo Stoakes wrote:
> On Mon, May 12, 2025 at 02:34:17PM +0200, David Hildenbrand wrote:
>> Let's use our new interface. In remap_pfn_range(), we'll now decide
>> whether we have to track (full VMA covered) or only lookup the
>> cachemode (partial VMA covered).
>>
>> Remember what we have to untrack by linking it from the VMA. When
>> duplicating VMAs (e.g., splitting, mremap, fork), we'll handle it similar
>> to anon VMA names, and use a kref to share the tracking.
>>
>> Once the last VMA un-refs our tracking data, we'll do the untracking,
>> which simplifies things a lot and should sort our various issues we saw
>> recently, for example, when partially unmapping/zapping a tracked VMA.
>>
>> This change implies that we'll keep tracking the original PFN range even
>> after splitting + partially unmapping it: not too bad, because it was
>> not working reliably before. The only thing that kind-of worked before
>> was shrinking such a mapping using mremap(): we managed to adjust the
>> reservation in a hacky way, now we won't adjust the reservation but
>> leave it around until all involved VMAs are gone.
>>
>> If that ever turns out to be an issue, we could hook into VM splitting
>> code and split the tracking; however, that adds complexity that might
>> not be required, so we'll keep it simple for now.
>>
>> Acked-by: Ingo Molnar <mingo@kernel.org> # x86 bits
>> Signed-off-by: David Hildenbrand <david@redhat.com>
> 
> Other than small nit below,
> 
> Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> 
>> ---
>>   include/linux/mm_inline.h |  2 +
>>   include/linux/mm_types.h  | 11 ++++++
>>   mm/memory.c               | 82 +++++++++++++++++++++++++++++++--------
>>   mm/mmap.c                 |  5 ---
>>   mm/mremap.c               |  4 --
>>   mm/vma_init.c             | 50 ++++++++++++++++++++++++
>>   6 files changed, 129 insertions(+), 25 deletions(-)
>>
>> diff --git a/include/linux/mm_inline.h b/include/linux/mm_inline.h
>> index f9157a0c42a5c..89b518ff097e6 100644
>> --- a/include/linux/mm_inline.h
>> +++ b/include/linux/mm_inline.h
>> @@ -447,6 +447,8 @@ static inline bool anon_vma_name_eq(struct anon_vma_name *anon_name1,
>>
>>   #endif  /* CONFIG_ANON_VMA_NAME */
>>
>> +void pfnmap_track_ctx_release(struct kref *ref);
>> +
>>   static inline void init_tlb_flush_pending(struct mm_struct *mm)
>>   {
>>   	atomic_set(&mm->tlb_flush_pending, 0);
>> diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
>> index 15808cad2bc1a..3e934dc6057c4 100644
>> --- a/include/linux/mm_types.h
>> +++ b/include/linux/mm_types.h
>> @@ -763,6 +763,14 @@ struct vma_numab_state {
>>   	int prev_scan_seq;
>>   };
>>
>> +#ifdef __HAVE_PFNMAP_TRACKING
>> +struct pfnmap_track_ctx {
>> +	struct kref kref;
>> +	unsigned long pfn;
>> +	unsigned long size;	/* in bytes */
>> +};
>> +#endif
>> +
>>   /*
>>    * Describes a VMA that is about to be mmap()'ed. Drivers may choose to
>>    * manipulate mutable fields which will cause those fields to be updated in the
>> @@ -900,6 +908,9 @@ struct vm_area_struct {
>>   	struct anon_vma_name *anon_name;
>>   #endif
>>   	struct vm_userfaultfd_ctx vm_userfaultfd_ctx;
>> +#ifdef __HAVE_PFNMAP_TRACKING
>> +	struct pfnmap_track_ctx *pfnmap_track_ctx;
>> +#endif
>>   } __randomize_layout;
>>
>>   #ifdef CONFIG_NUMA
>> diff --git a/mm/memory.c b/mm/memory.c
>> index 064fc55d8eab9..4cf4adb0de266 100644
>> --- a/mm/memory.c
>> +++ b/mm/memory.c
>> @@ -1371,7 +1371,7 @@ copy_page_range(struct vm_area_struct *dst_vma, struct vm_area_struct *src_vma)
>>   	struct mm_struct *dst_mm = dst_vma->vm_mm;
>>   	struct mm_struct *src_mm = src_vma->vm_mm;
>>   	struct mmu_notifier_range range;
>> -	unsigned long next, pfn = 0;
>> +	unsigned long next;
>>   	bool is_cow;
>>   	int ret;
>>
>> @@ -1381,12 +1381,6 @@ copy_page_range(struct vm_area_struct *dst_vma, struct vm_area_struct *src_vma)
>>   	if (is_vm_hugetlb_page(src_vma))
>>   		return copy_hugetlb_page_range(dst_mm, src_mm, dst_vma, src_vma);
>>
>> -	if (unlikely(src_vma->vm_flags & VM_PFNMAP)) {
>> -		ret = track_pfn_copy(dst_vma, src_vma, &pfn);
>> -		if (ret)
>> -			return ret;
>> -	}
>> -
>>   	/*
>>   	 * We need to invalidate the secondary MMU mappings only when
>>   	 * there could be a permission downgrade on the ptes of the
>> @@ -1428,8 +1422,6 @@ copy_page_range(struct vm_area_struct *dst_vma, struct vm_area_struct *src_vma)
>>   		raw_write_seqcount_end(&src_mm->write_protect_seq);
>>   		mmu_notifier_invalidate_range_end(&range);
>>   	}
>> -	if (ret && unlikely(src_vma->vm_flags & VM_PFNMAP))
>> -		untrack_pfn_copy(dst_vma, pfn);
>>   	return ret;
>>   }
>>
>> @@ -1924,9 +1916,6 @@ static void unmap_single_vma(struct mmu_gather *tlb,
>>   	if (vma->vm_file)
>>   		uprobe_munmap(vma, start, end);
>>
>> -	if (unlikely(vma->vm_flags & VM_PFNMAP))
>> -		untrack_pfn(vma, 0, 0, mm_wr_locked);
>> -
>>   	if (start != end) {
>>   		if (unlikely(is_vm_hugetlb_page(vma))) {
>>   			/*
>> @@ -2872,6 +2861,36 @@ int remap_pfn_range_notrack(struct vm_area_struct *vma, unsigned long addr,
>>   	return error;
>>   }
>>
>> +#ifdef __HAVE_PFNMAP_TRACKING
>> +static inline struct pfnmap_track_ctx *pfnmap_track_ctx_alloc(unsigned long pfn,
>> +		unsigned long size, pgprot_t *prot)
>> +{
>> +	struct pfnmap_track_ctx *ctx;
>> +
>> +	if (pfnmap_track(pfn, size, prot))
>> +		return ERR_PTR(-EINVAL);
>> +
>> +	ctx = kmalloc(sizeof(*ctx), GFP_KERNEL);
>> +	if (unlikely(!ctx)) {
>> +		pfnmap_untrack(pfn, size);
>> +		return ERR_PTR(-ENOMEM);
>> +	}
>> +
>> +	ctx->pfn = pfn;
>> +	ctx->size = size;
>> +	kref_init(&ctx->kref);
>> +	return ctx;
>> +}
>> +
>> +void pfnmap_track_ctx_release(struct kref *ref)
>> +{
>> +	struct pfnmap_track_ctx *ctx = container_of(ref, struct pfnmap_track_ctx, kref);
>> +
>> +	pfnmap_untrack(ctx->pfn, ctx->size);
>> +	kfree(ctx);
>> +}
>> +#endif /* __HAVE_PFNMAP_TRACKING */
>> +
>>   /**
>>    * remap_pfn_range - remap kernel memory to userspace
>>    * @vma: user vma to map to
>> @@ -2884,20 +2903,51 @@ int remap_pfn_range_notrack(struct vm_area_struct *vma, unsigned long addr,
>>    *
>>    * Return: %0 on success, negative error code otherwise.
>>    */
>> +#ifdef __HAVE_PFNMAP_TRACKING
>>   int remap_pfn_range(struct vm_area_struct *vma, unsigned long addr,
>>   		    unsigned long pfn, unsigned long size, pgprot_t prot)
>>   {
>> +	struct pfnmap_track_ctx *ctx = NULL;
>>   	int err;
>>
>> -	err = track_pfn_remap(vma, &prot, pfn, addr, PAGE_ALIGN(size));
>> -	if (err)
>> +	size = PAGE_ALIGN(size);
>> +
>> +	/*
>> +	 * If we cover the full VMA, we'll perform actual tracking, and
>> +	 * remember to untrack when the last reference to our tracking
>> +	 * context from a VMA goes away. We'll keep tracking the whole pfn
>> +	 * range even during VMA splits and partial unmapping.
>> +	 *
>> +	 * If we only cover parts of the VMA, we'll only setup the cachemode
>> +	 * in the pgprot for the pfn range.
>> +	 */
>> +	if (addr == vma->vm_start && addr + size == vma->vm_end) {
>> +		if (vma->pfnmap_track_ctx)
>> +			return -EINVAL;
>> +		ctx = pfnmap_track_ctx_alloc(pfn, size, &prot);
>> +		if (IS_ERR(ctx))
>> +			return PTR_ERR(ctx);
>> +	} else if (pfnmap_setup_cachemode(pfn, size, &prot)) {
>>   		return -EINVAL;
>> +	}
>>
>>   	err = remap_pfn_range_notrack(vma, addr, pfn, size, prot);
>> -	if (err)
>> -		untrack_pfn(vma, pfn, PAGE_ALIGN(size), true);
>> +	if (ctx) {
>> +		if (err)
>> +			kref_put(&ctx->kref, pfnmap_track_ctx_release);
>> +		else
>> +			vma->pfnmap_track_ctx = ctx;
>> +	}
>>   	return err;
>>   }
>> +
>> +#else
>> +int remap_pfn_range(struct vm_area_struct *vma, unsigned long addr,
>> +		    unsigned long pfn, unsigned long size, pgprot_t prot)
>> +{
>> +	return remap_pfn_range_notrack(vma, addr, pfn, size, prot);
>> +}
>> +#endif
>>   EXPORT_SYMBOL(remap_pfn_range);
>>
>>   /**
>> diff --git a/mm/mmap.c b/mm/mmap.c
>> index 50f902c08341a..09c563c951123 100644
>> --- a/mm/mmap.c
>> +++ b/mm/mmap.c
>> @@ -1784,11 +1784,6 @@ __latent_entropy int dup_mmap(struct mm_struct *mm, struct mm_struct *oldmm)
>>   		tmp = vm_area_dup(mpnt);
>>   		if (!tmp)
>>   			goto fail_nomem;
>> -
>> -		/* track_pfn_copy() will later take care of copying internal state. */
>> -		if (unlikely(tmp->vm_flags & VM_PFNMAP))
>> -			untrack_pfn_clear(tmp);
>> -
>>   		retval = vma_dup_policy(mpnt, tmp);
>>   		if (retval)
>>   			goto fail_nomem_policy;
>> diff --git a/mm/mremap.c b/mm/mremap.c
>> index 7db9da609c84f..6e78e02f74bd3 100644
>> --- a/mm/mremap.c
>> +++ b/mm/mremap.c
>> @@ -1191,10 +1191,6 @@ static int copy_vma_and_data(struct vma_remap_struct *vrm,
>>   	if (is_vm_hugetlb_page(vma))
>>   		clear_vma_resv_huge_pages(vma);
>>
>> -	/* Tell pfnmap has moved from this vma */
>> -	if (unlikely(vma->vm_flags & VM_PFNMAP))
>> -		untrack_pfn_clear(vma);
>> -
>>   	*new_vma_ptr = new_vma;
>>   	return err;
>>   }
>> diff --git a/mm/vma_init.c b/mm/vma_init.c
>> index 967ca85179864..8e53c7943561e 100644
>> --- a/mm/vma_init.c
>> +++ b/mm/vma_init.c
>> @@ -71,7 +71,51 @@ static void vm_area_init_from(const struct vm_area_struct *src,
>>   #ifdef CONFIG_NUMA
>>   	dest->vm_policy = src->vm_policy;
>>   #endif
>> +#ifdef __HAVE_PFNMAP_TRACKING
>> +	dest->pfnmap_track_ctx = NULL;
>> +#endif
>> +}
>> +
>> +#ifdef __HAVE_PFNMAP_TRACKING
>> +static inline int vma_pfnmap_track_ctx_dup(struct vm_area_struct *orig,
>> +		struct vm_area_struct *new)
>> +{
>> +	struct pfnmap_track_ctx *ctx = orig->pfnmap_track_ctx;
>> +
>> +	if (likely(!ctx))
>> +		return 0;
>> +
>> +	/*
>> +	 * We don't expect to ever hit this. If ever required, we would have
>> +	 * to duplicate the tracking.
>> +	 */
>> +	if (unlikely(kref_read(&ctx->kref) >= REFCOUNT_MAX))
> 
> How not expected is this? :) maybe use WARN_ON_ONCE() if it really should
> never happen?
I guess if we mmap a large PFNMAP and then split it into individual 
PTE-sized chunks, we could get many VMAs per-process referencing that 
tracing.

Combine that with fork() and I assume one could hit this -- when really 
trying hard to achieve it. (probably as privileged user to get a big 
VM_PFNMAP, though, but not sure)

In that case, a WARN_ON_ONCE() would be bad -- because it could be 
triggered by the user.

We could do a pr_warn_once() instead, stating that this is not supported 
right now?

-- 
Cheers,

David / dhildenb

