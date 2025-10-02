Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B9E2BB43C8
	for <lists+dri-devel@lfdr.de>; Thu, 02 Oct 2025 16:58:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C5FC10E1BA;
	Thu,  2 Oct 2025 14:58:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.net header.i=wahrenst@gmx.net header.b="M2DpLDoz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 365 seconds by postgrey-1.36 at gabe;
 Thu, 02 Oct 2025 14:58:46 UTC
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18BB310E1B8
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Oct 2025 14:58:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
 s=s31663417; t=1759417124; x=1760021924; i=wahrenst@gmx.net;
 bh=pMvKyWMAfvVJZXrB9tMwBbl2Q4B77sukmT1yQNyOOls=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=M2DpLDoz5Qdul2oEjknQ/wajdqLeEH5Lf+ISuryrfO5ViMTyyb164EOtrJjTSQ7b
 JNlW3WhFMhapJn4K0+k4U0ScXRMc/ep0GgvE1bQj2I0pcgTkRklS5lMCBY6QHBuGI
 LpAmSl0U5OTxV1/tmq+KAQTckUZ1SokGll8eMqIW6yr4URoY/0PO5a/8oHzE4enLx
 w9SwNjYwt0E1argMVkW3WF3/DbZxjefrrb1Dw3BTDF7UEgHfPtRofvArYATA77gdd
 lPu+F7k3XSY00Je/VCzvYtnJ6u5Edsdbws6nMtRJLnWde3kYOiW0CQ7PG1DLxMyVP
 g6WIFDf8OS7l7uUK/w==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.156] ([79.235.128.112]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MRmfo-1ustgF1Bog-00Y1HL; Thu, 02
 Oct 2025 16:52:29 +0200
Message-ID: <2f9b3cf4-15f1-4a2a-b0d0-90418f5af8b3@gmx.net>
Date: Thu, 2 Oct 2025 16:52:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/5] clk: bcm: rpi: Turn firmware clock on/off when
 preparing/unpreparing
To: Melissa Wen <mwen@igalia.com>, Marek Szyprowski
 <m.szyprowski@samsung.com>, =?UTF-8?Q?Ma=C3=ADra_Canal?=
 <mcanal@igalia.com>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Maxime Ripard <mripard@kernel.org>, Iago Toral Quiroga <itoral@igalia.com>,
 Dom Cobley <popcornmix@gmail.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Phil Elwell <phil@raspberrypi.com>
Cc: linux-clk@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, kernel-dev@igalia.com
References: <20250731-v3d-power-management-v2-0-032d56b01964@igalia.com>
 <20250731-v3d-power-management-v2-2-032d56b01964@igalia.com>
 <CGME20250925075711eucas1p26efbb194311a6e22ab593a39b43e12c3@eucas1p2.samsung.com>
 <727aa0c8-2981-4662-adf3-69cac2da956d@samsung.com>
 <2b1537c1-93e4-4c6c-8554-a2d877759201@gmx.net>
 <1e5d1625-1326-4565-8407-71a58a91d230@samsung.com>
 <c40880aa-ce14-41bc-a32f-7f46506a8909@gmx.net>
 <ca9605fc-79da-43c1-9146-3638cd5791c4@igalia.com>
Content-Language: en-US
From: Stefan Wahren <wahrenst@gmx.net>
Autocrypt: addr=wahrenst@gmx.net; keydata=
 xjMEZ1dOJBYJKwYBBAHaRw8BAQdA7H2MMG3q8FV7kAPko5vOAeaa4UA1I0hMgga1j5iYTTvN
 IFN0ZWZhbiBXYWhyZW4gPHdhaHJlbnN0QGdteC5uZXQ+wo8EExYIADcWIQT3FXg+ApsOhPDN
 NNFuwvLLwiAwigUCZ1dOJAUJB4TOAAIbAwQLCQgHBRUICQoLBRYCAwEAAAoJEG7C8svCIDCK
 JQ4BAP4Y9uuHAxbAhHSQf6UZ+hl5BDznsZVBJvH8cZe2dSZ6AQCNgoc1Lxw1tvPscuC1Jd1C
 TZomrGfQI47OiiJ3vGktBc44BGdXTiQSCisGAQQBl1UBBQEBB0B5M0B2E2XxySUQhU6emMYx
 f5QR/BrEK0hs3bLT6Hb9WgMBCAfCfgQYFggAJhYhBPcVeD4Cmw6E8M000W7C8svCIDCKBQJn
 V04kBQkHhM4AAhsMAAoJEG7C8svCIDCKJxoA/i+kqD5bphZEucrJHw77ujnOQbiKY2rLb0pE
 aHMQoiECAQDVbj827W1Yai/0XEABIr8Ci6a+/qZ8Vz6MZzL5GJosAA==
