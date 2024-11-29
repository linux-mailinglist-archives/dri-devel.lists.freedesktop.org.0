Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 171AF9DED42
	for <lists+dri-devel@lfdr.de>; Fri, 29 Nov 2024 23:40:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8546E10E367;
	Fri, 29 Nov 2024 22:40:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="h59zErUa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CAFA10E367;
 Fri, 29 Nov 2024 22:40:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732920005; x=1764456005;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=HtN+YA0TD2cbfaaA+uNfnLewQ+MzwI0073k2PLcM55M=;
 b=h59zErUaK5S+qgR2akEJmCKGrjOv7Fq4KrWLKGQGY+Er9QwFbcRL3OAM
 +7F/ODafyzQEM/N8+nfbxPYEMf8gUpegHDymVbfHRSXcIjVKJk0PntRSw
 1uu1miBEU9STH9rSUTCh8TAbOT17Uj3mheXvwu4NYBOuQYHuCVzYgvK1Y
 MIeoXF9fLbS9xlEibuV+z5bjhVohJlhACxzbCdkMie/YaepOCZtA6RN3P
 VRp+8mfOma7i1GbUt7PkJre1m0eXl1uqlkz8v2ErO6NYlrRzZmQdEnagh
 Gk+kVi3ZXdrb4dnp1miyPfCcR07KAG3Cx6YE6va1xHRhwcOmXvd3ov7e5 w==;
X-CSE-ConnectionGUID: rqKSiCDuQ8OPFWNXCKBcZg==
X-CSE-MsgGUID: hG2KyI4fTJG8TVC7M5jfYw==
X-IronPort-AV: E=McAfee;i="6700,10204,11271"; a="37090231"
X-IronPort-AV: E=Sophos;i="6.12,196,1728975600"; d="scan'208";a="37090231"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2024 14:40:05 -0800
X-CSE-ConnectionGUID: jeHesU7JQt6586XXS+Z0UA==
X-CSE-MsgGUID: DXrXdI0/TmOcfRHxf/iCzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,196,1728975600"; d="scan'208";a="92394014"
Received: from lkp-server01.sh.intel.com (HELO 5e2646291792) ([10.239.97.150])
 by fmviesa007.fm.intel.com with ESMTP; 29 Nov 2024 14:40:01 -0800
Received: from kbuild by 5e2646291792 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1tH9eY-0000jp-2N;
 Fri, 29 Nov 2024 22:39:58 +0000
