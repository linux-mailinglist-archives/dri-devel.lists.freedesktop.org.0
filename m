Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64C649DED9D
	for <lists+dri-devel@lfdr.de>; Sat, 30 Nov 2024 00:32:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A056310E363;
	Fri, 29 Nov 2024 23:32:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="avJgrvOv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DB6710E35C;
 Fri, 29 Nov 2024 23:32:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732923129; x=1764459129;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=/Ia3JcLagSbCWdRqeUjniwRpu9mwa3O3fmerEjEIJ/M=;
 b=avJgrvOvtLyg1+w79GN8QgB9bMTaGobji5hS7FoEpIuvukIMozGDix+l
 bkVIQX//7cvkpBaAPxeffsawAIiEf5X9gmU0eg/GUc+og0QLn6o0KhB2r
 b5BCUa4B56xk/wXXLqaBCpOBFNnkTJ1xErgYdox3qHJ8zwx7gX/DXfsBF
 XJ9vZ2M2cC6rCAASjc9FigAsi0DkJz0GmphipKQ9yxV32BGDiVY3+pbNb
 6d5fQsmbSprbf1+SQ7Nx68+88OxvMZSY3uNrSR+ZmOG5EZfi51huCjHoK
 RU3RdzFZQClkKztHqPr5v89AbljuT2BQMvV26p1rGdaV6XPM9i3TsM8J2 w==;
X-CSE-ConnectionGUID: MKDlvqJSReWp0Yrh5uE90A==
X-CSE-MsgGUID: IvUfDP2kRB+inc5vIyUuWA==
X-IronPort-AV: E=McAfee;i="6700,10204,11271"; a="36823602"
X-IronPort-AV: E=Sophos;i="6.12,197,1728975600"; d="scan'208";a="36823602"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2024 15:32:08 -0800
X-CSE-ConnectionGUID: U6YzJxjvSy29tT1rELYL+g==
X-CSE-MsgGUID: l4WlfjnKRkeXyP2F8Nk4fg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,197,1728975600"; d="scan'208";a="123542066"
Received: from lkp-server01.sh.intel.com (HELO 5e2646291792) ([10.239.97.150])
 by fmviesa001.fm.intel.com with ESMTP; 29 Nov 2024 15:32:05 -0800
Received: from kbuild by 5e2646291792 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1tHASw-0000lN-1a;
 Fri, 29 Nov 2024 23:32:02 +0000
Date: Sat, 30 Nov 2024 07:31:24 +0800
From: kernel test robot <lkp@intel.com>
To: Jocelyn Falempe <jfalempe@redhat.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Jocelyn Falempe <jfalempe@redhat.com>
Subject: Re: [PATCH 1/5] drm/i915/fbdev: Add intel_fbdev_getvaddr()
Message-ID: <202411300759.H1yNqy6r-lkp@intel.com>
References: <20241129162232.7594-2-jfalempe@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241129162232.7594-2-jfalempe@redhat.com>
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

Hi Jocelyn,

kernel test robot noticed the following build errors:

[auto build test ERROR on 44cff6c5b0b17a78bc0b30372bcd816cf6dd282a]

