Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B6DD8736C6
	for <lists+dri-devel@lfdr.de>; Wed,  6 Mar 2024 13:41:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 007EE10ECBE;
	Wed,  6 Mar 2024 12:41:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="j9PWQ/cB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B87F10ECBE
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Mar 2024 12:41:23 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E284040005;
 Wed,  6 Mar 2024 12:41:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1709728882;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JpFA52QE85p2hbxD8QqSQp+dfE8BYSqT0OcZAmBb+N0=;
 b=j9PWQ/cBVbDnoCdlsplV65QCncIExLhy7oLhq2mM3sWhTXnVwyU1i4AbuFiKbAHPW1pESe
 8OmJRuLfSU/8Uvu312ULvP2VnoZ7jq7wgeDRjYPgF6npz374YK9SdPPbgsIvvRmNn73PP2
 IkOBy8NAMKIyIN+0wsm05bikBOTM4HutvlPj2Jbtgh1t20/cdvkOOm/xytePohrjpBC4HC
 F8I5hhgANyJr5b9V9zkT1cx4gYrOoPuEwYAok9dlk/q4jjjpBWQtUWodhdVYYVaGmVVRgz
 +u6S9OAjc/cFlW1+ztEtXVGxeyFw5ANCCjmyWhAmE7TdV3tlIoMRvpx5nYHnzg==
Date: Wed, 6 Mar 2024 13:41:20 +0100
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, Laurent
 Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
 <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 1/1] drm/bridge: ti-sn65dsi83: Fix enable error path
Message-ID: <20240306134120.03ce46d8@booty>
In-Reply-To: <5059768.aeNJFYEL58@steina-w>
References: <20230504065316.2640739-1-alexander.stein@ew.tq-group.com>
 <15244220.uLZWGnKmhe@steina-w> <20240301111059.36e6def0@booty>
 <5059768.aeNJFYEL58@steina-w>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-GND-Sasl: luca.ceresoli@bootlin.com
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

Hello Alexander,

On Fri, 01 Mar 2024 11:45:27 +0100
Alexander Stein <alexander.stein@ew.tq-group.com> wrote:

> Hi Luca,
>=20
> Am Freitag, 1. M=C3=A4rz 2024, 11:10:59 CET schrieb Luca Ceresoli:
> > Hello Alexander,
> >=20
> > On Fri, 01 Mar 2024 10:57:37 +0100
> > Alexander Stein <alexander.stein@ew.tq-group.com> wrote:
> >  =20
> > > Hi Luca,
> > >=20
> > > Am Freitag, 1. M=C3=A4rz 2024, 10:44:49 CET schrieb Luca Ceresoli: =20
> > > > Hello Alexander,
> > > >=20
> > > > On Thu, 29 Feb 2024 12:11:23 +0100
> > > > Alexander Stein <alexander.stein@ew.tq-group.com> wrote:
> > > >    =20
> > > > > Hi Luca,
> > > > >=20
> > > > > Am Donnerstag, 29. Februar 2024, 10:47:23 CET schrieb Luca Cereso=
li:   =20
> > > > > > Hello Alexander,
> > > > > >=20
> > > > > > On Wed, 28 Feb 2024 09:15:46 +0100
> > > > > > Alexander Stein <alexander.stein@ew.tq-group.com> wrote:
> > > > > >=20
> > > > > >=20
> > > > > > [...]
> > > > > >      =20
> > > > > > > Oh I mistook this DSI-LVDS bridge with the DSI-DP bridge on a=
 different
> > > > > > > board, my bad. I hope I can provide some insights. My platfor=
m is
> > > > > > > imx8mm-tqma8mqml-mba8mx-lvds-tm070jvhg33.dtb.
> > > > > > > I can easily cause a PLL lock failure by reducing the delay f=
or the
> > > > > > > enable-gpios 'gpio_delays'. This will result in a PLL lock fa=
iure.
> > > > > > > On my platform the vcc-supply counters do look sane:     =20
> > > > > > > > /sys/kernel/debug/regulator/SN65DSI83_1V8/open_count:1
> > > > > > > > /sys/kernel/debug/regulator/SN65DSI83_1V8/use_count:0      =
 =20
> > > > > >=20
> > > > > > Interesting. Thanks for taking time to report your initial issu=
e!
> > > > > >      =20
> > > > > > > Once I remove the ti_sn65dsi83 module, the open_count decreme=
nts to 0 as
> > > > > > > well. Looks sane to me.
> > > > > > >=20
> > > > > > > If I revert commit c81cd8f7c774 ("Revert "drm/bridge: ti-sn65=
dsi83:
> > > > > > > Fix enable error path""), vcc-supply counters are:     =20
> > > > > > > > /sys/kernel/debug/regulator/SN65DSI83_1V8/open_count:1
> > > > > > > > /sys/kernel/debug/regulator/SN65DSI83_1V8/use_count:1      =
 =20
