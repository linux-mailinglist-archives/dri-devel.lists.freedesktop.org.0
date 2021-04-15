Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5972536042C
	for <lists+dri-devel@lfdr.de>; Thu, 15 Apr 2021 10:21:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C15EE6E4F3;
	Thu, 15 Apr 2021 08:21:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CFC76E4EA;
 Thu, 15 Apr 2021 08:21:00 +0000 (UTC)
IronPort-SDR: 8Moi1cVa+sBmwM9JnS3GMgdDxQRRI1D9fMK4/ZhM6xUQ4cnkKmEOwm2mRA0E+aPnIJBKEGtb+N
 nzbnPDj3cKLA==
X-IronPort-AV: E=McAfee;i="6200,9189,9954"; a="194373678"
X-IronPort-AV: E=Sophos;i="5.82,223,1613462400"; d="scan'208";a="194373678"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2021 01:20:52 -0700
IronPort-SDR: FGYvNIvGL+X7lZMMxvq++0/s+FCisoY9n7yQaWxQhxVXjzcD4xUF8WehN3BHQsbDT/OZNbzku+
 uWIGe7q8BC5w==
X-IronPort-AV: E=Sophos;i="5.82,223,1613462400"; d="scan'208";a="425089554"
Received: from annelyon-mobl2.ger.corp.intel.com (HELO [10.213.207.39])
 ([10.213.207.39])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2021 01:20:51 -0700
Subject: Re: [Intel-gfx] [PATCH 11/19] drm/i915: Update the helper to set
 correct mapping
To: Matthew Auld <matthew.william.auld@gmail.com>
References: <20210412090526.30547-1-matthew.auld@intel.com>
 <20210412090526.30547-12-matthew.auld@intel.com>
 <7bc2a663-fbc0-6486-341a-7dca980c2440@linux.intel.com>
 <CAM0jSHNhWcscW9txPDyKActTiTWjzhASJb5xC8XPzHeN+Y18QA@mail.gmail.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
Message-ID: <9aca524c-3710-dfaa-bfec-aef76aee7b26@linux.intel.com>
Date: Thu, 15 Apr 2021 09:20:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <CAM0jSHNhWcscW9txPDyKActTiTWjzhASJb5xC8XPzHeN+Y18QA@mail.gmail.com>
Content-Language: en-US
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
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Matthew Auld <matthew.auld@intel.com>,
 ML dri-devel <dri-devel@lists.freedesktop.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 14/04/2021 17:20, Matthew Auld wrote:
