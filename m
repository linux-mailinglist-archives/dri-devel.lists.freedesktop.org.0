Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B84343ADE7
	for <lists+dri-devel@lfdr.de>; Tue, 26 Oct 2021 10:22:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACD936E400;
	Tue, 26 Oct 2021 08:22:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B20C6E400;
 Tue, 26 Oct 2021 08:22:34 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10148"; a="230128723"
X-IronPort-AV: E=Sophos;i="5.87,182,1631602800"; d="scan'208";a="230128723"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2021 01:22:31 -0700
X-IronPort-AV: E=Sophos;i="5.87,182,1631602800"; d="scan'208";a="723980115"
Received: from fnygreen-mobl1.ger.corp.intel.com (HELO [10.249.254.182])
 ([10.249.254.182])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2021 01:22:30 -0700
Message-ID: <4ce320ad-623f-fb27-6772-aac2ae18a9fb@linux.intel.com>
Date: Tue, 26 Oct 2021 10:22:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH] drm/i915/selftests: Allow engine reset failure to do a GT
 reset in hangcheck selftest
Content-Language: en-US
To: Matthew Brost <matthew.brost@intel.com>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 john.c.harrison@intel.com
References: <20211011234705.30853-1-matthew.brost@intel.com>
 <f8f1ae021e8cabc2c6d76996b5e74912cb0913db.camel@linux.intel.com>
 <20211021203747.GA27209@jons-linux-dev-box>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <20211021203747.GA27209@jons-linux-dev-box>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 10/21/21 22:37, Matthew Brost wrote:
> On Thu, Oct 21, 2021 at 08:15:49AM +0200, Thomas Hellström wrote:
>> Hi, Matthew,
>>
>> On Mon, 2021-10-11 at 16:47 -0700, Matthew Brost wrote:
>>> The hangcheck selftest blocks per engine resets by setting magic bits
>>> in
>>> the reset flags. This is incorrect for GuC submission because if the
>>> GuC
>>> fails to reset an engine we would like to do a full GT reset. Do no
>>> set
>>> these magic bits when using GuC submission.
>>>
>>> Side note this lockless algorithm with magic bits to block resets
>>> really
>>> should be ripped out.
>>>
>> Lockless algorithm aside, from a quick look at the code in
>> intel_reset.c it appears to me like the interface that falls back to a
>> full GT reset is intel_gt_handle_error() whereas intel_engine_reset()
>> is explicitly intended to not do that, so is there a discrepancy
>> between GuC and non-GuC here?
>>
> With GuC submission when an engine reset fails, we get an engine reset
> failure notification which triggers a full GT reset
> (intel_guc_engine_failure_process_msg in intel_guc_submission.c). That
> reset is blocking by setting these magic bits. Clearing the bits in this
> function doesn't seem to unblock that reset either, the driver tries to
> unload with a worker blocked, and results in the blow up. Something with
> this lockless algorithm could be wrong as clear of the bit should
> unlblock the reset but it is doesn't. We can look into that but in the
> meantime we need to fix this test to be able to fail gracefully and not
> crash CI.
>
> Matt

Hmm, OK I think the situation is a bit unfortunate with the selftest 
hangcheck as the code is sprinkled with "using_guc" to disable anything 
that manually does per-engine resets or verifies the per-engine reset 
count, leaving it very difficult to understand what the test actually 
does except perhaps checking that GuC actually did a reset.

A better approach would probably be to disable all tests that doesn't do 
anything exept iterating through the engines with GuC, and for the other 
tests, extract what's left to test into GuC specific tests.

The bit-locks are obviously there to verify that we don't do concurrent 
per-engine resets or global resets while a per-engine reset is 
happening. Even in the GuC case it appears at least the latter is true 
for this particular self-test, but at the same time the selftest doesn't 
assume anything is trying to reset concurrently and therefore doesn't 
use clear_and_wake_up_bit() when releasing the bit-locks.

But as much as I want the selftests to start running again, TBH I don't 
think I can contribute to even more code being conditioned on GuC with 
an R-B here. Could we disable the per-engine reset tests when GuC is 
enabled for now or try a clear_and_wake_up_bit() instead.

/Thomas


>> /Thomas
>>
>>
>>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>>> ---
>>>   drivers/gpu/drm/i915/gt/selftest_hangcheck.c | 12 ++++++++----
>>>   1 file changed, 8 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/i915/gt/selftest_hangcheck.c
>>> b/drivers/gpu/drm/i915/gt/selftest_hangcheck.c
>>> index 7e2d99dd012d..90a03c60c80c 100644
>>> --- a/drivers/gpu/drm/i915/gt/selftest_hangcheck.c
>>> +++ b/drivers/gpu/drm/i915/gt/selftest_hangcheck.c
>>> @@ -734,7 +734,8 @@ static int __igt_reset_engine(struct intel_gt
>>> *gt, bool active)
>>>                  reset_engine_count = i915_reset_engine_count(global,
>>> engine);
>>>   
>>>                  st_engine_heartbeat_disable(engine);
>>> -               set_bit(I915_RESET_ENGINE + id, &gt->reset.flags);
>>> +               if (!using_guc)
>>> +                       set_bit(I915_RESET_ENGINE + id, &gt-
>>>> reset.flags);
>>>                  count = 0;
>>>                  do {
>>>                          struct i915_request *rq = NULL;
>>> @@ -824,7 +825,8 @@ static int __igt_reset_engine(struct intel_gt
>>> *gt, bool active)
>>>                          if (err)
>>>                                  break;
>>>                  } while (time_before(jiffies, end_time));
>>> -               clear_bit(I915_RESET_ENGINE + id, &gt->reset.flags);
>>> +               if (!using_guc)
>>> +                       clear_bit(I915_RESET_ENGINE + id, &gt-
>>>> reset.flags);
>>>                  st_engine_heartbeat_enable(engine);
>>>                  pr_info("%s: Completed %lu %s resets\n",
>>>                          engine->name, count, active ? "active" :
>>> "idle");
>>> @@ -1042,7 +1044,8 @@ static int __igt_reset_engines(struct intel_gt
>>> *gt,
>>>                  yield(); /* start all threads before we begin */
>>>   
>>>                  st_engine_heartbeat_disable_no_pm(engine);
>>> -               set_bit(I915_RESET_ENGINE + id, &gt->reset.flags);
>>> +               if (!using_guc)
>>> +                       set_bit(I915_RESET_ENGINE + id, &gt-
>>>> reset.flags);
>>>                  do {
>>>                          struct i915_request *rq = NULL;
>>>                          struct intel_selftest_saved_policy saved;
>>> @@ -1165,7 +1168,8 @@ static int __igt_reset_engines(struct intel_gt
>>> *gt,
>>>                          if (err)
>>>                                  break;
>>>                  } while (time_before(jiffies, end_time));
>>> -               clear_bit(I915_RESET_ENGINE + id, &gt->reset.flags);
>>> +               if (!using_guc)
>>> +                       clear_bit(I915_RESET_ENGINE + id, &gt-
>>>> reset.flags);
>>>                  st_engine_heartbeat_enable_no_pm(engine);
>>>   
>>>                  pr_info("i915_reset_engine(%s:%s): %lu resets\n",
>>
