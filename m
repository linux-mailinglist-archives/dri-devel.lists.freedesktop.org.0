Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12C69ABA908
	for <lists+dri-devel@lfdr.de>; Sat, 17 May 2025 10:57:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B165610E152;
	Sat, 17 May 2025 08:57:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Nn7xlfo4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3964510E152
 for <dri-devel@lists.freedesktop.org>; Sat, 17 May 2025 08:57:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747472244; x=1779008244;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=wa0AvHkjwezpx8OoGdRvdZZ/3qzIMnEuZXauHsK4oX0=;
 b=Nn7xlfo4ZL30Ea86IyBt0QecfKxdYugRjz6AAfB/Rht0vqU5KhS/VMWj
 pime1g+OQwTwhms7PhW+opbWeqjDKCO2PQEk6pBoAnyQBdz1I01uqbFH8
 wX5jELjgHT9ehAnKQH65Xf+Sop691njlZit8CNCPyYrj9rwluSR1DcIWw
 BRcagdl4+i7W5RhMqxuyAZDZ2mrUyM54PDijaa2kUjnWnyaogQpJpwCTK
 dE81bf0CL1RA8YTwcmGmeQRTV1whxnBeL4Uld5HayrcB6iZYQJdijaPxZ
 a+O8eBZ7CDm813w7QS6UcggHt36+cgku9L41vWIS/2NLx4dbJ51wUxPeS Q==;
X-CSE-ConnectionGUID: juOSCKjJR8m1v01hQ4QsUQ==
X-CSE-MsgGUID: T0J8By+jTiuYQ1LHj+FJWA==
X-IronPort-AV: E=McAfee;i="6700,10204,11435"; a="49140364"
X-IronPort-AV: E=Sophos;i="6.15,296,1739865600"; d="scan'208";a="49140364"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2025 01:57:24 -0700
X-CSE-ConnectionGUID: DF6Ut8pDRF2sGI12i8T6mg==
X-CSE-MsgGUID: rEEAtEDYSWeWOVKmwVFEyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,296,1739865600"; d="scan'208";a="142896842"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
 by fmviesa003.fm.intel.com with ESMTP; 17 May 2025 01:57:20 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1uGDM6-000K2J-0n;
 Sat, 17 May 2025 08:57:18 +0000
Date: Sat, 17 May 2025 16:56:33 +0800
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
Subject: Re: [PATCH v4 5/7] drm/panthor: Implement the counter sampler and
 sample handling
Message-ID: <202505171601.i0qhMG1O-lkp@intel.com>
References: <7005fb2eba3abbb2ee95282d117f70c8a7c8555f.1747148172.git.lukas.zapolskas@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7005fb2eba3abbb2ee95282d117f70c8a7c8555f.1747148172.git.lukas.zapolskas@arm.com>
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
patch link:    https://lore.kernel.org/r/7005fb2eba3abbb2ee95282d117f70c8a7c8555f.1747148172.git.lukas.zapolskas%40arm.com
patch subject: [PATCH v4 5/7] drm/panthor: Implement the counter sampler and sample handling
config: i386-buildonly-randconfig-002-20250517 (https://download.01.org/0day-ci/archive/20250517/202505171601.i0qhMG1O-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250517/202505171601.i0qhMG1O-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505171601.i0qhMG1O-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpu/drm/panthor/panthor_perf.c:381:8: error: redefinition of 'panthor_perf_counter_block'
     381 | struct panthor_perf_counter_block {
         |        ^
   drivers/gpu/drm/panthor/panthor_perf.c:126:8: note: previous definition is here
     126 | struct panthor_perf_counter_block {
         |        ^
>> drivers/gpu/drm/panthor/panthor_perf.c:651:15: error: redefinition of 'session_get_user_sample_size'
     651 | static size_t session_get_user_sample_size(const struct drm_panthor_perf_info *const info)
         |               ^
   drivers/gpu/drm/panthor/panthor_perf.c:391:15: note: previous definition is here
     391 | static size_t session_get_user_sample_size(const struct drm_panthor_perf_info *const info)
         |               ^
>> drivers/gpu/drm/panthor/panthor_perf.c:1038:19: error: incompatible pointer types passing '__u64 (*)[2]' (aka 'unsigned long long (*)[2]') to parameter of type 'u64 *' (aka 'unsigned long long *') [-Werror,-Wincompatible-pointer-types]
    1038 |                 bitmap_to_arr64(&blk->header.enable_mask, blk_em, PANTHOR_PERF_EM_BITS);
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bitmap.h:313:27: note: passing argument to parameter 'buf' here
     313 | void bitmap_to_arr64(u64 *buf, const unsigned long *bitmap, unsigned int nbits);
         |                           ^
   3 errors generated.


vim +/session_get_user_sample_size +651 drivers/gpu/drm/panthor/panthor_perf.c

   650	
 > 651	static size_t session_get_user_sample_size(const struct drm_panthor_perf_info *const info)
   652	{
   653		const size_t block_size = get_annotated_block_size(info->counters_per_block);
   654		const size_t block_nr = info->cshw_blocks + info->fw_blocks +
   655			info->tiler_blocks + info->memsys_blocks + info->shader_blocks;
   656	
   657		return sizeof(struct drm_panthor_perf_sample_header) + (block_size * block_nr);
   658	}
   659	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
