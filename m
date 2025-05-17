Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C44FABA8C3
	for <lists+dri-devel@lfdr.de>; Sat, 17 May 2025 09:53:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4A1C10E0C8;
	Sat, 17 May 2025 07:53:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZX2VyYVv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9653C10E144
 for <dri-devel@lists.freedesktop.org>; Sat, 17 May 2025 07:53:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747468399; x=1779004399;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=ItwpPKfVSEeImSexWi39aLRAw1v2H4b0otzybWAJT4Y=;
 b=ZX2VyYVvkVaWunV48bdfUngxLPp/i3oJlSe2YTfYeMu93XIQyglsiHaT
 CvzrZuBpr0qjgPZuGjTNefz0zA1H3JB15EaMPXQrogj3aarNbIqwdHfBn
 P+BSUth3+7N7nDElWUT1WX9/75O2r8PH7e3AZBZLpgtm+ril++ideioAV
 fpRTxDDb87odkqcMxEYrOurY+HG0Lv1i1mUbvGctgMIqJbMAAOkITnlDt
 xuTs6rOFHU+1nC+9AkQdNMdi857jssjQiJA0MNgD+0Tvtfn/28IZ6nxHn
 KrNWCB5d90Eutejh/js4Q2kOouKFA+tsBuketU8gFuOVDo3bjBJRt8jRe w==;
X-CSE-ConnectionGUID: EINowMVzTjeOeTmbGTzJ5w==
X-CSE-MsgGUID: a45TEj2ZQK2wz/vKKGRDiw==
X-IronPort-AV: E=McAfee;i="6700,10204,11435"; a="60779430"
X-IronPort-AV: E=Sophos;i="6.15,296,1739865600"; d="scan'208";a="60779430"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2025 00:53:19 -0700
X-CSE-ConnectionGUID: +pK88K8pTwW/UZxE/SqQdA==
X-CSE-MsgGUID: mFYPdnawS9SumkTzJMkc0A==
X-Ironport-Invalid-End-Of-Message: True
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,296,1739865600"; d="scan'208";a="138808540"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
 by orviesa006.jf.intel.com with ESMTP; 17 May 2025 00:53:16 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1uGCM5-000K0X-2C;
 Sat, 17 May 2025 07:53:13 +0000
Date: Sat, 17 May 2025 15:53:04 +0800
From: kernel test robot <lkp@intel.com>
To: Lukas Zapolskas <lukas.zapolskas@arm.com>,
 Boris Brezillon <bbrezillon@kernel.org>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 =?iso-8859-1?Q?Adri=E1n?= Larumbe <adrian.larumbe@collabora.com>,
 Lukas Zapolskas <lukas.zapolskas@arm.com>
Subject: Re: [PATCH v4 4/7] drm/panthor: Introduce sampling sessions to
 handle userspace clients
Message-ID: <202505171509.6i95NZ0n-lkp@intel.com>
References: <0319137f966f2dbffc54e51f7a2a3cbac837507b.1747148172.git.lukas.zapolskas@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0319137f966f2dbffc54e51f7a2a3cbac837507b.1747148172.git.lukas.zapolskas@arm.com>
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

Hi Lukas,

kernel test robot noticed the following build errors:

[auto build test ERROR on 96c85e428ebaeacd2c640eba075479ab92072ccd]

url:    https://github.com/intel-lab-lkp/linux/commits/Lukas-Zapolskas/drm-panthor-Add-performance-counter-uAPI/20250517-000257
base:   96c85e428ebaeacd2c640eba075479ab92072ccd
patch link:    https://lore.kernel.org/r/0319137f966f2dbffc54e51f7a2a3cbac837507b.1747148172.git.lukas.zapolskas%40arm.com
patch subject: [PATCH v4 4/7] drm/panthor: Introduce sampling sessions to handle userspace clients
config: i386-buildonly-randconfig-002-20250517 (https://download.01.org/0day-ci/archive/20250517/202505171509.6i95NZ0n-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250517/202505171509.6i95NZ0n-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505171509.6i95NZ0n-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/panthor/panthor_perf.c:189:8: error: redefinition of 'panthor_perf_counter_block'
     189 | struct panthor_perf_counter_block {
         |        ^
   drivers/gpu/drm/panthor/panthor_perf.c:47:8: note: previous definition is here
      47 | struct panthor_perf_counter_block {
         |        ^
   drivers/gpu/drm/panthor/panthor_perf.c:233:29: error: call to undeclared function 'GPU_MEM_FEATURES_L2_SLICES'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     233 |         perf_info->memsys_blocks = GPU_MEM_FEATURES_L2_SLICES(ptdev->gpu_info.mem_features);
         |                                    ^
   2 errors generated.


vim +/panthor_perf_counter_block +189 drivers/gpu/drm/panthor/panthor_perf.c

05182d1d6cff3c7 Lukas Zapolskas 2025-05-16  188  
1c26af93f15f9e2 Lukas Zapolskas 2025-05-16 @189  struct panthor_perf_counter_block {
1c26af93f15f9e2 Lukas Zapolskas 2025-05-16  190  	struct drm_panthor_perf_block_header header;
1c26af93f15f9e2 Lukas Zapolskas 2025-05-16  191  	u64 counters[];
1c26af93f15f9e2 Lukas Zapolskas 2025-05-16  192  };
1c26af93f15f9e2 Lukas Zapolskas 2025-05-16  193  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
