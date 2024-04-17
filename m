Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE6168A7DC9
	for <lists+dri-devel@lfdr.de>; Wed, 17 Apr 2024 10:12:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DACD111329F;
	Wed, 17 Apr 2024 08:12:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="uX7KDarE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com
 [209.85.167.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 041211132A5
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Apr 2024 08:12:20 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id
 2adb3069b0e04-518b9527c60so4282681e87.0
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Apr 2024 01:12:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1713341539; x=1713946339;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=TzkbbRIO2QimJ8RWbkwCZ+K7gIC0TeXOrUoZh+Yj+po=;
 b=uX7KDarEO65i/Wg+qYxRsIhe5nHano77GD8kjSlhQgfiqZvOTmpQKRPZWEPwOcABJG
 8gbkmF8qJ0qc2mjJdo52PEPZoAw29HavhmHKrTqz2Wk4hCpSixf3GJjUb6egRjfpYjTR
 dGvNDZmAzUmgvabeE2QWSoV3OP+Eiyl7pokTT4rFUndgfwKA20lpACuInMjH1qq9d23q
 ZiK1faU4re5+5qz2OIi+PSgwFfs0zme9U8JiTTOPykNxPa/cxPYlxD/W6ZwFlasMFeR5
 q4TiGaoAivvxkBlncNUH4SXp1ZDCxOdKUSO4aMCjBs1eJ7tl3kMhCiUkW9K+l/1OoTUg
 XULQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713341539; x=1713946339;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=TzkbbRIO2QimJ8RWbkwCZ+K7gIC0TeXOrUoZh+Yj+po=;
 b=mjVcjiANdocfNZJr1P2LfTmBMCNeJpu5Jmrv4q0AsYZpfWTc1SosIpj08yIrnw1/6Y
 qqygZaRQIj4Q27HYJOZSCXNQBUHGz2FkOzytM5VnqsJceXn3+susPPZZhgr16BIAUffB
 Akxr8CrOgoFnRy4ixw0Z7iA+Uh2OfR8ju67SSlk53iOaHEVWDydnQx7fl89Ni/iU07lm
 x0Oq0z06pazEkQdkeIytwPuXbT8QKir5s2MvFRoG3v3zmeRog1oQZDPGYVcIyE5bHAYG
 Ida4Cuqv6FLvryESa4qgu1RWyKH+oXmVstgtuDJNGAySi+z5SbpXrrmBBn4hI996ct1V
 5aIw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWAm4QkbJ+4Bqe9Uc/X0WRjpjx2Uksd6uZ5Qzoum5v+NU68NxbiNxDdDIzUIV/QyQ8Xhlnjq+LjXTVmWakpFAtq/ZiWKHnmPVVszKsJsQ8e
X-Gm-Message-State: AOJu0YyeLQYzCi5UDChPV+cgH0DSpCOhcux0BfIIQharz5kENq4QIDwN
 UC5Vr00zD12iJzhnE3G6xiTrEi5xSR7Nqz3YXbMoj+Zh28PjNUos2OU0jGS/Sxg=
X-Google-Smtp-Source: AGHT+IH4Ux+OgM8GODN1EjrwY/h8hAJyaOMv9iN+0tmp9IOucYOjlUfi/JOumwmy4S2/VC/nm5QgBQ==
X-Received: by 2002:a05:6512:1106:b0:518:9183:864f with SMTP id
 l6-20020a056512110600b005189183864fmr15160417lfg.34.1713341538799; 
 Wed, 17 Apr 2024 01:12:18 -0700 (PDT)
Received: from [192.168.1.172] ([93.5.22.158])
 by smtp.gmail.com with ESMTPSA id
 u10-20020aa7db8a000000b005700ef75274sm4950049edt.33.2024.04.17.01.12.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Apr 2024 01:12:18 -0700 (PDT)
Message-ID: <5c2a1b27-5602-461f-abe2-1b65f8245d8f@baylibre.com>
Date: Wed, 17 Apr 2024 10:12:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/18] Add display support for the MT8365-EVK board
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
 linux-pwm@vger.kernel.org, linux-clk@vger.kernel.org,
 Fabien Parent <fparent@baylibre.com>
References: <20231023-display-support-v2-0-33ce8864b227@baylibre.com>
 <afetelidcystq4avtmfcvf6h4l5zdthwozwbhjica6jjybkiln@oxx2fqk65psx>
Content-Language: en-US
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <afetelidcystq4avtmfcvf6h4l5zdthwozwbhjica6jjybkiln@oxx2fqk65psx>
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



On 17/04/2024 09:58, Uwe Kleine-König wrote:
> Hello,
> 
> On Tue, Apr 16, 2024 at 05:53:01PM +0200, Alexandre Mergnat wrote:
>> Alexandre Mergnat (16):
>>        [...]
>>        dt-bindings: pwm: mediatek,pwm-disp: add power-domains property
>>        dt-bindings: pwm: mediatek,pwm-disp: add compatible for mt8365 SoC
>> [...]
>> base-commit: 890c94ce8a456aa4d7ead5f5fd2603b98dfe7b7e
>> change-id: 20231023-display-support-c6418b30e419
> 
> I cannot find 890c94ce8a456aa4d7ead5f5fd2603b98dfe7b7e, neither in next
> nor in stable nor in drm-misc nor in Linus' repository.
> 
> For sure it's not based on next, because otherwise you'd have noticed
> that the power-domains property is already documented there. (Currently
> as fb7c3d8ba039df877886fd457538d8b24ca9c84b.)

You're right, this V2 is based on v6.9-rc3

> 
> Best regards
> Uwe
> 

-- 
Regards,
Alexandre
