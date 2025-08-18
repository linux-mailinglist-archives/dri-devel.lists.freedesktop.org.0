Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D687EB29FA3
	for <lists+dri-devel@lfdr.de>; Mon, 18 Aug 2025 12:52:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2F2510E428;
	Mon, 18 Aug 2025 10:51:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.net header.i=wahrenst@gmx.net header.b="aFhq5C3S";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A991C10E428
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Aug 2025 10:51:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
 s=s31663417; t=1755514309; x=1756119109; i=wahrenst@gmx.net;
 bh=EMQjlP0jqiiTFCiCqjpa9LEtzKzmxzTI2QJgAqC9ZnU=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=aFhq5C3SL0ZgB9EIlXQ5qWuMOG6Qchh6kcOWxOGESf1ICk6JZXAkXCSup8METNNi
 UF/9WoGaSmZ920dKElR2yghPlAZTlVkrytZNiaQJJjvpjvuPv0j5ZSfZERmBXwi9j
 41D/n0Wsytqa418D4rfzgRrGl17lCeOaWnVzakI5ZxOjhnIs+d8uZln7iuJBpvEMo
 C3WS2FmieDjzzFp6r+EHqiFxgbwUEBUnKWdOZC5kKSTBj8nosstPH6sIdmHvh2uPv
 dMVWgGDEclWBA4AQ0I7RV0L7K4w8Kbkirk9G/CkbPfCtjnUOnBVwJW590ul61Fw9S
 Wj5kDClVCTVv/m5rKQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.105] ([79.235.128.112]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MNbkp-1vBQXX3pJD-00U5ea; Mon, 18
 Aug 2025 12:51:49 +0200
Message-ID: <26680a60-e9f1-4c71-acc9-8c0fb8f6b032@gmx.net>
Date: Mon, 18 Aug 2025 12:51:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/5] clk: bcm: rpi: Turn firmware clock on/off when
 preparing/unpreparing
To: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
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
In-Reply-To: <20250731-v3d-power-management-v2-2-032d56b01964@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:bkRNX2xbcUoYi6qXTmYoLZNdvX4FH4Rpfp+EABXzBYcjMeczOKe
 o/g1+OPWOmSTsRoIuFgYiLKRzkAh9UYGY7BW1CN6EvhLbBJ2o4NjlwVXLsW8HDXSeSWwxjY
 G/OFGlxkZJNIc+2ajH9DmJ30nP3NDzielh8M1rm16vPGDR3tE7uFyNnUdHslCWkepcuFyrh
 GEmo1Qkc3YhJEX6SqPiDQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:NUSsT37lQxk=;BPt794qgQN0kPvcaXQnMNggTHmY
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

Hello Ma=C3=ADra,

Am 31.07.25 um 23:06 schrieb Ma=C3=ADra Canal:
> Currently, when we prepare or unprepare RPi's clocks, we don't actually
> enable/disable the firmware clock. This means that
> `clk_disable_unprepare()` doesn't actually change the clock state at
> all, nor does it lowers the clock rate.
>
>  From the Mailbox Property Interface documentation [1], we can see that
> we should use `RPI_FIRMWARE_SET_CLOCK_STATE` to set the clock state
> off/on. Therefore, use `RPI_FIRMWARE_SET_CLOCK_STATE` to create a
> prepare and an unprepare hook for RPi's firmware clock.
>
> As now the clocks are actually turned off, some of them are now marked
> CLK_IS_CRITICAL, as those are required to be on during the whole system
> operation.
>
> Link: https://github.com/raspberrypi/firmware/wiki/Mailbox-property-inte=
rface [1]
> Signed-off-by: Ma=C3=ADra Canal <mcanal@igalia.com>
sorry this late reply, but I was in the holidays.

In general the approach looks good to me. Very old vc4 firmware versions=
=20
doesn't support RPI_FIRMWARE_SET_CLOCK_STATE. I mention this because=20
sometimes the setups on kernelci.org are not always up to date. But I=20
think we should be save in this case.

Reviewed-by: Stefan Wahren <wahrenst@gmx.net>
>
> ---
>
> About the pixel clock: currently, if we actually disable the pixel
> clock during a hotplug, the system will crash. This happens in the
> RPi 4.
>
> The crash happens after we disabled the CRTC (thus, the pixel clock),
> but before the end of atomic commit tail. As vc4's pixel valve doesn't
> directly hold a reference to its clock =E2=80=93 we use the HDMI encoder=
 to
