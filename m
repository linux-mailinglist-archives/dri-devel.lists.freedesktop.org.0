Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9654B51D295
	for <lists+dri-devel@lfdr.de>; Fri,  6 May 2022 09:51:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 481BF10E5A7;
	Fri,  6 May 2022 07:51:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C822410E483;
 Fri,  6 May 2022 07:51:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651823506; x=1683359506;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=xwYtBfgsa8QVrCi9N1kvmefqBJe0dC/6jHj7fvZOLjQ=;
 b=ebBhf/BIJnW0XMXFM804GHfCVkr7f3SQ+p4n4ka/cIm2ff4fGtDDObHo
 2uqpD0elol4WQtVCNQVFn3fN+yHyFcC/fH3+gyfQ2VAq828eNVcOnt7CB
 MjVocsT7dYwQhf8oBa/k6MxZK++W2VtZ9A6hD7mR99o1pacplcy/4ghWQ
 jwVhoPBzy8Y1gHW+UeFNY7zs/TXy07Pyj7uynH3iAXyASKHz5bOhZ4fip
 XtGYtB55wQxg0/CSg8lU2z98kLCB/0AGNZf+SlfzRdxeUUqoRIQD9Q7df
 Wy3sJmV4EyEN1weBDabuxxk7QfpqCrLZUT5eudxfFrfHGaB1qeDCPwugG A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10338"; a="267987907"
X-IronPort-AV: E=Sophos;i="5.91,203,1647327600"; d="scan'208";a="267987907"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2022 00:51:45 -0700
X-IronPort-AV: E=Sophos;i="5.91,203,1647327600"; d="scan'208";a="735469381"
Received: from tkinch-mobl.ger.corp.intel.com (HELO [10.213.192.122])
 ([10.213.192.122])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2022 00:51:44 -0700
Message-ID: <7218e8a8-d22f-41ce-13b8-56b24471a494@linux.intel.com>
Date: Fri, 6 May 2022 08:51:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [Intel-gfx] [PATCH v2] drm/i915/guc: Support programming the EU
 priority in the GuC descriptor
Content-Language: en-US
To: John Harrison <john.c.harrison@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 intel-gfx@lists.freedesktop.org
References: <20220504234636.2119794-1-daniele.ceraolospurio@intel.com>
 <95b167c3-08a4-0323-a538-c0f34cc3a13d@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <95b167c3-08a4-0323-a538-c0f34cc3a13d@intel.com>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 05/05/2022 19:56, John Harrison wrote:
> On 5/4/2022 16:46, Daniele Ceraolo Spurio wrote:
>> From: Matthew Brost <matthew.brost@intel.com>
>>
>> In GuC submission mode the EU priority must be updated by the GuC rather
>> than the driver as the GuC owns the programming of the context 
>> descriptor.
>>
>> Given that the GuC code uses the GuC priorities, we can't use a generic
>> function using i915 priorities for both execlists and GuC submission.
>> The existing function has therefore been pushed to the execlists
>> back-end while a new one has been added for GuC.
>>
>> v2: correctly use the GuC prio.
>>
>> Cc: John Harrison <john.c.harrison@intel.com>
>> Cc: Matt Roper <matthew.d.roper@intel.com>
>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>> Signed-off-by: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
>> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Reviewed-by: John Harrison <John.C.Harrison@Intel.com>

I've asked for this already - since this seems a fix relevant for DG2, 
but now that it has been merged without a Fixes: tag, it will not get 
picked up for 5.19 by the scripts.

Maybe I can cherry pick it manually in a few weeks, or maybe you guys 
can send it to stable manually once 5.19 is released, please make a 
reminder item if you think 5.19 should have it.

Regards,

Tvrtko

