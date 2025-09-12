Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F9D4B54C95
	for <lists+dri-devel@lfdr.de>; Fri, 12 Sep 2025 14:09:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DED6C10EC31;
	Fri, 12 Sep 2025 12:09:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="nn5pUIJK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 403F410EC31
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Sep 2025 12:09:17 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-45deccb2c1eso13920615e9.1
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Sep 2025 05:09:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1757678955; x=1758283755; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=luNlPT2x65V+KjVmCaFP6TTppyN73fwYQbrYbkkLiGU=;
 b=nn5pUIJKMaYjkZfIwqClv9Pdxl4eEm/eFczuVAQGTw6ybndpaHyqw1//T09f0R524f
 yF+jvW/bbgAVnpI0pXKiM+xt67QM9uA7MLxYKsVo0dkerZZAkRs1IcpnznAFxetthYyi
 1Yed/v1uHUfA48bsJ0wRMZfsiH7atXdtTDnrXyj29cisOHHzhcGobTxNqUJnlkxcdwQI
 eSMxsP0XNtXK07okLbNUlb3XKcuANYvain1RYMA3/xeoC2/3Zfb5peUojdPQNUUjlZ1f
 KEqbzS0qLuiDFsq+ZuRY+XCxDyYpapxEqyRo1z/0m2R5mTDrA1sO9q/kK869wqScI9YK
 IDRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757678955; x=1758283755;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=luNlPT2x65V+KjVmCaFP6TTppyN73fwYQbrYbkkLiGU=;
 b=qjH6hJeg+Y9ci1Ml99fhiuuJ/b9mOwbr8/zHchGpYqT9ZkSMxQ2IGZ5ctf5G/7C0NN
 RoAzPYJVogq1kuHvKqaVNTnGAejdCSD44rt8SUnvR+LUAfy/IEjfPq/bzry0qeb9lWoJ
 QQnUvKTfXxsDYqPqqC+Z/baAsiDxrDQMxXNw4SJGlKko1qz88WKlcvFjYMvC/o8XFhJQ
 jxvfSZSGqytqxVfpMt3Ct9MMzq54qThRkSg4tlQJBxnU/RXX0TQF5AarZfcBaUCv7NhV
 Qp5EZrfC2P8gTGwieC+0bxmZvXE2VE907AhvBr2gf7ZFa+Xf+J/0XCZ9xEQaJA4KZgfq
 s41w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUFh0py5WY6Edsr5ZZJcH456NOZU7hYN5dutAFd7lRkiV0JD9E4RWgxrsQyxpvi4KWHxild5q1duMc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzI8kgIokxca8PskvSQeIZkELXeyt9OjLphHT3TtNAFytHrFvYc
 n8OoYLIUFomaYk7ZEc7+V4Va5iSan9e3PNHacS0VXy1BLfHn+hIzhgkb
X-Gm-Gg: ASbGnct3jlPKF51IhlwrxTOIeHtynF24f7P00HFPDfcFuuFBxYuPJr+6beSmAJgOdcv
 Vtc3gtPsyMLLKJ3dHZzls7WdtxbM+QTXDSJQadZQxJ4wSzCjTxPQWFkksGJv+fC+byXihHCzTF0
 cfN9WYijAojYVMxws5/m08IzfVzHEko7b3VC34LIDFjfm8l2GZuAhRvk8vcVPk2cHaNgG4bI6Nq
 K9AxI4jBS25GcuIDtlHo3T70HORItyrHKl8MFjorww7ZWUOEYb7diPpDUMaXJHk9x/lxflFCOnH
 8DDNSlUYtZgCp+Xdk5XzkyK0bhA4Kv59f3bLCm/vfDcSydch4Plufy/uGTPaDigBaieXY3EaipR
 Qz+kIlR9T19PcyUtW4xehJVKEvH4CtkU=
X-Google-Smtp-Source: AGHT+IEPx8/fQkGIVkJR+qz2UY7c6jEyUpO4Z9A3UsVNdqLYapE/RWg0OlQAjc/yFqkAVGNWgJ1CZQ==
X-Received: by 2002:a05:600c:1c9d:b0:45b:6275:42cc with SMTP id
 5b1f17b1804b1-45f211ffafbmr24614525e9.28.1757678955113; 
 Fri, 12 Sep 2025 05:09:15 -0700 (PDT)
