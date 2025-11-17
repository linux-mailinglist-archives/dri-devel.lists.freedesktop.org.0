Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A999C6438B
	for <lists+dri-devel@lfdr.de>; Mon, 17 Nov 2025 13:58:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B10DF10E3B7;
	Mon, 17 Nov 2025 12:58:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Uhgn3cJv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EE0310E3E0
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Nov 2025 12:58:30 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 36C0A601FE;
 Mon, 17 Nov 2025 12:58:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FCDFC116B1;
 Mon, 17 Nov 2025 12:58:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1763384308;
 bh=OLr27sQ+JriRX4/NEDgdTqE74P+APe5Bc1JBLjDHgq4=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Uhgn3cJv5PiL0Ru44n2U1aAWvA4gQuK/A4zSlD33Ju9WdIDaoc4NQCi9BKrydme5U
 0YQBymY5uU72yIUqIBCKC9O0IAOn16lO+ukjanViFoKEcpRGZ5DGGV/SECz0RDBUjT
 rEePn1ib158MU2B6hox8YN6Z8CnVFAAf8bezetMjZXueWirN4xVewvtZ+kdgV6ddMx
 uIoJDwlqHCfLvfu0d9jdPXE2270dPM93g75FBKwB/rO/CP0Htlee1sS5JKudJbH7wT
 JgsPZF2O2DkT1Ds6IAJR6fZ2bFZn6G3we5pytq8XbrqcFpBImUoIntYOUfVxzmLaao
 euff+N0en5yAw==
Message-ID: <6020005e-8b62-415f-993e-b1d99e0c5158@kernel.org>
Date: Mon, 17 Nov 2025 13:58:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] fixup: mm/rmap: extend rmap and migration support
 device-private entries
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
References: <20251115002835.3515194-1-balbirs@nvidia.com>
From: "David Hildenbrand (Red Hat)" <david@kernel.org>
Content-Language: en-US
In-Reply-To: <20251115002835.3515194-1-balbirs@nvidia.com>
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

On 15.11.25 01:28, Balbir Singh wrote:
> Follow the pattern used in remove_migration_pte() in
> remove_migration_pmd(). Process the migration entries and if the entry
> type is device private, override the pmde with a device private entry
> and set the soft dirty and uffd_wp bits with the pmd_swp_mksoft_dirty
> and pmd_swp_mkuffd_wp
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
> This fixup should be squashed into the patch "mm/rmap: extend rmap and
> migration support" of mm/mm-unstable
> 
>   mm/huge_memory.c | 27 +++++++++++++++++----------
>   1 file changed, 17 insertions(+), 10 deletions(-)
> 
> diff --git a/mm/huge_memory.c b/mm/huge_memory.c
> index 9dda8c48daca..50ba458efcab 100644
> --- a/mm/huge_memory.c
> +++ b/mm/huge_memory.c
> @@ -4698,16 +4698,6 @@ void remove_migration_pmd(struct page_vma_mapped_walk *pvmw, struct page *new)
>   	folio_get(folio);
>   	pmde = folio_mk_pmd(folio, READ_ONCE(vma->vm_page_prot));
>   
> -	if (folio_is_device_private(folio)) {
> -		if (pmd_write(pmde))
> -			entry = make_writable_device_private_entry(
> -							page_to_pfn(new));
> -		else
> -			entry = make_readable_device_private_entry(
> -							page_to_pfn(new));
> -		pmde = swp_entry_to_pmd(entry);
> -	}
> -
>   	if (pmd_swp_soft_dirty(*pvmw->pmd))
>   		pmde = pmd_mksoft_dirty(pmde);
>   	if (is_writable_migration_entry(entry))
> @@ -4720,6 +4710,23 @@ void remove_migration_pmd(struct page_vma_mapped_walk *pvmw, struct page *new)
>   	if (folio_test_dirty(folio) && is_migration_entry_dirty(entry))
>   		pmde = pmd_mkdirty(pmde);
>   
> +	if (folio_is_device_private(folio)) {
> +		swp_entry_t entry;

It's a bit nasty to have the same variable shadowed here.

We could reuse the existing entry by handling the code more similar to 
remove_migration_pte(): determine RMAP_EXCLUSIVE earlier.

> +
> +		if (pmd_write(pmde))
> +			entry = make_writable_device_private_entry(
> +							page_to_pfn(new));
> +		else
> +			entry = make_readable_device_private_entry(
> +							page_to_pfn(new));
> +		pmde = swp_entry_to_pmd(entry);
> +
> +		if (pmd_swp_soft_dirty(*pvmw->pmd))
> +			pmde = pmd_swp_mksoft_dirty(pmde);
> +		if (pmd_swp_uffd_wp(*pvmw->pmd))
> +			pmde = pmd_swp_mkuffd_wp(pmde);
> +	}
> +
>   	if (folio_test_anon(folio)) {
>   		rmap_t rmap_flags = RMAP_NONE;
>   

I guess at some point we could separate both parts completely (no need 
to do all this work on pmdb before the folio_is_device_private(folio) 
check, so this could be

if (folio_is_device_private(folio)) {
	...
} else {
	entry = pmd_to_swp_entry(*pvmw->pmd);
	folio_get(folio);
	...
}

That is something for another day though, and remove_migration_pte() 
should be cleaned up then as well.

-- 
Cheers

David
