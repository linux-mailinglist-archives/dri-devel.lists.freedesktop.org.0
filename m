Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 907CCAB3AE9
	for <lists+dri-devel@lfdr.de>; Mon, 12 May 2025 16:43:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02C4610E19E;
	Mon, 12 May 2025 14:43:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cncGeDDP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 349B610E19E
 for <dri-devel@lists.freedesktop.org>; Mon, 12 May 2025 14:43:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747061032; x=1778597032;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=aMcY98rvT3+Gv3S6jFWEKI7EYVNx8+l+hDVnIdzv3cE=;
 b=cncGeDDPXbc+Z8aJeagg5ZrzG7kTIV+4tC+u51MsX3u1vtSPxBDlZ4sX
 zJchlb3UxClKCToOkR6YhxZFeBuhKRoXsK51qY/oavzbk0BHbvotKMiy/
 nHMPdadwI9InZsMRi+bs8KF5ojtD5MA31xf2Z4tdfhWZr/ZIWJsyw/VdA
 FDYSgQYzyhL9j7XoiKexb6A1wNroBV4K/YIMl9EkV+Hr5kR2ph+yJPLJR
 GSD4jatzbHFtVD0fRR3F9dMcrEETDvxXLMeFgppCbSob7MHy7p59ku8gA
 ydjcm5M8uK3WEYfpO7Oa7GwYCHMMZXmPoaAJ950zLdsPG4Bl4DNPqp51w A==;
X-CSE-ConnectionGUID: DHIDuGoNRfOfXygmWNSgJg==
X-CSE-MsgGUID: TSBxApn9TC6TMiHU3fz4Vw==
X-IronPort-AV: E=McAfee;i="6700,10204,11431"; a="52509458"
X-IronPort-AV: E=Sophos;i="6.15,282,1739865600"; d="scan'208";a="52509458"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2025 07:43:51 -0700
X-CSE-ConnectionGUID: GcXqWT1qRNSSUDl8fsiP2A==
X-CSE-MsgGUID: 53vPXQh7RgWAf3vxil6W6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,282,1739865600"; d="scan'208";a="174518166"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
 by orviesa001.jf.intel.com with ESMTP; 12 May 2025 07:43:48 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1uEUNd-000EVX-38;
 Mon, 12 May 2025 14:43:45 +0000
Date: Mon, 12 May 2025 22:42:46 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org,
 tj@kernel.org, christian.koenig@amd.com,
 Johannes Weiner <hannes@cmpxchg.org>, Michal Hocko <mhocko@kernel.org>,
 Roman Gushchin <roman.gushchin@linux.dev>,
 Shakeel Butt <shakeel.butt@linux.dev>, Muchun Song <muchun.song@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev, cgroups@vger.kernel.org,
 Waiman Long <longman@redhat.com>, simona@ffwll.ch
Subject: Re: [PATCH 5/7] ttm: add initial memcg integration. (v4)
Message-ID: <202505122244.IEuTPfWF-lkp@intel.com>
References: <20250512061913.3522902-6-airlied@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250512061913.3522902-6-airlied@gmail.com>
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

[auto build test ERROR on akpm-mm/mm-everything]

