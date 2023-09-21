Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DA367A9263
	for <lists+dri-devel@lfdr.de>; Thu, 21 Sep 2023 09:59:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3933110E585;
	Thu, 21 Sep 2023 07:59:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4734B10E587
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Sep 2023 07:59:20 +0000 (UTC)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77]
 helo=[IPv6:::1]) by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1qjEaj-0008UW-Vh; Thu, 21 Sep 2023 09:59:18 +0200
Message-ID: <7ea313d77869183975246cdaf6352713ff4253c0.camel@pengutronix.de>
Subject: Re: [PATCH 5/5] drm: lcdif: force modeset when FB format changes
From: Lucas Stach <l.stach@pengutronix.de>
To: Ying Liu <victor.liu@nxp.com>, Marek Vasut <marex@denx.de>
Date: Thu, 21 Sep 2023 09:59:16 +0200
In-Reply-To: <AM7PR04MB7046B544BFB1BAEE2335E7FF98F8A@AM7PR04MB7046.eurprd04.prod.outlook.com>
References: <20230920103126.2759601-1-l.stach@pengutronix.de>
 <20230920103126.2759601-6-l.stach@pengutronix.de>
 <AM7PR04MB7046B544BFB1BAEE2335E7FF98F8A@AM7PR04MB7046.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 dl-linux-imx <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 "patchwork-lst@pengutronix.de" <patchwork-lst@pengutronix.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am Donnerstag, dem 21.09.2023 um 07:34 +0000 schrieb Ying Liu:
> Hi,
>=20
> On Wednesday, September 20, 2023 6:31 PM Lucas Stach <l.stach@pengutronix=
.de> wrote:
> > Force a modeset if the new FB has a different format than the
> > currently active one. While it might be possible to change between
> > compatible formats without a full modeset as the format control is
> > also supposed to be double buffered, the colorspace conversion is
> > not, so when the CSC changes we need a modeset.
> >=20
> > For now just always force a modeset when the FB format changes to
> > properly reconfigure all parts of the device for the new format.
> >=20
> > Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
> > ---
> >  drivers/gpu/drm/mxsfb/lcdif_drv.c | 18 +++++++++++++++++-
> >  drivers/gpu/drm/mxsfb/lcdif_kms.c | 26 ++++++++++++++++++++------
> >  2 files changed, 37 insertions(+), 7 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/mxsfb/lcdif_drv.c
> > b/drivers/gpu/drm/mxsfb/lcdif_drv.c
> > index 18de2f17e249..b74f0cf1e240 100644
> > --- a/drivers/gpu/drm/mxsfb/lcdif_drv.c
> > +++ b/drivers/gpu/drm/mxsfb/lcdif_drv.c
> > @@ -30,9 +30,25 @@
> >  #include "lcdif_drv.h"
> >  #include "lcdif_regs.h"
> >=20
> > +static int lcdif_atomic_check(struct drm_device *dev,
> > +				struct drm_atomic_state *state)
>=20
> " checkpatch.pl --strict" complains:
> CHECK: Alignment should match open parenthesis
> #31: FILE: drivers/gpu/drm/mxsfb/lcdif_drv.c:34:
> +static int lcdif_atomic_check(struct drm_device *dev,
> +                               struct drm_atomic_state *state)
>=20
Right, I'll fix that.

> > +{
> > +	int ret;
> > +
> > +	ret =3D drm_atomic_helper_check(dev, state);
> > +	if (ret)
> > +		return ret;
> > +
> > +	/*
> > +	 * Check modeset again in case crtc_state->mode_changed is
> > +	 * updated in plane's ->atomic_check callback.
> > +	 */
> > +	return drm_atomic_helper_check_modeset(dev, state);
>=20
> This additional check looks fine, but it's done for every commit.
> Is it ok to move it to lcdif_plane_atomic_check() where mode_changed
> is set for those commits in question?

Potentially yes, as we only have a single plane in the LCDIF, but it
would be a deviation of how every other DRM driver is implementing this
check. If there are multiple planes than this call must happen after
all of them checked the state, so this is the most logical place to
have this check. Doing this check on every commit doesn't seem to hurt
other drivers, so I'm not really keen on doing things differently here.

Regards,
Lucas
=20
>=20
> Regards,
> Liu Ying
>=20
> > +}
> > +
> >  static const struct drm_mode_config_funcs lcdif_mode_config_funcs =3D =
{
> >  	.fb_create		=3D drm_gem_fb_create,
> > -	.atomic_check		=3D drm_atomic_helper_check,
> > +	.atomic_check		=3D lcdif_atomic_check,
> >  	.atomic_commit		=3D drm_atomic_helper_commit,
> >  };
> >=20
> > diff --git a/drivers/gpu/drm/mxsfb/lcdif_kms.c
> > b/drivers/gpu/drm/mxsfb/lcdif_kms.c
> > index 3ebf55d06027..8167604bd3f8 100644
> > --- a/drivers/gpu/drm/mxsfb/lcdif_kms.c
> > +++ b/drivers/gpu/drm/mxsfb/lcdif_kms.c
> > @@ -647,18 +647,32 @@ static const struct drm_crtc_funcs lcdif_crtc_fun=
cs
> > =3D {
> >  static int lcdif_plane_atomic_check(struct drm_plane *plane,
> >  				    struct drm_atomic_state *state)
> >  {
> > -	struct drm_plane_state *plane_state =3D
> > drm_atomic_get_new_plane_state(state,
> > -
> > plane);
> > +	struct drm_plane_state *new_state =3D
> > drm_atomic_get_new_plane_state(state,
> > +
> > plane);
> > +	struct drm_plane_state *old_state =3D
> > drm_atomic_get_old_plane_state(state,
> > +
> > plane);
> >  	struct lcdif_drm_private *lcdif =3D to_lcdif_drm_private(plane->dev);
> >  	struct drm_crtc_state *crtc_state;
> > +	int ret;
> > +
> > +	/* always okay to disable the plane */
> > +	if (!new_state->fb)
> > +		return 0;
> >=20
> >  	crtc_state =3D drm_atomic_get_new_crtc_state(state,
> >  						   &lcdif->crtc);
> >=20
> > -	return drm_atomic_helper_check_plane_state(plane_state,
> > crtc_state,
> > -						   DRM_PLANE_NO_SCALING,
> > -						   DRM_PLANE_NO_SCALING,
> > -						   false, true);
> > +	ret =3D drm_atomic_helper_check_plane_state(new_state, crtc_state,
> > +						  DRM_PLANE_NO_SCALING,
> > +						  DRM_PLANE_NO_SCALING,
> > +						  false, true);
> > +	if (ret)
> > +		return ret;
> > +
> > +	if (old_state->fb && new_state->fb->format !=3D old_state->fb->format=
)
> > +		crtc_state->mode_changed =3D true;
> > +
> > +	return 0;
> >  }
> >=20
> >  static void lcdif_plane_primary_atomic_update(struct drm_plane *plane,
> > --
> > 2.39.2
>=20

