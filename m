Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B99CB345B4D
	for <lists+dri-devel@lfdr.de>; Tue, 23 Mar 2021 10:48:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B6D96E0DD;
	Tue, 23 Mar 2021 09:48:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E06136E0DB;
 Tue, 23 Mar 2021 09:48:24 +0000 (UTC)
IronPort-SDR: q2IahNmw84CzsHJIz+ndh1U08MFDz6AQ9DCOqvxRf+7hMp8o3vsFMzZkGupq9SBYVPvtHQXoEw
 BnkO1LncDwvA==
X-IronPort-AV: E=McAfee;i="6000,8403,9931"; a="188127758"
X-IronPort-AV: E=Sophos;i="5.81,271,1610438400"; d="scan'208";a="188127758"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2021 02:48:24 -0700
IronPort-SDR: vmoHpaZrdGh97n1ivmxXbMxWwe1TAvGQ0h+qTr5Zi/f8t2BwhEGLN1vw6PJdpKhkO3lPHjqeTc
 /4H0vWUHyUSA==
X-IronPort-AV: E=Sophos;i="5.81,271,1610438400"; d="scan'208";a="452077134"
Received: from fbogue-mobl1.ger.corp.intel.com (HELO [10.213.247.160])
 ([10.213.247.160])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2021 02:48:20 -0700
Subject: Re: [Intel-gfx] [PATCH 1/6] drm/i915: Individual request cancellation
To: Matthew Auld <matthew.william.auld@gmail.com>
References: <20210318170419.2107512-1-tvrtko.ursulin@linux.intel.com>
 <20210318170419.2107512-2-tvrtko.ursulin@linux.intel.com>
 <CAM0jSHNLVqvtMPs+vdiDVpiZwotruqxyCLzBjbZSoVHaCDd3rg@mail.gmail.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
