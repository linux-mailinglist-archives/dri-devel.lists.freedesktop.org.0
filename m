Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 049A491623F
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jun 2024 11:23:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0582110E0C0;
	Tue, 25 Jun 2024 09:23:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="AXOZy/6Q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com
 [209.85.208.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 917EF10E245
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2024 09:23:07 +0000 (UTC)
Received: by mail-lj1-f179.google.com with SMTP id
 38308e7fff4ca-2eabd22d3f4so64586231fa.1
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2024 02:23:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1719307385; x=1719912185;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
 :cc:subject:date:message-id:reply-to;
 bh=LlRhdkp6kAFepHjID66aLvJv1DZVnaI5n6pLIDvUVYM=;
 b=AXOZy/6Q5OKyC7yS5/rJbKNuXCZ/EVNKwXbFpTSZpGojUpcXiJtLL7l9gUzgH6jaSA
 w01bgtRxyezx+qzzoNMaPKGXPobmaw3WgPylOLnLEn1L/Qbi6Zum+dWEhYfFvyH6Qh68
 rsRerOdqtzlCgJCoVbi4GEtnL2nj9Q3EN8eFJvl62wHSH8sdVfkm0VsVgbNJYwEtj5s6
 46GUYuqTe0aYEcxbEzPD9NHjP0B2BRNbSVwekIBnDFKBPrGHXL25NCpQ9O3jHAQ2Or/T
 6/FccB53lvd0UUqj5dofPb5JwgnvWWRFjzNdNNYN3261NF5EngYX0w2MSbhNT7h66/os
 JFpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719307385; x=1719912185;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:subject:from:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=LlRhdkp6kAFepHjID66aLvJv1DZVnaI5n6pLIDvUVYM=;
 b=e7zmJhxI6PnvKzdc2MAQiVOvQbOQWKulwsul/jU9O7zAbxoxCSMIJqBRaFACu2glbf
 DaVCdQ4CUTFt4TcNORtTLMgfHZDoQ85tWWR+XZ4gyI9W2pYlpezVtYZ1VidFQ+SWyVSA
 swDlQL+lr7xzB0EKoTu5v77rmmAp2qwKdKzviq0o4GrXHifcEQVaCpL+Jj//T4Hg6gX3
 AZzqIT6nYEibfUfLDTtCD763Z8isQS4kZZOJll7KKAgZSXlRDe9VD7hT/zH1WxV+Z/vF
 G2mgc4uY7y2S8nlrIQxxPjKZWibvlOyGObwi7pvwixZDdshUPq1dOFAiQ+ox1bJBUwq9
 Cz3g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWe0B8lKJgXJ37A2C4JqxVVkZkqaWintaRDeAlPVoIm2l7et+gvN+mbVy+ibghNeEyhPlzXVSf+mXAOKsd8ZF/VCG+BlygWGQNwSDShS1Kt
X-Gm-Message-State: AOJu0YyNamohFeKXMbFpf6ntlQ0YT/KTLNL8TGmqrv5jBr2nNere9Z7w
 BarZ/C8cEjzC1ODhf9UjLrx/K0KTn+/7o9cOTWeDnbfg9yzbdgL0jOIY8IpFtmg=
X-Google-Smtp-Source: AGHT+IETSGc5PC+/KSXGB7oMPpuYoRZNE+bp/p6Mqr9WgOryoy8prGpDjhg+IZxxEgRRH3Pn20MxJA==
X-Received: by 2002:a05:6512:3e24:b0:52c:dff5:8087 with SMTP id
 2adb3069b0e04-52ce185f998mr5011614e87.51.1719307384919; 
 Tue, 25 Jun 2024 02:23:04 -0700 (PDT)
Received: from [192.168.1.172] ([93.5.22.158])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-366f624cdacsm4476317f8f.70.2024.06.25.02.23.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Jun 2024 02:23:04 -0700 (PDT)
Message-ID: <95bab90f-b196-4e79-bb88-7fd534cca721@baylibre.com>
Date: Tue, 25 Jun 2024 11:23:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Alexandre Mergnat <amergnat@baylibre.com>
Subject: Re: [PATCH v6 03/16] dt-bindings: mfd: mediatek: Add codec property
 for MT6357 PMIC
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
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
References: <20240226-audio-i350-v6-0-f754ec1a7634@baylibre.com>
 <20240226-audio-i350-v6-3-f754ec1a7634@baylibre.com>
 <cd190d35-1658-43d8-9606-5e73257bbf3a@linaro.org>
Content-Language: en-US
In-Reply-To: <cd190d35-1658-43d8-9606-5e73257bbf3a@linaro.org>
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



On 21/06/2024 17:00, Krzysztof Kozlowski wrote:
> On 19/06/2024 16:46, Alexandre Mergnat wrote:
>> Add the audio codec sub-device. This sub-device is used to set the
>> optional voltage values according to the hardware.
>> The properties are:
>>    - Setup of microphone bias voltage.
>>    - Setup of the speaker pin pull-down.
>>
>> Also, add the audio power supply property which is dedicated for
>> the audio codec sub-device.
>>
>> Signed-off-by: Alexandre Mergnat<amergnat@baylibre.com>
>> ---
>>   .../devicetree/bindings/mfd/mediatek,mt6357.yaml   | 33 ++++++++++++++++++++++
>>   1 file changed, 33 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/mfd/mediatek,mt6357.yaml b/Documentation/devicetree/bindings/mfd/mediatek,mt6357.yaml
>> index 37423c2e0fdf..d95307393e75 100644
>> --- a/Documentation/devicetree/bindings/mfd/mediatek,mt6357.yaml
>> +++ b/Documentation/devicetree/bindings/mfd/mediatek,mt6357.yaml
>> @@ -37,6 +37,32 @@ properties:
>>     "#interrupt-cells":
>>       const: 2
>>   
>> +  vaud28-supply:
>> +    description: 2.8 volt supply phandle for the audio codec
>> +
>> +  audio-codec:
>> +    type: object
> Still not much improved. You do not have any resources there, so these
> should go to the parent node.

Hi Krzysztof,

vaud28-supply seems to be a mistake that I forward port.
In the V4, AFAII, your feedback [1] suggested me to move the vaud28-supply from the "audio-codec" 
sub-node to the parent node, which for me is the "pmic" (mfd), because the property is considered as 
power-supply.

     pwrap {
         pmic {
             ...
             audio-codec {
                 ...

Hardware side, vaud28-supply is the output of PMIC-regulator subsystem, and AVDD28 is the input of 
PMIC-audio-codec subsystem. Then:
- The property name is wrong and must be change to AVDD28, which is a consumer (power input), not a 
power-supply. => description: 2.8 volt power input for microphones (AU_VIN0, AU_VIN1, AU_VIN2)
- IMHO, move this property to the next parent (pwrap) isn't consistent. It should be moved back to 
Documentation/devicetree/bindings/mfd/mediatek,mt6357.yaml (Done in the V4) into audio-codec 
substystem, beside mediatek,micbias0-microvolt

Does this sound good to you ?

-- 
Regards,
Alexandre
