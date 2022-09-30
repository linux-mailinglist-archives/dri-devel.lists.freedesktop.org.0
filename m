Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 217385F0776
	for <lists+dri-devel@lfdr.de>; Fri, 30 Sep 2022 11:22:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DC6F10EBED;
	Fri, 30 Sep 2022 09:22:09 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C353210EBED;
 Fri, 30 Sep 2022 09:22:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1664529724; x=1696065724;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=m4uEmzkAK2yg8pfQwPUIF7uLCfVjAIWOMIl5haqlhtE=;
 b=dwIv8lJaWDtQDenPe2ci2ir8tg3MExfs7d9jjEE5s/z3H0jCQ1/eOm0y
 QAxJCoLvggl2mkq0KFbpxbhsVn5hBvXZGdjW9KQo0UyoPjpAGCPr9dPJB
 ab3ljiqJC658jQ+XaIb0k7KQT7SmE1zVMMFrejRW4zmj6SfPNpg3YmvVR
 kESouzYFFTYPpVql5YkdCfrQU0/168Z6cmFtxEOUsywS+kag9ubkw+w/w
 2C+bvC8umv0pamYbVZtdO8mQ+TD1S9EVt/z1Hi60dtZSZyqyHSr7Ox+PE
 mEX8GGar3VJj0HaYOhvBrBfQt647ObNTVykL3JA15+oO9OuY5VA6PhkqJ Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10485"; a="388427104"
X-IronPort-AV: E=Sophos;i="5.93,358,1654585200"; d="scan'208";a="388427104"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2022 02:22:03 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10485"; a="617936297"
X-IronPort-AV: E=Sophos;i="5.93,358,1654585200"; d="scan'208";a="617936297"
Received: from dsawant-mobl.ger.corp.intel.com (HELO [10.213.195.50])
 ([10.213.195.50])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2022 02:22:02 -0700
Message-ID: <28690581-b934-b99f-feb9-78a8e6c2d052@linux.intel.com>
Date: Fri, 30 Sep 2022 10:22:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [Intel-gfx] [PATCH v4 3/4] drm/i915: Make the heartbeat play nice
 with long pre-emption timeouts
Content-Language: en-US
To: John Harrison <john.c.harrison@intel.com>, Intel-GFX@Lists.FreeDesktop.Org
References: <20220929021813.2172701-1-John.C.Harrison@Intel.com>
 <20220929021813.2172701-4-John.C.Harrison@Intel.com>
 <a2c2cddf-009b-a2e0-2af2-6f1553c59cbc@linux.intel.com>
 <ae042c9d-f6f1-2ecd-e23a-7d6994c97151@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <ae042c9d-f6f1-2ecd-e23a-7d6994c97151@intel.com>
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


On 29/09/2022 17:21, John Harrison wrote:
> On 9/29/2022 00:42, Tvrtko Ursulin wrote:
>> On 29/09/2022 03:18, John.C.Harrison@Intel.com wrote:
>>> From: John Harrison <John.C.Harrison@Intel.com>
>>>
>>> Compute workloads are inherently not pre-emptible for long periods on
>>> current hardware. As a workaround for this, the pre-emption timeout
>>> for compute capable engines was disabled. This is undesirable with GuC
>>> submission as it prevents per engine reset of hung contexts. Hence the
>>> next patch will re-enable the timeout but bumped up by an order of
>>> magnitude.
>>>
>>> However, the heartbeat might not respect that. Depending upon current
>>> activity, a pre-emption to the heartbeat pulse might not even be
>>> attempted until the last heartbeat period. Which means that only one
>>> period is granted for the pre-emption to occur. With the aforesaid
>>> bump, the pre-emption timeout could be significantly larger than this
>>> heartbeat period.
>>>
>>> So adjust the heartbeat code to take the pre-emption timeout into
>>> account. When it reaches the final (high priority) period, it now
>>> ensures the delay before hitting reset is bigger than the pre-emption
>>> timeout.
>>>
>>> v2: Fix for selftests which adjust the heartbeat period manually.
>>>
>>> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
>>> ---
>>>   .../gpu/drm/i915/gt/intel_engine_heartbeat.c  | 19 +++++++++++++++++++
>>>   1 file changed, 19 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/i915/gt/intel_engine_heartbeat.c 
>>> b/drivers/gpu/drm/i915/gt/intel_engine_heartbeat.c
>>> index a3698f611f457..823a790a0e2ae 100644
>>> --- a/drivers/gpu/drm/i915/gt/intel_engine_heartbeat.c
>>> +++ b/drivers/gpu/drm/i915/gt/intel_engine_heartbeat.c
>>> @@ -22,9 +22,28 @@
>>>     static bool next_heartbeat(struct intel_engine_cs *engine)
>>>   {
>>> +    struct i915_request *rq;
>>>       long delay;
>>>         delay = READ_ONCE(engine->props.heartbeat_interval_ms);
>>> +
>>> +    rq = engine->heartbeat.systole;
>>> +
>>> +    if (rq && rq->sched.attr.priority >= I915_PRIORITY_BARRIER &&
>>> +        delay == engine->defaults.heartbeat_interval_ms) {
>>
>> Maybe I forgot but what is the reason for the check against the 
>> default heartbeat interval?
> That's the 'v2: fix for selftests that manually adjust the heartbeat'. 
> If something (or someone) has explicitly set an override of the 
> heartbeat then it has to be assumed that they know what they are doing, 
> and if things don't work any more that's their problem. But if we don't 
> respect their override then they won't get the timings they expect and 
> the selftest will fail.

Isn't this a bit too strict for the non-selftest case? If the new 
concept is extending the last pulse to guarantee preemption, then I 
think we could allow tweaking of the heartbeat period. Like what if user 
wants 1s, or 10s instead of 2.5s - why would that need to break the 
improvement from this patch?

In what ways selftests fail? Are they trying to guess time to reset 
based on the hearbeat period set? If so perhaps add a helper to query it 
based on the last pulse extension.

Regards,

Tvrtko
