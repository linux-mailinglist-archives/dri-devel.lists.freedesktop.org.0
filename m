Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B77DC86AE01
	for <lists+dri-devel@lfdr.de>; Wed, 28 Feb 2024 12:48:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 124DF10E5F2;
	Wed, 28 Feb 2024 11:48:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="kFlAEwSJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C444A10E5F2
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Feb 2024 11:48:08 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-40fd72f7125so42183585e9.1
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Feb 2024 03:48:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1709120886; x=1709725686;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=zu3ewqCG+5EQn7RzZWf4wxjkdVeCPYXJSPVh/ZEGpuY=;
 b=kFlAEwSJQzazjmxt+VwKF07ru07jgd2YZvswI8hEkEEMv8uNOm18BIdxdyJeUBSbjJ
 ZZqnWpvJYRonic+GVfO9pElwNwrCLyqtnnqZcRUZ92635Vo1j2wIUdiW+humOn073sWi
 qZQ/luierhkGhfyhMFpzUVE5Onno1gEOKzHV3MrUgtzeVmseGDT5+omzGIZHXCGvmhXb
 uVjF1QDfPmPE9cX1TwmSb+HVEqVzV8no9Ntoisi75Lj9nFBuIP5A3zHAZL33NHO4O27O
 hAuoD3uHfkCyIhGKOo7qmGmGfVDOm1WJD6qYgjxfgwLWyNcN3acQc8Ftt+LvOHSDHlq2
 7uGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709120886; x=1709725686;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zu3ewqCG+5EQn7RzZWf4wxjkdVeCPYXJSPVh/ZEGpuY=;
 b=jtEu7kXE7vgsm6c7Ti/1qg6HfJDpX7D9+975G8EzXrWUr63fT7ZzL1vh2W6xelrSG+
 7dZI7Aq1jtxLd9TH9PlnZhznG0NegVX6uE6+1wMHiHSzd+9RcrXrnmDhpvcumJGFis4F
 PSkmc8sffvI0DLUs9Gt7Y2Nbj2+MC+dMmwsa24tz2xP7lx38ZLzmI8rdw+Z29HJOH741
 uTPOq8sxvx3fhZJB9vtKcZoAOsWOR+OFqLAkshj4iTdvKICbtRXMO8s1ZGJJ1bU8VsCd
 W+BVTtIp6FRZjUjphStROjUPbCR++7dsmFjSlYGDejT7i6IFpDON83hcydPy5D4kRJ0g
 DY6Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVSwqMoyNNEwal24WXLaN5MaVgPbzHIk0X6wAWPUVVyaprTBs6hZsKAQrIEo/rvLzk/RHeBPWdBWNsOBDrsEbFq1T6nOGlfbcBaaB8BvNN5
X-Gm-Message-State: AOJu0YxAezq76b+AyBDhELBYutymXhUHpmbT0TJPbblp3YwsDzYuZHGp
 jjs9aqaX7JUBKkyCZPRItkwdHg4NVvJbJcSwwS4XywyIpviDnf2ZCz07xJaUgZU=
X-Google-Smtp-Source: AGHT+IEB/UQwleJbf7XKW6dc1tBjhAXHjTKhYWiBK169zurfst+bdJvN4ZyFBulks3zB3QHX3zW7pQ==
X-Received: by 2002:adf:fd44:0:b0:33d:277d:a2c7 with SMTP id
 h4-20020adffd44000000b0033d277da2c7mr7855219wrs.16.1709120886505; 
 Wed, 28 Feb 2024 03:48:06 -0800 (PST)
Received: from [192.168.1.172] ([93.5.22.158])
 by smtp.gmail.com with ESMTPSA id
 bo14-20020a056000068e00b0033d6bc17d0esm15009877wrb.74.2024.02.28.03.48.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Feb 2024 03:48:06 -0800 (PST)
Message-ID: <a4ba6a35-cfb4-4c3d-a9c7-ccd47d4c32d8@baylibre.com>
Date: Wed, 28 Feb 2024 12:48:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/18] ASoC: dt-bindings: mediatek,mt8365-afe: Add audio
 afe document
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
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
 <20240226-audio-i350-v1-1-4fa1cea1667f@baylibre.com>
 <ce5f71a9-1b5f-4724-89db-dae2f64e8008@linaro.org>
 <eeb3329b-0558-4237-8343-4e11f65a6a35@baylibre.com>
 <bd4bf6ae-350e-4ee6-a924-7dd31b2c6034@linaro.org>
 <66e527af-0253-4565-9822-04ed84e5817c@baylibre.com>
 <bb86b986-ecd7-416a-9036-082a3cff2176@collabora.com>
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <bb86b986-ecd7-416a-9036-082a3cff2176@collabora.com>
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



On 28/02/2024 11:25, AngeloGioacchino Del Regno wrote:
> Il 28/02/24 10:57, Alexandre Mergnat ha scritto:
>> I think I got it.
>>
>> - mediatek,i2s-shared-clock: will be remove from DT
>> - mediatek,dmic-iir-on: will be remove from DT
>> - mediatek,dmic-irr-mode: will be remove from DT
>> - mediatek,dmic-two-wire-mode: rephrase description needed
>>
>> I've did abstraction (despite me) that IIR settings are runtime config 
>> because the driver implement its usage like a one-time-setup -_-'
>>
> 
> Yes but just one more thing I just noticed: 
> `mediatek,dmic-two-wire-mode` - can we
> please rename this to `mediatek,dmic-mode` ?

Sure, I wasn't aware of this property. I will do it.

Note: the description isn't consistent with the enum comments
"
0 means two wires, 1 means one wire.
...
        - 0 # one wire
        - 1 # two wires
"

