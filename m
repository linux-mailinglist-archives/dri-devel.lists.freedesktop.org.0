Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 62A392803D7
	for <lists+dri-devel@lfdr.de>; Thu,  1 Oct 2020 18:24:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5959B6E8C5;
	Thu,  1 Oct 2020 16:24:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AED16E038;
 Thu,  1 Oct 2020 16:24:14 +0000 (UTC)
IronPort-SDR: GUcv8fQ7Tc8EX/rJ8MX2PKqotB1/pYwr7oJgJboRvKCYFK6NlfKNYpB4DB7gNjJBeHvZmIbIaw
 ZdAc39VYjmAg==
X-IronPort-AV: E=McAfee;i="6000,8403,9761"; a="142173683"
X-IronPort-AV: E=Sophos;i="5.77,323,1596524400"; d="scan'208";a="142173683"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2020 09:24:10 -0700
IronPort-SDR: H+s1QR7RUd4qMX6wRCE6+yHY6AABK+U4nh24a0o63fyId6CoSGpXuHCzGK9QyOUq44ZQYc7910
 WUAZb7ROtsVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,323,1596524400"; d="scan'208";a="351193383"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by FMSMGA003.fm.intel.com with SMTP; 01 Oct 2020 09:24:04 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 01 Oct 2020 19:24:03 +0300
Date: Thu, 1 Oct 2020 19:24:03 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Kai-Heng Feng <kai.heng.feng@canonical.com>
Subject: Re: [PATCH v6] drm/i915: Init lspcon after HPD in intel_dp_detect()
Message-ID: <20201001162403.GT6112@intel.com>
References: <20200610075542.12882-1-kai.heng.feng@canonical.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200610075542.12882-1-kai.heng.feng@canonical.com>
X-Patchwork-Hint: comment
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 David Airlie <airlied@linux.ie>, Lucas De Marchi <lucas.demarchi@intel.com>,
 open list <linux-kernel@vger.kernel.org>,
 =?iso-8859-1?Q?Jos=E9?= Roberto de Souza <jose.souza@intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Manasi Navare <manasi.d.navare@intel.com>, Uma Shankar <uma.shankar@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>, intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jun 10, 2020 at 03:55:10PM +0800, Kai-Heng Feng wrote:
> On HP 800 G4 DM, if HDMI cable isn't plugged before boot, the HDMI port
> becomes useless and never responds to cable hotplugging:
> [    3.031904] [drm:lspcon_init [i915]] *ERROR* Failed to probe lspcon
> [    3.031945] [drm:intel_ddi_init [i915]] *ERROR* LSPCON init failed on =
port D
> =

> Seems like the lspcon chip on the system only gets powered after the
> cable is plugged.
> =

> Consilidate lspcon_init() into lspcon_resume() to dynamically init
> lspcon chip, and make HDMI port work.
> =

> Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
> ---
> v6:
>  - Rebase on latest for-linux-next.
> =

> v5:
>  - Consolidate lspcon_resume() with lspcon_init().
>  - Move more logic into lspcon code.
> =

> v4:
>  - Trust VBT in intel_infoframe_init().
>  - Init lspcon in intel_dp_detect().
> =

> v3:
>  - Make sure it's handled under long HPD case.
> =

> v2: =

>  - Move lspcon_init() inside of intel_dp_hpd_pulse().

Hoisted the changelog above --- where it belongs in drm land,
amended with
Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/203
and pushed the patch to dinq.

Thanks, and sorry for the horrendous latency.

PS. This will cause some headache for Uma's lspcon HDR stuff, but
so be it.

> =

>  drivers/gpu/drm/i915/display/intel_ddi.c    | 19 +------
>  drivers/gpu/drm/i915/display/intel_dp.c     | 10 ++--
>  drivers/gpu/drm/i915/display/intel_hdmi.c   |  3 +-
>  drivers/gpu/drm/i915/display/intel_lspcon.c | 63 ++++++++++++---------
>  drivers/gpu/drm/i915/display/intel_lspcon.h |  3 +-
>  5 files changed, 43 insertions(+), 55 deletions(-)
> =

> diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c b/drivers/gpu/drm/i=
915/display/intel_ddi.c
> index aa22465bb56e..af755b1aa24b 100644
> --- a/drivers/gpu/drm/i915/display/intel_ddi.c
> +++ b/drivers/gpu/drm/i915/display/intel_ddi.c
> @@ -4805,7 +4805,7 @@ void intel_ddi_init(struct drm_i915_private *dev_pr=
iv, enum port port)
>  {
>  	struct intel_digital_port *intel_dig_port;
>  	struct intel_encoder *encoder;
> -	bool init_hdmi, init_dp, init_lspcon =3D false;
> +	bool init_hdmi, init_dp;
>  	enum phy phy =3D intel_port_to_phy(dev_priv, port);
>  =

>  	init_hdmi =3D intel_bios_port_supports_dvi(dev_priv, port) ||
> @@ -4819,7 +4819,6 @@ void intel_ddi_init(struct drm_i915_private *dev_pr=
iv, enum port port)
>  		 * is initialized before lspcon.
>  		 */
>  		init_dp =3D true;
> -		init_lspcon =3D true;
>  		init_hdmi =3D false;
>  		drm_dbg_kms(&dev_priv->drm, "VBT says port %c has lspcon\n",
>  			    port_name(port));
> @@ -4904,22 +4903,6 @@ void intel_ddi_init(struct drm_i915_private *dev_p=
riv, enum port port)
>  			goto err;
>  	}
>  =

