Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 783131278F0
	for <lists+dri-devel@lfdr.de>; Fri, 20 Dec 2019 11:12:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D8976E40D;
	Fri, 20 Dec 2019 10:12:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 410 seconds by postgrey-1.36 at gabe;
 Fri, 20 Dec 2019 10:12:08 UTC
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD8C66E40D
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Dec 2019 10:12:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576836727;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Mq4W5IzJwojaZjAtCtoEEkuNP+kOpC0iTItiA1Z5Xxs=;
 b=hcjfdIpidtmkSXkCXUke5jPM8cOCvnZ1uVoEP9tJOovojuAfJ+u5zxFBbCZRfB+fXkoL3R
 ULeQPc8P/9pP5Ly5ni78/7A8F/Pp1M/5XcYlL9zkm5DWiDzzELbe9AnspoxrEIxsNe1/SM
 9QY0IJykMBvvQX/TMX6446lVhJOdol0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-200-aAZosCDSOZu0JCWXq3g-Dw-1; Fri, 20 Dec 2019 05:05:13 -0500
X-MC-Unique: aAZosCDSOZu0JCWXq3g-Dw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F40171089B82;
 Fri, 20 Dec 2019 10:05:11 +0000 (UTC)
Received: from localhost.localdomain (ovpn-12-202.pek2.redhat.com
 [10.72.12.202])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C4E9D7D9D9;
 Fri, 20 Dec 2019 10:05:04 +0000 (UTC)
