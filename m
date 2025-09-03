Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D1EA7B41171
	for <lists+dri-devel@lfdr.de>; Wed,  3 Sep 2025 02:46:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E378410E02E;
	Wed,  3 Sep 2025 00:46:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Q2+hpZkG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 626F410E02E
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Sep 2025 00:46:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756860366; x=1788396366;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=b5f4SPDgcSXeVH1wU9IYy52Ijhudx51cDLKHOZ9eYJ4=;
 b=Q2+hpZkGr5G9e+EYc8kLcnBuk0NlYtzVyJnhSpMOSjUGfhwhttb9Iehm
 gF999LCNJb4xhZeu4WtERDcroZReNT6D72PiWWx0vA71nP268Fwwi13wm
 mpCbO5AdKl6OMwCVIC+6C8XUDpSxMeeKhblG4fj8stnfb5Zwa134Sx1fe
 xOkKhmjyAVGn/YoBgYEhfVkfcCvqzDBoZD6CC6+oy2QVyU2RaQP2bB166
 3ZTjVblEOYA9pFUhFmS+i1NuyHy/GHSQhEGYjKmuVIi+VyC57KcuE8N08
 /gwihyNYeeGV+87VRTDDhk0yTdgCYWKBMVtpPR7f1nPKwkxZY19dgHHpB Q==;
X-CSE-ConnectionGUID: RPe5vYz2T+O9vaD3PgZfeA==
X-CSE-MsgGUID: 0zNemOgMTVyhYnGCbJBI1g==
X-IronPort-AV: E=McAfee;i="6800,10657,11541"; a="58376823"
X-IronPort-AV: E=Sophos;i="6.18,233,1751266800"; d="scan'208";a="58376823"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2025 17:46:06 -0700
X-CSE-ConnectionGUID: CaRhma6qRIea23WPV102FA==
X-CSE-MsgGUID: 5C/ig5cgRUWHP+URkF25gA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,233,1751266800"; d="scan'208";a="170717073"
Received: from lkp-server02.sh.intel.com (HELO 06ba48ef64e9) ([10.239.97.151])
 by orviesa010.jf.intel.com with ESMTP; 02 Sep 2025 17:46:03 -0700
Received: from kbuild by 06ba48ef64e9 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1utbdF-0003Bb-0R;
 Wed, 03 Sep 2025 00:45:54 +0000
Date: Wed, 3 Sep 2025 08:44:53 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org,
 tj@kernel.org, christian.koenig@amd.com,
 Johannes Weiner <hannes@cmpxchg.org>, Michal Hocko <mhocko@kernel.org>,
 Roman Gushchin <roman.gushchin@linux.dev>,
 Shakeel Butt <shakeel.butt@linux.dev>, Muchun Song <muchun.song@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev, cgroups@vger.kernel.org,
 Dave Chinner <david@fromorbit.com>,
 Waiman Long <longman@redhat.com>, simona@ffwll.ch
Subject: Re: [PATCH 03/15] ttm/pool: port to list_lru. (v2)
Message-ID: <202509030849.OExBO13p-lkp@intel.com>
References: <20250902041024.2040450-4-airlied@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250902041024.2040450-4-airlied@gmail.com>
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
[also build test ERROR on linus/master v6.17-rc4]
[cannot apply to akpm-mm/mm-everything next-20250902]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Dave-Airlie/drm-ttm-use-gpu-mm-stats-to-track-gpu-memory-allocations-v4/20250902-130646
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tj/cgroup.git for-next
patch link:    https://lore.kernel.org/r/20250902041024.2040450-4-airlied%40gmail.com
patch subject: [PATCH 03/15] ttm/pool: port to list_lru. (v2)
config: i386-buildonly-randconfig-002-20250903 (https://download.01.org/0day-ci/archive/20250903/202509030849.OExBO13p-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250903/202509030849.OExBO13p-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509030849.OExBO13p-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/drm/ttm/ttm_device.h:31,
                    from drivers/gpu/drm/ttm/ttm_range_manager.c:32:
>> include/drm/ttm/ttm_pool.h:57:25: error: field 'pages' has incomplete type
      57 |         struct list_lru pages;
         |                         ^~~~~


vim +/pages +57 include/drm/ttm/ttm_pool.h

    40	
    41	/**
    42	 * struct ttm_pool_type - Pool for a certain memory type
    43	 *
    44	 * @pool: the pool we belong to, might be NULL for the global ones
    45	 * @order: the allocation order our pages have
    46	 * @caching: the caching type our pages have
    47	 * @shrinker_list: our place on the global shrinker list
    48	 * @pages: the lru_list of pages in the pool
    49	 */
    50	struct ttm_pool_type {
    51		struct ttm_pool *pool;
    52		unsigned int order;
    53		enum ttm_caching caching;
    54	
    55		struct list_head shrinker_list;
    56	
  > 57		struct list_lru pages;
    58	};
    59	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
