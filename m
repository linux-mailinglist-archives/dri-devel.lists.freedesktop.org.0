Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C3AA4511C2
	for <lists+dri-devel@lfdr.de>; Mon, 15 Nov 2021 20:11:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 870C76E570;
	Mon, 15 Nov 2021 19:11:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F157E6E570
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Nov 2021 19:11:53 +0000 (UTC)
Date: Mon, 15 Nov 2021 19:11:39 +0000
From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v6 5/8] MIPS: DTS: jz4780: Account for Synopsys HDMI
 driver and LCD controllers
To: "H. Nikolaus Schaller" <hns@goldelico.com>
Message-Id: <FZNM2R.PEN9N8R45O3F2@crapouillou.net>
In-Reply-To: <c9f9fc1d5b796b7a78e7e27849abb435c6bcbc43.1636573413.git.hns@goldelico.com>
References: <cover.1636573413.git.hns@goldelico.com>
 <c9f9fc1d5b796b7a78e7e27849abb435c6bcbc43.1636573413.git.hns@goldelico.com>
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
 Mark Brown <broonie@kernel.org>, Maxime Ripard <maxime@cerno.tech>,
 letux-kernel@openphoenux.org, Ezequiel Garcia <ezequiel@collabora.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Liam Girdwood <lgirdwood@gmail.com>, Robert Foss <robert.foss@linaro.org>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 "Eric W. Biederman" <ebiederm@xmission.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Nikolaus,

Le mer., nov. 10 2021 at 20:43:30 +0100, H. Nikolaus Schaller=20
<hns@goldelico.com> a =E9crit :
> From: Paul Boddie <paul@boddie.org.uk>
>=20
> A specialisation of the generic Synopsys HDMI driver is employed for=20
> JZ4780
> HDMI support. This requires a new driver, plus device tree and=20
> configuration
> modifications.
>=20
> Signed-off-by: Paul Boddie <paul@boddie.org.uk>
> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
> ---
>  arch/mips/boot/dts/ingenic/jz4780.dtsi | 40=20
> ++++++++++++++++++++++++++
>  1 file changed, 40 insertions(+)
>=20
> diff --git a/arch/mips/boot/dts/ingenic/jz4780.dtsi=20
> b/arch/mips/boot/dts/ingenic/jz4780.dtsi
> index 9e34f433b9b58..98cc3360bbbb9 100644
> --- a/arch/mips/boot/dts/ingenic/jz4780.dtsi
> +++ b/arch/mips/boot/dts/ingenic/jz4780.dtsi
> @@ -424,6 +424,46 @@ i2c4: i2c@10054000 {
>  		status =3D "disabled";
>  	};
>=20
> +	hdmi: hdmi@10180000 {
> +		compatible =3D "ingenic,jz4780-dw-hdmi";
> +		reg =3D <0x10180000 0x8000>;
> +		reg-io-width =3D <4>;
> +
> +		clocks =3D <&cgu JZ4780_CLK_AHB0>, <&cgu JZ4780_CLK_HDMI>;
> +		clock-names =3D "iahb", "isfr";
> +
> +		interrupt-parent =3D <&intc>;
> +		interrupts =3D <3>;
> +
> +		status =3D "disabled";
> +	};
> +
> +	lcdc0: lcdc0@13050000 {
> +		compatible =3D "ingenic,jz4780-lcd";
> +		reg =3D <0x13050000 0x1800>;
> +
> +		clocks =3D <&cgu JZ4780_CLK_TVE>, <&cgu JZ4780_CLK_LCD0PIXCLK>;
> +		clock-names =3D "lcd", "lcd_pclk";
> +
> +		interrupt-parent =3D <&intc>;
> +		interrupts =3D <31>;
> +
> +		status =3D "disabled";
> +	};
> +
> +	lcdc1: lcdc1@130a0000 {
> +		compatible =3D "ingenic,jz4780-lcd";
> +		reg =3D <0x130a0000 0x1800>;
> +
> +		clocks =3D <&cgu JZ4780_CLK_TVE>, <&cgu JZ4780_CLK_LCD1PIXCLK>;
> +		clock-names =3D "lcd", "lcd_pclk";
> +
> +		interrupt-parent =3D <&intc>;
> +		interrupts =3D <31>;

You have the two LCD controllers wired to the same interrupt, that=20
can't be right.

 From what I can read in the PM the LCD1 IRQ is number 23.

Cheers,
-Paul

> +
> +		status =3D "disabled";
> +	};
> +
>  	nemc: nemc@13410000 {
>  		compatible =3D "ingenic,jz4780-nemc", "simple-mfd";
>  		reg =3D <0x13410000 0x10000>;
> --
> 2.33.0
>=20


