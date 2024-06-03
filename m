Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ED6C8D820A
	for <lists+dri-devel@lfdr.de>; Mon,  3 Jun 2024 14:18:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4A9210E053;
	Mon,  3 Jun 2024 12:18:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=tq-group.com header.i=@tq-group.com header.b="kGuRTofU";
	dkim=fail reason="key not found in DNS" (0-bit key; unprotected) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="uD55jf8f";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B37010E053
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Jun 2024 12:18:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1717417121; x=1748953121;
 h=from:to:cc:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding:subject;
 bh=zDeke+PJOAAL9TqgVMMpg1QZTlJp/7Tbmuzny+OVMrI=;
 b=kGuRTofUcc0QRK7fZfhP6n9OMjCkT7R+mU27UX19BHV6WeVedvUFXMFF
 oTGjSnVXIJvSVewVS3gTI+jz2dhJUYxB1szZXM4LMsSR2YLc1YimhIttD
 DLWKNBIqNjXCCDSLMOHk61Y+tvXs0FPbkl5O4To1r9WMCnwD/tGr6rrwP
 PMI/v5T39mvadIwx2PaCrEVnSdnh7s/jy/TiMw3QhR7d1FyOFxnEdheng
 Ypci1dhxhZ5reFEvaogoQ4rj1DvW74LOnGvSSU2DlGt6+qnOQL7hF/rLb
 OgcwsyXA1pyWk5ppkARlcnsgxiJOifJIQAw9G+FO6JLOuhYK+fD/PIFfd w==;
X-CSE-ConnectionGUID: ScKG5SyZRzqELGkHufXkZA==
X-CSE-MsgGUID: Fk489LHURjK+4r3OpkDfAg==
X-IronPort-AV: E=Sophos;i="6.08,211,1712613600"; d="scan'208";a="37189391"
Subject: Re: [PATCH 3/6] drm/bridge: tc358767: Drop line_pixel_subtract
Received: from vmailcow01.tq-net.de ([10.150.86.48])
 by mx1.tq-group.com with ESMTP; 03 Jun 2024 14:18:38 +0200
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 2497A167841; Mon,  3 Jun 2024 14:18:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
 s=dkim; t=1717417114;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=zDeke+PJOAAL9TqgVMMpg1QZTlJp/7Tbmuzny+OVMrI=;
 b=uD55jf8fgazPDpdWroIq5dCOg2VS7j10yAwDoe44KyOn3Xxfuybhx0ahvCQ4tha3U7WDEa
 tdP98j1Y2lhnRAusnsQ4DpFzFCoP3Hd455D6WS+3v278wF6rRZOdzzx9gvtwU1p2RcC3x0
 r4RgjO5H1apk4H43mg/Yb4dgDckxd7fTPlSpDTVYn9/UjQwHD6e/HExFdFouGjuzP8whX9
 BRf54LqWcFTgg7ZTKrEWCBFrpw99kUDKRJGkEJp1Rn/T3j8js/3sbWo/0mYkv/ZZucBgki
 LQBi7vsUEDSR39PBcMPAa9teaEgha8UmwJduYz6HFuN6KKwVFsC+b5JAvooXDA==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: dri-devel@lists.freedesktop.org, Marek Vasut <marex@denx.de>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Lucas Stach <l.stach@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 kernel@dh-electronics.com, Marek Vasut <marex@denx.de>
Date: Mon, 03 Jun 2024 14:18:30 +0200
Message-ID: <6053649.lOV4Wx5bFT@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20240531204130.277800-3-marex@denx.de>
References: <20240531204130.277800-1-marex@denx.de>
 <20240531204130.277800-3-marex@denx.de>
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

Am Freitag, 31. Mai 2024, 22:39:49 CEST schrieb Marek Vasut:
> This line_pixel_subtract is no longer needed now that the bridge can
> request and obtain specific pixel clock on input to the bridge, with
> clock frequency that matches the Pixel PLL frequency.
>=20
> The line_pixel_subtract is now always 0, so drop it entirely.
>=20
> The line_pixel_subtract was not reliable as it never worked when the
> Pixel PLL and input clock were off just so that the required amount
> of pixels to subtract would not be whole integer.

I think this is based on [1], no? I was wondering because it was not stated.

Best regards,
Alexander

[1] https://lore.kernel.org/all/20240514004759.230431-1-marex@denx.de/

> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
> Cc: Jonas Karlman <jonas@kwiboo.se>
> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> Cc: Lucas Stach <l.stach@pengutronix.de>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Neil Armstrong <neil.armstrong@linaro.org>
> Cc: Robert Foss <rfoss@kernel.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: dri-devel@lists.freedesktop.org
> Cc: kernel@dh-electronics.com
> ---
>  drivers/gpu/drm/bridge/tc358767.c | 16 +---------------
>  1 file changed, 1 insertion(+), 15 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/bridge/tc358767.c b/drivers/gpu/drm/bridge/t=
c358767.c
> index 252cc08dcc4a8..f16728256991a 100644
> --- a/drivers/gpu/drm/bridge/tc358767.c
> +++ b/drivers/gpu/drm/bridge/tc358767.c
> @@ -382,9 +382,6 @@ struct tc_data {
> =20
>  	/* HPD pin number (0 or 1) or -ENODEV */
>  	int			hpd_pin;
> -
> -	/* Number of pixels to subtract from a line due to pixel clock delta */
> -	u32			line_pixel_subtract;
>  };
> =20
>  static inline struct tc_data *aux_to_tc(struct drm_dp_aux *a)
> @@ -661,11 +658,7 @@ static int tc_pxl_pll_calc(struct tc_data *tc, u32 r=
efclk, u32 pixelclock,
>  		return -EINVAL;
>  	}
> =20
> -	tc->line_pixel_subtract =3D tc->mode.htotal -
> -		DIV_ROUND_UP(tc->mode.htotal * (u64)best_pixelclock, (u64)pixelclock);
> -
> -	dev_dbg(tc->dev, "PLL: got %d, delta %d (subtract %d px)\n", best_pixel=
clock,
> -		best_delta, tc->line_pixel_subtract);
> +	dev_dbg(tc->dev, "PLL: got %d, delta %d\n", best_pixelclock, best_delta=
);
>  	dev_dbg(tc->dev, "PLL: %d / %d / %d * %d / %d\n", refclk,
>  		ext_div[best_pre], best_div, best_mul, ext_div[best_post]);
> =20
> @@ -909,13 +902,6 @@ static int tc_set_common_video_mode(struct tc_data *=
tc,
>  		upper_margin, lower_margin, vsync_len);
>  	dev_dbg(tc->dev, "total: %dx%d\n", mode->htotal, mode->vtotal);
> =20
> -	if (right_margin > tc->line_pixel_subtract) {
> -		right_margin -=3D tc->line_pixel_subtract;
> -	} else {
> -		dev_err(tc->dev, "Bridge pixel clock too slow for mode\n");
> -		right_margin =3D 0;
> -	}
> -
>  	/*
>  	 * LCD Ctl Frame Size
>  	 * datasheet is not clear of vsdelay in case of DPI
>=20


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


