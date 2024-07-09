Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8905F92B19D
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jul 2024 09:53:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A709410E48F;
	Tue,  9 Jul 2024 07:53:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="w0WmfZOn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com
 [209.85.208.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E765A10E48F
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jul 2024 07:53:08 +0000 (UTC)
Received: by mail-lj1-f170.google.com with SMTP id
 38308e7fff4ca-2eeb2d60efbso10810721fa.1
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Jul 2024 00:53:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1720511587; x=1721116387; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=1AGEuMlgvc+93yz0nFkBwtMqtIlBEUBjzj2ZINl8Zkc=;
 b=w0WmfZOnU0U+8UK+YsavYQnWxNL+NbTIrz5y6caTdZzC3M9eg0AZvLLeZMvTQxpfdY
 hodcjec2vF014zDuubdTkCKJIuzmrYIJoowXQmDP4MxCVd6u08vVHvngDwqjYjSzE/Sn
 UFbGM+4ZbUL9wCY9fOHzah4fT3aBX7i03ZNY2tPH6XD+i/1fVkcu7GJkHTFGHjLuuW9T
 3viCNlB56gsWT6RTEd1tYuxtgYvl/Vaj5nBHXUqwm6hrITXz9xHIl7EctdDgfbytG7WS
 GWagN+iqHo8imZu2I/XQxyZ6lIWeSJMt2CwDCoW9FaWIRNWxQifkQpahVxV77zazGA2T
 7UzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720511587; x=1721116387;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=1AGEuMlgvc+93yz0nFkBwtMqtIlBEUBjzj2ZINl8Zkc=;
 b=i89TK909YEY4jCtpNC65wHpWH53AeVDavGLV1+fiYx1G6JBq0zrhuo5zTHhcn+5GlC
 Sg0T5neMRssE0RZrC9WryvqYZB1IpQboyD3zWEgbMWWkqaWlu+do75tSBWuNg455pWmR
 ZOz9WMdyN20eC5D/W4LyBnfMzXSniyf5GrsMUlGxGxgFFsIc8nbLzDkAxJilUXZD0J0b
 bqw6KKdiDpZI5S/oBc7FBEsbF3cWcWhm0fMvMQpiPoN7jVWXZWh+l4uzOi9JUIc2IlV+
 0lFg9ysEzSPAo59kc+lHzI8E0/eaEafe2W/YajP2j09nqI68Rz9834vlNObO7C3IMPJ8
 wjxQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXjGbc8VicgW0Kbf9WEyaRG2t0nmPSJmkwgCfC3erjZtQuWhq40tEw6tzpfxa5hTbCsrnpGOXYe6jkj1mVynN8JzegdhrepI3YvZVKGNcsR
X-Gm-Message-State: AOJu0YyaljEPFICcxMdH0zxc4ActuzN32T1uyTwNyBqUhheNeNrvDK3a
 7x+vGDKjzyC78nox52qGyJmw5Q8/27qEDWmyZ0QYRylFQul4RyaijrHiSsbyXQg=
X-Google-Smtp-Source: AGHT+IGxLTU8fE9QuMwbFmLT718J7M+v5z1Y3xAsljjNF9JsHFKbDVR7hOBIxdvi3QH6AzRkxyiunw==
X-Received: by 2002:a2e:9f03:0:b0:2ec:57c7:c740 with SMTP id
 38308e7fff4ca-2eeb31717bdmr12490661fa.39.1720511586666; 
 Tue, 09 Jul 2024 00:53:06 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:cad:2140:b12a:8461:5e2a:dfe?
 ([2a01:e0a:cad:2140:b12a:8461:5e2a:dfe])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-427265d6ebasm1882975e9.41.2024.07.09.00.53.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Jul 2024 00:53:06 -0700 (PDT)
Message-ID: <ba539524-d0bf-4a22-9872-7c8347d88abd@linaro.org>
Date: Tue, 9 Jul 2024 09:53:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] drm/panel: sharp-lq101r1sx01: Fixed reversed "if" in
 remove
To: Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Dan Carpenter <dan.carpenter@linaro.org>, Maxime Ripard
 <mripard@kernel.org>, Thierry Reding <treding@nvidia.com>,
 kernel test robot <lkp@intel.com>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>, Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org
References: <20240708105221.1.I576751c661c7edb6b804dda405d10e2e71153e32@changeid>
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
In-Reply-To: <20240708105221.1.I576751c661c7edb6b804dda405d10e2e71153e32@changeid>
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

On 08/07/2024 19:52, Douglas Anderson wrote:
> Commit d7d473d8464e ("drm/panel: sharp-lq101r1sx01: Don't call disable
> at shutdown/remove") had a subtle bug. We should be calling
> sharp_panel_del() when the "sharp" variable is non-NULL, not when it's
> NULL. Fix.
> 
> Fixes: d7d473d8464e ("drm/panel: sharp-lq101r1sx01: Don't call disable at shutdown/remove")
> Cc: Thierry Reding <treding@nvidia.com>
> Reported-by: kernel test robot <lkp@intel.com>
> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> Closes: https://lore.kernel.org/r/202406261525.SkhtM3ZV-lkp@intel.com/
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
> 
>   drivers/gpu/drm/panel/panel-sharp-lq101r1sx01.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-sharp-lq101r1sx01.c b/drivers/gpu/drm/panel/panel-sharp-lq101r1sx01.c
> index edc9425bb143..a0d76d588da1 100644
> --- a/drivers/gpu/drm/panel/panel-sharp-lq101r1sx01.c
> +++ b/drivers/gpu/drm/panel/panel-sharp-lq101r1sx01.c
> @@ -362,7 +362,7 @@ static void sharp_panel_remove(struct mipi_dsi_device *dsi)
>   		dev_err(&dsi->dev, "failed to detach from DSI host: %d\n", err);
>   
>   	/* only detach from host for the DSI-LINK2 interface */
> -	if (!sharp)
> +	if (sharp)
>   		sharp_panel_del(sharp);
>   }
>   

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
