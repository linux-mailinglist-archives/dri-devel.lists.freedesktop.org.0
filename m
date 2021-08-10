Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B6993E8658
	for <lists+dri-devel@lfdr.de>; Wed, 11 Aug 2021 01:11:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B77F789708;
	Tue, 10 Aug 2021 23:11:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CB1989708
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Aug 2021 23:11:38 +0000 (UTC)
Received: from ip5f5aa64a.dynamic.kabel-deutschland.de ([95.90.166.74]
 helo=diego.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <heiko@sntech.de>)
 id 1mDauC-0002FT-8x; Wed, 11 Aug 2021 01:11:32 +0200
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Sandy Huang <hjc@rock-chips.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Jagan Teki <jagan@amarulasolutions.com>,
 Thierry Reding <thierry.reding@gmail.com>, Peter Geis <pgwipeout@gmail.com>
Cc: Peter Geis <pgwipeout@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org
Subject: Re: [BUG] dw-mipi-dsi-rockchip display corruption with dsi panel
Date: Wed, 11 Aug 2021 01:11:29 +0200
Message-ID: <3455830.ypAZr3mf50@diego>
In-Reply-To: <20210810223123.2174596-1-pgwipeout@gmail.com>
References: <20210810223123.2174596-1-pgwipeout@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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

Hi Peter,

Am Mittwoch, 11. August 2021, 00:31:24 CEST schrieb Peter Geis:
> Good Evening,
> 
> I've been attempting to light off the feiyang fy07024di26a30d panel on
> the rockpro64. This is the official panel from the Pine64 store.
> I've confirmed it works with the downstream kernel on both the rk3399
> and rk3566, but on the mainline driver the display is partially
> corrupted (see attached photo: [1]).
> 
> As you can see, the left half of the display is fine, but the right half
> of the display is corrupted with the pixels smearing horizontally.
> 
> I saw when the panel was added, some additional code was added to
> handle burst mode in the sun6_mipi_dsi driver [2].
> I've seen that the dw-mipi-dsi driver appears to already support burst
> mode and I can't find anything out of place there.
> I also haven't had much success finding anything obviously different in
> the downstream driver vs the upstream driver that would explain this.
> 
> Attached below is the in-progress dts changes for an example of how the
> panel is plugged in.

is that really a dual-dsi panel needing two dsi controllers to drive it?

With that tiny resultion of 1024x600 I definitly wouldn't expect this,
in contrast to say the 2048x1536 dual-dsi displays used in the
Gru-Scarlet ChromeOS tablets.

So maybe just drop the 2nd dsi controller connection in a first step?
Because I really don't think that is the case on the hardware.

The dual-dsi setup means that you have one vop supplying half of its
display data to each of the 2 involved dsi controllers. And you're missing
in fact half of your display data.


Heiko