> -	if (init_lspcon) {
> -		if (lspcon_init(intel_dig_port))
> -			/* TODO: handle hdmi info frame part */
> -			drm_dbg_kms(&dev_priv->drm,
> -				    "LSPCON init success on port %c\n",
> -				    port_name(port));
> -		else
> -			/*
> -			 * LSPCON init faied, but DP init was success, so
> -			 * lets try to drive as DP++ port.
> -			 */
> -			drm_err(&dev_priv->drm,
> -				"LSPCON init failed on port %c\n",
> -				port_name(port));
> -	}
> -
>  	if (INTEL_GEN(dev_priv) >=3D 11) {
>  		if (intel_phy_is_tc(dev_priv, phy))
>  			intel_dig_port->connected =3D intel_tc_port_connected;
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i9=
15/display/intel_dp.c
> index ed9e53c373a7..398a104158a8 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -5962,15 +5962,14 @@ static enum drm_connector_status
>  intel_dp_detect_dpcd(struct intel_dp *intel_dp)
>  {
>  	struct drm_i915_private *i915 =3D dp_to_i915(intel_dp);
> -	struct intel_lspcon *lspcon =3D dp_to_lspcon(intel_dp);
> +	struct intel_digital_port *dig_port =3D dp_to_dig_port(intel_dp);
>  	u8 *dpcd =3D intel_dp->dpcd;
>  	u8 type;
>  =

>  	if (WARN_ON(intel_dp_is_edp(intel_dp)))
>  		return connector_status_connected;
>  =

> -	if (lspcon->active)
> -		lspcon_resume(lspcon);
> +	lspcon_resume(dig_port);
>  =

>  	if (!intel_dp_get_dpcd(intel_dp))
>  		return connector_status_disconnected;
> @@ -7056,14 +7055,13 @@ void intel_dp_encoder_reset(struct drm_encoder *e=
ncoder)
>  {
>  	struct drm_i915_private *dev_priv =3D to_i915(encoder->dev);
>  	struct intel_dp *intel_dp =3D enc_to_intel_dp(to_intel_encoder(encoder)=
);
> -	struct intel_lspcon *lspcon =3D dp_to_lspcon(intel_dp);
> +	struct intel_digital_port *dig_port =3D dp_to_dig_port(intel_dp);
>  	intel_wakeref_t wakeref;
>  =

>  	if (!HAS_DDI(dev_priv))
>  		intel_dp->DP =3D intel_de_read(dev_priv, intel_dp->output_reg);
>  =

> -	if (lspcon->active)
> -		lspcon_resume(lspcon);
> +	lspcon_resume(dig_port);
>  =

>  	intel_dp->reset_link_params =3D true;
>  =

> diff --git a/drivers/gpu/drm/i915/display/intel_hdmi.c b/drivers/gpu/drm/=
i915/display/intel_hdmi.c
> index 010f37240710..643ad2127931 100644
> --- a/drivers/gpu/drm/i915/display/intel_hdmi.c
> +++ b/drivers/gpu/drm/i915/display/intel_hdmi.c
> @@ -3155,7 +3155,8 @@ void intel_infoframe_init(struct intel_digital_port=
 *intel_dig_port)
>  		intel_dig_port->set_infoframes =3D g4x_set_infoframes;
>  		intel_dig_port->infoframes_enabled =3D g4x_infoframes_enabled;
>  	} else if (HAS_DDI(dev_priv)) {
> -		if (intel_dig_port->lspcon.active) {
> +		if (intel_bios_is_lspcon_present(dev_priv,
> +						 intel_dig_port->base.port)) {
>  			intel_dig_port->write_infoframe =3D lspcon_write_infoframe;
>  			intel_dig_port->read_infoframe =3D lspcon_read_infoframe;
>  			intel_dig_port->set_infoframes =3D lspcon_set_infoframes;
> diff --git a/drivers/gpu/drm/i915/display/intel_lspcon.c b/drivers/gpu/dr=
m/i915/display/intel_lspcon.c
> index 6ff7b226f0a1..e3dde4c25604 100644
> --- a/drivers/gpu/drm/i915/display/intel_lspcon.c
> +++ b/drivers/gpu/drm/i915/display/intel_lspcon.c
> @@ -525,44 +525,17 @@ u32 lspcon_infoframes_enabled(struct intel_encoder =
*encoder,
>  	return 0;
>  }
>  =

> -void lspcon_resume(struct intel_lspcon *lspcon)
> -{
> -	enum drm_lspcon_mode expected_mode;
> -
> -	if (lspcon_wake_native_aux_ch(lspcon)) {
> -		expected_mode =3D DRM_LSPCON_MODE_PCON;
> -		lspcon_resume_in_pcon_wa(lspcon);
> -	} else {
> -		expected_mode =3D DRM_LSPCON_MODE_LS;
> -	}
> -
> -	if (lspcon_wait_mode(lspcon, expected_mode) =3D=3D DRM_LSPCON_MODE_PCON)
> -		return;
> -
> -	if (lspcon_change_mode(lspcon, DRM_LSPCON_MODE_PCON))
> -		DRM_ERROR("LSPCON resume failed\n");
> -	else
> -		DRM_DEBUG_KMS("LSPCON resume success\n");
> -}
> -
>  void lspcon_wait_pcon_mode(struct intel_lspcon *lspcon)
>  {
>  	lspcon_wait_mode(lspcon, DRM_LSPCON_MODE_PCON);
>  }
>  =

> -bool lspcon_init(struct intel_digital_port *intel_dig_port)
> +static bool lspcon_init(struct intel_digital_port *intel_dig_port)
>  {
>  	struct intel_dp *dp =3D &intel_dig_port->dp;
>  	struct intel_lspcon *lspcon =3D &intel_dig_port->lspcon;
> -	struct drm_device *dev =3D intel_dig_port->base.base.dev;
> -	struct drm_i915_private *dev_priv =3D to_i915(dev);
>  	struct drm_connector *connector =3D &dp->attached_connector->base;
>  =

> -	if (!HAS_LSPCON(dev_priv)) {
> -		DRM_ERROR("LSPCON is not supported on this platform\n");
> -		return false;
> -	}
> -
>  	lspcon->active =3D false;
>  	lspcon->mode =3D DRM_LSPCON_MODE_INVALID;
>  =

> @@ -586,3 +559,37 @@ bool lspcon_init(struct intel_digital_port *intel_di=
g_port)
>  	DRM_DEBUG_KMS("Success: LSPCON init\n");
>  	return true;
>  }
> +
> +void lspcon_resume(struct intel_digital_port *intel_dig_port)
> +{
> +	struct intel_lspcon *lspcon =3D &intel_dig_port->lspcon;
> +	struct drm_device *dev =3D intel_dig_port->base.base.dev;
> +	struct drm_i915_private *dev_priv =3D to_i915(dev);
> +	enum drm_lspcon_mode expected_mode;
> +
> +	if (!intel_bios_is_lspcon_present(dev_priv, intel_dig_port->base.port))
> +		return;
> +
> +	if (!lspcon->active) {
> +		if (!lspcon_init(intel_dig_port)) {
> +			DRM_ERROR("LSPCON init failed on port %c\n",
> +				  port_name(intel_dig_port->base.port));
> +			return;
> +		}
> +	}
> +
> +	if (lspcon_wake_native_aux_ch(lspcon)) {
> +		expected_mode =3D DRM_LSPCON_MODE_PCON;
> +		lspcon_resume_in_pcon_wa(lspcon);
> +	} else {
> +		expected_mode =3D DRM_LSPCON_MODE_LS;
> +	}
> +
> +	if (lspcon_wait_mode(lspcon, expected_mode) =3D=3D DRM_LSPCON_MODE_PCON)
> +		return;
> +
> +	if (lspcon_change_mode(lspcon, DRM_LSPCON_MODE_PCON))
> +		DRM_ERROR("LSPCON resume failed\n");
> +	else
> +		DRM_DEBUG_KMS("LSPCON resume success\n");
> +}
> diff --git a/drivers/gpu/drm/i915/display/intel_lspcon.h b/drivers/gpu/dr=
m/i915/display/intel_lspcon.h
> index 37cfddf8a9c5..169db35db13e 100644
> --- a/drivers/gpu/drm/i915/display/intel_lspcon.h
> +++ b/drivers/gpu/drm/i915/display/intel_lspcon.h
> @@ -15,8 +15,7 @@ struct intel_digital_port;
>  struct intel_encoder;
>  struct intel_lspcon;
>  =

> -bool lspcon_init(struct intel_digital_port *intel_dig_port);
> -void lspcon_resume(struct intel_lspcon *lspcon);
> +void lspcon_resume(struct intel_digital_port *intel_dig_port);
>  void lspcon_wait_pcon_mode(struct intel_lspcon *lspcon);
>  void lspcon_write_infoframe(struct intel_encoder *encoder,
>  			    const struct intel_crtc_state *crtc_state,
> -- =

> 2.17.1

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
