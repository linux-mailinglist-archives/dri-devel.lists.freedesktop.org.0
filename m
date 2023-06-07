Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 97EBB7258A9
	for <lists+dri-devel@lfdr.de>; Wed,  7 Jun 2023 10:53:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20BBF10E475;
	Wed,  7 Jun 2023 08:53:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 717C510E475
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Jun 2023 08:53:18 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id DF7E3636EE;
 Wed,  7 Jun 2023 08:53:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8ADF8C433EF;
 Wed,  7 Jun 2023 08:53:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1686127996;
 bh=EkWcDuYEPYfXUrrU09MKWymiN3k4KVR9kC0PGQAic3I=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=TcuIqfFjWcbeOOOUYSC7vRtsg3ISAh7sWe8Thmd9VhPEL9AaFvBM+isNCLvGdxFon
 VGRBCxfhFeshT+KFH75mjdqXdMReqlCS8FVDzMN/aSrBkWXt/7rLZvX1dGLUkkeKlL
 cBm5zAHw6osPAqQh4yWkdYBUhYYaEugEDS5TlpsYtE7RQMROKDVdcPxW7fj3Q9lDW6
 beNqQ49hY5fMf3eQgijV/b6mc0IjGeOibqRh5IJEpVdh1fmvvIyhzPtmaAox68NBIl
 cCFkrmPWHXPNxcXD2cfNQx8LXUUTgrYEYH+Xe3UfJPN0dgRGCnu/jfNXfrwWWAjnjb
 gBBanZEGAqawg==
Date: Wed, 7 Jun 2023 10:53:07 +0200
From: Wolfram Sang <wsa@kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v5 01/11] i2c: Enhance i2c_new_ancillary_device API
Message-ID: <ZIBFc3y9jD59lZ3A@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Biju Das <biju.das.jz@bp.renesas.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Alessandro Zummo <a.zummo@towertech.it>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Corey Minyard <cminyard@mvista.com>,
 Marek =?utf-8?B?QmVow7pu?= <kabel@kernel.org>,
 Jiasheng Jiang <jiasheng@iscas.ac.cn>,
 Antonio Borneo <antonio.borneo@foss.st.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Ahmad Fatoum <a.fatoum@pengutronix.de>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
References: <20230522101849.297499-1-biju.das.jz@bp.renesas.com>
 <20230522101849.297499-2-biju.das.jz@bp.renesas.com>
 <20230529080552.GJ25984@pendragon.ideasonboard.com>
 <OS0PR01MB592283E55078298EEA30C6B9864A9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <20230531085941.GA27043@pendragon.ideasonboard.com>
 <CAMuHMdXywnxO6cL5R84mryFuyVMswj6EniY-bZx7m_2L3iUY9A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="Nm5CNVphMfOl2T+J"
Content-Disposition: inline
In-Reply-To: <CAMuHMdXywnxO6cL5R84mryFuyVMswj6EniY-bZx7m_2L3iUY9A@mail.gmail.com>
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
Cc: Corey Minyard <cminyard@mvista.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Antonio Borneo <antonio.borneo@foss.st.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Marek =?utf-8?B?QmVow7pu?= <kabel@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 Alessandro Zummo <a.zummo@towertech.it>, Jiasheng Jiang <jiasheng@iscas.ac.cn>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Rob Herring <robh+dt@kernel.org>, Biju Das <biju.das.jz@bp.renesas.com>,
 Ahmad Fatoum <a.fatoum@pengutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--Nm5CNVphMfOl2T+J
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

sorry for not being able to chime in earlier.

> In Biju's particular use case, the i2c device responds to two addresses,
> which is the standard i2c ancillary use case.  However, what's special

Not quite. ancillary is used when a *driver* needs to take care of two
addresses. We already have devices bundling two features into the same
chip. I recall at least RTC + EEPROM somewhere. And so far, we have been
handling this by creating two nodes in DT and have proper binding docs.
I think this is cleaner. First, you can see in DT already what the
compound device really consists of. In this case, which RTC and RTC
driver is exactly needed. Second, the code added here adds complexity to
the I2C core with another layer of inderection for dummy devices.

> As some resources are shared (knowledge about the clocks), splitting
> this in two distinct devices in DT (which is what Biju's initial patch
> series did) would need phandles to link both nodes together.
>=20
> Do you have a better idea how to represent this?

Not sure if I understood this chip correctly, but maybe: The PMIC driver
exposes a clock gate which can be consumed by the RTC driver?

Happy hacking,

   Wolfram


--Nm5CNVphMfOl2T+J
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmSARW8ACgkQFA3kzBSg
KbbYsRAAgTcDHo1Azv7DhDEOMF7wTqPXl27TMa07c345Y64Hxn/2+x1zO5eddL2T
dHKlj2vg5Ry53CEbEC1wGPxBSDSOtDQvPPxXCSEFDi1ead63j/gOeGcuMvwySb80
7wk2qUBMkkT00yQDweMv9AwNXbo0MKOHnEYZHkhFBy36gS2qqzSYkjj6AdJuVKJR
6va/d1QulASM1ZutznMHQvXd/lL/XDBbraxfQBjGlrZG9C6wJq23WuoWavjbHwdU
DAzXIYSGMvqbIMSrXNjnGrVeEFwNnMYFM8EOTk319nQR9Z1i1UMiqvoOEVoEZWW+
XzrLf1ydWAXICb9j0Mc6RlYTfz+/YUZA0JlBsv+ypN9tw4tPEkmKfmlg6TWAQBA9
aXM84EZjePIhZSU826pOURtAS+fDsfPQZMlnYS6KKdrhU+h3y29rpHA28gKjBTWT
yt3LSb2AOjcOlvsFZQBigDINvwjPfhCRFjpMH2BAzKF5Ei7qygPw1kREgyh5zmr3
UDbelnwjQAk4SuZbqJpRTyKyQdPLl/ReW5lMEhIdOb/n2THQT8fEiFCElpbasoEU
Zg/L7xaU6qROiqbZMPKisltXTlyZ68kY0NPRm+w0AytwQWb1C1IBqGUf8KyJWuKr
oP/yC5SljRtET9R5XI6UgV0wnt4uN8UscY5sMJxbDGCEoTm/iAY=
=0ELS
-----END PGP SIGNATURE-----

--Nm5CNVphMfOl2T+J--
