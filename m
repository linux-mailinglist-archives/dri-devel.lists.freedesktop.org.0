Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A819183026
	for <lists+dri-devel@lfdr.de>; Thu, 12 Mar 2020 13:27:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89FA96E13A;
	Thu, 12 Mar 2020 12:27:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93F366E13A;
 Thu, 12 Mar 2020 12:27:08 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 12 Mar 2020 05:27:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,544,1574150400"; d="scan'208";a="235010884"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by fmsmga007.fm.intel.com with SMTP; 12 Mar 2020 05:27:00 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 12 Mar 2020 14:27:00 +0200
Date: Thu, 12 Mar 2020 14:27:00 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: "Laxminarayan Bharadiya, Pankaj" <pankaj.laxminarayan.bharadiya@intel.com>
Subject: Re: [RFC][PATCH 3/5] drm/i915: Enable scaling filter for plane and
 pipe
Message-ID: <20200312122700.GE13686@intel.com>
References: <20200225070545.4482-1-pankaj.laxminarayan.bharadiya@intel.com>
 <20200225070545.4482-4-pankaj.laxminarayan.bharadiya@intel.com>
 <20200310160545.GI13686@intel.com>
 <E92BA18FDE0A5B43B7B3DA7FCA031286057B2BE5@BGSMSX107.gar.corp.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <E92BA18FDE0A5B43B7B3DA7FCA031286057B2BE5@BGSMSX107.gar.corp.intel.com>
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
Cc: "tzimmermann@suse.de" <tzimmermann@suse.de>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 "airlied@linux.ie" <airlied@linux.ie>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>, "Souza, Jose" <jose.souza@intel.com>,
 "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>,
 "mihail.atanassov@arm.com" <mihail.atanassov@arm.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Mar 12, 2020 at 08:58:42AM +0000, Laxminarayan Bharadiya, Pankaj wr=
ote:
> =

> =

> > -----Original Message-----
> > From: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> > Sent: 10 March 2020 21:36
> > To: Laxminarayan Bharadiya, Pankaj
> > <pankaj.laxminarayan.bharadiya@intel.com>
> > Cc: jani.nikula@linux.intel.com; daniel@ffwll.ch; intel-
> > gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org; airlied@lin=
ux.ie;
> > maarten.lankhorst@linux.intel.com; tzimmermann@suse.de;
> > mripard@kernel.org; mihail.atanassov@arm.com; Joonas Lahtinen
> > <joonas.lahtinen@linux.intel.com>; Vivi, Rodrigo <rodrigo.vivi@intel.co=
m>;
> > Chris Wilson <chris@chris-wilson.co.uk>; Souza, Jose
> > <jose.souza@intel.com>; Juha-Pekka Heikkila
> > <juhapekka.heikkila@gmail.com>; linux-kernel@vger.kernel.org; Nautiyal,
> > Ankit K <ankit.k.nautiyal@intel.com>
> > Subject: Re: [RFC][PATCH 3/5] drm/i915: Enable scaling filter for plane=
 and
> > pipe
> > =

