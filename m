Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F3F578D57A
	for <lists+dri-devel@lfdr.de>; Wed, 30 Aug 2023 13:19:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8D9B10E4F5;
	Wed, 30 Aug 2023 11:19:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 919A710E12F;
 Wed, 30 Aug 2023 11:19:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693394378; x=1724930378;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=/RPJwV/HOkSk+ghhx++giuU8oLv9bHOPgzmO+fBa9iY=;
 b=QpC4uAQvkZ2RJfU3bBVhE0e9RbYuZ7wruMKDEr34DATn0LZsGC7xc69X
 3UqMtPDde3wvmnFpdTerbryr0Edr3c/rQWrMieDX12w4InMUs+odSBeKl
 2GfydxATaUpWXj5NTXcEYszMVmkEM8ymxcRkMP+KeVK80qgYjNOScW8Gg
 UG41ZAuYDiWp95dm/ff72NdFPhxap0UfhZB5PA4mxu4aulwvgVAJiqFS+
 l4iT0kU/oqHsDP2mtU2CClMlPjJMLftxncpIQ9ELBtlPSan557h2V2iPW
 VUXY4uZj3WnAavHoBTezhJIJqqjROQDVmepb7dnKgh/sdqL27cuA37IUX w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="374525910"
X-IronPort-AV: E=Sophos;i="6.02,213,1688454000"; d="scan'208";a="374525910"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2023 04:19:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="829198503"
X-IronPort-AV: E=Sophos;i="6.02,213,1688454000"; d="scan'208";a="829198503"
Received: from ziemtocx-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.57.251])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2023 04:19:36 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 intel-gfx@lists.freedesktop.org
Subject: Re: [PATCH 03/12] drm/i915: Call the DDC bus i2c adapter "ddc"
In-Reply-To: <20230829113920.13713-4-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230829113920.13713-1-ville.syrjala@linux.intel.com>
 <20230829113920.13713-4-ville.syrjala@linux.intel.com>
Date: Wed, 30 Aug 2023 14:19:34 +0300
Message-ID: <878r9s22wp.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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

