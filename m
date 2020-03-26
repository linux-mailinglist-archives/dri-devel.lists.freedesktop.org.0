Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C00419431E
	for <lists+dri-devel@lfdr.de>; Thu, 26 Mar 2020 16:25:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A53BB6E340;
	Thu, 26 Mar 2020 15:25:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 415EB6E334;
 Thu, 26 Mar 2020 15:25:27 +0000 (UTC)
IronPort-SDR: /Koa+Ba3Z1Dgaxe8+A1jnalRacviccA/Vr0z7f6W57IN28u+nkF/a2uHmKlPDhInwyllc35q4B
 k5h0jHdpRxIA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2020 08:25:26 -0700
IronPort-SDR: iEkdKzRgF1UGcJZ4erpo3LsI263DkZfKu+0jniKv+ddyYnmGwdNOLcaLJM4K97XJ9Ssg7DzknF
 aU99WsqlqtBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,308,1580803200"; d="scan'208";a="447045419"
Received: from plaxmina-desktop.iind.intel.com ([10.145.162.62])
 by fmsmga005.fm.intel.com with ESMTP; 26 Mar 2020 08:25:21 -0700
Date: Thu, 26 Mar 2020 20:45:59 +0530
From: "Bharadiya,Pankaj" <pankaj.laxminarayan.bharadiya@intel.com>
To: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH v2 5/5] drm/i915: Enable scaling filter for plane and CRTC
Message-ID: <20200326151559.GA27486@plaxmina-desktop.iind.intel.com>
References: <20200319102103.28895-1-pankaj.laxminarayan.bharadiya@intel.com>
 <20200319102103.28895-6-pankaj.laxminarayan.bharadiya@intel.com>
 <20200323144749.GV13686@intel.com>
 <E92BA18FDE0A5B43B7B3DA7FCA031286057CDD2B@BGSMSX107.gar.corp.intel.com>
 <20200324164610.GZ13686@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200324164610.GZ13686@intel.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
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
Cc: "Lattannavar, Sameer" <sameer.lattannavar@intel.com>,
 "daniels@collabora.com" <daniels@collabora.com>,
 David Airlie <airlied@linux.ie>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Shankar,
 Uma" <uma.shankar@intel.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, "Souza,
 Jose" <jose.souza@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Mar 24, 2020 at 06:46:10PM +0200, Ville Syrj=E4l=E4 wrote:
> On Tue, Mar 24, 2020 at 03:32:09PM +0000, Laxminarayan Bharadiya, Pankaj =
wrote:
> > =

> > =

> > > -----Original Message-----
> > > From: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> > > Sent: 23 March 2020 20:18
> > > To: Laxminarayan Bharadiya, Pankaj
> > > <pankaj.laxminarayan.bharadiya@intel.com>
> > > Cc: Lattannavar, Sameer <sameer.lattannavar@intel.com>;
> > > jani.nikula@linux.intel.com; daniel@ffwll.ch; intel-gfx@lists.freedes=
ktop.org;
> > > dri-devel@lists.freedesktop.org; daniels@collabora.com; Joonas Lahtin=
en
> > > <joonas.lahtinen@linux.intel.com>; Vivi, Rodrigo <rodrigo.vivi@intel.=
com>;
> > > David Airlie <airlied@linux.ie>; Chris Wilson <chris@chris-wilson.co.=
uk>;
> > > Maarten Lankhorst <maarten.lankhorst@linux.intel.com>; Souza, Jose
> > > <jose.souza@intel.com>; Deak, Imre <imre.deak@intel.com>; Shankar, Uma
> > > <uma.shankar@intel.com>
> > > Subject: Re: [PATCH v2 5/5] drm/i915: Enable scaling filter for plane=
 and CRTC
> > > =

