Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EB1A9AE2B3
	for <lists+dri-devel@lfdr.de>; Thu, 24 Oct 2024 12:35:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EE3E10E256;
	Thu, 24 Oct 2024 10:35:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hdlP448B";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B49310E004;
 Thu, 24 Oct 2024 10:35:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729766152; x=1761302152;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=UW0hE31GGN8jgPgRZbodK9mIg08FV4Mhsd8DDDS0j2M=;
 b=hdlP448BcP+e2EmJITpYMAHNAJ1qv3PXbCG7enlW9f7QDrh4ep3K7KSh
 VjvqULwvVeQBgc2al4zrQO82RfNSffwSJTVLIVFowhd5Z0mcHS5XfWVi9
 rays/txXl4dd9itf8Q8zaOSeIVpBvYp7TODJNj1mMAJgI0vLpVdC1/s4e
 iD+E2rds6ve+xuzwfWYKfys4kw3mwlvY6VNXcRTdSp9QAVQCjqCLryBxa
 qCmz7ZvlL0FgnqQF42NniPcnK/gen+gPiiMQAkAd77jqy+Icj/Bs0t4uU
 f6rknhvsZ9Y056sD+D0EDE57VmzkSdjGGocJSf+4mdTB3dmCtNTwVFgR6 g==;
X-CSE-ConnectionGUID: QjbqwF4PSQeI76oHEUqbuw==
X-CSE-MsgGUID: CCAnZiqMTqizsk4Kj1smaw==
X-IronPort-AV: E=McAfee;i="6700,10204,11234"; a="46879012"
X-IronPort-AV: E=Sophos;i="6.11,229,1725346800"; d="scan'208";a="46879012"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2024 03:35:51 -0700
X-CSE-ConnectionGUID: X7Jcr4c5Q3mLZGLgDfcadA==
X-CSE-MsgGUID: ZHEPrOvDR4mIJDGgHS9iMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,229,1725346800"; d="scan'208";a="111368091"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
 by fmviesa001.fm.intel.com with ESMTP; 24 Oct 2024 03:35:48 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1t3vBx-000WH7-26;
 Thu, 24 Oct 2024 10:35:45 +0000
Date: Thu, 24 Oct 2024 18:35:27 +0800
From: kernel test robot <lkp@intel.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 intel-xe@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Tejun Heo <tj@kernel.org>,
 Zefan Li <lizefan.x@bytedance.com>, Johannes Weiner <hannes@cmpxchg.org>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: oe-kbuild-all@lists.linux.dev,
 Linux Memory Management List <linux-mm@kvack.org>,
 Friedrich Vock <friedrich.vock@gmx.de>, cgroups@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: Re: [PATCH 2/7] drm/drv: Add drmm cgroup registration for dev cgroups.
Message-ID: <202410241806.p6u3FcGS-lkp@intel.com>
References: <20241023075302.27194-3-maarten.lankhorst@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241023075302.27194-3-maarten.lankhorst@linux.intel.com>
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

Hi Maarten,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm/drm-next]
[also build test ERROR on drm-exynos/exynos-drm-next next-20241024]
[cannot apply to tj-cgroup/for-next drm-xe/drm-xe-next akpm-mm/mm-everything drm-intel/for-linux-next drm-intel/for-linux-next-fixes drm-misc/drm-misc-next drm-tip/drm-tip linus/master v6.12-rc4]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Maarten-Lankhorst/kernel-cgroup-Add-dev-memory-accounting-cgroup/20241023-155504
base:   git://anongit.freedesktop.org/drm/drm drm-next
patch link:    https://lore.kernel.org/r/20241023075302.27194-3-maarten.lankhorst%40linux.intel.com
patch subject: [PATCH 2/7] drm/drv: Add drmm cgroup registration for dev cgroups.
config: x86_64-rhel-8.3 (https://download.01.org/0day-ci/archive/20241024/202410241806.p6u3FcGS-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241024/202410241806.p6u3FcGS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410241806.p6u3FcGS-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from drivers/gpu/drm/drm_drv.c:29:
>> include/linux/cgroup_dev.h:61:12: error: two or more data types in declaration specifiers
      61 | static int int dev_cgroup_try_charge(struct dev_cgroup_device *cgdev,
         |            ^~~
>> include/linux/cgroup_dev.h:65:1: error: expected identifier or '(' before '{' token
      65 | {
         | ^
>> include/linux/cgroup_dev.h:61:16: warning: 'dev_cgroup_try_charge' declared 'static' but never defined [-Wunused-function]
      61 | static int int dev_cgroup_try_charge(struct dev_cgroup_device *cgdev,
         |                ^~~~~~~~~~~~~~~~~~~~~


vim +61 include/linux/cgroup_dev.h

487073b1855ef4 Maarten Lankhorst 2024-10-23  60  
487073b1855ef4 Maarten Lankhorst 2024-10-23 @61  static int int dev_cgroup_try_charge(struct dev_cgroup_device *cgdev,
487073b1855ef4 Maarten Lankhorst 2024-10-23  62  				     u32 index, u64 size,
487073b1855ef4 Maarten Lankhorst 2024-10-23  63  				     struct dev_cgroup_pool_state **ret_pool,
487073b1855ef4 Maarten Lankhorst 2024-10-23  64  				     struct dev_cgroup_pool_state **ret_limit_pool);
487073b1855ef4 Maarten Lankhorst 2024-10-23 @65  {
487073b1855ef4 Maarten Lankhorst 2024-10-23  66  	*ret_pool = NULL;
487073b1855ef4 Maarten Lankhorst 2024-10-23  67  
487073b1855ef4 Maarten Lankhorst 2024-10-23  68  	if (ret_limit_pool)
487073b1855ef4 Maarten Lankhorst 2024-10-23  69  		*ret_limit_pool = NULL;
487073b1855ef4 Maarten Lankhorst 2024-10-23  70  
487073b1855ef4 Maarten Lankhorst 2024-10-23  71  	return 0;
487073b1855ef4 Maarten Lankhorst 2024-10-23  72  }
487073b1855ef4 Maarten Lankhorst 2024-10-23  73  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
