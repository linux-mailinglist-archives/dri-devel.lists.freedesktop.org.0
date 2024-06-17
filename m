Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AFC6790A818
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jun 2024 10:05:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F18E010E2A6;
	Mon, 17 Jun 2024 08:05:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="qNEV/OCB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6EDE10E2A6
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2024 08:05:41 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-421820fc26dso31967615e9.2
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2024 01:05:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1718611540; x=1719216340;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=RhK0l1wiP2QqjV41iED4AMmcoD6qMZOANZydgxIA9xw=;
 b=qNEV/OCBmxLGl2FscTnL46z4eL2wVuUXqE8HDwsQf85RTfZgrFJkr9MmlsZSj2bpSl
 2PdlQaMwvLiefCtLTV5LuYhLat2zls4HYWiR1rAtJtnvWeIMw6R9vzSHBKtkuGdZKSY6
 51erRn4969mfFd2s8bvBp9PpV5qp/LGnn64Z8j3/LMdKTFOXcjQ/XQCGl1UwTkmJTev1
 8HdsJFRH1qJ7cQT7xEbakWiydy7uNyWL/VG5DbeaE5OblyMA0rRS++SoTfRhSi0rCHUl
 v7mSEhIw3m/cF9tMrJwdxx5JhxUtexxN3M+lx1hjwm2vzoyZQMFEMNhp+7x9NivPvaL/
 CW8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718611540; x=1719216340;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=RhK0l1wiP2QqjV41iED4AMmcoD6qMZOANZydgxIA9xw=;
 b=BckNt5zhTA1NvKVDYEz6uX97uqz28K2WDxTpgjNyML1ojwPwVygvzOajlJ0rmAcwAF
 4YBzGDgmVVRbZZNiRP0ccEhduGyShi5BrbygoWgSdEqZSYzp3jWEDoGnWTNdqVAU6kIH
 GyJEI2STReu5Bh68gVQCwwYx/OKMnNDsrpXJJZikUEAbg56gVxr763sA7G1o+cg0zVfp
 1uy8pCXvRHCplQuX8TVLITgOwfZi4Dx8IUISoM94By/Ea151rWhDSIizx0RxgXbmscnd
 9REyftdN8gRVJeXNZGHD3GEeK94sadXG7ZNUp2m73a+FrZyo9jKbcG1ijKQuangafXJw
 1J6A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVbniLNOSRmg+rYrKSCRHuX5Q6iZxGrbUbABxrEwwrb2CEdnFUDE2OljenNneDvBzQepDz2EpYI+fcwQEGW6VcALvv3XnSoSQ4YA5cXzBe+
X-Gm-Message-State: AOJu0YwEI42+d28sSZl/XE3l6QsRRnPcNExDWi0kAg1/y2RlFSzqXwpz
 /f+eOqEJAfepVKMY8jSSAKExJwpC/GtfRJYsNHpb62VMIIlTrrOB/pGXE62Ohwg=
X-Google-Smtp-Source: AGHT+IGAPWtrsBoKqiT6NA7h3nhAEtNjGh3ZlArWedHKrxD1LJKsjTkfQ0ARrSXU5FBmgRUnhtV3jg==
X-Received: by 2002:a05:600c:468d:b0:421:2ddf:aec4 with SMTP id
 5b1f17b1804b1-42304844f6dmr74278975e9.30.1718611539796; 
 Mon, 17 Jun 2024 01:05:39 -0700 (PDT)
Received: from [192.168.1.172] ([93.5.22.158])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42286fe9263sm187819725e9.15.2024.06.17.01.05.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Jun 2024 01:05:39 -0700 (PDT)
Message-ID: <85e9451d-2cd0-457f-a246-017433757fff@baylibre.com>
Date: Mon, 17 Jun 2024 10:05:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v5 00/16] Add audio support for the MediaTek Genio
 350-evk board
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
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Nicolas Belin <nbelin@baylibre.com>
References: <20240226-audio-i350-v5-0-54827318b453@baylibre.com>
 <ZmwODkYov79VHznK@finisterre.sirena.org.uk>
Content-Language: en-US
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <ZmwODkYov79VHznK@finisterre.sirena.org.uk>
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



On 14/06/2024 11:31, Mark Brown wrote:
> On Fri, Jun 14, 2024 at 09:27:43AM +0200, Alexandre Mergnat wrote:
>> This serie aim to add the following audio support for the Genio 350-evk:
>> - Playback
>>    - 2ch Headset Jack (Earphone)
>>    - 1ch Line-out Jack (Speaker)
>>    - 8ch HDMI Tx
> 
> I seem to remember you had review comments that needed addressing from
> AngeloGioacchino, why resend without addressing those?

I don't see any comment:
https://lore.kernel.org/lkml/20240226-audio-i350-v5-0-e7e2569df481@baylibre.com/

-- 
Regards,
Alexandre
