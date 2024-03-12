Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 18CD4879027
	for <lists+dri-devel@lfdr.de>; Tue, 12 Mar 2024 09:58:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40A0A10E688;
	Tue, 12 Mar 2024 08:58:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="mr3kwqiH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C48A710E546
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Mar 2024 08:58:10 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-41342849a15so1613925e9.3
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Mar 2024 01:58:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1710233888; x=1710838688;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=VjT8Br7RwB5Cf9wT37+1E/wNuS7CDeDlSSoF+6MfTlU=;
 b=mr3kwqiHaHArXXcpP3bm8oY360DMoKmFTrGy1Iem3R7ft7E7jnI0JuqRSjaLx6W5ov
 zLqfONFCpvll43i0VntiQMyYOmZPIWZtPHPCMp5IPSLZGGnDkKJvOChKragfkAEvjlv3
 rQYTgpvGp0aNLQBKRp+6uup71wiLx9vR8URON4NyeGCCaX1xSTbmdEdAmTs+0zOTGyYt
 XLqWfd8u68FDrp1BwBRZSTVKMCQqze8x5Ba2RN9bXlmu3f0LtRxYcYIKxs1MV261+Wlz
 G0Te6lnD0ijwN0BIu1QYTu7WLXbK3ArLKml23wVFWhPhcCQDIBClMkXruy3zF5A2m4HV
 ayyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710233888; x=1710838688;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=VjT8Br7RwB5Cf9wT37+1E/wNuS7CDeDlSSoF+6MfTlU=;
 b=BpmawHX3SGwlgr1DrIZBdh7UksX8OKc7s5ZKwl/0e+3eUkdNDwyitmBA8k4CeupeGb
 ejrnbh+nq3WhQ8Dk0qiCp7TmokW60He/59nx8Bo7Y+8v/7ENgrLz1Maa58qnoWdL43d7
 XJAeWMpretNu+HMcFmq49c/qnWaNJb/9kGC8Pl2ocpj+QlwKkNusw+99bQ1EjFk2haGh
 NocMVus7g0Z76Tf5S9q8RPgPALmt0vuowTgeF+P6SCm47gBwKFfHcc6DUmpbAzD1EsOW
 k+esQnzRo3P59Asvjkx9r39LiffFNdr4HlBVfIBgq5wVa0aetsHJ+LdomZsxPrQZn47n
 6i7A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUkd7bXzFvfrZ+llMPYenu/e4cK5RGGlnlB4bsviKyueK4CuGGutHEpbqQ8vO2VpWksv5vQPD3LF9GUiY0Jd4MRuNAaDmD/G+U4eHEehNcP
X-Gm-Message-State: AOJu0YwXKqHznQWtu3EvsIWSZqeRl7t7TVsDkGVbyYeAhi9tXQTahnTY
 5khpOR452CthBHg/H5vEAirhYq+joHrXiOooqsd9GHfk7CGzgbg6VnYPdItKccE=
X-Google-Smtp-Source: AGHT+IGEY43ahXXjF+ZtPgyw++kTwzbaMmqAYW0DyROyoKxXhlKv6tTyjqHeIgkml0d0nNzd+tbCLg==
X-Received: by 2002:a05:6000:1c3:b0:33e:8b95:b351 with SMTP id
 t3-20020a05600001c300b0033e8b95b351mr5064003wrx.9.1710233888438; 
 Tue, 12 Mar 2024 01:58:08 -0700 (PDT)
Received: from [192.168.1.172] ([93.5.22.158])
 by smtp.gmail.com with ESMTPSA id
 i5-20020adfb645000000b0033e87c6bcb2sm7367141wre.8.2024.03.12.01.58.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Mar 2024 01:58:08 -0700 (PDT)
Message-ID: <7ddad394-e880-4ef8-8591-cb803a2086ae@baylibre.com>
Date: Tue, 12 Mar 2024 09:58:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/18] Add audio support for the MediaTek Genio 350-evk
 board
Content-Language: en-US
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
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 Nicolas Belin <nbelin@baylibre.com>, Fabien Parent <fparent@baylibre.com>
References: <20240226-audio-i350-v1-0-4fa1cea1667f@baylibre.com>
 <4ffde184-cf68-4b71-b81d-9b5894529926@sirena.org.uk>
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <4ffde184-cf68-4b71-b81d-9b5894529926@sirena.org.uk>
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



On 27/02/2024 16:06, Mark Brown wrote:
> On Mon, Feb 26, 2024 at 03:01:38PM +0100, Alexandre Mergnat wrote:
>> This serie aim to add the following audio support for the Genio 350-evk:
>> - Playback
>>    - 2ch Headset Jack (Earphone)
>>    - 1ch Line-out Jack (Speaker)
>>    - 8ch HDMI Tx
>> - Capture
>>    - 1ch DMIC (On-board Digital Microphone)
>>    - 1ch AMIC (On-board Analogic Microphone)
>>    - 1ch Headset Jack (External Analogic Microphone)
>>
>> Of course, HDMI playback need the MT8365 display patches [1] and a DTS
>> change documented in "mediatek,mt8365-mt6357.yaml".
> 
> Given the number of custom controls here could you please post the
> output of mixer-test and pcm-test from a system with this driver running
> next time you post, this will help with review since it checks a bunch
> of things around the new controls.

Hi Mark,

I'm a bit lost for mixer-test and pcm-test.
Currently, I cross-compile the alsa lib project to be able to build the 
tests and put it on my board.

I can execute it, but I still have 2 issues:

1) I've a lot of missing module in my environment (Encode.so, Encode.pm, 
Symbol.pm, IO/Handle.pm, ...). AFAII, I've to cross compile the missing 
perl modules and install them in the rootfs

2) I don't know how to configure pcm-test.conf & 
Lenovo_ThinkPad_P1_Gen2.conf (or new file to match with my board).

My test cmd:
./run_kselftest.sh -c alsa

I'm wondering if I'm going to the wrong way because I don't find 
guide/readme whereas it's not trivial at all.

-- 
Regards,
Alexandre
