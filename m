Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DAED42325C
	for <lists+dri-devel@lfdr.de>; Tue,  5 Oct 2021 22:50:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3DBD6EC5B;
	Tue,  5 Oct 2021 20:50:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EC036EC5B
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Oct 2021 20:50:26 +0000 (UTC)
Date: Tue, 05 Oct 2021 21:50:12 +0100
From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v5 5/7] MIPS: DTS: jz4780: Account for Synopsys HDMI
 driver and LCD controllers
To: "H. Nikolaus Schaller" <hns@goldelico.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Geert Uytterhoeven
 <geert+renesas@glider.be>, Kees Cook <keescook@chromium.org>,
 "Eric W. Biederman" <ebiederm@xmission.com>, Miquel Raynal
 <miquel.raynal@bootlin.com>, David Airlie <airlied@linux.ie>, Daniel Vetter
 <daniel@ffwll.ch>, Andrzej Hajda <a.hajda@samsung.com>, Neil Armstrong
 <narmstrong@baylibre.com>, Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jernej Skrabec
 <jernej.skrabec@gmail.com>, Ezequiel Garcia <ezequiel@collabora.com>,
 Harry Wentland <harry.wentland@amd.com>, Sam Ravnborg <sam@ravnborg.org>,
 Maxime Ripard <maxime@cerno.tech>, Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Paul Boddie <paul@boddie.org.uk>, devicetree@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
 letux-kernel@openphoenux.org, Jonas Karlman <jonas@kwiboo.se>,
 dri-devel@lists.freedesktop.org
Message-Id: <O7VI0R.CRIG8R7O0OOI3@crapouillou.net>
In-Reply-To: <c243176cb5e5a3ab5df1fe77f9246b6d5ec4f88e.1633436959.git.hns@goldelico.com>
References: <cover.1633436959.git.hns@goldelico.com>
 <c243176cb5e5a3ab5df1fe77f9246b6d5ec4f88e.1633436959.git.hns@goldelico.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Nikolaus & Paul,

Le mar., oct. 5 2021 at 14:29:17 +0200, H. Nikolaus Schaller=20
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
>  arch/mips/boot/dts/ingenic/jz4780.dtsi | 45=20
> ++++++++++++++++++++++++++
>  1 file changed, 45 insertions(+)
>=20
> diff --git a/arch/mips/boot/dts/ingenic/jz4780.dtsi=20
> b/arch/mips/boot/dts/ingenic/jz4780.dtsi
> index 9e34f433b9b5..c3c18a59c377 100644
> --- a/arch/mips/boot/dts/ingenic/jz4780.dtsi
> +++ b/arch/mips/boot/dts/ingenic/jz4780.dtsi
> @@ -424,6 +424,51 @@ i2c4: i2c@10054000 {
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
> +		assigned-clocks =3D <&cgu JZ4780_CLK_HDMI>;
> +		assigned-clock-rates =3D <27000000>;

Any reason why this is set to 27 MHz? Is it even required? Because with=20
the current ci20.dts, it won't be clocked at anything but 48 MHz.

> +
> +		interrupt-parent =3D <&intc>;
> +		interrupts =3D <3>;
> +
> +		/* ddc-i2c-bus =3D <&i2c4>; */
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

I think you can keep lcdc0 enabled by default (not lcdc1 though), since=20
it is highly likely that you'd want that.

Cheers,
-Paul

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


