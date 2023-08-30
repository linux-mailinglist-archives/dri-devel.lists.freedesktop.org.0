Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ECF0F78D5CB
	for <lists+dri-devel@lfdr.de>; Wed, 30 Aug 2023 14:09:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B55D410E51B;
	Wed, 30 Aug 2023 12:09:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4C2910E51A;
 Wed, 30 Aug 2023 12:09:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693397341; x=1724933341;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=x72fj39qKQ8ynFyalUaTxx2A2giTDS/hC6ElISiHQU8=;
 b=FeBDZkkTGQu9X/SxutbDoeVguh3uE8aRdVK7oVSGnHCjsDkLvttFIG+a
 +STtBSr8ij/IGZbHQaYaEvr1oYsqpJfIFqTIorHMmP8naiZY9iNtemW6F
 eQQzSL55W3rGjPSw+caBseVY+/FJIjS+YHvv7OSwnHBAfmXQDJ0TMLtLN
 EV5gd/OAT+Cnq/CCZ+NnZcY1YdU8GI7tJKtmqR7BMTRX4LDA6mVtmZEeL
 Ho3X5Xo5HwTFkIWMg2f1lg+Gbk7hlF4mE0xk6ia0RgIXLFbK+pLpCQa/H
 /9hZyr5X3SjtaUQhFRuP3EykwJB2rNmcrwgz4SIS7a/F44BO95WE3SkyS Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="379374293"
X-IronPort-AV: E=Sophos;i="6.02,213,1688454000"; d="scan'208";a="379374293"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2023 05:08:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; d="scan'208";a="882732226"
Received: from ziemtocx-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.57.251])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2023 05:08:52 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 intel-gfx@lists.freedesktop.org
Subject: Re: [Intel-gfx] [PATCH 09/12] drm/i915/hdmi: Use connector->ddc
 everwhere
In-Reply-To: <20230829113920.13713-10-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230829113920.13713-1-ville.syrjala@linux.intel.com>
 <20230829113920.13713-10-ville.syrjala@linux.intel.com>
Date: Wed, 30 Aug 2023 15:08:44 +0300
Message-ID: <87bkeozq9f.fsf@intel.com>
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
> We already populate connector->ddc for HDMI ports, but
> so far we've not taken full advantage of it. Do that by
> eliminating a bunch of intel_gmbus_get_adapter() lookups.
>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

