Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 921B8868D6B
	for <lists+dri-devel@lfdr.de>; Tue, 27 Feb 2024 11:23:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68D0C10E446;
	Tue, 27 Feb 2024 10:23:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="w25SYSz6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f171.google.com (mail-il1-f171.google.com
 [209.85.166.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8617D10E446
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Feb 2024 10:23:35 +0000 (UTC)
Received: by mail-il1-f171.google.com with SMTP id
 e9e14a558f8ab-3657c437835so7666825ab.2
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Feb 2024 02:23:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1709029414; x=1709634214;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=wRDnUl47SBcmf8gVz+t2ubWEYD6TUCpoZIdH8z+nNoU=;
 b=w25SYSz6BIqYAkwMmO4WPxYQUd543L6kt8NvHt6EnT7zwFVKnWII+TyLf7OtDo6CTa
 IIMEYq+/mryFKW6eKBwWK1+0ow1IUZ60Kz9j/yDybLoHwR3Cm9kXVt0AyEH98ldjhn4b
 fmK/plX7HbnBD0bYHY5TpaOMEmxJPbzpnrQKZI8WjiW+aLy2oASmWHqjQVlRZKqVU5en
 LyJFsBbottWHZMiaaYfiCw8ODkBertIVltoDR13jd2ynoH+2pNSh1RLLFcxK73Cwvxpw
 wNhox54yvCLlO1+yItPm8tRl7IFmsT7zvQVCrUyxv1f6kC2kej4WMZUHYiGQSFUHDCXj
 9GqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709029414; x=1709634214;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wRDnUl47SBcmf8gVz+t2ubWEYD6TUCpoZIdH8z+nNoU=;
 b=NBYF0UqYYkFrKvQTuuAlfNEyGv7Tu2USVqlKqgWTwQbzUqYbBtDXxKYUaIdg0R0XE5
 m3+iEQpRJ50LW8xvot4lKKaqcL3NLFyj+zF5BdgVGFKCgVv+nzZZo2mGcSE0kHB/Kneh
 YMkI8zMZFYM+GLSXuCg19NszBcEO9FtGBGPvPjRF9TAlQvuPi2Lg4n61rsC/1boWPtYx
 2G4T7n/YHF4Xc4a4kPUKB+MCJNkn+MJO63HDSKnM/LxZsX3RE2LLCxbcQndQQFi/zcuH
 2GffOrhizxYk5HEYc87MDZW167z5cwpixMUrZBTmaHtPsH/XwbrYUAxxpjFuxdImh202
 ZHCg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXcSYcAFniI+Vuz058nD5AyFyvgEBr5POgvhPJlPmrEH6aC2Z3+jRjmD+MMMS1IGEhC4C4OCylyuSzFQEXhW2kxeoIXXXEeOzrEGkpp5RNC
X-Gm-Message-State: AOJu0Ywsc/oc2SxbGMzm2dTkMfiTdVICXojKmvI0h5NjywyZeRbL68Ty
 7Iujr+97QZQcNSF9EjldXpK28BLPMCm2UQU/O2nUaDP2IlduLm/n3UhcFbRkB+Q=
X-Google-Smtp-Source: AGHT+IFlwjkngqWStTBwNfi9zv2j3kwATePJOcv87F/BtVt3qeg8VtNnjQ+1xDPzFY8KBNxxoIwTKw==
X-Received: by 2002:a05:6e02:e10:b0:365:1b7c:670 with SMTP id
 a16-20020a056e020e1000b003651b7c0670mr7885060ilk.8.1709029414201; 
 Tue, 27 Feb 2024 02:23:34 -0800 (PST)
Received: from [192.168.1.172] ([93.5.22.158])
 by smtp.gmail.com with ESMTPSA id
 p6-20020a92c606000000b003642dacafa5sm2063105ilm.29.2024.02.27.02.23.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Feb 2024 02:23:33 -0800 (PST)
Message-ID: <92b9e9ac-6265-4611-888d-ba74bb871be5@baylibre.com>
Date: Tue, 27 Feb 2024 11:23:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/18] ASoC: dt-bindings: mediatek,mt8365-mt6357: Add
 audio sound card document
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Lee Jones <lee@kernel.org>,
 Flora Fu <flora.fu@mediatek.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
References: <20240226-audio-i350-v1-0-4fa1cea1667f@baylibre.com>
 <20240226-audio-i350-v1-2-4fa1cea1667f@baylibre.com>
 <e15fdb18-d4de-495f-b90b-ba0e787cbef4@collabora.com>
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <e15fdb18-d4de-495f-b90b-ba0e787cbef4@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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