Message-ID: <fdfde4a0-b748-bcd9-e427-080eeaef3bec@linux.intel.com>
Date: Tue, 23 Mar 2021 09:48:18 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <CAM0jSHNLVqvtMPs+vdiDVpiZwotruqxyCLzBjbZSoVHaCDd3rg@mail.gmail.com>
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
Cc: Intel Graphics Development <Intel-gfx@lists.freedesktop.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Chris Wilson <chris@chris-wilson.co.uk>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 22/03/2021 15:38, Matthew Auld wrote:
> On Thu, 18 Mar 2021 at 17:04, Tvrtko Ursulin
> <tvrtko.ursulin@linux.intel.com> wrote:
>>
>> From: Chris Wilson <chris@chris-wilson.co.uk>
>>
>> Currently, we cancel outstanding requests within a context when the
>> context is closed. We may also want to cancel individual requests using
>> the same graceful preemption mechanism.
>>
>> v2 (Tvrtko):
>>   * Cancel waiters carefully considering no timeline lock and RCU.
>>   * Fixed selftests.
>>
>> v3 (Tvrtko):
>>   * Remove error propagation to waiters for now.
>>
>> Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>> ---
>>   .../gpu/drm/i915/gt/intel_engine_heartbeat.c  |   1 +
>>   .../drm/i915/gt/intel_execlists_submission.c  |   9 +-
>>   drivers/gpu/drm/i915/i915_request.c           |  52 ++++-
>>   drivers/gpu/drm/i915/i915_request.h           |   4 +-
>>   drivers/gpu/drm/i915/selftests/i915_request.c | 201 ++++++++++++++++++
>>   5 files changed, 261 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gt/intel_engine_heartbeat.c b/drivers/gpu/drm/i915/gt/intel_engine_heartbeat.c
>> index 0b062fad1837..e2fb3ae2aaf3 100644
>> --- a/drivers/gpu/drm/i915/gt/intel_engine_heartbeat.c
>> +++ b/drivers/gpu/drm/i915/gt/intel_engine_heartbeat.c
>> @@ -314,6 +314,7 @@ int intel_engine_pulse(struct intel_engine_cs *engine)
>>                  mutex_unlock(&ce->timeline->mutex);
>>          }
>>
>> +       intel_engine_flush_scheduler(engine);
>>          intel_engine_pm_put(engine);
>>          return err;
>>   }
>> diff --git a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
>> index 85ff5fe861b4..4c2acb5a6c0a 100644
>> --- a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
>> +++ b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
>> @@ -421,6 +421,11 @@ static void reset_active(struct i915_request *rq,
>>          ce->lrc.lrca = lrc_update_regs(ce, engine, head);
>>   }
>>
>> +static bool bad_request(const struct i915_request *rq)
>> +{
>> +       return rq->fence.error && i915_request_started(rq);
>> +}
>> +
>>   static struct intel_engine_cs *
>>   __execlists_schedule_in(struct i915_request *rq)
>>   {
>> @@ -433,7 +438,7 @@ __execlists_schedule_in(struct i915_request *rq)
>>                       !intel_engine_has_heartbeat(engine)))
>>                  intel_context_set_banned(ce);
>>
>> -       if (unlikely(intel_context_is_banned(ce)))
>> +       if (unlikely(intel_context_is_banned(ce) || bad_request(rq)))
>>                  reset_active(rq, engine);
>>
>>          if (IS_ENABLED(CONFIG_DRM_I915_DEBUG_GEM))
>> @@ -1112,7 +1117,7 @@ static unsigned long active_preempt_timeout(struct intel_engine_cs *engine,
>>                  return 0;
>>
>>          /* Force a fast reset for terminated contexts (ignoring sysfs!) */
>> -       if (unlikely(intel_context_is_banned(rq->context)))
>> +       if (unlikely(intel_context_is_banned(rq->context) || bad_request(rq)))
>>                  return 1;
>>
>>          return READ_ONCE(engine->props.preempt_timeout_ms);
>> diff --git a/drivers/gpu/drm/i915/i915_request.c b/drivers/gpu/drm/i915/i915_request.c
>> index e7b4c4bc41a6..b4511ac05e9a 100644
>> --- a/drivers/gpu/drm/i915/i915_request.c
>> +++ b/drivers/gpu/drm/i915/i915_request.c
>> @@ -33,7 +33,10 @@
>>   #include "gem/i915_gem_context.h"
>>   #include "gt/intel_breadcrumbs.h"
>>   #include "gt/intel_context.h"
>> +#include "gt/intel_engine.h"
>> +#include "gt/intel_engine_heartbeat.h"
>>   #include "gt/intel_gpu_commands.h"
>> +#include "gt/intel_reset.h"
>>   #include "gt/intel_ring.h"
>>   #include "gt/intel_rps.h"
>>
>> @@ -429,20 +432,22 @@ void __i915_request_skip(struct i915_request *rq)
>>          rq->infix = rq->postfix;
>>   }
>>
>> -void i915_request_set_error_once(struct i915_request *rq, int error)
>> +bool i915_request_set_error_once(struct i915_request *rq, int error)
>>   {
>>          int old;
>>
>>          GEM_BUG_ON(!IS_ERR_VALUE((long)error));
>>
>>          if (i915_request_signaled(rq))
>> -               return;
>> +               return false;
>>
>>          old = READ_ONCE(rq->fence.error);
>>          do {
>>                  if (fatal_error(old))
>> -                       return;
>> +                       return false;
>>          } while (!try_cmpxchg(&rq->fence.error, &old, error));
>> +
>> +       return true;
>>   }
>>
>>   struct i915_request *i915_request_mark_eio(struct i915_request *rq)
>> @@ -609,6 +614,47 @@ void i915_request_unsubmit(struct i915_request *request)
>>          spin_unlock_irqrestore(&se->lock, flags);
>>   }
>>
>> +static struct intel_engine_cs *active_engine(struct i915_request *rq)
>> +{
>> +       struct intel_engine_cs *engine, *locked;
>> +
>> +       locked = READ_ONCE(rq->engine);
>> +       spin_lock_irq(&locked->sched.lock);
>> +       while (unlikely(locked != (engine = READ_ONCE(rq->engine)))) {
>> +               spin_unlock(&locked->sched.lock);
>> +               locked = engine;
>> +               spin_lock(&locked->sched.lock);
>> +       }
>> +
>> +       engine = NULL;
>> +       if (i915_request_is_active(rq) && !__i915_request_is_complete(rq))
>> +               engine = locked;
>> +
>> +       spin_unlock_irq(&locked->sched.lock);
>> +
>> +       return engine;
> 
> Bad idea to reuse __active_engine() somehow?

I can try and see how it ends up looking.

> Reviewed-by: Matthew Auld <matthew.auld@intel.com>
> 

Thanks,

Tvrtko
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
