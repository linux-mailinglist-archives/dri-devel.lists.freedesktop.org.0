Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E7AE4C4DBE
	for <lists+dri-devel@lfdr.de>; Fri, 25 Feb 2022 19:30:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E472210E15A;
	Fri, 25 Feb 2022 18:29:57 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A20F10E15A;
 Fri, 25 Feb 2022 18:29:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645813796; x=1677349796;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=v9UvyWNGPvya2VLLef32iXgQZBOEZR40xThV9gpaRtk=;
 b=FBtbP3y13iysnScaYS3Z8dBqVYl0ZopRkptSNZIcI+dHEoBh0Jc2rJuN
 ahfBR6YPlHr8xiY8YPRFzzHJCuymuax5+VZSZhhvmW1jJQ0+kRG8DDnAM
 Tt7Fbrg4t2/DJfLrORIF/U1VaP2R7VWydCc1WXfBxmZFozwGUxrnqzN1/
 dUwAUpbSkWO3Xt3k8DMB15jJFXqrTaGm0fGxHl21ULbUVn9V5xKPPt4WJ
 Dv9pEnJ9O38N4vUR/AkjW96iR4ySl5G5QWVF5fohhL2bl3ZQczAkozb+W
 7h2p2fMBx42TnGVmwMhSE91ztVy2JXP9RT7/iDHJ1Z8KkK3QzmJWxRrR+ w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10268"; a="252475729"
X-IronPort-AV: E=Sophos;i="5.90,136,1643702400"; d="scan'208";a="252475729"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2022 10:29:56 -0800
X-IronPort-AV: E=Sophos;i="5.90,136,1643702400"; d="scan'208";a="549368993"
Received: from pkinsell-mobl.ger.corp.intel.com (HELO [10.213.234.117])
 ([10.213.234.117])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2022 10:29:55 -0800
Message-ID: <34273e9e-8473-d95e-fdc0-47ca9e7ac8cb@linux.intel.com>
Date: Fri, 25 Feb 2022 18:29:52 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [Intel-gfx] [PATCH 0/3] Improve anti-pre-emption w/a for compute
 workloads
Content-Language: en-US
To: John Harrison <john.c.harrison@intel.com>, Intel-GFX@Lists.FreeDesktop.Org
References: <20220218213307.1338478-1-John.C.Harrison@Intel.com>
 <647b611a-d159-3a6f-2e3a-c8039a9503ec@linux.intel.com>
 <7ceb4723-7ebf-3762-ddb7-b16e48e804d3@intel.com>
 <ccc8d37f-2bcc-b258-4969-430c609c11d0@linux.intel.com>
 <6526515c-a4d1-1815-3ee8-6a35dfa5036f@intel.com>
 <e3abab20-084a-146b-8c6f-274474aa7bc1@linux.intel.com>
 <bb8d25fa-4b6f-0c53-302a-623787760bcd@intel.com>
 <720fe7f8-a712-c755-9fbe-70ac2fa008f6@linux.intel.com>
 <72ebab5f-1023-b590-f5a7-f5db2333e925@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <72ebab5f-1023-b590-f5a7-f5db2333e925@intel.com>
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