url:    https://github.com/intel-lab-lkp/linux/commits/Jocelyn-Falempe/drm-i915-fbdev-Add-intel_fbdev_getvaddr/20241130-002536
base:   44cff6c5b0b17a78bc0b30372bcd816cf6dd282a
patch link:    https://lore.kernel.org/r/20241129162232.7594-2-jfalempe%40redhat.com
patch subject: [PATCH 1/5] drm/i915/fbdev: Add intel_fbdev_getvaddr()
config: i386-buildonly-randconfig-005-20241130 (https://download.01.org/0day-ci/archive/20241130/202411300759.H1yNqy6r-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241130/202411300759.H1yNqy6r-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411300759.H1yNqy6r-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/gpu/drm/i915/display/intel_fbdev.c:30:
   In file included from include/linux/fb.h:5:
   In file included from include/uapi/linux/fb.h:6:
   In file included from include/linux/i2c.h:19:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:21:
   In file included from include/linux/mm.h:2213:
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> drivers/gpu/drm/i915/display/intel_fbdev.c:701:31: error: no member named 'iomap' in 'struct i915_vma'
     701 |         return READ_ONCE(fbdev->vma->iomap);
         |                          ~~~~~~~~~~  ^
   include/asm-generic/rwonce.h:49:33: note: expanded from macro 'READ_ONCE'
      49 |         compiletime_assert_rwonce_type(x);                              \
         |                                        ^
   include/asm-generic/rwonce.h:36:35: note: expanded from macro 'compiletime_assert_rwonce_type'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |                                          ^
   include/linux/compiler_types.h:484:10: note: expanded from macro '__native_word'
     484 |         (sizeof(t) == sizeof(char) || sizeof(t) == sizeof(short) || \
         |                 ^
   include/linux/compiler_types.h:517:22: note: expanded from macro 'compiletime_assert'
     517 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                             ^~~~~~~~~
   include/linux/compiler_types.h:505:23: note: expanded from macro '_compiletime_assert'
     505 |         __compiletime_assert(condition, msg, prefix, suffix)
         |                              ^~~~~~~~~
   include/linux/compiler_types.h:497:9: note: expanded from macro '__compiletime_assert'
     497 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
>> drivers/gpu/drm/i915/display/intel_fbdev.c:701:31: error: no member named 'iomap' in 'struct i915_vma'
     701 |         return READ_ONCE(fbdev->vma->iomap);
         |                          ~~~~~~~~~~  ^
   include/asm-generic/rwonce.h:49:33: note: expanded from macro 'READ_ONCE'
      49 |         compiletime_assert_rwonce_type(x);                              \
         |                                        ^
   include/asm-generic/rwonce.h:36:35: note: expanded from macro 'compiletime_assert_rwonce_type'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |                                          ^
   include/linux/compiler_types.h:484:39: note: expanded from macro '__native_word'
     484 |         (sizeof(t) == sizeof(char) || sizeof(t) == sizeof(short) || \
         |                                              ^
   include/linux/compiler_types.h:517:22: note: expanded from macro 'compiletime_assert'
     517 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                             ^~~~~~~~~
   include/linux/compiler_types.h:505:23: note: expanded from macro '_compiletime_assert'
     505 |         __compiletime_assert(condition, msg, prefix, suffix)
         |                              ^~~~~~~~~
   include/linux/compiler_types.h:497:9: note: expanded from macro '__compiletime_assert'
     497 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
>> drivers/gpu/drm/i915/display/intel_fbdev.c:701:31: error: no member named 'iomap' in 'struct i915_vma'
     701 |         return READ_ONCE(fbdev->vma->iomap);
         |                          ~~~~~~~~~~  ^
   include/asm-generic/rwonce.h:49:33: note: expanded from macro 'READ_ONCE'
      49 |         compiletime_assert_rwonce_type(x);                              \
         |                                        ^
   include/asm-generic/rwonce.h:36:35: note: expanded from macro 'compiletime_assert_rwonce_type'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |                                          ^
   include/linux/compiler_types.h:485:10: note: expanded from macro '__native_word'
     485 |          sizeof(t) == sizeof(int) || sizeof(t) == sizeof(long))
         |                 ^
   include/linux/compiler_types.h:517:22: note: expanded from macro 'compiletime_assert'
     517 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                             ^~~~~~~~~
   include/linux/compiler_types.h:505:23: note: expanded from macro '_compiletime_assert'
     505 |         __compiletime_assert(condition, msg, prefix, suffix)
         |                              ^~~~~~~~~
   include/linux/compiler_types.h:497:9: note: expanded from macro '__compiletime_assert'
     497 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
>> drivers/gpu/drm/i915/display/intel_fbdev.c:701:31: error: no member named 'iomap' in 'struct i915_vma'
     701 |         return READ_ONCE(fbdev->vma->iomap);
         |                          ~~~~~~~~~~  ^
   include/asm-generic/rwonce.h:49:33: note: expanded from macro 'READ_ONCE'
      49 |         compiletime_assert_rwonce_type(x);                              \
         |                                        ^
   include/asm-generic/rwonce.h:36:35: note: expanded from macro 'compiletime_assert_rwonce_type'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |                                          ^
   include/linux/compiler_types.h:485:38: note: expanded from macro '__native_word'
     485 |          sizeof(t) == sizeof(int) || sizeof(t) == sizeof(long))
         |                                             ^
   include/linux/compiler_types.h:517:22: note: expanded from macro 'compiletime_assert'
     517 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                             ^~~~~~~~~
   include/linux/compiler_types.h:505:23: note: expanded from macro '_compiletime_assert'
     505 |         __compiletime_assert(condition, msg, prefix, suffix)
         |                              ^~~~~~~~~
   include/linux/compiler_types.h:497:9: note: expanded from macro '__compiletime_assert'
     497 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
>> drivers/gpu/drm/i915/display/intel_fbdev.c:701:31: error: no member named 'iomap' in 'struct i915_vma'
     701 |         return READ_ONCE(fbdev->vma->iomap);
         |                          ~~~~~~~~~~  ^
   include/asm-generic/rwonce.h:49:33: note: expanded from macro 'READ_ONCE'
      49 |         compiletime_assert_rwonce_type(x);                              \
         |                                        ^
   include/asm-generic/rwonce.h:36:48: note: expanded from macro 'compiletime_assert_rwonce_type'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |                                                       ^
   include/linux/compiler_types.h:517:22: note: expanded from macro 'compiletime_assert'
     517 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                             ^~~~~~~~~
   include/linux/compiler_types.h:505:23: note: expanded from macro '_compiletime_assert'
     505 |         __compiletime_assert(condition, msg, prefix, suffix)
         |                              ^~~~~~~~~
   include/linux/compiler_types.h:497:9: note: expanded from macro '__compiletime_assert'
     497 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
>> drivers/gpu/drm/i915/display/intel_fbdev.c:701:31: error: no member named 'iomap' in 'struct i915_vma'
     701 |         return READ_ONCE(fbdev->vma->iomap);
         |                          ~~~~~~~~~~  ^
   include/asm-generic/rwonce.h:50:14: note: expanded from macro 'READ_ONCE'
      50 |         __READ_ONCE(x);                                                 \
         |                     ^
   include/asm-generic/rwonce.h:44:65: note: expanded from macro '__READ_ONCE'
      44 | #define __READ_ONCE(x)  (*(const volatile __unqual_scalar_typeof(x) *)&(x))
         |                                                                  ^
   include/linux/compiler_types.h:473:13: note: expanded from macro '__unqual_scalar_typeof'
     473 |                 _Generic((x),                                           \
         |                           ^
>> drivers/gpu/drm/i915/display/intel_fbdev.c:701:31: error: no member named 'iomap' in 'struct i915_vma'
     701 |         return READ_ONCE(fbdev->vma->iomap);
         |                          ~~~~~~~~~~  ^
   include/asm-generic/rwonce.h:50:14: note: expanded from macro 'READ_ONCE'
      50 |         __READ_ONCE(x);                                                 \
         |                     ^
   include/asm-generic/rwonce.h:44:65: note: expanded from macro '__READ_ONCE'
      44 | #define __READ_ONCE(x)  (*(const volatile __unqual_scalar_typeof(x) *)&(x))
         |                                                                  ^
   include/linux/compiler_types.h:480:15: note: expanded from macro '__unqual_scalar_typeof'
     480 |                          default: (x)))
         |                                    ^
