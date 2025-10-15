Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38ECDBDC910
	for <lists+dri-devel@lfdr.de>; Wed, 15 Oct 2025 07:01:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F98210E6FD;
	Wed, 15 Oct 2025 05:01:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mZjQ2BC5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45DA210E6FD
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Oct 2025 05:01:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760504481; x=1792040481;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=kanAYh/AWre6HYF5N6VhJ1uB9esahysGNKD1TIuqFMI=;
 b=mZjQ2BC5f1jK+niUPjtzvhlsJPz1veBcxOuRS1gkxp8nzWat9gGcQEYN
 eLapXYs3AD7nsB+QOvBeE4pYNLbuV+9aY1O6wpYISCMaS/CD9tyLTlev9
 jHm6jxAgMgDu0QOl6ZPZMmzkL35Vfi9wUwpX58dBU4a/9iwoNrM9Ywzwh
 mnAoi4w0DouAXFzAucw2jAumcXeIfCT+A9aIIBUsH5vJcKYL2vogYIuRE
 zvzYom9A/lIQ8ctrRmbQliZPc/b37bu4xk0kxheSHXQJCrFPXdshI+EEa
 KvqATNosq6UZD8e59MWwc8PZAthv9byo4lqr2Gs0n0xt65+4l/8JZPhtj g==;
X-CSE-ConnectionGUID: ggNWWR+9RL6eGwsFYdvXJw==
X-CSE-MsgGUID: i3JfXf+cS92zENQNZbYJ5Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11582"; a="62712728"
X-IronPort-AV: E=Sophos;i="6.19,230,1754982000"; d="scan'208";a="62712728"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2025 22:01:20 -0700
X-CSE-ConnectionGUID: HCLTxGItStOtYxE0H73znQ==
X-CSE-MsgGUID: h0P+SOgEQeuVNUgzNBZaYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,230,1754982000"; d="scan'208";a="181871160"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
 by orviesa007.jf.intel.com with ESMTP; 14 Oct 2025 22:01:18 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1v8tdT-0003Sl-0o;
 Wed, 15 Oct 2025 05:01:15 +0000
Date: Wed, 15 Oct 2025 13:01:10 +0800
From: kernel test robot <lkp@intel.com>
To: Karunika Choo <karunika.choo@arm.com>, dri-devel@lists.freedesktop.org
Cc: oe-kbuild-all@lists.linux.dev, nd@arm.com,
 Boris Brezillon <bbrezillon@kernel.org>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 06/10] drm/panthor: Implement L2 power on/off via
 PWR_CONTROL
Message-ID: <202510151252.aKq1qUWF-lkp@intel.com>
References: <20251014094337.1009601-7-karunika.choo@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251014094337.1009601-7-karunika.choo@arm.com>
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

