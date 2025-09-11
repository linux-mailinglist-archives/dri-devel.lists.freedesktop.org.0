Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B1DF0B53245
	for <lists+dri-devel@lfdr.de>; Thu, 11 Sep 2025 14:32:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 201BD10EAFD;
	Thu, 11 Sep 2025 12:32:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="HolWIFoO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B79610EAFD
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Sep 2025 12:32:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1757593920;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=iZ/dKjdNPUwkhNSr1770dlxLEN21cVc1KkcKofFrXz0=;
 b=HolWIFoOyIZtlnv/aeDbUrEczQsBRqsXjhUVadNtAYapB14GiIcK8jQ1wCvQQw0weOrDC5
 7ZLaV4AidzHbq62OC/tOFAyuGONQ9TC2t0cVFC1dC8797OrSVBFyP84vH4+pAzqp/gti9u
 Ot/4w1kcWk/RC5CU1+76T8nEclnMMuE=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-516-d0CcCgjCOFmD06ybJLpLHg-1; Thu, 11 Sep 2025 08:31:57 -0400
X-MC-Unique: d0CcCgjCOFmD06ybJLpLHg-1
X-Mimecast-MFC-AGG-ID: d0CcCgjCOFmD06ybJLpLHg_1757593916
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-45b98de0e34so6687265e9.0
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Sep 2025 05:31:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757593916; x=1758198716;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=iZ/dKjdNPUwkhNSr1770dlxLEN21cVc1KkcKofFrXz0=;
 b=cWT/91im4HXXOpfPbv/Zou8lDAB3LwCDUXiDhiNnrXgqg7VXwPzNqJbT0/oPtIqZO/
 ICdB/pti6DhkhEIwiRbGaSco6rRL0crsqBnzeLu09gH/RiA/4F/PPy/FL4fAJ1Ad/Oa2
 OuDRyaBIZzyRQKDh4SLjtt9Ok7ItzoIeTOZmbnqQs0SEsoL0C0IfzqWsea7mHKdOkPOc
 iAW3BA5CLhnxDjkMzMQAXsfPiff8UKpFB5abNcgnpvMc4EKqP18i0oen7AD9dX8lH6Na
 to6n2QGtVp7OkD1WHTFqK3qBOhWD2vwxif9bZPzsxTMRzkYRKiFItlyoSH3xCUEbb67T
 d/Mg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVCASDL3JWgYmhjV7MWzaRWgj1316UeBRtqTgTwM9PA9mWvNPdc7+N5NblJROreX4c4ANDk2e0qy2s=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyOjS+0VAnHOMkyL4ExESbOm10Q/Zr0KnkRlDNjQAcqNJ8CKMVt
 oWBt022ZUuxnqhto/Usw8D2lM8xTC9E3W32u4herHtwOkqnWXvdoUTmbGsB1o70MRvUIAFU0vQR
 BSw4EneQLpMUgyQTjvjnex5ZO7N1ac5mxK7qesgMAT3N3DmDpus8+NGSvHvr+JCMSGEwKlw==
X-Gm-Gg: ASbGnctFS2FI/9/YNctEJZvxfKubraxIkabmO4fH3xvmXKsA/LhMPawxnxlo5rLtqit
 X9nSuTLRBIPvp8qIzEzUC9WvgM1CJtUbBT/wQjRQUqyuoW0jiUf7jII4pTOAPIieMffP1n6FTs2
 GvEY9gEdBKZxVSonh4P7UMRLbK8pMPyK8EdNnfPLwavXA5VM94D74G/jr80V1ZX6IHrwxFuQgxr
 O5KyUDNV2SuCgmDMKe5EXOJ40u9wumz4w7XiwzzJpH4mBJL4OPqqaeL4nO5/k0HdhF5awiPV0vd
 4x7hLkGF3tc2MQGsGscnOK9QX0Mm4lBSANu8znCSpf98o7u3a5O2EOng3xB5LKFscKeYSAGRuex
 iNV9NzFpT7w1Lmf3NBVd5NtCyoszL3djayMpIDvZFSedk2iSaivplbjShpI+7JiyvBQo=
X-Received: by 2002:a05:600c:4ed0:b0:45d:e28c:8741 with SMTP id
 5b1f17b1804b1-45de712289emr112179085e9.29.1757593916122; 
 Thu, 11 Sep 2025 05:31:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHd4mRSBLCLqoev+zql1DYyEm0c6qzJysTW8hMJhXGcJ/8jyY32AGr1Sgj5WO1lPdl0WHC3+w==
