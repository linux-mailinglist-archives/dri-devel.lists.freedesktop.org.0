Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 95A5F475FD1
	for <lists+dri-devel@lfdr.de>; Wed, 15 Dec 2021 18:50:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B99F010F5CF;
	Wed, 15 Dec 2021 17:50:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74C1510F5CB;
 Wed, 15 Dec 2021 17:50:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1639590613; x=1671126613;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=UXVAi9BXaydSML6j5ZDaOSyhxIpn0/1a6PgbOjLKiYU=;
 b=FWOsARvPDh1f5B8Y2HdIBHebvNaYeJfN3CbdKtw8CSUjH15ASg0oOdYB
 sA+goKjDqf970gVyJKRgGpo+yp6Mz9fqVOhbsdtB5nJSyJwWDOb0tljNC
 kEFoFTg6TZqDkEddHQZzsPU+gxfXFCBrWWdiUu03lTx5/VOmCSR0VWgK9
 rPFm0yfT6vIlm9PfZwuqyucbXJR+uuUl3Pi+xWlgI3uWjwM2KzTJ0FTXd
 lLsk1U4R4mS7PKJdMToDX0NJnDe/oZXgYmFV/frQLz6GEjSfH1swuJbwL
 MHe0YojomsULAi1peBpfyMaYg9UQ8o7fAvPfuz5vbUWSw9weBxhhUgpQa Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10199"; a="325572512"
X-IronPort-AV: E=Sophos;i="5.88,207,1635231600"; d="scan'208";a="325572512"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2021 09:50:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,207,1635231600"; d="scan'208";a="614801880"
Received: from lkp-server02.sh.intel.com (HELO 9f38c0981d9f) ([10.239.97.151])
 by orsmga004.jf.intel.com with ESMTP; 15 Dec 2021 09:50:10 -0800
Received: from kbuild by 9f38c0981d9f with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1mxYPq-000291-90; Wed, 15 Dec 2021 17:50:10 +0000
Date: Thu, 16 Dec 2021 01:49:27 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 1/7] drm/i915: Avoid using the i915_fence_array when
 collecting dependencies
Message-ID: <202112160101.AqbkqxoO-lkp@intel.com>
References: <20211215103611.777665-2-thomas.hellstrom@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211215103611.777665-2-thomas.hellstrom@linux.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
 llvm@lists.linux.dev, kbuild-all@lists.01.org, matthew.auld@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi "Thomas,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on drm-tip/drm-tip]
[also build test WARNING on drm-exynos/exynos-drm-next drm/drm-next next-20211214]
[cannot apply to drm-intel/for-linux-next tegra-drm/drm/tegra/for-next airlied/drm-next v5.16-rc5]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Thomas-Hellstr-m/drm-i915-Asynchronous-vma-unbinding/20211215-183859
base:   git://anongit.freedesktop.org/drm/drm-tip drm-tip
config: x86_64-randconfig-a013-20211214 (https://download.01.org/0day-ci/archive/20211216/202112160101.AqbkqxoO-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project dd245bab9fbb364faa1581e4f92ba3119a872fba)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/0f61eb08a6b9d7fa9f19eaa071ad5591de123633
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Thomas-Hellstr-m/drm-i915-Asynchronous-vma-unbinding/20211215-183859
        git checkout 0f61eb08a6b9d7fa9f19eaa071ad5591de123633
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/gpu/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c:634:5: warning: no previous prototype for function 'prev_deps' [-Wmissing-prototypes]
   int prev_deps(struct ttm_buffer_object *bo, struct ttm_operation_ctx *ctx,
       ^
   drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c:634:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int prev_deps(struct ttm_buffer_object *bo, struct ttm_operation_ctx *ctx,
   ^
   static 
   1 warning generated.


vim +/prev_deps +634 drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c

   633	
 > 634	int prev_deps(struct ttm_buffer_object *bo, struct ttm_operation_ctx *ctx,
   635		      struct i915_deps *deps)
   636	{
   637		int ret;
   638	
   639		ret = i915_deps_add_dependency(deps, bo->moving, ctx);
   640		if (!ret)
   641			/*
   642			 * TODO: Only await excl fence here, and shared fences before
   643			 * signaling the migration fence.
   644			 */
   645			ret = i915_deps_add_resv(deps, bo->base.resv, true, false, ctx);
   646	
   647		return ret;
   648	}
   649	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
