Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FFD3869A23
	for <lists+dri-devel@lfdr.de>; Tue, 27 Feb 2024 16:18:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DEE810E918;
	Tue, 27 Feb 2024 15:18:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="2Csx4Uco";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com
 [209.85.219.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E36C10E918
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Feb 2024 15:18:38 +0000 (UTC)
Received: by mail-qv1-f53.google.com with SMTP id
 6a1803df08f44-68fe8e20259so17434496d6.2
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Feb 2024 07:18:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1709047117; x=1709651917;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=FgeSwdzfejtZ7gerQ3YAwA0BCpS4Ld6TiTQUNC32GpI=;
 b=2Csx4UcoGfqE2FrjHRadm3mJJsS/4oZ8/tVkK7jSm8j1M3nxD05PXb0m1cuh0WIZGR
 BAAYj5ArsltQctWuccOIvs/VbnWKmb1dENGcco8qft35Z24cX7+/APXpa8ViuTSGrKeN
 4BlnM1FkcYs3G8Mix1iwUPuGFxI2SQOqmiXgXAdzPt4XugYD05esc688RLEI/Ukj7BG6
 XKu2/cJMGOJhk3xaLYZh9Y2GwGa8SfwPKg/slRLTCfTHShYnROF5G4cd99oQXr7d8Mkb
 rtb4QFANO2Ar5jq+UlH2suSKQtyVdP7pI/l2OQLL8F6PHzIsshH5TFBCj9oNJWZO1lOu
 f4zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709047117; x=1709651917;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=FgeSwdzfejtZ7gerQ3YAwA0BCpS4Ld6TiTQUNC32GpI=;
 b=pUMtY94F8iDQnoeC4D+IY4j9mdbHhb2bgFbqKyHpR1Z1iy2lp8lXia0hF9UL+IRXZH
 75/uVVjGBaS4Zs2kOjWRTzgaKl5VWinM2QzeI9+NaKeEG6XwQ3GxeeurxgFEUT+TFng3
 DwgnA3yScg+9c5X41BYD90AZv2otcuZ1K4rOn7JQDJLwKke8tbG3YVY2Fg08HWSu/nsg
 vhI7gbzsIlbV9euGJOP9TCWmt5j47BCr6iKbNQBAEYKDZszok3vkMaeqe9OLIIaUBb6u
 zdnoUSABjtP3i9AUbE4Rx1ieKSoXlrqG52uDpmQ49N/Sb5WzxJBj1nXVAdlKl0pmXRux
 jA5A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVlyydcLVrEW5q8FOrfXhCXbOPza5MOcDPxayYuTSfW+9fcBGS1gSeNCR8e41tQu8aw6AMXWkUAhamvO4ET5zzVW2JQDQjAA6cWnJBFWzRs
X-Gm-Message-State: AOJu0YxjLK6rcGrHjHgvB4oS0oBdXHXsqjpX/rNREC+vfemUw/6oMrvZ
 bo6gXSH5KLwWq5SEPV5VGu/j4C7kCjU6ngwcZSAb/xXV9KlfmkHh94zcfhuf1wQ=
X-Google-Smtp-Source: AGHT+IGCOPu8LzF13tl9Z5c0o4yQmsOPurtebB8rpDPdng5maYtZftIJX0pkpHN6dXZAiJKRZsdFWA==
X-Received: by 2002:a0c:971a:0:b0:68f:ef9b:44aa with SMTP id
 k26-20020a0c971a000000b0068fef9b44aamr2191669qvd.27.1709047117308; 
 Tue, 27 Feb 2024 07:18:37 -0800 (PST)
Received: from [192.168.1.172] ([93.5.22.158])
 by smtp.gmail.com with ESMTPSA id
 pf10-20020a056214498a00b0068f914ac80bsm2104905qvb.50.2024.02.27.07.18.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Feb 2024 07:18:37 -0800 (PST)
Message-ID: <eeb3329b-0558-4237-8343-4e11f65a6a35@baylibre.com>
Date: Tue, 27 Feb 2024 16:18:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/18] ASoC: dt-bindings: mediatek,mt8365-afe: Add audio
 afe document
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
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
 <ce5f71a9-1b5f-4724-89db-dae2f64e8008@linaro.org>
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <ce5f71a9-1b5f-4724-89db-dae2f64e8008@linaro.org>
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



