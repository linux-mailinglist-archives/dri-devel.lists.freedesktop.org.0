Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B051A666F38
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jan 2023 11:15:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2EE510E8C9;
	Thu, 12 Jan 2023 10:15:19 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5C6E10E8C9;
 Thu, 12 Jan 2023 10:15:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1673518518; x=1705054518;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=zfpW3+IBOl78Hp7sfA9wcTJTkNaFEa6G9yY0C59z/L0=;
 b=QnH5LmnrcHuTIlyCVUS2O9l+/yhhhQsvIRvYPtVTg3ZKh4v0KyJSjScY
 fRiEA+oypYiJDhH3AOcg9vm+4OhmOAieKQgc7Kr9tvsBsvmEBNXnMy9Z7
 y/fQdAhXU8y7TW07DQFStMi33zYPgAAAKmH6n+jSf+gIe/3AwgOrx4d5t
 UAWRiW6Rbn7hCSPlDQqsuXsfFoMNsoW38R7I5cVZbXkov10SbZdwyQ9yA
 e+YQKwSZT2JgbJqlWdjhlvuvaQppG8+SKPVyYQJLttRuVMF2dUw9hx294
 LS14OSiEmFLxLcl4K3JZurnI4ovTg5sebyL+Fj9RHFnBCI9k8AcpWDOV5 g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10586"; a="323724883"
X-IronPort-AV: E=Sophos;i="5.96,319,1665471600"; d="scan'208";a="323724883"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2023 02:15:17 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10586"; a="690070535"
X-IronPort-AV: E=Sophos;i="5.96,319,1665471600"; d="scan'208";a="690070535"
Received: from jacton-mobl.ger.corp.intel.com (HELO [10.213.195.171])
 ([10.213.195.171])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2023 02:15:15 -0800
Message-ID: <393edad8-fa78-4b28-46ac-86da56d03de0@linux.intel.com>
Date: Thu, 12 Jan 2023 10:15:12 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [Intel-gfx] [PATCH 3/4] drm/i915/guc: Look for a guilty context
 when an engine reset fails
Content-Language: en-US
To: John.C.Harrison@Intel.com, Intel-GFX@Lists.FreeDesktop.Org
References: <20230112025311.2577084-1-John.C.Harrison@Intel.com>
 <20230112025311.2577084-4-John.C.Harrison@Intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <20230112025311.2577084-4-John.C.Harrison@Intel.com>
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


On 12/01/2023 02:53, John.C.Harrison@Intel.com wrote:
> From: John Harrison <John.C.Harrison@Intel.com>
> 
> Engine resets are supposed to never fail. But in the case when one
> does (due to unknown reasons that normally come down to a missing
> w/a), it is useful to get as much information out of the system as
> possible. Given that the GuC effectively dies on such a situation, it
> is not possible to get a guilty context notification back. So do a
> manual search instead. Given that GuC is dead, this is safe because
> GuC won't be changing the engine state asynchronously.
> 
> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
> ---
>   .../gpu/drm/i915/gt/uc/intel_guc_submission.c   | 17 +++++++++++++++--
>   1 file changed, 15 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> index b436dd7f12e42..99d09e3394597 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> @@ -4754,11 +4754,24 @@ static void reset_fail_worker_func(struct work_struct *w)
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
> -				      "GuC failed to reset engine mask=0x%x\n",
> +				      "GuC failed to reset engine mask=0x%x",
>   				      reset_fail_mask);
> +	}
>   }
>   
>   int intel_guc_engine_failure_process_msg(struct intel_guc *guc,

This one I don't feel "at home" enough to r-b. Just a question - can we 
be sure at this point that GuC is 100% stuck and there isn't a chance it 
somehow comes alive and starts running in parallel (being driven in 
parallel by a different "thread" in i915), interfering with the 
assumption made in the comment?

Regards,

Tvrtko
