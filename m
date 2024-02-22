Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29D6E85F46C
	for <lists+dri-devel@lfdr.de>; Thu, 22 Feb 2024 10:33:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 411C610E8DC;
	Thu, 22 Feb 2024 09:33:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="RdexxZZZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EC6C10E8D7
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Feb 2024 09:33:23 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-41275971886so12145035e9.3
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Feb 2024 01:33:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708594401; x=1709199201; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=fDXr5JamV/3Ee7kU0PpVPCxgNjfs/qLOTnSmkmTZcYM=;
 b=RdexxZZZ7km6Lwi63HS9ASasuow0HhMyDANR/P31RRB1pj0iaAQfWe4DT9Z9dAu2zs
 KIJfZcmjkUIX1TKI2d6wxljvmC5Oee884U3guSwRkejoBDSAO+43wwyenDuqGZ45akux
 cBnwQNKLvWY3wwJAuIHij7QKQr94iAoUlIZTGfMy4rsexyM5HiOeOTeyw1aoXQOQuTYR
 E8Z4qiXu0j5pIGAu2S+JVNtNXL8puIP5ea8THenabnID7+aHfduQPd37Hxz6Sv3qBEuY
 DZ0BcTzCe2Wtm74jYr/FKfAzsBTTO3erWPxZfp38HqSBc6entUnGyOwXJRVndlfzKnet
 nPmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708594401; x=1709199201;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=fDXr5JamV/3Ee7kU0PpVPCxgNjfs/qLOTnSmkmTZcYM=;
 b=pgJC9essHixvngHTrBcwPA4uoL04rycyz8r5cmJoWHpeRp77g4M4KoEs0vr2xT9SgA
 vQrtKHFlEcqCsiJeVAKkMTPsCKtvMmkSyaq3WUaCrR9rsyTho7FxXr7K72qQe3Aevqj2
 wQvFR8eYO6hGnVZqrd+1MsQfvq1KWXKSpdedHRaXxTfA+XO1x3i8z8MELJn3nsnHzu5/
 bqZdojNDVVsWzUK3zrxNc2hPKfGveovH6XJjDW9KQnFHSDbhAUJZWqaS8ZAYzDDN3Dea
 bT60b2tBUHqcSNtzkSKM3KyPv3RoXDD8fCGUZ3cNzWYS1rYiWBsFqZLmyewPLxLvgoR+
 4qYA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU3UIcdNm55CV6Nf1tKAsob4elv6A6oIXQsTDwB6VcdPRbhVNFuX7S7SRIswpNGFfOsrjLVAQDPkTEPOTzWQSFytBWAZdHpFuFhpJZV8Q/3
X-Gm-Message-State: AOJu0YyRIvU0QkYYZXJ+9F0Ag4aX/CjCT1KevK/Vz4+PDCO0ZX3PhodO
 xFxFJlOnIaY7kINL62BztZBAQ2MmgRSyuICkvpuIdK2xdH1CXo8qA08Nvs+TrM8=
X-Google-Smtp-Source: AGHT+IGQu/yEpWedhYCkg4zb3W4HcuXrKU1CRJjLn7mYmNeF7dYQsYTZdr8SRbdKAYubrdbuo5Wz6w==
X-Received: by 2002:a05:600c:81e:b0:40f:b0d9:113 with SMTP id
 k30-20020a05600c081e00b0040fb0d90113mr15595647wmp.36.1708594401122; 
 Thu, 22 Feb 2024 01:33:21 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:c3d:c732:acf9:f53b?
 ([2a01:e0a:982:cbb0:c3d:c732:acf9:f53b])
 by smtp.gmail.com with ESMTPSA id
 r17-20020a05600c459100b004124907f43fsm20589536wmo.12.2024.02.22.01.33.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Feb 2024 01:33:20 -0800 (PST)