> > On Tue, Feb 25, 2020 at 12:35:43PM +0530, Pankaj Bharadiya wrote:
> > > Attach scaling filter property for crtc and plane and program the
> > > scaler control register for the selected filter type.
> > >
> > > This is preparatory patch to enable Nearest-neighbor integer scaling.
> > >
> > > Signed-off-by: Pankaj Bharadiya
> > > <pankaj.laxminarayan.bharadiya@intel.com>
> > > Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> > > ---
> > >  drivers/gpu/drm/i915/display/intel_display.c | 17 +++++++++++++++--
> > > drivers/gpu/drm/i915/display/intel_sprite.c  | 12 +++++++++++-
> > >  drivers/gpu/drm/i915/i915_reg.h              |  1 +
> > >  3 files changed, 27 insertions(+), 3 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/i915/display/intel_display.c
> > > b/drivers/gpu/drm/i915/display/intel_display.c
> > > index 3031e64ee518..b5903ef3c5a0 100644
> > > --- a/drivers/gpu/drm/i915/display/intel_display.c
> > > +++ b/drivers/gpu/drm/i915/display/intel_display.c
> > > @@ -6242,6 +6242,8 @@ static void skl_pfit_enable(const struct
> > intel_crtc_state *crtc_state)
> > >  	struct intel_crtc *crtc =3D to_intel_crtc(crtc_state->uapi.crtc);
> > >  	struct drm_i915_private *dev_priv =3D to_i915(crtc->base.dev);
> > >  	enum pipe pipe =3D crtc->pipe;
> > > +	const struct drm_crtc_state *state =3D &crtc_state->uapi;
> > > +	u32 scaling_filter =3D PS_FILTER_MEDIUM;
> > >  	const struct intel_crtc_scaler_state *scaler_state =3D
> > >  		&crtc_state->scaler_state;
> > >
> > > @@ -6258,6 +6260,11 @@ static void skl_pfit_enable(const struct
> > intel_crtc_state *crtc_state)
> > >  		pfit_w =3D (crtc_state->pch_pfit.size >> 16) & 0xFFFF;
> > >  		pfit_h =3D crtc_state->pch_pfit.size & 0xFFFF;
> > >
> > > +		if (state->scaling_filter =3D=3D
> > > +		    DRM_SCALING_FILTER_NEAREST_NEIGHBOR) {
> > > +			scaling_filter =3D PS_FILTER_PROGRAMMED;
> > > +		}
> > =

> > Just make that a function that can be used all over.
> > skl_scaler_filter(scaling_filter) or something.
> > =

> > > +
> > >  		hscale =3D (crtc_state->pipe_src_w << 16) / pfit_w;
> > >  		vscale =3D (crtc_state->pipe_src_h << 16) / pfit_h;
> > >
> > > @@ -6268,8 +6275,10 @@ static void skl_pfit_enable(const struct
> > > intel_crtc_state *crtc_state)
> > >
> > >  		spin_lock_irqsave(&dev_priv->uncore.lock, irqflags);
> > >
> > > -		intel_de_write_fw(dev_priv, SKL_PS_CTRL(pipe, id),
> > PS_SCALER_EN |
> > > -				  PS_FILTER_MEDIUM | scaler_state-
> > >scalers[id].mode);
> > > +		intel_de_write_fw(dev_priv, SKL_PS_CTRL(pipe, id),
> > > +				  PS_SCALER_EN |
> > > +				  scaling_filter |
> > > +				  scaler_state->scalers[id].mode);
> > >  		intel_de_write_fw(dev_priv, SKL_PS_VPHASE(pipe, id),
> > >  				  PS_Y_PHASE(0) |
> > PS_UV_RGB_PHASE(uv_rgb_vphase));
> > >  		intel_de_write_fw(dev_priv, SKL_PS_HPHASE(pipe, id), @@
> > -16695,6
> > > +16704,10 @@ static int intel_crtc_init(struct drm_i915_private *dev_=
priv,
> > enum pipe pipe)
> > >  		dev_priv->plane_to_crtc_mapping[i9xx_plane] =3D crtc;
> > >  	}
> > >
> > > +
> > > +	if (INTEL_GEN(dev_priv) >=3D 11)
> > =

> > gen >=3D 10 actually. Even glk seems to have it but bspec says not to u=
se it on
> > glk. Supposedly not validated.
> > =

> > ilk/snb/ivb pfits also has programmable coefficients actually. So IMO we
> > should enable this on those as well.
> =

> OK. I need to explore bspec more for these platforms.
> To begin with I would like to stick to gen >=3D10.

Sure. You can also have a look at the intel_scaling_coef hacks I posted
to igt-dev for details on how to drive them all. I already reverse
engineered them sufficiently so that I was able to program them ;)

> =

> > =

> > The bigger problem will be how is userspace supposed to use this if it'=
s a crtc
> > property? Those will not get automagically exposed via xrandr.
> > =

