Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1124B5F6418
	for <lists+dri-devel@lfdr.de>; Thu,  6 Oct 2022 12:03:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC5A210E2DB;
	Thu,  6 Oct 2022 10:03:44 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D192210E1F1;
 Thu,  6 Oct 2022 10:03:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1665050617; x=1696586617;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=393bczN3Xpumxlpq10XgfvqXt1jj1NoUMNHPSHEz4LU=;
 b=i1hqUvJjDdbTN8LMYOhPjQaGIrRZgFymrq0IT3Bo0R2kXQVp99VP5krw
 FjnJ6TWWQFL2gjkB6j20kUKwPc0TexhXxXjfeZttBRMszgCpaFPPxTGKY
 uHfjrfltYKIn9ggJ6/yeOyb/D4xuGJjGDwx7BzRHE+PIbCCtBdfp5Ijym
 HE7bJxm3Do2e/9ssNrySJrbRt0y8S0YS+liqWB5ePUkk4+QEcJ8cnCemv
 xuT5CU1qzm4z2OhI5QQb+FK8Nmy4uzZlXcd9A8K2HYe6EoX4fgGHO97Cy
 XqvJA/ciheChhEC1CCe/VUwGI3htWCAY0fpBnUq7g0KQ2iaLoY93R11aE A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10491"; a="286627083"
X-IronPort-AV: E=Sophos;i="5.95,163,1661842800"; d="scan'208";a="286627083"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2022 03:03:37 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10491"; a="953557938"
X-IronPort-AV: E=Sophos;i="5.95,163,1661842800"; d="scan'208";a="953557938"
Received: from nnolan-mobl2.ger.corp.intel.com (HELO [10.213.212.51])
 ([10.213.212.51])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2022 03:03:35 -0700
Message-ID: <afa6ff3c-23a7-be32-d095-738976d5ab7b@linux.intel.com>
Date: Thu, 6 Oct 2022 11:03:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [Intel-gfx] [PATCH v4 3/4] drm/i915: Make the heartbeat play nice
 with long pre-emption timeouts
Content-Language: en-US
To: John Harrison <john.c.harrison@intel.com>, Intel-GFX@Lists.FreeDesktop.Org
References: <20220929021813.2172701-1-John.C.Harrison@Intel.com>
 <20220929021813.2172701-4-John.C.Harrison@Intel.com>
 <a2c2cddf-009b-a2e0-2af2-6f1553c59cbc@linux.intel.com>
 <ae042c9d-f6f1-2ecd-e23a-7d6994c97151@intel.com>
 <28690581-b934-b99f-feb9-78a8e6c2d052@linux.intel.com>
 <89566262-2cd0-f456-e8b2-c7bc6ad6fe36@intel.com>
 <c61d540a-9b3a-76f5-2641-c508a6e2bcbd@linux.intel.com>
 <0e29ab23-4304-bd62-7065-4d1ab3a1461a@linux.intel.com>
 <4cfc1d07-9197-ed5d-52b2-db63490416f9@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <4cfc1d07-9197-ed5d-52b2-db63490416f9@intel.com>
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


