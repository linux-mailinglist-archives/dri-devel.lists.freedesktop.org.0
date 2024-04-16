Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E5418A6F06
	for <lists+dri-devel@lfdr.de>; Tue, 16 Apr 2024 16:53:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4664310F128;
	Tue, 16 Apr 2024 14:53:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="WaC2iXR1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com
 [209.85.208.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A225C10F128
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Apr 2024 14:53:13 +0000 (UTC)
Received: by mail-lj1-f173.google.com with SMTP id
 38308e7fff4ca-2d82713f473so84277011fa.3
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Apr 2024 07:53:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1713279192; x=1713883992;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
 :cc:subject:date:message-id:reply-to;
 bh=jl7BVtQwBTSlw5Q7jIravMMMPvXbs3wbcyyUN/ZkIBg=;
 b=WaC2iXR1WWYxmvajzhLT2eXHBlivsvw/PsIMqspv8Elt3X2lF5XeLaUPt3TTnXJk1I
 6GhihxHZPbFhTFkf+7PfSIl7VLykeeFb4ppVwjOcu8d2+LSNnsGUe2XXGxjA6jS0yzq9
 bzVVhvSN5Rd9qhpg/KDQqHxBpec/Q0DY/85pNBYPCSyrnRvS3LlliaALsmGU8qEp5qme
 BjDvtW1/FLY4Lm3krUEDWzT4g+NUxzPq0/gVnSgLlhW2akfuTTzd7MLrj+N7N8icsaWf
 QbEOoWy5mX4pMhIo2PIQZziCRhFN2LvCVzBpCsPq7C96NMY6oZ/tCndanOS1lc329iFY
 5cZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713279192; x=1713883992;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:subject:from:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=jl7BVtQwBTSlw5Q7jIravMMMPvXbs3wbcyyUN/ZkIBg=;
 b=lohJzFmHWzg9QwVsxi3Dh2JkE4lMvVKO2teooZuh/+RztKtnK8a3j1cM3EAA8odlUM
 KhH7v/gLUCaczaKj3avtboYx3eKFAv/U/DjXCZv8dDbwQPej7GMB7+0fVnPTUOX7+JvM
 z9iR8bk29aGoAlVNV144xYVmyv4nHqJnVZptWX7afXoLRgU576PiZ22Mk+M3Pm3EfWQa
 WRc4sNubVID+bBsK6TEU2u+EkoKNTosbYOGr6Hor8qzluCOIK2JfuBoHMj5KALmHyldo
 s1Wm0MhIqDF5jvWJAfpnq1gDnq3fpZ/HJxzAH3ynZklIo6o7hTah/Fu4qV2aBat8yk5o
 PqyA==
X-Gm-Message-State: AOJu0Yz8hyKsowBYg0NPTWOe8mJW2u1r++UEPRV3JmjuEFFmaq8I7wOg
 XfVQCbiooUk26pJ1DxqnjXEgaaVeQRwM+UpmKa8nMWikfenzaiydAKOu2cGRhU4=
X-Google-Smtp-Source: AGHT+IEBkb7ExU6KDoUwKQB+1TjGigkCAfuqOmSxkIfxlJN0jQEFEyh9q8oXdurLDbr/zM7/PUjBBw==
X-Received: by 2002:a2e:9517:0:b0:2d8:19fe:4863 with SMTP id
 f23-20020a2e9517000000b002d819fe4863mr10223169ljh.41.1713279189026; 
 Tue, 16 Apr 2024 07:53:09 -0700 (PDT)
Received: from [192.168.1.172] ([93.5.22.158])
 by smtp.gmail.com with ESMTPSA id
 c19-20020a170906529300b00a4da28f42f1sm6995974ejm.177.2024.04.16.07.53.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Apr 2024 07:53:08 -0700 (PDT)
Message-ID: <96d90ddd-2910-4419-ba90-64a09a3dbf1e@baylibre.com>
Date: Tue, 16 Apr 2024 16:53:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Alexandre Mergnat <amergnat@baylibre.com>
Subject: Re: [PATCH 14/18] drm/mediatek: dpi: add support for dpi clock
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-mediatek@lists.infradead.org, Will Deacon <will@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, CK Hu <ck.hu@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>, Xinlei Lee <xinlei.lee@mediatek.com>,
 Jitao Shi <jitao.shi@mediatek.com>, linux-arm-kernel@lists.infradead.org,
 linux-pwm@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Fabien Parent <fparent@baylibre.com>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>
References: <20231023-display-support-v1-0-5c860ed5c33b@baylibre.com>
 <20231023-display-support-v1-14-5c860ed5c33b@baylibre.com>
 <cf25a3cc-6411-45f5-bc7a-6b69cf28c860@collabora.com>
Content-Language: en-US
In-Reply-To: <cf25a3cc-6411-45f5-bc7a-6b69cf28c860@collabora.com>
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



On 24/10/2023 11:12, AngeloGioacchino Del Regno wrote:
> Il 23/10/23 16:40, amergnat@baylibre.com ha scritto:
>> From: Fabien Parent <fparent@baylibre.com>
>>
>> MT8365 requires an additional clock for DPI. Add support for that
>> additional clock.
>>
>> Signed-off-by: Fabien Parent <fparent@baylibre.com>
>> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
> 
> I'm not convinced that this is right... at all.
> 
>  From a fast check of the MT8365 DPI clocks, I can see that the DPI0 
> clock declares
> parent VPLL_DPIX (a fixed clock), but nothing ever has VPLL_DPIX_EN 
> (which is the
> GATE clock, enabling output of DPIx VPLL?).
> 
> But then, there's even more: no clock ever references the 
> CLK_TOP_DPI0_SEL nor the
> CLK_TOP_DPI1_SEL gate, which is a PLL parent selector... in other 
> platforms, that
> is muxing through the TVDPLL, but on MT8365 that is LVDSPLL?!

AFAI see into mt8365 documentation, there is no TVDPLL, only LVDSPLL

> 
> I have many questions now:
> * Two PLLs are apparently brought up, but which one is the right one?!
>    * Is the LVDS PLL really used for DisplayPort? (dpi0_sel)

Seems to be LVDS

                                  enable  prepare  protect                                duty  hardware
    clock                          count    count    count        rate   accuracy phase  cycle    enable
-------------------------------------------------------------------------------------------------------
  clk26m                              18       19        1    26000000          0     0         Y
     vpll_dpix                         1        1        0    75000000          0     0  50000         Y
        mm_flvdstx_pxl                 0        0        0    75000000          0     0  50000         N
        mm_dpi0_dpi0                   1        1        0    75000000          0     0  50000         Y
        vpll_dpix_en                   0        0        0    75000000          0     0  50000         N
     lvdspll                           1        1        0   283999497          0     0  50000         Y
        lvdspll_d16                    0        0        0    17749968          0     0  50000         Y
        lvdspll_d8                     0        0        0    35499937          0     0  50000         Y
        lvdspll_d4                     0        0        0    70999874          0     0  50000         Y
        lvdspll_d2                     1        1        0   141999748          0     0  50000         Y
           dpi0_sel                    1        1        0   141999748          0     0  50000         Y
           dpi1_sel                    0        0        0   141999748          0     0  50000         N
     mmpll                             1        1        0   456999909          0     0  50000         Y
        mmpll_ck                       1        1        0   456999909          0     0  50000         Y
           mm_sel                     15       15        0   456999909          0     0  50000         Y
              mm_dpi0                  1        1        0   456999909          0     0  50000         Y



> * Are you sure that CLK_MM_DPI0_DPI0's parent shouldn't be dpi0_sel 
> instead?

I'm agree with you. After few change, it works.

-       GATE_MM0(CLK_MM_DPI0_DPI0, "mm_dpi0_dpi0", "vpll_dpix", 20),
+       GATE_MM0(CLK_MM_DPI0_DPI0, "mm_dpi0_dpi0", "dpi0_sel", 20),

-                       clocks = <&topckgen CLK_TOP_DPI0_SEL>,
+                       clocks = <&mmsys CLK_MM_DPI0_DPI0>,


                                  enable  prepare  protect                                duty  hardware
    clock                          count    count    count        rate   accuracy phase  cycle    enable
-------------------------------------------------------------------------------------------------------
     vpll_dpix                        0       0        0        75000000    0          0     50000      Y
        mm_flvdstx_pxl                0       0        0        75000000    0          0     50000      N
        vpll_dpix_en                  0       0        0        75000000    0          0     50000      N

     lvdspll                          1       1        0        283999497   0          0     50000      Y
        lvdspll_d16                   0       0        0        17749968    0          0     50000      Y
        lvdspll_d8                    0       0        0        35499937    0          0     50000      Y
        lvdspll_d4                    0       0        0        70999874    0          0     50000      Y
        lvdspll_d2                    1       1        0        141999748   0          0     50000      Y
           dpi0_sel                   1       1        0        141999748   0          0     50000      Y
              mm_dpi0_dpi0            1       1        0        141999748   0          0     50000      Y
           dpi1_sel                   0       0        0        141999748   0          0     50000      N

     mmpll                            1       1        0        456999909   0          0     50000      Y
        mmpll_d2                      0       0        0        228499954   0          0     50000      Y
        mmpll_ck                      1       1        0        456999909   0          0     50000      Y
           mm_sel                     15      15       0        456999909   0          0     50000      Y
              mm_dpi0                 1       1        0        456999909   0          0     50000      Y


> * Where is DPI1 in this SoC? Why is there a dpi1_sel clock, but no MM clock
>    for the DPI1 controller? Is there any DPI1 controller, even?!

DPI1 isn't documented.

>    * Why is there a DPI1 MUX, if there's no DPI1 controller?!

Good question, I don't know. Legacy of the downstream code.

That will be fixed for the next version.

-- 
Regards,
Alexandre
