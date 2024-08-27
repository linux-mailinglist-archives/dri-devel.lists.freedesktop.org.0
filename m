Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 52C7896028B
	for <lists+dri-devel@lfdr.de>; Tue, 27 Aug 2024 08:55:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F4ED10E2A9;
	Tue, 27 Aug 2024 06:55:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=detlev.casanova@collabora.com header.b="dUETRcQW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com
 [136.143.188.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DD7710E205
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Aug 2024 17:55:09 +0000 (UTC)
Delivered-To: kernel@collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1724694896; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=YYyOo/nbGbLY13Q80AFFF98IreqnJjpUeelHoFzHsaTRG2y+JxYUckLgmbK8yKI4De0a7KaUv12S9oh9NM5+ymB4Csv/FHcFuHZxaj0vgoueoCzfLkXaeoyPLLkzbn/M8wyoblOEVUt/2OdNg9hbpdvn57JIKxAD6k64hiNoePk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1724694896;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=Xil5G/i06jc+cbbTJdw0oYCzhgqCOjDb+WhqrxeIpCE=; 
 b=dXdgnY0iiBfV4T5wVK0hn5vRSlRfUHCH8bAdXWuK1SJPEIhbQh11Z18zBAM6eWkP4C1SM6WFbgV5fzn4P/P0vDwtJzAHOYqAvIZdQ41Cq7+bzKImj1QRwMTFyz/e2WprQCVWJo1SJnPMZynOqEjeZFshqA768E6uOcfSfazZ9+s=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=detlev.casanova@collabora.com;
 dmarc=pass header.from=<detlev.casanova@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1724694896; 
 s=zohomail; d=collabora.com; i=detlev.casanova@collabora.com; 
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
 bh=Xil5G/i06jc+cbbTJdw0oYCzhgqCOjDb+WhqrxeIpCE=;
 b=dUETRcQWFKzDAf8c6ziVlpVq8INdwxKRk1aZ461cGyHgezMq3+v1VXR/5UDSa2DN
 EpPgjspu91Wfj3j0QK9oAoSKkMPcuijP6Bjyt8egx/qGGLfM4rSUU3a5dGevn02tHNE
 5A+pgkoYWfuNfj/Vh7y87enPx6aTF0Du7IJlI0gE=
Received: by mx.zohomail.com with SMTPS id 1724694893890914.6229097805021;
 Mon, 26 Aug 2024 10:54:53 -0700 (PDT)
From: Detlev Casanova <detlev.casanova@collabora.com>
To: linux-kernel@vger.kernel.org, zhangqing <zhangqing@rock-chips.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Andi Shyti <andi.shyti@kernel.org>, Jonathan Cameron <jic23@kernel.org>,
 Lars-Peter Clausen <lars@metafoo.de>, Lee Jones <lee@kernel.org>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, Mark Brown <broonie@kernel.org>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 Guenter Roeck <linux@roeck-us.net>, Chris Morgan <macromorgan@hotmail.com>,
 Jonas Karlman <jonas@kwiboo.se>, Tim Lunn <tim@feathertop.org>,
 Chukun Pan <amadeus@jmu.edu.cn>, Andy Yan <andyshrk@163.com>,
 Muhammed Efe Cetin <efectn@protonmail.com>, Jagan Teki <jagan@edgeble.ai>,
 Dragan Simic <dsimic@manjaro.org>, Ondrej Jirman <megi@xff.cz>,
 Michael Riesch <michael.riesch@wolfvision.net>,
 Jimmy Hon <honyuenkwun@gmail.com>, Alexey Charkov <alchark@gmail.com>,
 Elon Zhang <zhangzj@rock-chips.com>,
 Yifeng Zhao <yifeng.zhao@rock-chips.com>,
 Finley Xiao <finley.xiao@rock-chips.com>, Liang Chen <cl@rock-chips.com>,
 Jisheng Zhang <jszhang@kernel.org>, Jamie Iles <jamie@jamieiles.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, dri-devel@lists.freedesktop.org,
 linux-i2c@vger.kernel.org, linux-iio@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-serial@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-watchdog@vger.kernel.org,
 kernel@collabora.com
Subject: Re: [PATCH v2 11/12] arm64: dts: rockchip: Add rk3576 SoC base DT
Date: Mon, 26 Aug 2024 13:54:48 -0400
Message-ID: <3309312.aeNJFYEL58@bootstrap>
In-Reply-To: <4849dae7-24c8-4581-9ad1-1d731be2fd51@rock-chips.com>
References: <20240823150057.56141-1-detlev.casanova@collabora.com>
 <23624422.6Emhk5qWAg@trenzalore>
 <4849dae7-24c8-4581-9ad1-1d731be2fd51@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-ZohoMailClient: External
X-Mailman-Approved-At: Tue, 27 Aug 2024 06:55:27 +0000
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

Hi Elaine,

Thank you for the fixes ! Can you confirm that the USB PD must be a child o=
f the=20
VOP PD node ?

On Monday, 26 August 2024 03:56:05 EDT zhangqing wrote:
> Hi,
>=20
> Please be sure to correct.
>=20
> There are fixes for the power domain node, see below for details.
>=20
> +
> +				power-domain@RK3576_PD_SDGMAC {
> +					reg =3D <RK3576_PD_SDGMAC>;
> +				#power-domain-cells =3D <0>;
> +					clocks =3D <&cru ACLK_HSGPIO>,
> +						 <&cru ACLK_GMAC0>,
> +						 <&cru ACLK_GMAC1>,
> +						 <&cru CCLK_SRC_SDIO>,
> +						 <&cru=20
CCLK_SRC_SDMMC0>,
> +						 <&cru HCLK_HSGPIO>,
> +						 <&cru HCLK_SDIO>,
> +						 <&cru HCLK_SDMMC0>;
>=20
> add <&cru PCLK_SDGMAC_ROOT>
>=20
> > +			power-domain@RK3576_PD_VOP {
> > +				reg =3D <RK3576_PD_VOP>;
> > +				#power-domain-cells =3D <0>;
> > +				#address-cells =3D <1>;
> > +				#size-cells =3D <0>;
> > +				clocks =3D <&cru ACLK_VOP>,
> > +					 <&cru HCLK_VOP>,
> > +					 <&cru HCLK_VOP_ROOT>;
>=20
> Add <&cru PCLK_VOP_ROOT>
>=20
> =E5=9C=A8 2024/8/24 0:11, Detlev Casanova =E5=86=99=E9=81=93:
> > This device tree contains all devices necessary for booting from network
> > or SD Card.
> >=20
> > It supports CPU, CRU, PM domains, dma, interrupts, timers, UARTi, I2C
> > and SDHCI (everything necessary to boot Linux on this system on chip)
> > as well as Ethernet, SPI, GPU and RTC.
> >=20
> > Signed-off-by: Liang Chen<cl@rock-chips.com>
> > Signed-off-by: Finley Xiao<finley.xiao@rock-chips.com>
> > Signed-off-by: Yifeng Zhao<yifeng.zhao@rock-chips.com>
> > Signed-off-by: Elaine Zhang<zhangqing@rock-chips.com>
> > Signed-off-by: Detlev Casanova<detlev.casanova@collabora.com>
> > ---
> >=20
> >   .../boot/dts/rockchip/rk3576-pinctrl.dtsi     | 5775 +++++++++++++++++
> >   arch/arm64/boot/dts/rockchip/rk3576.dtsi      | 1710 +++++
> >   2 files changed, 7485 insertions(+)
> >   create mode 100644 arch/arm64/boot/dts/rockchip/rk3576-pinctrl.dtsi
> >   create mode 100644 arch/arm64/boot/dts/rockchip/rk3576.dtsi
> >=20
> > diff --git a/arch/arm64/boot/dts/rockchip/rk3576-pinctrl.dtsi
> > b/arch/arm64/boot/dts/rockchip/rk3576-pinctrl.dtsi new file mode 100644
> > index 0000000000000..0b0851a7e4ea9
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/rockchip/rk3576-pinctrl.dtsi
> > @@ -0,0 +1,5775 @@
> > +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> > +/*
> > + * Copyright (c) 2023 Rockchip Electronics Co., Ltd.
> > + */
> > +
> > +#include <dt-bindings/pinctrl/rockchip.h>
> > +#include "rockchip-pinconf.dtsi"
> > +
> > +/*
> > + * This file is auto generated by pin2dts tool, please keep these code
> > + * by adding changes at end of this file.
> > + */
> > +&pinctrl {
> > +	aupll_clk {
> > +		/omit-if-no-ref/
> > +		aupll_clkm0_pins: aupll_clkm0-pins {
> > +			rockchip,pins =3D
> > +				/* aupll_clk_in_m0 */
> > +				<0 RK_PA0 3 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		aupll_clkm1_pins: aupll_clkm1-pins {
> > +			rockchip,pins =3D
> > +				/* aupll_clk_in_m1 */
> > +				<0 RK_PB0 3 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		aupll_clkm2_pins: aupll_clkm2-pins {
> > +			rockchip,pins =3D
> > +				/* aupll_clk_in_m2 */
> > +				<4 RK_PA2 3 &pcfg_pull_none>;
> > +		};
> > +	};
> > +
> > +	cam_clk0 {
> > +		/omit-if-no-ref/
> > +		cam_clk0m0_clk0: cam_clk0m0-clk0 {
> > +			rockchip,pins =3D
> > +				/* cam_clk0_out_m0 */
> > +				<3 RK_PD7 3 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		cam_clk0m1_clk0: cam_clk0m1-clk0 {
> > +			rockchip,pins =3D
> > +				/* cam_clk0_out_m1 */
> > +				<2 RK_PD2 1 &pcfg_pull_none>;
> > +		};
> > +	};
> > +
> > +	cam_clk1 {
> > +		/omit-if-no-ref/
> > +		cam_clk1m0_clk1: cam_clk1m0-clk1 {
> > +			rockchip,pins =3D
> > +				/* cam_clk1_out_m0 */
> > +				<4 RK_PA0 3 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		cam_clk1m1_clk1: cam_clk1m1-clk1 {
> > +			rockchip,pins =3D
> > +				/* cam_clk1_out_m1 */
> > +				<2 RK_PD6 1 &pcfg_pull_none>;
> > +		};
> > +	};
> > +
> > +	cam_clk2 {
> > +		/omit-if-no-ref/
> > +		cam_clk2m0_clk2: cam_clk2m0-clk2 {
> > +			rockchip,pins =3D
> > +				/* cam_clk2_out_m0 */
> > +				<4 RK_PA1 3 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		cam_clk2m1_clk2: cam_clk2m1-clk2 {
> > +			rockchip,pins =3D
> > +				/* cam_clk2_out_m1 */
> > +				<2 RK_PD7 1 &pcfg_pull_none>;
> > +		};
> > +	};
> > +
> > +	can0 {
> > +		/omit-if-no-ref/
> > +		can0m0_pins: can0m0-pins {
> > +			rockchip,pins =3D
> > +				/* can0_rx_m0 */
> > +				<2 RK_PA0 13 &pcfg_pull_none>,
> > +				/* can0_tx_m0 */
> > +				<2 RK_PA1 13 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		can0m1_pins: can0m1-pins {
> > +			rockchip,pins =3D
> > +				/* can0_rx_m1 */
> > +				<4 RK_PC3 12 &pcfg_pull_none>,
> > +				/* can0_tx_m1 */
> > +				<4 RK_PC2 12 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		can0m2_pins: can0m2-pins {
> > +			rockchip,pins =3D
> > +				/* can0_rx_m2 */
> > +				<4 RK_PA6 13 &pcfg_pull_none>,
> > +				/* can0_tx_m2 */
> > +				<4 RK_PA4 13 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		can0m3_pins: can0m3-pins {
> > +			rockchip,pins =3D
> > +				/* can0_rx_m3 */
> > +				<3 RK_PC1 12 &pcfg_pull_none>,
> > +				/* can0_tx_m3 */
> > +				<3 RK_PC4 12 &pcfg_pull_none>;
> > +		};
> > +	};
> > +
> > +	can1 {
> > +		/omit-if-no-ref/
> > +		can1m0_pins: can1m0-pins {
> > +			rockchip,pins =3D
> > +				/* can1_rx_m0 */
> > +				<2 RK_PA2 13 &pcfg_pull_none>,
> > +				/* can1_tx_m0 */
> > +				<2 RK_PA3 13 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		can1m1_pins: can1m1-pins {
> > +			rockchip,pins =3D
> > +				/* can1_rx_m1 */
> > +				<4 RK_PC7 13 &pcfg_pull_none>,
> > +				/* can1_tx_m1 */
> > +				<4 RK_PC6 13 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		can1m2_pins: can1m2-pins {
> > +			rockchip,pins =3D
> > +				/* can1_rx_m2 */
> > +				<4 RK_PB4 13 &pcfg_pull_none>,
> > +				/* can1_tx_m2 */
> > +				<4 RK_PB5 13 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		can1m3_pins: can1m3-pins {
> > +			rockchip,pins =3D
> > +				/* can1_rx_m3 */
> > +				<3 RK_PA3 11 &pcfg_pull_none>,
> > +				/* can1_tx_m3 */
> > +				<3 RK_PA2 11 &pcfg_pull_none>;
> > +		};
> > +	};
> > +
> > +	clk0_32k {
> > +		/omit-if-no-ref/
> > +		clk0_32k_pins: clk0_32k-pins {
> > +			rockchip,pins =3D
> > +				/* clk0_32k_out */
> > +				<0 RK_PA2 10 &pcfg_pull_none>;
> > +		};
> > +	};
> > +
> > +	clk1_32k {
> > +		/omit-if-no-ref/
> > +		clk1_32k_pins: clk1_32k-pins {
> > +			rockchip,pins =3D
> > +				/* clk1_32k_out */
> > +				<1 RK_PD5 13 &pcfg_pull_none>;
> > +		};
> > +	};
> > +
> > +	clk_32k {
> > +		/omit-if-no-ref/
> > +		clk_32k_pins: clk_32k-pins {
> > +			rockchip,pins =3D
> > +				/* clk_32k_in */
> > +				<0 RK_PA2 9 &pcfg_pull_none>;
> > +		};
> > +	};
> > +
> > +	cpubig {
> > +		/omit-if-no-ref/
> > +		cpubig_pins: cpubig-pins {
> > +			rockchip,pins =3D
> > +				/* cpubig_avs */
> > +				<0 RK_PD2 11 &pcfg_pull_none>;
> > +		};
> > +	};
> > +
> > +	cpulit {
> > +		/omit-if-no-ref/
> > +		cpulit_pins: cpulit-pins {
> > +			rockchip,pins =3D
> > +				/* cpulit_avs */
> > +				<0 RK_PC0 11 &pcfg_pull_none>;
> > +		};
> > +	};
> > +
> > +	debug0_test {
> > +		/omit-if-no-ref/
> > +		debug0_test_pins: debug0_test-pins {
> > +			rockchip,pins =3D
> > +				/* debug0_test_out */
> > +				<1 RK_PC4 7 &pcfg_pull_none>;
> > +		};
> > +	};
> > +
> > +	debug1_test {
> > +		/omit-if-no-ref/
> > +		debug1_test_pins: debug1_test-pins {
> > +			rockchip,pins =3D
> > +				/* debug1_test_out */
> > +				<1 RK_PC5 7 &pcfg_pull_none>;
> > +		};
> > +	};
> > +
> > +	debug2_test {
> > +		/omit-if-no-ref/
> > +		debug2_test_pins: debug2_test-pins {
> > +			rockchip,pins =3D
> > +				/* debug2_test_out */
> > +				<1 RK_PC6 7 &pcfg_pull_none>;
> > +		};
> > +	};
> > +
> > +	debug3_test {
> > +		/omit-if-no-ref/
> > +		debug3_test_pins: debug3_test-pins {
> > +			rockchip,pins =3D
> > +				/* debug3_test_out */
> > +				<1 RK_PC7 7 &pcfg_pull_none>;
> > +		};
> > +	};
> > +
> > +	debug4_test {
> > +		/omit-if-no-ref/
> > +		debug4_test_pins: debug4_test-pins {
> > +			rockchip,pins =3D
> > +				/* debug4_test_out */
> > +				<1 RK_PD0 7 &pcfg_pull_none>;
> > +		};
> > +	};
> > +
> > +	debug5_test {
> > +		/omit-if-no-ref/
> > +		debug5_test_pins: debug5_test-pins {
> > +			rockchip,pins =3D
> > +				/* debug5_test_out */
> > +				<1 RK_PD1 7 &pcfg_pull_none>;
> > +		};
> > +	};
> > +
> > +	debug6_test {
> > +		/omit-if-no-ref/
> > +		debug6_test_pins: debug6_test-pins {
> > +			rockchip,pins =3D
> > +				/* debug6_test_out */
> > +				<1 RK_PD2 7 &pcfg_pull_none>;
> > +		};
> > +	};
> > +
> > +	debug7_test {
> > +		/omit-if-no-ref/
> > +		debug7_test_pins: debug7_test-pins {
> > +			rockchip,pins =3D
> > +				/* debug7_test_out */
> > +				<1 RK_PD3 7 &pcfg_pull_none>;
> > +		};
> > +	};
> > +
> > +	dp {
> > +		/omit-if-no-ref/
> > +		dpm0_pins: dpm0-pins {
> > +			rockchip,pins =3D
> > +				/* dp_hpdin_m0 */
> > +				<4 RK_PC4 10 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		dpm1_pins: dpm1-pins {
> > +			rockchip,pins =3D
> > +				/* dp_hpdin_m1 */
> > +				<0 RK_PC5 9 &pcfg_pull_none>;
> > +		};
> > +	};
> > +
> > +	dsm_aud {
> > +		/omit-if-no-ref/
> > +		dsm_audm0_ln: dsm_audm0-ln {
> > +			rockchip,pins =3D
> > +				/* dsm_aud_ln_m0 */
> > +				<2 RK_PA1 3 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		dsm_audm0_lp: dsm_audm0-lp {
> > +			rockchip,pins =3D
> > +				/* dsm_aud_lp_m0 */
> > +				<2 RK_PA0 3 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		dsm_audm0_rn: dsm_audm0-rn {
> > +			rockchip,pins =3D
> > +				/* dsm_aud_rn_m0 */
> > +				<2 RK_PA3 3 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		dsm_audm0_rp: dsm_audm0-rp {
> > +			rockchip,pins =3D
> > +				/* dsm_aud_rp_m0 */
> > +				<2 RK_PA2 3 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		dsm_audm1_ln: dsm_audm1-ln {
> > +			rockchip,pins =3D
> > +				/* dsm_aud_ln_m1 */
> > +				<4 RK_PC1 1 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		dsm_audm1_lp: dsm_audm1-lp {
> > +			rockchip,pins =3D
> > +				/* dsm_aud_lp_m1 */
> > +				<4 RK_PC0 1 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		dsm_audm1_rn: dsm_audm1-rn {
> > +			rockchip,pins =3D
> > +				/* dsm_aud_rn_m1 */
> > +				<4 RK_PC3 1 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		dsm_audm1_rp: dsm_audm1-rp {
> > +			rockchip,pins =3D
> > +				/* dsm_aud_rp_m1 */
> > +				<4 RK_PC2 1 &pcfg_pull_none>;
> > +		};
> > +	};
> > +
> > +	dsmc {
> > +		/omit-if-no-ref/
> > +		dsmc_clkn: dsmc-clkn {
> > +			rockchip,pins =3D
> > +				/* dsmc_clkn */
> > +				<3 RK_PD6 5 &pcfg_pull_none>;
> > +		};
> > +		/omit-if-no-ref/
> > +		dsmc_clkp: dsmc-clkp {
> > +			rockchip,pins =3D
> > +				/* dsmc_clkp */
> > +				<3 RK_PD5 5 &pcfg_pull_none>;
> > +		};
> > +		/omit-if-no-ref/
> > +		dsmc_csn0: dsmc-csn0 {
> > +			rockchip,pins =3D
> > +				/* dsmc_csn0 */
> > +				<3 RK_PD3 5 &pcfg_pull_none>;
> > +		};
> > +		/omit-if-no-ref/
> > +		dsmc_csn1: dsmc-csn1 {
> > +			rockchip,pins =3D
> > +				/* dsmc_csn1 */
> > +				<3 RK_PB0 5 &pcfg_pull_none>;
> > +		};
> > +		/omit-if-no-ref/
> > +		dsmc_csn2: dsmc-csn2 {
> > +			rockchip,pins =3D
> > +				/* dsmc_csn2 */
> > +				<3 RK_PD1 5 &pcfg_pull_none>;
> > +		};
> > +		/omit-if-no-ref/
> > +		dsmc_csn3: dsmc-csn3 {
> > +			rockchip,pins =3D
> > +				/* dsmc_csn3 */
> > +				<3 RK_PD2 5 &pcfg_pull_none>;
> > +		};
> > +		/omit-if-no-ref/
> > +		dsmc_data0: dsmc-data0 {
> > +			rockchip,pins =3D
> > +				/* dsmc_data0 */
> > +				<3 RK_PD4 5 &pcfg_pull_none>;
> > +		};
> > +		/omit-if-no-ref/
> > +		dsmc_data1: dsmc-data1 {
> > +			rockchip,pins =3D
> > +				/* dsmc_data1 */
> > +				<3 RK_PD0 5 &pcfg_pull_none>;
> > +		};
> > +		/omit-if-no-ref/
> > +		dsmc_data2: dsmc-data2 {
> > +			rockchip,pins =3D
> > +				/* dsmc_data2 */
> > +				<3 RK_PC7 5 &pcfg_pull_none>;
> > +		};
> > +		/omit-if-no-ref/
> > +		dsmc_data3: dsmc-data3 {
> > +			rockchip,pins =3D
> > +				/* dsmc_data3 */
> > +				<3 RK_PC6 5 &pcfg_pull_none>;
> > +		};
> > +		/omit-if-no-ref/
> > +		dsmc_data4: dsmc-data4 {
> > +			rockchip,pins =3D
> > +				/* dsmc_data4 */
> > +				<3 RK_PC5 5 &pcfg_pull_none>;
> > +		};
> > +		/omit-if-no-ref/
> > +		dsmc_data5: dsmc-data5 {
> > +			rockchip,pins =3D
> > +				/* dsmc_data5 */
> > +				<3 RK_PC4 5 &pcfg_pull_none>;
> > +		};
> > +		/omit-if-no-ref/
> > +		dsmc_data6: dsmc-data6 {
> > +			rockchip,pins =3D
> > +				/* dsmc_data6 */
> > +				<3 RK_PC1 5 &pcfg_pull_none>;
> > +		};
> > +		/omit-if-no-ref/
> > +		dsmc_data7: dsmc-data7 {
> > +			rockchip,pins =3D
> > +				/* dsmc_data7 */
> > +				<3 RK_PC0 5 &pcfg_pull_none>;
> > +		};
> > +		/omit-if-no-ref/
> > +		dsmc_data8: dsmc-data8 {
> > +			rockchip,pins =3D
> > +				/* dsmc_data8 */
> > +				<3 RK_PB5 5 &pcfg_pull_none>;
> > +		};
> > +		/omit-if-no-ref/
> > +		dsmc_data9: dsmc-data9 {
> > +			rockchip,pins =3D
> > +				/* dsmc_data9 */
> > +				<3 RK_PB4 5 &pcfg_pull_none>;
> > +		};
> > +		/omit-if-no-ref/
> > +		dsmc_data10: dsmc-data10 {
> > +			rockchip,pins =3D
> > +				/* dsmc_data10 */
> > +				<3 RK_PB3 5 &pcfg_pull_none>;
> > +		};
> > +		/omit-if-no-ref/
> > +		dsmc_data11: dsmc-data11 {
> > +			rockchip,pins =3D
> > +				/* dsmc_data11 */
> > +				<3 RK_PB2 5 &pcfg_pull_none>;
> > +		};
> > +		/omit-if-no-ref/
> > +		dsmc_data12: dsmc-data12 {
> > +			rockchip,pins =3D
> > +				/* dsmc_data12 */
> > +				<3 RK_PB1 5 &pcfg_pull_none>;
> > +		};
> > +		/omit-if-no-ref/
> > +		dsmc_data13: dsmc-data13 {
> > +			rockchip,pins =3D
> > +				/* dsmc_data13 */
> > +				<3 RK_PA7 5 &pcfg_pull_none>;
> > +		};
> > +		/omit-if-no-ref/
> > +		dsmc_data14: dsmc-data14 {
> > +			rockchip,pins =3D
> > +				/* dsmc_data14 */
> > +				<3 RK_PA6 5 &pcfg_pull_none>;
> > +		};
> > +		/omit-if-no-ref/
> > +		dsmc_data15: dsmc-data15 {
> > +			rockchip,pins =3D
> > +				/* dsmc_data15 */
> > +				<3 RK_PA5 5 &pcfg_pull_none>;
> > +		};
> > +		/omit-if-no-ref/
> > +		dsmc_dqs0: dsmc-dqs0 {
> > +			rockchip,pins =3D
> > +				/* dsmc_dqs0 */
> > +				<3 RK_PB7 5 &pcfg_pull_none>;
> > +		};
> > +		/omit-if-no-ref/
> > +		dsmc_dqs1: dsmc-dqs1 {
> > +			rockchip,pins =3D
> > +				/* dsmc_dqs1 */
> > +				<3 RK_PB6 5 &pcfg_pull_none>;
> > +		};
> > +		/omit-if-no-ref/
> > +		dsmc_int0: dsmc-int0 {
> > +			rockchip,pins =3D
> > +				/* dsmc_int0 */
> > +				<4 RK_PA0 5 &pcfg_pull_none>;
> > +		};
> > +		/omit-if-no-ref/
> > +		dsmc_int1: dsmc-int1 {
> > +			rockchip,pins =3D
> > +				/* dsmc_int1 */
> > +				<3 RK_PC2 5 &pcfg_pull_none>;
> > +		};
> > +		/omit-if-no-ref/
> > +		dsmc_int2: dsmc-int2 {
> > +			rockchip,pins =3D
> > +				/* dsmc_int2 */
> > +				<4 RK_PA1 5 &pcfg_pull_none>;
> > +		};
> > +		/omit-if-no-ref/
> > +		dsmc_int3: dsmc-int3 {
> > +			rockchip,pins =3D
> > +				/* dsmc_int3 */
> > +				<3 RK_PC3 5 &pcfg_pull_none>;
> > +		};
> > +		/omit-if-no-ref/
> > +		dsmc_rdyn: dsmc-rdyn {
> > +			rockchip,pins =3D
> > +				/* dsmc_rdyn */
> > +				<3 RK_PA4 5 &pcfg_pull_none>;
> > +		};
> > +		/omit-if-no-ref/
> > +		dsmc_resetn: dsmc-resetn {
> > +			rockchip,pins =3D
> > +				/* dsmc_resetn */
> > +				<3 RK_PD7 5 &pcfg_pull_none>;
> > +		};
> > +	};
> > +
> > +	dsmc_testclk {
> > +		/omit-if-no-ref/
> > +		dsmc_testclk_out: dsmc-testclk-out {
> > +			rockchip,pins =3D
> > +				/* dsmc_testclk_out */
> > +				<3 RK_PC2 7 &pcfg_pull_none>;
> > +		};
> > +	};
> > +
> > +	dsmc_testdata {
> > +		/omit-if-no-ref/
> > +		dsmc_testdata_out: dsmc-testdata-out {
> > +			rockchip,pins =3D
> > +				/* dsmc_testdata_out */
> > +				<3 RK_PC3 7 &pcfg_pull_none>;
> > +		};
> > +	};
> > +
> > +	edp_tx {
> > +		/omit-if-no-ref/
> > +		edp_txm0_pins: edp_txm0-pins {
> > +			rockchip,pins =3D
> > +				/* edp_tx_hpdin_m0 */
> > +				<4 RK_PC1 12 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		edp_txm1_pins: edp_txm1-pins {
> > +			rockchip,pins =3D
> > +				/* edp_tx_hpdin_m1 */
> > +				<0 RK_PB6 10 &pcfg_pull_none>;
> > +		};
> > +	};
> > +
> > +	emmc {
> > +		/omit-if-no-ref/
> > +		emmc_rstnout: emmc-rstnout {
> > +			rockchip,pins =3D
> > +				/* emmc_rstn */
> > +				<1 RK_PB3 1 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		emmc_bus8: emmc-bus8 {
> > +			rockchip,pins =3D
> > +				/* emmc_d0 */
> > +				<1 RK_PA0 1 &pcfg_pull_up_drv_level_2>,
> > +				/* emmc_d1 */
> > +				<1 RK_PA1 1 &pcfg_pull_up_drv_level_2>,
> > +				/* emmc_d2 */
> > +				<1 RK_PA2 1 &pcfg_pull_up_drv_level_2>,
> > +				/* emmc_d3 */
> > +				<1 RK_PA3 1 &pcfg_pull_up_drv_level_2>,
> > +				/* emmc_d4 */
> > +				<1 RK_PA4 1 &pcfg_pull_up_drv_level_2>,
> > +				/* emmc_d5 */
> > +				<1 RK_PA5 1 &pcfg_pull_up_drv_level_2>,
> > +				/* emmc_d6 */
> > +				<1 RK_PA6 1 &pcfg_pull_up_drv_level_2>,
> > +				/* emmc_d7 */
> > +				<1 RK_PA7 1 &pcfg_pull_up_drv_level_2>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		emmc_clk: emmc-clk {
> > +			rockchip,pins =3D
> > +				/* emmc_clk */
> > +				<1 RK_PB1 1 &pcfg_pull_up_drv_level_2>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		emmc_cmd: emmc-cmd {
> > +			rockchip,pins =3D
> > +				/* emmc_cmd */
> > +				<1 RK_PB0 1 &pcfg_pull_up_drv_level_2>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		emmc_strb: emmc-strb {
> > +			rockchip,pins =3D
> > +				/* emmc_strb */
> > +				<1 RK_PB2 1 &pcfg_pull_none>;
> > +		};
> > +	};
> > +
> > +	emmc_testclk {
> > +		/omit-if-no-ref/
> > +		emmc_testclk_test: emmc_testclk-test {
> > +			rockchip,pins =3D
> > +				/* emmc_testclk_out */
> > +				<1 RK_PB3 6 &pcfg_pull_none>;
> > +		};
> > +	};
> > +
> > +	emmc_testdata {
> > +		/omit-if-no-ref/
> > +		emmc_testdata_test: emmc_testdata-test {
> > +			rockchip,pins =3D
> > +				/* emmc_testdata_out */
> > +				<1 RK_PB7 5 &pcfg_pull_none>;
> > +		};
> > +	};
> > +
> > +	eth0 {
> > +		/omit-if-no-ref/
> > +		eth0m0_miim: eth0m0-miim {
> > +			rockchip,pins =3D
> > +				/* eth0_mdc_m0 */
> > +				<3 RK_PA6 3 &pcfg_pull_none>,
> > +				/* eth0_mdio_m0 */
> > +				<3 RK_PA5 3 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		eth0m0_rx_bus2: eth0m0-rx_bus2 {
> > +			rockchip,pins =3D
> > +				/* eth0_rxctl_m0 */
> > +				<3 RK_PA7 3 &pcfg_pull_none>,
> > +				/* eth0_rxd0_m0 */
> > +				<3 RK_PB2 3 &pcfg_pull_none>,
> > +				/* eth0_rxd1_m0 */
> > +				<3 RK_PB1 3 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		eth0m0_tx_bus2: eth0m0-tx_bus2 {
> > +			rockchip,pins =3D
> > +				/* eth0_txctl_m0 */
> > +				<3 RK_PB3 3 &pcfg_pull_none>,
> > +				/* eth0_txd0_m0 */
> > +				<3 RK_PB5 3 &pcfg_pull_none>,
> > +				/* eth0_txd1_m0 */
> > +				<3 RK_PB4 3 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		eth0m0_rgmii_clk: eth0m0-rgmii_clk {
> > +			rockchip,pins =3D
> > +				/* eth0_rxclk_m0 */
> > +				<3 RK_PD1 3 &pcfg_pull_none>,
> > +				/* eth0_txclk_m0 */
> > +				<3 RK_PB6 3 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		eth0m0_rgmii_bus: eth0m0-rgmii_bus {
> > +			rockchip,pins =3D
> > +				/* eth0_rxd2_m0 */
> > +				<3 RK_PD3 3 &pcfg_pull_none>,
> > +				/* eth0_rxd3_m0 */
> > +				<3 RK_PD2 3 &pcfg_pull_none>,
> > +				/* eth0_txd2_m0 */
> > +				<3 RK_PC3 3 &pcfg_pull_none>,
> > +				/* eth0_txd3_m0 */
> > +				<3 RK_PC2 3 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		eth0m0_mclk: eth0m0-mclk {
> > +			rockchip,pins =3D
> > +				/* eth0m0_mclk */
> > +				<3 RK_PB0 3 &pcfg_pull_none>;
> > +		};
> > +		/omit-if-no-ref/
> > +		eth0m0_ppsclk: eth0m0-ppsclk {
> > +			rockchip,pins =3D
> > +				/* eth0m0_ppsclk */
> > +				<3 RK_PC0 3 &pcfg_pull_none>;
> > +		};
> > +		/omit-if-no-ref/
> > +		eth0m0_ppstrig: eth0m0-ppstrig {
> > +			rockchip,pins =3D
> > +				/* eth0m0_ppstrig */
> > +				<3 RK_PB7 3 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		eth0m1_miim: eth0m1-miim {
> > +			rockchip,pins =3D
> > +				/* eth0_mdc_m1 */
> > +				<3 RK_PA1 3 &pcfg_pull_none>,
> > +				/* eth0_mdio_m1 */
> > +				<3 RK_PA0 3 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		eth0m1_rx_bus2: eth0m1-rx_bus2 {
> > +			rockchip,pins =3D
> > +				/* eth0_rxctl_m1 */
> > +				<3 RK_PA2 3 &pcfg_pull_none>,
> > +				/* eth0_rxd0_m1 */
> > +				<2 RK_PA6 3 &pcfg_pull_none>,
> > +				/* eth0_rxd1_m1 */
> > +				<3 RK_PA3 3 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		eth0m1_tx_bus2: eth0m1-tx_bus2 {
> > +			rockchip,pins =3D
> > +				/* eth0_txctl_m1 */
> > +				<2 RK_PA7 3 &pcfg_pull_none>,
> > +				/* eth0_txd0_m1 */
> > +				<2 RK_PB1 3 &pcfg_pull_none>,
> > +				/* eth0_txd1_m1 */
> > +				<2 RK_PB0 3 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		eth0m1_rgmii_clk: eth0m1-rgmii_clk {
> > +			rockchip,pins =3D
> > +				/* eth0_rxclk_m1 */
> > +				<2 RK_PB5 3 &pcfg_pull_none>,
> > +				/* eth0_txclk_m1 */
> > +				<2 RK_PB3 3 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		eth0m1_rgmii_bus: eth0m1-rgmii_bus {
> > +			rockchip,pins =3D
> > +				/* eth0_rxd2_m1 */
> > +				<2 RK_PB7 3 &pcfg_pull_none>,
> > +				/* eth0_rxd3_m1 */
> > +				<2 RK_PB6 3 &pcfg_pull_none>,
> > +				/* eth0_txd2_m1 */
> > +				<2 RK_PB4 3 &pcfg_pull_none>,
> > +				/* eth0_txd3_m1 */
> > +				<2 RK_PB2 3 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		eth0m1_mclk: eth0m1-mclk {
> > +			rockchip,pins =3D
> > +				/* eth0m1_mclk */
> > +				<2 RK_PD6 3 &pcfg_pull_none>;
> > +		};
> > +		/omit-if-no-ref/
> > +		eth0m1_ppsclk: eth0m1-ppsclk {
> > +			rockchip,pins =3D
> > +				/* eth0m1_ppsclk */
> > +				<2 RK_PC1 3 &pcfg_pull_none>;
> > +		};
> > +		/omit-if-no-ref/
> > +		eth0m1_ppstrig: eth0m1-ppstrig {
> > +			rockchip,pins =3D
> > +				/* eth0m1_ppstrig */
> > +				<2 RK_PC2 3 &pcfg_pull_none>;
> > +		};
> > +	};
> > +
> > +	eth1 {
> > +		/omit-if-no-ref/
> > +		eth1m0_miim: eth1m0-miim {
> > +			rockchip,pins =3D
> > +				/* eth1_mdc_m0 */
> > +				<2 RK_PD4 2 &pcfg_pull_none>,
> > +				/* eth1_mdio_m0 */
> > +				<2 RK_PD5 2 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		eth1m0_rx_bus2: eth1m0-rx_bus2 {
> > +			rockchip,pins =3D
> > +				/* eth1_rxctl_m0 */
> > +				<2 RK_PD3 2 &pcfg_pull_none>,
> > +				/* eth1_rxd0_m0 */
> > +				<2 RK_PD1 2 &pcfg_pull_none>,
> > +				/* eth1_rxd1_m0 */
> > +				<2 RK_PD2 2 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		eth1m0_tx_bus2: eth1m0-tx_bus2 {
> > +			rockchip,pins =3D
> > +				/* eth1_txctl_m0 */
> > +				<2 RK_PD0 2 &pcfg_pull_none>,
> > +				/* eth1_txd0_m0 */
> > +				<2 RK_PC6 2 &pcfg_pull_none>,
> > +				/* eth1_txd1_m0 */
> > +				<2 RK_PC7 2 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		eth1m0_rgmii_clk: eth1m0-rgmii_clk {
> > +			rockchip,pins =3D
> > +				/* eth1_rxclk_m0 */
> > +				<2 RK_PC2 2 &pcfg_pull_none>,
> > +				/* eth1_txclk_m0 */
> > +				<2 RK_PC5 2 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		eth1m0_rgmii_bus: eth1m0-rgmii_bus {
> > +			rockchip,pins =3D
> > +				/* eth1_rxd2_m0 */
> > +				<2 RK_PC0 2 &pcfg_pull_none>,
> > +				/* eth1_rxd3_m0 */
> > +				<2 RK_PC1 2 &pcfg_pull_none>,
> > +				/* eth1_txd2_m0 */
> > +				<2 RK_PC3 2 &pcfg_pull_none>,
> > +				/* eth1_txd3_m0 */
> > +				<2 RK_PC4 2 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		eth1m0_mclk: eth1m0-mclk {
> > +			rockchip,pins =3D
> > +				/* eth1m0_mclk */
> > +				<2 RK_PD7 2 &pcfg_pull_none>;
> > +		};
> > +		/omit-if-no-ref/
> > +		eth1m0_ppsclk: eth1m0-ppsclk {
> > +			rockchip,pins =3D
> > +				/* eth1m0_ppsclk */
> > +				<3 RK_PA2 2 &pcfg_pull_none>;
> > +		};
> > +		/omit-if-no-ref/
> > +		eth1m0_ppstrig: eth1m0-ppstrig {
> > +			rockchip,pins =3D
> > +				/* eth1m0_ppstrig */
> > +				<3 RK_PA1 2 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		eth1m1_miim: eth1m1-miim {
> > +			rockchip,pins =3D
> > +				/* eth1_mdc_m1 */
> > +				<1 RK_PD2 1 &pcfg_pull_none>,
> > +				/* eth1_mdio_m1 */
> > +				<1 RK_PD3 1 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		eth1m1_rx_bus2: eth1m1-rx_bus2 {
> > +			rockchip,pins =3D
> > +				/* eth1_rxctl_m1 */
> > +				<1 RK_PD1 1 &pcfg_pull_none>,
> > +				/* eth1_rxd0_m1 */
> > +				<1 RK_PC7 1 &pcfg_pull_none>,
> > +				/* eth1_rxd1_m1 */
> > +				<1 RK_PD0 1 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		eth1m1_tx_bus2: eth1m1-tx_bus2 {
> > +			rockchip,pins =3D
> > +				/* eth1_txctl_m1 */
> > +				<1 RK_PC6 1 &pcfg_pull_none>,
> > +				/* eth1_txd0_m1 */
> > +				<1 RK_PC4 1 &pcfg_pull_none>,
> > +				/* eth1_txd1_m1 */
> > +				<1 RK_PC5 1 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		eth1m1_rgmii_clk: eth1m1-rgmii_clk {
> > +			rockchip,pins =3D
> > +				/* eth1_rxclk_m1 */
> > +				<1 RK_PB6 1 &pcfg_pull_none>,
> > +				/* eth1_txclk_m1 */
> > +				<1 RK_PC1 1 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		eth1m1_rgmii_bus: eth1m1-rgmii_bus {
> > +			rockchip,pins =3D
> > +				/* eth1_rxd2_m1 */
> > +				<1 RK_PB4 1 &pcfg_pull_none>,
> > +				/* eth1_rxd3_m1 */
> > +				<1 RK_PB5 1 &pcfg_pull_none>,
> > +				/* eth1_txd2_m1 */
> > +				<1 RK_PB7 1 &pcfg_pull_none>,
> > +				/* eth1_txd3_m1 */
> > +				<1 RK_PC0 1 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		eth1m1_mclk: eth1m1-mclk {
> > +			rockchip,pins =3D
> > +				/* eth1m1_mclk */
> > +				<1 RK_PD4 1 &pcfg_pull_none>;
> > +		};
> > +		/omit-if-no-ref/
> > +		eth1m1_ppsclk: eth1m1-ppsclk {
> > +			rockchip,pins =3D
> > +				/* eth1m1_ppsclk */
> > +				<1 RK_PC2 1 &pcfg_pull_none>;
> > +		};
> > +		/omit-if-no-ref/
> > +		eth1m1_ppstrig: eth1m1-ppstrig {
> > +			rockchip,pins =3D
> > +				/* eth1m1_ppstrig */
> > +				<1 RK_PC3 1 &pcfg_pull_none>;
> > +		};
> > +	};
> > +
> > +	eth0_ptp {
> > +		/omit-if-no-ref/
> > +		eth0m0_ptp_refclk: eth0m0-ptp-refclk {
> > +			rockchip,pins =3D
> > +				/* eth0m0_ptp_refclk */
> > +				<3 RK_PC1 3 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		eth0m1_ptp_refclk: eth0m1-ptp-refclk {
> > +			rockchip,pins =3D
> > +				/* eth0m1_ptp_refclk */
> > +				<2 RK_PC0 3 &pcfg_pull_none>;
> > +		};
> > +	};
> > +
> > +	eth0_testrxclk {
> > +		/omit-if-no-ref/
> > +		eth0_testrxclkm0_test: eth0_testrxclkm0-test {
> > +			rockchip,pins =3D
> > +				/* eth0_testrxclk_out_m0 */
> > +				<3 RK_PC7 3 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		eth0_testrxclkm1_test: eth0_testrxclkm1-test {
> > +			rockchip,pins =3D
> > +				/* eth0_testrxclk_out_m1 */
> > +				<2 RK_PC5 6 &pcfg_pull_none>;
> > +		};
> > +	};
> > +
> > +	eth0_testrxd {
> > +		/omit-if-no-ref/
> > +		eth0_testrxdm0_test: eth0_testrxdm0-test {
> > +			rockchip,pins =3D
> > +				/* eth0_testrxd_out_m0 */
> > +				<3 RK_PD0 3 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		eth0_testrxdm1_test: eth0_testrxdm1-test {
> > +			rockchip,pins =3D
> > +				/* eth0_testrxd_out_m1 */
> > +				<2 RK_PC4 6 &pcfg_pull_none>;
> > +		};
> > +	};
> > +
> > +	eth1_ptp {
> > +		/omit-if-no-ref/
> > +		eth1m0_ptp_refclk: eth1m0-ptp-refclk {
> > +			rockchip,pins =3D
> > +				/* eth1m0_ptp_refclk */
> > +				<3 RK_PA3 2 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		eth1m1_ptp_refclk: eth1m1-ptp-refclk {
> > +			rockchip,pins =3D
> > +				/* eth1m1_ptp_refclk */
> > +				<2 RK_PB6 2 &pcfg_pull_none>;
> > +		};
> > +	};
> > +
> > +	eth1_testrxclk {
> > +		/omit-if-no-ref/
> > +		eth1_testrxclkm0_test: eth1_testrxclkm0-test {
> > +			rockchip,pins =3D
> > +				/* eth1_testrxclk_out_m0 */
> > +				<3 RK_PA1 6 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		eth1_testrxclkm1_test: eth1_testrxclkm1-test {
> > +			rockchip,pins =3D
> > +				/* eth1_testrxclk_out_m1 */
> > +				<1 RK_PC3 6 &pcfg_pull_none>;
> > +		};
> > +	};
> > +
> > +	eth1_testrxd {
> > +		/omit-if-no-ref/
> > +		eth1_testrxdm0_test: eth1_testrxdm0-test {
> > +			rockchip,pins =3D
> > +				/* eth1_testrxd_out_m0 */
> > +				<3 RK_PA0 6 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		eth1_testrxdm1_test: eth1_testrxdm1-test {
> > +			rockchip,pins =3D
> > +				/* eth1_testrxd_out_m1 */
> > +				<1 RK_PC2 6 &pcfg_pull_none>;
> > +		};
> > +	};
> > +
> > +	eth_clk0_25m {
> > +		/omit-if-no-ref/
> > +		ethm0_clk0_25m_out: ethm0-clk0-25m-out {
> > +			rockchip,pins =3D
> > +				/* ethm0_clk0_25m_out */
> > +				<3 RK_PA4 3 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		ethm1_clk0_25m_out: ethm1-clk0-25m-out {
> > +			rockchip,pins =3D
> > +				/* ethm1_clk0_25m_out */
> > +				<2 RK_PD7 3 &pcfg_pull_none>;
> > +		};
> > +	};
> > +
> > +	eth_clk1_25m {
> > +		/omit-if-no-ref/
> > +		ethm0_clk1_25m_out: ethm0-clk1-25m-out {
> > +			rockchip,pins =3D
> > +				/* ethm0_clk1_25m_out */
> > +				<2 RK_PD6 2 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		ethm1_clk1_25m_out: ethm1-clk1-25m-out {
> > +			rockchip,pins =3D
> > +				/* ethm1_clk1_25m_out */
> > +				<1 RK_PD5 1 &pcfg_pull_none>;
> > +		};
> > +	};
> > +
> > +	flexbus0 {
> > +		/omit-if-no-ref/
> > +		flexbus0m0_csn: flexbus0m0-csn {
> > +			rockchip,pins =3D
> > +				/* flexbus0_csn_m0 */
> > +				<3 RK_PA4 8 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		flexbus0m0_d13: flexbus0m0-d13 {
> > +			rockchip,pins =3D
> > +				/* flexbus0_d13_m0 */
> > +				<4 RK_PA0 6 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		flexbus0m0_d14: flexbus0m0-d14 {
> > +			rockchip,pins =3D
> > +				/* flexbus0_d14_m0 */
> > +				<4 RK_PA1 6 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		flexbus0m0_d15: flexbus0m0-d15 {
> > +			rockchip,pins =3D
> > +				/* flexbus0_d15_m0 */
> > +				<3 RK_PD7 6 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		flexbus0m1_csn: flexbus0m1-csn {
> > +			rockchip,pins =3D
> > +				/* flexbus0_csn_m1 */
> > +				<4 RK_PA1 8 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		flexbus0m1_d13: flexbus0m1-d13 {
> > +			rockchip,pins =3D
> > +				/* flexbus0_d13_m1 */
> > +				<4 RK_PA4 4 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		flexbus0m1_d14: flexbus0m1-d14 {
> > +			rockchip,pins =3D
> > +				/* flexbus0_d14_m1 */
> > +				<4 RK_PA6 4 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		flexbus0m1_d15: flexbus0m1-d15 {
> > +			rockchip,pins =3D
> > +				/* flexbus0_d15_m1 */
> > +				<4 RK_PB5 4 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		flexbus0m2_csn: flexbus0m2-csn {
> > +			rockchip,pins =3D
> > +				/* flexbus0_csn_m2 */
> > +				<3 RK_PC3 8 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		flexbus0m3_csn: flexbus0m3-csn {
> > +			rockchip,pins =3D
> > +				/* flexbus0_csn_m3 */
> > +				<3 RK_PD2 8 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		flexbus0m4_csn: flexbus0m4-csn {
> > +			rockchip,pins =3D
> > +				/* flexbus0_csn_m4 */
> > +				<4 RK_PB4 4 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		flexbus0_clk: flexbus0-clk {
> > +			rockchip,pins =3D
> > +				/* flexbus0_clk */
> > +				<3 RK_PB6 6 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		flexbus0_d10: flexbus0-d10 {
> > +			rockchip,pins =3D
> > +				/* flexbus0_d10 */
> > +				<3 RK_PC3 6 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		flexbus0_d11: flexbus0-d11 {
> > +			rockchip,pins =3D
> > +				/* flexbus0_d11 */
> > +				<3 RK_PD1 6 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		flexbus0_d12: flexbus0-d12 {
> > +			rockchip,pins =3D
> > +				/* flexbus0_d12 */
> > +				<3 RK_PD2 6 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		flexbus0_d0: flexbus0-d0 {
> > +			rockchip,pins =3D
> > +				/* flexbus0_d0 */
> > +				<3 RK_PB5 6 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		flexbus0_d1: flexbus0-d1 {
> > +			rockchip,pins =3D
> > +				/* flexbus0_d1 */
> > +				<3 RK_PB4 6 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		flexbus0_d2: flexbus0-d2 {
> > +			rockchip,pins =3D
> > +				/* flexbus0_d2 */
> > +				<3 RK_PB3 6 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		flexbus0_d3: flexbus0-d3 {
> > +			rockchip,pins =3D
> > +				/* flexbus0_d3 */
> > +				<3 RK_PB2 6 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		flexbus0_d4: flexbus0-d4 {
> > +			rockchip,pins =3D
> > +				/* flexbus0_d4 */
> > +				<3 RK_PB1 6 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		flexbus0_d5: flexbus0-d5 {
> > +			rockchip,pins =3D
> > +				/* flexbus0_d5 */
> > +				<3 RK_PA7 6 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		flexbus0_d6: flexbus0-d6 {
> > +			rockchip,pins =3D
> > +				/* flexbus0_d6 */
> > +				<3 RK_PA6 6 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		flexbus0_d7: flexbus0-d7 {
> > +			rockchip,pins =3D
> > +				/* flexbus0_d7 */
> > +				<3 RK_PA5 6 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		flexbus0_d8: flexbus0-d8 {
> > +			rockchip,pins =3D
> > +				/* flexbus0_d8 */
> > +				<3 RK_PB0 6 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		flexbus0_d9: flexbus0-d9 {
> > +			rockchip,pins =3D
> > +				/* flexbus0_d9 */
> > +				<3 RK_PC2 6 &pcfg_pull_none>;
> > +		};
> > +	};
> > +
> > +	flexbus1 {
> > +		/omit-if-no-ref/
> > +		flexbus1m0_csn: flexbus1m0-csn {
> > +			rockchip,pins =3D
> > +				/* flexbus1_csn_m0 */
> > +				<3 RK_PB7 8 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		flexbus1m0_d12: flexbus1m0-d12 {
> > +			rockchip,pins =3D
> > +				/* flexbus1_d12_m0 */
> > +				<3 RK_PD7 7 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		flexbus1m0_d13: flexbus1m0-d13 {
> > +			rockchip,pins =3D
> > +				/* flexbus1_d13_m0 */
> > +				<4 RK_PA1 7 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		flexbus1m0_d14: flexbus1m0-d14 {
> > +			rockchip,pins =3D
> > +				/* flexbus1_d14_m0 */
> > +				<4 RK_PA0 7 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		flexbus1m0_d15: flexbus1m0-d15 {
> > +			rockchip,pins =3D
> > +				/* flexbus1_d15_m0 */
> > +				<3 RK_PD2 7 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		flexbus1m1_csn: flexbus1m1-csn {
> > +			rockchip,pins =3D
> > +				/* flexbus1_csn_m1 */
> > +				<3 RK_PD7 8 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		flexbus1m1_d12: flexbus1m1-d12 {
> > +			rockchip,pins =3D
> > +				/* flexbus1_d12_m1 */
> > +				<4 RK_PA5 4 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		flexbus1m1_d13: flexbus1m1-d13 {
> > +			rockchip,pins =3D
> > +				/* flexbus1_d13_m1 */
> > +				<4 RK_PB0 4 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		flexbus1m1_d14: flexbus1m1-d14 {
> > +			rockchip,pins =3D
> > +				/* flexbus1_d14_m1 */
> > +				<4 RK_PB1 4 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		flexbus1m1_d15: flexbus1m1-d15 {
> > +			rockchip,pins =3D
> > +				/* flexbus1_d15_m1 */
> > +				<4 RK_PB2 4 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		flexbus1m2_csn: flexbus1m2-csn {
> > +			rockchip,pins =3D
> > +				/* flexbus1_csn_m2 */
> > +				<3 RK_PD1 8 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		flexbus1m3_csn: flexbus1m3-csn {
> > +			rockchip,pins =3D
> > +				/* flexbus1_csn_m3 */
> > +				<4 RK_PA0 8 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		flexbus1m4_csn: flexbus1m4-csn {
> > +			rockchip,pins =3D
> > +				/* flexbus1_csn_m4 */
> > +				<4 RK_PA3 4 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		flexbus1_clk: flexbus1-clk {
> > +			rockchip,pins =3D
> > +				/* flexbus1_clk */
> > +				<3 RK_PD6 6 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		flexbus1_d10: flexbus1-d10 {
> > +			rockchip,pins =3D
> > +				/* flexbus1_d10 */
> > +				<3 RK_PB7 6 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		flexbus1_d11: flexbus1-d11 {
> > +			rockchip,pins =3D
> > +				/* flexbus1_d11 */
> > +				<3 RK_PA4 6 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		flexbus1_d0: flexbus1-d0 {
> > +			rockchip,pins =3D
> > +				/* flexbus1_d0 */
> > +				<3 RK_PD5 6 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		flexbus1_d1: flexbus1-d1 {
> > +			rockchip,pins =3D
> > +				/* flexbus1_d1 */
> > +				<3 RK_PD4 6 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		flexbus1_d2: flexbus1-d2 {
> > +			rockchip,pins =3D
> > +				/* flexbus1_d2 */
> > +				<3 RK_PD3 6 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		flexbus1_d3: flexbus1-d3 {
> > +			rockchip,pins =3D
> > +				/* flexbus1_d3 */
> > +				<3 RK_PD0 6 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		flexbus1_d4: flexbus1-d4 {
> > +			rockchip,pins =3D
> > +				/* flexbus1_d4 */
> > +				<3 RK_PC7 6 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		flexbus1_d5: flexbus1-d5 {
> > +			rockchip,pins =3D
> > +				/* flexbus1_d5 */
> > +				<3 RK_PC6 6 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		flexbus1_d6: flexbus1-d6 {
> > +			rockchip,pins =3D
> > +				/* flexbus1_d6 */
> > +				<3 RK_PC5 6 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		flexbus1_d7: flexbus1-d7 {
> > +			rockchip,pins =3D
> > +				/* flexbus1_d7 */
> > +				<3 RK_PC4 6 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		flexbus1_d8: flexbus1-d8 {
> > +			rockchip,pins =3D
> > +				/* flexbus1_d8 */
> > +				<3 RK_PC1 6 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		flexbus1_d9: flexbus1-d9 {
> > +			rockchip,pins =3D
> > +				/* flexbus1_d9 */
> > +				<3 RK_PC0 6 &pcfg_pull_none>;
> > +		};
> > +	};
> > +
> > +	flexbus0_testclk {
> > +		/omit-if-no-ref/
> > +		flexbus0_testclk_testclk: flexbus0_testclk-testclk {
> > +			rockchip,pins =3D
> > +				/* flexbus0_testclk_out */
> > +				<2 RK_PA3 6 &pcfg_pull_none>;
> > +		};
> > +	};
> > +
> > +	flexbus0_testdata {
> > +		/omit-if-no-ref/
> > +		flexbus0_testdata_testdata: flexbus0_testdata-testdata {
> > +			rockchip,pins =3D
> > +				/* flexbus0_testdata_out */
> > +				<2 RK_PA2 6 &pcfg_pull_none>;
> > +		};
> > +	};
> > +
> > +	flexbus1_testclk {
> > +		/omit-if-no-ref/
> > +		flexbus1_testclk_testclk: flexbus1_testclk-testclk {
> > +			rockchip,pins =3D
> > +				/* flexbus1_testclk_out */
> > +				<2 RK_PA5 6 &pcfg_pull_none>;
> > +		};
> > +	};
> > +
> > +	flexbus1_testdata {
> > +		/omit-if-no-ref/
> > +		flexbus1_testdata_testdata: flexbus1_testdata-testdata {
> > +			rockchip,pins =3D
> > +				/* flexbus1_testdata_out */
> > +				<2 RK_PA4 6 &pcfg_pull_none>;
> > +		};
> > +	};
> > +
> > +	fspi0 {
> > +		/omit-if-no-ref/
> > +		fspi0_pins: fspi0-pins {
> > +			rockchip,pins =3D
> > +				/* fspi0_clk */
> > +				<1 RK_PB1 2 &pcfg_pull_none>,
> > +				/* fspi0_d0 */
> > +				<1 RK_PA0 2 &pcfg_pull_none>,
> > +				/* fspi0_d1 */
> > +				<1 RK_PA1 2 &pcfg_pull_none>,
> > +				/* fspi0_d2 */
> > +				<1 RK_PA2 2 &pcfg_pull_none>,
> > +				/* fspi0_d3 */
> > +				<1 RK_PA3 2 &pcfg_pull_none>,
> > +				/* fspi0_d4 */
> > +				<1 RK_PA4 2 &pcfg_pull_none>,
> > +				/* fspi0_d5 */
> > +				<1 RK_PA5 2 &pcfg_pull_none>,
> > +				/* fspi0_d6 */
> > +				<1 RK_PA6 2 &pcfg_pull_none>,
> > +				/* fspi0_d7 */
> > +				<1 RK_PA7 2 &pcfg_pull_none>,
> > +				/* fspi0_dqs */
> > +				<1 RK_PB2 2 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		fspi0_csn0: fspi0-csn0 {
> > +			rockchip,pins =3D
> > +				/* fspi0_csn0 */
> > +				<1 RK_PB3 2 &pcfg_pull_none>;
> > +		};
> > +		/omit-if-no-ref/
> > +		fspi0_csn1: fspi0-csn1 {
> > +			rockchip,pins =3D
> > +				/* fspi0_csn1 */
> > +				<1 RK_PB0 2 &pcfg_pull_none>;
> > +		};
> > +	};
> > +
> > +	fspi1 {
> > +		/omit-if-no-ref/
> > +		fspi1m0_pins: fspi1m0-pins {
> > +			rockchip,pins =3D
> > +				/* fspi1_clk_m0 */
> > +				<2 RK_PA5 2 &pcfg_pull_none>,
> > +				/* fspi1_d0_m0 */
> > +				<2 RK_PA0 2 &pcfg_pull_none>,
> > +				/* fspi1_d1_m0 */
> > +				<2 RK_PA1 2 &pcfg_pull_none>,
> > +				/* fspi1_d2_m0 */
> > +				<2 RK_PA2 2 &pcfg_pull_none>,
> > +				/* fspi1_d3_m0 */
> > +				<2 RK_PA3 2 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		fspi1m0_csn0: fspi1m0-csn0 {
> > +			rockchip,pins =3D
> > +				/* fspi1m0_csn0 */
> > +				<2 RK_PA4 2 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		fspi1m1_pins: fspi1m1-pins {
> > +			rockchip,pins =3D
> > +				/* fspi1_clk_m1 */
> > +				<1 RK_PD5 3 &pcfg_pull_none>,
> > +				/* fspi1_d0_m1 */
> > +				<1 RK_PC4 3 &pcfg_pull_none>,
> > +				/* fspi1_d1_m1 */
> > +				<1 RK_PC5 3 &pcfg_pull_none>,
> > +				/* fspi1_d2_m1 */
> > +				<1 RK_PC6 3 &pcfg_pull_none>,
> > +				/* fspi1_d3_m1 */
> > +				<1 RK_PC7 3 &pcfg_pull_none>,
> > +				/* fspi1_d4_m1 */
> > +				<1 RK_PD0 3 &pcfg_pull_none>,
> > +				/* fspi1_d5_m1 */
> > +				<1 RK_PD1 3 &pcfg_pull_none>,
> > +				/* fspi1_d6_m1 */
> > +				<1 RK_PD2 3 &pcfg_pull_none>,
> > +				/* fspi1_d7_m1 */
> > +				<1 RK_PD3 3 &pcfg_pull_none>,
> > +				/* fspi1_dqs_m1 */
> > +				<1 RK_PD4 3 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		fspi1m1_csn0: fspi1m1-csn0 {
> > +			rockchip,pins =3D
> > +				/* fspi1m1_csn0 */
> > +				<1 RK_PC3 3 &pcfg_pull_none>;
> > +		};
> > +		/omit-if-no-ref/
> > +		fspi1m1_csn1: fspi1m1-csn1 {
> > +			rockchip,pins =3D
> > +				/* fspi1m1_csn1 */
> > +				<1 RK_PC2 3 &pcfg_pull_none>;
> > +		};
> > +	};
> > +
> > +	fspi0_testclk {
> > +		/omit-if-no-ref/
> > +		fspi0_testclk_test: fspi0_testclk-test {
> > +			rockchip,pins =3D
> > +				/* fspi0_testclk_out */
> > +				<1 RK_PB0 6 &pcfg_pull_none>;
> > +		};
> > +	};
> > +
> > +	fspi0_testdata {
> > +		/omit-if-no-ref/
> > +		fspi0_testdata_test: fspi0_testdata-test {
> > +			rockchip,pins =3D
> > +				/* fspi0_testdata_out */
> > +				<1 RK_PB7 6 &pcfg_pull_none>;
> > +		};
> > +	};
> > +
> > +	fspi1_testclk {
> > +		/omit-if-no-ref/
> > +		fspi1_testclkm1_test: fspi1_testclkm1-test {
> > +			rockchip,pins =3D
> > +				/* fspi1_testclk_out_m1 */
> > +				<1 RK_PC1 7 &pcfg_pull_none>;
> > +		};
> > +	};
> > +
> > +	fspi1_testdata {
> > +		/omit-if-no-ref/
> > +		fspi1_testdatam1_test: fspi1_testdatam1-test {
> > +			rockchip,pins =3D
> > +				/* fspi1_testdata_out_m1 */
> > +				<1 RK_PB7 7 &pcfg_pull_none>;
> > +		};
> > +	};
> > +
> > +	gpu {
> > +		/omit-if-no-ref/
> > +		gpu_pins: gpu-pins {
> > +			rockchip,pins =3D
> > +				/* gpu_avs */
> > +				<0 RK_PD3 11 &pcfg_pull_none>;
> > +		};
> > +	};
> > +
> > +	hdmi_tx {
> > +		/omit-if-no-ref/
> > +		hdmi_txm0_pins: hdmi_txm0-pins {
> > +			rockchip,pins =3D
> > +				/* hdmi_tx_cec_m0 */
> > +				<4 RK_PC0 9 &pcfg_pull_none>,
> > +				/* hdmi_tx_hpdin_m0 */
> > +				<4 RK_PC1 9 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		hdmi_txm1_pins: hdmi_txm1-pins {
> > +			rockchip,pins =3D
> > +				/* hdmi_tx_cec_m1 */
> > +				<0 RK_PC3 9 &pcfg_pull_none>,
> > +				/* hdmi_tx_hpdin_m1 */
> > +				<0 RK_PB6 9 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		hdmi_tx_scl: hdmi-tx-scl {
> > +			rockchip,pins =3D
> > +				/* hdmi_tx_scl */
> > +				<4 RK_PC2 9 &pcfg_pull_none>;
> > +		};
> > +		/omit-if-no-ref/
> > +		hdmi_tx_sda: hdmi-tx-sda {
> > +			rockchip,pins =3D
> > +				/* hdmi_tx_sda */
> > +				<4 RK_PC3 9 &pcfg_pull_none>;
> > +		};
> > +	};
> > +
> > +	i2c0 {
> > +		/omit-if-no-ref/
> > +		i2c0m0_xfer: i2c0m0-xfer {
> > +			rockchip,pins =3D
> > +				/* i2c0_scl_m0 */
> > +				<0 RK_PB0 11 &pcfg_pull_none_smt>,
> > +				/* i2c0_sda_m0 */
> > +				<0 RK_PB1 11 &pcfg_pull_none_smt>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		i2c0m1_xfer: i2c0m1-xfer {
> > +			rockchip,pins =3D
> > +				/* i2c0_scl_m1 */
> > +				<0 RK_PC1 9 &pcfg_pull_none_smt>,
> > +				/* i2c0_sda_m1 */
> > +				<0 RK_PC2 9 &pcfg_pull_none_smt>;
> > +		};
> > +	};
> > +
> > +	i2c1 {
> > +		/omit-if-no-ref/
> > +		i2c1m0_xfer: i2c1m0-xfer {
> > +			rockchip,pins =3D
> > +				/* i2c1_scl_m0 */
> > +				<0 RK_PB2 11 &pcfg_pull_none_smt>,
> > +				/* i2c1_sda_m0 */
> > +				<0 RK_PB3 11 &pcfg_pull_none_smt>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		i2c1m1_xfer: i2c1m1-xfer {
> > +			rockchip,pins =3D
> > +				/* i2c1_scl_m1 */
> > +				<0 RK_PB4 9 &pcfg_pull_none_smt>,
> > +				/* i2c1_sda_m1 */
> > +				<0 RK_PB5 9 &pcfg_pull_none_smt>;
> > +		};
> > +	};
> > +
> > +	i2c2 {
> > +		/omit-if-no-ref/
> > +		i2c2m0_xfer: i2c2m0-xfer {
> > +			rockchip,pins =3D
> > +				/* i2c2_scl_m0 */
> > +				<0 RK_PB7 9 &pcfg_pull_none_smt>,
> > +				/* i2c2_sda_m0 */
> > +				<0 RK_PC0 9 &pcfg_pull_none_smt>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		i2c2m1_xfer: i2c2m1-xfer {
> > +			rockchip,pins =3D
> > +				/* i2c2_scl_m1 */
> > +				<1 RK_PA0 10 &pcfg_pull_none_smt>,
> > +				/* i2c2_sda_m1 */
> > +				<1 RK_PA1 10 &pcfg_pull_none_smt>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		i2c2m2_xfer: i2c2m2-xfer {
> > +			rockchip,pins =3D
> > +				/* i2c2_scl_m2 */
> > +				<4 RK_PA3 11 &pcfg_pull_none_smt>,
> > +				/* i2c2_sda_m2 */
> > +				<4 RK_PA5 11 &pcfg_pull_none_smt>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		i2c2m3_xfer: i2c2m3-xfer {
> > +			rockchip,pins =3D
> > +				/* i2c2_scl_m3 */
> > +				<4 RK_PC2 11 &pcfg_pull_none_smt>,
> > +				/* i2c2_sda_m3 */
> > +				<4 RK_PC3 11 &pcfg_pull_none_smt>;
> > +		};
> > +	};
> > +
> > +	i2c3 {
> > +		/omit-if-no-ref/
> > +		i2c3m0_xfer: i2c3m0-xfer {
> > +			rockchip,pins =3D
> > +				/* i2c3_scl_m0 */
> > +				<4 RK_PB5 11 &pcfg_pull_none_smt>,
> > +				/* i2c3_sda_m0 */
> > +				<4 RK_PB4 11 &pcfg_pull_none_smt>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		i2c3m1_xfer: i2c3m1-xfer {
> > +			rockchip,pins =3D
> > +				/* i2c3_scl_m1 */
> > +				<0 RK_PC6 9 &pcfg_pull_none_smt>,
> > +				/* i2c3_sda_m1 */
> > +				<0 RK_PC7 9 &pcfg_pull_none_smt>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		i2c3m2_xfer: i2c3m2-xfer {
> > +			rockchip,pins =3D
> > +				/* i2c3_scl_m2 */
> > +				<3 RK_PD4 11 &pcfg_pull_none_smt>,
> > +				/* i2c3_sda_m2 */
> > +				<3 RK_PD5 11 &pcfg_pull_none_smt>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		i2c3m3_xfer: i2c3m3-xfer {
> > +			rockchip,pins =3D
> > +				/* i2c3_scl_m3 */
> > +				<4 RK_PC4 11 &pcfg_pull_none_smt>,
> > +				/* i2c3_sda_m3 */
> > +				<4 RK_PC5 11 &pcfg_pull_none_smt>;
> > +		};
> > +	};
> > +
> > +	i2c4 {
> > +		/omit-if-no-ref/
> > +		i2c4m0_xfer: i2c4m0-xfer {
> > +			rockchip,pins =3D
> > +				/* i2c4_scl_m0 */
> > +				<0 RK_PD2 9 &pcfg_pull_none_smt>,
> > +				/* i2c4_sda_m0 */
> > +				<0 RK_PD3 9 &pcfg_pull_none_smt>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		i2c4m1_xfer: i2c4m1-xfer {
> > +			rockchip,pins =3D
> > +				/* i2c4_scl_m1 */
> > +				<4 RK_PA4 11 &pcfg_pull_none_smt>,
> > +				/* i2c4_sda_m1 */
> > +				<4 RK_PA6 11 &pcfg_pull_none_smt>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		i2c4m2_xfer: i2c4m2-xfer {
> > +			rockchip,pins =3D
> > +				/* i2c4_scl_m2 */
> > +				<2 RK_PA6 11 &pcfg_pull_none_smt>,
> > +				/* i2c4_sda_m2 */
> > +				<2 RK_PA7 11 &pcfg_pull_none_smt>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		i2c4m3_xfer: i2c4m3-xfer {
> > +			rockchip,pins =3D
> > +				/* i2c4_scl_m3 */
> > +				<3 RK_PC0 11 &pcfg_pull_none_smt>,
> > +				/* i2c4_sda_m3 */
> > +				<3 RK_PB7 11 &pcfg_pull_none_smt>;
> > +		};
> > +	};
> > +
> > +	i2c5 {
> > +		/omit-if-no-ref/
> > +		i2c5m0_xfer: i2c5m0-xfer {
> > +			rockchip,pins =3D
> > +				/* i2c5_scl_m0 */
> > +				<2 RK_PA5 11 &pcfg_pull_none_smt>,
> > +				/* i2c5_sda_m0 */
> > +				<2 RK_PA4 11 &pcfg_pull_none_smt>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		i2c5m1_xfer: i2c5m1-xfer {
> > +			rockchip,pins =3D
> > +				/* i2c5_scl_m1 */
> > +				<1 RK_PD4 10 &pcfg_pull_none_smt>,
> > +				/* i2c5_sda_m1 */
> > +				<1 RK_PD5 10 &pcfg_pull_none_smt>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		i2c5m2_xfer: i2c5m2-xfer {
> > +			rockchip,pins =3D
> > +				/* i2c5_scl_m2 */
> > +				<2 RK_PC6 11 &pcfg_pull_none_smt>,
> > +				/* i2c5_sda_m2 */
> > +				<2 RK_PC7 11 &pcfg_pull_none_smt>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		i2c5m3_xfer: i2c5m3-xfer {
> > +			rockchip,pins =3D
> > +				/* i2c5_scl_m3 */
> > +				<3 RK_PC4 11 &pcfg_pull_none_smt>,
> > +				/* i2c5_sda_m3 */
> > +				<3 RK_PC1 11 &pcfg_pull_none_smt>;
> > +		};
> > +	};
> > +
> > +	i2c6 {
> > +		/omit-if-no-ref/
> > +		i2c6m0_xfer: i2c6m0-xfer {
> > +			rockchip,pins =3D
> > +				/* i2c6_scl_m0 */
> > +				<0 RK_PA2 11 &pcfg_pull_none_smt>,
> > +				/* i2c6_sda_m0 */
> > +				<0 RK_PA5 11 &pcfg_pull_none_smt>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		i2c6m1_xfer: i2c6m1-xfer {
> > +			rockchip,pins =3D
> > +				/* i2c6_scl_m1 */
> > +				<1 RK_PC2 10 &pcfg_pull_none_smt>,
> > +				/* i2c6_sda_m1 */
> > +				<1 RK_PC3 10 &pcfg_pull_none_smt>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		i2c6m2_xfer: i2c6m2-xfer {
> > +			rockchip,pins =3D
> > +				/* i2c6_scl_m2 */
> > +				<2 RK_PD0 11 &pcfg_pull_none_smt>,
> > +				/* i2c6_sda_m2 */
> > +				<2 RK_PD1 11 &pcfg_pull_none_smt>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		i2c6m3_xfer: i2c6m3-xfer {
> > +			rockchip,pins =3D
> > +				/* i2c6_scl_m3 */
> > +				<4 RK_PC6 11 &pcfg_pull_none_smt>,
> > +				/* i2c6_sda_m3 */
> > +				<4 RK_PC7 11 &pcfg_pull_none_smt>;
> > +		};
> > +	};
> > +
> > +	i2c7 {
> > +		/omit-if-no-ref/
> > +		i2c7m0_xfer: i2c7m0-xfer {
> > +			rockchip,pins =3D
> > +				/* i2c7_scl_m0 */
> > +				<1 RK_PB0 10 &pcfg_pull_none_smt>,
> > +				/* i2c7_sda_m0 */
> > +				<1 RK_PB3 10 &pcfg_pull_none_smt>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		i2c7m1_xfer: i2c7m1-xfer {
> > +			rockchip,pins =3D
> > +				/* i2c7_scl_m1 */
> > +				<3 RK_PA0 11 &pcfg_pull_none_smt>,
> > +				/* i2c7_sda_m1 */
> > +				<3 RK_PA1 11 &pcfg_pull_none_smt>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		i2c7m2_xfer: i2c7m2-xfer {
> > +			rockchip,pins =3D
> > +				/* i2c7_scl_m2 */
> > +				<4 RK_PA0 11 &pcfg_pull_none_smt>,
> > +				/* i2c7_sda_m2 */
> > +				<4 RK_PA1 11 &pcfg_pull_none_smt>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		i2c7m3_xfer: i2c7m3-xfer {
> > +			rockchip,pins =3D
> > +				/* i2c7_scl_m3 */
> > +				<4 RK_PC0 11 &pcfg_pull_none_smt>,
> > +				/* i2c7_sda_m3 */
> > +				<4 RK_PC1 11 &pcfg_pull_none_smt>;
> > +		};
> > +	};
> > +
> > +	i2c8 {
> > +		/omit-if-no-ref/
> > +		i2c8m0_xfer: i2c8m0-xfer {
> > +			rockchip,pins =3D
> > +				/* i2c8_scl_m0 */
> > +				<2 RK_PA0 11 &pcfg_pull_none_smt>,
> > +				/* i2c8_sda_m0 */
> > +				<2 RK_PA1 11 &pcfg_pull_none_smt>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		i2c8m1_xfer: i2c8m1-xfer {
> > +			rockchip,pins =3D
> > +				/* i2c8_scl_m1 */
> > +				<1 RK_PC6 10 &pcfg_pull_none_smt>,
> > +				/* i2c8_sda_m1 */
> > +				<1 RK_PC7 10 &pcfg_pull_none_smt>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		i2c8m2_xfer: i2c8m2-xfer {
> > +			rockchip,pins =3D
> > +				/* i2c8_scl_m2 */
> > +				<2 RK_PB6 11 &pcfg_pull_none_smt>,
> > +				/* i2c8_sda_m2 */
> > +				<2 RK_PB7 11 &pcfg_pull_none_smt>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		i2c8m3_xfer: i2c8m3-xfer {
> > +			rockchip,pins =3D
> > +				/* i2c8_scl_m3 */
> > +				<3 RK_PB3 11 &pcfg_pull_none_smt>,
> > +				/* i2c8_sda_m3 */
> > +				<3 RK_PB2 11 &pcfg_pull_none_smt>;
> > +		};
> > +	};
> > +
> > +	i2c9 {
> > +		/omit-if-no-ref/
> > +		i2c9m0_xfer: i2c9m0-xfer {
> > +			rockchip,pins =3D
> > +				/* i2c9_scl_m0 */
> > +				<1 RK_PA5 10 &pcfg_pull_none_smt>,
> > +				/* i2c9_sda_m0 */
> > +				<1 RK_PA6 10 &pcfg_pull_none_smt>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		i2c9m1_xfer: i2c9m1-xfer {
> > +			rockchip,pins =3D
> > +				/* i2c9_scl_m1 */
> > +				<1 RK_PB5 10 &pcfg_pull_none_smt>,
> > +				/* i2c9_sda_m1 */
> > +				<1 RK_PB4 10 &pcfg_pull_none_smt>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		i2c9m2_xfer: i2c9m2-xfer {
> > +			rockchip,pins =3D
> > +				/* i2c9_scl_m2 */
> > +				<2 RK_PD5 11 &pcfg_pull_none_smt>,
> > +				/* i2c9_sda_m2 */
> > +				<2 RK_PD4 11 &pcfg_pull_none_smt>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		i2c9m3_xfer: i2c9m3-xfer {
> > +			rockchip,pins =3D
> > +				/* i2c9_scl_m3 */
> > +				<3 RK_PC2 11 &pcfg_pull_none_smt>,
> > +				/* i2c9_sda_m3 */
> > +				<3 RK_PC3 11 &pcfg_pull_none_smt>;
> > +		};
> > +	};
> > +
> > +	i3c0 {
> > +		/omit-if-no-ref/
> > +		i3c0m0_xfer: i3c0m0-xfer {
> > +			rockchip,pins =3D
> > +				/* i3c0_scl_m0 */
> > +				<0 RK_PC1 11 &pcfg_pull_none_smt>,
> > +				/* i3c0_sda_m0 */
> > +				<0 RK_PC2 11 &pcfg_pull_none_smt>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		i3c0m1_xfer: i3c0m1-xfer {
> > +			rockchip,pins =3D
> > +				/* i3c0_scl_m1 */
> > +				<1 RK_PD2 10 &pcfg_pull_none_smt>,
> > +				/* i3c0_sda_m1 */
> > +				<1 RK_PD3 10 &pcfg_pull_none_smt>;
> > +		};
> > +	};
> > +
> > +	i3c1 {
> > +		/omit-if-no-ref/
> > +		i3c1m0_xfer: i3c1m0-xfer {
> > +			rockchip,pins =3D
> > +				/* i3c1_scl_m0 */
> > +				<2 RK_PD2 12 &pcfg_pull_none_smt>,
> > +				/* i3c1_sda_m0 */
> > +				<2 RK_PD3 12 &pcfg_pull_none_smt>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		i3c1m1_xfer: i3c1m1-xfer {
> > +			rockchip,pins =3D
> > +				/* i3c1_scl_m1 */
> > +				<2 RK_PA2 14 &pcfg_pull_none_smt>,
> > +				/* i3c1_sda_m1 */
> > +				<2 RK_PA3 14 &pcfg_pull_none_smt>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		i3c1m2_xfer: i3c1m2-xfer {
> > +			rockchip,pins =3D
> > +				/* i3c1_scl_m2 */
> > +				<3 RK_PD3 11 &pcfg_pull_none_smt>,
> > +				/* i3c1_sda_m2 */
> > +				<3 RK_PD2 11 &pcfg_pull_none_smt>;
> > +		};
> > +	};
> > +
> > +	i3c0_sda {
> > +		/omit-if-no-ref/
> > +		i3c0_sdam0_pu: i3c0_sdam0-pu {
> > +			rockchip,pins =3D
> > +				/* i3c0_sda_pu_m0 */
> > +				<0 RK_PC5 11 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		i3c0_sdam1_pu: i3c0_sdam1-pu {
> > +			rockchip,pins =3D
> > +				/* i3c0_sda_pu_m1 */
> > +				<1 RK_PD1 10 &pcfg_pull_none>;
> > +		};
> > +	};
> > +
> > +	i3c1_sda {
> > +		/omit-if-no-ref/
> > +		i3c1_sdam0_pu: i3c1_sdam0-pu {
> > +			rockchip,pins =3D
> > +				/* i3c1_sda_pu_m0 */
> > +				<2 RK_PD6 12 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		i3c1_sdam1_pu: i3c1_sdam1-pu {
> > +			rockchip,pins =3D
> > +				/* i3c1_sda_pu_m1 */
> > +				<2 RK_PA5 14 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		i3c1_sdam2_pu: i3c1_sdam2-pu {
> > +			rockchip,pins =3D
> > +				/* i3c1_sda_pu_m2 */
> > +				<3 RK_PD1 11 &pcfg_pull_none>;
> > +		};
> > +	};
> > +
> > +	isp_flash {
> > +		/omit-if-no-ref/
> > +		isp_flashm0_pins: isp_flashm0-pins {
> > +			rockchip,pins =3D
> > +				/* isp_flash_trigout_m0 */
> > +				<2 RK_PD5 1 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		isp_flashm1_pins: isp_flashm1-pins {
> > +			rockchip,pins =3D
> > +				/* isp_flash_trigout_m1 */
> > +				<4 RK_PC5 1 &pcfg_pull_none>;
> > +		};
> > +	};
> > +
> > +	isp_prelight {
> > +		/omit-if-no-ref/
> > +		isp_prelightm0_pins: isp_prelightm0-pins {
> > +			rockchip,pins =3D
> > +				/* isp_prelight_trig_m0 */
> > +				<2 RK_PD4 1 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		isp_prelightm1_pins: isp_prelightm1-pins {
> > +			rockchip,pins =3D
> > +				/* isp_prelight_trig_m1 */
> > +				<4 RK_PC4 1 &pcfg_pull_none>;
> > +		};
> > +	};
> > +
> > +	jtag {
> > +		/omit-if-no-ref/
> > +		jtagm0_pins: jtagm0-pins {
> > +			rockchip,pins =3D
> > +				/* jtag_tck_m0 */
> > +				<2 RK_PA2 9 &pcfg_pull_none>,
> > +				/* jtag_tms_m0 */
> > +				<2 RK_PA3 9 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		jtagm1_pins: jtagm1-pins {
> > +			rockchip,pins =3D
> > +				/* jtag_tck_m1 */
> > +				<0 RK_PD4 10 &pcfg_pull_none>,
> > +				/* jtag_tms_m1 */
> > +				<0 RK_PD5 10 &pcfg_pull_none>;
> > +		};
> > +	};
> > +
> > +	mipi {
> > +		/omit-if-no-ref/
> > +		mipim0_pins: mipim0-pins {
> > +			rockchip,pins =3D
> > +				/* mipi_te_m0 */
> > +				<4 RK_PB2 11 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		mipim1_pins: mipim1-pins {
> > +			rockchip,pins =3D
> > +				/* mipi_te_m1 */
> > +				<3 RK_PA2 12 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		mipim2_pins: mipim2-pins {
> > +			rockchip,pins =3D
> > +				/* mipi_te_m2 */
> > +				<4 RK_PA0 12 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		mipim3_pins: mipim3-pins {
> > +			rockchip,pins =3D
> > +				/* mipi_te_m3 */
> > +				<1 RK_PB3 11 &pcfg_pull_none>;
> > +		};
> > +	};
> > +
> > +	npu {
> > +		/omit-if-no-ref/
> > +		npu_pins: npu-pins {
> > +			rockchip,pins =3D
> > +				/* npu_avs */
> > +				<0 RK_PB7 11 &pcfg_pull_none>;
> > +		};
> > +	};
> > +
> > +	pcie0 {
> > +		/omit-if-no-ref/
> > +		pcie0m0_pins: pcie0m0-pins {
> > +			rockchip,pins =3D
> > +				/* pcie21_port0_clkreq_m0 */
> > +				<2 RK_PB2 11 &pcfg_pull_up>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		pcie0m1_pins: pcie0m1-pins {
> > +			rockchip,pins =3D
> > +				/* pcie0_clkreq_m1 */
> > +				<1 RK_PB6 12 &pcfg_pull_up>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		pcie0m2_pins: pcie0m2-pins {
> > +			rockchip,pins =3D
> > +				/* pcie0_clkreq_m2 */
> > +				<4 RK_PB5 12 &pcfg_pull_up>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		pcie0m3_pins: pcie0m3-pins {
> > +			rockchip,pins =3D
> > +				/* pcie0_clkreq_m3 */
> > +				<4 RK_PC6 9 &pcfg_pull_up>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		pcie0_buttonrst: pcie21-port0-buttonrst {
> > +			rockchip,pins =3D
> > +				/* pcie0_buttonrst */
> > +				<1 RK_PC4 12 &pcfg_pull_none>;
> > +		};
> > +	};
> > +
> > +	pcie1 {
> > +		/omit-if-no-ref/
> > +		pcie1m0_pins: pcie1m0-pins {
> > +			rockchip,pins =3D
> > +				/* pcie1_clkreq_m0 */
> > +				<2 RK_PB3 11 &pcfg_pull_up>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		pcie1m1_pins: pcie1m1-pins {
> > +			rockchip,pins =3D
> > +				/* pcie1_clkreq_m1 */
> > +				<1 RK_PB4 12 &pcfg_pull_up>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		pcie1m2_pins: pcie1m2-pins {
> > +			rockchip,pins =3D
> > +				/* pcie1_clkreq_m2 */
> > +				<4 RK_PA5 12 &pcfg_pull_up>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		pcie1m3_pins: pcie1m3-pins {
> > +			rockchip,pins =3D
> > +				/* pcie1_clkreq_m3 */
> > +				<4 RK_PC1 10 &pcfg_pull_up>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		pcie1_buttonrst: pcie21-port1-buttonrst {
> > +			rockchip,pins =3D
> > +				/* pcie1_buttonrst */
> > +				<1 RK_PC5 12 &pcfg_pull_none>;
> > +		};
> > +	};
> > +
> > +	pdm0 {
> > +		/omit-if-no-ref/
> > +		pdm0m0_clk0: pdm0m0-clk0 {
> > +			rockchip,pins =3D
> > +				/* pdm0_clk0_m0 */
> > +				<0 RK_PC4 3 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		pdm0m0_clk1: pdm0m0-clk1 {
> > +			rockchip,pins =3D
> > +				/* pdm0_clk1_m0 */
> > +				<0 RK_PC3 3 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		pdm0m0_sdi0: pdm0m0-sdi0 {
> > +			rockchip,pins =3D
> > +				/* pdm0_sdi0_m0 */
> > +				<0 RK_PD0 3 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		pdm0m0_sdi1: pdm0m0-sdi1 {
> > +			rockchip,pins =3D
> > +				/* pdm0_sdi1_m0 */
> > +				<0 RK_PD1 3 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		pdm0m0_sdi2: pdm0m0-sdi2 {
> > +			rockchip,pins =3D
> > +				/* pdm0_sdi2_m0 */
> > +				<0 RK_PD2 3 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		pdm0m0_sdi3: pdm0m0-sdi3 {
> > +			rockchip,pins =3D
> > +				/* pdm0_sdi3_m0 */
> > +				<0 RK_PD3 3 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		pdm0m1_clk0: pdm0m1-clk0 {
> > +			rockchip,pins =3D
> > +				/* pdm0_clk0_m1 */
> > +				<1 RK_PB1 5 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		pdm0m1_clk1: pdm0m1-clk1 {
> > +			rockchip,pins =3D
> > +				/* pdm0_clk1_m1 */
> > +				<1 RK_PA6 5 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		pdm0m1_sdi0: pdm0m1-sdi0 {
> > +			rockchip,pins =3D
> > +				/* pdm0_sdi0_m1 */
> > +				<1 RK_PB2 5 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		pdm0m1_sdi1: pdm0m1-sdi1 {
> > +			rockchip,pins =3D
> > +				/* pdm0_sdi1_m1 */
> > +				<1 RK_PA3 5 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		pdm0m1_sdi2: pdm0m1-sdi2 {
> > +			rockchip,pins =3D
> > +				/* pdm0_sdi2_m1 */
> > +				<1 RK_PA5 5 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		pdm0m1_sdi3: pdm0m1-sdi3 {
> > +			rockchip,pins =3D
> > +				/* pdm0_sdi3_m1 */
> > +				<1 RK_PA2 5 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		pdm0m2_clk0: pdm0m2-clk0 {
> > +			rockchip,pins =3D
> > +				/* pdm0_clk0_m2 */
> > +				<1 RK_PC1 5 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		pdm0m2_clk1: pdm0m2-clk1 {
> > +			rockchip,pins =3D
> > +				/* pdm0_clk1_m2 */
> > +				<1 RK_PD5 5 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		pdm0m2_sdi0: pdm0m2-sdi0 {
> > +			rockchip,pins =3D
> > +				/* pdm0_sdi0_m2 */
> > +				<1 RK_PC6 5 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		pdm0m2_sdi1: pdm0m2-sdi1 {
> > +			rockchip,pins =3D
> > +				/* pdm0_sdi1_m2 */
> > +				<1 RK_PC7 5 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		pdm0m2_sdi2: pdm0m2-sdi2 {
> > +			rockchip,pins =3D
> > +				/* pdm0_sdi2_m2 */
> > +				<1 RK_PC0 5 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		pdm0m2_sdi3: pdm0m2-sdi3 {
> > +			rockchip,pins =3D
> > +				/* pdm0_sdi3_m2 */
> > +				<1 RK_PD4 5 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		pdm0m3_clk0: pdm0m3-clk0 {
> > +			rockchip,pins =3D
> > +				/* pdm0_clk0_m3 */
> > +				<2 RK_PB5 5 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		pdm0m3_clk1: pdm0m3-clk1 {
> > +			rockchip,pins =3D
> > +				/* pdm0_clk1_m3 */
> > +				<2 RK_PB3 5 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		pdm0m3_sdi0: pdm0m3-sdi0 {
> > +			rockchip,pins =3D
> > +				/* pdm0_sdi0_m3 */
> > +				<2 RK_PB4 5 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		pdm0m3_sdi1: pdm0m3-sdi1 {
> > +			rockchip,pins =3D
> > +				/* pdm0_sdi1_m3 */
> > +				<2 RK_PB2 5 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		pdm0m3_sdi2: pdm0m3-sdi2 {
> > +			rockchip,pins =3D
> > +				/* pdm0_sdi2_m3 */
> > +				<2 RK_PB1 5 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		pdm0m3_sdi3: pdm0m3-sdi3 {
> > +			rockchip,pins =3D
> > +				/* pdm0_sdi3_m3 */
> > +				<2 RK_PB0 5 &pcfg_pull_none>;
> > +		};
> > +	};
> > +
> > +	pdm1 {
> > +		/omit-if-no-ref/
> > +		pdm1m0_clk0: pdm1m0-clk0 {
> > +			rockchip,pins =3D
> > +				/* pdm1_clk0_m0 */
> > +				<2 RK_PC5 5 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		pdm1m0_clk1: pdm1m0-clk1 {
> > +			rockchip,pins =3D
> > +				/* pdm1_clk1_m0 */
> > +				<2 RK_PC1 5 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		pdm1m0_sdi0: pdm1m0-sdi0 {
> > +			rockchip,pins =3D
> > +				/* pdm1_sdi0_m0 */
> > +				<2 RK_PC4 5 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		pdm1m0_sdi1: pdm1m0-sdi1 {
> > +			rockchip,pins =3D
> > +				/* pdm1_sdi1_m0 */
> > +				<2 RK_PC0 5 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		pdm1m0_sdi2: pdm1m0-sdi2 {
> > +			rockchip,pins =3D
> > +				/* pdm1_sdi2_m0 */
> > +				<2 RK_PC2 5 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		pdm1m0_sdi3: pdm1m0-sdi3 {
> > +			rockchip,pins =3D
> > +				/* pdm1_sdi3_m0 */
> > +				<2 RK_PC3 5 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		pdm1m1_clk0: pdm1m1-clk0 {
> > +			rockchip,pins =3D
> > +				/* pdm1_clk0_m1 */
> > +				<4 RK_PA6 3 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		pdm1m1_clk1: pdm1m1-clk1 {
> > +			rockchip,pins =3D
> > +				/* pdm1_clk1_m1 */
> > +				<4 RK_PB0 3 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		pdm1m1_sdi0: pdm1m1-sdi0 {
> > +			rockchip,pins =3D
> > +				/* pdm1_sdi0_m1 */
> > +				<4 RK_PB3 3 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		pdm1m1_sdi1: pdm1m1-sdi1 {
> > +			rockchip,pins =3D
> > +				/* pdm1_sdi1_m1 */
> > +				<4 RK_PB2 3 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		pdm1m1_sdi2: pdm1m1-sdi2 {
> > +			rockchip,pins =3D
> > +				/* pdm1_sdi2_m1 */
> > +				<4 RK_PB1 3 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		pdm1m1_sdi3: pdm1m1-sdi3 {
> > +			rockchip,pins =3D
> > +				/* pdm1_sdi3_m1 */
> > +				<4 RK_PA4 3 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		pdm1m2_clk0: pdm1m2-clk0 {
> > +			rockchip,pins =3D
> > +				/* pdm1_clk0_m2 */
> > +				<3 RK_PB1 4 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		pdm1m2_clk1: pdm1m2-clk1 {
> > +			rockchip,pins =3D
> > +				/* pdm1_clk1_m2 */
> > +				<3 RK_PA7 4 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		pdm1m2_sdi0: pdm1m2-sdi0 {
> > +			rockchip,pins =3D
> > +				/* pdm1_sdi0_m2 */
> > +				<3 RK_PB3 4 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		pdm1m2_sdi1: pdm1m2-sdi1 {
> > +			rockchip,pins =3D
> > +				/* pdm1_sdi1_m2 */
> > +				<3 RK_PB2 4 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		pdm1m2_sdi2: pdm1m2-sdi2 {
> > +			rockchip,pins =3D
> > +				/* pdm1_sdi2_m2 */
> > +				<3 RK_PA6 4 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		pdm1m2_sdi3: pdm1m2-sdi3 {
> > +			rockchip,pins =3D
> > +				/* pdm1_sdi3_m2 */
> > +				<3 RK_PA5 4 &pcfg_pull_none>;
> > +		};
> > +	};
> > +
> > +	pmu_debug_test {
> > +		/omit-if-no-ref/
> > +		pmu_debug_test_pins: pmu_debug_test-pins {
> > +			rockchip,pins =3D
> > +				/* pmu_debug_test_out */
> > +				<0 RK_PB0 2 &pcfg_pull_none>;
> > +		};
> > +	};
> > +
> > +	pwm0 {
> > +		/omit-if-no-ref/
> > +		pwm0m0_ch0: pwm0m0-ch0 {
> > +			rockchip,pins =3D
> > +				/* pwm0_ch0_m0 */
> > +				<0 RK_PC4 12=20
&pcfg_pull_none_drv_level_2>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		pwm0m0_ch1: pwm0m0-ch1 {
> > +			rockchip,pins =3D
> > +				/* pwm0_ch1_m0 */
> > +				<0 RK_PC3 12=20
&pcfg_pull_none_drv_level_2>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		pwm0m1_ch0: pwm0m1-ch0 {
> > +			rockchip,pins =3D
> > +				/* pwm0_ch0_m1 */
> > +				<1 RK_PC0 13=20
&pcfg_pull_none_drv_level_2>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		pwm0m1_ch1: pwm0m1-ch1 {
> > +			rockchip,pins =3D
> > +				/* pwm0_ch1_m1 */
> > +				<4 RK_PC1 14=20
&pcfg_pull_none_drv_level_2>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		pwm0m2_ch0: pwm0m2-ch0 {
> > +			rockchip,pins =3D
> > +				/* pwm0_ch0_m2 */
> > +				<2 RK_PC3 13=20
&pcfg_pull_none_drv_level_2>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		pwm0m2_ch1: pwm0m2-ch1 {
> > +			rockchip,pins =3D
> > +				/* pwm0_ch1_m2 */
> > +				<2 RK_PC7 13=20
&pcfg_pull_none_drv_level_2>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		pwm0m3_ch0: pwm0m3-ch0 {
> > +			rockchip,pins =3D
> > +				/* pwm0_ch0_m3 */
> > +				<3 RK_PB0 12=20
&pcfg_pull_none_drv_level_2>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		pwm0m3_ch1: pwm0m3-ch1 {
> > +			rockchip,pins =3D
> > +				/* pwm0_ch1_m3 */
> > +				<3 RK_PB6 12=20
&pcfg_pull_none_drv_level_2>;
> > +		};
> > +	};
> > +
> > +	pwm1 {
> > +		/omit-if-no-ref/
> > +		pwm1m0_ch0: pwm1m0-ch0 {
> > +			rockchip,pins =3D
> > +				/* pwm1_ch0_m0 */
> > +				<0 RK_PB4 12 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		pwm1m0_ch1: pwm1m0-ch1 {
> > +			rockchip,pins =3D
> > +				/* pwm1_ch1_m0 */
> > +				<0 RK_PB5 12 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		pwm1m0_ch2: pwm1m0-ch2 {
> > +			rockchip,pins =3D
> > +				/* pwm1_ch2_m0 */
> > +				<0 RK_PB6 12 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		pwm1m0_ch3: pwm1m0-ch3 {
> > +			rockchip,pins =3D
> > +				/* pwm1_ch3_m0 */
> > +				<0 RK_PC0 12 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		pwm1m0_ch4: pwm1m0-ch4 {
> > +			rockchip,pins =3D
> > +				/* pwm1_ch4_m0 */
> > +				<0 RK_PB7 12 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		pwm1m0_ch5: pwm1m0-ch5 {
> > +			rockchip,pins =3D
> > +				/* pwm1_ch5_m0 */
> > +				<0 RK_PD2 12 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		pwm1m1_ch0: pwm1m1-ch0 {
> > +			rockchip,pins =3D
> > +				/* pwm1_ch0_m1 */
> > +				<1 RK_PB4 13 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		pwm1m1_ch1: pwm1m1-ch1 {
> > +			rockchip,pins =3D
> > +				/* pwm1_ch1_m1 */
> > +				<1 RK_PB5 13 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		pwm1m1_ch2: pwm1m1-ch2 {
> > +			rockchip,pins =3D
> > +				/* pwm1_ch2_m1 */
> > +				<1 RK_PC2 13 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		pwm1m1_ch3: pwm1m1-ch3 {
> > +			rockchip,pins =3D
> > +				/* pwm1_ch3_m1 */
> > +				<1 RK_PD2 13 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		pwm1m1_ch4: pwm1m1-ch4 {
> > +			rockchip,pins =3D
> > +				/* pwm1_ch4_m1 */
> > +				<1 RK_PD3 13 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		pwm1m1_ch5: pwm1m1-ch5 {
> > +			rockchip,pins =3D
> > +				/* pwm1_ch5_m1 */
> > +				<4 RK_PC0 14 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		pwm1m2_ch0: pwm1m2-ch0 {
> > +			rockchip,pins =3D
> > +				/* pwm1_ch0_m2 */
> > +				<2 RK_PC0 13 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		pwm1m2_ch1: pwm1m2-ch1 {
> > +			rockchip,pins =3D
> > +				/* pwm1_ch1_m2 */
> > +				<2 RK_PC1 13 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		pwm1m2_ch2: pwm1m2-ch2 {
> > +			rockchip,pins =3D
> > +				/* pwm1_ch2_m2 */
> > +				<2 RK_PC2 13 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		pwm1m2_ch3: pwm1m2-ch3 {
> > +			rockchip,pins =3D
> > +				/* pwm1_ch3_m2 */
> > +				<2 RK_PC4 13 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		pwm1m2_ch4: pwm1m2-ch4 {
> > +			rockchip,pins =3D
> > +				/* pwm1_ch4_m2 */
> > +				<2 RK_PC5 13 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		pwm1m2_ch5: pwm1m2-ch5 {
> > +			rockchip,pins =3D
> > +				/* pwm1_ch5_m2 */
> > +				<2 RK_PC6 13 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		pwm1m3_ch0: pwm1m3-ch0 {
> > +			rockchip,pins =3D
> > +				/* pwm1_ch0_m3 */
> > +				<3 RK_PA4 12 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		pwm1m3_ch1: pwm1m3-ch1 {
> > +			rockchip,pins =3D
> > +				/* pwm1_ch1_m3 */
> > +				<3 RK_PA5 12 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		pwm1m3_ch2: pwm1m3-ch2 {
> > +			rockchip,pins =3D
> > +				/* pwm1_ch2_m3 */
> > +				<3 RK_PA6 12 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		pwm1m3_ch3: pwm1m3-ch3 {
> > +			rockchip,pins =3D
> > +				/* pwm1_ch3_m3 */
> > +				<3 RK_PB1 12 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		pwm1m3_ch4: pwm1m3-ch4 {
> > +			rockchip,pins =3D
> > +				/* pwm1_ch4_m3 */
> > +				<3 RK_PB4 12 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		pwm1m3_ch5: pwm1m3-ch5 {
> > +			rockchip,pins =3D
> > +				/* pwm1_ch5_m3 */
> > +				<3 RK_PB5 12 &pcfg_pull_none>;
> > +		};
> > +	};
> > +
> > +	pwm2 {
> > +		/omit-if-no-ref/
> > +		pwm2m0_ch0: pwm2m0-ch0 {
> > +			rockchip,pins =3D
> > +				/* pwm2_ch0_m0 */
> > +				<0 RK_PD3 12=20
&pcfg_pull_none_drv_level_2>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		pwm2m0_ch1: pwm2m0-ch1 {
> > +			rockchip,pins =3D
> > +				/* pwm2_ch1_m0 */
> > +				<1 RK_PB3 12=20
&pcfg_pull_none_drv_level_2>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		pwm2m0_ch2: pwm2m0-ch2 {
> > +			rockchip,pins =3D
> > +				/* pwm2_ch2_m0 */
> > +				<2 RK_PA0 14=20
&pcfg_pull_none_drv_level_2>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		pwm2m0_ch3: pwm2m0-ch3 {
> > +			rockchip,pins =3D
> > +				/* pwm2_ch3_m0 */
> > +				<2 RK_PA1 14=20
&pcfg_pull_none_drv_level_2>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		pwm2m0_ch4: pwm2m0-ch4 {
> > +			rockchip,pins =3D
> > +				/* pwm2_ch4_m0 */
> > +				<2 RK_PA4 14=20
&pcfg_pull_none_drv_level_2>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		pwm2m0_ch5: pwm2m0-ch5 {
> > +			rockchip,pins =3D
> > +				/* pwm2_ch5_m0 */
> > +				<4 RK_PA2 13=20
&pcfg_pull_none_drv_level_2>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		pwm2m0_ch6: pwm2m0-ch6 {
> > +			rockchip,pins =3D
> > +				/* pwm2_ch6_m0 */
> > +				<4 RK_PA7 13=20
&pcfg_pull_none_drv_level_2>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		pwm2m0_ch7: pwm2m0-ch7 {
> > +			rockchip,pins =3D
> > +				/* pwm2_ch7_m0 */
> > +				<4 RK_PB3 13=20
&pcfg_pull_none_drv_level_2>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		pwm2m1_ch0: pwm2m1-ch0 {
> > +			rockchip,pins =3D
> > +				/* pwm2_ch0_m1 */
> > +				<4 RK_PC2 14=20
&pcfg_pull_none_drv_level_2>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		pwm2m1_ch1: pwm2m1-ch1 {
> > +			rockchip,pins =3D
> > +				/* pwm2_ch1_m1 */
> > +				<4 RK_PC3 14=20
&pcfg_pull_none_drv_level_2>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		pwm2m1_ch2: pwm2m1-ch2 {
> > +			rockchip,pins =3D
> > +				/* pwm2_ch2_m1 */
> > +				<4 RK_PC6 14=20
&pcfg_pull_none_drv_level_2>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		pwm2m1_ch3: pwm2m1-ch3 {
> > +			rockchip,pins =3D
> > +				/* pwm2_ch3_m1 */
> > +				<4 RK_PC7 14=20
&pcfg_pull_none_drv_level_2>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		pwm2m1_ch4: pwm2m1-ch4 {
> > +			rockchip,pins =3D
> > +				/* pwm2_ch4_m1 */
> > +				<4 RK_PA3 13=20
&pcfg_pull_none_drv_level_2>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		pwm2m1_ch5: pwm2m1-ch5 {
> > +			rockchip,pins =3D
> > +				/* pwm2_ch5_m1 */
> > +				<4 RK_PC5 14=20
&pcfg_pull_none_drv_level_2>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		pwm2m1_ch6: pwm2m1-ch6 {
> > +			rockchip,pins =3D
> > +				/* pwm2_ch6_m1 */
> > +				<4 RK_PC4 14=20
&pcfg_pull_none_drv_level_2>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		pwm2m1_ch7: pwm2m1-ch7 {
> > +			rockchip,pins =3D
> > +				/* pwm2_ch7_m1 */
> > +				<1 RK_PB1 12=20
&pcfg_pull_none_drv_level_2>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		pwm2m2_ch0: pwm2m2-ch0 {
> > +			rockchip,pins =3D
> > +				/* pwm2_ch0_m2 */
> > +				<2 RK_PD0 13=20
&pcfg_pull_none_drv_level_2>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		pwm2m2_ch1: pwm2m2-ch1 {
> > +			rockchip,pins =3D
> > +				/* pwm2_ch1_m2 */
> > +				<2 RK_PD1 13=20
&pcfg_pull_none_drv_level_2>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		pwm2m2_ch2: pwm2m2-ch2 {
> > +			rockchip,pins =3D
> > +				/* pwm2_ch2_m2 */
> > +				<2 RK_PD2 13=20
&pcfg_pull_none_drv_level_2>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		pwm2m2_ch3: pwm2m2-ch3 {
> > +			rockchip,pins =3D
> > +				/* pwm2_ch3_m2 */
> > +				<2 RK_PD3 13=20
&pcfg_pull_none_drv_level_2>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		pwm2m2_ch4: pwm2m2-ch4 {
> > +			rockchip,pins =3D
> > +				/* pwm2_ch4_m2 */
> > +				<2 RK_PD4 13=20
&pcfg_pull_none_drv_level_2>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		pwm2m2_ch5: pwm2m2-ch5 {
> > +			rockchip,pins =3D
> > +				/* pwm2_ch5_m2 */
> > +				<2 RK_PD5 13=20
&pcfg_pull_none_drv_level_2>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		pwm2m2_ch6: pwm2m2-ch6 {
> > +			rockchip,pins =3D
> > +				/* pwm2_ch6_m2 */
> > +				<2 RK_PD6 13=20
&pcfg_pull_none_drv_level_2>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		pwm2m2_ch7: pwm2m2-ch7 {
> > +			rockchip,pins =3D
> > +				/* pwm2_ch7_m2 */
> > +				<2 RK_PD7 13=20
&pcfg_pull_none_drv_level_2>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		pwm2m3_ch0: pwm2m3-ch0 {
> > +			rockchip,pins =3D
> > +				/* pwm2_ch0_m3 */
> > +				<3 RK_PC2 12=20
&pcfg_pull_none_drv_level_2>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		pwm2m3_ch1: pwm2m3-ch1 {
> > +			rockchip,pins =3D
> > +				/* pwm2_ch1_m3 */
> > +				<3 RK_PC3 12=20
&pcfg_pull_none_drv_level_2>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		pwm2m3_ch2: pwm2m3-ch2 {
> > +			rockchip,pins =3D
> > +				/* pwm2_ch2_m3 */
> > +				<3 RK_PC5 12=20
&pcfg_pull_none_drv_level_2>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		pwm2m3_ch3: pwm2m3-ch3 {
> > +			rockchip,pins =3D
> > +				/* pwm2_ch3_m3 */
> > +				<3 RK_PD0 12=20
&pcfg_pull_none_drv_level_2>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		pwm2m3_ch4: pwm2m3-ch4 {
> > +			rockchip,pins =3D
> > +				/* pwm2_ch4_m3 */
> > +				<3 RK_PD2 12=20
&pcfg_pull_none_drv_level_2>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		pwm2m3_ch5: pwm2m3-ch5 {
> > +			rockchip,pins =3D
> > +				/* pwm2_ch5_m3 */
> > +				<3 RK_PD3 12=20
&pcfg_pull_none_drv_level_2>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		pwm2m3_ch6: pwm2m3-ch6 {
> > +			rockchip,pins =3D
> > +				/* pwm2_ch6_m3 */
> > +				<3 RK_PD6 12=20
&pcfg_pull_none_drv_level_2>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		pwm2m3_ch7: pwm2m3-ch7 {
> > +			rockchip,pins =3D
> > +				/* pwm2_ch7_m3 */
> > +				<3 RK_PD7 12=20
&pcfg_pull_none_drv_level_2>;
> > +		};
> > +	};
> > +
> > +	ref_clk0 {
> > +		/omit-if-no-ref/
> > +		ref_clk0_clk0: ref_clk0-clk0 {
> > +			rockchip,pins =3D
> > +				/* ref_clk0_out */
> > +				<0 RK_PA0 1 &pcfg_pull_none>;
> > +		};
> > +	};
> > +
> > +	ref_clk1 {
> > +		/omit-if-no-ref/
> > +		ref_clk1_clk1: ref_clk1-clk1 {
> > +			rockchip,pins =3D
> > +				/* ref_clk1_out */
> > +				<0 RK_PB4 1 &pcfg_pull_none>;
> > +		};
> > +	};
> > +
> > +	ref_clk2 {
> > +		/omit-if-no-ref/
> > +		ref_clk2_clk2: ref_clk2-clk2 {
> > +			rockchip,pins =3D
> > +				/* ref_clk2_out */
> > +				<0 RK_PB5 1 &pcfg_pull_none>;
> > +		};
> > +	};
> > +
> > +	sai0 {
> > +		/omit-if-no-ref/
> > +		sai0m0_lrck: sai0m0-lrck {
> > +			rockchip,pins =3D
> > +				/* sai0_lrck_m0 */
> > +				<2 RK_PB7 4 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		sai0m0_mclk: sai0m0-mclk {
> > +			rockchip,pins =3D
> > +				/* sai0_mclk_m0 */
> > +				<2 RK_PB5 4 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		sai0m0_sclk: sai0m0-sclk {
> > +			rockchip,pins =3D
> > +				/* sai0_sclk_m0 */
> > +				<2 RK_PB6 4 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		sai0m0_sdi0: sai0m0-sdi0 {
> > +			rockchip,pins =3D
> > +				/* sai0_sdi0_m0 */
> > +				<2 RK_PB0 4 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		sai0m0_sdi1: sai0m0-sdi1 {
> > +			rockchip,pins =3D
> > +				/* sai0_sdi1_m0 */
> > +				<2 RK_PB1 4 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		sai0m0_sdi2: sai0m0-sdi2 {
> > +			rockchip,pins =3D
> > +				/* sai0_sdi2_m0 */
> > +				<2 RK_PB2 4 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		sai0m0_sdi3: sai0m0-sdi3 {
> > +			rockchip,pins =3D
> > +				/* sai0_sdi3_m0 */
> > +				<2 RK_PB4 4 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		sai0m0_sdo0: sai0m0-sdo0 {
> > +			rockchip,pins =3D
> > +				/* sai0_sdo0_m0 */
> > +				<2 RK_PA6 4 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		sai0m0_sdo1: sai0m0-sdo1 {
> > +			rockchip,pins =3D
> > +				/* sai0_sdo1_m0 */
> > +				<2 RK_PA7 4 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		sai0m0_sdo2: sai0m0-sdo2 {
> > +			rockchip,pins =3D
> > +				/* sai0_sdo2_m0 */
> > +				<2 RK_PB3 4 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		sai0m0_sdo3: sai0m0-sdo3 {
> > +			rockchip,pins =3D
> > +				/* sai0_sdo3_m0 */
> > +				<2 RK_PD7 4 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		sai0m1_lrck: sai0m1-lrck {
> > +			rockchip,pins =3D
> > +				/* sai0_lrck_m1 */
> > +				<0 RK_PC7 1 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		sai0m1_mclk: sai0m1-mclk {
> > +			rockchip,pins =3D
> > +				/* sai0_mclk_m1 */
> > +				<0 RK_PC4 1 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		sai0m1_sclk: sai0m1-sclk {
> > +			rockchip,pins =3D
> > +				/* sai0_sclk_m1 */
> > +				<0 RK_PC6 1 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		sai0m1_sdi0: sai0m1-sdi0 {
> > +			rockchip,pins =3D
> > +				/* sai0_sdi0_m1 */
> > +				<0 RK_PD0 1 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		sai0m1_sdi1: sai0m1-sdi1 {
> > +			rockchip,pins =3D
> > +				/* sai0_sdi1_m1 */
> > +				<0 RK_PD1 1 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		sai0m1_sdi2: sai0m1-sdi2 {
> > +			rockchip,pins =3D
> > +				/* sai0_sdi2_m1 */
> > +				<0 RK_PD2 1 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		sai0m1_sdi3: sai0m1-sdi3 {
> > +			rockchip,pins =3D
> > +				/* sai0_sdi3_m1 */
> > +				<0 RK_PD3 1 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		sai0m1_sdo0: sai0m1-sdo0 {
> > +			rockchip,pins =3D
> > +				/* sai0_sdo0_m1 */
> > +				<0 RK_PC5 1 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		sai0m1_sdo1: sai0m1-sdo1 {
> > +			rockchip,pins =3D
> > +				/* sai0_sdo1_m1 */
> > +				<0 RK_PD3 2 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		sai0m1_sdo2: sai0m1-sdo2 {
> > +			rockchip,pins =3D
> > +				/* sai0_sdo2_m1 */
> > +				<0 RK_PD2 2 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		sai0m1_sdo3: sai0m1-sdo3 {
> > +			rockchip,pins =3D
> > +				/* sai0_sdo3_m1 */
> > +				<0 RK_PD1 2 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		sai0m2_lrck: sai0m2-lrck {
> > +			rockchip,pins =3D
> > +				/* sai0_lrck_m2 */
> > +				<1 RK_PA1 3 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		sai0m2_mclk: sai0m2-mclk {
> > +			rockchip,pins =3D
> > +				/* sai0_mclk_m2 */
> > +				<1 RK_PA4 3 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		sai0m2_sclk: sai0m2-sclk {
> > +			rockchip,pins =3D
> > +				/* sai0_sclk_m2 */
> > +				<1 RK_PA0 3 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		sai0m2_sdi0: sai0m2-sdi0 {
> > +			rockchip,pins =3D
> > +				/* sai0_sdi0_m2 */
> > +				<1 RK_PB2 3 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		sai0m2_sdi1: sai0m2-sdi1 {
> > +			rockchip,pins =3D
> > +				/* sai0_sdi1_m2 */
> > +				<1 RK_PB1 4 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		sai0m2_sdi2: sai0m2-sdi2 {
> > +			rockchip,pins =3D
> > +				/* sai0_sdi2_m2 */
> > +				<1 RK_PA3 4 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		sai0m2_sdi3: sai0m2-sdi3 {
> > +			rockchip,pins =3D
> > +				/* sai0_sdi3_m2 */
> > +				<1 RK_PA2 4 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		sai0m2_sdo0: sai0m2-sdo0 {
> > +			rockchip,pins =3D
> > +				/* sai0_sdo0_m2 */
> > +				<1 RK_PA7 3 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		sai0m2_sdo1: sai0m2-sdo1 {
> > +			rockchip,pins =3D
> > +				/* sai0_sdo1_m2 */
> > +				<1 RK_PA2 3 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		sai0m2_sdo2: sai0m2-sdo2 {
> > +			rockchip,pins =3D
> > +				/* sai0_sdo2_m2 */
> > +				<1 RK_PA3 3 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		sai0m2_sdo3: sai0m2-sdo3 {
> > +			rockchip,pins =3D
> > +				/* sai0_sdo3_m2 */
> > +				<1 RK_PB1 3 &pcfg_pull_none>;
> > +		};
> > +	};
> > +
> > +	sai1 {
> > +		/omit-if-no-ref/
> > +		sai1m0_lrck: sai1m0-lrck {
> > +			rockchip,pins =3D
> > +				/* sai1_lrck_m0 */
> > +				<4 RK_PA5 1 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		sai1m0_mclk: sai1m0-mclk {
> > +			rockchip,pins =3D
> > +				/* sai1_mclk_m0 */
> > +				<4 RK_PA2 1 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		sai1m0_sclk: sai1m0-sclk {
> > +			rockchip,pins =3D
> > +				/* sai1_sclk_m0 */
> > +				<4 RK_PA3 1 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		sai1m0_sdi0: sai1m0-sdi0 {
> > +			rockchip,pins =3D
> > +				/* sai1_sdi0_m0 */
> > +				<4 RK_PB3 1 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		sai1m0_sdi1: sai1m0-sdi1 {
> > +			rockchip,pins =3D
> > +				/* sai1_sdi1_m0 */
> > +				<4 RK_PB2 2 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		sai1m0_sdi2: sai1m0-sdi2 {
> > +			rockchip,pins =3D
> > +				/* sai1_sdi2_m0 */
> > +				<4 RK_PB1 2 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		sai1m0_sdi3: sai1m0-sdi3 {
> > +			rockchip,pins =3D
> > +				/* sai1_sdi3_m0 */
> > +				<4 RK_PB0 2 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		sai1m0_sdo0: sai1m0-sdo0 {
> > +			rockchip,pins =3D
> > +				/* sai1_sdo0_m0 */
> > +				<4 RK_PA7 1 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		sai1m0_sdo1: sai1m0-sdo1 {
> > +			rockchip,pins =3D
> > +				/* sai1_sdo1_m0 */
> > +				<4 RK_PB0 1 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		sai1m0_sdo2: sai1m0-sdo2 {
> > +			rockchip,pins =3D
> > +				/* sai1_sdo2_m0 */
> > +				<4 RK_PB1 1 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		sai1m0_sdo3: sai1m0-sdo3 {
> > +			rockchip,pins =3D
> > +				/* sai1_sdo3_m0 */
> > +				<4 RK_PB2 1 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		sai1m1_lrck: sai1m1-lrck {
> > +			rockchip,pins =3D
> > +				/* sai1_lrck_m1 */
> > +				<3 RK_PC6 4 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		sai1m1_mclk: sai1m1-mclk {
> > +			rockchip,pins =3D
> > +				/* sai1_mclk_m1 */
> > +				<3 RK_PD0 4 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		sai1m1_sclk: sai1m1-sclk {
> > +			rockchip,pins =3D
> > +				/* sai1_sclk_m1 */
> > +				<3 RK_PC7 4 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		sai1m1_sdi0: sai1m1-sdi0 {
> > +			rockchip,pins =3D
> > +				/* sai1_sdi0_m1 */
> > +				<3 RK_PB7 4 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		sai1m1_sdi1: sai1m1-sdi1 {
> > +			rockchip,pins =3D
> > +				/* sai1_sdi1_m1 */
> > +				<3 RK_PD4 4 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		sai1m1_sdi2: sai1m1-sdi2 {
> > +			rockchip,pins =3D
> > +				/* sai1_sdi2_m1 */
> > +				<3 RK_PD5 4 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		sai1m1_sdi3: sai1m1-sdi3 {
> > +			rockchip,pins =3D
> > +				/* sai1_sdi3_m1 */
> > +				<3 RK_PD6 4 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		sai1m1_sdo0: sai1m1-sdo0 {
> > +			rockchip,pins =3D
> > +				/* sai1_sdo0_m1 */
> > +				<3 RK_PC5 4 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		sai1m1_sdo1: sai1m1-sdo1 {
> > +			rockchip,pins =3D
> > +				/* sai1_sdo1_m1 */
> > +				<3 RK_PC4 4 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		sai1m1_sdo2: sai1m1-sdo2 {
> > +			rockchip,pins =3D
> > +				/* sai1_sdo2_m1 */
> > +				<3 RK_PC1 4 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		sai1m1_sdo3: sai1m1-sdo3 {
> > +			rockchip,pins =3D
> > +				/* sai1_sdo3_m1 */
> > +				<3 RK_PC0 4 &pcfg_pull_none>;
> > +		};
> > +	};
> > +
> > +	sai2 {
> > +		/omit-if-no-ref/
> > +		sai2m0_lrck: sai2m0-lrck {
> > +			rockchip,pins =3D
> > +				/* sai2_lrck_m0 */
> > +				<1 RK_PD2 4 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		sai2m0_mclk: sai2m0-mclk {
> > +			rockchip,pins =3D
> > +				/* sai2_mclk_m0 */
> > +				<1 RK_PD4 4 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		sai2m0_sclk: sai2m0-sclk {
> > +			rockchip,pins =3D
> > +				/* sai2_sclk_m0 */
> > +				<1 RK_PD1 4 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		sai2m0_sdi: sai2m0-sdi {
> > +			rockchip,pins =3D
> > +				/* sai2m0_sdi */
> > +				<1 RK_PD3 4 &pcfg_pull_none>;
> > +		};
> > +		/omit-if-no-ref/
> > +		sai2m0_sdo: sai2m0-sdo {
> > +			rockchip,pins =3D
> > +				/* sai2m0_sdo */
> > +				<1 RK_PD0 4 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		sai2m1_lrck: sai2m1-lrck {
> > +			rockchip,pins =3D
> > +				/* sai2_lrck_m1 */
> > +				<2 RK_PC3 4 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		sai2m1_mclk: sai2m1-mclk {
> > +			rockchip,pins =3D
> > +				/* sai2_mclk_m1 */
> > +				<2 RK_PC1 4 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		sai2m1_sclk: sai2m1-sclk {
> > +			rockchip,pins =3D
> > +				/* sai2_sclk_m1 */
> > +				<2 RK_PC2 4 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		sai2m1_sdi: sai2m1-sdi {
> > +			rockchip,pins =3D
> > +				/* sai2m1_sdi */
> > +				<2 RK_PC5 4 &pcfg_pull_none>;
> > +		};
> > +		/omit-if-no-ref/
> > +		sai2m1_sdo: sai2m1-sdo {
> > +			rockchip,pins =3D
> > +				/* sai2m1_sdo */
> > +				<2 RK_PC4 4 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		sai2m2_lrck: sai2m2-lrck {
> > +			rockchip,pins =3D
> > +				/* sai2_lrck_m2 */
> > +				<3 RK_PC3 4 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		sai2m2_mclk: sai2m2-mclk {
> > +			rockchip,pins =3D
> > +				/* sai2_mclk_m2 */
> > +				<3 RK_PD1 4 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		sai2m2_sclk: sai2m2-sclk {
> > +			rockchip,pins =3D
> > +				/* sai2_sclk_m2 */
> > +				<3 RK_PC2 4 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		sai2m2_sdi: sai2m2-sdi {
> > +			rockchip,pins =3D
> > +				/* sai2m2_sdi */
> > +				<3 RK_PD2 4 &pcfg_pull_none>;
> > +		};
> > +		/omit-if-no-ref/
> > +		sai2m2_sdo: sai2m2-sdo {
> > +			rockchip,pins =3D
> > +				/* sai2m2_sdo */
> > +				<3 RK_PD3 4 &pcfg_pull_none>;
> > +		};
> > +	};
> > +
> > +	sai3 {
> > +		/omit-if-no-ref/
> > +		sai3m0_lrck: sai3m0-lrck {
> > +			rockchip,pins =3D
> > +				/* sai3_lrck_m0 */
> > +				<1 RK_PA6 4 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		sai3m0_mclk: sai3m0-mclk {
> > +			rockchip,pins =3D
> > +				/* sai3_mclk_m0 */
> > +				<1 RK_PA4 4 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		sai3m0_sclk: sai3m0-sclk {
> > +			rockchip,pins =3D
> > +				/* sai3_sclk_m0 */
> > +				<1 RK_PA5 4 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		sai3m0_sdi: sai3m0-sdi {
> > +			rockchip,pins =3D
> > +				/* sai3m0_sdi */
> > +				<1 RK_PA7 4 &pcfg_pull_none>;
> > +		};
> > +		/omit-if-no-ref/
> > +		sai3m0_sdo: sai3m0-sdo {
> > +			rockchip,pins =3D
> > +				/* sai3m0_sdo */
> > +				<1 RK_PB2 4 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		sai3m1_lrck: sai3m1-lrck {
> > +			rockchip,pins =3D
> > +				/* sai3_lrck_m1 */
> > +				<1 RK_PB5 4 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		sai3m1_mclk: sai3m1-mclk {
> > +			rockchip,pins =3D
> > +				/* sai3_mclk_m1 */
> > +				<1 RK_PC1 4 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		sai3m1_sclk: sai3m1-sclk {
> > +			rockchip,pins =3D
> > +				/* sai3_sclk_m1 */
> > +				<1 RK_PB4 4 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		sai3m1_sdi: sai3m1-sdi {
> > +			rockchip,pins =3D
> > +				/* sai3m1_sdi */
> > +				<1 RK_PB7 4 &pcfg_pull_none>;
> > +		};
> > +		/omit-if-no-ref/
> > +		sai3m1_sdo: sai3m1-sdo {
> > +			rockchip,pins =3D
> > +				/* sai3m1_sdo */
> > +				<1 RK_PB6 4 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		sai3m2_lrck: sai3m2-lrck {
> > +			rockchip,pins =3D
> > +				/* sai3_lrck_m2 */
> > +				<3 RK_PA1 4 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		sai3m2_mclk: sai3m2-mclk {
> > +			rockchip,pins =3D
> > +				/* sai3_mclk_m2 */
> > +				<2 RK_PD6 4 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		sai3m2_sclk: sai3m2-sclk {
> > +			rockchip,pins =3D
> > +				/* sai3_sclk_m2 */
> > +				<3 RK_PA0 4 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		sai3m2_sdi: sai3m2-sdi {
> > +			rockchip,pins =3D
> > +				/* sai3m2_sdi */
> > +				<3 RK_PA3 4 &pcfg_pull_none>;
> > +		};
> > +		/omit-if-no-ref/
> > +		sai3m2_sdo: sai3m2-sdo {
> > +			rockchip,pins =3D
> > +				/* sai3m2_sdo */
> > +				<3 RK_PA2 4 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		sai3m3_lrck: sai3m3-lrck {
> > +			rockchip,pins =3D
> > +				/* sai3_lrck_m3 */
> > +				<2 RK_PA2 4 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		sai3m3_mclk: sai3m3-mclk {
> > +			rockchip,pins =3D
> > +				/* sai3_mclk_m3 */
> > +				<2 RK_PA1 4 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		sai3m3_sclk: sai3m3-sclk {
> > +			rockchip,pins =3D
> > +				/* sai3_sclk_m3 */
> > +				<2 RK_PA5 4 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		sai3m3_sdi: sai3m3-sdi {
> > +			rockchip,pins =3D
> > +				/* sai3m3_sdi */
> > +				<2 RK_PA3 4 &pcfg_pull_none>;
> > +		};
> > +		/omit-if-no-ref/
> > +		sai3m3_sdo: sai3m3-sdo {
> > +			rockchip,pins =3D
> > +				/* sai3m3_sdo */
> > +				<2 RK_PA4 4 &pcfg_pull_none>;
> > +		};
> > +	};
> > +
> > +	sai4 {
> > +		/omit-if-no-ref/
> > +		sai4m0_lrck: sai4m0-lrck {
> > +			rockchip,pins =3D
> > +				/* sai4_lrck_m0 */
> > +				<4 RK_PA6 2 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		sai4m0_mclk: sai4m0-mclk {
> > +			rockchip,pins =3D
> > +				/* sai4_mclk_m0 */
> > +				<4 RK_PA2 2 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		sai4m0_sclk: sai4m0-sclk {
> > +			rockchip,pins =3D
> > +				/* sai4_sclk_m0 */
> > +				<4 RK_PA4 2 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		sai4m0_sdi: sai4m0-sdi {
> > +			rockchip,pins =3D
> > +				/* sai4m0_sdi */
> > +				<4 RK_PA7 2 &pcfg_pull_none>;
> > +		};
> > +		/omit-if-no-ref/
> > +		sai4m0_sdo: sai4m0-sdo {
> > +			rockchip,pins =3D
> > +				/* sai4m0_sdo */
> > +				<4 RK_PB3 2 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		sai4m1_lrck: sai4m1-lrck {
> > +			rockchip,pins =3D
> > +				/* sai4_lrck_m1 */
> > +				<4 RK_PA0 4 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		sai4m1_mclk: sai4m1-mclk {
> > +			rockchip,pins =3D
> > +				/* sai4_mclk_m1 */
> > +				<3 RK_PB0 4 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		sai4m1_sclk: sai4m1-sclk {
> > +			rockchip,pins =3D
> > +				/* sai4_sclk_m1 */
> > +				<3 RK_PD7 4 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		sai4m1_sdi: sai4m1-sdi {
> > +			rockchip,pins =3D
> > +				/* sai4m1_sdi */
> > +				<3 RK_PA4 4 &pcfg_pull_none>;
> > +		};
> > +		/omit-if-no-ref/
> > +		sai4m1_sdo: sai4m1-sdo {
> > +			rockchip,pins =3D
> > +				/* sai4m1_sdo */
> > +				<4 RK_PA1 4 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		sai4m2_lrck: sai4m2-lrck {
> > +			rockchip,pins =3D
> > +				/* sai4_lrck_m2 */
> > +				<4 RK_PC4 2 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		sai4m2_mclk: sai4m2-mclk {
> > +			rockchip,pins =3D
> > +				/* sai4_mclk_m2 */
> > +				<4 RK_PC0 2 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		sai4m2_sclk: sai4m2-sclk {
> > +			rockchip,pins =3D
> > +				/* sai4_sclk_m2 */
> > +				<4 RK_PC7 2 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		sai4m2_sdi: sai4m2-sdi {
> > +			rockchip,pins =3D
> > +				/* sai4m2_sdi */
> > +				<4 RK_PC6 2 &pcfg_pull_none>;
> > +		};
> > +		/omit-if-no-ref/
> > +		sai4m2_sdo: sai4m2-sdo {
> > +			rockchip,pins =3D
> > +				/* sai4m2_sdo */
> > +				<4 RK_PC5 2 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		sai4m3_lrck: sai4m3-lrck {
> > +			rockchip,pins =3D
> > +				/* sai4_lrck_m3 */
> > +				<2 RK_PC7 4 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		sai4m3_mclk: sai4m3-mclk {
> > +			rockchip,pins =3D
> > +				/* sai4_mclk_m3 */
> > +				<2 RK_PD2 4 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		sai4m3_sclk: sai4m3-sclk {
> > +			rockchip,pins =3D
> > +				/* sai4_sclk_m3 */
> > +				<2 RK_PC6 4 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		sai4m3_sdi: sai4m3-sdi {
> > +			rockchip,pins =3D
> > +				/* sai4m3_sdi */
> > +				<2 RK_PD0 4 &pcfg_pull_none>;
> > +		};
> > +		/omit-if-no-ref/
> > +		sai4m3_sdo: sai4m3-sdo {
> > +			rockchip,pins =3D
> > +				/* sai4m3_sdo */
> > +				<2 RK_PD1 4 &pcfg_pull_none>;
> > +		};
> > +	};
> > +
> > +	sata30 {
> > +		/omit-if-no-ref/
> > +		sata30_sata: sata30-sata {
> > +			rockchip,pins =3D
> > +				/* sata30_cpdet */
> > +				<1 RK_PC7 12 &pcfg_pull_none>,
> > +				/* sata30_cppod */
> > +				<1 RK_PC6 12 &pcfg_pull_none>,
> > +				/* sata30_mpswit */
> > +				<1 RK_PD5 12 &pcfg_pull_none>;
> > +		};
> > +	};
> > +
> > +	sata30_port0 {
> > +		/omit-if-no-ref/
> > +		sata30_port0m0_port0: sata30_port0m0-port0 {
> > +			rockchip,pins =3D
> > +				/* sata30_port0_actled_m0 */
> > +				<2 RK_PB4 12 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		sata30_port0m1_port0: sata30_port0m1-port0 {
> > +			rockchip,pins =3D
> > +				/* sata30_port0_actled_m1 */
> > +				<4 RK_PC6 10 &pcfg_pull_none>;
> > +		};
> > +	};
> > +
> > +	sata30_port1 {
> > +		/omit-if-no-ref/
> > +		sata30_port1m0_port1: sata30_port1m0-port1 {
> > +			rockchip,pins =3D
> > +				/* sata30_port1_actled_m0 */
> > +				<2 RK_PB5 12 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		sata30_port1m1_port1: sata30_port1m1-port1 {
> > +			rockchip,pins =3D
> > +				/* sata30_port1_actled_m1 */
> > +				<4 RK_PC5 10 &pcfg_pull_none>;
> > +		};
> > +	};
> > +
> > +	sdmmc0 {
> > +		/omit-if-no-ref/
> > +		sdmmc0_bus4: sdmmc0-bus4 {
> > +			rockchip,pins =3D
> > +				/* sdmmc0_d0 */
> > +				<2 RK_PA0 1 &pcfg_pull_up_drv_level_3>,
> > +				/* sdmmc0_d1 */
> > +				<2 RK_PA1 1 &pcfg_pull_up_drv_level_3>,
> > +				/* sdmmc0_d2 */
> > +				<2 RK_PA2 1 &pcfg_pull_up_drv_level_3>,
> > +				/* sdmmc0_d3 */
> > +				<2 RK_PA3 1 &pcfg_pull_up_drv_level_3>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		sdmmc0_clk: sdmmc0-clk {
> > +			rockchip,pins =3D
> > +				/* sdmmc0_clk */
> > +				<2 RK_PA5 1 &pcfg_pull_up_drv_level_3>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		sdmmc0_cmd: sdmmc0-cmd {
> > +			rockchip,pins =3D
> > +				/* sdmmc0_cmd */
> > +				<2 RK_PA4 1 &pcfg_pull_up_drv_level_3>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		sdmmc0_det: sdmmc0-det {
> > +			rockchip,pins =3D
> > +				/* sdmmc0_detn */
> > +				<0 RK_PA7 1 &pcfg_pull_up>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		sdmmc0_pwren: sdmmc0-pwren {
> > +			rockchip,pins =3D
> > +				/* sdmmc0_pwren */
> > +				<0 RK_PB6 1 &pcfg_pull_none>;
> > +		};
> > +	};
> > +
> > +	sdmmc1 {
> > +		/omit-if-no-ref/
> > +		sdmmc1m0_bus4: sdmmc1m0-bus4 {
> > +			rockchip,pins =3D
> > +				/* sdmmc1_d0_m0 */
> > +				<1 RK_PB4 2 &pcfg_pull_up_drv_level_2>,
> > +				/* sdmmc1_d1_m0 */
> > +				<1 RK_PB5 2 &pcfg_pull_up_drv_level_2>,
> > +				/* sdmmc1_d2_m0 */
> > +				<1 RK_PB6 2 &pcfg_pull_up_drv_level_2>,
> > +				/* sdmmc1_d3_m0 */
> > +				<1 RK_PB7 2 &pcfg_pull_up_drv_level_2>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		sdmmc1m0_clk: sdmmc1m0-clk {
> > +			rockchip,pins =3D
> > +				/* sdmmc1_clk_m0 */
> > +				<1 RK_PC1 2 &pcfg_pull_up_drv_level_2>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		sdmmc1m0_cmd: sdmmc1m0-cmd {
> > +			rockchip,pins =3D
> > +				/* sdmmc1_cmd_m0 */
> > +				<1 RK_PC0 2 &pcfg_pull_up_drv_level_2>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		sdmmc1m0_det: sdmmc1m0-det {
> > +			rockchip,pins =3D
> > +				/* sdmmc1_detn_m0 */
> > +				<1 RK_PC3 2 &pcfg_pull_up>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		sdmmc1m0_pwren: sdmmc1m0-pwren {
> > +			rockchip,pins =3D
> > +				/* sdmmc1m0_pwren */
> > +				<1 RK_PC2 2 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		sdmmc1m1_bus4: sdmmc1m1-bus4 {
> > +			rockchip,pins =3D
> > +				/* sdmmc1_d0_m1 */
> > +				<2 RK_PA6 2 &pcfg_pull_up_drv_level_2>,
> > +				/* sdmmc1_d1_m1 */
> > +				<2 RK_PA7 2 &pcfg_pull_up_drv_level_2>,
> > +				/* sdmmc1_d2_m1 */
> > +				<2 RK_PB0 2 &pcfg_pull_up_drv_level_2>,
> > +				/* sdmmc1_d3_m1 */
> > +				<2 RK_PB1 2 &pcfg_pull_up_drv_level_2>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		sdmmc1m1_clk: sdmmc1m1-clk {
> > +			rockchip,pins =3D
> > +				/* sdmmc1_clk_m1 */
> > +				<2 RK_PB3 2 &pcfg_pull_up_drv_level_2>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		sdmmc1m1_cmd: sdmmc1m1-cmd {
> > +			rockchip,pins =3D
> > +				/* sdmmc1_cmd_m1 */
> > +				<2 RK_PB2 2 &pcfg_pull_up_drv_level_2>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		sdmmc1m1_det: sdmmc1m1-det {
> > +			rockchip,pins =3D
> > +				/* sdmmc1_detn_m1 */
> > +				<2 RK_PB5 2 &pcfg_pull_up>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		sdmmc1m1_pwren: sdmmc1m1-pwren {
> > +			rockchip,pins =3D
> > +				/* sdmmc1m1_pwren */
> > +				<2 RK_PB4 2 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		sdmmc1m2_det: sdmmc1m2-det {
> > +			rockchip,pins =3D
> > +				/* sdmmc1_detn_m2 */
> > +				<0 RK_PB6 2 &pcfg_pull_up>;
> > +		};
> > +	};
> > +
> > +	sdmmc0_testclk {
> > +		/omit-if-no-ref/
> > +		sdmmc0_testclk_test: sdmmc0_testclk-test {
> > +			rockchip,pins =3D
> > +				/* sdmmc0_testclk_out */
> > +				<1 RK_PC4 6 &pcfg_pull_none>;
> > +		};
> > +	};
> > +
> > +	sdmmc0_testdata {
> > +		/omit-if-no-ref/
> > +		sdmmc0_testdata_test: sdmmc0_testdata-test {
> > +			rockchip,pins =3D
> > +				/* sdmmc0_testdata_out */
> > +				<1 RK_PC5 6 &pcfg_pull_none>;
> > +		};
> > +	};
> > +
> > +	sdmmc1_testclk {
> > +		/omit-if-no-ref/
> > +		sdmmc1_testclkm0_test: sdmmc1_testclkm0-test {
> > +			rockchip,pins =3D
> > +				/* sdmmc1_testclk_out_m0 */
> > +				<1 RK_PC4 5 &pcfg_pull_none>;
> > +		};
> > +	};
> > +
> > +	sdmmc1_testdata {
> > +		/omit-if-no-ref/
> > +		sdmmc1_testdatam0_test: sdmmc1_testdatam0-test {
> > +			rockchip,pins =3D
> > +				/* sdmmc1_testdata_out_m0 */
> > +				<1 RK_PC5 5 &pcfg_pull_none>;
> > +		};
> > +	};
> > +
> > +	spdif {
> > +		/omit-if-no-ref/
> > +		spdifm0_rx0: spdifm0-rx0 {
> > +			rockchip,pins =3D
> > +				/* spdif_rx0_m0 */
> > +				<4 RK_PB4 1 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		spdifm0_rx1: spdifm0-rx1 {
> > +			rockchip,pins =3D
> > +				/* spdif_rx1_m0 */
> > +				<3 RK_PB4 4 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		spdifm0_tx0: spdifm0-tx0 {
> > +			rockchip,pins =3D
> > +				/* spdif_tx0_m0 */
> > +				<4 RK_PB5 1 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		spdifm0_tx1: spdifm0-tx1 {
> > +			rockchip,pins =3D
> > +				/* spdif_tx1_m0 */
> > +				<3 RK_PB5 4 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		spdifm1_rx0: spdifm1-rx0 {
> > +			rockchip,pins =3D
> > +				/* spdif_rx0_m1 */
> > +				<4 RK_PA0 2 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		spdifm1_rx1: spdifm1-rx1 {
> > +			rockchip,pins =3D
> > +				/* spdif_rx1_m1 */
> > +				<3 RK_PA2 5 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		spdifm1_tx0: spdifm1-tx0 {
> > +			rockchip,pins =3D
> > +				/* spdif_tx0_m1 */
> > +				<4 RK_PA1 2 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		spdifm1_tx1: spdifm1-tx1 {
> > +			rockchip,pins =3D
> > +				/* spdif_tx1_m1 */
> > +				<3 RK_PA3 5 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		spdifm2_rx0: spdifm2-rx0 {
> > +			rockchip,pins =3D
> > +				/* spdif_rx0_m2 */
> > +				<2 RK_PD6 5 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		spdifm2_rx1: spdifm2-rx1 {
> > +			rockchip,pins =3D
> > +				/* spdif_rx1_m2 */
> > +				<1 RK_PD4 6 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		spdifm2_tx0: spdifm2-tx0 {
> > +			rockchip,pins =3D
> > +				/* spdif_tx0_m2 */
> > +				<2 RK_PD7 5 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		spdifm2_tx1: spdifm2-tx1 {
> > +			rockchip,pins =3D
> > +				/* spdif_tx1_m2 */
> > +				<1 RK_PD5 6 &pcfg_pull_none>;
> > +		};
> > +	};
> > +
> > +	spi0 {
> > +		/omit-if-no-ref/
> > +		spi0m0_pins: spi0m0-pins {
> > +			rockchip,pins =3D
> > +				/* spi0_clk_m0 */
> > +				<0 RK_PC7 11 &pcfg_pull_none>,
> > +				/* spi0_miso_m0 */
> > +				<0 RK_PD1 11 &pcfg_pull_none>,
> > +				/* spi0_mosi_m0 */
> > +				<0 RK_PD0 11 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		spi0m0_csn0: spi0m0-csn0 {
> > +			rockchip,pins =3D
> > +				/* spi0m0_csn0 */
> > +				<0 RK_PC6 11 &pcfg_pull_none>;
> > +		};
> > +		/omit-if-no-ref/
> > +		spi0m0_csn1: spi0m0-csn1 {
> > +			rockchip,pins =3D
> > +				/* spi0m0_csn1 */
> > +				<0 RK_PC3 11 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		spi0m1_pins: spi0m1-pins {
> > +			rockchip,pins =3D
> > +				/* spi0_clk_m1 */
> > +				<2 RK_PA5 12 &pcfg_pull_none>,
> > +				/* spi0_miso_m1 */
> > +				<2 RK_PA1 12 &pcfg_pull_none>,
> > +				/* spi0_mosi_m1 */
> > +				<2 RK_PA0 12 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		spi0m1_csn0: spi0m1-csn0 {
> > +			rockchip,pins =3D
> > +				/* spi0m1_csn0 */
> > +				<2 RK_PA4 12 &pcfg_pull_none>;
> > +		};
> > +		/omit-if-no-ref/
> > +		spi0m1_csn1: spi0m1-csn1 {
> > +			rockchip,pins =3D
> > +				/* spi0m1_csn1 */
> > +				<2 RK_PA2 12 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		spi0m2_pins: spi0m2-pins {
> > +			rockchip,pins =3D
> > +				/* spi0_clk_m2 */
> > +				<1 RK_PA7 9 &pcfg_pull_none>,
> > +				/* spi0_miso_m2 */
> > +				<1 RK_PA6 9 &pcfg_pull_none>,
> > +				/* spi0_mosi_m2 */
> > +				<1 RK_PA5 9 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		spi0m2_csn0: spi0m2-csn0 {
> > +			rockchip,pins =3D
> > +				/* spi0m2_csn0 */
> > +				<1 RK_PA4 9 &pcfg_pull_none>;
> > +		};
> > +		/omit-if-no-ref/
> > +		spi0m2_csn1: spi0m2-csn1 {
> > +			rockchip,pins =3D
> > +				/* spi0m2_csn1 */
> > +				<1 RK_PB2 9 &pcfg_pull_none>;
> > +		};
> > +	};
> > +
> > +	spi1 {
> > +		/omit-if-no-ref/
> > +		spi1m0_pins: spi1m0-pins {
> > +			rockchip,pins =3D
> > +				/* spi1_clk_m0 */
> > +				<1 RK_PB4 11 &pcfg_pull_none>,
> > +				/* spi1_miso_m0 */
> > +				<1 RK_PB6 11 &pcfg_pull_none>,
> > +				/* spi1_mosi_m0 */
> > +				<1 RK_PB5 11 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		spi1m0_csn0: spi1m0-csn0 {
> > +			rockchip,pins =3D
> > +				/* spi1m0_csn0 */
> > +				<1 RK_PB7 11 &pcfg_pull_none>;
> > +		};
> > +		/omit-if-no-ref/
> > +		spi1m0_csn1: spi1m0-csn1 {
> > +			rockchip,pins =3D
> > +				/* spi1m0_csn1 */
> > +				<1 RK_PC0 11 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		spi1m1_pins: spi1m1-pins {
> > +			rockchip,pins =3D
> > +				/* spi1_clk_m1 */
> > +				<2 RK_PC5 10 &pcfg_pull_none>,
> > +				/* spi1_miso_m1 */
> > +				<2 RK_PC3 10 &pcfg_pull_none>,
> > +				/* spi1_mosi_m1 */
> > +				<2 RK_PC2 10 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		spi1m1_csn0: spi1m1-csn0 {
> > +			rockchip,pins =3D
> > +				/* spi1m1_csn0 */
> > +				<2 RK_PC4 10 &pcfg_pull_none>;
> > +		};
> > +		/omit-if-no-ref/
> > +		spi1m1_csn1: spi1m1-csn1 {
> > +			rockchip,pins =3D
> > +				/* spi1m1_csn1 */
> > +				<2 RK_PC1 10 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		spi1m2_pins: spi1m2-pins {
> > +			rockchip,pins =3D
> > +				/* spi1_clk_m2 */
> > +				<3 RK_PC7 10 &pcfg_pull_none>,
> > +				/* spi1_miso_m2 */
> > +				<3 RK_PC5 10 &pcfg_pull_none>,
> > +				/* spi1_mosi_m2 */
> > +				<3 RK_PC6 10 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		spi1m2_csn0: spi1m2-csn0 {
> > +			rockchip,pins =3D
> > +				/* spi1m2_csn0 */
> > +				<3 RK_PD0 10 &pcfg_pull_none>;
> > +		};
> > +		/omit-if-no-ref/
> > +		spi1m2_csn1: spi1m2-csn1 {
> > +			rockchip,pins =3D
> > +				/* spi1m2_csn1 */
> > +				<4 RK_PA0 10 &pcfg_pull_none>;
> > +		};
> > +	};
> > +
> > +	spi2 {
> > +		/omit-if-no-ref/
> > +		spi2m0_pins: spi2m0-pins {
> > +			rockchip,pins =3D
> > +				/* spi2_clk_m0 */
> > +				<0 RK_PB2 9 &pcfg_pull_none>,
> > +				/* spi2_miso_m0 */
> > +				<0 RK_PB1 9 &pcfg_pull_none>,
> > +				/* spi2_mosi_m0 */
> > +				<0 RK_PB3 9 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		spi2m0_csn0: spi2m0-csn0 {
> > +			rockchip,pins =3D
> > +				/* spi2m0_csn0 */
> > +				<0 RK_PB0 9 &pcfg_pull_none>;
> > +		};
> > +		/omit-if-no-ref/
> > +		spi2m0_csn1: spi2m0-csn1 {
> > +			rockchip,pins =3D
> > +				/* spi2m0_csn1 */
> > +				<0 RK_PA7 9 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		spi2m1_pins: spi2m1-pins {
> > +			rockchip,pins =3D
> > +				/* spi2_clk_m1 */
> > +				<1 RK_PD5 11 &pcfg_pull_none>,
> > +				/* spi2_miso_m1 */
> > +				<1 RK_PC5 11 &pcfg_pull_none>,
> > +				/* spi2_mosi_m1 */
> > +				<1 RK_PC4 11 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		spi2m1_csn0: spi2m1-csn0 {
> > +			rockchip,pins =3D
> > +				/* spi2m1_csn0 */
> > +				<1 RK_PC3 11 &pcfg_pull_none>;
> > +		};
> > +		/omit-if-no-ref/
> > +		spi2m1_csn1: spi2m1-csn1 {
> > +			rockchip,pins =3D
> > +				/* spi2m1_csn1 */
> > +				<1 RK_PC2 11 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		spi2m2_pins: spi2m2-pins {
> > +			rockchip,pins =3D
> > +				/* spi2_clk_m2 */
> > +				<3 RK_PA4 10 &pcfg_pull_none>,
> > +				/* spi2_miso_m2 */
> > +				<3 RK_PC1 10 &pcfg_pull_none>,
> > +				/* spi2_mosi_m2 */
> > +				<3 RK_PB0 10 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		spi2m2_csn0: spi2m2-csn0 {
> > +			rockchip,pins =3D
> > +				/* spi2m2_csn0 */
> > +				<3 RK_PC4 10 &pcfg_pull_none>;
> > +		};
> > +		/omit-if-no-ref/
> > +		spi2m2_csn1: spi2m2-csn1 {
> > +			rockchip,pins =3D
> > +				/* spi2m2_csn1 */
> > +				<3 RK_PA5 10 &pcfg_pull_none>;
> > +		};
> > +	};
> > +
> > +	spi3 {
> > +		/omit-if-no-ref/
> > +		spi3m0_pins: spi3m0-pins {
> > +			rockchip,pins =3D
> > +				/* spi3_clk_m0 */
> > +				<3 RK_PA0 10 &pcfg_pull_none>,
> > +				/* spi3_miso_m0 */
> > +				<3 RK_PA2 10 &pcfg_pull_none>,
> > +				/* spi3_mosi_m0 */
> > +				<3 RK_PA1 10 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		spi3m0_csn0: spi3m0-csn0 {
> > +			rockchip,pins =3D
> > +				/* spi3m0_csn0 */
> > +				<3 RK_PA3 10 &pcfg_pull_none>;
> > +		};
> > +		/omit-if-no-ref/
> > +		spi3m0_csn1: spi3m0-csn1 {
> > +			rockchip,pins =3D
> > +				/* spi3m0_csn1 */
> > +				<2 RK_PD7 10 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		spi3m1_pins: spi3m1-pins {
> > +			rockchip,pins =3D
> > +				/* spi3_clk_m1 */
> > +				<3 RK_PD4 10 &pcfg_pull_none>,
> > +				/* spi3_miso_m1 */
> > +				<3 RK_PD5 10 &pcfg_pull_none>,
> > +				/* spi3_mosi_m1 */
> > +				<3 RK_PD6 10 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		spi3m1_csn0: spi3m1-csn0 {
> > +			rockchip,pins =3D
> > +				/* spi3m1_csn0 */
> > +				<3 RK_PB6 10 &pcfg_pull_none>;
> > +		};
> > +		/omit-if-no-ref/
> > +		spi3m1_csn1: spi3m1-csn1 {
> > +			rockchip,pins =3D
> > +				/* spi3m1_csn1 */
> > +				<3 RK_PD7 10 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		spi3m2_pins: spi3m2-pins {
> > +			rockchip,pins =3D
> > +				/* spi3_clk_m2 */
> > +				<4 RK_PA7 9 &pcfg_pull_none>,
> > +				/* spi3_miso_m2 */
> > +				<4 RK_PA6 9 &pcfg_pull_none>,
> > +				/* spi3_mosi_m2 */
> > +				<4 RK_PA4 9 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		spi3m2_csn0: spi3m2-csn0 {
> > +			rockchip,pins =3D
> > +				/* spi3m2_csn0 */
> > +				<4 RK_PA3 9 &pcfg_pull_none>;
> > +		};
> > +		/omit-if-no-ref/
> > +		spi3m2_csn1: spi3m2-csn1 {
> > +			rockchip,pins =3D
> > +				/* spi3m2_csn1 */
> > +				<4 RK_PB3 10 &pcfg_pull_none>;
> > +		};
> > +	};
> > +
> > +	spi4 {
> > +		/omit-if-no-ref/
> > +		spi4m0_pins: spi4m0-pins {
> > +			rockchip,pins =3D
> > +				/* spi4_clk_m0 */
> > +				<4 RK_PC7 12 &pcfg_pull_none>,
> > +				/* spi4_miso_m0 */
> > +				<4 RK_PC6 12 &pcfg_pull_none>,
> > +				/* spi4_mosi_m0 */
> > +				<4 RK_PC5 12 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		spi4m0_csn0: spi4m0-csn0 {
> > +			rockchip,pins =3D
> > +				/* spi4m0_csn0 */
> > +				<4 RK_PC4 12 &pcfg_pull_none>;
> > +		};
> > +		/omit-if-no-ref/
> > +		spi4m0_csn1: spi4m0-csn1 {
> > +			rockchip,pins =3D
> > +				/* spi4m0_csn1 */
> > +				<4 RK_PC0 12 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		spi4m1_pins: spi4m1-pins {
> > +			rockchip,pins =3D
> > +				/* spi4_clk_m1 */
> > +				<3 RK_PD1 10 &pcfg_pull_none>,
> > +				/* spi4_miso_m1 */
> > +				<3 RK_PC2 10 &pcfg_pull_none>,
> > +				/* spi4_mosi_m1 */
> > +				<3 RK_PC3 10 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		spi4m1_csn0: spi4m1-csn0 {
> > +			rockchip,pins =3D
> > +				/* spi4m1_csn0 */
> > +				<3 RK_PB1 10 &pcfg_pull_none>;
> > +		};
> > +		/omit-if-no-ref/
> > +		spi4m1_csn1: spi4m1-csn1 {
> > +			rockchip,pins =3D
> > +				/* spi4m1_csn1 */
> > +				<3 RK_PD2 10 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		spi4m2_pins: spi4m2-pins {
> > +			rockchip,pins =3D
> > +				/* spi4_clk_m2 */
> > +				<4 RK_PB0 9 &pcfg_pull_none>,
> > +				/* spi4_miso_m2 */
> > +				<4 RK_PB2 9 &pcfg_pull_none>,
> > +				/* spi4_mosi_m2 */
> > +				<4 RK_PB1 9 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		spi4m2_csn0: spi4m2-csn0 {
> > +			rockchip,pins =3D
> > +				/* spi4m2_csn0 */
> > +				<4 RK_PB3 9 &pcfg_pull_none>;
> > +		};
> > +		/omit-if-no-ref/
> > +		spi4m2_csn1: spi4m2-csn1 {
> > +			rockchip,pins =3D
> > +				/* spi4m2_csn1 */
> > +				<4 RK_PA5 9 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		spi4m3_pins: spi4m3-pins {
> > +			rockchip,pins =3D
> > +				/* spi4_clk_m3 */
> > +				<2 RK_PB3 10 &pcfg_pull_none>,
> > +				/* spi4_miso_m3 */
> > +				<2 RK_PB5 10 &pcfg_pull_none>,
> > +				/* spi4_mosi_m3 */
> > +				<2 RK_PB4 10 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		spi4m3_csn0: spi4m3-csn0 {
> > +			rockchip,pins =3D
> > +				/* spi4m3_csn0 */
> > +				<2 RK_PB2 10 &pcfg_pull_none>;
> > +		};
> > +		/omit-if-no-ref/
> > +		spi4m3_csn1: spi4m3-csn1 {
> > +			rockchip,pins =3D
> > +				/* spi4m3_csn1 */
> > +				<2 RK_PA6 10 &pcfg_pull_none>;
> > +		};
> > +	};
> > +
> > +	test_clk {
> > +		/omit-if-no-ref/
> > +		test_clk_pins: test_clk-pins {
> > +			rockchip,pins =3D
> > +				/* test_clk_out */
> > +				<2 RK_PA5 5 &pcfg_pull_none>;
> > +		};
> > +	};
> > +
> > +	tsadc {
> > +		/omit-if-no-ref/
> > +		tsadcm0_pins: tsadcm0-pins {
> > +			rockchip,pins =3D
> > +				/* tsadc_ctrl_m0 */
> > +				<0 RK_PA1 9 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		tsadcm1_pins: tsadcm1-pins {
> > +			rockchip,pins =3D
> > +				/* tsadc_ctrl_m1 */
> > +				<0 RK_PA3 10 &pcfg_pull_none>;
> > +		};
> > +	};
> > +
> > +	tsadc_ctrl {
> > +		/omit-if-no-ref/
> > +		tsadc_ctrl_pins: tsadc_ctrl-pins {
> > +			rockchip,pins =3D
> > +				/* tsadc_ctrl_org */
> > +				<0 RK_PA1 10 &pcfg_pull_none>;
> > +		};
> > +	};
> > +
> > +	uart0 {
> > +		/omit-if-no-ref/
> > +		uart0m0_xfer: uart0m0-xfer {
> > +			rockchip,pins =3D
> > +				/* uart0_rx_m0 */
> > +				<0 RK_PD5 9 &pcfg_pull_up>,
> > +				/* uart0_tx_m0 */
> > +				<0 RK_PD4 9 &pcfg_pull_up>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		uart0m1_xfer: uart0m1-xfer {
> > +			rockchip,pins =3D
> > +				/* uart0_rx_m1 */
> > +				<2 RK_PA0 9 &pcfg_pull_up>,
> > +				/* uart0_tx_m1 */
> > +				<2 RK_PA1 9 &pcfg_pull_up>;
> > +		};
> > +	};
> > +
> > +	uart1 {
> > +		/omit-if-no-ref/
> > +		uart1m0_xfer: uart1m0-xfer {
> > +			rockchip,pins =3D
> > +				/* uart1_rx_m0 */
> > +				<0 RK_PC0 10 &pcfg_pull_up>,
> > +				/* uart1_tx_m0 */
> > +				<0 RK_PB7 10 &pcfg_pull_up>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		uart1m0_ctsn: uart1m0-ctsn {
> > +			rockchip,pins =3D
> > +				/* uart1m0_ctsn */
> > +				<0 RK_PD2 13 &pcfg_pull_none>;
> > +		};
> > +		/omit-if-no-ref/
> > +		uart1m0_rtsn: uart1m0-rtsn {
> > +			rockchip,pins =3D
> > +				/* uart1m0_rtsn */
> > +				<0 RK_PD3 13 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		uart1m1_xfer: uart1m1-xfer {
> > +			rockchip,pins =3D
> > +				/* uart1_rx_m1 */
> > +				<2 RK_PB1 9 &pcfg_pull_up>,
> > +				/* uart1_tx_m1 */
> > +				<2 RK_PB0 9 &pcfg_pull_up>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		uart1m1_ctsn: uart1m1-ctsn {
> > +			rockchip,pins =3D
> > +				/* uart1m1_ctsn */
> > +				<2 RK_PB2 9 &pcfg_pull_none>;
> > +		};
> > +		/omit-if-no-ref/
> > +		uart1m1_rtsn: uart1m1-rtsn {
> > +			rockchip,pins =3D
> > +				/* uart1m1_rtsn */
> > +				<2 RK_PB3 9 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		uart1m2_xfer: uart1m2-xfer {
> > +			rockchip,pins =3D
> > +				/* uart1_rx_m2 */
> > +				<3 RK_PA6 9 &pcfg_pull_up>,
> > +				/* uart1_tx_m2 */
> > +				<3 RK_PA7 9 &pcfg_pull_up>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		uart1m2_ctsn: uart1m2-ctsn {
> > +			rockchip,pins =3D
> > +				/* uart1m2_ctsn */
> > +				<3 RK_PA4 9 &pcfg_pull_none>;
> > +		};
> > +		/omit-if-no-ref/
> > +		uart1m2_rtsn: uart1m2-rtsn {
> > +			rockchip,pins =3D
> > +				/* uart1m2_rtsn */
> > +				<3 RK_PA5 9 &pcfg_pull_none>;
> > +		};
> > +	};
> > +
> > +	uart2 {
> > +		/omit-if-no-ref/
> > +		uart2m0_xfer: uart2m0-xfer {
> > +			rockchip,pins =3D
> > +				/* uart2_rx_m0 */
> > +				<1 RK_PC7 9 &pcfg_pull_up>,
> > +				/* uart2_tx_m0 */
> > +				<1 RK_PC6 9 &pcfg_pull_up>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		uart2m0_ctsn: uart2m0-ctsn {
> > +			rockchip,pins =3D
> > +				/* uart2m0_ctsn */
> > +				<1 RK_PC5 10 &pcfg_pull_none>;
> > +		};
> > +		/omit-if-no-ref/
> > +		uart2m0_rtsn: uart2m0-rtsn {
> > +			rockchip,pins =3D
> > +				/* uart2m0_rtsn */
> > +				<1 RK_PC4 10 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		uart2m1_xfer: uart2m1-xfer {
> > +			rockchip,pins =3D
> > +				/* uart2_rx_m1 */
> > +				<4 RK_PB4 10 &pcfg_pull_up>,
> > +				/* uart2_tx_m1 */
> > +				<4 RK_PB5 10 &pcfg_pull_up>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		uart2m1_ctsn: uart2m1-ctsn {
> > +			rockchip,pins =3D
> > +				/* uart2m1_ctsn */
> > +				<4 RK_PB1 12 &pcfg_pull_none>;
> > +		};
> > +		/omit-if-no-ref/
> > +		uart2m1_rtsn: uart2m1-rtsn {
> > +			rockchip,pins =3D
> > +				/* uart2m1_rtsn */
> > +				<4 RK_PB0 12 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		uart2m2_xfer: uart2m2-xfer {
> > +			rockchip,pins =3D
> > +				/* uart2_rx_m2 */
> > +				<3 RK_PB7 9 &pcfg_pull_up>,
> > +				/* uart2_tx_m2 */
> > +				<3 RK_PC0 9 &pcfg_pull_up>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		uart2m2_ctsn: uart2m2-ctsn {
> > +			rockchip,pins =3D
> > +				/* uart2m2_ctsn */
> > +				<3 RK_PD3 9 &pcfg_pull_none>;
> > +		};
> > +		/omit-if-no-ref/
> > +		uart2m2_rtsn: uart2m2-rtsn {
> > +			rockchip,pins =3D
> > +				/* uart2m2_rtsn */
> > +				<3 RK_PD2 9 &pcfg_pull_none>;
> > +		};
> > +	};
> > +
> > +	uart3 {
> > +		/omit-if-no-ref/
> > +		uart3m0_xfer: uart3m0-xfer {
> > +			rockchip,pins =3D
> > +				/* uart3_rx_m0 */
> > +				<3 RK_PA1 9 &pcfg_pull_up>,
> > +				/* uart3_tx_m0 */
> > +				<3 RK_PA0 9 &pcfg_pull_up>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		uart3m0_ctsn: uart3m0-ctsn {
> > +			rockchip,pins =3D
> > +				/* uart3m0_ctsn */
> > +				<3 RK_PA2 9 &pcfg_pull_none>;
> > +		};
> > +		/omit-if-no-ref/
> > +		uart3m0_rtsn: uart3m0-rtsn {
> > +			rockchip,pins =3D
> > +				/* uart3m0_rtsn */
> > +				<3 RK_PA3 9 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		uart3m1_xfer: uart3m1-xfer {
> > +			rockchip,pins =3D
> > +				/* uart3_rx_m1 */
> > +				<4 RK_PA1 9 &pcfg_pull_up>,
> > +				/* uart3_tx_m1 */
> > +				<4 RK_PA0 9 &pcfg_pull_up>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		uart3m1_ctsn: uart3m1-ctsn {
> > +			rockchip,pins =3D
> > +				/* uart3m1_ctsn */
> > +				<3 RK_PB7 10 &pcfg_pull_none>;
> > +		};
> > +		/omit-if-no-ref/
> > +		uart3m1_rtsn: uart3m1-rtsn {
> > +			rockchip,pins =3D
> > +				/* uart3m1_rtsn */
> > +				<3 RK_PC0 10 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		uart3m2_xfer: uart3m2-xfer {
> > +			rockchip,pins =3D
> > +				/* uart3_rx_m2 */
> > +				<1 RK_PC1 9 &pcfg_pull_up>,
> > +				/* uart3_tx_m2 */
> > +				<1 RK_PC0 9 &pcfg_pull_up>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		uart3m2_ctsn: uart3m2-ctsn {
> > +			rockchip,pins =3D
> > +				/* uart3m2_ctsn */
> > +				<1 RK_PB6 9 &pcfg_pull_none>;
> > +		};
> > +		/omit-if-no-ref/
> > +		uart3m2_rtsn: uart3m2-rtsn {
> > +			rockchip,pins =3D
> > +				/* uart3m2_rtsn */
> > +				<1 RK_PB7 9 &pcfg_pull_none>;
> > +		};
> > +	};
> > +
> > +	uart4 {
> > +		/omit-if-no-ref/
> > +		uart4m0_xfer: uart4m0-xfer {
> > +			rockchip,pins =3D
> > +				/* uart4_rx_m0 */
> > +				<2 RK_PD1 9 &pcfg_pull_up>,
> > +				/* uart4_tx_m0 */
> > +				<2 RK_PD0 9 &pcfg_pull_up>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		uart4m0_ctsn: uart4m0-ctsn {
> > +			rockchip,pins =3D
> > +				/* uart4m0_ctsn */
> > +				<2 RK_PC6 9 &pcfg_pull_none>;
> > +		};
> > +		/omit-if-no-ref/
> > +		uart4m0_rtsn: uart4m0-rtsn {
> > +			rockchip,pins =3D
> > +				/* uart4m0_rtsn */
> > +				<2 RK_PC7 9 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		uart4m1_xfer: uart4m1-xfer {
> > +			rockchip,pins =3D
> > +				/* uart4_rx_m1 */
> > +				<1 RK_PC5 9 &pcfg_pull_up>,
> > +				/* uart4_tx_m1 */
> > +				<1 RK_PC4 9 &pcfg_pull_up>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		uart4m1_ctsn: uart4m1-ctsn {
> > +			rockchip,pins =3D
> > +				/* uart4m1_ctsn */
> > +				<1 RK_PC3 9 &pcfg_pull_none>;
> > +		};
> > +		/omit-if-no-ref/
> > +		uart4m1_rtsn: uart4m1-rtsn {
> > +			rockchip,pins =3D
> > +				/* uart4m1_rtsn */
> > +				<1 RK_PC2 9 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		uart4m2_xfer: uart4m2-xfer {
> > +			rockchip,pins =3D
> > +				/* uart4_rx_m2 */
> > +				<0 RK_PB5 10 &pcfg_pull_up>,
> > +				/* uart4_tx_m2 */
> > +				<0 RK_PB4 10 &pcfg_pull_up>;
> > +		};
> > +	};
> > +
> > +	uart5 {
> > +		/omit-if-no-ref/
> > +		uart5m0_xfer: uart5m0-xfer {
> > +			rockchip,pins =3D
> > +				/* uart5_rx_m0 */
> > +				<3 RK_PD4 9 &pcfg_pull_up>,
> > +				/* uart5_tx_m0 */
> > +				<3 RK_PD5 9 &pcfg_pull_up>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		uart5m0_ctsn: uart5m0-ctsn {
> > +			rockchip,pins =3D
> > +				/* uart5m0_ctsn */
> > +				<3 RK_PD6 9 &pcfg_pull_none>;
> > +		};
> > +		/omit-if-no-ref/
> > +		uart5m0_rtsn: uart5m0-rtsn {
> > +			rockchip,pins =3D
> > +				/* uart5m0_rtsn */
> > +				<3 RK_PD7 9 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		uart5m1_xfer: uart5m1-xfer {
> > +			rockchip,pins =3D
> > +				/* uart5_rx_m1 */
> > +				<4 RK_PB1 10 &pcfg_pull_up>,
> > +				/* uart5_tx_m1 */
> > +				<4 RK_PB0 10 &pcfg_pull_up>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		uart5m1_ctsn: uart5m1-ctsn {
> > +			rockchip,pins =3D
> > +				/* uart5m1_ctsn */
> > +				<4 RK_PA5 10 &pcfg_pull_none>;
> > +		};
> > +		/omit-if-no-ref/
> > +		uart5m1_rtsn: uart5m1-rtsn {
> > +			rockchip,pins =3D
> > +				/* uart5m1_rtsn */
> > +				<4 RK_PA3 10 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		uart5m2_xfer: uart5m2-xfer {
> > +			rockchip,pins =3D
> > +				/* uart5_rx_m2 */
> > +				<2 RK_PA4 9 &pcfg_pull_up>,
> > +				/* uart5_tx_m2 */
> > +				<2 RK_PA5 9 &pcfg_pull_up>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		uart5m2_ctsn: uart5m2-ctsn {
> > +			rockchip,pins =3D
> > +				/* uart5m2_ctsn */
> > +				<2 RK_PA3 10 &pcfg_pull_none>;
> > +		};
> > +		/omit-if-no-ref/
> > +		uart5m2_rtsn: uart5m2-rtsn {
> > +			rockchip,pins =3D
> > +				/* uart5m2_rtsn */
> > +				<2 RK_PA2 10 &pcfg_pull_none>;
> > +		};
> > +	};
> > +
> > +	uart6 {
> > +		/omit-if-no-ref/
> > +		uart6m0_xfer: uart6m0-xfer {
> > +			rockchip,pins =3D
> > +				/* uart6_rx_m0 */
> > +				<4 RK_PA6 10 &pcfg_pull_up>,
> > +				/* uart6_tx_m0 */
> > +				<4 RK_PA4 10 &pcfg_pull_up>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		uart6m0_ctsn: uart6m0-ctsn {
> > +			rockchip,pins =3D
> > +				/* uart6m0_ctsn */
> > +				<4 RK_PB1 11 &pcfg_pull_none>;
> > +		};
> > +		/omit-if-no-ref/
> > +		uart6m0_rtsn: uart6m0-rtsn {
> > +			rockchip,pins =3D
> > +				/* uart6m0_rtsn */
> > +				<4 RK_PB0 11 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		uart6m1_xfer: uart6m1-xfer {
> > +			rockchip,pins =3D
> > +				/* uart6_rx_m1 */
> > +				<2 RK_PD3 9 &pcfg_pull_up>,
> > +				/* uart6_tx_m1 */
> > +				<2 RK_PD2 9 &pcfg_pull_up>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		uart6m1_ctsn: uart6m1-ctsn {
> > +			rockchip,pins =3D
> > +				/* uart6m1_ctsn */
> > +				<2 RK_PD5 9 &pcfg_pull_none>;
> > +		};
> > +		/omit-if-no-ref/
> > +		uart6m1_rtsn: uart6m1-rtsn {
> > +			rockchip,pins =3D
> > +				/* uart6m1_rtsn */
> > +				<2 RK_PD4 9 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		uart6m2_xfer: uart6m2-xfer {
> > +			rockchip,pins =3D
> > +				/* uart6_rx_m2 */
> > +				<1 RK_PB3 9 &pcfg_pull_up>,
> > +				/* uart6_tx_m2 */
> > +				<1 RK_PB0 9 &pcfg_pull_up>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		uart6m2_ctsn: uart6m2-ctsn {
> > +			rockchip,pins =3D
> > +				/* uart6m2_ctsn */
> > +				<1 RK_PA3 10 &pcfg_pull_none>;
> > +		};
> > +		/omit-if-no-ref/
> > +		uart6m2_rtsn: uart6m2-rtsn {
> > +			rockchip,pins =3D
> > +				/* uart6m2_rtsn */
> > +				<1 RK_PA2 10 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		uart6m3_xfer: uart6m3-xfer {
> > +			rockchip,pins =3D
> > +				/* uart6_rx_m3 */
> > +				<4 RK_PC5 13 &pcfg_pull_up>,
> > +				/* uart6_tx_m3 */
> > +				<4 RK_PC4 13 &pcfg_pull_up>;
> > +		};
> > +	};
> > +
> > +	uart7 {
> > +		/omit-if-no-ref/
> > +		uart7m0_xfer: uart7m0-xfer {
> > +			rockchip,pins =3D
> > +				/* uart7_rx_m0 */
> > +				<2 RK_PB7 9 &pcfg_pull_up>,
> > +				/* uart7_tx_m0 */
> > +				<2 RK_PB6 9 &pcfg_pull_up>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		uart7m0_ctsn: uart7m0-ctsn {
> > +			rockchip,pins =3D
> > +				/* uart7m0_ctsn */
> > +				<2 RK_PB4 9 &pcfg_pull_none>;
> > +		};
> > +		/omit-if-no-ref/
> > +		uart7m0_rtsn: uart7m0-rtsn {
> > +			rockchip,pins =3D
> > +				/* uart7m0_rtsn */
> > +				<2 RK_PB5 9 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		uart7m1_xfer: uart7m1-xfer {
> > +			rockchip,pins =3D
> > +				/* uart7_rx_m1 */
> > +				<1 RK_PA3 9 &pcfg_pull_up>,
> > +				/* uart7_tx_m1 */
> > +				<1 RK_PA2 9 &pcfg_pull_up>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		uart7m1_ctsn: uart7m1-ctsn {
> > +			rockchip,pins =3D
> > +				/* uart7m1_ctsn */
> > +				<1 RK_PA1 9 &pcfg_pull_none>;
> > +		};
> > +		/omit-if-no-ref/
> > +		uart7m1_rtsn: uart7m1-rtsn {
> > +			rockchip,pins =3D
> > +				/* uart7m1_rtsn */
> > +				<1 RK_PA0 9 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		uart7m2_xfer: uart7m2-xfer {
> > +			rockchip,pins =3D
> > +				/* uart7_rx_m2 */
> > +				<2 RK_PA0 10 &pcfg_pull_up>,
> > +				/* uart7_tx_m2 */
> > +				<2 RK_PA1 10 &pcfg_pull_up>;
> > +		};
> > +	};
> > +
> > +	uart8 {
> > +		/omit-if-no-ref/
> > +		uart8m0_xfer: uart8m0-xfer {
> > +			rockchip,pins =3D
> > +				/* uart8_rx_m0 */
> > +				<3 RK_PC5 9 &pcfg_pull_up>,
> > +				/* uart8_tx_m0 */
> > +				<3 RK_PC6 9 &pcfg_pull_up>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		uart8m0_ctsn: uart8m0-ctsn {
> > +			rockchip,pins =3D
> > +				/* uart8m0_ctsn */
> > +				<3 RK_PD0 9 &pcfg_pull_none>;
> > +		};
> > +		/omit-if-no-ref/
> > +		uart8m0_rtsn: uart8m0-rtsn {
> > +			rockchip,pins =3D
> > +				/* uart8m0_rtsn */
> > +				<3 RK_PC7 9 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		uart8m1_xfer: uart8m1-xfer {
> > +			rockchip,pins =3D
> > +				/* uart8_rx_m1 */
> > +				<2 RK_PA7 9 &pcfg_pull_up>,
> > +				/* uart8_tx_m1 */
> > +				<2 RK_PA6 9 &pcfg_pull_up>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		uart8m1_ctsn: uart8m1-ctsn {
> > +			rockchip,pins =3D
> > +				/* uart8m1_ctsn */
> > +				<2 RK_PB7 10 &pcfg_pull_none>;
> > +		};
> > +		/omit-if-no-ref/
> > +		uart8m1_rtsn: uart8m1-rtsn {
> > +			rockchip,pins =3D
> > +				/* uart8m1_rtsn */
> > +				<2 RK_PB6 10 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		uart8m2_xfer: uart8m2-xfer {
> > +			rockchip,pins =3D
> > +				/* uart8_rx_m2 */
> > +				<0 RK_PC2 10 &pcfg_pull_up>,
> > +				/* uart8_tx_m2 */
> > +				<0 RK_PC1 10 &pcfg_pull_up>;
> > +		};
> > +	};
> > +
> > +	uart9 {
> > +		/omit-if-no-ref/
> > +		uart9m0_xfer: uart9m0-xfer {
> > +			rockchip,pins =3D
> > +				/* uart9_rx_m0 */
> > +				<2 RK_PC0 9 &pcfg_pull_up>,
> > +				/* uart9_tx_m0 */
> > +				<2 RK_PC1 9 &pcfg_pull_up>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		uart9m0_ctsn: uart9m0-ctsn {
> > +			rockchip,pins =3D
> > +				/* uart9m0_ctsn */
> > +				<2 RK_PD7 9 &pcfg_pull_none>;
> > +		};
> > +		/omit-if-no-ref/
> > +		uart9m0_rtsn: uart9m0-rtsn {
> > +			rockchip,pins =3D
> > +				/* uart9m0_rtsn */
> > +				<2 RK_PD6 9 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		uart9m1_xfer: uart9m1-xfer {
> > +			rockchip,pins =3D
> > +				/* uart9_rx_m1 */
> > +				<3 RK_PB2 9 &pcfg_pull_up>,
> > +				/* uart9_tx_m1 */
> > +				<3 RK_PB3 9 &pcfg_pull_up>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		uart9m1_ctsn: uart9m1-ctsn {
> > +			rockchip,pins =3D
> > +				/* uart9m1_ctsn */
> > +				<3 RK_PB5 9 &pcfg_pull_none>;
> > +		};
> > +		/omit-if-no-ref/
> > +		uart9m1_rtsn: uart9m1-rtsn {
> > +			rockchip,pins =3D
> > +				/* uart9m1_rtsn */
> > +				<3 RK_PB4 9 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		uart9m2_xfer: uart9m2-xfer {
> > +			rockchip,pins =3D
> > +				/* uart9_rx_m2 */
> > +				<4 RK_PC3 13 &pcfg_pull_up>,
> > +				/* uart9_tx_m2 */
> > +				<4 RK_PC2 13 &pcfg_pull_up>;
> > +		};
> > +	};
> > +
> > +	uart10 {
> > +		/omit-if-no-ref/
> > +		uart10m0_xfer: uart10m0-xfer {
> > +			rockchip,pins =3D
> > +				/* uart10_rx_m0 */
> > +				<3 RK_PB0 9 &pcfg_pull_up>,
> > +				/* uart10_tx_m0 */
> > +				<3 RK_PB1 9 &pcfg_pull_up>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		uart10m0_ctsn: uart10m0-ctsn {
> > +			rockchip,pins =3D
> > +				/* uart10m0_ctsn */
> > +				<3 RK_PA6 10 &pcfg_pull_none>;
> > +		};
> > +		/omit-if-no-ref/
> > +		uart10m0_rtsn: uart10m0-rtsn {
> > +			rockchip,pins =3D
> > +				/* uart10m0_rtsn */
> > +				<3 RK_PA7 10 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		uart10m1_xfer: uart10m1-xfer {
> > +			rockchip,pins =3D
> > +				/* uart10_rx_m1 */
> > +				<1 RK_PD1 9 &pcfg_pull_up>,
> > +				/* uart10_tx_m1 */
> > +				<1 RK_PD0 9 &pcfg_pull_up>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		uart10m1_ctsn: uart10m1-ctsn {
> > +			rockchip,pins =3D
> > +				/* uart10m1_ctsn */
> > +				<1 RK_PD5 9 &pcfg_pull_none>;
> > +		};
> > +		/omit-if-no-ref/
> > +		uart10m1_rtsn: uart10m1-rtsn {
> > +			rockchip,pins =3D
> > +				/* uart10m1_rtsn */
> > +				<1 RK_PD4 9 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		uart10m2_xfer: uart10m2-xfer {
> > +			rockchip,pins =3D
> > +				/* uart10_rx_m2 */
> > +				<0 RK_PC5 10 &pcfg_pull_up>,
> > +				/* uart10_tx_m2 */
> > +				<0 RK_PC4 10 &pcfg_pull_up>;
> > +		};
> > +	};
> > +
> > +	uart11 {
> > +		/omit-if-no-ref/
> > +		uart11m0_xfer: uart11m0-xfer {
> > +			rockchip,pins =3D
> > +				/* uart11_rx_m0 */
> > +				<3 RK_PC1 9 &pcfg_pull_up>,
> > +				/* uart11_tx_m0 */
> > +				<3 RK_PC4 9 &pcfg_pull_up>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		uart11m0_ctsn: uart11m0-ctsn {
> > +			rockchip,pins =3D
> > +				/* uart11m0_ctsn */
> > +				<3 RK_PC3 9 &pcfg_pull_none>;
> > +		};
> > +		/omit-if-no-ref/
> > +		uart11m0_rtsn: uart11m0-rtsn {
> > +			rockchip,pins =3D
> > +				/* uart11m0_rtsn */
> > +				<3 RK_PC2 9 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		uart11m1_xfer: uart11m1-xfer {
> > +			rockchip,pins =3D
> > +				/* uart11_rx_m1 */
> > +				<2 RK_PC5 9 &pcfg_pull_up>,
> > +				/* uart11_tx_m1 */
> > +				<2 RK_PC4 9 &pcfg_pull_up>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		uart11m1_ctsn: uart11m1-ctsn {
> > +			rockchip,pins =3D
> > +				/* uart11m1_ctsn */
> > +				<2 RK_PC2 9 &pcfg_pull_none>;
> > +		};
> > +		/omit-if-no-ref/
> > +		uart11m1_rtsn: uart11m1-rtsn {
> > +			rockchip,pins =3D
> > +				/* uart11m1_rtsn */
> > +				<2 RK_PC3 9 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		uart11m2_xfer: uart11m2-xfer {
> > +			rockchip,pins =3D
> > +				/* uart11_rx_m2 */
> > +				<4 RK_PC1 13 &pcfg_pull_up>,
> > +				/* uart11_tx_m2 */
> > +				<4 RK_PC0 13 &pcfg_pull_up>;
> > +		};
> > +	};
> > +
> > +	ufs {
> > +		/omit-if-no-ref/
> > +		ufs_refclk: ufs-refclk {
> > +			rockchip,pins =3D
> > +				/* ufs_refclk */
> > +				<4 RK_PD1 1 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		ufs_rst: ufs-rst {
> > +			rockchip,pins =3D
> > +				/* ufs_rstn */
> > +				<4 RK_PD0 1 &pcfg_pull_none>;
> > +		};
> > +	};
> > +
> > +	ufs_testdata0 {
> > +		/omit-if-no-ref/
> > +		ufs_testdata0_test: ufs_testdata0-test {
> > +			rockchip,pins =3D
> > +				/* ufs_testdata0_out */
> > +				<4 RK_PC4 4 &pcfg_pull_none>;
> > +		};
> > +	};
> > +
> > +	ufs_testdata1 {
> > +		/omit-if-no-ref/
> > +		ufs_testdata1_test: ufs_testdata1-test {
> > +			rockchip,pins =3D
> > +				/* ufs_testdata1_out */
> > +				<4 RK_PC5 4 &pcfg_pull_none>;
> > +		};
> > +	};
> > +
> > +	ufs_testdata2 {
> > +		/omit-if-no-ref/
> > +		ufs_testdata2_test: ufs_testdata2-test {
> > +			rockchip,pins =3D
> > +				/* ufs_testdata2_out */
> > +				<4 RK_PC6 4 &pcfg_pull_none>;
> > +		};
> > +	};
> > +
> > +	ufs_testdata3 {
> > +		/omit-if-no-ref/
> > +		ufs_testdata3_test: ufs_testdata3-test {
> > +			rockchip,pins =3D
> > +				/* ufs_testdata3_out */
> > +				<4 RK_PC7 4 &pcfg_pull_none>;
> > +		};
> > +	};
> > +
> > +	vi_cif {
> > +		/omit-if-no-ref/
> > +		vi_cif_pins: vi_cif-pins {
> > +			rockchip,pins =3D
> > +				/* vi_cif_clki */
> > +				<3 RK_PA3 1 &pcfg_pull_none>,
> > +				/* vi_cif_clko */
> > +				<3 RK_PA2 1 &pcfg_pull_none>,
> > +				/* vi_cif_d0 */
> > +				<2 RK_PC5 1 &pcfg_pull_none>,
> > +				/* vi_cif_d1 */
> > +				<2 RK_PC4 1 &pcfg_pull_none>,
> > +				/* vi_cif_d2 */
> > +				<2 RK_PC3 1 &pcfg_pull_none>,
> > +				/* vi_cif_d3 */
> > +				<2 RK_PC2 1 &pcfg_pull_none>,
> > +				/* vi_cif_d4 */
> > +				<2 RK_PC1 1 &pcfg_pull_none>,
> > +				/* vi_cif_d5 */
> > +				<2 RK_PC0 1 &pcfg_pull_none>,
> > +				/* vi_cif_d6 */
> > +				<2 RK_PB7 1 &pcfg_pull_none>,
> > +				/* vi_cif_d7 */
> > +				<2 RK_PB6 1 &pcfg_pull_none>,
> > +				/* vi_cif_d8 */
> > +				<2 RK_PB5 1 &pcfg_pull_none>,
> > +				/* vi_cif_d9 */
> > +				<2 RK_PB4 1 &pcfg_pull_none>,
> > +				/* vi_cif_d10 */
> > +				<2 RK_PB3 1 &pcfg_pull_none>,
> > +				/* vi_cif_d11 */
> > +				<2 RK_PB2 1 &pcfg_pull_none>,
> > +				/* vi_cif_d12 */
> > +				<2 RK_PB1 1 &pcfg_pull_none>,
> > +				/* vi_cif_d13 */
> > +				<2 RK_PB0 1 &pcfg_pull_none>,
> > +				/* vi_cif_d14 */
> > +				<2 RK_PA7 1 &pcfg_pull_none>,
> > +				/* vi_cif_d15 */
> > +				<2 RK_PA6 1 &pcfg_pull_none>,
> > +				/* vi_cif_href */
> > +				<3 RK_PA0 1 &pcfg_pull_none>,
> > +				/* vi_cif_vsync */
> > +				<3 RK_PA1 1 &pcfg_pull_none>;
> > +		};
> > +	};
> > +
> > +	vo_lcdc {
> > +		/omit-if-no-ref/
> > +		vo_lcdc_pins: vo_lcdc-pins {
> > +			rockchip,pins =3D
> > +				/* vo_lcdc_clk */
> > +				<3 RK_PD7 1 &pcfg_pull_none>,
> > +				/* vo_lcdc_d0 */
> > +				<3 RK_PD3 1 &pcfg_pull_none>,
> > +				/* vo_lcdc_d1 */
> > +				<3 RK_PD2 1 &pcfg_pull_none>,
> > +				/* vo_lcdc_d2 */
> > +				<3 RK_PD1 1 &pcfg_pull_none>,
> > +				/* vo_lcdc_d3 */
> > +				<3 RK_PD0 1 &pcfg_pull_none>,
> > +				/* vo_lcdc_d4 */
> > +				<3 RK_PC7 1 &pcfg_pull_none>,
> > +				/* vo_lcdc_d5 */
> > +				<3 RK_PC6 1 &pcfg_pull_none>,
> > +				/* vo_lcdc_d6 */
> > +				<3 RK_PC5 1 &pcfg_pull_none>,
> > +				/* vo_lcdc_d7 */
> > +				<3 RK_PC4 1 &pcfg_pull_none>,
> > +				/* vo_lcdc_d8 */
> > +				<3 RK_PC3 1 &pcfg_pull_none>,
> > +				/* vo_lcdc_d9 */
> > +				<3 RK_PC2 1 &pcfg_pull_none>,
> > +				/* vo_lcdc_d10 */
> > +				<3 RK_PC1 1 &pcfg_pull_none>,
> > +				/* vo_lcdc_d11 */
> > +				<3 RK_PC0 1 &pcfg_pull_none>,
> > +				/* vo_lcdc_d12 */
> > +				<3 RK_PB7 1 &pcfg_pull_none>,
> > +				/* vo_lcdc_d13 */
> > +				<3 RK_PB6 1 &pcfg_pull_none>,
> > +				/* vo_lcdc_d14 */
> > +				<3 RK_PB5 1 &pcfg_pull_none>,
> > +				/* vo_lcdc_d15 */
> > +				<3 RK_PB4 1 &pcfg_pull_none>,
> > +				/* vo_lcdc_d16 */
> > +				<3 RK_PB3 1 &pcfg_pull_none>,
> > +				/* vo_lcdc_d17 */
> > +				<3 RK_PB2 1 &pcfg_pull_none>,
> > +				/* vo_lcdc_d18 */
> > +				<3 RK_PB1 1 &pcfg_pull_none>,
> > +				/* vo_lcdc_d19 */
> > +				<3 RK_PB0 1 &pcfg_pull_none>,
> > +				/* vo_lcdc_d20 */
> > +				<3 RK_PA7 1 &pcfg_pull_none>,
> > +				/* vo_lcdc_d21 */
> > +				<3 RK_PA6 1 &pcfg_pull_none>,
> > +				/* vo_lcdc_d22 */
> > +				<3 RK_PA5 1 &pcfg_pull_none>,
> > +				/* vo_lcdc_d23 */
> > +				<3 RK_PA4 1 &pcfg_pull_none>,
> > +				/* vo_lcdc_den */
> > +				<3 RK_PD4 1 &pcfg_pull_none>,
> > +				/* vo_lcdc_hsync */
> > +				<3 RK_PD5 1 &pcfg_pull_none>,
> > +				/* vo_lcdc_vsync */
> > +				<3 RK_PD6 1 &pcfg_pull_none>;
> > +		};
> > +	};
> > +
> > +	vo_post {
> > +		/omit-if-no-ref/
> > +		vo_post_pins: vo_post-pins {
> > +			rockchip,pins =3D
> > +				/* vo_post_empty */
> > +				<4 RK_PA1 1 &pcfg_pull_none>;
> > +		};
> > +	};
> > +
> > +	vp0_sync {
> > +		/omit-if-no-ref/
> > +		vp0_sync_pins: vp0_sync-pins {
> > +			rockchip,pins =3D
> > +				/* vp0_sync_out */
> > +				<4 RK_PC5 3 &pcfg_pull_none>;
> > +		};
> > +	};
> > +
> > +	vp1_sync {
> > +		/omit-if-no-ref/
> > +		vp1_sync_pins: vp1_sync-pins {
> > +			rockchip,pins =3D
> > +				/* vp1_sync_out */
> > +				<4 RK_PC6 3 &pcfg_pull_none>;
> > +		};
> > +	};
> > +
> > +	vp2_sync {
> > +		/omit-if-no-ref/
> > +		vp2_sync_pins: vp2_sync-pins {
> > +			rockchip,pins =3D
> > +				/* vp2_sync_out */
> > +				<4 RK_PC7 3 &pcfg_pull_none>;
> > +		};
> > +	};
> > +};
> > +
> > +/*
> > + * This part is edited handly.
> > + */
> > +&pinctrl {
> > +	pmic {
> > +		/omit-if-no-ref/
> > +		pmic_pins: pmic-pins {
> > +			rockchip,pins =3D
> > +				/* pmic_int */
> > +				<0 RK_PA6 9 &pcfg_pull_up>,
> > +				/* pmic_sleep */
> > +				<0 RK_PA4 9 &pcfg_pull_none>;
> > +		};
> > +	};
> > +
> > +	vo {
> > +		/omit-if-no-ref/
> > +		bt1120_pins: bt1120-pins {
> > +			rockchip,pins =3D
> > +				/* vo_lcdc_clk */
> > +				<3 RK_PD7 1 &pcfg_pull_none>,
> > +				/* vo_lcdc_d3 */
> > +				<3 RK_PD0 1 &pcfg_pull_none>,
> > +				/* vo_lcdc_d4 */
> > +				<3 RK_PC7 1 &pcfg_pull_none>,
> > +				/* vo_lcdc_d5 */
> > +				<3 RK_PC6 1 &pcfg_pull_none>,
> > +				/* vo_lcdc_d6 */
> > +				<3 RK_PC5 1 &pcfg_pull_none>,
> > +				/* vo_lcdc_d7 */
> > +				<3 RK_PC4 1 &pcfg_pull_none>,
> > +				/* vo_lcdc_d10 */
> > +				<3 RK_PC1 1 &pcfg_pull_none>,
> > +				/* vo_lcdc_d11 */
> > +				<3 RK_PC0 1 &pcfg_pull_none>,
> > +				/* vo_lcdc_d12 */
> > +				<3 RK_PB7 1 &pcfg_pull_none>,
> > +				/* vo_lcdc_d13 */
> > +				<3 RK_PB6 1 &pcfg_pull_none>,
> > +				/* vo_lcdc_d14 */
> > +				<3 RK_PB5 1 &pcfg_pull_none>,
> > +				/* vo_lcdc_d15 */
> > +				<3 RK_PB4 1 &pcfg_pull_none>,
> > +				/* vo_lcdc_d19 */
> > +				<3 RK_PB0 1 &pcfg_pull_none>,
> > +				/* vo_lcdc_d20 */
> > +				<3 RK_PA7 1 &pcfg_pull_none>,
> > +				/* vo_lcdc_d21 */
> > +				<3 RK_PA6 1 &pcfg_pull_none>,
> > +				/* vo_lcdc_d22 */
> > +				<3 RK_PA5 1 &pcfg_pull_none>,
> > +				/* vo_lcdc_d23 */
> > +				<3 RK_PA4 1 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		bt656_pins: bt656-pins {
> > +			rockchip,pins =3D
> > +				/* vo_lcdc_clk */
> > +				<3 RK_PD7 1 &pcfg_pull_none>,
> > +				/* vo_lcdc_d3 */
> > +				<3 RK_PD0 1 &pcfg_pull_none>,
> > +				/* vo_lcdc_d4 */
> > +				<3 RK_PC7 1 &pcfg_pull_none>,
> > +				/* vo_lcdc_d5 */
> > +				<3 RK_PC6 1 &pcfg_pull_none>,
> > +				/* vo_lcdc_d6 */
> > +				<3 RK_PC5 1 &pcfg_pull_none>,
> > +				/* vo_lcdc_d7 */
> > +				<3 RK_PC4 1 &pcfg_pull_none>,
> > +				/* vo_lcdc_d10 */
> > +				<3 RK_PC1 1 &pcfg_pull_none>,
> > +				/* vo_lcdc_d11 */
> > +				<3 RK_PC0 1 &pcfg_pull_none>,
> > +				/* vo_lcdc_d12 */
> > +				<3 RK_PB7 1 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		rgb3x8_pins_m0: rgb3x8-pins-m0 {
> > +			rockchip,pins =3D
> > +				/* vo_lcdc_clk */
> > +				<3 RK_PD7 1 &pcfg_pull_none>,
> > +				/* vo_lcdc_d3 */
> > +				<3 RK_PD0 1 &pcfg_pull_none>,
> > +				/* vo_lcdc_d4 */
> > +				<3 RK_PC7 1 &pcfg_pull_none>,
> > +				/* vo_lcdc_d5 */
> > +				<3 RK_PC6 1 &pcfg_pull_none>,
> > +				/* vo_lcdc_d6 */
> > +				<3 RK_PC5 1 &pcfg_pull_none>,
> > +				/* vo_lcdc_d7 */
> > +				<3 RK_PC4 1 &pcfg_pull_none>,
> > +				/* vo_lcdc_d10 */
> > +				<3 RK_PC1 1 &pcfg_pull_none>,
> > +				/* vo_lcdc_d11 */
> > +				<3 RK_PC0 1 &pcfg_pull_none>,
> > +				/* vo_lcdc_d12 */
> > +				<3 RK_PB7 1 &pcfg_pull_none>,
> > +				/* vo_lcdc_den */
> > +				<3 RK_PD4 1 &pcfg_pull_none>,
> > +				/* vo_lcdc_hsync */
> > +				<3 RK_PD5 1 &pcfg_pull_none>,
> > +				/* vo_lcdc_vsync */
> > +				<3 RK_PD6 1 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		rgb3x8_pins_m1: rgb3x8-pins-m1 {
> > +			rockchip,pins =3D
> > +				/* vo_lcdc_clk */
> > +				<3 RK_PD7 1 &pcfg_pull_none>,
> > +				/* vo_lcdc_d13 */
> > +				<3 RK_PB6 1 &pcfg_pull_none>,
> > +				/* vo_lcdc_d14 */
> > +				<3 RK_PB5 1 &pcfg_pull_none>,
> > +				/* vo_lcdc_d15 */
> > +				<3 RK_PB4 1 &pcfg_pull_none>,
> > +				/* vo_lcdc_d19 */
> > +				<3 RK_PB0 1 &pcfg_pull_none>,
> > +				/* vo_lcdc_d20 */
> > +				<3 RK_PA7 1 &pcfg_pull_none>,
> > +				/* vo_lcdc_d21 */
> > +				<3 RK_PA6 1 &pcfg_pull_none>,
> > +				/* vo_lcdc_d22 */
> > +				<3 RK_PA5 1 &pcfg_pull_none>,
> > +				/* vo_lcdc_d23 */
> > +				<3 RK_PA4 1 &pcfg_pull_none>,
> > +				/* vo_lcdc_den */
> > +				<3 RK_PD4 1 &pcfg_pull_none>,
> > +				/* vo_lcdc_hsync */
> > +				<3 RK_PD5 1 &pcfg_pull_none>,
> > +				/* vo_lcdc_vsync */
> > +				<3 RK_PD6 1 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		rgb565_pins: rgb565-pins {
> > +			rockchip,pins =3D
> > +				/* vo_lcdc_clk */
> > +				<3 RK_PD7 1 &pcfg_pull_none>,
> > +				/* vo_lcdc_d3 */
> > +				<3 RK_PD0 1 &pcfg_pull_none>,
> > +				/* vo_lcdc_d4 */
> > +				<3 RK_PC7 1 &pcfg_pull_none>,
> > +				/* vo_lcdc_d5 */
> > +				<3 RK_PC6 1 &pcfg_pull_none>,
> > +				/* vo_lcdc_d6 */
> > +				<3 RK_PC5 1 &pcfg_pull_none>,
> > +				/* vo_lcdc_d7 */
> > +				<3 RK_PC4 1 &pcfg_pull_none>,
> > +				/* vo_lcdc_d10 */
> > +				<3 RK_PC1 1 &pcfg_pull_none>,
> > +				/* vo_lcdc_d11 */
> > +				<3 RK_PC0 1 &pcfg_pull_none>,
> > +				/* vo_lcdc_d12 */
> > +				<3 RK_PB7 1 &pcfg_pull_none>,
> > +				/* vo_lcdc_d13 */
> > +				<3 RK_PB6 1 &pcfg_pull_none>,
> > +				/* vo_lcdc_d14 */
> > +				<3 RK_PB5 1 &pcfg_pull_none>,
> > +				/* vo_lcdc_d15 */
> > +				<3 RK_PB4 1 &pcfg_pull_none>,
> > +				/* vo_lcdc_d19 */
> > +				<3 RK_PB0 1 &pcfg_pull_none>,
> > +				/* vo_lcdc_d20 */
> > +				<3 RK_PA7 1 &pcfg_pull_none>,
> > +				/* vo_lcdc_d21 */
> > +				<3 RK_PA6 1 &pcfg_pull_none>,
> > +				/* vo_lcdc_d22 */
> > +				<3 RK_PA5 1 &pcfg_pull_none>,
> > +				/* vo_lcdc_d23 */
> > +				<3 RK_PA4 1 &pcfg_pull_none>,
> > +				/* vo_lcdc_den */
> > +				<3 RK_PD4 1 &pcfg_pull_none>,
> > +				/* vo_lcdc_hsync */
> > +				<3 RK_PD5 1 &pcfg_pull_none>,
> > +				/* vo_lcdc_vsync */
> > +				<3 RK_PD6 1 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		rgb666_pins: rgb666-pins {
> > +			rockchip,pins =3D
> > +				/* vo_lcdc_clk */
> > +				<3 RK_PD7 1 &pcfg_pull_none>,
> > +				/* vo_lcdc_d2 */
> > +				<3 RK_PD1 1 &pcfg_pull_none>,
> > +				/* vo_lcdc_d3 */
> > +				<3 RK_PD0 1 &pcfg_pull_none>,
> > +				/* vo_lcdc_d4 */
> > +				<3 RK_PC7 1 &pcfg_pull_none>,
> > +				/* vo_lcdc_d5 */
> > +				<3 RK_PC6 1 &pcfg_pull_none>,
> > +				/* vo_lcdc_d6 */
> > +				<3 RK_PC5 1 &pcfg_pull_none>,
> > +				/* vo_lcdc_d7 */
> > +				<3 RK_PC4 1 &pcfg_pull_none>,
> > +				/* vo_lcdc_d10 */
> > +				<3 RK_PC1 1 &pcfg_pull_none>,
> > +				/* vo_lcdc_d11 */
> > +				<3 RK_PC0 1 &pcfg_pull_none>,
> > +				/* vo_lcdc_d12 */
> > +				<3 RK_PB7 1 &pcfg_pull_none>,
> > +				/* vo_lcdc_d13 */
> > +				<3 RK_PB6 1 &pcfg_pull_none>,
> > +				/* vo_lcdc_d14 */
> > +				<3 RK_PB5 1 &pcfg_pull_none>,
> > +				/* vo_lcdc_d15 */
> > +				<3 RK_PB4 1 &pcfg_pull_none>,
> > +				/* vo_lcdc_d18 */
> > +				<3 RK_PB1 1 &pcfg_pull_none>,
> > +				/* vo_lcdc_d19 */
> > +				<3 RK_PB0 1 &pcfg_pull_none>,
> > +				/* vo_lcdc_d20 */
> > +				<3 RK_PA7 1 &pcfg_pull_none>,
> > +				/* vo_lcdc_d21 */
> > +				<3 RK_PA6 1 &pcfg_pull_none>,
> > +				/* vo_lcdc_d22 */
> > +				<3 RK_PA5 1 &pcfg_pull_none>,
> > +				/* vo_lcdc_d23 */
> > +				<3 RK_PA4 1 &pcfg_pull_none>,
> > +				/* vo_lcdc_den */
> > +				<3 RK_PD4 1 &pcfg_pull_none>,
> > +				/* vo_lcdc_hsync */
> > +				<3 RK_PD5 1 &pcfg_pull_none>,
> > +				/* vo_lcdc_vsync */
> > +				<3 RK_PD6 1 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		rgb888_pins: rgb888-pins {
> > +			rockchip,pins =3D
> > +				/* vo_lcdc_clk */
> > +				<3 RK_PD7 1 &pcfg_pull_none>,
> > +				/* vo_lcdc_d0 */
> > +				<3 RK_PD3 1 &pcfg_pull_none>,
> > +				/* vo_lcdc_d1 */
> > +				<3 RK_PD2 1 &pcfg_pull_none>,
> > +				/* vo_lcdc_d2 */
> > +				<3 RK_PD1 1 &pcfg_pull_none>,
> > +				/* vo_lcdc_d3 */
> > +				<3 RK_PD0 1 &pcfg_pull_none>,
> > +				/* vo_lcdc_d4 */
> > +				<3 RK_PC7 1 &pcfg_pull_none>,
> > +				/* vo_lcdc_d5 */
> > +				<3 RK_PC6 1 &pcfg_pull_none>,
> > +				/* vo_lcdc_d6 */
> > +				<3 RK_PC5 1 &pcfg_pull_none>,
> > +				/* vo_lcdc_d7 */
> > +				<3 RK_PC4 1 &pcfg_pull_none>,
> > +				/* vo_lcdc_d8 */
> > +				<3 RK_PC3 1 &pcfg_pull_none>,
> > +				/* vo_lcdc_d9 */
> > +				<3 RK_PC2 1 &pcfg_pull_none>,
> > +				/* vo_lcdc_d10 */
> > +				<3 RK_PC1 1 &pcfg_pull_none>,
> > +				/* vo_lcdc_d11 */
> > +				<3 RK_PC0 1 &pcfg_pull_none>,
> > +				/* vo_lcdc_d12 */
> > +				<3 RK_PB7 1 &pcfg_pull_none>,
> > +				/* vo_lcdc_d13 */
> > +				<3 RK_PB6 1 &pcfg_pull_none>,
> > +				/* vo_lcdc_d14 */
> > +				<3 RK_PB5 1 &pcfg_pull_none>,
> > +				/* vo_lcdc_d15 */
> > +				<3 RK_PB4 1 &pcfg_pull_none>,
> > +				/* vo_lcdc_d16 */
> > +				<3 RK_PB3 1 &pcfg_pull_none>,
> > +				/* vo_lcdc_d17 */
> > +				<3 RK_PB2 1 &pcfg_pull_none>,
> > +				/* vo_lcdc_d18 */
> > +				<3 RK_PB1 1 &pcfg_pull_none>,
> > +				/* vo_lcdc_d19 */
> > +				<3 RK_PB0 1 &pcfg_pull_none>,
> > +				/* vo_lcdc_d20 */
> > +				<3 RK_PA7 1 &pcfg_pull_none>,
> > +				/* vo_lcdc_d21 */
> > +				<3 RK_PA6 1 &pcfg_pull_none>,
> > +				/* vo_lcdc_d22 */
> > +				<3 RK_PA5 1 &pcfg_pull_none>,
> > +				/* vo_lcdc_d23 */
> > +				<3 RK_PA4 1 &pcfg_pull_none>,
> > +				/* vo_lcdc_den */
> > +				<3 RK_PD4 1 &pcfg_pull_none>,
> > +				/* vo_lcdc_hsync */
> > +				<3 RK_PD5 1 &pcfg_pull_none>,
> > +				/* vo_lcdc_vsync */
> > +				<3 RK_PD6 1 &pcfg_pull_none>;
> > +		};
> > +	};
> > +
> > +	vo_ebc {
> > +		/omit-if-no-ref/
> > +		vo_ebc_pins: vo_ebc-pins {
> > +			rockchip,pins =3D
> > +				/* vo_ebc_gdclk */
> > +				<3 RK_PD5 2 &pcfg_pull_none>,
> > +				/* vo_ebc_gdoe */
> > +				<3 RK_PA6 2 &pcfg_pull_none>,
> > +				/* vo_ebc_gdsp */
> > +				<3 RK_PA5 2 &pcfg_pull_none>,
> > +				/* vo_ebc_sdce0 */
> > +				<3 RK_PB3 2 &pcfg_pull_none>,
> > +				/* vo_ebc_sdclk */
> > +				<3 RK_PD6 2 &pcfg_pull_none>,
> > +				/* vo_ebc_sddo0 */
> > +				<3 RK_PD3 2 &pcfg_pull_none>,
> > +				/* vo_ebc_sddo1 */
> > +				<3 RK_PD2 2 &pcfg_pull_none>,
> > +				/* vo_ebc_sddo2 */
> > +				<3 RK_PD1 2 &pcfg_pull_none>,
> > +				/* vo_ebc_sddo3 */
> > +				<3 RK_PD0 2 &pcfg_pull_none>,
> > +				/* vo_ebc_sddo4 */
> > +				<3 RK_PC7 2 &pcfg_pull_none>,
> > +				/* vo_ebc_sddo5 */
> > +				<3 RK_PC6 2 &pcfg_pull_none>,
> > +				/* vo_ebc_sddo6 */
> > +				<3 RK_PC5 2 &pcfg_pull_none>,
> > +				/* vo_ebc_sddo7 */
> > +				<3 RK_PC4 2 &pcfg_pull_none>,
> > +				/* vo_ebc_sddo8 */
> > +				<3 RK_PC3 2 &pcfg_pull_none>,
> > +				/* vo_ebc_sddo9 */
> > +				<3 RK_PC2 2 &pcfg_pull_none>,
> > +				/* vo_ebc_sddo10 */
> > +				<3 RK_PC1 2 &pcfg_pull_none>,
> > +				/* vo_ebc_sddo11 */
> > +				<3 RK_PC0 2 &pcfg_pull_none>,
> > +				/* vo_ebc_sddo12 */
> > +				<3 RK_PB7 2 &pcfg_pull_none>,
> > +				/* vo_ebc_sddo13 */
> > +				<3 RK_PB6 2 &pcfg_pull_none>,
> > +				/* vo_ebc_sddo14 */
> > +				<3 RK_PB5 2 &pcfg_pull_none>,
> > +				/* vo_ebc_sddo15 */
> > +				<3 RK_PB4 2 &pcfg_pull_none>,
> > +				/* vo_ebc_sdle */
> > +				<3 RK_PD4 2 &pcfg_pull_none>,
> > +				/* vo_ebc_sdoe */
> > +				<3 RK_PD7 2 &pcfg_pull_none>;
> > +		};
> > +
> > +		/omit-if-no-ref/
> > +		vo_ebc_extern: vo_ebc-extern {
> > +			rockchip,pins =3D
> > +				/* vo_ebc_sdce1 */
> > +				<3 RK_PB2 2 &pcfg_pull_none>,
> > +				/* vo_ebc_sdce2 */
> > +				<3 RK_PB1 2 &pcfg_pull_none>,
> > +				/* vo_ebc_sdce3 */
> > +				<3 RK_PB0 2 &pcfg_pull_none>,
> > +				/* vo_ebc_sdshr */
> > +				<3 RK_PA4 2 &pcfg_pull_none>,
> > +				/* vo_ebc_vcom */
> > +				<3 RK_PA7 2 &pcfg_pull_none>;
> > +		};
> > +	};
> > +};
> > diff --git a/arch/arm64/boot/dts/rockchip/rk3576.dtsi
> > b/arch/arm64/boot/dts/rockchip/rk3576.dtsi new file mode 100644
> > index 0000000000000..0b1f0bfd5fb45
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/rockchip/rk3576.dtsi
> > @@ -0,0 +1,1710 @@
> > +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> > +/*
> > + * Copyright (c) 2023 Rockchip Electronics Co., Ltd.
> > + */
> > +
> > +#include <dt-bindings/clock/rockchip,rk3576-cru.h>
> > +#include <dt-bindings/interrupt-controller/arm-gic.h>
> > +#include <dt-bindings/interrupt-controller/irq.h>
> > +#include <dt-bindings/phy/phy.h>
> > +#include <dt-bindings/pinctrl/rockchip.h>
> > +#include <dt-bindings/power/rockchip,rk3576-power.h>
> > +#include <dt-bindings/reset/rockchip,rk3576-cru.h>
> > +#include <dt-bindings/soc/rockchip,boot-mode.h>
> > +
> > +/ {
> > +	compatible =3D "rockchip,rk3576";
> > +
> > +	interrupt-parent =3D <&gic>;
> > +	#address-cells =3D <2>;
> > +	#size-cells =3D <2>;
> > +
> > +	aliases {
> > +		i2c0 =3D &i2c0;
> > +		i2c1 =3D &i2c1;
> > +		i2c2 =3D &i2c2;
> > +		i2c3 =3D &i2c3;
> > +		i2c4 =3D &i2c4;
> > +		i2c5 =3D &i2c5;
> > +		i2c6 =3D &i2c6;
> > +		i2c7 =3D &i2c7;
> > +		i2c8 =3D &i2c8;
> > +		i2c9 =3D &i2c9;
> > +		serial0 =3D &uart0;
> > +		serial1 =3D &uart1;
> > +		serial2 =3D &uart2;
> > +		serial3 =3D &uart3;
> > +		serial4 =3D &uart4;
> > +		serial5 =3D &uart5;
> > +		serial6 =3D &uart6;
> > +		serial7 =3D &uart7;
> > +		serial8 =3D &uart8;
> > +		serial9 =3D &uart9;
> > +		serial10 =3D &uart10;
> > +		serial11 =3D &uart11;
> > +		spi0 =3D &spi0;
> > +		spi1 =3D &spi1;
> > +		spi2 =3D &spi2;
> > +		spi3 =3D &spi3;
> > +		spi4 =3D &spi4;
> > +	};
> > +
> > +	xin32k: clock-xin32k {
> > +		compatible =3D "fixed-clock";
> > +		clock-frequency =3D <32768>;
> > +		clock-output-names =3D "xin32k";
> > +		#clock-cells =3D <0>;
> > +	};
> > +
> > +	xin24m: clock-xin24m {
> > +		compatible =3D "fixed-clock";
> > +		#clock-cells =3D <0>;
> > +		clock-frequency =3D <24000000>;
> > +		clock-output-names =3D "xin24m";
> > +	};
> > +
> > +	spll: clock-spll {
> > +		compatible =3D "fixed-clock";
> > +		#clock-cells =3D <0>;
> > +		clock-frequency =3D <702000000>;
> > +		clock-output-names =3D "spll";
> > +	};
> > +
> > +	cpus {
> > +		#address-cells =3D <1>;
> > +		#size-cells =3D <0>;
> > +
> > +		cpu-map {
> > +			cluster0 {
> > +				core0 {
> > +					cpu =3D <&cpu_l0>;
> > +				};
> > +				core1 {
> > +					cpu =3D <&cpu_l1>;
> > +				};
> > +				core2 {
> > +					cpu =3D <&cpu_l2>;
> > +				};
> > +				core3 {
> > +					cpu =3D <&cpu_l3>;
> > +				};
> > +			};
> > +			cluster1 {
> > +				core0 {
> > +					cpu =3D <&cpu_b0>;
> > +				};
> > +				core1 {
> > +					cpu =3D <&cpu_b1>;
> > +				};
> > +				core2 {
> > +					cpu =3D <&cpu_b2>;
> > +				};
> > +				core3 {
> > +					cpu =3D <&cpu_b3>;
> > +				};
> > +			};
> > +		};
> > +
> > +		cpu_l0: cpu@0 {
> > +			device_type =3D "cpu";
> > +			compatible =3D "arm,cortex-a53";
> > +			reg =3D <0x0>;
> > +			enable-method =3D "psci";
> > +			capacity-dmips-mhz =3D <485>;
> > +			clocks =3D <&scmi_clk ARMCLK_L>;
> > +			operating-points-v2 =3D <&cluster0_opp_table>;
> > +			#cooling-cells =3D <2>;
> > +			dynamic-power-coefficient =3D <120>;
> > +			cpu-idle-states =3D <&CPU_SLEEP>;
> > +		};
> > +
> > +		cpu_l1: cpu@1 {
> > +			device_type =3D "cpu";
> > +			compatible =3D "arm,cortex-a53";
> > +			reg =3D <0x1>;
> > +			enable-method =3D "psci";
> > +			capacity-dmips-mhz =3D <485>;
> > +			clocks =3D <&scmi_clk ARMCLK_L>;
> > +			operating-points-v2 =3D <&cluster0_opp_table>;
> > +			cpu-idle-states =3D <&CPU_SLEEP>;
> > +		};
> > +
> > +		cpu_l2: cpu@2 {
> > +			device_type =3D "cpu";
> > +			compatible =3D "arm,cortex-a53";
> > +			reg =3D <0x2>;
> > +			enable-method =3D "psci";
> > +			capacity-dmips-mhz =3D <485>;
> > +			clocks =3D <&scmi_clk ARMCLK_L>;
> > +			operating-points-v2 =3D <&cluster0_opp_table>;
> > +			cpu-idle-states =3D <&CPU_SLEEP>;
> > +		};
> > +
> > +		cpu_l3: cpu@3 {
> > +			device_type =3D "cpu";
> > +			compatible =3D "arm,cortex-a53";
> > +			reg =3D <0x3>;
> > +			enable-method =3D "psci";
> > +			capacity-dmips-mhz =3D <485>;
> > +			clocks =3D <&scmi_clk ARMCLK_L>;
> > +			operating-points-v2 =3D <&cluster0_opp_table>;
> > +			cpu-idle-states =3D <&CPU_SLEEP>;
> > +		};
> > +
> > +		cpu_b0: cpu@100 {
> > +			device_type =3D "cpu";
> > +			compatible =3D "arm,cortex-a72";
> > +			reg =3D <0x100>;
> > +			enable-method =3D "psci";
> > +			capacity-dmips-mhz =3D <1024>;
> > +			clocks =3D <&scmi_clk ARMCLK_B>;
> > +			operating-points-v2 =3D <&cluster1_opp_table>;
> > +			#cooling-cells =3D <2>;
> > +			dynamic-power-coefficient =3D <320>;
> > +			cpu-idle-states =3D <&CPU_SLEEP>;
> > +		};
> > +
> > +		cpu_b1: cpu@101 {
> > +			device_type =3D "cpu";
> > +			compatible =3D "arm,cortex-a72";
> > +			reg =3D <0x101>;
> > +			enable-method =3D "psci";
> > +			capacity-dmips-mhz =3D <1024>;
> > +			clocks =3D <&scmi_clk ARMCLK_B>;
> > +			operating-points-v2 =3D <&cluster1_opp_table>;
> > +			cpu-idle-states =3D <&CPU_SLEEP>;
> > +		};
> > +
> > +		cpu_b2: cpu@102 {
> > +			device_type =3D "cpu";
> > +			compatible =3D "arm,cortex-a72";
> > +			reg =3D <0x102>;
> > +			enable-method =3D "psci";
> > +			capacity-dmips-mhz =3D <1024>;
> > +			clocks =3D <&scmi_clk ARMCLK_B>;
> > +			operating-points-v2 =3D <&cluster1_opp_table>;
> > +			cpu-idle-states =3D <&CPU_SLEEP>;
> > +		};
> > +
> > +		cpu_b3: cpu@103 {
> > +			device_type =3D "cpu";
> > +			compatible =3D "arm,cortex-a72";
> > +			reg =3D <0x103>;
> > +			enable-method =3D "psci";
> > +			capacity-dmips-mhz =3D <1024>;
> > +			clocks =3D <&scmi_clk ARMCLK_B>;
> > +			operating-points-v2 =3D <&cluster1_opp_table>;
> > +			cpu-idle-states =3D <&CPU_SLEEP>;
> > +		};
> > +
> > +		idle-states {
> > +			entry-method =3D "psci";
> > +
> > +			CPU_SLEEP: cpu-sleep {
> > +				compatible =3D "arm,idle-state";
> > +				arm,psci-suspend-param =3D <0x0010000>;
> > +				entry-latency-us =3D <120>;
> > +				exit-latency-us =3D <250>;
> > +				min-residency-us =3D <900>;
> > +				local-timer-stop;
> > +			};
> > +		};
> > +	};
> > +
> > +	cluster0_opp_table: opp-table-cluster0 {
> > +		compatible =3D "operating-points-v2";
> > +		opp-shared;
> > +
> > +		opp-408000000 {
> > +			opp-hz =3D /bits/ 64 <408000000>;
> > +			opp-microvolt =3D <700000 700000 950000>;
> > +			clock-latency-ns =3D <40000>;
> > +		};
> > +		opp-600000000 {
> > +			opp-hz =3D /bits/ 64 <600000000>;
> > +			opp-microvolt =3D <700000 700000 950000>;
> > +			clock-latency-ns =3D <40000>;
> > +		};
> > +		opp-816000000 {
> > +			opp-hz =3D /bits/ 64 <816000000>;
> > +			opp-microvolt =3D <700000 700000 950000>;
> > +			clock-latency-ns =3D <40000>;
> > +		};
> > +		opp-1008000000 {
> > +			opp-hz =3D /bits/ 64 <1008000000>;
> > +			opp-microvolt =3D <700000 700000 950000>;
> > +			clock-latency-ns =3D <40000>;
> > +		};
> > +		opp-1200000000 {
> > +			opp-hz =3D /bits/ 64 <1200000000>;
> > +			opp-microvolt =3D <700000 700000 950000>;
> > +			clock-latency-ns =3D <40000>;
> > +		};
> > +		opp-1416000000 {
> > +			opp-hz =3D /bits/ 64 <1416000000>;
> > +			opp-microvolt =3D <725000 725000 950000>;
> > +			opp-microvolt-L1 =3D <712500 712500 950000>;
> > +			opp-microvolt-L2 =3D <700000 700000 950000>;
> > +			opp-microvolt-L3 =3D <700000 700000 950000>;
> > +			opp-microvolt-L4 =3D <700000 700000 950000>;
> > +			opp-microvolt-L5 =3D <700000 700000 950000>;
> > +			clock-latency-ns =3D <40000>;
> > +		};
> > +		opp-1608000000 {
> > +			opp-hz =3D /bits/ 64 <1608000000>;
> > +			opp-microvolt =3D <750000 750000 950000>;
> > +			opp-microvolt-L1 =3D <750000 750000 950000>;
> > +			opp-microvolt-L2 =3D <737500 737500 950000>;
> > +			opp-microvolt-L3 =3D <737500 737500 950000>;
> > +			opp-microvolt-L4 =3D <725000 725000 950000>;
> > +			opp-microvolt-L5 =3D <712500 712500 950000>;
> > +			clock-latency-ns =3D <40000>;
> > +		};
> > +		opp-1800000000 {
> > +			opp-hz =3D /bits/ 64 <1800000000>;
> > +			opp-microvolt =3D <825000 825000 950000>;
> > +			opp-microvolt-L1 =3D <825000 825000 950000>;
> > +			opp-microvolt-L2 =3D <812500 812500 950000>;
> > +			opp-microvolt-L3 =3D <800000 800000 950000>;
> > +			opp-microvolt-L4 =3D <787500 787500 950000>;
> > +			opp-microvolt-L5 =3D <775000 775000 950000>;
> > +			clock-latency-ns =3D <40000>;
> > +			opp-suspend;
> > +		};
> > +		opp-2016000000 {
> > +			opp-hz =3D /bits/ 64 <2016000000>;
> > +			opp-microvolt =3D <900000 900000 950000>;
> > +			opp-microvolt-L1 =3D <887500 887500 950000>;
> > +			opp-microvolt-L2 =3D <875000 875000 950000>;
> > +			opp-microvolt-L3 =3D <862500 862500 950000>;
> > +			opp-microvolt-L4 =3D <850000 850000 950000>;
> > +			opp-microvolt-L5 =3D <837500 837500 950000>;
> > +			clock-latency-ns =3D <40000>;
> > +		};
> > +		opp-2208000000 {
> > +			opp-hz =3D /bits/ 64 <2208000000>;
> > +			opp-microvolt =3D <950000 950000 950000>;
> > +			opp-microvolt-L1 =3D <937500 937500 950000>;
> > +			opp-microvolt-L2 =3D <925000 925000 950000>;
> > +			opp-microvolt-L3 =3D <912500 912500 950000>;
> > +			opp-microvolt-L4 =3D <900000 900000 950000>;
> > +			opp-microvolt-L5 =3D <887500 887500 950000>;
> > +			clock-latency-ns =3D <40000>;
> > +		};
> > +	};
> > +
> > +	cluster1_opp_table: opp-table-cluster1 {
> > +		compatible =3D "operating-points-v2";
> > +		opp-shared;
> > +
> > +		opp-408000000 {
> > +			opp-hz =3D /bits/ 64 <408000000>;
> > +			opp-microvolt =3D <700000 700000 950000>;
> > +			clock-latency-ns =3D <40000>;
> > +			opp-suspend;
> > +		};
> > +		opp-600000000 {
> > +			opp-hz =3D /bits/ 64 <600000000>;
> > +			opp-microvolt =3D <700000 700000 950000>;
> > +			clock-latency-ns =3D <40000>;
> > +		};
> > +		opp-816000000 {
> > +			opp-hz =3D /bits/ 64 <816000000>;
> > +			opp-microvolt =3D <700000 700000 950000>;
> > +			clock-latency-ns =3D <40000>;
> > +		};
> > +		opp-1008000000 {
> > +			opp-hz =3D /bits/ 64 <1008000000>;
> > +			opp-microvolt =3D <700000 700000 950000>;
> > +			clock-latency-ns =3D <40000>;
> > +		};
> > +		opp-1200000000 {
> > +			opp-hz =3D /bits/ 64 <1200000000>;
> > +			opp-microvolt =3D <700000 700000 950000>;
> > +			clock-latency-ns =3D <40000>;
> > +		};
> > +		opp-1416000000 {
> > +			opp-hz =3D /bits/ 64 <1416000000>;
> > +			opp-microvolt =3D <712500 712500 950000>;
> > +			opp-microvolt-L1 =3D <700000 700000 950000>;
> > +			opp-microvolt-L2 =3D <700000 700000 950000>;
> > +			opp-microvolt-L3 =3D <700000 700000 950000>;
> > +			opp-microvolt-L4 =3D <700000 700000 950000>;
> > +			opp-microvolt-L5 =3D <700000 700000 950000>;
> > +			clock-latency-ns =3D <40000>;
> > +		};
> > +		opp-1608000000 {
> > +			opp-hz =3D /bits/ 64 <1608000000>;
> > +			opp-microvolt =3D <737500 737500 950000>;
> > +			opp-microvolt-L1 =3D <725000 725000 950000>;
> > +			opp-microvolt-L2 =3D <712500 712500 950000>;
> > +			opp-microvolt-L3 =3D <700000 700000 950000>;
> > +			opp-microvolt-L4 =3D <700000 700000 950000>;
> > +			opp-microvolt-L5 =3D <700000 700000 950000>;
> > +			clock-latency-ns =3D <40000>;
> > +		};
> > +		opp-1800000000 {
> > +			opp-hz =3D /bits/ 64 <1800000000>;
> > +			opp-microvolt =3D <800000 800000 950000>;
> > +			opp-microvolt-L1 =3D <787500 787500 950000>;
> > +			opp-microvolt-L2 =3D <775000 775000 950000>;
> > +			opp-microvolt-L3 =3D <762500 762500 950000>;
> > +			opp-microvolt-L4 =3D <750000 750000 950000>;
> > +			opp-microvolt-L5 =3D <737500 737500 950000>;
> > +			clock-latency-ns =3D <40000>;
> > +		};
> > +		opp-2016000000 {
> > +			opp-hz =3D /bits/ 64 <2016000000>;
> > +			opp-microvolt =3D <862500 862500 950000>;
> > +			opp-microvolt-L1 =3D <850000 850000 950000>;
> > +			opp-microvolt-L2 =3D <837500 837500 950000>;
> > +			opp-microvolt-L3 =3D <825000 825000 950000>;
> > +			opp-microvolt-L4 =3D <812500 812500 950000>;
> > +			opp-microvolt-L5 =3D <800000 800000 950000>;
> > +			clock-latency-ns =3D <40000>;
> > +		};
> > +		opp-2208000000 {
> > +			opp-hz =3D /bits/ 64 <2208000000>;
> > +			opp-microvolt =3D <925000 925000 950000>;
> > +			opp-microvolt-L1 =3D <912500 912500 950000>;
> > +			opp-microvolt-L2 =3D <900000 900000 950000>;
> > +			opp-microvolt-L3 =3D <887500 887500 950000>;
> > +			opp-microvolt-L4 =3D <875000 875000 950000>;
> > +			opp-microvolt-L5 =3D <862500 862500 950000>;
> > +			clock-latency-ns =3D <40000>;
> > +		};
> > +		opp-2304000000 {
> > +			opp-hz =3D /bits/ 64 <2304000000>;
> > +			opp-microvolt =3D <950000 950000 950000>;
> > +			opp-microvolt-L1 =3D <937500 937500 950000>;
> > +			opp-microvolt-L2 =3D <925000 925000 950000>;
> > +			opp-microvolt-L3 =3D <912500 912500 950000>;
> > +			opp-microvolt-L4 =3D <900000 900000 950000>;
> > +			opp-microvolt-L5 =3D <887500 887500 950000>;
> > +			clock-latency-ns =3D <40000>;
> > +		};
> > +	};
> > +
> > +	gpu_opp_table: opp-table-gpu {
> > +		compatible =3D "operating-points-v2";
> > +
> > +		opp-300000000 {
> > +			opp-hz =3D /bits/ 64 <300000000>;
> > +			opp-microvolt =3D <700000 700000 850000>;
> > +		};
> > +		opp-400000000 {
> > +			opp-hz =3D /bits/ 64 <400000000>;
> > +			opp-microvolt =3D <700000 700000 850000>;
> > +		};
> > +		opp-500000000 {
> > +			opp-hz =3D /bits/ 64 <500000000>;
> > +			opp-microvolt =3D <700000 700000 850000>;
> > +		};
> > +		opp-600000000 {
> > +			opp-hz =3D /bits/ 64 <600000000>;
> > +			opp-microvolt =3D <700000 700000 850000>;
> > +		};
> > +		opp-700000000 {
> > +			opp-hz =3D /bits/ 64 <700000000>;
> > +			opp-microvolt =3D <725000 725000 850000>;
> > +			opp-microvolt-L1 =3D <712500 712500 850000>;
> > +			opp-microvolt-L2 =3D <700000 700000 850000>;
> > +			opp-microvolt-L3 =3D <700000 700000 850000>;
> > +			opp-microvolt-L4 =3D <700000 700000 850000>;
> > +		};
> > +		opp-800000000 {
> > +			opp-hz =3D /bits/ 64 <800000000>;
> > +			opp-microvolt =3D <775000 775000 850000>;
> > +			opp-microvolt-L1 =3D <762500 762500 850000>;
> > +			opp-microvolt-L2 =3D <750000 750000 850000>;
> > +			opp-microvolt-L3 =3D <737500 737500 850000>;
> > +			opp-microvolt-L4 =3D <725000 725000 850000>;
> > +		};
> > +		opp-900000000 {
> > +			opp-hz =3D /bits/ 64 <900000000>;
> > +			opp-microvolt =3D <825000 825000 850000>;
> > +			opp-microvolt-L2 =3D <812500 812500 850000>;
> > +			opp-microvolt-L3 =3D <800000 800000 850000>;
> > +			opp-microvolt-L4 =3D <787500 787500 850000>;
> > +		};
> > +		opp-950000000 {
> > +			opp-hz =3D /bits/ 64 <950000000>;
> > +			opp-microvolt =3D <850000 850000 850000>;
> > +			opp-microvolt-L2 =3D <837500 837500 850000>;
> > +			opp-microvolt-L3 =3D <825000 825000 850000>;
> > +			opp-microvolt-L4 =3D <812500 812500 850000>;
> > +		};
> > +	};
> > +
> > +	firmware {
> > +		scmi: scmi {
> > +			compatible =3D "arm,scmi-smc";
> > +			arm,smc-id =3D <0x82000010>;
> > +			shmem =3D <&scmi_shmem>;
> > +			#address-cells =3D <1>;
> > +			#size-cells =3D <0>;
> > +
> > +			scmi_clk: protocol@14 {
> > +				reg =3D <0x14>;
> > +				#clock-cells =3D <1>;
> > +			};
> > +		};
> > +	};
> > +
> > +	pmu_a53: pmu-a53 {
> > +		compatible =3D "arm,cortex-a53-pmu";
> > +		interrupts =3D <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>,
> > +			     <GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH>,
> > +			     <GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH>,
> > +			     <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>;
> > +		interrupt-affinity =3D <&cpu_l0>, <&cpu_l1>, <&cpu_l2>,=20
<&cpu_l3>;
> > +	};
> > +
> > +	pmu_a72: pmu-a72 {
> > +		compatible =3D "arm,cortex-a72-pmu";
> > +		interrupts =3D <GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>,
> > +			     <GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH>,
> > +			     <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>,
> > +			     <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
> > +		interrupt-affinity =3D <&cpu_b0>, <&cpu_b1>, <&cpu_b2>,=20
<&cpu_b3>;
> > +	};
> > +
> > +	psci {
> > +		compatible =3D "arm,psci-1.0";
> > +		method =3D "smc";
> > +	};
> > +
> > +	timer {
> > +		compatible =3D "arm,armv8-timer";
> > +		interrupts =3D <GIC_PPI 13 IRQ_TYPE_LEVEL_LOW>,
> > +			     <GIC_PPI 14 IRQ_TYPE_LEVEL_LOW>,
> > +			     <GIC_PPI 11 IRQ_TYPE_LEVEL_LOW>,
> > +			     <GIC_PPI 10 IRQ_TYPE_LEVEL_LOW>;
> > +	};
> > +
> > +	soc {
> > +		compatible =3D "simple-bus";
> > +		#address-cells =3D <2>;
> > +		#size-cells =3D <2>;
> > +		ranges;
> > +
> > +		sys_grf: syscon@2600a000 {
> > +			compatible =3D "rockchip,rk3576-sys-grf", "syscon";
> > +			reg =3D <0x0 0x2600a000 0x0 0x2000>;
> > +		};
> > +
> > +		bigcore_grf: syscon@2600c000 {
> > +			compatible =3D "rockchip,rk3576-bigcore-grf",=20
"syscon";
> > +			reg =3D <0x0 0x2600c000 0x0 0x2000>;
> > +		};
> > +
> > +		litcore_grf: syscon@2600e000 {
> > +			compatible =3D "rockchip,rk3576-litcore-grf",=20
"syscon";
> > +			reg =3D <0x0 0x2600e000 0x0 0x2000>;
> > +		};
> > +
> > +		cci_grf: syscon@26010000 {
> > +			compatible =3D "rockchip,rk3576-cci-grf", "syscon";
> > +			reg =3D <0x0 0x26010000 0x0 0x2000>;
> > +		};
> > +
> > +		gpu_grf: syscon@26016000 {
> > +			compatible =3D "rockchip,rk3576-gpu-grf", "syscon";
> > +			reg =3D <0x0 0x26016000 0x0 0x2000>;
> > +		};
> > +
> > +		npu_grf: syscon@26018000 {
> > +			compatible =3D "rockchip,rk3576-npu-grf", "syscon";
> > +			reg =3D <0x0 0x26018000 0x0 0x2000>;
> > +		};
> > +
> > +		vo0_grf: syscon@2601a000 {
> > +			compatible =3D "rockchip,rk3576-vo0-grf", "syscon";
> > +			reg =3D <0x0 0x2601a000 0x0 0x2000>;
> > +		};
> > +
> > +		usb_grf: syscon@2601e000 {
> > +			compatible =3D "rockchip,rk3576-usb-grf", "syscon";
> > +			reg =3D <0x0 0x2601e000 0x0 0x1000>;
> > +		};
> > +
> > +		php_grf: syscon@26020000 {
> > +			compatible =3D "rockchip,rk3576-php-grf", "syscon";
> > +			reg =3D <0x0 0x26020000 0x0 0x2000>;
> > +		};
> > +
> > +		pmu0_grf: syscon@26024000 {
> > +			compatible =3D "rockchip,rk3576-pmu0-grf", "syscon",=20
"simple-mfd";
> > +			reg =3D <0x0 0x26024000 0x0 0x1000>;
> > +		};
> > +
> > +		pmu1_grf: syscon@26026000 {
> > +			compatible =3D "rockchip,rk3576-pmu1-grf", "syscon";
> > +			reg =3D <0x0 0x26026000 0x0 0x1000>;
> > +		};
> > +
> > +		pipe_phy0_grf: syscon@26028000 {
> > +			compatible =3D "rockchip,rk3576-pipe-phy-grf",=20
"syscon";
> > +			reg =3D <0x0 0x26028000 0x0 0x2000>;
> > +		};
> > +
> > +		pipe_phy1_grf: syscon@2602a000 {
> > +			compatible =3D "rockchip,rk3576-pipe-phy-grf",=20
"syscon";
> > +			reg =3D <0x0 0x2602a000 0x0 0x2000>;
> > +		};
> > +
> > +		usbdpphy_grf: syscon@2602c000 {
> > +			compatible =3D "rockchip,rk3576-usbdpphy-grf",=20
"syscon";
> > +			reg =3D <0x0 0x2602c000 0x0 0x2000>;
> > +		};
> > +
> > +		sdgmac_grf: syscon@26038000 {
> > +			compatible =3D "rockchip,rk3576-sdgmac-grf",=20
"syscon";
> > +			reg =3D <0x0 0x26038000 0x0 0x1000>;
> > +		};
> > +
> > +		ioc_grf: syscon@26040000 {
> > +			compatible =3D "rockchip,rk3576-ioc-grf", "syscon",=20
"simple-mfd";
> > +			reg =3D <0x0 0x26040000 0x0 0xc000>;
> > +		};
> > +
> > +		cru: clock-controller@27200000 {
> > +			compatible =3D "rockchip,rk3576-cru";
> > +			reg =3D <0x0 0x27200000 0x0 0x50000>;
> > +			#clock-cells =3D <1>;
> > +			#reset-cells =3D <1>;
> > +
> > +			assigned-clocks =3D
> > +				<&cru CLK_AUDIO_FRAC_1_SRC>,
> > +				<&cru PLL_GPLL>, <&cru PLL_CPLL>,
> > +				<&cru PLL_AUPLL>, <&cru CLK_UART_FRAC_0>,
> > +				<&cru CLK_UART_FRAC_1>, <&cru=20
CLK_UART_FRAC_2>,
> > +				<&cru CLK_AUDIO_FRAC_0>, <&cru=20
CLK_AUDIO_FRAC_1>,
> > +				<&cru CLK_CPLL_DIV2>, <&cru=20
CLK_CPLL_DIV4>,
> > +				<&cru CLK_CPLL_DIV10>, <&cru=20
=46CLK_DDR_CM0_CORE>,
> > +				<&cru ACLK_PHP_ROOT>;
> > +			assigned-clock-parents =3D <&cru PLL_AUPLL>;
> > +			assigned-clock-rates =3D
> > +				<0>,
> > +				<1188000000>, <1000000000>,
> > +				<786432000>, <18432000>,
> > +				<96000000>, <128000000>,
> > +				<45158400>, <49152000>,
> > +				<500000000>, <250000000>,
> > +				<100000000>, <500000000>,
> > +				<250000000>;
> > +		};
> > +
> > +		i2c0: i2c@27300000 {
> > +			compatible =3D "rockchip,rk3576-i2c",=20
"rockchip,rk3399-i2c";
> > +			reg =3D <0x0 0x27300000 0x0 0x1000>;
> > +			clocks =3D <&cru CLK_I2C0>, <&cru PCLK_I2C0>;
> > +			clock-names =3D "i2c", "pclk";
> > +			interrupts =3D <GIC_SPI 88 IRQ_TYPE_LEVEL_HIGH>;
> > +			pinctrl-names =3D "default";
> > +			pinctrl-0 =3D <&i2c0m0_xfer>;
> > +			#address-cells =3D <1>;
> > +			#size-cells =3D <0>;
> > +			status =3D "disabled";
> > +		};
> > +
> > +		uart1: serial@27310000 {
> > +			compatible =3D "rockchip,rk3576-uart", "snps,dw-apb-
uart";
> > +			reg =3D <0x0 0x27310000 0x0 0x100>;
> > +			reg-shift =3D <2>;
> > +			reg-io-width =3D <4>;
> > +			clocks =3D <&cru SCLK_UART1>, <&cru PCLK_UART1>;
> > +			clock-names =3D "baudclk", "apb_pclk";
> > +			dmas =3D <&dmac0 8>, <&dmac0 9>;
> > +			interrupts =3D <GIC_SPI 77 IRQ_TYPE_LEVEL_HIGH>;
> > +			pinctrl-names =3D "default";
> > +			pinctrl-0 =3D <&uart1m0_xfer>;
> > +			status =3D "disabled";
> > +		};
> > +
> > +		pmu: power-management@27380000 {
> > +			compatible =3D "rockchip,rk3576-pmu", "syscon",=20
"simple-mfd";
> > +			reg =3D <0x0 0x27380000 0x0 0x800>;
> > +
> > +			power: power-controller {
> > +				compatible =3D "rockchip,rk3576-power-
controller";
> > +				#power-domain-cells =3D <1>;
> > +				#address-cells =3D <1>;
> > +				#size-cells =3D <0>;
> > +
> > +				power-domain@RK3576_PD_NPU {
> > +					reg =3D <RK3576_PD_NPU>;
> > +					#power-domain-cells =3D <1>;
> > +					#address-cells =3D <1>;
> > +					#size-cells =3D <0>;
> > +
> > +					power-domain@RK3576_PD_NPUTOP {
> > +						reg =3D=20
<RK3576_PD_NPUTOP>;
> > +						clocks =3D <&cru=20
ACLK_RKNN0>,
> > +							 <&cru=20
ACLK_RKNN1>,
> > +							 <&cru=20
ACLK_RKNN_CBUF>,
> > +							 <&cru=20
CLK_RKNN_DSU0>,
> > +							 <&cru=20
HCLK_RKNN_CBUF>,
> > +							 <&cru=20
HCLK_RKNN_ROOT>,
> > +							 <&cru=20
HCLK_NPU_CM0_ROOT>,
> > +							 <&cru=20
PCLK_NPUTOP_ROOT>;
> > +						pm_qos =3D=20
<&qos_npu_mcu>,
> > +							=20
<&qos_npu_nsp0>,
> > +							=20
<&qos_npu_nsp1>,
> > +							=20
<&qos_npu_m0ro>,
> > +							=20
<&qos_npu_m1ro>;
> > +						#power-domain-cells =3D=20
<1>;
> > +						#address-cells =3D <1>;
> > +						#size-cells =3D <0>;
> > +
> > +						power-
domain@RK3576_PD_NPU0 {
> > +							reg =3D=20
<RK3576_PD_NPU0>;
> > +							clocks =3D <&cru=20
HCLK_RKNN_ROOT>,
> > +								=20
<&cru ACLK_RKNN0>;
> > +							pm_qos =3D=20
<&qos_npu_m0>;
> > +							#power-domain-
cells =3D <0>;
> > +						};
> > +						power-
domain@RK3576_PD_NPU1 {
> > +							reg =3D=20
<RK3576_PD_NPU1>;
> > +							clocks =3D <&cru=20
HCLK_RKNN_ROOT>,
> > +								=20
<&cru ACLK_RKNN1>;
> > +							pm_qos =3D=20
<&qos_npu_m1>;
> > +							#power-domain-
cells =3D <0>;
> > +						};
> > +					};
> > +				};
> > +
> > +				power-domain@RK3576_PD_GPU {
> > +					reg =3D <RK3576_PD_GPU>;
> > +					clocks =3D <&cru CLK_GPU>, <&cru=20
PCLK_GPU_ROOT>;
> > +					pm_qos =3D <&qos_gpu>;
> > +					#power-domain-cells =3D <0>;
> > +				};
> > +
> > +				power-domain@RK3576_PD_NVM {
> > +					reg =3D <RK3576_PD_NVM>;
> > +					clocks =3D <&cru ACLK_EMMC>, <&cru=20
HCLK_EMMC>;
> > +					pm_qos =3D <&qos_emmc>,
> > +						 <&qos_fspi0>;
> > +					#power-domain-cells =3D <1>;
> > +					#address-cells =3D <1>;
> > +					#size-cells =3D <0>;
> > +
> > +					power-domain@RK3576_PD_SDGMAC {
> > +						reg =3D=20
<RK3576_PD_SDGMAC>;
> > +						clocks =3D <&cru=20
ACLK_HSGPIO>,
> > +							 <&cru=20
ACLK_GMAC0>,
> > +							 <&cru=20
ACLK_GMAC1>,
> > +							 <&cru=20
CCLK_SRC_SDIO>,
> > +							 <&cru=20
CCLK_SRC_SDMMC0>,
> > +							 <&cru=20
HCLK_HSGPIO>,
> > +							 <&cru=20
HCLK_SDIO>,
> > +							 <&cru=20
HCLK_SDMMC0>;
>=20
> add <&cru PCLK_SDGMAC_ROOT>
>=20
> > +						pm_qos =3D <&qos_fspi1>,
> > +							 <&qos_gmac0>,
> > +							 <&qos_gmac1>,
> > +							 <&qos_sdio>,
> > +							 <&qos_sdmmc>,
> > +							=20
<&qos_flexbus>;
> > +						#power-domain-cells =3D=20
<0>;
> > +					};
> > +				};
> > +				power-domain@RK3576_PD_PHP {
> > +					reg =3D <RK3576_PD_PHP>;
> > +					clocks =3D <&cru ACLK_PHP_ROOT>,
> > +						 <&cru PCLK_PHP_ROOT>,
> > +						 <&cru ACLK_MMU0>,
> > +						 <&cru ACLK_MMU1>;
> > +					pm_qos =3D <&qos_mmu0>,
> > +						 <&qos_mmu1>;
> > +					#power-domain-cells =3D <1>;
> > +					#address-cells =3D <1>;
> > +					#size-cells =3D <0>;
> > +
> > +					power-domain@RK3576_PD_SUBPHP {
> > +						reg =3D=20
<RK3576_PD_SUBPHP>;
> > +						#power-domain-cells =3D=20
<0>;
> > +					};
> > +				};
> > +				power-domain@RK3576_PD_AUDIO {
> > +					reg =3D <RK3576_PD_AUDIO>;
> > +					#power-domain-cells =3D <0>;
> > +				};
> > +				power-domain@RK3576_PD_VEPU1 {
> > +					reg =3D <RK3576_PD_VEPU1>;
> > +					clocks =3D <&cru ACLK_VEPU1>,
> > +						 <&cru HCLK_VEPU1>;
> > +					pm_qos =3D <&qos_vepu1>;
> > +					#power-domain-cells =3D <0>;
> > +				};
> > +				power-domain@RK3576_PD_VPU {
> > +					reg =3D <RK3576_PD_VPU>;
> > +					clocks =3D <&cru ACLK_EBC>,
> > +						 <&cru HCLK_EBC>,
> > +						 <&cru ACLK_JPEG>,
> > +						 <&cru HCLK_JPEG>,
> > +						 <&cru ACLK_RGA2E_0>,
> > +						 <&cru HCLK_RGA2E_0>,
> > +						 <&cru ACLK_RGA2E_1>,
> > +						 <&cru HCLK_RGA2E_1>,
> > +						 <&cru ACLK_VDPP>,
> > +						 <&cru HCLK_VDPP>;
> > +					pm_qos =3D <&qos_ebc>,
> > +						 <&qos_jpeg>,
> > +						 <&qos_rga0>,
> > +						 <&qos_rga1>,
> > +						 <&qos_vdpp>;
> > +					#power-domain-cells =3D <0>;
> > +				};
> > +				power-domain@RK3576_PD_VDEC {
> > +					reg =3D <RK3576_PD_VDEC>;
> > +					clocks =3D <&cru=20
ACLK_RKVDEC_ROOT>,
> > +						 <&cru HCLK_RKVDEC>;
> > +					pm_qos =3D <&qos_rkvdec>;
> > +					#power-domain-cells =3D <0>;
> > +				};
> > +				power-domain@RK3576_PD_VI {
> > +					reg =3D <RK3576_PD_VI>;
> > +					clocks =3D <&cru ACLK_VICAP>,
> > +						 <&cru HCLK_VICAP>,
> > +						 <&cru DCLK_VICAP>,
> > +						 <&cru ACLK_VI_ROOT>,
> > +						 <&cru HCLK_VI_ROOT>,
> > +						 <&cru PCLK_VI_ROOT>,
> > +						 <&cru CLK_ISP_CORE>,
> > +						 <&cru ACLK_ISP>,
> > +						 <&cru HCLK_ISP>,
> > +						 <&cru CLK_CORE_VPSS>,
> > +						 <&cru ACLK_VPSS>,
> > +						 <&cru HCLK_VPSS>;
> > +					pm_qos =3D <&qos_isp_mro>,
> > +						 <&qos_isp_mwo>,
> > +						 <&qos_vicap_m0>,
> > +						 <&qos_vpss_mro>,
> > +						 <&qos_vpss_mwo>;
> > +					#power-domain-cells =3D <1>;
> > +					#address-cells =3D <1>;
> > +					#size-cells =3D <0>;
> > +
> > +					power-domain@RK3576_PD_VEPU0 {
> > +						reg =3D=20
<RK3576_PD_VEPU0>;
> > +						clocks =3D <&cru=20
ACLK_VEPU0>,
> > +							 <&cru=20
HCLK_VEPU0>;
> > +						pm_qos =3D <&qos_vepu0>;
> > +						#power-domain-cells =3D=20
<0>;
> > +					};
> > +				};
> > +				power-domain@RK3576_PD_VOP {
> > +					reg =3D <RK3576_PD_VOP>;
> > +					clocks =3D <&cru ACLK_VOP>,
> > +						 <&cru HCLK_VOP>,
> > +						 <&cru HCLK_VOP_ROOT>;
>=20
> Add <&cru PCLK_VOP_ROOT>
>=20
> > +					pm_qos =3D <&qos_vop_m0>,
> > +						 <&qos_vop_m1ro>;
> > +					#power-domain-cells =3D <1>;
> > +					#address-cells =3D <1>;
> > +					#size-cells =3D <0>;
> > +
> > +					power-domain@RK3576_PD_USB {
> > +						reg =3D <RK3576_PD_USB>;
> > +						clocks =3D <&cru=20
PCLK_PHP_ROOT>,
> > +							 <&cru=20
ACLK_USB_ROOT>,
> > +							 <&cru=20
ACLK_MMU2>,
> > +							 <&cru=20
ACLK_SLV_MMU2>,
> > +							 <&cru=20
ACLK_UFS_SYS>;
> > +						pm_qos =3D <&qos_mmu2>,
> > +							 <&qos_ufshc>;
> > +						#power-domain-cells =3D=20
<0>;
> > +					};
> > +					power-domain@RK3576_PD_VO0 {
> > +						reg =3D <RK3576_PD_VO0>;
> > +						clocks =3D <&cru=20
ACLK_HDCP0>,
> > +							 <&cru=20
HCLK_HDCP0>,
> > +							 <&cru=20
ACLK_VO0_ROOT>,
> > +							 <&cru=20
PCLK_VO0_ROOT>,
> > +							 <&cru=20
HCLK_VOP_ROOT>;
> > +						pm_qos =3D <&qos_hdcp0>;
> > +						#power-domain-cells =3D=20
<0>;
> > +					};
> > +					power-domain@RK3576_PD_VO1 {
> > +						reg =3D <RK3576_PD_VO1>;
> > +						clocks =3D <&cru=20
ACLK_HDCP1>,
> > +							 <&cru=20
HCLK_HDCP1>,
> > +							 <&cru=20
ACLK_VO1_ROOT>,
> > +							 <&cru=20
PCLK_VO1_ROOT>,
> > +							 <&cru=20
HCLK_VOP_ROOT>;
> > +						pm_qos =3D <&qos_hdcp1>;
> > +						#power-domain-cells =3D=20
<0>;
> > +					};
> > +				};
> > +			};
> > +		};
> > +
> > +		gpu: gpu@27800000 {
> > +			compatible =3D "rockchip,rk3576-mali", "arm,mali-
bifrost";
> > +			reg =3D <0x0 0x27800000 0x0 0x200000>;
> > +			assigned-clocks =3D <&scmi_clk CLK_GPU>;
> > +			assigned-clock-rates =3D <198000000>;
> > +			clocks =3D <&cru CLK_GPU>;
> > +			clock-names =3D "core";
> > +			dynamic-power-coefficient =3D <1625>;
> > +			interrupts =3D <GIC_SPI 349 IRQ_TYPE_LEVEL_HIGH>,
> > +				     <GIC_SPI 348 IRQ_TYPE_LEVEL_HIGH>,
> > +				     <GIC_SPI 347 IRQ_TYPE_LEVEL_HIGH>;
> > +			interrupt-names =3D "job", "mmu", "gpu";
> > +			operating-points-v2 =3D <&gpu_opp_table>;
> > +			power-domains =3D <&power RK3576_PD_GPU>;
> > +			#cooling-cells =3D <2>;
> > +			status =3D "disabled";
> > +		};
> > +
> > +		qos_hdcp1: qos@27f02000 {
> > +			compatible =3D "rockchip,rk3576-qos", "syscon";
> > +			reg =3D <0x0 0x27f02000 0x0 0x20>;
> > +		};
> > +
> > +		qos_fspi1: qos@27f04000 {
> > +			compatible =3D "rockchip,rk3576-qos", "syscon";
> > +			reg =3D <0x0 0x27f04000 0x0 0x20>;
> > +		};
> > +
> > +		qos_gmac0: qos@27f04080 {
> > +			compatible =3D "rockchip,rk3576-qos", "syscon";
> > +			reg =3D <0x0 0x27f04080 0x0 0x20>;
> > +		};
> > +
> > +		qos_gmac1: qos@27f04100 {
> > +			compatible =3D "rockchip,rk3576-qos", "syscon";
> > +			reg =3D <0x0 0x27f04100 0x0 0x20>;
> > +		};
> > +
> > +		qos_sdio: qos@27f04180 {
> > +			compatible =3D "rockchip,rk3576-qos", "syscon";
> > +			reg =3D <0x0 0x27f04180 0x0 0x20>;
> > +		};
> > +
> > +		qos_sdmmc: qos@27f04200 {
> > +			compatible =3D "rockchip,rk3576-qos", "syscon";
> > +			reg =3D <0x0 0x27f04200 0x0 0x20>;
> > +		};
> > +
> > +		qos_flexbus: qos@27f04280 {
> > +			compatible =3D "rockchip,rk3576-qos", "syscon";
> > +			reg =3D <0x0 0x27f04280 0x0 0x20>;
> > +		};
> > +
> > +		qos_gpu: qos@27f05000 {
> > +			compatible =3D "rockchip,rk3576-qos", "syscon";
> > +			reg =3D <0x0 0x27f05000 0x0 0x20>;
> > +		};
> > +
> > +		qos_vepu1: qos@27f06000 {
> > +			compatible =3D "rockchip,rk3576-qos", "syscon";
> > +			reg =3D <0x0 0x27f06000 0x0 0x20>;
> > +		};
> > +
> > +		qos_npu_mcu: qos@27f08000 {
> > +			compatible =3D "rockchip,rk3576-qos", "syscon";
> > +			reg =3D <0x0 0x27f08000 0x0 0x20>;
> > +		};
> > +
> > +		qos_npu_nsp0: qos@27f08080 {
> > +			compatible =3D "rockchip,rk3576-qos", "syscon";
> > +			reg =3D <0x0 0x27f08080 0x0 0x20>;
> > +		};
> > +
> > +		qos_npu_nsp1: qos@27f08100 {
> > +			compatible =3D "rockchip,rk3576-qos", "syscon";
> > +			reg =3D <0x0 0x27f08100 0x0 0x20>;
> > +		};
> > +
> > +		qos_emmc: qos@27f09000 {
> > +			compatible =3D "rockchip,rk3576-qos", "syscon";
> > +			reg =3D <0x0 0x27f09000 0x0 0x20>;
> > +		};
> > +
> > +		qos_fspi0: qos@27f09080 {
> > +			compatible =3D "rockchip,rk3576-qos", "syscon";
> > +			reg =3D <0x0 0x27f09080 0x0 0x20>;
> > +		};
> > +
> > +		qos_mmu0: qos@27f0a000 {
> > +			compatible =3D "rockchip,rk3576-qos", "syscon";
> > +			reg =3D <0x0 0x27f0a000 0x0 0x20>;
> > +		};
> > +
> > +		qos_mmu1: qos@27f0a080 {
> > +			compatible =3D "rockchip,rk3576-qos", "syscon";
> > +			reg =3D <0x0 0x27f0a080 0x0 0x20>;
> > +		};
> > +
> > +		qos_rkvdec: qos@27f0c000 {
> > +			compatible =3D "rockchip,rk3576-qos", "syscon";
> > +			reg =3D <0x0 0x27f0c000 0x0 0x20>;
> > +		};
> > +
> > +		qos_crypto: qos@27f0d000 {
> > +			compatible =3D "rockchip,rk3576-qos", "syscon";
> > +			reg =3D <0x0 0x27f0d000 0x0 0x20>;
> > +		};
> > +
> > +		qos_mmu2: qos@27f0e000 {
> > +			compatible =3D "rockchip,rk3576-qos", "syscon";
> > +			reg =3D <0x0 0x27f0e000 0x0 0x20>;
> > +		};
> > +
> > +		qos_ufshc: qos@27f0e080 {
> > +			compatible =3D "rockchip,rk3576-qos", "syscon";
> > +			reg =3D <0x0 0x27f0e080 0x0 0x20>;
> > +		};
> > +
> > +		qos_vepu0: qos@27f0f000 {
> > +			compatible =3D "rockchip,rk3576-qos", "syscon";
> > +			reg =3D <0x0 0x27f0f000 0x0 0x20>;
> > +		};
> > +
> > +		qos_isp_mro: qos@27f10000 {
> > +			compatible =3D "rockchip,rk3576-qos", "syscon";
> > +			reg =3D <0x0 0x27f10000 0x0 0x20>;
> > +		};
> > +
> > +		qos_isp_mwo: qos@27f10080 {
> > +			compatible =3D "rockchip,rk3576-qos", "syscon";
> > +			reg =3D <0x0 0x27f10080 0x0 0x20>;
> > +		};
> > +
> > +		qos_vicap_m0: qos@27f10100 {
> > +			compatible =3D "rockchip,rk3576-qos", "syscon";
> > +			reg =3D <0x0 0x27f10100 0x0 0x20>;
> > +		};
> > +
> > +		qos_vpss_mro: qos@27f10180 {
> > +			compatible =3D "rockchip,rk3576-qos", "syscon";
> > +			reg =3D <0x0 0x27f10180 0x0 0x20>;
> > +		};
> > +
> > +		qos_vpss_mwo: qos@27f10200 {
> > +			compatible =3D "rockchip,rk3576-qos", "syscon";
> > +			reg =3D <0x0 0x27f10200 0x0 0x20>;
> > +		};
> > +
> > +		qos_hdcp0: qos@27f11000 {
> > +			compatible =3D "rockchip,rk3576-qos", "syscon";
> > +			reg =3D <0x0 0x27f11000 0x0 0x20>;
> > +		};
> > +
> > +		qos_vop_m0: qos@27f12800 {
> > +			compatible =3D "rockchip,rk3576-qos", "syscon";
> > +			reg =3D <0x0 0x27f12800 0x0 0x20>;
> > +		};
> > +
> > +		qos_vop_m1ro: qos@27f12880 {
> > +			compatible =3D "rockchip,rk3576-qos", "syscon";
> > +			reg =3D <0x0 0x27f12880 0x0 0x20>;
> > +		};
> > +
> > +		qos_ebc: qos@27f13000 {
> > +			compatible =3D "rockchip,rk3576-qos", "syscon";
> > +			reg =3D <0x0 0x27f13000 0x0 0x20>;
> > +		};
> > +
> > +		qos_rga0: qos@27f13080 {
> > +			compatible =3D "rockchip,rk3576-qos", "syscon";
> > +			reg =3D <0x0 0x27f13080 0x0 0x20>;
> > +		};
> > +
> > +		qos_rga1: qos@27f13100 {
> > +			compatible =3D "rockchip,rk3576-qos", "syscon";
> > +			reg =3D <0x0 0x27f13100 0x0 0x20>;
> > +		};
> > +
> > +		qos_jpeg: qos@27f13180 {
> > +			compatible =3D "rockchip,rk3576-qos", "syscon";
> > +			reg =3D <0x0 0x27f13180 0x0 0x20>;
> > +		};
> > +
> > +		qos_vdpp: qos@27f13200 {
> > +			compatible =3D "rockchip,rk3576-qos", "syscon";
> > +			reg =3D <0x0 0x27f13200 0x0 0x20>;
> > +		};
> > +
> > +		qos_npu_m0: qos@27f20000 {
> > +			compatible =3D "rockchip,rk3576-qos", "syscon";
> > +			reg =3D <0x0 0x27f20000 0x0 0x20>;
> > +		};
> > +
> > +		qos_npu_m1: qos@27f21000 {
> > +			compatible =3D "rockchip,rk3576-qos", "syscon";
> > +			reg =3D <0x0 0x27f21000 0x0 0x20>;
> > +		};
> > +
> > +		qos_npu_m0ro: qos@27f22080 {
> > +			compatible =3D "rockchip,rk3576-qos", "syscon";
> > +			reg =3D <0x0 0x27f22080 0x0 0x20>;
> > +		};
> > +
> > +		qos_npu_m1ro: qos@27f22100 {
> > +			compatible =3D "rockchip,rk3576-qos", "syscon";
> > +			reg =3D <0x0 0x27f22100 0x0 0x20>;
> > +		};
> > +
> > +		gmac0: ethernet@2a220000 {
> > +			compatible =3D "rockchip,rk3576-gmac",=20
"snps,dwmac-4.20a";
> > +			reg =3D <0x0 0x2a220000 0x0 0x10000>;
> > +			clocks =3D <&cru CLK_GMAC0_125M_SRC>, <&cru=20
CLK_GMAC0_RMII_CRU>,
> > +				 <&cru PCLK_GMAC0>, <&cru ACLK_GMAC0>,
> > +				 <&cru CLK_GMAC0_PTP_REF>;
> > +			clock-names =3D "stmmaceth", "clk_mac_ref",
> > +				      "pclk_mac", "aclk_mac",
> > +				      "ptp_ref";
> > +			interrupts =3D <GIC_SPI 293 IRQ_TYPE_LEVEL_HIGH>,
> > +				     <GIC_SPI 298 IRQ_TYPE_LEVEL_HIGH>;
> > +			interrupt-names =3D "macirq", "eth_wake_irq";
> > +			power-domains =3D <&power RK3576_PD_SDGMAC>;
> > +			resets =3D <&cru SRST_A_GMAC0>;
> > +			reset-names =3D "stmmaceth";
> > +			rockchip,grf =3D <&sdgmac_grf>;
> > +			rockchip,php-grf =3D <&ioc_grf>;
> > +			snps,axi-config =3D <&gmac0_stmmac_axi_setup>;
> > +			snps,mixed-burst;
> > +			snps,mtl-rx-config =3D <&gmac0_mtl_rx_setup>;
> > +			snps,mtl-tx-config =3D <&gmac0_mtl_tx_setup>;
> > +			snps,tso;
> > +			status =3D "disabled";
> > +
> > +			mdio0: mdio {
> > +				compatible =3D "snps,dwmac-mdio";
> > +				#address-cells =3D <0x1>;
> > +				#size-cells =3D <0x0>;
> > +			};
> > +
> > +			gmac0_stmmac_axi_setup: stmmac-axi-config {
> > +				snps,blen =3D <0 0 0 0 16 8 4>;
> > +				snps,rd_osr_lmt =3D <8>;
> > +				snps,wr_osr_lmt =3D <4>;
> > +			};
> > +
> > +			gmac0_mtl_rx_setup: rx-queues-config {
> > +				snps,rx-queues-to-use =3D <1>;
> > +				queue0 {};
> > +			};
> > +
> > +			gmac0_mtl_tx_setup: tx-queues-config {
> > +				snps,tx-queues-to-use =3D <1>;
> > +				queue0 {};
> > +			};
> > +		};
> > +
> > +		gmac1: ethernet@2a230000 {
> > +			compatible =3D "rockchip,rk3576-gmac",=20
"snps,dwmac-4.20a";
> > +			reg =3D <0x0 0x2a230000 0x0 0x10000>;
> > +			clocks =3D <&cru CLK_GMAC1_125M_SRC>, <&cru=20
CLK_GMAC1_RMII_CRU>,
> > +				 <&cru PCLK_GMAC1>, <&cru ACLK_GMAC1>,
> > +				 <&cru CLK_GMAC1_PTP_REF>;
> > +			clock-names =3D "stmmaceth", "clk_mac_ref",
> > +				      "pclk_mac", "aclk_mac",
> > +				      "ptp_ref";
> > +			interrupts =3D <GIC_SPI 301 IRQ_TYPE_LEVEL_HIGH>,
> > +				     <GIC_SPI 306 IRQ_TYPE_LEVEL_HIGH>;
> > +			interrupt-names =3D "macirq", "eth_wake_irq";
> > +			power-domains =3D <&power RK3576_PD_SDGMAC>;
> > +			resets =3D <&cru SRST_A_GMAC1>;
> > +			reset-names =3D "stmmaceth";
> > +			rockchip,grf =3D <&sdgmac_grf>;
> > +			rockchip,php-grf =3D <&ioc_grf>;
> > +			snps,axi-config =3D <&gmac1_stmmac_axi_setup>;
> > +			snps,mixed-burst;
> > +			snps,mtl-rx-config =3D <&gmac1_mtl_rx_setup>;
> > +			snps,mtl-tx-config =3D <&gmac1_mtl_tx_setup>;
> > +			snps,tso;
> > +			status =3D "disabled";
> > +
> > +			mdio1: mdio {
> > +				compatible =3D "snps,dwmac-mdio";
> > +				#address-cells =3D <0x1>;
> > +				#size-cells =3D <0x0>;
> > +			};
> > +
> > +			gmac1_stmmac_axi_setup: stmmac-axi-config {
> > +				snps,blen =3D <0 0 0 0 16 8 4>;
> > +				snps,rd_osr_lmt =3D <8>;
> > +				snps,wr_osr_lmt =3D <4>;
> > +			};
> > +
> > +			gmac1_mtl_rx_setup: rx-queues-config {
> > +				snps,rx-queues-to-use =3D <1>;
> > +				queue0 {};
> > +			};
> > +
> > +			gmac1_mtl_tx_setup: tx-queues-config {
> > +				snps,tx-queues-to-use =3D <1>;
> > +				queue0 {};
> > +			};
> > +		};
> > +
> > +		sdmmc: mmc@2a310000 {
> > +			compatible =3D "rockchip,rk3576-dw-mshc";
> > +			reg =3D <0x0 0x2a310000 0x0 0x4000>;
> > +			clocks =3D <&cru HCLK_SDMMC0>, <&cru=20
CCLK_SRC_SDMMC0>;
> > +			clock-names =3D "biu", "ciu";
> > +			fifo-depth =3D <0x100>;
> > +			interrupts =3D <GIC_SPI 251 IRQ_TYPE_LEVEL_HIGH>;
> > +			max-frequency =3D <200000000>;
> > +			pinctrl-names =3D "default";
> > +			pinctrl-0 =3D <&sdmmc0_clk &sdmmc0_cmd &sdmmc0_det=20
&sdmmc0_bus4
> > &sdmmc0_pwren>; +			power-domains =3D <&power=20
RK3576_PD_SDGMAC>;
> > +			resets =3D <&cru SRST_H_SDMMC0>;
> > +			reset-names =3D "reset";
> > +			status =3D "disabled";
> > +		};
> > +
> > +		sdhci: mmc@2a330000 {
> > +			compatible =3D "rockchip,rk3576-dwcmshc",=20
"rockchip,rk3588-dwcmshc";
> > +			reg =3D <0x0 0x2a330000 0x0 0x10000>;
> > +			assigned-clocks =3D <&cru BCLK_EMMC>, <&cru=20
TCLK_EMMC>, <&cru
> > CCLK_SRC_EMMC>; +			assigned-clock-rates =3D=20
<200000000>, <24000000>,
> > <200000000>;
> > +			clocks =3D <&cru CCLK_SRC_EMMC>, <&cru HCLK_EMMC>,
> > +				 <&cru ACLK_EMMC>, <&cru BCLK_EMMC>,
> > +				 <&cru TCLK_EMMC>;
> > +			clock-names =3D "core", "bus", "axi", "block",=20
"timer";
> > +			interrupts =3D <GIC_SPI 253 IRQ_TYPE_LEVEL_HIGH>;
> > +			max-frequency =3D <200000000>;
> > +			pinctrl-0 =3D <&emmc_rstnout>, <&emmc_bus8>,=20
<&emmc_clk>,
> > +				    <&emmc_cmd>, <&emmc_strb>;
> > +			pinctrl-names =3D "default";
> > +			power-domains =3D <&power RK3576_PD_NVM>;
> > +			resets =3D <&cru SRST_C_EMMC>, <&cru SRST_H_EMMC>,
> > +				 <&cru SRST_A_EMMC>, <&cru SRST_B_EMMC>,
> > +				 <&cru SRST_T_EMMC>;
> > +			reset-names =3D "core", "bus", "axi", "block",=20
"timer";
> > +			supports-cqe;
> > +			status =3D "disabled";
> > +		};
> > +
> > +		gic: interrupt-controller@2a701000 {
> > +			compatible =3D "arm,gic-400";
> > +			reg =3D <0x0 0x2a701000 0 0x10000>,
> > +			      <0x0 0x2a702000 0 0x10000>,
> > +			      <0x0 0x2a704000 0 0x10000>,
> > +			      <0x0 0x2a706000 0 0x10000>;
> > +			interrupts =3D <GIC_PPI 9 (GIC_CPU_MASK_SIMPLE(8) |
> > IRQ_TYPE_LEVEL_LOW)>;
> > +			interrupt-controller;
> > +			#interrupt-cells =3D <3>;
> > +			#address-cells =3D <2>;
> > +			#size-cells =3D <2>;
> > +		};
> > +
> > +		dmac0: dma-controller@2ab90000 {
> > +			compatible =3D "arm,pl330", "arm,primecell";
> > +			reg =3D <0x0 0x2ab90000 0x0 0x4000>;
> > +			arm,pl330-periph-burst;
> > +			clocks =3D <&cru ACLK_DMAC0>;
> > +			clock-names =3D "apb_pclk";
> > +			interrupts =3D <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>,
> > +				     <GIC_SPI 33 IRQ_TYPE_LEVEL_HIGH>;
> > +			#dma-cells =3D <1>;
> > +		};
> > +
> > +		dmac1: dma-controller@2abb0000 {
> > +			compatible =3D "arm,pl330", "arm,primecell";
> > +			reg =3D <0x0 0x2abb0000 0x0 0x4000>;
> > +			arm,pl330-periph-burst;
> > +			clocks =3D <&cru ACLK_DMAC1>;
> > +			clock-names =3D "apb_pclk";
> > +			interrupts =3D <GIC_SPI 34 IRQ_TYPE_LEVEL_HIGH>,
> > +				     <GIC_SPI 35 IRQ_TYPE_LEVEL_HIGH>;
> > +			#dma-cells =3D <1>;
> > +		};
> > +
> > +		dmac2: dma-controller@2abd0000 {
> > +			compatible =3D "arm,pl330", "arm,primecell";
> > +			reg =3D <0x0 0x2abd0000 0x0 0x4000>;
> > +			arm,pl330-periph-burst;
> > +			clocks =3D <&cru ACLK_DMAC2>;
> > +			clock-names =3D "apb_pclk";
> > +			interrupts =3D <GIC_SPI 36 IRQ_TYPE_LEVEL_HIGH>,
> > +				     <GIC_SPI 37 IRQ_TYPE_LEVEL_HIGH>;
> > +			#dma-cells =3D <1>;
> > +		};
> > +
> > +		i2c1: i2c@2ac40000 {
> > +			compatible =3D "rockchip,rk3576-i2c",=20
"rockchip,rk3399-i2c";
> > +			reg =3D <0x0 0x2ac40000 0x0 0x1000>;
> > +			clocks =3D <&cru CLK_I2C1>, <&cru PCLK_I2C1>;
> > +			clock-names =3D "i2c", "pclk";
> > +			interrupts =3D <GIC_SPI 89 IRQ_TYPE_LEVEL_HIGH>;
> > +			pinctrl-names =3D "default";
> > +			pinctrl-0 =3D <&i2c1m0_xfer>;
> > +			#address-cells =3D <1>;
> > +			#size-cells =3D <0>;
> > +			status =3D "disabled";
> > +		};
> > +
> > +		i2c2: i2c@2ac50000 {
> > +			compatible =3D "rockchip,rk3576-i2c",=20
"rockchip,rk3399-i2c";
> > +			reg =3D <0x0 0x2ac50000 0x0 0x1000>;
> > +			clocks =3D <&cru CLK_I2C2>, <&cru PCLK_I2C2>;
> > +			clock-names =3D "i2c", "pclk";
> > +			interrupts =3D <GIC_SPI 90 IRQ_TYPE_LEVEL_HIGH>;
> > +			pinctrl-names =3D "default";
> > +			pinctrl-0 =3D <&i2c2m0_xfer>;
> > +			#address-cells =3D <1>;
> > +			#size-cells =3D <0>;
> > +			status =3D "disabled";
> > +		};
> > +
> > +		i2c3: i2c@2ac60000 {
> > +			compatible =3D "rockchip,rk3576-i2c",=20
"rockchip,rk3399-i2c";
> > +			reg =3D <0x0 0x2ac60000 0x0 0x1000>;
> > +			clocks =3D <&cru CLK_I2C3>, <&cru PCLK_I2C3>;
> > +			clock-names =3D "i2c", "pclk";
> > +			interrupts =3D <GIC_SPI 91 IRQ_TYPE_LEVEL_HIGH>;
> > +			pinctrl-names =3D "default";
> > +			pinctrl-0 =3D <&i2c3m0_xfer>;
> > +			#address-cells =3D <1>;
> > +			#size-cells =3D <0>;
> > +			status =3D "disabled";
> > +		};
> > +
> > +		i2c4: i2c@2ac70000 {
> > +			compatible =3D "rockchip,rk3576-i2c",=20
"rockchip,rk3399-i2c";
> > +			reg =3D <0x0 0x2ac70000 0x0 0x1000>;
> > +			clocks =3D <&cru CLK_I2C4>, <&cru PCLK_I2C4>;
> > +			clock-names =3D "i2c", "pclk";
> > +			interrupts =3D <GIC_SPI 92 IRQ_TYPE_LEVEL_HIGH>;
> > +			pinctrl-names =3D "default";
> > +			pinctrl-0 =3D <&i2c4m0_xfer>;
> > +			#address-cells =3D <1>;
> > +			#size-cells =3D <0>;
> > +			status =3D "disabled";
> > +		};
> > +
> > +		i2c5: i2c@2ac80000 {
> > +			compatible =3D "rockchip,rk3576-i2c",=20
"rockchip,rk3399-i2c";
> > +			reg =3D <0x0 0x2ac80000 0x0 0x1000>;
> > +			clocks =3D <&cru CLK_I2C5>, <&cru PCLK_I2C5>;
> > +			clock-names =3D "i2c", "pclk";
> > +			interrupts =3D <GIC_SPI 93 IRQ_TYPE_LEVEL_HIGH>;
> > +			pinctrl-names =3D "default";
> > +			pinctrl-0 =3D <&i2c5m0_xfer>;
> > +			#address-cells =3D <1>;
> > +			#size-cells =3D <0>;
> > +			status =3D "disabled";
> > +		};
> > +
> > +
> > +		i2c6: i2c@2ac90000 {
> > +			compatible =3D "rockchip,rk3576-i2c",=20
"rockchip,rk3399-i2c";
> > +			reg =3D <0x0 0x2ac90000 0x0 0x1000>;
> > +			clocks =3D <&cru CLK_I2C6>, <&cru PCLK_I2C6>;
> > +			clock-names =3D "i2c", "pclk";
> > +			interrupts =3D <GIC_SPI 94 IRQ_TYPE_LEVEL_HIGH>;
> > +			pinctrl-names =3D "default";
> > +			pinctrl-0 =3D <&i2c6m0_xfer>;
> > +			#address-cells =3D <1>;
> > +			#size-cells =3D <0>;
> > +			status =3D "disabled";
> > +		};
> > +
> > +		i2c7: i2c@2aca0000 {
> > +			compatible =3D "rockchip,rk3576-i2c",=20
"rockchip,rk3399-i2c";
> > +			reg =3D <0x0 0x2aca0000 0x0 0x1000>;
> > +			clocks =3D <&cru CLK_I2C7>, <&cru PCLK_I2C7>;
> > +			clock-names =3D "i2c", "pclk";
> > +			interrupts =3D <GIC_SPI 95 IRQ_TYPE_LEVEL_HIGH>;
> > +			pinctrl-names =3D "default";
> > +			pinctrl-0 =3D <&i2c7m0_xfer>;
> > +			#address-cells =3D <1>;
> > +			#size-cells =3D <0>;
> > +			status =3D "disabled";
> > +		};
> > +
> > +		i2c8: i2c@2acb0000 {
> > +			compatible =3D "rockchip,rk3576-i2c",=20
"rockchip,rk3399-i2c";
> > +			reg =3D <0x0 0x2acb0000 0x0 0x1000>;
> > +			clocks =3D <&cru CLK_I2C8>, <&cru PCLK_I2C8>;
> > +			clock-names =3D "i2c", "pclk";
> > +			interrupts =3D <GIC_SPI 96 IRQ_TYPE_LEVEL_HIGH>;
> > +			pinctrl-names =3D "default";
> > +			pinctrl-0 =3D <&i2c8m0_xfer>;
> > +			#address-cells =3D <1>;
> > +			#size-cells =3D <0>;
> > +			status =3D "disabled";
> > +		};
> > +
> > +		timer0: timer@2acc0000 {
> > +			compatible =3D "rockchip,rk3576-timer",=20
"rockchip,rk3288-timer";
> > +			reg =3D <0x0 0x2acc0000 0x0 0x20>;
> > +			clocks =3D <&cru PCLK_BUSTIMER0>, <&cru CLK_TIMER0>;
> > +			clock-names =3D "pclk", "timer";
> > +			interrupts =3D <GIC_SPI 45 IRQ_TYPE_LEVEL_HIGH>;
> > +		};
> > +
> > +		wdt: watchdog@2ace0000 {
> > +			compatible =3D "rockchip,rk3576-wdt", "snps,dw-wdt";
> > +			reg =3D <0x0 0x2ace0000 0x0 0x100>;
> > +			clocks =3D <&cru TCLK_WDT0>, <&cru PCLK_WDT0>;
> > +			clock-names =3D "tclk", "pclk";
> > +			interrupts =3D <GIC_SPI 40 IRQ_TYPE_LEVEL_HIGH>;
> > +			status =3D "disabled";
> > +		};
> > +
> > +		spi0: spi@2acf0000 {
> > +			compatible =3D "rockchip,rk3576-spi",=20
"rockchip,rk3066-spi";
> > +			reg =3D <0x0 0x2acf0000 0x0 0x1000>;
> > +			clocks =3D <&cru CLK_SPI0>, <&cru PCLK_SPI0>;
> > +			clock-names =3D "spiclk", "apb_pclk";
> > +			dmas =3D <&dmac0 14>, <&dmac0 15>;
> > +			dma-names =3D "tx", "rx";
> > +			interrupts =3D <GIC_SPI 116 IRQ_TYPE_LEVEL_HIGH>;
> > +			num-cs =3D <2>;
> > +			pinctrl-names =3D "default";
> > +			pinctrl-0 =3D <&spi0m0_csn0 &spi0m0_csn1=20
&spi0m0_pins>;
> > +			#address-cells =3D <1>;
> > +			#size-cells =3D <0>;
> > +			status =3D "disabled";
> > +		};
> > +
> > +		spi1: spi@2ad00000 {
> > +			compatible =3D "rockchip,rk3576-spi",=20
"rockchip,rk3066-spi";
> > +			reg =3D <0x0 0x2ad00000 0x0 0x1000>;
> > +			clocks =3D <&cru CLK_SPI1>, <&cru PCLK_SPI1>;
> > +			clock-names =3D "spiclk", "apb_pclk";
> > +			dmas =3D <&dmac0 16>, <&dmac0 17>;
> > +			dma-names =3D "tx", "rx";
> > +			interrupts =3D <GIC_SPI 117 IRQ_TYPE_LEVEL_HIGH>;
> > +			num-cs =3D <2>;
> > +			pinctrl-names =3D "default";
> > +			pinctrl-0 =3D <&spi1m0_csn0 &spi1m0_csn1=20
&spi1m0_pins>;
> > +			#address-cells =3D <1>;
> > +			#size-cells =3D <0>;
> > +			status =3D "disabled";
> > +		};
> > +
> > +		spi2: spi@2ad10000 {
> > +			compatible =3D "rockchip,rk3576-spi",=20
"rockchip,rk3066-spi";
> > +			reg =3D <0x0 0x2ad10000 0x0 0x1000>;
> > +			clocks =3D <&cru CLK_SPI2>, <&cru PCLK_SPI2>;
> > +			clock-names =3D "spiclk", "apb_pclk";
> > +			dmas =3D <&dmac1 15>, <&dmac1 16>;
> > +			dma-names =3D "tx", "rx";
> > +			interrupts =3D <GIC_SPI 118 IRQ_TYPE_LEVEL_HIGH>;
> > +			num-cs =3D <2>;
> > +			pinctrl-names =3D "default";
> > +			pinctrl-0 =3D <&spi2m0_csn0 &spi2m0_csn1=20
&spi2m0_pins>;
> > +			#address-cells =3D <1>;
> > +			#size-cells =3D <0>;
> > +			status =3D "disabled";
> > +		};
> > +
> > +		spi3: spi@2ad20000 {
> > +			compatible =3D "rockchip,rk3576-spi",=20
"rockchip,rk3066-spi";
> > +			reg =3D <0x0 0x2ad20000 0x0 0x1000>;
> > +			clocks =3D <&cru CLK_SPI3>, <&cru PCLK_SPI3>;
> > +			clock-names =3D "spiclk", "apb_pclk";
> > +			dmas =3D <&dmac1 17>, <&dmac1 18>;
> > +			dma-names =3D "tx", "rx";
> > +			interrupts =3D <GIC_SPI 119 IRQ_TYPE_LEVEL_HIGH>;
> > +			num-cs =3D <2>;
> > +			pinctrl-names =3D "default";
> > +			pinctrl-0 =3D <&spi3m0_csn0 &spi3m0_csn1=20
&spi3m0_pins>;
> > +			#address-cells =3D <1>;
> > +			#size-cells =3D <0>;
> > +			status =3D "disabled";
> > +		};
> > +
> > +		spi4: spi@2ad30000 {
> > +			compatible =3D "rockchip,rk3576-spi",=20
"rockchip,rk3066-spi";
> > +			reg =3D <0x0 0x2ad30000 0x0 0x1000>;
> > +			clocks =3D <&cru CLK_SPI4>, <&cru PCLK_SPI4>;
> > +			clock-names =3D "spiclk", "apb_pclk";
> > +			dmas =3D <&dmac2 12>, <&dmac2 13>;
> > +			dma-names =3D "tx", "rx";
> > +			interrupts =3D <GIC_SPI 120 IRQ_TYPE_LEVEL_HIGH>;
> > +			num-cs =3D <2>;
> > +			pinctrl-names =3D "default";
> > +			pinctrl-0 =3D <&spi4m0_csn0 &spi4m0_csn1=20
&spi4m0_pins>;
> > +			#address-cells =3D <1>;
> > +			#size-cells =3D <0>;
> > +			status =3D "disabled";
> > +		};
> > +
> > +		uart0: serial@2ad40000 {
> > +			compatible =3D "rockchip,rk3576-uart", "snps,dw-apb-
uart";
> > +			reg =3D <0x0 0x2ad40000 0x0 0x100>;
> > +			reg-shift =3D <2>;
> > +			reg-io-width =3D <4>;
> > +			clocks =3D <&cru SCLK_UART0>, <&cru PCLK_UART0>;
> > +			clock-names =3D "baudclk", "apb_pclk";
> > +			dmas =3D <&dmac0 6>, <&dmac0 7>;
> > +			dma-names =3D "tx", "rx";
> > +			interrupts =3D <GIC_SPI 76 IRQ_TYPE_LEVEL_HIGH>;
> > +			pinctrl-0 =3D <&uart0m0_xfer>;
> > +			pinctrl-names =3D "default";
> > +			status =3D "disabled";
> > +		};
> > +
> > +		uart2: serial@2ad50000 {
> > +			compatible =3D "rockchip,rk3576-uart", "snps,dw-apb-
uart";
> > +			reg =3D <0x0 0x2ad50000 0x0 0x100>;
> > +			reg-shift =3D <2>;
> > +			reg-io-width =3D <4>;
> > +			clocks =3D <&cru SCLK_UART2>, <&cru PCLK_UART2>;
> > +			clock-names =3D "baudclk", "apb_pclk";
> > +			dmas =3D <&dmac0 10>, <&dmac0 11>;
> > +			dma-names =3D "tx", "rx";
> > +			interrupts =3D <GIC_SPI 78 IRQ_TYPE_LEVEL_HIGH>;
> > +			pinctrl-names =3D "default";
> > +			pinctrl-0 =3D <&uart2m0_xfer>;
> > +			status =3D "disabled";
> > +		};
> > +
> > +		uart3: serial@2ad60000 {
> > +			compatible =3D "rockchip,rk3576-uart", "snps,dw-apb-
uart";
> > +			reg =3D <0x0 0x2ad60000 0x0 0x100>;
> > +			reg-shift =3D <2>;
> > +			reg-io-width =3D <4>;
> > +			clocks =3D <&cru SCLK_UART3>, <&cru PCLK_UART3>;
> > +			clock-names =3D "baudclk", "apb_pclk";
> > +			dmas =3D <&dmac0 12>, <&dmac0 13>;
> > +			dma-names =3D "tx", "rx";
> > +			interrupts =3D <GIC_SPI 79 IRQ_TYPE_LEVEL_HIGH>;
> > +			pinctrl-0 =3D <&uart3m0_xfer>;
> > +			pinctrl-names =3D "default";
> > +			status =3D "disabled";
> > +		};
> > +
> > +		uart4: serial@2ad70000 {
> > +			compatible =3D "rockchip,rk3576-uart", "snps,dw-apb-
uart";
> > +			reg =3D <0x0 0x2ad70000 0x0 0x100>;
> > +			reg-shift =3D <2>;
> > +			reg-io-width =3D <4>;
> > +			clocks =3D <&cru SCLK_UART4>, <&cru PCLK_UART4>;
> > +			clock-names =3D "baudclk", "apb_pclk";
> > +			dmas =3D <&dmac1 9>, <&dmac1 10>;
> > +			dma-names =3D "tx", "rx";
> > +			interrupts =3D <GIC_SPI 80 IRQ_TYPE_LEVEL_HIGH>;
> > +			pinctrl-0 =3D <&uart4m0_xfer>;
> > +			pinctrl-names =3D "default";
> > +			status =3D "disabled";
> > +		};
> > +
> > +		uart5: serial@2ad80000 {
> > +			compatible =3D "rockchip,rk3576-uart", "snps,dw-apb-
uart";
> > +			reg =3D <0x0 0x2ad80000 0x0 0x100>;
> > +			reg-shift =3D <2>;
> > +			reg-io-width =3D <4>;
> > +			clocks =3D <&cru SCLK_UART5>, <&cru PCLK_UART5>;
> > +			clock-names =3D "baudclk", "apb_pclk";
> > +			dmas =3D <&dmac1 11>, <&dmac1 12>;
> > +			dma-names =3D "tx", "rx";
> > +			interrupts =3D <GIC_SPI 81 IRQ_TYPE_LEVEL_HIGH>;
> > +			pinctrl-0 =3D <&uart5m0_xfer>;
> > +			pinctrl-names =3D "default";
> > +			status =3D "disabled";
> > +		};
> > +
> > +		uart6: serial@2ad90000 {
> > +			compatible =3D "rockchip,rk3576-uart", "snps,dw-apb-
uart";
> > +			reg =3D <0x0 0x2ad90000 0x0 0x100>;
> > +			reg-shift =3D <2>;
> > +			reg-io-width =3D <4>;
> > +			clocks =3D <&cru SCLK_UART6>, <&cru PCLK_UART6>;
> > +			clock-names =3D "baudclk", "apb_pclk";
> > +			dmas =3D <&dmac1 13>, <&dmac1 14>;
> > +			dma-names =3D "tx", "rx";
> > +			interrupts =3D <GIC_SPI 82 IRQ_TYPE_LEVEL_HIGH>;
> > +			pinctrl-0 =3D <&uart6m0_xfer>;
> > +			pinctrl-names =3D "default";
> > +			status =3D "disabled";
> > +		};
> > +
> > +		uart7: serial@2ada0000 {
> > +			compatible =3D "rockchip,rk3576-uart", "snps,dw-apb-
uart";
> > +			reg =3D <0x0 0x2ada0000 0x0 0x100>;
> > +			reg-shift =3D <2>;
> > +			reg-io-width =3D <4>;
> > +			clocks =3D <&cru SCLK_UART7>, <&cru PCLK_UART7>;
> > +			clock-names =3D "baudclk", "apb_pclk";
> > +			dmas =3D <&dmac2 6>, <&dmac2 7>;
> > +			dma-names =3D "tx", "rx";
> > +			interrupts =3D <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
> > +			pinctrl-0 =3D <&uart7m0_xfer>;
> > +			pinctrl-names =3D "default";
> > +			status =3D "disabled";
> > +		};
> > +
> > +		uart8: serial@2adb0000 {
> > +			compatible =3D "rockchip,rk3576-uart", "snps,dw-apb-
uart";
> > +			reg =3D <0x0 0x2adb0000 0x0 0x100>;
> > +			reg-shift =3D <2>;
> > +			reg-io-width =3D <4>;
> > +			clocks =3D <&cru SCLK_UART8>, <&cru PCLK_UART8>;
> > +			clock-names =3D "baudclk", "apb_pclk";
> > +			dmas =3D <&dmac2 8>, <&dmac2 9>;
> > +			dma-names =3D "tx", "rx";
> > +			interrupts =3D <GIC_SPI 84 IRQ_TYPE_LEVEL_HIGH>;
> > +			pinctrl-0 =3D <&uart8m0_xfer>;
> > +			pinctrl-names =3D "default";
> > +			status =3D "disabled";
> > +		};
> > +
> > +		uart9: serial@2adc0000 {
> > +			compatible =3D "rockchip,rk3576-uart", "snps,dw-apb-
uart";
> > +			reg =3D <0x0 0x2adc0000 0x0 0x100>;
> > +			reg-shift =3D <2>;
> > +			reg-io-width =3D <4>;
> > +			clocks =3D <&cru SCLK_UART9>, <&cru PCLK_UART9>;
> > +			clock-names =3D "baudclk", "apb_pclk";
> > +			dmas =3D <&dmac2 10>, <&dmac2 11>;
> > +			dma-names =3D "tx", "rx";
> > +			interrupts =3D <GIC_SPI 85 IRQ_TYPE_LEVEL_HIGH>;
> > +			pinctrl-0 =3D <&uart9m0_xfer>;
> > +			pinctrl-names =3D "default";
> > +			status =3D "disabled";
> > +		};
> > +
> > +		saradc: adc@2ae00000 {
> > +			compatible =3D "rockchip,rk3576-saradc",=20
"rockchip,rk3588-saradc";
> > +			reg =3D <0x0 0x2ae00000 0x0 0x10000>;
> > +			clocks =3D <&cru CLK_SARADC>, <&cru PCLK_SARADC>;
> > +			clock-names =3D "saradc", "apb_pclk";
> > +			interrupts =3D <GIC_SPI 124 IRQ_TYPE_LEVEL_HIGH>;
> > +			resets =3D <&cru SRST_P_SARADC>;
> > +			reset-names =3D "saradc-apb";
> > +			#io-channel-cells =3D <1>;
> > +			status =3D "disabled";
> > +		};
> > +
> > +		i2c9: i2c@2ae80000 {
> > +			compatible =3D "rockchip,rk3576-i2c",=20
"rockchip,rk3399-i2c";
> > +			reg =3D <0x0 0x2ae80000 0x0 0x1000>;
> > +			clocks =3D <&cru CLK_I2C9>, <&cru PCLK_I2C9>;
> > +			clock-names =3D "i2c", "pclk";
> > +			interrupts =3D <GIC_SPI 97 IRQ_TYPE_LEVEL_HIGH>;
> > +			pinctrl-names =3D "default";
> > +			pinctrl-0 =3D <&i2c9m0_xfer>;
> > +			resets =3D <&cru SRST_I2C9>, <&cru SRST_P_I2C9>;
> > +			reset-names =3D "i2c", "apb";
> > +			#address-cells =3D <1>;
> > +			#size-cells =3D <0>;
> > +			status =3D "disabled";
> > +		};
> > +
> > +		uart10: serial@2afc0000 {
> > +			compatible =3D "rockchip,rk3576-uart", "snps,dw-apb-
uart";
> > +			reg =3D <0x0 0x2afc0000 0x0 0x100>;
> > +			reg-shift =3D <2>;
> > +			reg-io-width =3D <4>;
> > +			clocks =3D <&cru SCLK_UART10>, <&cru PCLK_UART10>;
> > +			clock-names =3D "baudclk", "apb_pclk";
> > +			dmas =3D <&dmac2 21>, <&dmac2 22>;
> > +			interrupts =3D <GIC_SPI 86 IRQ_TYPE_LEVEL_HIGH>;
> > +			pinctrl-names =3D "default";
> > +			pinctrl-0 =3D <&uart10m0_xfer>;
> > +			status =3D "disabled";
> > +		};
> > +
> > +		uart11: serial@2afd0000 {
> > +			compatible =3D "rockchip,rk3576-uart", "snps,dw-apb-
uart";
> > +			reg =3D <0x0 0x2afd0000 0x0 0x100>;
> > +			reg-shift =3D <2>;
> > +			reg-io-width =3D <4>;
> > +			clocks =3D <&cru SCLK_UART11>, <&cru PCLK_UART11>;
> > +			clock-names =3D "baudclk", "apb_pclk";
> > +			dmas =3D <&dmac2 23>, <&dmac2 24>;
> > +			interrupts =3D <GIC_SPI 87 IRQ_TYPE_LEVEL_HIGH>;
> > +			pinctrl-names =3D "default";
> > +			pinctrl-0 =3D <&uart11m0_xfer>;
> > +			status =3D "disabled";
> > +		};
> > +
> > +		sram: sram@3ff88000 {
> > +			compatible =3D "mmio-sram";
> > +			reg =3D <0x0 0x3ff88000 0x0 0x78000>;
> > +			ranges =3D <0x0 0x0 0x3ff88000 0x78000>;
> > +			#address-cells =3D <1>;
> > +			#size-cells =3D <1>;
> > +
> > +			/* start address and size should be 4k align */
> > +			rkvdec_sram: rkvdec-sram@0 {
> > +				reg =3D <0x0 0x78000>;
> > +			};
> > +		};
> > +
> > +		scmi_shmem: scmi-shmem@4010f000 {
> > +			compatible =3D "arm,scmi-shmem";
> > +			reg =3D <0x0 0x4010f000 0x0 0x100>;
> > +		};
> > +
> > +		pinctrl: pinctrl {
> > +			compatible =3D "rockchip,rk3576-pinctrl";
> > +			rockchip,grf =3D <&ioc_grf>;
> > +			#address-cells =3D <2>;
> > +			#size-cells =3D <2>;
> > +			ranges;
> > +
> > +			gpio0: gpio@27320000 {
> > +				compatible =3D "rockchip,gpio-bank";
> > +				reg =3D <0x0 0x27320000 0x0 0x200>;
> > +				clocks =3D <&cru PCLK_GPIO0>, <&cru=20
DBCLK_GPIO0>;
> > +				gpio-controller;
> > +				gpio-ranges =3D <&pinctrl 0 0 32>;
> > +				interrupts =3D <GIC_SPI 153=20
IRQ_TYPE_LEVEL_HIGH>;
> > +				interrupt-controller;
> > +				#gpio-cells =3D <2>;
> > +				#interrupt-cells =3D <2>;
> > +			};
> > +
> > +			gpio1: gpio@2ae10000 {
> > +				compatible =3D "rockchip,gpio-bank";
> > +				reg =3D <0x0 0x2ae10000 0x0 0x200>;
> > +				clocks =3D <&cru PCLK_GPIO1>, <&cru=20
DBCLK_GPIO1>;
> > +				gpio-controller;
> > +				gpio-ranges =3D <&pinctrl 0 32 32>;
> > +				interrupts =3D <GIC_SPI 157=20
IRQ_TYPE_LEVEL_HIGH>;
> > +				interrupt-controller;
> > +				#gpio-cells =3D <2>;
> > +				#interrupt-cells =3D <2>;
> > +			};
> > +
> > +			gpio2: gpio@2ae20000 {
> > +				compatible =3D "rockchip,gpio-bank";
> > +				reg =3D <0x0 0x2ae20000 0x0 0x200>;
> > +				clocks =3D <&cru PCLK_GPIO2>, <&cru=20
DBCLK_GPIO2>;
> > +				gpio-controller;
> > +				gpio-ranges =3D <&pinctrl 0 64 32>;
> > +				interrupts =3D <GIC_SPI 161=20
IRQ_TYPE_LEVEL_HIGH>;
> > +				interrupt-controller;
> > +				#gpio-cells =3D <2>;
> > +				#interrupt-cells =3D <2>;
> > +			};
> > +
> > +			gpio3: gpio@2ae30000 {
> > +				compatible =3D "rockchip,gpio-bank";
> > +				reg =3D <0x0 0x2ae30000 0x0 0x200>;
> > +				clocks =3D <&cru PCLK_GPIO3>, <&cru=20
DBCLK_GPIO3>;
> > +				gpio-controller;
> > +				gpio-ranges =3D <&pinctrl 0 96 32>;
> > +				interrupts =3D <GIC_SPI 165=20
IRQ_TYPE_LEVEL_HIGH>;
> > +				interrupt-controller;
> > +				#gpio-cells =3D <2>;
> > +				#interrupt-cells =3D <2>;
> > +			};
> > +
> > +			gpio4: gpio@2ae40000 {
> > +				compatible =3D "rockchip,gpio-bank";
> > +				reg =3D <0x0 0x2ae40000 0x0 0x200>;
> > +				clocks =3D <&cru PCLK_GPIO4>, <&cru=20
DBCLK_GPIO4>;
> > +				gpio-controller;
> > +				gpio-ranges =3D <&pinctrl 0 128 32>;
> > +				interrupts =3D <GIC_SPI 169=20
IRQ_TYPE_LEVEL_HIGH>;
> > +				interrupt-controller;
> > +				#gpio-cells =3D <2>;
> > +				#interrupt-cells =3D <2>;
> > +			};
> > +		};
> > +	};
> > +};
> > +
> > +#include "rk3576-pinctrl.dtsi"




