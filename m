Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 079CEAD9499
	for <lists+dri-devel@lfdr.de>; Fri, 13 Jun 2025 20:40:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A06610E991;
	Fri, 13 Jun 2025 18:40:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UbGbWDPJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF12610EA33;
 Fri, 13 Jun 2025 18:40:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749840009; x=1781376009;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=qUp7OWoLLHjLEb+MSAH2UyjVIUcUUSZsadGYuLFKVdE=;
 b=UbGbWDPJ2DRCWebK/bU/iIZN17FTnTyepWUlP/u39EiLnIGyo14dYJ/R
 W4ci4zblZ/d1iSi9eAmmizl0o7CY38AZhI9fpiJhX2upU3SbOxp57HTIm
 MDxowb11pwsZ6/HQxlB+zRhKw7wGHP+nhdpIZ5OnBnxDCAB60hCluJZlN
 QLlVJeKbeOIE0h2fPtVWD0GUJIn/NyDXHAiozWM4dQXVKL8HVdfCS9MHk
 ZA1wW/Und+A1vIkjuqWe4tS16leS360d9IEJFHRXe33g5j/fAM6rzWyOh
 R5zl1E8jHJgs4f86YZYIxkj9ok+Bd9al3PSGZXSTSunCJE1h+2QWxTUyM g==;
X-CSE-ConnectionGUID: 3whocI8oS1yURtROXLIXdQ==
X-CSE-MsgGUID: Vzt50LffSSOaGC8lbRMcnA==
X-IronPort-AV: E=McAfee;i="6800,10657,11463"; a="69642111"
X-IronPort-AV: E=Sophos;i="6.16,234,1744095600"; d="scan'208";a="69642111"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2025 11:40:09 -0700
X-CSE-ConnectionGUID: ZJCfA9P+TLqsa4q7weCvbg==
X-CSE-MsgGUID: UR7j5CDPQIGe7bZestR+Qw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,234,1744095600"; d="scan'208";a="153182580"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
 by orviesa005.jf.intel.com with ESMTP; 13 Jun 2025 11:40:06 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1uQ9Jr-000CuA-19;
 Fri, 13 Jun 2025 18:40:03 +0000
Date: Sat, 14 Jun 2025 02:39:38 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 intel-xe@lists.freedesktop.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 dri-devel@lists.freedesktop.org, airlied@gmail.com,
 Matthew Brost <matthew.brost@intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Subject: Re: [PATCH 3/3] drm/ttm, drm_xe, Implement ttm_lru_walk_for_evict()
 using the guarded LRU iteration
Message-ID: <202506140238.KCnSVmrU-lkp@intel.com>
References: <20250613151824.178650-4-thomas.hellstrom@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250613151824.178650-4-thomas.hellstrom@linux.intel.com>
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

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-xe/drm-xe-next]
[also build test WARNING on linus/master v6.16-rc1 next-20250613]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Thomas-Hellstr-m/drm-ttm-Use-a-struct-for-the-common-part-of-struct-ttm_lru_walk-and-struct-ttm_bo_lru_cursor/20250613-232106
base:   https://gitlab.freedesktop.org/drm/xe/kernel.git drm-xe-next
patch link:    https://lore.kernel.org/r/20250613151824.178650-4-thomas.hellstrom%40linux.intel.com
patch subject: [PATCH 3/3] drm/ttm, drm_xe, Implement ttm_lru_walk_for_evict() using the guarded LRU iteration
config: i386-buildonly-randconfig-005-20250613 (https://download.01.org/0day-ci/archive/20250614/202506140238.KCnSVmrU-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250614/202506140238.KCnSVmrU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506140238.KCnSVmrU-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/ttm/ttm_bo_util.c:965:7: warning: variable 'ret' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
     965 |                 if (!bo_locked)
         |                     ^~~~~~~~~~
   drivers/gpu/drm/ttm/ttm_bo_util.c:975:8: note: uninitialized use occurs here
     975 |                 if (!ret && bo->resource && bo->resource->mem_type == mem_type)
         |                      ^~~
   drivers/gpu/drm/ttm/ttm_bo_util.c:965:3: note: remove the 'if' if its condition is always true
     965 |                 if (!bo_locked)
         |                 ^~~~~~~~~~~~~~~
     966 |                         ret = ttm_lru_walk_ticketlock(arg, bo, &curs->needs_unlock);
   drivers/gpu/drm/ttm/ttm_bo_util.c:939:20: note: initialize the variable 'ret' to silence this warning
     939 |                 int mem_type, ret;
         |                                  ^
         |                                   = 0
   1 warning generated.


vim +965 drivers/gpu/drm/ttm/ttm_bo_util.c

   926	
   927	static struct ttm_buffer_object *
   928	__ttm_bo_lru_cursor_next(struct ttm_bo_lru_cursor *curs, bool first)
   929	{
   930		spinlock_t *lru_lock = &curs->res_curs.man->bdev->lru_lock;
   931		struct ttm_resource *res = NULL;
   932		struct ttm_buffer_object *bo;
   933		struct ttm_lru_walk_arg *arg = curs->arg;
   934	
   935		ttm_bo_lru_cursor_cleanup_bo(curs);
   936	
   937		spin_lock(lru_lock);
   938		for (;;) {
   939			int mem_type, ret;
   940			bool bo_locked = false;
   941	
   942			if (first) {
   943				res = ttm_resource_manager_first(&curs->res_curs);
   944				first = false;
   945			} else {
   946				res = ttm_resource_manager_next(&curs->res_curs);
   947			}
   948			if (!res)
   949				break;
   950	
   951			bo = res->bo;
   952			if (ttm_lru_walk_trylock(arg, bo, &curs->needs_unlock))
   953				bo_locked = true;
   954			else if (!arg->ticket || arg->ctx->no_wait_gpu || arg->trylock_only)
   955				continue;
   956	
   957			if (!ttm_bo_get_unless_zero(bo)) {
   958				if (curs->needs_unlock)
   959					dma_resv_unlock(bo->base.resv);
   960				continue;
   961			}
   962	
   963			mem_type = res->mem_type;
   964			spin_unlock(lru_lock);
 > 965			if (!bo_locked)
   966				ret = ttm_lru_walk_ticketlock(arg, bo, &curs->needs_unlock);
   967			/*
   968			 * Note that in between the release of the lru lock and the
   969			 * ticketlock, the bo may have switched resource,
   970			 * and also memory type, since the resource may have been
   971			 * freed and allocated again with a different memory type.
   972			 * In that case, just skip it.
   973			 */
   974			curs->bo = bo;
   975			if (!ret && bo->resource && bo->resource->mem_type == mem_type)
   976				return bo;
   977	
   978			ttm_bo_lru_cursor_cleanup_bo(curs);
   979			if (ret)
   980				return ERR_PTR(ret);
   981	
   982			spin_lock(lru_lock);
   983		}
   984	
   985		spin_unlock(lru_lock);
   986		return res ? bo : NULL;
   987	}
   988	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
