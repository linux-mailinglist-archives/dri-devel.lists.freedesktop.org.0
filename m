Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C26FE34A592
	for <lists+dri-devel@lfdr.de>; Fri, 26 Mar 2021 11:31:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 716506F3A5;
	Fri, 26 Mar 2021 10:31:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39CDD6F3A5;
 Fri, 26 Mar 2021 10:31:16 +0000 (UTC)
IronPort-SDR: M9WsuhrqYrKLyOwu+fuoc9R0FtX+zSYKbwpdetm2kuISqiotCJduUSSt8GIbX9UjvA8Td+EYhx
 BFnVLGodRi6A==
X-IronPort-AV: E=McAfee;i="6000,8403,9934"; a="178241119"
X-IronPort-AV: E=Sophos;i="5.81,280,1610438400"; d="scan'208";a="178241119"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2021 03:31:15 -0700
IronPort-SDR: C7AwFWCq6f1e/prB624TMUEqFrbgz1agsGFSkjvWF13cLGAODzRRhQrDANpsBs8zC8jo+8NqAz
 Jq/fctLSzplw==
X-IronPort-AV: E=Sophos;i="5.81,280,1610438400"; d="scan'208";a="453466278"
Received: from andrewdo-mobl.ger.corp.intel.com (HELO [10.213.247.55])
 ([10.213.247.55])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2021 03:31:13 -0700
Subject: Re: [Intel-gfx] [PATCH v4 0/7] Default request/fence expiry + watchdog
To: Daniel Vetter <daniel@ffwll.ch>
References: <20210324121335.2307063-1-tvrtko.ursulin@linux.intel.com>
 <YF2k9TivGrDdenoE@phenom.ffwll.local>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
Message-ID: <a73d8204-c3e4-9dda-e587-28c7c134dd59@linux.intel.com>
Date: Fri, 26 Mar 2021 10:31:10 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <YF2k9TivGrDdenoE@phenom.ffwll.local>
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
Cc: Intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 26/03/2021 09:10, Daniel Vetter wrote:
> On Wed, Mar 24, 2021 at 12:13:28PM +0000, Tvrtko Ursulin wrote:
>> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>>
>> "Watchdog" aka "restoring hangcheck" aka default request/fence expiry - second
>> post of a somewhat controversial feature, now upgraded to patch status.
>>
>> I quote the "watchdog" becuase in classical sense watchdog would allow userspace
>> to ping it and so remain alive.
>>
>> I quote "restoring hangcheck" because this series, contrary to the old
>> hangcheck, is not looking at whether the workload is making any progress from
>> the kernel side either. (Although disclaimer my memory may be leaky - Daniel
>> suspects old hangcheck had some stricter, more indiscriminatory, angles to it.
>> But apart from being prone to both false negatives and false positives I can't
>> remember that myself.)
>>
>> Short version - ask is to fail any user submissions after a set time period. In
>> this RFC that time is twelve seconds.
>>
>> Time counts from the moment user submission is "runnable" (implicit and explicit
>> dependencies have been cleared) and keeps counting regardless of the GPU
>> contetion caused by other users of the system.
>>
>> So semantics are really a bit weak, but again, I understand this is really
>> really wanted by the DRM core even if I am not convinced it is a good idea.
>>
>> There are some dangers with doing this - text borrowed from a patch in the
>> series:
>>
>>    This can have an effect that workloads which used to work fine will
>>    suddenly start failing. Even workloads comprised of short batches but in
>>    long dependency chains can be terminated.
>>
>>    And becuase of lack of agreement on usefulness and safety of fence error
>>    propagation this partial execution can be invisible to userspace even if
>>    it is "listening" to returned fence status.
>>
>>    Another interaction is with hangcheck where care needs to be taken timeout
>>    is not set lower or close to three times the heartbeat interval. Otherwise
>>    a hang in any application can cause complete termination of all
>>    submissions from unrelated clients. Any users modifying the per engine
>>    heartbeat intervals therefore need to be aware of this potential denial of
>>    service to avoid inadvertently enabling it.
>>
>>    Given all this I am personally not convinced the scheme is a good idea.
>>    Intuitively it feels object importers would be better positioned to
>>    enforce the time they are willing to wait for something to complete.
>>
>> v2:
>>   * Dropped context param.
>>   * Improved commit messages and Kconfig text.
>>
>> v3:
>>   * Log timeouts.
>>   * Bump timeout to 20s to see if it helps Tigerlake.
> 
> I think 20s is a bit much, and seems like problem is still there in igt. I
> think we need look at that and figure out what to do with it. And then go
> back down with the timeout somewhat again since 20s is quite a long time.
> Irrespective of all the additional gaps/opens around watchdog timeout.

