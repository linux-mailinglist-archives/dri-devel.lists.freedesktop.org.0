Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F3611914664
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jun 2024 11:26:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4927210E3E0;
	Mon, 24 Jun 2024 09:26:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=tq-group.com header.i=@tq-group.com header.b="QVWeTiSB";
	dkim=fail reason="key not found in DNS" (0-bit key; unprotected) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="bI+llN0c";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3AE310E3D2
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2024 09:26:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1719221195; x=1750757195;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=uXGBAwzK7yZKsZvm5VISlXsYiv850Vgj5sqYwZ2Cmo8=;
 b=QVWeTiSBC34iELm7sJOOFeoWWU4+btg2vioaZpd6CEeP2EMfTJO5Kwip
 BEnnsm+4+pem2HYn353GOa3mXSi+0e/zIA00+GCmLnmGnKhZRc7Kw3b2z
 JckPeGJfkHIxABoN+CXVCN5zUJ0aVNBG8eK+jsBPvGn26fUA2zFrMqi6I
 btqjb+2+QaB0LT18i/vCXp+49y4CxGaIJOcKuVFHeplx7LZ8JVETrFVix
 na1RSFR80I2vjb+0Q+V+W2AK0m+OMKUwaMFrOit+J8/1/FymQU6Zv0AN1
 NoFtzsBHjdN53xlG9CC1xHpKuUPpQWu8Kxg44e3X3SLew1iLezXdeIyLo Q==;
X-CSE-ConnectionGUID: j+9ejC9wRwKqaqFfeMT4hA==
X-CSE-MsgGUID: Zt0YUp9hRtewUAt5dI5s7g==
X-IronPort-AV: E=Sophos;i="6.08,261,1712613600"; d="scan'208";a="37547843"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
 by mx1.tq-group.com with ESMTP; 24 Jun 2024 11:26:33 +0200
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 94C8316FCF8; Mon, 24 Jun 2024 11:26:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
 s=dkim; t=1719221189;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=uXGBAwzK7yZKsZvm5VISlXsYiv850Vgj5sqYwZ2Cmo8=;
 b=bI+llN0cFmAnsBDk7zldG5ul2hWCgQE43GFDGGC1Q3ExXCUzS4vW0t2Bd37lDaauJY/la0
 HTZJ5hAMheWqCY5HP8sue9InAnFaGd59eis/iAlOZArEEWlnsSyQlOO1osvJkNPKlbU+Bz
 8lq3yX6RBQmPGQZx7AkN0O/dLTpJvbKLu1hhti1PYmgEjVIlCEyIzu5SYappBRgXS9p5Iy
 P89fPIg8kUTbTZHGetMO345mYMUDL+AkdimtRIrJ+WwE8MDzpBuFKng98F4gs9Cg/E8TtP
 zquCwi7fx2utCERYcLtgfIwRP952kwt5OEpQDa2XzAb9ezkJUyadGWO99Gw7bA==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: dri-devel@lists.freedesktop.org, Marek Vasut <marex@denx.de>
Cc: Marek Vasut <marex@denx.de>, Adam Ford <aford173@gmail.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Inki Dae <inki.dae@samsung.com>, Jagan Teki <jagan@amarulasolutions.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Lucas Stach <l.stach@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Maxime Ripard <mripard@kernel.org>, Michael Walle <mwalle@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, kernel@dh-electronics.com
Subject: Re: [2/2] drm/bridge: tc358767: Reset chip again on attach
Date: Mon, 24 Jun 2024 11:26:32 +0200
Message-ID: <3633351.R56niFO833@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20240513021849.129136-2-marex@denx.de>
References: <20240513021849.129136-2-marex@denx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Last-TLS-Session-Version: TLSv1.3
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

Am Montag, 13. Mai 2024, 04:16:28 CEST schrieb Marek Vasut:
> In case the chip is released from reset using the RESX signal while the
> DSI lanes are in non-LP11 mode, the chip may enter some sort of debug
> mode, where its internal clock run at 1/6th of expected clock rate. In
> this mode, the AUX channel also operates at 1/6th of the 10 MHz mandated
> by DP specification, which breaks DPCD communication.
>=20
> There is no known software way of bringing the chip out of this state
> once the chip enters it, except for toggling the RESX signal and
> performing full reset.
>=20
> The chip may enter this mode when the chip was released from reset in
> probe(), because at that point the DSI lane mode is undefined.
>=20
> When the .attach callback is called, the DSI link is surely in LP11 mode.
> Toggle the RESX signal here and reconfigure the AUX channel. That way,
> the AUX channel communication from this point on does surely run at
> 10 MHz as it should.
>=20
> Signed-off-by: Marek Vasut <marex@denx.de>

