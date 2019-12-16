Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F05FE120751
	for <lists+dri-devel@lfdr.de>; Mon, 16 Dec 2019 14:38:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD8A86E195;
	Mon, 16 Dec 2019 13:38:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D295A6E530;
 Mon, 16 Dec 2019 13:38:28 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 16 Dec 2019 05:38:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,321,1571727600"; d="scan'208";a="205110373"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by orsmga007.jf.intel.com with SMTP; 16 Dec 2019 05:38:24 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 16 Dec 2019 15:38:23 +0200
Date: Mon, 16 Dec 2019 15:38:23 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH 1/2] drm/i915/dsi: Remove readback of panel orientation
 on BYT / CHT
Message-ID: <20191216133823.GO1208@intel.com>
References: <20191215213307.689830-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191215213307.689830-1-hdegoede@redhat.com>
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
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Dec 15, 2019 at 10:33:06PM +0100, Hans de Goede wrote:
> Commit 82daca297506 ("drm/i915: Add "panel orientation" property to the
> panel connector, v6.") uses hardware state readback to determine if the
> GOP is rotating the image by 180 degrees to compensate for upside-down
> mounted panels.
> =

> When I wrote that commit I tried to find the VBT bits the GOP used to
> decide to rotate the image, but I could not find them. Back then I only
> looked at the rotation bits in struct mipi_config and these read 0 on
> the 1 BYT device I have with an upside-down mounted panel
> (a GP-electronic T701 tablet). While working on a similar problem on a
> BYT device with an eDP panel I noticed that the new
> intel_dsi_get_panel_orientation() helper which gets used on newer
> SoCs (Apollo-Lake, etc.) checks the rotate_180 bit in the
> BDB_GENERAL_FEATURES VBT block.
> =

> I've checked and this bit indeed is set on the GP-electronic T701 tablet,
> so using the generic intel_dsi_get_panel_orientation() helper there does
> the right thing without needing any extra readback of hw state.
> =

> This commit removes the special handling of the panel orientation for
> DSI panels on BYT/CHT devices, bringing the handling in line with the
> handling of DSI panels on other devices.
> =

> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

Same as
https://patchwork.freedesktop.org/patch/257787/?series=3D51274&rev=3D4
which I apparently never pushed. But feel free to go with your version
since you have more meat in the commit msg.

Reviewed-by: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>

> ---
>  drivers/gpu/drm/i915/display/vlv_dsi.c | 55 +-------------------------
>  1 file changed, 1 insertion(+), 54 deletions(-)
> =

> diff --git a/drivers/gpu/drm/i915/display/vlv_dsi.c b/drivers/gpu/drm/i91=
5/display/vlv_dsi.c
> index 0ca49b1604c6..18f7616e6c27 100644
> --- a/drivers/gpu/drm/i915/display/vlv_dsi.c
> +++ b/drivers/gpu/drm/i915/display/vlv_dsi.c
> @@ -1563,59 +1563,6 @@ static const struct drm_connector_funcs intel_dsi_=
connector_funcs =3D {
>  	.atomic_duplicate_state =3D intel_digital_connector_duplicate_state,
>  };
>  =

> -static enum drm_panel_orientation
> -vlv_dsi_get_hw_panel_orientation(struct intel_connector *connector)
> -{
> -	struct drm_i915_private *dev_priv =3D to_i915(connector->base.dev);
> -	struct intel_encoder *encoder =3D connector->encoder;
> -	enum intel_display_power_domain power_domain;
> -	enum drm_panel_orientation orientation;
> -	struct intel_plane *plane;
> -	struct intel_crtc *crtc;
> -	intel_wakeref_t wakeref;
> -	enum pipe pipe;
> -	u32 val;
> -
> -	if (!encoder->get_hw_state(encoder, &pipe))
> -		return DRM_MODE_PANEL_ORIENTATION_UNKNOWN;
> -
> -	crtc =3D intel_get_crtc_for_pipe(dev_priv, pipe);
> -	plane =3D to_intel_plane(crtc->base.primary);
> -
> -	power_domain =3D POWER_DOMAIN_PIPE(pipe);
> -	wakeref =3D intel_display_power_get_if_enabled(dev_priv, power_domain);
> -	if (!wakeref)
> -		return DRM_MODE_PANEL_ORIENTATION_UNKNOWN;
> -
> -	val =3D I915_READ(DSPCNTR(plane->i9xx_plane));
> -
> -	if (!(val & DISPLAY_PLANE_ENABLE))
> -		orientation =3D DRM_MODE_PANEL_ORIENTATION_UNKNOWN;
> -	else if (val & DISPPLANE_ROTATE_180)
> -		orientation =3D DRM_MODE_PANEL_ORIENTATION_BOTTOM_UP;
> -	else
> -		orientation =3D DRM_MODE_PANEL_ORIENTATION_NORMAL;
> -
> -	intel_display_power_put(dev_priv, power_domain, wakeref);
> -
> -	return orientation;
> -}
> -
> -static enum drm_panel_orientation
> -vlv_dsi_get_panel_orientation(struct intel_connector *connector)
> -{
> -	struct drm_i915_private *dev_priv =3D to_i915(connector->base.dev);
> -	enum drm_panel_orientation orientation;
> -
> -	if (IS_VALLEYVIEW(dev_priv) || IS_CHERRYVIEW(dev_priv)) {
> -		orientation =3D vlv_dsi_get_hw_panel_orientation(connector);
> -		if (orientation !=3D DRM_MODE_PANEL_ORIENTATION_UNKNOWN)
> -			return orientation;
> -	}
> -
> -	return intel_dsi_get_panel_orientation(connector);
> -}
> -
>  static void vlv_dsi_add_properties(struct intel_connector *connector)
>  {
>  	struct drm_i915_private *dev_priv =3D to_i915(connector->base.dev);
> @@ -1633,7 +1580,7 @@ static void vlv_dsi_add_properties(struct intel_con=
nector *connector)
>  		connector->base.state->scaling_mode =3D DRM_MODE_SCALE_ASPECT;
>  =

>  		connector->base.display_info.panel_orientation =3D
> -			vlv_dsi_get_panel_orientation(connector);
> +			intel_dsi_get_panel_orientation(connector);
>  		drm_connector_init_panel_orientation_property(
>  				&connector->base,
>  				connector->panel.fixed_mode->hdisplay,
> -- =

> 2.23.0

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
