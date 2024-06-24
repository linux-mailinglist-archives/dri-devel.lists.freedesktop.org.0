Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EADF9145DB
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jun 2024 11:06:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE46F10E3BD;
	Mon, 24 Jun 2024 09:05:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=tq-group.com header.i=@tq-group.com header.b="GutkAypi";
	dkim=fail reason="key not found in DNS" (0-bit key; unprotected) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="p881l5xV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 373A910E3BD
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2024 09:05:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1719219957; x=1750755957;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=KZDuwpd/+kE0NM9hzMxdEHKvj5hx0O/GfXR3w1mS/r0=;
 b=GutkAypipI9V+6t8VoLCQKXng27JQUXanXzsL/Xw6VIs9VsKZIx2AsBt
 TyYXhv6R7CvWbnElUpH3MvJPWFZKRjKJ8oVzuAsPdhiZZk4bIIK21Ndbh
 2dEb4tDYKvaAxhKGpHhEOmYvxA2M8fsFukxAPMTbwBQ7+Td2nh4gp5yVs
 yOaLvmWfLG5y67VsDcUF+lqWKabPrIw3rM2vsDpw/wv4SsxaAQ4JeB97u
 L5igqkq0kcoFoRwxKb7z3fVvxDjcPx2ls1uWbpexhOnXxUVqKbZrFRKez
 PNUGtwu9Q/vC5wm1MNyADj2HKeKCngftgksN5LjkKiaK4z75xrbl6oeCT A==;
X-CSE-ConnectionGUID: 1z/n5U5hQ9e2YxF+5Gh1bA==
X-CSE-MsgGUID: CtfBfTiISHexDGbQfvQ8DQ==
X-IronPort-AV: E=Sophos;i="6.08,261,1712613600"; d="scan'208";a="37547172"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
 by mx1.tq-group.com with ESMTP; 24 Jun 2024 11:05:55 +0200
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 3C5DB16FB42; Mon, 24 Jun 2024 11:05:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
 s=dkim; t=1719219951;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=KZDuwpd/+kE0NM9hzMxdEHKvj5hx0O/GfXR3w1mS/r0=;
 b=p881l5xVI5Sr8klLFaTp51P80gr/IfMu0RssbbOSC1JaeqcLymTh+1pVK0fuOYzRvfhlWa
 8h4tzBPOpKa8LKSXGnGlUv781P9qdvxm4inysuoDw8LQWYTml1QSMNOtMJsvClTrMkxTcj
 nEJeSjMqrBDTd2bwTetFa6I5NzmeUlgvQeTG+9EDH2bCMgsJfhIrXKcs0cgiS2eViOwF27
 mQ47bEkHyeLqWshgQF1zN6ii1tOj8cbQTh2okgxYjQ7x7vBpePZfbPz2ktA+i1rFD9Gmtt
 Nk7hhHwRIxMMdh5jJM5yVvN0mGUZKG0DWK8LECP+yqajvKiANo3ia893BriOwQ==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: dri-devel@lists.freedesktop.org
Cc: Marek Vasut <marex@denx.de>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Lucas Stach <l.stach@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 kernel@dh-electronics.com, Marek Vasut <marex@denx.de>
Subject: Re: [PATCH v3 1/6] drm/bridge: tc358767: Split tc_pxl_pll_en() into
 parameter calculation and enablement
Date: Mon, 24 Jun 2024 11:05:54 +0200
Message-ID: <3573149.iIbC2pHGDl@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20240623143846.12603-1-marex@denx.de>
References: <20240623143846.12603-1-marex@denx.de>
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

