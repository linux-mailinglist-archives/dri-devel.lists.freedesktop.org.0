Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 57B9C89DFE8
	for <lists+dri-devel@lfdr.de>; Tue,  9 Apr 2024 18:00:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D127112D9B;
	Tue,  9 Apr 2024 16:00:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Bg7empsW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBA8610E8B1
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Apr 2024 16:00:20 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id
 ffacd0b85a97d-3458b699d6cso1114507f8f.0
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Apr 2024 09:00:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712678419; x=1713283219; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=Vl2WAWZiRqw9Ns4ylVujkmqdUMbnF+5lRwOPnf5XU7k=;
 b=Bg7empsWxWA9dJXzNmB7zBxYWZ9AaypRg7vLwKUN00/IbIbudcedrasg4XiHvOOmBd
 OGtITpPRuR/mMXFzCzB6Or6LNme2z+zYLhTjYuxHC+pPbU/+Osc5zlge4iztBxicFH/Y
 o4ecjZozpgT7lz+oXhTaWsogqpdXHDMT4HMWWVapyk5m46/uHqUiCft1jfq/Dgh6Gm8g
 nSVaaqgDBTUsTv2DOB7stMlaj2nnSS3Yud5svk4LezC/FTcnk+4elw5rM19lBzd8fHRW
 +8qtZuyfs99BY3eCIrUHuj4BrY4NFaoQMTLuzefvn/oq2h4jXoEbsFBb5n6lXAd1v6Q/
 yiQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712678419; x=1713283219;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Vl2WAWZiRqw9Ns4ylVujkmqdUMbnF+5lRwOPnf5XU7k=;
 b=E8v2SmAgXkx3HDOWwh8I/3G+6jWcJTTvwE7j1uXZqMAGvCkDnyqEJmHfpEolRjyqTt
 m9DmdlpKx3xGjqSVrEA7fcZni1p69Fx22dfiZNND75oElPmztQtICXdbqc/STXixMYxt
 l9d7tcsLG/E3YifmQHPnwAp9VBmY7YZtHSOsU8g+uqJXk6QErLAn8gsmKTyvDh028jom
 xTuwKzCV6LWD6b4hEy11Gsrz+FV4NtZE2wGExBESvt/4UJtIdFdBb3mWMhY/+lIFOxje
 ilbCCoOo8Z4UkwLBd5vndsnzAVr52a021xR4Ga2vuomW5r+/Efe2vh0EuxY1T+U6zFFD
 8PHA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVz4Y5KtLfDHApsrvvSqcONLVILa9UvUby/LBLCvaq5fz2LMUokDb8IHH8B7s6VVIrwxj4ML0m2TiULs7DQgEBne295ylj6ebtsSYc9CSX9
X-Gm-Message-State: AOJu0YwdFbkfJ+Yp+O5D0MyVqQb5bCd2/qUVQwKxsGzZE75v3FX2KVCH
 tlnHhYPDT3XmtLHt+7jzIc3DKWxpVYO0nhND6gx+Swn6m/M+S7vvAjjpSLjg+D4=
X-Google-Smtp-Source: AGHT+IHXyvG8mKfTY4naLXWGXb6e7X0FvCeImKpBuVDysC36RkLPoOdejDcQfesyOgvubSVgZ97dCw==
X-Received: by 2002:adf:f1c4:0:b0:341:e4f4:4399 with SMTP id
 z4-20020adff1c4000000b00341e4f44399mr83235wro.68.1712678418814; 
 Tue, 09 Apr 2024 09:00:18 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.16])
 by smtp.gmail.com with ESMTPSA id
 k2-20020adff282000000b0033e9d9f891csm11740838wro.58.2024.04.09.09.00.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Apr 2024 09:00:18 -0700 (PDT)
Message-ID: <62b1f2fe-7892-405c-bbb9-4bc77173a801@linaro.org>
Date: Tue, 9 Apr 2024 18:00:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 18/18] arm64: dts: mediatek: add audio support for
 mt8365-evk