> 
> That'd be for consistency check mt6359.yaml and mt6358.txt
> 
>    mediatek,dmic-mode:
>      $ref: /schemas/types.yaml#/definitions/uint32
>      description: |
>        Indicates how many data pins are used to transmit two channels of 
> PDM
>        signal. 0 means two wires, 1 means one wire. Default value is 0.
>      enum:
>        - 0 # one wire
>        - 1 # two wires
> 
> Cheers,
> Angelo
> 
> 
> 
>> Thanks for the explanations, that help.
>>
>> Regards,
>> Alexandre
>>
>> On 28/02/2024 08:28, Krzysztof Kozlowski wrote:
>>> On 27/02/2024 16:18, Alexandre Mergnat wrote:
>>>>>
>>>>>> +    type: boolean
>>>>>> +
>>>>>> +  mediatek,dmic-iir-on:
>>>>>> +    description:
>>>>>> +      Boolean which specifies whether the DMIC IIR is enabled.
>>>>>> +      If this property is not present the IIR is disabled.
>>>>>
>>>>> "is enabled" or "enable it"?
>>>>>
>>>>> You described the desired Linux feature or behavior, not the actual
>>>>> hardware. The bindings are about the latter, so instead you need to
>>>>> rephrase the property and its description to match actual hardware
>>>>> capabilities/features/configuration etc.
>>>>
>>>> I will rephrase:
>>>>
>>>> True to enable the Infinite Impulse Response (IIR) filter
>>>> on the digital microphone inputs.
>>>
>>> I still don't know why this is DT-specific. You still tell driver what
>>> to do...
>>>
>>>>
>>>>>
>>>>>> +    type: boolean
>>>>>> +
>>>>>> +  mediatek,dmic-irr-mode:
>>>>>> +    $ref: /schemas/types.yaml#/definitions/uint32
>>>>>> +    description:
>>>>>> +      Selects stop band of IIR DC-removal filter.
>>>>>> +      0 = Software programmable custom coeff loaded by the driver.
>>>>>
>>>>> Bindings are for hardware, not drivers. Why is this a property of 
>>>>> board DTS?
>>>>
>>>> Actually this is a hardware feature. Mode 1 t 5 are predefined filters.
>>>> Mode 0, the HW will read some "coef filter registers" to setup the
>>>> custom filter. the "coef filter regs" are written by the driver.
>>>> Currently the coef values are hardcoded in the driver.
>>>
>>> You don't get the point. Just because you choose some mode it does not
>>> mean is hardware feature for DT. Sampling frequency done by hardware is
>>> also "hardware feature", but do you put it to DT? No.
>>>
>>> Explain why this is board-specific, not runtime configuration.
>>>
>>>>
>>>>>
>>>>>> +      1 = 5Hz if 48KHz mode.
>>>>>> +      2 = 10Hz if 48KHz mode.
>>>>>> +      3 = 25Hz if 48KHz mode.
>>>>>> +      4 = 50Hz if 48KHz mode.
>>>>>> +      5 = 65Hz if 48KHz mode.
>>>>>
>>>>> Use proper unit suffixes - hz.
>>>>>
>>>>>
>>>>>> +    enum:
>>>>>> +      - 0
>>>>>> +      - 1
>>>>>> +      - 2
>>>>>> +      - 3
>>>>>> +      - 4
>>>>>> +      - 5
>>>>>> +
>>>>>> +  mediatek,dmic-two-wire-mode:
>>>>>> +    description:
>>>>>> +      Boolean which turns on digital microphone for two wire mode.
>>>>>> +      If this property is not present the two wire mode is disabled.
>>>>>
>>>>> This looks like hardware property, but the naming looks like SW. Again
>>>>> you instruct what driver should do. Standard disclaimer:
>>>>>
>>>>> You described the desired Linux feature or behavior, not the actual
>>>>> hardware. The bindings are about the latter, so instead you need to
>>>>> rephrase the property and its description to match actual hardware
>>>>> capabilities/features/configuration etc.
>>>>
>>>> Actually this is a hardware feature. This is ALL I have to describe the
>>>> HW behavior from the datasheet:
>>>> "
>>>> bit name: ul_dmic_two_wire_ctl
>>>> Turns on digital microphone for two wire mode.
>>>> 0: Turn off
>>>> 1: Turn on
>>>
>>> That's rather suggestion it is not a description of hardware but you
>>> want driver to do something...
>>>
>>>> "
>>>>
>>>> On the board schematic, SoC and DMIC and linked by 3 pins:
>>>> - clk
>>>> - data0
>>>> - data1
>>>>
>>>> IMHO, "two-wire-mode" means the HW use 2 pins for data, and the SoC 
>>>> must
>>>> be aware of that by reading the register value written by the driver,
>>>> using the value found in the DTS.
>>>
>>> So this depends on type of connection of DMIC? Then rephrase description
>>> property like this.
>>>
>>>>
>>>> I don't get why you think it wouldn't be hardware behavior.
>>>
>>> Because telling what to write to the registers which is typical sign of
>>> people stuffing to DT whatever they need to configure the hardware.
>>>
>>>>
>>>> Rephrase description:
>>>> "True to enable the two wire mode of the digital microphone"
>>>> Is it better ?
>>>
>>> No, because again you describe some sort of mode. If you insist on such
>>> description, then my answer is: it's runtime, so not suitable for DT.
>>> Instead describe what is the hardware problem/configuration, e.g. "DMIC
>>> is connected with only CLK and DATA0, without third pin" etc.
>>>
>>>>
>>>> About the property name, "mediatek,dmic-two-wire-ctl" sound better 
>>>> for you ?
>>>
>>> To sound more like a register less like physical characteristic of the
>>> board? No. The name can stay, I don't have better ideas.
>>>
>>>
>>> Best regards,
>>> Krzysztof
>>>
>>
> 

-- 
Regards,
Alexandre
