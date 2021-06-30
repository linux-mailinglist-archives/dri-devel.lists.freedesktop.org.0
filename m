Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED65A3B88D2
	for <lists+dri-devel@lfdr.de>; Wed, 30 Jun 2021 20:58:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FC2E89221;
	Wed, 30 Jun 2021 18:58:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 228A06EA73;
 Wed, 30 Jun 2021 18:58:28 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10031"; a="272267786"
X-IronPort-AV: E=Sophos;i="5.83,312,1616482800"; d="scan'208";a="272267786"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2021 11:58:26 -0700
X-IronPort-AV: E=Sophos;i="5.83,312,1616482800"; d="scan'208";a="476404192"
Received: from johnharr-mobl1.amr.corp.intel.com (HELO [10.212.191.159])
 ([10.212.191.159])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2021 11:58:26 -0700
Subject: Re: [PATCH 47/47] drm/i915/guc: Unblock GuC submission on Gen11+
To: Martin Peres <martin.peres@free.fr>,
 Matthew Brost <matthew.brost@intel.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20210624070516.21893-1-matthew.brost@intel.com>
 <20210624070516.21893-48-matthew.brost@intel.com>
 <88cbe963-7188-f4ae-5acf-01a80bd2fe25@free.fr>
From: John Harrison <john.c.harrison@intel.com>
Message-ID: <05e1d462-57ae-888a-888c-3ad486150821@intel.com>
Date: Wed, 30 Jun 2021 11:58:25 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <88cbe963-7188-f4ae-5acf-01a80bd2fe25@free.fr>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
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
Cc: daniele.ceraolospurio@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 6/30/2021 01:22, Martin Peres wrote:
> On 24/06/2021 10:05, Matthew Brost wrote:
>> From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>>
>> Unblock GuC submission on Gen11+ platforms.
>>
>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>> ---
>>   drivers/gpu/drm/i915/gt/uc/intel_guc.h            |  1 +
>>   drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c |  8 ++++++++
>>   drivers/gpu/drm/i915/gt/uc/intel_guc_submission.h |  3 +--
>>   drivers/gpu/drm/i915/gt/uc/intel_uc.c             | 14 +++++++++-----
>>   4 files changed, 19 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.h 
>> b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
>> index fae01dc8e1b9..77981788204f 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc.h
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
>> @@ -54,6 +54,7 @@ struct intel_guc {
>>       struct ida guc_ids;
>>       struct list_head guc_id_list;
>>   +    bool submission_supported;
>>       bool submission_selected;
>>         struct i915_vma *ads_vma;
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c 
>> b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>> index a427336ce916..405339202280 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>> @@ -2042,6 +2042,13 @@ void intel_guc_submission_disable(struct 
>> intel_guc *guc)
>>       /* Note: By the time we're here, GuC may have already been 
>> reset */
>>   }
>>   +static bool __guc_submission_supported(struct intel_guc *guc)
>> +{
>> +    /* GuC submission is unavailable for pre-Gen11 */
>> +    return intel_guc_is_supported(guc) &&
>> +           INTEL_GEN(guc_to_gt(guc)->i915) >= 11;
>> +}
>> +
>>   static bool __guc_submission_selected(struct intel_guc *guc)
>>   {
>>       struct drm_i915_private *i915 = guc_to_gt(guc)->i915;
>> @@ -2054,6 +2061,7 @@ static bool __guc_submission_selected(struct 
>> intel_guc *guc)
>>     void intel_guc_submission_init_early(struct intel_guc *guc)
>>   {
>> +    guc->submission_supported = __guc_submission_supported(guc);
>>       guc->submission_selected = __guc_submission_selected(guc);
>>   }
>>   diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.h 
>> b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.h
>> index a2a3fad72be1..be767eb6ff71 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.h
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.h
>> @@ -37,8 +37,7 @@ int intel_guc_wait_for_pending_msg(struct intel_guc 
>> *guc,
>>     static inline bool intel_guc_submission_is_supported(struct 
>> intel_guc *guc)
>>   {
>> -    /* XXX: GuC submission is unavailable for now */
>> -    return false;
>> +    return guc->submission_supported;
>>   }
>>     static inline bool intel_guc_submission_is_wanted(struct 
>> intel_guc *guc)
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc.c 
>> b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
>> index 7a69c3c027e9..61be0aa81492 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_uc.c
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
>> @@ -34,8 +34,15 @@ static void uc_expand_default_options(struct 
>> intel_uc *uc)
>>           return;
>>       }
>>   -    /* Default: enable HuC authentication only */
>> -    i915->params.enable_guc = ENABLE_GUC_LOAD_HUC;
>> +    /* Intermediate platforms are HuC authentication only */
>> +    if (IS_DG1(i915) || IS_ALDERLAKE_S(i915)) {
>> +        drm_dbg(&i915->drm, "Disabling GuC only due to old 
>> platform\n");
>
> This comment does not seem accurate, given that DG1 is barely out, and 
> ADL is not out yet. How about:
>
> "Disabling GuC on untested platforms"?
>
Just because something is not in the shops yet does not mean it is new. 
Technology is always obsolete by the time it goes on sale.

And the issue is not a lack of testing, it is a question of whether we 
are allowed to change the default on something that has already started 
being used by customers or not (including pre-release beta customers). 
I.e. it is basically a political decision not an engineering decision.


>> +        i915->params.enable_guc = ENABLE_GUC_LOAD_HUC;
>> +        return;
>> +    }
>> +
>> +    /* Default: enable HuC authentication and GuC submission */
>> +    i915->params.enable_guc = ENABLE_GUC_LOAD_HUC | 
>> ENABLE_GUC_SUBMISSION;
>
> This seems to be in contradiction with the GuC submission plan which 
> states:
>
> "Not enabled by default on any current platforms but can be enabled 
> via modparam enable_guc".
All current platforms have already been explicitly tested for above. 
This is setting the default on newer platforms - ADL-P and later. For 
which the official expectation is to have GuC enabled.

>
> When you rework the patch, could you please add a warning when the 
> user force-enables the GuC Command Submission? 
There already is one. If you set the module parameter then the kernel is 
tainted. That means 'here be dragons' - you have done something 
officially not supported to your kernel so all bets are off, if it blows 
up it is your own problem.

> Something like:
>
> "WARNING: The user force-enabled the experimental GuC command 
> submission backend using i915.enable_guc. Please disable it if 
> experiencing stability issues. No bug reports will be accepted on this 
> backend".
>
> This should allow you to work on the backend, while communicating 
> clearly to users that it is not ready just yet. Once it has matured, 
> the warning can be removed.
The fact that ADL-P is not on the shelves in your local retail store 
should be sufficient to ensure that users are aware that ADL-P support 
is not entirely mature yet. And in many ways, not just GuC based submission.

John.


>
> Cheers,
> Martin
>
>>   }
>>     /* Reset GuC providing us with fresh state for both GuC and HuC.
>> @@ -313,9 +320,6 @@ static int __uc_init(struct intel_uc *uc)
>>       if (i915_inject_probe_failure(uc_to_gt(uc)->i915))
>>           return -ENOMEM;
>>   -    /* XXX: GuC submission is unavailable for now */
>> -    GEM_BUG_ON(intel_uc_uses_guc_submission(uc));
>> -
>>       ret = intel_guc_init(guc);
>>       if (ret)
>>           return ret;
>>

