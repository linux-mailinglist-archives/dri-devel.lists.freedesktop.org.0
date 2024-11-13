Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FFA79C7ECF
	for <lists+dri-devel@lfdr.de>; Thu, 14 Nov 2024 00:32:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0141E10E258;
	Wed, 13 Nov 2024 23:32:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dl9k00ct";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A29210E258;
 Wed, 13 Nov 2024 23:32:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731540773; x=1763076773;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=X2f0x2yBm/u15hTS6abC7J1o2sTyF6rPVS15P06IP7E=;
 b=dl9k00ctgMYu0Z06H7RSucx3oWkxTYm9L9UDfC89cfjF9kAYTggDHzJp
 BsefAmpuBpIaXDMJprQ4DzLtXGMPwJW/+KjQ30EX8MQHwQG8BGOlFuKIN
 Mdxo3QqVgINtgMW5AQaSPk69yo7mJYlruw+LTO1rAbQWzqUV+zk77IL3J
 PoASerP1owMhKAMLuquMdZ1G3VaxsSNhGWNfjdV6BbTiTB4wxYv4qw/cs
 fdLHekVjbDBpkg8T1zgXukTzqrN6Z1jQdAo4O41mpoZIS/Fje8GfVT/Qs
 p7t+3olApQ2eJGV1y65KaAz5CxF50StqmHjUriVjrBIy+zIoLU2ps0vKJ g==;
X-CSE-ConnectionGUID: Cv+6bagGSh6DZX+2Sh+BlA==
X-CSE-MsgGUID: uFT4rJeiSf2YXke8gvUX6A==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="31433482"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="31433482"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2024 15:32:53 -0800
X-CSE-ConnectionGUID: 8n2eSxNDRqe4t5LXyKI3Kg==
X-CSE-MsgGUID: 1a6eHMKqSBWD4rx55yshUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,152,1728975600"; d="scan'208";a="92963441"
Received: from lkp-server01.sh.intel.com (HELO 80bd855f15b3) ([10.239.97.150])
 by orviesa005.jf.intel.com with ESMTP; 13 Nov 2024 15:32:50 -0800
Received: from kbuild by 80bd855f15b3 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1tBMqt-0000rR-1y;
 Wed, 13 Nov 2024 23:32:47 +0000
Date: Thu, 14 Nov 2024 07:32:15 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 intel-xe@lists.freedesktop.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>,
 Matthew Brost <matthew.brost@intel.com>, dri-devel@lists.freedesktop.org,
 Paulo Zanoni <paulo.r.zanoni@intel.com>,
 Simona Vetter <simona.vetter@ffwll.ch>
Subject: Re: [PATCH v13 2/8] drm/ttm: Provide a shmem backup implementation
Message-ID: <202411140712.uPD3DXCY-lkp@intel.com>
References: <20241113183550.6228-3-thomas.hellstrom@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241113183550.6228-3-thomas.hellstrom@linux.intel.com>
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

[auto build test ERROR on drm-xe/drm-xe-next]
[also build test ERROR on linus/master v6.12-rc7 next-20241113]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Thomas-Hellstr-m/drm-ttm-Balance-ttm_resource_cursor_init-and-ttm_resource_cursor_fini/20241114-023727
base:   https://gitlab.freedesktop.org/drm/xe/kernel.git drm-xe-next
patch link:    https://lore.kernel.org/r/20241113183550.6228-3-thomas.hellstrom%40linux.intel.com
patch subject: [PATCH v13 2/8] drm/ttm: Provide a shmem backup implementation
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20241114/202411140712.uPD3DXCY-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 592c0fe55f6d9a811028b5f3507be91458ab2713)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241114/202411140712.uPD3DXCY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411140712.uPD3DXCY-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/gpu/drm/ttm/ttm_backup.c:6:
   In file included from include/drm/ttm/ttm_backup.h:10:
   In file included from include/linux/shmem_fs.h:6:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:21:
   In file included from include/linux/mm.h:2213:
   include/linux/vmstat.h:504:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     504 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     505 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:511:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     511 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     512 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:524:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     524 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     525 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/ttm/ttm_backup.c:17:9: error: casting from randomized structure pointer type 'struct file *' to 'struct ttm_backup *'
      17 |         return (struct ttm_backup *)file;
         |                ^
   4 warnings and 1 error generated.


vim +17 drivers/gpu/drm/ttm/ttm_backup.c

    14	
    15	static struct ttm_backup *ttm_file_to_backup(struct file *file)
    16	{
  > 17		return (struct ttm_backup *)file;
    18	}
    19	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
