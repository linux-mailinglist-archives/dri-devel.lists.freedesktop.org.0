Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5242F907FF2
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2024 01:56:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1539B10E19E;
	Thu, 13 Jun 2024 23:55:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="NAxLkYNi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com
 [209.85.167.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A09310EBE0
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2024 23:55:52 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id
 2adb3069b0e04-52c7f7fdd24so2173889e87.1
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2024 16:55:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1718322950; x=1718927750; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=l4hbm8OoTLo4l2aiuFtHBEILqr9ou2NQIRsDH6v++2M=;
 b=NAxLkYNirvI/FSdf7mrwkq/Qp3BAwbYlDo3j4MNF6bRzOg5/6iCWdfAhdVgHk90Pyd
 DkrCibwGXqJWc6l9GkQsQ5jONh2XNBppxL7tiw+Gyt5v7mqK2kzAJKcUHtllE4GfV4yd
 eptDXHEwbCT5cMVhTOJXych78BFUPo51DpC5v7vqcGPuaVRAI2MXFxCyG4FFW3Fq/bAI
 AfY6gS04ZE9VE44gj1qnUUptl42aJZ1YhgeIu0oI+GpNIRLZXwUNWS4i4yBDy66d0LZ/
 T8dh988/OT/0fMhzeRGZNc7F7PLfL1p/ik+f7ZjlLVjeqrQ4rNVQiX29Q8yx+RFQ4MZx
 nLpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718322950; x=1718927750;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=l4hbm8OoTLo4l2aiuFtHBEILqr9ou2NQIRsDH6v++2M=;
 b=Py5bDYXFDzrkGW9DMcDDNERzZs6hEgrKCoXJx/MukOw1+DfaO1HBC9ExUEfIyc7rDl
 znKKm0039Rmyx+ZNsmne8KKkbIh5G75QT4UBzbzjV8lp7W7+Xrq+IM4PAZL9FlMCic15
 iBIcl85uyky80Q3DNjeqF+0nxBYtXqLte+T5tLRcvrbGUtRYDgKlh71XKAw6s1wQICrW
 FaEkh04Sir5NVYXJFy1aIFbGjhgoSJYXciha8R75/Ls75BJBTx5TRIAfq4a7JJvg70ns
 MRI1anJSYjxFdZlw8+FxkZethPFTIF7EvrKkf3pgv6oe2eAoMit1VZPRJsHQucRiPojg
 7ANQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUKSFIdLPHsSWnS8YLNnvNu1ZepNr3nGfJ2fUprU9tn9WpCRJ9HbSrqPsUlVJAUKTZrpOvNQDMHVct5i+9JlvFi8ZjX4atdfTl2ck/KFiWu
X-Gm-Message-State: AOJu0YzdxDrlIpB2qZgZricVVX8bZ5IrTs3LaO4XOAy9opklb64KbU2t
 qAQV1toPpLMfBUsE1H7gvbd4Oej1VTX5xC0XjE4vu+/FG2P54NMv23ui7xbsNAo=
X-Google-Smtp-Source: AGHT+IHCIqESmXtjRH3QmZKEoSYUbL+jyllLs3Umw8Kq2gKsHG0tbHwmo7UfWfTrve9WZBJNRWwgxQ==
X-Received: by 2002:ac2:555e:0:b0:52c:9a1f:52e7 with SMTP id
 2adb3069b0e04-52ca6e988a6mr682371e87.58.1718322950103; 
 Thu, 13 Jun 2024 16:55:50 -0700 (PDT)
Received: from ?IPV6:2a00:f41:900a:a4b1:fbed:73e4:f21c:5826?
 ([2a00:f41:900a:a4b1:fbed:73e4:f21c:5826])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52ca287aae2sm364886e87.219.2024.06.13.16.55.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Jun 2024 16:55:49 -0700 (PDT)
Message-ID: <348e16f1-0a1b-4cad-a3f0-3f7979a99a02@linaro.org>
Date: Fri, 14 Jun 2024 01:55:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/4] arm64: dts: qcom: add HDMI nodes for msm8998
To: Marc Gonzalez <mgonzalez@freebox.fr>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, Arnaud Vrac <avrac@freebox.fr>,
 Pierre-Hugues Husson <phhusson@freebox.fr>
References: <20240613-hdmi-tx-v4-0-4af17e468699@freebox.fr>
 <20240613-hdmi-tx-v4-4-4af17e468699@freebox.fr>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240613-hdmi-tx-v4-4-4af17e468699@freebox.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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



