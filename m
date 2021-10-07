Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F244424F08
	for <lists+dri-devel@lfdr.de>; Thu,  7 Oct 2021 10:17:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 181CB6F3B5;
	Thu,  7 Oct 2021 08:17:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB1BA6F3AE;
 Thu,  7 Oct 2021 08:17:38 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10129"; a="312405254"
X-IronPort-AV: E=Sophos;i="5.85,354,1624345200"; d="scan'208";a="312405254"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2021 01:17:38 -0700
X-IronPort-AV: E=Sophos;i="5.85,354,1624345200"; d="scan'208";a="657300367"
Received: from cleane-mobl.ger.corp.intel.com (HELO [10.213.249.175])
 ([10.213.249.175])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2021 01:17:36 -0700
Subject: Re: [PATCH] drm/i915/pmu: Connect engine busyness stats from GuC to
 pmu
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 john.c.harrison@intel.com, daniel.vetter@ffwll.ch,
 Matthew Brost <matthew.brost@intel.com>
References: <20211005174711.55618-1-umesh.nerlige.ramappa@intel.com>
 <73824dba-142a-1022-252e-ce56de1227fa@linux.intel.com>
 <20211006204552.GI4467@unerlige-ril-10.165.21.208>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
Message-ID: <ae1570ac-4af1-bb3e-7a97-9b56e2242441@linux.intel.com>
Date: Thu, 7 Oct 2021 09:17:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211006204552.GI4467@unerlige-ril-10.165.21.208>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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


On 06/10/2021 21:45, Umesh Nerlige Ramappa wrote:
> On Wed, Oct 06, 2021 at 10:11:58AM +0100, Tvrtko Ursulin wrote:

[snip]

>>> @@ -762,12 +764,25 @@ submission_disabled(struct intel_guc *guc)
>>>  static void disable_submission(struct intel_guc *guc)
>>>  {
>>>      struct i915_sched_engine * const sched_engine = guc->sched_engine;
>>> +    struct intel_gt *gt = guc_to_gt(guc);
>>> +    struct intel_engine_cs *engine;
>>> +    enum intel_engine_id id;
>>> +    unsigned long flags;
>>>      if (__tasklet_is_enabled(&sched_engine->tasklet)) {
>>>          GEM_BUG_ON(!guc->ct.enabled);
>>>          __tasklet_disable_sync_once(&sched_engine->tasklet);
>>>          sched_engine->tasklet.callback = NULL;
>>>      }
>>> +
>>> +    cancel_delayed_work(&guc->timestamp.work);
>>
>> I am not sure when disable_submission gets called so a question - 
>> could it be important to call cancel_delayed_work_sync here to ensure 
>> if the worker was running it had exited before proceeding?
> 
> disable_submission is called in the reset_prepare path for uc resets. I 
> see this happening only with busy-hang test which does a global gt 
> reset. The counterpart for this is the guc_init_engine_stats which is 
> called post reset in the path to initialize GuC.
> 
> I tried cancel_delayed_work_sync both here and in park. Seems to work 
> fine, so will change the calls to _sync versions.

 From park is not allowed to sleep so can't do sync from there. It might 
have been my question which put you on a wrong path, sorry. Now I think 
question remains what happens if the ping worker happens to be sampling 
GuC state as GuC is being reset? Do you need some sort of a lock to 
protect that, or make sure worker skips if reset in progress?

>>
>> Also, does this interact with the open about resets? Should/could 
>> parking helper be called from here?
> 
> It is related to reset. Below, I am only updating the engine prev_total 
> to 0 since it gets reset on gt reset. I thought that's all we need to 
> keep the busyness increasing monotonically. By calling parking helper, 
> are you suggesting we should update the other stats too (total, start, 
> gt_stamp etc.)?

Don't know, was just asking.

Looking at it now again, resetting prev_total looks correct to me if it 
tracks rec->total_runtime which is also reset by GuC. 
Engine->stats.total_gt_clks is then purely software managed state which 
you only keep adding to. Yes looks fine to me.

>>
>>> +    mod_delayed_work(system_highpri_wq, &guc->timestamp.work,
>>> +             guc->timestamp.ping_delay);
>>> +}
>>> +
>>> +static int guc_action_enable_usage_stats(struct intel_guc *guc)
>>> +{
>>> +    u32 offset = intel_guc_engine_usage_offset(guc);
>>> +    u32 action[] = {
>>> +        INTEL_GUC_ACTION_SET_ENG_UTIL_BUFF,
>>> +        offset,
>>> +        0,
>>> +    };
>>> +
>>> +    return intel_guc_send(guc, action, ARRAY_SIZE(action));
>>> +}
>>> +
>>> +static void guc_init_engine_stats(struct intel_guc *guc)
>>> +{
>>> +    struct intel_gt *gt = guc_to_gt(guc);
>>> +    intel_wakeref_t wakeref;
>>> +
>>> +    mod_delayed_work(system_highpri_wq, &guc->timestamp.work,
>>> +             guc->timestamp.ping_delay);
>>
>> Not sure how this slots in with unpark. It will probably be called two 
>> times but it also probably does not matter? If you can figure it out 
>> perhaps you can remove this call from here. Or maybe there is a 
>> separate path where disable-enable can be called without the 
>> park-unpark transition. In which case you could call the unpark helper 
>> here. Not sure really.
> 
> - disable_submission pairs with guc_init_engine_stats for the gt reset 
>   path.
> - park/unpark just follow the gt_park/gt_unpark paths.
> 
> I haven't checked if reset eventually results in park/unpark or if they 
> are separate paths though. In the reset path, there are a bunch of 
> i915_requests going on, so difficult to say if reset caused the 
> gt_park/gt_unpark or was it the requests.
> 
> The cases where mod_delayed_work is called twice are:
> 
> 1) module load
> 2) i915_gem_resume (based on rc6-suspend test)
> 
> In both cases, unpark is followed by guc_init_engine_stats. Looking a 
> bit at what is returned from the mod_delayed_work, I see that it just 
> modifies the time if the work is already queued/pending, so I am 
> thinking we should be okay.
> 
> I don't see cancel getting called twice without a mod_delayed_work in 
> between.

Sounds good.

Regards,

Tvrtko