> > > On Thu, Mar 19, 2020 at 03:51:03PM +0530, Pankaj Bharadiya wrote:
> > > > GEN >=3D 10 hardware supports the programmable scaler filter.
> > > >
> > > > Attach scaling filter property for CRTC and plane for GEN >=3D 10
> > > > hardwares and program scaler filter based on the selected filter ty=
pe.
> > > >
> > > > changes since v1:
> > > > * None
> > > > Changes since RFC:
> > > > * Enable properties for GEN >=3D 10 platforms (Ville)
> > > > * Do not round off the crtc co-ordinate (Danial Stone, Ville)
> > > > * Add new functions to handle scaling filter setup (Ville)
> > > > * Remove coefficient set 0 hardcoding.
> > > >
> > > > Signed-off-by: Shashank Sharma <shashank.sharma@intel.com>
> > > > Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> > > > Signed-off-by: Pankaj Bharadiya
> > > > <pankaj.laxminarayan.bharadiya@intel.com>
> > > > ---
> > > >  drivers/gpu/drm/i915/display/intel_display.c | 32
> > > > ++++++++++++++++++--  drivers/gpu/drm/i915/display/intel_sprite.c  |
> > > > 31 ++++++++++++++++++-
> > > >  2 files changed, 60 insertions(+), 3 deletions(-)
> > > >
> > > > diff --git a/drivers/gpu/drm/i915/display/intel_display.c
> > > > b/drivers/gpu/drm/i915/display/intel_display.c
> > > > index 791dd908aa89..4b3387ee332e 100644
> > > > --- a/drivers/gpu/drm/i915/display/intel_display.c
> > > > +++ b/drivers/gpu/drm/i915/display/intel_display.c
> > > > @@ -6309,6 +6309,25 @@ void
> > > skl_scaler_setup_nearest_neighbor_filter(struct drm_i915_private *dev=
_priv,
> > > >  	}
> > > >  }
> > > >
> > > > +static u32
> > > > +skl_scaler_crtc_setup_filter(struct drm_i915_private *dev_priv, en=
um pipe
> > > pipe,
> > > > +			  int id, int set, enum drm_crtc_scaling_filter filter) {
> > > > +	u32 scaler_filter_ctl =3D PS_FILTER_MEDIUM;
> > > > +
> > > > +	if (filter =3D=3D DRM_CRTC_SCALING_FILTER_NEAREST_NEIGHBOR) {
> > > > +		skl_scaler_setup_nearest_neighbor_filter(dev_priv, pipe, id,
> > > > +							 set);
> > > > +		scaler_filter_ctl =3D PS_FILTER_PROGRAMMED |
> > > > +				PS_UV_VERT_FILTER_SELECT(set) |
> > > > +				PS_UV_HORZ_FILTER_SELECT(set) |
> > > > +				PS_Y_VERT_FILTER_SELECT(set) |
> > > > +				PS_Y_HORZ_FILTER_SELECT(set);
> > > > +
> > > > +	}
> > > > +	return scaler_filter_ctl;
> > > =

> > > This function does too many things.
> > =

> > I was thinking to have a common function which configures the filter an=
d also
> > provides the register bits (ps_ctrl) to select a desired filter so that=
 we need
> > not have extra condition to figure out filter select register bits wher=
e this
> > function is being called.
> > How about renaming this function to some better name like  =

> > skl_scaler_set_and_get_filter_select() or something else? =

> > Or shall I breakdown this function into multiple functions?
> =

> I'd just inline the PS_CTRL stuff into the current function.

I am yet to verify this, but would like to get your early comments.
How about something like this? -

+inline u32 skl_scaler_get_filter_select(enum drm_scaling_filter filter, in=
t set)
+{
+       u32 filter_select =3D PS_FILTER_MEDIUM;
+
+       if (filter =3D=3D DRM_SCALING_FILTER_NEAREST_NEIGHBOR) {
+               filter_select =3D PS_FILTER_PROGRAMMED |
+                       PS_UV_VERT_FILTER_SELECT(set) |
+                       PS_UV_HORZ_FILTER_SELECT(set) |
+                       PS_Y_VERT_FILTER_SELECT(set) |
+                       PS_Y_HORZ_FILTER_SELECT(set);
+       }
+
+       return filter_select;
+}
+
+void skl_scaler_setup_filter(struct drm_i915_private *dev_priv, enum pipe =
pipe,
+                            int id, int set, enum drm_scaling_filter filte=
r)
+{
+       switch(filter) {
+       case DRM_SCALING_FILTER_DEFAULT:
+               break;
+       case DRM_SCALING_FILTER_NEAREST_NEIGHBOR:
+               cnl_program_nearest_filter_coefs(dev_priv, pipe, id, set);
+               break;
+       default:
+       default:
+               MISSING_CASE(filter);
+       }
+}
+
 static void skl_pfit_enable(const struct intel_crtc_state *crtc_state)
 {
        struct intel_crtc *crtc =3D to_intel_crtc(crtc_state->uapi.crtc);
@@ -6250,6 +6351,7 @@ static void skl_pfit_enable(const struct intel_crtc_s=
tate *crtc_state)
                int pfit_w, pfit_h, hscale, vscale;
                unsigned long irqflags;
                int id;
+               u32 ps_ctrl;

                if (drm_WARN_ON(&dev_priv->drm,
                                crtc_state->scaler_state.scaler_id < 0))
@@ -6268,8 +6370,13 @@ static void skl_pfit_enable(const struct intel_crtc_=
state *crtc_state)

                spin_lock_irqsave(&dev_priv->uncore.lock, irqflags);

-               intel_de_write_fw(dev_priv, SKL_PS_CTRL(pipe, id), PS_SCALE=
R_EN |
-                                 PS_FILTER_MEDIUM | scaler_state->scalers[=
id].mode);
+                skl_scaler_setup_filter(dev_priv, pipe, id, 0,
+                                        crtc_state->uapi.scaling_filter);
+
+               ps_ctrl =3D skl_scaler_get_filter_select(crtc_state->uapi.s=
caling_filter, 0);
+               ps_ctrl |=3D  PS_SCALER_EN | scaler_state->scalers[id].mode;
+
+               intel_de_write_fw(dev_priv, SKL_PS_CTRL(pipe, id), ps_ctrl);
                intel_de_write_fw(dev_priv, SKL_PS_VPHASE(pipe, id),
                                  PS_Y_PHASE(0) | PS_UV_RGB_PHASE(uv_rgb_vp=
hase));
                intel_de_write_fw(dev_priv, SKL_PS_HPHASE(pipe, id),
@@ -16703,6 +16810,11 @@ static int intel_crtc_init(struct drm_i915_private=
 *dev_priv, enum pipe pipe)
                dev_priv->plane_to_crtc_mapping[i9xx_plane] =3D crtc;
        }

Thanks,
Pankaj

> =

> > =

> > Any suggestions?
> > =

> > > =

> > > > +}
> > > > +
> > > >  static void skl_pfit_enable(const struct intel_crtc_state
> > > > *crtc_state)  {
> > > >  	struct intel_crtc *crtc =3D to_intel_crtc(crtc_state->uapi.crtc);
> > > > @@ -6316,12 +6335,14 @@ static void skl_pfit_enable(const struct
> > > intel_crtc_state *crtc_state)
> > > >  	enum pipe pipe =3D crtc->pipe;
> > > >  	const struct intel_crtc_scaler_state *scaler_state =3D
> > > >  		&crtc_state->scaler_state;
> > > > +	const struct drm_crtc_state *state =3D &crtc_state->uapi;
> > > =

> > > Pls don't add this kind of aliases. We're moving away from using the =
drm_ types
> > > as much as possible.
> > =

> > OK.
> > =

> > > =

> > > >
> > > >  	if (crtc_state->pch_pfit.enabled) {
> > > >  		u16 uv_rgb_hphase, uv_rgb_vphase;
> > > >  		int pfit_w, pfit_h, hscale, vscale;
> > > >  		unsigned long irqflags;
> > > >  		int id;
> > > > +		int scaler_filter_ctl;
> > > =

> > > It's a register value so u32. I'd also
> > =

> > Yes, I missed it. Thanks for pointing out.
> > =

> > > s/scaler_filter_ctl/filter_select/ or something like that.
> > > =

> > > Alternatively we could just call it ps_ctrl and have it contain the f=
ull register
> > > value for that particular register.
> > =

> > ps_ctrl sounds better, will use this name.
> > =

> > > =

> > > >
> > > >  		if (drm_WARN_ON(&dev_priv->drm,
> > > >  				crtc_state->scaler_state.scaler_id < 0)) @@ -
> > > 6340,8 +6361,12 @@
> > > > static void skl_pfit_enable(const struct intel_crtc_state *crtc_sta=
te)
> > > >
> > > >  		spin_lock_irqsave(&dev_priv->uncore.lock, irqflags);
> > > >
> > > > -		intel_de_write_fw(dev_priv, SKL_PS_CTRL(pipe, id),
> > > PS_SCALER_EN |
> > > > -				  PS_FILTER_MEDIUM | scaler_state-
> > > >scalers[id].mode);
> > > > +		scaler_filter_ctl =3D
> > > > +			skl_scaler_crtc_setup_filter(dev_priv, pipe, id, 0,
> > > > +						state->scaling_filter);
> > > > +		intel_de_write_fw(dev_priv, SKL_PS_CTRL(pipe, id),
> > > > +				  PS_SCALER_EN | scaler_filter_ctl |
> > > > +				  scaler_state->scalers[id].mode);
> > > >  		intel_de_write_fw(dev_priv, SKL_PS_VPHASE(pipe, id),
> > > >  				  PS_Y_PHASE(0) |
> > > PS_UV_RGB_PHASE(uv_rgb_vphase));
> > > >  		intel_de_write_fw(dev_priv, SKL_PS_HPHASE(pipe, id), @@ -
> > > 16777,6
> > > > +16802,9 @@ static int intel_crtc_init(struct drm_i915_private *dev=
_priv,
> > > enum pipe pipe)
> > > >  		dev_priv->plane_to_crtc_mapping[i9xx_plane] =3D crtc;
> > > >  	}
> > > >
> > > > +	if (INTEL_GEN(dev_priv) >=3D 10)
> > > > +		drm_crtc_enable_scaling_filter(&crtc->base);
> > > > +
> > > >  	intel_color_init(crtc);
> > > >
> > > >  	intel_crtc_crc_init(crtc);
> > > > diff --git a/drivers/gpu/drm/i915/display/intel_sprite.c
> > > > b/drivers/gpu/drm/i915/display/intel_sprite.c
> > > > index deda351719db..ac3fd9843ace 100644
> > > > --- a/drivers/gpu/drm/i915/display/intel_sprite.c
> > > > +++ b/drivers/gpu/drm/i915/display/intel_sprite.c
> > > > @@ -395,6 +395,26 @@ skl_plane_max_stride(struct intel_plane *plane,
> > > >  		return min(8192 * cpp, 32768);
> > > >  }
> > > >
> > > > +static u32
> > > > +skl_scaler_plane_setup_filter(struct drm_i915_private *dev_priv, e=
num pipe
> > > pipe,
> > > > +			      int id, int set,
> > > > +			      enum drm_plane_scaling_filter filter) {
> > > > +	u32 scaler_filter_ctl =3D PS_FILTER_MEDIUM;
> > > > +
> > > > +	if (filter =3D=3D DRM_PLANE_SCALING_FILTER_NEAREST_NEIGHBOR) {
> > > > +		skl_scaler_setup_nearest_neighbor_filter(dev_priv, pipe, id,
> > > > +							 set);
> > > > +		scaler_filter_ctl =3D PS_FILTER_PROGRAMMED |
> > > > +				PS_UV_VERT_FILTER_SELECT(set) |
> > > > +				PS_UV_HORZ_FILTER_SELECT(set) |
> > > > +				PS_Y_VERT_FILTER_SELECT(set) |
> > > > +				PS_Y_HORZ_FILTER_SELECT(set);
> > > > +
> > > > +	}
> > > > +	return scaler_filter_ctl;
> > > > +}
> > > > +
> > > =

> > > We don't want such copy pasta between planes and crtcs.
> > =

> > Yeah, got it. =

> > Will add a common enum drm_scaling_filter and use it.
> > =

> > Thanks,
> > Pankaj
> >  =

> > > =

> > > >  static void
> > > >  skl_program_scaler(struct intel_plane *plane,
> > > >  		   const struct intel_crtc_state *crtc_state, @@ -406,6 +426,7
> > > @@
> > > > skl_program_scaler(struct intel_plane *plane,
> > > >  	int scaler_id =3D plane_state->scaler_id;
> > > >  	const struct intel_scaler *scaler =3D
> > > >  		&crtc_state->scaler_state.scalers[scaler_id];
> > > > +	const struct drm_plane_state *state =3D &plane_state->uapi;
> > > >  	int crtc_x =3D plane_state->uapi.dst.x1;
> > > >  	int crtc_y =3D plane_state->uapi.dst.y1;
> > > >  	u32 crtc_w =3D drm_rect_width(&plane_state->uapi.dst);
> > > > @@ -413,6 +434,7 @@ skl_program_scaler(struct intel_plane *plane,
> > > >  	u16 y_hphase, uv_rgb_hphase;
> > > >  	u16 y_vphase, uv_rgb_vphase;
> > > >  	int hscale, vscale;
> > > > +	int scaler_filter_ctl;
> > > >
> > > >  	hscale =3D drm_rect_calc_hscale(&plane_state->uapi.src,
> > > >  				      &plane_state->uapi.dst,
> > > > @@ -439,8 +461,12 @@ skl_program_scaler(struct intel_plane *plane,
> > > >  		uv_rgb_vphase =3D skl_scaler_calc_phase(1, vscale, false);
> > > >  	}
> > > >
> > > > +	scaler_filter_ctl =3D
> > > > +		skl_scaler_plane_setup_filter(dev_priv, pipe, scaler_id, 0,
> > > > +					      state->scaling_filter);
> > > >  	intel_de_write_fw(dev_priv, SKL_PS_CTRL(pipe, scaler_id),
> > > > -			  PS_SCALER_EN | PS_PLANE_SEL(plane->id) | scaler-
> > > >mode);
> > > > +			  PS_SCALER_EN | PS_PLANE_SEL(plane->id) |
> > > > +			  scaler->mode | scaler_filter_ctl);
> > > >  	intel_de_write_fw(dev_priv, SKL_PS_VPHASE(pipe, scaler_id),
> > > >  			  PS_Y_PHASE(y_vphase) |
> > > PS_UV_RGB_PHASE(uv_rgb_vphase));
> > > >  	intel_de_write_fw(dev_priv, SKL_PS_HPHASE(pipe, scaler_id), @@
> > > > -3121,6 +3147,9 @@ skl_universal_plane_create(struct drm_i915_priva=
te
> > > > *dev_priv,
> > > >
> > > >  	drm_plane_create_zpos_immutable_property(&plane->base, plane_id);
> > > >
> > > > +	if (INTEL_GEN(dev_priv) >=3D 10)
> > > > +		drm_plane_enable_scaling_filter(&plane->base);
> > > > +
> > > >  	drm_plane_helper_add(&plane->base, &intel_plane_helper_funcs);
> > > >
> > > >  	return plane;
> > > > --
> > > > 2.23.0
> > > =

> > > --
> > > Ville Syrj=E4l=E4
> > > Intel
> =

> -- =

> Ville Syrj=E4l=E4
> Intel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
