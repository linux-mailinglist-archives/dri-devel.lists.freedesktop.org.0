Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A17A54786C7
	for <lists+dri-devel@lfdr.de>; Fri, 17 Dec 2021 10:10:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22CD710FA60;
	Fri, 17 Dec 2021 09:10:34 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C438910FA5E;
 Fri, 17 Dec 2021 09:10:32 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10200"; a="226575972"
X-IronPort-AV: E=Sophos;i="5.88,213,1635231600"; d="scan'208";a="226575972"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2021 01:10:32 -0800
X-IronPort-AV: E=Sophos;i="5.88,213,1635231600"; d="scan'208";a="605844894"
Received: from cmccall-mobl2.ger.corp.intel.com (HELO [10.213.248.38])
 ([10.213.248.38])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2021 01:10:31 -0800
Message-ID: <b340a472-e780-0519-615c-2396bb69c9db@linux.intel.com>
Date: Fri, 17 Dec 2021 09:10:29 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [Intel-gfx] [PATCH] drm/i915/guc: Check for wedged before doing
 stuff
Content-Language: en-US
To: John Harrison <john.c.harrison@intel.com>, Intel-GFX@Lists.FreeDesktop.Org
References: <20211215224556.3382217-1-John.C.Harrison@Intel.com>
 <71a04b30-7019-f2df-e18d-f04893860e71@linux.intel.com>
 <7456242f-654a-1109-c91b-4ecb7a0f3a64@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <7456242f-654a-1109-c91b-4ecb7a0f3a64@intel.com>
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


On 16/12/2021 20:30, John Harrison wrote:
> On 12/16/2021 00:47, Tvrtko Ursulin wrote:
>> On 15/12/2021 22:45, John.C.Harrison@Intel.com wrote:
>>> From: John Harrison <John.C.Harrison@Intel.com>
>>>
>>> A fault injection probe test hit a BUG_ON in a GuC error path. It
>>> showed that the GuC code could potentially attempt to do many things
>>> when the device is actually wedged. So, add a check in to prevent that.
>>>
>>> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
>>> ---
>>>   drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c | 3 ++-
>>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c 
>>> b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>>> index 97311119da6f..88f002c4d41b 100644
>>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>>> @@ -1350,7 +1350,8 @@ submission_disabled(struct intel_guc *guc)
>>>       struct i915_sched_engine * const sched_engine = guc->sched_engine;
>>>         return unlikely(!sched_engine ||
>>> - !__tasklet_is_enabled(&sched_engine->tasklet));
>>> + !__tasklet_is_enabled(&sched_engine->tasklet) ||
>>> +            test_bit(I915_WEDGED, &guc_to_gt(guc)->reset.flags));
>>
>> Or intel_gt_is_wedged ?
> Hmm. I just copied the test from somewhere else. Is there any particular 
> reason why other bits of code would be doing the explicit test_bit 

Lets see:

$ grep intel_gt_is_wedged . -r | wc -l
55

$ grep test_bit.*I915_WEDGED, . -r
./gt/intel_gt.h:                   !test_bit(I915_WEDGED, &gt->reset.flags));
./gt/intel_gt.h:        return unlikely(test_bit(I915_WEDGED, &gt->reset.flags));
./gt/intel_reset.c:     if (test_bit(I915_WEDGED, &gt->reset.flags))
./gt/intel_reset.c:     if (test_bit(I915_WEDGED, &gt->reset.flags))
./gt/intel_reset.c:     if (!test_bit(I915_WEDGED, &gt->reset.flags))
./gt/intel_reset.c:     if (!test_bit(I915_WEDGED, &gt->reset.flags))
./gt/uc/intel_guc_submission.c:              test_bit(I915_WEDGED, &guc_to_gt(guc)->reset.flags))) {

So outside the components which own the flag only GuC goes direct therefore you might know better if there is a special reason for that.

The code there looks like this:

	/* Reset called during driver load or during wedge? */
	if (unlikely(!guc_submission_initialized(guc) ||
		     test_bit(I915_WEDGED, &guc_to_gt(guc)->reset.flags)))
		return;

Perhaps that check and then one you are adding could even be partly the same?

> rather than calling the helper? I see the helper has a BUG_ON. Can that 
> fire if called at the wrong time in the reset path?

The grep above suggests it should be safe. And looking at the assert it seems to check if someone set the fatal wedge bit without setting the "normal" wedge eg. setting it directly bypassing the helper. So should be fine.

Regards,

Tvrtko
