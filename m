Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BEDF667B14A
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jan 2023 12:32:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D97B010E77F;
	Wed, 25 Jan 2023 11:32:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9376F10E77F;
 Wed, 25 Jan 2023 11:31:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674646319; x=1706182319;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=5tiFxHorRsdi6tIY75oJsZOHykFx4JPsLHkuUSRto9Y=;
 b=i1eTcYLhJgD2tEhliLHkK89S7R3EBjkiTGb7Qj4F+Er9lpgpuAO86u+D
 woZBhwEnEZ7GkFSo7TvI9r75yDFkNHugdDg33+iapgPXNDSbiYFpA+brp
 D5XBoRpQPRIGTLsZuXZnBeMiyZfARtQdNbA+SswUv5CGmw+MTS0jb5FHg
 j1oHFTshwUSva7fWvmN/7RRbgRrZRUBXef1y+jv7yyMc9seTU8BSIi0W9
 StjzjTVd9AeXpVctQ9U+VBXPI+JEQVZMLW4tVCKasL9UOIAQN2HNsm7kp
 OZhaEV+0k3Y0zBBCKz5pVwib4F6yDbrtVF7rfNaS9nE5S5A0LxloBq+UZ A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10600"; a="412766919"
X-IronPort-AV: E=Sophos;i="5.97,245,1669104000"; d="scan'208";a="412766919"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2023 03:31:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10600"; a="662477057"
X-IronPort-AV: E=Sophos;i="5.97,245,1669104000"; d="scan'208";a="662477057"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
 by orsmga002.jf.intel.com with ESMTP; 25 Jan 2023 03:31:55 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1pKe0S-0007Gm-0t;
 Wed, 25 Jan 2023 11:31:56 +0000
Date: Wed, 25 Jan 2023 19:31:47 +0800
From: kernel test robot <lkp@intel.com>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Subject: Re: [Intel-gfx] [PATCH 5/5] drm/ttm: replace busy placement with
 flags v2
Message-ID: <202301251900.qqxH4BLi-lkp@intel.com>
References: <20230124125726.13323-5-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230124125726.13323-5-christian.koenig@amd.com>
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
Cc: oe-kbuild-all@lists.linux.dev
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Christian,

I love your patch! Yet something to improve:

[auto build test ERROR on drm-tip/drm-tip]

url:    https://github.com/intel-lab-lkp/linux/commits/Christian-K-nig/drm-ttm-stop-allocating-dummy-resources-during-BO-creation/20230124-205939
base:   git://anongit.freedesktop.org/drm/drm-tip drm-tip
patch link:    https://lore.kernel.org/r/20230124125726.13323-5-christian.koenig%40amd.com
patch subject: [Intel-gfx] [PATCH 5/5] drm/ttm: replace busy placement with flags v2
config: i386-defconfig (https://download.01.org/0day-ci/archive/20230125/202301251900.qqxH4BLi-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/intel-lab-lkp/linux/commit/1b5a737f3331c8493708ed779338243cd70dde6a
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Christian-K-nig/drm-ttm-stop-allocating-dummy-resources-during-BO-creation/20230124-205939
        git checkout 1b5a737f3331c8493708ed779338243cd70dde6a
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=i386 olddefconfig
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In function 'i915_ttm_placement_from_obj',
       inlined from 'i915_ttm_get_pages' at drivers/gpu/drm/i915/gem/i915_gem_ttm.c:841:2:
>> drivers/gpu/drm/i915/gem/i915_gem_ttm.c:165:25: error: 'places[0].flags' is used uninitialized [-Werror=uninitialized]
     165 |         places[0].flags |= TTM_PL_FLAG_IDLE;
         |                         ^~
   drivers/gpu/drm/i915/gem/i915_gem_ttm.c: In function 'i915_ttm_get_pages':
   drivers/gpu/drm/i915/gem/i915_gem_ttm.c:831:26: note: 'places' declared here
     831 |         struct ttm_place places[I915_TTM_MAX_PLACEMENTS + 1];
         |                          ^~~~~~
   cc1: all warnings being treated as errors


vim +165 drivers/gpu/drm/i915/gem/i915_gem_ttm.c

   155	
   156	static void
   157	i915_ttm_placement_from_obj(const struct drm_i915_gem_object *obj,
   158				    struct ttm_place *places,
   159				    struct ttm_placement *placement)
   160	{
   161		unsigned int num_allowed = obj->mm.n_placements;
   162		unsigned int flags = obj->flags;
   163		unsigned int i;
   164	
 > 165		places[0].flags |= TTM_PL_FLAG_IDLE;
   166		i915_ttm_place_from_region(num_allowed ? obj->mm.placements[0] :
   167					   obj->mm.region, &places[0], obj->bo_offset,
   168					   obj->base.size, flags);
   169	
   170		/* Cache this on object? */
   171		for (i = 0; i < num_allowed; ++i) {
   172			i915_ttm_place_from_region(obj->mm.placements[i],
   173						   &places[i + 1], obj->bo_offset,
   174						   obj->base.size, flags);
   175			places[i + 1].flags |= TTM_PL_FLAG_BUSY;
   176		}
   177	
   178		placement->num_placement = num_allowed + 1;
   179		placement->placement = places;
   180	}
   181	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
