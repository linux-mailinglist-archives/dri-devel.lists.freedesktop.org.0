Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 868579F2C91
	for <lists+dri-devel@lfdr.de>; Mon, 16 Dec 2024 10:06:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6793910E154;
	Mon, 16 Dec 2024 09:06:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="xYtEFEgd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86DCD10E549
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2024 09:06:08 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-53e399e3310so4646570e87.1
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2024 01:06:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734339967; x=1734944767; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=ybFr+xBF+04SsTx9tZHOi4dPPshGyMog5vNkLi99Q50=;
 b=xYtEFEgd8qWF4K0SYYjEfoYXzvOJ05x0u5tqgaxcHYqxj31x+g4CykAK75UW74APW+
 dd5g3IweEF+Np093JzOm6VXKtzEefX5moVo2J9LmstlpdaTYrRvqspIxTQl9lSpJfe6v
 yeZqL6ZJXHoDA+nl5fzTGSkjaESmtuZKE9JyF6jgWO6Jl2qmhlAaiGBjxdZokEd+nfyy
 pPOCDn7UM2ygdkoDcYV5QRko0WzvgEVQC7lW7NFnbgaVQ4qDUjvudeM9X1VpDm/RDFgn
 cvqx3/yrF+rmLEV8WcrV+L9KWjS7RhFecejpejgrNvWauynQQQhbc1493jVdmx1ULmzw
 kHKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734339967; x=1734944767;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ybFr+xBF+04SsTx9tZHOi4dPPshGyMog5vNkLi99Q50=;
 b=dkoJvIJkS25tjzDcLUis2rgsV+h72+YSkr3327XEQc7yhDIQ9UzRu0xGNVyUfRGdu6
 G9CjSMl4NLU+fIONEz21zQLNds/OMyJBJ5gBAmualhzam/DduRQhCphizbuZ6qDvUP2G
 3bujoWssAkFVw2W8xa0gKFjwwLhj29GJaR3PoL2EBXjpRXXisOuPIsa+wjREtpbGppcF
 LbLxpxn6/O0J5zJtcnDur/ENG7WVg8tXqto8rMF4WBam34yJ/7Yk/N4trBYo9fGE/MA8
 uekF19cC6KjqY4CRTzJIJTZCZCmVbze24R35Z7lv2a1fj74vA8Awdcm+kgk2atxYTteo
 crEQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU3BT/VjYQz7A78KUDL3mlpJg368XScu7nlkHn/7cLVKChmhD3wh0kadbQoJ1+fhFxpuXcvUwDGj8M=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyPdCYUNIeSVFSBQf8Lx8BP9KXU8GI12niLkwBM9diLTrbcAdSd
 +O2Ax8t7xaTT3SXwNdUj5H1IqOQ/QELCRKE0lcHjE/qNKJR3xTD++EJUXkZx6iQ=
X-Gm-Gg: ASbGncubDwI/AKE96UJeP9kmglNlMeiFx8C59Tcy5XaWHiAGB7thXte7wC195c0D5lS
 e8vmIX0aizjXY5uxXfIqtQnw86A997/BSjeS7wY9YpyCJEYHoPZAORWbsUiji4qph2dQyoFO904
 PvwV7RUGpFzNf3NzPc9RMKVlXtXoAMfQfEnSgnk8iNTAfb+kkBwmsdXGgLFOn0sBCkyAEAE5S1N
 IyZPR+38lYy7fOCPiHGal37gtNsmI4OsNuFj78OoJCiA7ctKY8kejSIIJ1XJJuGZS7HdVRd3ZOU
 60nCEOXECW3c6F0pPRIDZU+7pZSsF4RD/UxH
X-Google-Smtp-Source: AGHT+IE2z+Yrxqh/d+CbdTI/ZEFbpY0tdfpWkjP3iId/t6e4EaPLDgQ5n81rb49OUv0YGO/PEvgPOg==
X-Received: by 2002:a05:6512:b96:b0:540:2a6e:3882 with SMTP id
 2adb3069b0e04-540905616b3mr3205171e87.29.1734339966797; 
 Mon, 16 Dec 2024 01:06:06 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54120c00166sm768988e87.159.2024.12.16.01.06.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Dec 2024 01:06:05 -0800 (PST)
Date: Mon, 16 Dec 2024 11:06:03 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Damon Ding <damon.ding@rock-chips.com>
Cc: heiko@sntech.de, robh@kernel.org, krzk+dt@kernel.org, 
 conor+dt@kernel.org, rfoss@kernel.org, vkoul@kernel.org, 
 sebastian.reichel@collabora.com, cristian.ciocaltea@collabora.com,
 l.stach@pengutronix.de, 
 andy.yan@rock-chips.com, hjc@rock-chips.com, algea.cao@rock-chips.com, 
 kever.yang@rock-chips.com, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org
Subject: Re: [PATCH v2 10/11] arm64: dts: rockchip: Enable eDP0 display on
 RK3588S EVB1 board
Message-ID: <ay2im4itrj3k4p2ksobgsk77b7m4laaxctkfcpffqxj5ttxenm@mzdizmf3mlcb>
References: <20241216031225.3746-1-damon.ding@rock-chips.com>
 <20241216031225.3746-11-damon.ding@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241216031225.3746-11-damon.ding@rock-chips.com>
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

On Mon, Dec 16, 2024 at 11:12:24AM +0800, Damon Ding wrote:
> Add the necessary DT changes to enable eDP0 on RK3588S EVB1 board:
> - Add edp-panel node
> - Set pinctrl of pwm12 for backlight
> - Enable edp0/hdptxphy0/vp2
> 
> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
> 
> ---
> 
> Changes in v2:
> - Remove brightness-levels and default-brightness-level properties in
>   backlight node.
> - Add the detail DT changes to commit message.
> ---
>  .../boot/dts/rockchip/rk3588s-evb1-v10.dts    | 50 +++++++++++++++++++
>  1 file changed, 50 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-evb1-v10.dts b/arch/arm64/boot/dts/rockchip/rk3588s-evb1-v10.dts
> index bc4077575beb..5c1ea25b6524 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3588s-evb1-v10.dts
> +++ b/arch/arm64/boot/dts/rockchip/rk3588s-evb1-v10.dts
> @@ -9,6 +9,7 @@
>  #include <dt-bindings/gpio/gpio.h>
>  #include <dt-bindings/input/input.h>
>  #include <dt-bindings/pinctrl/rockchip.h>
> +#include <dt-bindings/soc/rockchip,vop2.h>
>  #include <dt-bindings/usb/pd.h>
>  #include "rk3588s.dtsi"
>  
> @@ -120,6 +121,18 @@ backlight: backlight {
>  		pwms = <&pwm12 0 25000 0>;
>  	};
>  
> +	edp_panel: edp-panel {
> +		compatible = "lg,lp079qx1-sp0v";

Please use aux-bus and a generic "edp-panel" entry for newer platforms
instead of declaring the panel on the platform bus. Placing eDP panels
on the platform bus has been deprecated for quite a while.

> +		backlight = <&backlight>;
> +		power-supply = <&vcc3v3_lcd_edp>;
> +
> +		port {
> +			panel_in_edp: endpoint {
> +				remote-endpoint = <&edp_out_panel>;
> +			};
> +		};
> +	};
> +
>  	combophy_avdd0v85: regulator-combophy-avdd0v85 {
>  		compatible = "regulator-fixed";
>  		regulator-name = "combophy_avdd0v85";

-- 
With best wishes
Dmitry
