Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 26D4D4C2B1D
	for <lists+dri-devel@lfdr.de>; Thu, 24 Feb 2022 12:42:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2907F10FB14;
	Thu, 24 Feb 2022 11:42:27 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C81F710FB11;
 Thu, 24 Feb 2022 11:42:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645702945; x=1677238945;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=wKADjopXTXkWhhnao1QoM0Rbll1AVRYOrTOTB0HFi/k=;
 b=QXtw+tYzEDTpBR0F2O6EIUbbsbJZ+diDku4yadSm+mg4syOfrY6mdx5N
 6UawrozqA+V4U1pSPcqokwydShPzp6aPeZF9zF2HJY4o1CID31wsS5XiZ
 ksKuaV37IiJqm306HxbNgP9rQ7ey8V194/IIPY1gNZa0Ppc3VW5vE6+j2
 RTKOp82LyPH2wNJzce7BNI6cLzJ4FxdiZ3PKYQplck3ejrpVYREpWW2/m
 +eJEbbl+F98Ux4Hw/PlpCGqeGCJxkGBWzbp9wlCudcXWXq5IkKf35FATv
 DYKlkIu7Po5f8a9NYtl6WqdS4apdW0ryjQgumcOqeEeUtVen0vvbcTPfe A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10267"; a="338653294"
X-IronPort-AV: E=Sophos;i="5.88,393,1635231600"; d="scan'208";a="338653294"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2022 03:42:25 -0800
X-IronPort-AV: E=Sophos;i="5.88,393,1635231600"; d="scan'208";a="543679193"
Received: from cwadams-mobl2.ger.corp.intel.com (HELO [10.213.221.24])
 ([10.213.221.24])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2022 03:42:24 -0800
Message-ID: <6ee75384-2cf0-6b34-ed54-3c7dc9ca31a3@linux.intel.com>
Date: Thu, 24 Feb 2022 11:41:27 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [Intel-gfx] [PATCH 2/3] drm/i915/gt: Make the heartbeat play nice
 with long pre-emption timeouts
Content-Language: en-US
To: John Harrison <john.c.harrison@intel.com>, Intel-GFX@Lists.FreeDesktop.Org
References: <20220218213307.1338478-1-John.C.Harrison@Intel.com>
 <20220218213307.1338478-3-John.C.Harrison@Intel.com>
 <2a486991-1bfd-9b23-0b43-9173d17b7e13@linux.intel.com>
 <e95e8710-8410-2869-dec1-7f7a9e9a74fb@intel.com>
 <18205069-1210-745f-3bcc-2eddb0d17da1@linux.intel.com>
 <94e9889d-d71a-1428-516d-2928807cbf43@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <94e9889d-d71a-1428-516d-2928807cbf43@intel.com>
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


On 23/02/2022 20:00, John Harrison wrote:
> On 2/23/2022 05:58, Tvrtko Ursulin wrote:
>> On 23/02/2022 02:45, John Harrison wrote:
>>> On 2/22/2022 03:19, Tvrtko Ursulin wrote:
>>>> On 18/02/2022 21:33, John.C.Harrison@Intel.com wrote:
>>>>> From: John Harrison <John.C.Harrison@Intel.com>
>>>>>
>>>>> Compute workloads are inherantly not pre-emptible for long periods on
>>>>> current hardware. As a workaround for this, the pre-emption timeout
>>>>> for compute capable engines was disabled. This is undesirable with GuC
>>>>> submission as it prevents per engine reset of hung contexts. Hence the
>>>>> next patch will re-enable the timeout but bumped up by an order of
>>>>> magnititude.
>>>>
>>>> (Some typos above.)
>>> I'm spotting 'inherently' but not anything else.
>>
>> Magnititude! O;)
> Doh!
> 
> [snip]
> 
>>> Whereas, bumping all heartbeat periods to be greater than the 
>>> pre-emption timeout is wasteful and unnecessary. That leads to a 
>>> total heartbeat time of about a minute. Which is a very long time to 
>>> wait for a hang to be detected and recovered. Especially when the 
>>> official limit on a context responding to an 'are you dead' query is 
>>> only 7.5 seconds.
>>
>> Not sure how did you get one minute?
> 7.5 * 2 (to be safe) = 15. 15 * 5 (number of heartbeat periods) = 75 => 
> 1 minute 15 seconds
> 
> Even ignoring any safety factor and just going with 7.5 * 5 still gets 
> you to 37.5 seconds which is over a half a minute and likely to race.

Ah because my starting point is there should be no preempt timeout = heartbeat * 3, I just think that's too ugly.

