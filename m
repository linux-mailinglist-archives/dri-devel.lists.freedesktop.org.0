Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 996FCA9B2B8
	for <lists+dri-devel@lfdr.de>; Thu, 24 Apr 2025 17:44:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74F3710E82C;
	Thu, 24 Apr 2025 15:44:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="foXRe342";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B26CB10E82C;
 Thu, 24 Apr 2025 15:44:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745509466; x=1777045466;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Vxn9eSjJ8m+nMrlX03mokqrwLMbSDxuvnsPugGxZU9A=;
 b=foXRe342iXOeWwjcbSDeqkKHlqfgJWL4c1NIdD+7cebj4zJuVieNfVsC
 aO8G9FTQ+04aHXhSBM55xIW7OUwJq1uLDV1wF6RjxzzMJpKXSKnyFsBOT
 TdnjM7ExbTR3mAacAI85pjO2zMLYacfkRgoIp/LnY+ycmn52L7uyG8Xtt
 iyhxgtTvvUnYH6booKCMMsaeQmjdNWYu+0O2HpReABu5VM4B/hGCDUHzB
 x3bJP6eOnbTKrmIrENZ2GY6DQZQtT4XNmgM8LUYQrZ0DN0VUNhZfALFT3
 etrGcSa8Z6RYS+6hPgDVAJPbKByGGCYIGEEqEUYza9uols7d05822b522 g==;
X-CSE-ConnectionGUID: D4/giVslTLKsi0PFyDRxRA==
X-CSE-MsgGUID: tO2a4CvhQU+mHl4jO5cPTA==
X-IronPort-AV: E=McAfee;i="6700,10204,11413"; a="57800125"
X-IronPort-AV: E=Sophos;i="6.15,236,1739865600"; d="scan'208";a="57800125"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2025 08:44:25 -0700
X-CSE-ConnectionGUID: JIeJSll2T2u5TlH7hvl0LA==
X-CSE-MsgGUID: nOExJKHGRsqeDHjzsv/rug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,236,1739865600"; d="scan'208";a="163711421"
Received: from lkp-server01.sh.intel.com (HELO 050dd05385d1) ([10.239.97.150])
 by fmviesa001.fm.intel.com with ESMTP; 24 Apr 2025 08:44:23 -0700
Received: from kbuild by 050dd05385d1 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1u7ykP-0004HZ-1p;
 Thu, 24 Apr 2025 15:44:21 +0000
Date: Thu, 24 Apr 2025 23:43:22 +0800
From: kernel test robot <lkp@intel.com>
To: Matthew Auld <matthew.auld@intel.com>, intel-xe@lists.freedesktop.org
Cc: oe-kbuild-all@lists.linux.dev, dri-devel@lists.freedesktop.org,
 Matthew Brost <matthew.brost@intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH v3 7/7] drm/xe/pt: unify xe_pt_svm_pre_commit with userptr
Message-ID: <202504242339.WQvU1OVP-lkp@intel.com>
References: <20250424121827.862729-16-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250424121827.862729-16-matthew.auld@intel.com>
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

