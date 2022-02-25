Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C784C4C4AF1
	for <lists+dri-devel@lfdr.de>; Fri, 25 Feb 2022 17:36:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62A1510E524;
	Fri, 25 Feb 2022 16:36:49 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51E2210E592;
 Fri, 25 Feb 2022 16:36:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645807008; x=1677343008;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=8KX515qNIS/83TCB/1RRKQPWz5YwYYB6iwAk6cHK9HY=;
 b=Ku6zBu9xBeQGJCeJOpT4O1WT1nvMfFMYEYm2qehI5boJaPHOTSj1gwWE
 RcWGQzPo8Cgi1wsLX6HGdUVL3tUKsFn1u0/pEqWEtnRIHhi+Ixzkx27uf
 JV5ZN+GlTFivT+ccd4QBmxKRw9CrdYAGbEeZ1LrlzEgxlmSABNPmBAgNj
 PZZqlbwaQRzvkAiVvrS9nUXOp5Fb/vPDz9HiQjy5E8fcBpa1s8y26KPL3
 UGGVgIpy767pYGu1U7NqSBKhpLfDkS08iWxGDYRcD+ttJHpqG4hJ6n7CD
 RrB9Vl976I9eV6GhF8YNjPxEtyYcTNzfW4ZZY0uGzwOBvO7NfH32wR3St g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10268"; a="236036670"
X-IronPort-AV: E=Sophos;i="5.90,136,1643702400"; d="scan'208";a="236036670"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2022 08:36:47 -0800
X-IronPort-AV: E=Sophos;i="5.90,136,1643702400"; d="scan'208";a="549323238"
Received: from pkinsell-mobl.ger.corp.intel.com (HELO [10.213.234.117])
 ([10.213.234.117])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2022 08:36:46 -0800
Message-ID: <e3abab20-084a-146b-8c6f-274474aa7bc1@linux.intel.com>
Date: Fri, 25 Feb 2022 16:36:44 +0000
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
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <6526515c-a4d1-1815-3ee8-6a35dfa5036f@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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


On 24/02/2022 20:02, John Harrison wrote:
> On 2/23/2022 04:00, Tvrtko Ursulin wrote:
>> On 23/02/2022 02:22, John Harrison wrote:
>>> On 2/22/2022 01:53, Tvrtko Ursulin wrote:
>>>> On 18/02/2022 21:33, John.C.Harrison@Intel.com wrote:
>>>>> From: John Harrison <John.C.Harrison@Intel.com>
>>>>>
>>>>> Compute workloads are inherently not pre-emptible on current hardware.
>>>>> Thus the pre-emption timeout was disabled as a workaround to prevent
>>>>> unwanted resets. Instead, the hang detection was left to the heartbeat
>>>>> and its (longer) timeout. This is undesirable with GuC submission as
>>>>> the heartbeat is a full GT reset rather than a per engine reset and so
>>>>> is much more destructive. Instead, just bump the pre-emption timeout
>>>>
>>>> Can we have a feature request to allow asking GuC for an engine reset?
>>> For what purpose?
>>
>> To allow "stopped heartbeat" to reset the engine, however..
>>
>>> GuC manages the scheduling of contexts across engines. With virtual 
>>> engines, the KMD has no knowledge of which engine a context might be 
>>> executing on. Even without virtual engines, the KMD still has no 
>>> knowledge of which context is currently executing on any given engine 
>>> at any given time.
>>>
>>> There is a reason why hang detection should be left to the entity 
>>> that is doing the scheduling. Any other entity is second guessing at 
>>> best.
>>>
>>> The reason for keeping the heartbeat around even when GuC submission 
>>> is enabled is for the case where the KMD/GuC have got out of sync 
>>> with either other somehow or GuC itself has just crashed. I.e. when 
>>> no submission at all is working and we need to reset the GuC itself 
>>> and start over.
>>
>> .. I wasn't really up to speed to know/remember heartbeats are nerfed 
>> already in GuC mode.
> Not sure what you mean by that claim. Engine resets are handled by GuC 
> because GuC handles the scheduling. You can't do the former if you 
> aren't doing the latter. However, the heartbeat is still present and is 
> still the watchdog by which engine resets are triggered. As per the rest 
> of the submission process, the hang detection and recovery is split 
> between i915 and GuC.

I meant that "stopped heartbeat on engine XXX" can only do a full GPU reset on GuC.

	intel_gt_handle_error(engine->gt, engine->mask,
			      I915_ERROR_CAPTURE,
			      "stopped heartbeat on %s",
			      engine->name);

intel_gt_handle_error:

	/*
	 * Try engine reset when available. We fall back to full reset if
	 * single reset fails.
	 */
	if (!intel_uc_uses_guc_submission(&gt->uc) &&
	    intel_has_reset_engine(gt) && !intel_gt_is_wedged(gt)) {
		local_bh_disable();
		for_each_engine_masked(engine, gt, engine_mask, tmp) {

You said "However, the heartbeat is still present and is still the watchdog by which engine resets are triggered", now I don't know what you meant by this. It actually triggers a single engine reset in GuC mode? Where in code does that happen if this block above shows it not taking the engine reset path?

>> I am not sure it was the best way since full reset penalizes everyone 
>> for one hanging engine. Better question would be why leave heartbeats 
>> around to start with with GuC? If you want to use it to health check 
>> GuC, as you say, maybe just send a CT message and expect replies? Then 
>> full reset would make sense. It also achieves the goal of not 
>> seconding guessing the submission backend you raise.
> Adding yet another hang detection mechanism is yet more complication and 
> is unnecessary when we already have one that works well enough. As 
> above, the heartbeat is still required for sending the pulses that cause 
> pre-emptions and so let GuC detect hangs. It also provides a fallback 
> against a dead GuC by default. So why invent yet another wheel?

Lets first clarify the previous block to make sure there aren't any misunderstandings there.

Regards,

Tvrtko

>> Like it is now, and the need for this series demonstrates it, the 
>> whole thing has a pretty poor "impedance" match. Not even sure what 
>> intel_guc_find_hung_context is doing in intel_engine_hearbeat.c - why 
>> is that not in intel_gt_handle_error at least? Why is hearbeat code 
>> special and other callers of intel_gt_handle_error don't need it?
> There is no guilty context if the reset was triggered via debugfs or 
> similar. And as stated ad nauseam, i915 is no longer handling the 
> scheduling and so cannot make assumptions about what is or is not 
> running on the hardware at any given time. And obviously, if the reset 
> initiated by GuC itself then i915 should not be second guessing the 
> guilty context as the GuC notification has already told us who was 
> responsible.
> 
> And to be clear, the 'poor impedance match' is purely because we don't 
> have mid-thread pre-emption and so need a stupidly huge timeout on 
> compute capable engines. Whereas, we don't want a total heatbeat timeout 
> of a minute or more. That is the impedance mis-match. If the 640ms was 
> acceptable for RCS then none of this hacky timeout algorithm mush would 
> be needed.
> 
> John.
> 
> 
>>
>> Regards,
>>
>> Tvrtko
> 
