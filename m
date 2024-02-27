Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 37B2E868B7B
	for <lists+dri-devel@lfdr.de>; Tue, 27 Feb 2024 10:02:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DE4A10E884;
	Tue, 27 Feb 2024 09:02:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="rLNT8hZJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com
 [209.85.218.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C77B10E884
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Feb 2024 09:02:05 +0000 (UTC)
Received: by mail-ej1-f43.google.com with SMTP id
 a640c23a62f3a-a43488745bcso285894266b.3
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Feb 2024 01:02:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1709024523; x=1709629323; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=2UFRVzRGdKbrh6OpmSoCELk6m/tgkgNo+Ce19meRH6Q=;
 b=rLNT8hZJZ8Wpa/yzpQdGYUS6D452LGKXigtKQeYbNkgww5PIrYdHw4zrVF2t392BpO
 4/smwgwAHVOZpaWgcaIujZbZjVnrEGo2Z40V8v0p2LHnkU3R4XRINR8G+BHEg1RWLitt
 LXnwglszKbXiaY0fbIhlZvmhSIZIu4LVjXFZLcfUazucjWUBQ0gH+Cj+QaUBmMf0Cxqe
 uDFxN9mY6MipY6uzvzpXRy31Mu4XHVeuw4ldT3Cpy9gRRFurhP6TpN21rBH+9gLLzC86
 X1zbhr4Bn5+joeDQVysnAe1xiOoDRo/nAhaT/1sxbACWi22FUpHS7TAwKknJYIe3hx7p
 OjcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709024523; x=1709629323;
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2UFRVzRGdKbrh6OpmSoCELk6m/tgkgNo+Ce19meRH6Q=;
 b=hYZC8ObDgxeB3JAegiOUEGqP0IYTK1EX8xkPFKA7enAnVDhX4mPWYBgKfGKXRS1F+P
 H6jv5zsmuZdzKklK6L8jhLcRL4pwaPdVmlLJ/ZlJZLqt4G98zLWoO7j2rUuJ4uJsHglY
 mfIozEWJJOJrPv+8I6Msuqb9tfLeO0GljmGMybt1bmt+S+HjKxVhzQ5CCGrg6aAmdLiz
 /MIA+rcO60NB+RAbyt0PWwyFggiJikG+l4BvrSgLJg68Y83ej9F7rQd89TAUTRyhdij/
 xdZ7/PGEJLnjQ63T6ctBA+kleKA2zXKp6H0sFZbK460pz9PCb1sGcSpVCPYU36czorN7
 p1Jw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX8ISHIp9qYfzvx7rYr9oX6OacU4pjMlo26/rIigkVPGhmwBSy7fkTaErzYC2Gs1KpNJidqPq3y6Si4ALpkiNym2KDrRKxC6WCqqpMDcs31
X-Gm-Message-State: AOJu0YyqyT0NIGMTeNyYV2NbtBQZ+spSJ5eCnbGPTHsy+DBkWiloTnRk
 Rpu2+j9M2y41Tbs5src9EhAp5HlHqPz4nMo6DGdlemlYLO5ptNXMnUA1HU2YegQ=
X-Google-Smtp-Source: AGHT+IGc2QWR0Rom1zSmTHDgmMau7w3Y2LbkBFSHyz26l01oceBcm30z5SU15vWVjJT25rM6B2UZ0w==
X-Received: by 2002:a17:906:2e89:b0:a3f:5144:ada2 with SMTP id
 o9-20020a1709062e8900b00a3f5144ada2mr6800588eji.2.1709024523555; 
 Tue, 27 Feb 2024 01:02:03 -0800 (PST)
Received: from [192.168.1.20] ([178.197.222.116])
 by smtp.gmail.com with ESMTPSA id
 s12-20020a17090699cc00b00a3e8c3fc3ffsm560002ejn.10.2024.02.27.01.01.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Feb 2024 01:02:03 -0800 (PST)
Message-ID: <ce5f71a9-1b5f-4724-89db-dae2f64e8008@linaro.org>
Date: Tue, 27 Feb 2024 10:01:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/18] ASoC: dt-bindings: mediatek,mt8365-afe: Add audio
 afe document
Content-Language: en-US
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
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
References: <20240226-audio-i350-v1-0-4fa1cea1667f@baylibre.com>
 <20240226-audio-i350-v1-1-4fa1cea1667f@baylibre.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20240226-audio-i350-v1-1-4fa1cea1667f@baylibre.com>
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

