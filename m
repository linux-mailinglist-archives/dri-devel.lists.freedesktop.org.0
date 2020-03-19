Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 34EDD18C304
	for <lists+dri-devel@lfdr.de>; Thu, 19 Mar 2020 23:34:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF1BD6E061;
	Thu, 19 Mar 2020 22:34:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 657276E061;
 Thu, 19 Mar 2020 22:34:05 +0000 (UTC)
IronPort-SDR: ODMoe5urvPd+DW4cS22OH+6sx24q5KmPXUcJxqgWigHKGkMSkFHrHfHzUwSN6s358v4SHn5ugj
 dOoh1bFQQODw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2020 15:34:04 -0700
IronPort-SDR: KY9ctwN7zMQ8WOhjZXPJ8az9vO+hT2/rMerYpZVC00Ajl91ipnmpyAZD0lcLDQvPfed8sBEgiI
 hfZgoRJtOLBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,573,1574150400"; d="scan'208";a="418514153"
Received: from labuser-z97x-ud5h.jf.intel.com (HELO intel.com)
 ([10.165.21.211])
 by orsmga005.jf.intel.com with ESMTP; 19 Mar 2020 15:34:04 -0700
Date: Thu, 19 Mar 2020 15:35:41 -0700
From: Manasi Navare <manasi.d.navare@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
Subject: Re: [PATCH 3/3] drm/i915/dp: intel_dp connector hook for VRR support
Message-ID: <20200319223541.GC11219@intel.com>
References: <20200318063517.3844-1-manasi.d.navare@intel.com>
 <20200318063517.3844-3-manasi.d.navare@intel.com>
 <87v9n0d52z.fsf@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87v9n0d52z.fsf@intel.com>
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
Cc: Aditya Swarup <aditya.swarup@intel.com>, dri-devel@lists.freedesktop.org,
 Nicholas Kazlauskas <Nicholas.Kazlauskas@amd.com>,
 intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Mar 19, 2020 at 12:14:28PM +0200, Jani Nikula wrote:
> On Tue, 17 Mar 2020, Manasi Navare <manasi.d.navare@intel.com> wrote:
> > This defines the get_vrr_support hook for intel DP connector
> > VRR support is set to true based on the DPCD ignore MSA and
> > EDID monitor range
> =

> Yeah... but what do you use it for?
>

Hi Jani,

My idea of adding the intel_dp->vrr_capable variable was to =

store the vrr capability in intel_dp for internal i915 use later when
we decide on vrr crtc states etc and configure the pipe etc for VRR modes.

I added this in a hook that gets called in the connector probe function
right after detect and get_modes() since thats when we will have parse
the EDID monitor range and populated that in drm_display_info struct.

This hook is also needed for us to then set the vrr capable property
for that connector.

But yes no that I rethink on of i actually need something in intel_dp
I feel that I can just get away with crtc_state->vrr_capable
that will be computed in atomic check based on the drm_display_info
and dpcd read there and in this hook we can just set the vrr capable proper=
ty.

But that would mean duplicating this conditional code in atomic check.
What would be your suggestion?
Cache it here in intel_dp and just use this to set crtc_state->VRR values i=
n modeset
or set it directly in atomic check?

In terms of reseting it, I can set this to 0 in intel_dp_detect(), if conne=
ctor disconnected path
where i reset the dsc_dpcd and dp_compliance variables?

Regards
Manasi
 =

> >
> > Cc: Jani Nikula <jani.nikula@linux.intel.com>
> > Cc: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> > Cc: Harry Wentland <harry.wentland@amd.com>
> > Cc: Nicholas Kazlauskas <Nicholas.Kazlauskas@amd.com>
> > Cc: Aditya Swarup <aditya.swarup@intel.com>
> > Signed-off-by: Manasi Navare <manasi.d.navare@intel.com>
> > ---
> >  .../drm/i915/display/intel_display_types.h    |  3 +++
> >  drivers/gpu/drm/i915/display/intel_dp.c       | 19 +++++++++++++++++++
> >  2 files changed, 22 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drive=
rs/gpu/drm/i915/display/intel_display_types.h
> > index 5e00e611f077..cd37ee6db1ff 100644
> > --- a/drivers/gpu/drm/i915/display/intel_display_types.h
> > +++ b/drivers/gpu/drm/i915/display/intel_display_types.h
> > @@ -1353,6 +1353,9 @@ struct intel_dp {
> >  =

> >  	/* Display stream compression testing */
> >  	bool force_dsc_en;
> > +
> > +	/* DP Variable refresh rate/ Adaptive sync support */
> > +	bool vrr_capable;
> =

> Only set, never read.
> =

> >  };
> >  =

> >  enum lspcon_vendor {
> > diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/=
i915/display/intel_dp.c
> > index 0a417cd2af2b..ccf5d868b5c1 100644
> > --- a/drivers/gpu/drm/i915/display/intel_dp.c
> > +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> > @@ -5860,6 +5860,24 @@ static int intel_dp_get_modes(struct drm_connect=
or *connector)
> >  	return 0;
> >  }
> >  =

> > +static void intel_dp_get_vrr_support(struct drm_connector *connector)
> > +{
> > +	struct intel_dp *intel_dp =3D intel_attached_dp(to_intel_connector(co=
nnector));
> > +	const struct drm_display_info *info =3D &connector->display_info;
> > +	struct drm_i915_private *dev_priv =3D to_i915(connector->dev);
> > +
> > +	/*
> > +	 * DP Sink is capable of Variable refresh video timings if
> > +	 * Ignore MSA bit is set in DPCD.
> > +	 * EDID monitor range also should be atleast 10 for reasonable
> > +	 * Adaptive sync/ VRR end user experience.
> > +	 */
> > +	if (INTEL_GEN(dev_priv) >=3D 12 &&
> > +	    drm_dp_sink_is_capable_without_timing_msa(intel_dp->dpcd) &&
> > +	    info->monitor_range.max_vfreq - info->monitor_range.min_vfreq > 1=
0)
> > +		intel_dp->vrr_capable =3D true;
> =

> So for now this is just a cached value for i915 use. I don't know what
> you'll need it for, but you also don't explain why it needs to be
> *cached* instead of having a helper to tell you based on the above
> data. You only ever set ->vrr_capable to true, but you never reset it
> back to false e.g. when the display is changed on the connector.
> =

> Furthermore, because of the placing of the hook call in the previous
> patch, this will only use whatever details ->get_modes gives you, not
> the fallback data.
> =

> BR,
> Jani.
> =

> =

> > +}
> > +
> >  static int
> >  intel_dp_connector_register(struct drm_connector *connector)
> >  {
> > @@ -6756,6 +6774,7 @@ static const struct drm_connector_helper_funcs in=
tel_dp_connector_helper_funcs =3D
> >  	.get_modes =3D intel_dp_get_modes,
> >  	.mode_valid =3D intel_dp_mode_valid,
> >  	.atomic_check =3D intel_dp_connector_atomic_check,
> > +	.get_adaptive_sync_support =3D intel_dp_get_vrr_support,
> >  };
> >  =

> >  static const struct drm_encoder_funcs intel_dp_enc_funcs =3D {
> =

> -- =

> Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
