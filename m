Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EBE0E7327A0
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jun 2023 08:32:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 670EC10E5A6;
	Fri, 16 Jun 2023 06:32:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 441ED10E59F
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jun 2023 06:32:43 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id CB8B06255B;
 Fri, 16 Jun 2023 06:32:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83E8DC433C0;
 Fri, 16 Jun 2023 06:32:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1686897161;
 bh=+AQvRVdsmhAwTh0/YKVAYP4Euxnx0LOU4wvyWcc0gp8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=uXkS0nTzeCZautZAubDXV7Aiu3ZWpl1xK5h5cg0yILzQZvxhuAFTKK2G3cgkOZVE9
 8nlLsOvvw5KAoVSyKPOIo2dj7lBOl/Pb045bY0pVik/UjKYmVPasCSxwxpDgwORHte
 2U28cW+EcvVAAE3UX5aWQPOa0lJEW6ehU6jWOYyOvdB2Wd08Xb5VEF2BmPm7cd2klD
 wu3AIa62oLjRJHsSZBn5+aRJlU/RQ0L0QzSrZyBJP3FwOJZNuq4yTf+B5TywRnljc2
 AKrUzBRAIL40UTpiLsCXAK1HaJwEhJTjojxxNNqgRMGbJEHC3uF95vDRphc5vx+K+N
 ng67bgjEiStTA==
Date: Fri, 16 Jun 2023 08:32:38 +0200
From: Wolfram Sang <wsa@kernel.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v5 01/11] i2c: Enhance i2c_new_ancillary_device API
Message-ID: <ZIwCBlb5xcLZ70w4@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Biju Das <biju.das.jz@bp.renesas.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
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
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 Mark Brown <broonie@kernel.org>
References: <ZIcUEdctlgRsGxJ3@ninjato>
 <CAMuHMdVOkBeKOEW9PkWB3Tqwa6-rC3BQj=W9VAEgeZfgqvQmWQ@mail.gmail.com>
 <ZIeDcVcfxfcMx/BP@shikoro>
 <CAMuHMdV_Ty=rkcMzsrnJ3YHZngRbyWvYjR_K9Zh7RiAJ4LbvKg@mail.gmail.com>
 <OS0PR01MB59225195B4F2C771F302F7EE8655A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <CAMuHMdUTAerddXG3zJVRZEAwcrR6V=NFeHwsKV9_tE+ccfw6_w@mail.gmail.com>
 <OS0PR01MB59224D7C95B9B0037046FCF78655A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <CAMuHMdUhaSKiuVkmoYt1sm87emFZu7HSSCK-e95-Yy=g8Sgo4w@mail.gmail.com>
 <CAMuHMdX4QxmFJi3q61ByOFG38KgcGMxPQMeXyPA3r1D9098BMg@mail.gmail.com>
 <20230615092312.GF741@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="DnLPxrEEezdDXnuZ"
Content-Disposition: inline
In-Reply-To: <20230615092312.GF741@pendragon.ideasonboard.com>
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
 Antonio Borneo <antonio.borneo@foss.st.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Marek =?utf-8?B?QmVow7pu?= <kabel@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Alessandro Zummo <a.zummo@towertech.it>,
 Jiasheng Jiang <jiasheng@iscas.ac.cn>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Rob Herring <robh+dt@kernel.org>, Biju Das <biju.das.jz@bp.renesas.com>,
 Ahmad Fatoum <a.fatoum@pengutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 Mark Brown <broonie@kernel.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--DnLPxrEEezdDXnuZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > Without of_node, devm_clk_get() and friends falls back to registered
> > clkdevs. So you could call clk_register_clkdev() from within the
> > PMIC driver, and can keep on using devm_clk_get_optional() in the
> > ISL1208 driver.
>=20
> Seriously, how many hacks are we piling ? :-)

For this particular case, why do you consider this a hack? I previously
suggested the solution that the PMIC driver exposes a clock to be
consumed for the RTC driver even for the "two DT node solution". Because
it then avoids a custom property with a phandle to the other node with
regular DT clock bindings. I'd think we need sth like that in any case.


--DnLPxrEEezdDXnuZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmSMAgIACgkQFA3kzBSg
KbaH5w/+L6rsiVafrxQ0Kiqgl0zxXCAKjoLdRSiBeHu7L7Pgl1Jim9SXVD9QNiyu
TMsAJZgDMO1a/FPrnD1VXF/IO6rTz9fIMamBjAr1QoV1ySD+3dOTPcw92SmB/UsD
PN8l5zn1rH3ebNei3hnLP76JfMDZbi9TsBYHsfgsaVl5//4P1+BNxb06WEOhtuQZ
GxttDVUonhpc6ePqfE/kzBtw/2ku3AzdsxL50bKQMflgnowB9ondDTJ++8/YC+aR
1LUzgF6DLipvDAwlDEeAzhokCvIFepn+t0owJNnUxjj6pypAb3xvrFrgX5CHISIA
mhBJWM+GMtxEwKJePRoVdKn8MG9QPGQxFA27W9aZx38rJvlA6l87qVLdD3KHjMWq
7o77OjhIOvo5gaD+kKCRAkH2Vy/7P5ZwGDe0Qg8Dezj1j6u1yrIhCMmvGcYf7GkO
YGuu3K1cJBq2MRZg+Zo5M6+hE/X5yUjShvOW1nTd27K30iEPwEMcfRB6SN8/dcbV
GS7Ow91cbp6hPV8pGRIbkDrUYNwCIGVPQIsPcDCqy9u8mpv/FFyTBIGBZ/IrZBzG
WAQOsBAAOScx8BKCohamosJFUciCQwd27OcTmTdzSS+wuGM6Rp0kODn9aIu7uEdX
mwPyiQLe19ForiH8BO/Myax/CwhqXt2L4MSD9GCAESo4xk8IjNc=
=OTwr
-----END PGP SIGNATURE-----

--DnLPxrEEezdDXnuZ--