On Tue, 29 Aug 2023, Ville Syrjala <ville.syrjala@linux.intel.com> wrote:
> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>
> Rename the various names we've used for the DDC bus
> i2c adapter ("i2c", "adapter", etc.) to just "ddc".
> This differentiates it from the various other i2c
> busses we might have (DSI panel stuff, DVO control bus, etc.).
>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> ---
>  .../gpu/drm/i915/display/intel_connector.c    |  6 +--
>  .../gpu/drm/i915/display/intel_connector.h    |  2 +-
>  drivers/gpu/drm/i915/display/intel_crt.c      | 32 ++++++------
>  drivers/gpu/drm/i915/display/intel_ddi.c      |  4 +-
>  drivers/gpu/drm/i915/display/intel_hdmi.c     | 51 +++++++++----------
>  drivers/gpu/drm/i915/display/intel_lspcon.c   | 14 ++---
>  6 files changed, 52 insertions(+), 57 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_connector.c b/drivers/gpu=
/drm/i915/display/intel_connector.c
> index ff3bcadebe59..c65887870ddc 100644
> --- a/drivers/gpu/drm/i915/display/intel_connector.c
> +++ b/drivers/gpu/drm/i915/display/intel_connector.c
> @@ -192,17 +192,17 @@ int intel_connector_update_modes(struct drm_connect=
or *connector,
>  /**
>   * intel_ddc_get_modes - get modelist from monitor
>   * @connector: DRM connector device to use
> - * @adapter: i2c adapter
> + * @ddc: DDC bus i2c adapter
>   *
>   * Fetch the EDID information from @connector using the DDC bus.
>   */
>  int intel_ddc_get_modes(struct drm_connector *connector,
> -			struct i2c_adapter *adapter)
> +			struct i2c_adapter *ddc)
>  {
>  	const struct drm_edid *drm_edid;
>  	int ret;
>=20=20
> -	drm_edid =3D drm_edid_read_ddc(connector, adapter);
> +	drm_edid =3D drm_edid_read_ddc(connector, ddc);
>  	if (!drm_edid)
>  		return 0;
>=20=20
> diff --git a/drivers/gpu/drm/i915/display/intel_connector.h b/drivers/gpu=
/drm/i915/display/intel_connector.h
> index aaf7281462dc..bafde3f11ff4 100644
> --- a/drivers/gpu/drm/i915/display/intel_connector.h
> +++ b/drivers/gpu/drm/i915/display/intel_connector.h
> @@ -26,7 +26,7 @@ bool intel_connector_get_hw_state(struct intel_connecto=
r *connector);
>  enum pipe intel_connector_get_pipe(struct intel_connector *connector);
>  int intel_connector_update_modes(struct drm_connector *connector,
>  				 const struct drm_edid *drm_edid);
> -int intel_ddc_get_modes(struct drm_connector *c, struct i2c_adapter *ada=
pter);
> +int intel_ddc_get_modes(struct drm_connector *c, struct i2c_adapter *ddc=
);
>  void intel_attach_force_audio_property(struct drm_connector *connector);
>  void intel_attach_broadcast_rgb_property(struct drm_connector *connector=
);
>  void intel_attach_aspect_ratio_property(struct drm_connector *connector);
> diff --git a/drivers/gpu/drm/i915/display/intel_crt.c b/drivers/gpu/drm/i=
915/display/intel_crt.c
> index f66340b4caf0..8145511bd5c3 100644
> --- a/drivers/gpu/drm/i915/display/intel_crt.c
> +++ b/drivers/gpu/drm/i915/display/intel_crt.c
> @@ -610,18 +610,18 @@ static bool intel_crt_detect_hotplug(struct drm_con=
nector *connector)
>  }
>=20=20
>  static const struct drm_edid *intel_crt_get_edid(struct drm_connector *c=
onnector,
> -						 struct i2c_adapter *i2c)
> +						 struct i2c_adapter *ddc)
>  {
>  	const struct drm_edid *drm_edid;
>=20=20
> -	drm_edid =3D drm_edid_read_ddc(connector, i2c);
> +	drm_edid =3D drm_edid_read_ddc(connector, ddc);
>=20=20
> -	if (!drm_edid && !intel_gmbus_is_forced_bit(i2c)) {
> +	if (!drm_edid && !intel_gmbus_is_forced_bit(ddc)) {
>  		drm_dbg_kms(connector->dev,
>  			    "CRT GMBUS EDID read failed, retry using GPIO bit-banging\n");
> -		intel_gmbus_force_bit(i2c, true);
> -		drm_edid =3D drm_edid_read_ddc(connector, i2c);
> -		intel_gmbus_force_bit(i2c, false);
> +		intel_gmbus_force_bit(ddc, true);
> +		drm_edid =3D drm_edid_read_ddc(connector, ddc);
> +		intel_gmbus_force_bit(ddc, false);
>  	}
>=20=20
>  	return drm_edid;
> @@ -629,12 +629,12 @@ static const struct drm_edid *intel_crt_get_edid(st=
ruct drm_connector *connector
>=20=20
>  /* local version of intel_ddc_get_modes() to use intel_crt_get_edid() */
>  static int intel_crt_ddc_get_modes(struct drm_connector *connector,
> -				struct i2c_adapter *adapter)
> +				   struct i2c_adapter *ddc)
>  {
>  	const struct drm_edid *drm_edid;
>  	int ret;
>=20=20
> -	drm_edid =3D intel_crt_get_edid(connector, adapter);
> +	drm_edid =3D intel_crt_get_edid(connector, ddc);
>  	if (!drm_edid)
>  		return 0;
>=20=20
> @@ -650,11 +650,11 @@ static bool intel_crt_detect_ddc(struct drm_connect=
or *connector)
>  	struct intel_crt *crt =3D intel_attached_crt(to_intel_connector(connect=
or));
>  	struct drm_i915_private *dev_priv =3D to_i915(crt->base.base.dev);
>  	const struct drm_edid *drm_edid;
> -	struct i2c_adapter *i2c;
> +	struct i2c_adapter *ddc;
>  	bool ret =3D false;
>=20=20
> -	i2c =3D intel_gmbus_get_adapter(dev_priv, dev_priv->display.vbt.crt_ddc=
_pin);
> -	drm_edid =3D intel_crt_get_edid(connector, i2c);
> +	ddc =3D intel_gmbus_get_adapter(dev_priv, dev_priv->display.vbt.crt_ddc=
_pin);
> +	drm_edid =3D intel_crt_get_edid(connector, ddc);
>=20=20
>  	if (drm_edid) {
>  		const struct edid *edid =3D drm_edid_raw(drm_edid);
> @@ -917,20 +917,20 @@ static int intel_crt_get_modes(struct drm_connector=
 *connector)
>  	struct intel_crt *crt =3D intel_attached_crt(to_intel_connector(connect=
or));
>  	struct intel_encoder *intel_encoder =3D &crt->base;
>  	intel_wakeref_t wakeref;
> -	struct i2c_adapter *i2c;
> +	struct i2c_adapter *ddc;
>  	int ret;
>=20=20
>  	wakeref =3D intel_display_power_get(dev_priv,
>  					  intel_encoder->power_domain);
>=20=20
> -	i2c =3D intel_gmbus_get_adapter(dev_priv, dev_priv->display.vbt.crt_ddc=
_pin);
> -	ret =3D intel_crt_ddc_get_modes(connector, i2c);
> +	ddc =3D intel_gmbus_get_adapter(dev_priv, dev_priv->display.vbt.crt_ddc=
_pin);
> +	ret =3D intel_crt_ddc_get_modes(connector, ddc);
>  	if (ret || !IS_G4X(dev_priv))
>  		goto out;
>=20=20
>  	/* Try to probe digital port for output in DVI-I -> VGA mode. */
> -	i2c =3D intel_gmbus_get_adapter(dev_priv, GMBUS_PIN_DPB);
> -	ret =3D intel_crt_ddc_get_modes(connector, i2c);
> +	ddc =3D intel_gmbus_get_adapter(dev_priv, GMBUS_PIN_DPB);
> +	ret =3D intel_crt_ddc_get_modes(connector, ddc);
>=20=20
>  out:
>  	intel_display_power_put(dev_priv, intel_encoder->power_domain, wakeref);
> diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c b/drivers/gpu/drm/i=
915/display/intel_ddi.c
> index b7f4281b8658..e6cc4dab3201 100644
> --- a/drivers/gpu/drm/i915/display/intel_ddi.c
> +++ b/drivers/gpu/drm/i915/display/intel_ddi.c
> @@ -4323,7 +4323,7 @@ static int intel_hdmi_reset_link(struct intel_encod=
er *encoder,
>  	struct drm_i915_private *dev_priv =3D to_i915(encoder->base.dev);
>  	struct intel_hdmi *hdmi =3D enc_to_intel_hdmi(encoder);
>  	struct intel_connector *connector =3D hdmi->attached_connector;
> -	struct i2c_adapter *adapter =3D
> +	struct i2c_adapter *ddc =3D
>  		intel_gmbus_get_adapter(dev_priv, hdmi->ddc_bus);
>  	struct drm_connector_state *conn_state;
>  	struct intel_crtc_state *crtc_state;
> @@ -4365,7 +4365,7 @@ static int intel_hdmi_reset_link(struct intel_encod=
er *encoder,
>  	    !try_wait_for_completion(&conn_state->commit->hw_done))
>  		return 0;
>=20=20
> -	ret =3D drm_scdc_readb(adapter, SCDC_TMDS_CONFIG, &config);
> +	ret =3D drm_scdc_readb(ddc, SCDC_TMDS_CONFIG, &config);
>  	if (ret < 0) {
>  		drm_err(&dev_priv->drm, "[CONNECTOR:%d:%s] Failed to read TMDS config:=
 %d\n",
>  			connector->base.base.id, connector->base.name, ret);
> diff --git a/drivers/gpu/drm/i915/display/intel_hdmi.c b/drivers/gpu/drm/=
i915/display/intel_hdmi.c
> index 116556d6352a..82f9a40b34e3 100644
> --- a/drivers/gpu/drm/i915/display/intel_hdmi.c
> +++ b/drivers/gpu/drm/i915/display/intel_hdmi.c
> @@ -1240,17 +1240,16 @@ static void hsw_set_infoframes(struct intel_encod=
er *encoder,
>  void intel_dp_dual_mode_set_tmds_output(struct intel_hdmi *hdmi, bool en=
able)
>  {
>  	struct drm_i915_private *dev_priv =3D intel_hdmi_to_i915(hdmi);
> -	struct i2c_adapter *adapter;
> +	struct i2c_adapter *ddc =3D intel_gmbus_get_adapter(dev_priv, hdmi->ddc=
_bus);
>=20=20
>  	if (hdmi->dp_dual_mode.type < DRM_DP_DUAL_MODE_TYPE2_DVI)
>  		return;
>=20=20
> -	adapter =3D intel_gmbus_get_adapter(dev_priv, hdmi->ddc_bus);
> -
>  	drm_dbg_kms(&dev_priv->drm, "%s DP dual mode adaptor TMDS output\n",
>  		    enable ? "Enabling" : "Disabling");
>=20=20
> -	drm_dp_dual_mode_set_tmds_output(&dev_priv->drm, hdmi->dp_dual_mode.typ=
e, adapter, enable);
> +	drm_dp_dual_mode_set_tmds_output(&dev_priv->drm,
> +					 hdmi->dp_dual_mode.type, ddc, enable);
>  }
>=20=20
>  static int intel_hdmi_hdcp_read(struct intel_digital_port *dig_port,
> @@ -1258,8 +1257,7 @@ static int intel_hdmi_hdcp_read(struct intel_digita=
l_port *dig_port,
>  {
>  	struct drm_i915_private *i915 =3D to_i915(dig_port->base.base.dev);
>  	struct intel_hdmi *hdmi =3D &dig_port->hdmi;
> -	struct i2c_adapter *adapter =3D intel_gmbus_get_adapter(i915,
> -							      hdmi->ddc_bus);
> +	struct i2c_adapter *ddc =3D intel_gmbus_get_adapter(i915, hdmi->ddc_bus=
);
>  	int ret;
>  	u8 start =3D offset & 0xff;
>  	struct i2c_msg msgs[] =3D {
> @@ -1276,7 +1274,7 @@ static int intel_hdmi_hdcp_read(struct intel_digita=
l_port *dig_port,
>  			.buf =3D buffer
>  		}
>  	};
> -	ret =3D i2c_transfer(adapter, msgs, ARRAY_SIZE(msgs));
> +	ret =3D i2c_transfer(ddc, msgs, ARRAY_SIZE(msgs));
>  	if (ret =3D=3D ARRAY_SIZE(msgs))
>  		return 0;
>  	return ret >=3D 0 ? -EIO : ret;
> @@ -1287,8 +1285,7 @@ static int intel_hdmi_hdcp_write(struct intel_digit=
al_port *dig_port,
>  {
>  	struct drm_i915_private *i915 =3D to_i915(dig_port->base.base.dev);
>  	struct intel_hdmi *hdmi =3D &dig_port->hdmi;
> -	struct i2c_adapter *adapter =3D intel_gmbus_get_adapter(i915,
> -							      hdmi->ddc_bus);
> +	struct i2c_adapter *ddc =3D intel_gmbus_get_adapter(i915, hdmi->ddc_bus=
);
>  	int ret;
>  	u8 *write_buf;
>  	struct i2c_msg msg;
> @@ -1305,7 +1302,7 @@ static int intel_hdmi_hdcp_write(struct intel_digit=
al_port *dig_port,
>  	msg.len =3D size + 1,
>  	msg.buf =3D write_buf;
>=20=20
> -	ret =3D i2c_transfer(adapter, &msg, 1);
> +	ret =3D i2c_transfer(ddc, &msg, 1);
>  	if (ret =3D=3D 1)
>  		ret =3D 0;
>  	else if (ret >=3D 0)
> @@ -1321,8 +1318,7 @@ int intel_hdmi_hdcp_write_an_aksv(struct intel_digi=
tal_port *dig_port,
>  {
>  	struct drm_i915_private *i915 =3D to_i915(dig_port->base.base.dev);
>  	struct intel_hdmi *hdmi =3D &dig_port->hdmi;
> -	struct i2c_adapter *adapter =3D intel_gmbus_get_adapter(i915,
> -							      hdmi->ddc_bus);
> +	struct i2c_adapter *ddc =3D intel_gmbus_get_adapter(i915, hdmi->ddc_bus=
);
>  	int ret;
>=20=20
>  	ret =3D intel_hdmi_hdcp_write(dig_port, DRM_HDCP_DDC_AN, an,
> @@ -1333,7 +1329,7 @@ int intel_hdmi_hdcp_write_an_aksv(struct intel_digi=
tal_port *dig_port,
>  		return ret;
>  	}
>=20=20
> -	ret =3D intel_gmbus_output_aksv(adapter);
> +	ret =3D intel_gmbus_output_aksv(ddc);
>  	if (ret < 0) {
>  		drm_dbg_kms(&i915->drm, "Failed to output aksv (%d)\n", ret);
>  		return ret;
> @@ -2402,9 +2398,8 @@ intel_hdmi_dp_dual_mode_detect(struct drm_connector=
 *connector)
>  	struct drm_i915_private *dev_priv =3D to_i915(connector->dev);
>  	struct intel_hdmi *hdmi =3D intel_attached_hdmi(to_intel_connector(conn=
ector));
>  	struct intel_encoder *encoder =3D &hdmi_to_dig_port(hdmi)->base;
> -	struct i2c_adapter *adapter =3D
> -		intel_gmbus_get_adapter(dev_priv, hdmi->ddc_bus);
> -	enum drm_dp_dual_mode_type type =3D drm_dp_dual_mode_detect(&dev_priv->=
drm, adapter);
> +	struct i2c_adapter *ddc =3D intel_gmbus_get_adapter(dev_priv, hdmi->ddc=
_bus);
> +	enum drm_dp_dual_mode_type type =3D drm_dp_dual_mode_detect(&dev_priv->=
drm, ddc);
>=20=20
>  	/*
>  	 * Type 1 DVI adaptors are not required to implement any
> @@ -2431,7 +2426,7 @@ intel_hdmi_dp_dual_mode_detect(struct drm_connector=
 *connector)
>=20=20
>  	hdmi->dp_dual_mode.type =3D type;
>  	hdmi->dp_dual_mode.max_tmds_clock =3D
> -		drm_dp_dual_mode_max_tmds_clock(&dev_priv->drm, type, adapter);
> +		drm_dp_dual_mode_max_tmds_clock(&dev_priv->drm, type, ddc);
>=20=20
>  	drm_dbg_kms(&dev_priv->drm,
>  		    "DP dual mode adaptor (%s) detected (max TMDS clock: %d kHz)\n",
> @@ -2452,24 +2447,24 @@ intel_hdmi_set_edid(struct drm_connector *connect=
or)
>  {
>  	struct drm_i915_private *dev_priv =3D to_i915(connector->dev);
>  	struct intel_hdmi *intel_hdmi =3D intel_attached_hdmi(to_intel_connecto=
r(connector));
> +	struct i2c_adapter *ddc =3D intel_gmbus_get_adapter(dev_priv, intel_hdm=
i->ddc_bus);
>  	intel_wakeref_t wakeref;
>  	const struct drm_edid *drm_edid;
>  	const struct edid *edid;
>  	bool connected =3D false;
> -	struct i2c_adapter *i2c;
>=20=20
>  	wakeref =3D intel_display_power_get(dev_priv, POWER_DOMAIN_GMBUS);
>=20=20
> -	i2c =3D intel_gmbus_get_adapter(dev_priv, intel_hdmi->ddc_bus);
> +	edid =3D drm_get_edid(connector, ddc);

Must be a rebase fail.

BR,
Jani.

>=20=20
> -	drm_edid =3D drm_edid_read_ddc(connector, i2c);
> +	drm_edid =3D drm_edid_read_ddc(connector, ddc);
>=20=20
> -	if (!drm_edid && !intel_gmbus_is_forced_bit(i2c)) {
> +	if (!drm_edid && !intel_gmbus_is_forced_bit(ddc)) {
>  		drm_dbg_kms(&dev_priv->drm,
>  			    "HDMI GMBUS EDID read failed, retry using GPIO bit-banging\n");
> -		intel_gmbus_force_bit(i2c, true);
> -		drm_edid =3D drm_edid_read_ddc(connector, i2c);
> -		intel_gmbus_force_bit(i2c, false);
> +		intel_gmbus_force_bit(ddc, true);
> +		drm_edid =3D drm_edid_read_ddc(connector, ddc);
> +		intel_gmbus_force_bit(ddc, false);
>  	}
>=20=20
>  	/* Below we depend on display info having been updated */
> @@ -2561,8 +2556,8 @@ intel_hdmi_get_i2c_adapter(struct drm_connector *co=
nnector)
>  static void intel_hdmi_create_i2c_symlink(struct drm_connector *connecto=
r)
>  {
>  	struct drm_i915_private *i915 =3D to_i915(connector->dev);
> -	struct i2c_adapter *adapter =3D intel_hdmi_get_i2c_adapter(connector);
> -	struct kobject *i2c_kobj =3D &adapter->dev.kobj;
> +	struct i2c_adapter *ddc =3D intel_hdmi_get_i2c_adapter(connector);
> +	struct kobject *i2c_kobj =3D &ddc->dev.kobj;
>  	struct kobject *connector_kobj =3D &connector->kdev->kobj;
>  	int ret;
>=20=20
> @@ -2573,8 +2568,8 @@ static void intel_hdmi_create_i2c_symlink(struct dr=
m_connector *connector)
>=20=20
>  static void intel_hdmi_remove_i2c_symlink(struct drm_connector *connecto=
r)
>  {
> -	struct i2c_adapter *adapter =3D intel_hdmi_get_i2c_adapter(connector);
> -	struct kobject *i2c_kobj =3D &adapter->dev.kobj;
> +	struct i2c_adapter *ddc =3D intel_hdmi_get_i2c_adapter(connector);
> +	struct kobject *i2c_kobj =3D &ddc->dev.kobj;
>  	struct kobject *connector_kobj =3D &connector->kdev->kobj;
>=20=20
>  	sysfs_remove_link(connector_kobj, i2c_kobj->name);
> diff --git a/drivers/gpu/drm/i915/display/intel_lspcon.c b/drivers/gpu/dr=
m/i915/display/intel_lspcon.c
> index bb3b5355a0d9..152a22a8ffd2 100644
> --- a/drivers/gpu/drm/i915/display/intel_lspcon.c
> +++ b/drivers/gpu/drm/i915/display/intel_lspcon.c
> @@ -144,9 +144,9 @@ static enum drm_lspcon_mode lspcon_get_current_mode(s=
truct intel_lspcon *lspcon)
>  	struct intel_dp *intel_dp =3D lspcon_to_intel_dp(lspcon);
>  	struct drm_i915_private *i915 =3D dp_to_i915(intel_dp);
>  	enum drm_lspcon_mode current_mode;
> -	struct i2c_adapter *adapter =3D &intel_dp->aux.ddc;
> +	struct i2c_adapter *ddc =3D &intel_dp->aux.ddc;
>=20=20
> -	if (drm_lspcon_get_mode(intel_dp->aux.drm_dev, adapter, &current_mode))=
 {
> +	if (drm_lspcon_get_mode(intel_dp->aux.drm_dev, ddc, &current_mode)) {
>  		drm_dbg_kms(&i915->drm, "Error reading LSPCON mode\n");
>  		return DRM_LSPCON_MODE_INVALID;
>  	}
> @@ -185,9 +185,9 @@ static int lspcon_change_mode(struct intel_lspcon *ls=
pcon,
>  	struct drm_i915_private *i915 =3D dp_to_i915(intel_dp);
>  	int err;
>  	enum drm_lspcon_mode current_mode;
> -	struct i2c_adapter *adapter =3D &intel_dp->aux.ddc;
> +	struct i2c_adapter *ddc =3D &intel_dp->aux.ddc;
>=20=20
> -	err =3D drm_lspcon_get_mode(intel_dp->aux.drm_dev, adapter, &current_mo=
de);
> +	err =3D drm_lspcon_get_mode(intel_dp->aux.drm_dev, ddc, &current_mode);
>  	if (err) {
>  		drm_err(&i915->drm, "Error reading LSPCON mode\n");
>  		return err;
> @@ -198,7 +198,7 @@ static int lspcon_change_mode(struct intel_lspcon *ls=
pcon,
>  		return 0;
>  	}
>=20=20
> -	err =3D drm_lspcon_set_mode(intel_dp->aux.drm_dev, adapter, mode);
> +	err =3D drm_lspcon_set_mode(intel_dp->aux.drm_dev, ddc, mode);
>  	if (err < 0) {
>  		drm_err(&i915->drm, "LSPCON mode change failed\n");
>  		return err;
> @@ -233,7 +233,7 @@ static bool lspcon_probe(struct intel_lspcon *lspcon)
>  	enum drm_dp_dual_mode_type adaptor_type;
>  	struct intel_dp *intel_dp =3D lspcon_to_intel_dp(lspcon);
>  	struct drm_i915_private *i915 =3D dp_to_i915(intel_dp);
> -	struct i2c_adapter *adapter =3D &intel_dp->aux.ddc;
> +	struct i2c_adapter *ddc =3D &intel_dp->aux.ddc;
>  	enum drm_lspcon_mode expected_mode;
>=20=20
>  	expected_mode =3D lspcon_wake_native_aux_ch(lspcon) ?
> @@ -244,7 +244,7 @@ static bool lspcon_probe(struct intel_lspcon *lspcon)
>  		if (retry)
>  			usleep_range(500, 1000);
>=20=20
> -		adaptor_type =3D drm_dp_dual_mode_detect(intel_dp->aux.drm_dev, adapte=
r);
> +		adaptor_type =3D drm_dp_dual_mode_detect(intel_dp->aux.drm_dev, ddc);
>  		if (adaptor_type =3D=3D DRM_DP_DUAL_MODE_LSPCON)
>  			break;
>  	}

--=20
Jani Nikula, Intel Open Source Graphics Center
