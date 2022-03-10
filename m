Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F0CE4D4387
	for <lists+dri-devel@lfdr.de>; Thu, 10 Mar 2022 10:27:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F25F810FC64;
	Thu, 10 Mar 2022 09:27:41 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 554DB10FD56;
 Thu, 10 Mar 2022 09:27:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646904460; x=1678440460;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=9gzgYLGYE5SPT21jmlDVAPqTnO1zWIUIAzFeq9xAyc8=;
 b=Vcj1V0NGrf/ZhqUWRhRAzzp6oq9P5JIzbSRi6aHG7vXuZllBpR8I6FDr
 1M7m51jjSbowjfml4kg4vY6zY1RsPqHg5latAvCOk1xtP3LrlDITIdmEX
 f2RfNA94W84QnpExObdOBBXNmmQV3ZjjattLB5wjwgYamskxGDJb3V/PH
 xg2UtNZFPQGkUsxN3r6JuxHPYTar+61MD+kzVu/iUnmnhoivDYD0qNC9R
 Ls+MFya+TP0gf2wfx+n+XYRieHuQJ5jCd2FTOeZwUXiQB5YXunKO2jWmH
 22iuV6vRbqx/w4/M/AJFLzglUcJlk0k5mX6ta9D/TyjWKaWm0wtACBMpQ g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10281"; a="255149308"
X-IronPort-AV: E=Sophos;i="5.90,170,1643702400"; d="scan'208";a="255149308"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2022 01:27:39 -0800
X-IronPort-AV: E=Sophos;i="5.90,170,1643702400"; d="scan'208";a="547956017"
Received: from npalmass-mobl1.amr.corp.intel.com (HELO [10.213.186.207])
 ([10.213.186.207])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2022 01:27:38 -0800
Message-ID: <6f61e906-8149-6b39-c1ec-1b44f1bb3ca5@linux.intel.com>
Date: Thu, 10 Mar 2022 09:27:35 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [Intel-gfx] [PATCH v3 4/4] drm/i915: Improve long running OCL w/a
 for GuC submission
