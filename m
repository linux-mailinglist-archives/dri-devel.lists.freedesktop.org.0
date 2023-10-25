Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 27A637D755F
	for <lists+dri-devel@lfdr.de>; Wed, 25 Oct 2023 22:20:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4425E10E703;
	Wed, 25 Oct 2023 20:19:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 371 seconds by postgrey-1.36 at gabe;
 Wed, 25 Oct 2023 13:44:46 UTC
Received: from smtp-relay-internal-1.canonical.com
 (smtp-relay-internal-1.canonical.com [185.125.188.123])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44C1210E65D
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Oct 2023 13:44:46 +0000 (UTC)
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 2B204420AE
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Oct 2023 13:38:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1698241112;
 bh=4kZetE1rdZ7P5Qi3G+jzZsycI0EzhJ2peFQaOTjHG8s=;
 h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
 To:Cc:Content-Type;
 b=btTvxLFJF9XtZLAklIhtj6Tqgqqc2hgVd/BlsjRIDMj8hfDSqY6+BhhlEM6I3KyeX
 YBxVHqPDDbH3WlzoPn2phaPF8Xe1PMKhfZZhom72+z7xDK6T6glo5aDnerPX/yrgzt
 r67JrKdJDjywfKtKKs5oYHR3xk56sps4yPdxQR7parjvTZVdYpW4YsqIlt19a3iP1J
 4RHwEPg6Jjg5jeK1yQdcoxnBGR9F69Nio6CUuCnzUzzliplqD1sV81pOP3dv52n+lJ
 h03SWWeAMdNis1zJZiRWpmW+bHfRixZPFxG/E9DG5+1BBKPq/XX2cE41qA59YE7E4j
 IRsa4kZwTvH1w==
Received: by mail-pl1-f198.google.com with SMTP id
 d9443c01a7336-1c9cce40f7eso48915775ad.3
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Oct 2023 06:38:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698241111; x=1698845911;
 h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4kZetE1rdZ7P5Qi3G+jzZsycI0EzhJ2peFQaOTjHG8s=;
 b=pamvN5A8j7CGCtozZiOgIEeeZXg0xdQByclwNuyIKf9lL74oM0SDCca+iYIC58u2EC
 YmMhJ0tGZXdtUr93XeUKYjsbkP2vmSeqiAkLmQPg9lGfiKlIVp4DIgSZyj+Ssf74hMbB
 nEGmkYuQcPCdloYB88EefGn6Emuckkw7OP1tuFM8xJ9hOKpJIGTo16+BBU4LNEObGI2K
 kur8MsJgWtOtXCNtknd43SBEiWXdOE28UftJJqCXF8dAjYwCmlowlOZH/1ZFdLUaci/E
 T62wO8UloQ4Bgh8i3+BGAyCC1yZpnxFLIbANQk0ZjllFidhDijri0YZbz4IKIOTkZKAn
 VmWg==
X-Gm-Message-State: AOJu0Yznx6jZWvglU41jyurTddfs9Jkup7ICFFOvSFS0Gge6Mch9Vqep
 fVOLSv/Cy+BrIUL3BdxiKwRQogRmO5Ema3sV/vGOEJpn9oxl5jENG/ivdsAw9iJ9NIQQs5g9r6u
 NRnan/E5qriaodcEWB6aMJSUufinMACfSVJM04dc8KOKxPqsvVvuHektc3UKu2Q==
X-Received: by 2002:a05:622a:1b9f:b0:417:bd2c:2683 with SMTP id
 bp31-20020a05622a1b9f00b00417bd2c2683mr16970911qtb.19.1698241090311; 
 Wed, 25 Oct 2023 06:38:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE9sqk9O9NSffONLMLkF62MheH44KULbbJziO/VE+15eqK7tXOWni0WrQFzdn8ozLKmF0Jvc5dWLHw93tWI6nk=
X-Received: by 2002:a05:622a:1b9f:b0:417:bd2c:2683 with SMTP id
 bp31-20020a05622a1b9f00b00417bd2c2683mr16970883qtb.19.1698241090030; Wed, 25
 Oct 2023 06:38:10 -0700 (PDT)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 25 Oct 2023 06:38:09 -0700
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <20231025103957.3776-3-keith.zhao@starfivetech.com>
References: <20231025103957.3776-1-keith.zhao@starfivetech.com>
 <20231025103957.3776-3-keith.zhao@starfivetech.com>
