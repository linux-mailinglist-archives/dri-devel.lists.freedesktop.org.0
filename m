Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 25E9B697822
	for <lists+dri-devel@lfdr.de>; Wed, 15 Feb 2023 09:27:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96FA110EA5A;
	Wed, 15 Feb 2023 08:27:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D21910EA5A
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Feb 2023 08:27:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1676449665; x=1707985665;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=IjItQ+4cGVFWrNZREhFAzBD3JdCMQ/atrZbvQIr+dp4=;
 b=qxmyMutyKa4omcfWN34RDc3s7eUV/u+xuiIXSNCeVU/D8Y3M3wrPH9lR
 RuCe9ZkYwQkBoj83VZO9NT0MaGQiX5xmnpcxgV6DFihoHgEZM0kFTzfUc
 UM6I9yIQJh2Sp/iKeeOfr46kdxnMIJf7F98bEnJovsQk/oO9C09tN/hx8
 5gYK6fORIHvrn+R/ENZN7qGn5Uh2678/iL6KLCMWdrQO3/T/JtDJl5DnE
 6c6YXLNbx8ZXGVDnbou2MM1cRHN87N7fcX3xcSpEmI/AS6h9rmteLBtfN
 UqUlgJ9P3j8mqTWiteAZAaSX/Hd5exq7azV1WnniiNCK+QTuC9uRxpCHA w==;
X-IronPort-AV: E=Sophos;i="5.97,299,1669071600"; d="scan'208";a="29092311"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
 by mx1-pgp.tq-group.com with ESMTP; 15 Feb 2023 09:27:42 +0100
Received: from mx1.tq-group.com ([192.168.6.7])
 by tq-pgp-pr1.tq-net.de (PGP Universal service);
 Wed, 15 Feb 2023 09:27:42 +0100
X-PGP-Universal: processed;
 by tq-pgp-pr1.tq-net.de on Wed, 15 Feb 2023 09:27:42 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1676449662; x=1707985662;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=IjItQ+4cGVFWrNZREhFAzBD3JdCMQ/atrZbvQIr+dp4=;
 b=hs650RM75AtopN985Gb9LdNcVx46cS55abRYopN22UgcMF/Ji0mWqHft
 CiSDzaxP4ci+CQ6Om9Th3gbVIY8ZE/ojeWA1y5xUodu+Se5DM5fnaP+DV
 TKkz2QnkqiYPyqXnPVQakyQ4jLg3cYO3PjtjFDMxUYhgBG21d83je3wqC
 outjaqf6GRTDjPQEFt7T4UU8GHYMg2eGdbf9ksWmA0qMh02zTD6uA+JwJ
 q7UiPN8xI+Po480nqy8/uZc6S+Ocq4staFXJzeXu0CDeSP35Dkt/eVajl
 OdanJRncjemNhvf8GGQ2FJXc8TP8Re98c+C6Zfsb0odjTawwJbNcmj2Jf Q==;
X-IronPort-AV: E=Sophos;i="5.97,299,1669071600"; d="scan'208";a="29092310"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
 by mx1.tq-group.com with ESMTP; 15 Feb 2023 09:27:42 +0100
Received: from steina-w.localnet (unknown [10.123.53.21])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 24089280056;
 Wed, 15 Feb 2023 09:27:42 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Liu Ying <victor.liu@nxp.com>
Subject: Re: [PATCH v3 3/6] drm: lcdif: Determine bus format and flags in
 ->atomic_check()
Date: Wed, 15 Feb 2023 09:27:42 +0100
Message-ID: <838232421.0ifERbkFSE@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <444ef7e5cf1e6b046a2a7a7d1c152eb0bc3b739c.camel@nxp.com>
References: <20230213085612.1026538-1-victor.liu@nxp.com>
 <1755644.VLH7GnMWUR@steina-w>
 <444ef7e5cf1e6b046a2a7a7d1c152eb0bc3b739c.camel@nxp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
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
Cc: marex@denx.de, shawnguo@kernel.org, s.hauer@pengutronix.de,
 krzysztof.kozlowski@linaro.org, robh+dt@kernel.org, linux-imx@nxp.com,
 krzysztof.kozlowski+dt@linaro.org, kernel@pengutronix.de,
 LW@karo-electronics.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Liu,