On 27/02/2024 10:01, Krzysztof Kozlowski wrote:
> On 26/02/2024 15:01, Alexandre Mergnat wrote:
>> Add MT8365 audio front-end bindings
>>
>> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
>> ---
>>   .../bindings/sound/mediatek,mt8365-afe.yaml        | 164 +++++++++++++++++++++
>>   1 file changed, 164 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/sound/mediatek,mt8365-afe.yaml b/Documentation/devicetree/bindings/sound/mediatek,mt8365-afe.yaml
>> new file mode 100644
>> index 000000000000..1d7eb2532ad2
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/sound/mediatek,mt8365-afe.yaml
>> @@ -0,0 +1,164 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/sound/mediatek,mt8365-afe.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: MediaTek AFE PCM controller for MT8365
>> +
>> +maintainers:
>> +  - Alexandre Mergnat <amergnat@baylibre.com>
>> +
>> +properties:
>> +  compatible:
>> +    const: mediatek,mt8365-afe-pcm
>> +
>> +  reg:
>> +    maxItems: 2
> 
> You must describe the items.

Actually, I've took downstream code that I'm not able to explain because 
the second reg isn't on my MTK documentation.
So I've remove the second reg and passed all functional tests 
successfully. Then I will remove the extra reg for v2.

> 
>> +
>> +  interrupts:
>> +    maxItems: 1
>> +
>> +  mediatek,topckgen:
>> +    $ref: /schemas/types.yaml#/definitions/phandle
>> +    description: The phandle of the mediatek topckgen controller
> 
> What for? Don't repeat the property name. Say something useful.

got it

> 
>> +
>> +  power-domains:
>> +    maxItems: 1
>> +
>> +  "#sound-dai-cells":
>> +    const: 0
>> +
>> +  clocks:
>> +    items:
>> +      - description: 26M clock
>> +      - description: mux for audio clock
>> +      - description: audio i2s0 mck
>> +      - description: audio i2s1 mck
>> +      - description: audio i2s2 mck
>> +      - description: audio i2s3 mck
>> +      - description: engen 1 clock
>> +      - description: engen 2 clock
>> +      - description: audio 1 clock
>> +      - description: audio 2 clock
>> +      - description: mux for i2s0
>> +      - description: mux for i2s1
>> +      - description: mux for i2s2
>> +      - description: mux for i2s3
>> +
>> +  clock-names:
>> +    items:
>> +      - const: top_clk26m_clk
>> +      - const: top_audio_sel
>> +      - const: audio_i2s0_m
>> +      - const: audio_i2s1_m
>> +      - const: audio_i2s2_m
>> +      - const: audio_i2s3_m
>> +      - const: engen1
>> +      - const: engen2
>> +      - const: aud1
>> +      - const: aud2
>> +      - const: i2s0_m_sel
>> +      - const: i2s1_m_sel
>> +      - const: i2s2_m_sel
>> +      - const: i2s3_m_sel
>> +
>> +  mediatek,i2s-shared-clock:
> 
> Why do you need this property? Linux (and other systems) handle sharing
> clocks properly.

Indeed, not needed. It was used by the downstream code driver but I 
remove it for v2.

