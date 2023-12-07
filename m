Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 255AA80866F
	for <lists+dri-devel@lfdr.de>; Thu,  7 Dec 2023 12:12:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 500FF10E878;
	Thu,  7 Dec 2023 11:12:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA5E110E86C;
 Thu,  7 Dec 2023 11:12:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701947533; x=1733483533;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=lIT4oMEOkl7XTgBW9gIfBCKxz6NZ0zwHN20qrxQ/eO0=;
 b=ixMrzpyYEwwMaz3FdrKVahVXDLhZ4NlenE/JZJi6pnX5HOhb+ew1EMDH
 OoO0EBxKLQT2p4qfG80e3abZklRTyYbGbPnIn2uf8LlTr4ipKz4PZz3xt
 HVjOK2rVD/RJ34bbli9l5G/pIlSyG6VQA3e7pVn1vRFaMaOfqDe/ycLTV
 +Xo6VDEiwyU1NIIih8IfyOHEFWVTL3kYEG3cBx1t8KLB+/G0QGwVytOMy
 /2P4ejTn9JwDmr9unu2WzxNfNaoBkiXihZx62dP0k58PXjtpT43dQzo/X
 n7NHNq6LQAta3bw12IcJqQ8PtQouy07klbxQbL9ruAf7Yid6tjiYKBF5G A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="374380685"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; d="scan'208";a="374380685"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2023 03:12:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="805982089"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; d="scan'208";a="805982089"
Received: from jbuller-mobl.ger.corp.intel.com (HELO [10.213.214.207])
 ([10.213.214.207])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2023 03:12:11 -0800
Message-ID: <d07d1b28-a04c-4728-8600-b5cbd706169b@linux.intel.com>
Date: Thu, 7 Dec 2023 11:12:11 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/i915: Use internal class when counting engine
 resets
