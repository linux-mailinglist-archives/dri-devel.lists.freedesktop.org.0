Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0654861992C
	for <lists+dri-devel@lfdr.de>; Fri,  4 Nov 2022 15:18:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0933D10E7F8;
	Fri,  4 Nov 2022 14:18:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay05.th.seeweb.it (relay05.th.seeweb.it [5.144.164.166])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5700F10E7F7;
 Fri,  4 Nov 2022 14:17:58 +0000 (UTC)
Received: from [192.168.31.208] (unknown [194.29.137.22])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 295BD3F6DD;
 Fri,  4 Nov 2022 15:17:56 +0100 (CET)
Message-ID: <05f5cd8a-7908-c69b-33bb-fb75220403a9@somainline.org>
Date: Fri, 4 Nov 2022 15:17:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.1
Subject: Re: [PATCH v1 4/5] arm64: dts: qcom: sm8450-hdk: Add LT9611uxc HDMI
 bridge
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20221104131358.1025987-1-dmitry.baryshkov@linaro.org>
 <20221104131358.1025987-5-dmitry.baryshkov@linaro.org>
From: Konrad Dybcio <konrad.dybcio@somainline.org>
In-Reply-To: <20221104131358.1025987-5-dmitry.baryshkov@linaro.org>
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Vinod Koul <vkoul@kernel.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 04/11/2022 14:13, Dmitry Baryshkov wrote:
> From: Vinod Koul <vkoul@kernel.org>
>
> Add the LT9611uxc DSI-HDMI bridge and supplies
>
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   arch/arm64/boot/dts/qcom/sm8450-hdk.dts | 61 +++++++++++++++++++++++++
>   1 file changed, 61 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/sm8450-hdk.dts b/arch/arm64/boot/dts/qcom/sm8450-hdk.dts
> index e1a4cf1ee51d..9522dd29a38a 100644
> --- a/arch/arm64/boot/dts/qcom/sm8450-hdk.dts
> +++ b/arch/arm64/boot/dts/qcom/sm8450-hdk.dts
> @@ -20,6 +20,28 @@ chosen {
>   		stdout-path = "serial0:115200n8";
>   	};
>   
> +	lt9611_1v2: lt9611-vdd12-regulator {
> +		compatible = "regulator-fixed";
> +		regulator-name = "LT9611_1V2";
> +
> +		vin-supply = <&vph_pwr>;
> +		regulator-min-microvolt = <1200000>;
> +		regulator-max-microvolt = <1200000>;
> +		gpio = <&tlmm 9 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +	};
> +
> +	lt9611_3v3: lt9611-3v3 {

The previous node has -regulator, this one doesn't, please keep it 
consistent.


> +		compatible = "regulator-fixed";
> +		regulator-name = "LT9611_3V3";
> +
> +		vin-supply = <&vreg_bob>;
> +		gpio = <&tlmm 109 GPIO_ACTIVE_HIGH>;
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +		enable-active-high;
> +	};
> +
>   	vph_pwr: vph-pwr-regulator {
>   		compatible = "regulator-fixed";
>   		regulator-name = "vph_pwr";
> @@ -349,6 +371,27 @@ vreg_l7e_2p8: ldo7 {
>   	};
>   };
>   
> +&i2c9 {
> +	status = "okay";
> +	clock-frequency = <400000>;

Status last, please.


With these fixes:


Reviewed-by: Konrad Dybcio <konrad.dybcio@somainline.org>


Konrad

> +
> +	lt9611_codec: hdmi-bridge@2b {
> +		compatible = "lontium,lt9611uxc";
> +		reg = <0x2b>;
> +
> +		interrupts-extended = <&tlmm 44 IRQ_TYPE_EDGE_FALLING>;
> +
> +		reset-gpios = <&tlmm 107 GPIO_ACTIVE_HIGH>;
> +
> +		vdd-supply = <&lt9611_1v2>;
> +		vcc-supply = <&lt9611_3v3>;
> +
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&lt9611_irq_pin &lt9611_rst_pin>;
> +
> +	};
> +};
> +
>   &pcie0 {
>   	status = "okay";
>   	max-link-speed = <2>;
> @@ -394,8 +437,26 @@ &qupv3_id_0 {
>   	status = "okay";
>   };
>   
> +&qupv3_id_1 {
> +	status = "okay";
> +};
> +
>   &tlmm {
>   	gpio-reserved-ranges = <28 4>, <36 4>;
> +
> +	lt9611_irq_pin: lt9611-irq {
> +		pins = "gpio44";
> +		function = "gpio";
> +		bias-disable;
> +	};
> +
> +	lt9611_rst_pin: lt9611-rst-state {
> +		pins = "gpio107";
> +		function = "normal";
> +
> +		output-high;
> +		input-disable;
> +	};
>   };
>   
>   &uart7 {
