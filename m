Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 20F9AAC45B8
	for <lists+dri-devel@lfdr.de>; Tue, 27 May 2025 02:42:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5027710E38F;
	Tue, 27 May 2025 00:42:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aOuAdOtS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E49E10E385;
 Tue, 27 May 2025 00:42:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748306525; x=1779842525;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=b7WCTdDzsY3ib50iL9lMmkLXGXoRC2TsAT18weiNeMI=;
 b=aOuAdOtSg0GlpjXGXelG/tzC6x/hDbIn9s4rnfquLaZHLDSbtbRUwn3W
 wOArn8qLHkiecnYwxg6dLVTxt9t4nqSiqOqhw/DEQnTVX48OYr6wQxkUD
 zoXgZuS0KW6sQcnLTzUj8QJLl+XtfM9ttKDOrTZ36VeA8CuNHUqXXC5KG
 iIA3IHcrBJ13JAeDp2lAjeztW7Nlg7gR1PUq0mm7aOX9vKhsgojwc/ita
 PxhGkH1l2hewI9pzVI+GuKWwfPRPJQMpg4RzDqNF966sDdX3NkqupmAlY
 FkzMLYqlQWkLg6klk5i+zsKeev+HopS3ZpT6G8eNOWN6s2yCoI3HciOxN Q==;
X-CSE-ConnectionGUID: hfUMftnoS8WpNRIpLAo9tA==
X-CSE-MsgGUID: hNGg6jyfRNu30jqCaiFDbA==
X-IronPort-AV: E=McAfee;i="6700,10204,11445"; a="50163176"
X-IronPort-AV: E=Sophos;i="6.15,317,1739865600"; d="scan'208";a="50163176"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2025 17:42:05 -0700
X-CSE-ConnectionGUID: eTTSD+LqToKvDzQ0EUascQ==
X-CSE-MsgGUID: 0VpP+OZISlmWiR6xJdGwjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,317,1739865600"; d="scan'208";a="147454221"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
 by fmviesa005.fm.intel.com with ESMTP; 26 May 2025 17:42:00 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1uJiOE-000Slo-0w;
 Tue, 27 May 2025 00:41:58 +0000
Date: Tue, 27 May 2025 08:41:21 +0800
From: kernel test robot <lkp@intel.com>
To: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>,
 linux-pci@vger.kernel.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Bjorn Helgaas <helgaas@kernel.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
 Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Matt Roper <matthew.d.roper@intel.com>,
 =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>
Subject: Re: [PATCH v8 5/6] PCI: Allow drivers to control VF BAR size
Message-ID: <202505270842.rZMzTQh6-lkp@intel.com>
References: <20250526214257.3481760-6-michal.winiarski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250526214257.3481760-6-michal.winiarski@intel.com>
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

Hi Michał,

kernel test robot noticed the following build errors:

