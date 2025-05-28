Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 350C2AC71EE
	for <lists+dri-devel@lfdr.de>; Wed, 28 May 2025 22:10:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D783110E0A4;
	Wed, 28 May 2025 20:10:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aKuGxL9i";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED50D10E0A4;
 Wed, 28 May 2025 20:10:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748463049; x=1779999049;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=cpQv2RNGwGH1nuOhlVXlmsBuGPn/vBpGaWEuwJmQePs=;
 b=aKuGxL9iWW5W7v07rGzoBCqVgbgvdv6k+C6n6+nRpkZg8kmoV7BUl3rf
 Q7HNNGNRnLnjoUtzd+llagsdyj9hFq1t+LWBuDcQ8Spr+REiislFeb1yN
 CTbcpBS3nXZKscjx+NiOh0gmGukBCwhR3o7LUqggcUgbgq3QUQiGRHwAs
 cIooMl50NjfxiwDmBKw6djs2Yu2GbUse44d3dOLOx36sBO8L8hxRi3ORW
 INTzUG8EvT5osZgcqxMU0gWKF3XgcO/diZKFUU236S59adyw7g/cZoE1u
 Ra7el3RJa6oet97hqOaPt4oKeC3MdU2nkXj0eeNKdoGEHLddtbP/Oc5XM w==;
X-CSE-ConnectionGUID: uhWCgk0KR8OpFCJlO0PmcA==
X-CSE-MsgGUID: MdzG9RLcQT27T0m1SRQmDQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11447"; a="67923184"
X-IronPort-AV: E=Sophos;i="6.15,322,1739865600"; d="scan'208";a="67923184"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2025 13:10:48 -0700
X-CSE-ConnectionGUID: rum74yynRJOvUDwtQKpswg==
X-CSE-MsgGUID: yL91wdbxS2OBj5xMho8yaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,322,1739865600"; d="scan'208";a="143801283"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
 by fmviesa010.fm.intel.com with ESMTP; 28 May 2025 13:10:46 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1uKN6q-000W2O-0U;
 Wed, 28 May 2025 20:10:44 +0000
Date: Thu, 29 May 2025 04:10:25 +0800
From: kernel test robot <lkp@intel.com>
To: Simona Vetter <simona.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 intel-xe@lists.freedesktop.org, Simona Vetter <simona.vetter@ffwll.ch>,
 Rob Clark <robdclark@chromium.org>,
 Emil Velikov <emil.l.velikov@gmail.com>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>, stable@vger.kernel.org
Subject: Re: [PATCH 2/8] drm/fdinfo: Switch to idr_for_each() in
 drm_show_memory_stats()
Message-ID: <202505290334.GjoY9qsk-lkp@intel.com>
References: <20250528091307.1894940-3-simona.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250528091307.1894940-3-simona.vetter@ffwll.ch>
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

Hi Simona,

kernel test robot noticed the following build warnings:

[auto build test WARNING on next-20250527]
[also build test WARNING on linus/master v6.15]
[cannot apply to v6.15 v6.15-rc7 v6.15-rc6]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Simona-Vetter/drm-gem-Fix-race-in-drm_gem_handle_create_tail/20250528-171524
base:   next-20250527
patch link:    https://lore.kernel.org/r/20250528091307.1894940-3-simona.vetter%40ffwll.ch
patch subject: [PATCH 2/8] drm/fdinfo: Switch to idr_for_each() in drm_show_memory_stats()
config: riscv-randconfig-001-20250529 (https://download.01.org/0day-ci/archive/20250529/202505290334.GjoY9qsk-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250529/202505290334.GjoY9qsk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505290334.GjoY9qsk-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/drm_file.c:916:3: warning: variable 'drm_data' is uninitialized when used here [-Wuninitialized]
     916 |                 drm_data->supported_status |= s;
         |                 ^~~~~~~~
   drivers/gpu/drm/drm_file.c:903:36: note: initialize the variable 'drm_data' to silence this warning
     903 |         struct drm_bo_print_data *drm_data;
         |                                           ^
         |                                            = NULL
   1 warning generated.


vim +/drm_data +916 drivers/gpu/drm/drm_file.c

   899	
   900	static int
   901	drm_bo_memory_stats(int id, void *ptr, void *data)
   902	{
   903		struct drm_bo_print_data *drm_data;
   904		struct drm_gem_object *obj = ptr;
   905		enum drm_gem_object_status s = 0;
   906		size_t add_size;
   907	
   908		if (!obj)
   909			return 0;
   910	
   911		add_size = (obj->funcs && obj->funcs->rss) ?
   912			obj->funcs->rss(obj) : obj->size;
   913	
   914		if (obj->funcs && obj->funcs->status) {
   915			s = obj->funcs->status(obj);
 > 916			drm_data->supported_status |= s;
   917		}
   918	
   919		if (drm_gem_object_is_shared_for_memory_stats(obj))
   920			drm_data->status.shared += obj->size;
   921		else
   922			drm_data->status.private += obj->size;
   923	
   924		if (s & DRM_GEM_OBJECT_RESIDENT) {
   925			drm_data->status.resident += add_size;
   926		} else {
   927			/* If already purged or not yet backed by pages, don't
   928			 * count it as purgeable:
   929			 */
   930			s &= ~DRM_GEM_OBJECT_PURGEABLE;
   931		}
   932	
   933		if (!dma_resv_test_signaled(obj->resv, dma_resv_usage_rw(true))) {
   934			drm_data->status.active += add_size;
   935			drm_data->supported_status |= DRM_GEM_OBJECT_ACTIVE;
   936	
   937			/* If still active, don't count as purgeable: */
   938			s &= ~DRM_GEM_OBJECT_PURGEABLE;
   939		}
   940	
   941		if (s & DRM_GEM_OBJECT_PURGEABLE)
   942			drm_data->status.purgeable += add_size;
   943	
   944		return 0;
   945	}
   946	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
