Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D0CFAB9C8A
	for <lists+dri-devel@lfdr.de>; Fri, 16 May 2025 14:47:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D2DF10EAAA;
	Fri, 16 May 2025 12:47:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="hGDbX8C1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B24AA10EAAA
 for <dri-devel@lists.freedesktop.org>; Fri, 16 May 2025 12:47:12 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-442ccf0e1b3so23592365e9.3
 for <dri-devel@lists.freedesktop.org>; Fri, 16 May 2025 05:47:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1747399631; x=1748004431;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=It4olg+vj/PaVXUOML7Uwtxb8afmv0kwgYzH/XkHr3k=;
 b=hGDbX8C1xlRtL+4NzUB1gGTLog/Bex20ovjLVv65iwZcsp+7gRC7w2sGGsp7it6fZC
 l+uyp15Rz0EzpZu+JUs81DO8iCEONMGA51VfVko82yytpAFwm1GQL6LTmjz7QFKJUFBk
 sbtPrMu9UR8r9F/Y662JDbIOSlgmVK2OqlLSd/HDbfwP9ydgXZ7Odb7pkFutdW+e5KZR
 TqveJ4dVHQBBWALc3c1E0fwRzcIVzoJruM7irlhf2Y2BnEXFDTwIN+/OW92szyp/OLi5
 j7UiAB/QvqXnKnk/zGRC+bkvVk6UjFt8uEeK5K58O6kIZc4vTdl+SQRjkwAhw2CpRhFG
 nYCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747399631; x=1748004431;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=It4olg+vj/PaVXUOML7Uwtxb8afmv0kwgYzH/XkHr3k=;
 b=aic93ni5N2xNzXRJV7dw0k9uchM3jONI50xRmkyBwA9r2SqhXHK8qZKMrP5x6M0pN0
 Gs6Kw8RqYYZ42O3TH5uvvPT98DaqLpRnI4eLaiW4dxSj80AGxp8s+X+dZSjvJAYvW06H
 JhGK/wZLP+X8kq9oiDa6Sn6xhkcIBFE+MiikXPoS8WI9GqwRHNO1L7vKBkYhf96SmQCm
 f9mbCmFU5hK8u6DR0J2Re1pcpWOKuMMXUoTFeJrCrpGBJTPGfdwloI67BFFy0ZTjeP8+
 Fv1uyt5cSnho39HB6B/XdUFOXEK5Z+rQ1tYRuvSfFF3LxLnr8tYR6o2L/8VedgPSCr2v
 MMvg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW8NF9mTFctSDAHiA2h9eKmy7UWD+gyV6hxrC32ao9ffFkDfOHNRXntMW2/PcV4Q6TdDRamKyP7hYk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxTSvgNRm8FU2eEHUi36pXliuCtedYfYG1r9sjWUGfNvlqF9T6O
 3C6EtlxrJX2iTDRP33blrLgVx+z+2x2C0D36r7UJjWfjez3JaThzivUz8XtIFKd9hpg=
X-Gm-Gg: ASbGnctr8/ytXmTl4IgFhC8+iVog8uEyc68fZ9wqqiVlkRH5TCxWw8aCzJhycZiEWcY
 y3cYQMdkWi9Xzr6R086G65rM2dZig1U5zSZdl5aO6jkrcsZ/sxezkeP7+dmFfYRVzOWekBqRkIM
 BQBfAUXsT2wqVoUb+g8nJYMFqMTAiZJ/5dbpbKE2gov9/ZENeiiW/IBqu5rZLEN0aZBiSr0Uceb
 9gvnPmZStpbCShxMo9jhXonPZZS6UfyDBzMKWcxQSwMVMgEsIfPXCVBfG5TGfQbxfzBfwXlel4/
 pD/BZBemoIKjZb9EW+pcZIe7QV+tMLVSPRBNoKbB/+rxHwgVNlYx+bEuqBkEzqGCw3PauiXboWn
 zoPxdD7vgkAHApt0=
X-Google-Smtp-Source: AGHT+IH5gScMrCCTGF//8JROzSasDHWVQYCYlgMKE4a0wf2w3fuKAyBSQp+DJif8kHEnseMXKCoH5g==
X-Received: by 2002:a05:6000:144c:b0:3a3:62c6:d2cd with SMTP id
 ffacd0b85a97d-3a362c6d48emr1641333f8f.14.1747399631142; 
 Fri, 16 May 2025 05:47:11 -0700 (PDT)
Received: from [192.168.5.157] (88-127-185-231.subs.proxad.net.
 [88.127.185.231]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a35ca62b5dsm2792986f8f.55.2025.05.16.05.47.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 May 2025 05:47:10 -0700 (PDT)
Message-ID: <70da4bf0-a36b-474c-8057-1ad056573e01@baylibre.com>
Date: Fri, 16 May 2025 14:47:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 1/3] arm64: defconfig: enable display support for
 mt8365-evk
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20231023-display-support-v8-0-c2dd7b0fb2bd@baylibre.com>
 <20231023-display-support-v8-1-c2dd7b0fb2bd@baylibre.com>
Content-Language: en-US
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <20231023-display-support-v8-1-c2dd7b0fb2bd@baylibre.com>
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

Hello

On 20/03/2025 09:48, Alexandre Mergnat wrote:
> Enable the DRM HDMI connector support and the MIPI-DSI display
> Startek KD070FHFID015 panel to have HDMI and DSI display working
> on the mt8365-evk board.
> 
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
> ---
>   arch/arm64/configs/defconfig | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index c62831e615863..1e2963a13500b 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -897,9 +897,11 @@ CONFIG_DRM_PANEL_NOVATEK_NT36672E=m
>   CONFIG_DRM_PANEL_RAYDIUM_RM67191=m
>   CONFIG_DRM_PANEL_SAMSUNG_ATNA33XC20=m
>   CONFIG_DRM_PANEL_SITRONIX_ST7703=m
> +CONFIG_DRM_PANEL_STARTEK_KD070FHFID015=m
>   CONFIG_DRM_PANEL_TRULY_NT35597_WQXGA=m
>   CONFIG_DRM_PANEL_VISIONOX_VTDR6130=m
>   CONFIG_DRM_FSL_LDB=m
> +CONFIG_DRM_DISPLAY_CONNECTOR=m
>   CONFIG_DRM_LONTIUM_LT8912B=m
>   CONFIG_DRM_LONTIUM_LT9611=m
>   CONFIG_DRM_LONTIUM_LT9611UXC=m
> 

Gentle ping.
Is that patch can be applied please ? The remaining patches in this serie
do cleanup only, then shouldn't block this one.

-- 
Regards,
Alexandre
