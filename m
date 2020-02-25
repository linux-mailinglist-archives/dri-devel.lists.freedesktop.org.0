Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A17D16BF7B
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2020 12:21:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B335B6EA9F;
	Tue, 25 Feb 2020 11:21:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E14346EA98;
 Tue, 25 Feb 2020 11:21:22 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 25 Feb 2020 03:21:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,483,1574150400"; d="scan'208";a="350131736"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by fmsmga001.fm.intel.com with SMTP; 25 Feb 2020 03:21:15 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 25 Feb 2020 13:21:14 +0200
Date: Tue, 25 Feb 2020 13:21:14 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Andrzej Hajda <a.hajda@samsung.com>
Subject: Re: [PATCH 04/12] drm: Nuke mode->vrefresh
Message-ID: <20200225112114.GA13686@intel.com>
References: <20200219203544.31013-1-ville.syrjala@linux.intel.com>
 <CGME20200219203620eucas1p24b4990a91e758dbcf3e9b943669b0c8f@eucas1p2.samsung.com>
 <20200219203544.31013-5-ville.syrjala@linux.intel.com>
 <0f278771-79ce-fe23-e72c-3935dbe82d24@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0f278771-79ce-fe23-e72c-3935dbe82d24@samsung.com>
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
 Sam Ravnborg <sam@ravnborg.org>, Thomas Hellstrom <thellstrom@vmware.com>,
 Joonyoung Shim <jy0922.shim@samsung.com>, Stefan Mavrodiev <stefan@olimex.com>,
 Jerry Han <hanxu5@huaqin.corp-partner.google.com>,
 VMware Graphics <linux-graphics-maintainer@vmware.com>,
 Jagan Teki <jagan@amarulasolutions.com>, Robert Chiras <robert.chiras@nxp.com>,
 Icenowy Zheng <icenowy@aosc.io>, Jonas Karlman <jonas@kwiboo.se>,
 intel-gfx@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>,
 linux-amlogic@lists.infradead.org, Vincent Abriou <vincent.abriou@st.com>,
 Jernej Skrabec <jernej.skrabec@siol.net>, Purism Kernel Team <kernel@puri.sm>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Feb 24, 2020 at 03:14:54PM +0100, Andrzej Hajda wrote:
> On 19.02.2020 21:35, Ville Syrjala wrote:
> > From: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> >
> > Get rid of mode->vrefresh and just calculate it on demand. Saves
> > a bit of space and avoids the cached value getting out of sync
> > with reality.
> >
> > Mostly done with cocci, with the following manual fixups:
> > - Remove the now empty loop in drm_helper_probe_single_connector_modes()
> > - Fix __MODE() macro in ch7006_mode.c
> > - Fix DRM_MODE_ARG() macro in drm_modes.h
> > - Remove leftover comment from samsung_s6d16d0_mode
> ...
> > diff --git a/drivers/gpu/drm/panel/panel-arm-versatile.c b/drivers/gpu/=
drm/panel/panel-arm-versatile.c
> > index 41444a73c980..47b37fef7ee8 100644
> > --- a/drivers/gpu/drm/panel/panel-arm-versatile.c
> > +++ b/drivers/gpu/drm/panel/panel-arm-versatile.c
> > @@ -143,7 +143,6 @@ static const struct versatile_panel_type versatile_=
panels[] =3D {
> >  			.vsync_start =3D 240 + 5,
> >  			.vsync_end =3D 240 + 5 + 6,
> >  			.vtotal =3D 240 + 5 + 6 + 5,
> > -			.vrefresh =3D 116,
> =

> =

> Are you sure vrefresh calculated (from totals and clock) is different
> than this field? If not, we risk regressions.
> =

> This case is OK, but there is plenty other cases.

IIRC I did spot check a few of them. But which code exactly do you think
is abusing vrefresh and thus could break?

> =

> =

> Regards
> =

> Andrzej
> =

> =

> >  			.flags =3D DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC,
> >  		},
> >  	},
> > @@ -167,7 +166,6 @@ static const struct versatile_panel_type versatile_=
panels[] =3D {
> >  			.vsync_start =3D 480 + 11,
> >  			.vsync_end =3D 480 + 11 + 2,
> >  			.vtotal =3D 480 + 11 + 2 + 32,
> > -			.vrefresh =3D 60,
> >  			.flags =3D DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC,
> >  		},
> >  	},
> > @@ -190,7 +188,6 @@ static const struct versatile_panel_type versatile_=
panels[] =3D {
> >  			.vsync_start =3D 220 + 0,
> >  			.vsync_end =3D 220 + 0 + 2,
> >  			.vtotal =3D 220 + 0 + 2 + 1,
> > -			.vrefresh =3D 390,
> >  			.flags =3D DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC,
> >  		},
> >  		.bus_flags =3D DRM_BUS_FLAG_PIXDATA_DRIVE_NEGEDGE,
> > @@ -214,7 +211,6 @@ static const struct versatile_panel_type versatile_=
panels[] =3D {
> >  			.vsync_start =3D 320 + 2,
> >  			.vsync_end =3D 320 + 2 + 2,
> >  			.vtotal =3D 320 + 2 + 2 + 2,
> > -			.vrefresh =3D 116,
> >  			.flags =3D DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC,
> >  		},
> >  		.bus_flags =3D DRM_BUS_FLAG_PIXDATA_DRIVE_NEGEDGE,
> > diff --git a/drivers/gpu/drm/panel/panel-boe-himax8279d.c b/drivers/gpu=
/drm/panel/panel-boe-himax8279d.c
> > index 74d58ee7d04c..7c27bd5e3486 100644
> > --- a/drivers/gpu/drm/panel/panel-boe-himax8279d.c
> > +++ b/drivers/gpu/drm/panel/panel-boe-himax8279d.c
> > @@ -229,7 +229,7 @@ static int boe_panel_get_modes(struct drm_panel *pa=
nel,
> >  	mode =3D drm_mode_duplicate(connector->dev, m);
> >  	if (!mode) {
> >  		DRM_DEV_ERROR(pinfo->base.dev, "failed to add mode %ux%u@%u\n",
> > -			      m->hdisplay, m->vdisplay, m->vrefresh);
> > +			      m->hdisplay, m->vdisplay, drm_mode_vrefresh(m));
> >  		return -ENOMEM;
> >  	}
> >  =

> > @@ -262,7 +262,6 @@ static const struct drm_display_mode default_displa=
y_mode =3D {
> >  	.vsync_start =3D 1920 + 10,
> >  	.vsync_end =3D 1920 + 10 + 14,
> >  	.vtotal =3D 1920 + 10 + 14 + 4,
> > -	.vrefresh =3D 60,
> >  };
> >  =

> >  /* 8 inch */
> > diff --git a/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c b/drivers/g=
pu/drm/panel/panel-boe-tv101wum-nl6.c
> > index 48a164257d18..c580bd1e121c 100644
> > --- a/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
> > +++ b/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
> > @@ -594,7 +594,6 @@ static const struct drm_display_mode boe_tv101wum_n=
l6_default_mode =3D {
> >  	.vsync_start =3D 1920 + 10,
> >  	.vsync_end =3D 1920 + 10 + 14,
> >  	.vtotal =3D 1920 + 10 + 14 + 4,
> > -	.vrefresh =3D 60,
> >  };
> >  =

