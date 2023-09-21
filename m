Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 677E57A9251
	for <lists+dri-devel@lfdr.de>; Thu, 21 Sep 2023 09:55:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA66010E579;
	Thu, 21 Sep 2023 07:55:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10A8310E579
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Sep 2023 07:55:22 +0000 (UTC)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77]
 helo=[IPv6:::1]) by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1qjEWt-0007Ur-Up; Thu, 21 Sep 2023 09:55:20 +0200
Message-ID: <fa07e69431066065ab6dc6df8d4649ba04124aa4.camel@pengutronix.de>
Subject: Re: [PATCH 2/5] drm: lcdif: move controller enable into atomic_flush
From: Lucas Stach <l.stach@pengutronix.de>
To: Ying Liu <victor.liu@nxp.com>, Marek Vasut <marex@denx.de>
Date: Thu, 21 Sep 2023 09:55:19 +0200
In-Reply-To: <AM7PR04MB7046AA99475489B1220D309998F8A@AM7PR04MB7046.eurprd04.prod.outlook.com>
References: <20230920103126.2759601-1-l.stach@pengutronix.de>
 <20230920103126.2759601-3-l.stach@pengutronix.de>
 <AM7PR04MB7046AA99475489B1220D309998F8A@AM7PR04MB7046.eurprd04.prod.outlook.com>
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

Am Donnerstag, dem 21.09.2023 um 07:13 +0000 schrieb Ying Liu:
> Hi,
>=20
> On Wednesday, September 20, 2023 6:31 PM Lucas Stach <l.stach@pengutronix=
.de> wrote:
> > Allow drm_atomic_helper_commit_tail_rpm to setup all the plane
> > state before the scanout is started.
> >=20
> > Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
> > ---
> >  drivers/gpu/drm/mxsfb/lcdif_kms.c | 6 +++++-
> >  1 file changed, 5 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/drivers/gpu/drm/mxsfb/lcdif_kms.c
> > b/drivers/gpu/drm/mxsfb/lcdif_kms.c
> > index f5bfe8b52920..4acf6914a8d1 100644
> > --- a/drivers/gpu/drm/mxsfb/lcdif_kms.c
> > +++ b/drivers/gpu/drm/mxsfb/lcdif_kms.c
> > @@ -505,6 +505,8 @@ static int lcdif_crtc_atomic_check(struct drm_crtc
> > *crtc,
> >  static void lcdif_crtc_atomic_flush(struct drm_crtc *crtc,
> >  				    struct drm_atomic_state *state)
> >  {
> > +	struct drm_crtc_state *crtc_state =3D
> > drm_atomic_get_new_crtc_state(state,
> > +									  crtc);
> >  	struct lcdif_drm_private *lcdif =3D to_lcdif_drm_private(crtc->dev);
> >  	struct drm_pending_vblank_event *event;
> >  	u32 reg;
> > @@ -513,6 +515,9 @@ static void lcdif_crtc_atomic_flush(struct drm_crtc
> > *crtc,
> >  	reg |=3D CTRLDESCL0_5_SHADOW_LOAD_EN;
> >  	writel(reg, lcdif->base + LCDC_V8_CTRLDESCL0_5);
> >=20
> > +	if (drm_atomic_crtc_needs_modeset(crtc_state))
> > +		lcdif_enable_controller(lcdif);
>=20
> Moving lcdif_enable_controller() function call from atomic_enable to
> atomic_flush would change CRTC vs bridge enablement order, which
> effectively makes bridge enablement happen prior to CRTC enablement,
> see drm_atomic_helper_commit_tail_rpm() detail implementation.  The
> reversed order potentially causes malfunctions of the bridge.
>=20
This has nothing to do with the bridge after the LCDIF controller. The
RPM commit_tail implementation enables the CRTC before all the plane
state is set up. To avoid having to program the plane state in the CRTC
enable this series defers the actual controller enable to the last step
of the atomic commit. This way the plane state is programmed the usual
way via the atomic update_plane callback and we don't need to duplicate
this setup.

> BTW, even if it's ok to move the function call, it would be better to cal=
l
> lcdif_enable_controller() before CTRLDESCL0_5_SHADOW_LOAD_EN is
> set so that the original sequence is kept.  Also, LCDIF chapter in SoC RM=
s
> indicates that the shadow load enablement is the last step in
> "Software flow diagram".

This flow chart shows how the double buffered update should work, it
doesn't show the initial controller enable sequence. Without the shadow
load enable bit being set before the controller enable I could observe
sporadic issues on the first frame where the DMA engine would read the
wrong memory address.

Regards,
Lucas

>=20
> Regards,
> Liu Ying
>=20
> > +
> >  	event =3D crtc->state->event;
> >  	crtc->state->event =3D NULL;
> >=20
> > @@ -552,7 +557,6 @@ static void lcdif_crtc_atomic_enable(struct drm_crt=
c
> > *crtc,
> >=20
> > 	writel(CTRLDESCL_HIGH0_4_ADDR_HIGH(upper_32_bits(paddr)),
> >  		       lcdif->base + LCDC_V8_CTRLDESCL_HIGH0_4);
> >  	}
> > -	lcdif_enable_controller(lcdif);
> >=20
> >  	drm_crtc_vblank_on(crtc);
> >  }
> > --
> > 2.39.2
>=20

