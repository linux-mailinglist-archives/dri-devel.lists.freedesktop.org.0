Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03F738796D4
	for <lists+dri-devel@lfdr.de>; Tue, 12 Mar 2024 15:50:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6200310E484;
	Tue, 12 Mar 2024 14:50:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="Tqq6DNn+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
 [209.85.167.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 073A110E484
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Mar 2024 14:50:21 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id
 2adb3069b0e04-51320ca689aso4830807e87.2
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Mar 2024 07:50:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1710255020; x=1710859820;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=cdxOToZtr3MgG8M5yCGfJbtM/oXC1jGaY0CYXkO7JjE=;
 b=Tqq6DNn+cJNcoxgasPGVegwwWcUWeDvrr7NmK8Y3SYTcjI1S5ocjF/2+fOxuDO7HdO
 EXLRQgtKfc+NezeW2aGVvXdXklBd8ob9qkJSs8FF5zmPJ4EZIdCDDYnioCkee6lvNyuK
 9NvQcBBbGDfKbbV6y0UOwDhaD2wGlZ6yh9eErZjCZ+cdJvtsQy4fQs0tzPCalov8PWjN
 acaqJwrn+8vK796LEiUo6RS8pEmz0Q2YUk1/t+4UJ6DbZQU09BAyPYJJ2uXycDMkIOPM
 P1EdPbr1j4o1sARmQiZfDY2Y4UcOwGUaBBODLBD3hFQLOzJ6HbRxnOMB6H4uCkIbysRx
 QHnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710255020; x=1710859820;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=cdxOToZtr3MgG8M5yCGfJbtM/oXC1jGaY0CYXkO7JjE=;
 b=hSv73dFBdjrYLxRTh2G0HDGcBwvDTbxOA/cHKiS0m1+H07Zm68B5X89/VW/gLb4k8S
 /Km59FRpiKJUHa+zbwxSPZTLhrRCYjKA4LEhDkjKu+PS7P7a856ib+d2Y0FXVnncb01N
 rRrub9Pvh+F6zKG21ds6n1/bDB7yPm+yq3H9Jduy/4rB5Y4t/M5Q0s/ouDM7mA3vLOaJ
 ETWjOkUqpbeZABX+F6nK8fDtHV9zGWJJtrZ/I1/HeVzDXBeK09gjQqKgWWkF5JcA+1Xo
 KW75BphcmEEv67YPbQhNXrz+jS0ONkPVR9nTntK5Esm2W/NRvTwSHtx6ura9Zg3QOnB1
 wg/Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUVohrGml5Udls7rpnzWKi22+v9WU1VldLveHinPPvJRXumTgzorSVAbW1ScKNQ0u3vf0HLjsz+Y2nkharqvyTpg2VDQD1qvBacvJQaOG1t
X-Gm-Message-State: AOJu0YwHj42ex9KJbQwTLw9LrhHv93VPsA7y2qMTsuVMfXvL4O13vNAs
 indvhCmOvweXL3mwl7jfk61KJZIMYzX+UmVw7/DqEsKf7JXGh52F1heEPRle1dw=
X-Google-Smtp-Source: AGHT+IF4U7++EP6lI1eUA5YZ5DAJajTZAe48hL6g0In91UMupEHYzfMoae2xpi5b5/CBMmyo7KWbtw==
X-Received: by 2002:ac2:51a5:0:b0:512:bf99:7d80 with SMTP id
 f5-20020ac251a5000000b00512bf997d80mr6373397lfk.1.1710255019673; 
 Tue, 12 Mar 2024 07:50:19 -0700 (PDT)
Received: from [192.168.1.172] ([93.5.22.158])
 by smtp.gmail.com with ESMTPSA id
 u18-20020a05600c19d200b0041316e91c99sm12715808wmq.1.2024.03.12.07.50.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Mar 2024 07:50:19 -0700 (PDT)
Message-ID: <253b4b6c-d8ba-40a3-adbb-4455af57d780@baylibre.com>
Date: Tue, 12 Mar 2024 15:50:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 12/18] ASoC: codecs: mt6357: add MT6357 codec
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Flora Fu <flora.fu@mediatek.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Lee Jones <lee@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Mark Brown <broonie@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, Takashi Iwai <tiwai@suse.com>,
 Jaroslav Kysela <perex@perex.cz>, Will Deacon <will@kernel.org>,
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 Nicolas Belin <nbelin@baylibre.com>
References: <20240226-audio-i350-v1-0-4fa1cea1667f@baylibre.com>
 <20240226-audio-i350-v1-12-4fa1cea1667f@baylibre.com>
 <1641a853-88cb-43a8-bb95-653f5329a682@collabora.com>
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <1641a853-88cb-43a8-bb95-653f5329a682@collabora.com>
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



On 26/02/2024 16:25, AngeloGioacchino Del Regno wrote:
>> +    if (enable) {
>> +        /* set gpio mosi mode */
>> +        regmap_write(priv->regmap, MT6357_GPIO_MODE2_CLR, 
>> GPIO_MODE2_CLEAR_ALL);
>> +        regmap_write(priv->regmap, MT6357_GPIO_MODE2_SET, 
>> GPIO8_MODE_SET_AUD_CLK_MOSI |
>> +                                  GPIO9_MODE_SET_AUD_DAT_MOSI0 |
>> +                                  GPIO10_MODE_SET_AUD_DAT_MOSI1 |
>> +                                  GPIO11_MODE_SET_AUD_SYNC_MOSI);
> 
> Are you sure that you need to write to MODE2_SET *and* to MODE2?!

This is downstream code and these registers aren't in my documentation.
I've removed the MODE2_SET write and test the audio: it's still working.

So I will keep the spurious write removed for v2. :)

-- 
Regards,
Alexandre
