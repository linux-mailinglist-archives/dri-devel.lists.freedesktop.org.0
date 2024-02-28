Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B661086ABBA
	for <lists+dri-devel@lfdr.de>; Wed, 28 Feb 2024 10:57:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E97A10E893;
	Wed, 28 Feb 2024 09:57:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="lGBZZlxt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C853710E893
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Feb 2024 09:57:20 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-412a14299a4so29184515e9.1
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Feb 2024 01:57:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1709114239; x=1709719039;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=qg3bz6jhBZS7ET92hBbbxbLJcdz5hFSe7r4a1+zUYlM=;
 b=lGBZZlxtI1ii+dpv5cG4ltdQVd3Qds4e6xiN3lphFHIHlhmbToTK1UABb6blMIINIA
 q7X0Qw1yyYqLuNgctFoyQ1MKoCNsKNrSi3u5w0TSHLiN3/vpdEN631GHDmY1hAQnxmrM
 ktftDhAP/0ylSBTLNHNN++FzSk+dxxB0fUrjPI4HW2diktCrKj3CYuJgM1+ojFpyPNMc
 1GEfxVnyLmb9kL6dy3YxIUfm/lYYhlXBCX+7MPDS87+43qaUlx+80ISqoMYz+rr76bSQ
 G7T2+A8/8gCcneyolH7ds3MYkgkp1heft4/Y93RPQ+yPneALJO/z7zWLSPMDDd5Q1GfR
 YcXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709114239; x=1709719039;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qg3bz6jhBZS7ET92hBbbxbLJcdz5hFSe7r4a1+zUYlM=;
 b=kz4I3/s9K89Xn/aU2y82eb9b0D6XKqUEeaZ+qm5jjihMsuon037UfXLLvIOApSf3s6
 hPJnpoVAXtU21vyNviw03t2vzYk/hqrp9os3Z4muJA3RUD9MENRAsR9GInUX5XrU/rgE
 tKM5dVoMCDct/nocQ8SK/vMNHj8Y/+Yjn6owZWZHgW3zVso0LnJWA0oSyXyka0CiX4Qr
 5uuVeMrUTSEy2rM71qc+Vc9iz8y0hwzh97vx2WIucZZS2L8NM2t7KIdajdLA3qDlfyS+
 7MXG3YvlnPLzMtKsNIhXAZxeO3vdcw1J+E+WHzGso0LCuSLBIc74zemuODSue6YSul7d
 6MhA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWvNOJDlTZzKk36lDPPpMKwufNDUJ+5tY2HhVnuWwVmtpC8zwLMjZ5xPD6/zhIDJHnR9iubldE5szLOkNeKlt2idEmNPVomnd7luRQ81dmg
X-Gm-Message-State: AOJu0YxSs13lLvsOAHp2xlohAy35aE4VEbbT/093ZM/sIMHZyB/pK+Q+
 mchkjErSQ08Tho13mG4vubmFXgkchL1C5zvP8GdSVYPLkxE0Pey0JGqgJV4zjCA=
X-Google-Smtp-Source: AGHT+IGdYYc+4l8lA19KSveVtxa+iJnXttf25DgJgoEb24NGtWPvG7/6OUbeiGefYFJlE7T6JjPt3Q==
X-Received: by 2002:a05:600c:3b9d:b0:412:b623:bbcc with SMTP id
 n29-20020a05600c3b9d00b00412b623bbccmr529089wms.10.1709114238861; 
 Wed, 28 Feb 2024 01:57:18 -0800 (PST)
Received: from [192.168.1.172] ([93.5.22.158])
 by smtp.gmail.com with ESMTPSA id
 h17-20020a05600c351100b00412b3bf811bsm1537547wmq.8.2024.02.28.01.57.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Feb 2024 01:57:18 -0800 (PST)
Message-ID: <66e527af-0253-4565-9822-04ed84e5817c@baylibre.com>
Date: Wed, 28 Feb 2024 10:57:16 +0100
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
 <eeb3329b-0558-4237-8343-4e11f65a6a35@baylibre.com>
 <bd4bf6ae-350e-4ee6-a924-7dd31b2c6034@linaro.org>
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <bd4bf6ae-350e-4ee6-a924-7dd31b2c6034@linaro.org>
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

I think I got it.

- mediatek,i2s-shared-clock: will be remove from DT
- mediatek,dmic-iir-on: will be remove from DT
- mediatek,dmic-irr-mode: will be remove from DT
- mediatek,dmic-two-wire-mode: rephrase description needed

I've did abstraction (despite me) that IIR settings are runtime config 
because the driver implement its usage like a one-time-setup -_-'

Thanks for the explanations, that help.

