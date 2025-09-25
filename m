Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 628F0BA0B17
	for <lists+dri-devel@lfdr.de>; Thu, 25 Sep 2025 18:49:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 671E110E2C8;
	Thu, 25 Sep 2025 16:49:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.net header.i=wahrenst@gmx.net header.b="WOPP3BAm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C2F310E2C8
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Sep 2025 16:49:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
 s=s31663417; t=1758818938; x=1759423738; i=wahrenst@gmx.net;
 bh=qAB5fCbImxbWKqC5kSCNa6OVcD9HGKAsAhKkjlUJPf8=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:From:Subject:To:
 Cc:References:In-Reply-To:Content-Type:Content-Transfer-Encoding:
 cc:content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=WOPP3BAmkbuo0wRp1hV9Ckdht9sGCnSmNJpyVqith6weWcEBG9Fhq1MdxXgvHPy2
 kOE/MP7/SgM7dw/oT8MvF11W3jTkyU994rRpdupXZmMAIHZWDuWhsgO4S2dY8Bv90
 KaBVKdN//Rn/oa7eV3G8ckoVo1ztmCEU+CGC8xVXHsW8CcrumWmuDeA4ucgNAUsPM
 u6az/NvEVBhVhrbDB03PYc+4MGlbwcgSadoWumNKqWFiyDt0sHTBT3ZJV8sGppzak
 A0hB2h+Dut6kKqW2qsWnYRlCB1D6j8wlbJGxYoooeCpDL7kFxXMXobGCA9WrSfrvy
 bl37vfL0garf337kig==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.105] ([79.235.128.112]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MCbEf-1vArYg3EOp-00Dz9h; Thu, 25
 Sep 2025 18:48:57 +0200
Message-ID: <2b1537c1-93e4-4c6c-8554-a2d877759201@gmx.net>
Date: Thu, 25 Sep 2025 18:48:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Stefan Wahren <wahrenst@gmx.net>
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
Content-Language: en-US
In-Reply-To: <727aa0c8-2981-4662-adf3-69cac2da956d@samsung.com>
Autocrypt: addr=wahrenst@gmx.net; keydata=
 xjMEZ1dOJBYJKwYBBAHaRw8BAQdA7H2MMG3q8FV7kAPko5vOAeaa4UA1I0hMgga1j5iYTTvN
 IFN0ZWZhbiBXYWhyZW4gPHdhaHJlbnN0QGdteC5uZXQ+wo8EExYIADcWIQT3FXg+ApsOhPDN
 NNFuwvLLwiAwigUCZ1dOJAUJB4TOAAIbAwQLCQgHBRUICQoLBRYCAwEAAAoJEG7C8svCIDCK
 JQ4BAP4Y9uuHAxbAhHSQf6UZ+hl5BDznsZVBJvH8cZe2dSZ6AQCNgoc1Lxw1tvPscuC1Jd1C
 TZomrGfQI47OiiJ3vGktBc44BGdXTiQSCisGAQQBl1UBBQEBB0B5M0B2E2XxySUQhU6emMYx
 f5QR/BrEK0hs3bLT6Hb9WgMBCAfCfgQYFggAJhYhBPcVeD4Cmw6E8M000W7C8svCIDCKBQJn
 V04kBQkHhM4AAhsMAAoJEG7C8svCIDCKJxoA/i+kqD5bphZEucrJHw77ujnOQbiKY2rLb0pE
 aHMQoiECAQDVbj827W1Yai/0XEABIr8Ci6a+/qZ8Vz6MZzL5GJosAA==
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:vK/3jwWQSWRm+cM68enplxHonquAxewZuzQT268aklvpjruAtRA
 KfYwkQr7j+CVQlCPyu9j3CajO88+6q0fju/nZEsJLDfx9mu7VZdGJm01TOgvfTU8BVEVn3U
 DXWo1jeA2ox6tGa9P2Y9bN3wXeFOPCC9zIyDQxg+9XZFVV1qKz1WELc1+0n4DelQ2ylSUvB
 CXGG0mjAsgJ2F+SEkfPqw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:Jt7cFrm8MRI=;q5226w5oPvfS5DC1ArORjZUHGmX
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

Hi,

Am 25.09.25 um 09:57 schrieb Marek Szyprowski:
> On 31.07.2025 23:06, Ma=C3=ADra Canal wrote:
>> Currently, when we prepare or unprepare RPi's clocks, we don't actually
>> enable/disable the firmware clock. This means that
>> `clk_disable_unprepare()` doesn't actually change the clock state at
>> all, nor does it lowers the clock rate.
>>
>> >From the Mailbox Property Interface documentation [1], we can see that
>> we should use `RPI_FIRMWARE_SET_CLOCK_STATE` to set the clock state
>> off/on. Therefore, use `RPI_FIRMWARE_SET_CLOCK_STATE` to create a
>> prepare and an unprepare hook for RPi's firmware clock.
>>
>> As now the clocks are actually turned off, some of them are now marked
>> CLK_IS_CRITICAL, as those are required to be on during the whole system
>> operation.
>>
>> Link:https://github.com/raspberrypi/firmware/wiki/Mailbox-property-inte=
rface [1]
>> Signed-off-by: Ma=C3=ADra Canal<mcanal@igalia.com>
>>
>> ---
>>
>> About the pixel clock: currently, if we actually disable the pixel
>> clock during a hotplug, the system will crash. This happens in the
>> RPi 4.
>>
>> The crash happens after we disabled the CRTC (thus, the pixel clock),
>> but before the end of atomic commit tail. As vc4's pixel valve doesn't
>> directly hold a reference to its clock =E2=80=93 we use the HDMI encode=
r to
>> manage the pixel clock =E2=80=93 I believe we might be disabling the cl=
ock
>> before we should.
>>
>> After this investigation, I decided to keep things as they current are:
>> the pixel clock is never disabled, as fixing it would go out of
>> the scope of this series.
>> ---
>>    drivers/clk/bcm/clk-raspberrypi.c | 56 +++++++++++++++++++++++++++++=
+++++++++-
>>    1 file changed, 55 insertions(+), 1 deletion(-)
> This patch landed recently in linux-next as commit 919d6924ae9b ("clk:
> bcm: rpi: Turn firmware clock on/off when preparing/unpreparing"). In my
> tests I found that it breaks booting of RaspberryPi3B+ board in ARM
> 32bit mode. Surprisingly the same board in ARM 64bit mode correctly
> boots a kernel compiled from the same source. The RPi3B+ board freezes
> after loading the DRM modules (kernel compiled from arm/multi_v7_defconf=
ig):
thanks for spotting and bisecting this. Sorry, I only reviewed the=20
changes and didn't had the time to test any affected board.

I was able to reproduce this issue and the following workaround avoid=20
the hang in my case:

diff --git a/drivers/clk/bcm/clk-raspberrypi.c=20
b/drivers/clk/bcm/clk-raspberrypi.c
index 1a9162f0ae31..94fd4f6e2837 100644
=2D-- a/drivers/clk/bcm/clk-raspberrypi.c
+++ b/drivers/clk/bcm/clk-raspberrypi.c
@@ -137,6 +137,7 @@ raspberrypi_clk_variants[RPI_FIRMWARE_NUM_CLK_ID] =3D =
{
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 [RPI_FIRMWARE_V3D_CLK_ID] =3D =
{
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 .export =3D true,
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 .maximize =3D true,
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 .flags =3D CLK_IS_CRITICAL,
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 },
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 [RPI_FIRMWARE_PIXEL_CLK_ID] =
=3D {
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 .export =3D true,

The proper fix should be in the clock consumer drivers. I found that=20
vc4_v3d doesn't ensure that the clock is enabled before accessing the=20
registers. Unfortunately the following change doesn't fix the issue for=20
me :-(

diff --git a/drivers/gpu/drm/vc4/vc4_v3d.c b/drivers/gpu/drm/vc4/vc4_v3d.c
index bb09df5000bd..5e43523732b4 100644
=2D-- a/drivers/gpu/drm/vc4/vc4_v3d.c
+++ b/drivers/gpu/drm/vc4/vc4_v3d.c
@@ -441,7 +441,7 @@ static int vc4_v3d_bind(struct device *dev, struct=20
device *master, void *data)
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vc4->v3d =3D v3d;
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 v3d->vc4 =3D vc4;

-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 v3d->clk =3D devm_clk_get_optional(d=
ev, NULL);
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 v3d->clk =3D devm_clk_get_optional_e=
nabled(dev, NULL);
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (IS_ERR(v3d->clk))
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 return dev_err_probe(dev, PTR_ERR(v3d->clk), "Failed to=
=20
get V3D clock\n");

Best regards

