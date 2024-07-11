Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64CDF92E2C1
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jul 2024 10:52:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9ACEC10E99E;
	Thu, 11 Jul 2024 08:52:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="WwROPlC5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com
 [209.85.208.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77ED410E99E
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jul 2024 08:52:52 +0000 (UTC)
Received: by mail-lj1-f176.google.com with SMTP id
 38308e7fff4ca-2ee910d6aaeso6331771fa.1
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jul 2024 01:52:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1720687970; x=1721292770; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=kHwdkGnmoSLKM2hxNJvFbgQPNEfR5gLkDeEBWIa6jwY=;
 b=WwROPlC5Bnp+xpSBcOk2V/5n9uM5ROzuhESieBFetpQtV7ATADDT3WBKRjURx1wxk7
 cR6YqvW1wjMJZjAvWSnqMy9bBjhybWBBmdBg5xoEtm0wniRMoU35FYjeIbyzFNVKCe2R
 07PPE2n2aoHZAmtO+CyLl8M1vsRXKXXpJph2fsppeQMDEM4AT/gbzu1Ow6HHWQTe2kvq
 09R1SsUWyo2Q0WQ4iJxqp7T/SOfBKstdchS+FM6i+q2Io+4MgYGmsnl0liPMQNpAvxAq
 H0XLvi9aOOppQqMzhbrCvhMiZAAqn94ufT/By9Pqw/BsuX9ohPicxHvB29InXmbsV8/D
 pnJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720687970; x=1721292770;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kHwdkGnmoSLKM2hxNJvFbgQPNEfR5gLkDeEBWIa6jwY=;
 b=KMYkLdI24QtI468w+17gs2rhmo2NrL3Fi0FCjxT2OmSIgzADi6P8ncjf2ZrrGKqMO3
 I5sBV586bUAtuQ6sFOIO0EGJ3SL3N770r3bfXGpNI+oSAIcGOgLAAYIfsuPiIg4JZycg
 +N6/MgxM2mAgdRhct1ZVg3Y2tBwUOZ3GcDw0WaJmZSGkG43G3b4GOxdg/o/XYLyHvFfU
 7q3ETS2O+cn2oQlN0mIs9UE5rV/gWDItA//aJIrP7VoBqkHbb3KpFh7vo5tVT0Cst0lu
 7+r3oQVhwBE5N6uQQi+ig1CQIZB/taboDTM7RnxPtsIrZ4bExsU55RfbEGbdX8a67g53
 8Mjw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVinvtAZ4iIL9lOhSuBEAh9C3T5BjD9ft+l2S+2ucuYR3l2ThkHjkEzdcz+32VuXcN0a1c6IShaqNC970/e88HlJhShUYXGrrfUgS+vMPrc
X-Gm-Message-State: AOJu0YwfntWQ1uQdts37n+wRdJaN0yPK+0CaUtL8t7ASAvi7CC2/T/O2
 /No+q7ty7brI6JexdzAsXVQ/B+sVqlvkP+5KQzJxqp2L1fKDRSl47WNBlsNCk3A=
X-Google-Smtp-Source: AGHT+IHf9VA36pmAnVlhE9yS1zdg4WgxvTnaeXHCQiQAocTKqb/oAIUth3RBZilvGx0iR6/2N3hrlQ==
X-Received: by 2002:a2e:9845:0:b0:2ee:7740:aa74 with SMTP id
 38308e7fff4ca-2eeb30bbf36mr45663571fa.3.1720687970121; 
 Thu, 11 Jul 2024 01:52:50 -0700 (PDT)
Received: from [192.168.105.194] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-594bda308d7sm3168392a12.91.2024.07.11.01.52.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Jul 2024 01:52:49 -0700 (PDT)
Message-ID: <b0386995-88be-436a-9398-ddb45d58fd5a@linaro.org>
Date: Thu, 11 Jul 2024 10:52:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 8/8] arm64: dts: qcom: add OnePlus 8T (kebab)
To: Caleb Connolly <caleb@postmarketos.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Bjorn Andersson <andersson@kernel.org>, Henrik Rydberg <rydberg@bitmath.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-input@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 ~postmarketos/upstreaming@lists.sr.ht,
 Frieder Hannenheim <frieder.hannenheim@proton.me>
References: <20240630-oneplus8-v2-0-c4a1f8da74f1@postmarketos.org>
 <20240630-oneplus8-v2-8-c4a1f8da74f1@postmarketos.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <20240630-oneplus8-v2-8-c4a1f8da74f1@postmarketos.org>
