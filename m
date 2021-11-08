Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AEDB4447F6E
	for <lists+dri-devel@lfdr.de>; Mon,  8 Nov 2021 13:21:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 623E96E0A6;
	Mon,  8 Nov 2021 12:21:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8006E6E0A6
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Nov 2021 12:21:15 +0000 (UTC)
Date: Mon, 08 Nov 2021 12:20:59 +0000
From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v5 2/7] drm/ingenic: Add support for JZ4780 and HDMI output
To: "H. Nikolaus Schaller" <hns@goldelico.com>
Message-Id: <ZA692R.GHQL6RBCLFB12@crapouillou.net>
In-Reply-To: <2E32F572-72D0-44E7-A700-AF8A2D37BFDA@goldelico.com>
References: <cover.1633436959.git.hns@goldelico.com>
 <2c7d0aa7d3ef480ebb996d37c27cbaa6f722728b.1633436959.git.hns@goldelico.com>
 <FXTI0R.3FZIJZ7UYSNQ@crapouillou.net>
 <7CEBB741-2218-40A7-9800-B3A154895274@goldelico.com>
 <Q6U72R.9HY4TXLC6RWV2@crapouillou.net>
 <229EBE4C-6555-41DE-962F-D82798AEC650@goldelico.com>
 <HQY82R.69JHJIC64HDO1@crapouillou.net>
 <2E32F572-72D0-44E7-A700-AF8A2D37BFDA@goldelico.com>
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

Hi,

Le lun., nov. 8 2021 at 11:52:20 +0100, H. Nikolaus Schaller=20
<hns@goldelico.com> a =E9crit :
> Hi Paul,
>=20
>>>  Am 08.11.2021 um 10:37 schrieb Paul Cercueil=20
>>> <paul@crapouillou.net>:
>>>=20
>>>  Well, it was atomic: "add jz4780+hdmi functionality" or not. Now=20
>>> we separate into "preparation for adding jz4780" and "really=20
>>> adding". Yes, you can split atoms into quarks...
>>=20
>>  And that's how it should be done. Lots of small atomic patches are=20
>> much easier to review than a few big patches.
>=20
> I doubt that in this case especially as it has nothing to do with=20
> jz4780...

It has nothing to do with JZ4780 and that's exactly why it should be a=20
separate patch.

> But I have a proposal for a better solution at the end of this mail.
>=20
>>>>  Note that you can do even better, set the .max_register field=20
>>>> according to the memory resource you get from DTS. Have a look at=20
>>>> the pinctrl driver which does exactly this.
>>>  That is an interesting idea. Although I don't see where
>>> =20
>>> https://elixir.bootlin.com/linux/latest/source/drivers/pinctrl/pinctrl-=
ingenic.c#L4171
>>>  does make use of the memory resource from DTS. It just reads two=20
>>> values from the ingenic_chip_info instead of one I do read from=20
>>> soc_info.
>>=20
>>  It overrides the .max_register from a static regmap_config instance.
>=20
> To be precise: it overrides .max_register of a copy of a static=20
> regmap_config instance (which has .max_register =3D 0).
>=20
>>  You can do the same,
>=20
> We already do the same...
>=20
>>  calculating the .max_register from the memory resource you get from=20
>> DT.
>=20
> I can't see any code in pinctrl-ingenic.c getting the memory resource=20
> that from DT. It calculates it from the ingenic_chip_info tables=20
> inside the driver code but not DT.
>=20
>>  I'm sure you guys can figure it out.
>=20
> Ah, we have to figure out. You are not sure yourself how to do it?=20
> And it is *not* exactly like the pinctrl driver (already) does?=20
> Please give precise directions in reviews and not vague research=20
> homework. Our time is also valuable. Sorry if I review your reviews...
>=20
> Anyways I think you roughly intend (untested):
>=20
> 	struct resource *r;
>=20
> 	r =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> 	regmap_config.max_register =3D r.end - r.start;

Replace the "devm_platform_ioremap_resource" with=20
"devm_platform_get_and_ioremap_resource" to get a pointer to the=20
resource.

Then the .max_register should be (r.end - r.start - 4) I think.

And lose the aggressivity. It's not going to get you anywhere,=20
especially since I'm the one who decides whether or not I should merge=20
your patches. You want your code upstream, that's great, but it's your=20
responsability to get it to shape so that it's eventually accepted.

>=20
> But I wonder how that could work at all (despite adding code=20
> execution time) with:

Code execution time? ...

> e.g. jz4770.dtsi:
>=20
> 	lcd: lcd-controller@13050000 {
> 		compatible =3D "ingenic,jz4770-lcd";
> 		reg =3D <0x13050000 0x300>;
>=20
> or jz4725b.dtsi:
>=20
> 	lcd: lcd-controller@13050000 {
> 		compatible =3D "ingenic,jz4725b-lcd";
> 		reg =3D <0x13050000 0x1000>;
>=20
> So max_register becomes 0x300 or 0x1000 but not
>=20
> #define JZ_REG_LCD_SIZE1	0x12c
> 	.max_reg =3D JZ_REG_LCD_SIZE1,
>=20
> And therefore wastes a lot of regmap memory.

"regmap memory"? ...

> Do you want this? DTS should not be reduced (DTS should be kept as=20
> stable as possible), since the reg property describes address mapping=20
> - not how many bytes are really used by registers or how big a cache=20
> should be allocated (cache allocation size requirements are not=20
> hardware description).

The DTS should list the address and size of the register area. If your=20
last register is at address 0x12c and there's nothing above, then the=20
size in DTS should be 0x130.

> But here are good news:
>=20
> I have a simpler and less invasive proposal. We keep the=20
> devm_regmap_init_mmio code as is and just increase its .max_register=20
> from JZ_REG_LCD_SIZE1 to JZ_REG_LCD_PCFG when introducing the jz4780.=20
> This wastes a handful bytes for all non-jz4780 chips but less than=20
> using the DTS memory region size. And is less code (no entry in=20
> soc_info tables, no modifyable copy) and faster code execution than=20
> all other proposals.
>=20
> This is then just a single-line change when introducing the jz4780.=20
> And no "preparation for adding jz4780" patch is needed at all. No=20
> patch to split out for separate review.
>=20
> Let's go this way to get it eventually finalized. Ok?

No.

Cheers,
-Paul


