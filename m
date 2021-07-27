Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C65D3D72E2
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jul 2021 12:14:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 650AB6E3CE;
	Tue, 27 Jul 2021 10:14:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E13E6E17D;
 Tue, 27 Jul 2021 10:14:43 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10057"; a="210521390"
X-IronPort-AV: E=Sophos;i="5.84,273,1620716400"; d="scan'208";a="210521390"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2021 03:14:42 -0700
X-IronPort-AV: E=Sophos;i="5.84,273,1620716400"; d="scan'208";a="437256605"
Received: from jrgrant-mobl.ger.corp.intel.com (HELO [10.213.245.158])
 ([10.213.245.158])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2021 03:14:41 -0700
Subject: Re: [Intel-gfx] [PATCH 04/10] drm/i915: move intel_context slab to
 direct module init/exit
To: Jason Ekstrand <jason@jlekstrand.net>
References: <20210723192934.1004427-1-daniel.vetter@ffwll.ch>
 <20210723192934.1004427-4-daniel.vetter@ffwll.ch>
 <0edb5c4d-1faf-4b24-a21d-fd2e5be6591d@linux.intel.com>
 <CAOFGe96Da_O7VBaw85LsNTfMZhb2ycVg3WJ0fFe6xekB0m2NnA@mail.gmail.com>
 <CAOFGe96OBK3W_c8YU=4LHysumEOm3Y27KX_Mok=P686aa3c0Bw@mail.gmail.com>
 <031997ab-5568-9dbd-fcee-b4f820a32632@linux.intel.com>
 <CAOFGe95G3bYWxZ_EwPEFzxf10vf1T3Zdyez_fbh=imcDj+TSHw@mail.gmail.com>
 <87291107-0690-9804-08a3-309c23176f23@linux.intel.com>
 <CAOFGe96KwQe5-GuJ5Yc3w0X0F+EK5r2-dCne8-WqUD6qo=zOHw@mail.gmail.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
