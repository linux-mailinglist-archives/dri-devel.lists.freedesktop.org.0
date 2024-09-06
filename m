Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ADF1E96E874
	for <lists+dri-devel@lfdr.de>; Fri,  6 Sep 2024 05:56:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7BD310E950;
	Fri,  6 Sep 2024 03:56:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ej6PVbNh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 033E010E08F;
 Fri,  6 Sep 2024 03:56:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725594966; x=1757130966;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=AOgep25YPfbArNphRZ3FzjXtGgRBjP2wdNuj5+iyhso=;
 b=ej6PVbNhHWYv53x9OsATjQ5txoXG+gcz2rI+b3B899qEEzlf08fxL+ZY
 I2JOMsPlYIldvEOcb6uveUU59UopgRRUpPpsCuKra7zHNZNwihRmpdyQW
 Rfa0LXX2PcUy/x59ZqDd29ZqcBlcDFbFGlUWDUF+P6HkR3ppY7ACO4Vp9
 CaO3m246JJlqIDwTTkZlUlkssj+nfZs2TSzMhph70MFJeUDUiaMM452Z0
 jtaOZ1MtFGDlYJIPbfuJA0bOaR2Wmzdc4xLLnTDNUKrTgrdZMho8ImmQp
 qogC61TyzdtWqax0PIRT0Z55E+KKQtz/B3meWRy1oWvzGDGud0EeYv2Zj A==;
X-CSE-ConnectionGUID: eHjCGSN8TneiIoUSSmm5Yg==
X-CSE-MsgGUID: ZIJLL3MJSaOOPprCF9nE5w==
X-IronPort-AV: E=McAfee;i="6700,10204,11186"; a="23849521"
X-IronPort-AV: E=Sophos;i="6.10,206,1719903600"; d="scan'208";a="23849521"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2024 20:56:06 -0700
X-CSE-ConnectionGUID: 6bbdXEE/QD+NC094Jser1Q==
X-CSE-MsgGUID: El4D01XXR+m56hRhWBK04w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,206,1719903600"; d="scan'208";a="96548787"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
 by orviesa002.jf.intel.com with ESMTP; 05 Sep 2024 20:56:02 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1smQ4l-000AaW-24;
 Fri, 06 Sep 2024 03:55:59 +0000
Date: Fri, 6 Sep 2024 11:55:02 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 intel-xe@lists.freedesktop.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
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
Message-ID: <202409061145.AtKjpWFJ-lkp@intel.com>
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
[cannot apply to drm-xe/drm-xe-next drm-intel/for-linux-next-fixes drm-tip/drm-tip linus/master v6.11-rc6]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Thomas-Hellstr-m/drm-ttm-Change-ttm_device_init-to-use-a-struct-instead-of-multiple-bools/20240905-173606
base:   git://anongit.freedesktop.org/drm-intel for-linux-next
patch link:    https://lore.kernel.org/r/20240905093322.29786-2-thomas.hellstrom%40linux.intel.com
patch subject: [PATCH 1/2] drm/ttm: Change ttm_device_init to use a struct instead of multiple bools
config: i386-randconfig-002-20240906 (https://download.01.org/0day-ci/archive/20240906/202409061145.AtKjpWFJ-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240906/202409061145.AtKjpWFJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409061145.AtKjpWFJ-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/drm_gem_vram_helper.c:981:13: error: too many arguments to function call, expected 6, have 7
     978 |         ret = ttm_device_init(&vmm->bdev, &bo_driver, dev->dev,
         |               ~~~~~~~~~~~~~~~
     979 |                                  dev->anon_inode->i_mapping,
     980 |                                  dev->vma_offset_manager,
     981 |                                  false, true);
         |                                         ^~~~
   include/drm/ttm/ttm_device.h:300:5: note: 'ttm_device_init' declared here
     300 | int ttm_device_init(struct ttm_device *bdev, const struct ttm_device_funcs *funcs,
         |     ^               ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     301 |                     struct device *dev, struct address_space *mapping,
         |                     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     302 |                     struct drm_vma_offset_manager *vma_manager,
         |                     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     303 |                     const struct ttm_device_init_flags flags);
         |                     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 error generated.


vim +981 drivers/gpu/drm/drm_gem_vram_helper.c

6b5ce4a1fb8489 Thomas Zimmermann 2019-09-11  969  
c30b225dba01b4 Thomas Zimmermann 2019-09-11  970  static int drm_vram_mm_init(struct drm_vram_mm *vmm, struct drm_device *dev,
b0e40e0805221d Thomas Zimmermann 2019-09-11  971  			    uint64_t vram_base, size_t vram_size)
6b5ce4a1fb8489 Thomas Zimmermann 2019-09-11  972  {
6b5ce4a1fb8489 Thomas Zimmermann 2019-09-11  973  	int ret;
6b5ce4a1fb8489 Thomas Zimmermann 2019-09-11  974  
6b5ce4a1fb8489 Thomas Zimmermann 2019-09-11  975  	vmm->vram_base = vram_base;
6b5ce4a1fb8489 Thomas Zimmermann 2019-09-11  976  	vmm->vram_size = vram_size;
6b5ce4a1fb8489 Thomas Zimmermann 2019-09-11  977  
8af8a109b34fa8 Christian König   2020-10-01  978  	ret = ttm_device_init(&vmm->bdev, &bo_driver, dev->dev,
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
