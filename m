Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3A6B464F55
	for <lists+dri-devel@lfdr.de>; Wed,  1 Dec 2021 15:03:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C08A6FD95;
	Wed,  1 Dec 2021 14:03:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EFD66FD0B
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Dec 2021 14:03:31 +0000 (UTC)
Date: Wed, 01 Dec 2021 14:03:14 +0000
From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v10 4/8] drm/ingenic: Add dw-hdmi driver for jz4780
To: "H. Nikolaus Schaller" <hns@goldelico.com>
Message-Id: <EDWF3R.CMVWMJL42OH9@crapouillou.net>
In-Reply-To: <46070A95-0FA9-43F9-A9A9-52A7B58B88F5@goldelico.com>
References: <cover.1638307601.git.hns@goldelico.com>
 <4daf0c5dbed2c47c97003ab8de0a7dbd2a335dc3.1638307601.git.hns@goldelico.com>
 <LKTF3R.YREPOCHOSMQN2@crapouillou.net> <Yad69aTXcGixXvy3@sirena.org.uk>
 <46070A95-0FA9-43F9-A9A9-52A7B58B88F5@goldelico.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
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
 dri-devel@lists.freedesktop.org, linux-mips@vger.kernel.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Sam Ravnborg <sam@ravnborg.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, devicetree@vger.kernel.org,
 Kees Cook <keescook@chromium.org>, Jonas Karlman <jonas@kwiboo.se>,
 Rob Herring <robh+dt@kernel.org>, Maxime Ripard <maxime@cerno.tech>,
 letux-kernel@openphoenux.org, Ezequiel Garcia <ezequiel@collabora.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Liam Girdwood <lgirdwood@gmail.com>, Robert Foss <robert.foss@linaro.org>,
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 "Eric W. Biederman" <ebiederm@xmission.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Nikolaus, Mark,

Le mer., d=E9c. 1 2021 at 14:51:51 +0100, H. Nikolaus Schaller=20
<hns@goldelico.com> a =E9crit :
> Hi,
>=20
>>  Am 01.12.2021 um 14:39 schrieb Mark Brown <broonie@kernel.org>:
>>=20
>>  On Wed, Dec 01, 2021 at 01:02:45PM +0000, Paul Cercueil wrote:
>>>  Le mar., nov. 30 2021 at 22:26:37 +0100, H. Nikolaus Schaller
>>=20
>>>>  +	regulator =3D devm_regulator_get_optional(&pdev->dev, "hdmi-5v");
>>>>  +	if (IS_ERR(regulator)) {
>>>>  +		ret =3D PTR_ERR(regulator);
>>=20
>>  Why is this using _optional()?  This should only be done when the=20
>> supply
>>  can be physically absent
>=20
> There can be +5V for HDMI but without a regulator that is visible to=20
> or controllable
> by the driver.

There is always a power supply though. Either a controllable one=20
(through e.g. a GPIO), or it's just connected to the mains +5V; the pin=20
is never left floating. In the second case, in DTS the "hdmi-5v" would=20
be connected to some 5v regulator, even if it's just a dummy VCC-5V=20
regulator. So Mark has a point.

> So hdmi-5v can be simply missing in DTS in which case the driver does=20
> not need to
> care about. The driver just can't turn it on or off.

Please make it mandatory in DTS then, and use devm_regulator_get() in=20
the driver.

Cheers,
-Paul

>>  (in which case I'd expect to see special
>>  handling).
>=20
> The special case is to not enable/disable the regulator if it does=20
> not exist
> and assume that there is hardware providing it otherwise (the driver=20
> can't know
> that except by using get_optional). This is done by the code below
>=20
>>>>  +	if (IS_ERR(regulator)) {
>=20
> ...
>=20
>>  +	if (!regulator)
>>  +		return 0;
>>=20
>>  +	ret =3D regulator_enable(regulator);
>=20
> ...
>=20
> BR and thanks,
> Nikolaus
>=20
>=20
>=20
>=20


