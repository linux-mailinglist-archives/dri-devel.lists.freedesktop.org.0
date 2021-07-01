Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B2A73B961E
	for <lists+dri-devel@lfdr.de>; Thu,  1 Jul 2021 20:25:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE1B26EB84;
	Thu,  1 Jul 2021 18:25:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C504B6EB83;
 Thu,  1 Jul 2021 18:25:07 +0000 (UTC)
Received: from [192.168.1.190] (unknown [91.155.165.229])
 (Authenticated sender: martin.peres@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 56E8C5FF95;
 Thu,  1 Jul 2021 20:24:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1625163905;
 bh=nIKXoFlzl6Ro6Txjdckg1fozeafAyakjsc+oJSQd7h8=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=UfqR0SMc/j7mnVmk12rIdum0+HkWv0hoEzdxrJhgf8J+0HRV1inRvVqecSIg5D9jy
 UTo5Xid53Ryu+IAuawCRMwdpHpkY5R00a5GgcH4/+7+q77mRIL5XSOHphtlEe30sow
 29iQV8uF9vJDoYE+SdXlMBXFO5A7vqk/RgpqSiGh7apvG4kz46jd0QLibrtone32L8
 ECdxpYYFd84yJ8TzQXrztfm040lyuf2MVCt/xeoijrvI+uVkYog59BF5TMJG4ci7dQ
 eIiz8CEzWc8RMVGfQLhNXogW3HN1EuffxRwIylLKNfInDPQ0o2S3DEaMBfWHH3lDja
 C9BAh6WGDSUIw==
Subject: Re: [PATCH 47/47] drm/i915/guc: Unblock GuC submission on Gen11+
To: Matthew Brost <matthew.brost@intel.com>
References: <20210624070516.21893-1-matthew.brost@intel.com>
 <20210624070516.21893-48-matthew.brost@intel.com>
 <88cbe963-7188-f4ae-5acf-01a80bd2fe25@free.fr>
 <20210630180052.GA8283@sdutt-i7>
From: Martin Peres <martin.peres@free.fr>
Message-ID: <7c3e1d46-74eb-6f2d-53ca-d73ce9e61c03@free.fr>
Date: Thu, 1 Jul 2021 21:24:55 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210630180052.GA8283@sdutt-i7>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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
Cc: intel-gfx@lists.freedesktop.org, daniele.ceraolospurio@intel.com,
 john.c.harrison@intel.com, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 30/06/2021 21:00, Matthew Brost wrote:
> On Wed, Jun 30, 2021 at 11:22:38AM +0300, Martin Peres wrote:
>>
>>
>> On 24/06/2021 10:05, Matthew Brost wrote:
>>> From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>>>
>>> Unblock GuC submission on Gen11+ platforms.
>>>
>>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>>> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>>> ---
>>>    drivers/gpu/drm/i915/gt/uc/intel_guc.h            |  1 +
>>>    drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c |  8 ++++++++
>>>    drivers/gpu/drm/i915/gt/uc/intel_guc_submission.h |  3 +--
>>>    drivers/gpu/drm/i915/gt/uc/intel_uc.c             | 14 +++++++++-----
>>>    4 files changed, 19 insertions(+), 7 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.h b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
>>> index fae01dc8e1b9..77981788204f 100644
>>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc.h
>>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
>>> @@ -54,6 +54,7 @@ struct intel_guc {
>>>    	struct ida guc_ids;
>>>    	struct list_head guc_id_list;
>>> +	bool submission_supported;
>>>    	bool submission_selected;
>>>    	struct i915_vma *ads_vma;
>>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>>> index a427336ce916..405339202280 100644
>>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>>> @@ -2042,6 +2042,13 @@ void intel_guc_submission_disable(struct intel_guc *guc)
>>>    	/* Note: By the time we're here, GuC may have already been reset */
>>>    }
>>> +static bool __guc_submission_supported(struct intel_guc *guc)
>>> +{
>>> +	/* GuC submission is unavailable for pre-Gen11 */
>>> +	return intel_guc_is_supported(guc) &&
>>> +	       INTEL_GEN(guc_to_gt(guc)->i915) >= 11;
>>> +}
>>> +
>>>    static bool __guc_submission_selected(struct intel_guc *guc)
>>>    {
>>>    	struct drm_i915_private *i915 = guc_to_gt(guc)->i915;
>>> @@ -2054,6 +2061,7 @@ static bool __guc_submission_selected(struct intel_guc *guc)
>>>    void intel_guc_submission_init_early(struct intel_guc *guc)
>>>    {
>>> +	guc->submission_supported = __guc_submission_supported(guc);
>>>    	guc->submission_selected = __guc_submission_selected(guc);
>>>    }
>>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.h
>>> index a2a3fad72be1..be767eb6ff71 100644
>>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.h
>>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.h
>>> @@ -37,8 +37,7 @@ int intel_guc_wait_for_pending_msg(struct intel_guc *guc,
>>>    static inline bool intel_guc_submission_is_supported(struct intel_guc *guc)
>>>    {
>>> -	/* XXX: GuC submission is unavailable for now */
>>> -	return false;
>>> +	return guc->submission_supported;
>>>    }
>>>    static inline bool intel_guc_submission_is_wanted(struct intel_guc *guc)
>>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc.c b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
>>> index 7a69c3c027e9..61be0aa81492 100644
>>> --- a/drivers/gpu/drm/i915/gt/uc/intel_uc.c
>>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
>>> @@ -34,8 +34,15 @@ static void uc_expand_default_options(struct intel_uc *uc)
>>>    		return;
>>>    	}
>>> -	/* Default: enable HuC authentication only */
>>> -	i915->params.enable_guc = ENABLE_GUC_LOAD_HUC;
>>> +	/* Intermediate platforms are HuC authentication only */
>>> +	if (IS_DG1(i915) || IS_ALDERLAKE_S(i915)) {
>>> +		drm_dbg(&i915->drm, "Disabling GuC only due to old platform\n");
>>
>> This comment does not seem accurate, given that DG1 is barely out, and ADL
>> is not out yet. How about:
>>
>> "Disabling GuC on untested platforms"?
> 
> This isn't my comment but it seems right to me. AFAIK this describes the
> current PR but it is subject to change (i.e. we may enable GuC on DG1 by
> default at some point).

Well, it's pretty bad PR to say that DG1 and ADL are old when they are 
not even out ;)

But seriously, fix this sentence, it makes no sense at all unless you 
are really trying to confuse non-native speakers (and annoy language 
purists too).

> 
>>
>>> +		i915->params.enable_guc = ENABLE_GUC_LOAD_HUC;
>>> +		return;
>>> +	}
>>> +
>>> +	/* Default: enable HuC authentication and GuC submission */
>>> +	i915->params.enable_guc = ENABLE_GUC_LOAD_HUC | ENABLE_GUC_SUBMISSION;
>>
>> This seems to be in contradiction with the GuC submission plan which states:
>>
>> "Not enabled by default on any current platforms but can be enabled via
>> modparam enable_guc".
>>
> 
> I don't believe any current platform gets this point where GuC
> submission would be enabled by default. The first would be ADL-P which
> isn't out yet.

Isn't that exactly what the line above does?

> 
>> When you rework the patch, could you please add a warning when the user
>> force-enables the GuC Command Submission? Something like:
>>
>> "WARNING: The user force-enabled the experimental GuC command submission
>> backend using i915.enable_guc. Please disable it if experiencing stability
>> issues. No bug reports will be accepted on this backend".
>>
>> This should allow you to work on the backend, while communicating clearly to
>> users that it is not ready just yet. Once it has matured, the warning can be
>> removed.
> 
> This is a good idea but the only issue I see this message blowing up CI.
> We plan to enable GuC submission, via a modparam, on several platforms
> (e.g. TGL) where TGL isn't the PR in CI. I think if is a debug level
> message CI should be happy but I'll double check on this.

Some taints would be problematic. The only issue you may have is the IGT 
reload tests which could give you a dmesg-warn if you were to use any 
level under level 5. So put is as an info message and you'll be good :)

In case of doubt, just ask Petri / Adrinael, he is your local IGT 
maintainer.

Martin

> 
> Matt
> 
>>
>> Cheers,
>> Martin
>>
>>>    }
>>>    /* Reset GuC providing us with fresh state for both GuC and HuC.
>>> @@ -313,9 +320,6 @@ static int __uc_init(struct intel_uc *uc)
>>>    	if (i915_inject_probe_failure(uc_to_gt(uc)->i915))
>>>    		return -ENOMEM;
>>> -	/* XXX: GuC submission is unavailable for now */
>>> -	GEM_BUG_ON(intel_uc_uses_guc_submission(uc));
>>> -
>>>    	ret = intel_guc_init(guc);
>>>    	if (ret)
>>>    		return ret;
>>>