This does the trick on my hardware as well.
Reviewed-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---
> Cc: Adam Ford <aford173@gmail.com>
> Cc: Alexander Stein <alexander.stein@ew.tq-group.com>
> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Frieder Schrempf <frieder.schrempf@kontron.de>
> Cc: Inki Dae <inki.dae@samsung.com>
> Cc: Jagan Teki <jagan@amarulasolutions.com>
> Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
> Cc: Jonas Karlman <jonas@kwiboo.se>
> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> Cc: Lucas Stach <l.stach@pengutronix.de>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Marek Szyprowski <m.szyprowski@samsung.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Michael Walle <mwalle@kernel.org>
> Cc: Neil Armstrong <neil.armstrong@linaro.org>
> Cc: Robert Foss <rfoss@kernel.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: dri-devel@lists.freedesktop.org
> Cc: kernel@dh-electronics.com
> ---
>  drivers/gpu/drm/bridge/tc358767.c | 50 +++++++++++++++++++++++++++++++
>  1 file changed, 50 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/bridge/tc358767.c b/drivers/gpu/drm/bridge/t=
c358767.c
> index fe2b93546eaef..9b01dc885973c 100644
> --- a/drivers/gpu/drm/bridge/tc358767.c
> +++ b/drivers/gpu/drm/bridge/tc358767.c
> @@ -1749,10 +1749,30 @@ static const struct drm_connector_funcs tc_connec=
tor_funcs =3D {
>  	.atomic_destroy_state =3D drm_atomic_helper_connector_destroy_state,
>  };
> =20
> +static void tc_bridge_reset(struct tc_data *tc)
> +{
> +	if (!tc->reset_gpio)
> +		return;
> +
> +	gpiod_set_value_cansleep(tc->reset_gpio, 0);
> +	usleep_range(10000, 11000);
> +	gpiod_set_value_cansleep(tc->reset_gpio, 1);
> +	usleep_range(5000, 10000);
> +}
> +
>  static int tc_dpi_bridge_attach(struct drm_bridge *bridge,
>  				enum drm_bridge_attach_flags flags)
>  {
>  	struct tc_data *tc =3D bridge_to_tc(bridge);
> +	int ret;
> +
> +	if (tc->reset_gpio) {
> +		tc_bridge_reset(tc);
> +
> +		ret =3D tc_set_syspllparam(tc);
> +		if (ret)
> +			return ret;
> +	}
> =20
>  	if (!tc->panel_bridge)
>  		return 0;
> @@ -1769,6 +1789,36 @@ static int tc_edp_bridge_attach(struct drm_bridge =
*bridge,
>  	struct drm_device *drm =3D bridge->dev;
>  	int ret;
> =20
> +	if (tc->reset_gpio) {
> +		/*
> +		 * In case the chip is released from reset using the RESX
> +		 * signal while the DSI lanes are in non-LP11 mode, the chip
> +		 * may enter some sort of debug mode, where its internal
> +		 * clock run at 1/6th of expected clock rate. In this mode,
> +		 * the AUX channel also operates at 1/6th of the 10 MHz
> +		 * mandated by DP specification, which breaks DPCD
> +		 * communication.
> +		 *
> +		 * There is no known software way of bringing the chip out of
> +		 * this state once the chip enters it, except for toggling
> +		 * the RESX signal and performing full reset.
> +		 *
> +		 * The chip may enter this mode when the chip was released
> +		 * from reset in probe(), because at that point the DSI lane
> +		 * mode is undefined.
> +		 *
> +		 * At this point, the DSI link is surely in LP11 mode. Toggle
> +		 * the RESX signal here and reconfigure the AUX channel. That
> +		 * way, the AUX channel communication from this point on does
> +		 * surely run at 10 MHz as it should.
> +		 */
> +		tc_bridge_reset(tc);
> +
> +		ret =3D tc_aux_link_setup(tc);
> +		if (ret)
> +			return ret;
> +	}
> +
>  	if (tc->panel_bridge) {
>  		/* If a connector is required then this driver shall create it */
>  		ret =3D drm_bridge_attach(tc->bridge.encoder, tc->panel_bridge,
>=20


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


