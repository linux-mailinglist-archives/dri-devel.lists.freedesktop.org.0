Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 462F2656CF4
	for <lists+dri-devel@lfdr.de>; Tue, 27 Dec 2022 17:33:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D61810E165;
	Tue, 27 Dec 2022 16:33:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E36AF10E163;
 Tue, 27 Dec 2022 16:33:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1672158811; x=1703694811;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=wrPCLmCNzk1NXwV7pSh5+JPMF+DWrM4rdO69H5fR02Q=;
 b=WUVOe1u2qwZQN9tWu/D8n8krV0S+mx5LvejOWdJZMijV4BpeYRTZs81l
 upYnxilh+yefjKRVaE2cWq+VeGHbjK1Y80VYJTTMd6c1B8xnZgZ+ni3RB
 5Cm9gZL5iXTaNgSJqznYaiO7vxHtRWD06jy/to8A9/T/KZ6KN0EejL174
 6LQhlYWTnzEnQRilz7loy/NmdbnsKBg7twcVEeCSsXjLjAwBnfTqUxlW5
 dm5iWHnoVSExqm7O2B23bgWuKRdcET8UABofC+2eCNP7LHK8q3t8JRW1B
 mmKY1BMBkpvwvr2OppiaHwmj79rSc0d8MdVEjxhtG106hmeOO6XWJJHra g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10573"; a="318399796"
X-IronPort-AV: E=Sophos;i="5.96,278,1665471600"; d="scan'208";a="318399796"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Dec 2022 08:33:21 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10573"; a="898400979"
X-IronPort-AV: E=Sophos;i="5.96,278,1665471600"; d="scan'208";a="898400979"
Received: from lsitkiew-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.8.250])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Dec 2022 08:33:20 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, Andi Shyti
 <andi.shyti@linux.intel.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [Intel-gfx] [PATCH] drm/i915/gt: Retry RING_HEAD reset until it
 sticks
In-Reply-To: <d99c1147-fc3f-71f0-c115-49febbf2aa3a@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20221223121821.358021-1-andi.shyti@linux.intel.com>
 <d99c1147-fc3f-71f0-c115-49febbf2aa3a@linux.intel.com>
