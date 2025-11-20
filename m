Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DA11C73064
	for <lists+dri-devel@lfdr.de>; Thu, 20 Nov 2025 10:09:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E89610E71D;
	Thu, 20 Nov 2025 09:09:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="YFgfR4YE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EAFF10E71F
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Nov 2025 09:09:21 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id F328743A99;
 Thu, 20 Nov 2025 09:09:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71202C116B1;
 Thu, 20 Nov 2025 09:09:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1763629760;
 bh=3LRBNuFqcIWNv6+llg0BKBD85RcO8c2uV+3xfhb2i7E=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=YFgfR4YEhqqRgIYW5R3th1AbIc7N4bMKYuIyuo1OQ6cSObvbe8AQcGnngD39IwZdr
 ++v65KV1XOH9vDz4/dcQ/BPGftq92Q1iHqergUHm66NR3WzzIuWKPJyau97h29YT5z
 N981+SHwilrL7xh8KcpDzkcM2lHZ+HWwnz9Jcp9KTn9Cqas7AKLACuhs/W3IXUeS/t
 ji75XIawgZATeYoXZVyT3RP4lmzWOyx8moZ0jZRxAKY+Dcuwj+9F25LTDd/uQ6k+Mu
 r63xXelNelaLHfk+75Fl8thTejwKggktdAEU3rQ/gXWAA4ygAbM/UeaREjq/g1fj0V
 yNyTSc7Ygu6RQ==
Message-ID: <4b87bd52-5582-4599-8a97-38843e27d0a7@kernel.org>
Date: Thu, 20 Nov 2025 10:09:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] fixup: mm/huge_memory.c: introduce folio_split_unmapped
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
References: <20251120030709.2933665-1-balbirs@nvidia.com>
From: "David Hildenbrand (Red Hat)" <david@kernel.org>
Content-Language: en-US
In-Reply-To: <20251120030709.2933665-1-balbirs@nvidia.com>
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

On 11/20/25 04:07, Balbir Singh wrote:
> Code refactoring of __folio_split() via helper
> __folio_freeze_and_split_unmapped() caused a regression with clang-20
> with CONFIG_SHMEM=n, the compiler was not able to optimize away the
> call to shmem_uncharge() due to changes in nr_shmem_dropped.
> Fix this by checking for shmem_mapping() prior to calling
> shmem_uncharge(), shmem_mapping() returns false when CONFIG_SHMEM=n.
> 
> smatch also complained about parameter end being used without
> initialization, which is a false positive, but keep the tool happy
> by sending in initialized parameters. end is initialized to 0.
> 
> Add detailed documentation comments for folio_split_unmapped()
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
>   mm/huge_memory.c | 32 ++++++++++++++++++++++----------
>   1 file changed, 22 insertions(+), 10 deletions(-)
> 
> diff --git a/mm/huge_memory.c b/mm/huge_memory.c
> index 78a31a476ad3..c4267a0f74df 100644
> --- a/mm/huge_memory.c
> +++ b/mm/huge_memory.c
> @@ -3751,6 +3751,7 @@ static int __folio_freeze_and_split_unmapped(struct folio *folio, unsigned int n
>   	int ret = 0;
>   	struct deferred_split *ds_queue;
>   
> +	VM_WARN_ON_ONCE(!mapping && end != 0);

You could drop the "!= 0"

>   	/* Prevent deferred_split_scan() touching ->_refcount */
>   	ds_queue = folio_split_queue_lock(folio);
>   	if (folio_ref_freeze(folio, 1 + extra_pins)) {
> @@ -3919,7 +3920,7 @@ static int __folio_split(struct folio *folio, unsigned int new_order,
>   	int nr_shmem_dropped = 0;
>   	int remap_flags = 0;
>   	int extra_pins, ret;
> -	pgoff_t end;
> +	pgoff_t end = 0;
>   	bool is_hzp;
>   
>   	VM_WARN_ON_ONCE_FOLIO(!folio_test_locked(folio), folio);
> @@ -4049,7 +4050,7 @@ static int __folio_split(struct folio *folio, unsigned int new_order,
>   
>   	local_irq_enable();
>   
> -	if (nr_shmem_dropped)
> +	if (mapping && shmem_mapping(mapping) && nr_shmem_dropped)
>   		shmem_uncharge(mapping->host, nr_shmem_dropped);

That looks questionable. We shouldn't add runtime check to handle 
buildtime things.

Likely what you want is instead

if (IS_ENABLED(CONFIG_SHMEM) && nr_shmem_dropped)
	shmem_uncharge()

>   
>   	if (!ret && is_anon && !folio_is_device_private(folio))
> @@ -4092,16 +4093,27 @@ static int __folio_split(struct folio *folio, unsigned int new_order,
>   	return ret;
>   }
>   
> -/*
> - * This function is a helper for splitting folios that have already been unmapped.
> - * The use case is that the device or the CPU can refuse to migrate THP pages in
> - * the middle of migration, due to allocation issues on either side
> +/**
> + * folio_split_unmapped() - split a large anon folio that is already unmapped
> + * @folio: folio to split
> + * @new_order: the order of folios after split
> + *
> + * This function is a helper for splitting folios that have already been
> + * unmapped. The use case is that the device or the CPU can refuse to migrate
> + * THP pages in the middle of migration, due to allocation issues on either
> + * side.
> + *
> + * anon_vma_lock is not required to be held, mmap_read_lock() or
> + * mmap_write_lock() should be held. @folio is expected to be locked by the
> + * caller. device-private and non device-private folios are supported along
> + * with folios that are in the swapcache. @folio should also be unmapped and
> + * isolated from LRU (if applicable)
>    *
> - * The high level code is copied from __folio_split, since the pages are anonymous
> - * and are already isolated from the LRU, the code has been simplified to not
> - * burden __folio_split with unmapped sprinkled into the code.
> + * Upon return, the folio is not remapped, split folios are not added to LRU,
> + * free_folio_and_swap_cache() is not called, and new folios remain locked.
>    *
> - * None of the split folios are unlocked
> + * Return: 0 on success, -EAGAIN if the folio cannot be split (e.g., due to
> + *         insufficient reference count or extra pins).

Sounds much better to me, thanks.

-- 
Cheers

David