> >  static const struct panel_desc boe_tv101wum_nl6_desc =3D {
> > @@ -622,7 +621,6 @@ static const struct drm_display_mode auo_kd101n80_4=
5na_default_mode =3D {
> >  	.vsync_start =3D 1920 + 16,
> >  	.vsync_end =3D 1920 + 16 + 4,
> >  	.vtotal =3D 1920 + 16 + 4 + 16,
> > -	.vrefresh =3D 60,
> >  };
> >  =

> >  static const struct panel_desc auo_kd101n80_45na_desc =3D {
> > @@ -650,7 +648,6 @@ static const struct drm_display_mode boe_tv101wum_n=
53_default_mode =3D {
> >  	.vsync_start =3D 1920 + 20,
> >  	.vsync_end =3D 1920 + 20 + 4,
> >  	.vtotal =3D 1920 + 20 + 4 + 10,
> > -	.vrefresh =3D 60,
> >  	.type =3D DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED,
> >  };
> >  =

> > @@ -678,7 +675,6 @@ static const struct drm_display_mode auo_b101uan08_=
3_default_mode =3D {
> >  	.vsync_start =3D 1920 + 34,
> >  	.vsync_end =3D 1920 + 34 + 2,
> >  	.vtotal =3D 1920 + 34 + 2 + 24,
> > -	.vrefresh =3D 60,
> >  	.type =3D DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED,
> >  };
> >  =

> > @@ -706,7 +702,7 @@ static int boe_panel_get_modes(struct drm_panel *pa=
nel,
> >  	mode =3D drm_mode_duplicate(connector->dev, m);
> >  	if (!mode) {
> >  		dev_err(panel->dev, "failed to add mode %ux%u@%u\n",
> > -			m->hdisplay, m->vdisplay, m->vrefresh);
> > +			m->hdisplay, m->vdisplay, drm_mode_vrefresh(m));
> >  		return -ENOMEM;
> >  	}
> >  =

> > diff --git a/drivers/gpu/drm/panel/panel-feixin-k101-im2ba02.c b/driver=
s/gpu/drm/panel/panel-feixin-k101-im2ba02.c
> > index fddbfddf6566..54610651ecdb 100644
> > --- a/drivers/gpu/drm/panel/panel-feixin-k101-im2ba02.c
> > +++ b/drivers/gpu/drm/panel/panel-feixin-k101-im2ba02.c
> > @@ -392,7 +392,6 @@ static int k101_im2ba02_unprepare(struct drm_panel =
*panel)
> >  =

> >  static const struct drm_display_mode k101_im2ba02_default_mode =3D {
> >  	.clock =3D 70000,
> > -	.vrefresh =3D 60,
> >  =

> >  	.hdisplay =3D 800,
> >  	.hsync_start =3D 800 + 20,
> > @@ -420,7 +419,7 @@ static int k101_im2ba02_get_modes(struct drm_panel =
*panel,
> >  		DRM_DEV_ERROR(&ctx->dsi->dev, "failed to add mode %ux%ux@%u\n",
> >  			      k101_im2ba02_default_mode.hdisplay,
> >  			      k101_im2ba02_default_mode.vdisplay,
> > -			      k101_im2ba02_default_mode.vrefresh);
> > +			      drm_mode_vrefresh(&k101_im2ba02_default_mode));
> >  		return -ENOMEM;
> >  	}
> >  =

> > diff --git a/drivers/gpu/drm/panel/panel-feiyang-fy07024di26a30d.c b/dr=
ivers/gpu/drm/panel/panel-feiyang-fy07024di26a30d.c
> > index 95b789ab9d29..19a6274b10f5 100644
> > --- a/drivers/gpu/drm/panel/panel-feiyang-fy07024di26a30d.c
> > +++ b/drivers/gpu/drm/panel/panel-feiyang-fy07024di26a30d.c
> > @@ -153,7 +153,6 @@ static const struct drm_display_mode feiyang_defaul=
t_mode =3D {
> >  	.vsync_start	=3D 600 + 12,
> >  	.vsync_end	=3D 600 + 12 + 2,
> >  	.vtotal		=3D 600 + 12 + 2 + 21,
> > -	.vrefresh	=3D 60,
> >  =

> >  	.type =3D DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED,
> >  };
> > @@ -169,7 +168,7 @@ static int feiyang_get_modes(struct drm_panel *pane=
l,
> >  		DRM_DEV_ERROR(&ctx->dsi->dev, "failed to add mode %ux%ux@%u\n",
> >  			      feiyang_default_mode.hdisplay,
> >  			      feiyang_default_mode.vdisplay,
> > -			      feiyang_default_mode.vrefresh);
> > +			      drm_mode_vrefresh(&feiyang_default_mode));
> >  		return -ENOMEM;
> >  	}
> >  =

> > diff --git a/drivers/gpu/drm/panel/panel-ilitek-ili9322.c b/drivers/gpu=
/drm/panel/panel-ilitek-ili9322.c
> > index f394d53a7da4..d2c98d381bef 100644
> > --- a/drivers/gpu/drm/panel/panel-ilitek-ili9322.c
> > +++ b/drivers/gpu/drm/panel/panel-ilitek-ili9322.c
> > @@ -549,7 +549,6 @@ static const struct drm_display_mode srgb_320x240_m=
ode =3D {
> >  	.vsync_start =3D 240 + 4,
> >  	.vsync_end =3D 240 + 4 + 1,
> >  	.vtotal =3D 262,
> > -	.vrefresh =3D 60,
> >  	.flags =3D 0,
> >  };
> >  =

> > @@ -563,7 +562,6 @@ static const struct drm_display_mode srgb_360x240_m=
ode =3D {
> >  	.vsync_start =3D 240 + 21,
> >  	.vsync_end =3D 240 + 21 + 1,
> >  	.vtotal =3D 262,
> > -	.vrefresh =3D 60,
> >  	.flags =3D 0,
> >  };
> >  =

> > @@ -578,7 +576,6 @@ static const struct drm_display_mode prgb_320x240_m=
ode =3D {
> >  	.vsync_start =3D 240 + 4,
> >  	.vsync_end =3D 240 + 4 + 1,
> >  	.vtotal =3D 262,
> > -	.vrefresh =3D 60,
> >  	.flags =3D 0,
> >  };
> >  =

> > @@ -593,7 +590,6 @@ static const struct drm_display_mode yuv_640x320_mo=
de =3D {
> >  	.vsync_start =3D 320 + 4,
> >  	.vsync_end =3D 320 + 4 + 1,
> >  	.vtotal =3D 320 + 4 + 1 + 18,
> > -	.vrefresh =3D 60,
> >  	.flags =3D 0,
> >  };
> >  =

> > @@ -607,7 +603,6 @@ static const struct drm_display_mode yuv_720x360_mo=
de =3D {
> >  	.vsync_start =3D 360 + 4,
> >  	.vsync_end =3D 360 + 4 + 1,
> >  	.vtotal =3D 360 + 4 + 1 + 18,
> > -	.vrefresh =3D 60,
> >  	.flags =3D 0,
> >  };
> >  =

> > @@ -622,7 +617,6 @@ static const struct drm_display_mode itu_r_bt_656_6=
40_mode =3D {
> >  	.vsync_start =3D 480 + 4,
> >  	.vsync_end =3D 480 + 4 + 1,
> >  	.vtotal =3D 500,
> > -	.vrefresh =3D 60,
> >  	.flags =3D 0,
> >  };
> >  =

> > @@ -637,7 +631,6 @@ static const struct drm_display_mode itu_r_bt_656_7=
20_mode =3D {
> >  	.vsync_start =3D 480 + 4,
> >  	.vsync_end =3D 480 + 4 + 1,
> >  	.vtotal =3D 500,
> > -	.vrefresh =3D 60,
> >  	.flags =3D 0,
> >  };
> >  =

> > diff --git a/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c b/drivers/gp=
u/drm/panel/panel-ilitek-ili9881c.c
> > index f54077c216a3..3ed8635a6fbd 100644
> > --- a/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c
> > +++ b/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c
> > @@ -370,7 +370,6 @@ static int ili9881c_unprepare(struct drm_panel *pan=
el)
> >  =

> >  static const struct drm_display_mode bananapi_default_mode =3D {
> >  	.clock		=3D 62000,
> > -	.vrefresh	=3D 60,
> >  =

> >  	.hdisplay	=3D 720,
> >  	.hsync_start	=3D 720 + 10,
> > @@ -394,7 +393,7 @@ static int ili9881c_get_modes(struct drm_panel *pan=
el,
> >  		dev_err(&ctx->dsi->dev, "failed to add mode %ux%ux@%u\n",
> >  			bananapi_default_mode.hdisplay,
> >  			bananapi_default_mode.vdisplay,
> > -			bananapi_default_mode.vrefresh);
> > +			drm_mode_vrefresh(&bananapi_default_mode));
> >  		return -ENOMEM;
> >  	}
> >  =

> > diff --git a/drivers/gpu/drm/panel/panel-innolux-p079zca.c b/drivers/gp=
u/drm/panel/panel-innolux-p079zca.c
> > index 7419f1f0acee..fdf030f4cf92 100644
> > --- a/drivers/gpu/drm/panel/panel-innolux-p079zca.c
> > +++ b/drivers/gpu/drm/panel/panel-innolux-p079zca.c
> > @@ -223,7 +223,6 @@ static const struct drm_display_mode innolux_p079zc=
a_mode =3D {
> >  	.vsync_start =3D 1024 + 20,
> >  	.vsync_end =3D 1024 + 20 + 4,
> >  	.vtotal =3D 1024 + 20 + 4 + 20,
> > -	.vrefresh =3D 60,
> >  };
> >  =

> >  static const struct panel_desc innolux_p079zca_panel_desc =3D {
> > @@ -257,7 +256,6 @@ static const struct drm_display_mode innolux_p097pf=
g_mode =3D {
> >  	.vsync_start =3D 2048 + 100,
> >  	.vsync_end =3D 2048 + 100 + 2,
> >  	.vtotal =3D 2048 + 100 + 2 + 18,
> > -	.vrefresh =3D 60,
> >  };
> >  =

> >  /*
> > @@ -401,7 +399,7 @@ static int innolux_panel_get_modes(struct drm_panel=
 *panel,
> >  	mode =3D drm_mode_duplicate(connector->dev, m);
> >  	if (!mode) {
> >  		DRM_DEV_ERROR(panel->dev, "failed to add mode %ux%ux@%u\n",
> > -			      m->hdisplay, m->vdisplay, m->vrefresh);
> > +			      m->hdisplay, m->vdisplay, drm_mode_vrefresh(m));
> >  		return -ENOMEM;
> >  	}
> >  =

> > diff --git a/drivers/gpu/drm/panel/panel-jdi-lt070me05000.c b/drivers/g=
pu/drm/panel/panel-jdi-lt070me05000.c
> > index 4bfd8c877c8e..1e3fd6633981 100644
> > --- a/drivers/gpu/drm/panel/panel-jdi-lt070me05000.c
> > +++ b/drivers/gpu/drm/panel/panel-jdi-lt070me05000.c
> > @@ -296,7 +296,6 @@ static const struct drm_display_mode default_mode =
=3D {
> >  		.vsync_start =3D 1920 + 3,
> >  		.vsync_end =3D 1920 + 3 + 5,
> >  		.vtotal =3D 1920 + 3 + 5 + 6,
> > -		.vrefresh =3D 60,
> >  		.flags =3D 0,
> >  };
> >  =

> > @@ -311,7 +310,7 @@ static int jdi_panel_get_modes(struct drm_panel *pa=
nel,
> >  	if (!mode) {
> >  		dev_err(dev, "failed to add mode %ux%ux@%u\n",
> >  			default_mode.hdisplay, default_mode.vdisplay,
> > -			default_mode.vrefresh);
> > +			drm_mode_vrefresh(&default_mode));
> >  		return -ENOMEM;
> >  	}
> >  =

> > diff --git a/drivers/gpu/drm/panel/panel-kingdisplay-kd097d04.c b/drive=
rs/gpu/drm/panel/panel-kingdisplay-kd097d04.c
> > index bac1a2a06c92..0d397af23afe 100644
> > --- a/drivers/gpu/drm/panel/panel-kingdisplay-kd097d04.c
> > +++ b/drivers/gpu/drm/panel/panel-kingdisplay-kd097d04.c
> > @@ -318,7 +318,6 @@ static const struct drm_display_mode default_mode =
=3D {
> >  	.vsync_start =3D 2048 + 95,
> >  	.vsync_end =3D 2048 + 95 + 2,
> >  	.vtotal =3D 2048 + 95 + 2 + 23,
> > -	.vrefresh =3D 60,
> >  };
> >  =

> >  static int kingdisplay_panel_get_modes(struct drm_panel *panel,
> > @@ -330,7 +329,7 @@ static int kingdisplay_panel_get_modes(struct drm_p=
anel *panel,
> >  	if (!mode) {
> >  		DRM_DEV_ERROR(panel->dev, "failed to add mode %ux%ux@%u\n",
> >  			      default_mode.hdisplay, default_mode.vdisplay,
> > -			      default_mode.vrefresh);
> > +			      drm_mode_vrefresh(&default_mode));
> >  		return -ENOMEM;
> >  	}
> >  =

> > diff --git a/drivers/gpu/drm/panel/panel-leadtek-ltk500hd1829.c b/drive=
rs/gpu/drm/panel/panel-leadtek-ltk500hd1829.c
> > index 76ecf2de9c44..c39e7f6f5c2d 100644
> > --- a/drivers/gpu/drm/panel/panel-leadtek-ltk500hd1829.c
> > +++ b/drivers/gpu/drm/panel/panel-leadtek-ltk500hd1829.c
> > @@ -376,7 +376,6 @@ static const struct drm_display_mode default_mode =
=3D {
> >  	.vsync_start	=3D 1280 + 30,
> >  	.vsync_end	=3D 1280 + 30 + 4,
> >  	.vtotal		=3D 1280 + 30 + 4 + 12,
> > -	.vrefresh	=3D 60,
> >  	.clock		=3D 41600,
> >  	.width_mm	=3D 62,
> >  	.height_mm	=3D 110,
> > @@ -392,7 +391,7 @@ static int ltk500hd1829_get_modes(struct drm_panel =
*panel,
> >  	if (!mode) {
> >  		DRM_DEV_ERROR(ctx->dev, "failed to add mode %ux%ux@%u\n",
> >  			      default_mode.hdisplay, default_mode.vdisplay,
> > -			      default_mode.vrefresh);
> > +			      drm_mode_vrefresh(&default_mode));
> >  		return -ENOMEM;
> >  	}
> >  =

> > diff --git a/drivers/gpu/drm/panel/panel-lg-lb035q02.c b/drivers/gpu/dr=
m/panel/panel-lg-lb035q02.c
> > index e90efeaba4ad..14456b9cd5c0 100644
> > --- a/drivers/gpu/drm/panel/panel-lg-lb035q02.c
> > +++ b/drivers/gpu/drm/panel/panel-lg-lb035q02.c
> > @@ -134,7 +134,6 @@ static const struct drm_display_mode lb035q02_mode =
=3D {
> >  	.vsync_start =3D 240 + 4,
> >  	.vsync_end =3D 240 + 4 + 2,
> >  	.vtotal =3D 240 + 4 + 2 + 18,
> > -	.vrefresh =3D 60,
> >  	.type =3D DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED,
> >  	.flags =3D DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC,
> >  	.width_mm =3D 70,
> > diff --git a/drivers/gpu/drm/panel/panel-lg-lg4573.c b/drivers/gpu/drm/=
panel/panel-lg-lg4573.c
> > index b262b53dbd85..497f3b888a1d 100644
> > --- a/drivers/gpu/drm/panel/panel-lg-lg4573.c
> > +++ b/drivers/gpu/drm/panel/panel-lg-lg4573.c
> > @@ -206,7 +206,6 @@ static const struct drm_display_mode default_mode =
=3D {
> >  	.vsync_start =3D 800 + 15,
> >  	.vsync_end =3D 800 + 15 + 15,
> >  	.vtotal =3D 800 + 15 + 15 + 15,
> > -	.vrefresh =3D 60,
> >  };
> >  =

> >  static int lg4573_get_modes(struct drm_panel *panel,
> > @@ -218,7 +217,7 @@ static int lg4573_get_modes(struct drm_panel *panel,
> >  	if (!mode) {
> >  		dev_err(panel->dev, "failed to add mode %ux%ux@%u\n",
> >  			default_mode.hdisplay, default_mode.vdisplay,
> > -			default_mode.vrefresh);
> > +			drm_mode_vrefresh(&default_mode));
> >  		return -ENOMEM;
> >  	}
> >  =

> > diff --git a/drivers/gpu/drm/panel/panel-nec-nl8048hl11.c b/drivers/gpu=
/drm/panel/panel-nec-nl8048hl11.c
> > index c4f83f6384e1..f894971c1c7c 100644
> > --- a/drivers/gpu/drm/panel/panel-nec-nl8048hl11.c
> > +++ b/drivers/gpu/drm/panel/panel-nec-nl8048hl11.c
> > @@ -116,7 +116,6 @@ static const struct drm_display_mode nl8048_mode =
=3D {
> >  	.vsync_start =3D 480 + 3,
> >  	.vsync_end =3D 480 + 3 + 1,
> >  	.vtotal =3D 480 + 3 + 1 + 4,
> > -	.vrefresh =3D 60,
> >  	.type =3D DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED,
> >  	.flags =3D DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC,
> >  	.width_mm =3D 89,
> > diff --git a/drivers/gpu/drm/panel/panel-novatek-nt39016.c b/drivers/gp=
u/drm/panel/panel-novatek-nt39016.c
> > index a470810f7dbe..4b545e081b1e 100644
> > --- a/drivers/gpu/drm/panel/panel-novatek-nt39016.c
> > +++ b/drivers/gpu/drm/panel/panel-novatek-nt39016.c
> > @@ -327,7 +327,6 @@ static const struct nt39016_panel_info kd035g6_info=
 =3D {
> >  		.vsync_start =3D 240 + 5,
> >  		.vsync_end =3D 240 + 5 + 1,
> >  		.vtotal =3D 240 + 5 + 1 + 4,
> > -		.vrefresh =3D 60,
> >  		.flags =3D DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC,
> >  	},
> >  	.width_mm =3D 71,
> > diff --git a/drivers/gpu/drm/panel/panel-olimex-lcd-olinuxino.c b/drive=
rs/gpu/drm/panel/panel-olimex-lcd-olinuxino.c
> > index 09deb99981a4..ecd76b5391d3 100644
> > --- a/drivers/gpu/drm/panel/panel-olimex-lcd-olinuxino.c
> > +++ b/drivers/gpu/drm/panel/panel-olimex-lcd-olinuxino.c
> > @@ -170,7 +170,6 @@ static int lcd_olinuxino_get_modes(struct drm_panel=
 *panel,
> >  				  lcd_mode->vpw;
> >  		mode->vtotal =3D lcd_mode->vactive + lcd_mode->vfp +
> >  			       lcd_mode->vpw + lcd_mode->vbp;
> > -		mode->vrefresh =3D lcd_mode->refresh;
> >  =

> >  		/* Always make the first mode preferred */
> >  		if (i =3D=3D 0)
> > diff --git a/drivers/gpu/drm/panel/panel-orisetech-otm8009a.c b/drivers=
/gpu/drm/panel/panel-orisetech-otm8009a.c
> > index bb0c992171e8..895ee3d1371e 100644
> > --- a/drivers/gpu/drm/panel/panel-orisetech-otm8009a.c
> > +++ b/drivers/gpu/drm/panel/panel-orisetech-otm8009a.c
> > @@ -81,7 +81,6 @@ static const struct drm_display_mode default_mode =3D=
 {
> >  	.vsync_start =3D 800 + 15,
> >  	.vsync_end =3D 800 + 15 + 10,
> >  	.vtotal =3D 800 + 15 + 10 + 14,
> > -	.vrefresh =3D 50,
> >  	.flags =3D 0,
> >  	.width_mm =3D 52,
> >  	.height_mm =3D 86,
> > @@ -358,7 +357,7 @@ static int otm8009a_get_modes(struct drm_panel *pan=
el,
> >  	if (!mode) {
> >  		DRM_ERROR("failed to add mode %ux%ux@%u\n",
> >  			  default_mode.hdisplay, default_mode.vdisplay,
> > -			  default_mode.vrefresh);
> > +			  drm_mode_vrefresh(&default_mode));
> >  		return -ENOMEM;
> >  	}
> >  =

> > diff --git a/drivers/gpu/drm/panel/panel-osd-osd101t2587-53ts.c b/drive=
rs/gpu/drm/panel/panel-osd-osd101t2587-53ts.c
> > index 3a0229d60095..11b3d01aca56 100644
> > --- a/drivers/gpu/drm/panel/panel-osd-osd101t2587-53ts.c
> > +++ b/drivers/gpu/drm/panel/panel-osd-osd101t2587-53ts.c
> > @@ -102,7 +102,6 @@ static const struct drm_display_mode default_mode_o=
sd101t2587 =3D {
> >  	.vsync_start =3D 1200 + 24,
> >  	.vsync_end =3D 1200 + 24 + 6,
> >  	.vtotal =3D 1200 + 24 + 6 + 48,
> > -	.vrefresh =3D 60,
> >  	.flags =3D DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC,
> >  };
> >  =

> > @@ -117,7 +116,7 @@ static int osd101t2587_panel_get_modes(struct drm_p=
anel *panel,
> >  		dev_err(panel->dev, "failed to add mode %ux%ux@%u\n",
> >  			osd101t2587->default_mode->hdisplay,
> >  			osd101t2587->default_mode->vdisplay,
> > -			osd101t2587->default_mode->vrefresh);
> > +			drm_mode_vrefresh(osd101t2587->default_mode));
> >  		return -ENOMEM;
> >  	}
> >  =

> > diff --git a/drivers/gpu/drm/panel/panel-panasonic-vvx10f034n00.c b/dri=
vers/gpu/drm/panel/panel-panasonic-vvx10f034n00.c
> > index 69693451462e..627dfcf8adb4 100644
> > --- a/drivers/gpu/drm/panel/panel-panasonic-vvx10f034n00.c
> > +++ b/drivers/gpu/drm/panel/panel-panasonic-vvx10f034n00.c
> > @@ -149,7 +149,6 @@ static const struct drm_display_mode default_mode =
=3D {
> >  	.vsync_start =3D 1200 + 24,
> >  	.vsync_end =3D 1200 + 24 + 6,
> >  	.vtotal =3D 1200 + 24 + 6 + 48,
> > -	.vrefresh =3D 60,
> >  };
> >  =

> >  static int wuxga_nt_panel_get_modes(struct drm_panel *panel,
> > @@ -161,7 +160,7 @@ static int wuxga_nt_panel_get_modes(struct drm_pane=
l *panel,
> >  	if (!mode) {
> >  		dev_err(panel->dev, "failed to add mode %ux%u@%u\n",
> >  			default_mode.hdisplay, default_mode.vdisplay,
> > -			default_mode.vrefresh);
> > +			drm_mode_vrefresh(&default_mode));
> >  		return -ENOMEM;
> >  	}
> >  =

> > diff --git a/drivers/gpu/drm/panel/panel-raspberrypi-touchscreen.c b/dr=
ivers/gpu/drm/panel/panel-raspberrypi-touchscreen.c
> > index 8f078b7dd89e..e50ee26474cf 100644
> > --- a/drivers/gpu/drm/panel/panel-raspberrypi-touchscreen.c
> > +++ b/drivers/gpu/drm/panel/panel-raspberrypi-touchscreen.c
> > @@ -209,7 +209,6 @@ static const struct drm_display_mode rpi_touchscree=
n_modes[] =3D {
> >  		.vsync_start =3D 480 + 7,
> >  		.vsync_end =3D 480 + 7 + 2,
> >  		.vtotal =3D 480 + 7 + 2 + 21,
> > -		.vrefresh =3D 60,
> >  	},
> >  };
> >  =

> > @@ -322,7 +321,8 @@ static int rpi_touchscreen_get_modes(struct drm_pan=
el *panel,
> >  		mode =3D drm_mode_duplicate(connector->dev, m);
> >  		if (!mode) {
> >  			dev_err(panel->dev, "failed to add mode %ux%u@%u\n",
> > -				m->hdisplay, m->vdisplay, m->vrefresh);
> > +				m->hdisplay, m->vdisplay,
> > +				drm_mode_vrefresh(m));
> >  			continue;
> >  		}
> >  =

> > diff --git a/drivers/gpu/drm/panel/panel-raydium-rm67191.c b/drivers/gp=
u/drm/panel/panel-raydium-rm67191.c
> > index 313637d53d28..d001c52e0ca9 100644
> > --- a/drivers/gpu/drm/panel/panel-raydium-rm67191.c
> > +++ b/drivers/gpu/drm/panel/panel-raydium-rm67191.c
> > @@ -218,7 +218,6 @@ static const struct drm_display_mode default_mode =
=3D {
> >  	.vsync_start =3D 1920 + 10,
> >  	.vsync_end =3D 1920 + 10 + 2,
> >  	.vtotal =3D 1920 + 10 + 2 + 4,
> > -	.vrefresh =3D 60,
> >  	.width_mm =3D 68,
> >  	.height_mm =3D 121,
> >  	.flags =3D DRM_MODE_FLAG_NHSYNC |
> > @@ -445,7 +444,7 @@ static int rad_panel_get_modes(struct drm_panel *pa=
nel,
> >  	if (!mode) {
> >  		DRM_DEV_ERROR(panel->dev, "failed to add mode %ux%ux@%u\n",
> >  			      default_mode.hdisplay, default_mode.vdisplay,
> > -			      default_mode.vrefresh);
> > +			      drm_mode_vrefresh(&default_mode));
> >  		return -ENOMEM;
> >  	}
> >  =

> > diff --git a/drivers/gpu/drm/panel/panel-raydium-rm68200.c b/drivers/gp=
u/drm/panel/panel-raydium-rm68200.c
> > index e8982948e0ea..81ae8be62d15 100644
> > --- a/drivers/gpu/drm/panel/panel-raydium-rm68200.c
> > +++ b/drivers/gpu/drm/panel/panel-raydium-rm68200.c
> > @@ -92,7 +92,6 @@ static const struct drm_display_mode default_mode =3D=
 {
> >  	.vsync_start =3D 1280 + 12,
> >  	.vsync_end =3D 1280 + 12 + 4,
> >  	.vtotal =3D 1280 + 12 + 4 + 12,
> > -	.vrefresh =3D 50,
> >  	.flags =3D 0,
> >  	.width_mm =3D 68,
> >  	.height_mm =3D 122,
> > @@ -339,7 +338,7 @@ static int rm68200_get_modes(struct drm_panel *pane=
l,
> >  	if (!mode) {
> >  		DRM_ERROR("failed to add mode %ux%ux@%u\n",
> >  			  default_mode.hdisplay, default_mode.vdisplay,
> > -			  default_mode.vrefresh);
> > +			  drm_mode_vrefresh(&default_mode));
> >  		return -ENOMEM;
> >  	}
> >  =

> > diff --git a/drivers/gpu/drm/panel/panel-rocktech-jh057n00900.c b/drive=
rs/gpu/drm/panel/panel-rocktech-jh057n00900.c
> > index 38ff742bc120..da4e373291f9 100644
> > --- a/drivers/gpu/drm/panel/panel-rocktech-jh057n00900.c
> > +++ b/drivers/gpu/drm/panel/panel-rocktech-jh057n00900.c
> > @@ -223,7 +223,6 @@ static const struct drm_display_mode default_mode =
=3D {
> >  	.vsync_start =3D 1440 + 20,
> >  	.vsync_end   =3D 1440 + 20 + 4,
> >  	.vtotal	     =3D 1440 + 20 + 4 + 12,
> > -	.vrefresh    =3D 60,
> >  	.clock	     =3D 75276,
> >  	.flags	     =3D DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC,
> >  	.width_mm    =3D 65,
> > @@ -240,7 +239,7 @@ static int jh057n_get_modes(struct drm_panel *panel,
> >  	if (!mode) {
> >  		DRM_DEV_ERROR(ctx->dev, "Failed to add mode %ux%u@%u\n",
> >  			      default_mode.hdisplay, default_mode.vdisplay,
> > -			      default_mode.vrefresh);
> > +			      drm_mode_vrefresh(&default_mode));
> >  		return -ENOMEM;
> >  	}
> >  =

> > @@ -360,7 +359,7 @@ static int jh057n_probe(struct mipi_dsi_device *dsi)
> >  =

> >  	DRM_DEV_INFO(dev, "%ux%u@%u %ubpp dsi %udl - ready\n",
> >  		     default_mode.hdisplay, default_mode.vdisplay,
> > -		     default_mode.vrefresh,
> > +		     drm_mode_vrefresh(&default_mode),
> >  		     mipi_dsi_pixel_format_to_bpp(dsi->format), dsi->lanes);
> >  =

> >  	jh057n_debugfs_init(ctx);
> > diff --git a/drivers/gpu/drm/panel/panel-ronbo-rb070d30.c b/drivers/gpu=
/drm/panel/panel-ronbo-rb070d30.c
> > index ef18559e237e..a7b0b3e39e1a 100644
> > --- a/drivers/gpu/drm/panel/panel-ronbo-rb070d30.c
> > +++ b/drivers/gpu/drm/panel/panel-ronbo-rb070d30.c
> > @@ -103,7 +103,6 @@ static const struct drm_display_mode default_mode =
=3D {
> >  	.vsync_start	=3D 600 + 12,
> >  	.vsync_end	=3D 600 + 12 + 10,
> >  	.vtotal		=3D 600 + 12 + 10 + 13,
> > -	.vrefresh	=3D 60,
> >  =

> >  	.width_mm	=3D 154,
> >  	.height_mm	=3D 85,
> > diff --git a/drivers/gpu/drm/panel/panel-samsung-s6d16d0.c b/drivers/gp=
u/drm/panel/panel-samsung-s6d16d0.c
> > index 2150043dcf6b..f02645d396ac 100644
> > --- a/drivers/gpu/drm/panel/panel-samsung-s6d16d0.c
> > +++ b/drivers/gpu/drm/panel/panel-samsung-s6d16d0.c
> > @@ -37,12 +37,6 @@ static const struct drm_display_mode samsung_s6d16d0=
_mode =3D {
> >  	.vsync_start =3D 480 + 1,
> >  	.vsync_end =3D 480 + 1 + 1,
> >  	.vtotal =3D 480 + 1 + 1 + 1,
> > -	/*
> > -	 * This depends on the clocking HS vs LP rate, this value
> > -	 * is calculated as:
> > -	 * vrefresh =3D (clock * 1000) / (htotal*vtotal)
> > -	 */
> > -	.vrefresh =3D 816,
> >  	.width_mm =3D 84,
> >  	.height_mm =3D 48,
> >  };
> > diff --git a/drivers/gpu/drm/panel/panel-samsung-s6e3ha2.c b/drivers/gp=
u/drm/panel/panel-samsung-s6e3ha2.c
> > index 36ebd5a4ac7b..80ef122e7466 100644
> > --- a/drivers/gpu/drm/panel/panel-samsung-s6e3ha2.c
> > +++ b/drivers/gpu/drm/panel/panel-samsung-s6e3ha2.c
> > @@ -617,7 +617,6 @@ static const struct drm_display_mode s6e3ha2_mode =
=3D {
> >  	.vsync_start =3D 2560 + 1,
> >  	.vsync_end =3D 2560 + 1 + 1,
> >  	.vtotal =3D 2560 + 1 + 1 + 15,
> > -	.vrefresh =3D 60,
> >  	.flags =3D 0,
> >  };
> >  =

> > @@ -636,7 +635,6 @@ static const struct drm_display_mode s6e3hf2_mode =
=3D {
> >  	.vsync_start =3D 2560 + 1,
> >  	.vsync_end =3D 2560 + 1 + 1,
> >  	.vtotal =3D 2560 + 1 + 1 + 15,
> > -	.vrefresh =3D 60,
> >  	.flags =3D 0,
> >  };
> >  =

> > @@ -655,7 +653,7 @@ static int s6e3ha2_get_modes(struct drm_panel *pane=
l,
> >  	if (!mode) {
> >  		DRM_ERROR("failed to add mode %ux%ux@%u\n",
> >  			ctx->desc->mode->hdisplay, ctx->desc->mode->vdisplay,
> > -			ctx->desc->mode->vrefresh);
> > +			drm_mode_vrefresh(ctx->desc->mode));
> >  		return -ENOMEM;
> >  	}
> >  =

> > diff --git a/drivers/gpu/drm/panel/panel-samsung-s6e63j0x03.c b/drivers=
/gpu/drm/panel/panel-samsung-s6e63j0x03.c
> > index a3570e0a90a8..1247656d73bf 100644
> > --- a/drivers/gpu/drm/panel/panel-samsung-s6e63j0x03.c
> > +++ b/drivers/gpu/drm/panel/panel-samsung-s6e63j0x03.c
> > @@ -52,7 +52,6 @@ static const struct drm_display_mode default_mode =3D=
 {
> >  	.vsync_start =3D 320 + 150,
> >  	.vsync_end =3D 320 + 150 + 1,
> >  	.vtotal =3D 320 + 150 + 1 + 2,
> > -	.vrefresh =3D 30,
> >  	.flags =3D 0,
> >  };
> >  =

> > @@ -409,7 +408,7 @@ static int s6e63j0x03_get_modes(struct drm_panel *p=
anel,
> >  	if (!mode) {
> >  		DRM_ERROR("failed to add mode %ux%ux@%u\n",
> >  			default_mode.hdisplay, default_mode.vdisplay,
> > -			default_mode.vrefresh);
> > +			drm_mode_vrefresh(&default_mode));
> >  		return -ENOMEM;
> >  	}
> >  =

> > diff --git a/drivers/gpu/drm/panel/panel-samsung-s6e63m0.c b/drivers/gp=
u/drm/panel/panel-samsung-s6e63m0.c
> > index a5f76eb4fa25..64421347bfd4 100644
> > --- a/drivers/gpu/drm/panel/panel-samsung-s6e63m0.c
> > +++ b/drivers/gpu/drm/panel/panel-samsung-s6e63m0.c
> > @@ -117,7 +117,6 @@ static const struct drm_display_mode default_mode =
=3D {
> >  	.vsync_start	=3D 800 + 28,
> >  	.vsync_end	=3D 800 + 28 + 2,
> >  	.vtotal		=3D 800 + 28 + 2 + 1,
> > -	.vrefresh	=3D 60,
> >  	.width_mm	=3D 53,
> >  	.height_mm	=3D 89,
> >  	.flags		=3D DRM_MODE_FLAG_NVSYNC | DRM_MODE_FLAG_NHSYNC,
> > @@ -371,7 +370,7 @@ static int s6e63m0_get_modes(struct drm_panel *pane=
l,
> >  	if (!mode) {
> >  		DRM_ERROR("failed to add mode %ux%ux@%u\n",
> >  			  default_mode.hdisplay, default_mode.vdisplay,
> > -			  default_mode.vrefresh);
> > +			  drm_mode_vrefresh(&default_mode));
> >  		return -ENOMEM;
> >  	}
> >  =

> > diff --git a/drivers/gpu/drm/panel/panel-samsung-s6e88a0-ams452ef01.c b=
/drivers/gpu/drm/panel/panel-samsung-s6e88a0-ams452ef01.c
> > index 9d843fcc3a22..485eabecfcc9 100644
> > --- a/drivers/gpu/drm/panel/panel-samsung-s6e88a0-ams452ef01.c
> > +++ b/drivers/gpu/drm/panel/panel-samsung-s6e88a0-ams452ef01.c
> > @@ -177,7 +177,6 @@ static const struct drm_display_mode s6e88a0_ams452=
ef01_mode =3D {
> >  	.vsync_start =3D 960 + 14,
> >  	.vsync_end =3D 960 + 14 + 2,
> >  	.vtotal =3D 960 + 14 + 2 + 8,
> > -	.vrefresh =3D 60,
> >  	.width_mm =3D 56,
> >  	.height_mm =3D 100,
> >  };
> > diff --git a/drivers/gpu/drm/panel/panel-seiko-43wvf1g.c b/drivers/gpu/=
drm/panel/panel-seiko-43wvf1g.c
> > index 40fcbbbacb2c..e417dc4921c2 100644
> > --- a/drivers/gpu/drm/panel/panel-seiko-43wvf1g.c
> > +++ b/drivers/gpu/drm/panel/panel-seiko-43wvf1g.c
> > @@ -92,7 +92,8 @@ static int seiko_panel_get_fixed_modes(struct seiko_p=
anel *panel,
> >  		mode =3D drm_mode_duplicate(connector->dev, m);
> >  		if (!mode) {
> >  			dev_err(panel->base.dev, "failed to add mode %ux%u@%u\n",
> > -				m->hdisplay, m->vdisplay, m->vrefresh);
> > +				m->hdisplay, m->vdisplay,
> > +				drm_mode_vrefresh(m));
> >  			continue;
> >  		}
> >  =

> > diff --git a/drivers/gpu/drm/panel/panel-sharp-lq101r1sx01.c b/drivers/=
gpu/drm/panel/panel-sharp-lq101r1sx01.c
> > index b5d1977221a7..f07324b705b3 100644
> > --- a/drivers/gpu/drm/panel/panel-sharp-lq101r1sx01.c
> > +++ b/drivers/gpu/drm/panel/panel-sharp-lq101r1sx01.c
> > @@ -269,7 +269,6 @@ static const struct drm_display_mode default_mode =
=3D {
> >  	.vsync_start =3D 1600 + 4,
> >  	.vsync_end =3D 1600 + 4 + 8,
> >  	.vtotal =3D 1600 + 4 + 8 + 32,
> > -	.vrefresh =3D 60,
> >  };
> >  =

> >  static int sharp_panel_get_modes(struct drm_panel *panel,
> > @@ -281,7 +280,7 @@ static int sharp_panel_get_modes(struct drm_panel *=
panel,
> >  	if (!mode) {
> >  		dev_err(panel->dev, "failed to add mode %ux%ux@%u\n",
> >  			default_mode.hdisplay, default_mode.vdisplay,
> > -			default_mode.vrefresh);
> > +			drm_mode_vrefresh(&default_mode));
> >  		return -ENOMEM;
> >  	}
> >  =

> > diff --git a/drivers/gpu/drm/panel/panel-sharp-ls037v7dw01.c b/drivers/=
gpu/drm/panel/panel-sharp-ls037v7dw01.c
> > index 1cf3f02435c1..d7bf13b9e1d6 100644
> > --- a/drivers/gpu/drm/panel/panel-sharp-ls037v7dw01.c
> > +++ b/drivers/gpu/drm/panel/panel-sharp-ls037v7dw01.c
> > @@ -93,7 +93,6 @@ static const struct drm_display_mode ls037v7dw01_mode=
 =3D {
> >  	.vsync_start =3D 640 + 1,
> >  	.vsync_end =3D 640 + 1 + 1,
> >  	.vtotal =3D 640 + 1 + 1 + 1,
> > -	.vrefresh =3D 58,
> >  	.type =3D DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED,
> >  	.flags =3D DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC,
> >  	.width_mm =3D 56,
> > diff --git a/drivers/gpu/drm/panel/panel-sharp-ls043t1le01.c b/drivers/=
gpu/drm/panel/panel-sharp-ls043t1le01.c
> > index ce586c6d70c7..b2e58935529c 100644
> > --- a/drivers/gpu/drm/panel/panel-sharp-ls043t1le01.c
> > +++ b/drivers/gpu/drm/panel/panel-sharp-ls043t1le01.c
> > @@ -201,7 +201,6 @@ static const struct drm_display_mode default_mode =
=3D {
> >  	.vsync_start =3D 960 + 3,
> >  	.vsync_end =3D 960 + 3 + 15,
> >  	.vtotal =3D 960 + 3 + 15 + 1,
> > -	.vrefresh =3D 60,
> >  };
> >  =

> >  static int sharp_nt_panel_get_modes(struct drm_panel *panel,
> > @@ -213,7 +212,7 @@ static int sharp_nt_panel_get_modes(struct drm_pane=
l *panel,
> >  	if (!mode) {
> >  		dev_err(panel->dev, "failed to add mode %ux%u@%u\n",
> >  			default_mode.hdisplay, default_mode.vdisplay,
> > -			default_mode.vrefresh);
> > +			drm_mode_vrefresh(&default_mode));
> >  		return -ENOMEM;
> >  	}
> >  =

> > diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/pan=
el/panel-simple.c
> > index 82363d05bad4..9ba9d69df41b 100644
> > --- a/drivers/gpu/drm/panel/panel-simple.c
> > +++ b/drivers/gpu/drm/panel/panel-simple.c
> > @@ -161,7 +161,8 @@ static unsigned int panel_simple_get_display_modes(=
struct panel_simple *panel,
> >  		mode =3D drm_mode_duplicate(connector->dev, m);
> >  		if (!mode) {
> >  			dev_err(panel->base.dev, "failed to add mode %ux%u@%u\n",
> > -				m->hdisplay, m->vdisplay, m->vrefresh);
> > +				m->hdisplay, m->vdisplay,
> > +				drm_mode_vrefresh(m));
> >  			continue;
> >  		}
> >  =

> > @@ -494,7 +495,6 @@ static const struct drm_display_mode ampire_am_4802=
72h3tmqw_t01h_mode =3D {
> >  	.vsync_start =3D 272 + 2,
> >  	.vsync_end =3D 272 + 2 + 10,
> >  	.vtotal =3D 272 + 2 + 10 + 2,
> > -	.vrefresh =3D 60,
> >  	.flags =3D DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC,
> >  };
> >  =

> > @@ -519,7 +519,6 @@ static const struct drm_display_mode ampire_am80048=
0r3tmqwa1h_mode =3D {
> >  	.vsync_start =3D 480 + 2,
> >  	.vsync_end =3D 480 + 2 + 45,
> >  	.vtotal =3D 480 + 2 + 45 + 0,
> > -	.vrefresh =3D 60,
> >  	.flags =3D DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC,
> >  };
> >  =

> > @@ -570,7 +569,6 @@ static const struct drm_display_mode auo_b101aw03_m=
ode =3D {
> >  	.vsync_start =3D 600 + 16,
> >  	.vsync_end =3D 600 + 16 + 6,
> >  	.vtotal =3D 600 + 16 + 6 + 16,
> > -	.vrefresh =3D 60,
> >  };
> >  =

> >  static const struct panel_desc auo_b101aw03 =3D {
> > @@ -615,7 +613,6 @@ static const struct drm_display_mode auo_b101xtn01_=
mode =3D {
> >  	.vsync_start =3D 768 + 14,
> >  	.vsync_end =3D 768 + 14 + 42,
> >  	.vtotal =3D 768 + 14 + 42,
> > -	.vrefresh =3D 60,
> >  	.flags =3D DRM_MODE_FLAG_NVSYNC | DRM_MODE_FLAG_NHSYNC,
> >  };
> >  =

> > @@ -639,7 +636,6 @@ static const struct drm_display_mode auo_b116xak01_=
mode =3D {
> >  	.vsync_start =3D 768 + 4,
> >  	.vsync_end =3D 768 + 4 + 6,
> >  	.vtotal =3D 768 + 4 + 6 + 15,
> > -	.vrefresh =3D 60,
> >  	.flags =3D DRM_MODE_FLAG_NVSYNC | DRM_MODE_FLAG_NHSYNC,
> >  };
> >  =

> > @@ -668,7 +664,6 @@ static const struct drm_display_mode auo_b116xw03_m=
ode =3D {
> >  	.vsync_start =3D 768 + 10,
> >  	.vsync_end =3D 768 + 10 + 12,
> >  	.vtotal =3D 768 + 10 + 12 + 6,
> > -	.vrefresh =3D 60,
> >  };
> >  =

> >  static const struct panel_desc auo_b116xw03 =3D {
> > @@ -691,7 +686,6 @@ static const struct drm_display_mode auo_b133xtn01_=
mode =3D {
> >  	.vsync_start =3D 768 + 3,
> >  	.vsync_end =3D 768 + 3 + 6,
> >  	.vtotal =3D 768 + 3 + 6 + 13,
> > -	.vrefresh =3D 60,
> >  };
> >  =

> >  static const struct panel_desc auo_b133xtn01 =3D {
> > @@ -714,7 +708,6 @@ static const struct drm_display_mode auo_b133htn01_=
mode =3D {
> >  	.vsync_start =3D 1080 + 25,
> >  	.vsync_end =3D 1080 + 25 + 10,
> >  	.vtotal =3D 1080 + 25 + 10 + 10,
> > -	.vrefresh =3D 60,
> >  };
> >  =

> >  static const struct panel_desc auo_b133htn01 =3D {
> > @@ -770,7 +763,6 @@ static const struct drm_display_mode auo_g101evn010=
_mode =3D {
> >  	.vsync_start =3D 800 + 8,
> >  	.vsync_end =3D 800 + 8 + 2,
> >  	.vtotal =3D 800 + 8 + 2 + 6,
> > -	.vrefresh =3D 60,
> >  };
> >  =

> >  static const struct panel_desc auo_g101evn010 =3D {
> > @@ -794,7 +786,6 @@ static const struct drm_display_mode auo_g104sn02_m=
ode =3D {
> >  	.vsync_start =3D 600 + 10,
> >  	.vsync_end =3D 600 + 10 + 35,
> >  	.vtotal =3D 600 + 10 + 35 + 2,
> > -	.vrefresh =3D 60,
> >  };
> >  =

> >  static const struct panel_desc auo_g104sn02 =3D {
> > @@ -906,7 +897,6 @@ static const struct drm_display_mode auo_t215hvn01_=
mode =3D {
> >  	.vsync_start =3D 1080 + 4,
> >  	.vsync_end =3D 1080 + 4 + 5,
> >  	.vtotal =3D 1080 + 4 + 5 + 36,
> > -	.vrefresh =3D 60,
> >  };
> >  =

> >  static const struct panel_desc auo_t215hvn01 =3D {
> > @@ -933,7 +923,6 @@ static const struct drm_display_mode avic_tm070ddh0=
3_mode =3D {
> >  	.vsync_start =3D 600 + 17,
> >  	.vsync_end =3D 600 + 17 + 1,
> >  	.vtotal =3D 600 + 17 + 1 + 17,
> > -	.vrefresh =3D 60,
> >  };
> >  =

> >  static const struct panel_desc avic_tm070ddh03 =3D {
> > @@ -983,7 +972,6 @@ static const struct drm_display_mode boe_hv070wsa_m=
ode =3D {
> >  	.vsync_start =3D 600 + 10,
> >  	.vsync_end =3D 600 + 10 + 10,
> >  	.vtotal =3D 600 + 10 + 10 + 10,
> > -	.vrefresh =3D 60,
> >  };
> >  =

> >  static const struct panel_desc boe_hv070wsa =3D {
> > @@ -1006,7 +994,6 @@ static const struct drm_display_mode boe_nv101wxmn=
51_modes[] =3D {
> >  		.vsync_start =3D 800 + 3,
> >  		.vsync_end =3D 800 + 3 + 5,
> >  		.vtotal =3D 800 + 3 + 5 + 24,
> > -		.vrefresh =3D 60,
> >  	},
> >  	{
> >  		.clock =3D 57500,
> > @@ -1018,7 +1005,6 @@ static const struct drm_display_mode boe_nv101wxm=
n51_modes[] =3D {
> >  		.vsync_start =3D 800 + 3,
> >  		.vsync_end =3D 800 + 3 + 5,
> >  		.vtotal =3D 800 + 3 + 5 + 24,
> > -		.vrefresh =3D 48,
> >  	},
> >  };
> >  =

> > @@ -1048,7 +1034,6 @@ static const struct drm_display_mode boe_nv140fhm=
n49_modes[] =3D {
> >  		.vsync_start =3D 1080 + 3,
> >  		.vsync_end =3D 1080 + 3 + 5,
> >  		.vtotal =3D 1125,
> > -		.vrefresh =3D 60,
> >  	},
> >  };
> >  =

> > @@ -1079,7 +1064,6 @@ static const struct drm_display_mode cdtech_s043w=
q26h_ct7_mode =3D {
> >  	.vsync_start =3D 272 + 8,
> >  	.vsync_end =3D 272 + 8 + 8,
> >  	.vtotal =3D 272 + 8 + 8 + 8,
> > -	.vrefresh =3D 60,
> >  	.flags =3D DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC,
> >  };
> >  =

> > @@ -1104,7 +1088,6 @@ static const struct drm_display_mode cdtech_s070w=
v95_ct16_mode =3D {
> >  	.vsync_start =3D 480 + 29,
> >  	.vsync_end =3D 480 + 29 + 13,
> >  	.vtotal =3D 480 + 29 + 13 + 3,
> > -	.vrefresh =3D 60,
> >  	.flags =3D DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC,
> >  };
> >  =

> > @@ -1128,7 +1111,6 @@ static const struct drm_display_mode chunghwa_cla=
a070wp03xg_mode =3D {
> >  	.vsync_start =3D 1280 + 1,
> >  	.vsync_end =3D 1280 + 1 + 7,
> >  	.vtotal =3D 1280 + 1 + 7 + 15,
> > -	.vrefresh =3D 60,
> >  	.flags =3D DRM_MODE_FLAG_NVSYNC | DRM_MODE_FLAG_NHSYNC,
> >  };
> >  =

> > @@ -1152,7 +1134,6 @@ static const struct drm_display_mode chunghwa_cla=
a101wa01a_mode =3D {
> >  	.vsync_start =3D 768 + 4,
> >  	.vsync_end =3D 768 + 4 + 4,
> >  	.vtotal =3D 768 + 4 + 4 + 4,
> > -	.vrefresh =3D 60,
> >  };
> >  =

> >  static const struct panel_desc chunghwa_claa101wa01a =3D {
> > @@ -1175,7 +1156,6 @@ static const struct drm_display_mode chunghwa_cla=
a101wb01_mode =3D {
> >  	.vsync_start =3D 768 + 16,
> >  	.vsync_end =3D 768 + 16 + 8,
> >  	.vtotal =3D 768 + 16 + 8 + 16,
> > -	.vrefresh =3D 60,
> >  };
> >  =

> >  static const struct panel_desc chunghwa_claa101wb01 =3D {
> > @@ -1198,7 +1178,6 @@ static const struct drm_display_mode dataimage_sc=
f0700c48ggu18_mode =3D {
> >  	.vsync_start =3D 480 + 10,
> >  	.vsync_end =3D 480 + 10 + 2,
> >  	.vtotal =3D 480 + 10 + 2 + 33,
> > -	.vrefresh =3D 60,
> >  	.flags =3D DRM_MODE_FLAG_NVSYNC | DRM_MODE_FLAG_NHSYNC,
> >  };
> >  =

> > @@ -1285,7 +1264,6 @@ static const struct drm_display_mode edt_et035012=
dm6_mode =3D {
> >  	.vsync_start =3D 240 + 4,
> >  	.vsync_end =3D 240 + 4 + 4,
> >  	.vtotal =3D 240 + 4 + 4 + 14,
> > -	.vrefresh =3D 60,
> >  	.flags =3D DRM_MODE_FLAG_NVSYNC | DRM_MODE_FLAG_NHSYNC,
> >  };
> >  =

> > @@ -1317,7 +1295,6 @@ static const struct drm_display_mode edt_etm04308=
0dh6gp_mode =3D {
> >  	.vsync_start =3D 288 + 2,
> >  	.vsync_end =3D 288 + 2 + 4,
> >  	.vtotal =3D 288 + 2 + 4 + 10,
> > -	.vrefresh =3D 60,
> >  };
> >  =

> >  static const struct panel_desc edt_etm043080dh6gp =3D {
> > @@ -1342,7 +1319,6 @@ static const struct drm_display_mode edt_etm0430g=
0dh6_mode =3D {
> >  	.vsync_start =3D 272 + 2,
> >  	.vsync_end =3D 272 + 2 + 10,
> >  	.vtotal =3D 272 + 2 + 10 + 2,
> > -	.vrefresh =3D 60,
> >  	.flags =3D DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC,
> >  };
> >  =

> > @@ -1366,7 +1342,6 @@ static const struct drm_display_mode edt_et057090=
dhu_mode =3D {
> >  	.vsync_start =3D 480 + 10,
> >  	.vsync_end =3D 480 + 10 + 3,
> >  	.vtotal =3D 480 + 10 + 3 + 32,
> > -	.vrefresh =3D 60,
> >  	.flags =3D DRM_MODE_FLAG_NVSYNC | DRM_MODE_FLAG_NHSYNC,
> >  };
> >  =

> > @@ -1392,7 +1367,6 @@ static const struct drm_display_mode edt_etm0700g=
0dh6_mode =3D {
> >  	.vsync_start =3D 480 + 10,
> >  	.vsync_end =3D 480 + 10 + 2,
> >  	.vtotal =3D 480 + 10 + 2 + 33,
> > -	.vrefresh =3D 60,
> >  	.flags =3D DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC,
> >  };
> >  =

> > @@ -1457,7 +1431,6 @@ static const struct drm_display_mode foxlink_fl50=
0wvr00_a0t_mode =3D {
> >  	.vsync_start =3D 480 + 37,
> >  	.vsync_end =3D 480 + 37 + 2,
> >  	.vtotal =3D 480 + 37 + 2 + 8,
> > -	.vrefresh =3D 60,
> >  };
> >  =

> >  static const struct panel_desc foxlink_fl500wvr00_a0t =3D {
> > @@ -1481,7 +1454,6 @@ static const struct drm_display_mode frida_frd350=
h54004_mode =3D {
> >  	.vsync_start =3D 240 + 2,
> >  	.vsync_end =3D 240 + 2 + 6,
> >  	.vtotal =3D 240 + 2 + 6 + 2,
> > -	.vrefresh =3D 60,
> >  	.flags =3D DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC,
> >  };
> >  =

> > @@ -1508,7 +1480,6 @@ static const struct drm_display_mode friendlyarm_=
hd702e_mode =3D {
> >  	.vsync_start	=3D 1280 + 4,
> >  	.vsync_end	=3D 1280 + 4 + 8,
> >  	.vtotal		=3D 1280 + 4 + 8 + 4,
> > -	.vrefresh	=3D 60,
> >  	.flags		=3D DRM_MODE_FLAG_NVSYNC | DRM_MODE_FLAG_NHSYNC,
> >  };
> >  =

> > @@ -1531,7 +1502,6 @@ static const struct drm_display_mode giantplus_gp=
g482739qs5_mode =3D {
> >  	.vsync_start =3D 272 + 8,
> >  	.vsync_end =3D 272 + 8 + 1,
> >  	.vtotal =3D 272 + 8 + 1 + 8,
> > -	.vrefresh =3D 60,
> >  };
> >  =

> >  static const struct panel_desc giantplus_gpg482739qs5 =3D {
> > @@ -1635,7 +1605,6 @@ static const struct drm_display_mode hitachi_tx23=
d38vm0caa_mode =3D {
> >  	.vsync_start =3D 480 + 16,
> >  	.vsync_end =3D 480 + 16 + 13,
> >  	.vtotal =3D 480 + 16 + 13 + 16,
> > -	.vrefresh =3D 60,
> >  };
> >  =

> >  static const struct panel_desc hitachi_tx23d38vm0caa =3D {
> > @@ -1662,7 +1631,6 @@ static const struct drm_display_mode innolux_at04=
3tn24_mode =3D {
> >  	.vsync_start =3D 272 + 2,
> >  	.vsync_end =3D 272 + 2 + 10,
> >  	.vtotal =3D 272 + 2 + 10 + 2,
> > -	.vrefresh =3D 60,
> >  	.flags =3D DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC,
> >  };
> >  =

> > @@ -1688,7 +1656,6 @@ static const struct drm_display_mode innolux_at07=
0tn92_mode =3D {
> >  	.vsync_start =3D 480 + 22,
> >  	.vsync_end =3D 480 + 22 + 10,
> >  	.vtotal =3D 480 + 22 + 23 + 10,
> > -	.vrefresh =3D 60,
> >  };
> >  =

> >  static const struct panel_desc innolux_at070tn92 =3D {
> > @@ -1799,7 +1766,6 @@ static const struct drm_display_mode innolux_g121=
x1_l03_mode =3D {
> >  	.vsync_start =3D 768 + 38,
> >  	.vsync_end =3D 768 + 38 + 1,
> >  	.vtotal =3D 768 + 38 + 1 + 0,
> > -	.vrefresh =3D 60,
> >  	.flags =3D DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC,
> >  };
> >  =

> > @@ -1861,7 +1827,6 @@ static const struct drm_display_mode innolux_n156=
bge_l21_mode =3D {
> >  	.vsync_start =3D 768 + 2,
> >  	.vsync_end =3D 768 + 2 + 6,
> >  	.vtotal =3D 768 + 2 + 6 + 12,
> > -	.vrefresh =3D 60,
> >  };
> >  =

> >  static const struct panel_desc innolux_n156bge_l21 =3D {
> > @@ -1884,7 +1849,6 @@ static const struct drm_display_mode innolux_p120=
zdg_bf1_mode =3D {
> >  	.vsync_start =3D 1440 + 3,
> >  	.vsync_end =3D 1440 + 3 + 10,
> >  	.vtotal =3D 1440 + 3 + 10 + 27,
> > -	.vrefresh =3D 60,
> >  	.flags =3D DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC,
> >  };
> >  =

> > @@ -1912,7 +1876,6 @@ static const struct drm_display_mode innolux_zj07=
0na_01p_mode =3D {
> >  	.vsync_start =3D 600 + 16,
> >  	.vsync_end =3D 600 + 16 + 4,
> >  	.vtotal =3D 600 + 16 + 4 + 16,
> > -	.vrefresh =3D 60,
> >  };
> >  =

> >  static const struct panel_desc innolux_zj070na_01p =3D {
> > @@ -2008,7 +1971,6 @@ static const struct drm_display_mode lemaker_bl03=
5_rgb_002_mode =3D {
> >  	.vsync_start =3D 240 + 4,
> >  	.vsync_end =3D 240 + 4 + 3,
> >  	.vtotal =3D 240 + 4 + 3 + 15,
> > -	.vrefresh =3D 60,
> >  };
> >  =

> >  static const struct panel_desc lemaker_bl035_rgb_002 =3D {
> > @@ -2032,7 +1994,6 @@ static const struct drm_display_mode lg_lb070wv8_=
mode =3D {
> >  	.vsync_start =3D 480 + 10,
> >  	.vsync_end =3D 480 + 10 + 25,
> >  	.vtotal =3D 480 + 10 + 25 + 10,
> > -	.vrefresh =3D 60,
> >  };
> >  =

> >  static const struct panel_desc lg_lb070wv8 =3D {
> > @@ -2057,7 +2018,6 @@ static const struct drm_display_mode lg_lp079qx1_=
sp0v_mode =3D {
> >  	.vsync_start =3D 2048 + 8,
> >  	.vsync_end =3D 2048 + 8 + 4,
> >  	.vtotal =3D 2048 + 8 + 4 + 8,
> > -	.vrefresh =3D 60,
> >  	.flags =3D DRM_MODE_FLAG_NVSYNC | DRM_MODE_FLAG_NHSYNC,
> >  };
> >  =

> > @@ -2080,7 +2040,6 @@ static const struct drm_display_mode lg_lp097qx1_=
spa1_mode =3D {
> >  	.vsync_start =3D 1536 + 3,
> >  	.vsync_end =3D 1536 + 3 + 1,
> >  	.vtotal =3D 1536 + 3 + 1 + 9,
> > -	.vrefresh =3D 60,
> >  };
> >  =

> >  static const struct panel_desc lg_lp097qx1_spa1 =3D {
> > @@ -2102,7 +2061,6 @@ static const struct drm_display_mode lg_lp120up1_=
mode =3D {
> >  	.vsync_start =3D 1280 + 4,
> >  	.vsync_end =3D 1280 + 4 + 4,
> >  	.vtotal =3D 1280 + 4 + 4 + 12,
> > -	.vrefresh =3D 60,
> >  };
> >  =

> >  static const struct panel_desc lg_lp120up1 =3D {
> > @@ -2125,7 +2083,6 @@ static const struct drm_display_mode lg_lp129qe_m=
ode =3D {
> >  	.vsync_start =3D 1700 + 3,
> >  	.vsync_end =3D 1700 + 3 + 10,
> >  	.vtotal =3D 1700 + 3 + 10 + 36,
> > -	.vrefresh =3D 60,
> >  };
> >  =

> >  static const struct panel_desc lg_lp129qe =3D {
> > @@ -2206,7 +2163,6 @@ static const struct drm_display_mode mitsubishi_a=
a070mc01_mode =3D {
> >  	.vsync_start =3D 480 + 0,
> >  	.vsync_end =3D 480 + 48 + 1,
> >  	.vtotal =3D 480 + 48 + 1 + 0,
> > -	.vrefresh =3D 60,
> >  	.flags =3D DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC,
> >  };
> >  =

> > @@ -2221,7 +2177,6 @@ static const struct drm_display_mode logicpd_type=
_28_mode =3D {
> >  	.vsync_start =3D 272 + 2,
> >  	.vsync_end =3D 272 + 2 + 11,
> >  	.vtotal =3D 272 + 2 + 11 + 3,
> > -	.vrefresh =3D 60,
> >  	.flags =3D DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC,
> >  };
> >  =

> > @@ -2301,7 +2256,6 @@ static const struct drm_display_mode nec_nl4827hc=
19_05b_mode =3D {
> >  	.vsync_start =3D 272 + 2,
> >  	.vsync_end =3D 272 + 2 + 4,
> >  	.vtotal =3D 272 + 2 + 4 + 2,
> > -	.vrefresh =3D 74,
> >  	.flags =3D DRM_MODE_FLAG_NVSYNC | DRM_MODE_FLAG_NHSYNC,
> >  };
> >  =

> > @@ -2327,7 +2281,6 @@ static const struct drm_display_mode netron_dy_e2=
31732_mode =3D {
> >  	.vsync_start =3D 600 + 127,
> >  	.vsync_end =3D 600 + 127 + 20,
> >  	.vtotal =3D 600 + 127 + 20 + 3,
> > -	.vrefresh =3D 60,
> >  };
> >  =

> >  static const struct panel_desc netron_dy_e231732 =3D {
> > @@ -2350,7 +2303,6 @@ static const struct drm_display_mode newhaven_nhd=
_43_480272ef_atxl_mode =3D {
> >  	.vsync_start =3D 272 + 2,
> >  	.vsync_end =3D 272 + 2 + 10,
> >  	.vtotal =3D 272 + 2 + 10 + 2,
> > -	.vrefresh =3D 60,
> >  	.flags =3D DRM_MODE_FLAG_NVSYNC | DRM_MODE_FLAG_NHSYNC,
> >  };
> >  =

> > @@ -2458,7 +2410,6 @@ static const struct drm_display_mode olimex_lcd_o=
linuxino_43ts_mode =3D {
> >  	.vsync_start =3D 272 + 8,
> >  	.vsync_end =3D 272 + 8 + 5,
> >  	.vtotal =3D 272 + 8 + 5 + 3,
> > -	.vrefresh =3D 60,
> >  };
> >  =

> >  static const struct panel_desc olimex_lcd_olinuxino_43ts =3D {
> > @@ -2486,7 +2437,6 @@ static const struct drm_display_mode ontat_yx700w=
v03_mode =3D {
> >  	.vsync_start =3D 483,
> >  	.vsync_end =3D 493,
> >  	.vtotal =3D 500,
> > -	.vrefresh =3D 60,
> >  	.flags =3D DRM_MODE_FLAG_NVSYNC | DRM_MODE_FLAG_NHSYNC,
> >  };
> >  =

> > @@ -2515,7 +2465,6 @@ static const struct drm_display_mode ortustech_co=
m37h3m_mode  =3D {
> >  	.vsync_start =3D 640 + 4,
> >  	.vsync_end =3D 640 + 4 + 3,
> >  	.vtotal =3D 640 + 4 + 3 + 4,
> > -	.vrefresh =3D 60,
> >  	.flags =3D DRM_MODE_FLAG_NVSYNC | DRM_MODE_FLAG_NHSYNC,
> >  };
> >  =

> > @@ -2542,7 +2491,6 @@ static const struct drm_display_mode ortustech_co=
m43h4m85ulc_mode  =3D {
> >  	.vsync_start =3D 800 + 3,
> >  	.vsync_end =3D 800 + 3 + 3,
> >  	.vtotal =3D 800 + 3 + 3 + 3,
> > -	.vrefresh =3D 60,
> >  };
> >  =

> >  static const struct panel_desc ortustech_com43h4m85ulc =3D {
> > @@ -2567,7 +2515,6 @@ static const struct drm_display_mode osddisplays_=
osd070t1718_19ts_mode  =3D {
> >  	.vsync_start =3D 480 + 22,
> >  	.vsync_end =3D 480 + 22 + 13,
> >  	.vtotal =3D 480 + 22 + 13 + 10,
> > -	.vrefresh =3D 60,
> >  	.flags =3D DRM_MODE_FLAG_NVSYNC | DRM_MODE_FLAG_NHSYNC,
> >  };
> >  =

> > @@ -2594,7 +2541,6 @@ static const struct drm_display_mode pda_91_00156=
_a0_mode =3D {
> >  	.vsync_start =3D 480 + 1,
> >  	.vsync_end =3D 480 + 1 + 23,
> >  	.vtotal =3D 480 + 1 + 23 + 22,
> > -	.vrefresh =3D 60,
> >  };
> >  =

> >  static const struct panel_desc pda_91_00156_a0  =3D {
> > @@ -2618,7 +2564,6 @@ static const struct drm_display_mode qd43003c0_40=
_mode =3D {
> >  	.vsync_start =3D 272 + 4,
> >  	.vsync_end =3D 272 + 4 + 10,
> >  	.vtotal =3D 272 + 4 + 10 + 2,
> > -	.vrefresh =3D 60,
> >  };
> >  =

> >  static const struct panel_desc qd43003c0_40 =3D {
> > @@ -2672,7 +2617,6 @@ static const struct drm_display_mode rocktech_rk1=
01ii01d_ct_mode =3D {
> >  	.vsync_start =3D 800 + 2,
> >  	.vsync_end =3D 800 + 2 + 5,
> >  	.vtotal =3D 800 + 2 + 5 + 16,
> > -	.vrefresh =3D 60,
> >  };
> >  =

> >  static const struct panel_desc rocktech_rk101ii01d_ct =3D {
> > @@ -2701,7 +2645,6 @@ static const struct drm_display_mode samsung_lsn1=
22dl01_c01_mode =3D {
> >  	.vsync_start =3D 1600 + 2,
> >  	.vsync_end =3D 1600 + 2 + 5,
> >  	.vtotal =3D 1600 + 2 + 5 + 57,
> > -	.vrefresh =3D 60,
> >  };
> >  =

> >  static const struct panel_desc samsung_lsn122dl01_c01 =3D {
> > @@ -2723,7 +2666,6 @@ static const struct drm_display_mode samsung_ltn1=
01nt05_mode =3D {
> >  	.vsync_start =3D 600 + 3,
> >  	.vsync_end =3D 600 + 3 + 6,
> >  	.vtotal =3D 600 + 3 + 6 + 61,
> > -	.vrefresh =3D 60,
> >  };
> >  =

> >  static const struct panel_desc samsung_ltn101nt05 =3D {
> > @@ -2746,7 +2688,6 @@ static const struct drm_display_mode samsung_ltn1=
40at29_301_mode =3D {
> >  	.vsync_start =3D 768 + 2,
> >  	.vsync_end =3D 768 + 2 + 5,
> >  	.vtotal =3D 768 + 2 + 5 + 17,
> > -	.vrefresh =3D 60,
> >  };
> >  =

> >  static const struct panel_desc samsung_ltn140at29_301 =3D {
> > @@ -2793,7 +2734,6 @@ static const struct drm_display_mode sharp_ld_d51=
16z01b_mode =3D {
> >  	.vsync_start =3D 1280 + 3,
> >  	.vsync_end =3D 1280 + 3 + 10,
> >  	.vtotal =3D 1280 + 3 + 10 + 57,
> > -	.vrefresh =3D 60,
> >  	.flags =3D DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC,
> >  };
> >  =

> > @@ -2819,7 +2759,6 @@ static const struct drm_display_mode sharp_lq070y=
3dg3b_mode =3D {
> >  	.vsync_start =3D 480 + 8,
> >  	.vsync_end =3D 480 + 8 + 2,
> >  	.vtotal =3D 480 + 8 + 2 + 35,
> > -	.vrefresh =3D 60,
> >  	.flags =3D DISPLAY_FLAGS_PIXDATA_POSEDGE,
> >  };
> >  =

> > @@ -2846,7 +2785,6 @@ static const struct drm_display_mode sharp_lq035q=
7db03_mode =3D {
> >  	.vsync_start =3D 320 + 9,
> >  	.vsync_end =3D 320 + 9 + 1,
> >  	.vtotal =3D 320 + 9 + 1 + 7,
> > -	.vrefresh =3D 60,
> >  };
> >  =

> >  static const struct panel_desc sharp_lq035q7db03 =3D {
> > @@ -2923,7 +2861,6 @@ static const struct drm_display_mode sharp_lq150x=
1lg11_mode =3D {
> >  	.vsync_start =3D 768 + 37,
> >  	.vsync_end =3D 768 + 37 + 2,
> >  	.vtotal =3D 768 + 37 + 2 + 8,
> > -	.vrefresh =3D 60,
> >  };
> >  =

> >  static const struct panel_desc sharp_lq150x1lg11 =3D {
> > @@ -2974,7 +2911,6 @@ static const struct drm_display_mode shelly_sca07=
010_bfn_lnn_mode =3D {
> >  	.vsync_start =3D 480 + 1,
> >  	.vsync_end =3D 480 + 1 + 23,
> >  	.vtotal =3D 480 + 1 + 23 + 22,
> > -	.vrefresh =3D 60,
> >  };
> >  =

> >  static const struct panel_desc shelly_sca07010_bfn_lnn =3D {
> > @@ -2997,7 +2933,6 @@ static const struct drm_display_mode starry_kr122=
ea0sra_mode =3D {
> >  	.vsync_start =3D 1200 + 15,
> >  	.vsync_end =3D 1200 + 15 + 2,
> >  	.vtotal =3D 1200 + 15 + 2 + 18,
> > -	.vrefresh =3D 60,
> >  	.flags =3D DRM_MODE_FLAG_NVSYNC | DRM_MODE_FLAG_NHSYNC,
> >  };
> >  =

> > @@ -3025,7 +2960,6 @@ static const struct drm_display_mode tfc_s9700rtw=
v43tr_01b_mode =3D {
> >  	.vsync_start =3D 480 + 13,
> >  	.vsync_end =3D 480 + 13 + 2,
> >  	.vtotal =3D 480 + 13 + 2 + 29,
> > -	.vrefresh =3D 62,
> >  };
> >  =

> >  static const struct panel_desc tfc_s9700rtwv43tr_01b =3D {
> > @@ -3101,7 +3035,6 @@ static const struct drm_display_mode ti_nspire_cx=
_lcd_mode[] =3D {
> >  		.vsync_start =3D 240 + 3,
> >  		.vsync_end =3D 240 + 3 + 1,
> >  		.vtotal =3D 240 + 3 + 1 + 17,
> > -		.vrefresh =3D 60,
> >  		.flags =3D DRM_MODE_FLAG_NVSYNC | DRM_MODE_FLAG_NHSYNC,
> >  	},
> >  };
> > @@ -3129,7 +3062,6 @@ static const struct drm_display_mode ti_nspire_cl=
assic_lcd_mode[] =3D {
> >  		.vsync_start =3D 240 + 0,
> >  		.vsync_end =3D 240 + 0 + 1,
> >  		.vtotal =3D 240 + 0 + 1 + 0,
> > -		.vrefresh =3D 60,
> >  		.flags =3D DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC,
> >  	},
> >  };
> > @@ -3158,7 +3090,6 @@ static const struct drm_display_mode toshiba_lt08=
9ac29000_mode =3D {
> >  	.vsync_start =3D 768 + 20,
> >  	.vsync_end =3D 768 + 20 + 7,
> >  	.vtotal =3D 768 + 20 + 7 + 3,
> > -	.vrefresh =3D 60,
> >  };
> >  =

> >  static const struct panel_desc toshiba_lt089ac29000 =3D {
> > @@ -3183,7 +3114,6 @@ static const struct drm_display_mode tpk_f07a_010=
2_mode =3D {
> >  	.vsync_start =3D 480 + 10,
> >  	.vsync_end =3D 480 + 10 + 2,
> >  	.vtotal =3D 480 + 10 + 2 + 33,
> > -	.vrefresh =3D 60,
> >  };
> >  =

> >  static const struct panel_desc tpk_f07a_0102 =3D {
> > @@ -3206,7 +3136,6 @@ static const struct drm_display_mode tpk_f10a_010=
2_mode =3D {
> >  	.vsync_start =3D 600 + 20,
> >  	.vsync_end =3D 600 + 20 + 5,
> >  	.vtotal =3D 600 + 20 + 5 + 25,
> > -	.vrefresh =3D 60,
> >  };
> >  =

> >  static const struct panel_desc tpk_f10a_0102 =3D {
> > @@ -3265,7 +3194,6 @@ static const struct drm_display_mode vl050_8048nt=
_c01_mode =3D {
> >  	.vsync_start =3D 480 + 22,
> >  	.vsync_end =3D 480 + 22 + 10,
> >  	.vtotal =3D 480 + 22 + 10 + 23,
> > -	.vrefresh =3D 60,
> >  	.flags =3D DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC,
> >  };
> >  =

> > @@ -3291,7 +3219,6 @@ static const struct drm_display_mode winstar_wf35=
ltiacd_mode =3D {
> >  	.vsync_start =3D 240 + 4,
> >  	.vsync_end =3D 240 + 4 + 3,
> >  	.vtotal =3D 240 + 4 + 3 + 15,
> > -	.vrefresh =3D 60,
> >  	.flags =3D DRM_MODE_FLAG_NVSYNC | DRM_MODE_FLAG_NHSYNC,
> >  };
> >  =

> > @@ -3317,7 +3244,6 @@ static const struct drm_display_mode arm_rtsm_mod=
e[] =3D {
> >  		.vsync_start =3D 768 + 3,
> >  		.vsync_end =3D 768 + 3 + 6,
> >  		.vtotal =3D 768 + 3 + 6 + 29,
> > -		.vrefresh =3D 60,
> >  		.flags =3D DRM_MODE_FLAG_NVSYNC | DRM_MODE_FLAG_NHSYNC,
> >  	},
> >  };
> > @@ -3743,7 +3669,6 @@ static const struct drm_display_mode auo_b080uan0=
1_mode =3D {
> >  	.vsync_start =3D 1920 + 9,
> >  	.vsync_end =3D 1920 + 9 + 2,
> >  	.vtotal =3D 1920 + 9 + 2 + 8,
> > -	.vrefresh =3D 60,
> >  };
> >  =

> >  static const struct panel_desc_dsi auo_b080uan01 =3D {
> > @@ -3771,7 +3696,6 @@ static const struct drm_display_mode boe_tv080wum=
_nl0_mode =3D {
> >  	.vsync_start =3D 1920 + 21,
> >  	.vsync_end =3D 1920 + 21 + 3,
> >  	.vtotal =3D 1920 + 21 + 3 + 18,
> > -	.vrefresh =3D 60,
> >  	.flags =3D DRM_MODE_FLAG_NVSYNC | DRM_MODE_FLAG_NHSYNC,
> >  };
> >  =

> > @@ -3801,7 +3725,6 @@ static const struct drm_display_mode lg_ld070wx3_=
sl01_mode =3D {
> >  	.vsync_start =3D 1280 + 28,
> >  	.vsync_end =3D 1280 + 28 + 1,
> >  	.vtotal =3D 1280 + 28 + 1 + 14,
> > -	.vrefresh =3D 60,
> >  };
> >  =

> >  static const struct panel_desc_dsi lg_ld070wx3_sl01 =3D {
> > @@ -3829,7 +3752,6 @@ static const struct drm_display_mode lg_lh500wx1_=
sd03_mode =3D {
> >  	.vsync_start =3D 1280 + 8,
> >  	.vsync_end =3D 1280 + 8 + 4,
> >  	.vtotal =3D 1280 + 8 + 4 + 12,
> > -	.vrefresh =3D 60,
> >  };
> >  =

> >  static const struct panel_desc_dsi lg_lh500wx1_sd03 =3D {
> > @@ -3857,7 +3779,6 @@ static const struct drm_display_mode panasonic_vv=
x10f004b00_mode =3D {
> >  	.vsync_start =3D 1200 + 17,
> >  	.vsync_end =3D 1200 + 17 + 2,
> >  	.vtotal =3D 1200 + 17 + 2 + 16,
> > -	.vrefresh =3D 60,
> >  };
> >  =

> >  static const struct panel_desc_dsi panasonic_vvx10f004b00 =3D {
> > @@ -3886,7 +3807,6 @@ static const struct drm_display_mode lg_acx467akm=
_7_mode =3D {
> >  	.vsync_start =3D 1920 + 2,
> >  	.vsync_end =3D 1920 + 2 + 2,
> >  	.vtotal =3D 1920 + 2 + 2 + 2,
> > -	.vrefresh =3D 60,
> >  };
> >  =

> >  static const struct panel_desc_dsi lg_acx467akm_7 =3D {
> > @@ -3914,7 +3834,6 @@ static const struct drm_display_mode osd101t2045_=
53ts_mode =3D {
> >  	.vsync_start =3D 1200 + 16,
> >  	.vsync_end =3D 1200 + 16 + 2,
> >  	.vtotal =3D 1200 + 16 + 2 + 16,
> > -	.vrefresh =3D 60,
> >  	.flags =3D DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC,
> >  };
> >  =

> > diff --git a/drivers/gpu/drm/panel/panel-sitronix-st7701.c b/drivers/gp=
u/drm/panel/panel-sitronix-st7701.c
> > index 4b4f2558e3b4..692041ae4eb6 100644
> > --- a/drivers/gpu/drm/panel/panel-sitronix-st7701.c
> > +++ b/drivers/gpu/drm/panel/panel-sitronix-st7701.c
> > @@ -272,7 +272,7 @@ static int st7701_get_modes(struct drm_panel *panel,
> >  		DRM_DEV_ERROR(&st7701->dsi->dev,
> >  			      "failed to add mode %ux%ux@%u\n",
> >  			      desc_mode->hdisplay, desc_mode->vdisplay,
> > -			      desc_mode->vrefresh);
> > +			      drm_mode_vrefresh(desc_mode));
> >  		return -ENOMEM;
> >  	}
> >  =

> > diff --git a/drivers/gpu/drm/panel/panel-sitronix-st7789v.c b/drivers/g=
pu/drm/panel/panel-sitronix-st7789v.c
> > index cc02c54c1b2e..3513ae40efa8 100644
> > --- a/drivers/gpu/drm/panel/panel-sitronix-st7789v.c
> > +++ b/drivers/gpu/drm/panel/panel-sitronix-st7789v.c
> > @@ -165,7 +165,6 @@ static const struct drm_display_mode default_mode =
=3D {
> >  	.vsync_start =3D 320 + 8,
> >  	.vsync_end =3D 320 + 8 + 4,
> >  	.vtotal =3D 320 + 8 + 4 + 4,
> > -	.vrefresh =3D 60,
> >  };
> >  =

> >  static int st7789v_get_modes(struct drm_panel *panel,
> > @@ -177,7 +176,7 @@ static int st7789v_get_modes(struct drm_panel *pane=
l,
> >  	if (!mode) {
> >  		dev_err(panel->dev, "failed to add mode %ux%ux@%u\n",
> >  			default_mode.hdisplay, default_mode.vdisplay,
> > -			default_mode.vrefresh);
> > +			drm_mode_vrefresh(&default_mode));
> >  		return -ENOMEM;
> >  	}
> >  =

> > diff --git a/drivers/gpu/drm/panel/panel-sony-acx424akp.c b/drivers/gpu=
/drm/panel/panel-sony-acx424akp.c
> > index de0abf76ae6f..eba05bd6ec9a 100644
> > --- a/drivers/gpu/drm/panel/panel-sony-acx424akp.c
> > +++ b/drivers/gpu/drm/panel/panel-sony-acx424akp.c
> > @@ -57,7 +57,6 @@ static const struct drm_display_mode sony_acx424akp_v=
id_mode =3D {
> >  	.vsync_start =3D 864 + 14,
> >  	.vsync_end =3D 864 + 14 + 1,
> >  	.vtotal =3D 864 + 14 + 1 + 11,
> > -	.vrefresh =3D 60,
> >  	.width_mm =3D 48,
> >  	.height_mm =3D 84,
> >  	.flags =3D DRM_MODE_FLAG_PVSYNC,
> > @@ -81,7 +80,6 @@ static const struct drm_display_mode sony_acx424akp_c=
md_mode =3D {
> >  	 * Some desired refresh rate, experiments at the maximum "pixel"
> >  	 * clock speed (HS clock 420 MHz) yields around 117Hz.
> >  	 */
> > -	.vrefresh =3D 60,
> >  	.width_mm =3D 48,
> >  	.height_mm =3D 84,
> >  };
> > diff --git a/drivers/gpu/drm/panel/panel-sony-acx565akm.c b/drivers/gpu=
/drm/panel/panel-sony-acx565akm.c
> > index 5c4b6f6e5c2d..fc6a7e451abe 100644
> > --- a/drivers/gpu/drm/panel/panel-sony-acx565akm.c
> > +++ b/drivers/gpu/drm/panel/panel-sony-acx565akm.c
> > @@ -514,7 +514,6 @@ static const struct drm_display_mode acx565akm_mode=
 =3D {
> >  	.vsync_start =3D 480 + 3,
> >  	.vsync_end =3D 480 + 3 + 3,
> >  	.vtotal =3D 480 + 3 + 3 + 4,
> > -	.vrefresh =3D 57,
> >  	.type =3D DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED,
> >  	.flags =3D DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC,
> >  	.width_mm =3D 77,
> > diff --git a/drivers/gpu/drm/panel/panel-tpo-td028ttec1.c b/drivers/gpu=
/drm/panel/panel-tpo-td028ttec1.c
> > index aeca15dfeb3c..58d683cc5215 100644
> > --- a/drivers/gpu/drm/panel/panel-tpo-td028ttec1.c
> > +++ b/drivers/gpu/drm/panel/panel-tpo-td028ttec1.c
> > @@ -281,7 +281,6 @@ static const struct drm_display_mode td028ttec1_mod=
e =3D {
> >  	.vsync_start =3D 640 + 4,
> >  	.vsync_end =3D 640 + 4 + 2,
> >  	.vtotal =3D 640 + 4 + 2 + 2,
> > -	.vrefresh =3D 66,
> >  	.type =3D DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED,
> >  	.flags =3D DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC,
> >  	.width_mm =3D 43,
> > diff --git a/drivers/gpu/drm/panel/panel-tpo-td043mtea1.c b/drivers/gpu=
/drm/panel/panel-tpo-td043mtea1.c
> > index 75f1f1f1b6de..9b2a356c4d9a 100644
> > --- a/drivers/gpu/drm/panel/panel-tpo-td043mtea1.c
> > +++ b/drivers/gpu/drm/panel/panel-tpo-td043mtea1.c
> > @@ -339,7 +339,6 @@ static const struct drm_display_mode td043mtea1_mod=
e =3D {
> >  	.vsync_start =3D 480 + 39,
> >  	.vsync_end =3D 480 + 39 + 1,
> >  	.vtotal =3D 480 + 39 + 1 + 34,
> > -	.vrefresh =3D 60,
> >  	.type =3D DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED,
> >  	.flags =3D DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC,
> >  	.width_mm =3D 94,
> > diff --git a/drivers/gpu/drm/panel/panel-tpo-tpg110.c b/drivers/gpu/drm=
/panel/panel-tpo-tpg110.c
> > index 8472d018c16f..c7a2f0ae5ba5 100644
> > --- a/drivers/gpu/drm/panel/panel-tpo-tpg110.c
> > +++ b/drivers/gpu/drm/panel/panel-tpo-tpg110.c
> > @@ -112,7 +112,6 @@ static const struct tpg110_panel_mode tpg110_modes[=
] =3D {
> >  			.vsync_start =3D 480 + 10,
> >  			.vsync_end =3D 480 + 10 + 1,
> >  			.vtotal =3D 480 + 10 + 1 + 35,
> > -			.vrefresh =3D 60,
> >  		},
> >  		.bus_flags =3D DRM_BUS_FLAG_PIXDATA_DRIVE_POSEDGE,
> >  	},
> > @@ -129,7 +128,6 @@ static const struct tpg110_panel_mode tpg110_modes[=
] =3D {
> >  			.vsync_start =3D 480 + 18,
> >  			.vsync_end =3D 480 + 18 + 1,
> >  			.vtotal =3D 480 + 18 + 1 + 27,
> > -			.vrefresh =3D 60,
> >  		},
> >  		.bus_flags =3D DRM_BUS_FLAG_PIXDATA_DRIVE_POSEDGE,
> >  	},
> > @@ -146,7 +144,6 @@ static const struct tpg110_panel_mode tpg110_modes[=
] =3D {
> >  			.vsync_start =3D 272 + 2,
> >  			.vsync_end =3D 272 + 2 + 1,
> >  			.vtotal =3D 272 + 2 + 1 + 12,
> > -			.vrefresh =3D 60,
> >  		},
> >  		.bus_flags =3D DRM_BUS_FLAG_PIXDATA_DRIVE_POSEDGE,
> >  	},
> > @@ -163,7 +160,6 @@ static const struct tpg110_panel_mode tpg110_modes[=
] =3D {
> >  			.vsync_start =3D 640 + 4,
> >  			.vsync_end =3D 640 + 4 + 1,
> >  			.vtotal =3D 640 + 4 + 1 + 8,
> > -			.vrefresh =3D 60,
> >  		},
> >  		.bus_flags =3D DRM_BUS_FLAG_PIXDATA_DRIVE_POSEDGE,
> >  	},
> > @@ -180,7 +176,6 @@ static const struct tpg110_panel_mode tpg110_modes[=
] =3D {
> >  			.vsync_start =3D 240 + 2,
> >  			.vsync_end =3D 240 + 2 + 1,
> >  			.vtotal =3D 240 + 2 + 1 + 20,
> > -			.vrefresh =3D 60,
> >  		},
> >  		.bus_flags =3D DRM_BUS_FLAG_PIXDATA_DRIVE_POSEDGE,
> >  	},
> > diff --git a/drivers/gpu/drm/panel/panel-truly-nt35597.c b/drivers/gpu/=
drm/panel/panel-truly-nt35597.c
> > index 012ca62bf30e..9d669088cffc 100644
> > --- a/drivers/gpu/drm/panel/panel-truly-nt35597.c
> > +++ b/drivers/gpu/drm/panel/panel-truly-nt35597.c
> > @@ -536,7 +536,6 @@ static const struct drm_display_mode qcom_sdm845_mt=
p_2k_mode =3D {
> >  	.vsync_start =3D 2560 + 8,
> >  	.vsync_end =3D 2560 + 8 + 1,
> >  	.vtotal =3D 2560 + 8 + 1 + 7,
> > -	.vrefresh =3D 60,
> >  	.flags =3D 0,
> >  };
> >  =

> > diff --git a/drivers/gpu/drm/panel/panel-xinpeng-xpp055c272.c b/drivers=
/gpu/drm/panel/panel-xinpeng-xpp055c272.c
> > index 1645aceab597..8a3b2f906e63 100644
> > --- a/drivers/gpu/drm/panel/panel-xinpeng-xpp055c272.c
> > +++ b/drivers/gpu/drm/panel/panel-xinpeng-xpp055c272.c
> > @@ -243,7 +243,6 @@ static const struct drm_display_mode default_mode =
=3D {
> >  	.vsync_start	=3D 1280 + 22,
> >  	.vsync_end	=3D 1280 + 22 + 4,
> >  	.vtotal		=3D 1280 + 22 + 4 + 11,
> > -	.vrefresh	=3D 60,
> >  	.clock		=3D 64000,
> >  	.width_mm	=3D 68,
> >  	.height_mm	=3D 121,
> > @@ -259,7 +258,7 @@ static int xpp055c272_get_modes(struct drm_panel *p=
anel,
> >  	if (!mode) {
> >  		DRM_DEV_ERROR(ctx->dev, "Failed to add mode %ux%u@%u\n",
> >  			      default_mode.hdisplay, default_mode.vdisplay,
> > -			      default_mode.vrefresh);
> > +			      drm_mode_vrefresh(&default_mode));
> >  		return -ENOMEM;
> >  	}
> >  =

> > diff --git a/drivers/gpu/drm/sti/sti_hda.c b/drivers/gpu/drm/sti/sti_hd=
a.c
> > index 2bb32009d117..3dc6e2e96541 100644
> > --- a/drivers/gpu/drm/sti/sti_hda.c
> > +++ b/drivers/gpu/drm/sti/sti_hda.c
> > @@ -586,7 +586,6 @@ static int sti_hda_connector_get_modes(struct drm_c=
onnector *connector)
> >  					&hda_supported_modes[i].mode);
> >  		if (!mode)
> >  			continue;
> > -		mode->vrefresh =3D drm_mode_vrefresh(mode);
> >  =

> >  		/* the first mode is the preferred mode */
> >  		if (i =3D=3D 0)
> > diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c b/drivers/gpu/drm/vmwg=
fx/vmwgfx_kms.c
> > index eb6e23e8d8ef..0b07f7b5ece4 100644
> > --- a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
> > +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
> > @@ -2226,7 +2226,6 @@ void vmw_guess_mode_timing(struct drm_display_mod=
e *mode)
> >  	mode->vtotal =3D mode->vsync_end + 50;
> >  =

> >  	mode->clock =3D (u32)mode->htotal * (u32)mode->vtotal / 100 * 6;
> > -	mode->vrefresh =3D drm_mode_vrefresh(mode);
> >  }
> >  =

> >  =

> > @@ -2300,7 +2299,6 @@ int vmw_du_connector_fill_modes(struct drm_connec=
tor *connector,
> >  		mode =3D drm_mode_duplicate(dev, bmode);
> >  		if (!mode)
> >  			return 0;
> > -		mode->vrefresh =3D drm_mode_vrefresh(mode);
> >  =

> >  		drm_mode_probed_add(connector, mode);
> >  	}
> > diff --git a/include/drm/drm_modes.h b/include/drm/drm_modes.h
> > index 7dab7f172431..52e8ca613e4b 100644
> > --- a/include/drm/drm_modes.h
> > +++ b/include/drm/drm_modes.h
> > @@ -380,16 +380,6 @@ struct drm_display_mode {
> >  	 */
> >  	int private_flags;
> >  =

> > -	/**
> > -	 * @vrefresh:
> > -	 *
> > -	 * Vertical refresh rate, for debug output in human readable form. Not
> > -	 * used in a functional way.
> > -	 *
> > -	 * This value is in Hz.
> > -	 */
> > -	int vrefresh;
> > -
> >  	/**
> >  	 * @picture_aspect_ratio:
> >  	 *
> > @@ -421,7 +411,7 @@ struct drm_display_mode {
> >   * @m: display mode
> >   */
> >  #define DRM_MODE_ARG(m) \
> > -	(m)->name, (m)->vrefresh, (m)->clock, \
> > +	(m)->name, drm_mode_vrefresh(m), (m)->clock, \
> >  	(m)->hdisplay, (m)->hsync_start, (m)->hsync_end, (m)->htotal, \
> >  	(m)->vdisplay, (m)->vsync_start, (m)->vsync_end, (m)->vtotal, \
> >  	(m)->type, (m)->flags
> =


-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