>> Regardless, crux of argument was to avoid GuC engine reset and 
>> heartbeat reset racing with each other, and to do that by considering 
>> the preempt timeout with the heartbeat interval. I was thinking about 
>> this scenario in this series:
>>
>> [Please use fixed width font and no line wrap to view.]
>>
>> A)
>>
>> tP = preempt timeout
>> tH = hearbeat interval
>>
>> tP = 3 * tH
>>
>> 1) Background load = I915_PRIORITY_DISPLAY
>>
>> <-- [tH] --> Pulse1 <-- [tH] --> Pulse2 <-- [tH] --> Pulse3 <---- [2 * 
>> tH] ----> FULL RESET
>>                                                        |
>>                                                        \- preemption 
>> triggered, tP = 3 * tH ------\
>> \-> preempt timeout would hit here
>>
>> Here we have collateral damage due full reset, since we can't tell GuC 
>> to reset just one engine and we fudged tP just to "account" for 
>> heartbeats.
> You are missing the whole point of the patch series which is that the 
> last heartbeat period is '2 * tP' not '2 * tH'.
> +        longer = READ_ONCE(engine->props.preempt_timeout_ms) * 2;
> 
> By making the last period double the pre-emption timeout, it is 
> guaranteed that the FULL RESET stage cannot be hit before the hardware 
> has attempted and timed-out on at least one pre-emption.

Oh well :) that probably means the overall scheme is too odd for me. tp = 3tH and last pulse after 2tP I mean.

> [snip]
> 
> 
>> <-- [tH] --> Pulse1 <-- [tH] --> Pulse2 <-- [tH] --> Pulse3 <---- [2 * 
>> tH] ----> full reset would be here
>>                |
>>                \- preemption triggered, tP = 3 * tH ----------------\
>> \-> Preempt timeout reset
>>
>> Here is is kind of least worse, but question is why we fudged tP when 
>> it gives us nothing good in this case.
>>
> The point of fudging tP(RCS) is to give compute workloads longer to 
> reach a pre-emptible point (given that EU walkers are basically not 
> pre-emptible). The reason for doing the fudge is not connected to the 
> heartbeat at all. The fact that it causes problems for the heartbeat is 
> an undesired side effect.
> 
> Note that the use of 'tP(RCS) = tH * 3' was just an arbitrary 
> calculation that gave us something that all interested parties were 
> vaguely happy with. It could just as easily be a fixed, hard coded value 
> of 7.5s but having it based on something configurable seemed more 
> sensible. The other option was 'tP(RCS) = tP * 12' but that felt more 
> arbitrary than basing it on the average heartbeat timeout. As in, three 
> heartbeat periods is about what a normal prio task gets before it gets 
> pre-empted by the heartbeat. So using that for general purpose 
> pre-emptions (e.g. time slicing between multiple user apps) seems 
> reasonable.

I think the fact you say tP fudge is not related to heartbeats and then go to mention heartbeat even in the "formula" which uses no tH is saying something (at least that's how I read the 7.5s option). :)

>> B)
>>
>> Instead, my idea to account for preempt timeout when calculating when 
>> to schedule next hearbeat would look like this:
>>
>> First of all tP can be left at a large value unrelated to tH. Lets say 
>> tP = 640ms. tH stays 2.5s.
> 640ms is not 'large'. The requirement is either zero (disabled) or 
> region of 7.5s. The 640ms figure is the default for non-compute engines. 
> Anything that can run EUs needs to be 'huge'.
> 
> 
>>
>> 1) Background load = I915_PRIORITY_DISPLAY
>>
>> <-- [tH + tP] --> Pulse1 <-- [tH + tP] --> Pulse2 <-- [tH + tP] --> 
>> Pulse3 <-- [tH + tP] --> full reset would be here
> Sure, this works but each period is now 2.5 + 7.5 = 10s. The full five 
> periods is therefore 50s, which is practically a minute.

No, in my proposal it is 3 * (2.5s + 640ms) =~ 9.3s.

