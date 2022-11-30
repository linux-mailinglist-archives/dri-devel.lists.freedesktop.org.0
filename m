Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 77A5663D0A3
	for <lists+dri-devel@lfdr.de>; Wed, 30 Nov 2022 09:30:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C4C010E04A;
	Wed, 30 Nov 2022 08:30:23 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64C3589DFF;
 Wed, 30 Nov 2022 08:30:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1669797020; x=1701333020;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=FgwvNs9IxTLjKqRckJCScAIPHNKsebQaEETDyrIIwjA=;
 b=KrPi5ErAFv54hTiEI7j26h62N3ouP3iCuglQCRmIhFYqjbyUDx/9wf5V
 ZL+SJVjcssWe5qmCMBaksP8zr7tQ9QmoJyo0e6fqvpIBj9KLkJMD7EOdX
 Z/eJ084M0geiHNISuRx7/X2hr56oRhccd3+NIzw+TSc/xR1cvIlSZM3r5
 562GXAXK3AeeDdVzhmeG29a3YbS5tzzVGMEK7UqoKH2A3B4L3oMUTRNwi
 21yTDOs/7eIP1MzeeUQVWj4gd6UHpotjSmfV8Ctbit0jXJ5EEDbxyOml+
 lc9LaF2WZ2AAUwwxxbhhxUpmkPXwX6SPtRSVMEIS+5E3isM/6r+ku7hOW A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10546"; a="312956455"
X-IronPort-AV: E=Sophos;i="5.96,205,1665471600"; d="scan'208";a="312956455"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2022 00:30:19 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10546"; a="646244481"
X-IronPort-AV: E=Sophos;i="5.96,205,1665471600"; d="scan'208";a="646244481"
Received: from hpvpnmu01.ger.corp.intel.com (HELO [10.213.197.198])
 ([10.213.197.198])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2022 00:30:18 -0800
Message-ID: <17ba580d-556b-c963-703c-b80e74c050f9@linux.intel.com>
Date: Wed, 30 Nov 2022 08:30:16 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [Intel-gfx] [PATCH 2/2] drm/i915/guc: Look for a guilty context
 when an engine reset fails
Content-Language: en-US
To: John.C.Harrison@Intel.com, Intel-GFX@Lists.FreeDesktop.Org
References: <20221129211253.3183480-1-John.C.Harrison@Intel.com>
 <20221129211253.3183480-3-John.C.Harrison@Intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <20221129211253.3183480-3-John.C.Harrison@Intel.com>
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


On 29/11/2022 21:12, John.C.Harrison@Intel.com wrote:
> From: John Harrison <John.C.Harrison@Intel.com>
> 
> Engine resets are supposed to never happen. But in the case when one

Engine resets or engine reset failures? Hopefully the latter.

> does (due to unknwon reasons that normally come down to a missing
> w/a), it is useful to get as much information out of the system as
> possible. Given that the GuC effectively dies on such a situation, it
> is not possible to get a guilty context notification back. So do a
> manual search instead. Given that GuC is dead, this is safe because
> GuC won't be changing the engine state asynchronously.
> 
> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
> ---
>   drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c | 15 ++++++++++++++-
>   1 file changed, 14 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> index 0a42f1807f52c..c82730804a1c4 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> @@ -4751,11 +4751,24 @@ static void reset_fail_worker_func(struct work_struct *w)
>   	guc->submission_state.reset_fail_mask = 0;
>   	spin_unlock_irqrestore(&guc->submission_state.lock, flags);
>   
> -	if (likely(reset_fail_mask))
> +	if (likely(reset_fail_mask)) {
> +		struct intel_engine_cs *engine;
> +		enum intel_engine_id id;
> +
> +		/*
> +		 * GuC is toast at this point - it dead loops after sending the failed
> +		 * reset notification. So need to manually determine the guilty context.
> +		 * Note that it should be safe/reliable to do this here because the GuC
> +		 * is toast and will not be scheduling behind the KMD's back.
> +		 */
> +		for_each_engine_masked(engine, gt, reset_fail_mask, id)
> +			intel_guc_find_hung_context(engine);
> +
>   		intel_gt_handle_error(gt, reset_fail_mask,
>   				      I915_ERROR_CAPTURE,
>   				      "GuC failed to reset engine mask=0x%x\n",
>   				      reset_fail_mask);

If GuC is defined by ABI contract to be dead, should the flow be 
attempting to do a full GPU reset here, or maybe it happens somewhere 
else as a consequence anyway? (In which case is the engine reset here 
even needed?)

Regards,

Tvrtko

> +	}
>   }
>   
>   int intel_guc_engine_failure_process_msg(struct intel_guc *guc,
