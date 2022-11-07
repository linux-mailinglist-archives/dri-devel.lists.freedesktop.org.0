Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2641161F4FB
	for <lists+dri-devel@lfdr.de>; Mon,  7 Nov 2022 15:09:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53F0310E317;
	Mon,  7 Nov 2022 14:09:38 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61EFD10E19F;
 Mon,  7 Nov 2022 14:09:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1667830173; x=1699366173;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=GMiQI3GYoobz2l6fLjXvAJfLJmA6h8pckBZS5L6ne7M=;
 b=nXLSBgGwwVYrwO4S81S/W9WBxbq6Dozm85iK+7pZp2bAkA2f3//w4CRO
 5YAA3pRcPtrOIC5uAjgfJFyS67mkAINsM6qbGjPrzrtKToCVVHi6fvkMn
 QI9/2UPFP7lJUvagY2ogTJRAhaz1SvqhD+hOZzsNl0CrdsqXYqX0MJVMR
 NC5gJM7YkeyCnuyQ2n6ST2TkwJ1g5+A2heO6KPvcif3XYqHXAAGl9WvJF
 gtjLNZUNS3Wrpv1rniBoH7zmwKoDwdDLoyx7SBOeG4y/bxcaksnbeL3g+
 RQpSlZDBKMDmVK8uhEUhhgw69dtwplDgz6L58GvZgktISn11paESA8XjE Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10524"; a="396712445"
X-IronPort-AV: E=Sophos;i="5.96,145,1665471600"; d="scan'208";a="396712445"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2022 06:09:32 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10524"; a="704886388"
X-IronPort-AV: E=Sophos;i="5.96,145,1665471600"; d="scan'208";a="704886388"
Received: from aalbarra-mobl.ger.corp.intel.com (HELO [10.213.226.227])
 ([10.213.226.227])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2022 06:09:31 -0800
