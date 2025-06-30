Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 443BDAEE2C4
	for <lists+dri-devel@lfdr.de>; Mon, 30 Jun 2025 17:38:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 243B610E493;
	Mon, 30 Jun 2025 15:38:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="dWVvKfHT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FE7410E493
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Jun 2025 15:38:06 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id
 ffacd0b85a97d-3a575a988f9so3012659f8f.0
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Jun 2025 08:38:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751297885; x=1751902685; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=kBYBhwpcRxY/Jd/+CDN7HzCgINH4+hZjztRmKZJOT7Q=;
 b=dWVvKfHTe9aJQMLJxpKHd711ojDRBZQr76aXylDssv27QC8UZgGaTq8jab9H31dgYG
 TOoIQlrzfE8+3GO46hLQtG9+ESdKLbde+X2RgSMjfE8FH0CgyN5YeCtVawMbT7jTP7rD
 UGaxmxLw9lllPpYvpk6dEjAowugn2EyCX2gTqyBBd8r4tQW3jHbVUQaUOH6qRsXyQDQj
 38Rat565/uCxTRu5cSICOFr3k9CYKGX8IVpzFXieZfzPJVfZGBY6eWvTPnImL0PkXSdn
 4YetbjAyuuuvrFoHD1R7gRHNLaFBh/RcSZe8xJRnCSKiMVjYhMrcUpS8KadW0dvZpnSg
 3OQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751297885; x=1751902685;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=kBYBhwpcRxY/Jd/+CDN7HzCgINH4+hZjztRmKZJOT7Q=;
 b=rUy+kIjpSAG2yks4GKkTr+cmB9Go1pz3h2dbTtJpGpvB8jtRIgS+sTgJPUTr0KI5gF
 ehu9a4R8F+4BIOBn3OB7+krItkyXKELorqfdNzIhOtCjI7PVENDpPTFWx7vAh00mluGA
 w69JmnEbsxuKQX9URTIKPJFZ4AwpMi6z3MMZj528Q844F7nuehw3nW9zaH2uTjXEXZWc
 JogoF7ennpVJs5Ld4Hof4mrbaCmF4p/K+NH6VExfQtxqGGRbvMsKgOIMMl8H+ocXK2tF
 xuqPBtA+u0HAQFQdnXCfezN4Od+W2WYSZzBa2OAUDOWqrrNm4UhtntWItFpeceWnL+er
 Xwhw==
X-Gm-Message-State: AOJu0YxeIPIP//8CCxrvBvU22hWhwYOz8OQuysFUKwtKEiczVRlUDt5I
 /xFw+PUk6UjJoY8+CdzKpv5dkhnxciM8hX8mP7XlimowA0kdvP8oQ8Phhf2eIZulnhQ=
X-Gm-Gg: ASbGncvA9xvKWMUMt9Rl3wVEcjabUoRlW9Qz28avSoEgDjrro8d5jaiwhsYTtHNAaNO
 UUZYuPoj5nwrYdu0D597f9FqpLBaYM7yliEjMVg5RKA2RHCGxY+ti7+AyTthfA6nfwizPllGZgU
 qtcRbPIBpR2UM8XmO+pYzvpP+gEKZfAYug4yuIVjcjBYKtf3qTsfTf7CakolMXY9sEmiMpdsg5t
 pKAMpY0h4d5S/Y/Kk1A0eURse0ALs3FTVO4W+/g0Oy3YT61useNuNGgI+xjrFpE/Pz513BczMcz
 cHxcEoiCrkctrId4ZDpepKVYoHOfeltD6u8fFcJdaD0g5P/oDr4tu7+cjT2RabXRk0sWzwH6S9x
 YurXQh4IdJSyHE3YB2kgpEALe1aHi8Vp7K2xSxoI=
X-Google-Smtp-Source: AGHT+IEUoU94cC1oSfUzyPImh52uwvVHhB7U9vQp9z63F5Ex8cmoa1pH/HClg421+oFMMIOZeEylog==
X-Received: by 2002:a05:6000:1789:b0:3a4:eecd:f4d2 with SMTP id
 ffacd0b85a97d-3a9001a1ab3mr12911355f8f.38.1751297885084; 
 Mon, 30 Jun 2025 08:38:05 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:abe8:a49c:efe7:4dfb?
 ([2a01:e0a:3d9:2080:abe8:a49c:efe7:4dfb])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a88c8013fesm10907124f8f.38.2025.06.30.08.38.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Jun 2025 08:38:04 -0700 (PDT)
Message-ID: <ad40d0c9-2bf1-476d-b3bb-0c6ee165a784@linaro.org>
Date: Mon, 30 Jun 2025 17:38:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 2/4] drm/panel: samsung-s6d7aa0: Drop
 MIPI_DSI_MODE_VSYNC_FLUSH flag
To: Philipp Zabel <p.zabel@pengutronix.de>, Inki Dae <inki.dae@samsung.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Artur Weber <aweber.kernel@gmail.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel@pengutronix.de
References: <20250627-dsi-vsync-flush-v2-0-4066899a5608@pengutronix.de>
 <20250627-dsi-vsync-flush-v2-2-4066899a5608@pengutronix.de>
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
In-Reply-To: <20250627-dsi-vsync-flush-v2-2-4066899a5608@pengutronix.de>
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
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 27/06/2025 13:45, Philipp Zabel wrote:
> Drop the MIPI_DSI_MODE_VSYNC_FLUSH flag from DSI mode_flags.
> It has no effect anymore.
> 
> Acked-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
> ---
>   drivers/gpu/drm/panel/panel-samsung-s6d7aa0.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-samsung-s6d7aa0.c b/drivers/gpu/drm/panel/panel-samsung-s6d7aa0.c
> index b5b9e80690f66cc62acbd341865d8d47419e498b..692020081524ad9d1bc815464fa447b5a2d9241d 100644
> --- a/drivers/gpu/drm/panel/panel-samsung-s6d7aa0.c
> +++ b/drivers/gpu/drm/panel/panel-samsung-s6d7aa0.c
> @@ -244,7 +244,7 @@ static const struct s6d7aa0_panel_desc s6d7aa0_lsl080al02_desc = {
>   	.init_func = s6d7aa0_lsl080al02_init,
>   	.off_func = s6d7aa0_lsl080al02_off,
>   	.drm_mode = &s6d7aa0_lsl080al02_mode,
> -	.mode_flags = MIPI_DSI_MODE_VSYNC_FLUSH | MIPI_DSI_MODE_VIDEO_NO_HFP,
> +	.mode_flags = MIPI_DSI_MODE_VIDEO_NO_HFP,
>   	.bus_flags = 0,
>   
>   	.has_backlight = false,
> 

Acked-by: Neil Armstrong <neil.armstrong@linaro.org>
