Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 41B2C7EAAC8
	for <lists+dri-devel@lfdr.de>; Tue, 14 Nov 2023 08:16:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD23210E1B7;
	Tue, 14 Nov 2023 07:15:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36B4410E1B7
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Nov 2023 07:15:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1699946155; x=1731482155;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=kL2Yx2dJrpAiJS/uLrK4fhWhgsrhYskS23er0DBU1PM=;
 b=gLecCij4uHePKQICp6v3nz8szKz5UfDIT+wywsojLYqbPOMc6l9q0JcE
 dSSNHMsaT2MX/8gqJx4lPxnjFeEsfoOXuMUrygX6tGGgTPp1lCNDVq/Bk
 otZhbVXer1tFmMu0sUMIYCCnhcbtIPQUtAa9PvqwaDSuG5lp3TU/YA5pL
 vuJi2rYuIKTy0XQGAXYgnlWuhZACAQG6NFSVpfE6FT3SQPVwjJBlpIGGp
 5KEYE9XnQuhssoRDh4ZqRoqCWqL6uBtAd6OcfHYxdhI7nQb5jvDHlbCJR
 btgH3qlXxwX4RJ9peFighRCJ9LDyyV9QyYSA1PRAPhc+JyHKyTLmlbKYP Q==;
X-IronPort-AV: E=Sophos;i="6.03,301,1694728800"; d="scan'208";a="33960176"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
 by mx1.tq-group.com with ESMTP; 14 Nov 2023 08:15:53 +0100
Received: from steina-w.localnet (steina-w.tq-net.de [10.123.53.18])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 7CC5B28007F;
 Tue, 14 Nov 2023 08:15:51 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Inki Dae <inki.dae@samsung.com>, Jagan Teki <jagan@amarulasolutions.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Tim Harvey <tharvey@gateworks.com>, Michael Walle <mwalle@kernel.org>
Subject: Re: [PATCH] drm: bridge: samsung-dsim: Don't use FORCE_STOP_STATE
Date: Tue, 14 Nov 2023 08:15:54 +0100
Message-ID: <4527280.LvFx2qVVIh@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20231113164344.1612602-1-mwalle@kernel.org>
References: <20231113164344.1612602-1-mwalle@kernel.org>
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
Cc: Michael Walle <mwalle@kernel.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Michael,

Am Montag, 13. November 2023, 17:43:44 CET schrieb Michael Walle:
> The FORCE_STOP_STATE bit is unsuitable to force the DSI link into LP-11
> mode. It seems the bridge internally queues DSI packets and when the
> FORCE_STOP_STATE bit is cleared, they are sent in close succession
> without any useful timing (this also means that the DSI lanes won't go
> into LP-11 mode). The length of this gibberish varies between 1ms and
> 5ms. This sometimes breaks an attached bridge (TI SN65DSI84 in this
> case). In our case, the bridge will fail in about 1 per 500 reboots.
>=20
> The FORCE_STOP_STATE handling was introduced to have the DSI lanes in
> LP-11 state during the .pre_enable phase. But as it turns out, none of
> this is needed at all. Between samsung_dsim_init() and
> samsung_dsim_set_display_enable() the lanes are already in LP-11 mode.

Apparently LP-11 is actually entered with the call to=20
samsung_dsim_enable_lane(), but I don't know about other requisites on that=
=20
matter. Unfortunately documentation lacks a lot in that regard.

