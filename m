Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EF49D2B044
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jan 2026 04:53:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8718E10E7D8;
	Fri, 16 Jan 2026 03:53:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="WpYdvNdZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com
 [209.85.216.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41DE210E7D8
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jan 2026 03:53:49 +0000 (UTC)
Received: by mail-pj1-f41.google.com with SMTP id
 98e67ed59e1d1-34c9edf63a7so1210909a91.1
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 19:53:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768535629; x=1769140429; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=DgeXhAk6KNlbJlhP3Z45ZVXFzRmMcBeJhfIQXTAsmxw=;
 b=WpYdvNdZ2clIwh8YrqO1cSWlVvQihoq4hKVpfmO79Udb626e8RDHlBVymyhNo8Ec4s
 iiqtynrLm/rkqL1evgaOMFOtMfSrqXsn2MtK1M0hlTdaDaTi5Nn9DXQhHHmGQDqJ+qhi
 RATRvX3K1j0tphXgmBStr0By9yAA8mVIqeLgxQ/spppRJDIKjC/68w04MNCqc8FRYXSn
 7I75+VaRGuQzuF2KbfwytQqn2yDrFqVWNRuUk2sUnc/AfUn6dI3jZZU6Bcg4ngYopp72
 UcvgG/BaFUALk1XZ1o4J9fv73cO6+YKTeYEijcRRKYgaJRYNr+cxVuj9JGY3R4YsrVHE
 mdjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768535629; x=1769140429;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=DgeXhAk6KNlbJlhP3Z45ZVXFzRmMcBeJhfIQXTAsmxw=;
 b=AA/dErNa2FcTD7nCcWjt+RR6vch7GWeJpARX56LjnDpA/XzxKvQkpG4qdwAhDnbdDO
 Sh5cfKf3JUGpraq+y+gGgdrSy8pQVcU/dX7XnV2UXgx2BxSkr/rlRcGuUKWIGF8T2uKZ
 gJI7z47h+iSRyzcjn6KEVwHKaATLfP4lgkfqjwk2xIrjyUPvD/Ycx7se2ulNvdx4UjLI
 2DvqpzUTVCUbYd3OOzsRyG7WgMoff1uBstNv9+BjI6l0QtSK0hh1VIkjDDGO/f81V9F0
 9YEkp5H2dY4a98xAqn1rKZjpeDOhCR+JTQXbgWOZzPbyx4V0U0E9zoNq9My36vhe5vI0
 p83Q==
X-Gm-Message-State: AOJu0YxbPkB2Cw6t2pJbEl/7ame4c11c7EyRSj/JDJ+9ghebmU1e75uG
 S0/G3JdfaRnFdVOP7enWI+928UEQY9FonfzxcuFwU+qBX8HEWcuxHYez
X-Gm-Gg: AY/fxX5EsbBgo8OBOyfx4IVoK2591MPQunDhTMJxOfLBFs/5+QR7FNtMoeKpHiDlG0Z
 E/z5f7T21U4N/YhlaveGhiOmFu4JVp8v/zTkhEuDhlDh5SRoub+6CVnL/SUpTBCfygjPnc9dA+Z
 O28qYTv4wZlRFscfthdITuYI582nAnG2wSrOI2TUp/bkJ+okBvJCnyTNMGXZTTiegalfgfdd6o1
 xq6d7mLUK6YpUVj0jkzetYet9N2dNHICWLdqgaP6Bd9VBAXddV9c7kjBgT07WL+TqQ/0nveubJ8
 ldf/gKDJutfNZ5nLyY1qrStYswKT3dnD0H/CY7n0dMMPdnQFP0+ILgWhq5Ql5NcR6aqYw5ynkLA
 O6X3N770hnb9+lVu+Nji3Lebn+9XeqicE8YbnHpNvw8tZnRpR+iFkoMby5mSf8g4E3bjBlcMtaR
 9eJuigak2uEVbuFg/bws9RGwQJktHWtMSayD5sQbDZJSuPWk8oOylthzh3OLMo8YCDEjXFlY7Xs
 YdC7GdrUQGXqEkPVylZ44iMiOwkEBhUjkMbiTusgB8KPX343KnJnSSvHAnu8eMmAF0bF8s=
X-Received: by 2002:a17:90b:4ec3:b0:335:2eef:4ca8 with SMTP id
 98e67ed59e1d1-35273296f05mr1371287a91.33.1768535628572; 
 Thu, 15 Jan 2026 19:53:48 -0800 (PST)
Received: from [192.168.1.110] ([125.253.50.76])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3527305490fsm751473a91.1.2026.01.15.19.53.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Jan 2026 19:53:48 -0800 (PST)
Message-ID: <121ede67-dbfc-4b79-8076-04693e9d3d53@gmail.com>
Date: Fri, 16 Jan 2026 03:53:40 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: broadcom: bcm2712: Add V3D device node
To: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Stefan Wahren <wahrenst@gmx.net>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 kernel-dev@igalia.com
References: <20260114120610.82531-1-mcanal@igalia.com>
Content-Language: en-US
From: Peter Robinson <pbrobinson@gmail.com>
In-Reply-To: <20260114120610.82531-1-mcanal@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

Hi Maira,

On 14/01/2026 12:04, Maíra Canal wrote:
> Commits 0ad5bc1ce463 ("drm/v3d: fix up register addresses for V3D 7.x")
> and 6fd9487147c4 ("drm/v3d: add brcm,2712-v3d as a compatible V3D device")
> added driver support for V3D on BCM2712, but the corresponding device
> tree node is still missing.
>
> Add the V3D device tree node to the BCM2712 DTS.
>
> Signed-off-by: Maíra Canal <mcanal@igalia.com>
>
> ---
> v1 -> v2:
>
> - Rebased on top of linux-next (Stefan Wahren)
> - Fixed node's address (2000000 -> 1002000000) (Stefan Wahren)
> - Link to v1: https://lore.kernel.org/linux-devicetree/20260113192902.48046-2-mcanal@igalia.com/
> ---
>   .../boot/dts/broadcom/bcm2712-rpi-5-b-base.dtsi    |  4 ++++
>   arch/arm64/boot/dts/broadcom/bcm2712.dtsi          | 14 ++++++++++++++
>   2 files changed, 18 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-base.dtsi b/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-base.dtsi
> index 7d4742ebe247..97522c6803c5 100644
> --- a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-base.dtsi
> +++ b/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-base.dtsi
> @@ -247,3 +247,7 @@ &pcie1 {
>   &pcie2 {
>   	status = "okay";
>   };
> +
> +&v3d {
> +	clocks = <&firmware_clocks 5>;

Looking at the upstream DT [1] I think this also needs a clock-names entry.

[1] 
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-base.dtsi#n233

> +};
> diff --git a/arch/arm64/boot/dts/broadcom/bcm2712.dtsi b/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
> index 330a121ebfcb..661668ef7419 100644
> --- a/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
> +++ b/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
> @@ -1,5 +1,6 @@
>   // SPDX-License-Identifier: (GPL-2.0 OR MIT)
>   #include <dt-bindings/interrupt-controller/arm-gic.h>
> +#include <dt-bindings/soc/bcm2835-pm.h>
>   
>   / {
>   	compatible = "brcm,bcm2712";
> @@ -642,6 +643,19 @@ mip1: msi-controller@1000131000 {
>   			msi-ranges = <&gicv2 GIC_SPI 247 IRQ_TYPE_EDGE_RISING 8>;
>   			brcm,msi-offset = <8>;
>   		};
> +
> +		v3d: gpu@1002000000 {
> +			compatible = "brcm,2712-v3d";
> +			reg = <0x10 0x02000000 0x00 0x4000>,
> +			      <0x10 0x02008000 0x00 0x6000>,
> +			      <0x10 0x02030800 0x00 0x0700>;
> +			reg-names = "hub", "core0", "sms";
> +
> +			power-domains = <&pm BCM2835_POWER_DOMAIN_GRAFX_V3D>;
> +			resets = <&pm BCM2835_RESET_V3D>;
> +			interrupts = <GIC_SPI 250 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 249 IRQ_TYPE_LEVEL_HIGH>;
> +		};
>   	};
>   
>   	vc4: gpu {
