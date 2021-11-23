Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F1BC45AD17
	for <lists+dri-devel@lfdr.de>; Tue, 23 Nov 2021 21:10:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DC2289DC1;
	Tue, 23 Nov 2021 20:10:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96D6A89DC1
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Nov 2021 20:10:21 +0000 (UTC)
Date: Tue, 23 Nov 2021 20:10:00 +0000
From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v8 6/8] MIPS: DTS: CI20: Add DT nodes for HDMI setup
To: "H. Nikolaus Schaller" <hns@goldelico.com>
Message-Id: <O0K13R.TIL3JBQ5L8TO1@crapouillou.net>
In-Reply-To: <d62023e0872e9b393db736f4a0ecf04b3fc1c91b.1637691240.git.hns@goldelico.com>
References: <cover.1637691240.git.hns@goldelico.com>
 <d62023e0872e9b393db736f4a0ecf04b3fc1c91b.1637691240.git.hns@goldelico.com>
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

Le mar., nov. 23 2021 at 19:13:59 +0100, H. Nikolaus Schaller=20
<hns@goldelico.com> a =E9crit :
> From: Paul Boddie <paul@boddie.org.uk>
>=20
> We need to hook up
> * HDMI connector
> * HDMI power regulator
> * JZ4780_CLK_HDMI @ 27 MHz
> * DDC pinmux
> * HDMI and LCDC endpoint connections
>=20
> Signed-off-by: Paul Boddie <paul@boddie.org.uk>
> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
> ---
>  arch/mips/boot/dts/ingenic/ci20.dts | 83=20
> +++++++++++++++++++++++++++--
>  1 file changed, 80 insertions(+), 3 deletions(-)
>=20
> diff --git a/arch/mips/boot/dts/ingenic/ci20.dts=20
> b/arch/mips/boot/dts/ingenic/ci20.dts
> index b249a4f0f6b62..15cf03670693f 100644
> --- a/arch/mips/boot/dts/ingenic/ci20.dts
> +++ b/arch/mips/boot/dts/ingenic/ci20.dts
> @@ -78,6 +78,18 @@ eth0_power: fixedregulator@0 {
>  		enable-active-high;
>  	};
>=20
> +	hdmi_out: connector {
> +		compatible =3D "hdmi-connector";
> +		label =3D "HDMI OUT";
> +		type =3D "a";
> +
> +		port {
> +			hdmi_con: endpoint {
> +				remote-endpoint =3D <&dw_hdmi_out>;
> +			};
> +		};
> +	};
> +
>  	ir: ir {
>  		compatible =3D "gpio-ir-receiver";
>  		gpios =3D <&gpe 3 GPIO_ACTIVE_LOW>;
> @@ -102,6 +114,17 @@ otg_power: fixedregulator@2 {
>  		gpio =3D <&gpf 14 GPIO_ACTIVE_LOW>;
>  		enable-active-high;
>  	};
> +
> +	hdmi_power: fixedregulator@3 {
> +		compatible =3D "regulator-fixed";
> +
> +		regulator-name =3D "hdmi_power";
> +		regulator-min-microvolt =3D <5000000>;
> +		regulator-max-microvolt =3D <5000000>;
> +
> +		gpio =3D <&gpa 25 0>;
> +		enable-active-high;
> +	};
>  };
>=20
>  &ext {
> @@ -114,11 +137,13 @@ &cgu {
>  	 * precision.
>  	 */
>  	assigned-clocks =3D <&cgu JZ4780_CLK_OTGPHY>, <&cgu JZ4780_CLK_RTC>,
> -			  <&cgu JZ4780_CLK_SSIPLL>, <&cgu JZ4780_CLK_SSI>;
> +			  <&cgu JZ4780_CLK_SSIPLL>, <&cgu JZ4780_CLK_SSI>,
> +			  <&cgu JZ4780_CLK_HDMI>;
>  	assigned-clock-parents =3D <0>, <&cgu JZ4780_CLK_RTCLK>,
>  				 <&cgu JZ4780_CLK_MPLL>,
> -				 <&cgu JZ4780_CLK_SSIPLL>;
> -	assigned-clock-rates =3D <48000000>, <0>, <54000000>;
> +				 <&cgu JZ4780_CLK_SSIPLL>,
> +				 <0>;

Nit - you can remove the last <0>, it will be the default.

> +	assigned-clock-rates =3D <48000000>, <0>, <54000000>, <0>, <27000000>;
>  };
>=20
>  &tcu {
> @@ -509,6 +534,19 @@ pins_i2c4: i2c4 {
>  		bias-disable;
>  	};
>=20
> +	pins_hdmi_ddc: hdmi_ddc {
> +		function =3D "hdmi-ddc";
> +		groups =3D "hdmi-ddc";
> +		bias-disable;
> +	};
> +
> +	/* switch to PF25 as gpio driving DDC_SDA low */
> +	pins_hdmi_ddc_unwedge: hdmi_ddc {
> +		function =3D "hdmi-ddc";
> +		groups =3D "hdmi-ddc";
> +		bias-disable;
> +	};

Your pins_hdmi_ddc and pins_hdmi_ddc_unwedge are the exact same? You=20
could just use the former and pass it to both pinctrl-0 and pinctrl-1.

Cheers,
-Paul

> +
>  	pins_nemc: nemc {
>  		function =3D "nemc";
>  		groups =3D "nemc-data", "nemc-cle-ale", "nemc-rd-we", "nemc-frd-fwe";
> @@ -539,3 +577,42 @@ pins_mmc1: mmc1 {
>  		bias-disable;
>  	};
>  };
> +
> +&hdmi {
> +	status =3D "okay";
> +
> +	pinctrl-names =3D "default", "unwedge";
> +	pinctrl-0 =3D <&pins_hdmi_ddc>;
> +	pinctrl-1 =3D <&pins_hdmi_ddc_unwedge>;
> +
> +	hdmi-5v-supply =3D <&hdmi_power>;
> +
> +	ports {
> +		#address-cells =3D <1>;
> +		#size-cells =3D <0>;
> +
> +		port@0 {
> +			reg =3D <0>;
> +			dw_hdmi_in: endpoint {
> +				remote-endpoint =3D <&lcd_out>;
> +			};
> +		};
> +
> +		port@1 {
> +			reg =3D <1>;
> +			dw_hdmi_out: endpoint {
> +				remote-endpoint =3D <&hdmi_con>;
> +			};
> +		};
> +	};
> +};
> +
> +&lcdc0 {
> +	status =3D "okay";
> +
> +	port {
> +		lcd_out: endpoint {
> +			remote-endpoint =3D <&dw_hdmi_in>;
> +		};
> +	};
> +};
> --
> 2.33.0
>=20