Hi Matthew,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-xe/drm-xe-next]
[also build test WARNING on next-20250424]
[cannot apply to drm-exynos/exynos-drm-next linus/master drm/drm-next drm-intel/for-linux-next drm-intel/for-linux-next-fixes drm-misc/drm-misc-next drm-tip/drm-tip v6.15-rc3]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Matthew-Auld/drm-gpusvm-fix-hmm_pfn_to_map_order-usage/20250424-202128
base:   https://gitlab.freedesktop.org/drm/xe/kernel.git drm-xe-next
patch link:    https://lore.kernel.org/r/20250424121827.862729-16-matthew.auld%40intel.com
patch subject: [PATCH v3 7/7] drm/xe/pt: unify xe_pt_svm_pre_commit with userptr
config: csky-randconfig-001-20250424 (https://download.01.org/0day-ci/archive/20250424/202504242339.WQvU1OVP-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250424/202504242339.WQvU1OVP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504242339.WQvU1OVP-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/gpu/drm/xe/xe_res_cursor.h:38,
                    from drivers/gpu/drm/xe/xe_vm.c:38:
>> drivers/gpu/drm/xe/xe_svm.h:182: warning: "xe_svm_assert_in_notifier" redefined
     182 | #define xe_svm_assert_in_notifier(vm__) \
         | 
   drivers/gpu/drm/xe/xe_svm.h:170: note: this is the location of the previous definition
     170 | #define xe_svm_assert_in_notifier(...) do {} while (0)
         | 
--
   In file included from drivers/gpu/drm/xe/xe_tile.c:16:
   drivers/gpu/drm/xe/xe_svm.h: In function 'xe_svm_init':
   drivers/gpu/drm/xe/xe_svm.h:128:16: error: implicit declaration of function 'drm_gpusvm_init'; did you mean 'drm_mm_init'? [-Werror=implicit-function-declaration]
     128 |         return drm_gpusvm_init(&vm->svm.gpusvm, "Xe SVM (simple)", &vm->xe->drm,
         |                ^~~~~~~~~~~~~~~
         |                drm_mm_init
   drivers/gpu/drm/xe/xe_svm.h:128:35: error: invalid use of undefined type 'struct xe_vm'
     128 |         return drm_gpusvm_init(&vm->svm.gpusvm, "Xe SVM (simple)", &vm->xe->drm,
         |                                   ^~
   drivers/gpu/drm/xe/xe_svm.h:128:71: error: invalid use of undefined type 'struct xe_vm'
     128 |         return drm_gpusvm_init(&vm->svm.gpusvm, "Xe SVM (simple)", &vm->xe->drm,
         |                                                                       ^~
   In file included from drivers/gpu/drm/xe/xe_sriov.h:9,
                    from drivers/gpu/drm/xe/xe_device.h:13,
                    from drivers/gpu/drm/xe/xe_tile.c:10:
   drivers/gpu/drm/xe/xe_svm.h: In function 'xe_svm_fini':
   drivers/gpu/drm/xe/xe_svm.h:135:21: error: invalid use of undefined type 'struct xe_vm'
     135 |         xe_assert(vm->xe, xe_vm_is_closed(vm));
         |                     ^~
   drivers/gpu/drm/xe/xe_assert.h:110:41: note: in definition of macro 'xe_assert_msg'
     110 |         const struct xe_device *__xe = (xe);                                                    \
         |                                         ^~
   drivers/gpu/drm/xe/xe_svm.h:135:9: note: in expansion of macro 'xe_assert'
     135 |         xe_assert(vm->xe, xe_vm_is_closed(vm));
         |         ^~~~~~~~~
   In file included from include/linux/bits.h:22,
                    from include/linux/gfp_types.h:5,
                    from include/linux/gfp.h:5,
                    from include/drm/drm_managed.h:6,
                    from drivers/gpu/drm/xe/xe_tile.c:8:
   drivers/gpu/drm/xe/xe_svm.h:135:27: error: implicit declaration of function 'xe_vm_is_closed' [-Werror=implicit-function-declaration]
     135 |         xe_assert(vm->xe, xe_vm_is_closed(vm));
         |                           ^~~~~~~~~~~~~~~
   include/linux/build_bug.h:30:63: note: in definition of macro 'BUILD_BUG_ON_INVALID'
      30 | #define BUILD_BUG_ON_INVALID(e) ((void)(sizeof((__force long)(e))))
         |                                                               ^
   drivers/gpu/drm/xe/xe_assert.h:111:9: note: in expansion of macro '__xe_assert_msg'
     111 |         __xe_assert_msg(__xe, condition,                                                        \
         |         ^~~~~~~~~~~~~~~
   drivers/gpu/drm/xe/xe_assert.h:108:34: note: in expansion of macro 'xe_assert_msg'
     108 | #define xe_assert(xe, condition) xe_assert_msg((xe), condition, "")
         |                                  ^~~~~~~~~~~~~
   drivers/gpu/drm/xe/xe_svm.h:135:9: note: in expansion of macro 'xe_assert'
     135 |         xe_assert(vm->xe, xe_vm_is_closed(vm));
         |         ^~~~~~~~~
   drivers/gpu/drm/xe/xe_svm.h:137:9: error: implicit declaration of function 'drm_gpusvm_fini'; did you mean 'drm_buddy_fini'? [-Werror=implicit-function-declaration]
     137 |         drm_gpusvm_fini(&vm->svm.gpusvm);
         |         ^~~~~~~~~~~~~~~
         |         drm_buddy_fini
   drivers/gpu/drm/xe/xe_svm.h:137:28: error: invalid use of undefined type 'struct xe_vm'
     137 |         drm_gpusvm_fini(&vm->svm.gpusvm);
         |                            ^~
   drivers/gpu/drm/xe/xe_svm.h: At top level:
>> drivers/gpu/drm/xe/xe_svm.h:182: warning: "xe_svm_assert_in_notifier" redefined
     182 | #define xe_svm_assert_in_notifier(vm__) \
         | 
   drivers/gpu/drm/xe/xe_svm.h:170: note: this is the location of the previous definition
     170 | #define xe_svm_assert_in_notifier(...) do {} while (0)
         | 
   cc1: some warnings being treated as errors

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for DRM_GPUSVM
   Depends on [n]: HAS_IOMEM [=y] && DRM [=y] && DEVICE_PRIVATE [=n]
   Selected by [m]:
   - DRM_XE [=m] && HAS_IOMEM [=y] && DRM [=y] && PCI [=y] && MMU [=y] && (m [=m] && MODULES [=y] || KUNIT [=n]=y [=y])


vim +/xe_svm_assert_in_notifier +182 drivers/gpu/drm/xe/xe_svm.h

   181	
 > 182	#define xe_svm_assert_in_notifier(vm__) \
   183		lockdep_assert_held_write(&(vm__)->svm.gpusvm.notifier_lock)
   184	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
