Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF772B36D89
	for <lists+dri-devel@lfdr.de>; Tue, 26 Aug 2025 17:19:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3E3610E380;
	Tue, 26 Aug 2025 15:19:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="WWWrfL8Y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E82010E10E
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Aug 2025 15:19:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1756221560;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=UXprMiHzASbIr0sIutW4AJHP4d2PgaVuimdefLcGYPc=;
 b=WWWrfL8YjToPzTBXXIFY5zIP7rlR4ZOWptK1HuhQnW5lD5m06bZYIzmMkO21HXR9ldOruk
 YtUs0dHwotyID8izMTkSJqNM+tNA+L2nsyXbtl8KxyHscsTndkMPqytfh8gew6LcC7Xv2Z
 bQLtaFBPplpf8dc6FS9uIa0eVlJ5izU=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-623-GOvFFEeAPimdBHBno9NmoA-1; Tue, 26 Aug 2025 11:19:18 -0400
X-MC-Unique: GOvFFEeAPimdBHBno9NmoA-1
X-Mimecast-MFC-AGG-ID: GOvFFEeAPimdBHBno9NmoA_1756221557
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-45a1b0ccb6cso28696655e9.3
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Aug 2025 08:19:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756221557; x=1756826357;
 h=content-transfer-encoding:autocrypt:in-reply-to:content-language
 :references:cc:to:subject:from:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UXprMiHzASbIr0sIutW4AJHP4d2PgaVuimdefLcGYPc=;
 b=SEJrNnwdLBs7j3BbLgfed7X8mDBo3zdKX07B9AVHCh7J7MIeq4zHAdRdUvUelO75GV
 bhuCxnjPgAhPQfAz6rOcuSDSQshtcm2VwLOSMUROQEj8evmkPMx1vGNYjZLRHcVCtmgf
 n3KfbzWPGq+NblnIbfE+vB9BnirUM9+EH1KuaRl3hh9wvaJtGsRyeKiY0+AAucyW469y
 cy1PdumCHLc05lg08KqCeoHR3WM6tziPXkQD8tvsFyWv6s922ZMYulNhNVSGqjUjm3DA
 APutBBpSINe4vmlczRqYsb7AaLE/gUaEWujPJ3Ga6p0dEYyX01v83SaK/IPFEIAhdTe+
 VFFA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXX4p4nWvS9ytxCM7omRBbHmCLOwGkPjJyZ8FUifrpF8oNgiThfgmtzF9URQ9H3SCe2I5clzzz4f84=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwIj5u5eMY1ESiW7QWqFBJMp+Csuuyql1mYBfNLp7Z8SZUSEisP
 6TxgN+uwKLzSkIRCzrjJjlzgfR+ROA+RpmDEqaWHFnVb+tSTSdyYwm9DHyWfhDvYDN6FciVo3yj
 L5Ey6i3d2H93zG5D09MLXrcnpyxkQdUOjstCTfEkigaso8FWrEIf6yMyGQXTo/EZIWguiDA==
X-Gm-Gg: ASbGncuEhA9C0Z/g9I4edtlsWC0bAAcXUyzD/ptW1h2ZzycpW7uuTRmb469dF+cTJkn
 z0SD4LpUtCmk8Fk3AEZoPvi7b6ZwzqPZ/UKBmRdYGGy8x5aSLSBiMtQNJ7TgLQFm4Dvh+/mbqRi
 luhXQmd5ERH1kFqicDtFjfLQ8npyGvm8ZelwbWcQP2rcoptLbCLCanoJiDNMTp1ua6ixcwXVWcD
 9f3YYZlcGhB7YM9Xgc8yqcYpU+Q6Ap6sjvmWnzgp8leVZdKc3MoFEQaF+s3kEsRARRRQrrxCQhm
 NVMZ++b5hneB1RjW24eJ36v8xbp15/gosxds8KEMNCFxtk1wDdqEJro+7fjMkK9cSs38eNQVJA=
 =
X-Received: by 2002:a05:600c:4692:b0:456:1514:5b04 with SMTP id
 5b1f17b1804b1-45b517b9636mr130700015e9.21.1756221557108; 
 Tue, 26 Aug 2025 08:19:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFT+QSPmC9ilBhkXP1iD9bjBtI9e77OcfOWd9ADNWej3NwzIhTOtpef39FZWwpPfcLsGHjxoQ==