X-Received: by 2002:a05:600c:4ed0:b0:45d:e28c:8741 with SMTP id
 5b1f17b1804b1-45de712289emr112178675e9.29.1757593915557; 
 Thu, 11 Sep 2025 05:31:55 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f42:b000:db8b:7655:f60f:812b?
 (p200300d82f42b000db8b7655f60f812b.dip0.t-ipconnect.de.
 [2003:d8:2f42:b000:db8b:7655:f60f:812b])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45e015bf73csm12934595e9.11.2025.09.11.05.31.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Sep 2025 05:31:54 -0700 (PDT)
Message-ID: <ca592d4a-3e91-48ea-970e-a5ff12f215be@redhat.com>
Date: Thu, 11 Sep 2025 14:31:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [v5 04/15] mm/huge_memory: implement device-private THP splitting
To: Balbir Singh <balbirs@nvidia.com>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org
Cc: damon@lists.linux.dev, dri-devel@lists.freedesktop.org,
 Andrew Morton <akpm@linux-foundation.org>, Zi Yan <ziy@nvidia.com>,
 Joshua Hahn <joshua.hahnjy@gmail.com>, Rakie Kim <rakie.kim@sk.com>,
 Byungchul Park <byungchul@sk.com>, Gregory Price <gourry@gourry.net>,
 Ying Huang <ying.huang@linux.alibaba.com>,
 Alistair Popple <apopple@nvidia.com>, Oscar Salvador <osalvador@suse.de>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, Nico Pache <npache@redhat.com>,
 Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>,
 Barry Song <baohua@kernel.org>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Ralph Campbell <rcampbell@nvidia.com>,
 =?UTF-8?Q?Mika_Penttil=C3=A4?= <mpenttil@redhat.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Francois Dugast <francois.dugast@intel.com>
References: <20250908000448.180088-1-balbirs@nvidia.com>
 <20250908000448.180088-5-balbirs@nvidia.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 qIws/H2t
In-Reply-To: <20250908000448.180088-5-balbirs@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: XIBBq-YPJdXuv9RGLYIaM4m18Ctp6T5eBaonPXnY2Js_1757593916
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

