Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 071AF2D61E2
	for <lists+dri-devel@lfdr.de>; Thu, 10 Dec 2020 17:32:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1A6B6EAB6;
	Thu, 10 Dec 2020 16:32:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 897576EAB6
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Dec 2020 16:32:38 +0000 (UTC)
IronPort-SDR: nxwbR2VoOtCb7rCDqpxgb2IPFDcr6Oo+JPPyoDtpjHqyaKN+Q/pwtz+5mVeyZOjk6Wb2jVnRk/
 2cK7Wgao2TpQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9830"; a="259001084"
X-IronPort-AV: E=Sophos;i="5.78,408,1599548400"; d="scan'208";a="259001084"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2020 08:32:38 -0800
IronPort-SDR: 9nWulroWGvxdMQ7muoXps9OCx3poe4Nogtf2VZnp9TI6GohIQZZxhIHObZjhf9J864ZDMzo2uq
 4zuKbOKZPMXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,408,1599548400"; d="scan'208";a="338520378"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by orsmga006.jf.intel.com with SMTP; 10 Dec 2020 08:32:32 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 10 Dec 2020 18:32:31 +0200
Date: Thu, 10 Dec 2020 18:32:31 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH v3 1/2] drm: automatic legacy gamma support
Message-ID: <X9JNn4AZaaG4YOIR@intel.com>
References: <20201210140852.1040054-1-tomi.valkeinen@ti.com>
 <20201210140852.1040054-2-tomi.valkeinen@ti.com>
 <20201210152739.GF401619@phenom.ffwll.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201210152739.GF401619@phenom.ffwll.local>
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
Cc: Yannick Fertre <yannick.fertre@st.com>,
 Philippe Cornu <philippe.cornu@st.com>, David Airlie <airlied@linux.ie>,
 Russell King <linux@armlinux.org.uk>, dri-devel@lists.freedesktop.org,
 Sandy Huang <hjc@rock-chips.com>, Paul Cercueil <paul@crapouillou.net>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Vincent Abriou <vincent.abriou@st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@st.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Dec 10, 2020 at 04:27:39PM +0100, Daniel Vetter wrote:
> On Thu, Dec 10, 2020 at 04:08:51PM +0200, Tomi Valkeinen wrote:
> > To support legacy gamma ioctls the drivers need to set
> > drm_crtc_funcs.gamma_set either to a custom implementation or to
> > drm_atomic_helper_legacy_gamma_set. Most of the atomic drivers do the
> > latter.
> > =

> > We can simplify this by making the core handle it automatically.
> > =

> > Add three functions to drm_color_mgmt.c:
> > =

> > drm_crtc_supports_legacy_gamma() which tells if the driver supports
> > setting the legacy gamma.
> > =

> > drm_crtc_gamma_ramp_set() which sets the given gamma ramp to GAMMA_LUT
> > and resets DEGAMMA_LUT and CTM.
> > =

> > drm_crtc_legacy_gamma_set() which sets the given gamma ramp values
> > either using drm_crtc_funcs.gamma_set or drm_crtc_gamma_ramp_set().
> > =

> > These functions are used from the drm_mode_gamma_set_ioctl, and from
> > drm_fb_helper.c when it is dealing with fbdev cmap.
> > =

> > We can then drop drm_atomic_helper_legacy_gamma_set() and remove all its
> > uses.
> > =

> > Note that we need to EXPORT_SYMBOL all the new functions as they are
> > used from drm_fb_helper, but they are declared in drm_crtc_internal.h as
> > they are not supposed to be used by the drivers.
> > =

> > Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
> > ---
> >  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |   1 -
> >  .../gpu/drm/arm/display/komeda/komeda_crtc.c  |   1 -
> >  drivers/gpu/drm/arm/malidp_crtc.c             |   1 -
> >  drivers/gpu/drm/armada/armada_crtc.c          |   1 -
> >  drivers/gpu/drm/ast/ast_mode.c                |   1 -
> >  .../gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c    |   1 -
> >  drivers/gpu/drm/drm_atomic_helper.c           |  70 ---------
> >  drivers/gpu/drm/drm_color_mgmt.c              | 138 ++++++++++++++++--
> >  drivers/gpu/drm/drm_crtc_internal.h           |  10 ++
> >  drivers/gpu/drm/drm_fb_helper.c               |  28 ++--
> >  drivers/gpu/drm/i915/display/intel_display.c  |   1 -
> >  drivers/gpu/drm/ingenic/ingenic-drm-drv.c     |   2 -
> >  drivers/gpu/drm/mediatek/mtk_drm_crtc.c       |   1 -
> >  drivers/gpu/drm/nouveau/dispnv50/head.c       |   2 -
> >  drivers/gpu/drm/omapdrm/omap_crtc.c           |   1 -
> >  drivers/gpu/drm/rcar-du/rcar_du_crtc.c        |   1 -
> >  drivers/gpu/drm/rockchip/rockchip_drm_vop.c   |   1 -
> >  drivers/gpu/drm/stm/ltdc.c                    |   1 -
> >  drivers/gpu/drm/vc4/vc4_crtc.c                |   1 -
> >  drivers/gpu/drm/vc4/vc4_txp.c                 |   1 -
> >  include/drm/drm_atomic_helper.h               |   4 -
> >  include/drm/drm_color_mgmt.h                  |   1 -
> >  22 files changed, 148 insertions(+), 121 deletions(-)
> > =

> > diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/driver=
s/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> > index 2855bb918535..848b06c51b0e 100644
> > --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> > +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> > @@ -5396,7 +5396,6 @@ static void dm_disable_vblank(struct drm_crtc *cr=
tc)
> >  static const struct drm_crtc_funcs amdgpu_dm_crtc_funcs =3D {
> >  	.reset =3D dm_crtc_reset_state,
> >  	.destroy =3D amdgpu_dm_crtc_destroy,
> > -	.gamma_set =3D drm_atomic_helper_legacy_gamma_set,
> >  	.set_config =3D drm_atomic_helper_set_config,
> >  	.page_flip =3D drm_atomic_helper_page_flip,
> >  	.atomic_duplicate_state =3D dm_crtc_duplicate_state,
> > diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_crtc.c b/drivers=
/gpu/drm/arm/display/komeda/komeda_crtc.c
> > index 4b485eb512e2..59172acb9738 100644
> > --- a/drivers/gpu/drm/arm/display/komeda/komeda_crtc.c
> > +++ b/drivers/gpu/drm/arm/display/komeda/komeda_crtc.c
> > @@ -550,7 +550,6 @@ static void komeda_crtc_vblank_disable(struct drm_c=
rtc *crtc)
> >  }
> >  =

> >  static const struct drm_crtc_funcs komeda_crtc_funcs =3D {
> > -	.gamma_set		=3D drm_atomic_helper_legacy_gamma_set,
> >  	.destroy		=3D drm_crtc_cleanup,
> >  	.set_config		=3D drm_atomic_helper_set_config,
> >  	.page_flip		=3D drm_atomic_helper_page_flip,
> > diff --git a/drivers/gpu/drm/arm/malidp_crtc.c b/drivers/gpu/drm/arm/ma=
lidp_crtc.c
> > index 108e7a31bd26..494075ddbef6 100644
> > --- a/drivers/gpu/drm/arm/malidp_crtc.c
> > +++ b/drivers/gpu/drm/arm/malidp_crtc.c
> > @@ -510,7 +510,6 @@ static void malidp_crtc_disable_vblank(struct drm_c=
rtc *crtc)
> >  }
> >  =