> manage the pixel clock =E2=80=93 I believe we might be disabling the clo=
ck
> before we should.
>
> After this investigation, I decided to keep things as they current are:
> the pixel clock is never disabled, as fixing it would go out of
> the scope of this series.
> ---
>   drivers/clk/bcm/clk-raspberrypi.c | 56 +++++++++++++++++++++++++++++++=
+++++++-
>   1 file changed, 55 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/clk/bcm/clk-raspberrypi.c b/drivers/clk/bcm/clk-ras=
pberrypi.c
> index 166d0bec380310e8b98f91568efa4aa88401af4f..70acfa68827d84670c645bed=
d17bf0e181aadfbb 100644
> --- a/drivers/clk/bcm/clk-raspberrypi.c
> +++ b/drivers/clk/bcm/clk-raspberrypi.c
> @@ -68,6 +68,7 @@ struct raspberrypi_clk_variant {
>   	char		*clkdev;
>   	unsigned long	min_rate;
>   	bool		minimize;
> +	u32		flags;
>   };
>  =20
>   static struct raspberrypi_clk_variant
> @@ -75,6 +76,7 @@ raspberrypi_clk_variants[RPI_FIRMWARE_NUM_CLK_ID] =3D =
{
>   	[RPI_FIRMWARE_ARM_CLK_ID] =3D {
>   		.export =3D true,
>   		.clkdev =3D "cpu0",
> +		.flags =3D CLK_IS_CRITICAL,
>   	},
>   	[RPI_FIRMWARE_CORE_CLK_ID] =3D {
>   		.export =3D true,
> @@ -90,6 +92,12 @@ raspberrypi_clk_variants[RPI_FIRMWARE_NUM_CLK_ID] =3D=
 {
>   		 * always use the minimum the drivers will let us.
>   		 */
>   		.minimize =3D true,
> +
> +		/*
> +		 * It should never be disabled as it drives the bus for
> +		 * everything else.
> +		 */
> +		.flags =3D CLK_IS_CRITICAL,
>   	},
>   	[RPI_FIRMWARE_M2MC_CLK_ID] =3D {
>   		.export =3D true,
> @@ -115,6 +123,15 @@ raspberrypi_clk_variants[RPI_FIRMWARE_NUM_CLK_ID] =
=3D {
>   		 * drivers will let us.
>   		 */
>   		.minimize =3D true,
> +
> +		/*
> +		 * As mentioned above, this clock is disabled during boot,
> +		 * the firmware will skip the HSM initialization, resulting
> +		 * in a bus lockup. Therefore, make sure it's enabled
> +		 * during boot, but after it, it can be enabled/disabled
> +		 * by the driver.
> +		 */
> +		.flags =3D CLK_IGNORE_UNUSED,
>   	},
>   	[RPI_FIRMWARE_V3D_CLK_ID] =3D {
>   		.export =3D true,
> @@ -123,10 +140,12 @@ raspberrypi_clk_variants[RPI_FIRMWARE_NUM_CLK_ID] =
=3D {
>   	[RPI_FIRMWARE_PIXEL_CLK_ID] =3D {
>   		.export =3D true,
>   		.minimize =3D true,
> +		.flags =3D CLK_IS_CRITICAL,
>   	},
>   	[RPI_FIRMWARE_HEVC_CLK_ID] =3D {
>   		.export =3D true,
>   		.minimize =3D true,
> +		.flags =3D CLK_IS_CRITICAL,
>   	},
>   	[RPI_FIRMWARE_ISP_CLK_ID] =3D {
>   		.export =3D true,
> @@ -135,6 +154,7 @@ raspberrypi_clk_variants[RPI_FIRMWARE_NUM_CLK_ID] =
=3D {
>   	[RPI_FIRMWARE_PIXEL_BVB_CLK_ID] =3D {
>   		.export =3D true,
>   		.minimize =3D true,
> +		.flags =3D CLK_IS_CRITICAL,
>   	},
>   	[RPI_FIRMWARE_VEC_CLK_ID] =3D {
>   		.export =3D true,
> @@ -265,7 +285,41 @@ static int raspberrypi_fw_dumb_determine_rate(struc=
t clk_hw *hw,
>   	return 0;
>   }
>  =20
> +static int raspberrypi_fw_prepare(struct clk_hw *hw)
> +{
> +	const struct raspberrypi_clk_data *data =3D clk_hw_to_data(hw);
> +	struct raspberrypi_clk *rpi =3D data->rpi;
> +	u32 state =3D RPI_FIRMWARE_STATE_ENABLE_BIT;
> +	int ret;
> +
> +	ret =3D raspberrypi_clock_property(rpi->firmware, data,
> +					 RPI_FIRMWARE_SET_CLOCK_STATE, &state);
> +	if (ret)
> +		dev_err_ratelimited(rpi->dev,
> +				    "Failed to set clock %s state to on: %d\n",
> +				    clk_hw_get_name(hw), ret);
> +
> +	return ret;
> +}
> +
> +static void raspberrypi_fw_unprepare(struct clk_hw *hw)
> +{
> +	const struct raspberrypi_clk_data *data =3D clk_hw_to_data(hw);
> +	struct raspberrypi_clk *rpi =3D data->rpi;
> +	u32 state =3D 0;
> +	int ret;
> +
> +	ret =3D raspberrypi_clock_property(rpi->firmware, data,
> +					 RPI_FIRMWARE_SET_CLOCK_STATE, &state);
> +	if (ret)
> +		dev_err_ratelimited(rpi->dev,
> +				    "Failed to set clock %s state to off: %d\n",
> +				    clk_hw_get_name(hw), ret);
> +}
> +
>   static const struct clk_ops raspberrypi_firmware_clk_ops =3D {
> +	.prepare        =3D raspberrypi_fw_prepare,
> +	.unprepare      =3D raspberrypi_fw_unprepare,
>   	.is_prepared	=3D raspberrypi_fw_is_prepared,
>   	.recalc_rate	=3D raspberrypi_fw_get_rate,
>   	.determine_rate	=3D raspberrypi_fw_dumb_determine_rate,
> @@ -295,7 +349,7 @@ static struct clk_hw *raspberrypi_clk_register(struc=
t raspberrypi_clk *rpi,
>   	if (!init.name)
>   		return ERR_PTR(-ENOMEM);
>   	init.ops =3D &raspberrypi_firmware_clk_ops;
> -	init.flags =3D CLK_GET_RATE_NOCACHE;
> +	init.flags =3D variant->flags | CLK_GET_RATE_NOCACHE;
>  =20
>   	data->hw.init =3D &init;
>  =20
>

