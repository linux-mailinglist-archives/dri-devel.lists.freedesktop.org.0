Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AACE4313045
	for <lists+dri-devel@lfdr.de>; Mon,  8 Feb 2021 12:11:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0334E89D4B;
	Mon,  8 Feb 2021 11:11:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EA6A89A92;
 Mon,  8 Feb 2021 11:11:50 +0000 (UTC)
IronPort-SDR: C0+ZODkEyWhDi8XLxxxYO8/UyZrbNL98TCVw+ertimouV7XLKGpIlWGVFc+53Rdd2nFEqYvTFJ
 Yp+LNZp6s5uA==
X-IronPort-AV: E=McAfee;i="6000,8403,9888"; a="180918908"
X-IronPort-AV: E=Sophos;i="5.81,161,1610438400"; d="scan'208";a="180918908"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2021 03:11:48 -0800
IronPort-SDR: e/2aMYPsgB0iavTaYJAI7kdF/a2ofXD2ykrHQjpC7e5as5C4lWp0UOYJlJIeqW9a8akiivd9NP
 lVD8gImj68UQ==
X-IronPort-AV: E=Sophos;i="5.81,161,1610438400"; d="scan'208";a="418743050"
Received: from anveshag-mobl1.amr.corp.intel.com (HELO intel.com)
 ([10.209.119.193])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2021 03:11:47 -0800
Date: Mon, 8 Feb 2021 06:11:45 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Lyude Paul <lyude@redhat.com>
Subject: Re: [RFC v3 04/10] drm/i915/dpcd_bl: Handle drm_dpcd_read/write()
 return values correctly
Message-ID: <20210208111145.GA4798@intel.com>
References: <20210205234515.1216538-1-lyude@redhat.com>
 <20210205234515.1216538-5-lyude@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210205234515.1216538-5-lyude@redhat.com>
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

