Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15616916AA4
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jun 2024 16:37:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEB9B10E685;
	Tue, 25 Jun 2024 14:37:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=tq-group.com header.i=@tq-group.com header.b="gYX6KWFm";
	dkim=fail reason="key not found in DNS" (0-bit key; unprotected) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="nf0uRRPP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FCC410E685
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2024 14:37:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1719326250; x=1750862250;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=h9QXEIs80JLdAh0MuK57o74l8znAW/Qz+lmxC832vU4=;
 b=gYX6KWFmYNjGJCR7pKgc2ruPWLfLr5gYHZzPvAHB4CZiRn38rJ4Pqgu9
 U+EN9W7QcGaPCjCfb0kKQlmrIwG/Zep3x0CmVKhO9Jf0Gr6D1diZ52lvw
 0GJd0VdFNyTHWdCAFZn/DISqZkhHcYZodFNCmrZL0oRXUP8zrrKz7K8cf
 DpIhgvtGcEXae5HhyEZRVr85sG7kw1aBnkO2xK87dWED+KGL/DZv2vjyd
 CB6wELVBNCHL6l/Y/GVxNRXRPKb4qf2+JS+myVDFHcFwlf1NtuLyWvRzU
 WrfQ5q36ZIchDq8qswtcNhM9NR6kKHQcdUaTMKKXEgn7bLbbiE4jGqR+1 g==;
X-CSE-ConnectionGUID: ZYO2YF0KT0+lAit++AXnUQ==
X-CSE-MsgGUID: H0DlMMinTO6v5RqJ7HaAYQ==
X-IronPort-AV: E=Sophos;i="6.08,264,1712613600"; d="scan'208";a="37579993"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
 by mx1.tq-group.com with ESMTP; 25 Jun 2024 16:37:27 +0200
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id AFEFF16381B; Tue, 25 Jun 2024 16:37:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
 s=dkim; t=1719326243;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=h9QXEIs80JLdAh0MuK57o74l8znAW/Qz+lmxC832vU4=;
 b=nf0uRRPPZqcmB80993TeadtdRsagX6D4UwiddR+/wpANyRr6Bcj9bmqqAWplGaiebeN8d1
 gKlVrlbu3kj/gR/AThvUuRUvRbKXEqLw7Zk0zAI5DcGjLIFhYAB4FsTnBuvMszD/nxEJct
 JlqhGljlPTCpd/GIpB7cSM/23hnWqnegsSgZWnc/2GwYx0f1nxpx9zL9AoLrcNCD0E/BJi
 P1c4SbN3sAFzIvjdRJpIwOqS+YQw/fjYCELEhgyzEAVNbhBCpzS16prDL6qYIyalEEFg4L
 sOA7MoBbCNIk5iqwrZZO8rqkMWnOSuV0PgaX9w1oZOjNSVS2OZIqhjpw+ry/bg==
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
Subject: Re: [PATCH v2 1/2] drm: bridge: samsung-dsim: Initialize bridge on
 attach
Date: Tue, 25 Jun 2024 16:37:22 +0200
Message-ID: <4603431.cEBGB3zze1@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20240625122824.148163-1-marex@denx.de>
References: <20240625122824.148163-1-marex@denx.de>
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

Hi Marek,

