Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB97184B848
	for <lists+dri-devel@lfdr.de>; Tue,  6 Feb 2024 15:47:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A203112C63;
	Tue,  6 Feb 2024 14:47:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="xxHeltn0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
 [209.85.167.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D488D112C63
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Feb 2024 14:47:21 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id
 2adb3069b0e04-5115fcef9e9so800248e87.3
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Feb 2024 06:47:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1707230840; x=1707835640;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ZR/yId0zMdb1VoBg8Axbya9oTLCK591PyMAG4SS2OxY=;
 b=xxHeltn0+CCfDFwL9v3b41JU4LdCp2hvEdw/N+hcroGbyq5Zz1e53ZW9Qdi4Wf1sYi
 oTYNAaeLQbJ3iubz8iz04wZLEyu6KZcVdJdwARSAZz/j+M7u+ozHbJDdwFvX6KGT4voP
 7niM8NnwJAfbRceLd1zWnIUXkACArJ2dpUWSbUofDvHRgBXTREOQC7IH33+b9s+42AxQ
 lciHDXy1Kw9oHRff3eCUvA3p29C5RKJcN1b7wpDICFLPyeXmmjEQLuCtK3ILuOk5kMNN
 3AbYChL7fl+6Y1dtSfoY4aV+7VDnF63//CclqmeNm/weQDcpVFiuzjxTHo8N9J29RIgu
 CG6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707230840; x=1707835640;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ZR/yId0zMdb1VoBg8Axbya9oTLCK591PyMAG4SS2OxY=;
 b=barWtiO49l//F+JLgn/uDGKAByO3Y7SIIKVSAjNdR74+TGT+45aSmt0DXZLr78p1p7
 v0SfRA2I1l9ROD+5Lwivsv85xVKQhPenCQgYvLin8sYezOANAh6t5KjdFnbS8aMzu8Q/
 QdR1jG6WB3k78CMaaz0LJ2Zh8udYD+6jjlKjZfrtIzujdq4A1qynC600bkP8/hWATNpt
 oRiv8FRgqiE+QC38aL9njC4wZE8xr4s3xrStWfUJdYtKQ0vexZhbxAAnFz0OkC0v3pGP
 LvoTVxvphdYq9w2+HkggOmNA52e7cDZwGM3NM8zd1e917g/4btKObyKyqAEipRdBy5eN
 lkgA==
X-Gm-Message-State: AOJu0YySq3V3OPZ7bBwfRAPhd/D1RYrNn4/F5gz15L35Cg/pNEiKsrBU
 uuC9z3ZIDVxyUamZjTvnXS2EwHEDy5RkOl2Su/vjyIQxOlEeSpi6PL18QrtdWwg=
X-Google-Smtp-Source: AGHT+IEuhUD5eEWwYbifjJ3zWOk3sSzNHHGTGTW2BHb978uMI+o0AKo+LWqCNLoEZRgptvn09UAaog==
X-Received: by 2002:ac2:48a8:0:b0:511:52b7:43a6 with SMTP id
 u8-20020ac248a8000000b0051152b743a6mr2076508lfg.38.1707230840037; 
 Tue, 06 Feb 2024 06:47:20 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCW6O0p8yRFvWA2LcJJ0ltpkPfQ6vI5AikUNA/cAWawwZbgnjphw4M/VshE8gahHAIgGIZF7Gmld/JviR0PfLBno5DT+YgCwcNnuN7vQaRicDacIJWmeRvUbJ1sCX4QWKdBM4n9nUGwV1qEMw9d9+cAvxvrNnAI5xtGAVYSBLVu8+q45icoQe6aCIh4XOniP3CD6AskEtnKkHpJZgLF/DbiIrw+pHt0XHYGHknPi0wvZ4u5FHUi3696dcPv/g7lBtAxJrNBCXE5Dxn/b+Kst7uQVcsUqYgSBCAheYws7ANgNgjFdh+fS3HZL/AUL5RVKJUD2kck/AhPd1dHj3q3Zr07tE0qbl4W4UiN0XBJRU3ECzwAVdklLD+aezRUXcYqgh5aY+T3C1Szf48N/dN7+Ix4loSxCY98GZHzbKw==
Received: from [192.168.1.172] ([93.5.22.158])
 by smtp.gmail.com with ESMTPSA id
 c5-20020ac25305000000b005112ae5fd93sm255854lfh.244.2024.02.06.06.47.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Feb 2024 06:47:19 -0800 (PST)
Message-ID: <f91db779-ad94-4c18-9a06-1029da4edaab@baylibre.com>
Date: Tue, 6 Feb 2024 15:47:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/9] drm/mediatek: dsi: Use GENMASK() for register mask
 definitions
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 chunkuang.hu@kernel.org
Cc: fshao@chromium.org, p.zabel@pengutronix.de, airlied@gmail.com,
 daniel@ffwll.ch, matthias.bgg@gmail.com, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, kernel@collabora.com
References: <20240206120748.136610-1-angelogioacchino.delregno@collabora.com>
 <20240206120748.136610-2-angelogioacchino.delregno@collabora.com>
Content-Language: en-US
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <20240206120748.136610-2-angelogioacchino.delregno@collabora.com>
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



On 06/02/2024 13:07, AngeloGioacchino Del Regno wrote:
> Change magic numerical masks with usage of the GENMASK() macro
> to improve readability.
> 
> While at it, also fix the DSI_PS_SEL mask to include all bits instead
> of just a subset of them.
> 
> This commit brings no functional changes.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>   drivers/gpu/drm/mediatek/mtk_dsi.c | 45 +++++++++++++++---------------
>   1 file changed, 23 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
> index a2fdfc8ddb15..3b7392c03b4d 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dsi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
> @@ -58,18 +58,18 @@
>   

...snip...

>   #define DSI_PSCTRL		0x1c
> -#define DSI_PS_WC			0x3fff
> -#define DSI_PS_SEL			(3 << 16)
> +#define DSI_PS_WC			GENMASK(14, 0)
> +#define DSI_PS_SEL			GENMASK(19, 16)

0011 0000 0000 0000 0000 => GENMASK(17, 16)

>   #define PACKED_PS_16BIT_RGB565		(0 << 16)
>   #define LOOSELY_PS_18BIT_RGB666		(1 << 16)
>   #define PACKED_PS_18BIT_RGB666		(2 << 16)
> @@ -109,26 +109,26 @@
>   #define LD0_WAKEUP_EN			BIT(2)

-- 
Regards,
Alexandre