> The code as it was before commit 20c827683de0 ("drm: bridge:
> samsung-dsim: Fix init during host transfer") and 0c14d3130654 ("drm:
> bridge: samsung-dsim: Fix i.MX8M enable flow to meet spec") was correct
> in this regard.
>=20
> This patch basically reverts both commits. It was tested on an i.MX8M
> SoC with an SN65DSI84 bridge. The signals were probed and the DSI
> packets were decoded during initialization and link start-up. After this
> patch the first DSI packet on the link is a VSYNC packet and the timing
> is correct.

At which point does SN65DSI84 require LP-11?
You have access to a DSI/D-PHY analyzer?

> Command mode between .pre_enable and .enable was also briefly tested by
> a quick hack. There was no DSI link partner which would have responded,
> but it was made sure the DSI packet was send on the link. As a side
> note, the command mode seems to just work in HS mode. I couldn't find
> that the bridge will handle commands in LP mode.

AFAIK ti-sn65dsi83.c only uses I2C for communication. Did you send DSI read/
writes instead?

best regards,
Alexander

> Fixes: 20c827683de0 ("drm: bridge: samsung-dsim: Fix init during host
> transfer") Fixes: 0c14d3130654 ("drm: bridge: samsung-dsim: Fix i.MX8M
> enable flow to meet spec") Signed-off-by: Michael Walle <mwalle@kernel.or=
g>
> ---
> Let me know wether this should be two commits each reverting one, but both
> commits appeared first in kernel 6.5.
>=20
>  drivers/gpu/drm/bridge/samsung-dsim.c | 32 ++-------------------------
>  1 file changed, 2 insertions(+), 30 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c
> b/drivers/gpu/drm/bridge/samsung-dsim.c index cf777bdb25d2..4233a50baac7
> 100644
> --- a/drivers/gpu/drm/bridge/samsung-dsim.c
> +++ b/drivers/gpu/drm/bridge/samsung-dsim.c
> @@ -939,10 +939,6 @@ static int samsung_dsim_init_link(struct samsung_dsim
> *dsi) reg =3D samsung_dsim_read(dsi, DSIM_ESCMODE_REG);
>  	reg &=3D ~DSIM_STOP_STATE_CNT_MASK;
>  	reg |=3D DSIM_STOP_STATE_CNT(driver_data->reg_values[STOP_STATE_CNT]);
> -
> -	if (!samsung_dsim_hw_is_exynos(dsi->plat_data->hw_type))
> -		reg |=3D DSIM_FORCE_STOP_STATE;
> -
>  	samsung_dsim_write(dsi, DSIM_ESCMODE_REG, reg);
>=20
>  	reg =3D DSIM_BTA_TIMEOUT(0xff) | DSIM_LPDR_TIMEOUT(0xffff);
> @@ -1387,18 +1383,6 @@ static void samsung_dsim_disable_irq(struct
> samsung_dsim *dsi) disable_irq(dsi->irq);
>  }
>=20
> -static void samsung_dsim_set_stop_state(struct samsung_dsim *dsi, bool
> enable) -{
> -	u32 reg =3D samsung_dsim_read(dsi, DSIM_ESCMODE_REG);
> -
> -	if (enable)
> -		reg |=3D DSIM_FORCE_STOP_STATE;
> -	else
> -		reg &=3D ~DSIM_FORCE_STOP_STATE;
> -
> -	samsung_dsim_write(dsi, DSIM_ESCMODE_REG, reg);
> -}
> -
>  static int samsung_dsim_init(struct samsung_dsim *dsi)
>  {
>  	const struct samsung_dsim_driver_data *driver_data =3D dsi-
>driver_data;
> @@ -1448,9 +1432,6 @@ static void samsung_dsim_atomic_pre_enable(struct
> drm_bridge *bridge, ret =3D samsung_dsim_init(dsi);
>  		if (ret)
>  			return;
> -
> -		samsung_dsim_set_display_mode(dsi);
> -		samsung_dsim_set_display_enable(dsi, true);
>  	}
>  }
>=20
> @@ -1459,12 +1440,8 @@ static void samsung_dsim_atomic_enable(struct
> drm_bridge *bridge, {
>  	struct samsung_dsim *dsi =3D bridge_to_dsi(bridge);
>=20
> -	if (samsung_dsim_hw_is_exynos(dsi->plat_data->hw_type)) {
> -		samsung_dsim_set_display_mode(dsi);
> -		samsung_dsim_set_display_enable(dsi, true);
> -	} else {
> -		samsung_dsim_set_stop_state(dsi, false);
> -	}
> +	samsung_dsim_set_display_mode(dsi);
> +	samsung_dsim_set_display_enable(dsi, true);
>=20
>  	dsi->state |=3D DSIM_STATE_VIDOUT_AVAILABLE;
>  }
> @@ -1477,9 +1454,6 @@ static void samsung_dsim_atomic_disable(struct
> drm_bridge *bridge, if (!(dsi->state & DSIM_STATE_ENABLED))
>  		return;
>=20
> -	if (!samsung_dsim_hw_is_exynos(dsi->plat_data->hw_type))
> -		samsung_dsim_set_stop_state(dsi, true);
> -
>  	dsi->state &=3D ~DSIM_STATE_VIDOUT_AVAILABLE;
>  }
>=20
> @@ -1781,8 +1755,6 @@ static ssize_t samsung_dsim_host_transfer(struct
> mipi_dsi_host *host, if (ret)
>  		return ret;
>=20
> -	samsung_dsim_set_stop_state(dsi, false);
> -
>  	ret =3D mipi_dsi_create_packet(&xfer.packet, msg);
>  	if (ret < 0)
>  		return ret;


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


