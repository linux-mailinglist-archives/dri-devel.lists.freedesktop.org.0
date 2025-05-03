Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3CD9AA7E02
	for <lists+dri-devel@lfdr.de>; Sat,  3 May 2025 04:11:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0594F10E2C8;
	Sat,  3 May 2025 02:11:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ccX9RUzt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AAFC10E2C8
 for <dri-devel@lists.freedesktop.org>; Sat,  3 May 2025 02:10:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746238258; x=1777774258;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=suGJnGTvTVJcrRwlDbdnRQ8llVaUDsm44ybcEgCTxmE=;
 b=ccX9RUztFTnSYB+QUhVl0SwPS0/XNqR5Sn3F0jji7M7o2gRh5Z1yiqpA
 SEdpUJ2UM9QobtHEXSzsVDCrP97b8EI0aR44yVwwl0UdwO5LRB6AsDGNu
 K1glGcyS6tRzsj9ySB9UbiGOMiAP2Rkp1k8w4i9ZlORN8PaonU8f0gtNJ
 Ici47+/VVYopN2Sv47l9T3OLpU7o3p+6E9kBiX+QS0cTvr9pBGEjzYxRz
 +g/WdBeFQtn7bvn6B+ROWspuAEbglPkgmZrKLQWVeP1RFU5I90AgrYQTi
 yRK1bNw+9cp4+ox4q5dKLfSHGO1xXscYP2IThj+letxVblznjZeXG637p Q==;
X-CSE-ConnectionGUID: LydvzLdcSWKfECxhIKUyzQ==
X-CSE-MsgGUID: /97uPRKAR2a7zg2zNC6SzQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11421"; a="48069434"
X-IronPort-AV: E=Sophos;i="6.15,258,1739865600"; d="scan'208";a="48069434"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 May 2025 19:10:56 -0700
X-CSE-ConnectionGUID: hmB4nToNTA6onfnAFvsS2w==
X-CSE-MsgGUID: an6spcJaTHymrNjFkKKbng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,258,1739865600"; d="scan'208";a="135105192"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
 by fmviesa008.fm.intel.com with ESMTP; 02 May 2025 19:10:50 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1uB2L1-0005A1-20;
 Sat, 03 May 2025 02:10:47 +0000
Date: Sat, 3 May 2025 10:09:51 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org,
 tj@kernel.org, christian.koenig@amd.com,
 Johannes Weiner <hannes@cmpxchg.org>, Michal Hocko <mhocko@kernel.org>,
 Roman Gushchin <roman.gushchin@linux.dev>,
 Shakeel Butt <shakeel.butt@linux.dev>, Muchun Song <muchun.song@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev, cgroups@vger.kernel.org,
 Waiman Long <longman@redhat.com>, simona@ffwll.ch
Subject: Re: [PATCH 3/5] ttm: add initial memcg integration. (v2)
Message-ID: <202505030927.6cZ0SdOU-lkp@intel.com>
References: <20250502034046.1625896-4-airlied@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250502034046.1625896-4-airlied@gmail.com>
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

Hi Dave,

kernel test robot noticed the following build errors:

