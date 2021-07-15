Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AC793C9540
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jul 2021 02:49:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7D6C6E440;
	Thu, 15 Jul 2021 00:49:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFCB26E440;
 Thu, 15 Jul 2021 00:49:54 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10045"; a="190826181"
X-IronPort-AV: E=Sophos;i="5.84,240,1620716400"; d="scan'208";a="190826181"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2021 17:49:54 -0700
X-IronPort-AV: E=Sophos;i="5.84,240,1620716400"; d="scan'208";a="651440154"
Received: from dut031-tgly.fm.intel.com ([10.105.19.16])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2021 17:49:54 -0700
Date: Thu, 15 Jul 2021 00:49:53 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [Intel-gfx] [PATCH 47/47] drm/i915/guc: Unblock GuC submission
 on Gen11+
Message-ID: <20210715004953.GA18129@DUT031-TGLY.fm.intel.com>
References: <20210624070516.21893-1-matthew.brost@intel.com>
 <20210624070516.21893-48-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210624070516.21893-48-matthew.brost@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jun 24, 2021 at 12:05:16AM -0700, Matthew Brost wrote:
> From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> 
> Unblock GuC submission on Gen11+ platforms.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>

Updating debug message per feedback, with that:
Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/i915/gt/uc/intel_guc.h            |  1 +
>  drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c |  8 ++++++++
>  drivers/gpu/drm/i915/gt/uc/intel_guc_submission.h |  3 +--
>  drivers/gpu/drm/i915/gt/uc/intel_uc.c             | 14 +++++++++-----
>  4 files changed, 19 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.h b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
> index fae01dc8e1b9..77981788204f 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc.h
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
> @@ -54,6 +54,7 @@ struct intel_guc {
>  	struct ida guc_ids;
>  	struct list_head guc_id_list;
>  
> +	bool submission_supported;
>  	bool submission_selected;
>  
>  	struct i915_vma *ads_vma;
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> index a427336ce916..405339202280 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> @@ -2042,6 +2042,13 @@ void intel_guc_submission_disable(struct intel_guc *guc)
>  	/* Note: By the time we're here, GuC may have already been reset */
>  }
>  
> +static bool __guc_submission_supported(struct intel_guc *guc)
> +{
> +	/* GuC submission is unavailable for pre-Gen11 */
> +	return intel_guc_is_supported(guc) &&
> +	       INTEL_GEN(guc_to_gt(guc)->i915) >= 11;
> +}
> +
>  static bool __guc_submission_selected(struct intel_guc *guc)
>  {
>  	struct drm_i915_private *i915 = guc_to_gt(guc)->i915;
> @@ -2054,6 +2061,7 @@ static bool __guc_submission_selected(struct intel_guc *guc)
>  
>  void intel_guc_submission_init_early(struct intel_guc *guc)
>  {
> +	guc->submission_supported = __guc_submission_supported(guc);
>  	guc->submission_selected = __guc_submission_selected(guc);
>  }
>  
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.h
> index a2a3fad72be1..be767eb6ff71 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.h
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.h
> @@ -37,8 +37,7 @@ int intel_guc_wait_for_pending_msg(struct intel_guc *guc,
>  
>  static inline bool intel_guc_submission_is_supported(struct intel_guc *guc)
>  {
> -	/* XXX: GuC submission is unavailable for now */
> -	return false;
> +	return guc->submission_supported;
>  }
>  
>  static inline bool intel_guc_submission_is_wanted(struct intel_guc *guc)
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc.c b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
> index 7a69c3c027e9..61be0aa81492 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_uc.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
> @@ -34,8 +34,15 @@ static void uc_expand_default_options(struct intel_uc *uc)
>  		return;
>  	}
>  
> -	/* Default: enable HuC authentication only */
> -	i915->params.enable_guc = ENABLE_GUC_LOAD_HUC;
> +	/* Intermediate platforms are HuC authentication only */
> +	if (IS_DG1(i915) || IS_ALDERLAKE_S(i915)) {
> +		drm_dbg(&i915->drm, "Disabling GuC only due to old platform\n");
> +		i915->params.enable_guc = ENABLE_GUC_LOAD_HUC;
> +		return;
> +	}
> +
> +	/* Default: enable HuC authentication and GuC submission */
> +	i915->params.enable_guc = ENABLE_GUC_LOAD_HUC | ENABLE_GUC_SUBMISSION;
>  }
>  
>  /* Reset GuC providing us with fresh state for both GuC and HuC.
> @@ -313,9 +320,6 @@ static int __uc_init(struct intel_uc *uc)
>  	if (i915_inject_probe_failure(uc_to_gt(uc)->i915))
>  		return -ENOMEM;
>  
> -	/* XXX: GuC submission is unavailable for now */
> -	GEM_BUG_ON(intel_uc_uses_guc_submission(uc));
> -
>  	ret = intel_guc_init(guc);
>  	if (ret)
>  		return ret;
> -- 
> 2.28.0
> 
> _______________________________________________
> Intel-gfx mailing list
> Intel-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gfx