X-Received: by 2002:a05:600c:4692:b0:456:1514:5b04 with SMTP id
 5b1f17b1804b1-45b517b9636mr130699535e9.21.1756221556468; 
 Tue, 26 Aug 2025 08:19:16 -0700 (PDT)
Received: from ?IPV6:2a09:80c0:192:0:5dac:bf3d:c41:c3e7?
 ([2a09:80c0:192:0:5dac:bf3d:c41:c3e7])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45b5753528csm153414105e9.3.2025.08.26.08.19.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Aug 2025 08:19:15 -0700 (PDT)
Message-ID: <763e1fca-e4c4-467e-a1d0-ea911cad4714@redhat.com>
Date: Tue, 26 Aug 2025 17:19:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: David Hildenbrand <david@redhat.com>
Subject: Re: [v3 02/11] mm/thp: zone_device awareness in THP handling code
To: Balbir Singh <balbirs@nvidia.com>, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org
Cc: Andrew Morton <akpm@linux-foundation.org>, Zi Yan <ziy@nvidia.com>,
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
References: <20250812024036.690064-1-balbirs@nvidia.com>
 <20250812024036.690064-3-balbirs@nvidia.com>
In-Reply-To: <20250812024036.690064-3-balbirs@nvidia.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 qIws/H2t
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 6sGR6502bV8EjryqXEa72WBMWmgRlxJzNV6dqmIwepI_1756221557
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

On 12.08.25 04:40, Balbir Singh wrote:
> Make THP handling code in the mm subsystem for THP pages aware of zone
> device pages. Although the code is designed to be generic when it comes
> to handling splitting of pages, the code is designed to work for THP
> page sizes corresponding to HPAGE_PMD_NR.
> 
> Modify page_vma_mapped_walk() to return true when a zone device huge
> entry is present, enabling try_to_migrate() and other code migration
> paths to appropriately process the entry. page_vma_mapped_walk() will
> return true for zone device private large folios only when
> PVMW_THP_DEVICE_PRIVATE is passed. This is to prevent locations that are
> not zone device private pages from having to add awareness.

Please don't if avoidable.

We should already have the same problem with small zone-device private
pages, and should have proper folio checks in place, no?


[...]

This thing is huge and hard to review. Given there are subtle changes in here that
are likely problematic, this is a problem. Is there any way to split this
into logical chunks?

Like teaching zap, mprotect, rmap walks .... code separately.

I'm, sure you'll find a way to break this down so I don't walk out of a
review with an headake ;)

