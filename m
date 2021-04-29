Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 397CE36E67B
	for <lists+dri-devel@lfdr.de>; Thu, 29 Apr 2021 10:04:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 692A36ED99;
	Thu, 29 Apr 2021 08:04:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E56F46ED94;
 Thu, 29 Apr 2021 08:04:21 +0000 (UTC)
IronPort-SDR: JDBjYt6tyMmU4fh9+ROYeh4RbrNH9lTdIOptf2jxqwucEuS+up3lavpGiuH9tAiW+gf0a0ytYI
 8ycto1270cKg==
X-IronPort-AV: E=McAfee;i="6200,9189,9968"; a="197000955"
X-IronPort-AV: E=Sophos;i="5.82,258,1613462400"; d="scan'208";a="197000955"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2021 01:04:20 -0700
IronPort-SDR: MagjEL/Vq+QwYP6AkIA24Xe54V08W5VnppKPCJyg0tlw+jL0CdzrgU+b9iJH0VI+Ynq9ZdJA+T
 /YrFspuNrBfg==
X-IronPort-AV: E=Sophos;i="5.82,258,1613462400"; d="scan'208";a="458633480"
Received: from gwaise-mobl1.ger.corp.intel.com (HELO [10.213.208.64])
 ([10.213.208.64])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2021 01:04:19 -0700
Subject: Re: [Intel-gfx] [PATCH 03/21] drm/i915/gem: Set the watchdog timeout
 directly in intel_context_set_gem
To: Jason Ekstrand <jason@jlekstrand.net>
References: <20210423223131.879208-1-jason@jlekstrand.net>
 <20210423223131.879208-4-jason@jlekstrand.net>
 <417fe44a-61f9-c90a-c255-309db5bb48ab@linux.intel.com>
 <CAOFGe96jXtyx2-hiYBmZPFqSx1G32Ph7SGguJQ=ZD4im=ZPJ5A@mail.gmail.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