> I admit, I have little understanding of the mipi-dsi internal workings,
> so I'm reaching out to the experts on how to correct this.
> 
> Thank you for your time,
> Peter Geis
> 
> [1] https://photos.app.goo.gl/LBA9M2WcweGaEb4cA
> [2] https://patchwork.kernel.org/project/linux-arm-kernel/cover/20181116163916.29621-1-jagan@amarulasolutions.com/
> 
> diff --git a/arch/arm64/boot/dts/rockchip/rk3399-rockpro64.dtsi b/arch/arm64/boot/dts/rockchip/rk3399-rockpro64.dtsi
> index 687a5afa5d2c..af55a30297ae 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3399-rockpro64.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3399-rockpro64.dtsi
> @@ -20,6 +20,13 @@ chosen {
>  		stdout-path = "serial2:1500000n8";
>  	};
>  
> +	backlight: backlight {
> +		compatible = "pwm-backlight";
> +		pwms = <&pwm0 0 1000000 0>;
> +		brightness-levels = <0 4 8 16 32 64 128 255>;
> +		default-brightness-level = <128>;
> +	};
> +
>  	clkin_gmac: external-gmac-clock {
>  		compatible = "fixed-clock";
>  		clock-frequency = <125000000>;
> @@ -69,7 +76,7 @@ diy_led: led-1 {
>  
>  	fan: pwm-fan {
>  		compatible = "pwm-fan";
> -		cooling-levels = <0 150 200 255>;
> +		cooling-levels = <0 100 150 255>;
>  		#cooling-cells = <2>;
>  		fan-supply = <&vcc12v_dcin>;
>  		pwms = <&pwm1 0 50000 0>;
> @@ -220,6 +227,16 @@ vdd_log: vdd-log {
>  		regulator-max-microvolt = <1700000>;
>  		vin-supply = <&vcc5v0_sys>;
>  	};
> +
> +	avdd: avdd {
> +		compatible = "regulator-fixed";
> +		regulator-name = "avdd";
> +		regulator-always-on;
> +		regulator-boot-on;
> +		regulator-min-microvolt = <11000000>;
> +		regulator-max-microvolt = <11000000>;
> +		vin-supply = <&vcc3v3_s0>;
> +	};
>  };
>  
>  &cpu_l0 {
> @@ -428,8 +445,8 @@ regulator-state-mem {
>  
>  			vcc3v0_touch: LDO_REG2 {
>  				regulator-name = "vcc3v0_touch";
> -				regulator-always-on;
> -				regulator-boot-on;
> +//				regulator-always-on;
> +//				regulator-boot-on;
>  				regulator-min-microvolt = <3000000>;
>  				regulator-max-microvolt = <3000000>;
>  				regulator-state-mem {
> @@ -518,8 +535,8 @@ regulator-state-mem {
>  
>  			vcc3v3_s0: SWITCH_REG2 {
>  				regulator-name = "vcc3v3_s0";
> -				regulator-always-on;
> -				regulator-boot-on;
> +//				regulator-always-on;
> +//				regulator-boot-on;
>  				regulator-state-mem {
>  					regulator-off-in-suspend;
>  				};
> @@ -593,6 +610,19 @@ fusb0: typec-portc@22 {
>  		vbus-supply = <&vcc5v0_typec>;
>  		status = "okay";
>  	};
> +
> +	touch: touchscreen@5d {
> +		compatible = "goodix,gt911";
> +		reg = <0x5d>;
> +		AVDD28-supply = <&vcc3v0_touch>;
> +		VDDIO-supply = <&vcc3v0_touch>;
> +		interrupt-parent = <&gpio4>;
> +		interrupts = <RK_PD5 IRQ_TYPE_EDGE_FALLING>;
> +		irq-gpios = <&gpio4 RK_PD5 GPIO_ACTIVE_HIGH>;
> +		reset-gpios = <&gpio4 RK_PD6 GPIO_ACTIVE_HIGH>;
> +//		touchscreen-inverted-x;
> +//		touchscreen-inverted-y;
> +	};
>  };
>  
>  &i2s0 {
> @@ -628,6 +658,88 @@ &io_domains {
>  	gpio1830-supply = <&vcc_3v0>;
>  };
>  
> +&mipi_dsi {
> +	status = "okay";
> +	clock-master;
> +
> +	ports {
> +		mipi_out: port@1 {
> +			reg = <1>;
> +
> +			mipi_out_panel: endpoint {
> +				remote-endpoint = <&mipi_in_panel>;
> +			};
> +		};
> +	};
> +
> +	mipi_panel: panel@0 {
> +		compatible = "feiyang,fy07024di26a30d";
> +		reg = <0>;
> +		backlight = <&backlight>;
> +		reset-gpios = <&gpio4 25 GPIO_ACTIVE_HIGH>;
> +//		enable-gpios = <&gpio4 25 GPIO_ACTIVE_HIGH>;
> +		width-mm = <154>;
> +		height-mm = <86>;
> +		rotation = <0>;
> +		avdd-supply = <&avdd>;
> +		dvdd-supply = <&vcc3v3_s0>;
> +
> +		display-timings {
> +			native-mode = <&timing0>;
> +			timing0: timing0 {
> +				clock-frequency = <50000000>;
> +				hactive = <1024>;
> +				vactive = <600>;
> +				hfront-porch = <160>;
> +				hback-porch = <160>;
> +				hsync-len = <10>;
> +				vback-porch = <23>;
> +				vfront-porch = <12>;
> +				vsync-len = <1>;
> +				hsync-active = <0>;
> +				vsync-active = <0>;
> +				pixelclk-active = <0>;
> +				de-active = <0>;
> +			};
> +		};
> +
> +		ports {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			port@0 {
> +				reg = <0>;
> +
> +				mipi_in_panel: endpoint {
> +					remote-endpoint = <&mipi_out_panel>;
> +				};
> +			};
> +
> +			port@1 {
> +				reg = <1>;
> +
> +				mipi1_in_panel: endpoint@1 {
> +					remote-endpoint = <&mipi1_out_panel>;
> +				};
> +			};
> +		};
> +	};
> +};
> +
> +&mipi_dsi1 {
> +	status = "okay";
> +
> +	ports {
> +		mipi1_out: port@1 {
> +			reg = <1>;
> +
> +			mipi1_out_panel: endpoint {
> +				remote-endpoint = <&mipi1_in_panel>;
> +			};
> +		};
> +	};
> +};
> +
>  &pcie0 {
>  	ep-gpios = <&gpio2 RK_PD4 GPIO_ACTIVE_HIGH>;
>  	num-lanes = <4>;
> 




