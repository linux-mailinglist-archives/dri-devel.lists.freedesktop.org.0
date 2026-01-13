Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D03ECD173CE
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jan 2026 09:17:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C70A10E2B4;
	Tue, 13 Jan 2026 08:17:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="qNOfMUgC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00E6F10E46F
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 08:17:11 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-477619f8ae5so53570645e9.3
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 00:17:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1768292230; x=1768897030; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=UqrSisus0MAErIVOLJfrHVeAQH6IHBP3UWfckXEzYn8=;
 b=qNOfMUgCaBEddYt6SAOMqOevgYMmOHl8eVXt1+KWEc+MEdXOJ4TOzV9vKMMsr4uUY2
 C6myRnF0DZ8u0714hY02oqw8Lghn3TuV3//Kb/U1pjC0gfkmoK6oBEbzrnUveYqXdqgx
 7dDGOQlCy6UbJShXj7jnIGTOjFQ7SpBeJ1RYF9yTytRHj5YSewvLNSNwGOkJCN+kHv9K
 94aFesX6ym47NQwFOWTLZu6s7YkVDEI+I6U/w9L6iNxRsZ0fubdVZG9hMmvtMbjWROMV
 7c8z2twy6BNuc4nGoDM9yvwAd8kg71Z4hsVUyPkpEIKd6xG4AU39zEFMFTQMziPAbI5x
 uGDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768292230; x=1768897030;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UqrSisus0MAErIVOLJfrHVeAQH6IHBP3UWfckXEzYn8=;
 b=px/WranVyuk0i99AznX1bOQcB6FlrVeU8gXCGATiVCsbm4RWfw+V3mtDtHsLBjzY20
 n5wCzaO6Y6hjef+UZFjDYKovFKzgx59jgTyjRfM3Jk4fOjbEzjx5EonUSZVIOAL+de2D
 RxwU9rDqyPTsrf03QaBf+Byiz6OqzPqi/ofHIjxoAaCQPxyPLiHO81Iguq1ckEno8MAl
 18qP1HzxS4FlgDDyrtRfnFa/NETSrcPrTht5AuJ8w6J4C5DdyNPoLALOR2pMRhJbUHqH
 DhejGjHg3DD+rpgbKJa/pzTAVk6Z7LqQrmdYDVwLaWVPuUuMbKbzWlzujMcf/QbBOdQv
 0xTA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXcWVZLVci3z2G03mT7o5msksP3f03bScTzrzRyyB24Ex4+WTye1kf+YDWlqQucy3QoYbb6tD8nShM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz4Ftfx8LU6dkhnQpIB9QBt03SFl5A2trD1qAJN9DntQi6Q0c3D
 0W6M+tUIkqTRdR1X+DU+7qC32maM6fur1uKTlHYIOSfxe0vF/NFgihbhi23Qg9DHLyw=
X-Gm-Gg: AY/fxX7QHO9b51FbXuEcMjxwCW0s3fliECfbmucCGWEmNrryHNNdU2L9nksyFY/RoOF
 6FYXdYsKZB+HhqW6h39JHojY8s3cOSub0JpWMNbjSWFpAzB/5hiFVVFUPoqyVEQGofkhL+XPLdm
 HEgD8CoRq2/7Wy6Pk2cJHnvJSwcx0L+waOlrEZth8E96kI20WSmaagONQbFL/SCysYESj07Ip4c
 pPoPTsuoOXRLDwxvIiM3dgJgt4mi5MbrigMhQT9ZYhQiDl0oQCf/YxcXieUGQR+LO1Eil4TE6eF
 RBqryZTS4m1knBLs2fu7OtB+Y3XlCe05H+XuIAucD0ZAbTWQDR3YMXB10XpW0xyvCuG9AyN97Md
 5nTtQ1EKgDc7SDowj7gRcD3xP3us0sYXk2OQl3ZbCq+EOBakCmHNtUYRvQ9AX7ZdSqFdnBj2AaG
 qN05xT6pVRKIjx6Y21FqP2P9JjsyApQdU+hD5t530=
X-Google-Smtp-Source: AGHT+IE/Af0e7am5EHJhqwtMQJAYtHfmFKUaSLvohxfAuYyi6lM6S9u92zWhoF35Ue3usR4XnrHH3g==
X-Received: by 2002:a05:600c:3114:b0:456:1a69:94fa with SMTP id
 5b1f17b1804b1-47d84b2d27amr229627095e9.13.1768292230246; 
 Tue, 13 Jan 2026 00:17:10 -0800 (PST)
Received: from ?IPV6:2a01:e0a:3d9:2080::fa42:7768?
 ([2a01:e0a:3d9:2080::fa42:7768]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47d7f668e03sm407284565e9.14.2026.01.13.00.17.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Jan 2026 00:17:09 -0800 (PST)
Message-ID: <bf36363c-9e28-402e-932d-7844a947c73f@linaro.org>
Date: Tue, 13 Jan 2026 09:17:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] drm/panel-simple: fix connector type for DataImage
 SCF0700C48GGU18 panel
To: Marek Vasut <marex@nabladev.com>, dri-devel@lists.freedesktop.org
Cc: stable@vger.kernel.org, David Airlie <airlied@gmail.com>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>, kernel@dh-electronics.com,
 linux-kernel@vger.kernel.org
References: <20260110152750.73848-1-marex@nabladev.com>
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
In-Reply-To: <20260110152750.73848-1-marex@nabladev.com>
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

On 1/10/26 16:27, Marek Vasut wrote:
> The connector type for the DataImage SCF0700C48GGU18 panel is missing and
> devm_drm_panel_bridge_add() requires connector type to be set. This leads
> to a warning and a backtrace in the kernel log and panel does not work:
> "
> WARNING: CPU: 3 PID: 38 at drivers/gpu/drm/bridge/panel.c:379 devm_drm_of_get_bridge+0xac/0xb8
> "
> The warning is triggered by a check for valid connector type in
> devm_drm_panel_bridge_add(). If there is no valid connector type
> set for a panel, the warning is printed and panel is not added.
> Fill in the missing connector type to fix the warning and make
> the panel operational once again.
> 
> Cc: stable@vger.kernel.org
> Fixes: 97ceb1fb08b6 ("drm/panel: simple: Add support for DataImage SCF0700C48GGU18")
> Signed-off-by: Marek Vasut <marex@nabladev.com>
> ---
> Cc: David Airlie <airlied@gmail.com>
> Cc: Jessica Zhang <jesszhan0024@gmail.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Neil Armstrong <neil.armstrong@linaro.org>
> Cc: Simona Vetter <simona@ffwll.ch>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: dri-devel@lists.freedesktop.org
> Cc: kernel@dh-electronics.com
> Cc: linux-kernel@vger.kernel.org
> ---
>   drivers/gpu/drm/panel/panel-simple.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> index 3acc9f3dac16a..e33ee2308e715 100644
> --- a/drivers/gpu/drm/panel/panel-simple.c
> +++ b/drivers/gpu/drm/panel/panel-simple.c
> @@ -1900,6 +1900,7 @@ static const struct panel_desc dataimage_scf0700c48ggu18 = {
>   	},
>   	.bus_format = MEDIA_BUS_FMT_RGB888_1X24,
>   	.bus_flags = DRM_BUS_FLAG_DE_HIGH | DRM_BUS_FLAG_PIXDATA_DRIVE_POSEDGE,
> +	.connector_type = DRM_MODE_CONNECTOR_DPI,
>   };
>   
>   static const struct display_timing dlc_dlc0700yzg_1_timing = {

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil
