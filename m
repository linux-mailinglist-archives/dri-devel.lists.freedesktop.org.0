Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2292AFCD05
	for <lists+dri-devel@lfdr.de>; Tue,  8 Jul 2025 16:11:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5009610E652;
	Tue,  8 Jul 2025 14:11:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="ZfLjpDc9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FCAD10E192
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Jul 2025 14:11:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1751983862;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=2feGrULhpAl9VLhWpuYvxvXB7WeIFZRAdrQSQq56LLk=;
 b=ZfLjpDc96L3Yl+uqhCqEUmVDZWNDqB/ERUIrFai7zkLQkWNYRCvdOmbzJxx1MQM/3k3US7
 0eXpByXWaUfZ4G3jE28Z3UQb6YRaTqw3blMJ5S9nGbIRpT2HpBoaV3VU2ZXeNCt22SQ/SV
 Hj+WSS71BpwabpvEYOMh6k/WA+SjPgo=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-512-FUSwOeqKMoaybTghhQamgA-1; Tue, 08 Jul 2025 10:11:00 -0400
X-MC-Unique: FUSwOeqKMoaybTghhQamgA-1
X-Mimecast-MFC-AGG-ID: FUSwOeqKMoaybTghhQamgA_1751983859
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-4537f56ab74so28181545e9.3
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Jul 2025 07:10:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751983859; x=1752588659;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:from:references:cc:to:subject:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=2feGrULhpAl9VLhWpuYvxvXB7WeIFZRAdrQSQq56LLk=;
 b=J48K4O4Yp0K1yRF4l19ALE2oIm9Vu2oA2BJqE0JAvgZSbVWVYg+nnNN8siIKibA7Od
 nDVIvcC7NAfXMeFElk+DcjKBiYLhyB93Y4o20hw81U4GpZI2YOSta7lvw+wYsFMufksi
 sHwVPc/dT4jvseyqjqqm1AV4ODll/HiEzougcpLU5/r8sKxyqhL5vPA7wxduUO/GJi7g
 UuA2PyBQYCD5vHMoaO+Csxieocw4oXy50SbCMXAki3FC9kdqXHNYyZjqKYzNlhZo3lcD
 KayA6CPhyHEu3UhsOU62Hi2/sxkOi1gsIDv5fm6YFaXQmxN/QP5IMUspZrJoMCO7nsgD
 H/Wg==
X-Gm-Message-State: AOJu0YyalwNi1bVm1Kcuz3FaFbDVD611sKinzZCljDe5oF/8rDW7hM7x
 rXN6tLSVUfoDrI+pWH55BFnun671DfU4BaZjSU1oJuGgMHUjpK0wE1gy8NW/EBdPMi0VaMfjdNH
 Gi6r5w9DkqAKVJJ5lcczm1zT3mRvU086ElA4CmS403WgQsQ0OlgwWQh790bXG7aXqYOI+jQ==
X-Gm-Gg: ASbGncsM7luW5VYQT7EK3Czr5wLyzjxnp2l5TAZNbIZFklK/dVE8FXBuXZ9A8bb8COO
 MXGDeQY0+Nz7C8aizB4a1XUDlJeXhRL5yoa29s+Ocl+xikEZqo9s4zMoiI/8HIk1i7Qt4pCL5+s
 NiT6hk7Clyi/RF81TySE1htx3GFnExmsQQFLdFrelJORRx1EflI9MCwDYbaK7Pbt1u5TKfQzGtS
 ifGinb2/RUawRJZTBV3LRleXcLO51K+q2bAg6i6MaD+aQdB0jyyB/SupwE2Fj3V3qH35rK9wp0O
 pjnCTdlNUvoBhGClW5ORtfKZhGjYAwFFHr8bwZfiHWLAT+TAWqNHiH9rvPSTvBAWKHI4cX3u6cR
 c6V2cNGycZcFvhmc09T80UnypqYpuHgKKE+LjUPEpPpH41o+zSg==
X-Received: by 2002:a05:600c:502b:b0:450:ceb2:67dd with SMTP id
 5b1f17b1804b1-454b3196658mr138967165e9.33.1751983858458; 
 Tue, 08 Jul 2025 07:10:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFWCZzfSlQCTmEqUNSRpr1IkxwsQcI7hEJPjNFjHibjyZjoTIZV7oluRQuTY7gNBR/EYLpm2w==
