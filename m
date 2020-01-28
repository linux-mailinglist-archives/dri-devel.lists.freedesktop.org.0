Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 78A7A14B3AD
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jan 2020 12:44:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAB006EDE8;
	Tue, 28 Jan 2020 11:44:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B45F6EDE6;
 Tue, 28 Jan 2020 11:44:33 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 28 Jan 2020 03:44:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,373,1574150400"; d="scan'208";a="261403587"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by fmsmga002.fm.intel.com with SMTP; 28 Jan 2020 03:44:05 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 28 Jan 2020 13:44:04 +0200
Date: Tue, 28 Jan 2020 13:44:04 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Alex Deucher <alexdeucher@gmail.com>
Subject: Re: [PATCH 5/8] drm/edid: Document why we don't bounds check the
 DispID CEA block start/end
Message-ID: <20200128114404.GG13686@intel.com>
References: <20200124200231.10517-1-ville.syrjala@linux.intel.com>
 <20200124200231.10517-5-ville.syrjala@linux.intel.com>
 <CADnq5_MM5VHhZan=Q-NUjgvmyovg_33DjvNcZ3kO0=rxCkizQg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CADnq5_MM5VHhZan=Q-NUjgvmyovg_33DjvNcZ3kO0=rxCkizQg@mail.gmail.com>
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
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Andres Rodriguez <andresx7@gmail.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jan 27, 2020 at 05:30:42PM -0500, Alex Deucher wrote:
> On Fri, Jan 24, 2020 at 3:03 PM Ville Syrjala
> <ville.syrjala@linux.intel.com> wrote:
> >
> > From: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> >
> > After much head scratching I managed to convince myself that
> > for_each_displayid_db() has already done the bounds checks for
> > the DispID CEA data block. Which is why we don't need to repeat
> > them in cea_db_offsets(). To avoid having to go through that
> > pain again in the future add a comment which explains this fact.
> >
> > Cc: Andres Rodriguez <andresx7@gmail.com>
> > Signed-off-by: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> > ---
> >  drivers/gpu/drm/drm_edid.c | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> > index 3df5744026b0..0369a54e3d32 100644
> > --- a/drivers/gpu/drm/drm_edid.c
> > +++ b/drivers/gpu/drm/drm_edid.c
> > @@ -4001,6 +4001,10 @@ cea_db_offsets(const u8 *cea, int *start, int *e=
nd)
> >          *   no non-DTD data.
> >          */
> >         if (cea[0] =3D=3D DATA_BLOCK_CTA) {
> > +               /*
> > +                * for_each_displayid_db() has already verified
> > +                * that these stay within expected bounds.
> > +                */
> =

> I think the preferred format is to have the start of the comment be on
> the first line after the /* with that fixed:

Nope.

> Acked-by: Alex Deucher <alexander.deucher@amd.com>
> =

> >                 *start =3D 3;
> >                 *end =3D *start + cea[2];
> >         } else if (cea[0] =3D=3D CEA_EXT) {
> > --
> > 2.24.1
> >
> > _______________________________________________
> > dri-devel mailing list
> > dri-devel@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