> > > > > > >=20
> > > > > > > So in my case the use_count does not decrease! If I remove th=
e module
> > > > > > > ti_sn65dsi83, I get the WARN_ON (enable_count is still non-ze=
ro):     =20
> > > > > > > > WARNING: CPU: 2 PID: 402 at drivers/regulator/core.c:2398 _=
regulator_put+0x15c/0x164       =20
> > > > > > >=20
> > > > > > > This is on 6.8.0-rc6-next-20240228 with the following diff ap=
plied:     =20
> > > > > > > --->8---       =20
> > > > > > > diff --git a/arch/arm64/boot/dts/freescale/mba8mx.dtsi b/arch=
/arm64/boot/dts/freescale/mba8mx.dtsi
> > > > > > > index 427467df42bf..8461e1fd396f 100644
> > > > > > > --- a/arch/arm64/boot/dts/freescale/mba8mx.dtsi
> > > > > > > +++ b/arch/arm64/boot/dts/freescale/mba8mx.dtsi
> > > > > > > @@ -285,7 +285,7 @@ &i2c3 {
> > > > > > >         dsi_lvds_bridge: bridge@2d {
> > > > > > >                 compatible =3D "ti,sn65dsi84";
> > > > > > >                 reg =3D <0x2d>;
> > > > > > > -               enable-gpios =3D <&gpio_delays 0 130000 0>;
> > > > > > > +               enable-gpios =3D <&gpio_delays 0 0 0>;
> > > > > > >                 vcc-supply =3D <&reg_sn65dsi83_1v8>;
> > > > > > >                 status =3D "disabled";
> > > > > > > =20
> > > > > > > diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi83.c b/drivers/=
gpu/drm/bridge/ti-sn65dsi83.c
> > > > > > > index 4814b7b6d1fd..57a7ed13f996 100644
> > > > > > > --- a/drivers/gpu/drm/bridge/ti-sn65dsi83.c
> > > > > > > +++ b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
> > > > > > > @@ -478,7 +478,6 @@ static void sn65dsi83_atomic_pre_enable(s=
truct drm_bridge *bridge,
> > > > > > >                 dev_err(ctx->dev, "failed to lock PLL, ret=3D=
%i\n", ret);
> > > > > > >                 /* On failure, disable PLL again and exit. */
> > > > > > >                 regmap_write(ctx->regmap, REG_RC_PLL_EN, 0x00=
);
> > > > > > > -               regulator_disable(ctx->vcc);
> > > > > > >                 return;
> > > > > > >         }     =20
> > > > > > > --->8---       =20
> > > > > > >=20
> > > > > > > So my patch indeed did fix an actual problem. On the other ha=
nd it seems
> > > > > > > sn65dsi83_atomic_disable is not called in my case for some re=
ason.     =20
> > > > > >=20
> > > > > > So you remove the module and atomic_disable is not called, after
> > > > > > having called atomic_pre_enable?     =20
> > > > >=20
> > > > > Yes, that's the case.   =20
> > > >=20
> > > > Ah, it's quite obvious looking at the code: removing the module will
> > > > call sn65dsi83_remove()
> > > > https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/brid=
ge/ti-sn65dsi83.c#L729
> > > >=20
> > > > which does just call drm_bridge_remove()
> > > > https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/drm_=
bridge.c#L243
> > > >=20
> > > > which just removes the bridge from the list.
> > > >=20
> > > > So maybe sn65dsi83_remove() should call regulator_disable() as a la=
st
> > > > resort, but I'm not sure this is the correct solution and it would
> > > > involve some housekeeping to not disable the regulator more times t=
han
> > > > it has been enabled.   =20
> > >=20
> > > Actually I think removing the module should be prohibited while the b=
ridge
> > > is enabled in the first place.
> > >  =20
> > > > What is the use case you have for removing the driver module?   =20
> > >=20
> > > I was dealing the PLL lock failure myself, caused by some external de=
lays.
> > > For easy testing I was loading/unloading the module. =20
> >=20
> > Ah, I see, so do you agree that we can say:
> > 1. there is no valid use case for rmmod while the pipeline is running
> >    (I'm not counting debugging here)
> > 2. so the regulator_disable() in pre_enable is not needed
> > ? =20
>=20
> Yes, that seems reasonable. I'm wondering how 1. can actually prevented t=
hough.

I agree rmmod should be handled better. I also think not being able to
return an error from the atomic_[pre_]enable ops seems bad. Both these
aspects are way larger than the scope of this patch however...

So, back to this patch, I've sent a revert patch, trying to summarize
the history we discussed here, and I'd be glad to get your comments and
ACK/NACK on that patch:

https://lore.kernel.org/dri-devel/20240306-ti-sn65dsi83-regulator-imbalance=
-v1-1-a3cea5f3e5b3@bootlin.com/

Thanks for the discussion!

Luca

--=20
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
