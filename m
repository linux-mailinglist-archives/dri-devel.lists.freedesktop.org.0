Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EA76917AFB
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2024 10:30:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 574D410E7BE;
	Wed, 26 Jun 2024 08:30:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="Y4LNMK7O";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
 [209.85.167.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B8FD10E7BE
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2024 08:30:05 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id
 2adb3069b0e04-52cdbc20faeso5655484e87.1
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2024 01:30:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1719390603; x=1719995403;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=yyQdICgaO84yFawHrHyVyr2QToU/+XJGR839rOrXaR0=;
 b=Y4LNMK7OotHXXbNLBiCax7DWzNAtyLYVVNxqx226molbNxiaOydOj7uvjsddtghk4+
 m/X0nem1RfJ1zysQyXn1gFFVTW9TNHo5lgjVf0ym93a3PakcOVTGMEZSXeFzTvgXsD7B
 Wm4ntku5JW2Y1JJjRI4tFCnH0O4ckXnnj+qa8Joh4A8xK6y6Vggydwk+WvFnOTupSshc
 8OGUBj8dbjSqal9Nfj+6feiSit0llM7NXtxneJQlK5Xb9Ut+DsYla0RW2YcuB0qKHIZk
 7uzocNvJlNQ83zAoXxKmZAKOkSHll7sSUhBr17I3CaFJDtt6yK0n+A32/+FXVZbwpU5d
 +JhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719390603; x=1719995403;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=yyQdICgaO84yFawHrHyVyr2QToU/+XJGR839rOrXaR0=;
 b=ORS3yjTTRUV7q0ScNEGETvjTSfarlMpU3NsuDFlInB6rFncosnIRb5XgbcdgwcY62J
 5X0dnIjBqiJlmeBuf+jwZF9+8aJukeYqG8zxXFtWUur3gdfkt1WDWA9cvILKnlRSqeaa
 L+sRPrm4Ftih9tHOWwFRae+jMPnk9iG0rl15Zhjwf7iGSF6Ij7a0iBLhngxWvWy1yYSJ
 o+RNHZKL9gT1Hbl8cSn2P9XzgWk5z2vSQKL8sMMHOJvIviaLETYd4tEaQYVuqsqgYdI4
 cbxKHlsVirswdM81grC3SYhDqGVHkX2jyVNbGZ2Blo5ybeyPM1MHJYz1TRpGzSZUST3q
 RW9w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUPAb0NVZKUEBvBDfseKMOYnYrPH/NP3aRNJ5LoJzJbVZdETK86iRyKAI5lwMQ3Yi1meS6IFwoI48/Sc/RJ85dcOdUN5Ix6GuiJ2INXfZu4
X-Gm-Message-State: AOJu0Yx5Pt5Ro2zrQP8MGtzIA4AKNI/GMzGo3yi//KJ8kc4d82JQw05i
 DAIuXondkhZIDxlUTEECYuncj0Mlo98T4TdLhFG+WziLn1YdiNFsBfRDPDjsb8U=
X-Google-Smtp-Source: AGHT+IEca5cJU5ZW212x9C2okoEwkWZvRgPivrrUuJX0Y9+4JhwZuZye4d1Yr/SDCtFZrF/eM34AgA==
X-Received: by 2002:a05:6512:607:b0:52c:d84b:93b2 with SMTP id
 2adb3069b0e04-52ce18341f9mr5698467e87.15.1719390603394; 
 Wed, 26 Jun 2024 01:30:03 -0700 (PDT)
Received: from [192.168.1.172] ([93.5.22.158])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-424c84245f0sm16687705e9.33.2024.06.26.01.30.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Jun 2024 01:30:03 -0700 (PDT)
Message-ID: <79811fff-4fdf-4121-9cea-6ed7e1329dad@baylibre.com>
Date: Wed, 26 Jun 2024 10:30:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 03/16] dt-bindings: mfd: mediatek: Add codec property
 for MT6357 PMIC
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
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
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
References: <20240226-audio-i350-v6-0-f754ec1a7634@baylibre.com>
 <20240226-audio-i350-v6-3-f754ec1a7634@baylibre.com>
 <cd190d35-1658-43d8-9606-5e73257bbf3a@linaro.org>
 <95bab90f-b196-4e79-bb88-7fd534cca721@baylibre.com>
 <5c9ab5bf-95f2-4195-8797-335010223aac@kernel.org>
