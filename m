Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AEA3696633
	for <lists+dri-devel@lfdr.de>; Tue, 14 Feb 2023 15:13:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74DBB10E8E4;
	Tue, 14 Feb 2023 14:13:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A12610E8E4
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Feb 2023 14:12:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1676383979; x=1707919979;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Mri8wotyu4TxK5L7MM4u6zbY5O40yObsw3E1ScBxR/8=;
 b=fdiVQsEOzjV3PjZ3OgT8Ucc4C1MLN/6EsZVDq/DYUiawyN8Nx6VOvSYY
 KWKyBh3dHvmYI9LpqWDHGRcQDM7hD4/hLiE/gz4B7hwaPoVNQMqAT7kaX
 Rutr5tzoo5+dISVRKyRCF+BIXH1KNnkxtGvSoYEonJD2a0t/X6BQ3kQlB
 KQT9P1CYSYUHin1Jsb1800PgxYcC7h5devHg0Hzty20fcH/yi2UJ4gKbZ
 HQbP/loANCBicgW3JzH7gPFgGbyuDL5ZHuwMaUUt034sNlUz85FcIkHjN
 phamX97K/1tL+JC+ZMIs8VmaDSNboTmwEBRvlPX6HeNGR5CKvtqoC5Hj2 g==;
X-IronPort-AV: E=Sophos;i="5.97,296,1669071600"; d="scan'208";a="29076468"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
 by mx1-pgp.tq-group.com with ESMTP; 14 Feb 2023 15:12:57 +0100
Received: from mx1.tq-group.com ([192.168.6.7])
 by tq-pgp-pr1.tq-net.de (PGP Universal service);
 Tue, 14 Feb 2023 15:12:57 +0100
X-PGP-Universal: processed;
 by tq-pgp-pr1.tq-net.de on Tue, 14 Feb 2023 15:12:57 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1676383977; x=1707919977;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Mri8wotyu4TxK5L7MM4u6zbY5O40yObsw3E1ScBxR/8=;
 b=a2Lj26EjJ7wmXSpY/hqYkh+5cK/Sz1tADb1dFVS+lEcs4Dne+4z/ey6T
 gHoXPL79UTG6rSqw+JeUVvAX3qVm0bXmIdoJOs0R3wyfvszO91h3BwlO7
 9m4VBkLazSRXStfKyb0VSs6XPTUei5eGb3obNOgZTdrlvaU6eImgSr9DW
 YisQiz3kVRyVWJ/QxZmFSPv5pL+3gyViDnpMmjV84OkCr+rc9Ts5QoBA2
 U87+cwHyl2D360ULb7qDvZWqSLaPGmPMIZ+u332p29AmcFI8ceTdeAOG+
 XgXGQoLUOGtzh7rmlA7BbpUa4fglHefZOJhXXKfvyTcxaISK8X6NPnwD/ Q==;
X-IronPort-AV: E=Sophos;i="5.97,296,1669071600"; d="scan'208";a="29076467"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
 by mx1.tq-group.com with ESMTP; 14 Feb 2023 15:12:57 +0100
Received: from steina-w.localnet (unknown [10.123.53.21])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 34F01280056;
 Tue, 14 Feb 2023 15:12:57 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Liu Ying <victor.liu@nxp.com>
Subject: Re: [PATCH v3 3/6] drm: lcdif: Determine bus format and flags in
 ->atomic_check()
Date: Tue, 14 Feb 2023 15:12:55 +0100
Message-ID: <1755644.VLH7GnMWUR@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20230213085612.1026538-4-victor.liu@nxp.com>
References: <20230213085612.1026538-1-victor.liu@nxp.com>
 <20230213085612.1026538-4-victor.liu@nxp.com>
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

thanks for the update.