On 08.09.25 02:04, Balbir Singh wrote:
> Add support for splitting device-private THP folios, enabling fallback
> to smaller page sizes when large page allocation or migration fails.
> 
> Key changes:
> - split_huge_pmd(): Handle device-private PMD entries during splitting
> - Preserve RMAP_EXCLUSIVE semantics for anonymous exclusive folios
> - Skip RMP_USE_SHARED_ZEROPAGE for device-private entries as they
>    don't support shared zero page semantics
> 
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: David Hildenbrand <david@redhat.com>
> Cc: Zi Yan <ziy@nvidia.com>
> Cc: Joshua Hahn <joshua.hahnjy@gmail.com>
> Cc: Rakie Kim <rakie.kim@sk.com>
> Cc: Byungchul Park <byungchul@sk.com>
> Cc: Gregory Price <gourry@gourry.net>
> Cc: Ying Huang <ying.huang@linux.alibaba.com>
> Cc: Alistair Popple <apopple@nvidia.com>
> Cc: Oscar Salvador <osalvador@suse.de>
> Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> Cc: Baolin Wang <baolin.wang@linux.alibaba.com>
> Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>
> Cc: Nico Pache <npache@redhat.com>
> Cc: Ryan Roberts <ryan.roberts@arm.com>
> Cc: Dev Jain <dev.jain@arm.com>
> Cc: Barry Song <baohua@kernel.org>
> Cc: Lyude Paul <lyude@redhat.com>
> Cc: Danilo Krummrich <dakr@kernel.org>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Simona Vetter <simona@ffwll.ch>
> Cc: Ralph Campbell <rcampbell@nvidia.com>
> Cc: Mika Penttilä <mpenttil@redhat.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Francois Dugast <francois.dugast@intel.com>
> 
> Signed-off-by: Balbir Singh <balbirs@nvidia.com>
> ---
>   mm/huge_memory.c | 129 +++++++++++++++++++++++++++++++++--------------
>   1 file changed, 91 insertions(+), 38 deletions(-)
> 
> diff --git a/mm/huge_memory.c b/mm/huge_memory.c
> index 337d8e3dd837..b720870c04b2 100644
> --- a/mm/huge_memory.c
> +++ b/mm/huge_memory.c
> @@ -2880,16 +2880,19 @@ static void __split_huge_pmd_locked(struct vm_area_struct *vma, pmd_t *pmd,
>   	struct page *page;
>   	pgtable_t pgtable;
>   	pmd_t old_pmd, _pmd;
> -	bool young, write, soft_dirty, pmd_migration = false, uffd_wp = false;
> -	bool anon_exclusive = false, dirty = false;
> +	bool young, write, soft_dirty, uffd_wp = false;
> +	bool anon_exclusive = false, dirty = false, present = false;
>   	unsigned long addr;
>   	pte_t *pte;
>   	int i;
> +	swp_entry_t swp_entry;
>   
>   	VM_BUG_ON(haddr & ~HPAGE_PMD_MASK);
>   	VM_BUG_ON_VMA(vma->vm_start > haddr, vma);
>   	VM_BUG_ON_VMA(vma->vm_end < haddr + HPAGE_PMD_SIZE, vma);
> -	VM_BUG_ON(!is_pmd_migration_entry(*pmd) && !pmd_trans_huge(*pmd));
> +
> +	VM_WARN_ON(!is_pmd_migration_entry(*pmd) && !pmd_trans_huge(*pmd) &&
> +			!is_pmd_device_private_entry(*pmd));
>   

Indentation. But I do wonder if we want a helper to do a more
efficient

is_pmd_migration_entry() || is_pmd_device_private_entry()

If only I could come up with a good name ... any ideas?

is_non_present_folio_entry()

maybe?

Well, there is device-exclusive .... but that would not be reachable on 
these paths yet, ever.


>   	count_vm_event(THP_SPLIT_PMD);
>   
> @@ -2937,18 +2940,43 @@ static void __split_huge_pmd_locked(struct vm_area_struct *vma, pmd_t *pmd,
>   		return __split_huge_zero_page_pmd(vma, haddr, pmd);
>   	}
>   
> -	pmd_migration = is_pmd_migration_entry(*pmd);
> -	if (unlikely(pmd_migration)) {
> -		swp_entry_t entry;
>   
> +	present = pmd_present(*pmd);
> +	if (unlikely(!present)) {

I hate this whole function. But maybe in this case it's better
to just have here

if (is_pmd_migration_entry(old_pmd)) {

} else if (is_pmd_device_private_entry(old_pmd)) {

There is not much shared code and the helps reduce the indentation level.

> +		swp_entry = pmd_to_swp_entry(*pmd);
>   		old_pmd = *pmd;
> -		entry = pmd_to_swp_entry(old_pmd);
> -		page = pfn_swap_entry_to_page(entry);
> -		write = is_writable_migration_entry(entry);
> -		if (PageAnon(page))
> -			anon_exclusive = is_readable_exclusive_migration_entry(entry);
> -		young = is_migration_entry_young(entry);
> -		dirty = is_migration_entry_dirty(entry);
> +
> +		folio = pfn_swap_entry_folio(swp_entry);
> +		VM_WARN_ON(!is_migration_entry(swp_entry) &&
> +				!is_device_private_entry(swp_entry));

Indentation.

> +		page = pfn_swap_entry_to_page(swp_entry);
> +
> +		if (is_pmd_migration_entry(old_pmd)) {
> +			write = is_writable_migration_entry(swp_entry);
> +			if (PageAnon(page))
> +				anon_exclusive =
> +					is_readable_exclusive_migration_entry(
> +								swp_entry);

Single line please, this is unreadable.

> +			young = is_migration_entry_young(swp_entry);
> +			dirty = is_migration_entry_dirty(swp_entry);
> +		} else if (is_pmd_device_private_entry(old_pmd)) {
> +			write = is_writable_device_private_entry(swp_entry);
> +			anon_exclusive = PageAnonExclusive(page);
> +			if (freeze && anon_exclusive &&
> +			    folio_try_share_anon_rmap_pmd(folio, page))
> +				freeze = false;
> +			if (!freeze) {
> +				rmap_t rmap_flags = RMAP_NONE;
> +
> +				folio_ref_add(folio, HPAGE_PMD_NR - 1);
> +				if (anon_exclusive)
> +					rmap_flags |= RMAP_EXCLUSIVE;
> +
> +				folio_add_anon_rmap_ptes(folio, page, HPAGE_PMD_NR,
> +						 vma, haddr, rmap_flags);
> +			}
> +		}
> +
>   		soft_dirty = pmd_swp_soft_dirty(old_pmd);
>   		uffd_wp = pmd_swp_uffd_wp(old_pmd);
>   	} else {
> @@ -3034,30 +3062,49 @@ static void __split_huge_pmd_locked(struct vm_area_struct *vma, pmd_t *pmd,
>   	 * Note that NUMA hinting access restrictions are not transferred to
>   	 * avoid any possibility of altering permissions across VMAs.
>   	 */
> -	if (freeze || pmd_migration) {
> +	if (freeze || !present) {

Here too, I wonder if we should just handle device-private completely 
separately for now.

>   		for (i = 0, addr = haddr; i < HPAGE_PMD_NR; i++, addr += PAGE_SIZE) {
>   			pte_t entry;
> -			swp_entry_t swp_entry;
> -
> -			if (write)
> -				swp_entry = make_writable_migration_entry(
> -							page_to_pfn(page + i));
> -			else if (anon_exclusive)
> -				swp_entry = make_readable_exclusive_migration_entry(
> -							page_to_pfn(page + i));
> -			else
> -				swp_entry = make_readable_migration_entry(
> -							page_to_pfn(page + i));
> -			if (young)
> -				swp_entry = make_migration_entry_young(swp_entry);
> -			if (dirty)
> -				swp_entry = make_migration_entry_dirty(swp_entry);
> -			entry = swp_entry_to_pte(swp_entry);
> -			if (soft_dirty)
> -				entry = pte_swp_mksoft_dirty(entry);
> -			if (uffd_wp)
> -				entry = pte_swp_mkuffd_wp(entry);
> -
> +			if (freeze || is_migration_entry(swp_entry)) {
> +				if (write)
> +					swp_entry = make_writable_migration_entry(
> +								page_to_pfn(page + i));
> +				else if (anon_exclusive)
> +					swp_entry = make_readable_exclusive_migration_entry(
> +								page_to_pfn(page + i));
> +				else
> +					swp_entry = make_readable_migration_entry(
> +								page_to_pfn(page + i));
> +				if (young)
> +					swp_entry = make_migration_entry_young(swp_entry);
> +				if (dirty)
> +					swp_entry = make_migration_entry_dirty(swp_entry);
> +				entry = swp_entry_to_pte(swp_entry);
> +				if (soft_dirty)
> +					entry = pte_swp_mksoft_dirty(entry);
> +				if (uffd_wp)
> +					entry = pte_swp_mkuffd_wp(entry);
> +			} else {
> +				/*
> +				 * anon_exclusive was already propagated to the relevant
> +				 * pages corresponding to the pte entries when freeze
> +				 * is false.
> +				 */
> +				if (write)
> +					swp_entry = make_writable_device_private_entry(
> +								page_to_pfn(page + i));
> +				else
> +					swp_entry = make_readable_device_private_entry(
> +								page_to_pfn(page + i));
> +				/*
> +				 * Young and dirty bits are not progated via swp_entry
> +				 */
> +				entry = swp_entry_to_pte(swp_entry);
> +				if (soft_dirty)
> +					entry = pte_swp_mksoft_dirty(entry);
> +				if (uffd_wp)
> +					entry = pte_swp_mkuffd_wp(entry);
> +			}
>   			VM_WARN_ON(!pte_none(ptep_get(pte + i)));
>   			set_pte_at(mm, addr, pte + i, entry);
>   		}
> @@ -3084,7 +3131,7 @@ static void __split_huge_pmd_locked(struct vm_area_struct *vma, pmd_t *pmd,
>   	}
>   	pte_unmap(pte);
>   
> -	if (!pmd_migration)
> +	if (!is_pmd_migration_entry(*pmd))
>   		folio_remove_rmap_pmd(folio, page, vma);
>   	if (freeze)
>   		put_page(page);
> @@ -3096,8 +3143,10 @@ static void __split_huge_pmd_locked(struct vm_area_struct *vma, pmd_t *pmd,
>   void split_huge_pmd_locked(struct vm_area_struct *vma, unsigned long address,
>   			   pmd_t *pmd, bool freeze)
>   {
> +

Unrelated change.



-- 
Cheers

David / dhildenb

