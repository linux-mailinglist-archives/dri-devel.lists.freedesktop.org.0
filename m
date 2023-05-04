Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 790506F680B
	for <lists+dri-devel@lfdr.de>; Thu,  4 May 2023 11:12:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5054910E404;
	Thu,  4 May 2023 09:12:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C37F10E405
 for <dri-devel@lists.freedesktop.org>; Thu,  4 May 2023 09:12:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1683191543; x=1714727543;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=fr0qXQ3IKjF95MLSwjk9LSBsQKlFhihSG+c0KYPCwOQ=;
 b=Lmqv0bJ2ih/wHtCEyyNHYFRsRu7aZntvK+xlPvwg8zbhX0WlxJo3WzjS
 m25ZLOqq7SGRCrchNgh3k0wE4kzxFw/jbD/5IdRHysGu8uGG5Mq7XogLk
 XGb/hahYL0Fg6H1uu8whYifd/rmoXXswS2A69z4AIwADFQTWSHcLBOWW0
 LnVADVTWRjdIt9FyatanHazlnYhYVMJv+sImTz+2y99BKub0PL5MCEiiS
 RUVowjFbtytVd8KTG7zHNuDaC6veyHRL9MDOVoRVMy8xuSJ2SwSeSV1Is
 +xijnfMzyZZfMJaRz03lkD4MVPP0CIkC0mEXt3zDZqOLeLjSJ0ihf1xVD Q==;
X-IronPort-AV: E=Sophos;i="5.99,249,1677538800"; d="scan'208";a="30714870"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
 by mx1-pgp.tq-group.com with ESMTP; 04 May 2023 11:12:06 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
 by tq-pgp-pr1.tq-net.de (PGP Universal service);
 Thu, 04 May 2023 11:12:06 +0200
X-PGP-Universal: processed;
 by tq-pgp-pr1.tq-net.de on Thu, 04 May 2023 11:12:06 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1683191526; x=1714727526;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=fr0qXQ3IKjF95MLSwjk9LSBsQKlFhihSG+c0KYPCwOQ=;
 b=YR/zlnOWkCVKK9jLTJcyxRfiRquPg42bI/MJM6oalJDUjhaI3KMmilTQ
 GW0kDe8RzyEB3AER5bImH5nJpJbJRFvLLPpQXFuLw34ak59pg9dLNeUGU
 z1+Pnb8TBPd2870g9JL6+IHs14XlAxPTQzwz+xGRm7u2Fa2wAiQTIoLwP
 80CdfkhJU017RLogWPtVrKGJDc+8ETZoniRoV0yBjmu7j6vBuBHTph5W4
 NfK8poQBNrdUPuNA/DoeTWNkLVZv6pHR/xKRJF8jMGfEV05MSjLa3/SuZ
 ikh1ANpJNraMnNsi0jagtuvChJpbEQabm910OLSzMgUvXqJBLL3ZGHlEl g==;
X-IronPort-AV: E=Sophos;i="5.99,249,1677538800"; d="scan'208";a="30714859"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
 by mx1.tq-group.com with ESMTP; 04 May 2023 11:11:35 +0200
Received: from steina-w.localnet (unknown [10.123.53.21])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 7B5CA280056;
 Thu,  4 May 2023 11:11:15 +0200 (CEST)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>
Subject: Re: [PATCH v2 2/2] drm/bridge: ti-sn65dsi83: Fix enable/disable flow
 to meet spec
Date: Thu, 04 May 2023 11:11:14 +0200
Message-ID: <2225400.iZASKD2KPV@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20230503163313.2640898-3-frieder@fris.de>
References: <20230503163313.2640898-1-frieder@fris.de>
 <20230503163313.2640898-3-frieder@fris.de>
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
Cc: Marek Vasut <marex@denx.de>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jonas Karlman <jonas@kwiboo.se>, Frieder Schrempf <frieder@fris.de>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Uwe =?ISO-8859-1?Q?Kleine=2DK=F6nig?= <u.kleine-koenig@pengutronix.de>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am Mittwoch, 3. Mai 2023, 18:33:07 CEST schrieb Frieder Schrempf:
> From: Frieder Schrempf <frieder.schrempf@kontron.de>
>=20
> The datasheet describes the following initialization flow including
> minimum delay times between each step:
>=20
> 1. DSI data lanes need to be in LP-11 and the clock lane in HS mode
> 2. toggle EN signal
> 3. initialize registers
> 4. enable PLL
> 5. soft reset
> 6. enable DSI stream
> 7. check error status register
>=20
> To meet this requirement we need to make sure the host bridge's
> pre_enable() is called first by using the pre_enable_prev_first
> flag.
>=20
> Furthermore we need to split enable() into pre_enable() which covers
> steps 2-5 from above and enable() which covers step 7 and is called
> after the host bridge's enable().
>=20
> Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>

