Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BCF3086C7C2
	for <lists+dri-devel@lfdr.de>; Thu, 29 Feb 2024 12:11:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3198B10E46F;
	Thu, 29 Feb 2024 11:11:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=tq-group.com header.i=@tq-group.com header.b="iV5OBt60";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80ECE10E46D
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Feb 2024 11:11:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1709205086; x=1740741086;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4AXalXOYwy5DJ9Y+853GWuOrLhrDVuv0FtC/O6n6KMM=;
 b=iV5OBt60sEUe+S18wfb9M4NjgK25HLyc7FXOjjn8hKgaaY7ToV8I8e59
 iFUOMx+UPHESEG8V52pH0Lb63b9MROanet/zIc8ys6WkGNbiXuf1WLjPW
 Nm3Mz/td6uCacRSW45ZzHE1egnKc/SfNpKRmpeqT4yqxtOX33N6eXStKF
 2ujadwQlnXV8s/+WoBJEGankGo76Tu8dYg/RuDo37Gfclez3NeUW5mvp1
 s00UsqyeOOmoxSyQWWxAg1GIkf+zbiyqWg2cJqcSh+3ofzCc20vVFeDlr
 zkxAjD+yTFlAjtf+ji6s367nF/85jSch0Kp6XgqAKUk7/xGV/yvR0Blbw w==;
X-IronPort-AV: E=Sophos;i="6.06,194,1705359600"; d="scan'208";a="35662981"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
 by mx1.tq-group.com with ESMTP; 29 Feb 2024 12:11:24 +0100
Received: from steina-w.localnet (steina-w.tq-net.de [10.123.53.25])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id E8316280071;
 Thu, 29 Feb 2024 12:11:23 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 1/1] drm/bridge: ti-sn65dsi83: Fix enable error path
Date: Thu, 29 Feb 2024 12:11:23 +0100
Message-ID: <1931621.taCxCBeP46@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20240229104723.7aa71075@booty>
References: <20230504065316.2640739-1-alexander.stein@ew.tq-group.com>
 <3798602.kQq0lBPeGt@steina-w> <20240229104723.7aa71075@booty>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Luca,

Am Donnerstag, 29. Februar 2024, 10:47:23 CET schrieb Luca Ceresoli:
> Hello Alexander,
>=20
> On Wed, 28 Feb 2024 09:15:46 +0100
> Alexander Stein <alexander.stein@ew.tq-group.com> wrote:
>=20
>=20
> [...]
>=20
> > Oh I mistook this DSI-LVDS bridge with the DSI-DP bridge on a different
> > board, my bad. I hope I can provide some insights. My platform is
> > imx8mm-tqma8mqml-mba8mx-lvds-tm070jvhg33.dtb.
> > I can easily cause a PLL lock failure by reducing the delay for the
> > enable-gpios 'gpio_delays'. This will result in a PLL lock faiure.
> > On my platform the vcc-supply counters do look sane:
> > > /sys/kernel/debug/regulator/SN65DSI83_1V8/open_count:1
> > > /sys/kernel/debug/regulator/SN65DSI83_1V8/use_count:0 =20
>=20
> Interesting. Thanks for taking time to report your initial issue!
>=20
> > Once I remove the ti_sn65dsi83 module, the open_count decrements to 0 as
> > well. Looks sane to me.
> >=20
> > If I revert commit c81cd8f7c774 ("Revert "drm/bridge: ti-sn65dsi83:
> > Fix enable error path""), vcc-supply counters are:
> > > /sys/kernel/debug/regulator/SN65DSI83_1V8/open_count:1
> > > /sys/kernel/debug/regulator/SN65DSI83_1V8/use_count:1 =20
> >=20
> > So in my case the use_count does not decrease! If I remove the module
> > ti_sn65dsi83, I get the WARN_ON (enable_count is still non-zero):
> > > WARNING: CPU: 2 PID: 402 at drivers/regulator/core.c:2398 _regulator_=
put+0x15c/0x164 =20
> >=20
> > This is on 6.8.0-rc6-next-20240228 with the following diff applied:
> > --->8--- =20
> > diff --git a/arch/arm64/boot/dts/freescale/mba8mx.dtsi b/arch/arm64/boo=
t/dts/freescale/mba8mx.dtsi
> > index 427467df42bf..8461e1fd396f 100644
> > --- a/arch/arm64/boot/dts/freescale/mba8mx.dtsi
> > +++ b/arch/arm64/boot/dts/freescale/mba8mx.dtsi
> > @@ -285,7 +285,7 @@ &i2c3 {
> >         dsi_lvds_bridge: bridge@2d {
> >                 compatible =3D "ti,sn65dsi84";
> >                 reg =3D <0x2d>;
> > -               enable-gpios =3D <&gpio_delays 0 130000 0>;
> > +               enable-gpios =3D <&gpio_delays 0 0 0>;
> >                 vcc-supply =3D <&reg_sn65dsi83_1v8>;
> >                 status =3D "disabled";
> > =20
> > diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi83.c b/drivers/gpu/drm/br=
idge/ti-sn65dsi83.c
> > index 4814b7b6d1fd..57a7ed13f996 100644
> > --- a/drivers/gpu/drm/bridge/ti-sn65dsi83.c
> > +++ b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
> > @@ -478,7 +478,6 @@ static void sn65dsi83_atomic_pre_enable(struct drm_=
bridge *bridge,
> >                 dev_err(ctx->dev, "failed to lock PLL, ret=3D%i\n", ret=
);
> >                 /* On failure, disable PLL again and exit. */
> >                 regmap_write(ctx->regmap, REG_RC_PLL_EN, 0x00);
> > -               regulator_disable(ctx->vcc);
> >                 return;
> >         }
> > --->8--- =20
> >=20
> > So my patch indeed did fix an actual problem. On the other hand it seems
> > sn65dsi83_atomic_disable is not called in my case for some reason.
>=20
> So you remove the module and atomic_disable is not called, after
> having called atomic_pre_enable?

Yes, that's the case.

> > I'm very possibly missing something, but this looks like a bug in the
> > DRM bridge code at first sight.

Yes, that seemed fishy for me as well. I should not be able to remove the
bridge driver while the pipeline is running. Weston is still running, but
nevertheless I can remove the bridge driver.

Best regards,
Alexander
=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


