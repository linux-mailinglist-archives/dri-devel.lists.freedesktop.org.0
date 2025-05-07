Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 37D89AAE311
	for <lists+dri-devel@lfdr.de>; Wed,  7 May 2025 16:34:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF52410E1A7;
	Wed,  7 May 2025 14:34:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=sntech.de header.i=@sntech.de header.b="tpb14Ivd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44F9C10E1A7
 for <dri-devel@lists.freedesktop.org>; Wed,  7 May 2025 14:34:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de; 
 s=gloria202408;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID;
 bh=ZuS4uT/ExLWpAEhw6TwLCuePFcMmqQyy8F2XFijBTIk=; b=tpb14IvdwO69wLvs7jQK1HHWkZ
 7uU6bcsl1mf8hZWETl28j88o04IOCY1J9Fylg69aXIXcoUp+6fyKElONrqHFUerGQ0f2xo8EQjHEC
 0tCy98NMaezyHRN6uVDJwDvE7RC8eBi2EjaA6wdLEiugOJRq5qNuqTjQ/I29g3nA7Pg8RT9iktnK/
 aM+PDCPfUsx448r3qiBzAQfknnPpogXGoGgXtS3MC9Ro/1SMsPDmNTFA9OuBz5uD1eMaRFEAJ7swO
 USNRzJ2WciNbdu48T0x9sKw1jfQfliEwYb37sxjblvc4LpMF+RTqd/lbjiO5cwuvUeCQ07EJ0Jv45
 btb4TVdA==;
Received: from i53875a1d.versanet.de ([83.135.90.29] helo=diego.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1uCfqc-0002mD-S2; Wed, 07 May 2025 16:34:10 +0200
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Arnd Bergmann <arnd@arndb.de>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Dave Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Nathan Chancellor <nathan@kernel.org>,
 Heiko Stuebner <heiko.stuebner@cherry.de>,
 Andy Yan <andy.yan@rock-chips.com>, dri-devel@lists.freedesktop.org
Cc: "laurent.pinchart" <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Doug Anderson <dianders@chromium.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev, Arnd Bergmann <arnd@kernel.org>
Subject: Re: [PATCH] drm/bridge/synopsys: avoid field overflow warning
Date: Wed, 07 May 2025 16:34:09 +0200
Message-ID: <3355346.44csPzL39Z@diego>
In-Reply-To: <220ed0fb-1ccb-4371-9b5a-a99dfdc84984@app.fastmail.com>
References: <20250408175116.1770876-1-arnd@kernel.org>
 <30e22523-216f-41a9-b931-e90136a45378@app.fastmail.com>
 <220ed0fb-1ccb-4371-9b5a-a99dfdc84984@app.fastmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
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

Am Donnerstag, 10. April 2025, 14:36:45 Mitteleurop=C3=A4ische Sommerzeit s=
chrieb Arnd Bergmann:
> On Wed, Apr 9, 2025, at 09:07, Arnd Bergmann wrote:
> > On Tue, Apr 8, 2025, at 19:51, Arnd Bergmann wrote:
> >> From: Arnd Bergmann <arnd@arndb.de>
> >>
> >> clang-16 and earlier complain about what it thinks might be an out of
> >> range number:
> >>
> >> drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi2.c:348:8: error: call to=20
> >> __compiletime_assert_579 declared with 'error' attribute: FIELD_PREP:=
=20
> >> value too large for the field
> >>                      PHY_SYS_RATIO(tmp));
> >>                      ^
> >> drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi2.c:90:27: note: expanded=20
> >> from macro 'PHY_SYS_RATIO'
> >>  #define PHY_SYS_RATIO(x)                FIELD_PREP(GENMASK(16, 0), x)
> >>
> >
> > I still see the same build failure in some other configurations even
> > with this patch. Please disregard this version, I'll try to come
> > up with a better one.
>=20
> I couldn't come up with anything that actually worked, other than
> the hack below, which just works around the compiletime error
> in FIELD_PREP(), but doesn't look like a proper fix.
>=20
> If anyone else has any ideas, I can test their patch.
>=20
>        Arnd
>=20
> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi2.c b/drivers/gpu=
/drm/bridge/synopsys/dw-mipi-dsi2.c
> index c76f5f2e74d1..8ba528462ede 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi2.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi2.c
> @@ -344,7 +344,7 @@ static void dw_mipi_dsi2_phy_ratio_cfg(struct dw_mipi=
_dsi2 *dsi2)
>          */
>         tmp =3D DIV_ROUND_CLOSEST_ULL(phy_hsclk << 16, sys_clk);
>         regmap_write(dsi2->regmap, DSI2_PHY_SYS_RATIO_MAN_CFG,
> -                    PHY_SYS_RATIO(tmp));
> +                    PHY_SYS_RATIO(tmp & GENMASK(16, 0)));

so should we take this one for the time being?

While FIELD_PREP does _some_ type checking for mask and value, they are
"only" build-time checks for when the value is a builtin constant.

It doesn't do checks at runtime, so it seems this check would fall into
the submitting code's realm?


>  }
> =20
>  static void dw_mipi_dsi2_lp2hs_or_hs2lp_cfg(struct dw_mipi_dsi2 *dsi2)
>=20




