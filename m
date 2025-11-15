Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B87A3C5FDEE
	for <lists+dri-devel@lfdr.de>; Sat, 15 Nov 2025 03:15:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CF1C10EB8B;
	Sat, 15 Nov 2025 02:15:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="V1WiP/gW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CFA610EB76
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Nov 2025 02:15:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763172914; x=1794708914;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=fGFz8KquUr9jWQ4PCrcIGmqO/oRWoxlOLT9O5ngcD/A=;
 b=V1WiP/gWYv/PN27VY024oYzdkFgaXEIvde9YRGXN3/Og7OVk957oUjZX
 iaGAxjP6k1izYb1sby3TWN3jLeHiLqBloS1MOyO1BaQVqrkXdox8J9s/0
 ToT0+PH63gnIFS1ivJR+F70936/HiXY1wxKtiaQwVgSjosMQxXlQqb8KB
 zIrmJQlctuO7wlUQMVk+vBa+TL2XbcefRXZv4Q6zWczRBZ2jMFmSv3sok
 b3hNfxS7TVTe6iaj5xZPsFfU/IqduBxQDmJWHceDYNq6y14rGukpDaVcC
 4eUqWyiKbhzeE8xZuXmQQFYnKYnmrS6FBxtAMLKPlBIkVsKJgT0oFfu7Z w==;
X-CSE-ConnectionGUID: jJdOgetGSjGDvYQoKaC9Dw==
X-CSE-MsgGUID: H9nAn8xzRLi8bFad3nw2uQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11613"; a="65301097"
X-IronPort-AV: E=Sophos;i="6.19,306,1754982000"; d="scan'208";a="65301097"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2025 18:15:14 -0800
X-CSE-ConnectionGUID: rFi/DoFJRDmKn3VYj9QzCg==
X-CSE-MsgGUID: jDK/OEUFRFy+dZH4vzUDtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,306,1754982000"; d="scan'208";a="189574133"
Received: from lkp-server01.sh.intel.com (HELO 7b01c990427b) ([10.239.97.150])
 by fmviesa007.fm.intel.com with ESMTP; 14 Nov 2025 18:15:07 -0800
Received: from kbuild by 7b01c990427b with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1vK5oe-0007eJ-2j;
 Sat, 15 Nov 2025 02:15:04 +0000
Date: Sat, 15 Nov 2025 10:15:02 +0800
From: kernel test robot <lkp@intel.com>
To: Balbir Singh <balbirs@nvidia.com>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, dri-devel@lists.freedesktop.org
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
Subject: Re: [PATCH] mm/huge_memory.c: introduce folio_split_unmapped
Message-ID: <202511151007.F1gixfc8-lkp@intel.com>
References: <20251114012228.2634882-1-balbirs@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251114012228.2634882-1-balbirs@nvidia.com>
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

