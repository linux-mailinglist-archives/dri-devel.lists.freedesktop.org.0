Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91CFC8BF843
	for <lists+dri-devel@lfdr.de>; Wed,  8 May 2024 10:16:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2528111349C;
	Wed,  8 May 2024 08:16:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DB60113495
 for <dri-devel@lists.freedesktop.org>; Wed,  8 May 2024 08:16:28 +0000 (UTC)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77]
 helo=[IPv6:::1]) by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1s4cTQ-0003ai-TA; Wed, 08 May 2024 10:16:24 +0200
Message-ID: <3ac1eadc86772deb12af77e890b2a59a34fa847a.camel@pengutronix.de>
Subject: Re: NXP i.MX8MM GPU performances
From: Lucas Stach <l.stach@pengutronix.de>
To: =?ISO-8859-1?Q?Jo=E3o?= Paulo =?ISO-8859-1?Q?Gon=E7alves?=
 <jpaulo.silvagoncalves@gmail.com>, etnaviv@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, mesa-dev@lists.freedesktop.org
Cc: Marek Vasut <marex@denx.de>, Russell King
 <linux+etnaviv@armlinux.org.uk>,  Christian Gmeiner
 <christian.gmeiner@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 joao.goncalves@toradex.com
Date: Wed, 08 May 2024 10:16:24 +0200
In-Reply-To: <20240507181712.svjjaryisdgfxkle@joaog-nb>
References: <20240507181712.svjjaryisdgfxkle@joaog-nb>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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

Hi Jo=C3=A3o Paulo,

Am Dienstag, dem 07.05.2024 um 15:17 -0300 schrieb Jo=C3=A3o Paulo
Gon=C3=A7alves:
> Hello all,
>=20
> I did run some benchmark on i.MX8MM GPU and I have some concerns on the
> differences between mainline Linux/etnaviv/Mesa and the proprietary NXP/V=
ivante
> solution.
>=20
> The tests were executed comparing glmark2 results between a mainline kern=
el
> (6.9.0-rc6) running Mesa 24.0.3 and NXP provided galcore driver
> 6.4.3.p4.398061 running with a 5.15 based NXP downstream kernel.
>=20
> The GPU is running in overdrive mode (see [1]).
>=20
> mainline infos (etnaviv):
>=20
> > dmesg | grep -i -E '(gpu|etnaviv)'
> [    9.113389] etnaviv-gpu 38000000.gpu: model: GC600, revision: 4653
> [    9.120939] etnaviv-gpu 38000000.gpu: Need to move linear window on MC=
1.0, disabling TS

That's a problem. This will prevent TS from being used, which has a
large performance impact. But it shouldn't be necessary to disable it
on the i.MX8MM GPU, as all memory accesses aside from the initial MMU
commandstream go through MMU translation, so the issue with MC1.0 will
not be hit. Can you try patching out the check in the kernel and see if
it helps?

I'll also send a proper patch for this.

Regards,
Lucas

> [    9.129238] etnaviv-gpu 38008000.gpu: model: GC520, revision: 5341
> [    9.138463] [drm] Initialized etnaviv 1.4.0 20151214 for etnaviv on mi=
nor 1
>=20
> glmark2-es2-wayland info output:=20
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
>     glmark2 2023.01
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
>     OpenGL Information
>     GL_VENDOR:      Mesa
>     GL_RENDERER:    Vivante GC600 rev 4653
>     GL_VERSION:     OpenGL ES 2.0 Mesa 24.0.3
>     Surface Config: buf=3D32 r=3D8 g=3D8 b=3D8 a=3D8 depth=3D24 stencil=
=3D0 samples=3D0
>     Surface Size:   640x480 windowed
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
>=20
> galcore infos (vivante):
>=20
> > dmesg | grep -i -E '(gpu|vivante|gal)'
> [    4.524977] Galcore version 6.4.3.p4.398061
> [    4.587654] [drm] Initialized vivante 1.0.0 20170808 for 38000000.gpu =
on minor 0
>=20
> glmark2-es2-wayland info output:=20
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
>     glmark2 2023.01
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
>     OpenGL Information
>     GL_VENDOR:      Vivante Corporation
>     GL_RENDERER:    Vivante GC7000NanoUltra
>     GL_VERSION:     OpenGL ES 2.0 V6.4.3.p4.398061
>     Surface Config: buf=3D32 r=3D8 g=3D8 b=3D8 a=3D8 depth=3D24 stencil=
=3D0 samples=3D0
>     Surface Size:   640x480 windowed
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
>=20
>=20
> In screen (weston + DSI) test results:
>=20
> glmark2 command:=20
> > glmark2-es2-wayland -b shading:duration=3D5.0 -b refract -b build -b te=
xture -b shadow -b bump -s 640x480 2>&1
>=20
> >         |          glmark2 tests                  |
> > sw ver  |shading|build|texture|refract|shadow|bump|
> > ---------|-------|-----|-------|-------|------|----|
> > etnaviv | 263   | 334 | 291   | 22    | 63   | 328|
> > vivante | 544   | 956 | 790   | 26    | 225  | 894|
>=20
> we have 50-60% smaller number with etnaviv.
>=20
> Offscreen test results:
>=20
> glmark2 command:=20
> > glmark2-es2-wayland  --off-screen -b shading:duration=3D5.0 -b refract =
-b build -b texture -b shadow -b bump -s 640x480 2>&1
>=20
> >         |          glmark2 tests                  |
> > sw ver  |shading|build|texture|refract|shadow|bump|
> > ---------|-------|-----|-------|-------|------|----|
> > etnaviv | 348   | 541 | 466   | 24    | 81   | 498|
> > vivante | 402   | 624 | 520   | 26    | 177  | 557|
>=20
> we have a 10~13% smaller number with etnaviv.
>=20
> Do anybody did run similar benchmark in the past on NXP i.MX8MM? With wha=
t
> results?
>=20
> Is it expected such a difference in the glmark2 tests results?
> Any idea on this big difference between running the test offscreen or not=
?
>=20
> Jo=C3=A3o Paulo
>=20
> [1] https://lore.kernel.org/all/20240507143555.471025-1-jpaulo.silvagonca=
lves@gmail.com/