>> drivers/gpu/drm/i915/display/intel_fbdev.c:701:31: error: no member named 'iomap' in 'struct i915_vma'
     701 |         return READ_ONCE(fbdev->vma->iomap);
         |                          ~~~~~~~~~~  ^
   include/asm-generic/rwonce.h:50:14: note: expanded from macro 'READ_ONCE'
      50 |         __READ_ONCE(x);                                                 \
         |                     ^
   include/asm-generic/rwonce.h:44:72: note: expanded from macro '__READ_ONCE'
      44 | #define __READ_ONCE(x)  (*(const volatile __unqual_scalar_typeof(x) *)&(x))
         |                                                                         ^
>> drivers/gpu/drm/i915/display/intel_fbdev.c:701:9: error: returning 'void' from a function with incompatible result type 'void *'
     701 |         return READ_ONCE(fbdev->vma->iomap);
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:47:28: note: expanded from macro 'READ_ONCE'
      47 | #define READ_ONCE(x)                                                    \
         |                                                                         ^
      48 | ({                                                                      \
         | ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      49 |         compiletime_assert_rwonce_type(x);                              \
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      50 |         __READ_ONCE(x);                                                 \
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      51 | })
         | ~~
   1 warning and 9 errors generated.


vim +701 drivers/gpu/drm/i915/display/intel_fbdev.c

   698	
   699	void *intel_fbdev_getvaddr(struct intel_fbdev *fbdev)
   700	{
 > 701		return READ_ONCE(fbdev->vma->iomap);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
