Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 24A693B79BB
	for <lists+dri-devel@lfdr.de>; Tue, 29 Jun 2021 23:11:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11E516E8FA;
	Tue, 29 Jun 2021 21:11:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D752A89F89;
 Tue, 29 Jun 2021 21:11:01 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10030"; a="229873583"
X-IronPort-AV: E=Sophos;i="5.83,310,1616482800"; d="scan'208";a="229873583"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jun 2021 14:11:01 -0700
X-IronPort-AV: E=Sophos;i="5.83,310,1616482800"; d="scan'208";a="419744445"
Received: from johnharr-mobl1.amr.corp.intel.com (HELO [10.209.46.34])
 ([10.209.46.34])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jun 2021 14:11:01 -0700
Subject: Re: [PATCH 08/47] drm/i915/guc: Add new GuC interface defines and
 structures
To: Matthew Brost <matthew.brost@intel.com>, intel-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org
References: <20210624070516.21893-1-matthew.brost@intel.com>
 <20210624070516.21893-9-matthew.brost@intel.com>
From: John Harrison <john.c.harrison@intel.com>
Message-ID: <bc330e06-9bb9-24c8-da30-583bdcbbe80c@intel.com>
Date: Tue, 29 Jun 2021 14:11:00 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210624070516.21893-9-matthew.brost@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
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

On 6/24/2021 00:04, Matthew Brost wrote:
> Add new GuC interface defines and structures while maintaining old ones
> in parallel.
>
> Cc: John Harrison <john.c.harrison@intel.com>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
I think there was some difference of opinion over whether these 
additions should be squashed in to the specific patches that first use 
them. However, on the grounds that such is basically a patch-only style 
comment and doesn't change the final product plus, we need to get this 
stuff merged efficiently and not spend forever rebasing and refactoring...

Reviewed-by: John Harrison <John.C.Harrison@Intel.com>