Hi Karunika,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-misc/drm-misc-next]
[also build test WARNING on drm/drm-next drm-exynos/exynos-drm-next drm-intel/for-linux-next drm-intel/for-linux-next-fixes drm-tip/drm-tip linus/master v6.18-rc1 next-20251014]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Karunika-Choo/drm-panthor-Factor-out-GPU_ID-register-read-into-separate-function/20251014-174729
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20251014094337.1009601-7-karunika.choo%40arm.com
patch subject: [PATCH v1 06/10] drm/panthor: Implement L2 power on/off via PWR_CONTROL
config: i386-buildonly-randconfig-002-20251015 (https://download.01.org/0day-ci/archive/20251015/202510151252.aKq1qUWF-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251015/202510151252.aKq1qUWF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510151252.aKq1qUWF-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/gpu/drm/panthor/panthor_pwr.c:6:
   drivers/gpu/drm/panthor/panthor_pwr.c: In function 'panthor_pwr_domain_wait_transition':
>> include/linux/bits.h:49:27: warning: right shift count >= width of type [-Wshift-count-overflow]
      49 |               type_max(t) >> (BITS_PER_TYPE(t) - 1 - (h)))))
         |                           ^~
   include/linux/iopoll.h:145:9: note: in expansion of macro 'poll_timeout_us'
     145 |         poll_timeout_us((val) = op(args), cond, sleep_us, timeout_us, sleep_before_read)
         |         ^~~~~~~~~~~~~~~
   drivers/gpu/drm/panthor/panthor_device.h:533:9: note: in expansion of macro 'read_poll_timeout'
     533 |         read_poll_timeout(gpu_read64, val, cond, delay_us, timeout_us, false,   \
         |         ^~~~~~~~~~~~~~~~~
   drivers/gpu/drm/panthor/panthor_pwr.c:152:15: note: in expansion of macro 'gpu_read64_poll_timeout'
     152 |         ret = gpu_read64_poll_timeout(ptdev, pwrtrans_reg, val,
         |               ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bits.h:51:33: note: in expansion of macro 'GENMASK_TYPE'
      51 | #define GENMASK(h, l)           GENMASK_TYPE(unsigned long, h, l)
         |                                 ^~~~~~~~~~~~
   drivers/gpu/drm/panthor/panthor_pwr.c:26:41: note: in expansion of macro 'GENMASK'
      26 | #define PWR_ALL_CORES_MASK              GENMASK(63, 0)
         |                                         ^~~~~~~
   drivers/gpu/drm/panthor/panthor_pwr.c:153:41: note: in expansion of macro 'PWR_ALL_CORES_MASK'
     153 |                                       !(PWR_ALL_CORES_MASK & val), 100,
         |                                         ^~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/panthor/panthor_pwr.c: In function 'retract_domain':
>> include/vdso/bits.h:7:40: warning: left shift count >= width of type [-Wshift-count-overflow]
       7 | #define BIT(nr)                 (UL(1) << (nr))
         |                                        ^~
   include/linux/iopoll.h:49:21: note: in definition of macro 'poll_timeout_us'
      49 |                 if (cond) { \
         |                     ^~~~
   drivers/gpu/drm/panthor/panthor_device.h:533:9: note: in expansion of macro 'read_poll_timeout'
     533 |         read_poll_timeout(gpu_read64, val, cond, delay_us, timeout_us, false,   \
         |         ^~~~~~~~~~~~~~~~~
   drivers/gpu/drm/panthor/panthor_pwr.c:259:15: note: in expansion of macro 'gpu_read64_poll_timeout'
     259 |         ret = gpu_read64_poll_timeout(ptdev, PWR_STATUS, val,
         |               ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/panthor/panthor_regs.h:249:57: note: in expansion of macro 'BIT'
     249 | #define   PWR_STATUS_RETRACT_PENDING                    BIT(43)
         |                                                         ^~~
   drivers/gpu/drm/panthor/panthor_pwr.c:260:41: note: in expansion of macro 'PWR_STATUS_RETRACT_PENDING'
     260 |                                       !(PWR_STATUS_RETRACT_PENDING & val), 0,
         |                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~


vim +49 include/linux/bits.h

31299a5e021124 Vincent Mailhol 2025-03-26  35  
19408200c09485 Vincent Mailhol 2025-03-26  36  /*
19408200c09485 Vincent Mailhol 2025-03-26  37   * Generate a mask for the specified type @t. Additional checks are made to
19408200c09485 Vincent Mailhol 2025-03-26  38   * guarantee the value returned fits in that type, relying on
19408200c09485 Vincent Mailhol 2025-03-26  39   * -Wshift-count-overflow compiler check to detect incompatible arguments.
19408200c09485 Vincent Mailhol 2025-03-26  40   * For example, all these create build errors or warnings:
19408200c09485 Vincent Mailhol 2025-03-26  41   *
19408200c09485 Vincent Mailhol 2025-03-26  42   * - GENMASK(15, 20): wrong argument order
19408200c09485 Vincent Mailhol 2025-03-26  43   * - GENMASK(72, 15): doesn't fit unsigned long
19408200c09485 Vincent Mailhol 2025-03-26  44   * - GENMASK_U32(33, 15): doesn't fit in a u32
19408200c09485 Vincent Mailhol 2025-03-26  45   */
19408200c09485 Vincent Mailhol 2025-03-26  46  #define GENMASK_TYPE(t, h, l)					\
19408200c09485 Vincent Mailhol 2025-03-26  47  	((t)(GENMASK_INPUT_CHECK(h, l) +			\
19408200c09485 Vincent Mailhol 2025-03-26  48  	     (type_max(t) << (l) &				\
19408200c09485 Vincent Mailhol 2025-03-26 @49  	      type_max(t) >> (BITS_PER_TYPE(t) - 1 - (h)))))
19408200c09485 Vincent Mailhol 2025-03-26  50  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
