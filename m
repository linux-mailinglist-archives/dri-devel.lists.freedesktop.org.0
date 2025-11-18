Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE566C6BA44
	for <lists+dri-devel@lfdr.de>; Tue, 18 Nov 2025 21:36:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 136FA10E535;
	Tue, 18 Nov 2025 20:36:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="OA/cnLrT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2712710E535
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 20:36:38 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 1A4B7601B0;
 Tue, 18 Nov 2025 20:36:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A977CC19423;
 Tue, 18 Nov 2025 20:36:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1763498196;
 bh=h+3BwWhhIvXtH6CqYR0CGMuK8HiVDCd7iIzIP1+nrQ4=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=OA/cnLrThWTLOpG3iebN2/Maw8mLicbQREvhvWlciL5iL9KlyIZmjvRiHJeDwx14v
 6/77qdoTVyYvAAFyVpuPLFaNAFFWAxjc3ZhGWQANKGOffN4Emf8T6QiMV/Wr13n8Br
 PhjOTUh+UGpbcIGIrs3cQ9m37KmfyIw/AH0akSjhnOpfZ1lCpRzWBMfAOND1fkBusG
 MwMvM0qKnV2toUXlBIayW4KlQ6esfqJqDVxg257CWMfLd2aF/2zDrfnED3sT/3T4VW
 rPSOZeyx2qrQQ+vyziYw8DQ+MG+P4u9Opwp2Hfnlap23UCFx9/5ODXA6ye9d8osoCb
 zzYB42uDNvYeQ==
Message-ID: <5e864bfe-6817-4ec5-819f-9648a23abfa3@kernel.org>
Date: Tue, 18 Nov 2025 21:36:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] mm/huge_memory: introduce folio_split_unmapped
To: Balbir Singh <balbirs@nvidia.com>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, dri-devel@lists.freedesktop.org
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
References: <20251115084041.3914728-1-balbirs@nvidia.com>
From: "David Hildenbrand (Red Hat)" <david@kernel.org>
Content-Language: en-US
In-Reply-To: <20251115084041.3914728-1-balbirs@nvidia.com>
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

On 15.11.25 09:40, Balbir Singh wrote:
> Unmapped was added as a parameter to __folio_split() and related
> call sites to support splitting of folios already in the midst
> of a migration. This special case arose for device private folio
> migration since during migration there could be a disconnect between
> source and destination on the folio size.
> 
> Introduce folio_split_unmapped() to handle this special case. Also
> refactor code and add __folio_freeze_and_split_unmapped() helper that
> is common to both __folio_split() and folio_split_unmapped().
> 
> This in turn removes the special casing introduced by the unmapped
> parameter in __folio_split().
> 

I was briefly wondering: why can't we just detect at the beginning of 
the __folio_split() that the folio is unmapped (!folio_mapped()) and 
then continue assuming the folio is unmapped?

The folio is locked, so it shouldn't just become mapped again.

But then I looked into the details and figured that we will also not try 
to remap (replace migration entries) and focus on anon folios only.

I think we really have to document this properly. See below.

[...]

> +/*

Can we have proper kerneldoc?

> + * This function is a helper for splitting folios that have already been unmapped.
> + * The use case is that the device or the CPU can refuse to migrate THP pages in
> + * the middle of migration, due to allocation issues on either side
> + *
> + * The high level code is copied from __folio_split, since the pages are anonymous
> + * and are already isolated from the LRU, the code has been simplified to not
> + * burden __folio_split with unmapped sprinkled into the code.

Please drop the history of how this code was obtained :) Focus on 
ducmenting what the function does, what it expects from the caller, and 
what the result of the operation will be.

> + *
> + * None of the split folios are unlocked


Looking into the details, I think this function also does not

(a) remap the folio

(b) call things like free_folio_and_swap_cache()

Which locks do have to be held by the caller? I'd assume the anon vma 
lock and the folio lock?

Would this function currently work for anon folios that are in the 
swapcache?

And I assume this function works for ZONE_DEVICE and !ZONE_DEVICE?


Please carefully document all that (locks held, folio isolated, folio 
unmapped, will not remap the folio, anon folios only, etc).

> + */
> +int folio_split_unmapped(struct folio *folio, unsigned int new_order)
> +{
> +	int extra_pins, ret = 0;
> +
> +	VM_WARN_ON_ONCE_FOLIO(folio_mapped(folio), folio);
> +	VM_WARN_ON_ONCE_FOLIO(!folio_test_locked(folio), folio);
> +	VM_WARN_ON_ONCE_FOLIO(!folio_test_large(folio), folio);
> +	VM_WARN_ON_ONCE_FOLIO(!folio_test_anon(folio), folio);
> +
> +	if (!can_split_folio(folio, 1, &extra_pins))
> +		return -EAGAIN;
> +
> +	local_irq_disable();
> +	ret = __folio_freeze_and_split_unmapped(folio, new_order, &folio->page, NULL,
> +						NULL, false, NULL, SPLIT_TYPE_UNIFORM,
> +						0, NULL, extra_pins);
> +	local_irq_enable();
> +	return ret;
> +}
> +
>   /*
>    * This function splits a large folio into smaller folios of order @new_order.
>    * @page can point to any page of the large folio to split. The split operation
> @@ -4127,12 +4171,12 @@ static int __folio_split(struct folio *folio, unsigned int new_order,
>    * with the folio. Splitting to order 0 is compatible with all folios.
>    */
>   int __split_huge_page_to_list_to_order(struct page *page, struct list_head *list,
> -				     unsigned int new_order, bool unmapped)
> +				     unsigned int new_order)
>   {
>   	struct folio *folio = page_folio(page);
>   
>   	return __folio_split(folio, new_order, &folio->page, page, list,
> -			     SPLIT_TYPE_UNIFORM, unmapped);
> +			     SPLIT_TYPE_UNIFORM);
>   }
>   
>   /**
> @@ -4163,7 +4207,7 @@ int folio_split(struct folio *folio, unsigned int new_order,
>   		struct page *split_at, struct list_head *list)
>   {
>   	return __folio_split(folio, new_order, split_at, &folio->page, list,
> -			     SPLIT_TYPE_NON_UNIFORM, false);
> +			     SPLIT_TYPE_NON_UNIFORM);
>   }
>   
>   int min_order_for_split(struct folio *folio)
> diff --git a/mm/migrate_device.c b/mm/migrate_device.c
> index 46dd68cfc503..05ce95f43ab9 100644
> --- a/mm/migrate_device.c
> +++ b/mm/migrate_device.c
> @@ -909,8 +909,7 @@ static int migrate_vma_split_unmapped_folio(struct migrate_vma *migrate,
>   
>   	folio_get(folio);
>   	split_huge_pmd_address(migrate->vma, addr, true);
> -	ret = __split_huge_page_to_list_to_order(folio_page(folio, 0), NULL,
> -							0, true);
> +	ret = folio_split_unmapped(folio, 0);
>   	if (ret)
>   		return ret;
>   	migrate->src[idx] &= ~MIGRATE_PFN_COMPOUND;

This is clearly a win.

-- 
Cheers

David