On 25/02/2022 18:01, John Harrison wrote:
> On 2/25/2022 09:39, Tvrtko Ursulin wrote:
>> On 25/02/2022 17:11, John Harrison wrote:
>>> On 2/25/2022 08:36, Tvrtko Ursulin wrote:
>>>> On 24/02/2022 20:02, John Harrison wrote:
>>>>> On 2/23/2022 04:00, Tvrtko Ursulin wrote:
>>>>>> On 23/02/2022 02:22, John Harrison wrote:
>>>>>>> On 2/22/2022 01:53, Tvrtko Ursulin wrote:
>>>>>>>> On 18/02/2022 21:33, John.C.Harrison@Intel.com wrote:
>>>>>>>>> From: John Harrison <John.C.Harrison@Intel.com>
>>>>>>>>>
>>>>>>>>> Compute workloads are inherently not pre-emptible on current 
>>>>>>>>> hardware.
>>>>>>>>> Thus the pre-emption timeout was disabled as a workaround to 
>>>>>>>>> prevent
>>>>>>>>> unwanted resets. Instead, the hang detection was left to the 
>>>>>>>>> heartbeat
>>>>>>>>> and its (longer) timeout. This is undesirable with GuC 
>>>>>>>>> submission as
>>>>>>>>> the heartbeat is a full GT reset rather than a per engine reset 
>>>>>>>>> and so
>>>>>>>>> is much more destructive. Instead, just bump the pre-emption 
>>>>>>>>> timeout
>>>>>>>>
>>>>>>>> Can we have a feature request to allow asking GuC for an engine 
>>>>>>>> reset?
>>>>>>> For what purpose?
>>>>>>
>>>>>> To allow "stopped heartbeat" to reset the engine, however..
>>>>>>
>>>>>>> GuC manages the scheduling of contexts across engines. With 
>>>>>>> virtual engines, the KMD has no knowledge of which engine a 
>>>>>>> context might be executing on. Even without virtual engines, the 
>>>>>>> KMD still has no knowledge of which context is currently 
>>>>>>> executing on any given engine at any given time.
>>>>>>>
>>>>>>> There is a reason why hang detection should be left to the entity 
>>>>>>> that is doing the scheduling. Any other entity is second guessing 
>>>>>>> at best.
>>>>>>>
>>>>>>> The reason for keeping the heartbeat around even when GuC 
>>>>>>> submission is enabled is for the case where the KMD/GuC have got 
>>>>>>> out of sync with either other somehow or GuC itself has just 
>>>>>>> crashed. I.e. when no submission at all is working and we need to 
>>>>>>> reset the GuC itself and start over.
>>>>>>
>>>>>> .. I wasn't really up to speed to know/remember heartbeats are 
>>>>>> nerfed already in GuC mode.
>>>>> Not sure what you mean by that claim. Engine resets are handled by 
>>>>> GuC because GuC handles the scheduling. You can't do the former if 
>>>>> you aren't doing the latter. However, the heartbeat is still 
>>>>> present and is still the watchdog by which engine resets are 
>>>>> triggered. As per the rest of the submission process, the hang 
>>>>> detection and recovery is split between i915 and GuC.
>>>>
>>>> I meant that "stopped heartbeat on engine XXX" can only do a full 
>>>> GPU reset on GuC.
>>> I mean that there is no 'stopped heartbeat on engine XXX' when i915 
>>> is not handling the recovery part of the process.
>>
>> Hmmmm?
>>
>> static void
>> reset_engine(struct intel_engine_cs *engine, struct i915_request *rq)
>> {
>>     if (IS_ENABLED(CONFIG_DRM_I915_DEBUG_GEM))
>>         show_heartbeat(rq, engine);
>>
>>     if (intel_engine_uses_guc(engine))
>>         /*
>>          * GuC itself is toast or GuC's hang detection
>>          * is disabled. Either way, need to find the
>>          * hang culprit manually.
>>          */
>>         intel_guc_find_hung_context(engine);
>>
>>     intel_gt_handle_error(engine->gt, engine->mask,
>>                   I915_ERROR_CAPTURE,
>>                   "stopped heartbeat on %s",
>>                   engine->name);
>> }
>>
>> How there is no "stopped hearbeat" in guc mode? From this code it 
>> certainly looks there is.
> Only when the GuC is toast and it is no longer an engine reset but a 
> full GT reset that is required. So technically, it is not a 'stopped 
> heartbeat on engine XXX' it is 'stopped heartbeat on GT#'.
> 
>>
>> You say below heartbeats are going in GuC mode. Now I totally don't 
>> understand how they are going but there is allegedly no "stopped 
>> hearbeat".
> Because if GuC is handling the detection and recovery then i915 will not 
> reach that point. GuC will do the engine reset and start scheduling the 
> next context before the heartbeat period expires. So the notification 
> will be a G2H about a specific context being reset rather than the i915 
> notification about a stopped heartbeat.
> 
>>
>>>>
>>>>     intel_gt_handle_error(engine->gt, engine->mask,
>>>>                   I915_ERROR_CAPTURE,
>>>>                   "stopped heartbeat on %s",
>>>>                   engine->name);
>>>>
>>>> intel_gt_handle_error:
>>>>
>>>>     /*
>>>>      * Try engine reset when available. We fall back to full reset if
>>>>      * single reset fails.
>>>>      */
>>>>     if (!intel_uc_uses_guc_submission(&gt->uc) &&
>>>>         intel_has_reset_engine(gt) && !intel_gt_is_wedged(gt)) {
>>>>         local_bh_disable();
>>>>         for_each_engine_masked(engine, gt, engine_mask, tmp) {
>>>>
>>>> You said "However, the heartbeat is still present and is still the 
>>>> watchdog by which engine resets are triggered", now I don't know 
>>>> what you meant by this. It actually triggers a single engine reset 
>>>> in GuC mode? Where in code does that happen if this block above 
>>>> shows it not taking the engine reset path?
>>> i915 sends down the per engine pulse.
>>> GuC schedules the pulse
>>> GuC attempts to pre-empt the currently active context
>>> GuC detects the pre-emption timeout
>>> GuC resets the engine
>>>
>>> The fundamental process is exactly the same as in execlist mode. It's 
>>> just that the above blocks of code (calls to intel_gt_handle_error 
>>> and such) are now inside the GuC not i915.
>>>
>>> Without the heartbeat going ping, there would be no context switching 
>>> and thus no pre-emption, no pre-emption timeout and so no hang and 
>>> reset recovery. And GuC cannot sent pulses by itself - it has no 
>>> ability to generate context workloads. So we need i915 to send the 
>>> pings and to gradually raise their priority. But the back half of the 
>>> heartbeat code is now inside the GuC. It will simply never reach the 
>>> i915 side timeout if GuC is doing the recovery (unless the 
>>> heartbeat's final period is too short). We should only reach the i915 
>>> side timeout if GuC itself is toast. At which point we need the full 
>>> GT reset to recover the GuC.
>>
>> If workload is not preempting and reset does not work, like engine is 
>> truly stuck, does the current code hit "stopped heartbeat" or not in 
>> GuC mode?
> Hang on, where did 'reset does not work' come into this?
> 
> If GuC is alive and the hardware is not broken then no, it won't. That's 
> the whole point. GuC does the detection and recovery. The KMD will never 
> reach 'stopped heartbeat'.
> 
> If the hardware is broken and the reset does not work then GuC will send 
> a 'failed reset' notification to the KMD. The KMD treats that as a major 
> error and immediately does a full GT reset. So there is still no 
> 'stopped heartbeat'.
> 
> If GuC has died (or a KMD bug has caused sufficient confusion to make it 
> think the GuC has died) then yes, you will reach that code. But in that 
> case it is not an engine reset that is required, it is a full GT reset 
> including a reset of the GuC.

Got it, so what is actually wrong is calling intel_gt_handle_error with 
an engine->mask in GuC mode. intel_engine_hearbeat.c/reset_engine should 
fork into two (in some way), depending on backend, so in the case of GuC 
it can call a variant of intel_gt_handle_error which would be explicitly 
about a full GPU reset only, instead of a sprinkle of 
intel_uc_uses_guc_submission in that function. Possibly even off load 
the reset to a single per gt worker, so that if multiple active engines 
trigger the reset roughly simultaneously, there is only one full GPU 
reset. And it gets correctly labeled as "dead GuC" or something.

Regards,

Tvrtko
