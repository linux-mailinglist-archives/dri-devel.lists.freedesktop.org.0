Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 964354475A4
	for <lists+dri-devel@lfdr.de>; Sun,  7 Nov 2021 21:25:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA88E6E1F4;
	Sun,  7 Nov 2021 20:25:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mo4-p02-ob.smtp.rzone.de (mo4-p02-ob.smtp.rzone.de
 [81.169.146.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31FCC6E1F4
 for <dri-devel@lists.freedesktop.org>; Sun,  7 Nov 2021 20:25:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1636316741;
 s=strato-dkim-0002; d=goldelico.com;
 h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
 From:Subject:Sender;
 bh=hWGYBtbSOYpUPcr68S4nB4rIlk2qQH3hPQ1EQ+UHgA4=;
 b=ii9l0DpedHRyR0g++qxHW3DgqcDcGK3p/ERGbAXLh2jFzz3DCj+k9JR787Z7LsfgeU
 YHQt1W1XuH3YphqUA03Lwg6kB9jP9NcLVjdyYkVhl2tMLqQ0ebcZGkO5Fgp8aXcXW/JQ
 KJ/esTbIqWYxFY9Wkc4COH1vrCHiiWNHe/JGWc/Rvnut0XjR6uiPNMZkCmJsy2MwjKTC
 TLMN3SObwJKD+28hRoogaHNHT2XFdO4ec90w9fbN8cykhSKn/AYjzuavSAiF9iObow0i
 KxZux72FvHH5Rvc/yG8DNJ8r35cIoS7/goJiLK7ZLp3wvlAp6wI3Egq7rBZ3VowG89G1
 uHCA==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj7gpw91N5y2S3jcR+"
X-RZG-CLASS-ID: mo00
Received: from mbp-13-nikolaus.fritz.box
 by smtp.strato.de (RZmta 47.34.1 DYNA|AUTH)
 with ESMTPSA id 902c63xA7KPcGJP
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1
 with 256 ECDH bits, eq. 3072 bits RSA))
 (Client did not present a certificate);
 Sun, 7 Nov 2021 21:25:38 +0100 (CET)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.21\))
Subject: Re: [PATCH v5 2/7] drm/ingenic: Add support for JZ4780 and HDMI output
From: "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <Q6U72R.9HY4TXLC6RWV2@crapouillou.net>
Date: Sun, 7 Nov 2021 21:25:38 +0100
Content-Transfer-Encoding: quoted-printable
Message-Id: <229EBE4C-6555-41DE-962F-D82798AEC650@goldelico.com>
References: <cover.1633436959.git.hns@goldelico.com>
 <2c7d0aa7d3ef480ebb996d37c27cbaa6f722728b.1633436959.git.hns@goldelico.com>
 <FXTI0R.3FZIJZ7UYSNQ@crapouillou.net>
 <7CEBB741-2218-40A7-9800-B3A154895274@goldelico.com>
 <Q6U72R.9HY4TXLC6RWV2@crapouillou.net>
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
 dri-devel <dri-devel@lists.freedesktop.org>,
 linux-mips <linux-mips@vger.kernel.org>, Andrzej Hajda <a.hajda@samsung.com>,
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

Hi Paul,