Date: Tue, 27 Dec 2022 18:33:16 +0200
Message-ID: <87h6xg24dv.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: Andrzej Hajda <andrzej.hajda@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 23 Dec 2022, Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com> wrote:
> On 23/12/2022 12:18, Andi Shyti wrote:
>> From: Chris Wilson <chris@chris-wilson.co.uk>
>> 
>> On Haswell, in particular, we see an issue where resets fails because
>> the engine resumes from an incorrect RING_HEAD. Since the RING_HEAD
>> doesn't point to the remaining requests to re-run, but may instead point
>> into the uninitialised portion of the ring, the GPU may be then fed
>> invalid instructions from a privileged context, often pushing the GPU
>> into an unrecoverable hang.
>> 
>> If at first the write doesn't succeed, try, try again.
>> 
>> References: https://gitlab.freedesktop.org/drm/intel/-/issues/5432
>> References: https://gitlab.freedesktop.org/drm/intel/-/issues/3303
>> Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
>> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
>> Cc: Mika Kuoppala <mika.kuoppala@linux.intel.com>
>> Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
>> ---
>>   .../gpu/drm/i915/gt/intel_ring_submission.c   | 44 +++++++++++++------
>>   drivers/gpu/drm/i915/i915_utils.h             |  8 ++++
>>   2 files changed, 38 insertions(+), 14 deletions(-)
>> 
>> diff --git a/drivers/gpu/drm/i915/gt/intel_ring_submission.c b/drivers/gpu/drm/i915/gt/intel_ring_submission.c
>> index 827adb0cfaea6..cdf283f5b1427 100644
>> --- a/drivers/gpu/drm/i915/gt/intel_ring_submission.c
>> +++ b/drivers/gpu/drm/i915/gt/intel_ring_submission.c
>> @@ -192,6 +192,7 @@ static bool stop_ring(struct intel_engine_cs *engine)
>>   static int xcs_resume(struct intel_engine_cs *engine)
>>   {
>>   	struct intel_ring *ring = engine->legacy.ring;
>> +	ktime_t kt;
>>   
>>   	ENGINE_TRACE(engine, "ring:{HEAD:%04x, TAIL:%04x}\n",
>>   		     ring->head, ring->tail);
>> @@ -230,9 +231,20 @@ static int xcs_resume(struct intel_engine_cs *engine)
>>   	set_pp_dir(engine);
>>   
>>   	/* First wake the ring up to an empty/idle ring */
>> -	ENGINE_WRITE_FW(engine, RING_HEAD, ring->head);
>> +	until_timeout_ns(kt, 2 * NSEC_PER_MSEC) {
>> +		ENGINE_WRITE_FW(engine, RING_HEAD, ring->head);
>> +		if (ENGINE_READ_FW(engine, RING_HEAD) == ring->head)
>> +			break;
>> +	}
>
> 2ms?! Shudder..
>
> #define done \
> ({ \
> 	ENGINE_WRITE_FW(engine, RING_HEAD, ring->head); \
> 	ENGINE_READ_FW(engine, RING_HEAD) == ring->head; \
> })
> _wait_for_atomic(done, 2 * USEC_PER_MSEC, needs_to_be_atomic_or_not?);
> #undef done
>
> Should work and avoid the need to add yet another helper, please 
> double-check. Not as pretty, but accumulating generic sounding helpers 
> in i915_utils.h is a bit frowned upon.

Yeah, please no more helpers like this. They're not helping.

BR,
Jani.


>
> Regards,
>
> Tvrtko
>
>> +
>>   	ENGINE_WRITE_FW(engine, RING_TAIL, ring->head);
>> -	ENGINE_POSTING_READ(engine, RING_TAIL);
>> +	if (ENGINE_READ_FW(engine, RING_HEAD) != ENGINE_READ_FW(engine, RING_TAIL)) {
>> +		ENGINE_TRACE(engine, "failed to reset empty ring: [%x, %x]: %x\n",
>> +			     ENGINE_READ_FW(engine, RING_HEAD),
>> +			     ENGINE_READ_FW(engine, RING_TAIL),
>> +			     ring->head);
>> +		goto err;
>> +	}
>>   
>>   	ENGINE_WRITE_FW(engine, RING_CTL,
>>   			RING_CTL_SIZE(ring->size) | RING_VALID);
>> @@ -241,12 +253,16 @@ static int xcs_resume(struct intel_engine_cs *engine)
>>   	if (__intel_wait_for_register_fw(engine->uncore,
>>   					 RING_CTL(engine->mmio_base),
>>   					 RING_VALID, RING_VALID,
>> -					 5000, 0, NULL))
>> +					 5000, 0, NULL)) {
>> +		ENGINE_TRACE(engine, "failed to restart\n");
>>   		goto err;
>> +	}
>>   
>> -	if (GRAPHICS_VER(engine->i915) > 2)
>> +	if (GRAPHICS_VER(engine->i915) > 2) {
>>   		ENGINE_WRITE_FW(engine,
>>   				RING_MI_MODE, _MASKED_BIT_DISABLE(STOP_RING));
>> +		ENGINE_POSTING_READ(engine, RING_MI_MODE);
>> +	}
>>   
>>   	/* Now awake, let it get started */
>>   	if (ring->tail != ring->head) {
>> @@ -259,16 +275,16 @@ static int xcs_resume(struct intel_engine_cs *engine)
>>   	return 0;
>>   
>>   err:
>> -	drm_err(&engine->i915->drm,
>> -		"%s initialization failed; "
>> -		"ctl %08x (valid? %d) head %08x [%08x] tail %08x [%08x] start %08x [expected %08x]\n",
>> -		engine->name,
>> -		ENGINE_READ(engine, RING_CTL),
>> -		ENGINE_READ(engine, RING_CTL) & RING_VALID,
>> -		ENGINE_READ(engine, RING_HEAD), ring->head,
>> -		ENGINE_READ(engine, RING_TAIL), ring->tail,
>> -		ENGINE_READ(engine, RING_START),
>> -		i915_ggtt_offset(ring->vma));
>> +	ENGINE_TRACE(engine,
>> +		     "initialization failed; "
>> +		     "ctl %08x (valid? %d) head %08x [%08x] tail %08x [%08x] start %08x [expected %08x]\n",
>> +		     ENGINE_READ(engine, RING_CTL),
>> +		     ENGINE_READ(engine, RING_CTL) & RING_VALID,
>> +		     ENGINE_READ(engine, RING_HEAD), ring->head,
>> +		     ENGINE_READ(engine, RING_TAIL), ring->tail,
>> +		     ENGINE_READ(engine, RING_START),
>> +		     i915_ggtt_offset(ring->vma));
>> +	GEM_TRACE_DUMP();
>>   	return -EIO;
>>   }
>>   
>> diff --git a/drivers/gpu/drm/i915/i915_utils.h b/drivers/gpu/drm/i915/i915_utils.h
>> index b64192d9c7daa..f24a25c0685e1 100644
>> --- a/drivers/gpu/drm/i915/i915_utils.h
>> +++ b/drivers/gpu/drm/i915/i915_utils.h
>> @@ -254,6 +254,14 @@ wait_remaining_ms_from_jiffies(unsigned long timestamp_jiffies, int to_wait_ms)
>>   	}
>>   }
>>   
>> +/**
>> + * until_timeout_ns - Keep retrying (busy spin) until the duration has passed
>> + */
>> +#define until_timeout_ns(end, timeout_ns) \
>> +	for ((end) = ktime_get() + (timeout_ns); \
>> +	     ktime_before(ktime_get(), (end)); \
>> +	     cpu_relax())
>> + >   /**
>>    * __wait_for - magic wait macro
>>    *

-- 
Jani Nikula, Intel Open Source Graphics Center
