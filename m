Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 56BA7619407
	for <lists+dri-devel@lfdr.de>; Fri,  4 Nov 2022 11:01:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D71D010E72C;
	Fri,  4 Nov 2022 10:01:10 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 058F410E72D;
 Fri,  4 Nov 2022 10:01:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1667556068; x=1699092068;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=/wvhPFk170gmR/8qxmSwaXrQOrFcbJlf8+wrHV5wS5s=;
 b=bN60kKtz4u24efWgTFhOkRnkxX1Tvqmz5S8b1Yt0cvJnaAqfRZSbG9EM
 t9huX+sPosk1jm2xkuzTSXzZbty/Tc+C8HNrG9SrNDWYC2TcLH9k+NN67
 ppKYUA/jQXyZdAmTOBzg11ut/434FEhJbSzwWhgwwUV7oS1g3VdYQnfeH
 b9dcXXDh2imvAg4K61WKtjKQ5cCL4rGY8beYm7OiMmufpGY7NCELc8nu0
 vbALzs4S3VpQNy/IEl6Y7+ffVppxCgU50K80yZg74t8zwTPinyijlu9H+
 tz9B5WivHavSrK702ozaEVAdbuwQSL8WJMabLW5HnMJlZkAmyZ2hXY8w2 A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10520"; a="308643486"
X-IronPort-AV: E=Sophos;i="5.96,137,1665471600"; d="scan'208";a="308643486"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2022 03:01:07 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10520"; a="704029007"
X-IronPort-AV: E=Sophos;i="5.96,137,1665471600"; d="scan'208";a="704029007"
Received: from mlmesa-mobl2.ger.corp.intel.com (HELO [10.213.192.110])
 ([10.213.192.110])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2022 03:01:06 -0700
Message-ID: <448d710a-3af1-932d-c276-7c6fd6c02528@linux.intel.com>
Date: Fri, 4 Nov 2022 10:01:04 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [Intel-gfx] [PATCH] drm/i915: Don't wait forever in drop_caches
Content-Language: en-US
To: John Harrison <john.c.harrison@intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, Intel-GFX@Lists.FreeDesktop.Org
References: <20221101235053.1650364-1-John.C.Harrison@Intel.com>
 <87k04d7dyn.fsf@intel.com>
 <c710a428-50f6-6181-3f93-4d7667a9ac3f@linux.intel.com>
 <5e22de43-d75c-fc21-9ae7-f27d116c5688@intel.com>
 <1855f0f2-8a1c-7bf4-76c0-76a4354ea8e8@linux.intel.com>
 <2b2eb780-08f7-c7df-0397-a7f732da272d@linux.intel.com>
 <5fad1ec1-8fea-9685-4cc9-2e3c2edf799f@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <5fad1ec1-8fea-9685-4cc9-2e3c2edf799f@intel.com>
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


