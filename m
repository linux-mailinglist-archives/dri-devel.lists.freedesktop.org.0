Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BBB796AF5F9
	for <lists+dri-devel@lfdr.de>; Tue,  7 Mar 2023 20:43:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CE2610E515;
	Tue,  7 Mar 2023 19:43:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D06D10E515;
 Tue,  7 Mar 2023 19:43:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678218200; x=1709754200;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=VUM3crliIX0uYvF9HWA/HxYpm4UHhPf4pcjmsOAYsyA=;
 b=ajebq3ggaRvbjRJcNkjL5Fth65KtM3yRbT/1CJ8tLwOCkLw/hWGV8QjU
 vASJk3ePhzxYoFmygU0ovN4qV32uxl5Xj1lx2U6CharDbdIdXb5Fhzce6
 F1kje6MNdUm7jFfnxhs/GDTNgwkwz/wuIwazER5EtvRixF4esJcDLoLSs
 7Xmbpdk0cNZ9i+/qq3hb/+jFF2S1CjHcT6Olmm6k1mO6m7nVMziQwQ7kS
 YmGjeGtuHQToQiliZz6d64OP8MKvw93J1eNWAXLUKQFaLJt2fsqtLB5dO
 n9nfnPXc/mzgSySok/XFeXBH1P4YbNe8zoIye5N1NqyDs6PjKOuH88GTb g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="334668320"
X-IronPort-AV: E=Sophos;i="5.98,241,1673942400"; d="scan'208";a="334668320"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2023 11:43:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="654089691"
X-IronPort-AV: E=Sophos;i="5.98,241,1673942400"; d="scan'208";a="654089691"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
 by orsmga006.jf.intel.com with ESMTP; 07 Mar 2023 11:43:17 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1pZdDQ-0001YP-29;
 Tue, 07 Mar 2023 19:43:16 +0000
Date: Wed, 8 Mar 2023 03:42:27 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 dri-devel@lists.freedesktop.org
Subject: Re: [Intel-gfx] [PATCH v2 6/7] drm/ttm: Reduce the number of used
 allocation orders for TTM pages
Message-ID: <202303080352.azyeWwwt-lkp@intel.com>
References: <20230307144621.10748-7-thomas.hellstrom@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230307144621.10748-7-thomas.hellstrom@linux.intel.com>
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
Cc: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, Matthew Auld <matthew.auld@intel.com>,
 Christian Koenig <christian.koenig@amd.com>, oe-kbuild-all@lists.linux.dev
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Thomas,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on drm-misc/drm-misc-next]
[also build test ERROR on drm-intel/for-linux-next]
[cannot apply to drm-tip/drm-tip]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Thomas-Hellstr-m/drm-ttm-Fix-a-NULL-pointer-dereference/20230307-224931
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20230307144621.10748-7-thomas.hellstrom%40linux.intel.com
patch subject: [Intel-gfx] [PATCH v2 6/7] drm/ttm: Reduce the number of used allocation orders for TTM pages
config: powerpc-randconfig-r006-20230306 (https://download.01.org/0day-ci/archive/20230308/202303080352.azyeWwwt-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/0eee47dba298051fc49965d56cb17dd113ff0236
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Thomas-Hellstr-m/drm-ttm-Fix-a-NULL-pointer-dereference/20230307-224931
        git checkout 0eee47dba298051fc49965d56cb17dd113ff0236
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=powerpc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=powerpc SHELL=/bin/bash drivers/gpu/drm/ttm/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303080352.azyeWwwt-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In function 'ttm_pool_type_init',
       inlined from 'ttm_pool_init' at drivers/gpu/drm/ttm/ttm_pool.c:557:5:
>> drivers/gpu/drm/ttm/ttm_pool.c:264:18: warning: iteration 9 invokes undefined behavior [-Waggressive-loop-optimizations]
     264 |         pt->pool = pool;
         |         ~~~~~~~~~^~~~~~
   drivers/gpu/drm/ttm/ttm_pool.c: In function 'ttm_pool_init':
   drivers/gpu/drm/ttm/ttm_pool.c:556:39: note: within this loop
     556 |                         for (j = 0; j < TTM_DIM_ORDER; ++j)
         |                                       ^
   In file included from <command-line>:
   drivers/gpu/drm/ttm/ttm_pool.c: In function 'ttm_pool_mgr_init':
>> include/linux/compiler_types.h:358:45: error: call to '__compiletime_assert_283' declared with attribute error: BUILD_BUG_ON failed: TTM_DIM_ORDER > MAX_ORDER
     358 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                                             ^
   include/linux/compiler_types.h:339:25: note: in definition of macro '__compiletime_assert'
     339 |                         prefix ## suffix();                             \
         |                         ^~~~~~
   include/linux/compiler_types.h:358:9: note: in expansion of macro '_compiletime_assert'
     358 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:50:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^~~~~~~~~~~~~~~~
   drivers/gpu/drm/ttm/ttm_pool.c:744:9: note: in expansion of macro 'BUILD_BUG_ON'
     744 |         BUILD_BUG_ON(TTM_DIM_ORDER > MAX_ORDER);
         |         ^~~~~~~~~~~~


vim +/__compiletime_assert_283 +358 include/linux/compiler_types.h

eb5c2d4b45e3d2 Will Deacon 2020-07-21  344  
eb5c2d4b45e3d2 Will Deacon 2020-07-21  345  #define _compiletime_assert(condition, msg, prefix, suffix) \
eb5c2d4b45e3d2 Will Deacon 2020-07-21  346  	__compiletime_assert(condition, msg, prefix, suffix)
eb5c2d4b45e3d2 Will Deacon 2020-07-21  347  
eb5c2d4b45e3d2 Will Deacon 2020-07-21  348  /**
eb5c2d4b45e3d2 Will Deacon 2020-07-21  349   * compiletime_assert - break build and emit msg if condition is false
eb5c2d4b45e3d2 Will Deacon 2020-07-21  350   * @condition: a compile-time constant condition to check
eb5c2d4b45e3d2 Will Deacon 2020-07-21  351   * @msg:       a message to emit if condition is false
eb5c2d4b45e3d2 Will Deacon 2020-07-21  352   *
eb5c2d4b45e3d2 Will Deacon 2020-07-21  353   * In tradition of POSIX assert, this macro will break the build if the
eb5c2d4b45e3d2 Will Deacon 2020-07-21  354   * supplied condition is *false*, emitting the supplied error message if the
eb5c2d4b45e3d2 Will Deacon 2020-07-21  355   * compiler has support to do so.
eb5c2d4b45e3d2 Will Deacon 2020-07-21  356   */
eb5c2d4b45e3d2 Will Deacon 2020-07-21  357  #define compiletime_assert(condition, msg) \
eb5c2d4b45e3d2 Will Deacon 2020-07-21 @358  	_compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
eb5c2d4b45e3d2 Will Deacon 2020-07-21  359  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