On 6/13/24 17:15, Marc Gonzalez wrote:
> From: Arnaud Vrac <avrac@freebox.fr>
> 
> Port device nodes from vendor code.
> 
> Signed-off-by: Arnaud Vrac <avrac@freebox.fr>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Marc Gonzalez <mgonzalez@freebox.fr>
> ---

[...]

> +
> +			hdmi: hdmi-tx@c9a0000 {
> +				compatible = "qcom,hdmi-tx-8998";
> +				reg =	<0x0c9a0000 0x50c>,
> +					<0x00780000 0x6220>,
> +					<0x0c9e0000 0x2c>;
> +				reg-names = "core_physical",
> +					    "qfprom_physical",
> +					    "hdcp_physical";

The way qfprom is accessed (bypassing nvmem APIs) will need to be reworked..
but since we already have it like that on 8996, I'm fine with batch-reworking
these some time in the future..

> +
> +				interrupt-parent = <&mdss>;
> +				interrupts = <8>;
> +
> +				clocks = <&mmcc MDSS_MDP_CLK>,

Not sure if the MDP core clock is necessary here. Pretty sure it only
powers the display-controller@.. peripheral

> +					 <&mmcc MDSS_AHB_CLK>,
> +					 <&mmcc MDSS_HDMI_CLK>,
> +					 <&mmcc MDSS_HDMI_DP_AHB_CLK>,
> +					 <&mmcc MDSS_EXTPCLK_CLK>,
> +					 <&mmcc MDSS_AXI_CLK>,
> +					 <&mmcc MNOC_AHB_CLK>,

This one is an interconnect clock, drop it

> +					 <&mmcc MISC_AHB_CLK>;

And please confirm whether this one is necessary

> +				clock-names =
> +					"mdp_core",
> +					"iface",
> +					"core",
> +					"alt_iface",
> +					"extp",
> +					"bus",
> +					"mnoc",
> +					"iface_mmss";
> +
> +				phys = <&hdmi_phy>;
> +				#sound-dai-cells = <1>;
> +
> +				pinctrl-names = "default", "sleep";
> +				pinctrl-0 = <&hdmi_hpd_default
> +					     &hdmi_ddc_default
> +					     &hdmi_cec_default>;
> +				pinctrl-1 = <&hdmi_hpd_sleep
> +					     &hdmi_ddc_default
> +					     &hdmi_cec_default>;

property
property-names

please

and use <&foo>, <&bar>; for phandle arrays instead of <&foo bar>
(this is a really old dt and we still haven't got around to cleaning
up old junk for style issues..)

> +
> +				status = "disabled";
> +
> +				ports {
> +					#address-cells = <1>;
> +					#size-cells = <0>;
> +
> +					port@0 {
> +						reg = <0>;
> +						hdmi_in: endpoint {
> +							remote-endpoint = <&dpu_intf3_out>;
> +						};
> +					};
> +
> +					port@1 {
> +						reg = <1>;
> +						hdmi_out: endpoint {
> +						};
> +					};
> +				};
> +			};
> +
> +			hdmi_phy: hdmi-phy@c9a0600 {
> +				compatible = "qcom,hdmi-phy-8998";
> +				reg = <0x0c9a0600 0x18b>,
> +				      <0x0c9a0a00 0x38>,
> +				      <0x0c9a0c00 0x38>,
> +				      <0x0c9a0e00 0x38>,
> +				      <0x0c9a1000 0x38>,
> +				      <0x0c9a1200 0x0e8>;
> +				reg-names = "hdmi_pll",
> +					    "hdmi_tx_l0",
> +					    "hdmi_tx_l1",
> +					    "hdmi_tx_l2",
> +					    "hdmi_tx_l3",
> +					    "hdmi_phy";
> +
> +				#clock-cells = <0>;
> +				#phy-cells = <0>;
> +
> +				clocks = <&mmcc MDSS_AHB_CLK>,
> +					 <&gcc GCC_HDMI_CLKREF_CLK>,
> +					 <&rpmcc RPM_SMD_XO_CLK_SRC>;
> +				clock-names = "iface",
> +					      "ref",
> +					      "xo";

GCC_HDMI_CLKREF_CLK is a child of xo, so you can drop the latter.
It would also be worth confirming whether it's really powering the
PHY and not the TX.. You can test that by trying to only power on the
phy (e.g. call the phy_power_on or whatever APIs) with and without the
clock

Konrad
