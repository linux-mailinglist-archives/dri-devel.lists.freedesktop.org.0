Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C4CF16EA5A
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2020 16:45:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CA9C6E8EB;
	Tue, 25 Feb 2020 15:45:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5955F6E8DB;
 Tue, 25 Feb 2020 15:45:15 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 25 Feb 2020 07:45:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,484,1574150400"; d="scan'208";a="231057172"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by orsmga008.jf.intel.com with SMTP; 25 Feb 2020 07:45:07 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 25 Feb 2020 17:45:06 +0200
Date: Tue, 25 Feb 2020 17:45:06 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Andrzej Hajda <a.hajda@samsung.com>
Subject: Re: [PATCH 04/12] drm: Nuke mode->vrefresh
Message-ID: <20200225154506.GF13686@intel.com>
References: <20200219203544.31013-1-ville.syrjala@linux.intel.com>
 <CGME20200219203620eucas1p24b4990a91e758dbcf3e9b943669b0c8f@eucas1p2.samsung.com>
 <20200219203544.31013-5-ville.syrjala@linux.intel.com>
 <0f278771-79ce-fe23-e72c-3935dbe82d24@samsung.com>
 <20200225112114.GA13686@intel.com>
 <3ca785f2-9032-aaf9-0965-8657d31116ba@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3ca785f2-9032-aaf9-0965-8657d31116ba@samsung.com>
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
 dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>, Jagan Teki <jagan@amarulasolutions.com>,
 Thomas Hellstrom <thellstrom@vmware.com>,
 Joonyoung Shim <jy0922.shim@samsung.com>, Stefan Mavrodiev <stefan@olimex.com>,
 Jerry Han <hanxu5@huaqin.corp-partner.google.com>,
 VMware Graphics <linux-graphics-maintainer@vmware.com>,
 Ben Skeggs <bskeggs@redhat.com>, Robert Chiras <robert.chiras@nxp.com>,
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

On Tue, Feb 25, 2020 at 04:19:27PM +0100, Andrzej Hajda wrote:
> On 25.02.2020 12:21, Ville Syrj=E4l=E4 wrote:
> > On Mon, Feb 24, 2020 at 03:14:54PM +0100, Andrzej Hajda wrote:
> >> On 19.02.2020 21:35, Ville Syrjala wrote:
> >>> From: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> >>>
> >>> Get rid of mode->vrefresh and just calculate it on demand. Saves
> >>> a bit of space and avoids the cached value getting out of sync
> >>> with reality.
> >>>
> >>> Mostly done with cocci, with the following manual fixups:
> >>> - Remove the now empty loop in drm_helper_probe_single_connector_mode=
s()
> >>> - Fix __MODE() macro in ch7006_mode.c
> >>> - Fix DRM_MODE_ARG() macro in drm_modes.h
> >>> - Remove leftover comment from samsung_s6d16d0_mode
> >> ...
> >>> diff --git a/drivers/gpu/drm/panel/panel-arm-versatile.c b/drivers/gp=
u/drm/panel/panel-arm-versatile.c
> >>> index 41444a73c980..47b37fef7ee8 100644
> >>> --- a/drivers/gpu/drm/panel/panel-arm-versatile.c
> >>> +++ b/drivers/gpu/drm/panel/panel-arm-versatile.c
> >>> @@ -143,7 +143,6 @@ static const struct versatile_panel_type versatil=
e_panels[] =3D {
> >>>  			.vsync_start =3D 240 + 5,
> >>>  			.vsync_end =3D 240 + 5 + 6,
> >>>  			.vtotal =3D 240 + 5 + 6 + 5,
> >>> -			.vrefresh =3D 116,
> >>
> >> Are you sure vrefresh calculated (from totals and clock) is different
> >> than this field? If not, we risk regressions.
> >>
> >> This case is OK, but there is plenty other cases.
> > IIRC I did spot check a few of them. But which code exactly do you think
> > is abusing vrefresh and thus could break?
> =

> =

> I guess suspect/potential victim is every code which uses
> drm_mode_vrefresh - after this patch the function can return different
> value(if there are differences between provided and calculated vrefresh).
> =

> Quick examples where output of this function matters:
> =

> https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/msm/disp/d=
pu1/dpu_encoder_phys_cmd.c#L387

Already looks quite sketchy due to rounding.

> =

> https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/panel/pane=
l-sharp-lq101r1sx01.c#L42

msleep() is in no way accurate so looks rather sketchy as well.

> https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/tilcdc/til=
cdc_crtc.c#L810

Another thing that suffers from rounding issues.

So to me these all look like code that someone should fix regardless.

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
