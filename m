Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D79A84A703B
	for <lists+dri-devel@lfdr.de>; Wed,  2 Feb 2022 12:46:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3812C10E544;
	Wed,  2 Feb 2022 11:45:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 170335 seconds by postgrey-1.36 at gabe;
 Wed, 02 Feb 2022 11:45:58 UTC
Received: from mo4-p02-ob.smtp.rzone.de (mo4-p02-ob.smtp.rzone.de
 [81.169.146.168])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30DA410E544
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Feb 2022 11:45:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1643802349;
 s=strato-dkim-0002; d=goldelico.com;
 h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
 From:Subject:Sender;
 bh=TtvoWSTeL86+2UdMFHXJnnZ7SF/U+8Ottw8P6+WAnO8=;
 b=j6INEz5LNARY9fyK4DWoXKO/j1ywNY86K44G4JPKGieF+fXkYXed/4r2mxE/TNqc8w
 rFNa2qao/Vb4pSS+vCkbvo34JdKxjVCmwzfAk11t/X2Uh4LA00qPF72Rmi3O3ogSPeLG
 evRifJQss+HyQGRkUgY6y8ShV2Z/1aowEgyWQQ07pqN1BUUhneQZGek3vJRBR9WXO94T
 4+Fb+pLYV0goS1dd6vr4qUV/td5yzKysIKc7iJOO8a+4cnS5kN/rwOiHvuURCklAxbq0
 8JkBqcZ34H5mCOpApj08qBiI9cmrnFsqcTmo0wVE97PAdqjWDmx0PWU0Nyz11/fKUISc
 4nUw==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj7wpz8NIGH/jrwDCocQ=="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box by smtp.strato.de (RZmta 47.39.0 DYNA|AUTH)
 with ESMTPSA id L29417y12Bjm9gk
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1
 with 256 ECDH bits, eq. 3072 bits RSA))
 (Client did not present a certificate);
 Wed, 2 Feb 2022 12:45:48 +0100 (CET)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.21\))
Subject: Re: [PATCH v12 7/9] drm/bridge: display-connector: add ddc-en gpio
 support
From: "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <DLAO6R.7AAJRIJFJSDD3@crapouillou.net>
Date: Wed, 2 Feb 2022 12:45:47 +0100
Content-Transfer-Encoding: quoted-printable
Message-Id: <67B24AC4-2E72-4A3C-8CCD-785B00F79CB1@goldelico.com>
References: <cover.1643632014.git.hns@goldelico.com>
 <77a7a1daaf381e1651be38adb62f9af9dd6c8fc5.1643632014.git.hns@goldelico.com>
 <DLAO6R.7AAJRIJFJSDD3@crapouillou.net>
To: Paul Cercueil <paul@crapouillou.net>
X-Mailer: Apple Mail (2.3445.104.21)
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
Cc: Mark Rutland <mark.rutland@arm.com>, Paul Boddie <paul@boddie.org.uk>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Rob Herring <robh+dt@kernel.org>, linux-mips@vger.kernel.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Sam Ravnborg <sam@ravnborg.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, devicetree@vger.kernel.org,
 Kees Cook <keescook@chromium.org>, Jonas Karlman <jonas@kwiboo.se>,
 Mark Brown <broonie@kernel.org>, Maxime Ripard <maxime@cerno.tech>,
 letux-kernel@openphoenux.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 dri-devel@lists.freedesktop.org, Liam Girdwood <lgirdwood@gmail.com>,
 Robert Foss <robert.foss@linaro.org>, linux-kernel@vger.kernel.org,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 "Eric W. Biederman" <ebiederm@xmission.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Paul,

> Am 02.02.2022 um 11:32 schrieb Paul Cercueil <paul@crapouillou.net>:
>=20
> Hi Nikolaus,
>=20
> Le lun., janv. 31 2022 at 13:26:53 +0100, H. Nikolaus Schaller =
<hns@goldelico.com> a =C3=A9crit :
>> "hdmi-connector.yaml" bindings defines an optional property
>> "ddc-en-gpios" for a single gpio to enable DDC operation.
>> Usually this controls +5V power on the HDMI connector.
>> This +5V may also be needed for HPD.
>> This was not reflected in code.
>> Now, the driver activates the ddc gpio after probe and
>> deactivates after remove so it is "almost on".
>> But only if this driver is loaded (and not e.g. blacklisted
>> as module).
>> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
>> ---
>> drivers/gpu/drm/bridge/display-connector.c | 17 +++++++++++++++++
>> 1 file changed, 17 insertions(+)
>> diff --git a/drivers/gpu/drm/bridge/display-connector.c =
b/drivers/gpu/drm/bridge/display-connector.c
>> index d24f5b90feabf..555395e301096 100644
>> --- a/drivers/gpu/drm/bridge/display-connector.c
>> +++ b/drivers/gpu/drm/bridge/display-connector.c
>> @@ -24,6 +24,7 @@ struct display_connector {
>> 	int			hpd_irq;
>> 	struct regulator	*dp_pwr;
>> +	struct gpio_desc	*ddc_en;
>> };
>> static inline struct display_connector *
>> @@ -345,6 +346,19 @@ static int display_connector_probe(struct =
platform_device *pdev)
>> 		}
>> 	}
>> +	/* enable DDC */
>> +	if (type =3D=3D DRM_MODE_CONNECTOR_HDMIA) {
>> +		conn->ddc_en =3D devm_gpiod_get_optional(&pdev->dev, =
"ddc-en",
>> +						       GPIOD_OUT_HIGH);
>> +
>> +		if (IS_ERR(conn->ddc_en)) {
>> +			dev_err(&pdev->dev, "Couldn't get ddc-en =
gpio\n");
>> +			return PTR_ERR(conn->ddc_en);
>> +		}
>> +
>> +		gpiod_set_value(conn->ddc_en, 1);
>=20
> You already requested the gpio with the GPIOD_OUT_HIGH flag, so this =
can be removed.

Ah, ok!

>=20
>=20
>> +	}
>> +
>> 	conn->bridge.funcs =3D &display_connector_bridge_funcs;
>> 	conn->bridge.of_node =3D pdev->dev.of_node;
>> @@ -373,6 +387,9 @@ static int display_connector_remove(struct =
platform_device *pdev)
>> {
>> 	struct display_connector *conn =3D platform_get_drvdata(pdev);
>> +	if (conn->ddc_en)
>> +		gpiod_set_value(conn->ddc_en, 0);
>=20
> Note that gpiod_set_value() already does the null-check internally.

Indeed.

> I actually do prefer your solution, so this is fine with me, but =
maintainers may have a different opinion.

I am fine with any of them. Just need to know which one to take (and =
test).

BR,
Nikolaus

>=20
> Cheers,
> -Paul
>=20
>> +
>> 	if (conn->dp_pwr)
>> 		regulator_disable(conn->dp_pwr);
>> --
>> 2.33.0
>=20
>=20

