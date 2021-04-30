Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FF1836F91D
	for <lists+dri-devel@lfdr.de>; Fri, 30 Apr 2021 13:18:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C71A46ED0F;
	Fri, 30 Apr 2021 11:18:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 078ED6E43F;
 Fri, 30 Apr 2021 11:18:48 +0000 (UTC)
IronPort-SDR: AKAc2X2LPo559ewc1T26vRnsTteMehKIQ99mAGlynzAMGOvBxO7SvM6kpkPxgfAwlCykmATyzm
 i3ClqJG3jWuQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9969"; a="194066992"
X-IronPort-AV: E=Sophos;i="5.82,262,1613462400"; d="scan'208";a="194066992"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2021 04:18:48 -0700
IronPort-SDR: UpIevm7+xTcJaJBx2eG9zACUJUlbqogROJdMbRCWY3nNc9+C35KhRVp3qdAOruKjSgbIy1pp2N
 CQ/b9tAgCC6g==
X-IronPort-AV: E=Sophos;i="5.82,262,1613462400"; d="scan'208";a="527598692"
Received: from redickin-mobl2.ger.corp.intel.com (HELO [10.213.208.173])
 ([10.213.208.173])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2021 04:18:47 -0700
Subject: Re: [Intel-gfx] [PATCH 03/21] drm/i915/gem: Set the watchdog timeout
 directly in intel_context_set_gem
To: Jason Ekstrand <jason@jlekstrand.net>
References: <20210423223131.879208-1-jason@jlekstrand.net>
 <20210423223131.879208-4-jason@jlekstrand.net>
 <417fe44a-61f9-c90a-c255-309db5bb48ab@linux.intel.com>
 <CAOFGe96jXtyx2-hiYBmZPFqSx1G32Ph7SGguJQ=ZD4im=ZPJ5A@mail.gmail.com>
 <19ee110c-f251-20b1-5ca8-d280b724ccbf@linux.intel.com>
 <CAOFGe95D81vvT1AQPF_sbqWQMZAJeZmr92xgd2m=GZY4TxGYUw@mail.gmail.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
Message-ID: <40869b1c-411a-31aa-0065-8b5f4fa8bd47@linux.intel.com>
Date: Fri, 30 Apr 2021 12:18:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAOFGe95D81vvT1AQPF_sbqWQMZAJeZmr92xgd2m=GZY4TxGYUw@mail.gmail.com>
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


On 29/04/2021 15:54, Jason Ekstrand wrote:
> On Thu, Apr 29, 2021 at 3:04 AM Tvrtko Ursulin
> <tvrtko.ursulin@linux.intel.com> wrote:
>>
>>
>> On 28/04/2021 18:24, Jason Ekstrand wrote:
>>> On Wed, Apr 28, 2021 at 10:55 AM Tvrtko Ursulin
>>> <tvrtko.ursulin@linux.intel.com> wrote:
>>>> On 23/04/2021 23:31, Jason Ekstrand wrote:
>>>>> Instead of handling it like a context param, unconditionally set it when
>>>>> intel_contexts are created.  This doesn't fix anything but does simplify
>>>>> the code a bit.
>>>>>
>>>>> Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
>>>>> ---
>>>>>     drivers/gpu/drm/i915/gem/i915_gem_context.c   | 43 +++----------------
>>>>>     .../gpu/drm/i915/gem/i915_gem_context_types.h |  4 --
>>>>>     drivers/gpu/drm/i915/gt/intel_context_param.h |  3 +-
>>>>>     3 files changed, 6 insertions(+), 44 deletions(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/gem/i915_gem_context.c
>>>>> index 35bcdeddfbf3f..1091cc04a242a 100644
>>>>> --- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
>>>>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
>>>>> @@ -233,7 +233,11 @@ static void intel_context_set_gem(struct intel_context *ce,
>>>>>             intel_engine_has_timeslices(ce->engine))
>>>>>                 __set_bit(CONTEXT_USE_SEMAPHORES, &ce->flags);
>>>>>
>>>>> -     intel_context_set_watchdog_us(ce, ctx->watchdog.timeout_us);
>>>>> +     if (IS_ACTIVE(CONFIG_DRM_I915_REQUEST_TIMEOUT) &&
>>>>> +         ctx->i915->params.request_timeout_ms) {
>>>>> +             unsigned int timeout_ms = ctx->i915->params.request_timeout_ms;
>>>>> +             intel_context_set_watchdog_us(ce, (u64)timeout_ms * 1000);
>>>>
>>>> Blank line between declarations and code please, or just lose the local.
>>>>
>>>> Otherwise looks okay. Slight change that same GEM context can now have a
>>>> mix of different request expirations isn't interesting I think. At least
>>>> the change goes away by the end of the series.
>>>
>>> In order for that to happen, I think you'd have to have a race between
>>> CREATE_CONTEXT and someone smashing the request_timeout_ms param via
>>> sysfs.  Or am I missing something?  Given that timeouts are really
>>> per-engine anyway, I don't think we need to care too much about that.
>>
>> We don't care, no.
>>
>> For completeness only - by the end of the series it is what you say. But
>> at _this_ point in the series though it is if modparam changes at any
>> point between context create and replacing engines. Which is a change
>> compared to before this patch, since modparam was cached in the GEM
>> context so far. So one GEM context was a single request_timeout_ms.
> 
> I've added the following to the commit message:
> 
> It also means that sync files exported from different engines on a
> SINGLE_TIMELINE context will have different fence contexts.  This is
> visible to userspace if it looks at the obj_name field of
> sync_fence_info.
> 
> How's that sound?

Wrong thread but sounds good.

I haven't looked into the fence merge logic apart from noticing context 
is used there. So I'd suggest a quick look there on top, just to make 
sure merging logic does not hold any surprises if contexts start to 
differ. Probably just results with more inefficiency somewhere, in theory.

Regards,

Tvrtko
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
