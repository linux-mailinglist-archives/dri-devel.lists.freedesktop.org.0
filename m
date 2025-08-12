Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D1FC1B22AEF
	for <lists+dri-devel@lfdr.de>; Tue, 12 Aug 2025 16:47:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01C7710E602;
	Tue, 12 Aug 2025 14:47:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BaGnX7wE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AF6F10E602
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Aug 2025 14:47:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755010074; x=1786546074;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=+CPu5U+JXff4AfpVYRE/lxH7V7HwFVeYgEko8LGWaqQ=;
 b=BaGnX7wEhJ+emJAsjUSK5YRqqU1jlYF/Ir8iB94GS5VU1RN4upoqGh3N
 zUYQFZm6mAZ3JEUMdC7XVC+BVN0X4elQa72hiV/qhb5Zb+UaZHJ7I7X/c
 K10u3mzZY6OnwRlqg+VCC3Qasl0WtWFAWuykTDwGgjYZAE7xvSfvUeYyn
 ryK2ml6ABW0LSR/kOTBozCrwwF3k1oCpW6ZnR8Ja3YQVz1fOoYFNVqjJA
 aORH7NvEC2NzGCkFLQZXPxneGYPeToR3oFHe3i4VYhd0i+DxfCV9L77fu
 ZVHzG7Bm3SAQx+Hh8J0Tn+ClLQ+jkVqr798KD3Bw2deu0qakWpUYdEFa/ A==;
X-CSE-ConnectionGUID: 8mKHM7O4QhuJ7J/bBjRUyA==
X-CSE-MsgGUID: 60Odd9gmSjeMuyj7uCBbjw==
X-IronPort-AV: E=McAfee;i="6800,10657,11520"; a="56496947"
X-IronPort-AV: E=Sophos;i="6.17,284,1747724400"; d="scan'208";a="56496947"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2025 07:47:54 -0700
X-CSE-ConnectionGUID: MnD2gOO3SUuU0T0NQMJEdQ==
X-CSE-MsgGUID: SIaAoEFUTkOryu6ulAH6KA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,284,1747724400"; d="scan'208";a="165849626"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
 by orviesa009.jf.intel.com with ESMTP; 12 Aug 2025 07:47:47 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1ulqHw-0006u3-0B;
 Tue, 12 Aug 2025 14:47:44 +0000
Date: Tue, 12 Aug 2025 22:47:38 +0800
From: kernel test robot <lkp@intel.com>
To: Balbir Singh <balbirs@nvidia.com>, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Balbir Singh <balbirs@nvidia.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Linux Memory Management List <linux-mm@kvack.org>,
 David Hildenbrand <david@redhat.com>, Zi Yan <ziy@nvidia.com>,
 Joshua Hahn <joshua.hahnjy@gmail.com>, Rakie Kim <rakie.kim@sk.com>,
 Byungchul Park <byungchul@sk.com>, Gregory Price <gourry@gourry.net>,
 Ying Huang <ying.huang@linux.alibaba.com>,
 Alistair Popple <apopple@nvidia.com>, Oscar Salvador <osalvador@suse.de>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Nico Pache <npache@redhat.com>, Ryan Roberts <ryan.roberts@arm.com>,
 Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>,
 Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Ralph Campbell <rcampbell@nvidia.com>,
 Mika =?iso-8859-1?Q?Penttil=E4?= <mpenttil@redhat.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Francois Dugast <francois.dugast@intel.com>
Subject: Re: [v3 02/11] mm/thp: zone_device awareness in THP handling code
Message-ID: <202508122212.qjsfr5Wf-lkp@intel.com>
References: <20250812024036.690064-3-balbirs@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250812024036.690064-3-balbirs@nvidia.com>
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

Hi Balbir,

kernel test robot noticed the following build warnings:

[auto build test WARNING on akpm-mm/mm-everything]