Content-Type: text/plain; charset=UTF-8
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

On 30.06.2024 8:36 PM, Caleb Connolly wrote:
> Initial support for USB, UFS, touchscreen, panel, wifi, and bluetooth.
> 
> Co-developed-by: Frieder Hannenheim <frieder.hannenheim@proton.me>
> Signed-off-by: Frieder Hannenheim <frieder.hannenheim@proton.me>
> Signed-off-by: Caleb Connolly <caleb@postmarketos.org>
> ---

[...]

> +/delete-node/ &spss_mem;
> +/delete-node/ &cdsp_secure_heap;
> +

odd double newline

> +
> +/ {

[...]

> +
> +		framebuffer@9c000000 {
> +			reg = <0 0x9c000000 0 0x2300000>;

0x0 for consistency


> +			no-map;
> +		};
> +	};
> +
> +	panel_avdd_5p5: regulator-panel-avdd {
> +		compatible = "regulator-fixed";
> +		regulator-name = "panel_avdd_5p5";
> +		regulator-min-microvolt = <5500000>;
> +		regulator-max-microvolt = <5500000>;

Please unsqash these properties like in e.g. x1e80100-crd

> +		regulator-enable-ramp-delay = <233>;
> +		gpio = <&tlmm 61 GPIO_ACTIVE_HIGH>;
> +		regulator-boot-on;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&panel_avdd_pins>;

property-n
property-names

(theres more occurences in this patch)

> +		vreg_l11c_3p3: ldo11 {
> +			regulator-name = "vreg_l11c_3p3";
> +			regulator-min-microvolt = <2900000>;
> +			regulator-max-microvolt = <3304000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +			regulator-boot-on;
> +			/* FIXME: we don't yet support power cycling the panel */
> +			//regulator-always-on;

so should this be in or out?

[...]

> +	/*
> +	 * Pixelworks Iris 5 @ 26 (i3c) or 22 (i2c)
> +	 * This is a co-processor for the display which needs to be
> +	 * initialized along with the panel.
> +	 */

yikes

> +};
> +
> +&i2c15 {
> +	status = "okay";
> +
> +	typec-mux@42 {
> +		compatible = "fcs,fsa4480";
> +		reg = <0x42>;
> +
> +		vcc-supply = <&vreg_s4a_1p8>;
> +
> +		orientation-switch;
> +
> +		/* Currently unsupported */
> +		status = "disabled";

Any particular problems with it?

[...]

> +		/*
> +		 * FIXME: There is a bug somewhere in the display stack and it isn't
> +		 * possible to get the panel to a working state after toggling reset.
> +		 * At best it just shows one or more vertical red lines. So for now
> +		 * let's skip the reset GPIO.
> +		 */
> +		// reset-gpios = <&tlmm 75 GPIO_ACTIVE_LOW>;

c++-style comments used not to be cool.. not sure what's the current policy

> +
> +		pinctrl-0 = <&panel_reset_pins &panel_vsync_pins &panel_vout_pins>;

should panel_vout_pins be modeled as a regulator?

[...]

> +&pm8150_gpios {
> +	/*
> +	 * These are marked as reserved in downstream
> +	 * with no description, without schematics we
> +	 * don't know what the deal is here.
> +	 */
> +	gpio-reserved-ranges = <2 1>, <4 2>, <8 1>;

drivers/pinctrl/qcom/pinctrl-spmi-gpio.c

/* pm8150 has 10 GPIOs with holes on 2, 5, 7 and 8 */
{ .compatible = "qcom,pm8150-gpio", .data = (void *) 10 },

[...]

> +&pon_resin {
> +	status = "okay";
> +
> +	linux,code = <KEY_VOLUMEDOWN>;

status should go last

[...]

> +&tlmm {
> +	gpio-reserved-ranges = <28 4>, <40 4>;

Any chance you'd know what they're for?

[...]

> +&usb_1_dwc3 {
> +	dr_mode = "peripheral";

[...]

> +
> +	touchscreen@4b {
> +		compatible = "syna,s3908";
> +		reg = <0x4B>;

lowercase hex

> +
> +		pinctrl-0 = <&touch_irq_active &touch_rst_active>;
> +		pinctrl-names = "default";
> +
> +		interrupts-extended = <&tlmm 39 0x2008>;

https://lore.kernel.org/linux-arm-msm/20240605160032.150587-1-krzysztof.kozlowski@linaro.org/

Konrad
