Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 76E34B531DD
	for <lists+dri-devel@lfdr.de>; Thu, 11 Sep 2025 14:16:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F61B10EADD;
	Thu, 11 Sep 2025 12:16:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="JNAl9yJR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF5C210EADD
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Sep 2025 12:15:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1757592957;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=LZSC160BNjuUUAGLkXphv06qqbR9jmakoLUoFELbVgo=;
 b=JNAl9yJRIkC9pIQd65H3xLzXZ1EIl7BpT0Ync6JhBfW1hxwSRvgeUz6+xBrMMbMI7f4U1v
 JVVgOGQmaVBYRBTV0rMxrfW6sONuQyWjDnywlp9lyAcfp7I/SWrqURSo3jJUCLUL9P67DH
 hSASFVrpBtIhQ7E/ly9264Bnaug0eZE=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-407-tTfljEu9MOmBZFcaye2vmA-1; Thu, 11 Sep 2025 08:15:56 -0400
X-MC-Unique: tTfljEu9MOmBZFcaye2vmA-1
X-Mimecast-MFC-AGG-ID: tTfljEu9MOmBZFcaye2vmA_1757592955
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-45e05ff0b36so1902215e9.0
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Sep 2025 05:15:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757592955; x=1758197755;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LZSC160BNjuUUAGLkXphv06qqbR9jmakoLUoFELbVgo=;
 b=wyQj4nbZClzWIuJTtH0zZKtrAMkeP6B2mQst2qvtYuZG5KZVBondv851mIoGw1hBVv
 Eu5uqxAU5UtB9r72N5M93ke2cdxzhcOmNz2cbW5AYv1MHvJm89kV/1kWB4dnnrPmVtLU
 +x1dpeLtXGC3ZhHKnkjIOUjXpfSOvclhYm9XJ73RXOyzPOl73/iT+eh/VI5xSF1ys8oX
 S5SKsznlgJolkRsZ3XQq5Ky7ZvLI+3iRgHRJC9v+YZBjFSB3WZNJadmuYnaln8Oi59P8
 CLPqvVKXWkJGpfOXrFn561EUBpSan9wtS/lwpqT3E7CsAZa8Kd5XTDAObhcfGQTgWnJE
 DFWA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWa93sX6UNxwpO0LZOLc+NwTXLooADGUJ89THNrP1pjkuOP28YUJqDbKGuWp/hpI63hWl1mTM5ZTgs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywl3g2imoqoocXTmJh3UiO26JsOHZY4r32AxhRIPXauO7uztIpS
 MKIwFi1Nm77yL0kQeEKuZkXtehl4B9Kn75tniooOH9Jic6Yc0PDxsJ+iv2E45NTSMRlVN/BMOcj
 a8BH5N9oZw7gSPQ/KuSIwlawB/M9YhFLJ9+mO2dTvtSavg2Yw4btdjACdj2iDnDDKeoxNhA==
X-Gm-Gg: ASbGncsv2rZAqaWRAnS78WzX3QkR1GSQ7fwRqBDk3bXFy2DyhHTiPrELJx46R2sCQcy
 FUBhTsq4YGMmUwfJQomUK38JgatlrGTMqGDvisWOQoCZG7MxY4ng63ygox7+vIAgRFSkYTfaI5d
 doufTCjIuUbvYCsGpB3O7xQZk61gAdtajAXxRwOLQlGpcE/nT37KClnDGvHeOF0FCMiqzTTgXfZ
 n5fQBQwtvhU5BGhucWSgaqyUQNJ377PEgCvtSlSgCJwCvJ5WR8ngMphJRDP2qk1Oiha/nVPbwUw
 UuS0JDxLkJ5pc47YEhlVj8Op/pLmbvnNGSBSPgk+Fc3Ucd93y9CWrsy0/RZV8JAx2riw4TfNX2A
 yoWsOJ9RpUESIZhhtqsN53gnSg8RWeK2YH7c9tgneF/A8NhlPZ52Mld1UPYPLjCmz1k4=