To: Alexandre Mergnat <amergnat@baylibre.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Lee Jones <lee@kernel.org>, Flora Fu <flora.fu@mediatek.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Rob Herring <robh@kernel.org>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
References: <20240226-audio-i350-v3-0-16bb2c974c55@baylibre.com>
 <20240226-audio-i350-v3-18-16bb2c974c55@baylibre.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20240226-audio-i350-v3-18-16bb2c974c55@baylibre.com>
Content-Type: text/plain; charset=UTF-8
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

On 09/04/2024 15:42, Alexandre Mergnat wrote:
> Add the sound node which is linked to the MT8365 SoC AFE and
> the MT6357 audio codec.
> 
> Update the file header.
> 
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
> ---
>  arch/arm64/boot/dts/mediatek/mt8365-evk.dts | 98 +++++++++++++++++++++++++++--
>  1 file changed, 94 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8365-evk.dts b/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
> index 50cbaefa1a99..eb0c5f076dd4 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
> +++ b/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
> @@ -1,9 +1,9 @@
>  // SPDX-License-Identifier: GPL-2.0
>  /*
> - * Copyright (c) 2021-2022 BayLibre, SAS.
> - * Authors:
> - * Fabien Parent <fparent@baylibre.com>
> - * Bernhard Rosenkränzer <bero@baylibre.com>
> + * Copyright (c) 2024 BayLibre, SAS.


What is happening with your copyrights? Why do you change existing ones?

> + * Authors: Fabien Parent <fparent@baylibre.com>
> + *	    Bernhard Rosenkränzer <bero@baylibre.com>
> + *	    Alexandre Mergnat <amergnat@baylibre.com>
>   */
>  
>  /dts-v1/;
> @@ -86,6 +86,29 @@ optee_reserved: optee@43200000 {
>  			reg = <0 0x43200000 0 0x00c00000>;
>  		};
>  	};
> +
> +	sound: sound {
> +		compatible = "mediatek,mt8365-mt6357";
> +		pinctrl-names = "default",
> +				"dmic",
> +				"miso_off",
> +				"miso_on",
> +				"mosi_off",
> +				"mosi_on";
> +		pinctrl-0 = <&aud_default_pins>;
> +		pinctrl-1 = <&aud_dmic_pins>;
> +		pinctrl-2 = <&aud_miso_off_pins>;
> +		pinctrl-3 = <&aud_miso_on_pins>;
> +		pinctrl-4 = <&aud_mosi_off_pins>;
> +		pinctrl-5 = <&aud_mosi_on_pins>;
> +		mediatek,platform = <&afe>;
> +		status = "okay";

Where did you disable the node?

> +	};
> +};
> +
> +&afe {
> +	mediatek,dmic-mode = <1>;
> +	status = "okay";
>  };
>  
>  &cpu0 {
> @@ -174,6 +197,12 @@ &mmc1 {
>  	status = "okay";
>  };
>  
> +&mt6357_codec {
> +	mediatek,micbias0-microvolt = <1900000>;
> +	mediatek,micbias1-microvolt = <1700000>;
> +	mediatek,vaud28-supply = <&mt6357_vaud28_reg>;
> +};
> +
>  &mt6357_pmic {
>  	interrupts-extended = <&pio 145 IRQ_TYPE_LEVEL_HIGH>;
>  	interrupt-controller;
> @@ -181,6 +210,67 @@ &mt6357_pmic {
>  };
>  
>  &pio {
> +	aud_default_pins: audiodefault-pins {
> +		pins {
> +		pinmux = <MT8365_PIN_72_CMDAT4__FUNC_I2S3_BCK>,
> +			 <MT8365_PIN_73_CMDAT5__FUNC_I2S3_LRCK>,
> +			 <MT8365_PIN_74_CMDAT6__FUNC_I2S3_MCK>,
> +			 <MT8365_PIN_75_CMDAT7__FUNC_I2S3_DO>;

You have broken indentation everywhere.

Best regards,
Krzysztof