Message-ID: <838f1d78-1d7c-c82e-0c70-b8c1fc0cebff@linux.intel.com>
Date: Mon, 7 Nov 2022 14:09:29 +0000
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
 <448d710a-3af1-932d-c276-7c6fd6c02528@linux.intel.com>
 <f3de3596-871a-2af3-e72b-f4c66d5e7211@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <f3de3596-871a-2af3-e72b-f4c66d5e7211@intel.com>
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
Cc: "Ewins, Jon" <jon.ewins@intel.com>, DRI-Devel@Lists.FreeDesktop.Org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 04/11/2022 17:45, John Harrison wrote:
> On 11/4/2022 03:01, Tvrtko Ursulin wrote:
>> On 03/11/2022 19:16, John Harrison wrote:
>>> On 11/3/2022 02:38, Tvrtko Ursulin wrote:
>>>> On 03/11/2022 09:18, Tvrtko Ursulin wrote:
>>>>> On 03/11/2022 01:33, John Harrison wrote:
>>>>>> On 11/2/2022 07:20, Tvrtko Ursulin wrote:
>>>>>>> On 02/11/2022 12:12, Jani Nikula wrote:
>>>>>>>> On Tue, 01 Nov 2022, John.C.Harrison@Intel.com wrote:
>>>>>>>>> From: John Harrison <John.C.Harrison@Intel.com>
>>>>>>>>>
>>>>>>>>> At the end of each test, IGT does a drop caches call via sysfs 
>>>>>>>>> with
>>>>>>>>
>>>>>>>> sysfs?
>>>>>> Sorry, that was meant to say debugfs. I've also been working on 
>>>>>> some sysfs IGT issues and evidently got my wires crossed!
>>>>>>
>>>>>>>>
>>>>>>>>> special flags set. One of the possible paths waits for idle 
>>>>>>>>> with an
>>>>>>>>> infinite timeout. That causes problems for debugging issues 
>>>>>>>>> when CI
>>>>>>>>> catches a "can't go idle" test failure. Best case, the CI 
>>>>>>>>> system times
>>>>>>>>> out (after 90s), attempts a bunch of state dump actions and then
>>>>>>>>> reboots the system to recover it. Worst case, the CI system 
>>>>>>>>> can't do
>>>>>>>>> anything at all and then times out (after 1000s) and simply 
>>>>>>>>> reboots.
>>>>>>>>> Sometimes a serial port log of dmesg might be available, 
>>>>>>>>> sometimes not.
>>>>>>>>>
>>>>>>>>> So rather than making life hard for ourselves, change the 
>>>>>>>>> timeout to
>>>>>>>>> be 10s rather than infinite. Also, trigger the standard
>>>>>>>>> wedge/reset/recover sequence so that testing can continue with a
>>>>>>>>> working system (if possible).
>>>>>>>>>
>>>>>>>>> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
>>>>>>>>> ---
>>>>>>>>>   drivers/gpu/drm/i915/i915_debugfs.c | 7 ++++++-
>>>>>>>>>   1 file changed, 6 insertions(+), 1 deletion(-)
>>>>>>>>>
>>>>>>>>> diff --git a/drivers/gpu/drm/i915/i915_debugfs.c 
>>>>>>>>> b/drivers/gpu/drm/i915/i915_debugfs.c
>>>>>>>>> index ae987e92251dd..9d916fbbfc27c 100644
>>>>>>>>> --- a/drivers/gpu/drm/i915/i915_debugfs.c
>>>>>>>>> +++ b/drivers/gpu/drm/i915/i915_debugfs.c
>>>>>>>>> @@ -641,6 +641,9 @@ 
>>>>>>>>> DEFINE_SIMPLE_ATTRIBUTE(i915_perf_noa_delay_fops,
>>>>>>>>>             DROP_RESET_ACTIVE | \
>>>>>>>>>             DROP_RESET_SEQNO | \
>>>>>>>>>             DROP_RCU)
>>>>>>>>> +
>>>>>>>>> +#define DROP_IDLE_TIMEOUT    (HZ * 10)
>>>>>>>>
>>>>>>>> I915_IDLE_ENGINES_TIMEOUT is defined in i915_drv.h. It's also 
>>>>>>>> only used
>>>>>>>> here.
>>>>>>>
>>>>>>> So move here, dropping i915 prefix, next to the newly proposed one?
>>>>>> Sure, can do that.
>>>>>>
>>>>>>>
>>>>>>>> I915_GEM_IDLE_TIMEOUT is defined in i915_gem.h. It's only used in
>>>>>>>> gt/intel_gt.c.
>>>>>>>
>>>>>>> Move there and rename to GT_IDLE_TIMEOUT?
>>>>>>>
>>>>>>>> I915_GT_SUSPEND_IDLE_TIMEOUT is defined and used only in 
>>>>>>>> intel_gt_pm.c.
>>>>>>>
>>>>>>> No action needed, maybe drop i915 prefix if wanted.
>>>>>>>
>>>>>> These two are totally unrelated and in code not being touched by 
>>>>>> this change. I would rather not conflate changing random other 
>>>>>> things with fixing this specific issue.
>>>>>>
>>>>>>>> I915_IDLE_ENGINES_TIMEOUT is in ms, the rest are in jiffies.
>>>>>>>
>>>>>>> Add _MS suffix if wanted.
>>>>>>>
>>>>>>>> My head spins.
>>>>>>>
>>>>>>> I follow and raise that the newly proposed DROP_IDLE_TIMEOUT 
>>>>>>> applies to DROP_ACTIVE and not only DROP_IDLE.
>>>>>> My original intention for the name was that is the 'drop caches 
>>>>>> timeout for intel_gt_wait_for_idle'. Which is quite the mouthful 
>>>>>> and hence abbreviated to DROP_IDLE_TIMEOUT. But yes, I realised 
>>>>>> later that name can be conflated with the DROP_IDLE flag. Will 
>>>>>> rename.
>>>>>>
>>>>>>
>>>>>>>
>>>>>>> Things get refactored, code moves around, bits get left behind, 
>>>>>>> who knows. No reason to get too worked up. :) As long as people 
>>>>>>> are taking a wider view when touching the code base, and are not 
>>>>>>> afraid to send cleanups, things should be good.
>>>>>> On the other hand, if every patch gets blocked in code review 
>>>>>> because someone points out some completely unrelated piece of code 
>>>>>> could be a bit better then nothing ever gets fixed. If you spot 
>>>>>> something that you think should be improved, isn't the general 
>>>>>> idea that you should post a patch yourself to improve it?
>>>>>
>>>>> There's two maintainers per branch and an order of magnitude or two 
>>>>> more developers so it'd be nice if cleanups would just be incoming 
>>>>> on self-initiative basis. ;)
>>>>>
>>>>>>> For the actual functional change at hand - it would be nice if 
>>>>>>> code paths in question could handle SIGINT and then we could punt 
>>>>>>> the decision on how long someone wants to wait purely to 
>>>>>>> userspace. But it's probably hard and it's only debugfs so whatever.
>>>>>>>
>>>>>> The code paths in question will already abort on a signal won't 
>>>>>> they? Both intel_gt_wait_for_idle() and 
>>>>>> intel_guc_wait_for_pending_msg(), which is where the 
>>>>>> uc_wait_for_idle eventually ends up, have an 'if(signal_pending) 
>>>>>> return -EINTR;' check. Beyond that, it sounds like what you are 
>>>>>> asking for is a change in the IGT libraries and/or CI framework to 
>>>>>> start sending signals after some specific timeout. That seems like 
>>>>>> a significantly more complex change (in terms of the number of 
>>>>>> entities affected and number of groups involved) and unnecessary.
>>>>>
>>>>> If you say so, I haven't looked at them all. But if the code path 
>>>>> in question already aborts on signals then I am not sure what is 
>>>>> the patch fixing? I assumed you are trying to avoid the write stuck 
>>>>> in D forever, which then prevents driver unload and everything, 
>>>>> requiring the test runner to eventually reboot. If you say SIGINT 
>>>>> works then you can already recover from userspace, no?
>>>>>
>>>>>>> Whether or not 10s is enough CI will hopefully tell us. I'd 
>>>>>>> probably err on the side of safety and make it longer, but at 
>>>>>>> most half from the test runner timeout.
>>>>>> This is supposed to be test clean up. This is not about how long a 
>>>>>> particular test takes to complete but about how long it takes to 
>>>>>> declare the system broken after the test has already finished. I 
>>>>>> would argue that even 10s is massively longer than required.
>>>>>>
>>>>>>>
>>>>>>> I am not convinced that wedging is correct though. Conceptually 
>>>>>>> could be just that the timeout is too short. What does wedging 
>>>>>>> really give us, on top of limiting the wait, when latter AFAIU is 
>>>>>>> the key factor which would prevent the need to reboot the machine?
>>>>>>>
>>>>>> It gives us a system that knows what state it is in. If we can't 
>>>>>> idle the GT then something is very badly wrong. Wedging indicates 
>>>>>> that. It also ensure that a full GT reset will be attempted before 
>>>>>> the next test is run. Helping to prevent a failure on test X from 
>>>>>> propagating into failures of unrelated tests X+1, X+2, ... And if 
>>>>>> the GT reset does not work because the system is really that badly 
>>>>>> broken then future tests will not run rather than report erroneous 
>>>>>> failures.
>>>>>>
>>>>>> This is not about getting a more stable system for end users by 
>>>>>> sweeping issues under the carpet and pretending all is well. End 
>>>>>> users don't run IGTs or explicitly call dodgy debugfs entry 
>>>>>> points. The sole motivation here is to get more accurate results 
>>>>>> from CI. That is, correctly identifying which test has hit a 
>>>>>> problem, getting valid debug analysis for that test (logs and 
>>>>>> such) and allowing further testing to complete correctly in the 
>>>>>> case where the system can be recovered.
>>>>>
>>>>> I don't really oppose shortening of the timeout in principle, just 
>>>>> want a clear statement if this is something IGT / test runner could 
>>>>> already do or not. It can apply a timeout, it can also send SIGINT, 
>>>>> and it could even trigger a reset from outside. Sure it is debugfs 
>>>>> hacks so general "kernel should not implement policy" need not be 
>>>>> strictly followed, but lets have it clear what are the options.
>>>>
>>>> One conceptual problem with applying this policy is that the code is:
>>>>
>>>>     if (val & (DROP_IDLE | DROP_ACTIVE)) {
>>>>         ret = intel_gt_wait_for_idle(gt, MAX_SCHEDULE_TIMEOUT);
>>>>         if (ret)
>>>>             return ret;
>>>>     }
>>>>
>>>>     if (val & DROP_IDLE) {
>>>>         ret = intel_gt_pm_wait_for_idle(gt);
>>>>         if (ret)
>>>>             return ret;
>>>>     }
>>>>
>>>> So if someone passes in DROP_IDLE and then why would only the first 
>>>> branch have a short timeout and wedge. Yeah some bug happens to be 
>>>> there at the moment, but put a bug in a different place and you hang 
>>>> on the second branch and then need another patch. Versus perhaps 
>>>> making it all respect SIGINT and handle from outside.
>>>>
>>> The pm_wait_for_idle is can only called after gt_wait_for_idle has 
>>> completed successfully. There is no route to skip the GT idle or to 
>>> do the PM idle even if the GT idle fails. So the chances of the PM 
>>> idle failing are greatly reduced. There would have to be something 
>>> outside of a GT keeping the GPU awake and there isn't a whole lot of 
>>> hardware left at that point!
>>
>> Well "greatly reduced" is beside my point. Point is today bug is here 
>> and we add a timeout, tomorrow bug is there and then the same dance. 
>> It can be just a sw bug which forgets to release the pm ref in some 
>> circumstances, doesn't really matter.
>>
> Huh?
> 
> Greatly reduced is the whole point. Today there is a bug and it causes a 
> kernel hang which requires the CI framework to reboot the system in an 
> extremely unfriendly way which makes it very hard to work out what 
> happened. Logs are likely not available. We don't even necessarily know 
> which test was being run at the time. Etc. So we replace the infinite 
> timeout with a meaningful timeout. CI now correctly marks the single 
> test as failing, captures all the correct logs, creates a useful bug 
> report and continues on testing more stuff.

