Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 869577AB3BA
	for <lists+dri-devel@lfdr.de>; Fri, 22 Sep 2023 16:33:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 386E810E678;
	Fri, 22 Sep 2023 14:33:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48BD410E678
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Sep 2023 14:33:37 +0000 (UTC)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77]
 helo=[IPv6:::1]) by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1qjhDr-00048E-Dc; Fri, 22 Sep 2023 16:33:35 +0200
Message-ID: <fcf7b9661985da5f8d0210753565566172dbb529.camel@pengutronix.de>
Subject: Re: [PATCH v2 3/6] drm: lcdif: rework runtime PM handling in the
 atomic commit
From: Lucas Stach <l.stach@pengutronix.de>
To: Ying Liu <victor.liu@nxp.com>, Marek Vasut <marex@denx.de>
Date: Fri, 22 Sep 2023 16:33:35 +0200
In-Reply-To: <AM7PR04MB70466A7C22B15EB701B9543A98FFA@AM7PR04MB7046.eurprd04.prod.outlook.com>
References: <20230921200312.3989073-1-l.stach@pengutronix.de>
 <20230921200312.3989073-3-l.stach@pengutronix.de>
 <AM7PR04MB70466A7C22B15EB701B9543A98FFA@AM7PR04MB7046.eurprd04.prod.outlook.com>
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

