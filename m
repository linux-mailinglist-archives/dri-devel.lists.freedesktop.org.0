Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 14753730F60
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jun 2023 08:32:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5963D10E482;
	Thu, 15 Jun 2023 06:32:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 506A110E11A;
 Thu, 15 Jun 2023 06:32:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686810771; x=1718346771;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=m7Rg4Z8tN68L4Ggv7n3oCaLNZ0NWwcD2fhinr5NJ6OQ=;
 b=jMf83c3XLvk7tJXBwanPTTwO86u5jrb9KasKXOOIvgU07qgTtJ4K8iXz
 FqbOh8yH/shXxqm4NHyFO6lfOOcV5pdnZnM4LJT898lkq1/avNRhY8GtX
 kkdxRQ74ChxYYGzFDqPIujZO7G6TaHmXdj+g37doJaXdo2RYVko4hgl8y
 CGUkLKAdxCyfpvr79U7kBDy5dULxd5Ry8/npgoi8YwNeRvwvG2HR4Dzxh
 mhr0fzc+uGFEmHf8xk+49+5vWu3g83nwxKN19Pa96HsuamVEynRRnXiaj
 aP149gHSx2z7mR5eD9pk9wl8mUKfCRPtUCQFLextOvNAwDDMAy6HRQDJF A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10741"; a="343527719"
X-IronPort-AV: E=Sophos;i="6.00,244,1681196400"; d="scan'208";a="343527719"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2023 23:32:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10741"; a="712345887"
X-IronPort-AV: E=Sophos;i="6.00,244,1681196400"; d="scan'208";a="712345887"
Received: from lkp-server02.sh.intel.com (HELO d59cacf64e9e) ([10.239.97.151])
 by orsmga002.jf.intel.com with ESMTP; 14 Jun 2023 23:32:47 -0700
Received: from kbuild by d59cacf64e9e with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1q9gXG-0001Yd-2W;
 Thu, 15 Jun 2023 06:32:46 +0000
Date: Thu, 15 Jun 2023 14:32:02 +0800
From: kernel test robot <lkp@intel.com>
To: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>, Felix.Kuehling@amd.com
Subject: Re: [PATCH] drm/amdkfd: Switch over to memdup_user()
Message-ID: <202306151407.U4D2AMDM-lkp@intel.com>
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
 Abaci Robot <abaci@linux.alibaba.com>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 oe-kbuild-all@lists.linux.dev, alexander.deucher@amd.com,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jiapeng,

kernel test robot noticed the following build warnings:

[auto build test WARNING on next-20230613]
[cannot apply to drm-misc/drm-misc-next v6.4-rc6 v6.4-rc5 v6.4-rc4 linus/master v6.4-rc6]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jiapeng-Chong/drm-amdkfd-Switch-over-to-memdup_user/20230614-100553
base:   next-20230613
patch link:    https://lore.kernel.org/r/20230614020432.44044-1-jiapeng.chong%40linux.alibaba.com
patch subject: [PATCH] drm/amdkfd: Switch over to memdup_user()
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20230615/202306151407.U4D2AMDM-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build):
        git checkout next-20230613
        b4 shazam https://lore.kernel.org/r/20230614020432.44044-1-jiapeng.chong@linux.alibaba.com
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/gpu/

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306151407.U4D2AMDM-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_device_queue_manager.c: In function 'get_queue_ids':
>> drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_device_queue_manager.c:2815:24: warning: returning 'long int' from a function with return type 'uint32_t *' {aka 'unsigned int *'} makes pointer from integer without a cast [-Wint-conversion]
    2815 |                 return PTR_ERR(queue_ids);
         |                        ^~~~~~~~~~~~~~~~~~


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
