Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C56EB14078
	for <lists+dri-devel@lfdr.de>; Mon, 28 Jul 2025 18:39:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6188110E54A;
	Mon, 28 Jul 2025 16:39:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.net header.i=wahrenst@gmx.net header.b="EbD7HHC5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F26BC10E546
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Jul 2025 16:39:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
 s=s31663417; t=1753720758; x=1754325558; i=wahrenst@gmx.net;
 bh=Uo+wi7F32b+OuCkEYGAkvcjZPWwzQp3pYwuNa/dSwo0=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=EbD7HHC5XomgSwVRRVRfmVLwK790kjmi+HP5DUtlz+205sxigJo2T/JyQgv+yJn0
 Znxtl1i+lHKpJJ8tUYlZ9aJWLwrvxNWytcpcB8+aR6bYF7XlwPWF6RIZUffX/w23f
 fuz2c+6p5tdiwg6lrL2sXW8CcStn6wi+izaNoKjiWWS02WK/JQIiG39HtjKIcFqEn
 YPzGkX3dOsQzRzSSi/jyzh+UFbyZWxcgiYNaOcFC/+n06tbdzBN7EIUNYnXsbsoK1
 p3dOkwVe1YxICB75NsM7kRHrS2Nd+2ZKclzyQZzrnYJfLKhQG+wHHI1XcNVx/zQHx
 YH+ttNq1VOjk9E/c6g==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.105] ([79.235.143.227]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MacSY-1u8kjC4C1y-00fcOm; Mon, 28
 Jul 2025 18:33:05 +0200
Message-ID: <673f3f05-53f1-4eb4-ae65-a3cd9ccbd1bf@gmx.net>
Date: Mon, 28 Jul 2025 18:33:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] clk: bcm: rpi: Turn firmware clock on/off when
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
References: <20250728-v3d-power-management-v1-0-780f922b1048@igalia.com>
 <20250728-v3d-power-management-v1-1-780f922b1048@igalia.com>
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
In-Reply-To: <20250728-v3d-power-management-v1-1-780f922b1048@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:CfHJDlPwu/n2c3qFUstxfBzfhZVf62Z+IUEFVR6d1N7F9sLtA0f
 nh8QTIxw9nbPKc8d9e4ts3y5pNsswDtSbNiZaKhSaMqXHTRsUi8Y+8QG6UH4K1Uzp/PUZ2S
 2RxW80Yi1bu+98uVTxKVd+IHEkhSHLGj6gBt0G3q07X7n3NIliiUGcGmrcxxmph3T4lG70I
 CoG841gVxNRdlLDHts0sA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:H48TcGbXeMo=;a9SjW52mMwLDMRYMtnhgN6q3Ykw
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

Hi Ma=C3=ADra,

thanks for working on this.

Am 28.07.25 um 14:35 schrieb Ma=C3=ADra Canal:
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
> with CLK_IGNORE_UNUSED or CLK_IS_CRITICAL, as those are required since
> early boot or are required during reboot.
>
> Link: https://github.com/raspberrypi/firmware/wiki/Mailbox-property-inte=
rface [1]
> Fixes: 93d2725affd6 ("clk: bcm: rpi: Discover the firmware clocks")
could you please explain from user perspective, which issue is fixed by=20
this patch?

Why does this needs to be backported?
> Signed-off-by: Ma=C3=ADra Canal <mcanal@igalia.com>
> ---
>   drivers/clk/bcm/clk-raspberrypi.c | 41 +++++++++++++++++++++++++++++++=
+++++++-
>   1 file changed, 40 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/clk/bcm/clk-raspberrypi.c b/drivers/clk/bcm/clk-ras=
pberrypi.c
> index 8e4fde03ed232b464165f524d27744b4ced93a60..a2bd5040283a2f456760bd68=
5e696b423985cac0 100644
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
> +		.flags =3D CLK_IGNORE_UNUSED,
>   	},
>   	[RPI_FIRMWARE_CORE_CLK_ID] =3D {
>   		.export =3D true,
> @@ -90,6 +92,7 @@ raspberrypi_clk_variants[RPI_FIRMWARE_NUM_CLK_ID] =3D =
{
>   		 * always use the minimum the drivers will let us.
>   		 */
>   		.minimize =3D true,
> +		.flags =3D CLK_IGNORE_UNUSED,
>   	},
>   	[RPI_FIRMWARE_M2MC_CLK_ID] =3D {
>   		.export =3D true,
> @@ -115,6 +118,7 @@ raspberrypi_clk_variants[RPI_FIRMWARE_NUM_CLK_ID] =
=3D {
>   		 * drivers will let us.
>   		 */
>   		.minimize =3D true,
> +		.flags =3D CLK_IGNORE_UNUSED,
>   	},
>   	[RPI_FIRMWARE_V3D_CLK_ID] =3D {
>   		.export =3D true,
> @@ -127,6 +131,7 @@ raspberrypi_clk_variants[RPI_FIRMWARE_NUM_CLK_ID] =
=3D {
>   	[RPI_FIRMWARE_HEVC_CLK_ID] =3D {
>   		.export =3D true,
>   		.minimize =3D true,
> +		.flags =3D CLK_IGNORE_UNUSED,
>   	},
>   	[RPI_FIRMWARE_ISP_CLK_ID] =3D {
>   		.export =3D true,
> @@ -135,6 +140,7 @@ raspberrypi_clk_variants[RPI_FIRMWARE_NUM_CLK_ID] =
=3D {
>   	[RPI_FIRMWARE_PIXEL_BVB_CLK_ID] =3D {
>   		.export =3D true,
>   		.minimize =3D true,
> +		.flags =3D CLK_IS_CRITICAL,
>   	},
>   	[RPI_FIRMWARE_VEC_CLK_ID] =3D {
>   		.export =3D true,
> @@ -259,7 +265,40 @@ static int raspberrypi_fw_dumb_determine_rate(struc=
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
> +		dev_err(rpi->dev, "Failed to set clock %d state to on: %d",
> +			data->id, ret);
I suggest to use dev_err_ratelimited for prepare/unprepare, otherwise=20
this could spam the kernel log.

Furthermore i wouldn't recommend to log some magic clock id. How about=20
using clk_hw_get_name(hw) instead?

Don't we need a newline character at the end?

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
> +		dev_err(rpi->dev, "Failed to set clock %d state to off: %d",
> +			data->id, ret);
see above

Best regards
> +}
> +
> +
>   static const struct clk_ops raspberrypi_firmware_clk_ops =3D {
> +	.prepare        =3D raspberrypi_fw_prepare,
> +	.unprepare      =3D raspberrypi_fw_unprepare,
>   	.is_prepared	=3D raspberrypi_fw_is_prepared,
>   	.recalc_rate	=3D raspberrypi_fw_get_rate,
>   	.determine_rate	=3D raspberrypi_fw_dumb_determine_rate,
> @@ -289,7 +328,7 @@ static struct clk_hw *raspberrypi_clk_register(struc=
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

