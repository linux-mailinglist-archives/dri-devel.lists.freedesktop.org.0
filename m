Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E0A4672941
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jan 2023 21:27:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA6CF10E828;
	Wed, 18 Jan 2023 20:27:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48E8210E029;
 Wed, 18 Jan 2023 20:27:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674073637; x=1705609637;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=6sPLbjLpRMrut6mkwWGe3o7oYxtT9A6KI8WUTNIxVsk=;
 b=lPdzzuVK54MgYaDaXZaQ1Xg5kvC6aVpm8SoGqpQFb4V78l8MyP2H3z9t
 lJEYZIwQm3gpS8heQ0a8q934BMSrTdeaq+aP54APmhfcHlwl7KtsEOvla
 HCqitTfn4T1+dAWZcddPMdga4xhkePjTtAXcPAcLNk5TD7DEsufZZ/QH4
 Kj1ujAHEni6vHslRq/Rgozi0D0wtEmy7Vcy19u9ge1L85aIpwbqgN6zNO
 jzAWoH2Jn+ZcwsTTChEQj4lACw8euO/1vmzschpWiepfEVGUfFo9JCoiV
 1UHDMkyiwXxmM0EkNa5V4RKliK5ClN8uAKSD54lgkCkwPyb/wsm8uEp/T g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="308652984"
X-IronPort-AV: E=Sophos;i="5.97,226,1669104000"; d="scan'208";a="308652984"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2023 12:27:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="767907627"
X-IronPort-AV: E=Sophos;i="5.97,226,1669104000"; d="scan'208";a="767907627"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
 by fmsmga002.fm.intel.com with ESMTP; 18 Jan 2023 12:27:13 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1pIF1c-0000gg-1U;
 Wed, 18 Jan 2023 20:27:12 +0000
Date: Thu, 19 Jan 2023 04:27:11 +0800
From: kernel test robot <lkp@intel.com>
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [Intel-gfx] [PATCH v10 23/23] drm/i915/vm_bind: Support capture
 of persistent mappings
Message-ID: <202301190440.EuujWDwh-lkp@intel.com>
References: <20230118071609.17572-24-niranjana.vishwanathapura@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230118071609.17572-24-niranjana.vishwanathapura@intel.com>
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
Cc: paulo.r.zanoni@intel.com, jani.nikula@intel.com, llvm@lists.linux.dev,
 thomas.hellstrom@intel.com, matthew.auld@intel.com,
 oe-kbuild-all@lists.linux.dev, daniel.vetter@intel.com,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Niranjana,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on drm-intel/for-linux-next]
