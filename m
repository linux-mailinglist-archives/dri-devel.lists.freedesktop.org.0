Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 229439094C0
	for <lists+dri-devel@lfdr.de>; Sat, 15 Jun 2024 01:27:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63C5710E2C2;
	Fri, 14 Jun 2024 23:27:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bWtcVBY+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E9F110E1C5;
 Fri, 14 Jun 2024 23:27:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718407650; x=1749943650;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=A6UbBmeWmL/TKprfBWDm4j5qcSzpetmWTtsHhvEMWqI=;
 b=bWtcVBY+YT1y+AujCuUUvCNCJhXNaKDDl0IFS48MkudaBzel6GGkJVyG
 e0O6dG4RKSDKsfPrBqMEfpqLAs6DjwVlZJ0vUEWPu/X2EXm1U+SqscBAK
 IPup31l45KAsrkarA4OPcrhGFjMlI4pUXbteisNQ7jC/5ZPrIeVxGhJ+5
 Rdb+Rwq3yxVuG5Pphc3hO22Gs+WwckTqHBcztY68VJcYq2SEXuZq0c8TW
 aSpuAP2qbYctRtvcMsN7zwvV3RnsINQRzVxyStFEHU6GmXYd/AlbFgC3Q
 hzr5t5BauRNZY9y57xIiRMZH00BV8tR9bmnx0vuDqX5zsXCkDJhjX+jx7 g==;
X-CSE-ConnectionGUID: rQCb7iI1Tbms2VFbQBJgVg==
X-CSE-MsgGUID: pFmB798ARna+YovAQSgQlQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11103"; a="19141766"
X-IronPort-AV: E=Sophos;i="6.08,239,1712646000"; d="scan'208";a="19141766"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2024 16:27:29 -0700
X-CSE-ConnectionGUID: d5t1lNw9SPmzM5anvwGfGQ==
X-CSE-MsgGUID: jKwGEpCXQnCGVyNyTJUWjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,239,1712646000"; d="scan'208";a="40596115"
Received: from lkp-server01.sh.intel.com (HELO 9e3ee4e9e062) ([10.239.97.150])
 by fmviesa008.fm.intel.com with ESMTP; 14 Jun 2024 16:27:27 -0700
Received: from kbuild by 9e3ee4e9e062 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1sIGKK-0001tp-2w;
 Fri, 14 Jun 2024 23:27:24 +0000
Date: Sat, 15 Jun 2024 07:27:07 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 intel-xe@lists.freedesktop.org
Cc: oe-kbuild-all@lists.linux.dev,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>,
 Matthew Brost <matthew.brost@intel.com>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v4 11/12] drm/ttm, drm/xe: Add a shrinker for xe bos
Message-ID: <202406150714.bpznu6ly-lkp@intel.com>
References: <20240614102548.4364-12-thomas.hellstrom@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240614102548.4364-12-thomas.hellstrom@linux.intel.com>
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

