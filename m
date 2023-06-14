Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4061C72FE5E
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jun 2023 14:22:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1467C10E450;
	Wed, 14 Jun 2023 12:22:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B11E10E12D;
 Wed, 14 Jun 2023 12:22:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686745337; x=1718281337;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=JZVfxrwUIK3Wdo4307QCQsPD4ASj/0JzwbGG4o3QQcM=;
 b=LW8dh1m70Z513YT0iNBJhs/ntpZ6L3q/I9l6q6D3MPx4LvHuyChNMmy4
 WT3H1iYD7MXg+7cMHLG0KqKvR0PFEbgUcgNNLaM2lGwntjRVhvYyJQpXG
 6dwBgt3Bb0Pguf3DrdIOk/TU2gJh+puJvvquY/UPxQlePtGy1Rs2OQBi6
 ddwmNLKYJSoy0HxV0oZR8YcYVy1I1ZQ/OK31wez0V8nJBTzzB23Kv7YDr
 c+Zi6eEU5Dye+o0Vsrs6TvmT4Pc5Xbiwr1yvhG1swSzNskKltTXxBJ9nO
 3r3WEjM+o4EMv8sl4i0TODxSc6JRz51+xxmnt3ZBgs/mQcGXle4dpiqnp Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10741"; a="356089044"
X-IronPort-AV: E=Sophos;i="6.00,242,1681196400"; d="scan'208";a="356089044"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2023 05:22:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10741"; a="741821027"
X-IronPort-AV: E=Sophos;i="6.00,242,1681196400"; d="scan'208";a="741821027"
Received: from lkp-server02.sh.intel.com (HELO d59cacf64e9e) ([10.239.97.151])
 by orsmga008.jf.intel.com with ESMTP; 14 Jun 2023 05:22:13 -0700
Received: from kbuild by d59cacf64e9e with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1q9PVn-0000ck-0W;
 Wed, 14 Jun 2023 12:22:08 +0000
Date: Wed, 14 Jun 2023 20:21:33 +0800
From: kernel test robot <lkp@intel.com>
To: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>, Felix.Kuehling@amd.com
Subject: Re: [PATCH] drm/amdkfd: Switch over to memdup_user()
Message-ID: <202306142005.G5XIz3fm-lkp@intel.com>
References: <20230614020432.44044-1-jiapeng.chong@linux.alibaba.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230614020432.44044-1-jiapeng.chong@linux.alibaba.com>
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
Cc: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>, Xinhui.Pan@amd.com,
 llvm@lists.linux.dev, Abaci Robot <abaci@linux.alibaba.com>,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, oe-kbuild-all@lists.linux.dev,
 alexander.deucher@amd.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jiapeng,

kernel test robot noticed the following build errors:

[auto build test ERROR on next-20230613]
[cannot apply to drm-misc/drm-misc-next v6.4-rc6 v6.4-rc5 v6.4-rc4 linus/master v6.4-rc6]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jiapeng-Chong/drm-amdkfd-Switch-over-to-memdup_user/20230614-100553
base:   next-20230613
patch link:    https://lore.kernel.org/r/20230614020432.44044-1-jiapeng.chong%40linux.alibaba.com
patch subject: [PATCH] drm/amdkfd: Switch over to memdup_user()
config: x86_64-buildonly-randconfig-r006-20230614 (https://download.01.org/0day-ci/archive/20230614/202306142005.G5XIz3fm-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git checkout next-20230613
        b4 shazam https://lore.kernel.org/r/20230614020432.44044-1-jiapeng.chong@linux.alibaba.com
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/gpu/

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306142005.G5XIz3fm-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_device_queue_manager.c:2815:10: error: incompatible integer to pointer conversion returning 'long' from a function with result type 'uint32_t *' (aka 'unsigned int *') [-Wint-conversion]
                   return PTR_ERR(queue_ids);
                          ^~~~~~~~~~~~~~~~~~
   1 error generated.


vim +2815 drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_device_queue_manager.c

  2804	
  2805	static uint32_t *get_queue_ids(uint32_t num_queues, uint32_t *usr_queue_id_array)
  2806	{
  2807		size_t array_size = num_queues * sizeof(uint32_t);
  2808		uint32_t *queue_ids = NULL;
  2809	
  2810		if (!usr_queue_id_array)
  2811			return NULL;
  2812	
  2813		queue_ids = memdup_user(usr_queue_id_array, array_size);
  2814		if (IS_ERR(queue_ids))
> 2815			return PTR_ERR(queue_ids);
  2816	
  2817		return queue_ids;
  2818	}
  2819	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
