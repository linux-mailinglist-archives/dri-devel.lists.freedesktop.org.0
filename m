Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DDD374A15D
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jul 2023 17:47:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5240410E3FC;
	Thu,  6 Jul 2023 15:47:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24D8710E3FC;
 Thu,  6 Jul 2023 15:47:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1688658448; x=1720194448;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=ocbIBN29I4iZA6yCvWMALcfNk2HqTMo1ZBwXX5GK3/Y=;
 b=eRB8bl3UajIn1YSv4nGq+flqZBnMNxj1q+pGalzRBv1mXr/JjlLmg6K7
 Yb3px1+AJzw2LjxABda1xJwCQQWnzAkv3taHBrFO8IYy5CNMBaYzXiuM/
 KU4wYTVHgnzUXnzhq0MXP6rSfZ41aLZTcV7HRm3smLXtgEmqgSnocvPQ7
 z3PV2TWUGLzknGw89Ki9NrVcMQnFKFQZaqCSjwUXp10/M46VpB7mYsNUI
 cEZ+4P064Fmev7kO1D0LPlW4mVhA4D5yncZSLoKbvnACqXCHQZA3oKDEk
 WUZHhbsd3xmSCXBeDCPPhVfeNM4Eyp76VldgySXlOes4Ox82htkgFo9CD Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10763"; a="348426255"
X-IronPort-AV: E=Sophos;i="6.01,185,1684825200"; d="scan'208";a="348426255"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2023 08:47:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10763"; a="784975797"
X-IronPort-AV: E=Sophos;i="6.01,185,1684825200"; d="scan'208";a="784975797"
Received: from dnatta1-mobl1.ger.corp.intel.com (HELO [10.213.201.247])
 ([10.213.201.247])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2023 08:47:08 -0700
Message-ID: <b5182784-acdc-0c4e-5c57-998ef93a7a17@linux.intel.com>
Date: Thu, 6 Jul 2023 16:47:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2] drm/i915: Refactor PAT/cache handling
Content-Language: en-US
To: "Yang, Fei" <fei.yang@intel.com>,
 "Intel-gfx@lists.freedesktop.org" <Intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
References: <20230629141509.3194090-1-tvrtko.ursulin@linux.intel.com>
 <BYAPR11MB256721AE29EBF133E60D7CD19A2AA@BYAPR11MB2567.namprd11.prod.outlook.com>
 <6fcb91a4-5e93-4964-e4b1-45bf965b0011@linux.intel.com>
 <BYAPR11MB2567F99FD5CFB3E709B2B3879A2EA@BYAPR11MB2567.namprd11.prod.outlook.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <BYAPR11MB2567F99FD5CFB3E709B2B3879A2EA@BYAPR11MB2567.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: "Ursulin, Tvrtko" <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 05/07/2023 01:09, Yang, Fei wrote:
