Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 535FE44E3DC
	for <lists+dri-devel@lfdr.de>; Fri, 12 Nov 2021 10:33:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF9FD89A86;
	Fri, 12 Nov 2021 09:33:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEAD589A86;
 Fri, 12 Nov 2021 09:33:05 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10165"; a="220315094"
X-IronPort-AV: E=Sophos;i="5.87,229,1631602800"; d="scan'208";a="220315094"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2021 01:33:05 -0800
X-IronPort-AV: E=Sophos;i="5.87,229,1631602800"; d="scan'208";a="504821187"
Received: from sbacanu-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.251.217.145])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2021 01:33:03 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Matt Roper <matthew.d.roper@intel.com>, intel-gfx@lists.freedesktop.org
Subject: Re: [Intel-gfx] [PATCH 1/4] drm/i915/dg2: Add Wa_14010547955
In-Reply-To: <20211111215644.1123373-2-matthew.d.roper@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20211111215644.1123373-1-matthew.d.roper@intel.com>
 <20211111215644.1123373-2-matthew.d.roper@intel.com>
Date: Fri, 12 Nov 2021 11:33:00 +0200
Message-ID: <87a6i94t2r.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 11 Nov 2021, Matt Roper <matthew.d.roper@intel.com> wrote:
> This workaround is documented a bit strangely in the bspec; it's listed
> as an A0 workaround, but the description clarifies that the workaround
> is implicitly handled by the hardware and what the driver really needs
> to do is program a chicken bit to reenable some internal behavior.
>
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_display.c | 4 ++++
>  drivers/gpu/drm/i915/i915_reg.h              | 5 +++--
>  2 files changed, 7 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
> index 0ceee8ac6671..5d50d06f4eb7 100644
> --- a/drivers/gpu/drm/i915/display/intel_display.c
> +++ b/drivers/gpu/drm/i915/display/intel_display.c
> @@ -988,6 +988,10 @@ static void icl_set_pipe_chicken(const struct intel_crtc_state *crtc_state)
>  	else if (DISPLAY_VER(dev_priv) >= 13)
>  		tmp |= UNDERRUN_RECOVERY_DISABLE_ADLP;
>  
> +	/* Wa_14010547955:dg2 */
> +	if (IS_DG2_DISP_STEP(dev_priv, STEP_B0, STEP_FOREVER))

How did we end up with _DISP_ for DG2 when everything else has
_DISPLAY_?

BR,
Jani.


> +		tmp |= DG2_RENDER_CCSTAG_4_3_EN;
> +
>  	intel_de_write(dev_priv, PIPE_CHICKEN(pipe), tmp);
>  }
>  
> diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
> index 07d6cf76c389..680ace373e00 100644
> --- a/drivers/gpu/drm/i915/i915_reg.h
> +++ b/drivers/gpu/drm/i915/i915_reg.h
> @@ -8480,8 +8480,9 @@ enum {
>  							   _PIPEB_CHICKEN)
>  #define   UNDERRUN_RECOVERY_DISABLE_ADLP	REG_BIT(30)
>  #define   UNDERRUN_RECOVERY_ENABLE_DG2		REG_BIT(30)
> -#define   PIXEL_ROUNDING_TRUNC_FB_PASSTHRU 	(1 << 15)
> -#define   PER_PIXEL_ALPHA_BYPASS_EN		(1 << 7)
> +#define   PIXEL_ROUNDING_TRUNC_FB_PASSTHRU	REG_BIT(15)
> +#define   DG2_RENDER_CCSTAG_4_3_EN		REG_BIT(12)
> +#define   PER_PIXEL_ALPHA_BYPASS_EN		REG_BIT(7)
>  
>  #define FF_MODE2			_MMIO(0x6604)
>  #define   FF_MODE2_GS_TIMER_MASK	REG_GENMASK(31, 24)

-- 
Jani Nikula, Intel Open Source Graphics Center
