Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5CED617A13
	for <lists+dri-devel@lfdr.de>; Thu,  3 Nov 2022 10:38:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D7ED10E5C7;
	Thu,  3 Nov 2022 09:38:29 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 761EF10E5C7;
 Thu,  3 Nov 2022 09:38:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1667468303; x=1699004303;
 h=message-id:date:mime-version:subject:from:to:cc:
 references:in-reply-to:content-transfer-encoding;
 bh=7VGgWd6x608+WUHZSAoKi7Zyp85tQeycWq+CFUuL7nM=;
 b=NDdWQNEvIIucbp128Yf31+x10MA0r2zh5gkVusj1GxAy5af0ack7GD8D
 4OVRlprYrrrH2atx6c6EyDxq2xGHsEgQHL+3SlD3WQKIpcYX/cIz2ruzn
 xnj0yzV4hCtb4qGOm3A4tt59b3BU+MiIvvKTUJ1fsPAGVwpwhrUPLu545
 lCpw0ttlBl2t0acrkHXHe3uME37O24SzuiAKZNwUiSWotPy8kq3PEE/cA
 I34SbGFOdfpDWsNQozpk/l6HkCJPvVgBzqdUtFLCJ8VxSbJRgrjm54/LT
 sYANJDMXsv0yJ+YabsfyGcjnn5tpKql2obn13ny4fOo9b1LBnqDpgLnZ7 Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10519"; a="290024684"
X-IronPort-AV: E=Sophos;i="5.95,235,1661842800"; d="scan'208";a="290024684"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2022 02:38:23 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10519"; a="703606605"
X-IronPort-AV: E=Sophos;i="5.95,235,1661842800"; d="scan'208";a="703606605"
Received: from khogan-mobl1.ger.corp.intel.com (HELO [10.213.226.17])
 ([10.213.226.17])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2022 02:38:16 -0700