Message-ID: <4f84e629-19e9-1dd8-f558-6c8b6f7df9e6@linux.intel.com>
Date: Tue, 27 Jul 2021 11:14:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAOFGe96KwQe5-GuJ5Yc3w0X0F+EK5r2-dCne8-WqUD6qo=zOHw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 26/07/2021 19:17, Jason Ekstrand wrote:
> On Mon, Jul 26, 2021 at 11:31 AM Tvrtko Ursulin
> <tvrtko.ursulin@linux.intel.com> wrote:
>>
>>
>> On 26/07/2021 17:20, Jason Ekstrand wrote:
>>> On Mon, Jul 26, 2021 at 11:08 AM Tvrtko Ursulin
>>> <tvrtko.ursulin@linux.intel.com> wrote:
>>>> On 26/07/2021 16:42, Jason Ekstrand wrote:
>>>>> On Mon, Jul 26, 2021 at 10:30 AM Jason Ekstrand <jason@jlekstrand.net> wrote:
>>>>>>
>>>>>> On Mon, Jul 26, 2021 at 3:35 AM Tvrtko Ursulin
>>>>>> <tvrtko.ursulin@linux.intel.com> wrote:
>>>>>>>
>>>>>>>
>>>>>>> On 23/07/2021 20:29, Daniel Vetter wrote:
>>>>>>>> With the global kmem_cache shrink infrastructure gone there's nothing
>>>>>>>> special and we can convert them over.
>>>>>>>>
>>>>>>>> I'm doing this split up into each patch because there's quite a bit of
>>>>>>>> noise with removing the static global.slab_ce to just a
>>>>>>>> slab_ce.
>>>>>>>>
>>>>>>>> Cc: Jason Ekstrand <jason@jlekstrand.net>
>>>>>>>> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
>>>>>>>> ---
>>>>>>>>      drivers/gpu/drm/i915/gt/intel_context.c | 25 ++++++++-----------------
>>>>>>>>      drivers/gpu/drm/i915/gt/intel_context.h |  3 +++
>>>>>>>>      drivers/gpu/drm/i915/i915_globals.c     |  2 --
>>>>>>>>      drivers/gpu/drm/i915/i915_globals.h     |  1 -
>>>>>>>>      drivers/gpu/drm/i915/i915_pci.c         |  2 ++
>>>>>>>>      5 files changed, 13 insertions(+), 20 deletions(-)
>>>>>>>>
>>>>>>>> diff --git a/drivers/gpu/drm/i915/gt/intel_context.c b/drivers/gpu/drm/i915/gt/intel_context.c
>>>>>>>> index baa05fddd690..283382549a6f 100644
>>>>>>>> --- a/drivers/gpu/drm/i915/gt/intel_context.c
>>>>>>>> +++ b/drivers/gpu/drm/i915/gt/intel_context.c
>>>>>>>> @@ -7,7 +7,6 @@
>>>>>>>>      #include "gem/i915_gem_pm.h"
>>>>>>>>
>>>>>>>>      #include "i915_drv.h"
>>>>>>>> -#include "i915_globals.h"
>>>>>>>>      #include "i915_trace.h"
>>>>>>>>
>>>>>>>>      #include "intel_context.h"
>>>>>>>> @@ -15,14 +14,11 @@
>>>>>>>>      #include "intel_engine_pm.h"
>>>>>>>>      #include "intel_ring.h"
>>>>>>>>
>>>>>>>> -static struct i915_global_context {
>>>>>>>> -     struct i915_global base;
>>>>>>>> -     struct kmem_cache *slab_ce;
>>>>>>>> -} global;
>>>>>>>> +struct kmem_cache *slab_ce;
>>>>>>
>>>>>> Static?  With that,
>>>>>>
>>>>>> Reviewed-by: Jason Ekstrand <jason@jlekstrand.net>
>>>>>>
>>>>>>>>
>>>>>>>>      static struct intel_context *intel_context_alloc(void)
>>>>>>>>      {
>>>>>>>> -     return kmem_cache_zalloc(global.slab_ce, GFP_KERNEL);
>>>>>>>> +     return kmem_cache_zalloc(slab_ce, GFP_KERNEL);
>>>>>>>>      }
>>>>>>>>
>>>>>>>>      static void rcu_context_free(struct rcu_head *rcu)
>>>>>>>> @@ -30,7 +26,7 @@ static void rcu_context_free(struct rcu_head *rcu)
>>>>>>>>          struct intel_context *ce = container_of(rcu, typeof(*ce), rcu);
>>>>>>>>
>>>>>>>>          trace_intel_context_free(ce);
>>>>>>>> -     kmem_cache_free(global.slab_ce, ce);
>>>>>>>> +     kmem_cache_free(slab_ce, ce);
>>>>>>>>      }
>>>>>>>>
>>>>>>>>      void intel_context_free(struct intel_context *ce)
>>>>>>>> @@ -410,22 +406,17 @@ void intel_context_fini(struct intel_context *ce)
>>>>>>>>          i915_active_fini(&ce->active);
>>>>>>>>      }
>>>>>>>>
>>>>>>>> -static void i915_global_context_exit(void)
>>>>>>>> +void i915_context_module_exit(void)
>>>>>>>>      {
>>>>>>>> -     kmem_cache_destroy(global.slab_ce);
>>>>>>>> +     kmem_cache_destroy(slab_ce);
>>>>>>>>      }
>>>>>>>>
>>>>>>>> -static struct i915_global_context global = { {
>>>>>>>> -     .exit = i915_global_context_exit,
>>>>>>>> -} };
>>>>>>>> -
>>>>>>>> -int __init i915_global_context_init(void)
>>>>>>>> +int __init i915_context_module_init(void)
>>>>>>>>      {
>>>>>>>> -     global.slab_ce = KMEM_CACHE(intel_context, SLAB_HWCACHE_ALIGN);
>>>>>>>> -     if (!global.slab_ce)
>>>>>>>> +     slab_ce = KMEM_CACHE(intel_context, SLAB_HWCACHE_ALIGN);
>>>>>>>> +     if (!slab_ce)
>>>>>>>>                  return -ENOMEM;
>>>>>>>>
>>>>>>>> -     i915_global_register(&global.base);
>>>>>>>>          return 0;
>>>>>>>>      }
>>>>>>>>
>>>>>>>> diff --git a/drivers/gpu/drm/i915/gt/intel_context.h b/drivers/gpu/drm/i915/gt/intel_context.h
>>>>>>>> index 974ef85320c2..a0ca82e3c40d 100644
>>>>>>>> --- a/drivers/gpu/drm/i915/gt/intel_context.h
>>>>>>>> +++ b/drivers/gpu/drm/i915/gt/intel_context.h
>>>>>>>> @@ -30,6 +30,9 @@ void intel_context_init(struct intel_context *ce,
>>>>>>>>                          struct intel_engine_cs *engine);
>>>>>>>>      void intel_context_fini(struct intel_context *ce);
>>>>>>>>
>>>>>>>> +void i915_context_module_exit(void);
>>>>>>>> +int i915_context_module_init(void);
>>>>>>>> +
>>>>>>>>      struct intel_context *
>>>>>>>>      intel_context_create(struct intel_engine_cs *engine);
>>>>>>>>
>>>>>>>> diff --git a/drivers/gpu/drm/i915/i915_globals.c b/drivers/gpu/drm/i915/i915_globals.c
>>>>>>>> index 3de7cf22ec76..d36eb7dc40aa 100644
>>>>>>>> --- a/drivers/gpu/drm/i915/i915_globals.c
>>>>>>>> +++ b/drivers/gpu/drm/i915/i915_globals.c
>>>>>>>> @@ -7,7 +7,6 @@
>>>>>>>>      #include <linux/slab.h>
>>>>>>>>      #include <linux/workqueue.h>
>>>>>>>>
>>>>>>>> -#include "gem/i915_gem_context.h"
>>>>>>>>      #include "gem/i915_gem_object.h"
>>>>>>>>      #include "i915_globals.h"
>>>>>>>>      #include "i915_request.h"
>>>>>>>> @@ -32,7 +31,6 @@ static void __i915_globals_cleanup(void)
>>>>>>>>      }
>>>>>>>>
>>>>>>>>      static __initconst int (* const initfn[])(void) = {
>>>>>>>> -     i915_global_context_init,
>>>>>>>>          i915_global_gem_context_init,
>>>>>>>>          i915_global_objects_init,
>>>>>>>>          i915_global_request_init,
>>>>>>>> diff --git a/drivers/gpu/drm/i915/i915_globals.h b/drivers/gpu/drm/i915/i915_globals.h
>>>>>>>> index d80901ba75e3..60daa738a188 100644
>>>>>>>> --- a/drivers/gpu/drm/i915/i915_globals.h
>>>>>>>> +++ b/drivers/gpu/drm/i915/i915_globals.h
>>>>>>>> @@ -23,7 +23,6 @@ int i915_globals_init(void);
>>>>>>>>      void i915_globals_exit(void);
>>>>>>>>
>>>>>>>>      /* constructors */
>>>>>>>> -int i915_global_context_init(void);
>>>>>>>>      int i915_global_gem_context_init(void);
>>>>>>>>      int i915_global_objects_init(void);
>>>>>>>>      int i915_global_request_init(void);
>>>>>>>> diff --git a/drivers/gpu/drm/i915/i915_pci.c b/drivers/gpu/drm/i915/i915_pci.c
>>>>>>>> index f9527269e30a..266618157775 100644
>>>>>>>> --- a/drivers/gpu/drm/i915/i915_pci.c
>>>>>>>> +++ b/drivers/gpu/drm/i915/i915_pci.c
>>>>>>>> @@ -33,6 +33,7 @@
>>>>>>>>      #include "i915_active.h"
>>>>>>>>      #include "i915_buddy.h"
>>>>>>>>      #include "i915_drv.h"
>>>>>>>> +#include "gem/i915_gem_context.h"
>>>>>>>
>>>>>>> It's a bit ugly to go to a design where i915_pci.c has to include so
>>>>>>> many random parts of i915. IMO for a complex driver like i915,
>>>>>>> compartmentalizing so much knowledge about the internals was better
>>>>>>> inside the globals layer.
>>>>>>
>>>>>> I agree that i915_pci feels like the wrong place to put this but I
>>>>>> don't think that's so much because globals don't belong in i915_pci
>>>>>> but because i915_init/exit don't belong there.  Maybe, once this is
>>>>>> all said and done (or at the start of the series), we should move
>>>>>> i915_init/exit to i915_drv.c?  Of course, there's a bunch of PCI
>>>>>> probing stuff in i915_drv.c so..... yeah.... our organization is
>>>>>> pretty busted.
>>>>>
>>>>> To put a finer point on this, the new "design" is really to have a
>>>>> single flat list instead of two, one nested inside the other.  There's
>>>>> nothing wrong with that at all.  The fact that all this stuff now
>>>>> lives in i915_pci.c is ugly.  But, as I said, that's kind-of an
>>>>> accident of history because that's where i915_init() and i915_exit()
>>>>> currently live.  We should just move the lot to i915_drv.c.
>>>>
>>>> Hmm.. on one hand it does sounds better to move to i915_drv.c, but is it
>>>> just because all these new include directive are so visibly out of place
>>>> in i915_pci.c?
>>>>
>>>> Perhaps we need i915_module.c and then i915_globals is a completely fine
>>>> concept. Desired IMO even since we have to avoid globals in general
>>>> (multi-gpu) so it sticks out nicely that all that is allowed to be
>>>> global has a special place.
>>>>
>>>> And i915_drv.c can remain being about a driver instance as bound to one GPU.
>>>
>>> Is i915_drv.c about a single instance bound to a single GPU?  If so,
>>
>> Yep, all functions there either take drm_dev, pdev or dev_priv as
>> argument, or return/initialize dev_priv.
>>
>>> then, yeah, maybe not the right place.  Maybe a i915_module.c would be
>>> better.  It's all different shades of shed paint.
>>
>> Hm not really just different shades IMO. Because I argue the patch
>> series as is is a retrograde step in the above discussed respect.
>>
>> I think i915_globals is cleaner code organisation. Because even if we
>> add i915_module.c, then that can be made initialize globals and register
>> with pci in cleanly separated steps without the need to include many
>> driver internals.
> 
> Ok, so maybe I'm missing something in what you're saying.  I was under
> the impression that your primary concern was separating PCI setup from
> per-device from per-module stuff.  If so, moving it all to an
> i915_module.c fixes that.

Yeah, but i915_module.c was just a side discussion which started from 
whether it is right or not to put module init into i915_drv.c. It does 
not fix the fundamental question of the below discussion.

> Are you arguing that a flat list of module init steps is bad?  And
> that having globals be its own sub-list is good?  If so, then I have
> to disagree.  I don't think splitting the calling of misc "set up my

I think having to include all the driver sub-sub component headers from 
any top level module init file is a step towards a worse design. 
Currently those steps were nicely encapsulated and I don't see a reason 
to break them out to top level.

> slabs" functions from the final "register with PCI" at the end gains
> us anything.  What it does do is give more files to search through,
> more layers to think about when understanding the code, and more
> infrastructure to maintain.
> 
> If, on the other hand, we had a globals infrastructure that actually
> gained us something in terms of code simplicity, I might be able to
> get behind that.  For instance, I could imagine something like this:
> 
> I915_DECL_SLAB(foo);
> 
>     /* Someone allocates something */
>     kmem_cache_alloc(foo.slab);
> 
> where we somehow automagically declare the slab, initialize it on
> module load, and tear it down on module exit.  That would add real
> value.  As is, all i915_globals.c adds is extra layers.

I read this as a statement that at least one part of your thinking is 
that current globals code is too verbose for simple global slab usage?

This I can buy, given how all but two usages are creating a single slab. 
Then there are two callers which use two slabs, but nothing outside the 
slab territory. So argument to simplify can be made yeah, only question 
is how.

Simple macro like you suggest sounds very attractive indeed if it could 
replace boiler plate code for single slab users (albeit with some more 
arguments). Problem is I don't know that we could make it call a 
registration helper from global scope.

Hm removing the list and going for fixed table slots might work, if 
logistics of reserving indices for it in i915_globals.h wouldn't be too 
ugly? Hm maybe not too ugly, maybe it is just an enum every global slab 
users adds for themselves and references it in a macro. With macro magic 
like DEV_INFO_FOR_EACH_FLAG and company to generate the table etc?

Regards,

Tvrtko

> --Jason
> 
> 
>> I see r-b are accumulating but I hope reasonable objections will be
>> considered.
>>
>> Regards,
>>
>> Tvrtko
>>
>>>
>>> --Jason
>>>
>>>> That feels like the best of both worlds to me.
>>>>
>>>> Regards,
>>>>
>>>> Tvrtko
>>>>
>>>>>
>>>>>> --Jason
>>>>>>
>>>>>>> Maybe add a cover letter to explain the perceived pros and cons and
>>>>>>> thinking in general?
>>>>>>>
>>>>>>> Regards,
>>>>>>>
>>>>>>> Tvrtko
>>>>>>>
>>>>>>>>      #include "i915_perf.h"
>>>>>>>>      #include "i915_globals.h"
>>>>>>>>      #include "i915_selftest.h"
>>>>>>>> @@ -1297,6 +1298,7 @@ static const struct {
>>>>>>>>          { i915_check_nomodeset, NULL },
>>>>>>>>          { i915_active_module_init, i915_active_module_exit },
>>>>>>>>          { i915_buddy_module_init, i915_buddy_module_exit },
>>>>>>>> +     { i915_context_module_init, i915_context_module_exit },
>>>>>>>>          { i915_globals_init, i915_globals_exit },
>>>>>>>>          { i915_mock_selftests, NULL },
>>>>>>>>          { i915_pmu_init, i915_pmu_exit },
>>>>>>>>
>>>>>>> _______________________________________________
>>>>>>> Intel-gfx mailing list
>>>>>>> Intel-gfx@lists.freedesktop.org
>>>>>>> https://lists.freedesktop.org/mailman/listinfo/intel-gfx
