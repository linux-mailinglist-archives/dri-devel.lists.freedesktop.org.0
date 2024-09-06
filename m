Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 376E696E9A1
	for <lists+dri-devel@lfdr.de>; Fri,  6 Sep 2024 07:59:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4331310E18D;
	Fri,  6 Sep 2024 05:59:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LXvGjGYj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85A4610E18D;
 Fri,  6 Sep 2024 05:59:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725602371; x=1757138371;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=yMyT0v1kxNbfJq+8ycKl/AKn5rVKTHrtntCjDqG2Jww=;
 b=LXvGjGYjIgybQz3KJl0IPJHbOLlXbFko/ixDIES8qnf85EH3u0TaZCp9
 ho/ruOiAIDTVDdeoOPsZhtoz47jfw7xeqTEtk11mZsa5IursoHxj09/a3
 vMIaBojCLxgAhuriqvt4No6U3LnBe3RU0XvUqy26+1hudH7G0JzaEP+Ae
 AnJdFtgOOLI81wbleTeRoocQlpIkJbOkBDF0f8LHC18bTeiAl+yYUvWvx
 QBR8i2FmwNh7TyEjtLmky4dhKqNKoDDatVnxODqaQEXkU/Tur+DRwSu5Y
 ZCeTRmz/Se6OfR+zn0+Gleo/ZK1Yb4h6FNI9OFQ4iW1BSraHOzfgwS6pb g==;
X-CSE-ConnectionGUID: V3qCyORGQ/Ci4IBJxEkvTg==
X-CSE-MsgGUID: GvgoGDhBS2GTynzpInICWA==
X-IronPort-AV: E=McAfee;i="6700,10204,11186"; a="24150889"
X-IronPort-AV: E=Sophos;i="6.10,207,1719903600"; d="scan'208";a="24150889"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2024 22:59:30 -0700
X-CSE-ConnectionGUID: 0UIUUh0ZRp+wylHFk4u9bg==
X-CSE-MsgGUID: gNrrE9nWR56EdWunTgr+ZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,207,1719903600"; d="scan'208";a="66088329"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
 by fmviesa010.fm.intel.com with ESMTP; 05 Sep 2024 22:59:27 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1smS0C-000AjR-2a;
 Fri, 06 Sep 2024 05:59:24 +0000
Date: Fri, 6 Sep 2024 13:58:35 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 intel-xe@lists.freedesktop.org
Cc: oe-kbuild-all@lists.linux.dev,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, spice-devel@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Zack Rusin <zack.rusin@broadcom.com>,
 bcm-kernel-feedback-list@broadcom.com,
 Sui Jingfeng <suijingfeng@loongson.cn>,
 Matthew Brost <matthew.brost@intel.com>
Subject: Re: [PATCH 1/2] drm/ttm: Change ttm_device_init to use a struct
 instead of multiple bools
Message-ID: <202409061330.a2rRYEMl-lkp@intel.com>
References: <20240905093322.29786-2-thomas.hellstrom@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240905093322.29786-2-thomas.hellstrom@linux.intel.com>
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

[auto build test ERROR on drm-intel/for-linux-next]
[also build test ERROR on next-20240905]
[cannot apply to drm-xe/drm-xe-next linus/master v6.11-rc6]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Thomas-Hellstr-m/drm-ttm-Change-ttm_device_init-to-use-a-struct-instead-of-multiple-bools/20240905-173606
base:   git://anongit.freedesktop.org/drm-intel for-linux-next
patch link:    https://lore.kernel.org/r/20240905093322.29786-2-thomas.hellstrom%40linux.intel.com
patch subject: [PATCH 1/2] drm/ttm: Change ttm_device_init to use a struct instead of multiple bools
config: i386-randconfig-006-20240906 (https://download.01.org/0day-ci/archive/20240906/202409061330.a2rRYEMl-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240906/202409061330.a2rRYEMl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409061330.a2rRYEMl-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpu/drm/drm_gem_vram_helper.c: In function 'drm_vram_mm_init':
>> drivers/gpu/drm/drm_gem_vram_helper.c:981:34: error: incompatible type for argument 6 of 'ttm_device_init'
     981 |                                  false, true);
         |                                  ^~~~~
         |                                  |
         |                                  int
   In file included from include/drm/ttm/ttm_bo.h:39,
                    from include/drm/drm_gem_ttm_helper.h:10,
                    from drivers/gpu/drm/drm_gem_vram_helper.c:13:
   include/drm/ttm/ttm_device.h:303:56: note: expected 'const struct ttm_device_init_flags' but argument is of type 'int'
     303 |                     const struct ttm_device_init_flags flags);
         |                     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~