> Am 07.11.2021 um 20:01 schrieb Paul Cercueil <paul@crapouillou.net>:
>=20
> Hi Nikolaus,
>=20
> Le dim., nov. 7 2021 at 14:41:18 +0100, H. Nikolaus Schaller =
<hns@goldelico.com> a =C3=A9crit :
>> Hi Paul,
>> sorry for the delay in getting back to this, but I was distracted by =
more urgent topics.
>>> Am 05.10.2021 um 22:22 schrieb Paul Cercueil <paul@crapouillou.net>:
>>> Hi Nikolaus,
>>> Le mar., oct. 5 2021 at 14:29:14 +0200, H. Nikolaus Schaller =
<hns@goldelico.com> a =C3=A9crit :
>>>> From: Paul Boddie <paul@boddie.org.uk>
>>>> Add support for the LCD controller present on JZ4780 SoCs.
>>>> This SoC uses 8-byte descriptors which extend the current
>>>> 4-byte descriptors used for other Ingenic SoCs.
>>>> Tested on MIPS Creator CI20 board.
>>>> Signed-off-by: Paul Boddie <paul@boddie.org.uk>
>>>> Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
>>>> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
>>>> ---
>>>> drivers/gpu/drm/ingenic/ingenic-drm-drv.c | 85 =
+++++++++++++++++++++--
>>>> drivers/gpu/drm/ingenic/ingenic-drm.h     | 42 +++++++++++
>>>> 2 files changed, 122 insertions(+), 5 deletions(-)
>>>> diff --git a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c =
b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
>>>> index f73522bdacaa..e2df4b085905 100644
>>>> --- a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
>>>> +++ b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
>>>> @@ -6,6 +6,7 @@
>>>> 			case DRM_FORMAT_XRGB8888:
>>>> +				hwdesc->cpos |=3D JZ_LCD_CPOS_BPP_18_24;
>>>> +				break;
>>>> +			}
>>>> +			hwdesc->cpos |=3D JZ_LCD_CPOS_PREMULTIPLY_LCD |
>>>> +					    =
(JZ_LCD_CPOS_COEFFICIENT_1_ALPHA1 <<
>>>> +					     =
JZ_LCD_CPOS_COEFFICIENT_OFFSET);
>>> Knowing that OSD mode doesn't really work with this patch, I doubt =
you need to configure per-plane alpha blending.
>> Well, we can not omit setting some CPOS_COEFFICIENT different from 0.
>> This would mean to multiply all values with 0, i.e. gives a black =
screen.
>> So at least we have to apply JZ_LCD_CPOS_COEFFICIENT_1.
>> JZ_LCD_CPOS_PREMULTIPLY_LCD is not relevant in the non-alpha case.
>=20
> hwdesc->cpos =3D JZ_LCD_CPOS_COEFFICIENT_1 << =
JZ_LCD_CPOS_COEFFICIENT_OFFSET;

Exactly what I wrote and did test.

>=20
> That's enough to get an image.

Fine that we can agree on that.

>=20
>> But then, why not do it right from the beginning?
>=20
> Because there's no way to test alpha blending without getting the =
overlay plane to work first.
>=20
>>> 	}
>>> +	regmap_config =3D ingenic_drm_regmap_config;
>>> +	regmap_config.max_register =3D soc_info->max_reg;
>>> 	priv->map =3D devm_regmap_init_mmio(dev, base,
>>> -					  &ingenic_drm_regmap_config);
>>> +					  &regmap_config);
>>> I remember saying to split this change into its own patch :)
>> Yes, I remember as well, but it does not make sense to me.
>> A first patch would introduce regmap_config. This needs =
soc_info->max_reg
>> to be defined as a struct component.
>> This requires all soc_info to be updated for all SoC (w/o =
jz4780_soc_info
>> in this first patch because it has not been added yet) to a constant =
(!)
>> JZ_REG_LCD_SIZE1.
>> And the second patch would then add jz4780_soc_info and set its =
max_reg to
>> a different value.
>=20
> Correct, that's how it should be.

Well, if you prefer separating things that are deeply related into two =
commits...

>=20
> Note that you can do even better, set the .max_register field =
according to the memory resource you get from DTS. Have a look at the =
pinctrl driver which does exactly this.

That is an interesting idea. Although I don't see where

=
https://elixir.bootlin.com/linux/latest/source/drivers/pinctrl/pinctrl-ing=
enic.c#L4171

does make use of the memory resource from DTS. It just reads two values =
from the ingenic_chip_info instead of one I do read from soc_info.

If you see it I'd prefer to leave this patch to you (as it is not jz4780 =
related except that jz4780 needs it to be in place) and then I can =
simply make use of it for adding jz4780+hdmi.

>=20
>> IMHO, such a separate first patch has no benefit independent from =
adding
>> jz4780 support, as far as I can see.
>> If your fear issues with bisectability:
>> - code has been tested
>> - if this fails, bisect will still point to this patch, where it is =
easy to locate
>=20
> It's not about bisectability. One functional change per patch, and =
patches should be as atomic as possible.

Well, it was atomic: "add jz4780+hdmi functionality" or not. Now we =
separate into "preparation for adding jz4780" and "really adding". Yes, =
you can split atoms into quarks...

BTW: without adding jz4780_soc_info there is not even a functional =
change. Just the constant is made dependent on the .compatible entry. =
And since it is initialized to the same constant value in all cases, it =
is still a constant. A very very clever compiler could find out that =
regmap_config.max_register =3D soc_info->max_reg is a NOOP and produce =
the same code as before by avoiding the copy operation of regmap_config =
=3D ingenic_drm_regmap_config.

