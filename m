Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A012847AE67
	for <lists+dri-devel@lfdr.de>; Mon, 20 Dec 2021 16:01:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AECA12B69A;
	Mon, 20 Dec 2021 15:01:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1818C12B691;
 Mon, 20 Dec 2021 15:01:03 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10203"; a="220197227"
X-IronPort-AV: E=Sophos;i="5.88,220,1635231600"; d="scan'208";a="220197227"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Dec 2021 07:01:02 -0800
X-IronPort-AV: E=Sophos;i="5.88,220,1635231600"; d="scan'208";a="484079304"
Received: from rochetho-mobl.ger.corp.intel.com (HELO [10.213.247.233])
 ([10.213.247.233])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Dec 2021 07:01:01 -0800
Message-ID: <3d32df02-c02e-9c35-5165-79af1cb10100@linux.intel.com>
Date: Mon, 20 Dec 2021 15:00:53 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [Intel-gfx] [PATCH] drm/i915/guc: Log engine resets
Content-Language: en-US
To: Matthew Brost <matthew.brost@intel.com>
References: <20211214150704.984034-1-tvrtko.ursulin@linux.intel.com>
 <597d4ad0-fdae-49a6-b471-3a83d4c25b98@linux.intel.com>
 <20211217162254.GA22048@jons-linux-dev-box>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <20211217162254.GA22048@jons-linux-dev-box>
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
Cc: Intel-gfx@lists.freedesktop.org, John Harrison <John.C.Harrison@Intel.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 17/12/2021 16:22, Matthew Brost wrote:
> On Fri, Dec 17, 2021 at 12:15:53PM +0000, Tvrtko Ursulin wrote:
>>
>> On 14/12/2021 15:07, Tvrtko Ursulin wrote:
>>> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>>>
>>> Log engine resets done by the GuC firmware in the similar way it is done
>>> by the execlists backend.
>>>
>>> This way we have notion of where the hangs are before the GuC gains
>>> support for proper error capture.
>>
>> Ping - any interest to log this info?
>>
>> All there currently is a non-descriptive "[drm] GPU HANG: ecode
>> 12:0:00000000".
>>
> 
> Yea, this could be helpful. One suggestion below.
> 
>> Also, will GuC be reporting the reason for the engine reset at any point?
>>
> 
> We are working on the error state capture, presumably the registers will
> give a clue what caused the hang.
> 
> As for the GuC providing a reason, that isn't defined in the interface
> but that is decent idea to provide a hint in G2H what the issue was. Let
> me run that by the i915 GuC developers / GuC firmware team and see what
> they think.
> 
>> Regards,
>>
>> Tvrtko
>>
>>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>>> Cc: Matthew Brost <matthew.brost@intel.com>
>>> Cc: John Harrison <John.C.Harrison@Intel.com>
>>> ---
>>>    drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c | 12 +++++++++++-
>>>    1 file changed, 11 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>>> index 97311119da6f..51512123dc1a 100644
>>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>>> @@ -11,6 +11,7 @@
>>>    #include "gt/intel_context.h"
>>>    #include "gt/intel_engine_pm.h"
>>>    #include "gt/intel_engine_heartbeat.h"
>>> +#include "gt/intel_engine_user.h"
>>>    #include "gt/intel_gpu_commands.h"
>>>    #include "gt/intel_gt.h"
>>>    #include "gt/intel_gt_clock_utils.h"
>>> @@ -3934,9 +3935,18 @@ static void capture_error_state(struct intel_guc *guc,
>>>    {
>>>    	struct intel_gt *gt = guc_to_gt(guc);
>>>    	struct drm_i915_private *i915 = gt->i915;
>>> -	struct intel_engine_cs *engine = __context_to_physical_engine(ce);
>>> +	struct intel_engine_cs *engine = ce->engine;
>>>    	intel_wakeref_t wakeref;
>>> +	if (intel_engine_is_virtual(engine)) {
>>> +		drm_notice(&i915->drm, "%s class, engines 0x%x; GuC engine reset\n",
>>> +			   intel_engine_class_repr(engine->class),
>>> +			   engine->mask);
>>> +		engine = guc_virtual_get_sibling(engine, 0);
>>> +	} else {
>>> +		drm_notice(&i915->drm, "%s GuC engine reset\n", engine->name);
> 
> Probably include the guc_id of the context too then?

Is the guc id stable and useful on its own - who would be the user?

Regards,

Tvrtko
