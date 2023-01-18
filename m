Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9957F672387
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jan 2023 17:38:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48A2D10E798;
	Wed, 18 Jan 2023 16:38:04 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FE2810E798;
 Wed, 18 Jan 2023 16:38:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674059882; x=1705595882;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=0C1PH4N/7d1TvUAsztWL6FzEq1GatZcLQaTS24AhdsE=;
 b=HAiS5xNNGX8sXkj/Uy+h9i65xIQPOYtB1CRGJyskh4CEID8PmLY5Dm+j
 Ueo6CAUE8bg+3dbYLQapbuI2l3tzHJLNnE+43MxtUXRVVu9VxKrFfPxnR
 bCx3XVh3z9sa4chGcNlYt/zN6xuUo6fb4iT9vd6zdX5MdIGRX7A7banZm
 G1BICG5Vl+3yikBrhWWUWS69RYyXcy/wxiAN75wMkuo9lrh7FZ5K0zdIN
 g7h3SaJb+Y8Z6+Lr2xEmaqz9sR7AGUhg5Nxlu3eLTb2EVKv6uUmpiAuT1
 jMKsoFzdUbkUPvU+CJoH9D16Ng6aoj+33xQpvCXd2x6od8r381T/k2j8p Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="326292151"
X-IronPort-AV: E=Sophos;i="5.97,226,1669104000"; d="scan'208";a="326292151"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2023 08:38:02 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="637351243"
X-IronPort-AV: E=Sophos;i="5.97,226,1669104000"; d="scan'208";a="637351243"
Received: from llvincen-mobl.ger.corp.intel.com (HELO [10.213.215.37])
 ([10.213.215.37])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2023 08:37:59 -0800
Message-ID: <b3653882-6bb9-86d8-4b49-d2ca18aa8831@linux.intel.com>
Date: Wed, 18 Jan 2023 16:37:59 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [Intel-gfx] [PATCH v2 4/5] drm/i915/guc: Look for a guilty
 context when an engine reset fails
Content-Language: en-US
To: John.C.Harrison@Intel.com, Intel-GFX@Lists.FreeDesktop.Org
References: <20230117213630.2897570-1-John.C.Harrison@Intel.com>
 <20230117213630.2897570-5-John.C.Harrison@Intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <20230117213630.2897570-5-John.C.Harrison@Intel.com>
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


On 17/01/2023 21:36, John.C.Harrison@Intel.com wrote:
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
> v2: Change comment to be less alarming (Tvrtko)
> 
> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
> ---
>   .../gpu/drm/i915/gt/uc/intel_guc_submission.c   | 17 +++++++++++++++--
>   1 file changed, 15 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> index 3b34a82d692be..9bc80b807dbcc 100644
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
> +		 * Note that it should be reliable to do this here because the GuC is
> +		 * toast and will not be scheduling behind the KMD's back.
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

Assuming 1/5 gets blessed by GuC experts this would then look safe to:

Acked-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Regards,

Tvrtko