[also build test ERROR on drm-intel/for-linux-next-fixes drm-tip/drm-tip drm/drm-next drm-exynos/exynos-drm-next drm-misc/drm-misc-next linus/master v6.2-rc4 next-20230118]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Niranjana-Vishwanathapura/drm-i915-vm_bind-Expose-vm-lookup-function/20230118-151845
base:   git://anongit.freedesktop.org/drm-intel for-linux-next
patch link:    https://lore.kernel.org/r/20230118071609.17572-24-niranjana.vishwanathapura%40intel.com
patch subject: [Intel-gfx] [PATCH v10 23/23] drm/i915/vm_bind: Support capture of persistent mappings
config: i386-randconfig-a013 (https://download.01.org/0day-ci/archive/20230119/202301190440.EuujWDwh-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/251fbfd52586e3ff4677b44a136d08f9580d79e2
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Niranjana-Vishwanathapura/drm-i915-vm_bind-Expose-vm-lookup-function/20230118-151845
        git checkout 251fbfd52586e3ff4677b44a136d08f9580d79e2
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/i915/i915_gem.c:181:43: error: no member named 'vm_capture_lock' in 'struct i915_address_space'
                   if (!mutex_lock_interruptible(&vma->vm->vm_capture_lock)) {
                                                  ~~~~~~~  ^
   include/linux/mutex.h:188:72: note: expanded from macro 'mutex_lock_interruptible'
   #define mutex_lock_interruptible(lock) mutex_lock_interruptible_nested(lock, 0)
                                                                          ^~~~
>> drivers/gpu/drm/i915/i915_gem.c:182:36: error: no member named 'vm_capture_link' in 'struct i915_vma'
                           sync_unbind = !list_empty(&vma->vm_capture_link);
                                                      ~~~  ^
   drivers/gpu/drm/i915/i915_gem.c:183:27: error: no member named 'vm_capture_lock' in 'struct i915_address_space'
                           mutex_unlock(&vma->vm->vm_capture_lock);
                                         ~~~~~~~  ^
   3 errors generated.


vim +181 drivers/gpu/drm/i915/i915_gem.c

   116	
   117	int i915_gem_object_unbind(struct drm_i915_gem_object *obj,
   118				   unsigned long flags)
   119	{
   120		struct intel_runtime_pm *rpm = &to_i915(obj->base.dev)->runtime_pm;
   121		bool vm_trylock = !!(flags & I915_GEM_OBJECT_UNBIND_VM_TRYLOCK);
   122		LIST_HEAD(still_in_list);
   123		intel_wakeref_t wakeref;
   124		struct i915_vma *vma;
   125		int ret;
   126	
   127		assert_object_held(obj);
   128	
   129		if (list_empty(&obj->vma.list))
   130			return 0;
   131	
   132		/*
   133		 * As some machines use ACPI to handle runtime-resume callbacks, and
   134		 * ACPI is quite kmalloc happy, we cannot resume beneath the vm->mutex
   135		 * as they are required by the shrinker. Ergo, we wake the device up
   136		 * first just in case.
   137		 */
   138		wakeref = intel_runtime_pm_get(rpm);
   139	
   140	try_again:
   141		ret = 0;
   142		spin_lock(&obj->vma.lock);
   143		while (!ret && (vma = list_first_entry_or_null(&obj->vma.list,
   144							       struct i915_vma,
   145							       obj_link))) {
   146			bool sync_unbind = true;
   147	
   148			list_move_tail(&vma->obj_link, &still_in_list);
   149			if (!i915_vma_is_bound(vma, I915_VMA_BIND_MASK))
   150				continue;
   151	
   152			if (flags & I915_GEM_OBJECT_UNBIND_TEST) {
   153				ret = -EBUSY;
   154				break;
   155			}
   156	
   157			/*
   158			 * Requiring the vm destructor to take the object lock
   159			 * before destroying a vma would help us eliminate the
   160			 * i915_vm_tryget() here, AND thus also the barrier stuff
   161			 * at the end. That's an easy fix, but sleeping locks in
   162			 * a kthread should generally be avoided.
   163			 */
   164			ret = -EAGAIN;
   165			if (!i915_vm_tryget(vma->vm))
   166				break;
   167	
   168			spin_unlock(&obj->vma.lock);
   169	
   170			/*
   171			 * Since i915_vma_parked() takes the object lock
   172			 * before vma destruction, it won't race us here,
   173			 * and destroy the vma from under us.
   174			 */
   175	
   176			/*
   177			 * Synchronously unbind persistent mappings with capture
   178			 * request so that vma->resource is valid in the error capture
   179			 * path without needing extra reference taking in execbuf path.
   180			 */
 > 181			if (!mutex_lock_interruptible(&vma->vm->vm_capture_lock)) {
 > 182				sync_unbind = !list_empty(&vma->vm_capture_link);
   183				mutex_unlock(&vma->vm->vm_capture_lock);
   184			}
   185	
   186			ret = -EBUSY;
   187			if (!sync_unbind && (flags & I915_GEM_OBJECT_UNBIND_ASYNC)) {
   188				assert_object_held(vma->obj);
   189				ret = i915_vma_unbind_async(vma, vm_trylock);
   190			}
   191	
   192			if (ret == -EBUSY && (flags & I915_GEM_OBJECT_UNBIND_ACTIVE ||
   193					      !i915_vma_is_active(vma))) {
   194				if (vm_trylock) {
   195					if (mutex_trylock(&vma->vm->mutex)) {
   196						ret = __i915_vma_unbind(vma);
   197						mutex_unlock(&vma->vm->mutex);
   198					}
   199				} else {
   200					ret = i915_vma_unbind(vma);
   201				}
   202			}
   203	
   204			i915_vm_put(vma->vm);
   205			spin_lock(&obj->vma.lock);
   206		}
   207		list_splice_init(&still_in_list, &obj->vma.list);
   208		spin_unlock(&obj->vma.lock);
   209	
   210		if (ret == -EAGAIN && flags & I915_GEM_OBJECT_UNBIND_BARRIER) {
   211			rcu_barrier(); /* flush the i915_vm_release() */
   212			goto try_again;
   213		}
   214	
   215		intel_runtime_pm_put(rpm, wakeref);
   216	
   217		return ret;
   218	}
   219	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
