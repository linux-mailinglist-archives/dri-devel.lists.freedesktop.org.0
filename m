Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3032126962A
	for <lists+dri-devel@lfdr.de>; Mon, 14 Sep 2020 22:16:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 634326E580;
	Mon, 14 Sep 2020 20:16:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14FCA6E578;
 Mon, 14 Sep 2020 20:16:37 +0000 (UTC)
IronPort-SDR: Eezhq8znlUQgl7oB6jFGLlg4lMuACfCE4UA0OMf4wTfk8kGysIOEPgbtLBQsP4mfqF3W1GkBAg
 kUaoM2wwz5Xg==
X-IronPort-AV: E=McAfee;i="6000,8403,9744"; a="139166796"
X-IronPort-AV: E=Sophos;i="5.76,427,1592895600"; d="scan'208";a="139166796"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2020 13:16:37 -0700
IronPort-SDR: z0I5MKAJo8dtYgaSsEMfUQqVNC0Bf4l6gXPSqtUWZtEgXmQnT7iDZXHbOiz0qeaJyQioRpOSkS
 CSnJt4hefxRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,427,1592895600"; d="scan'208";a="335404443"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by orsmga008.jf.intel.com with SMTP; 14 Sep 2020 13:16:35 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 14 Sep 2020 23:16:34 +0300
Date: Mon, 14 Sep 2020 23:16:34 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [Intel-gfx] [PATCH 2/3] drm/atomic-helper: Remove the
 timestamping constant update from
 drm_atomic_helper_update_legacy_modeset_state()
Message-ID: <20200914201634.GC6112@intel.com>
References: <20200907120026.6360-1-ville.syrjala@linux.intel.com>
 <20200907120026.6360-2-ville.syrjala@linux.intel.com>
 <20200907181256.GB2352366@phenom.ffwll.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200907181256.GB2352366@phenom.ffwll.local>
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Sep 07, 2020 at 08:12:56PM +0200, Daniel Vetter wrote:
> On Mon, Sep 07, 2020 at 03:00:25PM +0300, Ville Syrjala wrote:
> > From: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> > =

> > The timestamping constants have nothing to do with any legacy state
> > so should not be updated from
> > drm_atomic_helper_update_legacy_modeset_state().
> > =

> > Let's make everyone call drm_atomic_helper_calc_timestamping_constants()
> > directly instead of relying on
> > drm_atomic_helper_update_legacy_modeset_state() to call it.
> > =

> > @@
> > expression S;
> > @@
> > - drm_atomic_helper_calc_timestamping_constants(S);
> > =

> > @@
> > expression D, S;
> > @@
> >   drm_atomic_helper_update_legacy_modeset_state(D, S);
> > + drm_atomic_helper_calc_timestamping_constants(S);
> > =

> > Signed-off-by: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> =

> I think the kerneldoc for
> drm_crtc_vblank_helper_get_vblank/_timestamp_internal (both of them) also
> needs to be updated to mention the new function. With that fixed:
> =

> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

Fixed the docs while applying. Thanks for the review.

> =

> =

> > ---
> >  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 1 +
> >  drivers/gpu/drm/drm_atomic_helper.c               | 7 ++-----
> >  drivers/gpu/drm/i915/display/intel_display.c      | 1 +
> >  drivers/gpu/drm/nouveau/dispnv50/disp.c           | 1 +
> >  4 files changed, 5 insertions(+), 5 deletions(-)
> > =

> > diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/driver=
s/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> > index 490684787cff..0511097343da 100644
> > --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> > +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> > @@ -7397,6 +7397,7 @@ static void amdgpu_dm_atomic_commit_tail(struct d=
rm_atomic_state *state)
> >  	int crtc_disable_count =3D 0;
> >  =

> >  	drm_atomic_helper_update_legacy_modeset_state(dev, state);
> > +	drm_atomic_helper_calc_timestamping_constants(state);
> >  =

> >  	dm_state =3D dm_atomic_get_new_state(state);
> >  	if (dm_state && dm_state->context) {
> > diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_=
atomic_helper.c
> > index 673e3fc282d9..45ee613c8efd 100644
> > --- a/drivers/gpu/drm/drm_atomic_helper.c
> > +++ b/drivers/gpu/drm/drm_atomic_helper.c
> > @@ -1115,9 +1115,7 @@ disable_outputs(struct drm_device *dev, struct dr=
m_atomic_state *old_state)
> >   * @old_state: atomic state object with old state structures
> >   *
> >   * This function updates all the various legacy modeset state pointers=
 in
> > - * connectors, encoders and CRTCs. It also updates the timestamping co=
nstants
> > - * used for precise vblank timestamps by calling
> > - * drm_calc_timestamping_constants().
> > + * connectors, encoders and CRTCs.
> >   *
> >   * Drivers can use this for building their own atomic commit if they d=
on't have
> >   * a pure helper-based modeset implementation.
> > @@ -1187,8 +1185,6 @@ drm_atomic_helper_update_legacy_modeset_state(str=
uct drm_device *dev,
> >  			crtc->y =3D new_plane_state->src_y >> 16;
> >  		}
> >  	}
> > -
> > -	drm_atomic_helper_calc_timestamping_constants(old_state);
> >  }
> >  EXPORT_SYMBOL(drm_atomic_helper_update_legacy_modeset_state);
> >  =

> > @@ -1296,6 +1292,7 @@ void drm_atomic_helper_commit_modeset_disables(st=
ruct drm_device *dev,
> >  	disable_outputs(dev, old_state);
> >  =

> >  	drm_atomic_helper_update_legacy_modeset_state(dev, old_state);
> > +	drm_atomic_helper_calc_timestamping_constants(old_state);
> >  =

> >  	crtc_set_mode(dev, old_state);
> >  }
> > diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu=
/drm/i915/display/intel_display.c
> > index ec148a8da2c2..035840ce3825 100644
> > --- a/drivers/gpu/drm/i915/display/intel_display.c
> > +++ b/drivers/gpu/drm/i915/display/intel_display.c
> > @@ -15578,6 +15578,7 @@ static void intel_atomic_commit_tail(struct int=
el_atomic_state *state)
> >  =

> >  	if (state->modeset) {
> >  		drm_atomic_helper_update_legacy_modeset_state(dev, &state->base);
> > +		drm_atomic_helper_calc_timestamping_constants(&state->base);
> >  =

> >  		intel_set_cdclk_pre_plane_update(state);
> >  =

> > diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/=
nouveau/dispnv50/disp.c
> > index 7799530e07c1..b6d1b926bc5e 100644
> > --- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
> > +++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
> > @@ -2069,6 +2069,7 @@ nv50_disp_atomic_commit_tail(struct drm_atomic_st=
ate *state)
> >  	drm_atomic_helper_wait_for_fences(dev, state, false);
> >  	drm_atomic_helper_wait_for_dependencies(state);
> >  	drm_atomic_helper_update_legacy_modeset_state(dev, state);
> > +	drm_atomic_helper_calc_timestamping_constants(state);
> >  =

> >  	if (atom->lock_core)
> >  		mutex_lock(&disp->mutex);
> > -- =

> > 2.26.2
> > =

> > _______________________________________________
> > Intel-gfx mailing list
> > Intel-gfx@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/intel-gfx
> =

> -- =

> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