X-Received: by 2002:a05:600c:502b:b0:450:ceb2:67dd with SMTP id
 5b1f17b1804b1-454b3196658mr138966235e9.33.1751983857615; 
 Tue, 08 Jul 2025 07:10:57 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f1a:f500:4346:f17c:2bde:808c?
 (p200300d82f1af5004346f17c2bde808c.dip0.t-ipconnect.de.
 [2003:d8:2f1a:f500:4346:f17c:2bde:808c])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-454cd39d0f6sm23453675e9.16.2025.07.08.07.10.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Jul 2025 07:10:57 -0700 (PDT)
Message-ID: <be029205-9d03-43b0-84f7-1dab530639ca@redhat.com>
Date: Tue, 8 Jul 2025 16:10:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 03/11] mm/thp: zone_device awareness in THP handling code
To: Balbir Singh <balbirs@nvidia.com>, linux-mm@kvack.org,
 akpm@linux-foundation.org
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?=
 <jglisse@redhat.com>, Shuah Khan <shuah@kernel.org>,
 Barry Song <baohua@kernel.org>, Baolin Wang <baolin.wang@linux.alibaba.com>,
 Ryan Roberts <ryan.roberts@arm.com>, Matthew Wilcox <willy@infradead.org>,
 Peter Xu <peterx@redhat.com>, Zi Yan <ziy@nvidia.com>,
 Kefeng Wang <wangkefeng.wang@huawei.com>, Jane Chu <jane.chu@oracle.com>,
 Alistair Popple <apopple@nvidia.com>, Donet Tom <donettom@linux.ibm.com>
References: <20250306044239.3874247-1-balbirs@nvidia.com>
 <20250306044239.3874247-4-balbirs@nvidia.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20250306044239.3874247-4-balbirs@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: fBPFpx2ia06THvGG-e-p7I5NuTwmLyzvf3RVYFo8uro_1751983859
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