>  >>> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>  >>>
>  >>> Informal commit message for now.
>  >>>
>  >>> I got a bit impatient and curious to see if the idea we discussed would
>  >>> work so sketched something out. I think it is what I was describing 
> back
>  >>> then..
>  >>>
>  >>> So high level idea is to teach the driver what caching modes are hidden
>  >>> behind PAT indices. Given you already had that in static tables, if we
>  >>> just turn the tables a bit around and add a driver abstraction of 
> caching
>  >>> modes this is what happens:
>  >>>
>  >>>  * We can lose the ugly runtime i915_gem_get_pat_index.
>  >>>
>  >>>  * We can have a smarter i915_gem_object_has_cache_level, which now can
>  >>>    use the above mentioned table to understand the caching modes and so
>  >>>    does not have to pessimistically return true for _any_ input 
> when user
>  >>>    has set the PAT index. This may improve things even for MTL.
>  >>>
>  >>>  * We can simplify the debugfs printout to be platform agnostic.
>  >>>
>  >>>  * We are perhaps opening the door to un-regress the dodgy addition
>  >>>    made to i915_gem_object_can_bypass_llc? See QQQ/FIXME in the patch.
>  >>>
>  >>> I hope I did not forget anything, but anyway, please have a read 
> and see
>  >>> what you think. I think it has potential.
>  >>>
>  >>> Proper commit message can come later.
>  >>>
>  >>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>  >>> Cc: Fei Yang <fei.yang@intel.com>
>  >>> ---
>  >>>  drivers/gpu/drm/i915/Makefile                 |   1 +
>  >>>  drivers/gpu/drm/i915/display/intel_dpt.c      |   2 +-
>  >>>  drivers/gpu/drm/i915/display/intel_fb_pin.c   |   2 +-
>  >>>  .../drm/i915/display/intel_plane_initial.c    |   4 +-
>  >>>  drivers/gpu/drm/i915/gem/i915_gem_domain.c    |  66 +++++-----
>  >>>  drivers/gpu/drm/i915/gem/i915_gem_domain.h    |   7 +-
>  >>>  .../gpu/drm/i915/gem/i915_gem_execbuffer.c    |  13 +-
>  >>>  drivers/gpu/drm/i915/gem/i915_gem_internal.c  |   6 +-
>  >>>  drivers/gpu/drm/i915/gem/i915_gem_mman.c      |  10 +-
>  >>>  drivers/gpu/drm/i915/gem/i915_gem_object.c    | 116 +++++++++--------
>  >>>  drivers/gpu/drm/i915/gem/i915_gem_object.h    |   9 +-
>  >>>  .../gpu/drm/i915/gem/i915_gem_object_types.h  | 117 +++---------------
>  >>>  drivers/gpu/drm/i915/gem/i915_gem_shmem.c     |  10 +-
>  >>>  drivers/gpu/drm/i915/gem/i915_gem_stolen.c    |  13 +-
>  >>>  drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c  |  43 ++++---
>  >>>  drivers/gpu/drm/i915/gem/i915_gem_userptr.c   |   2 +-
>  >>>  .../drm/i915/gem/selftests/huge_gem_object.c  |   6 +-
>  >>>  .../gpu/drm/i915/gem/selftests/huge_pages.c   |   8 +-
>  >>>  drivers/gpu/drm/i915/gt/gen6_ppgtt.c          |   4 +-
>  >>>  drivers/gpu/drm/i915/gt/gen8_ppgtt.c          |  19 +--
>  >>>  drivers/gpu/drm/i915/gt/intel_engine_cs.c     |   2 +-
>  >>>  drivers/gpu/drm/i915/gt/intel_ggtt.c          |  33 ++---
>  >>>  drivers/gpu/drm/i915/gt/intel_ggtt_gmch.c     |   4 +-
>  >>>  drivers/gpu/drm/i915/gt/intel_gtt.c           |   2 +-
>  >>>  drivers/gpu/drm/i915/gt/intel_gtt.h           |   3 +-
>  >>>  drivers/gpu/drm/i915/gt/intel_migrate.c       |  11 +-
>  >>>  drivers/gpu/drm/i915/gt/intel_ppgtt.c         |   6 +-
>  >>>  .../gpu/drm/i915/gt/intel_ring_submission.c   |   2 +-
>  >>>  drivers/gpu/drm/i915/gt/intel_timeline.c      |   2 +-
>  >>>  drivers/gpu/drm/i915/gt/selftest_hangcheck.c  |   2 +-
>  >>>  drivers/gpu/drm/i915/gt/selftest_migrate.c    |   9 +-
>  >>>  drivers/gpu/drm/i915/gt/selftest_reset.c      |  14 +--
>  >>>  drivers/gpu/drm/i915/gt/selftest_timeline.c   |   1 +
>  >>>  drivers/gpu/drm/i915/gt/selftest_tlb.c        |   5 +-
>  >>>  .../gpu/drm/i915/gt/selftest_workarounds.c    |   2 +-
>  >>>  drivers/gpu/drm/i915/gt/uc/intel_guc.c        |   2 +-
>  >>>  drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c      |   8 +-
>  >>>  drivers/gpu/drm/i915/i915_cache.c             |  72 +++++++++++
>  >>>  drivers/gpu/drm/i915/i915_cache.h             |  49 ++++++++
>  >>>  drivers/gpu/drm/i915/i915_debugfs.c           |  65 +++-------
>  >>>  drivers/gpu/drm/i915/i915_driver.c            |   5 +
>  >>>  drivers/gpu/drm/i915/i915_drv.h               |   3 +
>  >>>  drivers/gpu/drm/i915/i915_gem.c               |  21 +---
>  >>>  drivers/gpu/drm/i915/i915_gpu_error.c         |   7 +-
>  >>>  drivers/gpu/drm/i915/i915_pci.c               |  83 +++++++------
>  >>>  drivers/gpu/drm/i915/i915_perf.c              |   2 +-
>  >>>  drivers/gpu/drm/i915/intel_device_info.h      |   6 +-
>  >>>  drivers/gpu/drm/i915/selftests/i915_gem.c     |   5 +-
>  >>>  .../gpu/drm/i915/selftests/i915_gem_evict.c   |   8 +-
>  >>>  drivers/gpu/drm/i915/selftests/i915_gem_gtt.c |  13 +-
>  >>>  drivers/gpu/drm/i915/selftests/igt_spinner.c  |   2 +-
>  >>>  .../drm/i915/selftests/intel_memory_region.c  |   4 +-
>  >>>  .../gpu/drm/i915/selftests/mock_gem_device.c  |  12 +-
>  >>>  drivers/gpu/drm/i915/selftests/mock_region.c  |   2 +-
>  >>>  54 files changed, 440 insertions(+), 485 deletions(-)
>  >>>  create mode 100644 drivers/gpu/drm/i915/i915_cache.c
>  >>>  create mode 100644 drivers/gpu/drm/i915/i915_cache.h
>  >>>
>  >>> diff --git a/drivers/gpu/drm/i915/Makefile 
> b/drivers/gpu/drm/i915/Makefile
>  >>> index 2be9dd960540..2c3da8f0c78e 100644
>  >>> --- a/drivers/gpu/drm/i915/Makefile
>  >>> +++ b/drivers/gpu/drm/i915/Makefile
>  >>> @@ -30,6 +30,7 @@ subdir-ccflags-y += -I$(srctree)/$(src)
>  >>>  # core driver code
>  >>>  i915-y += i915_driver.o \
>  >>>            i915_drm_client.o \
>  >>> +         i915_cache.o \
>  >>>            i915_config.o \
>  >>>            i915_getparam.o \
>  >>>            i915_ioctl.o \
>  >>> diff --git a/drivers/gpu/drm/i915/display/intel_dpt.c 
> b/drivers/gpu/drm/i915/display/intel_dpt.c
>  >>> index 7c5fddb203ba..5baf0d27a288 100644
>  >>> --- a/drivers/gpu/drm/i915/display/intel_dpt.c
>  >>> +++ b/drivers/gpu/drm/i915/display/intel_dpt.c
>  >>> @@ -268,7 +268,7 @@ intel_dpt_create(struct intel_framebuffer *fb)
>  >>>
>  >>>          ret = i915_gem_object_lock_interruptible(dpt_obj, NULL);
>  >>>          if (!ret) {
>  >>> -               ret = i915_gem_object_set_cache_level(dpt_obj, 
> I915_CACHE_NONE);
>  >>> +               ret = i915_gem_object_set_cache(dpt_obj, 
> I915_CACHE(UC));
>  >>>                  i915_gem_object_unlock(dpt_obj);
>  >>>          }
>  >>>          if (ret) {
>  >>> diff --git a/drivers/gpu/drm/i915/display/intel_fb_pin.c 
> b/drivers/gpu/drm/i915/display/intel_fb_pin.c
>  >>> index fffd568070d4..dcf54b354a74 100644
>  >>> --- a/drivers/gpu/drm/i915/display/intel_fb_pin.c
>  >>> +++ b/drivers/gpu/drm/i915/display/intel_fb_pin.c
>  >>> @@ -66,7 +66,7 @@ intel_pin_fb_obj_dpt(struct drm_framebuffer *fb,
>  >>>                                  continue;
>  >>>                  }
>  >>>
>  >>> -               ret = i915_gem_object_set_cache_level(obj, 
> I915_CACHE_NONE);
>  >>> +               ret = i915_gem_object_set_cache(obj, I915_CACHE(UC));
>  >>>                  if (ret)
>  >>>                          continue;
>  >>>
>  >>> diff --git a/drivers/gpu/drm/i915/display/intel_plane_initial.c 
> b/drivers/gpu/drm/i915/display/intel_plane_initial.c
>  >>> index 736072a8b2b0..9988f6562392 100644
>  >>> --- a/drivers/gpu/drm/i915/display/intel_plane_initial.c
>  >>> +++ b/drivers/gpu/drm/i915/display/intel_plane_initial.c
>  >>> @@ -121,8 +121,8 @@ initial_plane_vma(struct drm_i915_private *i915,
>  >>>           * cache_level during fbdev initialization. The
>  >>>           * unbind there would get stuck waiting for rcu.
>  >>>           */
>  >>> -       i915_gem_object_set_cache_coherency(obj, HAS_WT(i915) ?
>  >>> -                                           I915_CACHE_WT : 
> I915_CACHE_NONE);
>  >>> +       i915_gem_object_set_cache_coherency(obj, HAS_WT(i915) ? 
> I915_CACHE(WT) :
>  >>> +                                                               
> I915_CACHE(UC));
>  >>>
>  >>>          switch (plane_config->tiling) {
>  >>>          case I915_TILING_NONE:
>  >>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_domain.c 
> b/drivers/gpu/drm/i915/gem/i915_gem_domain.c
>  >>> index dfaaa8b66ac3..f899da2c622a 100644
>  >>> --- a/drivers/gpu/drm/i915/gem/i915_gem_domain.c
>  >>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_domain.c
>  >>> @@ -8,6 +8,7 @@
>  >>>  #include "display/intel_frontbuffer.h"
>  >>>  #include "gt/intel_gt.h"
>  >>>
>  >>> +#include "i915_cache.h"
>  >>>  #include "i915_drv.h"
>  >>>  #include "i915_gem_clflush.h"
>  >>>  #include "i915_gem_domain.h"
>  >>> @@ -27,15 +28,8 @@ static bool gpu_write_needs_clflush(struct 
> drm_i915_gem_object *obj)
>  >>>          if (IS_DGFX(i915))
>  >>>                  return false;
>  >>>
>  >>> -       /*
>  >>> -        * For objects created by userspace through GEM_CREATE with 
> pat_index
>  >>> -        * set by set_pat extension, 
> i915_gem_object_has_cache_level() will
>  >>> -        * always return true, because the coherency of such object 
> is managed
>  >>> -        * by userspace. Othereise the call here would fall back to 
> checking
>  >>> -        * whether the object is un-cached or write-through.
>  >>> -        */
>  >>> -       return !(i915_gem_object_has_cache_level(obj, 
> I915_CACHE_NONE) ||
>  >>> -                i915_gem_object_has_cache_level(obj, I915_CACHE_WT));
>  >>> +       return i915_gem_object_has_cache_mode(obj, 
> I915_CACHE_MODE_UC) != 1 &&
>  >>> +              i915_gem_object_has_cache_mode(obj, 
> I915_CACHE_MODE_WT) != 1;
>  >>
>  >> This logic was changed for objects with pat index set by user here. It
>  >> used to return false
>  >> regardless the cache mode. But now it returns true if its cache mode is
>  >> neither UC nor WT.
>  >
>  > Yes, that was half of the motivation of the refactory. Before the PAT 
> index series code was like this:
>  >
>  >        return !(obj->cache_level == I915_CACHE_NONE ||
>  >                 obj->cache_level == I915_CACHE_WT);
>  >
>  > So kernel knew it needs to flush only if caching mode is neither UC 
> or WT. With the PAT index series you changed it to:
>  >
>  >        return !(i915_gem_object_has_cache_level(obj, I915_CACHE_NONE) ||
>  >                 i915_gem_object_has_cache_level(obj, I915_CACHE_WT));
>  >
>  > And as i915_gem_object_has_cache_level was changed to always return 
> true if PAT was set by user, that made the check meaningless for such 
> objects.
> 
> But the point is that the KMD should not flush the cache for objects with
> PAT set by user because UMD is handling the cache conherency. That is the
> design. Well doing so wouldn't cause functional issue, but it's unecessary
> and might have performance impact.

Not all i915_gem_object_has_cache_level() are even about flushing the 
cache and if the kernel doesn't know what is behind a PAT index 
(i915_gem_object_has_cache_level lies by always returning true) are we 
100% sure everything is functionally correct?

flush_write_domain() for instance uses it to determine whether to set 
obj->cache_dirty after GPU activity. How does the UMD manage that?

Then use_cpu_reloc(). Another pointless/misleading question.

Finally vm_fault_gtt() rejects access based on it.

Perhaps the question is moot since the set pat extension is restricted 
to MTL so some other conditions used in the above checks, like HAS_LLC 
and such, make for no practical difference. Even if so, what if the 
extension was allowed on other platforms as it was the plan until it was 
discovered there is no userspace code for other platforms. Would the 
plan work on all platforms? And even if it would I think the 
implementation is very non-obvious.

>  > With my refactoring it becomes meaningful again and restores to the 
> original behaviour. That's the intent at least.
>  >
>  >>>  bool i915_gem_cpu_write_needs_clflush(struct drm_i915_gem_object *obj)
>  >>> @@ -255,9 +249,9 @@ i915_gem_object_set_to_gtt_domain(struct 
> drm_i915_gem_object *obj, bool write)
>  >>>  }
>  >>>
>  >>>  /**
>  >>> - * i915_gem_object_set_cache_level - Changes the cache-level of an 
> object across all VMA.
>  >>> + * i915_gem_object_set_cache - Changes the cache-level of an 
> object across all VMA.
>  >>>   * @obj: object to act on
>  >>> - * @cache_level: new cache level to set for the object
>  >>> + * @cache: new caching mode to set for the object
>  >>>   *
>  >>>   * After this function returns, the object will be in the new 
> cache-level
>  >>>   * across all GTT and the contents of the backing storage will be 
> coherent,
>  >>> @@ -269,19 +263,28 @@ i915_gem_object_set_to_gtt_domain(struct 
> drm_i915_gem_object *obj, bool write)
>  >>>   * cache coherency) and all non-MOCS GPU access will also be 
> uncached so
>  >>>   * that all direct access to the scanout remains coherent.
>  >>>   */
>  >>> -int i915_gem_object_set_cache_level(struct drm_i915_gem_object *obj,
>  >>> -                                   enum i915_cache_level cache_level)
>  >>> +int i915_gem_object_set_cache(struct drm_i915_gem_object *obj,
>  >>> +                             i915_cache_t cache)
>  >>>  {
>  >>> +       struct drm_i915_private *i915 = to_i915(obj->base.dev);
>  >>>          int ret;
>  >>>
>  >>> -       /*
>  >>> -        * For objects created by userspace through GEM_CREATE with 
> pat_index
>  >>> -        * set by set_pat extension, simply return 0 here without 
> touching
>  >>> -        * the cache setting, because such objects should have an 
> immutable
>  >>> -        * cache setting by desgin and always managed by userspace.
>  >>> -        */
>  >>> -       if (i915_gem_object_has_cache_level(obj, cache_level))
>  >>> +       ret = i915_cache_find_pat(i915, cache);
>  >>> +       if (ret < 0) {
>  >>> +               struct drm_printer p =
>  >>> +                       drm_err_printer("Attempting to use unknown 
> caching mode ");
>  >>> +
>  >>> +               i915_cache_print(&p, cache);
>  >>> +               drm_puts(&p, "!\n");
>  >>> +
>  >>> +               return -EINVAL;
>  >>> +       } else if (ret == obj->pat_index) {
>  >>>                  return 0;
>  >>
>  >> We will have to do this conversion and checking again later in this
>  >> function when calling i915_gem_object_set_cache_coherency().
>  >
>  > Yes the double lookup part is a bit naff. It is not super required
>  > apart for validating internal callers (could be a debug build only
>  > feature perhaps) and to see if PAT index has changed and so whether
>  > it needs to call i915_gem_object_wait before proceeding to
>  > i915_gem_object_set_cache_coherency...
>  >
>  >> My thought was to simply remove the use of cache_level/cache and replace
>  >> it with pat_idex. Conversion from cache modes to pat index should be 
> done
>  >> before calling any function used to consume cache_level/cache.
>  >
>  > ... I could probably call the setter which takes PAT index instead of
>  > i915_gem_object_set_cache_coherency few lines below. That would skip the
>  > double lookup and make you happy(-ier)?
> 
> Do you see any problem just letting these functions take pat_index as the
> second argument? These functions are currently called with a constant
> cache_level/mode, if we have INTEL_INFO(i915)->pat_uc/wt/wb set properly,
> using pat index makes no difference, right?

Which ones?

> 
>  >>
>  >>> +       } else if (obj->pat_set_by_user) {
>  >>
>  >> Shouldn't this if-statement be placed at the beginning of this function?
>  >> the original
>  >> i915_gem_object_has_cache_level() would return true if
>  >> (obj->pat_set_by_user), so the
>  >> function returns right away.
>  >>
>  >>> +               drm_notice_once(&i915->drm,
>  >>> +                               "Attempting to change caching mode 
> on an object with fixed PAT!\n");
>  >>> +               return -EINVAL;
>  >>> +       }
>  >>>
>  >>>          ret = i915_gem_object_wait(obj,
>  >>>                                     I915_WAIT_INTERRUPTIBLE |
>  >>> @@ -291,7 +294,7 @@ int i915_gem_object_set_cache_level(struct 
> drm_i915_gem_object *obj,
>  >>>                  return ret;
>  >>>
>  >>>          /* Always invalidate stale cachelines */
>  >>> -       i915_gem_object_set_cache_coherency(obj, cache_level);
>  >>> +       i915_gem_object_set_cache_coherency(obj, cache);
>  >>>          obj->cache_dirty = true;
>  >>>
>  >>>          /* The cache-level will be applied when each vma is 
> rebound. */
>  >>> @@ -326,10 +329,9 @@ int i915_gem_get_caching_ioctl(struct 
> drm_device *dev, void *data,
>  >>>                  goto out;
>  >>>          }
>  >>>
>  >>> -       if (i915_gem_object_has_cache_level(obj, I915_CACHE_LLC) ||
>  >>> -           i915_gem_object_has_cache_level(obj, I915_CACHE_L3_LLC))
>  >>> +       if (i915_gem_object_has_cache_mode(obj, I915_CACHE_MODE_WB))
>  >>
>  >> This looks wrong, at least for MTL. Prior to MTL the GPU 
> automatically snoop
>  >> CPU cache, but from MTL onward you have to specify if WB or WB + 1-WAY
>  >> COH is needed. And for KMD, cacheable mode means WB + 1-WAY COH for 
> MTL to keep the
>  >> behavior consistent.
>  >>
>  >> This used to be taken care of by i915_gem_get_pat_index() call. With
>  >> that being replaced by i915_cache_find_pat(), you would need to do 
> something there.
>  >> But, without cachelevel_to_pat[], you might end up hard coding something
>  >> directly in the function, and that is platform dependent. hmm..., I 
> don't really
>  >> like this idea.
>  >>
>  >> That's why I commented in v1 that we should use 
> INTEL_INFO(i915)->pat_uc/wb/wt
>  >> instead of enum i915_cache_level or i915_cache_t.
>  >
>  > I think I get it. I hope so.. So if I made the tables like this:
>  >
>  > #define LEGACY_CACHE_MODES \
>  >        .cache_modes = { \
>  >                [0] = I915_CACHE(UC), \
>  >                [1] = _I915_CACHE(WB, COH1W), \
>  >                [2] = _I915_CACHE(WB, COH1W | L3), \ // 2way??
>  >                [3] = I915_CACHE(WT), \
>  >         }
>  >
>  > #define GEN12_CACHE_MODES \
>  >        .cache_modes = { \
>  >                [0] = _I915_CACHE(WB, COH1W), \
>  >                [1] = I915_CACHE(WC), \
>  >                [2] = I915_CACHE(WT), \
>  >                [3] = I915_CACHE(UC), \
>  >         }
>  >
>  > #define MTL_CACHE_MODES \
>  >        .cache_modes = { \
>  >                [0] = _I915_CACHE(WB, COH1W), \

This was a brain fart, should have just been WB.

>  >                [1] = I915_CACHE(WT), \
>  >                [2] = I915_CACHE(UC), \
>  >                [3] = _I915_CACHE(WB, COH1W), \
>  >                [4] = _I915_CACHE(WB, COH2W), \
>  >
>  > And made i915->pat_wc look up _I915_CACHE(WB, COH1W) would that work?
>  > Hmm and also all "has cache level" call sites would need to look not just
>  > for WB but WB+COH1W.
>  >
>  > Would it work? Too ugly?
> 
> I don't think this would work. The cache_modes needs to be aligned with 
> BSpec,
> otherwise checkings for INTEL_INFO(i915)->cache_modes[obj->pat_index] might
> become invalid. Also, COH1W/2W were not even there for platforms prior 
> to MTL.

Not sure what would become invalid? COH1W/2W are perhaps names 
associated with MTL - but is Gen12 PAT 0 identical in behaviour to PAT 3 
or PAT 4 on MTL? If yes then we can introduce an i915 specific name for 
that coherency mode and apply it to both platforms.

> I still think setting INTEL_INFO(i915)->pat_uc/wt/wb is the best solution.
> With that we can also eliminate the use of I915_CACHE({UC|WT|WB}).

How for the call sites which are asking about caching mode 
characteristics? We can't ask if something has PAT index X from the 
source code since that is platform dependent.

>  >>
>  >>>                  args->caching = I915_CACHING_CACHED;
>  >>> -       else if (i915_gem_object_has_cache_level(obj, I915_CACHE_WT))
>  >>> +       else if (i915_gem_object_has_cache_mode(obj, 
> I915_CACHE_MODE_WT))
>  >>>                  args->caching = I915_CACHING_DISPLAY;
>  >>>          else
>  >>>                  args->caching = I915_CACHING_NONE;
>  >>> @@ -344,7 +346,7 @@ int i915_gem_set_caching_ioctl(struct 
> drm_device *dev, void *data,
>  >>>          struct drm_i915_private *i915 = to_i915(dev);
>  >>>          struct drm_i915_gem_caching *args = data;
>  >>>          struct drm_i915_gem_object *obj;
>  >>> -       enum i915_cache_level level;
>  >>> +       i915_cache_t cache;
>  >>>          int ret = 0;
>  >>>
>  >>>          if (IS_DGFX(i915))
>  >>> @@ -355,7 +357,7 @@ int i915_gem_set_caching_ioctl(struct 
> drm_device *dev, void *data,
>  >>>
>  >>>          switch (args->caching) {
>  >>>          case I915_CACHING_NONE:
>  >>> -               level = I915_CACHE_NONE;
>  >>> +               cache = I915_CACHE(UC);
>  >>
>  >> For code like this, my thought was
>  >>
>  >> -               level = I915_CACHE_NONE;
>  >> +               pat_index = INTEL_INFO(i915)->pat_uc;
>  >>
>  >> And later the set_cache call should take pat_index as argument instead
>  >> of cache mode.
>  >>
>  >>>                  break;
>  >>>          case I915_CACHING_CACHED:
>  >>>                  /*
>  >>> @@ -367,10 +369,10 @@ int i915_gem_set_caching_ioctl(struct 
> drm_device *dev, void *data,
>  >>>                  if (!HAS_LLC(i915) && !HAS_SNOOP(i915))
>  >>>                          return -ENODEV;
>  >>>
>  >>> -               level = I915_CACHE_LLC;
>  >>> +               cache = I915_CACHE(WB);
>  >>
>  >> -               level = I915_CACHE_LLC;
>  >> +               pat_index = INTEL_INFO(i915)->pat_wb;
>  >>
>  >> This should take care of the WB + 1-WAY COH issue for MTL mentioned 
> above,
>  >> assuming the i915_cache_init() set pat_wb properly, and the
>  >> i915_gem_object_set_cache() consumes pat_index instead of cache mode.
>  >
>  > That works too yes.
>  >
>  >>
>  >>>                  break;
>  >>>          case I915_CACHING_DISPLAY:
>  >>> -               level = HAS_WT(i915) ? I915_CACHE_WT : I915_CACHE_NONE;
>  >>> +               cache = HAS_WT(i915) ? I915_CACHE(WT) : I915_CACHE(UC);
>  >>>                  break;
>  >>>          default:
>  >>>                  return -EINVAL;
>  >>> @@ -409,7 +411,7 @@ int i915_gem_set_caching_ioctl(struct 
> drm_device *dev, void *data,
>  >>>          if (ret)
>  >>>                  goto out;
>  >>>
>  >>> -       ret = i915_gem_object_set_cache_level(obj, level);
>  >>> +       ret = i915_gem_object_set_cache(obj, cache);
>  >>>          i915_gem_object_unlock(obj);
>  >>>
>  >>>  out:
>  >>> @@ -448,9 +450,9 @@ i915_gem_object_pin_to_display_plane(struct 
> drm_i915_gem_object *obj,
>  >>>           * of uncaching, which would allow us to flush all the 
> LLC-cached data
>  >>>           * with that bit in the PTE to main memory with just one 
> PIPE_CONTROL.
>  >>>           */
>  >>> -       ret = i915_gem_object_set_cache_level(obj,
>  >>> -                                             HAS_WT(i915) ?
>  >>> -                                             I915_CACHE_WT : 
> I915_CACHE_NONE);
>  >>> +       ret = i915_gem_object_set_cache(obj,
>  >>> +                                       HAS_WT(i915) ?
>  >>> +                                       I915_CACHE(WT) : 
> I915_CACHE(UC));
>  >>>          if (ret)
>  >>>                  return ERR_PTR(ret);
>  >>>
> 
> [...]
> 
>  >>>
>  >>>  bool i915_gem_object_can_bypass_llc(struct drm_i915_gem_object *obj)
>  >>> @@ -215,6 +222,7 @@ bool i915_gem_object_can_bypass_llc(struct 
> drm_i915_gem_object *obj)
>  >>>          /*
>  >>>           * Always flush cache for UMD objects at creation time.
>  >>>           */
>  >>> +       /* QQQ/FIXME why? avoidable performance penalty? */
> 
> This is needed because UMD's assume zero-initialized BO's are really 
> zero'ed out
> before getting the handles to the BO's (See VLK-46522). Otherwise UMD's 
> could read
> stale data, thus cause security issues.

Hah this comes exactly to my point from above. So it looks my propsal 
would exactly solve this. Because i915 would know the caching mode and 
know to flush if not coherent. And it would be better than flushing for 
every obj->pat_set_by_user because that approach pessimistically flushes 
even when it is not needed.

Regards,

Tvrtko

> 
>  >>>          if (obj->pat_set_by_user)
>  >>>                  return true;
>  >>>
> 
> [...]
> 
>  >>> diff --git a/drivers/gpu/drm/i915/intel_device_info.h 
> b/drivers/gpu/drm/i915/intel_device_info.h
>  >>> index dbfe6443457b..f48a21895a85 100644
>  >>> --- a/drivers/gpu/drm/i915/intel_device_info.h
>  >>> +++ b/drivers/gpu/drm/i915/intel_device_info.h
>  >>> @@ -27,6 +27,8 @@
>  >>>
>  >>>  #include <uapi/drm/i915_drm.h>
>  >>>
>  >>> +#include "i915_cache.h"
>  >>> +
>  >>>  #include "intel_step.h"
>  >>>
>  >>>  #include "gt/intel_engine_types.h"
>  >>> @@ -243,8 +245,8 @@ struct intel_device_info {
>  >>>           */
>  >>>          const struct intel_runtime_info __runtime;
>  >>>
>  >>> -       u32 cachelevel_to_pat[I915_MAX_CACHE_LEVEL];
>  >>> -       u32 max_pat_index;
>  >>> +       i915_cache_t cache_modes[9];
>  >>
>  >> I was commenting on the array size here. It's probably better to 
> make it 16
>  >> because there are 4 PAT index bits defined in the PTE. Indices above
>  >> max_pat_index
>  >> are not used, but theoretically new mode could be added. Well, it's up
>  >> to you,
>  >> not likely to happen anyway.
>  >
>  > Ah okay. I am not too concerned. Compiler will let us know if it happens.
>  >
>  > Unrelated to this comment - what about i915_gem_object_can_bypass_llc?
>  > Could we do better (less pessimistic) with something like my approach and
>  > so maybe penalize MTL less?
> 
> The problem is that, for the BO's managed by UMD's, the KMD doesn't know
> whether they are going to be mapped as cacheable or uncacheable on the CPU
> side. The PAT index controls GPU access only. That's why we make sure all
> BO's with PAT set by UMD (which means UMD will take control and managing the
> coherency) are clflush'ed.
> 
> -Fei
> 
>  > Regards,
>  >
>  > Tvrtko
> 