On 26/02/2024 15:01, Alexandre Mergnat wrote:
> Add MT8365 audio front-end bindings
> 
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
> ---
>  .../bindings/sound/mediatek,mt8365-afe.yaml        | 164 +++++++++++++++++++++
>  1 file changed, 164 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/sound/mediatek,mt8365-afe.yaml b/Documentation/devicetree/bindings/sound/mediatek,mt8365-afe.yaml
> new file mode 100644
> index 000000000000..1d7eb2532ad2
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/mediatek,mt8365-afe.yaml
> @@ -0,0 +1,164 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/mediatek,mt8365-afe.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek AFE PCM controller for MT8365
> +
> +maintainers:
> +  - Alexandre Mergnat <amergnat@baylibre.com>
> +
> +properties:
> +  compatible:
> +    const: mediatek,mt8365-afe-pcm
> +
> +  reg:
> +    maxItems: 2

You must describe the items.

> +
> +  interrupts:
> +    maxItems: 1
> +
> +  mediatek,topckgen:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: The phandle of the mediatek topckgen controller

What for? Don't repeat the property name. Say something useful.

> +
> +  power-domains:
> +    maxItems: 1
> +
> +  "#sound-dai-cells":
> +    const: 0
> +
> +  clocks:
> +    items:
> +      - description: 26M clock
> +      - description: mux for audio clock
> +      - description: audio i2s0 mck
> +      - description: audio i2s1 mck
> +      - description: audio i2s2 mck
> +      - description: audio i2s3 mck
> +      - description: engen 1 clock
> +      - description: engen 2 clock
> +      - description: audio 1 clock
> +      - description: audio 2 clock
> +      - description: mux for i2s0
> +      - description: mux for i2s1
> +      - description: mux for i2s2
> +      - description: mux for i2s3
> +
> +  clock-names:
> +    items:
> +      - const: top_clk26m_clk
> +      - const: top_audio_sel
> +      - const: audio_i2s0_m
> +      - const: audio_i2s1_m
> +      - const: audio_i2s2_m
> +      - const: audio_i2s3_m
> +      - const: engen1
> +      - const: engen2
> +      - const: aud1
> +      - const: aud2
> +      - const: i2s0_m_sel
> +      - const: i2s1_m_sel
> +      - const: i2s2_m_sel
> +      - const: i2s3_m_sel
> +
> +  mediatek,i2s-shared-clock:

Why do you need this property? Linux (and other systems) handle sharing
clocks properly.

> +    description:
> +      i2s modules can share the same external clock pin.
> +      If this property is not present the clock mode is separrate.

Typo

> +    type: boolean
> +
> +  mediatek,dmic-iir-on:
> +    description:
> +      Boolean which specifies whether the DMIC IIR is enabled.
> +      If this property is not present the IIR is disabled.

"is enabled" or "enable it"?

You described the desired Linux feature or behavior, not the actual
hardware. The bindings are about the latter, so instead you need to
rephrase the property and its description to match actual hardware
capabilities/features/configuration etc.

> +    type: boolean
> +
> +  mediatek,dmic-irr-mode:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      Selects stop band of IIR DC-removal filter.
> +      0 = Software programmable custom coeff loaded by the driver.

Bindings are for hardware, not drivers. Why is this a property of board DTS?

> +      1 = 5Hz if 48KHz mode.
> +      2 = 10Hz if 48KHz mode.
> +      3 = 25Hz if 48KHz mode.
> +      4 = 50Hz if 48KHz mode.
> +      5 = 65Hz if 48KHz mode.

Use proper unit suffixes - hz.


> +    enum:
> +      - 0
> +      - 1
> +      - 2
> +      - 3
> +      - 4
> +      - 5
> +
> +  mediatek,dmic-two-wire-mode:
> +    description:
> +      Boolean which turns on digital microphone for two wire mode.
> +      If this property is not present the two wire mode is disabled.

This looks like hardware property, but the naming looks like SW. Again
you instruct what driver should do. Standard disclaimer:

You described the desired Linux feature or behavior, not the actual
hardware. The bindings are about the latter, so instead you need to
rephrase the property and its description to match actual hardware
capabilities/features/configuration etc.


> +    type: boolean
> +
> +

Just one blank line.

> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - power-domains
> +  - mediatek,topckgen
> +  - clocks
> +  - clock-names
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/mediatek,mt8365-clk.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    #include <dt-bindings/power/mediatek,mt8365-power.h>
> +
> +    soc {
> +        #address-cells = <2>;
> +        #size-cells = <2>;
> +
> +        afe@11220000 {

What is AFE?

https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation


> +            compatible = "mediatek,mt8365-afe-pcm";


Best regards,
Krzysztof

