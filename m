Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B3FAD84FEEB
	for <lists+dri-devel@lfdr.de>; Fri,  9 Feb 2024 22:32:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6ED2C10FE3C;
	Fri,  9 Feb 2024 21:32:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="inX4cQEn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com
 [209.85.208.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FE6310FE3C
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Feb 2024 21:32:48 +0000 (UTC)
Received: by mail-ed1-f51.google.com with SMTP id
 4fb4d7f45d1cf-55fcceb5f34so1655155a12.3
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Feb 2024 13:32:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1707514362; x=1708119162; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Os4qev7suud/YhIU9+WIu+rwnop6A4JmpVMTfm/Akss=;
 b=inX4cQEnUQRZaB9s62E2AKMiiZBaHd5Q53hKnSYu0DosewSvkssCycsOxIjRL1WuVd
 LJV84qF2Bd1eb0ySTxDmAd7ocpWt+0FTXwem6HQ6qB/kOAu/3RlS3E5vSwS0bKU+MjyF
 BAL1PzyECVtuhq8IqMsz/AQujBvIexPg+3DLl+failELsJI+IC8Mzi+YqQ7m9W2QlQH7
 Rc32x/5wHehIdRrlz1r7/0bnBEUVH6cklEM0LK0kvOimlLMRONv9j2li7TexZklAmUP3
 dFWEFokgv1j2HjivKNpX25jpRZlrzojuJpT5nfzVcM1uMe5z1Fs3OCxVkK51m9NHB8Hl
 6KYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707514362; x=1708119162;
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Os4qev7suud/YhIU9+WIu+rwnop6A4JmpVMTfm/Akss=;
 b=ifKNZLwSCgm3nkiN7xA7G4kd6kxM4orBhOTVSN3qmlyYuCPbZbB2CUm5c6q/KZt30K
 slVpO7w9+lvLRSQRGIIXWeVevHhKNGBaM5fNgnFc7WnH18htZM7ZaV87xXSv1NbnQ9NO
 JJy1spaasC/RfC6C3OcRvQynlxW9XnwJTI0tZJg8H0QgVPkR7cYr9rKBLCwkqaw0QvmY
 117vOWawrT8ZWC5wrnH+6yY8DK6aoe0IImiAkZeYGBiOMKfMDCRmC8qaFbYxk3Qw7Mad
 K0aN22wg81+CFkszuCQ5XB2bmZnD41/IaBeJOOx/tF6c/VprwdAPnftRV0dNjRkwO8mm
 ZNAQ==
X-Gm-Message-State: AOJu0YzYkaK93hxrFysqDyY839oOBSm1mndDqfDWWJyIisU8qVVZQ0Di
 OlYqgLSzW/QXb3Ih+37+phXk+DDdNFDf5g0rJHMn0pGYfK09swJ8opavGGeCNhM=
X-Google-Smtp-Source: AGHT+IFIoYfxKHL9swRQV0MYgEkbxpFOUINdT2LjlcbSKaf7uj2hPzPUdJudSt8B/nJl4Redq7P9MQ==
X-Received: by 2002:a05:6402:1295:b0:560:c9b5:c440 with SMTP id
 w21-20020a056402129500b00560c9b5c440mr99184edv.11.1707514362412; 
 Fri, 09 Feb 2024 13:32:42 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCWhM7Wv3B0b9S5Gg/kpkf8Zyy6sMDXu1ZgzNUyTGzK49js1OjK6ncpS4CI4LVbb573p1dvototMWqikdLS+JAaLWAwLtKAddE5qoVXzPaTV6g3SQSBZHG7akvcu7Txw3akiQZn9DRdyg2vq6lJUoeykfivHoYJ65I0Tw/PH7cSOMiJVode4vbNzjhmT79A73gmcx1OgeUZmcSY2uiSbS6R9wUtrdtH4pTTNUMg/Zxiby1ou5Ae43fvq9PqjadAx8BMc9ElOrd4vaqsBtqeod/EPbwDFKAz6gsyoCL0g3YNZOYLa7cPGzxBfymdKTVSJhsYkgZ0I7HwnUJoC+mvjSrhbblPJ5kgt7D3dyJvWDp6PecFX0gSOwJePVom3f6JWNGf1/Z2DPfa3XfUUV2ZDXGKDIjdA3qIUSzzv1kiNdOuV/EuKEMp5Iu2gtUGVi/1FIzxJjSwSWV0unin+mz0VCrir7OznnZbVbtO0g3MOi6w60QC+zBlh5ilnOD83A6F55zhW85i700tT6DhfrWH4C/ADDEBwz3n5DHyi49hNZsOvmv9w7/LLje6t6njem+UHqU+O/u0IK+EkJvYqfQ9brvFNVFUcw2Y6QCcYIVL3OllINFskkS0SnOoDss4Y8yxDZWZtMFCW4xtW9SbbVctxcKpci0SB0dyOfhYIi+BMATmuxUsnQDHSuILaux9ZMB5ky+1EOjKHW6pxAVtcBwthn6da
Received: from [192.168.192.207] (037008245233.garwolin.vectranet.pl.
 [37.8.245.233]) by smtp.gmail.com with ESMTPSA id
 dm24-20020a05640222d800b005607fdd90b8sm114567edb.23.2024.02.09.13.32.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Feb 2024 13:32:42 -0800 (PST)
Message-ID: <5e71d9d2-0115-4359-9502-b1cb462c10fd@linaro.org>
Date: Fri, 9 Feb 2024 22:32:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/8] arm64: dts: qcom: msm8976: Add Adreno GPU
Content-Language: en-US
To: Adam Skladowski <a39.skl@gmail.com>
Cc: phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240121194221.13513-1-a39.skl@gmail.com>
 <20240121194221.13513-7-a39.skl@gmail.com>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <20240121194221.13513-7-a39.skl@gmail.com>
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

