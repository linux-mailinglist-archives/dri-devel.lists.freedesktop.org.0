Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97DF0C5C3B8
	for <lists+dri-devel@lfdr.de>; Fri, 14 Nov 2025 10:23:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6928E10EA1B;
	Fri, 14 Nov 2025 09:23:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="U5lG5vZm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A00D10EA1B
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Nov 2025 09:23:11 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 953C960169;
 Fri, 14 Nov 2025 09:23:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2788FC113D0;
 Fri, 14 Nov 2025 09:23:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1763112190;
 bh=IZsYdb3J2TG0ZqDwkKnSD/BUdINuFPFPuUpaAFMOshA=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=U5lG5vZmHFU/SbhlnwtaE/Ua/9v1Q1x9IrvpCzLqE1tFTPWc7qeQ+xIEFlXGBgeH6
 7JFdiPfTuDWiz+ixIzfbZHJV0PKCqYR1FT5u0wd5j/DGwSaSLfFjCQugAfx+sgRNv0
 zl5tVidOG5e4HexSNVSr8BkCGwXLUUPOR5dStA3h7nMRpwYbqX/QQBYY3vlPMeYN06
 KNNS9XXVy1TbWE4adKaPa6oC3hgRQOoBRjip3v9FIYr9DpmhIjIFJPaP6dGUyez+p7
 Yhd9W6x7bEAU7pJqATie25fEJ72RDmfKYUNqIJ021w2MG+HdMg1MT1q04paY9ebJAo
 0b/B4YnIY1YLg==
Message-ID: <e8f4546a-5c48-4488-a115-5af65c06f1dc@kernel.org>
Date: Fri, 14 Nov 2025 10:23:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm/huge_memory: fix override of entry in
 remove_migration_pmd
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
References: <20251114012153.2634497-1-balbirs@nvidia.com>
 <20251114012153.2634497-2-balbirs@nvidia.com>
From: "David Hildenbrand (Red Hat)" <david@kernel.org>
Content-Language: en-US
In-Reply-To: <20251114012153.2634497-2-balbirs@nvidia.com>
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

On 14.11.25 02:21, Balbir Singh wrote:
> Recent changes exposed a BUG in remove_migration_pmd() where the
> migration entry was being overridden when the folio is device private.
> 
> Use scope local entry for creating the device private pmde. Make the
> pmde writable if the migration entry is writable by moving the check
> is_migration_write() prior to creating the device private entry.
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
> Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> ---
>   mm/huge_memory.c | 7 +++++--
>   1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/mm/huge_memory.c b/mm/huge_memory.c
> index 9dda8c48daca..df93768a6e15 100644
> --- a/mm/huge_memory.c
> +++ b/mm/huge_memory.c
> @@ -4698,7 +4698,12 @@ void remove_migration_pmd(struct page_vma_mapped_walk *pvmw, struct page *new)
>   	folio_get(folio);
>   	pmde = folio_mk_pmd(folio, READ_ONCE(vma->vm_page_prot));
>   
> +	if (is_writable_migration_entry(entry))
> +		pmde = pmd_mkwrite(pmde, vma);
> +
>   	if (folio_is_device_private(folio)) {
> +		swp_entry_t entry;
> +
>   		if (pmd_write(pmde))
>   			entry = make_writable_device_private_entry(
>   							page_to_pfn(new));
> @@ -4710,8 +4715,6 @@ void remove_migration_pmd(struct page_vma_mapped_walk *pvmw, struct page *new)
>   
>   	if (pmd_swp_soft_dirty(*pvmw->pmd))
>   		pmde = pmd_mksoft_dirty(pmde);
> -	if (is_writable_migration_entry(entry))
> -		pmde = pmd_mkwrite(pmde, vma);
>   	if (pmd_swp_uffd_wp(*pvmw->pmd))
>   		pmde = pmd_mkuffd_wp(pmde);
>   	if (!is_migration_entry_young(entry))

There are more problems here: you cannot call pmd_mksoft_dirty() etc on 
something that is not a present pmd! We have pmd_swp_mksoft_dirty() and 
friends for that.

So you'll have to completely split both paths.

-- 
Cheers

David