url:    https://github.com/intel-lab-lkp/linux/commits/Dave-Airlie/ttm-use-gpu-mm-stats-to-track-gpu-memory-allocations/20250512-182204
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20250512061913.3522902-6-airlied%40gmail.com
patch subject: [PATCH 5/7] ttm: add initial memcg integration. (v4)
config: riscv-randconfig-001-20250512 (https://download.01.org/0day-ci/archive/20250512/202505122244.IEuTPfWF-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250512/202505122244.IEuTPfWF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505122244.IEuTPfWF-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/gpu/drm/xe/xe_bo.c: In function 'xe_bo_evict_pinned':
>> drivers/gpu/drm/xe/xe_bo.c:1147:2: warning: the address of 'ctx' will always evaluate as 'true' [-Waddress]
     ret = ttm_bo_populate(&bo->ttm, &ctx);
     ^~~
>> drivers/gpu/drm/xe/xe_bo.c:1147:8: error: too few arguments to function 'ttm_bo_populate'
     ret = ttm_bo_populate(&bo->ttm, &ctx);
           ^~~~~~~~~~~~~~~
   In file included from drivers/gpu/drm/xe/xe_bo_types.h:12:0,
                    from drivers/gpu/drm/xe/xe_bo.h:11,
                    from drivers/gpu/drm/xe/xe_bo.c:6:
   include/drm/ttm/ttm_bo.h:494:5: note: declared here
    int ttm_bo_populate(struct ttm_buffer_object *bo,
        ^~~~~~~~~~~~~~~
   drivers/gpu/drm/xe/xe_bo.c: In function 'xe_bo_restore_pinned':
   drivers/gpu/drm/xe/xe_bo.c:1208:2: warning: the address of 'ctx' will always evaluate as 'true' [-Waddress]
     ret = ttm_bo_populate(&bo->ttm, &ctx);
     ^~~
   drivers/gpu/drm/xe/xe_bo.c:1208:8: error: too few arguments to function 'ttm_bo_populate'
     ret = ttm_bo_populate(&bo->ttm, &ctx);
           ^~~~~~~~~~~~~~~
   In file included from drivers/gpu/drm/xe/xe_bo_types.h:12:0,
                    from drivers/gpu/drm/xe/xe_bo.h:11,
                    from drivers/gpu/drm/xe/xe_bo.c:6:
   include/drm/ttm/ttm_bo.h:494:5: note: declared here
    int ttm_bo_populate(struct ttm_buffer_object *bo,
        ^~~~~~~~~~~~~~~


vim +/ttm_bo_populate +1147 drivers/gpu/drm/xe/xe_bo.c

00c8efc3180f0c Thomas Hellström 2025-03-05  1096  
36919ebeaacab3 Matthew Auld     2023-04-06  1097  /**
36919ebeaacab3 Matthew Auld     2023-04-06  1098   * xe_bo_evict_pinned() - Evict a pinned VRAM object to system memory
36919ebeaacab3 Matthew Auld     2023-04-06  1099   * @bo: The buffer object to move.
36919ebeaacab3 Matthew Auld     2023-04-06  1100   *
75fd04f276de31 Nitin Gote       2025-01-06  1101   * On successful completion, the object memory will be moved to system memory.
36919ebeaacab3 Matthew Auld     2023-04-06  1102   *
36919ebeaacab3 Matthew Auld     2023-04-06  1103   * This is needed to for special handling of pinned VRAM object during
36919ebeaacab3 Matthew Auld     2023-04-06  1104   * suspend-resume.
36919ebeaacab3 Matthew Auld     2023-04-06  1105   *
36919ebeaacab3 Matthew Auld     2023-04-06  1106   * Return: 0 on success. Negative error code on failure.
36919ebeaacab3 Matthew Auld     2023-04-06  1107   */
36919ebeaacab3 Matthew Auld     2023-04-06  1108  int xe_bo_evict_pinned(struct xe_bo *bo)
36919ebeaacab3 Matthew Auld     2023-04-06  1109  {
36919ebeaacab3 Matthew Auld     2023-04-06  1110  	struct ttm_place place = {
36919ebeaacab3 Matthew Auld     2023-04-06  1111  		.mem_type = XE_PL_TT,
36919ebeaacab3 Matthew Auld     2023-04-06  1112  	};
36919ebeaacab3 Matthew Auld     2023-04-06  1113  	struct ttm_placement placement = {
36919ebeaacab3 Matthew Auld     2023-04-06  1114  		.placement = &place,
36919ebeaacab3 Matthew Auld     2023-04-06  1115  		.num_placement = 1,
36919ebeaacab3 Matthew Auld     2023-04-06  1116  	};
36919ebeaacab3 Matthew Auld     2023-04-06  1117  	struct ttm_operation_ctx ctx = {
36919ebeaacab3 Matthew Auld     2023-04-06  1118  		.interruptible = false,
6bd49cc1a8924c Thomas Hellström 2024-10-31  1119  		.gfp_retry_mayfail = true,
36919ebeaacab3 Matthew Auld     2023-04-06  1120  	};
36919ebeaacab3 Matthew Auld     2023-04-06  1121  	struct ttm_resource *new_mem;
36919ebeaacab3 Matthew Auld     2023-04-06  1122  	int ret;
36919ebeaacab3 Matthew Auld     2023-04-06  1123  
36919ebeaacab3 Matthew Auld     2023-04-06  1124  	xe_bo_assert_held(bo);
36919ebeaacab3 Matthew Auld     2023-04-06  1125  
36919ebeaacab3 Matthew Auld     2023-04-06  1126  	if (WARN_ON(!bo->ttm.resource))
36919ebeaacab3 Matthew Auld     2023-04-06  1127  		return -EINVAL;
36919ebeaacab3 Matthew Auld     2023-04-06  1128  
36919ebeaacab3 Matthew Auld     2023-04-06  1129  	if (WARN_ON(!xe_bo_is_pinned(bo)))
36919ebeaacab3 Matthew Auld     2023-04-06  1130  		return -EINVAL;
36919ebeaacab3 Matthew Auld     2023-04-06  1131  
a19d1db9a3fa89 Matthew Brost    2024-10-31  1132  	if (!xe_bo_is_vram(bo))
a19d1db9a3fa89 Matthew Brost    2024-10-31  1133  		return 0;
36919ebeaacab3 Matthew Auld     2023-04-06  1134  
36919ebeaacab3 Matthew Auld     2023-04-06  1135  	ret = ttm_bo_mem_space(&bo->ttm, &placement, &new_mem, &ctx);
36919ebeaacab3 Matthew Auld     2023-04-06  1136  	if (ret)
36919ebeaacab3 Matthew Auld     2023-04-06  1137  		return ret;
36919ebeaacab3 Matthew Auld     2023-04-06  1138  
36919ebeaacab3 Matthew Auld     2023-04-06  1139  	if (!bo->ttm.ttm) {
36919ebeaacab3 Matthew Auld     2023-04-06  1140  		bo->ttm.ttm = xe_ttm_tt_create(&bo->ttm, 0);
36919ebeaacab3 Matthew Auld     2023-04-06  1141  		if (!bo->ttm.ttm) {
36919ebeaacab3 Matthew Auld     2023-04-06  1142  			ret = -ENOMEM;
36919ebeaacab3 Matthew Auld     2023-04-06  1143  			goto err_res_free;
36919ebeaacab3 Matthew Auld     2023-04-06  1144  		}
36919ebeaacab3 Matthew Auld     2023-04-06  1145  	}
36919ebeaacab3 Matthew Auld     2023-04-06  1146  
fc5d96670eb254 Thomas Hellström 2024-09-11 @1147  	ret = ttm_bo_populate(&bo->ttm, &ctx);
36919ebeaacab3 Matthew Auld     2023-04-06  1148  	if (ret)
36919ebeaacab3 Matthew Auld     2023-04-06  1149  		goto err_res_free;
36919ebeaacab3 Matthew Auld     2023-04-06  1150  
36919ebeaacab3 Matthew Auld     2023-04-06  1151  	ret = dma_resv_reserve_fences(bo->ttm.base.resv, 1);
36919ebeaacab3 Matthew Auld     2023-04-06  1152  	if (ret)
36919ebeaacab3 Matthew Auld     2023-04-06  1153  		goto err_res_free;
36919ebeaacab3 Matthew Auld     2023-04-06  1154  
36919ebeaacab3 Matthew Auld     2023-04-06  1155  	ret = xe_bo_move(&bo->ttm, false, &ctx, new_mem, NULL);
36919ebeaacab3 Matthew Auld     2023-04-06  1156  	if (ret)
36919ebeaacab3 Matthew Auld     2023-04-06  1157  		goto err_res_free;
36919ebeaacab3 Matthew Auld     2023-04-06  1158  
36919ebeaacab3 Matthew Auld     2023-04-06  1159  	return 0;
36919ebeaacab3 Matthew Auld     2023-04-06  1160  
36919ebeaacab3 Matthew Auld     2023-04-06  1161  err_res_free:
36919ebeaacab3 Matthew Auld     2023-04-06  1162  	ttm_resource_free(&bo->ttm, &new_mem);
36919ebeaacab3 Matthew Auld     2023-04-06  1163  	return ret;
36919ebeaacab3 Matthew Auld     2023-04-06  1164  }
36919ebeaacab3 Matthew Auld     2023-04-06  1165  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
