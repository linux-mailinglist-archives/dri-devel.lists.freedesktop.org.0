Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CDA193D79EF
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jul 2021 17:37:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 820F06E943;
	Tue, 27 Jul 2021 15:37:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAF9E6E93C;
 Tue, 27 Jul 2021 15:37:50 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10057"; a="209357404"
X-IronPort-AV: E=Sophos;i="5.84,274,1620716400"; d="scan'208";a="209357404"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2021 08:37:22 -0700
X-IronPort-AV: E=Sophos;i="5.84,274,1620716400"; d="scan'208";a="417449137"
Received: from mdroper-desk1.fm.intel.com (HELO
 mdroper-desk1.amr.corp.intel.com) ([10.1.27.134])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2021 08:37:20 -0700
Date: Tue, 27 Jul 2021 08:37:18 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Subject: Re: [PATCH 15/15] drm/i915/guc/rc: Setup and enable GUCRC feature
Message-ID: <20210727153718.GY1556418@mdroper-desk1.amr.corp.intel.com>
References: <20210726190800.26762-1-vinay.belgaumkar@intel.com>
 <20210726190800.26762-16-vinay.belgaumkar@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210726190800.26762-16-vinay.belgaumkar@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jul 26, 2021 at 12:08:00PM -0700, Vinay Belgaumkar wrote:
> This feature hands over the control of HW RC6 to the GuC.
> GuC decides when to put HW into RC6 based on it's internal
> busyness algorithms.
> 
> GUCRC needs GuC submission to be enabled, and only
> supported on Gen12+ for now.
> 
> When GUCRC is enabled, do not set HW RC6. Use a H2G message
> to tell GuC to enable GUCRC. When disabling RC6, tell GuC to
> revert RC6 control back to KMD.
> 
> v2: Address comments (Michal W)
> 
> Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> ---
>  drivers/gpu/drm/i915/Makefile                 |  1 +
>  drivers/gpu/drm/i915/gt/intel_rc6.c           | 22 +++--
>  .../gpu/drm/i915/gt/uc/abi/guc_actions_abi.h  |  6 ++
>  drivers/gpu/drm/i915/gt/uc/intel_guc.c        |  1 +
>  drivers/gpu/drm/i915/gt/uc/intel_guc.h        |  2 +
>  drivers/gpu/drm/i915/gt/uc/intel_guc_rc.c     | 80 +++++++++++++++++++
>  drivers/gpu/drm/i915/gt/uc/intel_guc_rc.h     | 31 +++++++
>  drivers/gpu/drm/i915/gt/uc/intel_uc.h         |  2 +
>  8 files changed, 140 insertions(+), 5 deletions(-)
>  create mode 100644 drivers/gpu/drm/i915/gt/uc/intel_guc_rc.c
>  create mode 100644 drivers/gpu/drm/i915/gt/uc/intel_guc_rc.h
> 
> diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
> index d8eac4468df9..3fc17f20d88e 100644
> --- a/drivers/gpu/drm/i915/Makefile
> +++ b/drivers/gpu/drm/i915/Makefile
> @@ -186,6 +186,7 @@ i915-y += gt/uc/intel_uc.o \
>  	  gt/uc/intel_guc_fw.o \
>  	  gt/uc/intel_guc_log.o \
>  	  gt/uc/intel_guc_log_debugfs.o \
> +	  gt/uc/intel_guc_rc.o \
>  	  gt/uc/intel_guc_slpc.o \
>  	  gt/uc/intel_guc_submission.o \
>  	  gt/uc/intel_huc.o \
> diff --git a/drivers/gpu/drm/i915/gt/intel_rc6.c b/drivers/gpu/drm/i915/gt/intel_rc6.c
> index 259d7eb4e165..299fcf10b04b 100644
> --- a/drivers/gpu/drm/i915/gt/intel_rc6.c
> +++ b/drivers/gpu/drm/i915/gt/intel_rc6.c
> @@ -98,11 +98,19 @@ static void gen11_rc6_enable(struct intel_rc6 *rc6)
>  	set(uncore, GEN9_MEDIA_PG_IDLE_HYSTERESIS, 60);
>  	set(uncore, GEN9_RENDER_PG_IDLE_HYSTERESIS, 60);

Do steps 2b and 2c above this still apply to gucrc?  Are those still
controlling the behavior of gucrc or does the GuC firmware just
overwrite them with its own values?  If they're still impacting the
behavior when gucrc is enabled, is there any updated guidance on how the
values should be set?  It seems that there isn't any guidance in the
bspec for the last several platforms, so we've pretty much been re-using
old values without knowing if there's additional adjustment that should
be done for the newer platforms.

If the tuning values the driver sets get ignored/overwritten during GuC
operation, maybe we should add a new gucrc_rc6_enable() that gets used
instead of gen11_rc6_enable() and drops the unnecessary steps to help
clarify what's truly important?


