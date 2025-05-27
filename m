Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 212B0AC51B5
	for <lists+dri-devel@lfdr.de>; Tue, 27 May 2025 17:12:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 791DE10E402;
	Tue, 27 May 2025 15:12:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=tq-group.com header.i=@tq-group.com header.b="T9dOlpdP";
	dkim=fail reason="key not found in DNS" (0-bit key; unprotected) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="R+K1XtxG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65F3910E402
 for <dri-devel@lists.freedesktop.org>; Tue, 27 May 2025 15:12:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1748358729; x=1779894729;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=We+wcKiwQCih5fxO3N+vGlAs5bVCukKxm0yUBWEyFu4=;
 b=T9dOlpdPcpAn9F9LHiNtg+9zDS08I8xssmIuubDpGP3WqHBOLqB4fC2u
 JqunBWMV0daxqBBCuj3Fkc7vmBHGsJn+HPm7i7IOFwXw5zuXNhyQjW98n
 JMNNfiJm4Kr/NLlXOwLQ7s6Q7S8K6bUHBb+E4xGoyrVP1WZIvCEg6MLNf
 w4qFF8yvDe0UJZIImYpSxhXo+zNa+bZN1fPhqUo/4EF+Tsns+HUz8nxyK
 yIMP2RHBdQLunFnbp7+Avv2oX8mlvnMcvaReuL8IMwJPvTic37n+myzCv
 3TlY4ENQwQwCPTjTFkjNbye/VYpsfDDoO9P1rRbj+zWBv0pPERyZWq44i Q==;
X-CSE-ConnectionGUID: DIKOzPCTSm+bhli4OFT55g==
X-CSE-MsgGUID: wUXTXedpR5aBNFZHG25XUw==
X-IronPort-AV: E=Sophos;i="6.15,318,1739833200"; d="scan'208";a="44317946"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
 by mx1.tq-group.com with ESMTP; 27 May 2025 17:12:07 +0200
X-CheckPoint: {6835D647-17-68AAF6F9-E177A1A4}
X-MAIL-CPID: B91C2457C516ED630C6CA1678F4F6026_2
X-Control-Analysis: str=0001.0A006375.6835D64D.008F, ss=1, re=0.000, recu=0.000,
 reip=0.000, cl=1, cld=1, fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 00BED16357A; Tue, 27 May 2025 17:12:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
 s=dkim; t=1748358723;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=We+wcKiwQCih5fxO3N+vGlAs5bVCukKxm0yUBWEyFu4=;
 b=R+K1XtxGDuY5K5NHWFx6M+XOuhLxwUdREeZwMjbJOw37cFCT8B1F+AINXCaS6MBc97FIKp
 EaOtLnsAfdMvlpcEmcoyStBWDKyy6RjIPhR6LmGlfzIvsf2Y0WPGA1eP1XXehbVslfGMCI
 KJT+thcHXjhQ43ecFWS+JJpYMGLaKo3vVqvH4VhLm0BR+7m7hY06StVfTo8ULQhbZrf/1a
 lbr5UZenNitLB/iBdSIDo44r0FEewfl7qSgveJmwIuTIgiWDzbBymxGRW2Q9ae/YHBE4tW
 mqSuARetpQ0xoivfyM2WHbh+rfy242DOpFxs1TNnhp6zvmayRxr0KYSPUx6SsA==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Inki Dae <inki.dae@samsung.com>, Jagan Teki <jagan@amarulasolutions.com>, 
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel@pengutronix.de, Philipp Zabel <p.zabel@pengutronix.de>,
 Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH 2/2] drm/bridge: samsung-dsim: Use HZ_PER_MHZ macro from
 units.h
Date: Tue, 27 May 2025 17:12:01 +0200
Message-ID: <6646604.DvuYhMxLoT@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20250527-samsung-dsim-v1-2-5be520d84fbb@pengutronix.de>
References: <20250527-samsung-dsim-v1-0-5be520d84fbb@pengutronix.de>
 <20250527-samsung-dsim-v1-2-5be520d84fbb@pengutronix.de>
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

Am Dienstag, 27. Mai 2025, 16:21:48 CEST schrieb Philipp Zabel:
> Drop the custom MHZ macro and replace it with HZ_PER_MHZ.
>=20
> Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>

Reviewed-by: Alexander Stein <alexander.stein@ew.tq-group.com>