On 06.03.25 05:42, Balbir Singh wrote:
> Make THP handling code in the mm subsystem for THP pages
> aware of zone device pages. Although the code is
> designed to be generic when it comes to handling splitting
> of pages, the code is designed to work for THP page sizes
> corresponding to HPAGE_PMD_NR.
> 
> Modify page_vma_mapped_walk() to return true when a zone
> device huge entry is present, enabling try_to_migrate()
> and other code migration paths to appropriately process the
> entry
> 
> pmd_pfn() does not work well with zone device entries, use
> pfn_pmd_entry_to_swap() for checking and comparison as for
> zone device entries.
> 
> try_to_map_to_unused_zeropage() does not apply to zone device
> entries, zone device entries are ignored in the call.
> 
> Signed-off-by: Balbir Singh <balbirs@nvidia.com>
> ---
>   mm/huge_memory.c     | 151 +++++++++++++++++++++++++++++++------------
>   mm/migrate.c         |   2 +
>   mm/page_vma_mapped.c |  10 +++
>   mm/rmap.c            |  19 +++++-
>   4 files changed, 138 insertions(+), 44 deletions(-)
> 
> diff --git a/mm/huge_memory.c b/mm/huge_memory.c
> index 826bfe907017..d8e018d1bdbd 100644
> --- a/mm/huge_memory.c
> +++ b/mm/huge_memory.c
> @@ -2247,10 +2247,17 @@ int zap_huge_pmd(struct mmu_gather *tlb, struct vm_area_struct *vma,
>   		} else if (thp_migration_supported()) {
>   			swp_entry_t entry;
>   
> -			VM_BUG_ON(!is_pmd_migration_entry(orig_pmd));
>   			entry = pmd_to_swp_entry(orig_pmd);
>   			folio = pfn_swap_entry_folio(entry);
>   			flush_needed = 0;
> +
> +			VM_BUG_ON(!is_pmd_migration_entry(*pmd) &&
> +					!folio_is_device_private(folio));

Convert that to a VM_WARN_ON_ONCE() while you are at it.

But really, check that the *pmd* is as expected (device_pritavte entry), 
and not the folio after the effects.

Also, hiding all that under the thp_migration_supported() looks wrong.

Likely you must clean that up first, to have something that expresses 
that we support PMD swap entries or sth like that. Not just "migration 
entries".


> +
> +			if (folio_is_device_private(folio)) {
> +				folio_remove_rmap_pmd(folio, folio_page(folio, 0), vma);
> +				WARN_ON_ONCE(folio_mapcount(folio) < 0);
> +			}


zap_nonpresent_ptes() does

if (is_device_private_entry(entry)) {
	...
} else if (is_migration_entry(entry)) {
	....
}

Can we adjust the same way of foing things? (yes, we might want a 
thp_migration_supported() check somewhere)

>   		} else
>   			WARN_ONCE(1, "Non present huge pmd without pmd migration enabled!");
>   
> @@ -2264,6 +2271,15 @@ int zap_huge_pmd(struct mmu_gather *tlb, struct vm_area_struct *vma,
>   				       -HPAGE_PMD_NR);
>   		}
>   
> +		/*
> +		 * Do a folio put on zone device private pages after
> +		 * changes to mm_counter, because the folio_put() will
> +		 * clean folio->mapping and the folio_test_anon() check
> +		 * will not be usable.
> +		 */
> +		if (folio_is_device_private(folio))
> +			folio_put(folio);
> +
>   		spin_unlock(ptl);
>   		if (flush_needed)
>   			tlb_remove_page_size(tlb, &folio->page, HPAGE_PMD_SIZE);
> @@ -2392,7 +2408,8 @@ int change_huge_pmd(struct mmu_gather *tlb, struct vm_area_struct *vma,
>   		struct folio *folio = pfn_swap_entry_folio(entry);
>   		pmd_t newpmd;
>   
> -		VM_BUG_ON(!is_pmd_migration_entry(*pmd));
> +		VM_BUG_ON(!is_pmd_migration_entry(*pmd) &&
> +			  !folio_is_device_private(folio));
>   		if (is_writable_migration_entry(entry)) {
>   			/*
>   			 * A protection check is difficult so
> @@ -2405,9 +2422,11 @@ int change_huge_pmd(struct mmu_gather *tlb, struct vm_area_struct *vma,
>   			newpmd = swp_entry_to_pmd(entry);
>   			if (pmd_swp_soft_dirty(*pmd))
>   				newpmd = pmd_swp_mksoft_dirty(newpmd);
> -		} else {
> +		} else if (is_writable_device_private_entry(entry)) {
> +			newpmd = swp_entry_to_pmd(entry);
> +			entry = make_device_exclusive_entry(swp_offset(entry));
> +		} else
>   			newpmd = *pmd;
> -		}
>   
>   		if (uffd_wp)
>   			newpmd = pmd_swp_mkuffd_wp(newpmd);
> @@ -2860,11 +2879,12 @@ static void __split_huge_pmd_locked(struct vm_area_struct *vma, pmd_t *pmd,
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
> @@ -2918,20 +2938,25 @@ static void __split_huge_pmd_locked(struct vm_area_struct *vma, pmd_t *pmd,
>   		return __split_huge_zero_page_pmd(vma, haddr, pmd);
>   	}
>   
> -	pmd_migration = is_pmd_migration_entry(*pmd);
> -	if (unlikely(pmd_migration)) {
> -		swp_entry_t entry;
>   
> +	present = pmd_present(*pmd);
> +	if (unlikely(!present)) {
> +		swp_entry = pmd_to_swp_entry(*pmd);
>   		old_pmd = *pmd;
> -		entry = pmd_to_swp_entry(old_pmd);
> -		page = pfn_swap_entry_to_page(entry);
> -		write = is_writable_migration_entry(entry);
> +
> +		folio = pfn_swap_entry_folio(swp_entry);
> +		VM_BUG_ON(!is_migration_entry(swp_entry) &&
> +				!is_device_private_entry(swp_entry));
> +		page = pfn_swap_entry_to_page(swp_entry);
> +		write = is_writable_migration_entry(swp_entry);
> +
>   		if (PageAnon(page))
> -			anon_exclusive = is_readable_exclusive_migration_entry(entry);
> -		young = is_migration_entry_young(entry);
> -		dirty = is_migration_entry_dirty(entry);
> +			anon_exclusive =
> +				is_readable_exclusive_migration_entry(swp_entry);
>   		soft_dirty = pmd_swp_soft_dirty(old_pmd);
>   		uffd_wp = pmd_swp_uffd_wp(old_pmd);
> +		young = is_migration_entry_young(swp_entry);
> +		dirty = is_migration_entry_dirty(swp_entry);
>   	} else {
>   		/*
>   		 * Up to this point the pmd is present and huge and userland has
> @@ -3015,30 +3040,45 @@ static void __split_huge_pmd_locked(struct vm_area_struct *vma, pmd_t *pmd,
>   	 * Note that NUMA hinting access restrictions are not transferred to
>   	 * avoid any possibility of altering permissions across VMAs.
>   	 */
> -	if (freeze || pmd_migration) {
> +	if (freeze || !present) {
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
> +				VM_BUG_ON(!is_device_private_entry(swp_entry));
> +				if (write)
> +					swp_entry = make_writable_device_private_entry(
> +								page_to_pfn(page + i));
> +				else if (anon_exclusive)
> +					swp_entry = make_device_exclusive_entry(
> +								page_to_pfn(page + i));

I am pretty sure this is wrong. You cannot suddenly mix in 
device-exclusive entries.

And now I am confused again how device-private, anon and GUP interact.

> +				else
> +					swp_entry = make_readable_device_private_entry(
> +								page_to_pfn(page + i));
> +				entry = swp_entry_to_pte(swp_entry);
> +				if (soft_dirty)
> +					entry = pte_swp_mksoft_dirty(entry);
> +				if (uffd_wp)
> +					entry = pte_swp_mkuffd_wp(entry);
> +			}
>   			VM_WARN_ON(!pte_none(ptep_get(pte + i)));
>   			set_pte_at(mm, addr, pte + i, entry);
>   		}
> @@ -3065,7 +3105,7 @@ static void __split_huge_pmd_locked(struct vm_area_struct *vma, pmd_t *pmd,
>   	}
>   	pte_unmap(pte);
>   
> -	if (!pmd_migration)
> +	if (present)
>   		folio_remove_rmap_pmd(folio, page, vma);
>   	if (freeze)
>   		put_page(page);
> @@ -3077,6 +3117,7 @@ static void __split_huge_pmd_locked(struct vm_area_struct *vma, pmd_t *pmd,
>   void split_huge_pmd_locked(struct vm_area_struct *vma, unsigned long address,
>   			   pmd_t *pmd, bool freeze, struct folio *folio)
>   {
> +	struct folio *pmd_folio;
>   	VM_WARN_ON_ONCE(folio && !folio_test_pmd_mappable(folio));
>   	VM_WARN_ON_ONCE(!IS_ALIGNED(address, HPAGE_PMD_SIZE));
>   	VM_WARN_ON_ONCE(folio && !folio_test_locked(folio));
> @@ -3089,7 +3130,14 @@ void split_huge_pmd_locked(struct vm_area_struct *vma, unsigned long address,
>   	 */
>   	if (pmd_trans_huge(*pmd) || pmd_devmap(*pmd) ||
>   	    is_pmd_migration_entry(*pmd)) {
> -		if (folio && folio != pmd_folio(*pmd))
> +		if (folio && !pmd_present(*pmd)) {
> +			swp_entry_t swp_entry = pmd_to_swp_entry(*pmd);
> +
> +			pmd_folio = page_folio(pfn_swap_entry_to_page(swp_entry));
> +		} else {
> +			pmd_folio = pmd_folio(*pmd);
> +		}
> +		if (folio && folio != pmd_folio)
>   			return;
>   		__split_huge_pmd_locked(vma, pmd, address, freeze);
>   	}
> @@ -3581,11 +3629,16 @@ static int __split_unmapped_folio(struct folio *folio, int new_order,
>   				     folio_test_swapcache(origin_folio)) ?
>   					     folio_nr_pages(release) : 0));
>   
> +			if (folio_is_device_private(release))
> +				percpu_ref_get_many(&release->pgmap->ref,
> +							(1 << new_order) - 1);
> +
>   			if (release == origin_folio)
>   				continue;
>   
> -			lru_add_page_tail(origin_folio, &release->page,
> -						lruvec, list);
> +			if (!folio_is_device_private(origin_folio))
> +				lru_add_page_tail(origin_folio, &release->page,
> +							lruvec, list);
>   
>   			/* Some pages can be beyond EOF: drop them from page cache */
>   			if (release->index >= end) {
> @@ -4625,7 +4678,10 @@ int set_pmd_migration_entry(struct page_vma_mapped_walk *pvmw,
>   		return 0;
>   
>   	flush_cache_range(vma, address, address + HPAGE_PMD_SIZE);
> -	pmdval = pmdp_invalidate(vma, address, pvmw->pmd);
> +	if (!folio_is_device_private(folio))
> +		pmdval = pmdp_invalidate(vma, address, pvmw->pmd);
> +	else
> +		pmdval = pmdp_huge_clear_flush(vma, address, pvmw->pmd);

Please handle this like we handle the PTE case -- checking for 
pmd_present() instead.

Avoid placing these nasty folio_is_device_private() all over the place 
where avoidable.

>   
>   	/* See folio_try_share_anon_rmap_pmd(): invalidate PMD first. */
>   	anon_exclusive = folio_test_anon(folio) && PageAnonExclusive(page);
> @@ -4675,6 +4731,17 @@ void remove_migration_pmd(struct page_vma_mapped_walk *pvmw, struct page *new)
>   	entry = pmd_to_swp_entry(*pvmw->pmd);
>   	folio_get(folio);
>   	pmde = mk_huge_pmd(new, READ_ONCE(vma->vm_page_prot));
> +
> +	if (unlikely(folio_is_device_private(folio))) {
> +		if (pmd_write(pmde))
> +			entry = make_writable_device_private_entry(
> +							page_to_pfn(new));
> +		else
> +			entry = make_readable_device_private_entry(
> +							page_to_pfn(new));
> +		pmde = swp_entry_to_pmd(entry);
> +	}
> +
>   	if (pmd_swp_soft_dirty(*pvmw->pmd))
>   		pmde = pmd_mksoft_dirty(pmde);
>   	if (is_writable_migration_entry(entry))
> diff --git a/mm/migrate.c b/mm/migrate.c
> index 59e39aaa74e7..0aa1bdb711c3 100644
> --- a/mm/migrate.c
> +++ b/mm/migrate.c
> @@ -200,6 +200,8 @@ static bool try_to_map_unused_to_zeropage(struct page_vma_mapped_walk *pvmw,
>   
>   	if (PageCompound(page))
>   		return false;
> +	if (folio_is_device_private(folio))
> +		return false;

Why is that check required when you are adding THP handling and there is 
a PageCompound check right there?

>   	VM_BUG_ON_PAGE(!PageAnon(page), page);
>   	VM_BUG_ON_PAGE(!PageLocked(page), page);
>   	VM_BUG_ON_PAGE(pte_present(*pvmw->pte), page);
> diff --git a/mm/page_vma_mapped.c b/mm/page_vma_mapped.c
> index e463c3be934a..5dd2e51477d3 100644
> --- a/mm/page_vma_mapped.c
> +++ b/mm/page_vma_mapped.c
> @@ -278,6 +278,16 @@ bool page_vma_mapped_walk(struct page_vma_mapped_walk *pvmw)
>   			 * cannot return prematurely, while zap_huge_pmd() has
>   			 * cleared *pmd but not decremented compound_mapcount().
>   			 */
> +			swp_entry_t entry;
> +
> +			if (!thp_migration_supported())
> +				return not_found(pvmw);

This check looks misplaced. We should follow the same model as check_pte().

Checking for THP migration support when you are actually caring about 
device-private entries is weird.

That is, I would expect something like

} else if (is_swap_pmd(pmde)) {
	swp_entry_t entry;

	entry = pmd_to_swp_entry(pmde);
	if (!is_device_private_entry(entry))
		return false;

	...
}

> +			entry = pmd_to_swp_entry(pmde);
> +			if (is_device_private_entry(entry)) {
> +				pvmw->ptl = pmd_lock(mm, pvmw->pmd);
> +				return true;
> +			}
> +
>   			if ((pvmw->flags & PVMW_SYNC) &&
>   			    thp_vma_suitable_order(vma, pvmw->address,
>   						   PMD_ORDER) &&
> diff --git a/mm/rmap.c b/mm/rmap.c
> index 67bb273dfb80..67e99dc5f2ef 100644
> --- a/mm/rmap.c
> +++ b/mm/rmap.c
> @@ -2326,8 +2326,23 @@ static bool try_to_migrate_one(struct folio *folio, struct vm_area_struct *vma,
>   #ifdef CONFIG_ARCH_ENABLE_THP_MIGRATION
>   		/* PMD-mapped THP migration entry */
>   		if (!pvmw.pte) {
> -			subpage = folio_page(folio,
> -				pmd_pfn(*pvmw.pmd) - folio_pfn(folio));
> +			/*
> +			 * Zone device private folios do not work well with
> +			 * pmd_pfn() on some architectures due to pte
> +			 * inversion.
> +			 */
> +			if (folio_is_device_private(folio)) {
> +				swp_entry_t entry = pmd_to_swp_entry(*pvmw.pmd);
> +				unsigned long pfn = swp_offset_pfn(entry);
> +
> +				subpage = folio_page(folio, pfn
> +							- folio_pfn(folio));
> +			} else {
> +				subpage = folio_page(folio,
> +							pmd_pfn(*pvmw.pmd)
> +							- folio_pfn(folio));
> +			}
> +


Please follow the same model we use for PTEs.

/*
  * Handle PFN swap PMDs, such as device-exclusive ones, that
  * actually map pages.
  */
if (likely(pmd_present(...))) {

}


-- 
Cheers,

David / dhildenb

