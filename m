Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63BF0957034
	for <lists+dri-devel@lfdr.de>; Mon, 19 Aug 2024 18:27:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62CB210E305;
	Mon, 19 Aug 2024 16:27:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="y8i7UXsU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F9DD10E305
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Aug 2024 16:27:28 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-429c4a4c6a8so37084315e9.0
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Aug 2024 09:27:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1724084846; x=1724689646; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=s26y2YASDAdGxsHZ7d56abaHHsBVOs2ZG5NV1yhnbpQ=;
 b=y8i7UXsU3aRsbe506qzLOPHM/vapj1ldkyeojJpHwjCGaDou9xwLwbMJ02oQPXT4bF
 iwAzmf+n5NdUlcUC++qzdBIA6ofvkAtszv+FFb3PWVJIKIFz5vnjdHKaqQzNCVawE8ka
 /oXti43r7q1VDdFtBqVBe84p6Mi2/RKiy2xzfuzzkAnU2fTjzRh0onH2O09Q8urmJLXq
 1HWqXKnHhBoNBlxzxXB1pwKN21qfyQJ6vV1OBvjuas0NlWyAkt3GT3ExcPkGd/P7fAlT
 kBVibjozh5zjOTCc3F3S/OLRGEIf/h1Gc+b9QvhCw3reRFvVaVcthdf/i0sl4V86KMzB
 T8iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724084846; x=1724689646;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=s26y2YASDAdGxsHZ7d56abaHHsBVOs2ZG5NV1yhnbpQ=;
 b=uh7gdDfgIX2RMnlnqrn2I9Xs5vtn0GVWMK8nu0a4tmxSJTcG9fMiCZ0Nf23dR9hgdj
 J7AJ+x7gCeHi5K6YQVcHicS2PlXnLZd6nZxnQ1gyUHE/yY1FOXEDIPcw+4npWQpsZJNQ
 e2Gkg8PRrXloaNFnjYZo1cvkQRrrRUhjz7pY7r9xg1i4iU4pMb5rAwo6RwKl1Yl/JrSf
 8Ig5gxpp9usymCgUIsTnrhLxdvTv6mCwrZN3goIok8TqPbdAzAADz26sFX+9AzpUTXh8
 uPOvuyPZrVij5Kbz9nZl6XyV6jZ0PKbhNcVtmvfYsBp2h3/mV8Nxxdg8uZFGIEFa3W6C
 qEww==
X-Forwarded-Encrypted: i=1;
 AJvYcCVBDzzw7q+kqxYjCKey0GDP0oHMc6CrxA5V4R5FsaEUMGXneAzy9SjNui0jIG+e/fz8rxULRp3IpNSfzFZolJeMRwACbUyCTwxBOGFdsbca
X-Gm-Message-State: AOJu0YwhBVnQ87+N7/ai4kGGHHIZv2PTW6mZv4CqaNHVmhjdleWZbC4+
 ZGgdb6+ZLeVMz1OFnQ04BUwf2FM4PHpmQaQqgkXG6dvvX9oJfDVw1i2fDlnK2oM=
X-Google-Smtp-Source: AGHT+IGyaOFKm6KH67C+5hH2/5G0422FDAPK6JZLNWUTv4Npjeh6t5xLFubuidWWYm7P8IzFY6X6Bg==
X-Received: by 2002:a05:600c:444b:b0:426:6320:7ddf with SMTP id
 5b1f17b1804b1-429ed7f944bmr68331525e9.35.1724084845997; 
 Mon, 19 Aug 2024 09:27:25 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:f54e:4b0a:5175:5727?
 ([2a01:e0a:982:cbb0:f54e:4b0a:5175:5727])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-429ded7d5bfsm171663065e9.46.2024.08.19.09.27.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Aug 2024 09:27:25 -0700 (PDT)
Message-ID: <e8c91a84-bfef-42c0-9e20-91676bb3843d@linaro.org>
Date: Mon, 19 Aug 2024 18:27:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH LATER 8/9] drm/meson: dw-hdmi: don't write power
 controller registers
To: Jerome Brunet <jbrunet@baylibre.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20240730125023.710237-1-jbrunet@baylibre.com>
 <20240730125023.710237-9-jbrunet@baylibre.com>
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
In-Reply-To: <20240730125023.710237-9-jbrunet@baylibre.com>
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

On 30/07/2024 14:50, Jerome Brunet wrote:
> The HDMI phy has a power domain properly set in DT.
> 
> Writing the power controller register directly from the hdmi driver is
> incorrect. The power domain framework should be used for that.
> 
> HHI is a collection of Amlogic devices, such as clocks, reset,
> power domains and phys.
> 
> This is another step to get rid of HHI access in Amlogic display drivers
> and possibly stop using the component API.
> 
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
> 
>   This change depends on:
>   * f1ab099d6591 ("arm64: dts: amlogic: add power domain to hdmitx")
> 
> Time is needed for these changes to sink in u-boot and distros,
> making this change safe to apply.


Well no, we will basically need to wait until none of the stable and long-stable kernel stops
shipping a kernel without this change, but you can check if a power-domain have been associated
with the device and do the same.

> 
>   drivers/gpu/drm/meson/meson_dw_hdmi.c | 4 ----
>   1 file changed, 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/meson/meson_dw_hdmi.c b/drivers/gpu/drm/meson/meson_dw_hdmi.c
> index ef059c5ef520..6c18d97b8b16 100644
> --- a/drivers/gpu/drm/meson/meson_dw_hdmi.c
> +++ b/drivers/gpu/drm/meson/meson_dw_hdmi.c
> @@ -111,7 +111,6 @@
>   #define HDMITX_TOP_G12A_OFFSET	0x8000
>   
>   /* HHI Registers */
> -#define HHI_MEM_PD_REG0		0x100 /* 0x40 */
>   #define HHI_HDMI_CLK_CNTL	0x1cc /* 0x73 */
>   #define HHI_HDMI_PHY_CNTL0	0x3a0 /* 0xe8 */
>   #define HHI_HDMI_PHY_CNTL1	0x3a4 /* 0xe9 */
> @@ -423,9 +422,6 @@ static void meson_dw_hdmi_init(struct meson_dw_hdmi *meson_dw_hdmi)
>   	/* Enable clocks */
>   	regmap_update_bits(priv->hhi, HHI_HDMI_CLK_CNTL, 0xffff, 0x100);
>   
> -	/* Bring HDMITX MEM output of power down */
> -	regmap_update_bits(priv->hhi, HHI_MEM_PD_REG0, 0xff << 8, 0);
> -
>   	/* Bring out of reset */
>   	regmap_write(meson_dw_hdmi->top, HDMITX_TOP_SW_RESET, 0);
>   	msleep(20);