Am Mittwoch, 15. Februar 2023, 04:44:15 CET schrieb Liu Ying:
> On Tue, 2023-02-14 at 15:12 +0100, Alexander Stein wrote:
> > Hi Liu,
>=20
> Hi Alexander,
>=20
> > thanks for the update.
>=20
> Thanks for your review.
>=20
> > Am Montag, 13. Februar 2023, 09:56:09 CET schrieb Liu Ying:
> > > Instead of determining LCDIF output bus format and bus flags in
> > > ->atomic_enable(), do that in ->atomic_check().  This is a
> > > preparation for the upcoming patch to check consistent bus format
> > > and bus flags across all first downstream bridges in
> > > ->atomic_check().
> > > New lcdif_crtc_state structure is introduced to cache bus format
> > > and bus flags states in ->atomic_check() so that they can be read
> > > in ->atomic_enable().
> > >=20
> > > Signed-off-by: Liu Ying <victor.liu@nxp.com>
> > > ---
> > > v2->v3:
> > > * No change.
> > >=20
> > > v1->v2:
> > > * Split from patch 2/2 in v1. (Marek, Alexander)
> > > * Add comment on the 'base' member of lcdif_crtc_state structure to
> > >=20
> > >   note it should always be the first member. (Lothar)
> > > =20
> > >  drivers/gpu/drm/mxsfb/lcdif_kms.c | 138 ++++++++++++++++++++++--
> > >=20
> > > ------
> > >=20
> > >  1 file changed, 100 insertions(+), 38 deletions(-)
> > >=20
> > > diff --git a/drivers/gpu/drm/mxsfb/lcdif_kms.c
> > > b/drivers/gpu/drm/mxsfb/lcdif_kms.c index
> > > e54200a9fcb9..294cecdf5439 100644
> > > --- a/drivers/gpu/drm/mxsfb/lcdif_kms.c
> > > +++ b/drivers/gpu/drm/mxsfb/lcdif_kms.c
> > > @@ -30,6 +30,18 @@
> > >=20
> > >  #include "lcdif_drv.h"
> > >  #include "lcdif_regs.h"
> > >=20
> > > +struct lcdif_crtc_state {
> > > +	struct drm_crtc_state	base;	/* always be the first
> >=20
> > member */
> >=20
> > Is it strictly necessary that base is the first member?
> > to_lcdif_crtc_state()
> > should be able to handle any position within the struct. I mean it's
> > sensible
> > to put it in first place. But the comment somehow bugs me.
>=20
> The comment was added in v2 to make sure to_lcdif_crtc_state() work ok
> when a NULL pointer is handed over to it.  The NULL pointer worries
> Lothar a bit as we can see Lothar's comment for v1.

Nice, this makes totally sense. I was just curious about the reasoning.

>=20
> > > +	u32			bus_format;
> > > +	u32			bus_flags;
> > > +};
> > > +
> > > +static inline struct lcdif_crtc_state *
> > > +to_lcdif_crtc_state(struct drm_crtc_state *s)
> > > +{
> > > +	return container_of(s, struct lcdif_crtc_state, base);
> > > +}
> > > +
> > >=20
> > >  /*
> > >=20
> > > -----------------------------------------------------------------
> > > ----------
> > > -- * CRTC
> > >=20
> > >   */
> > >=20
> > > @@ -385,48 +397,72 @@ static void lcdif_reset_block(struct
> > > lcdif_drm_private
> > > *lcdif) readl(lcdif->base + LCDC_V8_CTRL);
> > >=20
> > >  }
> > >=20
> > > -static void lcdif_crtc_mode_set_nofb(struct lcdif_drm_private
> > > *lcdif,
> > > -				     struct drm_plane_state
> >=20
> > *plane_state,
> >=20
> > > -				     struct drm_bridge_state
> >=20
> > *bridge_state,
> >=20
> > > -				     const u32 bus_format)
> > > +static void lcdif_crtc_mode_set_nofb(struct drm_crtc_state
> > > *crtc_state,
> > > +				     struct drm_plane_state
> >=20
> > *plane_state)
> >=20
> > >  {
> > >=20
> > > -	struct drm_device *drm =3D lcdif->crtc.dev;
> > > -	struct drm_display_mode *m =3D &lcdif->crtc.state->adjusted_mode;
> > > -	u32 bus_flags =3D 0;
> > > -
> > > -	if (lcdif->bridge->timings)
> > > -		bus_flags =3D lcdif->bridge->timings->input_bus_flags;
> > > -	else if (bridge_state)
> > > -		bus_flags =3D bridge_state->input_bus_cfg.flags;
> > > +	struct lcdif_crtc_state *lcdif_crtc_state =3D
> > > to_lcdif_crtc_state(crtc_state); +	struct drm_device *drm =3D
> > > crtc_state->crtc->dev;
> > > +	struct lcdif_drm_private *lcdif =3D to_lcdif_drm_private(drm);
> > > +	struct drm_display_mode *m =3D &crtc_state->adjusted_mode;
> > >=20
> > >  	DRM_DEV_DEBUG_DRIVER(drm->dev, "Pixel clock: %dkHz (actual:
> > > %dkHz)
> >=20
> > \n",
> >=20
> > >  			     m->crtc_clock,
> > >  			     (int)(clk_get_rate(lcdif->clk) / 1000));
> > >  =09
> > >  	DRM_DEV_DEBUG_DRIVER(drm->dev, "Bridge bus_flags: 0x%08X\n",
> > >=20
> > > -			     bus_flags);
> > > +			     lcdif_crtc_state->bus_flags);
> > >=20
> > >  	DRM_DEV_DEBUG_DRIVER(drm->dev, "Mode flags: 0x%08X\n", m-
> > > >
> > > >flags);
> > > >
> > >  	/* Mandatory eLCDIF reset as per the Reference Manual */
> > >  	lcdif_reset_block(lcdif);
> > >=20
> > > -	lcdif_set_formats(lcdif, plane_state, bus_format);
> > > +	lcdif_set_formats(lcdif, plane_state, lcdif_crtc_state-
> > >=20
> > > >bus_format);
> > >=20
> > > -	lcdif_set_mode(lcdif, bus_flags);
> > > +	lcdif_set_mode(lcdif, lcdif_crtc_state->bus_flags);
> > >=20
> > >  }
> > > =20
> > >  static int lcdif_crtc_atomic_check(struct drm_crtc *crtc,
> > > =20
> > >  				   struct drm_atomic_state *state)
> > > =20
> > >  {
> > >=20
> > > +	struct drm_device *drm =3D crtc->dev;
> > > +	struct lcdif_drm_private *lcdif =3D to_lcdif_drm_private(drm);
> > >=20
> > >  	struct drm_crtc_state *crtc_state =3D
> >=20
> > drm_atomic_get_new_crtc_state(state,
> >=20
> > 	  crtc);
> > >=20
> > > +	struct lcdif_crtc_state *lcdif_crtc_state =3D
> > > to_lcdif_crtc_state(crtc_state); bool has_primary =3D crtc_state-
> > >=20
> > > >plane_mask
> > >=20
> > > &
> > >=20
> > >  			   drm_plane_mask(crtc->primary);
> > >=20
> > > +	struct drm_bridge_state *bridge_state;
> > > +	struct drm_bridge *bridge =3D lcdif->bridge;
> > > +	int ret;
> > >=20
> > >  	/* The primary plane has to be enabled when the CRTC is active.
> > >=20
> > > */
> > >=20
> > >  	if (crtc_state->active && !has_primary)
> > >  =09
> > >  		return -EINVAL;
> > >=20
> > > -	return drm_atomic_add_affected_planes(state, crtc);
> > > +	ret =3D drm_atomic_add_affected_planes(state, crtc);
> > > +	if (ret)
> > > +		return ret;
> > > +
> > > +	bridge_state =3D drm_atomic_get_new_bridge_state(state, bridge);
> > > +	if (!bridge_state)
> > > +		lcdif_crtc_state->bus_format =3D MEDIA_BUS_FMT_FIXED;
> > > +	else
> > > +		lcdif_crtc_state->bus_format =3D bridge_state-
> > > input_bus_cfg.format;
> > > +
> > > +	if (lcdif_crtc_state->bus_format =3D=3D MEDIA_BUS_FMT_FIXED) {
> > > +		dev_warn_once(drm->dev,
> > > +			      "Bridge does not provide bus format,
> >=20
> > assuming
> >=20
> > > MEDIA_BUS_FMT_RGB888_1X24.\n" +			      "Please
> > > fix
> >=20
> > bridge driver by
> >=20
> > > handling atomic_get_input_bus_fmts.\n"); +		lcdif_crtc_stat
> > > e-
> > > bus_format =3D
> > > MEDIA_BUS_FMT_RGB888_1X24;
> > > +	}
> > > +
> > > +	if (bridge->timings)
> > > +		lcdif_crtc_state->bus_flags =3D bridge->timings-
> > > input_bus_flags;
> > > +	else if (bridge_state)
> > > +		lcdif_crtc_state->bus_flags =3D bridge_state-
> > > input_bus_cfg.flags;
> > > +	else
> > > +		lcdif_crtc_state->bus_flags =3D 0;
> > > +
> > > +	return 0;
> > >=20
> > >  }
> > > =20
> > >  static void lcdif_crtc_atomic_flush(struct drm_crtc *crtc,
> > >=20
> > > @@ -458,35 +494,21 @@ static void lcdif_crtc_atomic_enable(struct
> > > drm_crtc
> > > *crtc, struct drm_atomic_state *state)
> > >=20
> > >  {
> > > =20
> > >  	struct lcdif_drm_private *lcdif =3D to_lcdif_drm_private(crtc-
> > > >
> > > >dev);
> > >=20
> > > -	struct drm_plane_state *new_pstate =3D
> >=20
> > drm_atomic_get_new_plane_state(state,
> >=20
> > > -
> > >=20
> > 	    crtc->primary);
> > >=20
> > > +	struct drm_crtc_state *new_crtc_state =3D
> > > drm_atomic_get_new_crtc_state(state, crtc); +	struct
> > > drm_plane_state
> > > *new_plane_state =3D drm_atomic_get_new_plane_state(state, +
> > >=20
> > >=20
> > >=20
> > > crtc->primary);
> >=20
> > While the rename to 'new_plane_state' makes sense, this is an
> > unrelated
> > change.
>=20
> I'll use 'new_pstate' and 'new_cstate' in next version.

You can do a rename, but I would rather put that into a dedicated commit. U=
p=20
to you.

> > >  	struct drm_display_mode *m =3D &lcdif->crtc.state->adjusted_mode;
> > >=20
> > > -	struct drm_bridge_state *bridge_state =3D NULL;
> > >=20
> > >  	struct drm_device *drm =3D lcdif->drm;
> > >=20
> > > -	u32 bus_format;
> > >=20
> > >  	dma_addr_t paddr;
> > >=20
> > > -	bridge_state =3D drm_atomic_get_new_bridge_state(state, lcdif-
> > > bridge);
> > > -	if (!bridge_state)
> > > -		bus_format =3D MEDIA_BUS_FMT_FIXED;
> > > -	else
> > > -		bus_format =3D bridge_state->input_bus_cfg.format;
> > > -
> > > -	if (bus_format =3D=3D MEDIA_BUS_FMT_FIXED) {
> > > -		dev_warn_once(drm->dev,
> > > -			      "Bridge does not provide bus format,
> >=20
> > assuming
> >=20
> > > MEDIA_BUS_FMT_RGB888_1X24.\n" -			      "Please
> > > fix
> >=20
> > bridge driver by
> >=20
> > > handling atomic_get_input_bus_fmts.\n"); -		bus_format =3D
> > > MEDIA_BUS_FMT_RGB888_1X24;
> > > -	}
> > > -
> > >=20
> > >  	clk_set_rate(lcdif->clk, m->crtc_clock * 1000);
> > >  =09
> > >  	pm_runtime_get_sync(drm->dev);
> > >=20
> > > -	lcdif_crtc_mode_set_nofb(lcdif, new_pstate, bridge_state,
> >=20
> > bus_format);
> >=20
> > > +	lcdif_crtc_mode_set_nofb(new_crtc_state, new_plane_state);
> > >=20
> > >  	/* Write cur_buf as well to avoid an initial corrupt frame */
> > >=20
> > > -	paddr =3D drm_fb_dma_get_gem_addr(new_pstate->fb, new_pstate, 0);
> > > +	paddr =3D drm_fb_dma_get_gem_addr(new_plane_state->fb,
> >=20
> > new_plane_state, 0);
> >=20
> > >  	if (paddr) {
> > >  =09
> > >  		writel(lower_32_bits(paddr),
> > >  	=09
> > >  		       lcdif->base + LCDC_V8_CTRLDESCL_LOW0_4);
> > >=20
> > > @@ -520,6 +542,46 @@ static void lcdif_crtc_atomic_disable(struct
> > > drm_crtc
> > > *crtc, pm_runtime_put_sync(drm->dev);
> > >=20
> > >  }
> > >=20
> > > +static void lcdif_crtc_reset(struct drm_crtc *crtc)
> > > +{
> > > +	struct lcdif_crtc_state *state;
> > > +
> > > +	if (crtc->state)
> > > +		__drm_atomic_helper_crtc_destroy_state(crtc->state);
> > > +
> > > +	kfree(to_lcdif_crtc_state(crtc->state));
> >=20
> > Shouldn't this be just
> > if (crtc->state)
> >=20
> > 	crtc->funcs->atomic_destroy_state(crtc, crtc->state);
> >=20
> > similar to what drm_atomic_helper_crtc_reset is doing? This will
> > eventually
> > call lcdif_crtc_atomic_destroy_state().
>=20
> I think you are right.  But, instead of calling crtc->funcs-
>=20
> >atomic_destroy_state(), I would call lcdif_crtc_atomic_destroy_state()
>=20
> directly, which looks simpler to me.

Agreed, both ways have their advantages. I tried to match you changes to th=
e=20
previously used helper functions.

>=20
> > > +	crtc->state =3D NULL;
> > > +
> > > +	state =3D kzalloc(sizeof(*state), GFP_KERNEL);
> > > +	if (state)
> > > +		__drm_atomic_helper_crtc_reset(crtc, &state->base);
> >=20
> > Is there a specific reason to not call this helper when
> > 'state=3D=3DNULL'?
>=20
> Yes, when 'state=3D=3DNULL', &state->base would de-reference a NULL
> pointer.

Oh, that's for sure. It was late :)

>=20
> > drm_atomic_helper_crtc_reset() does call this even when passing NULL
> > for
> > crtc_state.
> >=20
> > > +}
> > > +
> > > +static struct drm_crtc_state *
> > > +lcdif_crtc_atomic_duplicate_state(struct drm_crtc *crtc)
> > > +{
> > > +	struct lcdif_crtc_state *old =3D to_lcdif_crtc_state(crtc-
> > >=20
> > > >state);
> > >=20
> > > +	struct lcdif_crtc_state *new;
> > > +
> >=20
> > drm_atomic_helper_crtc_duplicate_state() has a check for
> > if (WARN_ON(!crtc->state))
> >=20
> > 	return NULL;
> >=20
> > Maybe it should be added here as well. But then the call to
> > to_lcdif_crtc_state() has to be moved down.
>=20
> I'll add the check in next version.  But, to_lcdif_crtc_state() doesn't
> have to be moved down even if crtc->state is NULL, because 'base' is
> the first member of struct lcdif_crtc_state and it's safe.

Sounds reasonable. Thanks

> Regards,
> Liu Ying

Best regards,
Alexander

=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