[auto build test ERROR on tj-cgroup/for-next]
[also build test ERROR on akpm-mm/mm-everything linus/master v6.15-rc4]
[cannot apply to drm-misc/drm-misc-next drm-tip/drm-tip next-20250502]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Dave-Airlie/memcg-add-hooks-for-gpu-memcg-charging-uncharging/20250502-123650
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tj/cgroup.git for-next
patch link:    https://lore.kernel.org/r/20250502034046.1625896-4-airlied%40gmail.com
patch subject: [PATCH 3/5] ttm: add initial memcg integration. (v2)
config: s390-randconfig-001-20250503 (https://download.01.org/0day-ci/archive/20250503/202505030927.6cZ0SdOU-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250503/202505030927.6cZ0SdOU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505030927.6cZ0SdOU-lkp@intel.com/

All errors (new ones prefixed by >>):

   s390-linux-ld: drivers/gpu/drm/ttm/ttm_resource.o: in function `ttm_resource_free':
>> drivers/gpu/drm/ttm/ttm_resource.c:443: undefined reference to `mem_cgroup_uncharge_gpu'
   s390-linux-ld: drivers/gpu/drm/ttm/ttm_resource.o: in function `ttm_resource_alloc':
   drivers/gpu/drm/ttm/ttm_resource.c:408: undefined reference to `mem_cgroup_uncharge_gpu'
>> s390-linux-ld: drivers/gpu/drm/ttm/ttm_resource.c:400: undefined reference to `mem_cgroup_charge_gpu'


vim +443 drivers/gpu/drm/ttm/ttm_resource.c

   374	
   375	int ttm_resource_alloc(struct ttm_buffer_object *bo,
   376			       const struct ttm_place *place,
   377			       struct ttm_operation_ctx *ctx,
   378			       struct ttm_resource **res_ptr,
   379			       struct dmem_cgroup_pool_state **ret_limit_pool)
   380	{
   381		struct ttm_resource_manager *man =
   382			ttm_manager_type(bo->bdev, place->mem_type);
   383		struct dmem_cgroup_pool_state *pool = NULL;
   384		struct mem_cgroup *memcg = NULL;
   385		int ret;
   386	
   387		if (man->cg) {
   388			ret = dmem_cgroup_try_charge(man->cg, bo->base.size, &pool, ret_limit_pool);
   389			if (ret)
   390				return ret;
   391		}
   392	
   393		if ((place->mem_type == TTM_PL_SYSTEM || place->mem_type == TTM_PL_TT) &&
   394		    ctx->account_op && bo->memcg) {
   395			memcg = bo->memcg;
   396			gfp_t gfp_flags = GFP_USER;
   397			if (ctx->gfp_retry_mayfail)
   398				gfp_flags |= __GFP_RETRY_MAYFAIL;
   399	
 > 400			if (!mem_cgroup_charge_gpu(memcg, bo->base.size >> PAGE_SHIFT, gfp_flags))
   401				return -ENOMEM;
   402		}
   403		ret = man->func->alloc(man, bo, place, res_ptr);
   404		if (ret) {
   405			if (pool)
   406				dmem_cgroup_uncharge(pool, bo->base.size);
   407			if (memcg)
   408				mem_cgroup_uncharge_gpu(memcg, bo->base.size >> PAGE_SHIFT);
   409			return ret;
   410		}
   411	
   412		(*res_ptr)->memcg = memcg;
   413		(*res_ptr)->css = pool;
   414	
   415		spin_lock(&bo->bdev->lru_lock);
   416		ttm_resource_add_bulk_move(*res_ptr, bo);
   417		spin_unlock(&bo->bdev->lru_lock);
   418		return 0;
   419	}
   420	EXPORT_SYMBOL_FOR_TESTS_ONLY(ttm_resource_alloc);
   421	
   422	void ttm_resource_free(struct ttm_buffer_object *bo, struct ttm_resource **res)
   423	{
   424		struct ttm_resource_manager *man;
   425		struct dmem_cgroup_pool_state *pool;
   426		struct mem_cgroup *memcg;
   427	
   428		if (!*res)
   429			return;
   430	
   431		spin_lock(&bo->bdev->lru_lock);
   432		ttm_resource_del_bulk_move(*res, bo);
   433		spin_unlock(&bo->bdev->lru_lock);
   434	
   435		pool = (*res)->css;
   436		memcg = (*res)->memcg;
   437		man = ttm_manager_type(bo->bdev, (*res)->mem_type);
   438		man->func->free(man, *res);
   439		*res = NULL;
   440		if (man->cg)
   441			dmem_cgroup_uncharge(pool, bo->base.size);
   442		if (memcg)
 > 443			mem_cgroup_uncharge_gpu(memcg, bo->base.size >> PAGE_SHIFT);
   444	}
   445	EXPORT_SYMBOL(ttm_resource_free);
   446	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
