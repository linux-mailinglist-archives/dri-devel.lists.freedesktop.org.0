Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D4D6A0B7AB
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jan 2025 14:07:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9D3B10E675;
	Mon, 13 Jan 2025 13:07:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="oqPMj3W8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54BC210E675
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jan 2025 13:07:08 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-4363298fff2so3872225e9.3
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jan 2025 05:07:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736773627; x=1737378427; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=2XbjvOHgX6cEaqQor2rPngcF665AthpQbidXcULPyXE=;
 b=oqPMj3W8x4Aemjvk8B2jEf0s+RaAhs2MMPXKflUYOX6heAVOWM8DVKcYxstg1xNTpF
 KMavCq9tXwyzqznMTrTExbLmuc0MTnKEE/DZnGomonQpioZYYhYHUP27CB0jUgUcByF8
 Ap1mjtXP+VnEeUHNG+qiexJkT6eQKxwZ+UC2jyMVcH2vJkaQFe9pplv6HZQyN2GHbk9T
 WWvYt0lqcWwoSpfROXBrRB0SKpXiHUejoCHXok7EtzWA2uWjrg6QFX4VK7OQhpmvKJpa
 wFBgzUEBiwgT9O59N6rP6x0Jw0F7TgoY07XoDO01D/jHSmdcXDqbHAkIyFM42RXRNyQ9
 zDUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736773627; x=1737378427;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2XbjvOHgX6cEaqQor2rPngcF665AthpQbidXcULPyXE=;
 b=lUQ5T6LmHNSfLw60DEpldgkM/r0ZFZjKt/D1wJoEI5VZcj4an4Da3gT0zZpqX6i6EU
 td+m+Y4+B+CqSmZkgVQsnWt8CfOTlQwj+uPJ2LpIBRZ8/Ri1KSp+xat1U57Af7jKu7/9
 qRjMv2Lofzi3SLfNHieaCOvojONEXByMNSB3O4R4gfKG32UYA4qRw9ehyf7f3qgGe01R
 wj2lWephIZQBRhVTyM2i0fEpxqr/T6eU0Onf3eGXVi86N1jwD7mOD+N2wkeIsR8HzmxM
 pZVGmLeziapDWUW1/i9iL57UL/LdIe8aENYa9u0MjTGCSDNHFgWH0ntUGZfHPBqQHtmz
 v/Sg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWVYNtxol4Emq3pZ3IPDXFGG/lz/A+FhWPxSLI7l7Kbaa8JD7XylaJJ1RCAZPJ8HJbkldYgSDy8tSE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywz3/ylJNGJpFo4YjWkr4Yi3BbdpD0Pqplhx1Urbwz+KZIwZhyu
 mrrgtMedE2Ig2yepkz4qwOa5PC65TJ2KtivPhk0dxMjrJuhl9/yMTMXRV3rVZgw=
X-Gm-Gg: ASbGncu9XQOWZcyCpjShVw1Wwu/S+fZUyq4dcJv7bBifuiXLRf7G016DoTlfTuQOoiS
 jku16El7EDM3TYWz7Y6M5/nflAElX5FowfEYkWWWwuNsWW2UpyNYj/N14T7fISxI/nq+NOWrU0v
 90sM7Y5CvnjDUgT2kwb0J2/4vrYTAmORFZjuXW657OssRsQ9N4khk6ugyU3LI3rBCfDBJHjRiH6
 /cm+r+YpveBxzSz0fPQWV6ApR5iERBmAeAHxymWvxjacI/sOLIj9QuMUyMEZu6PT4Z0ir0B26OM
X-Google-Smtp-Source: AGHT+IFiS18jgHH9bOldeMosMuJrC0O44MTlecZH01J7dg1Y0bV9+S1yOTILTG51FUOyHKtLpcBIJg==
X-Received: by 2002:a05:600c:3c97:b0:42c:b55f:f4f with SMTP id
 5b1f17b1804b1-436e2713e51mr80617645e9.6.1736773626697; 
 Mon, 13 Jan 2025 05:07:06 -0800 (PST)
Received: from [192.168.1.20] ([178.197.223.165])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-436e9dc8802sm141839725e9.10.2025.01.13.05.07.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Jan 2025 05:07:06 -0800 (PST)
Message-ID: <59f8a02e-a716-40a8-bf73-111ad2a7af79@linaro.org>
Date: Mon, 13 Jan 2025 14:07:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/mediatek/hdmi: Simplify with dev_err_probe
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20250112134708.46100-1-krzysztof.kozlowski@linaro.org>
 <20250112134708.46100-2-krzysztof.kozlowski@linaro.org>
 <ef0baed6-54d2-4f1f-9a4a-769ec09a069f@collabora.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <ef0baed6-54d2-4f1f-9a4a-769ec09a069f@collabora.com>
Content-Type: text/plain; charset=UTF-8
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

On 13/01/2025 13:41, AngeloGioacchino Del Regno wrote:
> Il 12/01/25 14:47, Krzysztof Kozlowski ha scritto:
>> Use dev_err_probe() to make error code and deferred probe handling
>> simpler.
>>
> 
> That's already done in [1] so you can drop this commit.
> 
> [1]: 
> https://lore.kernel.org/r/20250108112744.64686-1-angelogioacchino.delregno@collabora.com
> 
Eh, this was first in v3 in the middle of Dec, so why you cannot get it
merged first? Creating such 34-behemoths causes simple cleanups to
unnecessarily wait.

Best regards,
Krzysztof