So what is preventing CI to collect logs if IGT is forever stuck in 
interruptible wait? Surely it can collect the logs at that point if the 
kernel is healthy enough. If it isn't then I don't see how wedging the 
GPU will make the kernel any healthier.

Is i915 preventing better log collection or could test runner be improved?

> Sure, there is still the chance of hitting an infinite timeout. But that 
> one is significantly more complicated to remove. And the chances of 
> hitting that one are significantly smaller than the chances of hitting 
> the first one.

This statement relies on intimate knowledge implementation details and a 
bit too much white box testing approach but that's okay, lets move past 
this one.

> So you are arguing that because I can't fix the last 0.1% of possible 
> failures, I am not allowed to fix the first 99.9% of the failures?

I am clearly not arguing for that. But we are also not talking about 
"fixing failures" here. Just how to make CI cope better with a class of 
i915 bugs.

>>> Regarding signals, the PM idle code ends up at 
>>> wait_var_event_killable(). I assume that is interruptible via at 
>>> least a KILL signal if not any signal. Although it's not entirely 
>>> clear trying to follow through the implementation of this code. Also, 
>>> I have no idea if there is a safe way to add a timeout to that code 
>>> (or why it wasn't already written with a timeout included). Someone 
>>> more familiar with the wakeref internals would need to comment.
>>>
>>> However, I strongly disagree that we should not fix the driver just 
>>> because it is possible to workaround the issue by re-writing the CI 
>>> framework. Feel free to bring a redesign plan to the IGT WG and 
>>> whatever equivalent CI meetings in parallel. But we absolutely should 
>>> not have infinite waits in the kernel if there is a trivial way to 
>>> not have infinite waits.
>>
>> I thought I was clear that I am not really opposed to the timeout.
>>
>> The rest of the paragraph I don't really care - point is moot because 
>> it's debugfs so we can do whatever, as long as it is not burdensome to 
>> i915, which this isn't. If either wasn't the case then we certainly 
>> wouldn't be adding any workarounds in the kernel if it can be achieved 
>> in IGT.
>>
>>> Also, sending a signal does not result in the wedge happening. I 
>>> specifically did not want to change that code path because I was 
>>> assuming there was a valid reason for it. If you have been 
>>> interrupted then you are in the territory of maybe it would have 
>>> succeeded if you just left it for a moment longer. Whereas, hitting 
>>> the timeout says that someone very deliberately said this is too long 
>>> to wait and therefore the system must be broken.
>>
>> I wanted to know specifically about wedging - why can't you 
>> wedge/reset from IGT if DROP_IDLE times out in quiescent or wherever, 
>> if that's what you say is the right thing? 
> Huh?
> 
> DROP_IDLE has two waits. One that I am trying to change from infinite to 
> finite + wedge. One that would take considerable effort to change and 
> would be quite invasive to a lot more of the driver and which can only 
> be hit if the first timeout actually completed successfully and is 
> therefore of less importance anyway. Both of those time outs appear to 
> respect signal interrupts.
> 
>> That's a policy decision so why would i915 wedge if an arbitrary 
>> timeout expired? I915 is not controlling how much work there is 
>> outstanding at the point the IGT decides to call DROP_IDLE.
> 
> Because this is a debug test interface that is used solely by IGT after 
> it has finished its testing. This is not about wedging the device at 
> some random arbitrary point because an AI compute workload takes three 
> hours to complete. This is about a very specific test framework cleaning 
> up after testing is completed and making sure the test did not fry the 
> system.
> 
> And even if an IGT test was calling DROP_IDLE in the middle of a test 
> for some reason, it should not be deliberately pushing 10+ seconds of 
> work through and then calling a debug only interface to flush it out. If 
> a test wants to verify that the system can cope with submitting a 
> minutes worth of rendering and then waiting for it to complete then the 
> test should be using official channels for that wait.
> 
>>
>>> Plus, infinite wait is not a valid code path in the first place so 
>>> any change in behaviour is not really a change in behaviour. Code 
>>> can't be relying on a kernel call to never return for its correct 
>>> operation!
>>
>> Why infinite wait wouldn't be valid? Then you better change the other 
>> one as well. ;P
> In what universe is it ever valid to wait forever for a test to complete?

Well above you claimed both paths respect SIGINT. If that is so then the 
wait is as infinite as the IGT wanted it to be.

> See above, the PM code would require much more invasive changes. This 
> was low hanging fruit. It was supposed to be a two minute change to a 
> very self contained section of code that would provide significant 
> benefit to debugging a small class of very hard to debug problems.

Sure, but I'd still like to know why can't you do what you want from the 
IGT framework.

Have the timeout reduction in i915, again that's fine assuming 10 
seconds it enough to not break something by accident.

With that change you already have broken the "infinite wait". It makes 
the debugfs write return -ETIME in time much shorter than the test 
runner timeout(s). What is the thing that you cannot do from IGT at that 
point is my question? You want to wedge then? Send DROP_RESET_ACTIVE to 
do it for you? If that doesn't work add a new flag which will wedge 
explicitly.

We are again degrading into a huge philosophical discussion and all I 
wanted to start with is to hear how exactly things go bad.

Regards,

Tvrtko
