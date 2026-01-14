Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E4120D1CB25
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jan 2026 07:41:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D55210E1C0;
	Wed, 14 Jan 2026 06:41:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="clZAkArS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9486010E1C0
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jan 2026 06:41:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768372881; x=1799908881;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=XpxsGPlLj5NM4VDI7W0Vxow+OTTiPnZzejvjUQVlmf8=;
 b=clZAkArSdZ4fxvLD9CaPqui25BDoA5vx5uqFRdBoeOVIs4fWzCwfgAPA
 oEy7M/ZgqtBfOInAdl7QAwNwYFNu8C82EaHduDy0LQadFjBkjFSLZjqfw
 7ZSyvQOiUrqkIDw4RBMVfF7Dnno1ll4bsnbyFVAoH/Uw7E/9jIeM6ttzH
 pqMcyV36+UMAEKo2g7ldOzy2fwOkgwLlsEeGZYWUysZEOLZJmjlsqOSaG
 HrcsxEECErtDl2s7nHSQ3ZZYH8jkhSTf0EmmFzkWFV5VE8cjzxvk9YDQa
 f/38g07uiHLE/UxQ/7WJR2QgduIno6tsBwD2XvrPk+agXxmT7M2z0j2mP A==;
X-CSE-ConnectionGUID: vQImADvSToCkR4yaxxBtkw==
X-CSE-MsgGUID: eRq8+XX1Qs++HNNHZaD8eQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="80777754"
X-IronPort-AV: E=Sophos;i="6.21,225,1763452800"; d="scan'208";a="80777754"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 22:41:20 -0800
X-CSE-ConnectionGUID: Li1sWpUOTPeHOoMTNEmoIw==
X-CSE-MsgGUID: k9fAY+zpRnqecC2vExlfZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,225,1763452800"; d="scan'208";a="227745806"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
 by fmviesa002.fm.intel.com with ESMTP; 13 Jan 2026 22:41:17 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
 (envelope-from <lkp@intel.com>) id 1vfuZ9-00000000FwK-1ZET;
 Wed, 14 Jan 2026 06:41:15 +0000
Date: Wed, 14 Jan 2026 14:40:23 +0800
From: kernel test robot <lkp@intel.com>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
 phasta@mailbox.org, tursulin@ursulin.net, matthew.brost@intel.com,
 sumit.semwal@linaro.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH 05/10] dma-buf: inline spinlock for fence protection v4
Message-ID: <202601141517.1B4n6bXr-lkp@intel.com>
References: <20260113152125.47380-6-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260113152125.47380-6-christian.koenig@amd.com>
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

Hi Christian,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-misc/drm-misc-next]
[also build test ERROR on drm-xe/drm-xe-next daeinki-drm-exynos/exynos-drm-next drm/drm-next drm-tip/drm-tip next-20260114]
[cannot apply to drm-i915/for-linux-next drm-i915/for-linux-next-fixes linus/master v6.19-rc5]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Christian-K-nig/dma-buf-add-dma_fence_is_initialized-function/20260114-001656
base:   https://gitlab.freedesktop.org/drm/misc/kernel.git drm-misc-next
patch link:    https://lore.kernel.org/r/20260113152125.47380-6-christian.koenig%40amd.com
patch subject: [PATCH 05/10] dma-buf: inline spinlock for fence protection v4
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260114/202601141517.1B4n6bXr-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260114/202601141517.1B4n6bXr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601141517.1B4n6bXr-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/i915/gt/intel_breadcrumbs.c:151:29: error: no member named 'lock' in 'struct dma_fence'
     151 |         lockdep_assert_held(fence->lock);
         |                             ~~~~~  ^
   include/linux/lockdep.h:392:46: note: expanded from macro 'lockdep_assert_held'
     392 | #define lockdep_assert_held(l)                  do { (void)(l); } while (0)
         |                                                             ^
   1 error generated.