Hi Thomas,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-xe/drm-xe-next]
[also build test ERROR on next-20240613]
[cannot apply to linus/master v6.10-rc3]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Thomas-Hellstr-m/drm-ttm-Allow-TTM-LRU-list-nodes-of-different-types/20240614-182911
base:   https://gitlab.freedesktop.org/drm/xe/kernel.git drm-xe-next
patch link:    https://lore.kernel.org/r/20240614102548.4364-12-thomas.hellstrom%40linux.intel.com
patch subject: [PATCH v4 11/12] drm/ttm, drm/xe: Add a shrinker for xe bos
config: i386-buildonly-randconfig-002-20240615 (https://download.01.org/0day-ci/archive/20240615/202406150714.bpznu6ly-lkp@intel.com/config)
compiler: gcc-9 (Ubuntu 9.5.0-4ubuntu2) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240615/202406150714.bpznu6ly-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406150714.bpznu6ly-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/asm-generic/bug.h:22,
                    from arch/x86/include/asm/bug.h:87,
                    from include/linux/bug.h:5,
                    from include/linux/mmdebug.h:5,
                    from include/linux/mm.h:6,
                    from include/linux/pagemap.h:8,
                    from include/drm/ttm/ttm_tt.h:30,
                    from drivers/gpu/drm/xe/xe_bo.h:9,
                    from drivers/gpu/drm/xe/xe_bo.c:6:
   drivers/gpu/drm/xe/tests/xe_bo.c: In function 'shrink_test_run_device':
>> include/linux/kern_levels.h:5:18: error: format '%lu' expects argument of type 'long unsigned int', but argument 3 has type 'size_t' {aka 'unsigned int'} [-Werror=format=]
       5 | #define KERN_SOH "\001"  /* ASCII Start Of Header */
         |                  ^~~~~~
   include/linux/printk.h:436:11: note: in definition of macro 'printk_index_wrap'
     436 |   _p_func(_fmt, ##__VA_ARGS__);    \
         |           ^~~~
   include/kunit/test.h:529:3: note: in expansion of macro 'printk'
     529 |   printk(lvl fmt, ##__VA_ARGS__);    \
         |   ^~~~~~
   include/kunit/test.h:535:2: note: in expansion of macro 'kunit_log'
     535 |  kunit_log(lvl, test, KUNIT_SUBTEST_INDENT "# %s: " fmt,  \
         |  ^~~~~~~~~
   include/kunit/test.h:548:2: note: in expansion of macro 'kunit_printk'
     548 |  kunit_printk(KERN_INFO, test, fmt, ##__VA_ARGS__)
         |  ^~~~~~~~~~~~
   include/linux/kern_levels.h:14:19: note: in expansion of macro 'KERN_SOH'
      14 | #define KERN_INFO KERN_SOH "6" /* informational */
         |                   ^~~~~~~~
   include/kunit/test.h:548:15: note: in expansion of macro 'KERN_INFO'
     548 |  kunit_printk(KERN_INFO, test, fmt, ##__VA_ARGS__)
         |               ^~~~~~~~~
   drivers/gpu/drm/xe/tests/xe_bo.c:381:2: note: in expansion of macro 'kunit_info'
     381 |  kunit_info(test, "Free ram is %lu bytes. Will allocate twice of that.\n",
         |  ^~~~~~~~~~
   In file included from drivers/gpu/drm/xe/xe_bo.c:2442:
   drivers/gpu/drm/xe/tests/xe_bo.c:381:34: note: format string is defined here
     381 |  kunit_info(test, "Free ram is %lu bytes. Will allocate twice of that.\n",
         |                                ~~^
         |                                  |
         |                                  long unsigned int
         |                                %u
   In file included from drivers/gpu/drm/xe/tests/xe_bo.c:6,
                    from drivers/gpu/drm/xe/xe_bo.c:2442:
>> include/kunit/test.h:50:31: error: format '%lu' expects argument of type 'long unsigned int', but argument 4 has type 'size_t' {aka 'unsigned int'} [-Werror=format=]
      50 | #define KUNIT_SUBTEST_INDENT  "    "
         |                               ^~~~~~
   include/kunit/test.h:530:42: note: in definition of macro 'kunit_log'
     530 |   kunit_log_append((test_or_suite)->log, fmt,  \
         |                                          ^~~
   include/kunit/test.h:535:23: note: in expansion of macro 'KUNIT_SUBTEST_INDENT'
     535 |  kunit_log(lvl, test, KUNIT_SUBTEST_INDENT "# %s: " fmt,  \
         |                       ^~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:548:2: note: in expansion of macro 'kunit_printk'
     548 |  kunit_printk(KERN_INFO, test, fmt, ##__VA_ARGS__)
         |  ^~~~~~~~~~~~
   drivers/gpu/drm/xe/tests/xe_bo.c:381:2: note: in expansion of macro 'kunit_info'
     381 |  kunit_info(test, "Free ram is %lu bytes. Will allocate twice of that.\n",
         |  ^~~~~~~~~~
   In file included from drivers/gpu/drm/xe/xe_bo.c:2442:
   drivers/gpu/drm/xe/tests/xe_bo.c:381:34: note: format string is defined here
     381 |  kunit_info(test, "Free ram is %lu bytes. Will allocate twice of that.\n",
         |                                ~~^
         |                                  |
         |                                  long unsigned int
         |                                %u
   cc1: all warnings being treated as errors

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for REGMAP_SPI
   Depends on [n]: SPI [=n]
   Selected by [y]:
   - AD9739A [=y] && IIO [=y] && (SPI [=n] || COMPILE_TEST [=y])


vim +50 include/kunit/test.h

6d2426b2f258da David Gow        2021-06-24  43  
c3bba690a26432 Alan Maguire     2020-03-26  44  /*
c3bba690a26432 Alan Maguire     2020-03-26  45   * TAP specifies subtest stream indentation of 4 spaces, 8 spaces for a
c3bba690a26432 Alan Maguire     2020-03-26  46   * sub-subtest.  See the "Subtests" section in
c3bba690a26432 Alan Maguire     2020-03-26  47   * https://node-tap.org/tap-protocol/
c3bba690a26432 Alan Maguire     2020-03-26  48   */
b1eaa8b2a55c9d Michal Wajdeczko 2023-05-17  49  #define KUNIT_INDENT_LEN		4
c3bba690a26432 Alan Maguire     2020-03-26 @50  #define KUNIT_SUBTEST_INDENT		"    "
c3bba690a26432 Alan Maguire     2020-03-26  51  #define KUNIT_SUBSUBTEST_INDENT		"        "
c3bba690a26432 Alan Maguire     2020-03-26  52  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
