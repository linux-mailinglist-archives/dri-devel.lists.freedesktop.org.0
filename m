Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B614F6F67F8
	for <lists+dri-devel@lfdr.de>; Thu,  4 May 2023 11:07:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76E1B10E049;
	Thu,  4 May 2023 09:07:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AA4710E049
 for <dri-devel@lists.freedesktop.org>; Thu,  4 May 2023 09:07:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1683191248; x=1714727248;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=TgRfuEiSYLGvwOx+jCad+MlcgTvyjfSwiQwQ90ROdIg=;
 b=SkERozUzJGr5OU8N6uktaZW4b/mtXw7fsGIUjqHjP3oJ2kkKRlAgbSte
 vvZaAWHmfEMmVcQoenVcEML8XFgWeq16sn/iqHmnu3LydYtODig2PXoU+
 /Z8vl/DpfRe9Le+5B8bGTzmys/tf/nI5PEK5+V8Uq+yJdvcCrnxz3yjmq
 kV7sr435kLbbGR0/OERd8TyRxBcVvYm8HG/VM1D7Ad/GMhaB4Xn63fNGN
 JYCzL8JxVZaN+VfPO14iGpXDaDoVB/LUHJsgNH7phQhWV76luIfuEmQA9
 ZbVqSYEQJEU6Qsh60GKljvtvZFcIlzw9iw/dLEcPejVN042hw0wFmaAlB A==;
X-IronPort-AV: E=Sophos;i="5.99,249,1677538800"; d="scan'208";a="30714724"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
 by mx1-pgp.tq-group.com with ESMTP; 04 May 2023 11:07:26 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
 by tq-pgp-pr1.tq-net.de (PGP Universal service);
 Thu, 04 May 2023 11:07:26 +0200
X-PGP-Universal: processed;
 by tq-pgp-pr1.tq-net.de on Thu, 04 May 2023 11:07:26 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1683191246; x=1714727246;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=TgRfuEiSYLGvwOx+jCad+MlcgTvyjfSwiQwQ90ROdIg=;
 b=UzP8IxqvBeD5XmQSWXQ44mit3aJHnjYdGpoLUpXJLgNLkd5QbBPgdfpL
 SlnvwlF9YBF+gwGMMuQW8EsSqYGPuxw66lZs+hpaRPRADr69fEJqIGp9z
 clITMDMc2cGt2RgaPyz5rNmATJCJdu2xUqz8/p9MB0i4qM5VBvb6hRAAQ
 ze3MKti+lxAx6x25iJxgWuYrpiftkMTTrhuBYM1vsWpuK1jsFSOLdFr3V
 F0rKcjkMrYyOQorVUN/OPclmZvnSaHxbLke4aGICrB3pFbNaj5ajJLORv
 eOVilLmMkNopWOTaXbnBXzNl4RusON0Ze8EAx+eRMo13lvcCeFZaw/Wno Q==;
X-IronPort-AV: E=Sophos;i="5.99,249,1677538800"; d="scan'208";a="30714723"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
 by mx1.tq-group.com with ESMTP; 04 May 2023 11:07:26 +0200
Received: from steina-w.localnet (unknown [10.123.53.21])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 809AD280056;
 Thu,  4 May 2023 11:07:25 +0200 (CEST)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org,
 Inki Dae <inki.dae@samsung.com>, Jagan Teki <jagan@amarulasolutions.com>,
 linux-kernel@vger.kernel.org, Marek Szyprowski <m.szyprowski@samsung.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>
Subject: Re: [PATCH v2 1/2] drm: bridge: samsung-dsim: Fix i.MX8M enable flow
 to meet spec
Date: Thu, 04 May 2023 11:07:24 +0200
Message-ID: <8215519.T7Z3S40VBb@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20230503163313.2640898-2-frieder@fris.de>
References: <20230503163313.2640898-1-frieder@fris.de>
 <20230503163313.2640898-2-frieder@fris.de>
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
Cc: Marek Vasut <marex@denx.de>, Frieder Schrempf <frieder@fris.de>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Frieder,