On 03/11/2022 19:16, John Harrison wrote:
> On 11/3/2022 02:38, Tvrtko Ursulin wrote:
>> On 03/11/2022 09:18, Tvrtko Ursulin wrote:
>>> On 03/11/2022 01:33, John Harrison wrote:
>>>> On 11/2/2022 07:20, Tvrtko Ursulin wrote:
>>>>> On 02/11/2022 12:12, Jani Nikula wrote:
>>>>>> On Tue, 01 Nov 2022, John.C.Harrison@Intel.com wrote:
>>>>>>> From: John Harrison <John.C.Harrison@Intel.com>
>>>>>>>
>>>>>>> At the end of each test, IGT does a drop caches call via sysfs with
>>>>>>
>>>>>> sysfs?
>>>> Sorry, that was meant to say debugfs. I've also been working on some 
>>>> sysfs IGT issues and evidently got my wires crossed!
>>>>
>>>>>>
>>>>>>> special flags set. One of the possible paths waits for idle with an
>>>>>>> infinite timeout. That causes problems for debugging issues when CI
>>>>>>> catches a "can't go idle" test failure. Best case, the CI system 
>>>>>>> times
>>>>>>> out (after 90s), attempts a bunch of state dump actions and then
>>>>>>> reboots the system to recover it. Worst case, the CI system can't do
>>>>>>> anything at all and then times out (after 1000s) and simply reboots.
>>>>>>> Sometimes a serial port log of dmesg might be available, 
>>>>>>> sometimes not.
>>>>>>>
>>>>>>> So rather than making life hard for ourselves, change the timeout to
>>>>>>> be 10s rather than infinite. Also, trigger the standard
>>>>>>> wedge/reset/recover sequence so that testing can continue with a
>>>>>>> working system (if possible).
>>>>>>>
>>>>>>> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
>>>>>>> ---
>>>>>>>   drivers/gpu/drm/i915/i915_debugfs.c | 7 ++++++-
>>>>>>>   1 file changed, 6 insertions(+), 1 deletion(-)
>>>>>>>
>>>>>>> diff --git a/drivers/gpu/drm/i915/i915_debugfs.c 
>>>>>>> b/drivers/gpu/drm/i915/i915_debugfs.c
>>>>>>> index ae987e92251dd..9d916fbbfc27c 100644
>>>>>>> --- a/drivers/gpu/drm/i915/i915_debugfs.c
>>>>>>> +++ b/drivers/gpu/drm/i915/i915_debugfs.c
>>>>>>> @@ -641,6 +641,9 @@ 
>>>>>>> DEFINE_SIMPLE_ATTRIBUTE(i915_perf_noa_delay_fops,
>>>>>>>             DROP_RESET_ACTIVE | \
>>>>>>>             DROP_RESET_SEQNO | \
>>>>>>>             DROP_RCU)
>>>>>>> +
>>>>>>> +#define DROP_IDLE_TIMEOUT    (HZ * 10)
>>>>>>
>>>>>> I915_IDLE_ENGINES_TIMEOUT is defined in i915_drv.h. It's also only 
>>>>>> used
>>>>>> here.
>>>>>
>>>>> So move here, dropping i915 prefix, next to the newly proposed one?
>>>> Sure, can do that.
>>>>
>>>>>
>>>>>> I915_GEM_IDLE_TIMEOUT is defined in i915_gem.h. It's only used in
>>>>>> gt/intel_gt.c.
>>>>>
>>>>> Move there and rename to GT_IDLE_TIMEOUT?
>>>>>
>>>>>> I915_GT_SUSPEND_IDLE_TIMEOUT is defined and used only in 
>>>>>> intel_gt_pm.c.
>>>>>
>>>>> No action needed, maybe drop i915 prefix if wanted.
>>>>>
>>>> These two are totally unrelated and in code not being touched by 
>>>> this change. I would rather not conflate changing random other 
>>>> things with fixing this specific issue.
>>>>
>>>>>> I915_IDLE_ENGINES_TIMEOUT is in ms, the rest are in jiffies.
>>>>>
>>>>> Add _MS suffix if wanted.
>>>>>
>>>>>> My head spins.
>>>>>
>>>>> I follow and raise that the newly proposed DROP_IDLE_TIMEOUT 
>>>>> applies to DROP_ACTIVE and not only DROP_IDLE.
>>>> My original intention for the name was that is the 'drop caches 
>>>> timeout for intel_gt_wait_for_idle'. Which is quite the mouthful and 
>>>> hence abbreviated to DROP_IDLE_TIMEOUT. But yes, I realised later 
>>>> that name can be conflated with the DROP_IDLE flag. Will rename.
>>>>
>>>>
>>>>>
>>>>> Things get refactored, code moves around, bits get left behind, who 
>>>>> knows. No reason to get too worked up. :) As long as people are 
>>>>> taking a wider view when touching the code base, and are not afraid 
>>>>> to send cleanups, things should be good.
>>>> On the other hand, if every patch gets blocked in code review 
>>>> because someone points out some completely unrelated piece of code 
>>>> could be a bit better then nothing ever gets fixed. If you spot 
>>>> something that you think should be improved, isn't the general idea 
>>>> that you should post a patch yourself to improve it?
>>>
>>> There's two maintainers per branch and an order of magnitude or two 
>>> more developers so it'd be nice if cleanups would just be incoming on 
>>> self-initiative basis. ;)
>>>
>>>>> For the actual functional change at hand - it would be nice if code 
>>>>> paths in question could handle SIGINT and then we could punt the 
>>>>> decision on how long someone wants to wait purely to userspace. But 
>>>>> it's probably hard and it's only debugfs so whatever.
>>>>>
>>>> The code paths in question will already abort on a signal won't 
>>>> they? Both intel_gt_wait_for_idle() and 
>>>> intel_guc_wait_for_pending_msg(), which is where the 
>>>> uc_wait_for_idle eventually ends up, have an 'if(signal_pending) 
>>>> return -EINTR;' check. Beyond that, it sounds like what you are 
>>>> asking for is a change in the IGT libraries and/or CI framework to 
>>>> start sending signals after some specific timeout. That seems like a 
>>>> significantly more complex change (in terms of the number of 
>>>> entities affected and number of groups involved) and unnecessary.
>>>
>>> If you say so, I haven't looked at them all. But if the code path in 
>>> question already aborts on signals then I am not sure what is the 
>>> patch fixing? I assumed you are trying to avoid the write stuck in D 
>>> forever, which then prevents driver unload and everything, requiring 
>>> the test runner to eventually reboot. If you say SIGINT works then 
>>> you can already recover from userspace, no?
>>>
>>>>> Whether or not 10s is enough CI will hopefully tell us. I'd 
>>>>> probably err on the side of safety and make it longer, but at most 
>>>>> half from the test runner timeout.
>>>> This is supposed to be test clean up. This is not about how long a 
>>>> particular test takes to complete but about how long it takes to 
>>>> declare the system broken after the test has already finished. I 
>>>> would argue that even 10s is massively longer than required.
>>>>
>>>>>
>>>>> I am not convinced that wedging is correct though. Conceptually 
>>>>> could be just that the timeout is too short. What does wedging 
>>>>> really give us, on top of limiting the wait, when latter AFAIU is 
>>>>> the key factor which would prevent the need to reboot the machine?
>>>>>
>>>> It gives us a system that knows what state it is in. If we can't 
>>>> idle the GT then something is very badly wrong. Wedging indicates 
>>>> that. It also ensure that a full GT reset will be attempted before 
>>>> the next test is run. Helping to prevent a failure on test X from 
>>>> propagating into failures of unrelated tests X+1, X+2, ... And if 
>>>> the GT reset does not work because the system is really that badly 
>>>> broken then future tests will not run rather than report erroneous 
>>>> failures.
>>>>
>>>> This is not about getting a more stable system for end users by 
>>>> sweeping issues under the carpet and pretending all is well. End 
>>>> users don't run IGTs or explicitly call dodgy debugfs entry points. 
>>>> The sole motivation here is to get more accurate results from CI. 
>>>> That is, correctly identifying which test has hit a problem, getting 
>>>> valid debug analysis for that test (logs and such) and allowing 
>>>> further testing to complete correctly in the case where the system 
>>>> can be recovered.
>>>
>>> I don't really oppose shortening of the timeout in principle, just 
>>> want a clear statement if this is something IGT / test runner could 
>>> already do or not. It can apply a timeout, it can also send SIGINT, 
>>> and it could even trigger a reset from outside. Sure it is debugfs 
>>> hacks so general "kernel should not implement policy" need not be 
>>> strictly followed, but lets have it clear what are the options.
>>
>> One conceptual problem with applying this policy is that the code is:
>>
>>     if (val & (DROP_IDLE | DROP_ACTIVE)) {
>>         ret = intel_gt_wait_for_idle(gt, MAX_SCHEDULE_TIMEOUT);
>>         if (ret)
>>             return ret;
>>     }
>>
>>     if (val & DROP_IDLE) {
>>         ret = intel_gt_pm_wait_for_idle(gt);
>>         if (ret)
>>             return ret;
>>     }
>>
>> So if someone passes in DROP_IDLE and then why would only the first 
>> branch have a short timeout and wedge. Yeah some bug happens to be 
>> there at the moment, but put a bug in a different place and you hang 
>> on the second branch and then need another patch. Versus perhaps 
>> making it all respect SIGINT and handle from outside.
>>
> The pm_wait_for_idle is can only called after gt_wait_for_idle has 
> completed successfully. There is no route to skip the GT idle or to do 
> the PM idle even if the GT idle fails. So the chances of the PM idle 
> failing are greatly reduced. There would have to be something outside of 
> a GT keeping the GPU awake and there isn't a whole lot of hardware left 
> at that point!