> ---
>  drivers/gpu/drm/i915/display/intel_ddi.c  |  3 +-
>  drivers/gpu/drm/i915/display/intel_hdmi.c | 37 ++++++++---------------
>  2 files changed, 14 insertions(+), 26 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c b/drivers/gpu/drm/i=
915/display/intel_ddi.c
> index e6cc4dab3201..d86ce93fb57f 100644
> --- a/drivers/gpu/drm/i915/display/intel_ddi.c
> +++ b/drivers/gpu/drm/i915/display/intel_ddi.c
> @@ -4323,8 +4323,7 @@ static int intel_hdmi_reset_link(struct intel_encod=
er *encoder,
>  	struct drm_i915_private *dev_priv =3D to_i915(encoder->base.dev);
>  	struct intel_hdmi *hdmi =3D enc_to_intel_hdmi(encoder);
>  	struct intel_connector *connector =3D hdmi->attached_connector;
> -	struct i2c_adapter *ddc =3D
> -		intel_gmbus_get_adapter(dev_priv, hdmi->ddc_bus);
> +	struct i2c_adapter *ddc =3D connector->base.ddc;
>  	struct drm_connector_state *conn_state;
>  	struct intel_crtc_state *crtc_state;
>  	struct intel_crtc *crtc;
> diff --git a/drivers/gpu/drm/i915/display/intel_hdmi.c b/drivers/gpu/drm/=
i915/display/intel_hdmi.c
> index 82f9a40b34e3..efa9bb93cfb1 100644
> --- a/drivers/gpu/drm/i915/display/intel_hdmi.c
> +++ b/drivers/gpu/drm/i915/display/intel_hdmi.c
> @@ -1240,7 +1240,7 @@ static void hsw_set_infoframes(struct intel_encoder=
 *encoder,
>  void intel_dp_dual_mode_set_tmds_output(struct intel_hdmi *hdmi, bool en=
able)
>  {
>  	struct drm_i915_private *dev_priv =3D intel_hdmi_to_i915(hdmi);
> -	struct i2c_adapter *ddc =3D intel_gmbus_get_adapter(dev_priv, hdmi->ddc=
_bus);
> +	struct i2c_adapter *ddc =3D hdmi->attached_connector->base.ddc;
>=20=20
>  	if (hdmi->dp_dual_mode.type < DRM_DP_DUAL_MODE_TYPE2_DVI)
>  		return;
> @@ -1255,9 +1255,8 @@ void intel_dp_dual_mode_set_tmds_output(struct inte=
l_hdmi *hdmi, bool enable)
>  static int intel_hdmi_hdcp_read(struct intel_digital_port *dig_port,
>  				unsigned int offset, void *buffer, size_t size)
>  {
> -	struct drm_i915_private *i915 =3D to_i915(dig_port->base.base.dev);
>  	struct intel_hdmi *hdmi =3D &dig_port->hdmi;
> -	struct i2c_adapter *ddc =3D intel_gmbus_get_adapter(i915, hdmi->ddc_bus=
);
> +	struct i2c_adapter *ddc =3D hdmi->attached_connector->base.ddc;
>  	int ret;
>  	u8 start =3D offset & 0xff;
>  	struct i2c_msg msgs[] =3D {
> @@ -1283,9 +1282,8 @@ static int intel_hdmi_hdcp_read(struct intel_digita=
l_port *dig_port,
>  static int intel_hdmi_hdcp_write(struct intel_digital_port *dig_port,
>  				 unsigned int offset, void *buffer, size_t size)
>  {
> -	struct drm_i915_private *i915 =3D to_i915(dig_port->base.base.dev);
>  	struct intel_hdmi *hdmi =3D &dig_port->hdmi;
> -	struct i2c_adapter *ddc =3D intel_gmbus_get_adapter(i915, hdmi->ddc_bus=
);
> +	struct i2c_adapter *ddc =3D hdmi->attached_connector->base.ddc;
>  	int ret;
>  	u8 *write_buf;
>  	struct i2c_msg msg;
> @@ -1318,7 +1316,7 @@ int intel_hdmi_hdcp_write_an_aksv(struct intel_digi=
tal_port *dig_port,
>  {
>  	struct drm_i915_private *i915 =3D to_i915(dig_port->base.base.dev);
>  	struct intel_hdmi *hdmi =3D &dig_port->hdmi;
> -	struct i2c_adapter *ddc =3D intel_gmbus_get_adapter(i915, hdmi->ddc_bus=
);
> +	struct i2c_adapter *ddc =3D hdmi->attached_connector->base.ddc;
>  	int ret;
>=20=20
>  	ret =3D intel_hdmi_hdcp_write(dig_port, DRM_HDCP_DDC_AN, an,
> @@ -2398,8 +2396,10 @@ intel_hdmi_dp_dual_mode_detect(struct drm_connecto=
r *connector)
>  	struct drm_i915_private *dev_priv =3D to_i915(connector->dev);
>  	struct intel_hdmi *hdmi =3D intel_attached_hdmi(to_intel_connector(conn=
ector));
>  	struct intel_encoder *encoder =3D &hdmi_to_dig_port(hdmi)->base;
> -	struct i2c_adapter *ddc =3D intel_gmbus_get_adapter(dev_priv, hdmi->ddc=
_bus);
> -	enum drm_dp_dual_mode_type type =3D drm_dp_dual_mode_detect(&dev_priv->=
drm, ddc);
> +	struct i2c_adapter *ddc =3D connector->ddc;
> +	enum drm_dp_dual_mode_type type;
> +
> +	type =3D drm_dp_dual_mode_detect(&dev_priv->drm, ddc);
>=20=20
>  	/*
>  	 * Type 1 DVI adaptors are not required to implement any
> @@ -2447,7 +2447,7 @@ intel_hdmi_set_edid(struct drm_connector *connector)
>  {
>  	struct drm_i915_private *dev_priv =3D to_i915(connector->dev);
>  	struct intel_hdmi *intel_hdmi =3D intel_attached_hdmi(to_intel_connecto=
r(connector));
> -	struct i2c_adapter *ddc =3D intel_gmbus_get_adapter(dev_priv, intel_hdm=
i->ddc_bus);
> +	struct i2c_adapter *ddc =3D connector->ddc;
>  	intel_wakeref_t wakeref;
>  	const struct drm_edid *drm_edid;
>  	const struct edid *edid;
> @@ -2544,19 +2544,10 @@ static int intel_hdmi_get_modes(struct drm_connec=
tor *connector)
>  	return drm_edid_connector_add_modes(connector);
>  }
>=20=20
> -static struct i2c_adapter *
> -intel_hdmi_get_i2c_adapter(struct drm_connector *connector)
> -{
> -	struct drm_i915_private *dev_priv =3D to_i915(connector->dev);
> -	struct intel_hdmi *intel_hdmi =3D intel_attached_hdmi(to_intel_connecto=
r(connector));
> -
> -	return intel_gmbus_get_adapter(dev_priv, intel_hdmi->ddc_bus);
> -}
> -
>  static void intel_hdmi_create_i2c_symlink(struct drm_connector *connecto=
r)
>  {
>  	struct drm_i915_private *i915 =3D to_i915(connector->dev);
> -	struct i2c_adapter *ddc =3D intel_hdmi_get_i2c_adapter(connector);
> +	struct i2c_adapter *ddc =3D connector->ddc;
>  	struct kobject *i2c_kobj =3D &ddc->dev.kobj;
>  	struct kobject *connector_kobj =3D &connector->kdev->kobj;
>  	int ret;
> @@ -2568,7 +2559,7 @@ static void intel_hdmi_create_i2c_symlink(struct dr=
m_connector *connector)
>=20=20
>  static void intel_hdmi_remove_i2c_symlink(struct drm_connector *connecto=
r)
>  {
> -	struct i2c_adapter *ddc =3D intel_hdmi_get_i2c_adapter(connector);
> +	struct i2c_adapter *ddc =3D connector->ddc;
>  	struct kobject *i2c_kobj =3D &ddc->dev.kobj;
>  	struct kobject *connector_kobj =3D &connector->kdev->kobj;
>=20=20
> @@ -3007,7 +2998,6 @@ void intel_hdmi_init_connector(struct intel_digital=
_port *dig_port,
>  	struct intel_encoder *intel_encoder =3D &dig_port->base;
>  	struct drm_device *dev =3D intel_encoder->base.dev;
>  	struct drm_i915_private *dev_priv =3D to_i915(dev);
> -	struct i2c_adapter *ddc;
>  	enum port port =3D intel_encoder->port;
>  	struct cec_connector_info conn_info;
>=20=20
> @@ -3028,12 +3018,11 @@ void intel_hdmi_init_connector(struct intel_digit=
al_port *dig_port,
>  	if (!intel_hdmi->ddc_bus)
>  		return;
>=20=20
> -	ddc =3D intel_gmbus_get_adapter(dev_priv, intel_hdmi->ddc_bus);
> -
>  	drm_connector_init_with_ddc(dev, connector,
>  				    &intel_hdmi_connector_funcs,
>  				    DRM_MODE_CONNECTOR_HDMIA,
> -				    ddc);
> +				    intel_gmbus_get_adapter(dev_priv, intel_hdmi->ddc_bus));
> +
>  	drm_connector_helper_add(connector, &intel_hdmi_connector_helper_funcs);
>=20=20
>  	if (DISPLAY_VER(dev_priv) < 12)

--=20
Jani Nikula, Intel Open Source Graphics Center
