Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C4373D1FD2
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jul 2021 10:28:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B81EA6EA38;
	Thu, 22 Jul 2021 08:27:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 011A16EA38;
 Thu, 22 Jul 2021 08:27:55 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10052"; a="275414930"
X-IronPort-AV: E=Sophos;i="5.84,260,1620716400"; d="scan'208";a="275414930"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2021 01:27:53 -0700
X-IronPort-AV: E=Sophos;i="5.84,260,1620716400"; d="scan'208";a="470544441"
Received: from cstylian-mobl3.ger.corp.intel.com (HELO [10.213.198.98])
 ([10.213.198.98])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2021 01:27:51 -0700
Subject: Re: [Intel-gfx] [PATCH 4/4] drm/i915/gt: nuke gen6_hw_id
To: Lucas De Marchi <lucas.demarchi@intel.com>
References: <20210720232014.3302645-1-lucas.demarchi@intel.com>
 <20210720232014.3302645-5-lucas.demarchi@intel.com>
 <079da526-6b19-3b44-e3d0-c23e1a61e9b1@linux.intel.com>
 <20210721184422.fvpmhes2uw2tbax3@ldmartin-desk2>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
Message-ID: <44eec779-d76c-38ab-9c0f-a71dbceee385@linux.intel.com>
Date: Thu, 22 Jul 2021 09:27:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210721184422.fvpmhes2uw2tbax3@ldmartin-desk2>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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
Cc: intel-gfx@lists.freedesktop.org,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Tomas Winkler <tomas.winkler@intel.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 21/07/2021 19:44, Lucas De Marchi wrote:
> On Wed, Jul 21, 2021 at 10:25:59AM +0100, Tvrtko Ursulin wrote:
>>
>> On 21/07/2021 00:20, Lucas De Marchi wrote:
>>> This is only used by GRAPHICS_VER == 6 and GRAPHICS_VER == 7. All other
>>> recent platforms do not depend on this field, so it doesn't make much
>>> sense to keep it generic like that. Instead, just do a mapping from
>>> engine class to HW ID in the single place that is needed.
>>>
>>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>>> ---
>>>  drivers/gpu/drm/i915/gt/intel_engine_cs.c    | 6 ------
>>>  drivers/gpu/drm/i915/gt/intel_engine_types.h | 8 --------
>>>  drivers/gpu/drm/i915/i915_reg.h              | 4 +++-
>>>  3 files changed, 3 insertions(+), 15 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/i915/gt/intel_engine_cs.c 
>>> b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
>>> index 508221de411c..0a04e8d90e9e 100644
>>> --- a/drivers/gpu/drm/i915/gt/intel_engine_cs.c
>>> +++ b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
>>> @@ -42,7 +42,6 @@
>>>  #define MAX_MMIO_BASES 3
>>>  struct engine_info {
>>> -    u8 gen6_hw_id;
>>>      u8 class;
>>>      u8 instance;
>>>      /* mmio bases table *must* be sorted in reverse graphics_ver 
>>> order */
>>> @@ -54,7 +53,6 @@ struct engine_info {
>>>  static const struct engine_info intel_engines[] = {
>>>      [RCS0] = {
>>> -        .gen6_hw_id = RCS0_HW,
>>>          .class = RENDER_CLASS,
>>>          .instance = 0,
>>>          .mmio_bases = {
>>> @@ -62,7 +60,6 @@ static const struct engine_info intel_engines[] = {
>>>          },
>>>      },
>>>      [BCS0] = {
>>> -        .gen6_hw_id = BCS0_HW,
>>>          .class = COPY_ENGINE_CLASS,
>>>          .instance = 0,
>>>          .mmio_bases = {
>>> @@ -70,7 +67,6 @@ static const struct engine_info intel_engines[] = {
>>>          },
>>>      },
>>>      [VCS0] = {
>>> -        .gen6_hw_id = VCS0_HW,
>>>          .class = VIDEO_DECODE_CLASS,
>>>          .instance = 0,
>>>          .mmio_bases = {
>>> @@ -102,7 +98,6 @@ static const struct engine_info intel_engines[] = {
>>>          },
>>>      },
>>>      [VECS0] = {
>>> -        .gen6_hw_id = VECS0_HW,
>>>          .class = VIDEO_ENHANCEMENT_CLASS,
>>>          .instance = 0,
>>>          .mmio_bases = {
>>> @@ -290,7 +285,6 @@ static int intel_engine_setup(struct intel_gt 
>>> *gt, enum intel_engine_id id)
>>>      engine->i915 = i915;
>>>      engine->gt = gt;
>>>      engine->uncore = gt->uncore;
>>> -    engine->gen6_hw_id = info->gen6_hw_id;
>>>      guc_class = engine_class_to_guc_class(info->class);
>>>      engine->guc_id = MAKE_GUC_ID(guc_class, info->instance);
>>>      engine->mmio_base = __engine_mmio_base(i915, info->mmio_bases);
>>> diff --git a/drivers/gpu/drm/i915/gt/intel_engine_types.h 
>>> b/drivers/gpu/drm/i915/gt/intel_engine_types.h
>>> index 266422d8d1b1..64330bfb7641 100644
>>> --- a/drivers/gpu/drm/i915/gt/intel_engine_types.h
>>> +++ b/drivers/gpu/drm/i915/gt/intel_engine_types.h
>>> @@ -28,13 +28,6 @@
>>>  #include "intel_wakeref.h"
>>>  #include "intel_workarounds_types.h"
>>> -/* Legacy HW Engine ID */
>>> -
>>> -#define RCS0_HW        0
>>> -#define VCS0_HW        1
>>> -#define BCS0_HW        2
>>> -#define VECS0_HW    3
>>> -
>>>  /* Gen11+ HW Engine class + instance */
>>>  #define RENDER_CLASS        0
>>>  #define VIDEO_DECODE_CLASS    1
>>> @@ -268,7 +261,6 @@ struct intel_engine_cs {
>>>      intel_engine_mask_t mask;
>>> -    u8 gen6_hw_id;
>>>      u8 class;
>>>      u8 instance;
>>> diff --git a/drivers/gpu/drm/i915/i915_reg.h 
>>> b/drivers/gpu/drm/i915/i915_reg.h
>>> index 8750ffce9d61..d91386f4828e 100644
>>> --- a/drivers/gpu/drm/i915/i915_reg.h
>>> +++ b/drivers/gpu/drm/i915/i915_reg.h
>>> @@ -2572,7 +2572,9 @@ static inline bool 
>>> i915_mmio_reg_valid(i915_reg_t reg)
>>>  #define   ARB_MODE_BWGTLB_DISABLE (1 << 9)
>>>  #define   ARB_MODE_SWIZZLE_BDW    (1 << 1)
>>>  #define RENDER_HWS_PGA_GEN7    _MMIO(0x04080)
>>> -#define RING_FAULT_REG(engine)    _MMIO(0x4094 + 0x100 * 
>>> (engine)->gen6_hw_id)
>>> +
>>> +#define _GEN6_ENGINE_CLASS_TO_ID(class) _PICK((class), 0, 1, 3, 2)
>>> +#define RING_FAULT_REG(engine)    _MMIO(0x4094 + 0x100 * 
>>> _GEN6_ENGINE_CLASS_TO_ID((engine)->class))
>>
>> Makes sense to me.
>>
>> Maybe HW_ID and HW_CLASS in the macro name? Not sure.
> 
> I can do that... I think I avoided it because it makes the macro
> very big. Anyway, this should be called in just one place, so it doesn't
> matter much... I can add it.
> 
>>
>> Only open I have is why the "Gen11+ HW Engine class + instance" 
>> comment and now we would tie that, allegedly Gen11 concept, with 
>> Gen6-7. Care to do some digging?
> 
> Not sure. This comes from 3d7b3039741d ("drm/i915: Move engine IDs out 
> of i915_reg.h")
> that I reviewed :-o
> 
> Cc'ing  Daniele. I don't see "class" as a Gen11+ thing. Is it just that
> those numbers started to make sense for gen11?  Since
> 
> a) we are using the class even for GRAPHICS_VER < 11
> b) the legacy HW IDs shouldn't be used anywhere else anymore
> 
> 
> we could
> 
> 1) move the legacy defines back to i915_reg.h
> 2) use them in the macro above (IMO would slightly improve the
> readability of that _PICK() call)
> 3) Remove the "Gen11+" comment in the _CLASS macros to avoid
> misunderstandings
> 
> 
> Thoughts?

What Matt suggested sounds fine to me (using _PICK with 
_RING_FAULT_REG_RCS etc). It retires the concept of hw id from the code 
base completely and hopefully the need for it does not re-surface.

Regards,

Tvrtko