Content-Language: en-US
To: John Harrison <john.c.harrison@intel.com>, Intel-GFX@Lists.FreeDesktop.Org
References: <20220303223737.708659-1-John.C.Harrison@Intel.com>
 <20220303223737.708659-5-John.C.Harrison@Intel.com>
 <71a0f9af-7473-ece9-dae8-bcc1c3b55cf5@linux.intel.com>
 <991c5d38-7904-dff8-e610-c4030e526e2e@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <991c5d38-7904-dff8-e610-c4030e526e2e@intel.com>
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
Cc: Michal Mrozek <michal.mrozek@intel.com>, DRI-Devel@Lists.FreeDesktop.Org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 09/03/2022 21:16, John Harrison wrote:
> On 3/8/2022 01:41, Tvrtko Ursulin wrote:
>> On 03/03/2022 22:37, John.C.Harrison@Intel.com wrote:
>>> From: John Harrison <John.C.Harrison@Intel.com>
>>>
>>> A workaround was added to the driver to allow OpenCL workloads to run
>>> 'forever' by disabling pre-emption on the RCS engine for Gen12.
>>> It is not totally unbound as the heartbeat will kick in eventually
>>> and cause a reset of the hung engine.
>>>
>>> However, this does not work well in GuC submission mode. In GuC mode,
>>> the pre-emption timeout is how GuC detects hung contexts and triggers
>>> a per engine reset. Thus, disabling the timeout means also losing all
>>> per engine reset ability. A full GT reset will still occur when the
>>> heartbeat finally expires, but that is a much more destructive and
>>> undesirable mechanism.
>>>
>>> The purpose of the workaround is actually to give OpenCL tasks longer
>>> to reach a pre-emption point after a pre-emption request has been
>>> issued. This is necessary because Gen12 does not support mid-thread
>>> pre-emption and OpenCL can have long running threads.
>>>
>>> So, rather than disabling the timeout completely, just set it to a
>>> 'long' value.
>>>
>>> v2: Review feedback from Tvrtko - must hard code the 'long' value
>>> instead of determining it algorithmically. So make it an extra CONFIG
>>> definition. Also, remove the execlist centric comment from the
>>> existing pre-emption timeout CONFIG option given that it applies to
>>> more than just execlists.
>>>
>>> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
>>> Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com> 
>>> (v1)
>>> Acked-by: Michal Mrozek <michal.mrozek@intel.com>
>>> ---
>>>   drivers/gpu/drm/i915/Kconfig.profile      | 26 +++++++++++++++++++----
>>>   drivers/gpu/drm/i915/gt/intel_engine_cs.c |  9 ++++++--
>>>   2 files changed, 29 insertions(+), 6 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/i915/Kconfig.profile 
>>> b/drivers/gpu/drm/i915/Kconfig.profile
>>> index 39328567c200..7cc38d25ee5c 100644
>>> --- a/drivers/gpu/drm/i915/Kconfig.profile
>>> +++ b/drivers/gpu/drm/i915/Kconfig.profile
>>> @@ -57,10 +57,28 @@ config DRM_I915_PREEMPT_TIMEOUT
>>>       default 640 # milliseconds
>>>       help
>>>         How long to wait (in milliseconds) for a preemption event to 
>>> occur
>>> -      when submitting a new context via execlists. If the current 
>>> context
>>> -      does not hit an arbitration point and yield to HW before the 
>>> timer
>>> -      expires, the HW will be reset to allow the more important context
>>> -      to execute.
>>> +      when submitting a new context. If the current context does not 
>>> hit
>>> +      an arbitration point and yield to HW before the timer expires, 
>>> the
>>> +      HW will be reset to allow the more important context to execute.
>>> +
>>> +      This is adjustable via
>>> +      /sys/class/drm/card?/engine/*/preempt_timeout_ms
>>> +
>>> +      May be 0 to disable the timeout.
>>> +
>>> +      The compiled in default may get overridden at driver probe 
>>> time on
>>> +      certain platforms and certain engines which will be reflected 
>>> in the
>>> +      sysfs control.
>>> +
>>> +config DRM_I915_PREEMPT_TIMEOUT_COMPUTE
>>> +    int "Preempt timeout for compute engines (ms, jiffy granularity)"
>>> +    default 7500 # milliseconds
>>> +    help
>>> +      How long to wait (in milliseconds) for a preemption event to 
>>> occur
>>> +      when submitting a new context to a compute capable engine. If the
>>> +      current context does not hit an arbitration point and yield to HW
>>> +      before the timer expires, the HW will be reset to allow the more
>>> +      important context to execute.
>>>           This is adjustable via
>>>         /sys/class/drm/card?/engine/*/preempt_timeout_ms
>>> diff --git a/drivers/gpu/drm/i915/gt/intel_engine_cs.c 
>>> b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
>>> index 4185c7338581..cc0954ad836a 100644
>>> --- a/drivers/gpu/drm/i915/gt/intel_engine_cs.c
>>> +++ b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
>>> @@ -438,9 +438,14 @@ static int intel_engine_setup(struct intel_gt 
>>> *gt, enum intel_engine_id id,
>>>       engine->props.timeslice_duration_ms =
>>>           CONFIG_DRM_I915_TIMESLICE_DURATION;
>>>   -    /* Override to uninterruptible for OpenCL workloads. */
>>> +    /*
>>> +     * Mid-thread pre-emption is not available in Gen12. Unfortunately,
>>> +     * some OpenCL workloads run quite long threads. That means they 
>>> get
>>> +     * reset due to not pre-empting in a timely manner. So, bump the
>>> +     * pre-emption timeout value to be much higher for compute engines.
>>> +     */
>>>       if (GRAPHICS_VER(i915) == 12 && (engine->flags & 
>>> I915_ENGINE_HAS_RCS_REG_STATE))
>>> -        engine->props.preempt_timeout_ms = 0;
>>> +        engine->props.preempt_timeout_ms = 
>>> CONFIG_DRM_I915_PREEMPT_TIMEOUT_COMPUTE;
>>
>> I wouldn't go as far as adding a config option since as it is it only 
>> applies to Gen12 but Kconfig text says nothing about that. And I am 
>> not saying you should add a Gen12 specific config option, that would 
>> be weird. So IMO just drop it.
>>
> You were the one arguing that the driver was illegally overriding the 
> user's explicitly chosen settings, including the compile time config 

This is a bit out of context and illegally don't think used, so 
misrepresents the earlier discussion. And I certainly did not suggest a 
kconfig option.

> options. Just having a hardcoded magic number in the driver is the 
> absolute worst kind of override there is.
 >
> And technically, the config option is not Gen12 specific. It is actually 
> compute specific, hence the name. It just so happens that only Gen12 
> onwards has compute engines. I can add an extra line to the Kconfig 
> description if you want "NB: compute engines only exist on Gen12 but do 
> include the RCS engine on Gen12".

I am not unconditionally against it but it feels it creates more 
problems than gives solutions.

In kconfig help you say "compute *capable* engine". Here you say only 
Gen12 has compute engines. Well before Gen12 render is compute capable, 
but then how implemented it does not apply which is not good.

Given the runtime override has the only purpose of working around broken 
hardware then I'd still say to drop it. But if you can come up with help 
text which won't be misleading and still not overly complicated I am not 
opposing it.

Regards,

Tvrtko