>=20
>> So I leave it in v6 unsplitted.
>>>> 	if (IS_ERR(priv->map)) {
>>>> 		dev_err(dev, "Failed to create regmap\n");
>>>> 		return PTR_ERR(priv->map);
>>>> @@ -1274,7 +1319,7 @@ static int ingenic_drm_bind(struct device =
*dev, bool has_components)
>>>> 	/* Enable OSD if available */
>>>> 	if (soc_info->has_osd)
>>>> -		regmap_write(priv->map, JZ_REG_LCD_OSDC, =
JZ_LCD_OSDC_OSDEN);
>>>> +		regmap_set_bits(priv->map, JZ_REG_LCD_OSDC, =
JZ_LCD_OSDC_OSDEN);
>>> This change is unrelated to this patch, and I'm not even sure it's a =
valid change. The driver shouldn't rely on previous register values.
>> I think I already commented that I think the driver should also not =
reset
>> previous register values to zero.
>=20
> You did comment this, yes, but I don't agree. The driver *should* =
reset the registers to zero. It should *not* have to rely on whatever =
was configured before.
>=20
> Even if I did agree, this is a functional change unrelated to JZ4780 =
support, so it would have to be splitted to its own patch.

Well it is in preparation of setting more bits that are only available =
for the jz4780.

But it will be splitted into its own patch for other reasons - if we =
ever make osd working...

>=20
>> If I counted correctly this register has 18 bits which seem to =
include
>> some interrupt masks (which could be initialized somewhere else) and =
we
>> write a constant 0x1.
>> Of course most other bits are clearly OSD related (alpha blending),
>> i.e. they can have any value (incl. 0) if OSD is disabled. But here =
we
>> enable it. I think there may be missing some setting for the other =
bits.
>> So are you sure, that we can unconditionally reset *all* bits
>> except JZ_LCD_OSDC_OSDEN for the jz4780?
>> Well I have no experience with OSD being enabled at all. I.e. I have =
no
>> test scenario.
>> So we can leave it out in v6.

So we agree as here well.

>>>>=20
>>>> +	}
>>> As I said in your v4... You don't need to add this here. The =
ingenic-dw-hdmi.c should take care of registering its driver.
>> Well, I can not identify any difference in code structure to the IPU =
code.
>> The Makefile (after our patch) looks like:
>> obj-$(CONFIG_DRM_INGENIC) +=3D ingenic-drm.o
>> ingenic-drm-y =3D ingenic-drm-drv.o
>> ingenic-drm-$(CONFIG_DRM_INGENIC_IPU) +=3D ingenic-ipu.o
>> ingenic-drm-$(CONFIG_DRM_INGENIC_DW_HDMI) +=3D ingenic-dw-hdmi.o
>> which means that ingenic-dw-hdmi.o is also compiled into ingenic-drm,
>> like ingenic-drm-drv.o and ingenic-ipu.o - if CONFIGured. If not, =
there
>> are these IS_ENABLED() tests to guard against compiler errors.
>> Is there any technical reason to request a driver structure and =
registration
>> different from IPU here?
>=20
> There is no reason to have ingenic-dw-hdmi built into the ingenic-drm =
module. It should be a separate module.
>=20
>> Why not having ingenic-ipu.c taking care of registering its driver as =
well?
>=20
> IIRC ingenic-ipu.c was built into the ingenic-drm at the beginning =
because of circular dependencies between the IPU and main DRM driver. I =
think ingenic-ipu.c could be its own module now. That's something I will =
test soon.

Ok, that was the piece of information I was missing. I always thought =
that the way IPU is integrated is the best one and there is some special =
requirement. And it shows how we should do it.

So I'll wait until I see your proposal for IPU.

>=20
>> As soon as this is clarified, I can post a v6.
>> Hm. I am not familiar with how ingenic_drm_crtc_atomic_check()
>> would be notified about planes. Which configuration parameters
>> should be checked for?
>=20
> You know that the &ingenic_drm->f0 plane cannot be used (right now), =
so in ingenic_drm_plane_atomic_check() just:
>=20
> if (plane =3D=3D &priv->f0 && crtc)
>   return -EINVAL;

Ok, that is simple to add. Prepared for v6.

So v6 is to be postponed by the patch for setting up =
regmap_config.max_register and the separation of the IPU driver so that =
it does not interfere.

BR and thanks for all comments,
Nikolaus

