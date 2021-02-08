Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F32F313069
	for <lists+dri-devel@lfdr.de>; Mon,  8 Feb 2021 12:14:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A3566E893;
	Mon,  8 Feb 2021 11:14:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD5446E893;
 Mon,  8 Feb 2021 11:14:34 +0000 (UTC)
IronPort-SDR: 1IXymw7SUiLDwZwJ+VbIB1ZmMbkS8ytP64TI+zIvvgIDQIiIPN6OOaglev+zk6wuYhU7yPuXlK
 cqdgD4Lw9+PA==
X-IronPort-AV: E=McAfee;i="6000,8403,9888"; a="181761015"
X-IronPort-AV: E=Sophos;i="5.81,161,1610438400"; d="scan'208";a="181761015"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2021 03:14:33 -0800
IronPort-SDR: lA27CDMeGMuk8SvdsngoCIJZE8Cr75TO2q+9m0WaHjM/8MI85ZJjjpiUyAP+l3ZPRMbwzyHV3R
 Y+7WJBzyPO4Q==
X-IronPort-AV: E=Sophos;i="5.81,161,1610438400"; d="scan'208";a="374455211"
Received: from anveshag-mobl1.amr.corp.intel.com (HELO intel.com)
 ([10.209.119.193])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2021 03:14:32 -0800
Date: Mon, 8 Feb 2021 06:14:30 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Lyude Paul <lyude@redhat.com>
Subject: Re: [RFC v3 07/10] drm/i915/dpcd_bl: Move VESA backlight enabling
 code closer together
Message-ID: <20210208111430.GC4798@intel.com>
References: <20210205234515.1216538-1-lyude@redhat.com>
 <20210205234515.1216538-8-lyude@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210205234515.1216538-8-lyude@redhat.com>
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
Cc: David Airlie <airlied@linux.ie>, nouveau@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, open list <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, Sean Paul <seanpaul@chromium.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Feb 05, 2021 at 06:45:11PM -0500, Lyude Paul wrote:
> No functional changes, just move set_vesa_backlight_enable() closer to it's
> only caller: intel_dp_aux_vesa_enable_backlight().
> 
> Signed-off-by: Lyude Paul <lyude@redhat.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  .../drm/i915/display/intel_dp_aux_backlight.c | 54 +++++++++----------
>  1 file changed, 27 insertions(+), 27 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
> index f5ae2fb34c1f..431758058aa0 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
> @@ -270,33 +270,6 @@ intel_dp_aux_hdr_setup_backlight(struct intel_connector *connector, enum pipe pi
>  }
>  
>  /* VESA backlight callbacks */
> -static void set_vesa_backlight_enable(struct intel_connector *connector, bool enable)
> -{
> -	struct intel_dp *intel_dp = intel_attached_dp(connector);
> -	struct drm_i915_private *i915 = dp_to_i915(intel_dp);
> -	u8 reg_val = 0;
> -
> -	/* Early return when display use other mechanism to enable backlight. */
> -	if (!connector->panel.backlight.edp.vesa.aux_enable)
> -		return;
> -
> -	if (drm_dp_dpcd_readb(&intel_dp->aux, DP_EDP_DISPLAY_CONTROL_REGISTER, &reg_val) != 1) {
> -		drm_dbg_kms(&i915->drm, "Failed to read DPCD register 0x%x\n",
> -			    DP_EDP_DISPLAY_CONTROL_REGISTER);
> -		return;
> -	}
> -	if (enable)
> -		reg_val |= DP_EDP_BACKLIGHT_ENABLE;
> -	else
> -		reg_val &= ~(DP_EDP_BACKLIGHT_ENABLE);
> -
> -	if (drm_dp_dpcd_writeb(&intel_dp->aux, DP_EDP_DISPLAY_CONTROL_REGISTER,
> -			       reg_val) != 1) {
> -		drm_dbg_kms(&i915->drm, "Failed to %s aux backlight\n",
> -			    enable ? "enable" : "disable");
> -	}
> -}
> -
>  static bool intel_dp_aux_vesa_backlight_dpcd_mode(struct intel_connector *connector)
>  {
>  	struct intel_dp *intel_dp = intel_attached_dp(connector);
> @@ -378,6 +351,33 @@ intel_dp_aux_vesa_set_backlight(const struct drm_connector_state *conn_state,
>  	}
>  }
>  
> +static void set_vesa_backlight_enable(struct intel_connector *connector, bool enable)
> +{
> +	struct intel_dp *intel_dp = intel_attached_dp(connector);
> +	struct drm_i915_private *i915 = dp_to_i915(intel_dp);
> +	u8 reg_val = 0;
> +
> +	/* Early return when display use other mechanism to enable backlight. */
> +	if (!connector->panel.backlight.edp.vesa.aux_enable)
> +		return;
> +
> +	if (drm_dp_dpcd_readb(&intel_dp->aux, DP_EDP_DISPLAY_CONTROL_REGISTER, &reg_val) != 1) {
> +		drm_dbg_kms(&i915->drm, "Failed to read DPCD register 0x%x\n",
> +			    DP_EDP_DISPLAY_CONTROL_REGISTER);
> +		return;
> +	}
> +	if (enable)
> +		reg_val |= DP_EDP_BACKLIGHT_ENABLE;
> +	else
> +		reg_val &= ~(DP_EDP_BACKLIGHT_ENABLE);
> +
> +	if (drm_dp_dpcd_writeb(&intel_dp->aux, DP_EDP_DISPLAY_CONTROL_REGISTER,
> +			       reg_val) != 1) {
> +		drm_dbg_kms(&i915->drm, "Failed to %s aux backlight\n",
> +			    enable ? "enable" : "disable");
> +	}
> +}
> +
>  static void
>  intel_dp_aux_vesa_enable_backlight(const struct intel_crtc_state *crtc_state,
>  				   const struct drm_connector_state *conn_state, u32 level)
> -- 
> 2.29.2
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
