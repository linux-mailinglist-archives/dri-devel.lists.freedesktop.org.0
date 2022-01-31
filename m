Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A6354A4AD2
	for <lists+dri-devel@lfdr.de>; Mon, 31 Jan 2022 16:42:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE43610E447;
	Mon, 31 Jan 2022 15:42:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.smtp.larsendata.com (mx1.smtp.larsendata.com
 [91.221.196.215])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70C9810E447
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Jan 2022 15:42:11 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx1.smtp.larsendata.com (Halon) with ESMTPS
 id 7c5c5d2b-82ac-11ec-b20b-0050568c148b;
 Mon, 31 Jan 2022 15:43:07 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id 01ABA194BFA;
 Mon, 31 Jan 2022 16:42:10 +0100 (CET)
Date: Mon, 31 Jan 2022 16:42:06 +0100
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: Oleksij Rempel <o.rempel@pengutronix.de>
Subject: Re: [PATCH v2 4/5] ARM: dts: imx6dl: plym2m, prtvt7, victgo: make
 use of new resistive-adc-touch driver
Message-ID: <YfgDToubMLxZsy34@ravnborg.org>
References: <20220131102841.1955032-1-o.rempel@pengutronix.de>
 <20220131102841.1955032-5-o.rempel@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220131102841.1955032-5-o.rempel@pengutronix.de>
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 dri-devel@lists.freedesktop.org, Robin van der Gracht <robin@protonic.nl>,
 David Airlie <airlied@linux.ie>, Sascha Hauer <s.hauer@pengutronix.de>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 David Jander <david@protonic.nl>, Shawn Guo <shawnguo@kernel.org>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jan 31, 2022 at 11:28:40AM +0100, Oleksij Rempel wrote:
> The tsc2046 is an ADC used as touchscreen controller. To share as mach
                                                                    much
> code as possible, we should use it as actual ADC + virtual touchscreen
> controller.
> With this patch we make use of the new kernel IIO and HID infrastructure.
> 
> Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
> ---
>  arch/arm/boot/dts/imx6dl-plym2m.dts | 59 +++++++++++++++++++++--------
>  arch/arm/boot/dts/imx6dl-prtvt7.dts | 57 +++++++++++++++++++++-------
>  arch/arm/boot/dts/imx6dl-victgo.dts | 59 ++++++++++++++++++++++-------
>  3 files changed, 132 insertions(+), 43 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/imx6dl-plym2m.dts b/arch/arm/boot/dts/imx6dl-plym2m.dts
> index 60fe5f14666e..73c7622bfe0f 100644
> --- a/arch/arm/boot/dts/imx6dl-plym2m.dts
> +++ b/arch/arm/boot/dts/imx6dl-plym2m.dts
> @@ -101,6 +101,18 @@ reg_12v0: regulator-12v0 {
>  		regulator-min-microvolt = <12000000>;
>  		regulator-max-microvolt = <12000000>;
>  	};
> +
> +	touchscreen {
> +		compatible = "resistive-adc-touch";
> +		io-channels = <&adc_ts 1>, <&adc_ts 3>, <&adc_ts 4>,
> +                              <&adc_ts 5>;
> +		io-channel-names = "y", "z1", "z2", "x";
> +		touchscreen-min-pressure = <64687>;
> +		touchscreen-inverted-x;
> +		touchscreen-inverted-y;
> +		touchscreen-x-plate-ohms = <300>;
> +		touchscreen-y-plate-ohms = <800>;
> +	};
>  };
>  
>  &can1 {
> @@ -129,26 +141,41 @@ &ecspi2 {
>  	pinctrl-0 = <&pinctrl_ecspi2>;
>  	status = "okay";
>  
> -	touchscreen@0 {
> -		compatible = "ti,tsc2046";
> +	adc_ts: adc@0 {
> +		compatible = "ti,tsc2046e-adc";
>  		reg = <0>;
>  		pinctrl-0 = <&pinctrl_tsc2046>;
>  		pinctrl-names ="default";
> -		spi-max-frequency = <100000>;
> -		interrupts-extended = <&gpio3 20 IRQ_TYPE_EDGE_FALLING>;
> -		pendown-gpio = <&gpio3 20 GPIO_ACTIVE_LOW>;
> +		spi-max-frequency = <1000000>;
> +		interrupts-extended = <&gpio3 20 IRQ_TYPE_LEVEL_LOW>;
> +		#io-channel-cells = <1>;

I quickly skimmed the patch - we seem to loose the pendown-gpio in most
of the patches - I do not see it replaced.

	Sam
