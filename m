Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DB6663ED87
	for <lists+dri-devel@lfdr.de>; Thu,  1 Dec 2022 11:21:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85FCA10E5A7;
	Thu,  1 Dec 2022 10:21:16 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8478C10E5A7;
 Thu,  1 Dec 2022 10:21:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1669890073; x=1701426073;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=AtSjWmDqrb8yFKbawclbG90tt56e83BXXimlO11WBGo=;
 b=a9+iX+l3NTdN+2/1b8nnNGwqqgAguyAjpz6hleI2ZpFdTuKKEI6cPz5e
 Y5gffLLdjraDJRjfACSoPLW2tj/uPqAgV5XVjY7tDrE9MFsvC5QNDueBw
 3Fnb9uIoq1OTS+Z40JTb6sysxBAOC0wNlYprIjBuTQcE1YVhI8mh6NWKN
 rEtyYO+gPWeChMZhj4KZb99jR2OeZEsrqp4wrA2SrimpGDrv+tMnalB7N
 xN/hDV7TCb8sjvn20QxeBSgqGCwK5uSuPHFm88iSwfo55CabmJWm72/bE
 8uSk6QdTonIMqM4pCU8KKLRzhZdcYdEob1WVhWoxil+5BRa+JS7KBzeYU A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10547"; a="295341258"
X-IronPort-AV: E=Sophos;i="5.96,209,1665471600"; d="scan'208";a="295341258"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2022 02:21:07 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10547"; a="638341004"
X-IronPort-AV: E=Sophos;i="5.96,209,1665471600"; d="scan'208";a="638341004"
Received: from aguefor-mobl.ger.corp.intel.com (HELO [10.213.229.22])
 ([10.213.229.22])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2022 02:21:04 -0800
Message-ID: <032d85dc-8f03-f638-a3d1-10fb45fe3bad@linux.intel.com>
Date: Thu, 1 Dec 2022 10:21:02 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [Intel-gfx] [PATCH 2/2] drm/i915/guc: Look for a guilty context
 when an engine reset fails
Content-Language: en-US
To: John Harrison <john.c.harrison@intel.com>, Intel-GFX@Lists.FreeDesktop.Org
References: <20221129211253.3183480-1-John.C.Harrison@Intel.com>
 <20221129211253.3183480-3-John.C.Harrison@Intel.com>
 <17ba580d-556b-c963-703c-b80e74c050f9@linux.intel.com>
 <751f5d84-b7c4-e459-957a-06ad47d4b1de@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <751f5d84-b7c4-e459-957a-06ad47d4b1de@intel.com>
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


On 30/11/2022 21:04, John Harrison wrote:
> On 11/30/2022 00:30, Tvrtko Ursulin wrote:
>> On 29/11/2022 21:12, John.C.Harrison@Intel.com wrote:
>>> From: John Harrison <John.C.Harrison@Intel.com>
>>>
>>> Engine resets are supposed to never happen. But in the case when one
>>
>> Engine resets or engine reset failures? Hopefully the latter.
>>
> Oops. Yes, that was meant to say "engine resets are never supposed to 
> fail."
> 
>>> does (due to unknwon reasons that normally come down to a missing
> unknwon -> unknown
> 
>>> w/a), it is useful to get as much information out of the system as
>>> possible. Given that the GuC effectively dies on such a situation, it
>>> is not possible to get a guilty context notification back. So do a
>>> manual search instead. Given that GuC is dead, this is safe because
>>> GuC won't be changing the engine state asynchronously.
>>>
>>> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
>>> ---
>>>   drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c | 15 ++++++++++++++-
>>>   1 file changed, 14 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c 
>>> b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>>> index 0a42f1807f52c..c82730804a1c4 100644
>>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>>> @@ -4751,11 +4751,24 @@ static void reset_fail_worker_func(struct 
>>> work_struct *w)
>>>       guc->submission_state.reset_fail_mask = 0;
>>>       spin_unlock_irqrestore(&guc->submission_state.lock, flags);
>>>   -    if (likely(reset_fail_mask))
>>> +    if (likely(reset_fail_mask)) {
>>> +        struct intel_engine_cs *engine;
>>> +        enum intel_engine_id id;
>>> +
>>> +        /*
>>> +         * GuC is toast at this point - it dead loops after sending 
>>> the failed
>>> +         * reset notification. So need to manually determine the 
>>> guilty context.
>>> +         * Note that it should be safe/reliable to do this here 
>>> because the GuC
>>> +         * is toast and will not be scheduling behind the KMD's back.
>>> +         */
>>> +        for_each_engine_masked(engine, gt, reset_fail_mask, id)
>>> +            intel_guc_find_hung_context(engine);
>>> +
>>>           intel_gt_handle_error(gt, reset_fail_mask,
>>>                         I915_ERROR_CAPTURE,
>>>                         "GuC failed to reset engine mask=0x%x\n",
>>>                         reset_fail_mask);
>>
>> If GuC is defined by ABI contract to be dead, should the flow be 
>> attempting to do a full GPU reset here, or maybe it happens somewhere 
>> else as a consequence anyway? (In which case is the engine reset here 
>> even needed?)
> This is a full GT reset. i915 is not allowed to perform an engine reset 
> when using GuC submission. Those can only be done by GuC. So any forced 
> reset by i915 will be escalated to full GT internally.

Okay, I saw passing in of the engine mask and drew the wrong conclusion.

Regards,

Tvrtko