> > > +		drm_crtc_enable_scaling_filter(&crtc->base);
> > > +
> > >  	intel_color_init(crtc);
> > >
> > >  	drm_WARN_ON(&dev_priv->drm, drm_crtc_index(&crtc->base) !=3D
> > > crtc->pipe); diff --git a/drivers/gpu/drm/i915/display/intel_sprite.c
> > > b/drivers/gpu/drm/i915/display/intel_sprite.c
> > > index 7abeefe8dce5..fd7b31a21723 100644
> > > --- a/drivers/gpu/drm/i915/display/intel_sprite.c
> > > +++ b/drivers/gpu/drm/i915/display/intel_sprite.c
> > > @@ -414,6 +414,12 @@ skl_program_scaler(struct intel_plane *plane,
> > >  	u16 y_hphase, uv_rgb_hphase;
> > >  	u16 y_vphase, uv_rgb_vphase;
> > >  	int hscale, vscale;
> > > +	const struct drm_plane_state *state =3D &plane_state->uapi;
> > > +	u32 scaling_filter =3D PS_FILTER_MEDIUM;
> > > +
> > > +	if (state->scaling_filter =3D=3D
> > DRM_SCALING_FILTER_NEAREST_NEIGHBOR) {
> > > +		scaling_filter =3D PS_FILTER_PROGRAMMED;
> > > +	}
> > >
> > >  	hscale =3D drm_rect_calc_hscale(&plane_state->uapi.src,
> > >  				      &plane_state->uapi.dst,
> > > @@ -441,7 +447,8 @@ skl_program_scaler(struct intel_plane *plane,
> > >  	}
> > >
> > >  	intel_de_write_fw(dev_priv, SKL_PS_CTRL(pipe, scaler_id),
> > > -			  PS_SCALER_EN | PS_PLANE_SEL(plane->id) | scaler-
> > >mode);
> > > +			  scaling_filter | PS_SCALER_EN |
> > > +			  PS_PLANE_SEL(plane->id) | scaler->mode);
> > >  	intel_de_write_fw(dev_priv, SKL_PS_VPHASE(pipe, scaler_id),
> > >  			  PS_Y_PHASE(y_vphase) |
> > PS_UV_RGB_PHASE(uv_rgb_vphase));
> > >  	intel_de_write_fw(dev_priv, SKL_PS_HPHASE(pipe, scaler_id), @@
> > > -3104,6 +3111,9 @@ skl_universal_plane_create(struct drm_i915_private
> > > *dev_priv,
> > >
> > >  	drm_plane_create_zpos_immutable_property(&plane->base,
> > plane_id);
> > >
> > > +	if (INTEL_GEN(dev_priv) >=3D 11)
> > =

> > also gen>=3D10
> > =

> > Also this patch breaks things as we don't yet have the code to program =
the
> > coefficients. So the series needs to be reordered.
> =

> Will reorder the series.
> =

> Thanks,
> Pankaj
> > =

> > > +		drm_plane_enable_scaling_filter(&plane->base);
> > > +
> > >  	drm_plane_helper_add(&plane->base, &intel_plane_helper_funcs);
> > >
> > >  	return plane;
> > > diff --git a/drivers/gpu/drm/i915/i915_reg.h
> > > b/drivers/gpu/drm/i915/i915_reg.h index f45b5e86ec63..34923b1c284c
> > > 100644
> > > --- a/drivers/gpu/drm/i915/i915_reg.h
> > > +++ b/drivers/gpu/drm/i915/i915_reg.h
> > > @@ -7212,6 +7212,7 @@ enum {
> > >  #define PS_PLANE_SEL(plane) (((plane) + 1) << 25)
> > >  #define PS_FILTER_MASK         (3 << 23)
> > >  #define PS_FILTER_MEDIUM       (0 << 23)
> > > +#define PS_FILTER_PROGRAMMED   (1 << 23)
> > >  #define PS_FILTER_EDGE_ENHANCE (2 << 23)
> > >  #define PS_FILTER_BILINEAR     (3 << 23)
> > >  #define PS_VERT3TAP            (1 << 21)
> > > --
> > > 2.23.0
> > =

> > --
> > Ville Syrj=E4l=E4
> > Intel

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
