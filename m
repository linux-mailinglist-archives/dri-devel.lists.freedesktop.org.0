Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 76FB76333A5
	for <lists+dri-devel@lfdr.de>; Tue, 22 Nov 2022 04:02:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21C9A10E363;
	Tue, 22 Nov 2022 03:02:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA2E010E363
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Nov 2022 03:02:15 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 59597890;
 Tue, 22 Nov 2022 04:02:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1669086134;
 bh=Ca28UhB9SgGZCoIjPHP31lx8i8vFUKXIOsQCRggn/e4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=EDkXlHOouhQxm769dalIKJYAfmOUhg16wBVrnznOGYY6ycfoMc443QSCCG6JqfV+a
 j8ZOdf6bD9GuzsLukgPMocbsTmY8gtJZNN8kGQ/5TXyjI1/n88Kr355D21joCOEDpd
 fYYo+Ym1bs9AuNZLoa7B2qC1kxjn475/hvjZo67M=
Date: Tue, 22 Nov 2022 05:01:59 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [PATCH v1 5/8] arm64: dts: renesas: white-hawk-cpu: Add DP
 output support
Message-ID: <Y3w7p0EGMLILUdaA@pendragon.ideasonboard.com>
References: <20221117122547.809644-1-tomi.valkeinen@ideasonboard.com>
 <20221117122547.809644-6-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20221117122547.809644-6-tomi.valkeinen@ideasonboard.com>
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
Cc: devicetree@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Neil Armstrong <neil.armstrong@linaro.org>, Jonas Karlman <jonas@kwiboo.se>,
 Magnus Damm <magnus.damm@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Robert Foss <robert.foss@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Tomi,

Thank you for the patch.

On Thu, Nov 17, 2022 at 02:25:44PM +0200, Tomi Valkeinen wrote:
> From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> 
> Add DT nodes needed for the mini DP connector. The DP is driven by
> sn65dsi86, which in turn gets the pixel data from the SoC via DSI.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  .../dts/renesas/r8a779g0-white-hawk-cpu.dtsi  | 94 +++++++++++++++++++
>  1 file changed, 94 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/renesas/r8a779g0-white-hawk-cpu.dtsi b/arch/arm64/boot/dts/renesas/r8a779g0-white-hawk-cpu.dtsi
> index c10740aee9f6..8aab859aac7a 100644
> --- a/arch/arm64/boot/dts/renesas/r8a779g0-white-hawk-cpu.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a779g0-white-hawk-cpu.dtsi
> @@ -97,6 +97,15 @@ memory@600000000 {
>  		reg = <0x6 0x00000000 0x1 0x00000000>;
>  	};
>  
> +	reg_1p2v: regulator-1p2v {
> +		compatible = "regulator-fixed";
> +		regulator-name = "fixed-1.2V";
> +		regulator-min-microvolt = <1200000>;
> +		regulator-max-microvolt = <1200000>;
> +		regulator-boot-on;
> +		regulator-always-on;
> +	};
> +
>  	reg_1p8v: regulator-1p8v {
>  		compatible = "regulator-fixed";
>  		regulator-name = "fixed-1.8V";
> @@ -114,6 +123,24 @@ reg_3p3v: regulator-3p3v {
>  		regulator-boot-on;
>  		regulator-always-on;
>  	};
> +
> +	mini-dp-con {
> +		compatible = "dp-connector";
> +		label = "CN5";
> +		type = "mini";
> +
> +		port {
> +			mini_dp_con_in: endpoint {
> +				remote-endpoint = <&sn65dsi86_out>;
> +			};
> +		};
> +	};
> +
> +	sn65dsi86_refclk: clk-x6 {
> +		compatible = "fixed-clock";
> +		#clock-cells = <0>;
> +		clock-frequency = <38400000>;
> +	};
>  };
>  
>  &avb0 {
> @@ -134,6 +161,23 @@ phy0: ethernet-phy@0 {
>  	};
>  };
>  
> +&dsi0 {
> +	status = "okay";
> +
> +	ports {
> +		port@1 {
> +			dsi0_out: endpoint {
> +				remote-endpoint = <&sn65dsi86_in>;
> +				data-lanes = <1 2 3 4>;
> +			};
> +		};
> +	};
> +};
> +
> +&du {
> +	status = "okay";
> +};
> +
>  &extal_clk {
>  	clock-frequency = <16666666>;
>  };
> @@ -172,6 +216,51 @@ eeprom@50 {
>  	};
>  };
>  
> +&i2c1 {
> +	pinctrl-0 = <&i2c1_pins>;
> +	pinctrl-names = "default";
> +
> +	status = "okay";
> +	clock-frequency = <400000>;
> +
> +	bridge@2c {
> +		compatible = "ti,sn65dsi86";
> +		reg = <0x2c>;
> +
> +		clocks = <&sn65dsi86_refclk>;
> +		clock-names = "refclk";
> +
> +		interrupt-parent = <&intc_ex>;
> +		interrupts = <0 IRQ_TYPE_LEVEL_HIGH>;
> +
> +		enable-gpios = <&gpio1 26 GPIO_ACTIVE_HIGH>;
> +
> +		vccio-supply = <&reg_1p8v>;
> +		vpll-supply = <&reg_1p8v>;
> +		vcca-supply = <&reg_1p2v>;
> +		vcc-supply = <&reg_1p2v>;
> +
> +		ports {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			port@0 {
> +				reg = <0>;
> +				sn65dsi86_in: endpoint {
> +					remote-endpoint = <&dsi0_out>;
> +				};
> +			};
> +
> +			port@1 {
> +				reg = <1>;
> +				sn65dsi86_out: endpoint {
> +					remote-endpoint = <&mini_dp_con_in>;
> +				};
> +			};
> +		};
> +	};
> +};
> +
>  &mmc0 {
>  	pinctrl-0 = <&mmc_pins>;
>  	pinctrl-1 = <&mmc_pins>;
> @@ -221,6 +310,11 @@ i2c0_pins: i2c0 {
>  		function = "i2c0";
>  	};
>  
> +	i2c1_pins: i2c1 {
> +		groups = "i2c1";
> +		function = "i2c1";
> +	};
> +
>  	keys_pins: keys {
>  		pins = "GP_5_0", "GP_5_1", "GP_5_2";
>  		bias-pull-up;

-- 
Regards,

Laurent Pinchart