Regards,
Alexandre

On 28/02/2024 08:28, Krzysztof Kozlowski wrote:
> On 27/02/2024 16:18, Alexandre Mergnat wrote:
>>>
>>>> +    type: boolean
>>>> +
>>>> +  mediatek,dmic-iir-on:
>>>> +    description:
>>>> +      Boolean which specifies whether the DMIC IIR is enabled.
>>>> +      If this property is not present the IIR is disabled.
>>>
>>> "is enabled" or "enable it"?
>>>
>>> You described the desired Linux feature or behavior, not the actual
>>> hardware. The bindings are about the latter, so instead you need to
>>> rephrase the property and its description to match actual hardware
>>> capabilities/features/configuration etc.
>>
>> I will rephrase:
>>
>> True to enable the Infinite Impulse Response (IIR) filter
>> on the digital microphone inputs.
> 
> I still don't know why this is DT-specific. You still tell driver what
> to do...
> 
>>
>>>
>>>> +    type: boolean
>>>> +
>>>> +  mediatek,dmic-irr-mode:
>>>> +    $ref: /schemas/types.yaml#/definitions/uint32
>>>> +    description:
>>>> +      Selects stop band of IIR DC-removal filter.
>>>> +      0 = Software programmable custom coeff loaded by the driver.
>>>
>>> Bindings are for hardware, not drivers. Why is this a property of board DTS?
>>
>> Actually this is a hardware feature. Mode 1 t 5 are predefined filters.
>> Mode 0, the HW will read some "coef filter registers" to setup the
>> custom filter. the "coef filter regs" are written by the driver.
>> Currently the coef values are hardcoded in the driver.
> 
> You don't get the point. Just because you choose some mode it does not
> mean is hardware feature for DT. Sampling frequency done by hardware is
> also "hardware feature", but do you put it to DT? No.
> 
> Explain why this is board-specific, not runtime configuration.
> 
>>
>>>
>>>> +      1 = 5Hz if 48KHz mode.
>>>> +      2 = 10Hz if 48KHz mode.
>>>> +      3 = 25Hz if 48KHz mode.
>>>> +      4 = 50Hz if 48KHz mode.
>>>> +      5 = 65Hz if 48KHz mode.
>>>
>>> Use proper unit suffixes - hz.
>>>
>>>
>>>> +    enum:
>>>> +      - 0
>>>> +      - 1
>>>> +      - 2
>>>> +      - 3
>>>> +      - 4
>>>> +      - 5
>>>> +
>>>> +  mediatek,dmic-two-wire-mode:
>>>> +    description:
>>>> +      Boolean which turns on digital microphone for two wire mode.
>>>> +      If this property is not present the two wire mode is disabled.
>>>
>>> This looks like hardware property, but the naming looks like SW. Again
>>> you instruct what driver should do. Standard disclaimer:
>>>
>>> You described the desired Linux feature or behavior, not the actual
>>> hardware. The bindings are about the latter, so instead you need to
>>> rephrase the property and its description to match actual hardware
>>> capabilities/features/configuration etc.
>>
>> Actually this is a hardware feature. This is ALL I have to describe the
>> HW behavior from the datasheet:
>> "
>> bit name: ul_dmic_two_wire_ctl
>> Turns on digital microphone for two wire mode.
>> 0: Turn off
>> 1: Turn on
> 
> That's rather suggestion it is not a description of hardware but you
> want driver to do something...
> 
>> "
>>
>> On the board schematic, SoC and DMIC and linked by 3 pins:
>> - clk
>> - data0
>> - data1
>>
>> IMHO, "two-wire-mode" means the HW use 2 pins for data, and the SoC must
>> be aware of that by reading the register value written by the driver,
>> using the value found in the DTS.
> 
> So this depends on type of connection of DMIC? Then rephrase description
> property like this.
> 
>>
>> I don't get why you think it wouldn't be hardware behavior.
> 
> Because telling what to write to the registers which is typical sign of
> people stuffing to DT whatever they need to configure the hardware.
> 
>>
>> Rephrase description:
>> "True to enable the two wire mode of the digital microphone"
>> Is it better ?
> 
> No, because again you describe some sort of mode. If you insist on such
> description, then my answer is: it's runtime, so not suitable for DT.
> Instead describe what is the hardware problem/configuration, e.g. "DMIC
> is connected with only CLK and DATA0, without third pin" etc.
> 
>>
>> About the property name, "mediatek,dmic-two-wire-ctl" sound better for you ?
> 
> To sound more like a register less like physical characteristic of the
> board? No. The name can stay, I don't have better ideas.
> 
> 
> Best regards,
> Krzysztof
> 