On 26/02/2024 16:30, AngeloGioacchino Del Regno wrote:
> Il 26/02/24 15:01, Alexandre Mergnat ha scritto:
>> Add soundcard bindings for the MT8365 SoC with the MT6357 audio codec.
>>
>> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
>> ---
>>   .../bindings/sound/mediatek,mt8365-mt6357.yaml     | 127 
>> +++++++++++++++++++++
>>   1 file changed, 127 insertions(+)
>>
>> diff --git 
>> a/Documentation/devicetree/bindings/sound/mediatek,mt8365-mt6357.yaml 
>> b/Documentation/devicetree/bindings/sound/mediatek,mt8365-mt6357.yaml
>> new file mode 100644
>> index 000000000000..f469611ec6b6
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/sound/mediatek,mt8365-mt6357.yaml
>> @@ -0,0 +1,127 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/sound/mediatek,mt8365-mt6357.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Mediatek MT8365 sound card with MT6357 sound codec.
>> +
>> +maintainers:
>> +  - Alexandre Mergnat <amergnat@baylibre.com>
>> +
>> +description:
>> +  This binding describes the MT8365 sound card.
>> +
>> +properties:
>> +  compatible:
>> +    const: mediatek,mt8365-mt6357
>> +
>> +  mediatek,hp-pull-down:
>> +    description:
>> +      Earphone driver positive output stage short to the
>> +      audio reference ground.
>> +      Default value is false.
>> +    type: boolean
>> +
>> +  mediatek,micbias0-microvolt:
>> +    description: |
> 
> description: Selects MIC Bias 0 output voltage
> 
>> +      Selects MIC Bias 0 output voltage.
>> +      [1.7v, 1.8v, 1.9v, 2.0v, 2.1v, 2.5v, 2.6v, 2.7v]
>> +    enum: [0, 1, 2, 3, 4, 5, 6, 7]
> 
> No, you don't say 0 1 2 3 4 to a property that says "microvolt", that's 
> simply
> wrong.
> 
> mediatek,micbias0-microvolt = <2100000>;
> 
> ...so you want a binding that says
> enum: [ 1700000, 1800000, this, that, 2700000]
> 

Is it correct if I put "description: Selects MIC Bias 0 output voltage 
index" ?

>> +
>> +  mediatek,micbias1-microvolt:
>> +    description: |
>> +      Selects MIC Bias 1 output voltage.
>> +      [1.7v, 1.8v, 1.9v, 2.0v, 2.1v, 2.5v, 2.6v, 2.7v]
>> +    enum: [0, 1, 2, 3, 4, 5, 6, 7]
> 
> same here.
> 
>> +
>> +  mediatek,platform:
>> +    $ref: /schemas/types.yaml#/definitions/phandle
>> +    description: The phandle of MT8365 ASoC platform.
>> +
>> +  pinctrl-names:
>> +    minItems: 1
>> +    items:
>> +      - const: aud_default
>> +      - const: aud_dmic
>> +      - const: aud_miso_off
>> +      - const: aud_miso_on
>> +      - const: aud_mosi_off
>> +      - const: aud_mosi_on
>> +
>> +  vaud28-supply:
>> +    description:
>> +      2.8 volt supply for the audio codec
>> +
>> +patternProperties:
>> +  "^dai-link-[0-9]+$":
>> +    type: object
>> +    description:
>> +      Container for dai-link level properties and CODEC sub-nodes.
>> +
>> +    properties:
>> +      codec:
>> +        type: object
>> +        description: Holds subnode which indicates codec dai.
>> +
>> +        properties:
>> +          sound-dai:
>> +            maxItems: 1
>> +            description: phandle of the codec DAI
>> +
>> +        additionalProperties: false
>> +
>> +      link-name:
>> +        description:
>> +          This property corresponds to the name of the BE dai-link to 
>> which
>> +          we are going to update parameters in this node.
>> +        items:
>> +          const: 2ND I2S BE
>> +
>> +      sound-dai:
>> +        maxItems: 1
>> +        description: phandle of the CPU DAI
>> +
>> +    additionalProperties: false
>> +
>> +    required:
>> +      - link-name
>> +      - sound-dai
>> +
>> +additionalProperties: false
>> +
>> +required:
>> +  - compatible
>> +  - mediatek,platform
>> +  - pinctrl-names
>> +  - vaud28-supply
>> +
>> +examples:
>> +  - |
>> +    sound {
>> +        compatible = "mediatek,mt8365-mt6357";
>> +        mediatek,platform = <&afe>;
> 
> Please:
> 
> https://docs.kernel.org/devicetree/bindings/dts-coding-style.html

Is it about the wrong pinctrl-names tab alignment ?
Also, 2ND I2S BE => 2ND_I2S_BE ?
Otherwise, I don't get it sorry.

> 
> Regards,
> Angelo
> 
>> +        pinctrl-names = "aud_default",
>> +            "aud_dmic",
>> +            "aud_miso_off",
>> +            "aud_miso_on",
>> +            "aud_mosi_off",
>> +            "aud_mosi_on";
>> +        pinctrl-0 = <&aud_default_pins>;
>> +        pinctrl-1 = <&aud_dmic_pins>;
>> +        pinctrl-2 = <&aud_miso_off_pins>;
>> +        pinctrl-3 = <&aud_miso_on_pins>;
>> +        pinctrl-4 = <&aud_mosi_off_pins>;
>> +        pinctrl-5 = <&aud_mosi_on_pins>;
>> +        vaud28-supply = <&mt6357_vaud28_reg>;
>> +
>> +        /* hdmi interface */
>> +        dai-link-0 {
>> +            sound-dai = <&afe>;
>> +            link-name = "2ND I2S BE";
>> +
>> +            codec {
>> +                sound-dai = <&it66121hdmitx>;
>> +            };
>> +        };
>> +    };
>>
> 

-- 
Regards,
Alexandre