X-Received: by 2002:a05:6000:26c4:b0:3ce:7673:bb30 with SMTP id
 ffacd0b85a97d-3e75e13cae4mr2820249f8f.14.1757592955152; 
 Thu, 11 Sep 2025 05:15:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFguV4xqw7F+/FuyOrWlJOAk5WiiJK6C2irThfGhJhUviXccwRkqmzT0qljmwNeg5bEqGRHFw==
X-Received: by 2002:a05:6000:26c4:b0:3ce:7673:bb30 with SMTP id
 ffacd0b85a97d-3e75e13cae4mr2820217f8f.14.1757592954536; 
 Thu, 11 Sep 2025 05:15:54 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f42:b000:db8b:7655:f60f:812b?
 (p200300d82f42b000db8b7655f60f812b.dip0.t-ipconnect.de.
 [2003:d8:2f42:b000:db8b:7655:f60f:812b])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45e0157d68esm12986065e9.6.2025.09.11.05.15.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Sep 2025 05:15:53 -0700 (PDT)
Message-ID: <17e3c19e-0719-4643-8db8-cf8c5b5aa022@redhat.com>
Date: Thu, 11 Sep 2025 14:15:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [v5 02/15] mm/huge_memory: add device-private THP support to PMD
 operations
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
 <20250908000448.180088-3-balbirs@nvidia.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 qIws/H2t
