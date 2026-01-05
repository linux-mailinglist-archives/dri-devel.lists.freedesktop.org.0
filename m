Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EA81CF4558
	for <lists+dri-devel@lfdr.de>; Mon, 05 Jan 2026 16:15:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0D3A10E430;
	Mon,  5 Jan 2026 15:15:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="b9vgEZk7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AF9610E430
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Jan 2026 15:15:14 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-4775ae77516so238775e9.1
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Jan 2026 07:15:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1767626113; x=1768230913; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=HKfozQLf+f+BSP+dhoFOvHJ4Of/2/pO72wQ7CZKrxrQ=;
 b=b9vgEZk71nnO4EOH46hqjdIKRAVb2WHKO1l5EqvJ+rEEM9cb8ydgQrWH28hHrulW1Q
 4za1wwHR3QrqvJrQmroedhsAIyoWQn47jAo/Tm7K435io76iihNRB6+t/snw06OIAz7o
 5vhtyjLKqIrIHgHLArCBvPTDo14eyKVb7RhR5yH6VIqRWyFc73R9/KLtYxZ8gTub0hv8
 rMf3qBxHzSX97V1G0cZbFWSqlVAW6kz82sETT+B+xtoCzQKrfmvXfKihNxMBp3R87Jh0
 gCUdspEOMUc/97m+knpE4JOOoVKbcKjMpC6akJQfH6HKlSccsjn4vFsveUpiGiiLLjW+
 PsUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767626113; x=1768230913;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HKfozQLf+f+BSP+dhoFOvHJ4Of/2/pO72wQ7CZKrxrQ=;
 b=iOBFa+haN3wtHzVlYcOy8VlZ4LTQ3GxMo0KjqYoakhsbDmfoUYYi91+9wdRJ3k2eaw
 4YLvo6rG4B+0rUxonMIrFT/uehbJR7MJLJY6LVo/yaeJnY+GGILFShMbwa5Lq7jj7z2d
 dBbNd1shd/6Frma285704joSxzGTzJL9bxZZmSaXAFksvcZzoaRGUlYUoCF5fdZnWmR7
 IlF6y274ZRiEBLFkBmTDyuNzuvoqrjOWAIcDJzuSn/JPHrL+t1AhMlIcC8OzofgJ4HKt
 E0R3xJ1nlCLqUdVu5GL1/gb/DkzIHQf7bp+hfEhluc2fxp6ef4Homh4y++ZVHvrG5hXI
 a6lg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV8fpjkfOKt9yaFU2e6R8Y8TBDSRs2YdXp0d5kKe5+59PlVE3S44+lMMFeFwzigOHSyb/RbobxvMIg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxLZotKvJws8zxtijXpTYFLc5GUBiQcr5DDQ4P2ixrW8fjAyNNA
 ZE3ZIT/E+8NTb805oz2mVdHu5n711GVyWqVY5H/lyggGbz5iveGKqG2Y4xUNfLMZVV8=
X-Gm-Gg: AY/fxX7wSRpImghGRDIrdBKe9agbJn4uEnKlbCKwQj8Jqfoku9j7rKT8rjkhGsFeLd5
 sDYEagkfkWqSQUkkxyIY1hPRuhBtd8qH0GUQR61LvVXKgFsEbUKHYhoQJ92k5hDCb+BuWgM75Fd
 tCUw/xZ88uZyZTjODDlDbcghu8220wfE9+4iN3ZVfhzGc2t43n6eyAnVXDwUEBhx5gbWVA5KCOs
 XsT4HbnUY6PFK+FI3+BSjefwtJ5wkEHXl76Uuso6iooUHOzzTa4isX3U7rH8HfJghLnw2FxurBc
 YI3TBGEqDtOPcqEy0MY5uYeWg2V+pGBkjbfDn9LFLEFByuQ3+WI/4s5sVfaSyOx+C0zVSPTwu50
 VAL+U3Ywa3wFASZ1XuKZHiWB2KzlafoN528LYRsG2hDTI5mAVmpn/zHgf2HwOKe6ub8HERi17KQ
 OwSVusgXanrDpWDse4O4PMjxx7SuA0jfUbp739Y6wNrgFCzq5POqVozTy7uQKT5h442B53Etybc
 A==