On Fri, Feb 05, 2021 at 06:45:08PM -0500, Lyude Paul wrote:
> This is kind of an annoying aspect of DRM's DP helpers:
> drm_dp_dpcd_readb/writeb() return the size of bytes read/written on
> success, thus we want to check against that instead of checking if the
> return value is less than 0.
> 
> I'll probably be fixing this in the near future once I start doing DP work
> again, also because I'd rather not mix a tree-wide refactor like that in
> with a patch series intended to be around introducing DP backlight helpers.
> So, for now let's just handle the return values from each function
> correctly.
> 
> Signed-off-by: Lyude Paul <lyude@redhat.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  .../drm/i915/display/intel_dp_aux_backlight.c | 41 +++++++++----------
>  1 file changed, 19 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
> index 62294967f430..c37ccc8538cb 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
> @@ -107,7 +107,7 @@ intel_dp_aux_supports_hdr_backlight(struct intel_connector *connector)
>  	u8 tcon_cap[4];
>  
>  	ret = drm_dp_dpcd_read(aux, INTEL_EDP_HDR_TCON_CAP0, tcon_cap, sizeof(tcon_cap));
> -	if (ret < 0)
> +	if (ret != sizeof(tcon_cap))
>  		return false;
>  
>  	if (!(tcon_cap[1] & INTEL_EDP_HDR_TCON_BRIGHTNESS_NITS_CAP))
> @@ -137,7 +137,7 @@ intel_dp_aux_hdr_get_backlight(struct intel_connector *connector, enum pipe pipe
>  	u8 tmp;
>  	u8 buf[2] = { 0 };
>  
> -	if (drm_dp_dpcd_readb(&intel_dp->aux, INTEL_EDP_HDR_GETSET_CTRL_PARAMS, &tmp) < 0) {
> +	if (drm_dp_dpcd_readb(&intel_dp->aux, INTEL_EDP_HDR_GETSET_CTRL_PARAMS, &tmp) != 1) {
>  		drm_err(&i915->drm, "Failed to read current backlight mode from DPCD\n");
>  		return 0;
>  	}
> @@ -153,7 +153,8 @@ intel_dp_aux_hdr_get_backlight(struct intel_connector *connector, enum pipe pipe
>  		return panel->backlight.max;
>  	}
>  
> -	if (drm_dp_dpcd_read(&intel_dp->aux, INTEL_EDP_BRIGHTNESS_NITS_LSB, buf, sizeof(buf)) < 0) {
> +	if (drm_dp_dpcd_read(&intel_dp->aux, INTEL_EDP_BRIGHTNESS_NITS_LSB, buf,
> +			     sizeof(buf)) != sizeof(buf)) {
>  		drm_err(&i915->drm, "Failed to read brightness from DPCD\n");
>  		return 0;
>  	}
> @@ -172,7 +173,8 @@ intel_dp_aux_hdr_set_aux_backlight(const struct drm_connector_state *conn_state,
>  	buf[0] = level & 0xFF;
>  	buf[1] = (level & 0xFF00) >> 8;
>  
> -	if (drm_dp_dpcd_write(&intel_dp->aux, INTEL_EDP_BRIGHTNESS_NITS_LSB, buf, 4) < 0)
> +	if (drm_dp_dpcd_write(&intel_dp->aux, INTEL_EDP_BRIGHTNESS_NITS_LSB, buf,
> +			      sizeof(buf)) != sizeof(buf))
>  		drm_err(dev, "Failed to write brightness level to DPCD\n");
>  }
>  
> @@ -203,7 +205,7 @@ intel_dp_aux_hdr_enable_backlight(const struct intel_crtc_state *crtc_state,
>  	u8 old_ctrl, ctrl;
>  
>  	ret = drm_dp_dpcd_readb(&intel_dp->aux, INTEL_EDP_HDR_GETSET_CTRL_PARAMS, &old_ctrl);
> -	if (ret < 0) {
> +	if (ret != 1) {
>  		drm_err(&i915->drm, "Failed to read current backlight control mode: %d\n", ret);
>  		return;
>  	}
> @@ -221,7 +223,7 @@ intel_dp_aux_hdr_enable_backlight(const struct intel_crtc_state *crtc_state,
>  	}
>  
>  	if (ctrl != old_ctrl)
> -		if (drm_dp_dpcd_writeb(&intel_dp->aux, INTEL_EDP_HDR_GETSET_CTRL_PARAMS, ctrl) < 0)
> +		if (drm_dp_dpcd_writeb(&intel_dp->aux, INTEL_EDP_HDR_GETSET_CTRL_PARAMS, ctrl) != 1)
>  			drm_err(&i915->drm, "Failed to configure DPCD brightness controls\n");
>  }
>  
> @@ -277,8 +279,7 @@ static void set_vesa_backlight_enable(struct intel_dp *intel_dp, bool enable)
>  	if (!(intel_dp->edp_dpcd[1] & DP_EDP_BACKLIGHT_AUX_ENABLE_CAP))
>  		return;
>  
> -	if (drm_dp_dpcd_readb(&intel_dp->aux, DP_EDP_DISPLAY_CONTROL_REGISTER,
> -			      &reg_val) < 0) {
> +	if (drm_dp_dpcd_readb(&intel_dp->aux, DP_EDP_DISPLAY_CONTROL_REGISTER, &reg_val) != 1) {
>  		drm_dbg_kms(&i915->drm, "Failed to read DPCD register 0x%x\n",
>  			    DP_EDP_DISPLAY_CONTROL_REGISTER);
>  		return;
> @@ -332,8 +333,8 @@ static u32 intel_dp_aux_vesa_get_backlight(struct intel_connector *connector, en
>  	if (!intel_dp_aux_vesa_backlight_dpcd_mode(connector))
>  		return connector->panel.backlight.max;
>  
> -	if (drm_dp_dpcd_read(&intel_dp->aux, DP_EDP_BACKLIGHT_BRIGHTNESS_MSB,
> -			     &read_val, sizeof(read_val)) < 0) {
> +	if (drm_dp_dpcd_read(&intel_dp->aux, DP_EDP_BACKLIGHT_BRIGHTNESS_MSB, &read_val,
> +			     sizeof(read_val)) != sizeof(read_val)) {
>  		drm_dbg_kms(&i915->drm, "Failed to read DPCD register 0x%x\n",
>  			    DP_EDP_BACKLIGHT_BRIGHTNESS_MSB);
>  		return 0;
> @@ -365,8 +366,8 @@ intel_dp_aux_vesa_set_backlight(const struct drm_connector_state *conn_state,
>  		vals[0] = (level & 0xFF00) >> 8;
>  		vals[1] = (level & 0xFF);
>  	}
> -	if (drm_dp_dpcd_write(&intel_dp->aux, DP_EDP_BACKLIGHT_BRIGHTNESS_MSB,
> -			      vals, sizeof(vals)) < 0) {
> +	if (drm_dp_dpcd_write(&intel_dp->aux, DP_EDP_BACKLIGHT_BRIGHTNESS_MSB, vals,
> +			      sizeof(vals)) != sizeof(vals)) {
>  		drm_dbg_kms(&i915->drm,
>  			    "Failed to write aux backlight level\n");
>  		return;
> @@ -401,9 +402,8 @@ intel_dp_aux_vesa_enable_backlight(const struct intel_crtc_state *crtc_state,
>  		new_dpcd_buf &= ~DP_EDP_BACKLIGHT_CONTROL_MODE_MASK;
>  		new_dpcd_buf |= DP_EDP_BACKLIGHT_CONTROL_MODE_DPCD;
>  
> -		if (drm_dp_dpcd_writeb(&intel_dp->aux,
> -				       DP_EDP_PWMGEN_BIT_COUNT,
> -				       pwmgen_bit_count) < 0)
> +		if (drm_dp_dpcd_writeb(&intel_dp->aux, DP_EDP_PWMGEN_BIT_COUNT,
> +				       pwmgen_bit_count) != 1)
>  			drm_dbg_kms(&i915->drm,
>  				    "Failed to write aux pwmgen bit count\n");
>  
> @@ -424,11 +424,9 @@ intel_dp_aux_vesa_enable_backlight(const struct intel_crtc_state *crtc_state,
>  	}
>  
>  	if (new_dpcd_buf != dpcd_buf) {
> -		if (drm_dp_dpcd_writeb(&intel_dp->aux,
> -			DP_EDP_BACKLIGHT_MODE_SET_REGISTER, new_dpcd_buf) < 0) {
> -			drm_dbg_kms(&i915->drm,
> -				    "Failed to write aux backlight mode\n");
> -		}
> +		if (drm_dp_dpcd_writeb(&intel_dp->aux, DP_EDP_BACKLIGHT_MODE_SET_REGISTER,
> +				       new_dpcd_buf) != 1)
> +			drm_dbg_kms(&i915->drm, "Failed to write aux backlight mode\n");
>  	}
>  
>  	intel_dp_aux_vesa_set_backlight(conn_state, level);
> @@ -519,8 +517,7 @@ static u32 intel_dp_aux_vesa_calc_max_backlight(struct intel_connector *connecto
>  	}
>  
>  	drm_dbg_kms(&i915->drm, "Using eDP pwmgen bit count of %d\n", pn);
> -	if (drm_dp_dpcd_writeb(&intel_dp->aux,
> -			       DP_EDP_PWMGEN_BIT_COUNT, pn) < 0) {
> +	if (drm_dp_dpcd_writeb(&intel_dp->aux, DP_EDP_PWMGEN_BIT_COUNT, pn) != 1) {
>  		drm_dbg_kms(&i915->drm,
>  			    "Failed to write aux pwmgen bit count\n");
>  		return max_backlight;
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
