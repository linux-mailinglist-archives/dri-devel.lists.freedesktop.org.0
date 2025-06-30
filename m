Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6C62AEDC2F
	for <lists+dri-devel@lfdr.de>; Mon, 30 Jun 2025 14:00:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D727010E216;
	Mon, 30 Jun 2025 12:00:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PbicQGGa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96E0710E216
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Jun 2025 12:00:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751284850; x=1782820850;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=3UP6/zsnjMtPAeLt6dXjNe/FngS9HP1K+9JJqvKaSkA=;
 b=PbicQGGazHUVi9URakUHlHhdDlMOZ+r11/iODsCBQaRZEP9IUgNp9NNg
 5Z+VBOguR3GvB9zHSgCYPNcLdcCaG2YUMPPYLSqmaB4bvOuqdIIKGPzNS
 Pbhv/P+q7guLpAku6ugqQRunXXukVkqsAn2bJUGiqVd4R8zcwJ+7j5UtF
 fruvI1Q8LWetnpn2Q0IpP5FIq1bKafW+fWJqCJTo71+XCT9CrRpwbx8a2
 4mI9L//WSsUJCaMmveHY46sUSagiyiwNWE4gLk/Aj3z9/7vPxpFjqjHC1
 Vx/YQaSgCHju/C/EUfCE04tuSX8ImS2+Oh21LV9Do+uF2USQaVtPInqcT w==;
X-CSE-ConnectionGUID: nq181W1lR76xa82gA/1Wow==
X-CSE-MsgGUID: Wjswl6p8QSG8OVbOg6IgEw==
X-IronPort-AV: E=McAfee;i="6800,10657,11479"; a="53600491"
X-IronPort-AV: E=Sophos;i="6.16,277,1744095600"; d="scan'208";a="53600491"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2025 05:00:50 -0700
X-CSE-ConnectionGUID: gxQU/eWrSY6kiHPjHzaXfQ==
X-CSE-MsgGUID: avHILRMkRTWpTbGBToP/UQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,277,1744095600"; d="scan'208";a="152827636"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
 by orviesa010.jf.intel.com with ESMTP; 30 Jun 2025 05:00:47 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1uWDBl-000YwY-29;
 Mon, 30 Jun 2025 12:00:45 +0000
Date: Mon, 30 Jun 2025 19:59:49 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, Johannes Weiner <hannes@cmpxchg.org>,
 Christian Koenig <christian.koenig@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, Dave Chinner <david@fromorbit.com>,
 Kairui Song <kasong@tencent.com>, Dave Airlie <airlied@redhat.com>
Subject: Re: [PATCH 13/17] ttm/pool: enable memcg tracking and shrinker.
Message-ID: <202506301921.i2QYb2bo-lkp@intel.com>
References: <20250630045005.1337339-14-airlied@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250630045005.1337339-14-airlied@gmail.com>
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

Hi Dave,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm/drm-next]
[cannot apply to akpm-mm/mm-everything linus/master v6.16-rc4 next-20250630]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Dave-Airlie/drm-ttm-use-gpu-mm-stats-to-track-gpu-memory-allocations-v2/20250630-134938
base:   git://anongit.freedesktop.org/drm/drm drm-next
patch link:    https://lore.kernel.org/r/20250630045005.1337339-14-airlied%40gmail.com
patch subject: [PATCH 13/17] ttm/pool: enable memcg tracking and shrinker.
config: riscv-randconfig-001-20250630 (https://download.01.org/0day-ci/archive/20250630/202506301921.i2QYb2bo-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250630/202506301921.i2QYb2bo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506301921.i2QYb2bo-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpu/drm/ttm/ttm_pool.c: In function 'ttm_pool_restore_commit':
>> drivers/gpu/drm/ttm/ttm_pool.c:675:5: error: 'struct page' has no member named 'memcg_data'
       p->memcg_data = 0;
        ^~
   drivers/gpu/drm/ttm/ttm_pool.c: In function 'ttm_pool_backup':
   drivers/gpu/drm/ttm/ttm_pool.c:1142:9: error: 'struct page' has no member named 'memcg_data'
        page->memcg_data = 0;
            ^~


vim +675 drivers/gpu/drm/ttm/ttm_pool.c

   627	
   628	/*
   629	 * When restoring, restore backed-up content to the newly allocated page and
   630	 * if successful, populate the page-table and dma-address arrays.
   631	 */
   632	static int ttm_pool_restore_commit(struct ttm_pool_tt_restore *restore,
   633					   struct file *backup,
   634					   const struct ttm_operation_ctx *ctx,
   635					   struct ttm_pool_alloc_state *alloc)
   636	
   637	{
   638		pgoff_t i, nr = 1UL << restore->order;
   639		struct page **first_page = alloc->pages;
   640		struct page *p;
   641		int ret = 0;
   642	
   643		for (i = restore->restored_pages; i < nr; ++i) {
   644			p = first_page[i];
   645			if (ttm_backup_page_ptr_is_handle(p)) {
   646				unsigned long handle = ttm_backup_page_ptr_to_handle(p);
   647	
   648				if (IS_ENABLED(CONFIG_FAULT_INJECTION) && ctx->interruptible &&
   649				    should_fail(&backup_fault_inject, 1)) {
   650					ret = -EINTR;
   651					break;
   652				}
   653	
   654				if (handle == 0) {
   655					restore->restored_pages++;
   656					continue;
   657				}
   658	
   659				ret = ttm_backup_copy_page(backup, restore->alloced_page + i,
   660							   handle, ctx->interruptible);
   661				if (ret)
   662					break;
   663	
   664				ttm_backup_drop(backup, handle);
   665			} else if (p) {
   666				/*
   667				 * We could probably avoid splitting the old page
   668				 * using clever logic, but ATM we don't care, as
   669				 * we prioritize releasing memory ASAP. Note that
   670				 * here, the old retained page is always write-back
   671				 * cached.
   672				 */
   673				ttm_pool_split_for_swap(restore->pool, p);
   674				copy_highpage(restore->alloced_page + i, p);
 > 675				p->memcg_data = 0;
   676				__free_pages(p, 0);
   677			}
   678	
   679			restore->restored_pages++;
   680			first_page[i] = ttm_backup_handle_to_page_ptr(0);
   681		}
   682	
   683		if (ret) {
   684			if (!restore->restored_pages) {
   685				dma_addr_t *dma_addr = alloc->dma_addr ? &restore->first_dma : NULL;
   686	
   687				ttm_pool_unmap_and_free(restore->pool, restore->alloced_page,
   688							dma_addr, restore->page_caching);
   689				restore->restored_pages = nr;
   690			}
   691			return ret;
   692		}
   693	
   694		ttm_pool_allocated_page_commit(restore->alloced_page, restore->first_dma,
   695					       alloc, nr);
   696		if (restore->page_caching == alloc->tt_caching || PageHighMem(restore->alloced_page))
   697			alloc->caching_divide = alloc->pages;
   698		restore->snapshot_alloc = *alloc;
   699		restore->alloced_pages += nr;
   700	
   701		return 0;
   702	}
   703	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