> ---
>  drivers/gpu/drm/bridge/samsung-dsim.c | 26 ++++++++++++--------------
>  1 file changed, 12 insertions(+), 14 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/brid=
ge/samsung-dsim.c
> index 1dfc9710bee5134e0e0114ce52f673c21564b11b..b7fd5870eba7e4bef3f420ae7=
cf6de1a700eb41d 100644
> --- a/drivers/gpu/drm/bridge/samsung-dsim.c
> +++ b/drivers/gpu/drm/bridge/samsung-dsim.c
> @@ -19,6 +19,7 @@
>  #include <linux/of.h>
>  #include <linux/phy/phy.h>
>  #include <linux/platform_device.h>
> +#include <linux/units.h>
> =20
>  #include <video/mipi_display.h>
> =20
> @@ -557,10 +558,6 @@ static void samsung_dsim_reset(struct samsung_dsim *=
dsi)
>  	samsung_dsim_write(dsi, DSIM_SWRST_REG, reset_val);
>  }
> =20
> -#ifndef MHZ
> -#define MHZ	(1000 * 1000)
> -#endif
> -
>  static unsigned long samsung_dsim_pll_find_pms(struct samsung_dsim *dsi,
>  					       unsigned long fin,
>  					       unsigned long fout,
> @@ -574,8 +571,8 @@ static unsigned long samsung_dsim_pll_find_pms(struct=
 samsung_dsim *dsi,
>  	u16 _m, best_m;
>  	u8 _s, best_s;
> =20
> -	p_min =3D DIV_ROUND_UP(fin, (driver_data->pll_fin_max * MHZ));
> -	p_max =3D fin / (driver_data->pll_fin_min * MHZ);
> +	p_min =3D DIV_ROUND_UP(fin, (driver_data->pll_fin_max * HZ_PER_MHZ));
> +	p_max =3D fin / (driver_data->pll_fin_min * HZ_PER_MHZ);
> =20
>  	for (_p =3D p_min; _p <=3D p_max; ++_p) {
>  		for (_s =3D 0; _s <=3D 5; ++_s) {
> @@ -590,8 +587,8 @@ static unsigned long samsung_dsim_pll_find_pms(struct=
 samsung_dsim *dsi,
> =20
>  			tmp =3D (u64)_m * fin;
>  			do_div(tmp, _p);
> -			if (tmp < driver_data->min_freq  * MHZ ||
> -			    tmp > driver_data->max_freq * MHZ)
> +			if (tmp < driver_data->min_freq  * HZ_PER_MHZ ||
> +			    tmp > driver_data->max_freq * HZ_PER_MHZ)
>  				continue;
> =20
>  			tmp =3D (u64)_m * fin;
> @@ -634,7 +631,7 @@ static unsigned long samsung_dsim_set_pll(struct sams=
ung_dsim *dsi,
>  		 * limit.
>  		 */
>  		fin =3D clk_get_rate(clk_get_parent(dsi->pll_clk));
> -		while (fin > driver_data->pll_fin_max * MHZ)
> +		while (fin > driver_data->pll_fin_max * HZ_PER_MHZ)
>  			fin /=3D 2;
>  		clk_set_rate(dsi->pll_clk, fin);
> =20
> @@ -660,10 +657,11 @@ static unsigned long samsung_dsim_set_pll(struct sa=
msung_dsim *dsi,
> =20
>  	if (driver_data->has_freqband) {
>  		static const unsigned long freq_bands[] =3D {
> -			100 * MHZ, 120 * MHZ, 160 * MHZ, 200 * MHZ,
> -			270 * MHZ, 320 * MHZ, 390 * MHZ, 450 * MHZ,
> -			510 * MHZ, 560 * MHZ, 640 * MHZ, 690 * MHZ,
> -			770 * MHZ, 870 * MHZ, 950 * MHZ,
> +			100 * HZ_PER_MHZ, 120 * HZ_PER_MHZ, 160 * HZ_PER_MHZ,
> +			200 * HZ_PER_MHZ, 270 * HZ_PER_MHZ, 320 * HZ_PER_MHZ,
> +			390 * HZ_PER_MHZ, 450 * HZ_PER_MHZ, 510 * HZ_PER_MHZ,
> +			560 * HZ_PER_MHZ, 640 * HZ_PER_MHZ, 690 * HZ_PER_MHZ,
> +			770 * HZ_PER_MHZ, 870 * HZ_PER_MHZ, 950 * HZ_PER_MHZ,
>  		};
>  		int band;
> =20
> @@ -723,7 +721,7 @@ static int samsung_dsim_enable_clock(struct samsung_d=
sim *dsi)
>  	esc_div =3D DIV_ROUND_UP(byte_clk, dsi->esc_clk_rate);
>  	esc_clk =3D byte_clk / esc_div;
> =20
> -	if (esc_clk > 20 * MHZ) {
> +	if (esc_clk > 20 * HZ_PER_MHZ) {
>  		++esc_div;
>  		esc_clk =3D byte_clk / esc_div;
>  	}
>=20
>=20


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


