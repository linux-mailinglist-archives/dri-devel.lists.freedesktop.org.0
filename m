Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 780DA8A7DBB
	for <lists+dri-devel@lfdr.de>; Wed, 17 Apr 2024 10:07:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9235111328E;
	Wed, 17 Apr 2024 08:06:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="e6SJL+GV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com
 [209.85.218.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1F4B11328E
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Apr 2024 08:06:56 +0000 (UTC)
Received: by mail-ej1-f45.google.com with SMTP id
 a640c23a62f3a-a55630378b1so6287066b.2
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Apr 2024 01:06:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1713341215; x=1713946015;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=BuvMTKrS538OQBDa2jdh/t6qnPEHbqMc8PN+mILzuvs=;
 b=e6SJL+GVlGL57C4M+7kN7HniBDGbJz9X91HjG+C2QTaIH0y4L6dMe4tND9ynl32Nwz
 VJaTo6wUf5luYdc8DwgcUrUbtt7vcRsi+d4nXeenWvqNN5SoRWOv3z77LLh9T/1ORtzW
 xAC7hMfnQfSCtwIpXjdMynjEe1x0cLju7yf0BsTFk2GE9Kyt4j54pnuZdmjy6OSf16XK
 ly9qHlitvlO5n/6hN0tHUmox2ga3xOJJLU4jY199wJyhJe6gS3092lHRhBe4tZ4OkAgC
 u4IAUq4V+4+dOsm3W3kP/DnibBSYf9ccS3l80dp6uwpyPGjpWO8ArBzxbNBa3K+D4uG9
 ZbaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713341215; x=1713946015;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=BuvMTKrS538OQBDa2jdh/t6qnPEHbqMc8PN+mILzuvs=;
 b=vU1SeKFjLNalrd/S+jCIkWr1HRkzAPzxzqyFYADH7RgMvmwEOpgzvSHxFGRrv/D3ji
 wWCWTJszk4cSrU7tX/YBbQPKCTb0qyLCAonbMLXIKio6PaTD2iuySsPCCGJwr8KzoXor
 V58nOJOgIWO6icg+Gt2GDFXO/rf8ULJ3SgvLYxxwwBKgfsj1tOquFbW0YoO1oPBWtsJZ
 Y0WimKxRdT0oY23LnnQnxpAN8BOr+5Vq9gHn0hQNKt4L7YT9coIS7k8ckakT7+VBvCcP
 A2J5tE9Op37nRDV1i+26s+wzaeatSDqob75XC5ywW5nSV7n8a2MiqCsmtjdRm6tEyJlU
 lRrg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVIekY+T7JVMIbVVCBWt0jRzVy4rTG3qHgGKTYBkcZHf83HHVKTGmCHLT3nxrF56xuv/9MRlWWThgDECksAf9INxK6qD1//bXkMNOVt244A
X-Gm-Message-State: AOJu0YxwgE4/bNtR05hwATod7TSVp/VeWscZvL5yp38p+AXGQ7SpTkhx
 QM2zfBJQv0/sjUL1xm4zOAmQJqiMU1DAwH+BteO5A9UZNj6ehKocg6wZlsOnN4w=
X-Google-Smtp-Source: AGHT+IF9QNj2+LEOTDvCsMmUjHTc38pjE+FDvplPR3KiswRdx9pL2ELeUrxLu0thmtQsPq4SfA0PEQ==
X-Received: by 2002:a17:906:a016:b0:a52:4d96:85e with SMTP id
 p22-20020a170906a01600b00a524d96085emr6795036ejy.53.1713341214788; 
 Wed, 17 Apr 2024 01:06:54 -0700 (PDT)
Received: from [192.168.1.172] ([93.5.22.158])
 by smtp.gmail.com with ESMTPSA id
 cx10-20020a170906c80a00b00a51b5282837sm7852622ejb.15.2024.04.17.01.06.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Apr 2024 01:06:54 -0700 (PDT)
Message-ID: <cd5dcc90-bd34-40d5-af79-4943883411ad@baylibre.com>
Date: Wed, 17 Apr 2024 10:06:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 11/18] dt-bindings: pwm: mediatek,pwm-disp: add
 power-domains property
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Jitao Shi <jitao.shi@mediatek.com>, CK Hu <ck.hu@mediatek.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-pwm@vger.kernel.org, linux-clk@vger.kernel.org
References: <20231023-display-support-v2-0-33ce8864b227@baylibre.com>
 <20231023-display-support-v2-11-33ce8864b227@baylibre.com>
 <22yeoik77sdhmg43odjftzjn2douq74zhxwy6qx3hsrvr53r5e@7w3f3zbgxult>
Content-Language: en-US
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <22yeoik77sdhmg43odjftzjn2douq74zhxwy6qx3hsrvr53r5e@7w3f3zbgxult>
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



On 17/04/2024 10:01, Uwe Kleine-König wrote:
> Hello,
> 
> On Tue, Apr 16, 2024 at 05:53:12PM +0200, Alexandre Mergnat wrote:
>> According to the Mediatek MT8365 datasheet, the display PWM block has
>> a power domain.
>>
>> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
> 
> I already pointed that out in reply to the cover letter, so just to make
> it more easily to spot for people considering to apply this patch:
> 
> This is already fixed in next.
> 

Hello,
Sorry I've misunderstood the previous message.
I will remove this patch for the next revision and notify it in the cover letter.

Thanks

> Best regards
> Uwe
> 

-- 
Regards,
Alexandre