On 21.01.2024 20:41, Adam Skladowski wrote:
> Add Adreno GPU node.
> 
> Signed-off-by: Adam Skladowski <a39.skl@gmail.com>
> ---
>  arch/arm64/boot/dts/qcom/msm8976.dtsi | 66 +++++++++++++++++++++++++++
>  1 file changed, 66 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/msm8976.dtsi b/arch/arm64/boot/dts/qcom/msm8976.dtsi
> index 2d71ce34f00e..765c90ac14cb 100644
> --- a/arch/arm64/boot/dts/qcom/msm8976.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8976.dtsi
> @@ -1068,6 +1068,72 @@ mdss_dsi1_phy: phy@1a96a00 {
>  			};
>  		};
>  
> +		adreno_gpu: gpu@1c00000 {
> +			compatible = "qcom,adreno-510.0", "qcom,adreno";
> +
> +			reg = <0x01c00000 0x40000>;
> +			reg-names = "kgsl_3d0_reg_memory";
> +
> +			interrupts = <GIC_SPI 33 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "kgsl_3d0_irq";
> +
> +			clock-names = "core",
> +				      "iface",
> +				      "mem",
> +				      "mem_iface",
> +				      "rbbmtimer",
> +				      "alwayson";
> +
> +			clocks = <&gcc GCC_GFX3D_OXILI_CLK>,
> +			    <&gcc GCC_GFX3D_OXILI_AHB_CLK>,
> +			    <&gcc GCC_GFX3D_OXILI_GMEM_CLK>,
> +			    <&gcc GCC_GFX3D_BIMC_CLK>,
> +			    <&gcc GCC_GFX3D_OXILI_TIMER_CLK>,
> +			    <&gcc GCC_GFX3D_OXILI_AON_CLK>;

The entries are misaligned

property
property-names

(and without a separating newline, please)

> +
> +			power-domains = <&rpmpd MSM8976_VDDCX>;
> +
> +			iommus = <&gpu_iommu 0>;
> +
> +			status = "disabled";
> +
> +			operating-points-v2 = <&gpu_opp_table>;
> +
> +			gpu_opp_table: opp-table {
> +				compatible  ="operating-points-v2";
> +
> +				opp-200000000 {
> +					opp-hz = /bits/ 64 <200000000>;

A random downstream I took has:

19.2 MHz
266.6 MHz
300.0 MHz
432.0 MHz
480.0 MHz
550.0 MHz
600.0 MHz

> +					opp-level = <RPM_SMD_LEVEL_LOW_SVS>;

you want required-opps here instead

Konrad
