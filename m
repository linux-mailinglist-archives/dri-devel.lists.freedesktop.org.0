Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AEFA475E3A
	for <lists+dri-devel@lfdr.de>; Wed, 15 Dec 2021 18:10:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A53710F1E0;
	Wed, 15 Dec 2021 17:10:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B314710F1E0;
 Wed, 15 Dec 2021 17:10:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1639588239; x=1671124239;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=hriYAFTChAanB4XlQeVWD9tRqr8gsxK2zv0M1MyUO9k=;
 b=kWt91NseOCIeIcSZXOn67mjBCDRnO0+mu/uNwQkKDjiNPa8Ad9XA3kFo
 kVHJPGykpBJmwi8FM4k8W9sfVkt4quto8RX2D82KUO7f7YynUETDHkciG
 wLUoJb0b6BIRumT/5/AVgAsIru1apdErQ7yAEDl/v120kRq3Po3d1peLg
 LHh1c2sIoC4pIL24pUk658PxaY93m8UAYvZIIeJa0Kgh1Tx0jp2bO8NYE
 CfAQDvJklDw8/Avpje3wdAl9gmfMk1CnD0RMCFR3yH98YtESbPzIOH0xt
 bjZxly6ZYkeYoW/BPVf7ApyPwh/25Om7aQ0gTGdOexutWAfashFVTUXnp A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10199"; a="238019243"
X-IronPort-AV: E=Sophos;i="5.88,207,1635231600"; d="scan'208";a="238019243"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2021 09:09:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,207,1635231600"; d="scan'208";a="482464784"
Received: from lkp-server02.sh.intel.com (HELO 9f38c0981d9f) ([10.239.97.151])
 by orsmga002.jf.intel.com with ESMTP; 15 Dec 2021 09:09:08 -0800
Received: from kbuild by 9f38c0981d9f with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1mxXm8-00026Z-6k; Wed, 15 Dec 2021 17:09:08 +0000
Date: Thu, 16 Dec 2021 01:08:30 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 1/7] drm/i915: Avoid using the i915_fence_array when
 collecting dependencies
Message-ID: <202112160151.ZGYtb4Fp-lkp@intel.com>
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
 kbuild-all@lists.01.org, matthew.auld@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi "Thomas,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on drm-tip/drm-tip]
[also build test WARNING on drm-exynos/exynos-drm-next drm/drm-next next-20211214]
[cannot apply to drm-intel/for-linux-next v5.16-rc5]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Thomas-Hellstr-m/drm-i915-Asynchronous-vma-unbinding/20211215-183859
base:   git://anongit.freedesktop.org/drm/drm-tip drm-tip
config: i386-randconfig-a003-20211214 (https://download.01.org/0day-ci/archive/20211216/202112160151.ZGYtb4Fp-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce (this is a W=1 build):
        # https://github.com/0day-ci/linux/commit/0f61eb08a6b9d7fa9f19eaa071ad5591de123633
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Thomas-Hellstr-m/drm-i915-Asynchronous-vma-unbinding/20211215-183859
        git checkout 0f61eb08a6b9d7fa9f19eaa071ad5591de123633
        # save the config file to linux build tree
        mkdir build_dir
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/gpu/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c:634:5: warning: no previous prototype for 'prev_deps' [-Wmissing-prototypes]
     634 | int prev_deps(struct ttm_buffer_object *bo, struct ttm_operation_ctx *ctx,
         |     ^~~~~~~~~


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