Well "greatly reduced" is beside my point. Point is today bug is here 
and we add a timeout, tomorrow bug is there and then the same dance. It 
can be just a sw bug which forgets to release the pm ref in some 
circumstances, doesn't really matter.

> Regarding signals, the PM idle code ends up at 
> wait_var_event_killable(). I assume that is interruptible via at least a 
> KILL signal if not any signal. Although it's not entirely clear trying 
> to follow through the implementation of this code. Also, I have no idea 
> if there is a safe way to add a timeout to that code (or why it wasn't 
> already written with a timeout included). Someone more familiar with the 
> wakeref internals would need to comment.
> 
> However, I strongly disagree that we should not fix the driver just 
> because it is possible to workaround the issue by re-writing the CI 
> framework. Feel free to bring a redesign plan to the IGT WG and whatever 
> equivalent CI meetings in parallel. But we absolutely should not have 
> infinite waits in the kernel if there is a trivial way to not have 
> infinite waits.

I thought I was clear that I am not really opposed to the timeout.

The rest of the paragraph I don't really care - point is moot because 
it's debugfs so we can do whatever, as long as it is not burdensome to 
i915, which this isn't. If either wasn't the case then we certainly 
wouldn't be adding any workarounds in the kernel if it can be achieved 
in IGT.

