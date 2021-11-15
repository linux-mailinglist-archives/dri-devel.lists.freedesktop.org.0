Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AFEF4511D2
	for <lists+dri-devel@lfdr.de>; Mon, 15 Nov 2021 20:17:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A5626E1EC;
	Mon, 15 Nov 2021 19:17:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F1A06E1EC
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Nov 2021 19:17:06 +0000 (UTC)
Date: Mon, 15 Nov 2021 19:16:51 +0000
From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v6 6/8] MIPS: DTS: CI20: Add DT nodes for HDMI setup
To: "H. Nikolaus Schaller" <hns@goldelico.com>, Thomas Bogendoerfer
 <tsbogend@alpha.franken.de>
Message-Id: <38OM2R.QJECEBEZVSXU@crapouillou.net>
In-Reply-To: <141a4ea23dc19629fea983093348d9dfaedb1cae.1636573413.git.hns@goldelico.com>
References: <cover.1636573413.git.hns@goldelico.com>
 <141a4ea23dc19629fea983093348d9dfaedb1cae.1636573413.git.hns@goldelico.com>
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
 Liam Girdwood <lgirdwood@gmail.com>, Robert Foss <robert.foss@linaro.org>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 "Eric W. Biederman" <ebiederm@xmission.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Nikolaus, Thomas,

Le mer., nov. 10 2021 at 20:43:31 +0100, H. Nikolaus Schaller=20
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
>  arch/mips/boot/dts/ingenic/ci20.dts | 73=20
> +++++++++++++++++++++++++++--
>  1 file changed, 70 insertions(+), 3 deletions(-)
>=20
> diff --git a/arch/mips/boot/dts/ingenic/ci20.dts=20
> b/arch/mips/boot/dts/ingenic/ci20.dts
> index a688809beebca..a62557bede565 100644
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
> +		gpio =3D <&gpa 25 GPIO_ACTIVE_LOW>;

Just use 0 instead of GPIO_ACTIVE_LOW, since the flag is simply ignored=20
(I know the other regulators do use it, but I'll clean that up soon).

> +		enable-active-high;
> +	};
>  };
>=20
>  &ext {
> @@ -113,9 +136,9 @@ &cgu {
>  	 * Use the 32.768 kHz oscillator as the parent of the RTC for a=20
> higher
>  	 * precision.
>  	 */
> -	assigned-clocks =3D <&cgu JZ4780_CLK_OTGPHY>, <&cgu JZ4780_CLK_RTC>;
> -	assigned-clock-parents =3D <0>, <&cgu JZ4780_CLK_RTCLK>;
> -	assigned-clock-rates =3D <48000000>;
> +	assigned-clocks =3D <&cgu JZ4780_CLK_OTGPHY>, <&cgu JZ4780_CLK_RTC>,=20
> <&cgu JZ4780_CLK_HDMI>;
> +	assigned-clock-parents =3D <0>, <&cgu JZ4780_CLK_RTCLK>, <0>;
> +	assigned-clock-rates =3D <48000000>, <0>, <27000000>;

So drm-misc-next is based on a slightly older version (not v5.16-rc1=20
yet), and these lines changed in linux master.

I think it would make sense to merge the DT changes (+ doc) into the=20
MIPS tree, and the driver changes into drm-misc-next.

@Thomas: Is that OK for you?

Cheers,
-Paul

>  };
>=20
>  &tcu {
> @@ -506,6 +529,12 @@ pins_i2c4: i2c4 {
>  		bias-disable;
>  	};
>=20
> +	pins_hdmi_ddc: hdmi_ddc {
> +		function =3D "hdmi-ddc";
> +		groups =3D "hdmi-ddc";
> +		bias-disable;
> +	};
> +
>  	pins_nemc: nemc {
>  		function =3D "nemc";
>  		groups =3D "nemc-data", "nemc-cle-ale", "nemc-rd-we", "nemc-frd-fwe";
> @@ -536,3 +565,41 @@ pins_mmc1: mmc1 {
>  		bias-disable;
>  	};
>  };
> +
> +&hdmi {
> +	status =3D "okay";
> +
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&pins_hdmi_ddc>;
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