In-Reply-To: <20250908000448.180088-3-balbirs@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: MRfRTq5S_fp0ZvAsjtv2YasAnLkaEPryc7SQ0RBno0g_1757592955
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
> Extend core huge page management functions to handle device-private THP
> entries. This enables proper handling of large device-private folios in
> fundamental MM operations.
> 
> The following functions have been updated:
> 
> - copy_huge_pmd(): Handle device-private entries during fork/clone
> - zap_huge_pmd(): Properly free device-private THP during munmap
> - change_huge_pmd(): Support protection changes on device-private THP
> - __pte_offset_map(): Add device-private entry awareness
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
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Balbir Singh <balbirs@nvidia.com>
> ---
>   include/linux/swapops.h | 27 +++++++++++++++++++
>   mm/huge_memory.c        | 60 ++++++++++++++++++++++++++++++++++++-----
>   mm/pgtable-generic.c    |  6 +++++
>   3 files changed, 86 insertions(+), 7 deletions(-)
> 
> diff --git a/include/linux/swapops.h b/include/linux/swapops.h
> index 64ea151a7ae3..59c5889a4d54 100644
> --- a/include/linux/swapops.h
> +++ b/include/linux/swapops.h
> @@ -594,6 +594,33 @@ static inline int is_pmd_migration_entry(pmd_t pmd)
>   }
>   #endif  /* CONFIG_ARCH_ENABLE_THP_MIGRATION */
>   
> +#if defined(CONFIG_ZONE_DEVICE) && defined(CONFIG_ARCH_ENABLE_THP_MIGRATION)
> +
> +/**
> + * is_pmd_device_private_entry() - Check if PMD contains a device private swap entry
> + * @pmd: The PMD to check
> + *
> + * Returns true if the PMD contains a swap entry that represents a device private
> + * page mapping. This is used for zone device private pages that have been
> + * swapped out but still need special handling during various memory management
> + * operations.
> + *
> + * Return: 1 if PMD contains device private entry, 0 otherwise
> + */
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
> diff --git a/mm/huge_memory.c b/mm/huge_memory.c
> index 26cedfcd7418..2af74e09b279 100644
> --- a/mm/huge_memory.c
> +++ b/mm/huge_memory.c
> @@ -1703,8 +1703,11 @@ int copy_huge_pmd(struct mm_struct *dst_mm, struct mm_struct *src_mm,
>   	if (unlikely(is_swap_pmd(pmd))) {
>   		swp_entry_t entry = pmd_to_swp_entry(pmd);
>   
> -		VM_BUG_ON(!is_pmd_migration_entry(pmd));
> -		if (!is_readable_migration_entry(entry)) {
> +		VM_WARN_ON(!is_pmd_migration_entry(pmd) &&
> +				!is_pmd_device_private_entry(pmd));
> +

Wrong indentation.

> +		if (is_migration_entry(entry) &&
> +			!is_readable_migration_entry(entry)) {

Dito.

Wonder if we want to be more explicit.

if (is_readable_migration_entry(enrty) ||
     is_readable_exclusive_migration_entry)) {


>   			entry = make_readable_migration_entry(
>   							swp_offset(entry));
>   			pmd = swp_entry_to_pmd(entry);
> @@ -1713,7 +1716,37 @@ int copy_huge_pmd(struct mm_struct *dst_mm, struct mm_struct *src_mm,
>   			if (pmd_swp_uffd_wp(*src_pmd))
>   				pmd = pmd_swp_mkuffd_wp(pmd);
>   			set_pmd_at(src_mm, addr, src_pmd, pmd);
> +		} else if (is_device_private_entry(entry)) {
> +			/*
> +			 * For device private entries, since there are no
> +			 * read exclusive entries, writable = !readable
> +			 */
> +			if (is_writable_device_private_entry(entry)) {
> +				entry = make_readable_device_private_entry(
> +					swp_offset(entry));

Put this on a single line.

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
> +			ret = folio_try_dup_anon_rmap_pmd(src_folio,
> +							  &src_folio->page,
> +							  dst_vma, src_vma);
> +			VM_WARN_ON(ret);

Please just drop the ret + VM_WARN_ON here, like we did in the PTE case.

>   		}
> +
>   		add_mm_counter(dst_mm, MM_ANONPAGES, HPAGE_PMD_NR);
>   		mm_inc_nr_ptes(dst_mm);
>   		pgtable_trans_huge_deposit(dst_mm, dst_pmd, pgtable);
> @@ -2211,15 +2244,17 @@ int zap_huge_pmd(struct mmu_gather *tlb, struct vm_area_struct *vma,
>   			folio_remove_rmap_pmd(folio, page, vma);
>   			WARN_ON_ONCE(folio_mapcount(folio) < 0);
>   			VM_BUG_ON_PAGE(!PageHead(page), page);
> -		} else if (thp_migration_supported()) {
> +		} else if (is_pmd_migration_entry(orig_pmd) ||
> +				is_pmd_device_private_entry(orig_pmd)) {


Indentation ...

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
> +		}
>   
>   		if (folio_test_anon(folio)) {
>   			zap_deposited_table(tlb->mm, pmd);
> @@ -2239,6 +2274,12 @@ int zap_huge_pmd(struct mmu_gather *tlb, struct vm_area_struct *vma,
>   				folio_mark_accessed(folio);
>   		}
>   
> +		if (folio_is_device_private(folio)) {
> +			folio_remove_rmap_pmd(folio, &folio->page, vma);
> +			WARN_ON_ONCE(folio_mapcount(folio) < 0);
> +			folio_put(folio);
> +		}
> +
>   		spin_unlock(ptl);
>   		if (flush_needed)
>   			tlb_remove_page_size(tlb, &folio->page, HPAGE_PMD_SIZE);
> @@ -2367,7 +2408,8 @@ int change_huge_pmd(struct mmu_gather *tlb, struct vm_area_struct *vma,
>   		struct folio *folio = pfn_swap_entry_folio(entry);
>   		pmd_t newpmd;
>   
> -		VM_BUG_ON(!is_pmd_migration_entry(*pmd));
> +		VM_WARN_ON(!is_pmd_migration_entry(*pmd) &&
> +			   !folio_is_device_private(folio));
>   		if (is_writable_migration_entry(entry)) {
>   			/*
>   			 * A protection check is difficult so
> @@ -2380,6 +2422,10 @@ int change_huge_pmd(struct mmu_gather *tlb, struct vm_area_struct *vma,
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

Couldn't we do here

if (!pmd_present(pmdval))
	goto nomap;

To replace the original pmd_none() .. check.

A page table must always be present IIRC.

-- 
Cheers

David / dhildenb

