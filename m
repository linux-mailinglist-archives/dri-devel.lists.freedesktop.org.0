Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 22096BA3626
	for <lists+dri-devel@lfdr.de>; Fri, 26 Sep 2025 12:43:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7976610E34D;
	Fri, 26 Sep 2025 10:43:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.net header.i=wahrenst@gmx.net header.b="b/5QwCR3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17A3310E34C
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Sep 2025 10:43:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
 s=s31663417; t=1758883379; x=1759488179; i=wahrenst@gmx.net;
 bh=WNkD1K2RBkYayp44h1XfQoipSL3WE30xESe/2y5Vgrg=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=b/5QwCR3IZNXRgI9BAMSw91P0iJCNNrpMSQ6pygHnqRp8LZBLJyI+6HLEH6TbMgd
 HomLIWV06Ze/5XnOdTeOmP1Cj4WfK6I7wgxhZ9STT0qZsj8X2++DwfitULU7Q0lRH
 LM4bkLwjSM7sUaMunpIaPkCcSv2XYbhWwIfXn536furd1wnIB9xsiXkXpzbzxOS24
 hfP77/dYvb5FBLFLHi/H06vY9i1YqXT8M0+CWNBz5iBN2q1kM0d1LdA0SogoxgcBe
 Mevy4pJZ8g8lZ3ED6ccNteJsW/pJMWVAACzgZA/tLp3JqcL5fSUhcgi2r7W75q895
 KRmYwRfoj1a84QFlyA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.105] ([79.235.128.112]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MCKBm-1vAJIR2JOM-006muJ; Fri, 26
 Sep 2025 12:36:49 +0200
Message-ID: <c40880aa-ce14-41bc-a32f-7f46506a8909@gmx.net>
Date: Fri, 26 Sep 2025 12:36:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/5] clk: bcm: rpi: Turn firmware clock on/off when
 preparing/unpreparing
To: Marek Szyprowski <m.szyprowski@samsung.com>,
 =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Maxime Ripard <mripard@kernel.org>, Melissa Wen <mwen@igalia.com>,
 Iago Toral Quiroga <itoral@igalia.com>, Dom Cobley <popcornmix@gmail.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Philipp Zabel <p.zabel@pengutronix.de>
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
In-Reply-To: <1e5d1625-1326-4565-8407-71a58a91d230@samsung.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:nL0ZPpOgppdzQn/rYUMR66FxZRClQnbA5lECjbw6n2jS0CYKXTY
 HwRe01Syrrv9ckfr114xDoSDR+BKAUAHr1SmiBhHr8zEYh0hADhnEqoAmtquNB54k53J7z3
 dCdq8gfs4q5Q+YFk42ePGiI/uX1N/NUs7g9PWTpL0+j/Kzi6PTqEU+7oHsvNnqvHBUh9NcA
 HBDZ7nZBq87ikAh9K+jBw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:2LynqCVEGck=;iYDiyMICrCk53AeLx9Y66cwsczj
 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
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

Hi Marek,

Am 26.09.25 um 09:27 schrieb Marek Szyprowski:
> On 25.09.2025 18:48, Stefan Wahren wrote:
>> Am 25.09.25 um 09:57 schrieb Marek Szyprowski:
>>> On 31.07.2025 23:06, Ma=C3=ADra Canal wrote:
>>>> Currently, when we prepare or unprepare RPi's clocks, we don't actual=
ly
>>>> enable/disable the firmware clock. This means that
>>>> `clk_disable_unprepare()` doesn't actually change the clock state at
>>>> all, nor does it lowers the clock rate.
>>>>
>>>> >From the Mailbox Property Interface documentation [1], we can see th=
at
>>>> we should use `RPI_FIRMWARE_SET_CLOCK_STATE` to set the clock state
>>>> off/on. Therefore, use `RPI_FIRMWARE_SET_CLOCK_STATE` to create a
>>>> prepare and an unprepare hook for RPi's firmware clock.
>>>>
>>>> As now the clocks are actually turned off, some of them are now marke=
d
>>>> CLK_IS_CRITICAL, as those are required to be on during the whole syst=
em
>>>> operation.
>>>>
>>>> Link:https://github.com/raspberrypi/firmware/wiki/Mailbox-property-in=
terface
>>>> [1]
>>>> Signed-off-by: Ma=C3=ADra Canal<mcanal@igalia.com>
>>>>
>>>> ---
>>>>
>>>> About the pixel clock: currently, if we actually disable the pixel
>>>> clock during a hotplug, the system will crash. This happens in the
>>>> RPi 4.
>>>>
>>>> The crash happens after we disabled the CRTC (thus, the pixel clock),
>>>> but before the end of atomic commit tail. As vc4's pixel valve doesn'=
t
>>>> directly hold a reference to its clock =E2=80=93 we use the HDMI enco=
der to
>>>> manage the pixel clock =E2=80=93 I believe we might be disabling the =
clock
>>>> before we should.
>>>>
>>>> After this investigation, I decided to keep things as they current ar=
e:
>>>> the pixel clock is never disabled, as fixing it would go out of
>>>> the scope of this series.
>>>> ---
>>>>  =C2=A0=C2=A0 drivers/clk/bcm/clk-raspberrypi.c | 56
>>>> ++++++++++++++++++++++++++++++++++++++-
>>>>  =C2=A0=C2=A0 1 file changed, 55 insertions(+), 1 deletion(-)
>>> This patch landed recently in linux-next as commit 919d6924ae9b ("clk:
>>> bcm: rpi: Turn firmware clock on/off when preparing/unpreparing"). In =
my
>>> tests I found that it breaks booting of RaspberryPi3B+ board in ARM
>>> 32bit mode. Surprisingly the same board in ARM 64bit mode correctly
>>> boots a kernel compiled from the same source. The RPi3B+ board freezes
>>> after loading the DRM modules (kernel compiled from
>>> arm/multi_v7_defconfig):
>> thanks for spotting and bisecting this. Sorry, I only reviewed the
>> changes and didn't had the time to test any affected board.
>>
>> I was able to reproduce this issue and the following workaround avoid
>> the hang in my case:
>>
>> diff --git a/drivers/clk/bcm/clk-raspberrypi.c
>> b/drivers/clk/bcm/clk-raspberrypi.c
>> index 1a9162f0ae31..94fd4f6e2837 100644
>> --- a/drivers/clk/bcm/clk-raspberrypi.c
>> +++ b/drivers/clk/bcm/clk-raspberrypi.c
>> @@ -137,6 +137,7 @@ raspberrypi_clk_variants[RPI_FIRMWARE_NUM_CLK_ID] =
=3D {
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 [RPI_FIRMWARE_V3D_CLK_ID] =
=3D {
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 .export =3D true,
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 .maximize =3D true,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 .flags =3D CLK_IS_CRITICAL,
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 },
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 [RPI_FIRMWARE_PIXEL_CLK_ID]=
 =3D {
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 .export =3D true,
>>
> Right, this fixes (frankly speaking 'hides') the issue. Feel free to add=
:
>
> Reported-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
>
AFAIK the offending clock change isn't in the downstream kernel, so I=20
like to see the opinion of Mar=C3=ADa and the Raspberry Pi people first.

Currently I know that in the error case the following clocks are=20
disabled during boot of Raspberry Pi 3B+:
fw-clk-vec
fw-clk-isp
fw-clk-v3d

So it's very likely that the vc4 drivers tries to access the register=20
after the these clocks has been disabled and then the system freeze. The=
=20
workaround above was just a wild guess, so currently I don't know why=20
this change avoid the freeze.

Best regards