Mime-Version: 1.0
Date: Wed, 25 Oct 2023 06:38:09 -0700
Message-ID: <CAJM55Z_Y_qp0J5FmWDPdziCRY7duNBhHnvM0Zza2pG-vK0etbw@mail.gmail.com>
Subject: Re: [PATCH v2 2/6] riscv: dts: starfive: jh7110: add dc controller
 and hdmi node
To: Keith Zhao <keith.zhao@starfivetech.com>, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, linux-media@vger.kernel.org, 
 linaro-mm-sig@lists.linaro.org
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Wed, 25 Oct 2023 20:19:56 +0000
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
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Sumit Semwal <sumit.semwal@linaro.org>, Emil Renner Berthing <kernel@esmil.dk>,
 Shengyang Chen <shengyang.chen@starfivetech.com>,
 Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <mripard@kernel.org>,
 Jagan Teki <jagan@edgeble.ai>, Rob Herring <robh+dt@kernel.org>,
 Chris Morgan <macromorgan@hotmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Changhuang Liang <changhuang.liang@starfivetech.com>,
 Jack Zhu <jack.zhu@starfivetech.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Shawn Guo <shawnguo@kernel.org>, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Keith Zhao wrote:
> Add the dc controller and hdmi node for the Starfive JH7110 SoC.
>
> Signed-off-by: Keith Zhao <keith.zhao@starfivetech.com>
> ---
>  .../jh7110-starfive-visionfive-2.dtsi         | 91 +++++++++++++++++++
>  arch/riscv/boot/dts/starfive/jh7110.dtsi      | 41 +++++++++
>  2 files changed, 132 insertions(+)
>
> diff --git a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
> index de0f40a8b..97909b6d2 100644
> --- a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
> +++ b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
> @@ -31,6 +31,25 @@ memory@40000000 {
>  		reg = <0x0 0x40000000 0x1 0x0>;
>  	};
>
> +	reserved-memory {
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +		ranges;
> +
> +		/* vout applies for space from this CMA
> +		 * Without this CMA reservation,
> +		 * vout may not work properly.
> +		 */
> +		linux,cma {
> +			compatible = "shared-dma-pool";
> +			reusable;
> +			size = <0x0 0x20000000>;
> +			alignment = <0x0 0x1000>;
> +			alloc-ranges = <0x0 0x70000000 0x0 0x20000000>;
> +			linux,cma-default;
> +		};
> +	};
> +
>  	gpio-restart {
>  		compatible = "gpio-restart";
>  		gpios = <&sysgpio 35 GPIO_ACTIVE_HIGH>;
> @@ -231,6 +250,41 @@ GPOEN_DISABLE,
>  			slew-rate = <0>;
>  		};
>  	};
> +
> +	hdmi_pins: hdmi-0 {
> +		hdmi-scl-pins {
> +			pinmux = <GPIOMUX(0, GPOUT_SYS_HDMI_DDC_SCL,
> +					     GPOEN_SYS_HDMI_DDC_SCL,
> +					     GPI_SYS_HDMI_DDC_SCL)>;
> +			input-enable;
> +			bias-pull-up;
> +		};
> +
> +		hdmi-sda-pins {
> +			pinmux = <GPIOMUX(1, GPOUT_SYS_HDMI_DDC_SDA,
> +					     GPOEN_SYS_HDMI_DDC_SDA,
> +					     GPI_SYS_HDMI_DDC_SDA)>;
> +			input-enable;
> +			bias-pull-up;
> +		};
> +
> +		hdmi-cec-pins {
> +			pinmux = <GPIOMUX(14, GPOUT_SYS_HDMI_CEC_SDA,
> +					     GPOEN_SYS_HDMI_CEC_SDA,
> +					     GPI_SYS_HDMI_CEC_SDA)>;
> +			input-enable;
> +			bias-pull-up;
> +		};
> +
> +		hdmi-hpd-pins {
> +			pinmux = <GPIOMUX(15, GPOUT_HIGH,
> +					     GPOEN_ENABLE,
> +					     GPI_SYS_HDMI_HPD)>;
> +			input-enable;
> +			bias-disable; /* external pull-up */
> +		};
> +	};
> +

Please don't break the alphabetical ordering of these nodes.

