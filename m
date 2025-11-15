Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC696C5FC4B
	for <lists+dri-devel@lfdr.de>; Sat, 15 Nov 2025 01:51:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 463B710EB99;
	Sat, 15 Nov 2025 00:51:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="Yr5VhBnK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27A7C10EB99
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Nov 2025 00:51:49 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id BCA6641AD7;
 Sat, 15 Nov 2025 00:51:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ACB6CC4CEF1;
 Sat, 15 Nov 2025 00:51:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
 s=korg; t=1763167908;
 bh=c34bXnZOMXHB1/otiiYKeqjSsUyBsx3eTgV6OQSOEQ0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Yr5VhBnKAuzj9cC+8XdpDTsNmuHxB6kbc7gGiLO0L9h/IvJnsYCzBILmm3BDLjQh3
 JgU3YmTjZ48ntDuyp2AVorPbLdrmM1POS7rvsWOIFtsRM0MCNuApKBdMCuLns/6tpS
 dCWkfu6Fa+z0adCrzQgoXMqGsYM3IW5H52Q76bM0=
Date: Fri, 14 Nov 2025 16:51:46 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Balbir Singh <balbirs@nvidia.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 dri-devel@lists.freedesktop.org, David Hildenbrand <david@redhat.com>, Zi
 Yan <ziy@nvidia.com>, Joshua Hahn <joshua.hahnjy@gmail.com>, Rakie Kim
 <rakie.kim@sk.com>, Byungchul Park <byungchul@sk.com>, Gregory Price
 <gourry@gourry.net>, Ying Huang <ying.huang@linux.alibaba.com>, Alistair
 Popple <apopple@nvidia.com>, Oscar Salvador <osalvador@suse.de>, Lorenzo
 Stoakes <lorenzo.stoakes@oracle.com>, Baolin Wang
 <baolin.wang@linux.alibaba.com>, "Liam R. Howlett"
 <Liam.Howlett@oracle.com>, Nico Pache <npache@redhat.com>, Ryan Roberts
 <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, Barry Song
 <baohua@kernel.org>, Lyude Paul <lyude@redhat.com>, Danilo Krummrich
 <dakr@kernel.org>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Ralph Campbell <rcampbell@nvidia.com>, Mika
 =?ISO-8859-1?Q?Penttil=E4?= <mpenttil@redhat.com>, Matthew Brost
 <matthew.brost@intel.com>, Francois Dugast <francois.dugast@intel.com>
Subject: Re: [PATCH] fixup: mm/rmap: extend rmap and migration support
 device-private entries
Message-Id: <20251114165146.5c51eeeee200bd37b378bd45@linux-foundation.org>
In-Reply-To: <20251115002835.3515194-1-balbirs@nvidia.com>
References: <20251115002835.3515194-1-balbirs@nvidia.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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

On Sat, 15 Nov 2025 11:28:35 +1100 Balbir Singh <balbirs@nvidia.com> wrote:

> Follow the pattern used in remove_migration_pte() in
> remove_migration_pmd(). Process the migration entries and if the entry
> type is device private, override the pmde with a device private entry
> and set the soft dirty and uffd_wp bits with the pmd_swp_mksoft_dirty
> and pmd_swp_mkuffd_wp
> 
> ...
>
> This fixup should be squashed into the patch "mm/rmap: extend rmap and
> migration support" of mm/mm-unstable
> 

OK.  After fixing up
mm-replace-pmd_to_swp_entry-with-softleaf_from_pmd.patch, mm.git's
mm/huge_memory.c has the below.  Please double-check.


void remove_migration_pmd(struct page_vma_mapped_walk *pvmw, struct page *new)
{
	struct folio *folio = page_folio(new);
	struct vm_area_struct *vma = pvmw->vma;
	struct mm_struct *mm = vma->vm_mm;
	unsigned long address = pvmw->address;
	unsigned long haddr = address & HPAGE_PMD_MASK;
	pmd_t pmde;
	softleaf_t entry;

	if (!(pvmw->pmd && !pvmw->pte))
		return;

	entry = softleaf_from_pmd(*pvmw->pmd);
	folio_get(folio);
	pmde = folio_mk_pmd(folio, READ_ONCE(vma->vm_page_prot));

	if (pmd_swp_soft_dirty(*pvmw->pmd))
		pmde = pmd_mksoft_dirty(pmde);
	if (softleaf_is_migration_write(entry))
		pmde = pmd_mkwrite(pmde, vma);
	if (pmd_swp_uffd_wp(*pvmw->pmd))
		pmde = pmd_mkuffd_wp(pmde);
	if (!softleaf_is_migration_young(entry))
		pmde = pmd_mkold(pmde);
	/* NOTE: this may contain setting soft-dirty on some archs */
	if (folio_test_dirty(folio) && softleaf_is_migration_dirty(entry))
		pmde = pmd_mkdirty(pmde);

	if (folio_is_device_private(folio)) {
		swp_entry_t entry;

		if (pmd_write(pmde))
			entry = make_writable_device_private_entry(
							page_to_pfn(new));
		else
			entry = make_readable_device_private_entry(
							page_to_pfn(new));
		pmde = swp_entry_to_pmd(entry);

		if (pmd_swp_soft_dirty(*pvmw->pmd))
			pmde = pmd_swp_mksoft_dirty(pmde);
		if (pmd_swp_uffd_wp(*pvmw->pmd))
			pmde = pmd_swp_mkuffd_wp(pmde);
	}

	if (folio_test_anon(folio)) {
		rmap_t rmap_flags = RMAP_NONE;

		if (!softleaf_is_migration_read(entry))
			rmap_flags |= RMAP_EXCLUSIVE;

		folio_add_anon_rmap_pmd(folio, new, vma, haddr, rmap_flags);
	} else {
		folio_add_file_rmap_pmd(folio, new, vma);
	}
	VM_BUG_ON(pmd_write(pmde) && folio_test_anon(folio) && !PageAnonExclusive(new));
	set_pmd_at(mm, haddr, pvmw->pmd, pmde);

	/* No need to invalidate - it was non-present before */
	update_mmu_cache_pmd(vma, address, pvmw->pmd);
	trace_remove_migration_pmd(address, pmd_val(pmde));
}