> ---
>   .../gpu/drm/i915/gt/uc/abi/guc_actions_abi.h  | 14 +++++++
>   drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h   | 41 +++++++++++++++++++
>   2 files changed, 55 insertions(+)
>
> diff --git a/drivers/gpu/drm/i915/gt/uc/abi/guc_actions_abi.h b/drivers/gpu/drm/i915/gt/uc/abi/guc_actions_abi.h
> index 2d6198e63ebe..57e18babdf4b 100644
> --- a/drivers/gpu/drm/i915/gt/uc/abi/guc_actions_abi.h
> +++ b/drivers/gpu/drm/i915/gt/uc/abi/guc_actions_abi.h
> @@ -124,10 +124,24 @@ enum intel_guc_action {
>   	INTEL_GUC_ACTION_FORCE_LOG_BUFFER_FLUSH = 0x302,
>   	INTEL_GUC_ACTION_ENTER_S_STATE = 0x501,
>   	INTEL_GUC_ACTION_EXIT_S_STATE = 0x502,
> +	INTEL_GUC_ACTION_GLOBAL_SCHED_POLICY_CHANGE = 0x506,
> +	INTEL_GUC_ACTION_SCHED_CONTEXT = 0x1000,
> +	INTEL_GUC_ACTION_SCHED_CONTEXT_MODE_SET = 0x1001,
> +	INTEL_GUC_ACTION_SCHED_CONTEXT_MODE_DONE = 0x1002,
> +	INTEL_GUC_ACTION_SCHED_ENGINE_MODE_SET = 0x1003,
> +	INTEL_GUC_ACTION_SCHED_ENGINE_MODE_DONE = 0x1004,
> +	INTEL_GUC_ACTION_SET_CONTEXT_PRIORITY = 0x1005,
> +	INTEL_GUC_ACTION_SET_CONTEXT_EXECUTION_QUANTUM = 0x1006,
> +	INTEL_GUC_ACTION_SET_CONTEXT_PREEMPTION_TIMEOUT = 0x1007,
> +	INTEL_GUC_ACTION_CONTEXT_RESET_NOTIFICATION = 0x1008,
> +	INTEL_GUC_ACTION_ENGINE_FAILURE_NOTIFICATION = 0x1009,
>   	INTEL_GUC_ACTION_SLPC_REQUEST = 0x3003,
>   	INTEL_GUC_ACTION_AUTHENTICATE_HUC = 0x4000,
> +	INTEL_GUC_ACTION_REGISTER_CONTEXT = 0x4502,
> +	INTEL_GUC_ACTION_DEREGISTER_CONTEXT = 0x4503,
>   	INTEL_GUC_ACTION_REGISTER_COMMAND_TRANSPORT_BUFFER = 0x4505,
>   	INTEL_GUC_ACTION_DEREGISTER_COMMAND_TRANSPORT_BUFFER = 0x4506,
> +	INTEL_GUC_ACTION_DEREGISTER_CONTEXT_DONE = 0x4600,
>   	INTEL_GUC_ACTION_LIMIT
>   };
>   
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
> index 617ec601648d..28245a217a39 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
> @@ -17,6 +17,9 @@
>   #include "abi/guc_communication_ctb_abi.h"
>   #include "abi/guc_messages_abi.h"
>   
> +#define GUC_CONTEXT_DISABLE		0
> +#define GUC_CONTEXT_ENABLE		1
> +
>   #define GUC_CLIENT_PRIORITY_KMD_HIGH	0
>   #define GUC_CLIENT_PRIORITY_HIGH	1
>   #define GUC_CLIENT_PRIORITY_KMD_NORMAL	2
> @@ -26,6 +29,9 @@
>   #define GUC_MAX_STAGE_DESCRIPTORS	1024
>   #define	GUC_INVALID_STAGE_ID		GUC_MAX_STAGE_DESCRIPTORS
>   
> +#define GUC_MAX_LRC_DESCRIPTORS		65535
> +#define	GUC_INVALID_LRC_ID		GUC_MAX_LRC_DESCRIPTORS
> +
>   #define GUC_RENDER_ENGINE		0
>   #define GUC_VIDEO_ENGINE		1
>   #define GUC_BLITTER_ENGINE		2
> @@ -237,6 +243,41 @@ struct guc_stage_desc {
>   	u64 desc_private;
>   } __packed;
>   
> +#define CONTEXT_REGISTRATION_FLAG_KMD	BIT(0)
> +
> +#define CONTEXT_POLICY_DEFAULT_EXECUTION_QUANTUM_US 1000000
> +#define CONTEXT_POLICY_DEFAULT_PREEMPTION_TIME_US 500000
> +
> +/* Preempt to idle on quantum expiry */
> +#define CONTEXT_POLICY_FLAG_PREEMPT_TO_IDLE	BIT(0)
> +
> +/*
> + * GuC Context registration descriptor.
> + * FIXME: This is only required to exist during context registration.
> + * The current 1:1 between guc_lrc_desc and LRCs for the lifetime of the LRC
> + * is not required.
> + */
> +struct guc_lrc_desc {
> +	u32 hw_context_desc;
> +	u32 slpm_perf_mode_hint;	/* SPLC v1 only */
> +	u32 slpm_freq_hint;
> +	u32 engine_submit_mask;		/* In logical space */
> +	u8 engine_class;
> +	u8 reserved0[3];
> +	u32 priority;
> +	u32 process_desc;
> +	u32 wq_addr;
> +	u32 wq_size;
> +	u32 context_flags;		/* CONTEXT_REGISTRATION_* */
> +	/* Time for one workload to execute. (in micro seconds) */
> +	u32 execution_quantum;
> +	/* Time to wait for a preemption request to complete before issuing a
> +	 * reset. (in micro seconds). */
> +	u32 preemption_timeout;
> +	u32 policy_flags;		/* CONTEXT_POLICY_* */
> +	u32 reserved1[19];
> +} __packed;
> +
>   #define GUC_POWER_UNSPECIFIED	0
>   #define GUC_POWER_D0		1
>   #define GUC_POWER_D1		2