>> drivers/gpu/drm/drm_gem_vram_helper.c:978:15: error: too many arguments to function 'ttm_device_init'
     978 |         ret = ttm_device_init(&vmm->bdev, &bo_driver, dev->dev,
         |               ^~~~~~~~~~~~~~~
   include/drm/ttm/ttm_device.h:300:5: note: declared here
     300 | int ttm_device_init(struct ttm_device *bdev, const struct ttm_device_funcs *funcs,
         |     ^~~~~~~~~~~~~~~


vim +/ttm_device_init +981 drivers/gpu/drm/drm_gem_vram_helper.c

6b5ce4a1fb8489 Thomas Zimmermann 2019-09-11  969  
c30b225dba01b4 Thomas Zimmermann 2019-09-11  970  static int drm_vram_mm_init(struct drm_vram_mm *vmm, struct drm_device *dev,
b0e40e0805221d Thomas Zimmermann 2019-09-11  971  			    uint64_t vram_base, size_t vram_size)
6b5ce4a1fb8489 Thomas Zimmermann 2019-09-11  972  {
6b5ce4a1fb8489 Thomas Zimmermann 2019-09-11  973  	int ret;
6b5ce4a1fb8489 Thomas Zimmermann 2019-09-11  974  
6b5ce4a1fb8489 Thomas Zimmermann 2019-09-11  975  	vmm->vram_base = vram_base;
6b5ce4a1fb8489 Thomas Zimmermann 2019-09-11  976  	vmm->vram_size = vram_size;
6b5ce4a1fb8489 Thomas Zimmermann 2019-09-11  977  
8af8a109b34fa8 Christian König   2020-10-01 @978  	ret = ttm_device_init(&vmm->bdev, &bo_driver, dev->dev,
6b5ce4a1fb8489 Thomas Zimmermann 2019-09-11  979  				 dev->anon_inode->i_mapping,
6b5ce4a1fb8489 Thomas Zimmermann 2019-09-11  980  				 dev->vma_offset_manager,
ee5d2a8e549e90 Christian König   2020-10-24 @981  				 false, true);
6b5ce4a1fb8489 Thomas Zimmermann 2019-09-11  982  	if (ret)
6b5ce4a1fb8489 Thomas Zimmermann 2019-09-11  983  		return ret;
6b5ce4a1fb8489 Thomas Zimmermann 2019-09-11  984  
37205891d84f92 Dave Airlie       2020-08-04  985  	ret = ttm_range_man_init(&vmm->bdev, TTM_PL_VRAM,
0fe438cec9e1d2 Christian König   2020-09-11  986  				 false, vram_size >> PAGE_SHIFT);
6b5ce4a1fb8489 Thomas Zimmermann 2019-09-11  987  	if (ret)
6b5ce4a1fb8489 Thomas Zimmermann 2019-09-11  988  		return ret;
6b5ce4a1fb8489 Thomas Zimmermann 2019-09-11  989  
6b5ce4a1fb8489 Thomas Zimmermann 2019-09-11  990  	return 0;
6b5ce4a1fb8489 Thomas Zimmermann 2019-09-11  991  }
6b5ce4a1fb8489 Thomas Zimmermann 2019-09-11  992  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