Message-ID: <19ee110c-f251-20b1-5ca8-d280b724ccbf@linux.intel.com>
Date: Thu, 29 Apr 2021 09:04:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAOFGe96jXtyx2-hiYBmZPFqSx1G32Ph7SGguJQ=ZD4im=ZPJ5A@mail.gmail.com>
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
Cc: Intel GFX <intel-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 28/04/2021 18:24, Jason Ekstrand wrote:
> On Wed, Apr 28, 2021 at 10:55 AM Tvrtko Ursulin
> <tvrtko.ursulin@linux.intel.com> wrote:
>> On 23/04/2021 23:31, Jason Ekstrand wrote:
>>> Instead of handling it like a context param, unconditionally set it when
>>> intel_contexts are created.  This doesn't fix anything but does simplify
>>> the code a bit.
>>>
>>> Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
>>> ---
>>>    drivers/gpu/drm/i915/gem/i915_gem_context.c   | 43 +++----------------
>>>    .../gpu/drm/i915/gem/i915_gem_context_types.h |  4 --
>>>    drivers/gpu/drm/i915/gt/intel_context_param.h |  3 +-
>>>    3 files changed, 6 insertions(+), 44 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/gem/i915_gem_context.c
>>> index 35bcdeddfbf3f..1091cc04a242a 100644
>>> --- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
>>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
>>> @@ -233,7 +233,11 @@ static void intel_context_set_gem(struct intel_context *ce,
>>>            intel_engine_has_timeslices(ce->engine))
>>>                __set_bit(CONTEXT_USE_SEMAPHORES, &ce->flags);
>>>
>>> -     intel_context_set_watchdog_us(ce, ctx->watchdog.timeout_us);
>>> +     if (IS_ACTIVE(CONFIG_DRM_I915_REQUEST_TIMEOUT) &&
>>> +         ctx->i915->params.request_timeout_ms) {
>>> +             unsigned int timeout_ms = ctx->i915->params.request_timeout_ms;
>>> +             intel_context_set_watchdog_us(ce, (u64)timeout_ms * 1000);
>>
>> Blank line between declarations and code please, or just lose the local.
>>
>> Otherwise looks okay. Slight change that same GEM context can now have a
>> mix of different request expirations isn't interesting I think. At least
>> the change goes away by the end of the series.
> 
> In order for that to happen, I think you'd have to have a race between
> CREATE_CONTEXT and someone smashing the request_timeout_ms param via
> sysfs.  Or am I missing something?  Given that timeouts are really
> per-engine anyway, I don't think we need to care too much about that.

We don't care, no.

For completeness only - by the end of the series it is what you say. But 
at _this_ point in the series though it is if modparam changes at any 
point between context create and replacing engines. Which is a change 
compared to before this patch, since modparam was cached in the GEM 
context so far. So one GEM context was a single request_timeout_ms.

Regards,

Tvrtko

> --Jason
> 
>> Regards,
>>
>> Tvrtko
>>
>>> +     }
>>>    }
>>>
>>>    static void __free_engines(struct i915_gem_engines *e, unsigned int count)
>>> @@ -792,41 +796,6 @@ static void __assign_timeline(struct i915_gem_context *ctx,
>>>        context_apply_all(ctx, __apply_timeline, timeline);
>>>    }
>>>
>>> -static int __apply_watchdog(struct intel_context *ce, void *timeout_us)
>>> -{
>>> -     return intel_context_set_watchdog_us(ce, (uintptr_t)timeout_us);
>>> -}
>>> -
>>> -static int
>>> -__set_watchdog(struct i915_gem_context *ctx, unsigned long timeout_us)
>>> -{
>>> -     int ret;
>>> -
>>> -     ret = context_apply_all(ctx, __apply_watchdog,
>>> -                             (void *)(uintptr_t)timeout_us);
>>> -     if (!ret)
>>> -             ctx->watchdog.timeout_us = timeout_us;
>>> -
>>> -     return ret;
>>> -}
>>> -
>>> -static void __set_default_fence_expiry(struct i915_gem_context *ctx)
>>> -{
>>> -     struct drm_i915_private *i915 = ctx->i915;
>>> -     int ret;
>>> -
>>> -     if (!IS_ACTIVE(CONFIG_DRM_I915_REQUEST_TIMEOUT) ||
>>> -         !i915->params.request_timeout_ms)
>>> -             return;
>>> -
>>> -     /* Default expiry for user fences. */
>>> -     ret = __set_watchdog(ctx, i915->params.request_timeout_ms * 1000);
>>> -     if (ret)
>>> -             drm_notice(&i915->drm,
>>> -                        "Failed to configure default fence expiry! (%d)",
>>> -                        ret);
>>> -}
>>> -
>>>    static struct i915_gem_context *
>>>    i915_gem_create_context(struct drm_i915_private *i915, unsigned int flags)
>>>    {
>>> @@ -871,8 +840,6 @@ i915_gem_create_context(struct drm_i915_private *i915, unsigned int flags)
>>>                intel_timeline_put(timeline);
>>>        }
>>>
>>> -     __set_default_fence_expiry(ctx);
>>> -
>>>        trace_i915_context_create(ctx);
>>>
>>>        return ctx;
>>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context_types.h b/drivers/gpu/drm/i915/gem/i915_gem_context_types.h
>>> index 5ae71ec936f7c..676592e27e7d2 100644
>>> --- a/drivers/gpu/drm/i915/gem/i915_gem_context_types.h
>>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_context_types.h
>>> @@ -153,10 +153,6 @@ struct i915_gem_context {
>>>         */
>>>        atomic_t active_count;
>>>
>>> -     struct {
>>> -             u64 timeout_us;
>>> -     } watchdog;
>>> -
>>>        /**
>>>         * @hang_timestamp: The last time(s) this context caused a GPU hang
>>>         */
>>> diff --git a/drivers/gpu/drm/i915/gt/intel_context_param.h b/drivers/gpu/drm/i915/gt/intel_context_param.h
>>> index dffedd983693d..0c69cb42d075c 100644
>>> --- a/drivers/gpu/drm/i915/gt/intel_context_param.h
>>> +++ b/drivers/gpu/drm/i915/gt/intel_context_param.h
>>> @@ -10,11 +10,10 @@
>>>
>>>    #include "intel_context.h"
>>>
>>> -static inline int
>>> +static inline void
>>>    intel_context_set_watchdog_us(struct intel_context *ce, u64 timeout_us)
>>>    {
>>>        ce->watchdog.timeout_us = timeout_us;
>>> -     return 0;
>>>    }
>>>
>>>    #endif /* INTEL_CONTEXT_PARAM_H */
>>>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