url:    https://github.com/intel-lab-lkp/linux/commits/Balbir-Singh/mm-zone_device-support-large-zone-device-private-folios/20250812-105145
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20250812024036.690064-3-balbirs%40nvidia.com
patch subject: [v3 02/11] mm/thp: zone_device awareness in THP handling code
config: x86_64-randconfig-001-20250812 (https://download.01.org/0day-ci/archive/20250812/202508122212.qjsfr5Wf-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250812/202508122212.qjsfr5Wf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508122212.qjsfr5Wf-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/migrate_device.c:154:19: warning: variable 'new_folio' set but not used [-Wunused-but-set-variable]
     154 |                                 struct folio *new_folio;
         |                                               ^
   1 warning generated.


vim +/new_folio +154 mm/migrate_device.c

    56	
    57	static int migrate_vma_collect_pmd(pmd_t *pmdp,
    58					   unsigned long start,
    59					   unsigned long end,
    60					   struct mm_walk *walk)
    61	{
    62		struct migrate_vma *migrate = walk->private;
    63		struct folio *fault_folio = migrate->fault_page ?
    64			page_folio(migrate->fault_page) : NULL;
    65		struct vm_area_struct *vma = walk->vma;
    66		struct mm_struct *mm = vma->vm_mm;
    67		unsigned long addr = start, unmapped = 0;
    68		spinlock_t *ptl;
    69		pte_t *ptep;
    70	
    71	again:
    72		if (pmd_none(*pmdp))
    73			return migrate_vma_collect_hole(start, end, -1, walk);
    74	
    75		if (pmd_trans_huge(*pmdp)) {
    76			struct folio *folio;
    77	
    78			ptl = pmd_lock(mm, pmdp);
    79			if (unlikely(!pmd_trans_huge(*pmdp))) {
    80				spin_unlock(ptl);
    81				goto again;
    82			}
    83	
    84			folio = pmd_folio(*pmdp);
    85			if (is_huge_zero_folio(folio)) {
    86				spin_unlock(ptl);
    87				split_huge_pmd(vma, pmdp, addr);
    88			} else {
    89				int ret;
    90	
    91				folio_get(folio);
    92				spin_unlock(ptl);
    93				/* FIXME: we don't expect THP for fault_folio */
    94				if (WARN_ON_ONCE(fault_folio == folio))
    95					return migrate_vma_collect_skip(start, end,
    96									walk);
    97				if (unlikely(!folio_trylock(folio)))
    98					return migrate_vma_collect_skip(start, end,
    99									walk);
   100				ret = split_folio(folio);
   101				if (fault_folio != folio)
   102					folio_unlock(folio);
   103				folio_put(folio);
   104				if (ret)
   105					return migrate_vma_collect_skip(start, end,
   106									walk);
   107			}
   108		}
   109	
   110		ptep = pte_offset_map_lock(mm, pmdp, addr, &ptl);
   111		if (!ptep)
   112			goto again;
   113		arch_enter_lazy_mmu_mode();
   114	
   115		for (; addr < end; addr += PAGE_SIZE, ptep++) {
   116			struct dev_pagemap *pgmap;
   117			unsigned long mpfn = 0, pfn;
   118			struct folio *folio;
   119			struct page *page;
   120			swp_entry_t entry;
   121			pte_t pte;
   122	
   123			pte = ptep_get(ptep);
   124	
   125			if (pte_none(pte)) {
   126				if (vma_is_anonymous(vma)) {
   127					mpfn = MIGRATE_PFN_MIGRATE;
   128					migrate->cpages++;
   129				}
   130				goto next;
   131			}
   132	
   133			if (!pte_present(pte)) {
   134				/*
   135				 * Only care about unaddressable device page special
   136				 * page table entry. Other special swap entries are not
   137				 * migratable, and we ignore regular swapped page.
   138				 */
   139				struct folio *folio;
   140	
   141				entry = pte_to_swp_entry(pte);
   142				if (!is_device_private_entry(entry))
   143					goto next;
   144	
   145				page = pfn_swap_entry_to_page(entry);
   146				pgmap = page_pgmap(page);
   147				if (!(migrate->flags &
   148					MIGRATE_VMA_SELECT_DEVICE_PRIVATE) ||
   149				    pgmap->owner != migrate->pgmap_owner)
   150					goto next;
   151	
   152				folio = page_folio(page);
   153				if (folio_test_large(folio)) {
 > 154					struct folio *new_folio;
   155					struct folio *new_fault_folio = NULL;
   156	
   157					/*
   158					 * The reason for finding pmd present with a
   159					 * device private pte and a large folio for the
   160					 * pte is partial unmaps. Split the folio now
   161					 * for the migration to be handled correctly
   162					 */
   163					pte_unmap_unlock(ptep, ptl);
   164	
   165					folio_get(folio);
   166					if (folio != fault_folio)
   167						folio_lock(folio);
   168					if (split_folio(folio)) {
   169						if (folio != fault_folio)
   170							folio_unlock(folio);
   171						ptep = pte_offset_map_lock(mm, pmdp, addr, &ptl);
   172						goto next;
   173					}
   174	
   175					new_folio = page_folio(page);
   176					if (fault_folio)
   177						new_fault_folio = page_folio(migrate->fault_page);
   178	
   179					/*
   180					 * Ensure the lock is held on the correct
   181					 * folio after the split
   182					 */
   183					if (!new_fault_folio) {
   184						folio_unlock(folio);
   185						folio_put(folio);
   186					} else if (folio != new_fault_folio) {
   187						folio_get(new_fault_folio);
   188						folio_lock(new_fault_folio);
   189						folio_unlock(folio);
   190						folio_put(folio);
   191					}
   192	
   193					addr = start;
   194					goto again;
   195				}
   196	
   197				mpfn = migrate_pfn(page_to_pfn(page)) |
   198						MIGRATE_PFN_MIGRATE;
   199				if (is_writable_device_private_entry(entry))
   200					mpfn |= MIGRATE_PFN_WRITE;
   201			} else {
   202				pfn = pte_pfn(pte);
   203				if (is_zero_pfn(pfn) &&
   204				    (migrate->flags & MIGRATE_VMA_SELECT_SYSTEM)) {
   205					mpfn = MIGRATE_PFN_MIGRATE;
   206					migrate->cpages++;
   207					goto next;
   208				}
   209				page = vm_normal_page(migrate->vma, addr, pte);
   210				if (page && !is_zone_device_page(page) &&
   211				    !(migrate->flags & MIGRATE_VMA_SELECT_SYSTEM)) {
   212					goto next;
   213				} else if (page && is_device_coherent_page(page)) {
   214					pgmap = page_pgmap(page);
   215	
   216					if (!(migrate->flags &
   217						MIGRATE_VMA_SELECT_DEVICE_COHERENT) ||
   218						pgmap->owner != migrate->pgmap_owner)
   219						goto next;
   220				}
   221				mpfn = migrate_pfn(pfn) | MIGRATE_PFN_MIGRATE;
   222				mpfn |= pte_write(pte) ? MIGRATE_PFN_WRITE : 0;
   223			}
   224	
   225			/* FIXME support THP */
   226			if (!page || !page->mapping || PageTransCompound(page)) {
   227				mpfn = 0;
   228				goto next;
   229			}
   230	
   231			/*
   232			 * By getting a reference on the folio we pin it and that blocks
   233			 * any kind of migration. Side effect is that it "freezes" the
   234			 * pte.
   235			 *
   236			 * We drop this reference after isolating the folio from the lru
   237			 * for non device folio (device folio are not on the lru and thus
   238			 * can't be dropped from it).
   239			 */
   240			folio = page_folio(page);
   241			folio_get(folio);
   242	
   243			/*
   244			 * We rely on folio_trylock() to avoid deadlock between
   245			 * concurrent migrations where each is waiting on the others
   246			 * folio lock. If we can't immediately lock the folio we fail this
   247			 * migration as it is only best effort anyway.
   248			 *
   249			 * If we can lock the folio it's safe to set up a migration entry
   250			 * now. In the common case where the folio is mapped once in a
   251			 * single process setting up the migration entry now is an
   252			 * optimisation to avoid walking the rmap later with
   253			 * try_to_migrate().
   254			 */
   255			if (fault_folio == folio || folio_trylock(folio)) {
   256				bool anon_exclusive;
   257				pte_t swp_pte;
   258	
   259				flush_cache_page(vma, addr, pte_pfn(pte));
   260				anon_exclusive = folio_test_anon(folio) &&
   261						  PageAnonExclusive(page);
   262				if (anon_exclusive) {
   263					pte = ptep_clear_flush(vma, addr, ptep);
   264	
   265					if (folio_try_share_anon_rmap_pte(folio, page)) {
   266						set_pte_at(mm, addr, ptep, pte);
   267						if (fault_folio != folio)
   268							folio_unlock(folio);
   269						folio_put(folio);
   270						mpfn = 0;
   271						goto next;
   272					}
   273				} else {
   274					pte = ptep_get_and_clear(mm, addr, ptep);
   275				}
   276	
   277				migrate->cpages++;
   278	
   279				/* Set the dirty flag on the folio now the pte is gone. */
   280				if (pte_dirty(pte))
   281					folio_mark_dirty(folio);
   282	
   283				/* Setup special migration page table entry */
   284				if (mpfn & MIGRATE_PFN_WRITE)
   285					entry = make_writable_migration_entry(
   286								page_to_pfn(page));
   287				else if (anon_exclusive)
   288					entry = make_readable_exclusive_migration_entry(
   289								page_to_pfn(page));
   290				else
   291					entry = make_readable_migration_entry(
   292								page_to_pfn(page));
   293				if (pte_present(pte)) {
   294					if (pte_young(pte))
   295						entry = make_migration_entry_young(entry);
   296					if (pte_dirty(pte))
   297						entry = make_migration_entry_dirty(entry);
   298				}
   299				swp_pte = swp_entry_to_pte(entry);
   300				if (pte_present(pte)) {
   301					if (pte_soft_dirty(pte))
   302						swp_pte = pte_swp_mksoft_dirty(swp_pte);
   303					if (pte_uffd_wp(pte))
   304						swp_pte = pte_swp_mkuffd_wp(swp_pte);
   305				} else {
   306					if (pte_swp_soft_dirty(pte))
   307						swp_pte = pte_swp_mksoft_dirty(swp_pte);
   308					if (pte_swp_uffd_wp(pte))
   309						swp_pte = pte_swp_mkuffd_wp(swp_pte);
   310				}
   311				set_pte_at(mm, addr, ptep, swp_pte);
   312	
   313				/*
   314				 * This is like regular unmap: we remove the rmap and
   315				 * drop the folio refcount. The folio won't be freed, as
   316				 * we took a reference just above.
   317				 */
   318				folio_remove_rmap_pte(folio, page, vma);
   319				folio_put(folio);
   320	
   321				if (pte_present(pte))
   322					unmapped++;
   323			} else {
   324				folio_put(folio);
   325				mpfn = 0;
   326			}
   327	
   328	next:
   329			migrate->dst[migrate->npages] = 0;
   330			migrate->src[migrate->npages++] = mpfn;
   331		}
   332	
   333		/* Only flush the TLB if we actually modified any entries */
   334		if (unmapped)
   335			flush_tlb_range(walk->vma, start, end);
   336	
   337		arch_leave_lazy_mmu_mode();
   338		pte_unmap_unlock(ptep - 1, ptl);
   339	
   340		return 0;
   341	}
   342	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