Content-Language: en-US
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <5c9ab5bf-95f2-4195-8797-335010223aac@kernel.org>
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



On 25/06/2024 15:44, Krzysztof Kozlowski wrote:
> On 25/06/2024 11:23, Alexandre Mergnat wrote:
>>
>>
>> On 21/06/2024 17:00, Krzysztof Kozlowski wrote:
>>> On 19/06/2024 16:46, Alexandre Mergnat wrote:
>>>> Add the audio codec sub-device. This sub-device is used to set the
>>>> optional voltage values according to the hardware.
>>>> The properties are:
>>>>     - Setup of microphone bias voltage.
>>>>     - Setup of the speaker pin pull-down.
>>>>
>>>> Also, add the audio power supply property which is dedicated for
>>>> the audio codec sub-device.
>>>>
>>>> Signed-off-by: Alexandre Mergnat<amergnat@baylibre.com>
>>>> ---
>>>>    .../devicetree/bindings/mfd/mediatek,mt6357.yaml   | 33 ++++++++++++++++++++++
>>>>    1 file changed, 33 insertions(+)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/mfd/mediatek,mt6357.yaml b/Documentation/devicetree/bindings/mfd/mediatek,mt6357.yaml
>>>> index 37423c2e0fdf..d95307393e75 100644
>>>> --- a/Documentation/devicetree/bindings/mfd/mediatek,mt6357.yaml
>>>> +++ b/Documentation/devicetree/bindings/mfd/mediatek,mt6357.yaml
>>>> @@ -37,6 +37,32 @@ properties:
>>>>      "#interrupt-cells":
>>>>        const: 2
>>>>    
>>>> +  vaud28-supply:
>>>> +    description: 2.8 volt supply phandle for the audio codec
>>>> +
>>>> +  audio-codec:
>>>> +    type: object
>>> Still not much improved. You do not have any resources there, so these
>>> should go to the parent node.
>>
>> Hi Krzysztof,
>>
>> vaud28-supply seems to be a mistake that I forward port.
>> In the V4, AFAII, your feedback [1] suggested me to move the vaud28-supply from the "audio-codec"
>> sub-node to the parent node, which for me is the "pmic" (mfd), because the property is considered as
>> power-supply.
>>
>>       pwrap {
>>           pmic {
>>               ...
>>               audio-codec {
>>                   ...
>>
>> Hardware side, vaud28-supply is the output of PMIC-regulator subsystem, and AVDD28 is the input of
>> PMIC-audio-codec subsystem. Then:
>> - The property name is wrong and must be change to AVDD28, which is a consumer (power input), not a
>> power-supply. => description: 2.8 volt power input for microphones (AU_VIN0, AU_VIN1, AU_VIN2)
>> - IMHO, move this property to the next parent (pwrap) isn't consistent. It should be moved back to
>> Documentation/devicetree/bindings/mfd/mediatek,mt6357.yaml (Done in the V4) into audio-codec
>> substystem, beside mediatek,micbias0-microvolt
> 
> I don't understand why do we talk again about supply. My comment was not
> under the supply.

Because your word are:
"
And now you should see how odd it looks. Supplies are part of entire
chip, not subblock, even if they supply dedicated domain within that chip.

That's why I asked to put it in the parent node.
"

My bad, I forgot to link you the old message in my previous answer [1]

[1] https://lore.kernel.org/all/6d21da37-8be7-467c-8878-d57af0b0201b@kernel.org/#t

-- 
Regards,
Alexandre