> 
>> +    description:
>> +      i2s modules can share the same external clock pin.
>> +      If this property is not present the clock mode is separrate.
> 
> Typo
> 
>> +    type: boolean
>> +
>> +  mediatek,dmic-iir-on:
>> +    description:
>> +      Boolean which specifies whether the DMIC IIR is enabled.
>> +      If this property is not present the IIR is disabled.
> 
> "is enabled" or "enable it"?
> 
> You described the desired Linux feature or behavior, not the actual
> hardware. The bindings are about the latter, so instead you need to
> rephrase the property and its description to match actual hardware
> capabilities/features/configuration etc.

I will rephrase:

True to enable the Infinite Impulse Response (IIR) filter
on the digital microphone inputs.

> 
>> +    type: boolean
>> +
>> +  mediatek,dmic-irr-mode:
>> +    $ref: /schemas/types.yaml#/definitions/uint32
>> +    description:
>> +      Selects stop band of IIR DC-removal filter.
>> +      0 = Software programmable custom coeff loaded by the driver.
> 
> Bindings are for hardware, not drivers. Why is this a property of board DTS?

Actually this is a hardware feature. Mode 1 t 5 are predefined filters. 
Mode 0, the HW will read some "coef filter registers" to setup the 
custom filter. the "coef filter regs" are written by the driver. 
Currently the coef values are hardcoded in the driver.

> 
>> +      1 = 5Hz if 48KHz mode.
>> +      2 = 10Hz if 48KHz mode.
>> +      3 = 25Hz if 48KHz mode.
>> +      4 = 50Hz if 48KHz mode.
>> +      5 = 65Hz if 48KHz mode.
> 
> Use proper unit suffixes - hz.
> 
> 
>> +    enum:
>> +      - 0
>> +      - 1
>> +      - 2
>> +      - 3
>> +      - 4
>> +      - 5
>> +
>> +  mediatek,dmic-two-wire-mode:
>> +    description:
>> +      Boolean which turns on digital microphone for two wire mode.
>> +      If this property is not present the two wire mode is disabled.
> 
> This looks like hardware property, but the naming looks like SW. Again
> you instruct what driver should do. Standard disclaimer:
> 
> You described the desired Linux feature or behavior, not the actual
> hardware. The bindings are about the latter, so instead you need to
> rephrase the property and its description to match actual hardware
> capabilities/features/configuration etc.

Actually this is a hardware feature. This is ALL I have to describe the 
HW behavior from the datasheet:
"
bit name: ul_dmic_two_wire_ctl
Turns on digital microphone for two wire mode.
0: Turn off
1: Turn on
"

On the board schematic, SoC and DMIC and linked by 3 pins:
- clk
- data0
- data1

IMHO, "two-wire-mode" means the HW use 2 pins for data, and the SoC must 
be aware of that by reading the register value written by the driver, 
using the value found in the DTS.

I don't get why you think it wouldn't be hardware behavior.

Rephrase description:
"True to enable the two wire mode of the digital microphone"
Is it better ?

About the property name, "mediatek,dmic-two-wire-ctl" sound better for you ?

> 
> 
>> +    type: boolean
>> +
>> +
> 
> Just one blank line.
> 
>> +required:
>> +  - compatible
>> +  - reg
>> +  - interrupts
>> +  - power-domains
>> +  - mediatek,topckgen
>> +  - clocks
>> +  - clock-names
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/clock/mediatek,mt8365-clk.h>
>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>> +    #include <dt-bindings/interrupt-controller/irq.h>
>> +    #include <dt-bindings/power/mediatek,mt8365-power.h>
>> +
>> +    soc {
>> +        #address-cells = <2>;
>> +        #size-cells = <2>;
>> +
>> +        afe@11220000 {
> 
> What is AFE?

Audio Front End, this is the same name used for other MTK SoC, to be 
consistent.

Cook a new patch serie to change "afe" by "audio-controller" for all MTK 
SoC would be great.

> 
> https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation
> 
> 
>> +            compatible = "mediatek,mt8365-afe-pcm";
> 
> 
> Best regards,
> Krzysztof
> 

-- 
Regards,
Alexandre