Am Montag, 13. Februar 2023, 09:56:09 CET schrieb Liu Ying:
> Instead of determining LCDIF output bus format and bus flags in
> ->atomic_enable(), do that in ->atomic_check().  This is a
> preparation for the upcoming patch to check consistent bus format
> and bus flags across all first downstream bridges in ->atomic_check().
> New lcdif_crtc_state structure is introduced to cache bus format
> and bus flags states in ->atomic_check() so that they can be read
> in ->atomic_enable().
>=20
> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> ---
> v2->v3:
> * No change.
>=20
> v1->v2:
> * Split from patch 2/2 in v1. (Marek, Alexander)
> * Add comment on the 'base' member of lcdif_crtc_state structure to
>   note it should always be the first member. (Lothar)
>=20
>  drivers/gpu/drm/mxsfb/lcdif_kms.c | 138 ++++++++++++++++++++++--------
>  1 file changed, 100 insertions(+), 38 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/mxsfb/lcdif_kms.c
> b/drivers/gpu/drm/mxsfb/lcdif_kms.c index e54200a9fcb9..294cecdf5439 1006=
44
> --- a/drivers/gpu/drm/mxsfb/lcdif_kms.c
> +++ b/drivers/gpu/drm/mxsfb/lcdif_kms.c
> @@ -30,6 +30,18 @@
>  #include "lcdif_drv.h"
>  #include "lcdif_regs.h"
>=20
> +struct lcdif_crtc_state {
> +	struct drm_crtc_state	base;	/* always be the first=20
member */

Is it strictly necessary that base is the first member? to_lcdif_crtc_state=
()=20
should be able to handle any position within the struct. I mean it's sensib=
le=20
to put it in first place. But the comment somehow bugs me.

> +	u32			bus_format;
> +	u32			bus_flags;
> +};
> +
> +static inline struct lcdif_crtc_state *
> +to_lcdif_crtc_state(struct drm_crtc_state *s)
> +{
> +	return container_of(s, struct lcdif_crtc_state, base);
> +}
> +
>  /*
> -------------------------------------------------------------------------=
=2D-
> -- * CRTC
>   */
> @@ -385,48 +397,72 @@ static void lcdif_reset_block(struct lcdif_drm_priv=
ate
> *lcdif) readl(lcdif->base + LCDC_V8_CTRL);
>  }
>=20
> -static void lcdif_crtc_mode_set_nofb(struct lcdif_drm_private *lcdif,
> -				     struct drm_plane_state=20
*plane_state,
> -				     struct drm_bridge_state=20
*bridge_state,
> -				     const u32 bus_format)
> +static void lcdif_crtc_mode_set_nofb(struct drm_crtc_state *crtc_state,
> +				     struct drm_plane_state=20
*plane_state)
>  {
> -	struct drm_device *drm =3D lcdif->crtc.dev;
> -	struct drm_display_mode *m =3D &lcdif->crtc.state->adjusted_mode;
> -	u32 bus_flags =3D 0;
> -
> -	if (lcdif->bridge->timings)
> -		bus_flags =3D lcdif->bridge->timings->input_bus_flags;
> -	else if (bridge_state)
> -		bus_flags =3D bridge_state->input_bus_cfg.flags;
> +	struct lcdif_crtc_state *lcdif_crtc_state =3D
> to_lcdif_crtc_state(crtc_state); +	struct drm_device *drm =3D
> crtc_state->crtc->dev;
> +	struct lcdif_drm_private *lcdif =3D to_lcdif_drm_private(drm);
> +	struct drm_display_mode *m =3D &crtc_state->adjusted_mode;
>=20
>  	DRM_DEV_DEBUG_DRIVER(drm->dev, "Pixel clock: %dkHz (actual: %dkHz)
\n",
>  			     m->crtc_clock,
>  			     (int)(clk_get_rate(lcdif->clk) / 1000));
>  	DRM_DEV_DEBUG_DRIVER(drm->dev, "Bridge bus_flags: 0x%08X\n",
> -			     bus_flags);
> +			     lcdif_crtc_state->bus_flags);
>  	DRM_DEV_DEBUG_DRIVER(drm->dev, "Mode flags: 0x%08X\n", m->flags);
>=20
>  	/* Mandatory eLCDIF reset as per the Reference Manual */
>  	lcdif_reset_block(lcdif);
>=20
> -	lcdif_set_formats(lcdif, plane_state, bus_format);
> +	lcdif_set_formats(lcdif, plane_state, lcdif_crtc_state->bus_format);
>=20
> -	lcdif_set_mode(lcdif, bus_flags);
> +	lcdif_set_mode(lcdif, lcdif_crtc_state->bus_flags);
>  }
>=20
>  static int lcdif_crtc_atomic_check(struct drm_crtc *crtc,
>  				   struct drm_atomic_state *state)
>  {
> +	struct drm_device *drm =3D crtc->dev;
> +	struct lcdif_drm_private *lcdif =3D to_lcdif_drm_private(drm);
>  	struct drm_crtc_state *crtc_state =3D=20
drm_atomic_get_new_crtc_state(state,
>  							=09
	  crtc);
> +	struct lcdif_crtc_state *lcdif_crtc_state =3D
> to_lcdif_crtc_state(crtc_state); bool has_primary =3D crtc_state->plane_m=
ask
> &
>  			   drm_plane_mask(crtc->primary);
> +	struct drm_bridge_state *bridge_state;
> +	struct drm_bridge *bridge =3D lcdif->bridge;
> +	int ret;
>=20
>  	/* The primary plane has to be enabled when the CRTC is active. */
>  	if (crtc_state->active && !has_primary)
>  		return -EINVAL;
>=20
> -	return drm_atomic_add_affected_planes(state, crtc);
> +	ret =3D drm_atomic_add_affected_planes(state, crtc);
> +	if (ret)
> +		return ret;
> +
> +	bridge_state =3D drm_atomic_get_new_bridge_state(state, bridge);
> +	if (!bridge_state)
> +		lcdif_crtc_state->bus_format =3D MEDIA_BUS_FMT_FIXED;
> +	else
> +		lcdif_crtc_state->bus_format =3D bridge_state-
>input_bus_cfg.format;
> +
> +	if (lcdif_crtc_state->bus_format =3D=3D MEDIA_BUS_FMT_FIXED) {
> +		dev_warn_once(drm->dev,
> +			      "Bridge does not provide bus format,=20
assuming
> MEDIA_BUS_FMT_RGB888_1X24.\n" +			      "Please fix=20
bridge driver by
> handling atomic_get_input_bus_fmts.\n"); +		lcdif_crtc_state-
>bus_format =3D
> MEDIA_BUS_FMT_RGB888_1X24;
> +	}
> +
> +	if (bridge->timings)
> +		lcdif_crtc_state->bus_flags =3D bridge->timings-
>input_bus_flags;
> +	else if (bridge_state)
> +		lcdif_crtc_state->bus_flags =3D bridge_state-
>input_bus_cfg.flags;
> +	else
> +		lcdif_crtc_state->bus_flags =3D 0;
> +
> +	return 0;
>  }
>=20
>  static void lcdif_crtc_atomic_flush(struct drm_crtc *crtc,
> @@ -458,35 +494,21 @@ static void lcdif_crtc_atomic_enable(struct drm_crtc
> *crtc, struct drm_atomic_state *state)
>  {
>  	struct lcdif_drm_private *lcdif =3D to_lcdif_drm_private(crtc->dev);
> -	struct drm_plane_state *new_pstate =3D=20
drm_atomic_get_new_plane_state(state,
> -							=09
	    crtc->primary);
> +	struct drm_crtc_state *new_crtc_state =3D
> drm_atomic_get_new_crtc_state(state, crtc); +	struct drm_plane_state
> *new_plane_state =3D drm_atomic_get_new_plane_state(state, +		=09
						=09
> crtc->primary);

While the rename to 'new_plane_state' makes sense, this is an unrelated=20
change.

>  	struct drm_display_mode *m =3D &lcdif->crtc.state->adjusted_mode;
> -	struct drm_bridge_state *bridge_state =3D NULL;
>  	struct drm_device *drm =3D lcdif->drm;
> -	u32 bus_format;
>  	dma_addr_t paddr;
>=20
> -	bridge_state =3D drm_atomic_get_new_bridge_state(state, lcdif-
>bridge);
> -	if (!bridge_state)
> -		bus_format =3D MEDIA_BUS_FMT_FIXED;
> -	else
> -		bus_format =3D bridge_state->input_bus_cfg.format;
> -
> -	if (bus_format =3D=3D MEDIA_BUS_FMT_FIXED) {
> -		dev_warn_once(drm->dev,
> -			      "Bridge does not provide bus format,=20
assuming
> MEDIA_BUS_FMT_RGB888_1X24.\n" -			      "Please fix=20
bridge driver by
> handling atomic_get_input_bus_fmts.\n"); -		bus_format =3D
> MEDIA_BUS_FMT_RGB888_1X24;
> -	}
> -
>  	clk_set_rate(lcdif->clk, m->crtc_clock * 1000);
>=20
>  	pm_runtime_get_sync(drm->dev);
>=20
> -	lcdif_crtc_mode_set_nofb(lcdif, new_pstate, bridge_state,=20
bus_format);
> +	lcdif_crtc_mode_set_nofb(new_crtc_state, new_plane_state);
>=20
>  	/* Write cur_buf as well to avoid an initial corrupt frame */
> -	paddr =3D drm_fb_dma_get_gem_addr(new_pstate->fb, new_pstate, 0);
> +	paddr =3D drm_fb_dma_get_gem_addr(new_plane_state->fb,=20
new_plane_state, 0);
>  	if (paddr) {
>  		writel(lower_32_bits(paddr),
>  		       lcdif->base + LCDC_V8_CTRLDESCL_LOW0_4);
> @@ -520,6 +542,46 @@ static void lcdif_crtc_atomic_disable(struct drm_crtc
> *crtc, pm_runtime_put_sync(drm->dev);
>  }
>=20
> +static void lcdif_crtc_reset(struct drm_crtc *crtc)
> +{
> +	struct lcdif_crtc_state *state;
> +
> +	if (crtc->state)
> +		__drm_atomic_helper_crtc_destroy_state(crtc->state);
> +
> +	kfree(to_lcdif_crtc_state(crtc->state));

Shouldn't this be just
if (crtc->state)
	crtc->funcs->atomic_destroy_state(crtc, crtc->state);

similar to what drm_atomic_helper_crtc_reset is doing? This will eventually=
=20
call lcdif_crtc_atomic_destroy_state().

> +	crtc->state =3D NULL;
> +
> +	state =3D kzalloc(sizeof(*state), GFP_KERNEL);
> +	if (state)
> +		__drm_atomic_helper_crtc_reset(crtc, &state->base);

Is there a specific reason to not call this helper when 'state=3D=3DNULL'?=
=20
drm_atomic_helper_crtc_reset() does call this even when passing NULL for=20
crtc_state.

> +}
> +
> +static struct drm_crtc_state *
> +lcdif_crtc_atomic_duplicate_state(struct drm_crtc *crtc)
> +{
> +	struct lcdif_crtc_state *old =3D to_lcdif_crtc_state(crtc->state);
> +	struct lcdif_crtc_state *new;
> +

drm_atomic_helper_crtc_duplicate_state() has a check for
if (WARN_ON(!crtc->state))
	return NULL;

Maybe it should be added here as well. But then the call to=20
to_lcdif_crtc_state() has to be moved down.

Best regards,
Alexander

> +	new =3D kzalloc(sizeof(*new), GFP_KERNEL);
> +	if (!new)
> +		return NULL;
> +
> +	__drm_atomic_helper_crtc_duplicate_state(crtc, &new->base);
> +
> +	new->bus_format =3D old->bus_format;
> +	new->bus_flags =3D old->bus_flags;
> +
> +	return &new->base;
> +}
> +
> +static void lcdif_crtc_atomic_destroy_state(struct drm_crtc *crtc,
> +					    struct drm_crtc_state=20
*state)
> +{
> +	__drm_atomic_helper_crtc_destroy_state(state);
> +	kfree(to_lcdif_crtc_state(state));
> +}
> +
>  static int lcdif_crtc_enable_vblank(struct drm_crtc *crtc)
>  {
>  	struct lcdif_drm_private *lcdif =3D to_lcdif_drm_private(crtc->dev);
> @@ -548,12 +610,12 @@ static const struct drm_crtc_helper_funcs
> lcdif_crtc_helper_funcs =3D { };
>=20
>  static const struct drm_crtc_funcs lcdif_crtc_funcs =3D {
> -	.reset =3D drm_atomic_helper_crtc_reset,
> +	.reset =3D lcdif_crtc_reset,
>  	.destroy =3D drm_crtc_cleanup,
>  	.set_config =3D drm_atomic_helper_set_config,
>  	.page_flip =3D drm_atomic_helper_page_flip,
> -	.atomic_duplicate_state =3D drm_atomic_helper_crtc_duplicate_state,
> -	.atomic_destroy_state =3D drm_atomic_helper_crtc_destroy_state,
> +	.atomic_duplicate_state =3D lcdif_crtc_atomic_duplicate_state,
> +	.atomic_destroy_state =3D lcdif_crtc_atomic_destroy_state,
>  	.enable_vblank =3D lcdif_crtc_enable_vblank,
>  	.disable_vblank =3D lcdif_crtc_disable_vblank,
>  };


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