> On Wed, 14 Apr 2021 at 16:22, Tvrtko Ursulin
> <tvrtko.ursulin@linux.intel.com> wrote:
>>
>>
>> On 12/04/2021 10:05, Matthew Auld wrote:
>>> From: Venkata Sandeep Dhanalakota <venkata.s.dhanalakota@intel.com>
>>>
>>> Determine the possible coherent map type based on object location,
>>> and if target has llc or if user requires an always coherent
>>> mapping.
>>>
>>> Cc: Matthew Auld <matthew.auld@intel.com>
>>> Cc: CQ Tang <cq.tang@intel.com>
>>> Suggested-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>>> Signed-off-by: Venkata Sandeep Dhanalakota <venkata.s.dhanalakota@intel.com>
>>> ---
>>>    drivers/gpu/drm/i915/gt/intel_engine_cs.c    |  3 ++-
>>>    drivers/gpu/drm/i915/gt/intel_engine_pm.c    |  2 +-
>>>    drivers/gpu/drm/i915/gt/intel_lrc.c          |  4 +++-
>>>    drivers/gpu/drm/i915/gt/intel_ring.c         |  9 ++++++---
>>>    drivers/gpu/drm/i915/gt/selftest_context.c   |  3 ++-
>>>    drivers/gpu/drm/i915/gt/selftest_hangcheck.c |  4 ++--
>>>    drivers/gpu/drm/i915/gt/selftest_lrc.c       |  4 +++-
>>>    drivers/gpu/drm/i915/gt/uc/intel_guc.c       |  4 +++-
>>>    drivers/gpu/drm/i915/gt/uc/intel_huc.c       |  4 +++-
>>>    drivers/gpu/drm/i915/i915_drv.h              | 11 +++++++++--
>>>    drivers/gpu/drm/i915/selftests/igt_spinner.c |  4 ++--
>>>    11 files changed, 36 insertions(+), 16 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/i915/gt/intel_engine_cs.c b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
>>> index efe935f80c1a..b79568d370f5 100644
>>> --- a/drivers/gpu/drm/i915/gt/intel_engine_cs.c
>>> +++ b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
>>> @@ -664,7 +664,8 @@ static int init_status_page(struct intel_engine_cs *engine)
>>>        if (ret)
>>>                goto err;
>>>
>>> -     vaddr = i915_gem_object_pin_map(obj, I915_MAP_WB);
>>> +     vaddr = i915_gem_object_pin_map(obj,
>>> +                                     i915_coherent_map_type(engine->i915, obj, true));
>>>        if (IS_ERR(vaddr)) {
>>>                ret = PTR_ERR(vaddr);
>>>                goto err_unpin;
>>> diff --git a/drivers/gpu/drm/i915/gt/intel_engine_pm.c b/drivers/gpu/drm/i915/gt/intel_engine_pm.c
>>> index 7c9af86fdb1e..47f4397095e5 100644
>>> --- a/drivers/gpu/drm/i915/gt/intel_engine_pm.c
>>> +++ b/drivers/gpu/drm/i915/gt/intel_engine_pm.c
>>> @@ -23,7 +23,7 @@ static void dbg_poison_ce(struct intel_context *ce)
>>>
>>>        if (ce->state) {
>>>                struct drm_i915_gem_object *obj = ce->state->obj;
>>> -             int type = i915_coherent_map_type(ce->engine->i915);
>>> +             int type = i915_coherent_map_type(ce->engine->i915, obj, true);
>>>                void *map;
>>>
>>>                if (!i915_gem_object_trylock(obj))
>>> diff --git a/drivers/gpu/drm/i915/gt/intel_lrc.c b/drivers/gpu/drm/i915/gt/intel_lrc.c
>>> index e86897cde984..aafe2a4df496 100644
>>> --- a/drivers/gpu/drm/i915/gt/intel_lrc.c
>>> +++ b/drivers/gpu/drm/i915/gt/intel_lrc.c
>>> @@ -903,7 +903,9 @@ lrc_pre_pin(struct intel_context *ce,
>>>        GEM_BUG_ON(!i915_vma_is_pinned(ce->state));
>>>
>>>        *vaddr = i915_gem_object_pin_map(ce->state->obj,
>>> -                                      i915_coherent_map_type(ce->engine->i915) |
>>> +                                      i915_coherent_map_type(ce->engine->i915,
>>> +                                                             ce->state->obj,
>>> +                                                             false) |
>>>                                         I915_MAP_OVERRIDE);
>>>
>>>        return PTR_ERR_OR_ZERO(*vaddr);
>>> diff --git a/drivers/gpu/drm/i915/gt/intel_ring.c b/drivers/gpu/drm/i915/gt/intel_ring.c
>>> index aee0a77c77e0..3cf6c7e68108 100644
>>> --- a/drivers/gpu/drm/i915/gt/intel_ring.c
>>> +++ b/drivers/gpu/drm/i915/gt/intel_ring.c
>>> @@ -53,9 +53,12 @@ int intel_ring_pin(struct intel_ring *ring, struct i915_gem_ww_ctx *ww)
>>>
>>>        if (i915_vma_is_map_and_fenceable(vma))
>>>                addr = (void __force *)i915_vma_pin_iomap(vma);
>>> -     else
>>> -             addr = i915_gem_object_pin_map(vma->obj,
>>> -                                            i915_coherent_map_type(vma->vm->i915));
>>> +     else {
>>> +             int type = i915_coherent_map_type(vma->vm->i915, vma->obj, false);
>>> +
>>> +             addr = i915_gem_object_pin_map(vma->obj, type);
>>> +     }
>>> +
>>>        if (IS_ERR(addr)) {
>>>                ret = PTR_ERR(addr);
>>>                goto err_ring;
>>> diff --git a/drivers/gpu/drm/i915/gt/selftest_context.c b/drivers/gpu/drm/i915/gt/selftest_context.c
>>> index b9bdd1d23243..26685b927169 100644
>>> --- a/drivers/gpu/drm/i915/gt/selftest_context.c
>>> +++ b/drivers/gpu/drm/i915/gt/selftest_context.c
>>> @@ -88,7 +88,8 @@ static int __live_context_size(struct intel_engine_cs *engine)
>>>                goto err;
>>>
>>>        vaddr = i915_gem_object_pin_map_unlocked(ce->state->obj,
>>> -                                              i915_coherent_map_type(engine->i915));
>>> +                                              i915_coherent_map_type(engine->i915,
>>> +                                                                     ce->state->obj, false));
>>>        if (IS_ERR(vaddr)) {
>>>                err = PTR_ERR(vaddr);
>>>                intel_context_unpin(ce);
>>> diff --git a/drivers/gpu/drm/i915/gt/selftest_hangcheck.c b/drivers/gpu/drm/i915/gt/selftest_hangcheck.c
>>> index 746985971c3a..5b63d4df8c93 100644
>>> --- a/drivers/gpu/drm/i915/gt/selftest_hangcheck.c
>>> +++ b/drivers/gpu/drm/i915/gt/selftest_hangcheck.c
>>> @@ -69,7 +69,7 @@ static int hang_init(struct hang *h, struct intel_gt *gt)
>>>        h->seqno = memset(vaddr, 0xff, PAGE_SIZE);
>>>
>>>        vaddr = i915_gem_object_pin_map_unlocked(h->obj,
>>> -                                              i915_coherent_map_type(gt->i915));
>>> +                                              i915_coherent_map_type(gt->i915, h->obj, false));
>>>        if (IS_ERR(vaddr)) {
>>>                err = PTR_ERR(vaddr);
>>>                goto err_unpin_hws;
>>> @@ -130,7 +130,7 @@ hang_create_request(struct hang *h, struct intel_engine_cs *engine)
>>>                return ERR_CAST(obj);
>>>        }
>>>
>>> -     vaddr = i915_gem_object_pin_map_unlocked(obj, i915_coherent_map_type(gt->i915));
>>> +     vaddr = i915_gem_object_pin_map_unlocked(obj, i915_coherent_map_type(gt->i915, obj, false));
>>>        if (IS_ERR(vaddr)) {
>>>                i915_gem_object_put(obj);
>>>                i915_vm_put(vm);
>>> diff --git a/drivers/gpu/drm/i915/gt/selftest_lrc.c b/drivers/gpu/drm/i915/gt/selftest_lrc.c
>>> index 85e7df6a5123..d8f6623524e8 100644
>>> --- a/drivers/gpu/drm/i915/gt/selftest_lrc.c
>>> +++ b/drivers/gpu/drm/i915/gt/selftest_lrc.c
>>> @@ -1221,7 +1221,9 @@ static int compare_isolation(struct intel_engine_cs *engine,
>>>        }
>>>
>>>        lrc = i915_gem_object_pin_map_unlocked(ce->state->obj,
>>> -                                   i915_coherent_map_type(engine->i915));
>>> +                                            i915_coherent_map_type(engine->i915,
>>> +                                                                   ce->state->obj,
>>> +                                                                   false));
>>>        if (IS_ERR(lrc)) {
>>>                err = PTR_ERR(lrc);
>>>                goto err_B1;
>>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
>>> index 78305b2ec89d..adae04c47aab 100644
>>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc.c
>>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
>>> @@ -682,7 +682,9 @@ int intel_guc_allocate_and_map_vma(struct intel_guc *guc, u32 size,
>>>        if (IS_ERR(vma))
>>>                return PTR_ERR(vma);
>>>
>>> -     vaddr = i915_gem_object_pin_map_unlocked(vma->obj, I915_MAP_WB);
>>> +     vaddr = i915_gem_object_pin_map_unlocked(vma->obj,
>>> +                                              i915_coherent_map_type(guc_to_gt(guc)->i915,
>>> +                                                                     vma->obj, true));
>>>        if (IS_ERR(vaddr)) {
>>>                i915_vma_unpin_and_release(&vma, 0);
>>>                return PTR_ERR(vaddr);
>>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_huc.c b/drivers/gpu/drm/i915/gt/uc/intel_huc.c
>>> index 2126dd81ac38..56d2144dc6a0 100644
>>> --- a/drivers/gpu/drm/i915/gt/uc/intel_huc.c
>>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_huc.c
>>> @@ -82,7 +82,9 @@ static int intel_huc_rsa_data_create(struct intel_huc *huc)
>>>        if (IS_ERR(vma))
>>>                return PTR_ERR(vma);
>>>
>>> -     vaddr = i915_gem_object_pin_map_unlocked(vma->obj, I915_MAP_WB);
>>> +     vaddr = i915_gem_object_pin_map_unlocked(vma->obj,
>>> +                                              i915_coherent_map_type(gt->i915,
>>> +                                                                     vma->obj, true));
>>>        if (IS_ERR(vaddr)) {
>>>                i915_vma_unpin_and_release(&vma, 0);
>>>                return PTR_ERR(vaddr);
>>> diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
>>> index 69e43bf91a15..2abbc06712a4 100644
>>> --- a/drivers/gpu/drm/i915/i915_drv.h
>>> +++ b/drivers/gpu/drm/i915/i915_drv.h
>>> @@ -78,6 +78,7 @@
>>>    #include "gem/i915_gem_context_types.h"
>>>    #include "gem/i915_gem_shrinker.h"
>>>    #include "gem/i915_gem_stolen.h"
>>> +#include "gem/i915_gem_lmem.h"
>>>
>>>    #include "gt/intel_engine.h"
>>>    #include "gt/intel_gt_types.h"
>>> @@ -1921,9 +1922,15 @@ static inline int intel_hws_csb_write_index(struct drm_i915_private *i915)
>>>    }
>>>
>>>    static inline enum i915_map_type
>>> -i915_coherent_map_type(struct drm_i915_private *i915)
>>> +i915_coherent_map_type(struct drm_i915_private *i915,
>>> +                    struct drm_i915_gem_object *obj, bool always_coherent)
>>>    {
>>> -     return HAS_LLC(i915) ? I915_MAP_WB : I915_MAP_WC;
>>> +     if (i915_gem_object_is_lmem(obj))
>>> +             return I915_MAP_WC;
>>> +     if (HAS_LLC(i915) || always_coherent)
>>> +             return I915_MAP_WB;
>>> +     else
>>> +             return I915_MAP_WC;
>>
>> Seems this patch is doing two things.
>>
>> First it is adding lmem support to this helper by always returning WC
>> for lmem objects.
>>
>> Secondly it is introducing an idea of "always coherent" in a helper
>> called i915_coherent_map_type. Could someone explain what is coherent vs
>> always coherent?
>>
>> And also, why is always coherent happy with WB? Sounds counter intuitive
>> to me.
> 
> All this does is try to keep the existing behaviour intact, whilst
> also ensuring that all lmem objects are mapped using only WC, no
> matter what. The always_coherent=true thing is for the existing places
> where we sometimes map the object using WB, without first considering
> whether the device has the fast shared LLC vs snooping. Yes, it's
> slightly ugly :)

Not fully following - if we had to write kerneldoc for always_coherent 
input argument - what it would say?

Regards,

Tvrtko
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
