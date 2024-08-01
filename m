Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E5D809446A6
	for <lists+dri-devel@lfdr.de>; Thu,  1 Aug 2024 10:32:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7937310E8B7;
	Thu,  1 Aug 2024 08:32:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=tq-group.com header.i=@tq-group.com header.b="YtDuuDxK";
	dkim=fail reason="key not found in DNS" (0-bit key; unprotected) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="q1cRM6+/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E56210E8B7
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Aug 2024 08:32:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1722501157; x=1754037157;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=L6K+3jn47O6uCjGy+5oPjpSpb+D140nmZzTsXZR0+aE=;
 b=YtDuuDxKOPSnKJB7cv/PWQ5EoR+nb00fiP5Iq/n034STwnXPcNZOZi4h
 uMrUMWbXfzCbiXfDX62eFUERoLsYqQh3jDE+JYhMZ4wCQ9KoXEBch7Rdc
 xBOj0NY+4ZJSLGJgBB9CPI2pr+U5w4aCrwVNMDN1I7DpcETnY+we4u+Dh
 DP9/H7M8HHwxdATGBc4SMesGj/0/VELNEa0m61ji5W6kspNbrNFIBMAMS
 gJP3NOmckYAjGbgsEWZpeti52tvMsozHCFx1cKQ65S2IsyOD7Rnp8dQ/S
 fqew0VcA4Y3Z5jKpQMyUWYFvmS2nwhH06mtcdNnwbyDanrrPylVtzTRwn Q==;
X-CSE-ConnectionGUID: pPADoZfGTbuZq1Tgbo14qw==
X-CSE-MsgGUID: BwusYT/kTj2D4fHyluDDRQ==
X-IronPort-AV: E=Sophos;i="6.09,254,1716242400"; d="scan'208";a="38190921"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
 by mx1.tq-group.com with ESMTP; 01 Aug 2024 10:32:35 +0200
X-CheckPoint: {66AB4823-E-E8EE7C4B-C1098986}
X-MAIL-CPID: 180D808E3F051369868AF7DFC2903183_5
X-Control-Analysis: str=0001.0A782F17.66AB4823.00CF, ss=1, re=0.000, recu=0.000,
 reip=0.000, cl=1, cld=1, fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 3C845168069; Thu,  1 Aug 2024 10:32:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
 s=dkim; t=1722501150;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=L6K+3jn47O6uCjGy+5oPjpSpb+D140nmZzTsXZR0+aE=;
 b=q1cRM6+/Ea4lFF18I2x0xhJIZ5jNcto0i41GDvgWzsBkme1F1k2OFZspCcdGbtFSYwkirz
 NT/qnAZiKX9Urxc5voidJC9Pey31v+lW/Jxj8cMjAjsdHVh+VohiTsqwcTnY0I3dg6ay2s
 4Nc8XhdZS68Ztmc2vvnYANUsjhF36TE3W6RP0JVElhoFAroqw2n4YU09B+IuZcbwNRCwIP
 GoY4zZc0MC7GKH5qzFq8BlOYmZbDZuKCVmYNb3z0ylROyxEgMyhl79a5Twdlm0YjNoXL4i
 A3GcLIfbsXZZHWeHqSyVZpRRKDuQGk0MTMZuTUpZJOEDWNqQPkBZ8EkEvo8oNA==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: dri-devel@lists.freedesktop.org
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
 Thomas Zimmermann <tzimmermann@suse.de>, kernel@dh-electronics.com,
 Marek Vasut <marex@denx.de>
Subject: Re: [PATCH v2 1/2] drm: bridge: samsung-dsim: Initialize bridge on
 attach
Date: Thu, 01 Aug 2024 10:32:27 +0200
Message-ID: <5476416.LvFx2qVVIh@steina-w>
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

Hi,

with more and more patches for TC9595 support got meged into linux-next,
only a few remain on my patch stack.

This is one of them and is necessary for DP support:
Tested-by: Alexander Stein <alexander.stein@ew.tq-group.com>

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


