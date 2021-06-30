Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 631AA3B7EDD
	for <lists+dri-devel@lfdr.de>; Wed, 30 Jun 2021 10:22:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38E4C6E953;
	Wed, 30 Jun 2021 08:22:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4557B6E952;
 Wed, 30 Jun 2021 08:22:50 +0000 (UTC)
Received: from [192.168.1.190] (unknown [91.155.165.229])
 (Authenticated sender: martin.peres@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 5F1FB5FFBE;
 Wed, 30 Jun 2021 10:22:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1625041367;
 bh=jA6hqvTh0mJ3JLff3kODJRmYhu5OKmnccPwUabtn0/Y=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=bDahoKUIRGytstqokl1C1a3zab19LBNeRHCZ7bnhx1EOQ1Cx42unfxPbAg5wZXobC
 CTswImIkdDWTcu2ZPWY4fgpac9XNibDfkI4G0BeDhzIBP8yIPMSV6RYKdWDypZAuKP
 YgKeRR9qFXiWB2uYZ/2/Nw1D0WNAea/llYZSUWwwjKSuX+IaHTMMlkuIm8FSot7hTY
 KeF62dKAG+HXr3za/pPrV5JUGwOp4r3ijPl4Ts+5e6XqeRB3v3y6xhxBOX82k9BN5B
 /yhPZRps3uVL1gtVbCHMMleLCZXKQ4uF3q1RDXlYVr5jDsa6jTwwZbQdI9Hv/lc5Ai
 OghT/NLukAcNw==
Subject: Re: [PATCH 47/47] drm/i915/guc: Unblock GuC submission on Gen11+
To: Matthew Brost <matthew.brost@intel.com>, intel-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org
References: <20210624070516.21893-1-matthew.brost@intel.com>
 <20210624070516.21893-48-matthew.brost@intel.com>
From: Martin Peres <martin.peres@free.fr>
Message-ID: <88cbe963-7188-f4ae-5acf-01a80bd2fe25@free.fr>
Date: Wed, 30 Jun 2021 11:22:38 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210624070516.21893-48-matthew.brost@intel.com>
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
Cc: daniele.ceraolospurio@intel.com, john.c.harrison@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 24/06/2021 10:05, Matthew Brost wrote:
> From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> 
> Unblock GuC submission on Gen11+ platforms.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/i915/gt/uc/intel_guc.h            |  1 +
>   drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c |  8 ++++++++
>   drivers/gpu/drm/i915/gt/uc/intel_guc_submission.h |  3 +--
>   drivers/gpu/drm/i915/gt/uc/intel_uc.c             | 14 +++++++++-----
>   4 files changed, 19 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.h b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
> index fae01dc8e1b9..77981788204f 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc.h
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
> @@ -54,6 +54,7 @@ struct intel_guc {
>   	struct ida guc_ids;
>   	struct list_head guc_id_list;
>   
> +	bool submission_supported;
>   	bool submission_selected;
>   
>   	struct i915_vma *ads_vma;
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> index a427336ce916..405339202280 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> @@ -2042,6 +2042,13 @@ void intel_guc_submission_disable(struct intel_guc *guc)
>   	/* Note: By the time we're here, GuC may have already been reset */
>   }
>   
> +static bool __guc_submission_supported(struct intel_guc *guc)
> +{
> +	/* GuC submission is unavailable for pre-Gen11 */
> +	return intel_guc_is_supported(guc) &&
> +	       INTEL_GEN(guc_to_gt(guc)->i915) >= 11;
> +}
> +
>   static bool __guc_submission_selected(struct intel_guc *guc)
>   {
>   	struct drm_i915_private *i915 = guc_to_gt(guc)->i915;
> @@ -2054,6 +2061,7 @@ static bool __guc_submission_selected(struct intel_guc *guc)
>   
>   void intel_guc_submission_init_early(struct intel_guc *guc)
>   {
> +	guc->submission_supported = __guc_submission_supported(guc);
>   	guc->submission_selected = __guc_submission_selected(guc);
>   }
>   
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.h
> index a2a3fad72be1..be767eb6ff71 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.h
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.h
> @@ -37,8 +37,7 @@ int intel_guc_wait_for_pending_msg(struct intel_guc *guc,
>   
>   static inline bool intel_guc_submission_is_supported(struct intel_guc *guc)
>   {
> -	/* XXX: GuC submission is unavailable for now */
> -	return false;
> +	return guc->submission_supported;
>   }
>   
>   static inline bool intel_guc_submission_is_wanted(struct intel_guc *guc)
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc.c b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
> index 7a69c3c027e9..61be0aa81492 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_uc.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
> @@ -34,8 +34,15 @@ static void uc_expand_default_options(struct intel_uc *uc)
>   		return;
>   	}
>   
> -	/* Default: enable HuC authentication only */
> -	i915->params.enable_guc = ENABLE_GUC_LOAD_HUC;
> +	/* Intermediate platforms are HuC authentication only */
> +	if (IS_DG1(i915) || IS_ALDERLAKE_S(i915)) {
> +		drm_dbg(&i915->drm, "Disabling GuC only due to old platform\n");

This comment does not seem accurate, given that DG1 is barely out, and 
ADL is not out yet. How about:

"Disabling GuC on untested platforms"?

> +		i915->params.enable_guc = ENABLE_GUC_LOAD_HUC;
> +		return;
> +	}
> +
> +	/* Default: enable HuC authentication and GuC submission */
> +	i915->params.enable_guc = ENABLE_GUC_LOAD_HUC | ENABLE_GUC_SUBMISSION;

This seems to be in contradiction with the GuC submission plan which 
states:

"Not enabled by default on any current platforms but can be enabled via 
modparam enable_guc".

When you rework the patch, could you please add a warning when the user 
force-enables the GuC Command Submission? Something like:

"WARNING: The user force-enabled the experimental GuC command submission 
backend using i915.enable_guc. Please disable it if experiencing 
stability issues. No bug reports will be accepted on this backend".

This should allow you to work on the backend, while communicating 
clearly to users that it is not ready just yet. Once it has matured, the 
warning can be removed.

Cheers,
Martin

>   }
>   
>   /* Reset GuC providing us with fresh state for both GuC and HuC.
> @@ -313,9 +320,6 @@ static int __uc_init(struct intel_uc *uc)
>   	if (i915_inject_probe_failure(uc_to_gt(uc)->i915))
>   		return -ENOMEM;
>   
> -	/* XXX: GuC submission is unavailable for now */
> -	GEM_BUG_ON(intel_uc_uses_guc_submission(uc));
> -
>   	ret = intel_guc_init(guc);
>   	if (ret)
>   		return ret;
> 