Content-Language: en-US
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20231201122109.729006-1-tvrtko.ursulin@linux.intel.com>
 <20231201122109.729006-2-tvrtko.ursulin@linux.intel.com>
 <f97b550a-b61b-4964-960c-2671fc6e44cf@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <f97b550a-b61b-4964-960c-2671fc6e44cf@intel.com>
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
Cc: Alan Previn Teres Alexis <alan.previn.teres.alexis@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 06/12/2023 00:52, Daniele Ceraolo Spurio wrote:
> 
> 
> On 12/1/2023 4:21 AM, Tvrtko Ursulin wrote:
>> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>>
>> Commit 503579448db9 ("drm/i915/gsc: Mark internal GSC engine with 
>> reserved uabi class")
>> made the GSC0 engine not have a valid uabi class and so broke the engine
>> reset counting, which in turn was made class based in cb823ed9915b 
>> ("drm/i915/gt: Use intel_gt as the primary object for handling resets").
>>
>> Despite the title and commit text of the latter is not mentioning it (and
>> has left the storage array incorrectly sized), tracking by class, despite
>> it adding aliasing in hypthotetical multi-tile systems, is handy for
>> virtual engines which for instance do not have a valid engine->id.
>>
>> Therefore we keep that but just change it to use the internal class which
>> is always valid. We also add a helper to increment the count, which
>> aligns with the existing getter.
>>
>> What was broken without this fix were out of bounds reads every time a
>> reset would happen on the GSC0 engine, or during selftests when storing
>> and cross-checking the counts in igt_live_test_begin and
>> igt_live_test_end.
>>
>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>> Fixes: 503579448db9 ("drm/i915/gsc: Mark internal GSC engine with 
>> reserved uabi class")
>> Reported-by: Alan Previn Teres Alexis 
>> <alan.previn.teres.alexis@intel.com>
>> Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> 
> Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

Thanks! Lets see if 1/2 gets some attention so I don't have to split out 
2/2 just for CI.

Regards,

Tvrtko

> 
> Daniele
> 
>> ---
>>   drivers/gpu/drm/i915/gt/intel_reset.c             |  2 +-
>>   drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c |  5 +++--
>>   drivers/gpu/drm/i915/i915_gpu_error.h             | 12 ++++++++++--
>>   3 files changed, 14 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gt/intel_reset.c 
>> b/drivers/gpu/drm/i915/gt/intel_reset.c
>> index d5ed904f355d..6801f8b95c53 100644
>> --- a/drivers/gpu/drm/i915/gt/intel_reset.c
>> +++ b/drivers/gpu/drm/i915/gt/intel_reset.c
>> @@ -1293,7 +1293,7 @@ int __intel_engine_reset_bh(struct 
>> intel_engine_cs *engine, const char *msg)
>>       if (msg)
>>           drm_notice(&engine->i915->drm,
>>                  "Resetting %s for %s\n", engine->name, msg);
>> -    
>> atomic_inc(&engine->i915->gpu_error.reset_engine_count[engine->uabi_class]);
>> +    i915_increase_reset_engine_count(&engine->i915->gpu_error, engine);
>>       ret = intel_gt_reset_engine(engine);
>>       if (ret) {
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c 
>> b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>> index 04f8377fd7a3..58ea285c51d4 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>> @@ -5003,7 +5003,8 @@ static void capture_error_state(struct intel_guc 
>> *guc,
>>               if (match) {
>>                   intel_engine_set_hung_context(e, ce);
>>                   engine_mask |= e->mask;
>> -                
>> atomic_inc(&i915->gpu_error.reset_engine_count[e->uabi_class]);
>> +                i915_increase_reset_engine_count(&i915->gpu_error,
>> +                                 e);
>>               }
>>           }
>> @@ -5015,7 +5016,7 @@ static void capture_error_state(struct intel_guc 
>> *guc,
>>       } else {
>>           intel_engine_set_hung_context(ce->engine, ce);
>>           engine_mask = ce->engine->mask;
>> -        
>> atomic_inc(&i915->gpu_error.reset_engine_count[ce->engine->uabi_class]);
>> +        i915_increase_reset_engine_count(&i915->gpu_error, ce->engine);
>>       }
>>       with_intel_runtime_pm(&i915->runtime_pm, wakeref)
>> diff --git a/drivers/gpu/drm/i915/i915_gpu_error.h 
>> b/drivers/gpu/drm/i915/i915_gpu_error.h
>> index fa886620d3f8..7c255bb1c319 100644
>> --- a/drivers/gpu/drm/i915/i915_gpu_error.h
>> +++ b/drivers/gpu/drm/i915/i915_gpu_error.h
>> @@ -17,6 +17,7 @@
>>   #include "display/intel_display_device.h"
>>   #include "display/intel_display_params.h"
>>   #include "gt/intel_engine.h"
>> +#include "gt/intel_engine_types.h"
>>   #include "gt/intel_gt_types.h"
>>   #include "gt/uc/intel_uc_fw.h"
>> @@ -234,7 +235,7 @@ struct i915_gpu_error {
>>       atomic_t reset_count;
>>       /** Number of times an engine has been reset */
>> -    atomic_t reset_engine_count[I915_NUM_ENGINES];
>> +    atomic_t reset_engine_count[MAX_ENGINE_CLASS];
>>   };
>>   struct drm_i915_error_state_buf {
>> @@ -257,7 +258,14 @@ static inline u32 i915_reset_count(struct 
>> i915_gpu_error *error)
>>   static inline u32 i915_reset_engine_count(struct i915_gpu_error *error,
>>                         const struct intel_engine_cs *engine)
>>   {
>> -    return atomic_read(&error->reset_engine_count[engine->uabi_class]);
>> +    return atomic_read(&error->reset_engine_count[engine->class]);
>> +}
>> +
>> +static inline void
>> +i915_increase_reset_engine_count(struct i915_gpu_error *error,
>> +                 const struct intel_engine_cs *engine)
>> +{
>> +    atomic_inc(&error->reset_engine_count[engine->class]);
>>   }
>>   #define CORE_DUMP_FLAG_NONE           0x0
> 
