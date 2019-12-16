Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DA6D120777
	for <lists+dri-devel@lfdr.de>; Mon, 16 Dec 2019 14:46:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD7F26E563;
	Mon, 16 Dec 2019 13:45:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C60B26E563;
 Mon, 16 Dec 2019 13:45:55 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 16 Dec 2019 05:45:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,321,1571727600"; d="scan'208";a="266257611"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by FMSMGA003.fm.intel.com with SMTP; 16 Dec 2019 05:45:51 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 16 Dec 2019 15:45:51 +0200
Date: Mon, 16 Dec 2019 15:45:51 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH 3/5] drm/i915/dsi: Init panel-enable GPIO to low when the
 LCD is initially off
Message-ID: <20191216134551.GQ1208@intel.com>
References: <20191215163810.52356-1-hdegoede@redhat.com>
 <20191215163810.52356-4-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191215163810.52356-4-hdegoede@redhat.com>
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
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Lee Jones <lee.jones@linaro.org>, intel-gfx <intel-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Dec 15, 2019 at 05:38:08PM +0100, Hans de Goede wrote:
> When the LCD has not been turned on by the firmware/GOP, because e.g. the
> device was booted with an external monitor connected over HDMI, we should
> not turn on the panel-enable GPIO when we request it.
> =

> Turning on the panel-enable GPIO when we request it, means we turn it on
> too early in the init-sequence, which causes some panels to not correctly
> light up.
> =

> This commits adds a panel_is_on parameter to intel_dsi_vbt_gpio_init()
> and makes intel_dsi_vbt_gpio_init() set the initial GPIO value accordingl=
y.
> =

> This fixes the panel not lighting up on a Thundersoft TST168 tablet when
> booted with an external monitor connected over HDMI.
> =

> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/gpu/drm/i915/display/intel_dsi.h     | 2 +-
>  drivers/gpu/drm/i915/display/intel_dsi_vbt.c | 7 +++----
>  drivers/gpu/drm/i915/display/vlv_dsi.c       | 2 +-
>  3 files changed, 5 insertions(+), 6 deletions(-)
> =

> diff --git a/drivers/gpu/drm/i915/display/intel_dsi.h b/drivers/gpu/drm/i=
915/display/intel_dsi.h
> index de7e51cd3460..675771ea91aa 100644
> --- a/drivers/gpu/drm/i915/display/intel_dsi.h
> +++ b/drivers/gpu/drm/i915/display/intel_dsi.h
> @@ -203,7 +203,7 @@ void bxt_dsi_reset_clocks(struct intel_encoder *encod=
er, enum port port);
>  =

>  /* intel_dsi_vbt.c */
>  bool intel_dsi_vbt_init(struct intel_dsi *intel_dsi, u16 panel_id);
> -void intel_dsi_vbt_gpio_init(struct intel_dsi *intel_dsi);
> +void intel_dsi_vbt_gpio_init(struct intel_dsi *intel_dsi, bool panel_is_=
on);
>  void intel_dsi_vbt_gpio_cleanup(struct intel_dsi *intel_dsi);
>  void intel_dsi_vbt_exec_sequence(struct intel_dsi *intel_dsi,
>  				 enum mipi_seq seq_id);
> diff --git a/drivers/gpu/drm/i915/display/intel_dsi_vbt.c b/drivers/gpu/d=
rm/i915/display/intel_dsi_vbt.c
> index 5352e8c9eca5..027970348b22 100644
> --- a/drivers/gpu/drm/i915/display/intel_dsi_vbt.c
> +++ b/drivers/gpu/drm/i915/display/intel_dsi_vbt.c
> @@ -688,17 +688,16 @@ bool intel_dsi_vbt_init(struct intel_dsi *intel_dsi=
, u16 panel_id)
>   * On some BYT/CHT devs some sequences are incomplete and we need to man=
ually
>   * control some GPIOs.
>   */
> -void intel_dsi_vbt_gpio_init(struct intel_dsi *intel_dsi)
> +void intel_dsi_vbt_gpio_init(struct intel_dsi *intel_dsi, bool panel_is_=
on)
>  {
>  	struct drm_device *dev =3D intel_dsi->base.base.dev;
>  	struct drm_i915_private *dev_priv =3D to_i915(dev);
>  	struct mipi_config *mipi_config =3D dev_priv->vbt.dsi.config;
> +	enum gpiod_flags flags =3D panel_is_on ? GPIOD_OUT_HIGH : GPIOD_OUT_LOW;

Can't we just tell it not to change the current setting?

>  =

>  	if ((IS_VALLEYVIEW(dev_priv) || IS_CHERRYVIEW(dev_priv)) &&
>  	    (mipi_config->pwm_blc =3D=3D PPS_BLC_PMIC)) {
> -		intel_dsi->gpio_panel =3D
> -			gpiod_get(dev->dev, "panel", GPIOD_OUT_HIGH);
> -
> +		intel_dsi->gpio_panel =3D gpiod_get(dev->dev, "panel", flags);
>  		if (IS_ERR(intel_dsi->gpio_panel)) {
>  			DRM_ERROR("Failed to own gpio for panel control\n");
>  			intel_dsi->gpio_panel =3D NULL;
> diff --git a/drivers/gpu/drm/i915/display/vlv_dsi.c b/drivers/gpu/drm/i91=
5/display/vlv_dsi.c
> index 178d0fffba5b..e86e4a11e199 100644
> --- a/drivers/gpu/drm/i915/display/vlv_dsi.c
> +++ b/drivers/gpu/drm/i915/display/vlv_dsi.c
> @@ -1910,7 +1910,7 @@ void vlv_dsi_init(struct drm_i915_private *dev_priv)
>  =

>  	vlv_dphy_param_init(intel_dsi);
>  =

> -	intel_dsi_vbt_gpio_init(intel_dsi);
> +	intel_dsi_vbt_gpio_init(intel_dsi, current_mode !=3D NULL);
>  =

>  	drm_connector_init(dev, connector, &intel_dsi_connector_funcs,
>  			   DRM_MODE_CONNECTOR_DSI);
> -- =

> 2.23.0

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