Am Dienstag, 25. Juni 2024, 14:26:10 CEST schrieb Marek Vasut:
> Initialize the bridge on attach already, to force lanes into LP11
> state, since attach does trigger attach of downstream bridges which
> may trigger (e)DP AUX channel mode read.
>=20
> This fixes a corner case where DSIM with TC9595 attached to it fails
> to operate the DP AUX channel, because the TC9595 enters some debug
> mode when it is released from reset without lanes in LP11 mode. By
> ensuring the DSIM lanes are in LP11, the TC9595 (tc358767.c driver)
> can be reset in its attach callback called from DSIM attach callback,
> and recovered out of the debug mode just before TC9595 performs first
> AUX channel access later in its attach callback.
>=20
> Signed-off-by: Marek Vasut <marex@denx.de>
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
> V2: Handle case where mode is not set yet
> ---
>  drivers/gpu/drm/bridge/samsung-dsim.c | 32 ++++++++++++++++++++-------
>  1 file changed, 24 insertions(+), 8 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/brid=
ge/samsung-dsim.c
> index e7e53a9e42afb..22d3bbd866d97 100644
> --- a/drivers/gpu/drm/bridge/samsung-dsim.c
> +++ b/drivers/gpu/drm/bridge/samsung-dsim.c
> @@ -699,20 +699,24 @@ static unsigned long samsung_dsim_set_pll(struct sa=
msung_dsim *dsi,
> =20
>  static int samsung_dsim_enable_clock(struct samsung_dsim *dsi)
>  {
> -	unsigned long hs_clk, byte_clk, esc_clk, pix_clk;
> +	unsigned long hs_clk, byte_clk, esc_clk;
>  	unsigned long esc_div;
>  	u32 reg;
>  	struct drm_display_mode *m =3D &dsi->mode;
>  	int bpp =3D mipi_dsi_pixel_format_to_bpp(dsi->format);
> =20
> -	/* m->clock is in KHz */
> -	pix_clk =3D m->clock * 1000;
> -
> -	/* Use burst_clk_rate if available, otherwise use the pix_clk */
> +	/*
> +	 * Use burst_clk_rate if available, otherwise use the mode clock
> +	 * if mode is already set and available, otherwise fall back to
> +	 * PLL input clock and operate in 1:1 lowest frequency mode until
> +	 * a mode is set.
> +	 */
>  	if (dsi->burst_clk_rate)
>  		hs_clk =3D samsung_dsim_set_pll(dsi, dsi->burst_clk_rate);
> +	else if (m)	/* m->clock is in KHz */
> +		hs_clk =3D samsung_dsim_set_pll(dsi, DIV_ROUND_UP(m->clock * 1000 * bp=
p, dsi->lanes));
>  	else
> -		hs_clk =3D samsung_dsim_set_pll(dsi, DIV_ROUND_UP(pix_clk * bpp, dsi->=
lanes));
> +		hs_clk =3D dsi->pll_clk_rate;
> =20

I can't reproduce that mentioned corner case and presumably this problem
does not exist otherwise. If samsung,burst-clock-frequency is unset I get
a sluggish image on the monitor.

It seems the calculation is using a adjusted clock frequency:
samsung-dsim 32e60000.dsi: Using pixel clock for HS clock frequency
samsung-dsim 32e60000.dsi: [drm:samsung_dsim_host_attach [samsung_dsim]] At=
tached tc358767 device (lanes:4 bpp:24 mode-flags:0xc03)
samsung-dsim 32e60000.dsi: PLL ref clock freq 24000000
samsung-dsim 32e60000.dsi: failed to find PLL PMS for requested frequency
samsung-dsim 32e60000.dsi: failed to configure DSI PLL
samsung-dsim 32e60000.dsi: PLL ref clock freq 24000000
samsung-dsim 32e60000.dsi: PLL freq 883636363, (p 11, m 810, s 1)
samsung-dsim 32e60000.dsi: hs_clk =3D 883636363, byte_clk =3D 110454545, es=
c_clk =3D 9204545
samsung-dsim 32e60000.dsi: calculated hfp: 60, hbp: 105, hsa: 27
samsung-dsim 32e60000.dsi: LCD size =3D 1920x1080

891 MHz is the nominal one for 148.5 MHz pixelclock. But even setting
samsung,burst-clock-frequency to 891 MHz results in a sluggish image.
Maybe this usecase is nothing I need to consider while using DSI-DP
with EDID timings available.

As the burst clock needs to provide more bandwidth than actually needed,
I consider this a different usecase not providing
samsung,burst-clock-frequency for DSI->DP usage.

But the initialization upon attach is working intended, so:
Reviewed-by: Alexander Stein <alexander.stein@ew.tq-group.com>

>  	if (!hs_clk) {
>  		dev_err(dsi->dev, "failed to configure DSI PLL\n");
> @@ -1643,9 +1647,21 @@ static int samsung_dsim_attach(struct drm_bridge *=
bridge,
>  			       enum drm_bridge_attach_flags flags)
>  {
>  	struct samsung_dsim *dsi =3D bridge_to_dsi(bridge);
> +	int ret;
> =20
> -	return drm_bridge_attach(bridge->encoder, dsi->out_bridge, bridge,
> -				 flags);
> +	ret =3D pm_runtime_resume_and_get(dsi->dev);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret =3D samsung_dsim_init(dsi);
> +	if (ret < 0)
> +		goto err;
> +
> +	ret =3D drm_bridge_attach(bridge->encoder, dsi->out_bridge, bridge,
> +				flags);
> +err:
> +	pm_runtime_put_sync(dsi->dev);
> +	return ret;
>  }
> =20
>  static const struct drm_bridge_funcs samsung_dsim_bridge_funcs =3D {
>=20


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


