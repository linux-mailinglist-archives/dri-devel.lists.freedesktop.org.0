Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D771E30B1A4
	for <lists+dri-devel@lfdr.de>; Mon,  1 Feb 2021 21:38:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA1656E877;
	Mon,  1 Feb 2021 20:38:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0172F6E877;
 Mon,  1 Feb 2021 20:38:24 +0000 (UTC)
IronPort-SDR: x7KvVZ888hgY5JW2mOcRTgAGmxDQyWDVDKArVIv+LDASOpQeRrjDzE0b2Fp18em0CVOuEFXqN/
 IklU2pg+x4NQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9882"; a="265581888"
X-IronPort-AV: E=Sophos;i="5.79,393,1602572400"; d="scan'208";a="265581888"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2021 12:38:23 -0800
IronPort-SDR: xnMSdeB+pnWgyAqAmJK6PqPQ+buWkqvkSZA3zBmOf8XQlBAcnDo3HBTpnYVt8Uc3eduSYDqRX9
 UKka4KWDwmnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,393,1602572400"; d="scan'208";a="479243912"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.171])
 by fmsmga001.fm.intel.com with SMTP; 01 Feb 2021 12:38:19 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 01 Feb 2021 22:38:18 +0200
Date: Mon, 1 Feb 2021 22:38:18 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: Re: [PATCH v7 09/15] drm/i915: Add support for starting FRL training
 for HDMI2.1 via PCON
Message-ID: <YBhmuiFZ4ZsQ7Y+Z@intel.com>
References: <20201218103723.30844-1-ankit.k.nautiyal@intel.com>
 <20201218103723.30844-10-ankit.k.nautiyal@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201218103723.30844-10-ankit.k.nautiyal@intel.com>
X-Patchwork-Hint: comment
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
Cc: swati2.sharma@intel.com, airlied@linux.ie, intel-gfx@lists.freedesktop.org,
 vandita.kulkarni@intel.com, uma.shankar@intel.com,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Dec 18, 2020 at 04:07:17PM +0530, Ankit Nautiyal wrote:
> This patch adds functions to start FRL training for an HDMI2.1 sink,
> connected via a PCON as a DP branch device.
> This patch also adds a new structure for storing frl training related
> data, when FRL training is completed.
> =

> v2: As suggested by Uma Shankar:
> -renamed couple of variables for better clarity
> -tweaked the macros used for correct semantics for true/false
> -fixed other styling issues.
> =

> v3: Completed the TODO for condition for going to FRL mode.
> Modified the condition to determine the required FRL b/w
> based only on the Pcon and Sink's max FRL values.
> Moved the frl structure initialization to intel_dp_init_connector().
> =

> v4: Fixed typo in initialization of frl structure.
> =

> v5: Always use FRL if its possible, instead of enabling only for
> higher modes as done in v3.
> =

> Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> Reviewed-by: Uma Shankar <uma.shankar@intel.com> (v2)
> ---
>  .../drm/i915/display/intel_display_types.h    |   7 +
>  drivers/gpu/drm/i915/display/intel_dp.c       | 151 ++++++++++++++++++
>  drivers/gpu/drm/i915/display/intel_dp.h       |   2 +
>  3 files changed, 160 insertions(+)
<snip>
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i9=
15/display/intel_dp.c
> index 0596d6c24e73..43027a6d5e5e 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -3891,6 +3891,8 @@ static void intel_disable_dp(struct intel_atomic_st=
ate *state,
>  	intel_edp_backlight_off(old_conn_state);
>  	intel_dp_set_power(intel_dp, DP_SET_POWER_D3);
>  	intel_edp_panel_off(intel_dp);
> +	intel_dp->frl.is_trained =3D false;
> +	intel_dp->frl.trained_rate_gbps =3D 0;

This stuff looks rather misplaced (or missing from elsewhere). This code
doesn't even get executed on modern platforms.

<snip>
> +static int intel_dp_pcon_start_frl_training(struct intel_dp *intel_dp)
> +{
> +#define PCON_EXTENDED_TRAIN_MODE (1 > 0)
> +#define PCON_CONCURRENT_MODE (1 > 0)
> +#define PCON_SEQUENTIAL_MODE !PCON_CONCURRENT_MODE
> +#define PCON_NORMAL_TRAIN_MODE !PCON_EXTENDED_TRAIN_MODE

All of that looks like nonsense. What is it supposed to do?

> +#define TIMEOUT_FRL_READY_MS 500
> +#define TIMEOUT_HDMI_LINK_ACTIVE_MS 1000
> +
> +	struct drm_i915_private *i915 =3D dp_to_i915(intel_dp);
> +	int max_frl_bw, max_pcon_frl_bw, max_edid_frl_bw, ret;
> +	u8 max_frl_bw_mask =3D 0, frl_trained_mask;
> +	bool is_active;
> +
> +	ret =3D drm_dp_pcon_reset_frl_config(&intel_dp->aux);
> +	if (ret < 0)
> +		return ret;
> +
> +	max_pcon_frl_bw =3D intel_dp->dfp.pcon_max_frl_bw;
> +	drm_dbg(&i915->drm, "PCON max rate =3D %d Gbps\n", max_pcon_frl_bw);
> +
> +	max_edid_frl_bw =3D intel_dp_hdmi_sink_max_frl(intel_dp);
> +	drm_dbg(&i915->drm, "Sink max rate from EDID =3D %d Gbps\n", max_edid_f=
rl_bw);
> +
> +	max_frl_bw =3D min(max_edid_frl_bw, max_pcon_frl_bw);
> +
> +	if (max_frl_bw <=3D 0)
> +		return -EINVAL;
> +
> +	ret =3D drm_dp_pcon_frl_prepare(&intel_dp->aux, false);
> +	if (ret < 0)
> +		return ret;
> +	/* Wait for PCON to be FRL Ready */
> +	wait_for(is_active =3D drm_dp_pcon_is_frl_ready(&intel_dp->aux) =3D=3D =
true, TIMEOUT_FRL_READY_MS);
> +
> +	if (!is_active)
> +		return -ETIMEDOUT;
> +
> +	max_frl_bw_mask =3D intel_dp_pcon_set_frl_mask(max_frl_bw);
> +	ret =3D drm_dp_pcon_frl_configure_1(&intel_dp->aux, max_frl_bw, PCON_SE=
QUENTIAL_MODE);
> +	if (ret < 0)
> +		return ret;
> +	ret =3D drm_dp_pcon_frl_configure_2(&intel_dp->aux, max_frl_bw_mask, PC=
ON_NORMAL_TRAIN_MODE);
> +	if (ret < 0)
> +		return ret;
> +	ret =3D drm_dp_pcon_frl_enable(&intel_dp->aux);
> +	if (ret < 0)
> +		return ret;
> +	/*
> +	 * Wait for FRL to be completed
> +	 * Check if the HDMI Link is up and active.
> +	 */
> +	wait_for(is_active =3D drm_dp_pcon_hdmi_link_active(&intel_dp->aux) =3D=
=3D true, TIMEOUT_HDMI_LINK_ACTIVE_MS);
> +
> +	if (!is_active)
> +		return -ETIMEDOUT;
> +
> +	/* Verify HDMI Link configuration shows FRL Mode */
> +	if (DP_PCON_HDMI_MODE_FRL !=3D drm_dp_pcon_hdmi_link_mode(&intel_dp->au=
x, &frl_trained_mask)) {
> +		drm_dbg(&i915->drm, "HDMI couldn't be trained in FRL Mode\n");
> +		return -EINVAL;
> +	}
> +	drm_dbg(&i915->drm, "MAX_FRL_MASK =3D %u, FRL_TRAINED_MASK =3D %u\n", m=
ax_frl_bw_mask, frl_trained_mask);
> +
> +	intel_dp->frl.trained_rate_gbps =3D intel_dp_pcon_get_frl_mask(frl_trai=
ned_mask);
> +	intel_dp->frl.is_trained =3D true;
> +	drm_dbg(&i915->drm, "FRL trained with : %d Gbps\n", intel_dp->frl.train=
ed_rate_gbps);
> +
> +	return 0;
> +}
> +
> +static bool intel_dp_is_hdmi_2_1_sink(struct intel_dp *intel_dp)
> +{
> +	if (drm_dp_is_branch(intel_dp->dpcd) &&
> +	    intel_dp->has_hdmi_sink &&
> +	    intel_dp_hdmi_sink_max_frl(intel_dp) > 0)
> +		return true;
> +
> +	return false;
> +}
> +
> +void intel_dp_check_frl_training(struct intel_dp *intel_dp)
> +{
> +	struct drm_i915_private *dev_priv =3D dp_to_i915(intel_dp);
> +
> +	/* Always go for FRL training if supported */
> +	if (!intel_dp_is_hdmi_2_1_sink(intel_dp) ||
> +	    intel_dp->frl.is_trained)
> +		return;
> +
> +	if (intel_dp_pcon_start_frl_training(intel_dp) < 0) {
> +		int ret, mode;
> +
> +		drm_dbg(&dev_priv->drm, "Couldnt set FRL mode, continuing with TMDS mo=
de\n");
> +		ret =3D drm_dp_pcon_reset_frl_config(&intel_dp->aux);
> +		mode =3D drm_dp_pcon_hdmi_link_mode(&intel_dp->aux, NULL);
> +
> +		if (ret < 0 || mode !=3D DP_PCON_HDMI_MODE_TMDS)
> +			drm_dbg(&dev_priv->drm, "Issue with PCON, cannot set TMDS mode\n");
> +	} else {
> +		drm_dbg(&dev_priv->drm, "FRL training Completed\n");
> +	}
> +}
> +
>  static void
>  g4x_set_link_train(struct intel_dp *intel_dp,
>  		   const struct intel_crtc_state *crtc_state,
> @@ -8210,6 +8358,9 @@ intel_dp_init_connector(struct intel_digital_port *=
dig_port,
>  			       (temp & ~0xf) | 0xd);
>  	}
>  =

> +	intel_dp->frl.is_trained =3D false;
> +	intel_dp->frl.trained_rate_gbps =3D 0;
> +
>  	return true;
>  =

>  fail:
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.h b/drivers/gpu/drm/i9=
15/display/intel_dp.h
> index b871a09b6901..58b76a20459c 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.h
> +++ b/drivers/gpu/drm/i915/display/intel_dp.h
> @@ -144,4 +144,6 @@ bool intel_dp_initial_fastset_check(struct intel_enco=
der *encoder,
>  void intel_dp_sync_state(struct intel_encoder *encoder,
>  			 const struct intel_crtc_state *crtc_state);
>  =

> +void intel_dp_check_frl_training(struct intel_dp *intel_dp);
> +
>  #endif /* __INTEL_DP_H__ */
> -- =

> 2.17.1

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