>  
> -	/* 3a: Enable RC6 */
> -	rc6->ctl_enable =
> -		GEN6_RC_CTL_HW_ENABLE |
> -		GEN6_RC_CTL_RC6_ENABLE |
> -		GEN6_RC_CTL_EI_MODE(1);
> +	/* 3a: Enable RC6
> +	 *
> +	 * With GUCRC, we do not enable bit 31 of RC_CTL,
> +	 * thus allowing GuC to control RC6 entry/exit fully instead.
> +	 * We will not set the HW ENABLE and EI bits
> +	 */
> +	if (!intel_guc_rc_enable(&gt->uc.guc))
> +		rc6->ctl_enable = GEN6_RC_CTL_RC6_ENABLE;
> +	else
> +		rc6->ctl_enable =
> +			GEN6_RC_CTL_HW_ENABLE |
> +			GEN6_RC_CTL_RC6_ENABLE |
> +			GEN6_RC_CTL_EI_MODE(1);
>  
>  	pg_enable =
>  		GEN9_RENDER_PG_ENABLE |

We should probably clarify in the commit message that gucrc doesn't
cover powergating and leaves that under driver control.  Maybe we should
even pull this out into its own function rather than leaving it in the
"rc6 enable" function since it really is its own thing?


Matt

> @@ -513,6 +521,10 @@ static void __intel_rc6_disable(struct intel_rc6 *rc6)
>  {
>  	struct drm_i915_private *i915 = rc6_to_i915(rc6);
>  	struct intel_uncore *uncore = rc6_to_uncore(rc6);
> +	struct intel_gt *gt = rc6_to_gt(rc6);
> +
> +	/* Take control of RC6 back from GuC */
> +	intel_guc_rc_disable(&gt->uc.guc);
>  
>  	intel_uncore_forcewake_get(uncore, FORCEWAKE_ALL);
>  	if (GRAPHICS_VER(i915) >= 9)
> diff --git a/drivers/gpu/drm/i915/gt/uc/abi/guc_actions_abi.h b/drivers/gpu/drm/i915/gt/uc/abi/guc_actions_abi.h
> index ca538e5de940..8ff582222aff 100644
> --- a/drivers/gpu/drm/i915/gt/uc/abi/guc_actions_abi.h
> +++ b/drivers/gpu/drm/i915/gt/uc/abi/guc_actions_abi.h
> @@ -135,6 +135,7 @@ enum intel_guc_action {
>  	INTEL_GUC_ACTION_SET_CONTEXT_PREEMPTION_TIMEOUT = 0x1007,
>  	INTEL_GUC_ACTION_CONTEXT_RESET_NOTIFICATION = 0x1008,
>  	INTEL_GUC_ACTION_ENGINE_FAILURE_NOTIFICATION = 0x1009,
> +	INTEL_GUC_ACTION_SETUP_PC_GUCRC = 0x3004,
>  	INTEL_GUC_ACTION_AUTHENTICATE_HUC = 0x4000,
>  	INTEL_GUC_ACTION_REGISTER_CONTEXT = 0x4502,
>  	INTEL_GUC_ACTION_DEREGISTER_CONTEXT = 0x4503,
> @@ -145,6 +146,11 @@ enum intel_guc_action {
>  	INTEL_GUC_ACTION_LIMIT
>  };
>  
> +enum intel_guc_rc_options {
> +	INTEL_GUCRC_HOST_CONTROL,
> +	INTEL_GUCRC_FIRMWARE_CONTROL,
> +};
> +
>  enum intel_guc_preempt_options {
>  	INTEL_GUC_PREEMPT_OPTION_DROP_WORK_Q = 0x4,
>  	INTEL_GUC_PREEMPT_OPTION_DROP_SUBMIT_Q = 0x8,
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
> index 13d162353b1a..fbfcae727d7f 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
> @@ -159,6 +159,7 @@ void intel_guc_init_early(struct intel_guc *guc)
>  	intel_guc_log_init_early(&guc->log);
>  	intel_guc_submission_init_early(guc);
>  	intel_guc_slpc_init_early(&guc->slpc);
> +	intel_guc_rc_init_early(guc);
>  
>  	mutex_init(&guc->send_mutex);
>  	spin_lock_init(&guc->irq_lock);
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.h b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
> index 15ad2eaee473..08919d1b35dc 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc.h
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
> @@ -59,6 +59,8 @@ struct intel_guc {
>  
>  	bool submission_supported;
>  	bool submission_selected;
> +	bool rc_supported;
> +	bool rc_selected;
>  	bool slpc_supported;
>  	bool slpc_selected;
>  
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_rc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_rc.c
> new file mode 100644
> index 000000000000..18e3e05d7b39
> --- /dev/null
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_rc.c
> @@ -0,0 +1,80 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2021 Intel Corporation
> + */
> +
> +#include "intel_guc_rc.h"
> +#include "gt/intel_gt.h"
> +#include "i915_drv.h"
> +
> +static bool __guc_rc_supported(struct intel_guc *guc)
> +{
> +	/* GuC RC is unavailable for pre-Gen12 */
> +	return guc->submission_supported &&
> +		GRAPHICS_VER(guc_to_gt(guc)->i915) >= 12;
> +}
> +
> +static bool __guc_rc_selected(struct intel_guc *guc)
> +{
> +	if (!intel_guc_rc_is_supported(guc))
> +		return false;
> +
> +	return guc->submission_selected;
> +}
> +
> +void intel_guc_rc_init_early(struct intel_guc *guc)
> +{
> +	guc->rc_supported = __guc_rc_supported(guc);
> +	guc->rc_selected = __guc_rc_selected(guc);
> +}
> +
> +static int guc_action_control_gucrc(struct intel_guc *guc, bool enable)
> +{
> +	u32 rc_mode = enable ? INTEL_GUCRC_FIRMWARE_CONTROL :
> +				INTEL_GUCRC_HOST_CONTROL;
> +	u32 action[] = {
> +		INTEL_GUC_ACTION_SETUP_PC_GUCRC,
> +		rc_mode
> +	};
> +	int ret;
> +
> +	ret = intel_guc_send(guc, action, ARRAY_SIZE(action));
> +	ret = ret > 0 ? -EPROTO : ret;
> +
> +	return ret;
> +}
> +
> +static int __guc_rc_control(struct intel_guc *guc, bool enable)
> +{
> +	struct intel_gt *gt = guc_to_gt(guc);
> +	struct drm_device *drm = &guc_to_gt(guc)->i915->drm;
> +	int ret;
> +
> +	if (!intel_uc_uses_guc_rc(&gt->uc))
> +		return -ENOTSUPP;
> +
> +	if (!intel_guc_is_ready(guc))
> +		return -EINVAL;
> +
> +	ret = guc_action_control_gucrc(guc, enable);
> +	if (ret) {
> +		drm_err(drm, "Failed to %s GuC RC (%pe)\n",
> +			enabledisable(enable), ERR_PTR(ret));
> +		return ret;
> +	}
> +
> +	drm_info(&gt->i915->drm, "GuC RC: %s\n",
> +		enableddisabled(enable));
> +
> +	return 0;
> +}
> +
> +int intel_guc_rc_enable(struct intel_guc *guc)
> +{
> +	return __guc_rc_control(guc, true);
> +}
> +
> +int intel_guc_rc_disable(struct intel_guc *guc)
> +{
> +	return __guc_rc_control(guc, false);
> +}
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_rc.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_rc.h
> new file mode 100644
> index 000000000000..57e86c337838
> --- /dev/null
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_rc.h
> @@ -0,0 +1,31 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2021 Intel Corporation
> + */
> +
> +#ifndef _INTEL_GUC_RC_H_
> +#define _INTEL_GUC_RC_H_
> +
> +#include "intel_guc_submission.h"
> +
> +void intel_guc_rc_init_early(struct intel_guc *guc);
> +
> +static inline bool intel_guc_rc_is_supported(struct intel_guc *guc)
> +{
> +	return guc->rc_supported;
> +}
> +
> +static inline bool intel_guc_rc_is_wanted(struct intel_guc *guc)
> +{
> +	return guc->submission_selected && intel_guc_rc_is_supported(guc);
> +}
> +
> +static inline bool intel_guc_rc_is_used(struct intel_guc *guc)
> +{
> +	return intel_guc_submission_is_used(guc) && intel_guc_rc_is_wanted(guc);
> +}
> +
> +int intel_guc_rc_enable(struct intel_guc *guc);
> +int intel_guc_rc_disable(struct intel_guc *guc);
> +
> +#endif
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc.h b/drivers/gpu/drm/i915/gt/uc/intel_uc.h
> index 925a58ca6b94..866b462821c0 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_uc.h
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc.h
> @@ -7,6 +7,7 @@
>  #define _INTEL_UC_H_
>  
>  #include "intel_guc.h"
> +#include "intel_guc_rc.h"
>  #include "intel_guc_submission.h"
>  #include "intel_guc_slpc.h"
>  #include "intel_huc.h"
> @@ -85,6 +86,7 @@ uc_state_checkers(guc, guc);
>  uc_state_checkers(huc, huc);
>  uc_state_checkers(guc, guc_submission);
>  uc_state_checkers(guc, guc_slpc);
> +uc_state_checkers(guc, guc_rc);
>  
>  #undef uc_state_checkers
>  #undef __uc_state_checker
> -- 
> 2.25.0
> 

-- 
Matt Roper
Graphics Software Engineer
VTT-OSGC Platform Enablement
Intel Corporation
(916) 356-2795
