Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D49961797F1
	for <lists+dri-devel@lfdr.de>; Wed,  4 Mar 2020 19:31:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 511DB6E0E7;
	Wed,  4 Mar 2020 18:31:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEFB36E0E7;
 Wed,  4 Mar 2020 18:31:29 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 04 Mar 2020 10:31:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,514,1574150400"; d="scan'208";a="229415047"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by orsmga007.jf.intel.com with SMTP; 04 Mar 2020 10:31:25 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 04 Mar 2020 20:31:23 +0200
Date: Wed, 4 Mar 2020 20:31:23 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Manasi Navare <manasi.d.navare@intel.com>
Subject: Re: [PATCH v3] drm/dp: Add function to parse EDID descriptors for
 adaptive sync limits
Message-ID: <20200304183123.GG13686@intel.com>
References: <20200303000859.29339-1-manasi.d.navare@intel.com>
 <20200303134212.GR13686@intel.com>
 <20200304173606.GA19311@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200304173606.GA19311@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, Kazlauskas@freedesktop.org,
 dri-devel@lists.freedesktop.org, Nicholas <Nicholas.Kazlauskas@amd.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Mar 04, 2020 at 09:36:06AM -0800, Manasi Navare wrote:
> On Tue, Mar 03, 2020 at 03:42:12PM +0200, Ville Syrj=E4l=E4 wrote:
> > On Mon, Mar 02, 2020 at 04:08:59PM -0800, Manasi Navare wrote:
> > > Adaptive Sync is a VESA feature so add a DRM core helper to parse
> > > the EDID's detailed descritors to obtain the adaptive sync monitor ra=
nge.
> > > Store this info as part fo drm_display_info so it can be used
> > > across all drivers.
> > > This part of the code is stripped out of amdgpu's function
> > > amdgpu_dm_update_freesync_caps() to make it generic and be used
> > > across all DRM drivers
> > > =

> > > v3:
> > > * Remove the edid parsing restriction for just DP (Nicholas)
> > > * Use drm_for_each_detailed_block (Ville)
> > > * Make the drm_get_adaptive_sync_range function static (Harry, Jani)
> > > v2:
> > > * Change vmin and vmax to use u8 (Ville)
> > > * Dont store pixel clock since that is just a max dotclock
> > > and not related to VRR mode (Manasi)
> > > =

> > > Cc: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> > > Cc: Harry Wentland <harry.wentland@amd.com>
> > > Cc: Clinton A Taylor <clinton.a.taylor@intel.com>
> > > Cc: Kazlauskas, Nicholas <Nicholas.Kazlauskas@amd.com>
> > > Signed-off-by: Manasi Navare <manasi.d.navare@intel.com>
> > > ---
> > >  drivers/gpu/drm/drm_edid.c  | 44 +++++++++++++++++++++++++++++++++++=
++
> > >  include/drm/drm_connector.h | 22 +++++++++++++++++++
> > >  2 files changed, 66 insertions(+)
> > > =

> > > diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> > > index ad41764a4ebe..e3f152180b6b 100644
> > > --- a/drivers/gpu/drm/drm_edid.c
> > > +++ b/drivers/gpu/drm/drm_edid.c
> > > @@ -4938,6 +4938,47 @@ static void drm_parse_cea_ext(struct drm_conne=
ctor *connector,
> > >  	}
> > >  }
> > >  =

> > > +static
> > > +void get_adaptive_sync_range(struct detailed_timing *timing,
> > > +			     void *info_adaptive_sync)
> > > +{
> > > +	struct drm_adaptive_sync_info *adaptive_sync =3D info_adaptive_sync;
> > > +	const struct detailed_non_pixel *data =3D &timing->data.other_data;
> > > +	const struct detailed_data_monitor_range *range =3D &data->data.ran=
ge;
> > > +
> > > +	if (data->type !=3D EDID_DETAIL_MONITOR_RANGE)a
> > =

> > is_display_descriptor()
> =

> Will change to use is_display_descriptor()
> =

> > =

> > > +		return;
> > > +
> > > +	/*
> > > +	 * Check for flag range limits only. If flag =3D=3D 1 then
> > > +	 * no additional timing information provided.
> > > +	 * Default GTF, GTF Secondary curve and CVT are not
> > > +	 * supported
> > > +	 */
> > > +	if (range->flags !=3D 1)
> > =

> > Pls name the flags.
> =

> I dont see that we have any enum with the flag names, do you want me to d=
efine them looking
> at EDID spec?

What else?

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
