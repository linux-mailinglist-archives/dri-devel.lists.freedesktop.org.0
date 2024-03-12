Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CE33878BDB
	for <lists+dri-devel@lfdr.de>; Tue, 12 Mar 2024 01:20:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D82210EDC4;
	Tue, 12 Mar 2024 00:20:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="kQ0LvP0P";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com
 [209.85.167.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 913FA10EA4E
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Mar 2024 00:20:27 +0000 (UTC)
Received: by mail-lf1-f47.google.com with SMTP id
 2adb3069b0e04-513a81b717cso1906884e87.0
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Mar 2024 17:20:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1710202825; x=1710807625; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Y6Qj+d193V6vAwzUIxkG37xPPAUPTTqW49/CnKjXQd8=;
 b=kQ0LvP0PR5rwha0BFRvrK79ua9alYl99Xh7eF/dYOvG8Dy7PE/mpb0EDSk3kBdgsjN
 iHB2fLEzJsYhGa1Mqe+jEodmLo8RGEJEwU0YYrPI/CexobzahWk/dyk/feFO5IngsoOi
 343wKYjIpRaxFhwnXZyVivM53OwSURJNsHdMxkBBcUj7BRsvE7SXZW52c00UHjQg3x1Q
 d9jsMziMVlftmTWe2hKtjCXNcGg/NsdfGqQmhOo7H1/iLwR/9eNcgSqNcg9/46dIHDTd
 dB8/QhKY/VBUXDT+geHFC5FMs3rUQuAX36SnXQYkEr44D6Ua2XD7TyQmnkggJf66c0Lc
 e2Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710202825; x=1710807625;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Y6Qj+d193V6vAwzUIxkG37xPPAUPTTqW49/CnKjXQd8=;
 b=eZw3Ii+k1lac7VZkqiSc2W76KaTdRtO1O0MFKIKixL7gvfLuWeaAVbxtf0rX1BBmqc
 VryI1VjH19IH2LsRudToi6ceD3gn8vsCYgOOVPay/qZAZmfY2wvpmO70+fcsTN9vPby4
 IYs0zWDO5XIhPX5YwWfZD7JH732AnHNxrjVOE2I77g/Yu4DekqGB+edp13BM8on3ogy2
 9an+2xy0NVV44GZAfidfFMINhRjr1CWfRi9IkUR4VNhygRRr4o7vigcCEXcRFElYtz/i
 S53UlWgSZIt27OQhjsUpBbuilDvEIdRaC68bJwuFa5QjI4If1EbGS0O5J5gxl9Yw5tzI
 MTbg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVbxJAbXpeJJ/rcNfYPg20mIzhGMADOcN7GhG+7FQN10C5JZxkiTjWBMUk046Dd++KiFHodh/kWWwBx/v6xiGoDpgryUrCAnM1i4vQFhYEe
X-Gm-Message-State: AOJu0YzQVpRC9NKEsjniVnsPlFJf16qMea0CczzhI49+PbbFORSzjxuK
 UL2JUujlCvsq0N/IaLXiXfVgDejdXkKltnW6e1uo2S4WwoEKf3PX1VWOuZ7qPAI=
X-Google-Smtp-Source: AGHT+IECykpsirV8o3fAnfpG+ZqnLDETPl8qxRjl1ccJmT0u7F6lmAy4sP57NbpxufW8iWZ12UsN4w==
X-Received: by 2002:ac2:485c:0:b0:513:c3:1d94 with SMTP id
 28-20020ac2485c000000b0051300c31d94mr4909736lfy.52.1710202825462; 
 Mon, 11 Mar 2024 17:20:25 -0700 (PDT)
Received: from [172.30.205.61] (UNUSED.212-182-62-129.lubman.net.pl.
 [212.182.62.129]) by smtp.gmail.com with ESMTPSA id
 h18-20020a056512221200b0051354f006b9sm1316460lfu.56.2024.03.11.17.20.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Mar 2024 17:20:25 -0700 (PDT)
Message-ID: <58d5b209-94f6-43be-89e0-b14f5e30fd8c@linaro.org>
Date: Tue, 12 Mar 2024 01:20:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 6/7] arm64: dts: qcom: sm8650: add GPU nodes
Content-Language: en-US
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
 Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 iommu@lists.linux.dev, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20240216-topic-sm8650-gpu-v3-0-eb1f4b86d8d3@linaro.org>
 <20240216-topic-sm8650-gpu-v3-6-eb1f4b86d8d3@linaro.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240216-topic-sm8650-gpu-v3-6-eb1f4b86d8d3@linaro.org>
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



On 2/16/24 12:03, Neil Armstrong wrote:
> Add GPU nodes for the SM8650 platform.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>   arch/arm64/boot/dts/qcom/sm8650.dtsi | 166 +++++++++++++++++++++++++++++++++++
>   1 file changed, 166 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
> index 62e6ae93a9a8..27dcef27b6ad 100644
> --- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
> @@ -2589,6 +2589,128 @@ tcsr: clock-controller@1fc0000 {
>   			#reset-cells = <1>;
>   		};
>   
> +		gpu: gpu@3d00000 {
> +			compatible = "qcom,adreno-43051401", "qcom,adreno";
> +			reg = <0x0 0x03d00000 0x0 0x40000>,
> +			      <0x0 0x03d9e000 0x0 0x1000>,
> +			      <0x0 0x03d61000 0x0 0x800>;
> +			reg-names = "kgsl_3d0_reg_memory",
> +				    "cx_mem",
> +				    "cx_dbgc";
> +
> +			interrupts = <GIC_SPI 300 IRQ_TYPE_LEVEL_HIGH>;
> +
> +			iommus = <&adreno_smmu 0 0x0>,
> +				 <&adreno_smmu 1 0x0>;
> +
> +			operating-points-v2 = <&gpu_opp_table>;
> +
> +			qcom,gmu = <&gmu>;
> +
> +			status = "disabled";
> +
> +			zap-shader {
> +				memory-region = <&gpu_micro_code_mem>;
> +			};
> +
> +			/* Speedbin needs more work on A740+, keep only lower freqs */
> +			gpu_opp_table: opp-table {
> +				compatible = "operating-points-v2";
> +
> +				opp-680000000 {
> +					opp-hz = /bits/ 64 <680000000>;
> +					opp-level = <RPMH_REGULATOR_LEVEL_SVS_L1>;
> +				};

I got a memo from krzk that we should be sorting OPPs low-to-high,
could you please reorder these (and under gmu)?

Otherwise lgtm

Konrad