Am Sonntag, 23. Juni 2024, 16:38:33 CEST schrieb Marek Vasut:
> Split tc_pxl_pll_en() into tc_pxl_pll_calc() which does only Pixel PLL
> parameter calculation and tc_pxl_pll_en() which calls tc_pxl_pll_calc()
> and then configures the Pixel PLL register.
>=20
> This is a preparatory patch for further rework, where tc_pxl_pll_calc()
> will also be used to find out the exact clock frequency generated by the
> Pixel PLL. This frequency will be used as adjusted_mode clock frequency
> and passed down the display pipeline to obtain exactly this frequency
> on input into this bridge.
>=20
> The precise input frequency that matches the Pixel PLL frequency is
> important for this bridge, as if the frequencies do not match, the
> bridge does suffer VFIFO overruns or underruns.
>=20
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
> V2: No change
> V3: No change
> ---
>  drivers/gpu/drm/bridge/tc358767.c | 37 +++++++++++++++++++++----------
>  1 file changed, 25 insertions(+), 12 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/bridge/tc358767.c b/drivers/gpu/drm/bridge/t=
c358767.c
> index b0435c8b754b4..cbb342d811ac3 100644
> --- a/drivers/gpu/drm/bridge/tc358767.c
> +++ b/drivers/gpu/drm/bridge/tc358767.c
> @@ -580,14 +580,9 @@ static int tc_pllupdate(struct tc_data *tc, unsigned=
 int pllctrl)
>  	return 0;
>  }
> =20
> -static u32 div64_round_up(u64 v, u32 d)
> +static int tc_pxl_pll_calc(struct tc_data *tc, u32 refclk, u32 pixelcloc=
k,
> +			   int *out_best_pixelclock, u32 *out_pxl_pllparam)
>  {
> -	return div_u64(v + d - 1, d);
> -}

There seems to be a rebase mishap. The removal of div64_round_up should be
put into patch 3. With that fixed:
Reviewed-by: Alexander Stein <alexander.stein@ew.tq-group.com>

Best regards,
Alexander
> -
> -static int tc_pxl_pll_en(struct tc_data *tc, u32 refclk, u32 pixelclock)
> -{
> -	int ret;
>  	int i_pre, best_pre =3D 1;
>  	int i_post, best_post =3D 1;
>  	int div, best_div =3D 1;
> @@ -683,11 +678,6 @@ static int tc_pxl_pll_en(struct tc_data *tc, u32 ref=
clk, u32 pixelclock)
>  	if (best_mul =3D=3D 128)
>  		best_mul =3D 0;
> =20
> -	/* Power up PLL and switch to bypass */
> -	ret =3D regmap_write(tc->regmap, PXL_PLLCTRL, PLLBYP | PLLEN);
> -	if (ret)
> -		return ret;
> -
>  	pxl_pllparam  =3D vco_hi << 24; /* For PLL VCO >=3D 300 MHz =3D 1 */
>  	pxl_pllparam |=3D ext_div[best_pre] << 20; /* External Pre-divider */
>  	pxl_pllparam |=3D ext_div[best_post] << 16; /* External Post-divider */
> @@ -695,6 +685,29 @@ static int tc_pxl_pll_en(struct tc_data *tc, u32 ref=
clk, u32 pixelclock)
>  	pxl_pllparam |=3D best_div << 8; /* Divider for PLL RefClk */
>  	pxl_pllparam |=3D best_mul; /* Multiplier for PLL */
> =20
> +	if (out_best_pixelclock)
> +		*out_best_pixelclock =3D best_pixelclock;
> +
> +	if (out_pxl_pllparam)
> +		*out_pxl_pllparam =3D pxl_pllparam;
> +
> +	return 0;
> +}
> +
> +static int tc_pxl_pll_en(struct tc_data *tc, u32 refclk, u32 pixelclock)
> +{
> +	u32 pxl_pllparam =3D 0;
> +	int ret;
> +
> +	ret =3D tc_pxl_pll_calc(tc, refclk, pixelclock, NULL, &pxl_pllparam);
> +	if (ret)
> +		return ret;
> +
> +	/* Power up PLL and switch to bypass */
> +	ret =3D regmap_write(tc->regmap, PXL_PLLCTRL, PLLBYP | PLLEN);
> +	if (ret)
> +		return ret;
> +
>  	ret =3D regmap_write(tc->regmap, PXL_PLLPARAM, pxl_pllparam);
>  	if (ret)
>  		return ret;
>=20


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