On 05/10/2022 19:48, John Harrison wrote:
> On 10/3/2022 05:00, Tvrtko Ursulin wrote:
>> On 03/10/2022 08:53, Tvrtko Ursulin wrote:
>>> On 30/09/2022 18:44, John Harrison wrote:
>>>> On 9/30/2022 02:22, Tvrtko Ursulin wrote:
>>>>> On 29/09/2022 17:21, John Harrison wrote:
>>>>>> On 9/29/2022 00:42, Tvrtko Ursulin wrote:
>>>>>>> On 29/09/2022 03:18, John.C.Harrison@Intel.com wrote:
>>>>>>>> From: John Harrison <John.C.Harrison@Intel.com>
>>>>>>>>
>>>>>>>> Compute workloads are inherently not pre-emptible for long 
>>>>>>>> periods on
>>>>>>>> current hardware. As a workaround for this, the pre-emption timeout
>>>>>>>> for compute capable engines was disabled. This is undesirable 
>>>>>>>> with GuC
>>>>>>>> submission as it prevents per engine reset of hung contexts. 
>>>>>>>> Hence the
>>>>>>>> next patch will re-enable the timeout but bumped up by an order of
>>>>>>>> magnitude.
>>>>>>>>
>>>>>>>> However, the heartbeat might not respect that. Depending upon 
>>>>>>>> current
>>>>>>>> activity, a pre-emption to the heartbeat pulse might not even be
>>>>>>>> attempted until the last heartbeat period. Which means that only 
>>>>>>>> one
>>>>>>>> period is granted for the pre-emption to occur. With the aforesaid
>>>>>>>> bump, the pre-emption timeout could be significantly larger than 
>>>>>>>> this
>>>>>>>> heartbeat period.
>>>>>>>>
>>>>>>>> So adjust the heartbeat code to take the pre-emption timeout into
>>>>>>>> account. When it reaches the final (high priority) period, it now
>>>>>>>> ensures the delay before hitting reset is bigger than the 
>>>>>>>> pre-emption
>>>>>>>> timeout.
>>>>>>>>
>>>>>>>> v2: Fix for selftests which adjust the heartbeat period manually.
>>>>>>>>
>>>>>>>> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
>>>>>>>> ---
>>>>>>>>   .../gpu/drm/i915/gt/intel_engine_heartbeat.c  | 19 
>>>>>>>> +++++++++++++++++++
>>>>>>>>   1 file changed, 19 insertions(+)
>>>>>>>>
>>>>>>>> diff --git a/drivers/gpu/drm/i915/gt/intel_engine_heartbeat.c 
>>>>>>>> b/drivers/gpu/drm/i915/gt/intel_engine_heartbeat.c
>>>>>>>> index a3698f611f457..823a790a0e2ae 100644
>>>>>>>> --- a/drivers/gpu/drm/i915/gt/intel_engine_heartbeat.c
>>>>>>>> +++ b/drivers/gpu/drm/i915/gt/intel_engine_heartbeat.c
>>>>>>>> @@ -22,9 +22,28 @@
>>>>>>>>     static bool next_heartbeat(struct intel_engine_cs *engine)
>>>>>>>>   {
>>>>>>>> +    struct i915_request *rq;
>>>>>>>>       long delay;
>>>>>>>>         delay = READ_ONCE(engine->props.heartbeat_interval_ms);
>>>>>>>> +
>>>>>>>> +    rq = engine->heartbeat.systole;
>>>>>>>> +
>>>>>>>> +    if (rq && rq->sched.attr.priority >= I915_PRIORITY_BARRIER &&
>>>>>>>> +        delay == engine->defaults.heartbeat_interval_ms) {
>>>>>>>
>>>>>>> Maybe I forgot but what is the reason for the check against the 
>>>>>>> default heartbeat interval?
>>>>>> That's the 'v2: fix for selftests that manually adjust the 
>>>>>> heartbeat'. If something (or someone) has explicitly set an 
>>>>>> override of the heartbeat then it has to be assumed that they know 
>>>>>> what they are doing, and if things don't work any more that's 
>>>>>> their problem. But if we don't respect their override then they 
>>>>>> won't get the timings they expect and the selftest will fail.
>>>>>
>>>>> Isn't this a bit too strict for the non-selftest case? If the new 
>>>>> concept is extending the last pulse to guarantee preemption, then I 
>>>>> think we could allow tweaking of the heartbeat period. Like what if 
>>>>> user wants 1s, or 10s instead of 2.5s - why would that need to 
>>>>> break the improvement from this patch?
>>>> Then the user is back to where they were before this patch.
>>>>
>>>>>
>>>>> In what ways selftests fail? Are they trying to guess time to reset 
>>>>> based on the hearbeat period set? If so perhaps add a helper to 
>>>>> query it based on the last pulse extension.
>>>>
>>>> I don't recall. It was six months ago when I was actually working on 
>>>> this. And right now I do not have the time to go back and re-run all 
>>>> the testing and re-write a bunch of self tests with whole new 
>>>> helpers and algorithms and whatever else might be necessary to 
>>>> polish this to perfection. And in the meantime, all the existing 
>>>> issues are still present - there is no range checking on any of this 
>>>> stuff, it is very possible for a driver with default settings to 
>>>> break a legal workload because the heartbeat and pre-emption are 
>>>> fighting with each other, we don't even have per engine resets 
>>>> enabled, etc.
>>>>
>>>> Maybe it could be even better with a follow up patch. Feel free to 
>>>> do that. But as it stands, this patch set significantly improves the 
>>>> situation without making anything worse.
>>>
>>> As we seem to be in agreement that the check against default 
>>> heartbeat is a hack with only purpose to work around assumptions made 
>>> by selftests, then please file a Jira about removing it (this hack). 
>>> Then work can be assigned to someone to clean it up. With that done I 
>>> would agree the series is indeed an improvement and it would have my 
>>> ack.
> VLK-39595
> 
>>
>> One more thing - put a comment in the code along the lines of 
>> "FIXME/HACK: Work around selftests assumptions by only extending the 
>> last heartbeat if the period is at default value". The the Jira can 
>> associate to that comment.
>>
>> Until that is resolve it may also be worth emitting a drm_notice if 
>> heartbeat is changed via sysfs? Informing users the things will not 
>> work as expected if they fiddle with it. Whether as a blanket warning 
>> or checking first the 3-4x heartbeat vs preempt timeout value. That 
>> message should then go away once the follow up work to fix the 
>> selftests is done. See what the other reviewers will think.
>>
> What should the drm_notice say? How can you describe to an innocent end 
> user what the symptoms might be in a single, concise line rather than 
> the huge email thread that it took to explain to you, an experienced 
> i915 kernel developer?

I think what would be useful is to have something like:

sysfs_write, or was it a setter helper?:

/* FIXME: Remove together with equally marked hack in next_heartbeat. */
if (heartbeat != default && heartbeat < 2 * preempt_timeout) {
	if (guc)
		drm_note("%s heartbeat interval adjusted to a non-default value which 
may downgrade individual engine resets to full GPU resets!\n", 
engine->name);
	else
		drm_note("%s heartbeat interval adjusted to a non-default value which 
may cause engine resets to target innocent contexts!\n", engine->name);
}

Sounds correct? Double preempt timeout or maybe 1.5x, not sure.

I do accept this is something which we could have had from the start (of 
heartbeats and preempt timeout), but now that this patch fixes the logic 
to extend the last pulse, apart from the selftests hack which limits it 
again, I think it is reasonable to add it in scope of this series.

> Is there a single end user out there that actually uses the sysfs 
> interface for tuning these parameters? AFAIK, the usage is 99.999% IGT, 
> the rest is internal developers debugging problems. Maybe someone 
> somewhere has noticed them because they have a compute task that takes 
> tens of seconds to complete. But the official guidance for compute users 
> is to simply disable the heartbeat completely. We never tell anyone to 
> try to tune the period or the pre-emption timeout to their specific 
> application. That's just too complicated and unpredictable. We need 
> defaults that work for the general case and for compute it is disabled. 
> Manual tuning just isn't useful. Unless it's to reduce the stupidly high 
> pre-emption timeout to get a more responsive desktop because they never 
> actually need to run long compute tasks. And in that case, you don't 
> need extended last periods because your pre-emption timeout is already 
> massively smaller than the period.

Don't know if there are users but it's out there and it's ABI so I would 
err on the side of caution. It happened in the past that we were 
discussing how something is maybe not important and then with uncanny 
coincidence users immediately appear complaining about the very same thing.

Again, I do agree the patch is not making anything worse - on the 
contrary it is improving things in the default configuration. And as I 
think the principle of last pulse extension is the right approach it 
feels selftests are too weak of a reason to give up on it so easily.

Regards,

Tvrtko