> >  static const struct drm_crtc_funcs malidp_crtc_funcs =3D {
> > -	.gamma_set =3D drm_atomic_helper_legacy_gamma_set,
> >  	.destroy =3D drm_crtc_cleanup,
> >  	.set_config =3D drm_atomic_helper_set_config,
> >  	.page_flip =3D drm_atomic_helper_page_flip,
> > diff --git a/drivers/gpu/drm/armada/armada_crtc.c b/drivers/gpu/drm/arm=
ada/armada_crtc.c
> > index 3ebcf5a52c8b..b7bb90ae787f 100644
> > --- a/drivers/gpu/drm/armada/armada_crtc.c
> > +++ b/drivers/gpu/drm/armada/armada_crtc.c
> > @@ -820,7 +820,6 @@ static const struct drm_crtc_funcs armada_crtc_func=
s =3D {
> >  	.cursor_set	=3D armada_drm_crtc_cursor_set,
> >  	.cursor_move	=3D armada_drm_crtc_cursor_move,
> >  	.destroy	=3D armada_drm_crtc_destroy,
> > -	.gamma_set	=3D drm_atomic_helper_legacy_gamma_set,
> >  	.set_config	=3D drm_atomic_helper_set_config,
> >  	.page_flip	=3D drm_atomic_helper_page_flip,
> >  	.atomic_duplicate_state =3D drm_atomic_helper_crtc_duplicate_state,
> > diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_m=
ode.c
> > index 9db371f4054f..5b0ec785c516 100644
> > --- a/drivers/gpu/drm/ast/ast_mode.c
> > +++ b/drivers/gpu/drm/ast/ast_mode.c
> > @@ -903,7 +903,6 @@ static void ast_crtc_atomic_destroy_state(struct dr=
m_crtc *crtc,
> >  =

> >  static const struct drm_crtc_funcs ast_crtc_funcs =3D {
> >  	.reset =3D ast_crtc_reset,
> > -	.gamma_set =3D drm_atomic_helper_legacy_gamma_set,
> >  	.destroy =3D drm_crtc_cleanup,
> >  	.set_config =3D drm_atomic_helper_set_config,
> >  	.page_flip =3D drm_atomic_helper_page_flip,
> > diff --git a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c b/drivers/g=
pu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c
> > index c58fa00b4848..05ad75d155e8 100644
> > --- a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c
> > +++ b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c
> > @@ -473,7 +473,6 @@ static const struct drm_crtc_funcs atmel_hlcdc_crtc=
_funcs =3D {
> >  	.atomic_destroy_state =3D atmel_hlcdc_crtc_destroy_state,
> >  	.enable_vblank =3D atmel_hlcdc_crtc_enable_vblank,
> >  	.disable_vblank =3D atmel_hlcdc_crtc_disable_vblank,
> > -	.gamma_set =3D drm_atomic_helper_legacy_gamma_set,
> >  };
> >  =

> >  int atmel_hlcdc_crtc_create(struct drm_device *dev)
> > diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_=
atomic_helper.c
> > index ba1507036f26..b114658100b3 100644
> > --- a/drivers/gpu/drm/drm_atomic_helper.c
> > +++ b/drivers/gpu/drm/drm_atomic_helper.c
> > @@ -3499,76 +3499,6 @@ int drm_atomic_helper_page_flip_target(struct dr=
m_crtc *crtc,
> >  }
> >  EXPORT_SYMBOL(drm_atomic_helper_page_flip_target);
> >  =

> > -/**
> > - * drm_atomic_helper_legacy_gamma_set - set the legacy gamma correctio=
n table
> > - * @crtc: CRTC object
> > - * @red: red correction table
> > - * @green: green correction table
> > - * @blue: green correction table
> > - * @size: size of the tables
> > - * @ctx: lock acquire context
> > - *
> > - * Implements support for legacy gamma correction table for drivers
> > - * that support color management through the DEGAMMA_LUT/GAMMA_LUT
> > - * properties. See drm_crtc_enable_color_mgmt() and the containing cha=
pter for
> > - * how the atomic color management and gamma tables work.
> > - */
> > -int drm_atomic_helper_legacy_gamma_set(struct drm_crtc *crtc,
> > -				       u16 *red, u16 *green, u16 *blue,
> > -				       uint32_t size,
> > -				       struct drm_modeset_acquire_ctx *ctx)
> > -{
> > -	struct drm_device *dev =3D crtc->dev;
> > -	struct drm_atomic_state *state;
> > -	struct drm_crtc_state *crtc_state;
> > -	struct drm_property_blob *blob =3D NULL;
> > -	struct drm_color_lut *blob_data;
> > -	int i, ret =3D 0;
> > -	bool replaced;
> > -
> > -	state =3D drm_atomic_state_alloc(crtc->dev);
> > -	if (!state)
> > -		return -ENOMEM;
> > -
> > -	blob =3D drm_property_create_blob(dev,
> > -					sizeof(struct drm_color_lut) * size,
> > -					NULL);
> > -	if (IS_ERR(blob)) {
> > -		ret =3D PTR_ERR(blob);
> > -		blob =3D NULL;
> > -		goto fail;
> > -	}
> > -
> > -	/* Prepare GAMMA_LUT with the legacy values. */
> > -	blob_data =3D blob->data;
> > -	for (i =3D 0; i < size; i++) {
> > -		blob_data[i].red =3D red[i];
> > -		blob_data[i].green =3D green[i];
> > -		blob_data[i].blue =3D blue[i];
> > -	}
> > -
> > -	state->acquire_ctx =3D ctx;
> > -	crtc_state =3D drm_atomic_get_crtc_state(state, crtc);
> > -	if (IS_ERR(crtc_state)) {
> > -		ret =3D PTR_ERR(crtc_state);
> > -		goto fail;
> > -	}
> > -
> > -	/* Reset DEGAMMA_LUT and CTM properties. */
> > -	replaced  =3D drm_property_replace_blob(&crtc_state->degamma_lut, NUL=
L);
> > -	replaced |=3D drm_property_replace_blob(&crtc_state->ctm, NULL);
> > -	replaced |=3D drm_property_replace_blob(&crtc_state->gamma_lut, blob);
> > -	crtc_state->color_mgmt_changed |=3D replaced;
> > -
> > -	ret =3D drm_atomic_commit(state);
> > -
> > -fail:
> > -	drm_atomic_state_put(state);
> > -	drm_property_blob_put(blob);
> > -	return ret;
> > -}
> > -EXPORT_SYMBOL(drm_atomic_helper_legacy_gamma_set);
> > -
> >  /**
> >   * drm_atomic_helper_bridge_propagate_bus_fmt() - Propagate output for=
mat to
> >   *						  the input end of a bridge
> > diff --git a/drivers/gpu/drm/drm_color_mgmt.c b/drivers/gpu/drm/drm_col=
or_mgmt.c
> > index 3bcabc2f6e0e..c4e4d59c4432 100644
> > --- a/drivers/gpu/drm/drm_color_mgmt.c
> > +++ b/drivers/gpu/drm/drm_color_mgmt.c
> > @@ -22,6 +22,7 @@
> >  =

> >  #include <linux/uaccess.h>
> >  =

> > +#include <drm/drm_atomic.h>
> >  #include <drm/drm_color_mgmt.h>
> >  #include <drm/drm_crtc.h>
> >  #include <drm/drm_device.h>
> > @@ -89,9 +90,8 @@
> >   *	modes) appropriately.
> >   *
> >   * There is also support for a legacy gamma table, which is set up by =
calling
> > - * drm_mode_crtc_set_gamma_size(). Drivers which support both should u=
se
> > - * drm_atomic_helper_legacy_gamma_set() to alias the legacy gamma ramp=
 with the
> > - * "GAMMA_LUT" property above.
> > + * drm_mode_crtc_set_gamma_size(). The DRM core will then alias the le=
gacy gamma
> > + * ramp with "GAMMA_LUT".
> >   *
> >   * Support for different non RGB color encodings is controlled through
> >   * &drm_plane specific COLOR_ENCODING and COLOR_RANGE properties. They
> > @@ -156,9 +156,6 @@ EXPORT_SYMBOL(drm_color_ctm_s31_32_to_qm_n);
> >   * optional. The gamma and degamma properties are only attached if
> >   * their size is not 0 and ctm_property is only attached if has_ctm is
> >   * true.
> > - *
> > - * Drivers should use drm_atomic_helper_legacy_gamma_set() to implemen=
t the
> > - * legacy &drm_crtc_funcs.gamma_set callback.
> >   */
> >  void drm_crtc_enable_color_mgmt(struct drm_crtc *crtc,
> >  				uint degamma_lut_size,
> > @@ -231,6 +228,129 @@ int drm_mode_crtc_set_gamma_size(struct drm_crtc =
*crtc,
> >  }
> >  EXPORT_SYMBOL(drm_mode_crtc_set_gamma_size);
> >  =

> > +/**
> > + * drm_crtc_supports_legacy_gamma - does the crtc support legacy gamma=
 correction table
> > + * @crtc: CRTC object
> > + *
> > + * Returns true/false if the given crtc supports setting the legacy ga=
mma
> > + * correction table.
> > + */
> > +bool drm_crtc_supports_legacy_gamma(struct drm_crtc *crtc)
> > +{
> > +	uint32_t gamma_id =3D crtc->dev->mode_config.gamma_lut_property->base=
.id;
> > +
> > +	if (!crtc->gamma_size)
> > +		return false;
> > +
> > +	if (crtc->funcs->gamma_set)
> > +		return true;
> > +
> > +	return !!drm_mode_obj_find_prop_id(&crtc->base, gamma_id);
> > +}
> > +EXPORT_SYMBOL(drm_crtc_supports_legacy_gamma);
> > +
> > +/**
> > + * drm_crtc_gamma_ramp_set - set gamma ramp using GAMMA_LUT property
> > + * @state: atomic state to which the gamma ramp is set
> > + * @crtc: CRTC object
> > + * @blob: property blob for the gamma ramp
> > + *
> > + * Set given gamma ramp to the crtc using GAMMA_LUT property and reset=
ting
> > + * DEGAMMA_LUT and CTM.
> > + */
> > +int drm_crtc_gamma_ramp_set(struct drm_atomic_state *state, struct drm=
_crtc *crtc,
> > +		       struct drm_property_blob *blob)
> > +{
> > +	struct drm_crtc_state *crtc_state;
> > +	struct drm_property_blob *gamma_blob;
> > +	struct drm_property_blob *degamma_blob;
> > +	bool replaced;
> > +
> > +	gamma_blob =3D blob;
> > +	degamma_blob =3D NULL;
> > +
> > +	crtc_state =3D drm_atomic_get_crtc_state(state, crtc);
> > +	if (IS_ERR(crtc_state))
> > +		return PTR_ERR(crtc_state);
> > +
> > +	/* Set GAMMA_LUT and reset DEGAMMA_LUT and CTM */
> > +	replaced =3D drm_property_replace_blob(&crtc_state->degamma_lut, dega=
mma_blob);
> > +	replaced |=3D drm_property_replace_blob(&crtc_state->ctm, NULL);
> > +	replaced |=3D drm_property_replace_blob(&crtc_state->gamma_lut, gamma=
_blob);
> > +	crtc_state->color_mgmt_changed |=3D replaced;
> > +
> > +	return 0;
> > +}
> > +EXPORT_SYMBOL(drm_crtc_gamma_ramp_set);
> > +
> > +/**
> > + * drm_crtc_legacy_gamma_set - set the legacy gamma correction table
> > + * @crtc: CRTC object
> > + * @red: red correction table
> > + * @green: green correction table
> > + * @blue: green correction table
> > + * @size: size of the tables
> > + * @ctx: lock acquire context
> > + *
> > + * Implements support for legacy gamma correction table for drivers
> > + * that have set drm_crtc_funcs.gamma_set or that support color manage=
ment
> > + * through the DEGAMMA_LUT/GAMMA_LUT properties. See
> > + * drm_crtc_enable_color_mgmt() and the containing chapter for
> > + * how the atomic color management and gamma tables work.
> > + *
> > + * This function sets the gamma using drm_crtc_funcs.gamma_set if set,=
 or
> > + * alternatively using crtc color management properties.
> > + */
> > +int drm_crtc_legacy_gamma_set(struct drm_crtc *crtc,
> > +			      u16 *red, u16 *green, u16 *blue,
> > +			      uint32_t size,
> > +			      struct drm_modeset_acquire_ctx *ctx)
> > +{
> > +	struct drm_device *dev =3D crtc->dev;
> > +	struct drm_atomic_state *state;
> > +	struct drm_property_blob *blob;
> > +	struct drm_color_lut *blob_data;
> > +	int i, ret =3D 0;
> > +
> > +	if (crtc->funcs->gamma_set)
> > +		return crtc->funcs->gamma_set(crtc, red, green, blue, size, ctx);
> > +
> > +	state =3D drm_atomic_state_alloc(crtc->dev);
> > +	if (!state)
> > +		return -ENOMEM;
> > +
> > +	blob =3D drm_property_create_blob(dev,
> > +					sizeof(struct drm_color_lut) * size,
> > +					NULL);
> > +	if (IS_ERR(blob)) {
> > +		ret =3D PTR_ERR(blob);
> > +		blob =3D NULL;
> > +		goto fail;
> > +	}
> > +
> > +	/* Prepare GAMMA_LUT with the legacy values. */
> > +	blob_data =3D blob->data;
> > +	for (i =3D 0; i < size; i++) {
> > +		blob_data[i].red =3D red[i];
> > +		blob_data[i].green =3D green[i];
> > +		blob_data[i].blue =3D blue[i];
> > +	}
> > +
> > +	state->acquire_ctx =3D ctx;
> > +
> > +	ret =3D drm_crtc_gamma_ramp_set(state, crtc, blob);
> > +	if (ret)
> > +		goto fail;
> > +
> > +	ret =3D drm_atomic_commit(state);
> > +
> > +fail:
> > +	drm_atomic_state_put(state);
> > +	drm_property_blob_put(blob);
> > +	return ret;
> > +}
> > +EXPORT_SYMBOL(drm_crtc_legacy_gamma_set);
> > +
> >  /**
> >   * drm_mode_gamma_set_ioctl - set the gamma table
> >   * @dev: DRM device
> > @@ -262,7 +382,7 @@ int drm_mode_gamma_set_ioctl(struct drm_device *dev,
> >  	if (!crtc)
> >  		return -ENOENT;
> >  =

> > -	if (crtc->funcs->gamma_set =3D=3D NULL)
> > +	if (!drm_crtc_supports_legacy_gamma(crtc))
> >  		return -ENOSYS;
> >  =

> >  	/* memcpy into gamma store */
> > @@ -290,8 +410,8 @@ int drm_mode_gamma_set_ioctl(struct drm_device *dev,
> >  		goto out;
> >  	}
> >  =

> > -	ret =3D crtc->funcs->gamma_set(crtc, r_base, g_base, b_base,
> > -				     crtc->gamma_size, &ctx);
> > +	ret =3D drm_crtc_legacy_gamma_set(crtc, r_base, g_base, b_base,
> > +					crtc->gamma_size, &ctx);
> >  =

> >  out:
> >  	DRM_MODESET_LOCK_ALL_END(dev, ctx, ret);
> > diff --git a/drivers/gpu/drm/drm_crtc_internal.h b/drivers/gpu/drm/drm_=
crtc_internal.h
> > index 54d4cf1233e9..74856df6482a 100644
> > --- a/drivers/gpu/drm/drm_crtc_internal.h
> > +++ b/drivers/gpu/drm/drm_crtc_internal.h
> > @@ -51,9 +51,11 @@ struct drm_mode_fb_cmd2;
> >  struct drm_mode_fb_cmd;
> >  struct drm_mode_object;
> >  struct drm_mode_set;
> > +struct drm_modeset_acquire_ctx;
> >  struct drm_plane;
> >  struct drm_plane_state;
> >  struct drm_property;
> > +struct drm_property_blob;
> >  struct edid;
> >  struct kref;
> >  struct work_struct;
> > @@ -114,6 +116,14 @@ int drm_mode_destroy_dumb_ioctl(struct drm_device =
*dev,
> >  const char *drm_get_color_encoding_name(enum drm_color_encoding encodi=
ng);
> >  const char *drm_get_color_range_name(enum drm_color_range range);
> >  =

> > +bool drm_crtc_supports_legacy_gamma(struct drm_crtc *crtc);
> > +int drm_crtc_gamma_ramp_set(struct drm_atomic_state *state, struct drm=
_crtc *crtc,
> > +		       struct drm_property_blob *blob);
> > +int drm_crtc_legacy_gamma_set(struct drm_crtc *crtc,
> > +			      u16 *red, u16 *green, u16 *blue,
> > +			      uint32_t size,
> > +			      struct drm_modeset_acquire_ctx *ctx);
> > +
> >  /* IOCTLs */
> >  int drm_mode_gamma_get_ioctl(struct drm_device *dev,
> >  			     void *data, struct drm_file *file_priv);
> > diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_h=
elper.c
> > index e82db0f4e771..80e3797f0f01 100644
> > --- a/drivers/gpu/drm/drm_fb_helper.c
> > +++ b/drivers/gpu/drm/drm_fb_helper.c
> > @@ -46,6 +46,7 @@
> >  #include <drm/drm_print.h>
> >  #include <drm/drm_vblank.h>
> >  =

> > +#include "drm_crtc_internal.h"
> =

> So this is a bit annoying, because thus far we managed to have a very
> clear split between core and helpers. And I think we can keep that.
> =

> >  #include "drm_crtc_helper_internal.h"
> >  #include "drm_internal.h"
> >  =

> > @@ -136,15 +137,15 @@ static void drm_fb_helper_restore_lut_atomic(stru=
ct drm_crtc *crtc)
> >  {
> >  	uint16_t *r_base, *g_base, *b_base;
> >  =

> > -	if (crtc->funcs->gamma_set =3D=3D NULL)
> > +	if (!drm_crtc_supports_legacy_gamma(crtc))
> >  		return;
> >  =

> >  	r_base =3D crtc->gamma_store;
> >  	g_base =3D r_base + crtc->gamma_size;
> >  	b_base =3D g_base + crtc->gamma_size;
> >  =

> > -	crtc->funcs->gamma_set(crtc, r_base, g_base, b_base,
> > -			       crtc->gamma_size, NULL);
> > +	drm_crtc_legacy_gamma_set(crtc, r_base, g_base, b_base,
> > +				  crtc->gamma_size, NULL);
> =

> This is only used by legacy non-atomic drivers. It's pretty much
> impossible to make kgdb work with atomic drivers, so really let's just not
> bother and keep the code as-is.
> =

> >  }
> >  =

> >  /**
> > @@ -946,7 +947,7 @@ static int setcmap_legacy(struct fb_cmap *cmap, str=
uct fb_info *info)
> >  	drm_modeset_lock_all(fb_helper->dev);
> >  	drm_client_for_each_modeset(modeset, &fb_helper->client) {
> >  		crtc =3D modeset->crtc;
> > -		if (!crtc->funcs->gamma_set || !crtc->gamma_size) {
> > +		if (!drm_crtc_supports_legacy_gamma(crtc)) {
> >  			ret =3D -EINVAL;
> >  			goto out;
> >  		}
> > @@ -964,8 +965,8 @@ static int setcmap_legacy(struct fb_cmap *cmap, str=
uct fb_info *info)
> >  		memcpy(g + cmap->start, cmap->green, cmap->len * sizeof(*g));
> >  		memcpy(b + cmap->start, cmap->blue, cmap->len * sizeof(*b));
> >  =

> > -		ret =3D crtc->funcs->gamma_set(crtc, r, g, b,
> > -					     crtc->gamma_size, NULL);
> > +		ret =3D drm_crtc_legacy_gamma_set(crtc, r, g, b, crtc->gamma_size,
> > +						NULL);
> >  		if (ret)
> >  			goto out;
> =

> Same here.
> =

> >  	}
> > @@ -1024,12 +1025,10 @@ static int setcmap_atomic(struct fb_cmap *cmap,=
 struct fb_info *info)
> >  	struct drm_device *dev =3D fb_helper->dev;
> >  	struct drm_property_blob *gamma_lut =3D NULL;
> >  	struct drm_modeset_acquire_ctx ctx;
> > -	struct drm_crtc_state *crtc_state;
> >  	struct drm_atomic_state *state;
> >  	struct drm_mode_set *modeset;
> >  	struct drm_crtc *crtc;
> >  	u16 *r, *g, *b;
> > -	bool replaced;
> >  	int ret =3D 0;
> >  =

> >  	drm_modeset_acquire_init(&ctx, 0);
> > @@ -1053,18 +1052,9 @@ static int setcmap_atomic(struct fb_cmap *cmap, =
struct fb_info *info)
> >  			goto out_state;
> >  		}
> >  =

> > -		crtc_state =3D drm_atomic_get_crtc_state(state, crtc);
> > -		if (IS_ERR(crtc_state)) {
> > -			ret =3D PTR_ERR(crtc_state);
> > +		ret =3D drm_crtc_gamma_ramp_set(state, crtc, gamma_lut);
> > +		if (ret)
> =

> You're nesting an atomic commit in an atomic commit here, that will go
> boom. I guess ideally we'd move this into drm_client_modeset so it
> remembers the fbdev gamma ramp and does it all in one go.

IIRC that's pretty much what's in my branch that I mentioned earlier.
Mentioning it again in case someone wants a leg up for implementing
this idea ;)

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