Tested-by: Alexander Stein <alexander.stein@ew.tq-group.com> #TQMa8MxML/MBa=
8Mx

> ---
> Changes for v2:
> * Drop RFC
> ---
>  drivers/gpu/drm/bridge/ti-sn65dsi83.c | 19 ++++++++++++++++---
>  1 file changed, 16 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi83.c
> b/drivers/gpu/drm/bridge/ti-sn65dsi83.c index 75286c9afbb9..a82f10b8109f
> 100644
> --- a/drivers/gpu/drm/bridge/ti-sn65dsi83.c
> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
> @@ -321,8 +321,8 @@ static u8 sn65dsi83_get_dsi_div(struct sn65dsi83 *ctx)
>  	return dsi_div - 1;
>  }
>=20
> -static void sn65dsi83_atomic_enable(struct drm_bridge *bridge,
> -				    struct drm_bridge_state=20
*old_bridge_state)
> +static void sn65dsi83_atomic_pre_enable(struct drm_bridge *bridge,
> +					struct drm_bridge_state=20
*old_bridge_state)
>  {
>  	struct sn65dsi83 *ctx =3D bridge_to_sn65dsi83(bridge);
>  	struct drm_atomic_state *state =3D old_bridge_state->base.state;
> @@ -484,11 +484,22 @@ static void sn65dsi83_atomic_enable(struct drm_brid=
ge
> *bridge, /* Trigger reset after CSR register update. */
>  	regmap_write(ctx->regmap, REG_RC_RESET, REG_RC_RESET_SOFT_RESET);
>=20
> +	/* Wait for 10ms after soft reset as specified in datasheet */
> +	usleep_range(10000, 12000);
> +}
> +
> +static void sn65dsi83_atomic_enable(struct drm_bridge *bridge,
> +				    struct drm_bridge_state=20
*old_bridge_state)
> +{
> +	struct sn65dsi83 *ctx =3D bridge_to_sn65dsi83(bridge);
> +	unsigned int pval;
> +
>  	/* Clear all errors that got asserted during initialization. */
>  	regmap_read(ctx->regmap, REG_IRQ_STAT, &pval);
>  	regmap_write(ctx->regmap, REG_IRQ_STAT, pval);
>=20
> -	usleep_range(10000, 12000);
> +	/* Wait for 1ms and check for errors in status register */
> +	usleep_range(1000, 1100);
>  	regmap_read(ctx->regmap, REG_IRQ_STAT, &pval);
>  	if (pval)
>  		dev_err(ctx->dev, "Unexpected link status 0x%02x\n",=20
pval);
> @@ -555,6 +566,7 @@ static const struct drm_bridge_funcs sn65dsi83_funcs =
=3D {
> .attach			=3D sn65dsi83_attach,
>  	.detach			=3D sn65dsi83_detach,
>  	.atomic_enable		=3D sn65dsi83_atomic_enable,
> +	.atomic_pre_enable	=3D sn65dsi83_atomic_pre_enable,
>  	.atomic_disable		=3D sn65dsi83_atomic_disable,
>  	.mode_valid		=3D sn65dsi83_mode_valid,
>=20
> @@ -697,6 +709,7 @@ static int sn65dsi83_probe(struct i2c_client *client)
>=20
>  	ctx->bridge.funcs =3D &sn65dsi83_funcs;
>  	ctx->bridge.of_node =3D dev->of_node;
> +	ctx->bridge.pre_enable_prev_first =3D true;
>  	drm_bridge_add(&ctx->bridge);
>=20
>  	ret =3D sn65dsi83_host_attach(ctx);


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


