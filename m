Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 96A678B25D7
	for <lists+dri-devel@lfdr.de>; Thu, 25 Apr 2024 18:00:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79C98112F62;
	Thu, 25 Apr 2024 16:00:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="D9slXrIy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4720B112F62
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Apr 2024 16:00:45 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id
 ffacd0b85a97d-34782453ffdso1072754f8f.1
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Apr 2024 09:00:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1714060843; x=1714665643; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=wGYFYnULTAAU0aFrjX7VVM7UZ6GIxaemoe8H8xCPZbQ=;
 b=D9slXrIy7At4D3+xHk+otKu2nCXMlVrH/FEQssE7/DaO62Ga7iG8WM/5i4syetMoEu
 MZb1+uSD592PKS672aTE/L9k77g2YTb2pirWlrIhNB31+PJ9kkYxbJCQcQ6maS2ClXRo
 twxV4WOVlRLlRrE5sqyULaWe+86G3h+QDcc9Jsqi+tdpvpp/r/y31UejHBH2TALd2V5p
 95sgUIoPJf20zO98V+YJEwScCWrFjd/Pw+0JEVo0Gdnu43uoUf9695qxY2EhdLnllZDA
 W1LvMb0Cu9+Xf9bL65YLyg7WCN3YfgAu+okr9ifWvptXMfnUjN+cN+bOl8q9jbvzHYHa
 OKGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714060843; x=1714665643;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=wGYFYnULTAAU0aFrjX7VVM7UZ6GIxaemoe8H8xCPZbQ=;
 b=ZSF2UToEovyOANSkgo+r4RxbjKMlqyswjTFLleN8HdByJt3MjMbdnAoYctkR1fHkdN
 1fYTfjstEk8rZlg3D2zLud0F0S8LiF5tuKeD67SpimpP9J/59w8FrI+c+y1QRi1fWZ2H
 SWEx3hqNFMBRNfIlOgHpL0YxejanJQR/3XTJ6SeWv4+cNcmFLIIP8gq0XFbr+LqNs8DI
 RWbrOhUxKrutYlIRf0DU57YLdeOaddh90ICt2ykZYVX1fDsji8/Jwe+f8fzYjWpVcGdF
 khqNvTC4SZSKCgkqVuqu2iVk/I9FtG8NL8Slbs/ixwfoC3Jko6UMlZt5OyCV24dF9+rX
 JKww==
X-Forwarded-Encrypted: i=1;
 AJvYcCUfXtLkMFEJUmrWqWC4O0e0ihCiANr+LBhuxWjx3+R1BH1dLRDrOqg32wpFlNT40yatNYiLfUma4RHViIkcaxqbZ0/np1J50DqrZTdsuoGT
X-Gm-Message-State: AOJu0YwV22qZ+VHYHVY8DnRHFrrJ6Mr+Vz62LbPrQ0VzQhEzUgelQJ/Y
 UfbGY7lFF5uMfr/Ys/v+M45715sbdHrzgrj/5f8eUFzzQ6jysoRYy92diuLChe8=
X-Google-Smtp-Source: AGHT+IHDrrx5zIevOrXHuv98ZaOQmOYkhPHMInLfyTpExcxkK+PVCMoBfbV/yH/h1aVwEACnI2JMDg==
X-Received: by 2002:a5d:4746:0:b0:349:f83f:9ebf with SMTP id
 o6-20020a5d4746000000b00349f83f9ebfmr5834974wrs.5.1714060842837; 
 Thu, 25 Apr 2024 09:00:42 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:15c7:bd9c:c500:ed62?
 ([2a01:e0a:982:cbb0:15c7:bd9c:c500:ed62])
 by smtp.gmail.com with ESMTPSA id
 q12-20020adfcd8c000000b00343cad2a4d3sm20072228wrj.18.2024.04.25.09.00.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Apr 2024 09:00:42 -0700 (PDT)
Message-ID: <c47e814a-f609-450a-aa20-9342034475e2@linaro.org>
Date: Thu, 25 Apr 2024 18:00:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v1 1/3] drm/panel: ili9341: Correct use of device property
 APIs
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Randy Dunlap <rdunlap@infradead.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg
 <sam@ravnborg.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
References: <20240425142706.2440113-1-andriy.shevchenko@linux.intel.com>
 <20240425142706.2440113-2-andriy.shevchenko@linux.intel.com>
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
In-Reply-To: <20240425142706.2440113-2-andriy.shevchenko@linux.intel.com>
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

On 25/04/2024 16:26, Andy Shevchenko wrote:
> It seems driver missed the point of proper use of device property APIs.
> Correct this by updating headers and calls respectively.
> 
> Fixes: 5a04227326b0 ("drm/panel: Add ilitek ili9341 panel driver")
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>   drivers/gpu/drm/panel/Kconfig                | 2 +-
>   drivers/gpu/drm/panel/panel-ilitek-ili9341.c | 5 +++--
>   2 files changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
> index e54f6f5604ed..2d4515555820 100644
> --- a/drivers/gpu/drm/panel/Kconfig
> +++ b/drivers/gpu/drm/panel/Kconfig
> @@ -177,7 +177,7 @@ config DRM_PANEL_ILITEK_IL9322
>   
>   config DRM_PANEL_ILITEK_ILI9341
>   	tristate "Ilitek ILI9341 240x320 QVGA panels"
> -	depends on OF && SPI
> +	depends on SPI
>   	select DRM_KMS_HELPER
>   	select DRM_GEM_DMA_HELPER
>   	depends on BACKLIGHT_CLASS_DEVICE
> diff --git a/drivers/gpu/drm/panel/panel-ilitek-ili9341.c b/drivers/gpu/drm/panel/panel-ilitek-ili9341.c
> index 3574681891e8..7584ddb0e441 100644
> --- a/drivers/gpu/drm/panel/panel-ilitek-ili9341.c
> +++ b/drivers/gpu/drm/panel/panel-ilitek-ili9341.c
> @@ -22,8 +22,9 @@
>   #include <linux/bitops.h>
>   #include <linux/delay.h>
>   #include <linux/gpio/consumer.h>
> +#include <linux/mod_devicetable.h>
>   #include <linux/module.h>
> -#include <linux/of.h>
> +#include <linux/property.h>
>   #include <linux/regulator/consumer.h>
>   #include <linux/spi/spi.h>
>   
> @@ -691,7 +692,7 @@ static int ili9341_dpi_probe(struct spi_device *spi, struct gpio_desc *dc,
>   	 * Every new incarnation of this display must have a unique
>   	 * data entry for the system in this driver.
>   	 */
> -	ili->conf = of_device_get_match_data(dev);
> +	ili->conf = device_get_match_data(dev);
>   	if (!ili->conf) {
>   		dev_err(dev, "missing device configuration\n");
>   		return -ENODEV;

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
