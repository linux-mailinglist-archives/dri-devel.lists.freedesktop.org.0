Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F4D243C312
	for <lists+dri-devel@lfdr.de>; Wed, 27 Oct 2021 08:37:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDBF56E52F;
	Wed, 27 Oct 2021 06:37:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB1BF6E52E;
 Wed, 27 Oct 2021 06:36:58 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10149"; a="229944572"
X-IronPort-AV: E=Sophos;i="5.87,186,1631602800"; d="scan'208";a="229944572"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2021 23:36:58 -0700
X-IronPort-AV: E=Sophos;i="5.87,186,1631602800"; d="scan'208";a="465614762"
Received: from shishpan-mobl2.ccr.corp.intel.com (HELO [10.249.254.198])
 ([10.249.254.198])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2021 23:36:57 -0700
Message-ID: <5af5389a-2f42-16ad-90d2-d329801a882f@linux.intel.com>
Date: Wed, 27 Oct 2021 08:36:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH] drm/i915/selftests: Allow engine reset failure to do a GT
 reset in hangcheck selftest
Content-Language: en-US
To: John Harrison <john.c.harrison@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20211011234705.30853-1-matthew.brost@intel.com>
 <f8f1ae021e8cabc2c6d76996b5e74912cb0913db.camel@linux.intel.com>
 <20211021203747.GA27209@jons-linux-dev-box>
 <ee989711-779e-874f-6737-ab9288557d1a@linux.intel.com>
 <5deddbeb-328c-62b3-38e2-d855fc99668b@intel.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <5deddbeb-328c-62b3-38e2-d855fc99668b@intel.com>
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

Hi, John,

On 10/26/21 21:55, John Harrison wrote:
> On 10/21/2021 23:23, Thomas Hellström wrote:
>> On 10/21/21 22:37, Matthew Brost wrote:
>>> On Thu, Oct 21, 2021 at 08:15:49AM +0200, Thomas Hellström wrote:
>>>> Hi, Matthew,
>>>>
>>>> On Mon, 2021-10-11 at 16:47 -0700, Matthew Brost wrote:
>>>>> The hangcheck selftest blocks per engine resets by setting magic bits
>>>>> in
>>>>> the reset flags. This is incorrect for GuC submission because if the
>>>>> GuC
>>>>> fails to reset an engine we would like to do a full GT reset. Do no
>>>>> set
>>>>> these magic bits when using GuC submission.
>>>>>
>>>>> Side note this lockless algorithm with magic bits to block resets
>>>>> really
>>>>> should be ripped out.
>>>>>
>>>> Lockless algorithm aside, from a quick look at the code in
>>>> intel_reset.c it appears to me like the interface that falls back to a
>>>> full GT reset is intel_gt_handle_error() whereas intel_engine_reset()
>>>> is explicitly intended to not do that, so is there a discrepancy
>>>> between GuC and non-GuC here?
>>>>
>>> With GuC submission when an engine reset fails, we get an engine reset
>>> failure notification which triggers a full GT reset
>>> (intel_guc_engine_failure_process_msg in intel_guc_submission.c). That
>>> reset is blocking by setting these magic bits. Clearing the bits in 
>>> this
>>> function doesn't seem to unblock that reset either, the driver tries to
>>> unload with a worker blocked, and results in the blow up. Something 
>>> with
>>> this lockless algorithm could be wrong as clear of the bit should
>>> unlblock the reset but it is doesn't. We can look into that but in the
>>> meantime we need to fix this test to be able to fail gracefully and not
>>> crash CI.
>>
>> Yeah, for that lockless algorithm if needed, we might want to use a 
>> ww_mutex per engine or something,
>> but point was that AFAICT at least one of the tests that set those 
>> flags explicitly tested the functionality that no other engines than 
>> the intended one was reset when the intel_engine_reset() function was 
>> used, and then if GuC submission doesn't honor that, wouldn't a 
>> better approach be to make a code comment around intel_engine_reset() 
>> to explain the differences and disable that particular test for GuC?. 
>> Also wouldn't we for example we see a duplicated full GT reset with 
>> GuC if intel_engine_reset() fails as part of the 
>> intel_gt_handle_error() function?
> Re-reading this thread, I think there is a misunderstanding.
>
> The selftests themselves have already been updated to support GuC 
> based engine resets. That is done by submitting a hanging context and 
> letting the GuC detect the hang and issue a reset. There is no 
> mechanism available for i915 to directly issue or request an engine 
> based reset (because i915 does not know what is running on any given 
> engine at any given time, being disconnected from the scheduler).
>
> So the tests are already correctly testing per engine resets and do 
> not go anywhere near either intel_engine_reset() or 
> intel_gt_handle_error() when GuC submission is used. The problem is 
> what happens if the engine reset fails (which supposedly can only 
> happen with broken hardware). In that scenario, there is an 
> asynchronous message from GuC to i915 to notify us of the failure. The 
> KMD receives that notification and then (eventually) calls 
> intel_gt_handle_error() to issue a full GT reset. However, that is 
> blocked because the selftest is not expecting it and has vetoed the 
> possibility.

This is where my understanding of the discussion differs. According to 
Matthew, the selftest actually proceeds to clear the bits, but the 
worker that calls into intel_gt_handle_error() never wakes up. (and 
that's probably due to clear_bit() being used instead of 
clear_and_wake_up_bit()).

And my problem with this particular patch is that it adds even more "if 
(!guc_submission)" which is already sprinkled all over the place in the 
selftests to the point that it becomes difficult to see what (if 
anything) the tests are really testing. For example 
igt_reset_nop_engine() from a cursory look looks like it's doing 
something but inside the engine loop it becomes clear that the test 
doesn't do *anything* except iterate over engines. Same for 
igt_reset_engines() in the !TEST_ACTIVE case and for 
igt_reset_idle_engine(). For some other tests the reset_count checks are 
gone, leaving only a test that we actually do a reset.

So if possible, as previously mentioned, I think a solution without 
adding more of this in the selftests is preferrable. To me the best 
option is probably be the one you suggest in your previous email: Don't 
wait on the I915_RESET_ENGINE bits with GuC in intel_gt_handle_error(), 
(or perhaps extract what's left in a separate function called from the 
GuC handler).

Thanks,

Thomas



