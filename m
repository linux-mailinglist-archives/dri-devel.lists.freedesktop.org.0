Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 310669F88EC
	for <lists+dri-devel@lfdr.de>; Fri, 20 Dec 2024 01:20:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88D9E10E4D1;
	Fri, 20 Dec 2024 00:20:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="qtNQrWPz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4325710E4D1
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Dec 2024 00:20:20 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-5401d3ea5a1so1299533e87.3
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Dec 2024 16:20:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734654018; x=1735258818; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=aGfaJoG1T2GqAeho5K1MGIVQ1DuQHl43bpzlBdelgis=;
 b=qtNQrWPz4O/0+wFMYVAyA/T+p4tCHMPaNnhUa+BXBWJ3mKNG2xTP6gR4Zb7os5EhM2
 Euybr2np1s7UVdMZTwB1ijfQJjViIOD5STRy23uc0x6c/mEjr7gaGVl/NdBSYe3Z07P6
 VL/ljrgKN7hDGls9PfgJe2DoYCvX5miqGJxZtuwAFh9jO0bNHOpnoGqLPGVZ6HX/ABCM
 iCvpYoJqktWCMoAPOXB7Jknt2beiEp5QIxsy4a4H3ooj7zuMBm/VWrSA3Ivg4s6z0XAP
 XHD1ueEScx2jLXgB/bOTEAPfZdnWWizd/TjSAOgMAPjf9xlEO3qN/0iwzbWLsalyiAPy
 IbKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734654018; x=1735258818;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aGfaJoG1T2GqAeho5K1MGIVQ1DuQHl43bpzlBdelgis=;
 b=pikLkfB+fBSu17uEjCZkUUwYbIi3/8aNhaXje67MbLfpeC2u6KL04i/ubyZpChm+cK
 uTI6x04CVTipov2SCrnyJ/W3Y4M4LMSr+6ufx7Ag5GMXxeTSDH+kEYWj8LKEsVsUimbu
 IaOloTtqMLFYih6mTIYOs9JIkjgua5IApLAsAnu+26jLkXycMKCLpX3kZMyYsLWIr5cu
 oTBlKm03g6LuvHzh8rDdrHK5kbOVvTOPLlaSDk2Q4b3gL47jwolg4bABM/VQsEG/Zxw5
 +JAbzM6lFQk3Dc6zL37iwxAKWV9wZefwvqR1QeeSLhILGwqatbon9obpiNV8hpK4MqAB
 zQbg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUlRRUEVMUd1gfHGJLHpJu5oNT/Df1IwN3LndO6gbiI2jqj8lFPWfwucuLju6vqCFYd/ZgwA+6C7j0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzdIpOpRTXFfdfhDDy5KTxLrRCU+5u2oQ+cMrbFfxhE6bT9/syD
 NYGz8QtFsyJ+dhN7NPq2ARc0F0sFqH21h5QXtrzRVNUeWBBKAus/YZCXb6zE4Ig=
X-Gm-Gg: ASbGncvAXp/TF6ti+nFwpGzOTTPrAxS2+AYeZVUV8hKuFblVORKGC+1RsvoMu/cVrB4
 /HT9DgjaOPhRTLyFdRjtGPSOtAa38yAWFDrMYP3jt73XiBBBeiwG4mdsof89OrnDrnNB8A0rJ9V
 aNJ82G5VF392frS/GUG5D0uslz0uzuAhVGQFwPT/BC4aJjPHgDyHQfNe2uAVyao00fFyREDqGwf
 X0nAAh/sWSg8rJWPvNpAV8GFbNqZCKDgtgWEYGj81B7wQlSoistNd9nhni6SE0d6Zwus7awroOP
 KSWcSu43LOiGKrrniXoTFAXnqSlDa1QGl2VY
X-Google-Smtp-Source: AGHT+IFre8iAJ8qmAC/GMNvKWBPlrLOwqvhJV/vx+wZq/0GVkU2u75qwt0RAs2Qd9uPRT+dmO47+yQ==
X-Received: by 2002:a05:6512:114a:b0:540:1d0a:5812 with SMTP id
 2adb3069b0e04-54229533ad6mr159865e87.23.1734654018559; 
 Thu, 19 Dec 2024 16:20:18 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-542238136a8sm317995e87.163.2024.12.19.16.20.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Dec 2024 16:20:18 -0800 (PST)
Date: Fri, 20 Dec 2024 02:20:15 +0200
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
Subject: Re: [PATCH v3 14/15] arm64: dts: rockchip: Enable eDP0 display on
 RK3588S EVB1 board
Message-ID: <cg7bnhol4gvzji7agxazas7nkxy7zammzy67rjvhp35yqyraju@73daepsbmuae>
References: <20241219080604.1423600-1-damon.ding@rock-chips.com>
 <20241219080604.1423600-15-damon.ding@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241219080604.1423600-15-damon.ding@rock-chips.com>
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

On Thu, Dec 19, 2024 at 04:06:03PM +0800, Damon Ding wrote:
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
> 
> Changes in v3:
> - Use aux-bus instead of platform bus for edp-panel.
> ---
>  .../boot/dts/rockchip/rk3588s-evb1-v10.dts    | 52 +++++++++++++++++++
>  1 file changed, 52 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-evb1-v10.dts b/arch/arm64/boot/dts/rockchip/rk3588s-evb1-v10.dts
> index bc4077575beb..9547ab18e596 100644
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
> @@ -238,6 +239,41 @@ &combphy2_psu {
>  	status = "okay";
>  };
>  
> +&edp0 {
> +	force-hpd;
> +	status = "okay";
> +
> +	aux-bus {
> +		panel {
> +			compatible = "lg,lp079qx1-sp0v";

Why do you need the particular compat string here? Can you use the
generic "edp-panel" instead? What if the user swaps the panel?

> +			backlight = <&backlight>;
> +			power-supply = <&vcc3v3_lcd_edp>;
> +
> +			port {
> +				panel_in_edp: endpoint {
> +					remote-endpoint = <&edp_out_panel>;
> +				};
> +			};
> +		};
> +	};
> +};
> +
> +&edp0_in {
> +	edp0_in_vp2: endpoint {
> +		remote-endpoint = <&vp2_out_edp0>;
> +	};
> +};
> +
> +&edp0_out {
> +	edp_out_panel: endpoint {
> +		remote-endpoint = <&panel_in_edp>;
> +	};
> +};
> +
> +&hdptxphy0 {
> +	status = "okay";
> +};
> +
>  &i2c3 {
>  	status = "okay";
>  
> @@ -399,6 +435,7 @@ usbc0_int: usbc0-int {
>  };
>  
>  &pwm12 {
> +	pinctrl-0 = <&pwm12m1_pins>;
>  	status = "okay";
>  };
>  
> @@ -1168,3 +1205,18 @@ usbdp_phy0_dp_altmode_mux: endpoint@1 {
>  		};
>  	};
>  };
> +
> +&vop_mmu {
> +	status = "okay";
> +};
> +
> +&vop {
> +	status = "okay";
> +};
> +
> +&vp2 {
> +	vp2_out_edp0: endpoint@ROCKCHIP_VOP2_EP_EDP0 {
> +		reg = <ROCKCHIP_VOP2_EP_EDP0>;
> +		remote-endpoint = <&edp0_in_vp2>;
> +	};
> +};
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