Am Mittwoch, 3. Mai 2023, 18:33:06 CEST schrieb Frieder Schrempf:
> From: Frieder Schrempf <frieder.schrempf@kontron.de>
>=20
> According to the documentation [1] the proper enable flow is:
>=20
> 1. Enable DSI link and keep data lanes in LP-11 (stop state)
> 2. Disable stop state to bring data lanes into HS mode
>=20
> Currently we do this all at once within enable(), which doesn't
> allow to meet the requirements of some downstream bridges.
>=20
> To fix this we now enable the DSI in pre_enable() and force it
> into stop state using the FORCE_STOP_STATE bit in the ESCMODE
> register until enable() is called where we reset the bit.
>=20
> We currently do this only for i.MX8M as Exynos uses a different
> init flow where samsung_dsim_init() is called from
> samsung_dsim_host_transfer().
>=20
> [1]
> https://docs.kernel.org/gpu/drm-kms-helpers.html#mipi-dsi-bridge-operation
>=20
> Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
> ---
> Changes for v2:
> * Drop RFC
> ---
>  drivers/gpu/drm/bridge/samsung-dsim.c | 25 +++++++++++++++++++++++--
>  1 file changed, 23 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c
> b/drivers/gpu/drm/bridge/samsung-dsim.c index e0a402a85787..9775779721d9
> 100644
> --- a/drivers/gpu/drm/bridge/samsung-dsim.c
> +++ b/drivers/gpu/drm/bridge/samsung-dsim.c
> @@ -859,6 +859,10 @@ static int samsung_dsim_init_link(struct samsung_dsim
> *dsi) reg =3D samsung_dsim_read(dsi, DSIM_ESCMODE_REG);
>  	reg &=3D ~DSIM_STOP_STATE_CNT_MASK;
>  	reg |=3D DSIM_STOP_STATE_CNT(driver_data->reg_values[STOP_STATE_CNT]);
> +
> +	if (!samsung_dsim_hw_is_exynos(dsi->plat_data->hw_type))
> +		reg |=3D DSIM_FORCE_STOP_STATE;
> +
>  	samsung_dsim_write(dsi, DSIM_ESCMODE_REG, reg);
>=20
>  	reg =3D DSIM_BTA_TIMEOUT(0xff) | DSIM_LPDR_TIMEOUT(0xffff);
> @@ -1340,6 +1344,9 @@ static void samsung_dsim_atomic_pre_enable(struct
> drm_bridge *bridge, ret =3D samsung_dsim_init(dsi);
>  		if (ret)
>  			return;
> +
> +		samsung_dsim_set_display_mode(dsi);
> +		samsung_dsim_set_display_enable(dsi, true);
>  	}
>  }
>=20
> @@ -1347,9 +1354,16 @@ static void samsung_dsim_atomic_enable(struct
> drm_bridge *bridge, struct drm_bridge_state *old_bridge_state)
>  {
>  	struct samsung_dsim *dsi =3D bridge_to_dsi(bridge);
> +	u32 reg;
>=20
> -	samsung_dsim_set_display_mode(dsi);
> -	samsung_dsim_set_display_enable(dsi, true);
> +	if (samsung_dsim_hw_is_exynos(dsi->plat_data->hw_type)) {
> +		samsung_dsim_set_display_mode(dsi);
> +		samsung_dsim_set_display_enable(dsi, true);
> +	} else {
> +		reg =3D samsung_dsim_read(dsi, DSIM_ESCMODE_REG);
> +		reg &=3D ~DSIM_FORCE_STOP_STATE;
> +		samsung_dsim_write(dsi, DSIM_ESCMODE_REG, reg);
> +	}
>=20
>  	dsi->state |=3D DSIM_STATE_VIDOUT_AVAILABLE;
>  }
> @@ -1358,10 +1372,17 @@ static void samsung_dsim_atomic_disable(struct
> drm_bridge *bridge, struct drm_bridge_state *old_bridge_state)
>  {
>  	struct samsung_dsim *dsi =3D bridge_to_dsi(bridge);
> +	u32 reg;
>=20
>  	if (!(dsi->state & DSIM_STATE_ENABLED))
>  		return;
>=20
> +	if (!samsung_dsim_hw_is_exynos(dsi->plat_data->hw_type)) {
> +		reg =3D samsung_dsim_read(dsi, DSIM_ESCMODE_REG);
> +		reg |=3D DSIM_FORCE_STOP_STATE;
> +		samsung_dsim_write(dsi, DSIM_ESCMODE_REG, reg);
> +	}
> +
>  	dsi->state &=3D ~DSIM_STATE_VIDOUT_AVAILABLE;
>  }

I know that this is necessary right now, but I don't like that=20
'samsung_dsim_hw_is_exynos()' checks all over the place.

Despite that:
Tested-by: Alexander Stein <alexander.stein@ew.tq-group.com> #TQMa8MxML/MBa=
8Mx

=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