In-Reply-To: <ca9605fc-79da-43c1-9146-3638cd5791c4@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:75VaADtUIMD2c9qFLtO0fs1H9Gd4KKwZI/hUFEPyNCm7+tfTNlu
 pHiW/puNslzGi+N/nQhMPu/7bwbAM4vx+MuAmWIRMy3SpSKJznz6gjus/CwQoa6mbnbQBTF
 hXIuxIeqE3tUACNvpmyUy+Xy6sK6kGdnEdCXbqUXt4UveH5vrqYZhTJQxHRvdAORvG50kQI
 +OU4BJqf34bvZe93hbbBA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:YJ9iGmfssuY=;3nO8ckOkiR5Ep4uGp8jGbH0mlXW
 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
 iacWd+GhQlUw6Oj04=
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

Hi,

Am 01.10.25 um 22:50 schrieb Melissa Wen:
>
>
> On 26/09/2025 07:36, Stefan Wahren wrote:
>> Hi Marek,
>>
>> ....
>> AFAIK the offending clock change isn't in the downstream kernel, so I=
=20
>> like to see the opinion of Mar=C3=ADa and the Raspberry Pi people first=
.
>
> Hi,
>
> I see in the downstream kernel the CLOCK_V3D was removed in favor of=20
> firmware clock:
> https://github.com/raspberrypi/linux/blob/rpi-6.12.y/drivers/clk/bcm/clk=
-bcm2835.c#L2076=20
>
>
> Also, v3d in RPi4 is set to use the firmware clock:
> https://github.com/torvalds/linux/blob/master/arch/arm/boot/dts/broadcom=
/bcm2711-rpi.dtsi#L97=20
>
>
> I think v3d clock is missed on boot, but I also think the issue should=
=20
> be solved by setting the v3d firmware clock for Pi3.
> WDYT? Can you check it on your side? Something like:
>
> diff --git a/arch/arm/boot/dts/broadcom/bcm2835-rpi-common.dtsi=20
> b/arch/arm/boot/dts/broadcom/bcm2835-rpi-common.dtsi
> index 8b3c21d9f333..3289cb5dfa8e 100644
> --- a/arch/arm/boot/dts/broadcom/bcm2835-rpi-common.dtsi
> +++ b/arch/arm/boot/dts/broadcom/bcm2835-rpi-common.dtsi
> @@ -14,6 +14,7 @@ &hdmi {
> =C2=A0};
>
> =C2=A0&v3d {
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 clocks =3D <&firmware_clocks 5>;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 power-domains =3D <&power RPI=
_POWER_DOMAIN_V3D>;
> =C2=A0};
thanks for pointing out. Handling the same clock by clk-raspberrypi and=20
clk-bcm2835 is a very bad idea. But it looks like that's not the only=20
affected clock. I see at least ISP and VEC, which might be affected.

Does anyone know, if the clk-raspberrypi always use a matching clock=20
name in comparison to the clk-bcm2835?
clk-bcm2835 - clk-raspberrypi
BCM2835_CLOCK_V3D equals to RPI_FIRMWARE_V3D_CLK_ID
BCM2835_CLOCK_ISP equals to RPI_FIRMWARE_ISP_CLK_ID
...
Or are there any clocks, which have different names in both drivers but=20
describe the same hardware clock?

Best regards
>
> Best regards,
>
> Melissa
>
>>
>> Currently I know that in the error case the following clocks are=20
>> disabled during boot of Raspberry Pi 3B+:
>> fw-clk-vec
>> fw-clk-isp
>> fw-clk-v3d
>>
>> So it's very likely that the vc4 drivers tries to access the register=
=20
>> after the these clocks has been disabled and then the system freeze.=20
>> The workaround above was just a wild guess, so currently I don't know=
=20
>> why this change avoid the freeze.
>>
>> Best regards
>