Subject: Re: [1/5] drm/i915: Fix eDP DPCD aux max backlight calculations
To: Lyude Paul <lyude@redhat.com>, intel-gfx@lists.freedesktop.org
References: <20191122231616.2574-2-lyude@redhat.com>
From: Perr Yuan <pyuan@redhat.com>
Message-ID: <1fa2a82f-6b76-943d-56a0-9bf8623ab68e@redhat.com>
Date: Fri, 20 Dec 2019 05:05:02 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <20191122231616.2574-2-lyude@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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
Cc: David Airlie <airlied@linux.ie>, Furquan Shaikh <furquan@google.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/22/19 6:15 PM, Lyude Paul wrote:
> Max backlight value for the panel was being calculated using byte
> count i.e. 0xffff if 2 bytes are supported for backlight brightness
> and 0xff if 1 byte is supported. However, EDP_PWMGEN_BIT_COUNT
> determines the number of active control bits used for the brightness
> setting. Thus, even if the panel uses 2 byte setting, it might not use
> all the control bits. Thus, max backlight should be set based on the
> value of EDP_PWMGEN_BIT_COUNT instead of assuming 65535 or 255.
> 
> Additionally, EDP_PWMGEN_BIT_COUNT was being updated based on the VBT
> frequency which results in a different max backlight value. Thus,
> setting of EDP_PWMGEN_BIT_COUNT is moved to setup phase instead of
> enable so that max backlight can be calculated correctly. Only the
> frequency divider is set during the enable phase using the value of
> EDP_PWMGEN_BIT_COUNT.
> 
> This is based off the original patch series from Furquan Shaikh
> <furquan@google.com>:
> 
> https://patchwork.freedesktop.org/patch/317255/?series=62326&rev=3
> 
> Changes since original patch:
> * Remove unused intel_dp variable in intel_dp_aux_setup_backlight()
> * Fix checkpatch issues
> * Make sure that we rewrite the pwmgen bit count whenever we bring the
>    panel out of D3 mode
> 
> Cc: Furquan Shaikh <furquan@google.com>
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> ---
>   .../drm/i915/display/intel_display_types.h    |   3 +
>   .../drm/i915/display/intel_dp_aux_backlight.c | 139 ++++++++++++------
>   2 files changed, 95 insertions(+), 47 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
> index 83ea04149b77..2a8d8cae638e 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_types.h
> +++ b/drivers/gpu/drm/i915/display/intel_display_types.h
> @@ -214,6 +214,9 @@ struct intel_panel {
>   		u8 controller;		/* bxt+ only */
>   		struct pwm_device *pwm;
>   
> +		/* DPCD backlight */
> +		u8 pwmgen_bit_count;
> +
>   		struct backlight_device *device;
>   
>   		/* Connector and platform specific backlight functions */
> diff --git a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
> index 020422da2ae2..fad470553cf9 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
> @@ -111,61 +111,28 @@ static bool intel_dp_aux_set_pwm_freq(struct intel_connector *connector)
>   {
>   	struct drm_i915_private *dev_priv = to_i915(connector->base.dev);
>   	struct intel_dp *intel_dp = enc_to_intel_dp(&connector->encoder->base);
> -	int freq, fxp, fxp_min, fxp_max, fxp_actual, f = 1;
> -	u8 pn, pn_min, pn_max;
> +	const u8 pn = connector->panel.backlight.pwmgen_bit_count;
> +	int freq, fxp, f, fxp_actual, fxp_min, fxp_max;
>   
> -	/* Find desired value of (F x P)
> -	 * Note that, if F x P is out of supported range, the maximum value or
> -	 * minimum value will applied automatically. So no need to check that.
> -	 */
>   	freq = dev_priv->vbt.backlight.pwm_freq_hz;
> -	DRM_DEBUG_KMS("VBT defined backlight frequency %u Hz\n", freq);
>   	if (!freq) {
>   		DRM_DEBUG_KMS("Use panel default backlight frequency\n");
>   		return false;
>   	}
>   
>   	fxp = DIV_ROUND_CLOSEST(KHz(DP_EDP_BACKLIGHT_FREQ_BASE_KHZ), freq);
> +	f = clamp(DIV_ROUND_CLOSEST(fxp, 1 << pn), 1, 255);
> +	fxp_actual = f << pn;
>   
> -	/* Use highest possible value of Pn for more granularity of brightness
> -	 * adjustment while satifying the conditions below.
> -	 * - Pn is in the range of Pn_min and Pn_max
> -	 * - F is in the range of 1 and 255
> -	 * - FxP is within 25% of desired value.
> -	 *   Note: 25% is arbitrary value and may need some tweak.
> -	 */
> -	if (drm_dp_dpcd_readb(&intel_dp->aux,
> -			       DP_EDP_PWMGEN_BIT_COUNT_CAP_MIN, &pn_min) != 1) {
> -		DRM_DEBUG_KMS("Failed to read pwmgen bit count cap min\n");
> -		return false;
> -	}
> -	if (drm_dp_dpcd_readb(&intel_dp->aux,
> -			       DP_EDP_PWMGEN_BIT_COUNT_CAP_MAX, &pn_max) != 1) {
> -		DRM_DEBUG_KMS("Failed to read pwmgen bit count cap max\n");
> -		return false;
> -	}
> -	pn_min &= DP_EDP_PWMGEN_BIT_COUNT_MASK;
> -	pn_max &= DP_EDP_PWMGEN_BIT_COUNT_MASK;
> -
> +	/* Ensure frequency is within 25% of desired value */
>   	fxp_min = DIV_ROUND_CLOSEST(fxp * 3, 4);
>   	fxp_max = DIV_ROUND_CLOSEST(fxp * 5, 4);
> -	if (fxp_min < (1 << pn_min) || (255 << pn_max) < fxp_max) {
> -		DRM_DEBUG_KMS("VBT defined backlight frequency out of range\n");
> -		return false;
> -	}
> -
> -	for (pn = pn_max; pn >= pn_min; pn--) {
> -		f = clamp(DIV_ROUND_CLOSEST(fxp, 1 << pn), 1, 255);
> -		fxp_actual = f << pn;
> -		if (fxp_min <= fxp_actual && fxp_actual <= fxp_max)
> -			break;
> -	}
>   
> -	if (drm_dp_dpcd_writeb(&intel_dp->aux,
> -			       DP_EDP_PWMGEN_BIT_COUNT, pn) < 0) {
> -		DRM_DEBUG_KMS("Failed to write aux pwmgen bit count\n");
> +	if (fxp_min > fxp_actual || fxp_actual > fxp_max) {
> +		DRM_DEBUG_KMS("Actual frequency out of range\n");
>   		return false;
>   	}
> +
>   	if (drm_dp_dpcd_writeb(&intel_dp->aux,
>   			       DP_EDP_BACKLIGHT_FREQ_SET, (u8) f) < 0) {
>   		DRM_DEBUG_KMS("Failed to write aux backlight freq\n");
> @@ -178,6 +145,7 @@ static void intel_dp_aux_enable_backlight(const struct intel_crtc_state *crtc_st
>   					  const struct drm_connector_state *conn_state)
>   {
>   	struct intel_connector *connector = to_intel_connector(conn_state->connector);
> +	struct intel_panel *panel = &connector->panel;
>   	struct intel_dp *intel_dp = enc_to_intel_dp(&connector->encoder->base);
>   	u8 dpcd_buf, new_dpcd_buf, edp_backlight_mode;
>   
> @@ -197,6 +165,12 @@ static void intel_dp_aux_enable_backlight(const struct intel_crtc_state *crtc_st
>   	case DP_EDP_BACKLIGHT_CONTROL_MODE_PRODUCT:
>   		new_dpcd_buf &= ~DP_EDP_BACKLIGHT_CONTROL_MODE_MASK;
>   		new_dpcd_buf |= DP_EDP_BACKLIGHT_CONTROL_MODE_DPCD;
> +
> +		if (drm_dp_dpcd_writeb(&intel_dp->aux,
> +				       DP_EDP_PWMGEN_BIT_COUNT,
> +				       panel->backlight.pwmgen_bit_count) < 0)
> +			DRM_DEBUG_KMS("Failed to write aux pwmgen bit count\n");
> +
>   		break;
>   
>   	/* Do nothing when it is already DPCD mode */
> @@ -225,20 +199,91 @@ static void intel_dp_aux_disable_backlight(const struct drm_connector_state *old
>   	set_aux_backlight_enable(enc_to_intel_dp(old_conn_state->best_encoder), false);
>   }
>   
> +static u32 intel_dp_aux_calc_max_backlight(struct intel_connector *connector)
> +{
> +	struct drm_i915_private *dev_priv = to_i915(connector->base.dev);
> +	struct intel_dp *intel_dp = enc_to_intel_dp(&connector->encoder->base);
> +	struct intel_panel *panel = &connector->panel;
> +	u32 max_backlight = 0;
> +	int freq, fxp, fxp_min, fxp_max, fxp_actual, f = 1;
> +	u8 pn, pn_min, pn_max;
> +
> +	if (drm_dp_dpcd_readb(&intel_dp->aux, DP_EDP_PWMGEN_BIT_COUNT, &pn)) {
> +		pn &= DP_EDP_PWMGEN_BIT_COUNT_MASK;
> +		max_backlight = (1 << pn) - 1;
> +	}
> +
> +	/* Find desired value of (F x P)
> +	 * Note that, if F x P is out of supported range, the maximum value or
> +	 * minimum value will applied automatically. So no need to check that.
> +	 */
> +	freq = dev_priv->vbt.backlight.pwm_freq_hz;
> +	DRM_DEBUG_KMS("VBT defined backlight frequency %u Hz\n", freq);
> +	if (!freq) {
> +		DRM_DEBUG_KMS("Use panel default backlight frequency\n");
> +		return max_backlight;
> +	}
> +
> +	fxp = DIV_ROUND_CLOSEST(KHz(DP_EDP_BACKLIGHT_FREQ_BASE_KHZ), freq);
> +
> +	/* Use highest possible value of Pn for more granularity of brightness
> +	 * adjustment while satifying the conditions below.
> +	 * - Pn is in the range of Pn_min and Pn_max
> +	 * - F is in the range of 1 and 255
> +	 * - FxP is within 25% of desired value.
> +	 *   Note: 25% is arbitrary value and may need some tweak.
> +	 */
> +	if (drm_dp_dpcd_readb(&intel_dp->aux,
> +			      DP_EDP_PWMGEN_BIT_COUNT_CAP_MIN, &pn_min) != 1) {
> +		DRM_DEBUG_KMS("Failed to read pwmgen bit count cap min\n");
> +		return max_backlight;
> +	}
> +	if (drm_dp_dpcd_readb(&intel_dp->aux,
> +			      DP_EDP_PWMGEN_BIT_COUNT_CAP_MAX, &pn_max) != 1) {
> +		DRM_DEBUG_KMS("Failed to read pwmgen bit count cap max\n");
> +		return max_backlight;
> +	}
> +	pn_min &= DP_EDP_PWMGEN_BIT_COUNT_MASK;
> +	pn_max &= DP_EDP_PWMGEN_BIT_COUNT_MASK;
> +
> +	fxp_min = DIV_ROUND_CLOSEST(fxp * 3, 4);
> +	fxp_max = DIV_ROUND_CLOSEST(fxp * 5, 4);
> +	if (fxp_min < (1 << pn_min) || (255 << pn_max) < fxp_max) {
> +		DRM_DEBUG_KMS("VBT defined backlight frequency out of range\n");
> +		return max_backlight;
> +	}
> +
> +	for (pn = pn_max; pn >= pn_min; pn--) {
> +		f = clamp(DIV_ROUND_CLOSEST(fxp, 1 << pn), 1, 255);
> +		fxp_actual = f << pn;
> +		if (fxp_min <= fxp_actual && fxp_actual <= fxp_max)
> +			break;
> +	}
> +
> +	DRM_DEBUG_KMS("Using eDP pwmgen bit count of %d\n", pn);
> +	if (drm_dp_dpcd_writeb(&intel_dp->aux,
> +			       DP_EDP_PWMGEN_BIT_COUNT, pn) < 0) {
> +		DRM_DEBUG_KMS("Failed to write aux pwmgen bit count\n");
> +		return max_backlight;
> +	}
> +	panel->backlight.pwmgen_bit_count = pn;
> +
> +	max_backlight = (1 << pn) - 1;
> +
> +	return max_backlight;
> +}
> +
>   static int intel_dp_aux_setup_backlight(struct intel_connector *connector,
>   					enum pipe pipe)
>   {
> -	struct intel_dp *intel_dp = enc_to_intel_dp(&connector->encoder->base);
>   	struct intel_panel *panel = &connector->panel;
>   
> -	if (intel_dp->edp_dpcd[2] & DP_EDP_BACKLIGHT_BRIGHTNESS_BYTE_COUNT)
> -		panel->backlight.max = 0xFFFF;
> -	else
> -		panel->backlight.max = 0xFF;
> +	panel->backlight.max = intel_dp_aux_calc_max_backlight(connector);
> +	if (!panel->backlight.max)
> +		return -ENODEV;
>   
>   	panel->backlight.min = 0;
>   	panel->backlight.level = intel_dp_aux_get_backlight(connector);
> -
>   	panel->backlight.enabled = panel->backlight.level != 0;
>   
>   	return 0;
> 
>  From patchwork Tue Dec  3 22:42:35 2019
> Content-Type: text/plain; charset="utf-8"
> MIME-Version: 1.0
> Content-Transfer-Encoding: 7bit
> Subject: [v2] drm/i915: Assume 100% brightness when not in DPCD control mode
> From: Lyude Paul <lyude@redhat.com>
> X-Patchwork-Id: 343592
> Message-Id: <20191203224236.230930-1-lyude@redhat.com>
> To: intel-gfx@lists.freedesktop.org
> Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
>   dri-devel@lists.freedesktop.org
> Date: Tue,  3 Dec 2019 17:42:35 -0500
> 
> Currently we always determine the initial panel brightness level by
> simply reading the value from DP_EDP_BACKLIGHT_BRIGHTNESS_MSB/LSB. This
> seems wrong though, because if the panel is not currently in DPCD
> control mode there's not really any reason why there would be any
> brightness value programmed in the first place.
> 
> This appears to be the case on the Lenovo ThinkPad X1 Extreme 2nd
> Generation, where the default value in these registers is always 0 on
> boot despite the fact the panel runs at max brightness by default.
> Getting the initial brightness value correct here is important as well,
> since the panel on this laptop doesn't behave well if it's ever put into
> DPCD control mode while the brightness level is programmed to 0.
> 
> So, let's fix this by checking what the current backlight control mode
> is before reading the brightness level. If it's in DPCD control mode, we
> return the programmed brightness level. Otherwise we assume 100%
> brightness and return the highest possible brightness level. This also
> prevents us from accidentally programming a brightness level of 0.
> 
> This is one of the many fixes that gets backlight controls working on
> the ThinkPad X1 Extreme 2nd Generation with optional 4K AMOLED screen.
> 
> Changes since v1:
> * s/DP_EDP_DISPLAY_CONTROL_REGISTER/DP_EDP_BACKLIGHT_MODE_SET_REGISTER/
>    - Jani
> 
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> ---
>   .../drm/i915/display/intel_dp_aux_backlight.c   | 17 +++++++++++++++++
>   1 file changed, 17 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
> index fad470553cf9..4d467e7d29eb 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
> @@ -59,8 +59,25 @@ static u32 intel_dp_aux_get_backlight(struct intel_connector *connector)
>   {
>   	struct intel_dp *intel_dp = enc_to_intel_dp(&connector->encoder->base);
>   	u8 read_val[2] = { 0x0 };
> +	u8 mode_reg;
>   	u16 level = 0;
>   
> +	if (drm_dp_dpcd_readb(&intel_dp->aux,
> +			      DP_EDP_BACKLIGHT_MODE_SET_REGISTER,
> +			      &mode_reg) != 1) {
> +		DRM_DEBUG_KMS("Failed to read the DPCD register 0x%x\n",
> +			      DP_EDP_BACKLIGHT_MODE_SET_REGISTER);
> +		return 0;
> +	}
> +
> +	/*
> +	 * If we're not in DPCD control mode yet, the programmed brightness
> +	 * value is meaningless and we should assume max brightness
> +	 */
> +	if ((mode_reg & DP_EDP_BACKLIGHT_CONTROL_MODE_MASK) !=
> +	    DP_EDP_BACKLIGHT_CONTROL_MODE_DPCD)
> +		return connector->panel.backlight.max;
> +
>   	if (drm_dp_dpcd_read(&intel_dp->aux, DP_EDP_BACKLIGHT_BRIGHTNESS_MSB,
>   			     &read_val, sizeof(read_val)) < 0) {
>   		DRM_DEBUG_KMS("Failed to read DPCD register 0x%x\n",
> 
>  From patchwork Fri Nov 22 23:16:01 2019
> Content-Type: text/plain; charset="utf-8"
> MIME-Version: 1.0
> Content-Transfer-Encoding: 7bit
> Subject: [3/5] drm/i915: Fix DPCD register order in intel_dp_aux_enable_backlight()
> From: Lyude Paul <lyude@redhat.com>
> X-Patchwork-Id: 342164
> Message-Id: <20191122231616.2574-4-lyude@redhat.com>
> To: intel-gfx@lists.freedesktop.org
> Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
>   dri-devel@lists.freedesktop.org
> Date: Fri, 22 Nov 2019 18:16:01 -0500
> 
> For eDP panels, it appears it's expected that so long as the panel is in
> DPCD control mode that the brightness value is never set to 0. Instead,
> if the desired effect is to set the panel's backlight to 0 we're
> expected to simply turn off the backlight through the
> DP_EDP_DISPLAY_CONTROL_REGISTER.
> 
> We already do the latter correctly in intel_dp_aux_disable_backlight().
> But, we make the mistake of writing the DPCD registers in the wrong
> order when enabling the backlight in intel_dp_aux_enable_backlight()
> since we currently enable the backlight through
> DP_EDP_DISPLAY_CONTROL_REGISTER before writing the brightness level. On
> the X1 Extreme 2nd Generation, this appears to have the potential of
> confusing the panel in such a way that further attempts to set the
> brightness don't actually change the backlight as expected and leave it
> off. Presumably, this happens because the incorrect register writing
> order briefly leaves the panel with DPCD mode enabled and a 0 brightness
> level set.
> 
> So, reverse the order we write the DPCD registers when enabling the
> panel backlight so that we write the brightness value first, and enable
> the backlight second. This fix appears to be the final bit needed to get
> the backlight on the ThinkPad X1 Extreme 2nd Generation's AMOLED screen
> working.
> 
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> Reviewed-by: Jani Nikula <jani.nikula@intel.com>
> ---
>   drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
> index 0bf8772bc7bb..87b59db9ffe3 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
> @@ -205,8 +205,9 @@ static void intel_dp_aux_enable_backlight(const struct intel_crtc_state *crtc_st
>   		}
>   	}
>   
> +	intel_dp_aux_set_backlight(conn_state,
> +				   connector->panel.backlight.level);
>   	set_aux_backlight_enable(intel_dp, true);
> -	intel_dp_aux_set_backlight(conn_state, connector->panel.backlight.level);
>   }
>   
>   static void intel_dp_aux_disable_backlight(const struct drm_connector_state *old_conn_state)
> 
>  From patchwork Fri Nov 22 23:16:02 2019
> Content-Type: text/plain; charset="utf-8"
> MIME-Version: 1.0
> Content-Transfer-Encoding: 7bit
> Subject: [4/5] drm/i915: Auto detect DPCD backlight support by default
> From: Lyude Paul <lyude@redhat.com>
> X-Patchwork-Id: 342165
> Message-Id: <20191122231616.2574-5-lyude@redhat.com>
> To: intel-gfx@lists.freedesktop.org
> Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
>   dri-devel@lists.freedesktop.org
> Date: Fri, 22 Nov 2019 18:16:02 -0500
> 
> Turns out we actually already have some companies, such as Lenovo,
> shipping machines with AMOLED screens that don't allow controlling the
> backlight through the usual PWM interface and only allow controlling it
> through the standard EDP DPCD interface. One example of one of these
> laptops is the X1 Extreme 2nd Generation.
> 
> Since we've got systems that need this turned on by default now to have
> backlight controls working out of the box, let's start auto-detecting it
> for systems by default based on what the VBT tells us. We do this by
> changing the default value for the enable_dpcd_backlight module param
> from 0 to -1.
> 
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> Reviewed-by: Jani Nikula <jani.nikula@intel.com>
> ---
>   drivers/gpu/drm/i915/i915_params.c | 2 +-
>   drivers/gpu/drm/i915/i915_params.h | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/i915_params.c b/drivers/gpu/drm/i915/i915_params.c
> index 1dd1f3652795..31eed60c167e 100644
> --- a/drivers/gpu/drm/i915/i915_params.c
> +++ b/drivers/gpu/drm/i915/i915_params.c
> @@ -172,7 +172,7 @@ i915_param_named_unsafe(inject_probe_failure, uint, 0400,
>   
>   i915_param_named(enable_dpcd_backlight, int, 0600,
>   	"Enable support for DPCD backlight control"
> -	"(-1=use per-VBT LFP backlight type setting, 0=disabled [default], 1=enabled)");
> +	"(-1=use per-VBT LFP backlight type setting [default], 0=disabled, 1=enabled)");
>   
>   #if IS_ENABLED(CONFIG_DRM_I915_GVT)
>   i915_param_named(enable_gvt, bool, 0400,
> diff --git a/drivers/gpu/drm/i915/i915_params.h b/drivers/gpu/drm/i915/i915_params.h
> index 31b88f297fbc..a79d0867f77a 100644
> --- a/drivers/gpu/drm/i915/i915_params.h
> +++ b/drivers/gpu/drm/i915/i915_params.h
> @@ -64,7 +64,7 @@ struct drm_printer;
>   	param(int, reset, 3) \
>   	param(unsigned int, inject_probe_failure, 0) \
>   	param(int, fastboot, -1) \
> -	param(int, enable_dpcd_backlight, 0) \
> +	param(int, enable_dpcd_backlight, -1) \
>   	param(char *, force_probe, CONFIG_DRM_I915_FORCE_PROBE) \
>   	param(unsigned long, fake_lmem_start, 0) \
>   	/* leave bools at the end to not create holes */ \
> 
>  From patchwork Fri Nov 22 23:16:03 2019
> Content-Type: text/plain; charset="utf-8"
> MIME-Version: 1.0
> Content-Transfer-Encoding: 7bit
> Subject: [5/5] drm/i915: Force DPCD backlight mode on X1 Extreme 2nd Gen 4K AMOLED panel
> From: Lyude Paul <lyude@redhat.com>
> X-Patchwork-Id: 342166
> Message-Id: <20191122231616.2574-6-lyude@redhat.com>
> To: intel-gfx@lists.freedesktop.org
> Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
>   linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>
> Date: Fri, 22 Nov 2019 18:16:03 -0500
> 
> Annoyingly, the VBT on the ThinkPad X1 Extreme 2nd Gen indicates that
> the system uses plain PWM based backlight controls, when in reality the
> only backlight controls that work are the standard VESA eDP DPCD
> backlight controls.
> 
> Honestly, this makes me wonder how many other systems have these issues
> or lie about this in their VBT. Not sure we have any good way of finding
> out until panels like this become more common place in the laptop
> market. For now, just add a DRM DP quirk to indicate that this panel is
> telling the truth and is being a good LCD.
> 
> Bugzilla: https://bugs.freedesktop.org/show_bug.cgi?id=112376
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> Acked-by: Jani Nikula <jani.nikula@intel.com>
> ---
>   drivers/gpu/drm/drm_dp_helper.c                       |  4 ++++
>   drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c | 10 ++++++++--
>   include/drm/drm_dp_helper.h                           |  8 ++++++++
>   3 files changed, 20 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_dp_helper.c b/drivers/gpu/drm/drm_dp_helper.c
> index 2c7870aef469..ec7061e3a99b 100644
> --- a/drivers/gpu/drm/drm_dp_helper.c
> +++ b/drivers/gpu/drm/drm_dp_helper.c
> @@ -1155,6 +1155,10 @@ static const struct dpcd_quirk dpcd_quirk_list[] = {
>   	{ OUI(0x00, 0x10, 0xfa), DEVICE_ID_ANY, false, BIT(DP_DPCD_QUIRK_NO_PSR) },
>   	/* CH7511 seems to leave SINK_COUNT zeroed */
>   	{ OUI(0x00, 0x00, 0x00), DEVICE_ID('C', 'H', '7', '5', '1', '1'), false, BIT(DP_DPCD_QUIRK_NO_SINK_COUNT) },
> +	/* Optional 4K AMOLED panel in the ThinkPad X1 Extreme 2nd Generation
> +	 * only supports DPCD backlight controls, despite advertising otherwise
> +	 */
> +	{ OUI(0xba, 0x41, 0x59), DEVICE_ID_ANY, false, BIT(DP_DPCD_QUIRK_FORCE_DPCD_BACKLIGHT) },
>   };
>   
>   #undef OUI
> diff --git a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
> index 87b59db9ffe3..3d61260b08ad 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
> @@ -325,11 +325,17 @@ intel_dp_aux_display_control_capable(struct intel_connector *connector)
>   int intel_dp_aux_init_backlight_funcs(struct intel_connector *intel_connector)
>   {
>   	struct intel_panel *panel = &intel_connector->panel;
> -	struct drm_i915_private *dev_priv = to_i915(intel_connector->base.dev);
> +	struct intel_dp *intel_dp =
> +		enc_to_intel_dp(&intel_connector->encoder->base);
> +	struct drm_i915_private *dev_priv =
> +		to_i915(intel_connector->base.dev);
>   
>   	if (i915_modparams.enable_dpcd_backlight == 0 ||
>   	    (i915_modparams.enable_dpcd_backlight == -1 &&
> -	    dev_priv->vbt.backlight.type != INTEL_BACKLIGHT_VESA_EDP_AUX_INTERFACE))
> +	     dev_priv->vbt.backlight.type !=
> +		     INTEL_BACKLIGHT_VESA_EDP_AUX_INTERFACE &&
> +	     !drm_dp_has_quirk(&intel_dp->desc,
> +			       DP_DPCD_QUIRK_FORCE_DPCD_BACKLIGHT)))
>   		return -ENODEV;
>   
>   	if (!intel_dp_aux_display_control_capable(intel_connector))
> diff --git a/include/drm/drm_dp_helper.h b/include/drm/drm_dp_helper.h
> index 51ecb5112ef8..a444209cd54b 100644
> --- a/include/drm/drm_dp_helper.h
> +++ b/include/drm/drm_dp_helper.h
> @@ -1520,6 +1520,14 @@ enum drm_dp_quirk {
>   	 * The driver should ignore SINK_COUNT during detection.
>   	 */
>   	DP_DPCD_QUIRK_NO_SINK_COUNT,
> +	/**
> +	 * @DP_DPCD_QUIRK_FORCE_DPCD_BACKLIGHT:
> +	 *
> +	 * The device is telling the truth when it says that it uses DPCD
> +	 * backlight controls, even if the system's firmware disagrees.
> +	 * The driver should honor the DPCD backlight capabilities advertised.
> +	 */
> +	DP_DPCD_QUIRK_FORCE_DPCD_BACKLIGHT,
>   };
>   
>   /**
> 
Tested-by:Perry Yuan <pyuan@redhat.com>

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