X-Google-Smtp-Source: AGHT+IEwS8uV4JRSNwbLoOmtSpi/827u2JVO0spHe05QjRb7PyUGp1njI6EtpbgwyesxLXgP1Ic9YQ==
X-Received: by 2002:a05:600c:1c1b:b0:477:9976:9e1a with SMTP id
 5b1f17b1804b1-47d1956e545mr649763515e9.6.1767626112937; 
 Mon, 05 Jan 2026 07:15:12 -0800 (PST)
Received: from ?IPV6:2a01:e0a:3d9:2080:d4c1:5589:eadb:1033?
 ([2a01:e0a:3d9:2080:d4c1:5589:eadb:1033])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-432bca5687esm39015f8f.29.2026.01.05.07.15.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Jan 2026 07:15:11 -0800 (PST)
Message-ID: <288c8290-143c-4e6e-8cc5-66b797372ae0@linaro.org>
Date: Mon, 5 Jan 2026 16:15:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] gpu/drm: panel-edp: add BOE NV140WUM-T08 panel
To: Hans de Goede <johannes.goede@oss.qualcomm.com>,
 Douglas Anderson <dianders@chromium.org>,
 Jessica Zhang <jesszhan0024@gmail.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org
References: <20251219085838.98152-1-johannes.goede@oss.qualcomm.com>
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
In-Reply-To: <20251219085838.98152-1-johannes.goede@oss.qualcomm.com>
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

Hi,

Subject should be: "drm/panel: panel-edp:" or "drm/panel: edp:"

On 12/19/25 09:58, Hans de Goede wrote:
> Add powerseq timing info for the BOE NV140WUM-T08 panel used on Lenovo
> Thinkpad T14s gen 6 (Snapdragon X1 Elite) laptops.
> 
> edid-decode (hex):
> 
> 00 ff ff ff ff ff ff 00 09 e5 26 0c 00 00 00 00
> 0a 21 01 04 a5 1e 13 78 03 d6 62 99 5e 5a 8e 27
> 25 53 58 00 00 00 01 01 01 01 01 01 01 01 01 01
> 01 01 01 01 01 01 33 3f 80 dc 70 b0 3c 40 30 20
> 36 00 2e bc 10 00 00 1a 00 00 00 fd 00 28 3c 4c
> 4c 10 01 0a 20 20 20 20 20 20 00 00 00 fe 00 42
> 4f 45 20 43 51 0a 20 20 20 20 20 20 00 00 00 fe
> 00 4e 56 31 34 30 57 55 4d 2d 54 30 38 0a 00 fa
> 
> Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
> ---
>   drivers/gpu/drm/panel/panel-edp.c | 7 +++++++
>   1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
> index 415b894890ad..7b8e5cd41594 100644
> --- a/drivers/gpu/drm/panel/panel-edp.c
> +++ b/drivers/gpu/drm/panel/panel-edp.c
> @@ -1730,6 +1730,12 @@ static const struct panel_delay delay_200_500_p2e100 = {
>   	.prepare_to_enable = 100,
>   };
>   
> +static const struct panel_delay delay_200_500_p2e200 = {
> +	.hpd_absent = 200,
> +	.unprepare = 500,
> +	.prepare_to_enable = 200,
> +};
> +
>   static const struct panel_delay delay_200_500_e50 = {
>   	.hpd_absent = 200,
>   	.unprepare = 500,
> @@ -1975,6 +1981,7 @@ static const struct edp_panel_entry edp_panels[] = {
>   	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0b56, &delay_200_500_e80, "NT140FHM-N47"),
>   	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0b66, &delay_200_500_e80, "NE140WUM-N6G"),
>   	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0c20, &delay_200_500_e80, "NT140FHM-N47"),
> +	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0c26, &delay_200_500_p2e200, "NV140WUM-T08"),
>   	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0c93, &delay_200_500_e200, "Unknown"),
>   	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0cb6, &delay_200_500_e200, "NT116WHM-N44"),
>   	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0cf2, &delay_200_500_e200, "NV156FHM-N4S"),

Thanks,
Neil