Date: Sat, 30 Nov 2024 06:39:41 +0800
From: kernel test robot <lkp@intel.com>
To: Jocelyn Falempe <jfalempe@redhat.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, Jocelyn Falempe <jfalempe@redhat.com>
Subject: Re: [PATCH 1/5] drm/i915/fbdev: Add intel_fbdev_getvaddr()
Message-ID: <202411300651.eqKjTuw3-lkp@intel.com>
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
config: arm-randconfig-002-20241130 (https://download.01.org/0day-ci/archive/20241130/202411300651.eqKjTuw3-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241130/202411300651.eqKjTuw3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411300651.eqKjTuw3-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from <command-line>:
   drivers/gpu/drm/i915/display/intel_fbdev.c: In function 'intel_fbdev_getvaddr':
>> drivers/gpu/drm/i915/display/intel_fbdev.c:701:36: error: 'struct i915_vma' has no member named 'iomap'
     701 |         return READ_ONCE(fbdev->vma->iomap);
         |                                    ^~
   include/linux/compiler_types.h:497:23: note: in definition of macro '__compiletime_assert'
     497 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:517:9: note: in expansion of macro '_compiletime_assert'
     517 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:9: note: in expansion of macro 'compiletime_assert'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |         ^~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:28: note: in expansion of macro '__native_word'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |                            ^~~~~~~~~~~~~
   include/asm-generic/rwonce.h:49:9: note: in expansion of macro 'compiletime_assert_rwonce_type'
      49 |         compiletime_assert_rwonce_type(x);                              \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/display/intel_fbdev.c:701:16: note: in expansion of macro 'READ_ONCE'
     701 |         return READ_ONCE(fbdev->vma->iomap);
         |                ^~~~~~~~~
>> drivers/gpu/drm/i915/display/intel_fbdev.c:701:36: error: 'struct i915_vma' has no member named 'iomap'
     701 |         return READ_ONCE(fbdev->vma->iomap);
         |                                    ^~
   include/linux/compiler_types.h:497:23: note: in definition of macro '__compiletime_assert'
     497 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:517:9: note: in expansion of macro '_compiletime_assert'
     517 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:9: note: in expansion of macro 'compiletime_assert'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |         ^~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:28: note: in expansion of macro '__native_word'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |                            ^~~~~~~~~~~~~
   include/asm-generic/rwonce.h:49:9: note: in expansion of macro 'compiletime_assert_rwonce_type'
      49 |         compiletime_assert_rwonce_type(x);                              \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/display/intel_fbdev.c:701:16: note: in expansion of macro 'READ_ONCE'
     701 |         return READ_ONCE(fbdev->vma->iomap);
         |                ^~~~~~~~~
>> drivers/gpu/drm/i915/display/intel_fbdev.c:701:36: error: 'struct i915_vma' has no member named 'iomap'
     701 |         return READ_ONCE(fbdev->vma->iomap);
         |                                    ^~
   include/linux/compiler_types.h:497:23: note: in definition of macro '__compiletime_assert'
     497 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:517:9: note: in expansion of macro '_compiletime_assert'
     517 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:9: note: in expansion of macro 'compiletime_assert'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |         ^~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:28: note: in expansion of macro '__native_word'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |                            ^~~~~~~~~~~~~
   include/asm-generic/rwonce.h:49:9: note: in expansion of macro 'compiletime_assert_rwonce_type'
      49 |         compiletime_assert_rwonce_type(x);                              \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/display/intel_fbdev.c:701:16: note: in expansion of macro 'READ_ONCE'
     701 |         return READ_ONCE(fbdev->vma->iomap);
         |                ^~~~~~~~~
>> drivers/gpu/drm/i915/display/intel_fbdev.c:701:36: error: 'struct i915_vma' has no member named 'iomap'
     701 |         return READ_ONCE(fbdev->vma->iomap);
         |                                    ^~
   include/linux/compiler_types.h:497:23: note: in definition of macro '__compiletime_assert'
     497 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:517:9: note: in expansion of macro '_compiletime_assert'
     517 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:9: note: in expansion of macro 'compiletime_assert'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |         ^~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:28: note: in expansion of macro '__native_word'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |                            ^~~~~~~~~~~~~
   include/asm-generic/rwonce.h:49:9: note: in expansion of macro 'compiletime_assert_rwonce_type'
      49 |         compiletime_assert_rwonce_type(x);                              \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/display/intel_fbdev.c:701:16: note: in expansion of macro 'READ_ONCE'
     701 |         return READ_ONCE(fbdev->vma->iomap);
         |                ^~~~~~~~~
>> drivers/gpu/drm/i915/display/intel_fbdev.c:701:36: error: 'struct i915_vma' has no member named 'iomap'
     701 |         return READ_ONCE(fbdev->vma->iomap);
         |                                    ^~
   include/linux/compiler_types.h:497:23: note: in definition of macro '__compiletime_assert'
     497 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:517:9: note: in expansion of macro '_compiletime_assert'
     517 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:9: note: in expansion of macro 'compiletime_assert'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |         ^~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:49:9: note: in expansion of macro 'compiletime_assert_rwonce_type'
      49 |         compiletime_assert_rwonce_type(x);                              \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/display/intel_fbdev.c:701:16: note: in expansion of macro 'READ_ONCE'
     701 |         return READ_ONCE(fbdev->vma->iomap);
         |                ^~~~~~~~~
>> drivers/gpu/drm/i915/display/intel_fbdev.c:701:36: error: 'struct i915_vma' has no member named 'iomap'
     701 |         return READ_ONCE(fbdev->vma->iomap);
         |                                    ^~
   include/linux/compiler_types.h:473:27: note: in definition of macro '__unqual_scalar_typeof'
     473 |                 _Generic((x),                                           \
         |                           ^
   include/asm-generic/rwonce.h:50:9: note: in expansion of macro '__READ_ONCE'
      50 |         __READ_ONCE(x);                                                 \
         |         ^~~~~~~~~~~
   drivers/gpu/drm/i915/display/intel_fbdev.c:701:16: note: in expansion of macro 'READ_ONCE'
     701 |         return READ_ONCE(fbdev->vma->iomap);
         |                ^~~~~~~~~
   In file included from ./arch/arm/include/generated/asm/rwonce.h:1,
                    from include/linux/compiler.h:317,
                    from arch/arm/include/asm/atomic.h:11,
                    from include/linux/atomic.h:7,
                    from include/linux/console.h:17,
                    from drivers/gpu/drm/i915/display/intel_fbdev.c:27:
>> drivers/gpu/drm/i915/display/intel_fbdev.c:701:36: error: 'struct i915_vma' has no member named 'iomap'
     701 |         return READ_ONCE(fbdev->vma->iomap);
         |                                    ^~
   include/asm-generic/rwonce.h:44:73: note: in definition of macro '__READ_ONCE'
      44 | #define __READ_ONCE(x)  (*(const volatile __unqual_scalar_typeof(x) *)&(x))
         |                                                                         ^
   drivers/gpu/drm/i915/display/intel_fbdev.c:701:16: note: in expansion of macro 'READ_ONCE'
     701 |         return READ_ONCE(fbdev->vma->iomap);
         |                ^~~~~~~~~
>> drivers/gpu/drm/i915/display/intel_fbdev.c:702:1: warning: control reaches end of non-void function [-Wreturn-type]
     702 | }
         | ^


vim +701 drivers/gpu/drm/i915/display/intel_fbdev.c

   698	
   699	void *intel_fbdev_getvaddr(struct intel_fbdev *fbdev)
   700	{
 > 701		return READ_ONCE(fbdev->vma->iomap);
 > 702	}

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
