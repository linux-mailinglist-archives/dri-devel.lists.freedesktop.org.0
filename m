Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 81EB01779DB
	for <lists+dri-devel@lfdr.de>; Tue,  3 Mar 2020 16:03:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18BD36E8F9;
	Tue,  3 Mar 2020 15:03:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4B426E8F9
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Mar 2020 15:03:40 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 03 Mar 2020 07:03:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,511,1574150400"; d="scan'208";a="233774608"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by fmsmga008.fm.intel.com with SMTP; 03 Mar 2020 07:03:37 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 03 Mar 2020 17:03:36 +0200
Date: Tue, 3 Mar 2020 17:03:36 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: "H. Nikolaus Schaller" <hns@goldelico.com>
Subject: Re: [PATCH 24/33] drm/panel-simple: Fix dotclock for Ortustech
 COM37H3M
Message-ID: <20200303150336.GZ13686@intel.com>
References: <20200302203452.17977-1-ville.syrjala@linux.intel.com>
 <20200302203452.17977-25-ville.syrjala@linux.intel.com>
 <4320E187-FAA1-4033-A02C-7DA1F9B68A52@goldelico.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4320E187-FAA1-4033-A02C-7DA1F9B68A52@goldelico.com>
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
Cc: Discussions about the Letux Kernel <letux-kernel@openphoenux.org>,
 Sam Ravnborg <sam@ravnborg.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Mar 02, 2020 at 10:24:14PM +0100, H. Nikolaus Schaller wrote:
> Hi Ville,
> =

> > Am 02.03.2020 um 21:34 schrieb Ville Syrjala <ville.syrjala@linux.intel=
.com>:
> > =

> > From: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> > =

> > The currently listed dotclock disagrees with the currently
> > listed vrefresh rate. Change the dotclock to match the vrefresh.
> > =

> > Someone tell me which (if either) of the dotclock or vreresh is
> > correct?
> =

> Data sheet of COM37H3M99DTC says:
> =

> 			MIN	TYP	MAX
> CLK frequency 	fCLK	18	19.8	27	MHz
> VSYNC Frequency	fVSYNC	54	60	66	Hz
> VSYNC cycle time tv	646	650	700	H
> HSYNC frequency	fHSYNC	--	39.0	50.0	Khz
> HSYNC cycle time th	504	508	630	CLK
> =

> But data sheet of COM37H3M05DTC says
> =

> 			MIN	TYP	MAX
> CLK frequency 	fCLK	--	22.4	26.3	MHz (in VGA mode - there is also an QVGA=
 mode)
> VSYNC Frequency	fVSYNC	54	60	66	Hz
> VSYNC cycle time tv	--	650	--	H
> HSYNC frequency	fHSYNC	--	39.3	--	Khz
> HSYNC cycle time th	--	570	--	CLK
> =

> So there are two different subvariants of the same panel.
> =

> If I remember correctly, the 05 is older (April 2010)
> and the 99DTC newer (Dec 2011).
> =

> So 22 MHz isn't outside of either spec but may be higher
> than needed for the 99DTC. I.e. the panel is probably
> running at higher frame rate than 60 fps.
> =

> Hm. I think we should define some compromise. I.e.
> =

> .clock =3D 22230
> .vrefresh =3D 60
> .vtotal =3D 650
> .htotal =3D 570
> =

> Probably we originally tried to do this with the parameter
> set but got something wrong.
> =

> If you agree with this approach, I can try to figure out
> the other parameters so that they should fit both panel
> variants. I can only test with COM37H3M99DTC since I
> do no longer have a device with COM37H3M05DTC.
> =

> In general it seems that the structure drm_display_mode
> is overdetermined.
> =

> Either .clock could be calculated from .vrefresh (and
> the other .vtotal and .htotal) or vice versa like I
> did for the proposal above.
> =

> I haven't looked into the driver code, but would it be
> possible to specify .clock =3D 0 (or leave it out) to
> calculate it bottom up? This would avoid such inconsistencies.

I'm going to remove .vrefresh entirely from the struct.
It'll just be calculated from the other timings as needed.

> =

> On the other hand it is not easily visible any more
> from the code if the clock is in range of the data
> sheet limits.
> =

> BR and thanks,
> Nikolaus
> =

> > =

> > Cc: H. Nikolaus Schaller <hns@goldelico.com>
> > Cc: Sam Ravnborg <sam@ravnborg.org>
> > Signed-off-by: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> > ---
> > drivers/gpu/drm/panel/panel-simple.c | 2 +-
> > 1 file changed, 1 insertion(+), 1 deletion(-)
> > =

> > diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/pan=
el/panel-simple.c
> > index ca72b73408e9..f9b4f84bffb3 100644
> > --- a/drivers/gpu/drm/panel/panel-simple.c
> > +++ b/drivers/gpu/drm/panel/panel-simple.c
> > @@ -2617,7 +2617,7 @@ static const struct panel_desc ontat_yx700wv03 =
=3D {
> > };
> > =

> > static const struct drm_display_mode ortustech_com37h3m_mode  =3D {
> > -	.clock =3D 22153,
> > +	.clock =3D 19842,
> > 	.hdisplay =3D 480,
> > 	.hsync_start =3D 480 + 8,
> > 	.hsync_end =3D 480 + 8 + 10,
> > -- =

> > 2.24.1
> > =


-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
