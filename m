Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5373B492BC0
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jan 2022 17:59:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3187F10E11D;
	Tue, 18 Jan 2022 16:59:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E021910E11D
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jan 2022 16:59:15 +0000 (UTC)
Date: Tue, 18 Jan 2022 16:58:58 +0000
From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v5 2/7] drm/ingenic: Add support for JZ4780 and HDMI output
To: "H. Nikolaus Schaller" <hns@goldelico.com>
Message-Id: <AI0X5R.YWIZO63QXTF4@crapouillou.net>
In-Reply-To: <C846BAFB-473D-41D8-93B9-B9ECDD1846C1@goldelico.com>
References: <cover.1633436959.git.hns@goldelico.com>
 <2c7d0aa7d3ef480ebb996d37c27cbaa6f722728b.1633436959.git.hns@goldelico.com>
 <FXTI0R.3FZIJZ7UYSNQ@crapouillou.net>
 <7CEBB741-2218-40A7-9800-B3A154895274@goldelico.com>
 <Q6U72R.9HY4TXLC6RWV2@crapouillou.net>
 <229EBE4C-6555-41DE-962F-D82798AEC650@goldelico.com>
 <HQY82R.69JHJIC64HDO1@crapouillou.net>
 <5BC61397-AF28-45CD-83F6-FA2C760F3995@goldelico.com>
 <C846BAFB-473D-41D8-93B9-B9ECDD1846C1@goldelico.com>
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
 linux-mips <linux-mips@vger.kernel.org>, Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Sam Ravnborg <sam@ravnborg.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS <devicetree@vger.kernel.org>,
 Kees Cook <keescook@chromium.org>, Jonas Karlman <jonas@kwiboo.se>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Maxime Ripard <maxime@cerno.tech>,
 Discussions about the Letux Kernel <letux-kernel@openphoenux.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Robert Foss <robert.foss@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 "Eric W. Biederman" <ebiederm@xmission.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Nikolaus,

Le mar., janv. 18 2022 at 15:50:01 +0100, H. Nikolaus Schaller=20
<hns@goldelico.com> a =E9crit :
> Hi Paul,
> any insights on the JZ_REG_LCD_OSDC issue below?

Sorry, I missed your previous email. I blame the holidays ;)

