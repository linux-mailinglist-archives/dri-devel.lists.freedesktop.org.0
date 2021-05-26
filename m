Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C393D391396
	for <lists+dri-devel@lfdr.de>; Wed, 26 May 2021 11:25:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D49406E5D2;
	Wed, 26 May 2021 09:25:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CF7289CB9;
 Wed, 26 May 2021 09:25:17 +0000 (UTC)
IronPort-SDR: pBMT2a7JwHBcxo1ncqd6IAweklObwyluQYthdYzwAZO526iMjJI53LlhX1/hIPFB6UVuFGosq8
 iC6BNUkewaRw==
X-IronPort-AV: E=McAfee;i="6200,9189,9995"; a="182750186"
X-IronPort-AV: E=Sophos;i="5.82,331,1613462400"; d="scan'208";a="182750186"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2021 02:25:16 -0700
IronPort-SDR: meym1bg2FY1xTxBIaAXwnSwse2Oc8Z/X1VswiqcK6BitzXOwZjnTx/GDqsHDwhtqw0apT0YFnP
 iN3fjk7KT4UA==
X-IronPort-AV: E=Sophos;i="5.82,331,1613462400"; d="scan'208";a="479806786"
Received: from wardmich-mobl.ger.corp.intel.com (HELO [10.213.209.181])
 ([10.213.209.181])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2021 02:25:15 -0700
Subject: Re: [Intel-gfx] [RFC PATCH 53/97] drm/i915/guc: Disable semaphores
 when using GuC scheduling
To: Matthew Brost <matthew.brost@intel.com>
References: <20210506191451.77768-1-matthew.brost@intel.com>
 <20210506191451.77768-54-matthew.brost@intel.com>
 <295c0e48-5091-504a-5a81-10a60fa900f4@linux.intel.com>
 <20210525170131.GA14724@sdutt-i7>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
Message-ID: <cff93d4a-e852-0a33-9235-b019fd828a0a@linux.intel.com>
Date: Wed, 26 May 2021 10:25:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210525170131.GA14724@sdutt-i7>
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
Cc: jason.ekstrand@intel.com, daniel.vetter@intel.com,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 25/05/2021 18:01, Matthew Brost wrote:
> On Tue, May 25, 2021 at 10:52:01AM +0100, Tvrtko Ursulin wrote:
>>
>> On 06/05/2021 20:14, Matthew Brost wrote:
>>> Disable semaphores when using GuC scheduling as semaphores are broken in
>>> the current GuC firmware.
>>
>> What is "current"? Given that the patch itself is like year and a half old.
>>
> 
> Stale comment. Semaphore work with the firmware we just haven't enabled
> them in the i915 with GuC submission as this an optimization and not
> required for functionality.

How will the updated commit message look in terms of remaining reasons 
why semaphores won't/can't be enabled?

They were a nice performance win on some media workloads although 
granted a lot of tweaking was required to find a good balance on when to 
use them and when not to.

Regards,

Tvrtko

> Matt
> 
>> Regards,
>>
>> Tvrtko
>>
>>> Cc: John Harrison <john.c.harrison@intel.com>
>>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>>> ---
>>>    drivers/gpu/drm/i915/gem/i915_gem_context.c | 6 ++++--
>>>    1 file changed, 4 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/gem/i915_gem_context.c
>>> index 993faa213b41..d30260ffe2a7 100644
>>> --- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
>>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
>>> @@ -230,7 +230,8 @@ static void intel_context_set_gem(struct intel_context *ce,
>>>    		ce->timeline = intel_timeline_get(ctx->timeline);
>>>    	if (ctx->sched.priority >= I915_PRIORITY_NORMAL &&
>>> -	    intel_engine_has_timeslices(ce->engine))
>>> +	    intel_engine_has_timeslices(ce->engine) &&
>>> +	    intel_engine_has_semaphores(ce->engine))
>>>    		__set_bit(CONTEXT_USE_SEMAPHORES, &ce->flags);
>>>    	intel_context_set_watchdog_us(ce, ctx->watchdog.timeout_us);
>>> @@ -1939,7 +1940,8 @@ static int __apply_priority(struct intel_context *ce, void *arg)
>>>    	if (!intel_engine_has_timeslices(ce->engine))
>>>    		return 0;
>>> -	if (ctx->sched.priority >= I915_PRIORITY_NORMAL)
>>> +	if (ctx->sched.priority >= I915_PRIORITY_NORMAL &&
>>> +	    intel_engine_has_semaphores(ce->engine))
>>>    		intel_context_set_use_semaphores(ce);
>>>    	else
>>>    		intel_context_clear_use_semaphores(ce);
>>>
