Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 671E7872A57
	for <lists+dri-devel@lfdr.de>; Tue,  5 Mar 2024 23:43:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 359D8112D53;
	Tue,  5 Mar 2024 22:43:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lenLGwbF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A2D3112D51;
 Tue,  5 Mar 2024 22:43:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709678586; x=1741214586;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=le9HD0ePIZrUYFtILTonALuNq0Gj6sGXYh79C0C39bs=;
 b=lenLGwbF238TJb5xvNFLLrO++Z9RbBcBxyG6Ia88POQbz3IaW5lyxQgE
 C3cfSbXVmd7OjHkz8/LfRfJoXwGtNYRkVUq2gmKt67Sw7yaXbYt3kNuVo
 /roBtY9z07mpIKyX2d3Kw0HV8d6lDRNEbUh4jtMF8wQKcqjvGWx7p7R5Y
 8Gq5p86URxJ9eUF4svun0lH+CYu0eommOcmZWj1+MoYbTb0S9yj8IMQS2
 l0xVUd9qGOeWXrbcJTpj0TguF0exWHZnvxEMa/80XerGicyfr5adijyWh
 n/doYihTjnzwWCDFweyaXZSXbVMrZ9c6TM3qgCwpTsxyUajzzCD70n3QI Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11004"; a="4384355"
X-IronPort-AV: E=Sophos;i="6.06,206,1705392000"; 
   d="scan'208";a="4384355"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2024 14:43:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,206,1705392000"; d="scan'208";a="14107416"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
 by fmviesa003.fm.intel.com with ESMTP; 05 Mar 2024 14:43:02 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1rhdUy-0003ij-0z;
 Tue, 05 Mar 2024 22:43:00 +0000
Date: Wed, 6 Mar 2024 06:42:38 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v3 3/4] drm/ttm, drm/amdgpu, drm/xe: Consider hitch moves
 within bulk sublist moves
Message-ID: <202403060640.zCXpVObi-lkp@intel.com>
References: <20240305160202.3555-4-thomas.hellstrom@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240305160202.3555-4-thomas.hellstrom@linux.intel.com>
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

[auto build test WARNING on drm-misc/drm-misc-next]
[also build test WARNING on drm-intel/for-linux-next drm-tip/drm-tip]
[cannot apply to drm-intel/for-linux-next-fixes linus/master v6.8-rc7 next-20240305]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Thomas-Hellstr-m/drm-ttm-Allow-TTM-LRU-list-nodes-of-different-types/20240306-000453
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20240305160202.3555-4-thomas.hellstrom%40linux.intel.com
patch subject: [PATCH v3 3/4] drm/ttm, drm/amdgpu, drm/xe: Consider hitch moves within bulk sublist moves
config: arm-defconfig (https://download.01.org/0day-ci/archive/20240306/202403060640.zCXpVObi-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240306/202403060640.zCXpVObi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403060640.zCXpVObi-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/gpu/drm/drm_gem_ttm_helper.c:5:
   In file included from include/drm/drm_gem_ttm_helper.h:10:
   In file included from include/drm/ttm/ttm_bo.h:39:
>> include/drm/ttm/ttm_device.h:286:31: warning: variable 'old' set but not used [-Wunused-but-set-variable]
           struct ttm_resource_manager *old;
                                        ^
   1 warning generated.


vim +/old +286 include/drm/ttm/ttm_device.h

   282	
   283	static inline void ttm_set_driver_manager(struct ttm_device *bdev, int type,
   284						  struct ttm_resource_manager *manager)
   285	{
 > 286		struct ttm_resource_manager *old;
   287	
   288		BUILD_BUG_ON(__builtin_constant_p(type) && type >= TTM_NUM_MEM_TYPES);
   289		old = bdev->man_drv[type];
   290		bdev->man_drv[type] = manager;
   291		if (manager)
   292			manager->mem_type = type;
   293	}
   294	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