> Also, sending a signal does not result in the wedge happening. I 
> specifically did not want to change that code path because I was 
> assuming there was a valid reason for it. If you have been interrupted 
> then you are in the territory of maybe it would have succeeded if you 
> just left it for a moment longer. Whereas, hitting the timeout says that 
> someone very deliberately said this is too long to wait and therefore 
> the system must be broken.

I wanted to know specifically about wedging - why can't you wedge/reset 
from IGT if DROP_IDLE times out in quiescent or wherever, if that's what 
you say is the right thing? That's a policy decision so why would i915 
wedge if an arbitrary timeout expired? I915 is not controlling how much 
work there is outstanding at the point the IGT decides to call DROP_IDLE.

> Plus, infinite wait is not a valid code path in the first place so any 
> change in behaviour is not really a change in behaviour. Code can't be 
> relying on a kernel call to never return for its correct operation!

Why infinite wait wouldn't be valid? Then you better change the other 
one as well. ;P

Regards,

Tvrtko

> And if you don't wedge then you don't recover. Each subsequent test 
> would just hit the infinite timeout, get killed by the CI framework's 
> shiny new kill signal and be marked as yet another unrelated bug that 
> will be logged separately. Whereas, using a sensible timeout and then 
> wedging will at least attempt to recover the situation. And if it can be 
> recovered, future tests will pass. If it can't then future testing will 
> be aborted.
> 
> John.
> 
> 
>> Regards,
>>
>> Tvrtko
> 
