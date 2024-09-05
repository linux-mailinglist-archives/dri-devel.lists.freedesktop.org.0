Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD74A96D2B8
	for <lists+dri-devel@lfdr.de>; Thu,  5 Sep 2024 11:05:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4ADD10E7B1;
	Thu,  5 Sep 2024 09:05:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="3gGs6dp6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C5A410E7B1
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Sep 2024 09:05:31 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-374c962e5adso264790f8f.1
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Sep 2024 02:05:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1725527130; x=1726131930;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=rXkGvmrzjaju+FFxdQOqUz86ayxWamYskoaBHAk4gpk=;
 b=3gGs6dp6a+a8uRYeq7au6wsKtkPHMAun54rtD8RS2CsgL+FevoLG45iILZwNDLMHAp
 7XLQ0UcoKkHYkKAnIFQDPjRcpW8r6EKSC8eSQSHqHFytceEzBpSsuWOtmKbe/TTGUfrP
 Kjp2QlR3aGcAfe1X382702ZFXVBHhuHA5aw+1VHWTpo9+HJCwtqE0GaJ27jOV6PbC1S3
 ETgcEE1zlNBQjzk9b3JIUM3Ju7B7cFIf5oUtJ/JtViBAV/OIY1JPKw7k0/WvNaU/2SAi
 jchvgKnjivg9BdaohGxfRjalYgf7Im80IJk2V3eXi7jaGWf3R9FeYODObU8LY1i5cE72
 rzXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725527130; x=1726131930;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=rXkGvmrzjaju+FFxdQOqUz86ayxWamYskoaBHAk4gpk=;
 b=mOhxl/CdXQ/9I7e+yaVUTlQZKRHT382yDXZaXtIuwXTt4ZNGHXce2majTjJraYXo7v
 gH2fAl3sf+ZAIxY1kxpINcjtkQNgnyj2ra3UEFhXj8EkxCpqZgzOYiYhCQNrpO9JRU8u
 wR3fWlwsh0HlY/aC32pNav0XBghK+6SC9y/hVEhloC/Z5qqmzsGjil/8Y5V8GoqY//qD
 a6V2C4WmGoo+0M04K8zjsWpvDTiU2yAGJWSPE9MjantuNnoJbt5slxCQgYO0vUanYskY
 SlzywAv38pW0rtcbYyM3PmfS2ElELRO/lfMfYp1Yoea1YV9uyQ+Les+M4lgsCBl24hit
 bVeQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVjwgPs1rK5VuLxDpV/cFZQb+IQheGDLGytpsW613P2c0RkiAbGxoDztrtDX+VZQdyzk/fZyugf5Ao=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywf858yhPKKngZS4icHC4tQLmtUNybN3r48juvo125vxegenfWK
 4myNpuSMi/SuWm50r0rPtlZfuITBCkBk3op6k0xsVXfpCah+elRz/iOIoCpULQ4=
X-Google-Smtp-Source: AGHT+IGs8OizwWXd/YtOsSddAZr8iCEdLMOuc1WNos7Odi5UIAAcNaDDCpxTzJfQ/Nko5h3HZKUMCg==
X-Received: by 2002:adf:e709:0:b0:374:c57e:1ea9 with SMTP id
 ffacd0b85a97d-3779b847aaamr3083162f8f.18.1725527129762; 
 Thu, 05 Sep 2024 02:05:29 -0700 (PDT)
Received: from [192.168.0.172] (88-127-185-239.subs.proxad.net.
 [88.127.185.239]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-375348df4e8sm7155523f8f.115.2024.09.05.02.05.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Sep 2024 02:05:29 -0700 (PDT)
Message-ID: <62bc8ee8-f23e-4cd3-a77a-74cb19e6530e@baylibre.com>
Date: Thu, 5 Sep 2024 11:05:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 12/16] ASoC: codecs: add MT6357 support
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Lee Jones <lee@kernel.org>, Flora Fu <flora.fu@mediatek.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 Nicolas Belin <nbelin@baylibre.com>
References: <20240226-audio-i350-v7-0-6518d953a141@baylibre.com>
 <20240226-audio-i350-v7-12-6518d953a141@baylibre.com>
 <c386c74c-9008-48ea-ad79-524eb85c370b@sirena.org.uk>
Content-Language: en-US
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <c386c74c-9008-48ea-ad79-524eb85c370b@sirena.org.uk>
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

Sorry, I'm gonna send a V8 to fix this ASAP

On 03/09/2024 19:14, Mark Brown wrote:
> On Mon, Jul 22, 2024 at 08:53:41AM +0200, amergnat@baylibre.com wrote:
>> From: Nicolas Belin <nbelin@baylibre.com>
>>
>> Add the support of MT6357 PMIC audio codec.
> 
> This breaks the build:
> 
> /build/stage/linux/sound/soc/codecs/mt6357.c: In function ‘mt6357_platform_driver_probe’:
> /build/stage/linux/sound/soc/codecs/mt6357.c:1824:55: error: too many arguments for format [-Werror=format-extra-args]
>   1824 |                 return dev_err_probe(&pdev->dev, ret, "Failed to parse dts\n", __func__);
>        |                                                       ^~~~~~~~~~~~~~~~~~~~~~~
> cc1: all warnings being treated as errors

-- 
Regards,
Alexandre