--
>> drivers/gpu/drm/i915/i915_active.c:1048:27: error: no member named 'lock' in 'struct dma_fence'
    1048 |         spin_lock_irqsave(fence->lock, flags);
         |                           ~~~~~  ^
   include/linux/spinlock.h:381:39: note: expanded from macro 'spin_lock_irqsave'
     381 |         raw_spin_lock_irqsave(spinlock_check(lock), flags);     \
         |                                              ^~~~
   include/linux/spinlock.h:244:34: note: expanded from macro 'raw_spin_lock_irqsave'
     244 |                 flags = _raw_spin_lock_irqsave(lock);   \
         |                                                ^~~~
   drivers/gpu/drm/i915/i915_active.c:1050:26: error: no member named 'lock' in 'struct dma_fence'
    1050 |                 spin_lock_nested(prev->lock, SINGLE_DEPTH_NESTING);
         |                                  ~~~~  ^
   include/linux/spinlock.h:366:38: note: expanded from macro 'spin_lock_nested'
     366 |         raw_spin_lock_nested(spinlock_check(lock), subclass);   \
         |                                             ^~~~
   include/linux/spinlock.h:235:37: note: expanded from macro 'raw_spin_lock_nested'
     235 |         _raw_spin_lock(((void)(subclass), (lock)))
         |                                            ^~~~
   drivers/gpu/drm/i915/i915_active.c:1064:22: error: no member named 'lock' in 'struct dma_fence'
    1064 |                         spin_unlock(prev->lock);
         |                                     ~~~~  ^
   drivers/gpu/drm/i915/i915_active.c:1067:33: error: no member named 'lock' in 'struct dma_fence'
    1067 |                 spin_unlock_irqrestore(fence->lock, flags);
         |                                        ~~~~~  ^
   drivers/gpu/drm/i915/i915_active.c:1072:28: error: no member named 'lock' in 'struct dma_fence'
    1072 |                 spin_lock_irqsave(fence->lock, flags);
         |                                   ~~~~~  ^
   include/linux/spinlock.h:381:39: note: expanded from macro 'spin_lock_irqsave'
     381 |         raw_spin_lock_irqsave(spinlock_check(lock), flags);     \
         |                                              ^~~~
   include/linux/spinlock.h:244:34: note: expanded from macro 'raw_spin_lock_irqsave'
     244 |                 flags = _raw_spin_lock_irqsave(lock);   \
         |                                                ^~~~
   drivers/gpu/drm/i915/i915_active.c:1074:27: error: no member named 'lock' in 'struct dma_fence'
    1074 |                         spin_lock_nested(prev->lock, SINGLE_DEPTH_NESTING);
         |                                          ~~~~  ^
   include/linux/spinlock.h:366:38: note: expanded from macro 'spin_lock_nested'
     366 |         raw_spin_lock_nested(spinlock_check(lock), subclass);   \
         |                                             ^~~~
   include/linux/spinlock.h:235:37: note: expanded from macro 'raw_spin_lock_nested'
     235 |         _raw_spin_lock(((void)(subclass), (lock)))
         |                                            ^~~~
   drivers/gpu/drm/i915/i915_active.c:1091:21: error: no member named 'lock' in 'struct dma_fence'
    1091 |                 spin_unlock(prev->lock); /* serialise with prev->cb_list */
         |                             ~~~~  ^
   drivers/gpu/drm/i915/i915_active.c:1094:32: error: no member named 'lock' in 'struct dma_fence'
    1094 |         spin_unlock_irqrestore(fence->lock, flags);
         |                                ~~~~~  ^
   8 errors generated.


vim +151 drivers/gpu/drm/i915/gt/intel_breadcrumbs.c

0152b3b3f49b36 Chris Wilson 2019-05-08  144  
0152b3b3f49b36 Chris Wilson 2019-05-08  145  static void
f2cb60e9a3881e Chris Wilson 2019-08-17  146  __dma_fence_signal__notify(struct dma_fence *fence,
f2cb60e9a3881e Chris Wilson 2019-08-17  147  			   const struct list_head *list)
0152b3b3f49b36 Chris Wilson 2019-05-08  148  {
0152b3b3f49b36 Chris Wilson 2019-05-08  149  	struct dma_fence_cb *cur, *tmp;
0152b3b3f49b36 Chris Wilson 2019-05-08  150  
0152b3b3f49b36 Chris Wilson 2019-05-08 @151  	lockdep_assert_held(fence->lock);
0152b3b3f49b36 Chris Wilson 2019-05-08  152  
f2cb60e9a3881e Chris Wilson 2019-08-17  153  	list_for_each_entry_safe(cur, tmp, list, node) {
0152b3b3f49b36 Chris Wilson 2019-05-08  154  		INIT_LIST_HEAD(&cur->node);
0152b3b3f49b36 Chris Wilson 2019-05-08  155  		cur->func(fence, cur);
0152b3b3f49b36 Chris Wilson 2019-05-08  156  	}
0152b3b3f49b36 Chris Wilson 2019-05-08  157  }
0152b3b3f49b36 Chris Wilson 2019-05-08  158  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
