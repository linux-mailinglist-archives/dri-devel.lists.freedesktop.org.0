Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35635868DA5
	for <lists+dri-devel@lfdr.de>; Tue, 27 Feb 2024 11:31:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E792710E8DA;
	Tue, 27 Feb 2024 10:31:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="hZnXJWF/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com
 [209.85.208.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2FEA10F2F9
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Feb 2024 10:31:36 +0000 (UTC)
Received: by mail-ed1-f48.google.com with SMTP id
 4fb4d7f45d1cf-563bb51c36eso4449402a12.2
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Feb 2024 02:31:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1709029895; x=1709634695; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=f4iudg19y7abzrO0HKBUX7Faev1tIapQqDvDX8vbZQo=;
 b=hZnXJWF/Jx7UPJ0+iJWDrrK0ui9su+m3aqcnETw7INtkgvJQQLZY4OtxKkK2BS4JpU
 zyj4GM7zXqoePnADh5L1ybPb9S5tqCyVOQ+E+YhtUcnqY58S6aZQaylz5nDmNIKYKgbx
 8YhyVGgjADOc1zVFqe3O64Fe46vz6GYjifPpptxgJJ+vQvamAw5nEFoAh6BaiYERv33Y
 UJeBdoYzcE4pZGaZXvgRKwjuVSewoKb26sJBJ2YtFFhU1A1JAkL5aI8LC2YkEKHXINt9
 A9FgekfIqPUodCKGDMB5FQ+WH27APXexuqqsb3MmNpi9zA66D7DhY2ZK8p/d/XzNYL8G
 yPog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709029895; x=1709634695;
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=f4iudg19y7abzrO0HKBUX7Faev1tIapQqDvDX8vbZQo=;
 b=HMVDZ44KgPflkBK4SxhvoxLXj09tUe7xKa6kIZemSGi8NZbRRfNa8/ddRwoAtd1UWh
 0wOmAKQaisL8LqijN+ca+/dgdWvSn4C02J0movG9AosfzmuZHmQwKgmaK/t0pBCy/dE6
 9ZcA7Pc9wK78hgbb4+Q3lfGwTRP+4EjXdABFwEvNYyzkk9yp2qeQKUZ/NlB4wLY7DONe
 MXxJv/V9vp6XiHrJ3+2FbqzjNYnconVzAi70qFzFtMwM23WmwRZmkRy8cV9vXGSW3VVH
 S51guFaeosxT5pxuj6GS30o+x85drEzUOxOdOVLWkVyMycvjFeHnTgdsLOZb8Y6gp2gs
 kJwg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUEA8G/2gOLaqc5r+q9cPoO6944HwT6XjELgjLQJV+ATSL8f2ZAVdL8z6ZWgww8w/naPqtjFlBIBWsA7UEIWLQSpfegKRRFr9RQWWqwAT9k
X-Gm-Message-State: AOJu0Yyt8X0v49UCYb6+5DTS7iuTlHp3Kmowhsipsmf4LCMRRIQTdDPK
 LQ39FRdGb8oRelLobPLRKzFu61Tyws6Zn77Z/iUj1dnaOnsDD+Vz79xEqJgMqbE=
X-Google-Smtp-Source: AGHT+IEEl8fKy5C7l5uepTiAwXSRMBRmCGJ06jeVF6eHUMlxJ3GqL+ZGbydOs4ZuhukC+mSJM7jiog==
X-Received: by 2002:a05:6402:2059:b0:563:c54e:f1 with SMTP id
 bc25-20020a056402205900b00563c54e00f1mr6442198edb.2.1709029894862; 
 Tue, 27 Feb 2024 02:31:34 -0800 (PST)
Received: from [192.168.1.20] ([178.197.222.116])
 by smtp.gmail.com with ESMTPSA id
 ev19-20020a056402541300b005661b5884adsm622854edb.27.2024.02.27.02.31.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Feb 2024 02:31:34 -0800 (PST)
Message-ID: <282ca3d6-b403-4378-8dc2-8e1d09fdf7c9@linaro.org>
Date: Tue, 27 Feb 2024 11:31:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/18] ASoC: dt-bindings: mediatek,mt8365-mt6357: Add
 audio sound card document
Content-Language: en-US
To: Alexandre Mergnat <amergnat@baylibre.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
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
 <92b9e9ac-6265-4611-888d-ba74bb871be5@baylibre.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <92b9e9ac-6265-4611-888d-ba74bb871be5@baylibre.com>
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

On 27/02/2024 11:23, Alexandre Mergnat wrote:
>>> +
>>> +examples:
>>> +  - |
>>> +    sound {
>>> +        compatible = "mediatek,mt8365-mt6357";
>>> +        mediatek,platform = <&afe>;
>>
>> Please:
>>
>> https://docs.kernel.org/devicetree/bindings/dts-coding-style.html
> 
> Is it about the wrong pinctrl-names tab alignment ?
> Also, 2ND I2S BE => 2ND_I2S_BE ?
> Otherwise, I don't get it sorry.

Alignment of continued lines, order of properties.

Best regards,
Krzysztof

