Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EDC3B177989
	for <lists+dri-devel@lfdr.de>; Tue,  3 Mar 2020 15:50:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F7476EA7C;
	Tue,  3 Mar 2020 14:50:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3F766EA7C
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Mar 2020 14:49:59 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 03 Mar 2020 06:49:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,511,1574150400"; d="scan'208";a="228934740"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by orsmga007.jf.intel.com with SMTP; 03 Mar 2020 06:49:56 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 03 Mar 2020 16:49:55 +0200
Date: Tue, 3 Mar 2020 16:49:55 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Vladimir Zapolskiy <vz@mleia.com>
Subject: Re: [PATCH 27/33] drm/panel-simple: Fix dotclock for Sharp LQ035Q7DB03
Message-ID: <20200303144955.GU13686@intel.com>
References: <20200302203452.17977-1-ville.syrjala@linux.intel.com>
 <20200302203452.17977-28-ville.syrjala@linux.intel.com>
 <dbdfa047-e8b5-ee08-2824-1069b8292d89@mleia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <dbdfa047-e8b5-ee08-2824-1069b8292d89@mleia.com>
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
Cc: Thierry Reding <treding@nvidia.com>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Mar 02, 2020 at 11:40:07PM +0200, Vladimir Zapolskiy wrote:
> Hi Ville,
> =

> On 3/2/20 10:34 PM, Ville Syrjala wrote:
> > From: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> > =

> > The currently listed dotclock disagrees with the currently
> > listed vrefresh rate. Change the dotclock to match the vrefresh.
> > =

> > Someone tell me which (if either) of the dotclock or vreresh is
> > correct?
> =

> yes, I will tell you, see my answer below.
> =

> Adding Linus as a person who may be interested in PL111 specifics.
> =

> > Cc: Vladimir Zapolskiy <vz@mleia.com>
> > Cc: Rob Herring <robh@kernel.org>
> > Cc: Thierry Reding <treding@nvidia.com>
> > Signed-off-by: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> > ---
> >  drivers/gpu/drm/panel/panel-simple.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > =

> > diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/pan=
el/panel-simple.c
> > index 3012b47c1e4e..7526af2d6d95 100644
> > --- a/drivers/gpu/drm/panel/panel-simple.c
> > +++ b/drivers/gpu/drm/panel/panel-simple.c
> > @@ -2949,7 +2949,7 @@ static const struct panel_desc sharp_lq070y3dg3b =
=3D {
> >  };
> >  =

> >  static const struct drm_display_mode sharp_lq035q7db03_mode =3D {
> > -	.clock =3D 5500,
> > +	.clock =3D 5419,
> >  	.hdisplay =3D 240,
> >  	.hsync_start =3D 240 + 16,
> >  	.hsync_end =3D 240 + 16 + 7,
> > =

> =

> Here .clock is correct, you may find the usage of the panel in
> lpc3250-phy3250.dts example, and the PL111 controller on the SoC
> won't be able to provide the exactly computed `.clock =3D 5419'.

OK, I'll drop this one.

> =

> So, I have to NAK this change, in this example the difference
> between the declared and the computed .vreresh is one Hz, which
> I hope can be accepted as negligible and ignorable, otherwise,
> if you insist, please correct the .vrefresh from 60 to 61.

I'm going to nuke .vrefresh entirely.

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