url:    https://github.com/intel-lab-lkp/linux/commits/Balbir-Singh/mm-huge_memory-c-introduce-folio_split_unmapped/20251114-093541
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20251114012228.2634882-1-balbirs%40nvidia.com
patch subject: [PATCH] mm/huge_memory.c: introduce folio_split_unmapped
config: arm64-randconfig-002-20251115 (https://download.01.org/0day-ci/archive/20251115/202511151007.F1gixfc8-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251115/202511151007.F1gixfc8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511151007.F1gixfc8-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/huge_memory.c:3751:6: warning: variable 'nr_shmem_dropped' set but not used [-Wunused-but-set-variable]
    3751 |         int nr_shmem_dropped = 0;
         |             ^
   1 warning generated.


vim +/nr_shmem_dropped +3751 mm/huge_memory.c

  3741	
  3742	static int __folio_freeze_and_split_unmapped(struct folio *folio, unsigned int new_order,
  3743						     struct page *split_at, struct xa_state *xas,
  3744						     struct address_space *mapping, bool do_lru,
  3745						     struct list_head *list, enum split_type split_type,
  3746						     pgoff_t end, int extra_pins)
  3747	{
  3748		struct folio *end_folio = folio_next(folio);
  3749		struct folio *new_folio, *next;
  3750		int old_order = folio_order(folio);
> 3751		int nr_shmem_dropped = 0;
  3752		int ret = 0;
  3753		struct deferred_split *ds_queue;
  3754	
  3755		/* Prevent deferred_split_scan() touching ->_refcount */
  3756		ds_queue = folio_split_queue_lock(folio);
  3757		if (folio_ref_freeze(folio, 1 + extra_pins)) {
  3758			struct swap_cluster_info *ci = NULL;
  3759			struct lruvec *lruvec;
  3760			int expected_refs;
  3761	
  3762			if (old_order > 1) {
  3763				if (!list_empty(&folio->_deferred_list)) {
  3764					ds_queue->split_queue_len--;
  3765					/*
  3766					 * Reinitialize page_deferred_list after removing the
  3767					 * page from the split_queue, otherwise a subsequent
  3768					 * split will see list corruption when checking the
  3769					 * page_deferred_list.
  3770					 */
  3771					list_del_init(&folio->_deferred_list);
  3772				}
  3773				if (folio_test_partially_mapped(folio)) {
  3774					folio_clear_partially_mapped(folio);
  3775					mod_mthp_stat(old_order,
  3776						MTHP_STAT_NR_ANON_PARTIALLY_MAPPED, -1);
  3777				}
  3778			}
  3779			split_queue_unlock(ds_queue);
  3780			if (mapping) {
  3781				int nr = folio_nr_pages(folio);
  3782	
  3783				if (folio_test_pmd_mappable(folio) &&
  3784				    new_order < HPAGE_PMD_ORDER) {
  3785					if (folio_test_swapbacked(folio)) {
  3786						__lruvec_stat_mod_folio(folio,
  3787								NR_SHMEM_THPS, -nr);
  3788					} else {
  3789						__lruvec_stat_mod_folio(folio,
  3790								NR_FILE_THPS, -nr);
  3791						filemap_nr_thps_dec(mapping);
  3792					}
  3793				}
  3794			}
  3795	
  3796			if (folio_test_swapcache(folio)) {
  3797				if (mapping) {
  3798					VM_WARN_ON_ONCE_FOLIO(mapping, folio);
  3799					return -EINVAL;
  3800				}
  3801	
  3802				ci = swap_cluster_get_and_lock(folio);
  3803			}
  3804	
  3805			/* lock lru list/PageCompound, ref frozen by page_ref_freeze */
  3806			if (do_lru)
  3807				lruvec = folio_lruvec_lock(folio);
  3808	
  3809			ret = __split_unmapped_folio(folio, new_order, split_at, xas,
  3810						     mapping, split_type);
  3811	
  3812			/*
  3813			 * Unfreeze after-split folios and put them back to the right
  3814			 * list. @folio should be kept frozon until page cache
  3815			 * entries are updated with all the other after-split folios
  3816			 * to prevent others seeing stale page cache entries.
  3817			 * As a result, new_folio starts from the next folio of
  3818			 * @folio.
  3819			 */
  3820			for (new_folio = folio_next(folio); new_folio != end_folio;
  3821			     new_folio = next) {
  3822				unsigned long nr_pages = folio_nr_pages(new_folio);
  3823	
  3824				next = folio_next(new_folio);
  3825	
  3826				zone_device_private_split_cb(folio, new_folio);
  3827	
  3828				expected_refs = folio_expected_ref_count(new_folio) + 1;
  3829				folio_ref_unfreeze(new_folio, expected_refs);
  3830	
  3831				if (do_lru)
  3832					lru_add_split_folio(folio, new_folio, lruvec, list);
  3833	
  3834				/*
  3835				 * Anonymous folio with swap cache.
  3836				 * NOTE: shmem in swap cache is not supported yet.
  3837				 */
  3838				if (ci) {
  3839					__swap_cache_replace_folio(ci, folio, new_folio);
  3840					continue;
  3841				}
  3842	
  3843				/* Anonymous folio without swap cache */
  3844				if (!mapping)
  3845					continue;
  3846	
  3847				/* Add the new folio to the page cache. */
  3848				if (new_folio->index < end) {
  3849					__xa_store(&mapping->i_pages, new_folio->index,
  3850						   new_folio, 0);
  3851					continue;
  3852				}
  3853	
  3854				/* Drop folio beyond EOF: ->index >= end */
  3855				if (shmem_mapping(mapping))
  3856					nr_shmem_dropped += nr_pages;
  3857				else if (folio_test_clear_dirty(new_folio))
  3858					folio_account_cleaned(
  3859						new_folio, inode_to_wb(mapping->host));
  3860				__filemap_remove_folio(new_folio, NULL);
  3861				folio_put_refs(new_folio, nr_pages);
  3862			}
  3863	
  3864			zone_device_private_split_cb(folio, NULL);
  3865			/*
  3866			 * Unfreeze @folio only after all page cache entries, which
  3867			 * used to point to it, have been updated with new folios.
  3868			 * Otherwise, a parallel folio_try_get() can grab @folio
  3869			 * and its caller can see stale page cache entries.
  3870			 */
  3871			expected_refs = folio_expected_ref_count(folio) + 1;
  3872			folio_ref_unfreeze(folio, expected_refs);
  3873	
  3874			if (do_lru)
  3875				unlock_page_lruvec(lruvec);
  3876	
  3877			if (ci)
  3878				swap_cluster_unlock(ci);
  3879		} else {
  3880			split_queue_unlock(ds_queue);
  3881			return -EAGAIN;
  3882		}
  3883	
  3884		return ret;
  3885	}
  3886	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
