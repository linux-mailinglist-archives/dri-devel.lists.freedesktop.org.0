Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AE90955014
	for <lists+dri-devel@lfdr.de>; Fri, 16 Aug 2024 19:36:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0421710E819;
	Fri, 16 Aug 2024 17:36:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kGeHpXfO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F07F310E812;
 Fri, 16 Aug 2024 17:36:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723829769; x=1755365769;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=SmUXUkS71xDVFXd29IUTMz4hy+N83HT6xLCcFCwcLEo=;
 b=kGeHpXfO/SjZEfojc2aDTAqVUnmj2/jz/iQjcE1t4up7zaS2SHRdQyAB
 d1+9TpnmKFACyX9uKuR85/AlqCE99v0hahxokNg4MSN/h9taNT/HFm7ha
 3fFVrq36IiMhwaWRv0YCRJ+MdFgiDBircvf6yLA1HhK4VH0fcUMBayTdw
 iBgQ2tyQLs/LivNs7SpmwrXrMCI+W3hfFkNk9ig8eoqkrIuf/Aqytm2+4
 42eV5US59ccrRGbGCNM2ulrJHuoxSeVAu8y2Wd1jzUaqEKAxD4/BewUgG
 lqOKpaO1PhtTNcNC1hwHKVsSnN7/SxkoMLLsVubXepQ++Hl9DAPyD6rvT Q==;
X-CSE-ConnectionGUID: ozzEeyFKRWqreR9PqwKwXQ==
X-CSE-MsgGUID: VUZhMC/UTw+CDjmSp9bzSQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11166"; a="22276468"
X-IronPort-AV: E=Sophos;i="6.10,152,1719903600"; d="scan'208";a="22276468"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Aug 2024 10:36:09 -0700
X-CSE-ConnectionGUID: CLGwQ1QjQDaVyJMpN7FGDA==
X-CSE-MsgGUID: x2Eh+iTlRbmeGJNtaahR3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,152,1719903600"; d="scan'208";a="82941068"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
 by fmviesa002.fm.intel.com with ESMTP; 16 Aug 2024 10:36:05 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1sf0rs-0006gY-0L;
 Fri, 16 Aug 2024 17:36:04 +0000
Date: Sat, 17 Aug 2024 01:35:06 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 intel-xe@lists.freedesktop.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>,
 Matthew Brost <matthew.brost@intel.com>, dri-devel@lists.freedesktop.org,
 Paulo Zanoni <paulo.r.zanoni@intel.com>
Subject: Re: [PATCH v8 3/6] drm/ttm: Use fault-injection to test error paths
Message-ID: <202408170144.N7YoWTCX-lkp@intel.com>
References: <20240816133717.3102-4-thomas.hellstrom@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240816133717.3102-4-thomas.hellstrom@linux.intel.com>
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

Hi Thomas,

kernel test robot noticed the following build errors:

[auto build test ERROR on next-20240816]
[also build test ERROR on v6.11-rc3]
[cannot apply to drm-xe/drm-xe-next linus/master v6.11-rc3 v6.11-rc2 v6.11-rc1]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Thomas-Hellstr-m/drm-ttm-Add-a-virtual-base-class-for-graphics-memory-backup/20240816-213947
base:   next-20240816
patch link:    https://lore.kernel.org/r/20240816133717.3102-4-thomas.hellstrom%40linux.intel.com
patch subject: [PATCH v8 3/6] drm/ttm: Use fault-injection to test error paths
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20240817/202408170144.N7YoWTCX-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240817/202408170144.N7YoWTCX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408170144.N7YoWTCX-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/ttm/ttm_pool.c:456:8: error: call to undeclared function 'should_fail'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     456 |                             should_fail(&backup_fault_inject, 1)) {
         |                             ^
>> drivers/gpu/drm/ttm/ttm_pool.c:456:21: error: use of undeclared identifier 'backup_fault_inject'
     456 |                             should_fail(&backup_fault_inject, 1)) {
         |                                          ^
   drivers/gpu/drm/ttm/ttm_pool.c:908:44: error: call to undeclared function 'should_fail'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     908 |         if (IS_ENABLED(CONFIG_FAULT_INJECTION) && should_fail(&backup_fault_inject, 1))
         |                                                   ^
   drivers/gpu/drm/ttm/ttm_pool.c:908:57: error: use of undeclared identifier 'backup_fault_inject'
     908 |         if (IS_ENABLED(CONFIG_FAULT_INJECTION) && should_fail(&backup_fault_inject, 1))
         |                                                                ^
   4 errors generated.


vim +/should_fail +456 drivers/gpu/drm/ttm/ttm_pool.c

   434	
   435	static int ttm_pool_restore_tt(struct ttm_pool_tt_restore *restore,
   436				       struct ttm_backup *backup,
   437				       struct ttm_operation_ctx *ctx)
   438	{
   439		static unsigned long __maybe_unused swappedin;
   440		unsigned int i, nr = 1 << restore->order;
   441		int ret = 0;
   442	
   443		if (!ttm_pool_restore_valid(restore))
   444			return 0;
   445	
   446		for (i = restore->restored_pages; i < nr; ++i) {
   447			struct page *p = restore->old_pages[i];
   448	
   449			if (ttm_backup_page_ptr_is_handle(p)) {
   450				unsigned long handle = ttm_backup_page_ptr_to_handle(p);
   451	
   452				if (handle == 0)
   453					continue;
   454	
   455				if (IS_ENABLED(CONFIG_FAULT_INJECTION) && ctx->interruptible &&
 > 456				    should_fail(&backup_fault_inject, 1)) {
   457					ret = -EINTR;
   458					break;
   459				}
   460	
   461				ret = backup->ops->copy_backed_up_page
   462					(backup, restore->first_page[i],
   463					 handle, ctx->interruptible);
   464				if (ret)
   465					break;
   466	
   467				backup->ops->drop(backup, handle);
   468			} else if (p) {
   469				/*
   470				 * We could probably avoid splitting the old page
   471				 * using clever logic, but ATM we don't care.
   472				 */
   473				ttm_pool_split_for_swap(restore->pool, p);
   474				copy_highpage(restore->first_page[i], p);
   475				__free_pages(p, 0);
   476			}
   477	
   478			restore->restored_pages++;
   479			restore->old_pages[i] = NULL;
   480			cond_resched();
   481		}
   482	
   483		return ret;
   484	}
   485	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