> 
>> ---
>>   .../drm/i915/gt/intel_execlists_submission.c  | 12 +++++++++-
>>   drivers/gpu/drm/i915/gt/intel_lrc.h           | 10 ---------
>>   .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 22 +++++++++++++++++++
>>   3 files changed, 33 insertions(+), 11 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c 
>> b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
>> index 86f7a9ac1c394..2b0266cab66b9 100644
>> --- a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
>> +++ b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
>> @@ -661,6 +661,16 @@ static inline void execlists_schedule_out(struct 
>> i915_request *rq)
>>       i915_request_put(rq);
>>   }
>> +static u32 map_i915_prio_to_lrc_desc_prio(int prio)
>> +{
>> +    if (prio > I915_PRIORITY_NORMAL)
>> +        return GEN12_CTX_PRIORITY_HIGH;
>> +    else if (prio < I915_PRIORITY_NORMAL)
>> +        return GEN12_CTX_PRIORITY_LOW;
>> +    else
>> +        return GEN12_CTX_PRIORITY_NORMAL;
>> +}
>> +
>>   static u64 execlists_update_context(struct i915_request *rq)
>>   {
>>       struct intel_context *ce = rq->context;
>> @@ -669,7 +679,7 @@ static u64 execlists_update_context(struct 
>> i915_request *rq)
>>       desc = ce->lrc.desc;
>>       if (rq->engine->flags & I915_ENGINE_HAS_EU_PRIORITY)
>> -        desc |= lrc_desc_priority(rq_prio(rq));
>> +        desc |= map_i915_prio_to_lrc_desc_prio(rq_prio(rq));
>>       /*
>>        * WaIdleLiteRestore:bdw,skl
>> diff --git a/drivers/gpu/drm/i915/gt/intel_lrc.h 
>> b/drivers/gpu/drm/i915/gt/intel_lrc.h
>> index 31be734010db3..a390f0813c8b6 100644
>> --- a/drivers/gpu/drm/i915/gt/intel_lrc.h
>> +++ b/drivers/gpu/drm/i915/gt/intel_lrc.h
>> @@ -111,16 +111,6 @@ enum {
>>   #define XEHP_SW_COUNTER_SHIFT            58
>>   #define XEHP_SW_COUNTER_WIDTH            6
>> -static inline u32 lrc_desc_priority(int prio)
>> -{
>> -    if (prio > I915_PRIORITY_NORMAL)
>> -        return GEN12_CTX_PRIORITY_HIGH;
>> -    else if (prio < I915_PRIORITY_NORMAL)
>> -        return GEN12_CTX_PRIORITY_LOW;
>> -    else
>> -        return GEN12_CTX_PRIORITY_NORMAL;
>> -}
>> -
>>   static inline void lrc_runtime_start(struct intel_context *ce)
>>   {
>>       struct intel_context_stats *stats = &ce->stats;
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c 
>> b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>> index 75291e9846c50..8bf8b6d588d43 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>> @@ -2394,6 +2394,26 @@ static int guc_context_policy_init(struct 
>> intel_context *ce, bool loop)
>>       return ret;
>>   }
>> +static u32 map_guc_prio_to_lrc_desc_prio(u8 prio)
>> +{
>> +    /*
>> +     * this matches the mapping we do in map_i915_prio_to_guc_prio()
>> +     * (e.g. prio < I915_PRIORITY_NORMAL maps to 
>> GUC_CLIENT_PRIORITY_NORMAL)
>> +     */
>> +    switch (prio) {
>> +    default:
>> +        MISSING_CASE(prio);
>> +        fallthrough;
>> +    case GUC_CLIENT_PRIORITY_KMD_NORMAL:
>> +        return GEN12_CTX_PRIORITY_NORMAL;
>> +    case GUC_CLIENT_PRIORITY_NORMAL:
>> +        return GEN12_CTX_PRIORITY_LOW;
>> +    case GUC_CLIENT_PRIORITY_HIGH:
>> +    case GUC_CLIENT_PRIORITY_KMD_HIGH:
>> +        return GEN12_CTX_PRIORITY_HIGH;
>> +    }
>> +}
>> +
>>   static void prepare_context_registration_info(struct intel_context *ce,
>>                             struct guc_ctxt_registration_info *info)
>>   {
>> @@ -2420,6 +2440,8 @@ static void 
>> prepare_context_registration_info(struct intel_context *ce,
>>        */
>>       info->hwlrca_lo = lower_32_bits(ce->lrc.lrca);
>>       info->hwlrca_hi = upper_32_bits(ce->lrc.lrca);
>> +    if (engine->flags & I915_ENGINE_HAS_EU_PRIORITY)
>> +        info->hwlrca_lo |= 
>> map_guc_prio_to_lrc_desc_prio(ce->guc_state.prio);
>>       info->flags = CONTEXT_REGISTRATION_FLAG_KMD;
>>       /*
> 