Message-ID: <dd9fa912-203a-4089-ac15-a73658aa2a09@linaro.org>
Date: Thu, 22 Feb 2024 10:33:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH 8/9] arm64: dts: qcom: qcs6490-rb3gen2: Enable USB Type-C
 display
To: Bjorn Andersson <quic_bjorande@quicinc.com>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 cros-qcom-dts-watchers@chromium.org, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20240221-rb3gen2-dp-connector-v1-0-dc0964ef7d96@quicinc.com>
 <20240221-rb3gen2-dp-connector-v1-8-dc0964ef7d96@quicinc.com>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro Developer Services
In-Reply-To: <20240221-rb3gen2-dp-connector-v1-8-dc0964ef7d96@quicinc.com>
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
Reply-To: neil.armstrong@linaro.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 22/02/2024 00:19, Bjorn Andersson wrote:
> With MDSS, pmic_glink, and the redriver in place, wire up the various
> components to enable USB Type-C display on the RB3gen2.
> 
> Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
> ---
>   arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 63 +++++++++++++++++++++++++++-
>   1 file changed, 61 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
> index 171ed979d55f..4bf1c6351467 100644
> --- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
> +++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
> @@ -149,7 +149,15 @@ port@1 {
>   					reg = <1>;
>   
>   					pmic_glink_ss_in: endpoint {
> -						remote-endpoint = <&usb_1_dwc3_ss>;
> +						remote-endpoint = <&redriver_usb_con_ss>;
> +					};
> +				};
> +
> +				port@2 {
> +					reg = <2>;
> +
> +					pmic_glink_sbu_in: endpoint {
> +						remote-endpoint = <&redriver_usb_con_sbu>;
>   					};
>   				};
>   			};
> @@ -476,6 +484,36 @@ typec-mux@1c {
>   
>   		retimer-switch;
>   		orientation-switch;
> +
> +		ports {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			port@0 {
> +				reg = <0>;
> +
> +				redriver_usb_con_ss: endpoint {
> +					remote-endpoint = <&pmic_glink_ss_in>;
> +				};
> +			};
> +
> +			port@1 {
> +				reg = <1>;
> +
> +				redriver_phy_con_ss: endpoint {
> +					remote-endpoint = <&usb_dp_qmpphy_out>;
> +					data-lanes = <0 1 2 3>;
> +				};
> +			};
> +
> +			port@2 {
> +				reg = <2>;
> +
> +				redriver_usb_con_sbu: endpoint {
> +					remote-endpoint = <&pmic_glink_sbu_in>;
> +				};
> +			};

Nice to see the SBU switching works :-)


Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>


> +		};
>   	};
>   };
>   
> @@ -483,6 +521,15 @@ &mdss {
>   	status = "okay";
>   };
>   
> +&mdss_dp {
> +	status = "okay";
> +};
> +
> +&mdss_dp_out {
> +	data-lanes = <0 1>;
> +	remote-endpoint = <&usb_dp_qmpphy_dp_in>;
> +};
> +
>   &mdss_edp {
>   	status = "okay";
>   };
> @@ -534,7 +581,7 @@ &usb_1_dwc3_hs {
>   };
>   
>   &usb_1_dwc3_ss {
> -	remote-endpoint = <&pmic_glink_ss_in>;
> +	remote-endpoint = <&usb_dp_qmpphy_usb_ss_in>;
>   };
>   
>   &usb_1_hsphy {
> @@ -554,6 +601,18 @@ &usb_1_qmpphy {
>   	status = "okay";
>   };
>   
> +&usb_dp_qmpphy_out {
> +	remote-endpoint = <&redriver_phy_con_ss>;
> +};
> +
> +&usb_dp_qmpphy_usb_ss_in {
> +	remote-endpoint = <&usb_1_dwc3_ss>;
> +};
> +
> +&usb_dp_qmpphy_dp_in {
> +	remote-endpoint = <&mdss_dp_out>;
> +};
> +
>   &wifi {
>   	memory-region = <&wlan_fw_mem>;
>   };
> 