>   
>   struct page_vma_mapped_walk {
>   	unsigned long pfn;
> diff --git a/include/linux/swapops.h b/include/linux/swapops.h
> index 64ea151a7ae3..2641c01bd5d2 100644
> --- a/include/linux/swapops.h
> +++ b/include/linux/swapops.h
> @@ -563,6 +563,7 @@ static inline int is_pmd_migration_entry(pmd_t pmd)
>   {
>   	return is_swap_pmd(pmd) && is_migration_entry(pmd_to_swp_entry(pmd));
>   }
> +

^ unrelated change

>   #else  /* CONFIG_ARCH_ENABLE_THP_MIGRATION */
>   static inline int set_pmd_migration_entry(struct page_vma_mapped_walk *pvmw,
>   		struct page *page)
> @@ -594,6 +595,22 @@ static inline int is_pmd_migration_entry(pmd_t pmd)
>   }
>   #endif  /* CONFIG_ARCH_ENABLE_THP_MIGRATION */
>   
> +#if defined(CONFIG_ZONE_DEVICE) && defined(CONFIG_ARCH_ENABLE_THP_MIGRATION)
> +
> +static inline int is_pmd_device_private_entry(pmd_t pmd)
> +{
> +	return is_swap_pmd(pmd) && is_device_private_entry(pmd_to_swp_entry(pmd));
> +}
> +
> +#else /* CONFIG_ZONE_DEVICE && CONFIG_ARCH_ENABLE_THP_MIGRATION */
> +
> +static inline int is_pmd_device_private_entry(pmd_t pmd)
> +{
> +	return 0;
> +}
> +
> +#endif /* CONFIG_ZONE_DEVICE && CONFIG_ARCH_ENABLE_THP_MIGRATION */
> +
>   static inline int non_swap_entry(swp_entry_t entry)
>   {
>   	return swp_type(entry) >= MAX_SWAPFILES;
> diff --git a/lib/test_hmm.c b/lib/test_hmm.c
> index 761725bc713c..297f1e034045 100644
> --- a/lib/test_hmm.c
> +++ b/lib/test_hmm.c
> @@ -1408,7 +1408,7 @@ static vm_fault_t dmirror_devmem_fault(struct vm_fault *vmf)
>   	 * the mirror but here we use it to hold the page for the simulated
>   	 * device memory and that page holds the pointer to the mirror.
>   	 */
> -	rpage = vmf->page->zone_device_data;
> +	rpage = folio_page(page_folio(vmf->page), 0)->zone_device_data;

Can we have a wrapper please to give us the zone_device_data for a folio, so
we have something like

rpage = folio_zone_device_data(page_folio(vmf->page));

>   	dmirror = rpage->zone_device_data;
>   
>   	/* FIXME demonstrate how we can adjust migrate range */
> diff --git a/mm/huge_memory.c b/mm/huge_memory.c
> index 9c38a95e9f09..2495e3fdbfae 100644
> --- a/mm/huge_memory.c
> +++ b/mm/huge_memory.c
> @@ -1711,8 +1711,11 @@ int copy_huge_pmd(struct mm_struct *dst_mm, struct mm_struct *src_mm,
>   	if (unlikely(is_swap_pmd(pmd))) {
>   		swp_entry_t entry = pmd_to_swp_entry(pmd);
>   
> -		VM_BUG_ON(!is_pmd_migration_entry(pmd));
> -		if (!is_readable_migration_entry(entry)) {
> +		VM_WARN_ON(!is_pmd_migration_entry(pmd) &&
> +				!is_pmd_device_private_entry(pmd));
> +
> +		if (is_migration_entry(entry) &&
> +			is_writable_migration_entry(entry)) {
>   			entry = make_readable_migration_entry(
>   							swp_offset(entry));

Careful: There is is_readable_exclusive_migration_entry(). So don't
change the !is_readable_migration_entry(entry) to is_writable_migration_entry(entry)(),
because it's wrong.

>   			pmd = swp_entry_to_pmd(entry);
> @@ -1722,6 +1725,32 @@ int copy_huge_pmd(struct mm_struct *dst_mm, struct mm_struct *src_mm,
>   				pmd = pmd_swp_mkuffd_wp(pmd);
>   			set_pmd_at(src_mm, addr, src_pmd, pmd);
>   		}
> +
> +		if (is_device_private_entry(entry)) {

likely you want "else if" here.

> +			if (is_writable_device_private_entry(entry)) {
> +				entry = make_readable_device_private_entry(
> +					swp_offset(entry));
> +				pmd = swp_entry_to_pmd(entry);
> +
> +				if (pmd_swp_soft_dirty(*src_pmd))
> +					pmd = pmd_swp_mksoft_dirty(pmd);
> +				if (pmd_swp_uffd_wp(*src_pmd))
> +					pmd = pmd_swp_mkuffd_wp(pmd);
> +				set_pmd_at(src_mm, addr, src_pmd, pmd);
> +			}
> +
> +			src_folio = pfn_swap_entry_folio(entry);
> +			VM_WARN_ON(!folio_test_large(src_folio));
> +
> +			folio_get(src_folio);
> +			/*
> +			 * folio_try_dup_anon_rmap_pmd does not fail for
> +			 * device private entries.
> +			 */
> +			VM_WARN_ON(folio_try_dup_anon_rmap_pmd(src_folio,
> +					  &src_folio->page, dst_vma, src_vma));
> +		}

I would appreciate if this code flow here would resemble more what we have in
copy_nonpresent_pte(), at least regarding handling of these two cases.

(e.g., dropping the VM_WARN_ON)

> +
>   		add_mm_counter(dst_mm, MM_ANONPAGES, HPAGE_PMD_NR);
>   		mm_inc_nr_ptes(dst_mm);
>   		pgtable_trans_huge_deposit(dst_mm, dst_pmd, pgtable);
> @@ -2219,15 +2248,22 @@ int zap_huge_pmd(struct mmu_gather *tlb, struct vm_area_struct *vma,
>   			folio_remove_rmap_pmd(folio, page, vma);
>   			WARN_ON_ONCE(folio_mapcount(folio) < 0);
>   			VM_BUG_ON_PAGE(!PageHead(page), page);
> -		} else if (thp_migration_supported()) {
> +		} else if (is_pmd_migration_entry(orig_pmd) ||
> +				is_pmd_device_private_entry(orig_pmd)) {
>   			swp_entry_t entry;
>   
> -			VM_BUG_ON(!is_pmd_migration_entry(orig_pmd));
>   			entry = pmd_to_swp_entry(orig_pmd);
>   			folio = pfn_swap_entry_folio(entry);
>   			flush_needed = 0;
> -		} else
> -			WARN_ONCE(1, "Non present huge pmd without pmd migration enabled!");
> +
> +			if (!thp_migration_supported())
> +				WARN_ONCE(1, "Non present huge pmd without pmd migration enabled!");
> +
> +			if (is_pmd_device_private_entry(orig_pmd)) {
> +				folio_remove_rmap_pmd(folio, &folio->page, vma);
> +				WARN_ON_ONCE(folio_mapcount(folio) < 0);

Can we jsut move that into the folio_is_device_private() check below.

> +			}
> +		}
>   
>   		if (folio_test_anon(folio)) {
>   			zap_deposited_table(tlb->mm, pmd);
> @@ -2247,6 +2283,15 @@ int zap_huge_pmd(struct mmu_gather *tlb, struct vm_area_struct *vma,
>   				folio_mark_accessed(folio);
>   		}
>   
> +		/*
> +		 * Do a folio put on zone device private pages after
> +		 * changes to mm_counter, because the folio_put() will
> +		 * clean folio->mapping and the folio_test_anon() check
> +		 * will not be usable.
> +		 */

The comment can be dropped: it's simple, don't use "folio" after
dropping the reference when zapping.

> +		if (folio_is_device_private(folio))
> +			folio_put(folio);

> +
>   		spin_unlock(ptl);
>   		if (flush_needed)
>   			tlb_remove_page_size(tlb, &folio->page, HPAGE_PMD_SIZE);
> @@ -2375,7 +2420,8 @@ int change_huge_pmd(struct mmu_gather *tlb, struct vm_area_struct *vma,
>   		struct folio *folio = pfn_swap_entry_folio(entry);
>   		pmd_t newpmd;
>   
> -		VM_BUG_ON(!is_pmd_migration_entry(*pmd));
> +		VM_WARN_ON(!is_pmd_migration_entry(*pmd) &&
> +			   !folio_is_device_private(folio));
>   		if (is_writable_migration_entry(entry)) {
>   			/*
>   			 * A protection check is difficult so
> @@ -2388,6 +2434,10 @@ int change_huge_pmd(struct mmu_gather *tlb, struct vm_area_struct *vma,
>   			newpmd = swp_entry_to_pmd(entry);
>   			if (pmd_swp_soft_dirty(*pmd))
>   				newpmd = pmd_swp_mksoft_dirty(newpmd);
> +		} else if (is_writable_device_private_entry(entry)) {
> +			entry = make_readable_device_private_entry(
> +							swp_offset(entry));
> +			newpmd = swp_entry_to_pmd(entry);
>   		} else {
>   			newpmd = *pmd;
>   		}
> @@ -2842,16 +2892,19 @@ static void __split_huge_pmd_locked(struct vm_area_struct *vma, pmd_t *pmd,
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
> +	VM_WARN_ON(!is_pmd_migration_entry(*pmd) && !pmd_trans_huge(*pmd)
> +			&& !(is_pmd_device_private_entry(*pmd)));

VM_WARN_ON(!is_pmd_migration_entry(*pmd) && !pmd_trans_huge(*pmd) &&
	   !(is_pmd_device_private_entry(*pmd)));


>   
>   	count_vm_event(THP_SPLIT_PMD);
>   
> @@ -2899,18 +2952,45 @@ static void __split_huge_pmd_locked(struct vm_area_struct *vma, pmd_t *pmd,
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
> -		if (PageAnon(page))
> -			anon_exclusive = is_readable_exclusive_migration_entry(entry);
> -		young = is_migration_entry_young(entry);
> -		dirty = is_migration_entry_dirty(entry);
> +
> +		folio = pfn_swap_entry_folio(swp_entry);
> +		VM_WARN_ON(!is_migration_entry(swp_entry) &&
> +				!is_device_private_entry(swp_entry));
> +		page = pfn_swap_entry_to_page(swp_entry);
> +
> +		if (is_pmd_migration_entry(old_pmd)) {
> +			write = is_writable_migration_entry(swp_entry);
> +			if (PageAnon(page))
> +				anon_exclusive =
> +					is_readable_exclusive_migration_entry(
> +								swp_entry);
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
> +				if (anon_exclusive)
> +					rmap_flags |= RMAP_EXCLUSIVE;
> +
> +				folio_ref_add(folio, HPAGE_PMD_NR - 1);
> +				if (anon_exclusive)
> +					rmap_flags |= RMAP_EXCLUSIVE;
> +				folio_add_anon_rmap_ptes(folio, page, HPAGE_PMD_NR,
> +						 vma, haddr, rmap_flags);
> +			}
> +		}

This is massive and I'll have to review it with a fresh mind later.

[...]
	put_page(page);
> @@ -3058,8 +3157,10 @@ static void __split_huge_pmd_locked(struct vm_area_struct *vma, pmd_t *pmd,
>   void split_huge_pmd_locked(struct vm_area_struct *vma, unsigned long address,
>   			   pmd_t *pmd, bool freeze)
>   {
> +

^ unrelated

>   	VM_WARN_ON_ONCE(!IS_ALIGNED(address, HPAGE_PMD_SIZE));
> -	if (pmd_trans_huge(*pmd) || is_pmd_migration_entry(*pmd))
> +	if (pmd_trans_huge(*pmd) || is_pmd_migration_entry(*pmd) ||
> +			(is_pmd_device_private_entry(*pmd)))

if (pmd_trans_huge(*pmd) || is_pmd_migration_entry(*pmd) ||
     is_pmd_device_private_entry(*pmd))

>   		__split_huge_pmd_locked(vma, pmd, address, freeze);
>   }
>   
> @@ -3238,6 +3339,9 @@ static void lru_add_split_folio(struct folio *folio, struct folio *new_folio,
>   	VM_BUG_ON_FOLIO(folio_test_lru(new_folio), folio);
>   	lockdep_assert_held(&lruvec->lru_lock);
>   
> +	if (folio_is_device_private(folio))
> +		return;
> +
>   	if (list) {
>   		/* page reclaim is reclaiming a huge page */
>   		VM_WARN_ON(folio_test_lru(folio));
> @@ -3252,6 +3356,7 @@ static void lru_add_split_folio(struct folio *folio, struct folio *new_folio,
>   			list_add_tail(&new_folio->lru, &folio->lru);
>   		folio_set_lru(new_folio);
>   	}
> +

^ unrelated

>   }
>   
>   /* Racy check whether the huge page can be split */
> @@ -3727,7 +3832,7 @@ static int __folio_split(struct folio *folio, unsigned int new_order,
>   
>   	/* Prevent deferred_split_scan() touching ->_refcount */
>   	spin_lock(&ds_queue->split_queue_lock);
> -	if (folio_ref_freeze(folio, 1 + extra_pins)) {
> +	if (folio_ref_freeze(folio, 1 + folio_expected_ref_count(folio))) {

I think I discussed that with Zi Yan and it's tricky. Such a change should go
into a separate cleanup patch.


>   		struct address_space *swap_cache = NULL;
>   		struct lruvec *lruvec;
>   		int expected_refs;
> @@ -3858,8 +3963,9 @@ static int __folio_split(struct folio *folio, unsigned int new_order,
>   	if (nr_shmem_dropped)
>   		shmem_uncharge(mapping->host, nr_shmem_dropped);
>   
> -	if (!ret && is_anon)
> +	if (!ret && is_anon && !folio_is_device_private(folio))
>   		remap_flags = RMP_USE_SHARED_ZEROPAGE;
> +

^ unrelated

>   	remap_page(folio, 1 << order, remap_flags);
>   
>   	/*
> @@ -4603,7 +4709,10 @@ int set_pmd_migration_entry(struct page_vma_mapped_walk *pvmw,
>   		return 0;
>   
>   	flush_cache_range(vma, address, address + HPAGE_PMD_SIZE);
> -	pmdval = pmdp_invalidate(vma, address, pvmw->pmd);
> +	if (unlikely(is_pmd_device_private_entry(*pvmw->pmd)))

Use pmd_present() instead, please. (just like in the pte code that handles this).

Why do we have to flush? pmd_clear() might be sufficient? In the PTE case we use pte_clear().

[...]

>   		pmde = pmd_mksoft_dirty(pmde);
>   	if (is_writable_migration_entry(entry))
> diff --git a/mm/migrate_device.c b/mm/migrate_device.c
> index e05e14d6eacd..0ed337f94fcd 100644
> --- a/mm/migrate_device.c
> +++ b/mm/migrate_device.c
> @@ -136,6 +136,8 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
>   			 * page table entry. Other special swap entries are not
>   			 * migratable, and we ignore regular swapped page.
>   			 */
> +			struct folio *folio;
> +
>   			entry = pte_to_swp_entry(pte);
>   			if (!is_device_private_entry(entry))
>   				goto next;
> @@ -147,6 +149,51 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
>   			    pgmap->owner != migrate->pgmap_owner)
>   				goto next;
>   
> +			folio = page_folio(page);
> +			if (folio_test_large(folio)) {
> +				struct folio *new_folio;
> +				struct folio *new_fault_folio = NULL;
> +
> +				/*
> +				 * The reason for finding pmd present with a
> +				 * device private pte and a large folio for the
> +				 * pte is partial unmaps. Split the folio now
> +				 * for the migration to be handled correctly
> +				 */

There are also other cases, like any VMA splits. Not sure if that makes a difference,
the folio is PTE mapped.

> +				pte_unmap_unlock(ptep, ptl);
> +
> +				folio_get(folio);
> +				if (folio != fault_folio)
> +					folio_lock(folio);
> +				if (split_folio(folio)) {
> +					if (folio != fault_folio)
> +						folio_unlock(folio);
> +					ptep = pte_offset_map_lock(mm, pmdp, addr, &ptl);
> +					goto next;
> +				}
> +
> +				new_folio = page_folio(page);
> +				if (fault_folio)
> +					new_fault_folio = page_folio(migrate->fault_page);
> +
> +				/*
> +				 * Ensure the lock is held on the correct
> +				 * folio after the split
> +				 */
> +				if (!new_fault_folio) {
> +					folio_unlock(folio);
> +					folio_put(folio);
> +				} else if (folio != new_fault_folio) {
> +					folio_get(new_fault_folio);
> +					folio_lock(new_fault_folio);
> +					folio_unlock(folio);
> +					folio_put(folio);
> +				}
> +
> +				addr = start;
> +				goto again;

Another thing to revisit with clean mind.

> +			}
> +
>   			mpfn = migrate_pfn(page_to_pfn(page)) |
>   					MIGRATE_PFN_MIGRATE;
>   			if (is_writable_device_private_entry(entry))
> diff --git a/mm/page_vma_mapped.c b/mm/page_vma_mapped.c
> index e981a1a292d2..246e6c211f34 100644
> --- a/mm/page_vma_mapped.c
> +++ b/mm/page_vma_mapped.c
> @@ -250,12 +250,11 @@ bool page_vma_mapped_walk(struct page_vma_mapped_walk *pvmw)
>   			pvmw->ptl = pmd_lock(mm, pvmw->pmd);
>   			pmde = *pvmw->pmd;
>   			if (!pmd_present(pmde)) {
> -				swp_entry_t entry;
> +				swp_entry_t entry = pmd_to_swp_entry(pmde);
>   
>   				if (!thp_migration_supported() ||
>   				    !(pvmw->flags & PVMW_MIGRATION))
>   					return not_found(pvmw);
> -				entry = pmd_to_swp_entry(pmde);
>   				if (!is_migration_entry(entry) ||
>   				    !check_pmd(swp_offset_pfn(entry), pvmw))
>   					return not_found(pvmw);
> @@ -277,6 +276,16 @@ bool page_vma_mapped_walk(struct page_vma_mapped_walk *pvmw)
>   			 * cannot return prematurely, while zap_huge_pmd() has
>   			 * cleared *pmd but not decremented compound_mapcount().
>   			 */
> +			swp_entry_t entry;
> +
> +			entry = pmd_to_swp_entry(pmde);
> +
> +			if (is_device_private_entry(entry) &&
> +				(pvmw->flags & PVMW_THP_DEVICE_PRIVATE)) {
> +				pvmw->ptl = pmd_lock(mm, pvmw->pmd);
> +				return true;
> +			}
> +
>   			if ((pvmw->flags & PVMW_SYNC) &&
>   			    thp_vma_suitable_order(vma, pvmw->address,
>   						   PMD_ORDER) &&
> diff --git a/mm/pgtable-generic.c b/mm/pgtable-generic.c
> index 567e2d084071..604e8206a2ec 100644
> --- a/mm/pgtable-generic.c
> +++ b/mm/pgtable-generic.c
> @@ -292,6 +292,12 @@ pte_t *___pte_offset_map(pmd_t *pmd, unsigned long addr, pmd_t *pmdvalp)
>   		*pmdvalp = pmdval;
>   	if (unlikely(pmd_none(pmdval) || is_pmd_migration_entry(pmdval)))
>   		goto nomap;
> +	if (is_swap_pmd(pmdval)) {
> +		swp_entry_t entry = pmd_to_swp_entry(pmdval);
> +
> +		if (is_device_private_entry(entry))
> +			goto nomap;
> +	}
>   	if (unlikely(pmd_trans_huge(pmdval)))
>   		goto nomap;
>   	if (unlikely(pmd_bad(pmdval))) {
> diff --git a/mm/rmap.c b/mm/rmap.c
> index b5837075b6e0..f40e45564295 100644
> --- a/mm/rmap.c
> +++ b/mm/rmap.c
> @@ -2285,7 +2285,8 @@ static bool try_to_migrate_one(struct folio *folio, struct vm_area_struct *vma,
>   		     unsigned long address, void *arg)
>   {
>   	struct mm_struct *mm = vma->vm_mm;
> -	DEFINE_FOLIO_VMA_WALK(pvmw, folio, vma, address, 0);
> +	DEFINE_FOLIO_VMA_WALK(pvmw, folio, vma, address,
> +				PVMW_THP_DEVICE_PRIVATE);
>   	bool anon_exclusive, writable, ret = true;
>   	pte_t pteval;
>   	struct page *subpage;
> @@ -2330,6 +2331,10 @@ static bool try_to_migrate_one(struct folio *folio, struct vm_area_struct *vma,
>   	while (page_vma_mapped_walk(&pvmw)) {
>   		/* PMD-mapped THP migration entry */
>   		if (!pvmw.pte) {
> +#ifdef CONFIG_ARCH_ENABLE_THP_MIGRATION
> +			unsigned long pfn;
> +#endif
> +
>   			if (flags & TTU_SPLIT_HUGE_PMD) {
>   				split_huge_pmd_locked(vma, pvmw.address,
>   						      pvmw.pmd, true);
> @@ -2338,8 +2343,21 @@ static bool try_to_migrate_one(struct folio *folio, struct vm_area_struct *vma,
>   				break;
>   			}
>   #ifdef CONFIG_ARCH_ENABLE_THP_MIGRATION
> -			subpage = folio_page(folio,
> -				pmd_pfn(*pvmw.pmd) - folio_pfn(folio));
> +			/*
> +			 * Zone device private folios do not work well with
> +			 * pmd_pfn() on some architectures due to pte
> +			 * inversion.
> +			 */

Please use the handling for the PTE case as inspiration.

		/*
		 * Handle PFN swap PTEs, such as device-exclusive ones, that
		 * actually map pages.
		 */
		pteval = ptep_get(pvmw.pte);
		if (likely(pte_present(pteval))) {
			pfn = pte_pfn(pteval);
		} else {
			pfn = swp_offset_pfn(pte_to_swp_entry(pteval));
			VM_WARN_ON_FOLIO(folio_test_hugetlb(folio), folio);
		}


So I would expect here something like

		/*
		 * Handle PFN swap PTEs, such as device-exclusive ones, that
		 * actually map pages.
		 */
		pmdval = pmdp_get(pvmw.pmd);
		if (likely(pmd_present(pmdval)))
			pfn = pmd_pfn(pmdval);
		else
			pfn = swp_offset_pfn(pmd_to_swp_entry(pmdval));


> +			if (is_pmd_device_private_entry(*pvmw.pmd)) {
> +				swp_entry_t entry = pmd_to_swp_entry(*pvmw.pmd);
> +
> +				pfn = swp_offset_pfn(entry);
> +			} else {
> +				pfn = pmd_pfn(*pvmw.pmd);
> +			}
> +
> +			subpage = folio_page(folio, pfn - folio_pfn(folio));
> +
>   			VM_BUG_ON_FOLIO(folio_test_hugetlb(folio) ||
>   					!folio_test_pmd_mappable(folio), folio);
>   


-- 
Cheers

David / dhildenb