> [snip]
> 
>> Am I missing some requirement or you see another problem with this idea?
>>
>>>> On a related topic, if GuC engine resets stop working when preempt 
>>>> timeout is set to zero - I think we need to somehow let the user 
>>>> know if they try to tweak it via sysfs. Perhaps go as far as -EINVAL 
>>>> in GuC mode, if i915.reset has not explicitly disabled engine resets.
>>> Define 'stops working'. The definition of the sysfs interface is that 
>>> a value of zero disables pre-emption. If you don't have pre-emption 
>>> and your hang detection mechanism relies on pre-emption then you 
>>> don't have a hang detection mechanism either. If the user really 
>>> wants to allow 
>>
>> By stops working I meant that it stops working. :)
>>
>> With execlist one can disable preempt timeout and "stopped heartbeat" 
>> can still reset the stuck engine and so avoid collateral damage. With 
>> GuC it appears this is not possible. So I was thinking this is 
>> something worthy a log notice.
>>
>>> their context to run forever and never be pre-empted then that means 
>>> they also don't want it to be reset arbitrarily. Which means they 
>>> would also be disabling the heartbeat timer as well. Indeed, this is 
>>> what we 
>>
>> I don't think so. Preempt timeout is disabled already on TGL/RCS 
>> upstream but hearbeat is not and so hangcheck still works.
> The pre-emption disable in upstream is not a valid solution for compute 
> customers. It is a worst-of-all-worlds hack for general usage. As noted 
> already, any actual compute specific customer is advised to disable all 
> forms of reset and do their hang detection manually. A slightly less 
> worse hack for customers that are not actually running long compute 
> workloads (i.e. the vast majority of end users) is to just use a long 
> pre-emption timeout.

If disabled preemption timeout is worst of all words and compute needs to disable heartbeat as well then why did we put it in? Perhaps it was not know at the time it would not be good enough. But anyway, do I read you correct that current thinking is it would be better to leave it at default 640ms?

If so, if we went with my proposal, would everyone be happy? If yes, isn't it a simpler scheme? No special casing when setting the preempt timeout, no special casing of the last heartbeat pulse. Works predictably regardless of the priority of the hypothetical non-preemptible workload.

>>> advise compute customers to do. It is then up to the user themselves 
>>> to spot a hang and to manually kill (Ctrl+C, kill ###, etc.) their 
>>> task. Killing the CPU task will automatically clear up any GPU 
>>> resources allocated to that task (excepting context persistence, 
>>> which is a) broken and b) something we also tell compute customers to 
>>> disable).
>>
>> What is broken with context persistence? I noticed one patch claiming 
>> to be fixing something in that area which looked suspect. Has it been 
>> established no userspace relies on it?
> One major issue is that it has hooks into the execlist scheduler 
> backend. I forget the exact details right now. The implementation as a 
> whole is incredibly complex and convoluted :(. But there's stuff about 
> what happens when you disable the heartbeat after having closed a 
> persistence context's handle (and thus made it persisting). There's also 
> things like it sends a super high priority heartbeat pulse at the point 
> of becoming persisting. That plays havoc for platforms with dependent 
> engines and/or compute workloads. A context becomes persisting on RCS 
> and results in your unrealted CCS work being reset. It's a mess.
> 
> The comment from Daniel Vetter is that persistence should have no 
> connection to the heartbeat at all. All of that dynamic behaviour and 
> complexity should just be removed.

Dependent engines is definitely a topic on it's own, outside hearbeats, persistence and all.

Otherwise there is definitely complexity in the execlists backend but I am not sure if logic persistence and heartbeats are so very connected. It does send a pulse when heartbeat interval is changed, which if going to zero, it will kick of closed contexts if it can:

static struct intel_engine_cs *
__execlists_schedule_in(struct i915_request *rq)
{
	struct intel_engine_cs * const engine = rq->engine;
	struct intel_context * const ce = rq->context;

	intel_context_get(ce);

	if (unlikely(intel_context_is_closed(ce) &&
		     !intel_engine_has_heartbeat(engine)))
		intel_context_set_banned(ce);

	if (unlikely(intel_context_is_banned(ce) || bad_request(rq)))
		reset_active(rq, engine);

Is this what you mean? The point of this is to make sure persistent context does not hog the engine forever if hangcheck has been disabled.

Reminds me of my improvement to customer experience which never got in (https://patchwork.freedesktop.org/patch/451491/?series=93420&rev=2). Point of that one was to avoid engine reset (or worse) after user presses "Ctrl-C" if something takes just over 1ms to cleanly complete.

> Persistence itself can stay. There are valid UMD use cases. It is just 
> massively over complicated and doesn't work in all corner cases when not 
> using execlist submission or on newer platforms. The simplification that 
> is planned is to allow contexts to persist until the associated DRM 
> master handle is closed. At that point, all contexts associated with 
> that DRM handle are killed. That is what AMD and others apparently 
> implement.

Okay, that goes against one recent IGT patch which appeared to work around something by moving the position of _context_ close.

Regards,

Tvrtko
