Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C8D52FE571
	for <lists+dri-devel@lfdr.de>; Thu, 21 Jan 2021 09:53:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F5606E8E4;
	Thu, 21 Jan 2021 08:52:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 487 seconds by postgrey-1.36 at gabe;
 Wed, 20 Jan 2021 14:55:32 UTC
Received: from protonic.xs4all.nl (protonic.xs4all.nl [83.163.252.89])
 by gabe.freedesktop.org (Postfix) with ESMTP id 6B46B6E3B7
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Jan 2021 14:55:32 +0000 (UTC)
Received: from fiber.protonic.nl (edge2.prtnl [192.168.1.170])
 by sparta.prtnl (Postfix) with ESMTP id 86D9144A022A;
 Wed, 20 Jan 2021 15:47:23 +0100 (CET)
MIME-Version: 1.0
Date: Wed, 20 Jan 2021 15:47:23 +0100
From: robin <robin@protonic.nl>
To: Oleksij Rempel <o.rempel@pengutronix.de>
Subject: Re: [PATCH v1 4/7] ARM: dts: imx6dl-prtvt7: add TSC2046 touchscreen
 node
In-Reply-To: <20210120142217.29652-5-o.rempel@pengutronix.de>
References: <20210120142217.29652-1-o.rempel@pengutronix.de>
 <20210120142217.29652-5-o.rempel@pengutronix.de>
User-Agent: Roundcube Webmail/1.4.8
Message-ID: <f531bec0c48efdeafccd1b251b97ec11@protonic.nl>
X-Sender: robin@protonic.nl
Organization: Protonic Holland
X-Mailman-Approved-At: Thu, 21 Jan 2021 08:52:31 +0000
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
Reply-To: robin@protonic.nl
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 Sam Ravnborg <sam@ravnborg.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 David Jander <david@protonic.nl>, Shawn Guo <shawnguo@kernel.org>,
 linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2021-01-20 15:22, Oleksij Rempel wrote:
> Add touchscreen support to the Protonic VT7 board.
> 
> Co-Developed-by: Robin van der Gracht <robin@protonic.nl>
> Signed-off-by: Robin van der Gracht <robin@protonic.nl>
> Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
> ---
>  arch/arm/boot/dts/imx6dl-prtvt7.dts | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/imx6dl-prtvt7.dts
> b/arch/arm/boot/dts/imx6dl-prtvt7.dts
> index d9cb1e41cc10..63ae2065834c 100644
> --- a/arch/arm/boot/dts/imx6dl-prtvt7.dts
> +++ b/arch/arm/boot/dts/imx6dl-prtvt7.dts
> @@ -266,6 +266,26 @@ &ecspi2 {
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&pinctrl_ecspi2>;
>  	status = "okay";
> +
> +	touchscreen@0 {
> +		compatible = "ti,tsc2046";
> +		reg = <0>;
> +		pinctrl-0 = <&pinctrl_tsc>;
> +		pinctrl-names ="default";
> +		spi-max-frequency = <100000>;
> +		interrupts-extended = <&gpio3 20 IRQ_TYPE_EDGE_FALLING>;
> +		pendown-gpio = <&gpio3 20 GPIO_ACTIVE_LOW>;
> +
> +		touchscreen-inverted-x;
> +		touchscreen-inverted-y;

Please remove both inverted properties since it's not inverted.

> +		touchscreen-max-pressure = <4095>;
> +
> +		ti,vref-delay-usecs = /bits/ 16 <100>;
> +		ti,x-plate-ohms = /bits/ 16 <800>;
> +		ti,y-plate-ohms = /bits/ 16 <300>;
> +
> +		wakeup-source;
> +	};
>  };
> 
>  &i2c1 {

Robin
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