Am Freitag, dem 22.09.2023 um 09:51 +0000 schrieb Ying Liu:
> On Friday, September 22, 2023 4:03 AM Lucas Stach <l.stach@pengutronix.de=
> wrote:
> > drm_atomic_helper_commit_tail_rpm makes it hard for drivers to follow
> > the documented encoder/bridge enable flow, as it commits all CRTC enabl=
es
> > before the planes are fully set up, so drivers that can't enable the
> > display link without valid plane setup either need to do the plane setu=
p
> > in the CRTC enable or violate the flow by enabling the display link aft=
er
> > the planes have been set up. Neither of those options seem like a good
> > idea.
> >=20
> > For devices that only do coarse-grained runtime PM for the whole displa=
y
> > controller and not per CRTC, like the i.MX LCDIF, we can handle hardwar=
e
> > wakeup and suspend in the atomic_commit_tail. Add a commit tail which
> > follows the more conventional atomic commit flow of first diabling any
> > unused CRTCs, setting up all the active plane state, then enable all
> > active display pipes and also handles the device runtime PM at the
> > appropriate times.
> >=20
> > Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
> > ---
> > v2: new patch
> > ---
> >  drivers/gpu/drm/mxsfb/lcdif_drv.c | 22 +++++++++++++++++++++-
> >  drivers/gpu/drm/mxsfb/lcdif_kms.c | 12 ++++++++++--
> >  2 files changed, 31 insertions(+), 3 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/mxsfb/lcdif_drv.c
> > b/drivers/gpu/drm/mxsfb/lcdif_drv.c
> > index 18de2f17e249..205f6855fb1b 100644
> > --- a/drivers/gpu/drm/mxsfb/lcdif_drv.c
> > +++ b/drivers/gpu/drm/mxsfb/lcdif_drv.c
> > @@ -36,8 +36,28 @@ static const struct drm_mode_config_funcs
> > lcdif_mode_config_funcs =3D {
> >  	.atomic_commit		=3D drm_atomic_helper_commit,
> >  };
> >=20
> > +void lcdif_commit_tail(struct drm_atomic_state *old_state)
> > +{
> > +	struct drm_device *drm =3D old_state->dev;
> > +
> > +	pm_runtime_get_sync(drm->dev);
>=20
> Here, pixel clock lcdif->clk is enabled via lcdif_rpm_resume(), and then =
...
>=20
> > +
> > +	drm_atomic_helper_commit_modeset_disables(drm, old_state);
> > +	drm_atomic_helper_commit_planes(drm, old_state,
> > +
> > 	DRM_PLANE_COMMIT_ACTIVE_ONLY);
> > +	drm_atomic_helper_commit_modeset_enables(drm, old_state);
>=20
> ... here, clk_set_rate() is called for lcdif->clk via lcdif_crtc_atomic_e=
nable().
> Set rate with clock enabled?
>=20
Yea, I don't like the pixel clock enable/disable in the runtime PM
handling, but wanted to minimize the changes for now and I don't think
there is any issue with changing the rate of a already enabled clock.
Might be better to move the pixel clock enable/disable in the
atomic_enable/disable to clear any doubt.

> Another concern is lcdif_reset_block() is called via lcdif_crtc_mode_set_=
nofb()
> here, while plane is already set up, which means plane settings are poten=
tially
> reset.
>=20
I thought so as well, but the documentation states that only internal
state is reset, not the user visible registers. My testing seemed to
indicate that the plane state is unaffected by the reset, but...

> With this patch series, display shows constant color by running modetest =
to
> change fb pixel format.  However, doing page flip with "-v" option seems =
fine.
> Also, seems the issue doesn't reproduce without fbdev emulation.
>=20
... this seems to contradict this. I'll dig some more into this. I
don't even know if this reset is required at all at this point, as it
seems this is a leftover from the mxsfb code. I can't find any
mandatory reset in the i.MX8MP reference manual.

Regards,
Lucas

> Regards,
> Liu Ying
>=20
> > +
> > +	drm_atomic_helper_fake_vblank(old_state);
> > +	drm_atomic_helper_commit_hw_done(old_state);
> > +	drm_atomic_helper_wait_for_vblanks(drm, old_state);
> > +
> > +	pm_runtime_put(drm->dev);
> > +
> > +	drm_atomic_helper_cleanup_planes(drm, old_state);
> > +}
> > +
> >  static const struct drm_mode_config_helper_funcs
> > lcdif_mode_config_helpers =3D {
> > -	.atomic_commit_tail =3D drm_atomic_helper_commit_tail_rpm,
> > +	.atomic_commit_tail =3D lcdif_commit_tail,
> >  };
> >=20
> >  static const struct drm_encoder_funcs lcdif_encoder_funcs =3D {
> > diff --git a/drivers/gpu/drm/mxsfb/lcdif_kms.c
> > b/drivers/gpu/drm/mxsfb/lcdif_kms.c
> > index e277592e5fa5..ccee5e28f236 100644
> > --- a/drivers/gpu/drm/mxsfb/lcdif_kms.c
> > +++ b/drivers/gpu/drm/mxsfb/lcdif_kms.c
> > @@ -540,7 +540,11 @@ static void lcdif_crtc_atomic_enable(struct drm_cr=
tc
> > *crtc,
> >=20
> >  	clk_set_rate(lcdif->clk, m->crtc_clock * 1000);
> >=20
> > -	pm_runtime_get_sync(drm->dev);
> > +	/*
> > +	 * Update the RPM usage count, actual resume already happened in
> > +	 * lcdif_commit_tail wrapping all the atomic update.
> > +	 */
> > +	pm_runtime_get_noresume(drm->dev);
> >=20
> >  	lcdif_crtc_mode_set_nofb(new_cstate, new_pstate);
> >=20
> > @@ -576,7 +580,11 @@ static void lcdif_crtc_atomic_disable(struct drm_c=
rtc
> > *crtc,
> >  	}
> >  	spin_unlock_irq(&drm->event_lock);
> >=20
> > -	pm_runtime_put_sync(drm->dev);
> > +	/*
> > +	 * Update the RPM usage count, actual suspend happens in
> > +	 * lcdif_commit_tail wrapping all the atomic update.
> > +	 */
> > +	pm_runtime_put(drm->dev);
> >  }
> >=20
> >  static void lcdif_crtc_atomic_destroy_state(struct drm_crtc *crtc,
> > --
> > 2.39.2
>=20