1)

The relationship with the hearbeat is the first issue. There we have 3x 
heartbeat period (each rounded to full second) before sending a 
high-prio pulse which can cause a preempt timeout and hence a 
reset/kicking out of a non-compliant request.

Defaults for those values mean default expiry shouldn't be lower than 3x 
rounded hearbeat interval + preempt timeout, currently ~9.75s. In 
practice even 12s which I tried initially was too aggressive due slacks 
on some platforms.

2)

20s seems to work apart that it shows the general regression 
unconditional default expiry adds. Either some existing IGTs which 
create long runnable chains, or the far-fence test which explicitly 
demonstrates this. AFAIK, and apart from the can_merge_rq yet 
unexplained oops, this is the only class of IGT failures which can appear.

So you could tweak it lower, if you also decide to make real hang 
detection stricter. But doing that also worsens the regression with 
loaded systems.

I only can have a large shrug/dontknow here since I wish we went more 
towards my suggestion of emulating setrlimit(RLIMIT_CPU). Meaning at 
least going with GPU time instead of elapsed time and possibly even 
leaving the policy of setting it to sysadmins. That would fit much 
better with our hangcheck, but, doesn't fit the drm core mandate.. hence 
I really don't know.

Regards,

Tvrtko

> -Daniel
> 
>>   * Fix sentinel assert.
>>
>> v4:
>>   * A round of review feedback applied.
>>
>> Chris Wilson (1):
>>    drm/i915: Individual request cancellation
>>
>> Tvrtko Ursulin (6):
>>    drm/i915: Extract active lookup engine to a helper
>>    drm/i915: Restrict sentinel requests further
>>    drm/i915: Handle async cancellation in sentinel assert
>>    drm/i915: Request watchdog infrastructure
>>    drm/i915: Fail too long user submissions by default
>>    drm/i915: Allow configuring default request expiry via modparam
>>
>>   drivers/gpu/drm/i915/Kconfig.profile          |  14 ++
>>   drivers/gpu/drm/i915/gem/i915_gem_context.c   |  73 ++++---
>>   .../gpu/drm/i915/gem/i915_gem_context_types.h |   4 +
>>   drivers/gpu/drm/i915/gt/intel_context_param.h |  11 +-
>>   drivers/gpu/drm/i915/gt/intel_context_types.h |   4 +
>>   .../gpu/drm/i915/gt/intel_engine_heartbeat.c  |   1 +
>>   .../drm/i915/gt/intel_execlists_submission.c  |  23 +-
>>   .../drm/i915/gt/intel_execlists_submission.h  |   2 +
>>   drivers/gpu/drm/i915/gt/intel_gt.c            |   3 +
>>   drivers/gpu/drm/i915/gt/intel_gt.h            |   2 +
>>   drivers/gpu/drm/i915/gt/intel_gt_requests.c   |  28 +++
>>   drivers/gpu/drm/i915/gt/intel_gt_types.h      |   7 +
>>   drivers/gpu/drm/i915/i915_params.c            |   5 +
>>   drivers/gpu/drm/i915/i915_params.h            |   1 +
>>   drivers/gpu/drm/i915/i915_request.c           | 129 ++++++++++-
>>   drivers/gpu/drm/i915/i915_request.h           |  16 +-
>>   drivers/gpu/drm/i915/selftests/i915_request.c | 201 ++++++++++++++++++
>>   17 files changed, 479 insertions(+), 45 deletions(-)
>>
>> -- 
>> 2.27.0
>>
>> _______________________________________________
>> Intel-gfx mailing list
>> Intel-gfx@lists.freedesktop.org
>> https://lists.freedesktop.org/mailman/listinfo/intel-gfx
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
