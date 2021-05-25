Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4972B38F77A
	for <lists+dri-devel@lfdr.de>; Tue, 25 May 2021 03:22:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 710176E5A9;
	Tue, 25 May 2021 01:22:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD1946E5A9;
 Tue, 25 May 2021 01:22:40 +0000 (UTC)
IronPort-SDR: mw0xrsq0TdUQ8f6D9VoX6ARBxkJl/+LDyXgb0jPQoWCBQFgdTLrPrNVlwu/B5glnYpFXidZZJz
 a58BwZ8FqjTg==
X-IronPort-AV: E=McAfee;i="6200,9189,9994"; a="263277985"
X-IronPort-AV: E=Sophos;i="5.82,327,1613462400"; d="scan'208";a="263277985"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2021 18:22:39 -0700
IronPort-SDR: eav7+8Mkcxwe1TRyY7dj7jOGrL6x+mJvcWh6FIW4gs090Zb5qKqbgGGsrkEpemyl1SV5tti92B
 z1U9L5c/lfwg==
X-IronPort-AV: E=Sophos;i="5.82,327,1613462400"; d="scan'208";a="413828106"
Received: from unknown (HELO sdutt-i7) ([10.165.21.147])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2021 18:22:39 -0700
Date: Mon, 24 May 2021 18:15:31 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [RFC PATCH 23/97] drm/i915/guc: Support per context scheduling
 policies
Message-ID: <20210525011531.GB25587@sdutt-i7>
References: <20210506191451.77768-1-matthew.brost@intel.com>
 <20210506191451.77768-24-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210506191451.77768-24-matthew.brost@intel.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Cc: tvrtko.ursulin@intel.com, daniele.ceraolospurio@intel.com,
 jason.ekstrand@intel.com, jon.bloomfield@intel.com, daniel.vetter@intel.com,
 john.c.harrison@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, May 06, 2021 at 12:13:37PM -0700, Matthew Brost wrote:
> From: John Harrison <John.C.Harrison@Intel.com>
> 
> GuC firmware v53.0.0 introduced per context scheduling policies. This
> includes changes to some of the ADS structures which are required to
> load the firmware even if not using GuC submission.
> 
> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c  | 26 +++--------------
>  drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h | 31 +++++----------------
>  2 files changed, 11 insertions(+), 46 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
> index 17526717368c..648e1767b17a 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
> @@ -58,30 +58,12 @@ static u32 guc_ads_blob_size(struct intel_guc *guc)
>  	       guc_ads_private_data_size(guc);
>  }
>  
> -static void guc_policy_init(struct guc_policy *policy)
> -{
> -	policy->execution_quantum = POLICY_DEFAULT_EXECUTION_QUANTUM_US;
> -	policy->preemption_time = POLICY_DEFAULT_PREEMPTION_TIME_US;
> -	policy->fault_time = POLICY_DEFAULT_FAULT_TIME_US;
> -	policy->policy_flags = 0;
> -}
> -
>  static void guc_policies_init(struct guc_policies *policies)
>  {
> -	struct guc_policy *policy;
> -	u32 p, i;
> -
> -	policies->dpc_promote_time = POLICY_DEFAULT_DPC_PROMOTE_TIME_US;
> -	policies->max_num_work_items = POLICY_MAX_NUM_WI;
> -
> -	for (p = 0; p < GUC_CLIENT_PRIORITY_NUM; p++) {
> -		for (i = 0; i < GUC_MAX_ENGINE_CLASSES; i++) {
> -			policy = &policies->policy[p][i];
> -
> -			guc_policy_init(policy);
> -		}
> -	}
> -
> +	policies->dpc_promote_time = GLOBAL_POLICY_DEFAULT_DPC_PROMOTE_TIME_US;
> +	policies->max_num_work_items = GLOBAL_POLICY_MAX_NUM_WI;
> +	/* Disable automatic resets as not yet supported. */
> +	policies->global_flags = GLOBAL_POLICY_DISABLE_ENGINE_RESET;
>  	policies->is_valid = 1;
>  }
>  
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
> index d445f6b77db4..95db4a7d3f4d 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
> @@ -221,32 +221,14 @@ struct guc_stage_desc {
>  
>  /* Scheduling policy settings */
>  
> -/* Reset engine upon preempt failure */
> -#define POLICY_RESET_ENGINE		(1<<0)
> -/* Preempt to idle on quantum expiry */
> -#define POLICY_PREEMPT_TO_IDLE		(1<<1)
> -
> -#define POLICY_MAX_NUM_WI 15
> -#define POLICY_DEFAULT_DPC_PROMOTE_TIME_US 500000
> -#define POLICY_DEFAULT_EXECUTION_QUANTUM_US 1000000
> -#define POLICY_DEFAULT_PREEMPTION_TIME_US 500000
> -#define POLICY_DEFAULT_FAULT_TIME_US 250000
> -
> -struct guc_policy {
> -	/* Time for one workload to execute. (in micro seconds) */
> -	u32 execution_quantum;
> -	/* Time to wait for a preemption request to completed before issuing a
> -	 * reset. (in micro seconds). */
> -	u32 preemption_time;
> -	/* How much time to allow to run after the first fault is observed.
> -	 * Then preempt afterwards. (in micro seconds) */
> -	u32 fault_time;
> -	u32 policy_flags;
> -	u32 reserved[8];
> -} __packed;
> +#define GLOBAL_POLICY_MAX_NUM_WI 15
> +
> +/* Don't reset an engine upon preemption failure */
> +#define GLOBAL_POLICY_DISABLE_ENGINE_RESET				BIT(0)
> +
> +#define GLOBAL_POLICY_DEFAULT_DPC_PROMOTE_TIME_US 500000
>  
>  struct guc_policies {
> -	struct guc_policy policy[GUC_CLIENT_PRIORITY_NUM][GUC_MAX_ENGINE_CLASSES];
>  	u32 submission_queue_depth[GUC_MAX_ENGINE_CLASSES];
>  	/* In micro seconds. How much time to allow before DPC processing is
>  	 * called back via interrupt (to prevent DPC queue drain starving).
> @@ -260,6 +242,7 @@ struct guc_policies {
>  	 * idle. */
>  	u32 max_num_work_items;
>  
> +	u32 global_flags;
>  	u32 reserved[4];
>  } __packed;
>  
> -- 
> 2.28.0
> 