Received: from [192.168.2.177] ([91.116.220.47])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45e017c1455sm62768935e9.24.2025.09.12.05.09.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Sep 2025 05:09:14 -0700 (PDT)
Message-ID: <04e75c1a-7040-403a-84be-82ff2d9f2544@gmail.com>
Date: Fri, 12 Sep 2025 14:09:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/38] ASoC: dt-bindings: mt8192-afe-pcm: Fix clocks and
 clock-names
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-mediatek@lists.infradead.org, robh@kernel.org
Cc: herbert@gondor.apana.org.au, davem@davemloft.net, krzk+dt@kernel.org,
 conor+dt@kernel.org, chunkuang.hu@kernel.org, p.zabel@pengutronix.de,
 airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, jassisinghbrar@gmail.com,
 mchehab@kernel.org, chunfeng.yun@mediatek.com, vkoul@kernel.org,
 kishon@kernel.org, sean.wang@kernel.org, linus.walleij@linaro.org,
 lgirdwood@gmail.com, broonie@kernel.org, andersson@kernel.org,
 mathieu.poirier@linaro.org, daniel.lezcano@linaro.org, tglx@linutronix.de,
 atenart@kernel.org, jitao.shi@mediatek.com, ck.hu@mediatek.com,
 houlong.wei@mediatek.com, kyrie.wu@mediatek.corp-partner.google.com,
 andy.teng@mediatek.com, tinghan.shen@mediatek.com, jiaxin.yu@mediatek.com,
 shane.chien@mediatek.com, olivia.wen@mediatek.com, granquet@baylibre.com,
 eugen.hristev@linaro.org, arnd@arndb.de, sam.shih@mediatek.com,
 jieyy.yang@mediatek.com, frank-w@public-files.de, mwalle@kernel.org,
 fparent@baylibre.com, linux-crypto@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org,
 linux-gpio@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 linux-sound@vger.kernel.org
References: <20250724083914.61351-1-angelogioacchino.delregno@collabora.com>
 <20250724083914.61351-5-angelogioacchino.delregno@collabora.com>
Content-Language: en-US, ca-ES, es-ES
From: Matthias Brugger <matthias.bgg@gmail.com>
Autocrypt: addr=matthias.bgg@gmail.com; keydata=
 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
In-Reply-To: <20250724083914.61351-5-angelogioacchino.delregno@collabora.com>
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



On 24/07/2025 10:38, AngeloGioacchino Del Regno wrote:
> Both clocks and clock-names are missing (a lot of) entries: add
> all the used audio clocks and their description and also fix the
> example node.

You forgot to fix the example node.

Matthias

> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>   .../bindings/sound/mt8192-afe-pcm.yaml        | 106 +++++++++++++++++-
>   1 file changed, 104 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/sound/mt8192-afe-pcm.yaml b/Documentation/devicetree/bindings/sound/mt8192-afe-pcm.yaml
> index 8ddf49b0040d..96ee0a47360d 100644
> --- a/Documentation/devicetree/bindings/sound/mt8192-afe-pcm.yaml
> +++ b/Documentation/devicetree/bindings/sound/mt8192-afe-pcm.yaml
> @@ -47,16 +47,118 @@ properties:
>         - description: AFE clock
>         - description: ADDA DAC clock
>         - description: ADDA DAC pre-distortion clock
> -      - description: audio infra sys clock
> -      - description: audio infra 26M clock
> +      - description: ADDA ADC clock
> +      - description: ADDA6 ADC clock
> +      - description: Audio low-jitter 22.5792m clock
> +      - description: Audio low-jitter 24.576m clock
> +      - description: Audio PLL1 tuner clock
> +      - description: Audio PLL2 tuner clock
> +      - description: Audio Time-Division Multiplexing interface clock
> +      - description: ADDA ADC Sine Generator clock
> +      - description: audio Non-LE clock
> +      - description: Audio DAC High-Resolution clock
> +      - description: Audio High-Resolution ADC clock
> +      - description: Audio High-Resolution ADC SineGen clock
> +      - description: Audio ADDA6 High-Resolution ADC clock
> +      - description: Tertiary ADDA DAC clock
> +      - description: Tertiary ADDA DAC pre-distortion clock
> +      - description: Tertiary ADDA DAC Sine Generator clock
> +      - description: Tertiary ADDA DAC High-Resolution clock
> +      - description: Audio infra sys clock
> +      - description: Audio infra 26M clock
> +      - description: Mux for audio clock
> +      - description: Mux for audio internal bus clock
> +      - description: Mux main divider by 4
> +      - description: Primary audio mux
> +      - description: Primary audio PLL
> +      - description: Secondary audio mux
> +      - description: Secondary audio PLL
> +      - description: Primary audio en-generator clock
> +      - description: Primary PLL divider by 4 for IEC
> +      - description: Secondary audio en-generator clock
> +      - description: Secondary PLL divider by 4 for IEC
> +      - description: Mux selector for I2S port 0
> +      - description: Mux selector for I2S port 1
> +      - description: Mux selector for I2S port 2
> +      - description: Mux selector for I2S port 3
> +      - description: Mux selector for I2S port 4
> +      - description: Mux selector for I2S port 5
> +      - description: Mux selector for I2S port 6
> +      - description: Mux selector for I2S port 7
> +      - description: Mux selector for I2S port 8
> +      - description: Mux selector for I2S port 9
> +      - description: APLL1 and APLL2 divider for I2S port 0
> +      - description: APLL1 and APLL2 divider for I2S port 1
> +      - description: APLL1 and APLL2 divider for I2S port 2
> +      - description: APLL1 and APLL2 divider for I2S port 3
> +      - description: APLL1 and APLL2 divider for I2S port 4
> +      - description: APLL1 and APLL2 divider for IEC
> +      - description: APLL1 and APLL2 divider for I2S port 5
> +      - description: APLL1 and APLL2 divider for I2S port 6
> +      - description: APLL1 and APLL2 divider for I2S port 7
> +      - description: APLL1 and APLL2 divider for I2S port 8
> +      - description: APLL1 and APLL2 divider for I2S port 9
> +      - description: Top mux for audio subsystem
> +      - description: 26MHz clock for audio subsystem
>   
>     clock-names:
>       items:
>         - const: aud_afe_clk
>         - const: aud_dac_clk
>         - const: aud_dac_predis_clk
> +      - const: aud_adc_clk
> +      - const: aud_adda6_adc_clk
> +      - const: aud_apll22m_clk
> +      - const: aud_apll24m_clk
> +      - const: aud_apll1_tuner_clk
> +      - const: aud_apll2_tuner_clk
> +      - const: aud_tdm_clk
> +      - const: aud_tml_clk
> +      - const: aud_nle
> +      - const: aud_dac_hires_clk
> +      - const: aud_adc_hires_clk
> +      - const: aud_adc_hires_tml
> +      - const: aud_adda6_adc_hires_clk
> +      - const: aud_3rd_dac_clk
> +      - const: aud_3rd_dac_predis_clk
> +      - const: aud_3rd_dac_tml
> +      - const: aud_3rd_dac_hires_clk
>         - const: aud_infra_clk
>         - const: aud_infra_26m_clk
> +      - const: top_mux_audio
> +      - const: top_mux_audio_int
> +      - const: top_mainpll_d4_d4
> +      - const: top_mux_aud_1
> +      - const: top_apll1_ck
> +      - const: top_mux_aud_2
> +      - const: top_apll2_ck
> +      - const: top_mux_aud_eng1
> +      - const: top_apll1_d4
> +      - const: top_mux_aud_eng2
> +      - const: top_apll2_d4
> +      - const: top_i2s0_m_sel
> +      - const: top_i2s1_m_sel
> +      - const: top_i2s2_m_sel
> +      - const: top_i2s3_m_sel
> +      - const: top_i2s4_m_sel
> +      - const: top_i2s5_m_sel
> +      - const: top_i2s6_m_sel
> +      - const: top_i2s7_m_sel
> +      - const: top_i2s8_m_sel
> +      - const: top_i2s9_m_sel
> +      - const: top_apll12_div0
> +      - const: top_apll12_div1
> +      - const: top_apll12_div2
> +      - const: top_apll12_div3
> +      - const: top_apll12_div4
> +      - const: top_apll12_divb
> +      - const: top_apll12_div5
> +      - const: top_apll12_div6
> +      - const: top_apll12_div7
> +      - const: top_apll12_div8
> +      - const: top_apll12_div9
> +      - const: top_mux_audio_h
> +      - const: top_clk26m_clk
>   
>   required:
>     - compatible

