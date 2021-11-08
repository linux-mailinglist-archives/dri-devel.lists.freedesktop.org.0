Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9204D449C02
	for <lists+dri-devel@lfdr.de>; Mon,  8 Nov 2021 19:53:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E5DA6E1B6;
	Mon,  8 Nov 2021 18:53:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E29B6E1B5
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Nov 2021 18:53:40 +0000 (UTC)
Date: Mon, 08 Nov 2021 18:53:24 +0000
From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v5 2/7] drm/ingenic: Add support for JZ4780 and HDMI output
To: "H. Nikolaus Schaller" <hns@goldelico.com>
Message-Id: <0HO92R.RF221XL59J3I1@crapouillou.net>
In-Reply-To: <ACEFD0BB-1FCF-4EEB-A40F-1F2543A05BF4@goldelico.com>
References: <cover.1633436959.git.hns@goldelico.com>
 <2c7d0aa7d3ef480ebb996d37c27cbaa6f722728b.1633436959.git.hns@goldelico.com>
 <FXTI0R.3FZIJZ7UYSNQ@crapouillou.net>
 <7CEBB741-2218-40A7-9800-B3A154895274@goldelico.com>
 <Q6U72R.9HY4TXLC6RWV2@crapouillou.net>
 <229EBE4C-6555-41DE-962F-D82798AEC650@goldelico.com>
 <HQY82R.69JHJIC64HDO1@crapouillou.net>
 <2E32F572-72D0-44E7-A700-AF8A2D37BFDA@goldelico.com>
 <ZA692R.GHQL6RBCLFB12@crapouillou.net>
 <D0809E59-DCB5-46CE-BE5E-D2A5D2ECA6F0@goldelico.com>
 <BVH92R.0VU3IKPQTLX9@crapouillou.net>
 <2F8A88BC-2696-491B-9C01-7D07A3B3670A@goldelico.com>
 <RIL92R.MLAZ6CTO865E1@crapouillou.net>
 <ACEFD0BB-1FCF-4EEB-A40F-1F2543A05BF4@goldelico.com>
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
 dri-devel <dri-devel@lists.freedesktop.org>,
 linux-mips <linux-mips@vger.kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Sam Ravnborg <sam@ravnborg.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS <devicetree@vger.kernel.org>,
 Kees Cook <keescook@chromium.org>, Jonas Karlman <jonas@kwiboo.se>,
 Mark Brown <broonie@kernel.org>, Maxime Ripard <maxime@cerno.tech>,
 Discussions about the Letux Kernel <letux-kernel@openphoenux.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Liam Girdwood <lgirdwood@gmail.com>, Robert Foss <robert.foss@linaro.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 "Eric W. Biederman" <ebiederm@xmission.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Nikolaus,

Le lun., nov. 8 2021 at 19:33:48 +0100, H. Nikolaus Schaller=20
<hns@goldelico.com> a =E9crit :
> Hi Paul,
>=20
>>  Am 08.11.2021 um 18:49 schrieb Paul Cercueil <paul@crapouillou.net>:
>>=20
>>>>  Variant 4: the variant #2 without the changes to the DTSI files.
>>>  Hm. If there is no cache and we can safely remove tight boundary=20
>>> checking (by JZ_REG_LCD_SIZE1) for jz4725/40/70 (by not fixing=20
>>> DTSI) why do we still need the max_register calculation from DTSI=20
>>> specifically for jz4780 and at all?
>>=20
>>  It's better to have the .max_register actually set to the proper=20
>> value. Then reading the registers from debugfs=20
>> (/sys/kernel/debug/regmap/) will print the actual list of registers=20
>> without bogus values. If .max_register is set too high, it will end=20
>> up reading outside the registers area.
>=20
> Ok, that is a good reason to convince me.
>=20
>>  On Ingenic SoCs such reads just return 0, but on some other SoCs it=20
>> can lock up the system.
>=20
> Yes, I know some of these...
>=20
>>  So the best way forward is to have .max_register computed from the=20
>> register area's size, and fix the DTSI with the proper sizes. Since=20
>> your JZ4780 code needs to update .max_register anyway it's a good=20
>> moment to add this patch, and the DTSI files can be fixed later (by=20
>> me or whoever is up to the task).
>=20
> Well, it would already be part of my Variant #2 (untested). So I=20
> could simply split it up further and you can test the pure dtsi=20
> changes and apply them later or modify if that makes problems. Saves=20
> you a little work. BTW: the jz4740 seems to have even less registers=20
> (last register seems to be LCDCMD1 @ 0x1305005C).

Sure, if you want. Send the DTSI patch(es) separate from this patchset=20
then.

>>=20
>>  Fixing the DTS is not a problem in any way, btw. We just need to=20
>> ensure that the drivers still work with old DTB files, which will be=20
>> the case here.
>=20
> Yes, that is right since the new values are smaller than the=20
> originals.
>=20
> Ok, then let's do it that way.

Great. Waiting for your v6 then.

Cheers,
-Paul