Message-ID: <2b2eb780-08f7-c7df-0397-a7f732da272d@linux.intel.com>
Date: Thu, 3 Nov 2022 09:38:14 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [Intel-gfx] [PATCH] drm/i915: Don't wait forever in drop_caches
Content-Language: en-US
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: John Harrison <john.c.harrison@intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, Intel-GFX@Lists.FreeDesktop.Org
References: <20221101235053.1650364-1-John.C.Harrison@Intel.com>
 <87k04d7dyn.fsf@intel.com>
 <c710a428-50f6-6181-3f93-4d7667a9ac3f@linux.intel.com>
 <5e22de43-d75c-fc21-9ae7-f27d116c5688@intel.com>
 <1855f0f2-8a1c-7bf4-76c0-76a4354ea8e8@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <1855f0f2-8a1c-7bf4-76c0-76a4354ea8e8@linux.intel.com>
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
Cc: DRI-Devel@Lists.FreeDesktop.Org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 03/11/2022 09:18, Tvrtko Ursulin wrote:
> 
> On 03/11/2022 01:33, John Harrison wrote:
>> On 11/2/2022 07:20, Tvrtko Ursulin wrote:
>>> On 02/11/2022 12:12, Jani Nikula wrote:
>>>> On Tue, 01 Nov 2022, John.C.Harrison@Intel.com wrote:
>>>>> From: John Harrison <John.C.Harrison@Intel.com>
>>>>>
>>>>> At the end of each test, IGT does a drop caches call via sysfs with
>>>>
>>>> sysfs?
>> Sorry, that was meant to say debugfs. I've also been working on some 
>> sysfs IGT issues and evidently got my wires crossed!
>>
>>>>
>>>>> special flags set. One of the possible paths waits for idle with an
>>>>> infinite timeout. That causes problems for debugging issues when CI
>>>>> catches a "can't go idle" test failure. Best case, the CI system times
>>>>> out (after 90s), attempts a bunch of state dump actions and then
>>>>> reboots the system to recover it. Worst case, the CI system can't do
>>>>> anything at all and then times out (after 1000s) and simply reboots.
>>>>> Sometimes a serial port log of dmesg might be available, sometimes 
>>>>> not.
>>>>>
>>>>> So rather than making life hard for ourselves, change the timeout to
>>>>> be 10s rather than infinite. Also, trigger the standard
>>>>> wedge/reset/recover sequence so that testing can continue with a
>>>>> working system (if possible).
>>>>>
>>>>> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
>>>>> ---
>>>>>   drivers/gpu/drm/i915/i915_debugfs.c | 7 ++++++-
>>>>>   1 file changed, 6 insertions(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/i915/i915_debugfs.c 
>>>>> b/drivers/gpu/drm/i915/i915_debugfs.c
>>>>> index ae987e92251dd..9d916fbbfc27c 100644
>>>>> --- a/drivers/gpu/drm/i915/i915_debugfs.c
>>>>> +++ b/drivers/gpu/drm/i915/i915_debugfs.c
>>>>> @@ -641,6 +641,9 @@ DEFINE_SIMPLE_ATTRIBUTE(i915_perf_noa_delay_fops,
>>>>>             DROP_RESET_ACTIVE | \
>>>>>             DROP_RESET_SEQNO | \
>>>>>             DROP_RCU)
>>>>> +
>>>>> +#define DROP_IDLE_TIMEOUT    (HZ * 10)
>>>>
>>>> I915_IDLE_ENGINES_TIMEOUT is defined in i915_drv.h. It's also only used
>>>> here.
>>>
>>> So move here, dropping i915 prefix, next to the newly proposed one?
>> Sure, can do that.
>>
>>>
>>>> I915_GEM_IDLE_TIMEOUT is defined in i915_gem.h. It's only used in
>>>> gt/intel_gt.c.
>>>
>>> Move there and rename to GT_IDLE_TIMEOUT?
>>>
>>>> I915_GT_SUSPEND_IDLE_TIMEOUT is defined and used only in intel_gt_pm.c.
>>>
>>> No action needed, maybe drop i915 prefix if wanted.
>>>
>> These two are totally unrelated and in code not being touched by this 
>> change. I would rather not conflate changing random other things with 
>> fixing this specific issue.
>>
>>>> I915_IDLE_ENGINES_TIMEOUT is in ms, the rest are in jiffies.
>>>
>>> Add _MS suffix if wanted.
>>>
>>>> My head spins.
>>>
>>> I follow and raise that the newly proposed DROP_IDLE_TIMEOUT applies 
>>> to DROP_ACTIVE and not only DROP_IDLE.
>> My original intention for the name was that is the 'drop caches 
>> timeout for intel_gt_wait_for_idle'. Which is quite the mouthful and 
>> hence abbreviated to DROP_IDLE_TIMEOUT. But yes, I realised later that 
>> name can be conflated with the DROP_IDLE flag. Will rename.
>>
>>
>>>
>>> Things get refactored, code moves around, bits get left behind, who 
>>> knows. No reason to get too worked up. :) As long as people are 
>>> taking a wider view when touching the code base, and are not afraid 
>>> to send cleanups, things should be good.
>> On the other hand, if every patch gets blocked in code review because 
>> someone points out some completely unrelated piece of code could be a 
>> bit better then nothing ever gets fixed. If you spot something that 
>> you think should be improved, isn't the general idea that you should 
>> post a patch yourself to improve it?
> 
> There's two maintainers per branch and an order of magnitude or two more 
> developers so it'd be nice if cleanups would just be incoming on 
> self-initiative basis. ;)
> 
>>> For the actual functional change at hand - it would be nice if code 
>>> paths in question could handle SIGINT and then we could punt the 
>>> decision on how long someone wants to wait purely to userspace. But 
>>> it's probably hard and it's only debugfs so whatever.
>>>
>> The code paths in question will already abort on a signal won't they? 
>> Both intel_gt_wait_for_idle() and intel_guc_wait_for_pending_msg(), 
>> which is where the uc_wait_for_idle eventually ends up, have an 
>> 'if(signal_pending) return -EINTR;' check. Beyond that, it sounds like 
>> what you are asking for is a change in the IGT libraries and/or CI 
>> framework to start sending signals after some specific timeout. That 
>> seems like a significantly more complex change (in terms of the number 
>> of entities affected and number of groups involved) and unnecessary.
> 
> If you say so, I haven't looked at them all. But if the code path in 
> question already aborts on signals then I am not sure what is the patch 
> fixing? I assumed you are trying to avoid the write stuck in D forever, 
> which then prevents driver unload and everything, requiring the test 
> runner to eventually reboot. If you say SIGINT works then you can 
> already recover from userspace, no?
> 
>>> Whether or not 10s is enough CI will hopefully tell us. I'd probably 
>>> err on the side of safety and make it longer, but at most half from 
>>> the test runner timeout.
>> This is supposed to be test clean up. This is not about how long a 
>> particular test takes to complete but about how long it takes to 
>> declare the system broken after the test has already finished. I would 
>> argue that even 10s is massively longer than required.
>>
>>>
>>> I am not convinced that wedging is correct though. Conceptually could 
>>> be just that the timeout is too short. What does wedging really give 
>>> us, on top of limiting the wait, when latter AFAIU is the key factor 
>>> which would prevent the need to reboot the machine?
>>>
>> It gives us a system that knows what state it is in. If we can't idle 
>> the GT then something is very badly wrong. Wedging indicates that. It 
>> also ensure that a full GT reset will be attempted before the next 
>> test is run. Helping to prevent a failure on test X from propagating 
>> into failures of unrelated tests X+1, X+2, ... And if the GT reset 
>> does not work because the system is really that badly broken then 
>> future tests will not run rather than report erroneous failures.
>>
>> This is not about getting a more stable system for end users by 
>> sweeping issues under the carpet and pretending all is well. End users 
>> don't run IGTs or explicitly call dodgy debugfs entry points. The sole 
>> motivation here is to get more accurate results from CI. That is, 
>> correctly identifying which test has hit a problem, getting valid 
>> debug analysis for that test (logs and such) and allowing further 
>> testing to complete correctly in the case where the system can be 
>> recovered.
> 
> I don't really oppose shortening of the timeout in principle, just want 
> a clear statement if this is something IGT / test runner could already 
> do or not. It can apply a timeout, it can also send SIGINT, and it could 
> even trigger a reset from outside. Sure it is debugfs hacks so general 
> "kernel should not implement policy" need not be strictly followed, but 
> lets have it clear what are the options.

One conceptual problem with applying this policy is that the code is:

	if (val & (DROP_IDLE | DROP_ACTIVE)) {
		ret = intel_gt_wait_for_idle(gt, MAX_SCHEDULE_TIMEOUT);
		if (ret)
			return ret;
	}

	if (val & DROP_IDLE) {
		ret = intel_gt_pm_wait_for_idle(gt);
		if (ret)
			return ret;
	}

So if someone passes in DROP_IDLE and then why would only the first 
branch have a short timeout and wedge. Yeah some bug happens to be there 
at the moment, but put a bug in a different place and you hang on the 
second branch and then need another patch. Versus perhaps making it all 
respect SIGINT and handle from outside.

Regards,

Tvrtko
