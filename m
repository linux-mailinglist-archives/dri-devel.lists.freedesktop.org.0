Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60976B1A5B1
	for <lists+dri-devel@lfdr.de>; Mon,  4 Aug 2025 17:18:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDF2710E58A;
	Mon,  4 Aug 2025 15:18:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="WJARCgoV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1CED10E582
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Aug 2025 15:18:36 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id
 ffacd0b85a97d-3b7823559a5so2684924f8f.0
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Aug 2025 08:18:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1754320715; x=1754925515; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=iL7IFMvc8wLKq8rBuGiTsCRRIzIzTfNl4qmdrsNEzFY=;
 b=WJARCgoVTk5sQ5RR1hQoR6eIWvGmHBMmXsbdYBWo13Ab6Juwj2OR717NlzApkUvAXn
 1eKD6Kou1YNOIbSq/KxAuM4QKvGcBiWN3ABLuWrxLlh5XH+CsgmumJUrP/ohGrxixcpM
 Cgxemus2HCNkeyZAsrc134b9ZWXIOBXFWSbKZZuyBXN8TCNRfvSu/Kfnc0TD8f+V3+mf
 r7DDZ5RwdR8ds5aMdxL9xN7Q4YxN0e7E4IfzPwd40R5N4E60spwZ6+gkQtjUsuuDewZT
 hBUELWse63k+8TubLew7bbkFVvv/HEvKoFGupOxL8h2EMceyne+dmKCundlBSiJkiycR
 tGVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754320715; x=1754925515;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=iL7IFMvc8wLKq8rBuGiTsCRRIzIzTfNl4qmdrsNEzFY=;
 b=tkTZuJpnYhA+18SHhjVSVwBqcNSbGtxDRH9gfyew5sf/l9UAJK1Dbso3okeRXAdwQm
 XLnf02Gp2am0KM1qKfa+Qh7o9mq92EAE0IeAUyP3NdsmaCf7xFDeuClPvENVJIu/JxMQ
 8BoN8fHvTWTtJaTjjxy6GAdOX4T+2j59dtRRsTdVNUXZk05LhG1JttoPEhuc/CH6n2hv
 7l73Y7iHT/MzATyJzOYdBHemcABAAtcxvuUWsUYzBfkx8eKkfhw1Ojbfqyvh8J/l4Bx4
 Ss574svaKhPwr/7BekTpFXotKItc/MBJDNG28NE2cRixY8Z/NwXcaOpooLmff8XQiBLn
 FiLg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWEzuWdEmWUYOcDXNqhbbKTDbGYRMyT6bndE8V35RKDV3VgrlTKKDlO535BOYY46x/fobbrcdhUP2w=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzOZ1lrqAUN/G/OgkX0G7JVuJtCdIKYD3lwgtNIQvCHIc9GxJIX
 KlDb2z+mI3iP3FVEd3lSAxkAVvTFDzqhaAB7w6BHkwaxk271roV1LUoYJskBWWObtwM=
X-Gm-Gg: ASbGncvHXc5iQZq0EsT2b8+1Ble/RZnQ9DXDDFaUjmhr0MS1xqetDxDhdz8TiTUFLy8
 dhGP9p04Oj7yA/Q/8v25XYS19H9Np0PTY+eqVozYULLaeXGiouGNUCc9AubHCUQf4kk6eLjc65W
 WR46vsdSE6YU5a5JQY3uWrDnqDh5gWiX7Cz80BIuMVOJ43bAhAA0dV3jbIrGb0jJyagFAXVxnXB
 oTaWhDYLNlXvAgoh+3ons4u6Tk/0cqwckLrcTbF1qzweFV1J4rEwt2StI3PRGlusYSTl4V7AaZo
 iJoaIwC9GcvArYvlygVZc3N18EVQcOWtym8U5HXu4KezPcypkRzk5BH3gmeY+LjSa/VPRiUut55
 SVH9nXAJuaNZbeqiCG4XQOqqqdKzZaq0hpvth/YgiYsikQAEKf5fIjz5tMuqrGZCugkpjLwRgdk
 A=
X-Google-Smtp-Source: AGHT+IFfE2FIPhBXbo+AP0ydJZgR6yekMgYlyMJQkdPFgTiEDAAmafTjclkHiPKnRWkqltGUi4iXnw==
X-Received: by 2002:a5d:5d0e:0:b0:3b7:9a01:e4f7 with SMTP id
 ffacd0b85a97d-3b8d94d3819mr7248306f8f.54.1754320714882; 
 Mon, 04 Aug 2025 08:18:34 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:3030:f63e:fedd:700f?
 ([2a01:e0a:3d9:2080:3030:f63e:fedd:700f])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b79c3c51e2sm15538840f8f.32.2025.08.04.08.18.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Aug 2025 08:18:34 -0700 (PDT)
Message-ID: <740e6f22-632b-4f67-a61c-2b207570b4b0@linaro.org>
Date: Mon, 4 Aug 2025 17:18:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] drm/panel: sitronix-st7703: fix typo in comments
To: Hugo Villeneuve <hugo@hugovil.com>, =?UTF-8?Q?Guido_G=C3=BCnther?=
 <agx@sigxcpu.org>, Purism Kernel Team <kernel@puri.sm>,
 Ondrej Jirman <megi@xff.cz>, Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Hugo Villeneuve <hvilleneuve@dimonoff.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250721152818.1891212-1-hugo@hugovil.com>
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
In-Reply-To: <20250721152818.1891212-1-hugo@hugovil.com>
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

On 21/07/2025 17:28, Hugo Villeneuve wrote:
> From: Hugo Villeneuve <hvilleneuve@dimonoff.com>
> 
> Fix typo in comments:
>      souch -> such.
> 
> Signed-off-by: Hugo Villeneuve <hvilleneuve@dimonoff.com>
> ---
>   drivers/gpu/drm/panel/panel-sitronix-st7703.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-sitronix-st7703.c b/drivers/gpu/drm/panel/panel-sitronix-st7703.c
> index 1a007a244d84..6c348fe28955 100644
> --- a/drivers/gpu/drm/panel/panel-sitronix-st7703.c
> +++ b/drivers/gpu/drm/panel/panel-sitronix-st7703.c
> @@ -1,6 +1,6 @@
>   // SPDX-License-Identifier: GPL-2.0
>   /*
> - * Driver for panels based on Sitronix ST7703 controller, souch as:
> + * Driver for panels based on Sitronix ST7703 controller, such as:
>    *
>    * - Rocktech jh057n00900 5.5" MIPI-DSI panel
>    *
> 
> base-commit: ba0f4c4c0f9d0f90300578fc8d081f43be281a71

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
