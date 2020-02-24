Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C28416A70A
	for <lists+dri-devel@lfdr.de>; Mon, 24 Feb 2020 14:14:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 568686E4C4;
	Mon, 24 Feb 2020 13:14:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A9E76E4C1;
 Mon, 24 Feb 2020 13:14:30 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 24 Feb 2020 05:14:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,480,1574150400"; d="scan'208";a="255575855"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by orsmga002.jf.intel.com with SMTP; 24 Feb 2020 05:14:21 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 24 Feb 2020 15:14:20 +0200
Date: Mon, 24 Feb 2020 15:14:20 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH 04/12] drm: Nuke mode->vrefresh
Message-ID: <20200224131420.GW13686@intel.com>
References: <20200219203544.31013-1-ville.syrjala@linux.intel.com>
 <20200219203544.31013-5-ville.syrjala@linux.intel.com>
 <20200222123240.GD28287@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200222123240.GD28287@ravnborg.org>
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
Cc: Neil Armstrong <narmstrong@baylibre.com>, nouveau@lists.freedesktop.org,
 Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>,
 dri-devel@lists.freedesktop.org, Andrzej Hajda <a.hajda@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Thomas Hellstrom <thellstrom@vmware.com>,
 Joonyoung Shim <jy0922.shim@samsung.com>, Stefan Mavrodiev <stefan@olimex.com>,
 Jerry Han <hanxu5@huaqin.corp-partner.google.com>,
 Ben Skeggs <bskeggs@redhat.com>,
 VMware Graphics <linux-graphics-maintainer@vmware.com>,
 Jagan Teki <jagan@amarulasolutions.com>, Robert Chiras <robert.chiras@nxp.com>,
 Icenowy Zheng <icenowy@aosc.io>, Jonas Karlman <jonas@kwiboo.se>,
 intel-gfx@lists.freedesktop.org, linux-amlogic@lists.infradead.org,
 Vincent Abriou <vincent.abriou@st.com>,
 Jernej Skrabec <jernej.skrabec@siol.net>, Purism Kernel Team <kernel@puri.sm>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Feb 22, 2020 at 01:32:40PM +0100, Sam Ravnborg wrote:
> Hi Ville.
> =

> Nice patch - and diffstat looks good:
> >  63 files changed, 217 insertions(+), 392 deletions(-)
> =

> There is an item in the Documentation/gpu/todo.rst that
> describes this.
> Could you drop this from todo.rst in this patch too.

Yeah, missed the TODO. Looks like there's one for hsync
removal as well.

> =

> > diff --git a/drivers/gpu/drm/mcde/mcde_dsi.c b/drivers/gpu/drm/mcde/mcd=
e_dsi.c
> > index bb6528b01cd0..6dca5344c0b3 100644
> > --- a/drivers/gpu/drm/mcde/mcde_dsi.c
> > +++ b/drivers/gpu/drm/mcde/mcde_dsi.c
> > @@ -538,7 +538,7 @@ static void mcde_dsi_setup_video_mode(struct mcde_d=
si *d,
> >  	 */
> >  	/* (ps/s) / (pixels/s) =3D ps/pixels */
> >  	pclk =3D DIV_ROUND_UP_ULL(1000000000000,
> > -				(mode->vrefresh * mode->htotal * mode->vtotal));
> > +				(drm_mode_vrefresh(mode) * mode->htotal * mode->vtotal));
> >  	dev_dbg(d->dev, "picoseconds between two pixels: %llu\n",
> >  		pclk);
> >  =

> =

> This just caught my eye while browsing the patch.
> It looks like a backward way to get the clock.

Yep. I'll cook up a patch to switch this to ->clock.

> =

> But patch is fine, it was just a drive-by comment.
> =

> Whole patch is:
> Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
> (with or without removal of todo item added)
> =

> 	Sam

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