[auto build test ERROR on pci/next]
[also build test ERROR on pci/for-linus drm-xe/drm-xe-next drm-exynos/exynos-drm-next linus/master v6.15 next-20250526]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Micha-Winiarski/PCI-IOV-Restore-VF-resizable-BAR-state-after-reset/20250527-054652
base:   https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git next
patch link:    https://lore.kernel.org/r/20250526214257.3481760-6-michal.winiarski%40intel.com
patch subject: [PATCH v8 5/6] PCI: Allow drivers to control VF BAR size
config: csky-randconfig-002-20250527 (https://download.01.org/0day-ci/archive/20250527/202505270842.rZMzTQh6-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250527/202505270842.rZMzTQh6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505270842.rZMzTQh6-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from ./arch/csky/include/generated/asm/div64.h:1,
                    from include/linux/math.h:6,
                    from include/linux/kernel.h:27,
                    from include/linux/cpumask.h:11,
                    from include/linux/smp.h:13,
                    from include/linux/lockdep.h:14,
                    from include/linux/mutex.h:17,
                    from include/linux/kernfs.h:11,
                    from include/linux/sysfs.h:16,
                    from include/linux/kobject.h:20,
                    from include/linux/pci.h:35,
                    from drivers/pci/iov.c:13:
   drivers/pci/iov.c: In function 'pci_iov_vf_bar_get_sizes':
   include/asm-generic/div64.h:183:35: warning: comparison of distinct pointer types lacks a cast
     183 |         (void)(((typeof((n)) *)0) == ((uint64_t *)0));  \
         |                                   ^~
   drivers/pci/iov.c:1383:9: note: in expansion of macro 'do_div'
    1383 |         do_div(vf_len, num_vfs);
         |         ^~~~~~
   In file included from include/linux/build_bug.h:5,
                    from include/linux/bitfield.h:10,
                    from drivers/pci/iov.c:10:
   include/asm-generic/div64.h:195:32: warning: right shift count >= width of type [-Wshift-count-overflow]
     195 |         } else if (likely(((n) >> 32) == 0)) {          \
         |                                ^~
   include/linux/compiler.h:76:45: note: in definition of macro 'likely'
      76 | # define likely(x)      __builtin_expect(!!(x), 1)
         |                                             ^
   drivers/pci/iov.c:1383:9: note: in expansion of macro 'do_div'
    1383 |         do_div(vf_len, num_vfs);
         |         ^~~~~~
>> include/asm-generic/div64.h:199:36: error: passing argument 1 of '__div64_32' from incompatible pointer type [-Werror=incompatible-pointer-types]
     199 |                 __rem = __div64_32(&(n), __base);       \
         |                                    ^~~~
         |                                    |
         |                                    resource_size_t * {aka unsigned int *}
   drivers/pci/iov.c:1383:9: note: in expansion of macro 'do_div'
    1383 |         do_div(vf_len, num_vfs);
         |         ^~~~~~
   include/asm-generic/div64.h:174:38: note: expected 'uint64_t *' {aka 'long long unsigned int *'} but argument is of type 'resource_size_t *' {aka 'unsigned int *'}
     174 | extern uint32_t __div64_32(uint64_t *dividend, uint32_t divisor);
         |                            ~~~~~~~~~~^~~~~~~~
   cc1: some warnings being treated as errors


vim +/__div64_32 +199 include/asm-generic/div64.h

^1da177e4c3f41 Linus Torvalds     2005-04-16  176  
^1da177e4c3f41 Linus Torvalds     2005-04-16  177  /* The unnecessary pointer compare is there
^1da177e4c3f41 Linus Torvalds     2005-04-16  178   * to check for type safety (n must be 64bit)
^1da177e4c3f41 Linus Torvalds     2005-04-16  179   */
^1da177e4c3f41 Linus Torvalds     2005-04-16  180  # define do_div(n,base) ({				\
^1da177e4c3f41 Linus Torvalds     2005-04-16  181  	uint32_t __base = (base);			\
^1da177e4c3f41 Linus Torvalds     2005-04-16  182  	uint32_t __rem;					\
^1da177e4c3f41 Linus Torvalds     2005-04-16  183  	(void)(((typeof((n)) *)0) == ((uint64_t *)0));	\
911918aa7ef6f8 Nicolas Pitre      2015-11-02  184  	if (__builtin_constant_p(__base) &&		\
911918aa7ef6f8 Nicolas Pitre      2015-11-02  185  	    is_power_of_2(__base)) {			\
911918aa7ef6f8 Nicolas Pitre      2015-11-02  186  		__rem = (n) & (__base - 1);		\
911918aa7ef6f8 Nicolas Pitre      2015-11-02  187  		(n) >>= ilog2(__base);			\
c747ce4706190e Geert Uytterhoeven 2021-08-11  188  	} else if (__builtin_constant_p(__base) &&	\
461a5e51060c93 Nicolas Pitre      2015-10-30  189  		   __base != 0) {			\
461a5e51060c93 Nicolas Pitre      2015-10-30  190  		uint32_t __res_lo, __n_lo = (n);	\
461a5e51060c93 Nicolas Pitre      2015-10-30  191  		(n) = __div64_const32(n, __base);	\
461a5e51060c93 Nicolas Pitre      2015-10-30  192  		/* the remainder can be computed with 32-bit regs */ \
461a5e51060c93 Nicolas Pitre      2015-10-30  193  		__res_lo = (n);				\
461a5e51060c93 Nicolas Pitre      2015-10-30  194  		__rem = __n_lo - __res_lo * __base;	\
911918aa7ef6f8 Nicolas Pitre      2015-11-02  195  	} else if (likely(((n) >> 32) == 0)) {		\
^1da177e4c3f41 Linus Torvalds     2005-04-16  196  		__rem = (uint32_t)(n) % __base;		\
^1da177e4c3f41 Linus Torvalds     2005-04-16  197  		(n) = (uint32_t)(n) / __base;		\
c747ce4706190e Geert Uytterhoeven 2021-08-11  198  	} else {					\
^1da177e4c3f41 Linus Torvalds     2005-04-16 @199  		__rem = __div64_32(&(n), __base);	\
c747ce4706190e Geert Uytterhoeven 2021-08-11  200  	}						\
^1da177e4c3f41 Linus Torvalds     2005-04-16  201  	__rem;						\
^1da177e4c3f41 Linus Torvalds     2005-04-16  202   })
^1da177e4c3f41 Linus Torvalds     2005-04-16  203  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
