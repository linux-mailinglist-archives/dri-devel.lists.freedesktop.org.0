Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F02F6A4213D
	for <lists+dri-devel@lfdr.de>; Mon, 24 Feb 2025 14:43:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3827310E45A;
	Mon, 24 Feb 2025 13:42:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Le163g72";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0894C10E16F
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Feb 2025 08:39:06 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-4399ee18a57so23588885e9.1
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Feb 2025 00:39:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740386344; x=1740991144; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=sK3C+y9SW9Coh39Uk8y+GEOLM7p3ebzwSbAot9WE95s=;
 b=Le163g72YUEH6Y6Oo4D5R5FjE14u3RdDNzSop+s4zuTSl799FtAV/v/pS7uNAubXdL
 k7MxjZHhF+HLjq7viFCX+Riel7+EADBXOKJm4+MlbAt8Z4yBlycj6OEkTtDBmfBGXb2Z
 UKFeF0/zlOOb6yMElWmvuaWtGw1fDbSQGeWLB2r1VmGKeiKrlbb2PFU0HXxrJ/CDR+dB
 dwx225aT5P8JjxTTjr0oravSJ10GLdYobYLebqLjO7IwlV0nrN7GeNBUubBW4OTwUe5Y
 HMdUhJA0OoGsicpZu/4PTl1/X2z0yOiYzWgi85MqGc9OETYhgoHLvoBZcWrKKk6XHmeV
 TLQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740386344; x=1740991144;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=sK3C+y9SW9Coh39Uk8y+GEOLM7p3ebzwSbAot9WE95s=;
 b=ifypoGT9XeTBEqNLS/VME9f2diSOZrpyXwdQah4kJqBvWyNJ2jgDM/3sarf47Oh1rS
 Rjay+sYYg5lUUngeIfKzp27Ojn/zYUp90my4MACdiNbvgWQ7VmX1qCoIssm6H1xDpg5d
 FJfh6BSdBxGAHVBrnWighpzBxWSPvPoVDbi4GkhAIZPjYgcO9rXPxf4WOuFCwzmxTUAS
 GXRTKG3UptKeVJ/GWzJYoL6kyOnKjqMUrLukC8iRUiy9dbc2wpE2T640kNOxwC1c905b
 c9DOzEnf64yRNLJXMXszFhB9OIT/pxOvYBzhrUjQBxNmVwsisbSlDulluVrb1xcuNGBR
 seKQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWxvEnln0vpy5wzXSxlv664lj53DNn7Ioe5JJMZZos1iRJNzbp8Kc14h34mknru7GlbflLVgJp6mPs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzJO+AmxtefQeeo1Ic3QI6tHNDvC+p9gOByzOxDlf0xMsnNnHfE
 1oyIVd3OSTQGaXS+HnUEYfASrAwCp2+EH3wbSyYwZIjnfMs30vLEtBfrZv8K+g0=
X-Gm-Gg: ASbGncu4nAOuZcvmMdIyREnbn3kXjCygdWlKl983wHZVifCGX5Qr/3vF94Pqx+Ve8Aj
 c8QET7cl7WXTtIJEq42Y9rIk2X4ADmSNxyRoWM3j2Y9wmMIhYRd5YYThgODGghegeGCJrpC6Fhy
 W5H58wCfceiiRLIvKxU0/eMXrf0R6Bslblmsbt6l9wWCwbqoFYaL/xKDZ7HLDV53ZNuCQ0yUQES
 uHiJezanfdc2+WdRJC534U0lCuIDPAbnsGNffdGsEgZmTWGm8WB3PvNaSfjFDm1knBilvZp8iw2
 ktjazvz41P7MFNMctqVbU/xJev8Vln0LpTB0ngLRoUlYh9R5Mv7cFhu2Ryk2lOPQSHfh/ghtAFG
 8Fb8=
X-Google-Smtp-Source: AGHT+IEEJX6T6GgItatrLUOO4eq1TE6WCfNa/DqbWsLOIOCWLzZKyFG0bwOQ4opt5Ug5hrQOAM7F1w==
X-Received: by 2002:a05:600c:54ea:b0:439:871d:d4c0 with SMTP id
 5b1f17b1804b1-439a2eb09f6mr130885245e9.3.1740386344324; 
 Mon, 24 Feb 2025 00:39:04 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:825b:5392:ef70:cc0b?
 ([2a01:e0a:982:cbb0:825b:5392:ef70:cc0b])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-439b02ce4e9sm100644875e9.4.2025.02.24.00.39.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Feb 2025 00:39:03 -0800 (PST)
Message-ID: <92321fed-28b3-454e-b187-7ecfe4ce27ae@linaro.org>
Date: Mon, 24 Feb 2025 09:39:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 0/2] drm/meson: vclk: revert and re-fix vclk calculations
To: Christian Hewitt <christianshewitt@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250110074458.3624094-1-christianshewitt@gmail.com>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <20250110074458.3624094-1-christianshewitt@gmail.com>
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
Reply-To: neil.armstrong@linaro.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10/01/2025 08:44, Christian Hewitt wrote:
> Patch 1 reverts a previous fix for loss of HDMI sync when playing YUV420
> @ 59.94 media. The patch does resolve a calculation issue. It also makes
> all fractional rates invalid which is a bigger problem.
> 
> Patch 2 provides a proper fix after I figured out the actual root cause
> of the original problem. This time the maths checks out.
> 
> Apologies to the stable team as the original patch has been applied to
> a wide range of older and LTS kernels (as far as 5.10). Please let me
> know if combining the two patches into a single 'fix the previous fix'
> patch would be preferred?
> 
> Christian
> 
> Christian Hewitt (2):
>    Revert "drm/meson: vclk: fix calculation of 59.94 fractional rates"
>    drm/meson: vclk: fix precision in vclk calculations
> 
>   drivers/gpu/drm/meson/meson_encoder_hdmi.c | 42 +++++++++++-----------
>   drivers/gpu/drm/meson/meson_vclk.c         |  7 ++--
>   2 files changed, 25 insertions(+), 24 deletions(-)
> 

LGTM

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