> There is a second, unrelated issue with the introduction of
>=20
> "drm/bridge: display-connector: implement bus fmts callbacks"
>=20
> which breaks bus format negotiations.
>=20
> These are the two last unsolved issues to submit a fully working=20
> driver.
>=20
>>  Am 22.12.2021 um 15:03 schrieb H. Nikolaus Schaller=20
>> <hns@goldelico.com>:
>>=20
>>>  Am 08.11.2021 um 10:37 schrieb Paul Cercueil=20
>>> <paul@crapouillou.net>:
>>>=20
>>>  Hi Nikolaus,
>>>=20
>>>  Le dim., nov. 7 2021 at 21:25:38 +0100, H. Nikolaus Schaller=20
>>> <hns@goldelico.com> a =E9crit :
>>>>  Hi Paul,
>>>>>>>>=20
>>>>>>>>  @@ -1274,7 +1319,7 @@ static int ingenic_drm_bind(struct=20
>>>>>>>> device *dev, bool has_components)
>>>>>>>>  	/* Enable OSD if available */
>>>>>>>>  	if (soc_info->has_osd)
>>>>>>>>  -		regmap_write(priv->map, JZ_REG_LCD_OSDC,=20
>>>>>>>> JZ_LCD_OSDC_OSDEN);
>>>>>>>>  +		regmap_set_bits(priv->map, JZ_REG_LCD_OSDC,=20
>>>>>>>> JZ_LCD_OSDC_OSDEN);
>>>>>>>  This change is unrelated to this patch, and I'm not even sure=20
>>>>>>> it's a valid change. The driver shouldn't rely on previous=20
>>>>>>> register values.
>>>>>>  I think I already commented that I think the driver should also=20
>>>>>> not reset
>>>>>>  previous register values to zero.
>>>>>  You did comment this, yes, but I don't agree. The driver=20
>>>>> *should* reset the registers to zero. It should *not* have to=20
>>>>> rely on whatever was configured before.
>>>>>  Even if I did agree, this is a functional change unrelated to=20
>>>>> JZ4780 support, so it would have to be splitted to its own patch.
>>>>  Well it is in preparation of setting more bits that are only=20
>>>> available for the jz4780.
>>>>  But it will be splitted into its own patch for other reasons - if=20
>>>> we ever make osd working...
>>>>>>  If I counted correctly this register has 18 bits which seem to=20
>>>>>> include
>>>>>>  some interrupt masks (which could be initialized somewhere=20
>>>>>> else) and we
>>>>>>  write a constant 0x1.
>>>>>>  Of course most other bits are clearly OSD related (alpha=20
>>>>>> blending),
>>>>>>  i.e. they can have any value (incl. 0) if OSD is disabled. But=20
>>>>>> here we
>>>>>>  enable it. I think there may be missing some setting for the=20
>>>>>> other bits.
>>>>>>  So are you sure, that we can unconditionally reset *all* bits
>>>>>>  except JZ_LCD_OSDC_OSDEN for the jz4780?
>>>>>>  Well I have no experience with OSD being enabled at all. I.e. I=20
>>>>>> have no
>>>>>>  test scenario.
>>=20
>>  It turns out that the line
>>=20
>>  		ret =3D clk_prepare_enable(priv->lcd_clk);
>>=20
>>  initializes JZ_REG_LCD_OSDC to 0x00010005 (i.e. printk tells 0x0=20
>> before).
>=20
> more detailled test shows that it is the underlying
>=20
> 	clk_enable(priv->lcd_clk)
>=20
> (i.e. not the prepare).
>>=20
>>  and writing
>>=20
>>  		regmap_write(priv->map, JZ_REG_LCD_OSDC, JZ_LCD_OSDC_OSDEN);
>>=20
>>  overwrites it with 0x00000001.
>>=20
>>  This makes the HDMI monitor go/stay black until I write manually=20
>> 0x5 to
>>  JZ_REG_LCD_OSDC.
>>=20
>>  This means that JZ_LCD_OSDC_ALPHAEN must be enabled on jz4780 as=20
>> well.
>>  Hence overwriting just with JZ_LCD_OSDC_OSDEN breaks it.
>>=20
>>  Now the questions:
>>  a) 0x5 is understandable that it sets JZ_LCD_OSDC_ALPHAEN - but why=20
>> is it needed?
>>    Is this a not well documented difference between jz4740/60/70/80?
>>  b) how can clk_prepare_enable() write 0x00010005 to=20
>> JZ_REG_LCD_OSDC? Bug or feature?
>>    Something in cgu driver going wrong?
>=20
> I now suspect that it is an undocumented SoC feature.

Not at all. If the clock is disabled, the LCD controller is disabled,=20
so all the registers read zero, this makes sense. You can only read the=20
registers when the clock is enabled. On some SoCs, reading disabled=20
registers can even cause a complete lockup.

Why is this JZ_LCD_OSDC_ALPHAEN bit needed now? I remember it working=20
fine last time I tried, and now I indeed get a black screen unless this=20
bit is set. The PM doesn't make it obvious that the bit is required,=20
but that wouldn't be surprising.

Anyway, feel free to send a patch to fix it (with a Fixes: tag).=20
Ideally something like this:

u32 osdc =3D 0;
...
if (soc_info->has_osd)
    osdc |=3D JZ_LCD_OSDC_OSDEN;
if (soc_info->has_alpha)
    osdc |=3D JZ_LCD_OSDC_ALPHAEN;
regmap_write(priv->map, JZ_REG_LCD_OSDC, osdc);

This also ensures that the OSDC register is properly initialized in the=20
!has_osd case. The driver shouldn't rely on pre-boot values in the=20
registers.

Cheers,
-Paul

>=20
>>  c) what do your SoC or panels do if you write 0x5 to=20
>> JZ_REG_LCD_OSDC?
>>  d) 0x00010005 also has bit 16 set which is undocumented... But this=20
>> is a don't care
>>    according to jz4780 PM.
>=20
> BR and thanks,
> Nikolaus
>=20