>  };
>
>  &uart0 {
> @@ -254,3 +308,40 @@ &U74_3 {
>  &U74_4 {
>  	cpu-supply = <&vdd_cpu>;
>  };
> +
> +&voutcrg {
> +	status = "okay";
> +};
> +
> +&display {
> +	status = "okay";
> +};
> +
> +&hdmi {
> +	status = "okay";
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&hdmi_pins>;
> +
> +	hdmi_in: port {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		hdmi_in_dc: endpoint@0 {
> +			reg = <0>;
> +			remote-endpoint = <&dc_out_hdmi>;
> +		};
> +	};
> +};
> +
> +&dc8200 {
> +	status = "okay";
> +
> +	dc_out: port {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		dc_out_hdmi: endpoint@0 {
> +			reg = <0>;
> +			remote-endpoint = <&hdmi_in_dc>;
> +		};
> +
> +	};
> +};

Some goes for these node references. The order is /-node, clocks, node refences
sorted alphabetically.


> diff --git a/arch/riscv/boot/dts/starfive/jh7110.dtsi b/arch/riscv/boot/dts/starfive/jh7110.dtsi
> index 0005fa163..1670452fb 100644
> --- a/arch/riscv/boot/dts/starfive/jh7110.dtsi
> +++ b/arch/riscv/boot/dts/starfive/jh7110.dtsi
> @@ -282,6 +282,11 @@ tdm_ext: tdm-ext-clock {
>  		#clock-cells = <0>;
>  	};
>
> +	display: display-subsystem {
> +		compatible = "starfive,display-subsystem";
> +		ports = <&dc_out>;
> +	};
> +
>  	soc {
>  		compatible = "simple-bus";
>  		interrupt-parent = <&plic>;
> @@ -613,5 +618,41 @@ voutcrg: clock-controller@295c0000 {
>  			#reset-cells = <1>;
>  			power-domains = <&pwrc JH7110_PD_VOUT>;
>  		};
> +
> +		dc8200: lcd-controller@29400000 {
> +			compatible = "starfive,jh7110-dc8200";
> +			reg = <0x0 0x29400000 0x0 0x100>,
> +			      <0x0 0x29400800 0x0 0x2000>;
> +			interrupts = <95>;
> +			clocks = <&syscrg JH7110_SYSCLK_NOC_BUS_DISP_AXI>,
> +				<&voutcrg JH7110_VOUTCLK_DC8200_PIX0>,
> +				<&voutcrg JH7110_VOUTCLK_DC8200_PIX1>,
> +				<&voutcrg JH7110_VOUTCLK_DC8200_CORE>,
> +				<&voutcrg JH7110_VOUTCLK_DC8200_AXI>,
> +				<&voutcrg JH7110_VOUTCLK_DC8200_AHB>,
> +				<&hdmitx0_pixelclk>,
> +				<&voutcrg JH7110_VOUTCLK_DC8200_PIX>;
> +			clock-names = "noc_bus", "channel0", "channel1",
> +				      "dc_core", "axi_core", "ahb",
> +				      "hdmi_tx", "dc_parent";
> +			resets = <&voutcrg JH7110_VOUTRST_DC8200_AXI>,
> +				 <&voutcrg JH7110_VOUTRST_DC8200_AHB>,
> +				 <&voutcrg JH7110_VOUTRST_DC8200_CORE>;
> +			reset-names = "axi","ahb", "core";
> +		};
> +
> +		hdmi: hdmi@29590000 {
> +			compatible = "starfive,jh7110-inno-hdmi";
> +			reg = <0x0 0x29590000 0x0 0x4000>;
> +			interrupts = <99>;
> +
> +			clocks = <&voutcrg JH7110_VOUTCLK_HDMI_TX_SYS>,
> +				 <&voutcrg JH7110_VOUTCLK_HDMI_TX_MCLK>,
> +				 <&voutcrg JH7110_VOUTCLK_HDMI_TX_BCLK>,
> +				 <&hdmitx0_pixelclk>;
> +			clock-names = "sysclk", "mclk", "bclk", "pclk";
> +			resets = <&voutcrg JH7110_VOUTRST_HDMI_TX_HDMI>;
> +			#sound-dai-cells = <0>;
> +		};

These nodes, however, are sorted by their address which you alse break in this
patch :(

>  	};
>  };
> --
> 2.34.1
>
