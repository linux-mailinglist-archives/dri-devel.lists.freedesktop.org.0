Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02CDFBE7E32
	for <lists+dri-devel@lfdr.de>; Fri, 17 Oct 2025 11:49:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35C0410E041;
	Fri, 17 Oct 2025 09:49:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="giC0xfHY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D4DA10E041
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Oct 2025 09:49:23 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id
 ffacd0b85a97d-427091cd4fdso136121f8f.1
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Oct 2025 02:49:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1760694562; x=1761299362; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=S8JPhxrGotYF3QDvlp9yLVE5fcIkI/cq1aRqnIuBpzQ=;
 b=giC0xfHYmbhjLrucETV9IXZt58ByHNV9cqoqVrhiFqkRmOBuQaTGQnsbSqLGOB262V
 nUiR8NtUV8dYoxIOYUBD8dMIexYUUMd1B0Qv/io1XPmCV/UVnjeLgxaN/1xsa5ocbPkq
 GixESvy2O1OSpfuFQhV9QtxMR6uOz/xIozX31Z1wVMNzrEIWPRGflEY6jJFvVVIjEAUV
 uyNxIsYGh8UDpH+UjmXOoOWPRIsGuBP6Kbqy9XbLBGNlzXNxMF7FL+aq9qDJCXLFTHCl
 8Ld36mvqEyj2STcZvPfD2tW6rDioefpylKpfuZkNEutW98wyLQyE9sZNVKb1iGp0F5ki
 d05A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760694562; x=1761299362;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=S8JPhxrGotYF3QDvlp9yLVE5fcIkI/cq1aRqnIuBpzQ=;
 b=tct4tVAnwar0bKuDNyDf+BvfJreQ5e3dyDr/yRSOf9bkHRclIJiQZ6n29WLM0U/S9S
 E6gGHmR40R/3NF5rEWxIlj376TPZsKLgjFMK0tnoA0GWwt25Pgg9L0lXvp6Gew6o7mH7
 +Mo21iI5qRgLFbMAs/5yaFAsoddUBhzgcsLkyBWRHOdGIuZ5Irdo3qjEu/mQDvnAbjEm
 AoQZjgvoZr0GMNsUu0gaYGjg7J1suVvdivbFcpwETCUE1/K4R+q620A/zmixv8chR5kM
 8/v1eiWdvQwHoSsJi5wMhAYo6+mFkiPtBr5tJ6uE4hlGcQYCbhlneTMxxCNrQ6PiIASv
 m1hA==
X-Gm-Message-State: AOJu0YyVOTU9+EO6GOsdTGQZNnLUI9Kmj7Rnn5TBpSiDh0iVj2/h/d9l
 oqK1PiqVOePNcy/dVoxJAvN6TBxclYPj3TIw2M1YCmp8UgUK/iYfCP06ZZAnAPAAUzk=
X-Gm-Gg: ASbGncsnYt64kdi5Qy0qD1NOWkbPaqX13wpoUd3ytstdnRqJ9r1+lfGD8CjOp0mKfld
 Z8s+VQSTvZ/E1YywOteCuqnqaZmKIX74a80vdcSoe6SG+i7/XYfbMKiv7snC8LD6B5MH3p46sqm
 0EFB2oWU1xFauqqnZmXdfwH6iA7mTdrtpamYDTKN662bzT8P3MHRt3w6xWwsWUsT7UNRPS79YZi
 412cPNKtHgWsZ+IlBeRmP2aTbv2lpVREqNV4LBA8yL/u4PDpDlXqAt0lZdyJjKmbd9UlFKEPO7U
 PC8+SRdD8KS4JwOuBrvReD+XiP04+0PcOMvDrRBQ8nkyNYu6MaxcSppsUfMRtMaQIzTLGF7IO/9
 I5Zndsbla5Ba0A06e4HdtVjvqk8Aj4Ye8ntVz8g/W5snTCg2VWIwOA62XkmrasM9OtXNrhLVHMQ
 Er2CaD5DPZl2+4sk3Kl0ImIexEnCp54bRSS5gUvIhsEHhbYM5hq4cv
X-Google-Smtp-Source: AGHT+IGYXVXXR9soou2QlY5fvmDy0emyM8wDru5hxk0Z/Fux+gUxcfzTmBtEgW/PNyfNdNzJPuVz6g==
X-Received: by 2002:a05:6000:186a:b0:3ec:db13:89e with SMTP id
 ffacd0b85a97d-42704d1441cmr1773044f8f.7.1760694561592; 
 Fri, 17 Oct 2025 02:49:21 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:5849:4623:6b2a:2be9?
 ([2a01:e0a:3d9:2080:5849:4623:6b2a:2be9])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4710ed57cedsm43662085e9.2.2025.10.17.02.49.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Oct 2025 02:49:21 -0700 (PDT)
Message-ID: <dff86c02-996b-4aba-9f6b-013d1fcb040f@linaro.org>
Date: Fri, 17 Oct 2025 11:49:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2] drm/panel: visionox-rm69299: Depend on
 BACKLIGHT_CLASS_DEVICE
To: =?UTF-8?Q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 phone-devel <phone-devel@vger.kernel.org>,
 Gustavo Padovan <gus@collabora.com>, "kernelci.org bot" <bot@kernelci.org>
References: <20251017-visionox-rm69299-bl-v2-1-9dfa06606754@sigxcpu.org>
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
In-Reply-To: <20251017-visionox-rm69299-bl-v2-1-9dfa06606754@sigxcpu.org>
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
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10/17/25 10:27, Guido Günther wrote:
> We handle backlight so need that dependency.
> 
> Fixes: 49802972d116 ("drm/panel: visionox-rm69299: Add backlight support")
> Reported-by: kernelci.org bot <bot@kernelci.org>
> Signed-off-by: Guido Günther <agx@sigxcpu.org>
> ---
> Changes in v2:
> - Add Reported-by: kernelci.org bot <bot@kernelci.org>
> - Link to v1: https://lore.kernel.org/r/20251016-visionox-rm69299-bl-v1-1-d3b817ae5a26@sigxcpu.org
> ---
>   drivers/gpu/drm/panel/Kconfig | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
> index 407c5f6a268b..59f5a31f3381 100644
> --- a/drivers/gpu/drm/panel/Kconfig
> +++ b/drivers/gpu/drm/panel/Kconfig
> @@ -1112,6 +1112,7 @@ config DRM_PANEL_VISIONOX_RM69299
>   	tristate "Visionox RM69299"
>   	depends on OF
>   	depends on DRM_MIPI_DSI
> +	depends on BACKLIGHT_CLASS_DEVICE
>   	help
>   	  Say Y here if you want to enable support for Visionox
>   	  RM69299  DSI Video Mode panel.
> 
> ---
> base-commit: 7ea30958b3054f5e488fa0b33c352723f7ab3a2a
> change-id: 20251016-visionox-rm69299-bl-7e6a2e30626d
> 
> Best regards,

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
