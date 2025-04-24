Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C23CA9A417
	for <lists+dri-devel@lfdr.de>; Thu, 24 Apr 2025 09:35:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCBB910E746;
	Thu, 24 Apr 2025 07:35:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="q5lpQgV7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F18610E746
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Apr 2025 07:35:23 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-39ac9aea656so827116f8f.3
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Apr 2025 00:35:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1745480121; x=1746084921; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=NXlYjjVy/mEfKMv4LTdScgURSp3z8wVfLOByn6QRb6Y=;
 b=q5lpQgV7STfWpe10u6Sq3azTID8l4ccMyxMjBONwKg4i/dmjRhBOi/j937KHMBN0OO
 VBh0xbU+5AzxkuOzUjGE8f8iWtCvCS5N+fgt+GIOAt15HEJXGwlbSBUWtoOChE4XXkW/
 gAyFYQkIfkRGF57Tto2wDDAzv5l9qT7xUOJJ0EOIe87+TG1R2zKcRvliYAdB+SXYp4kM
 dfYPYjYFfsQLuBBw6hV5Bo/gfSIC4mMXS0Yqmto8qYiEsMPa0TlSu1+lPU+R0mF5esj/
 u+94wJ59L+xpxnO5lkZ4hh5dxP0zcWFosish2s3MMhqviuCAhBMqnm0l/l5JRnI4mHJE
 0+fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745480121; x=1746084921;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=NXlYjjVy/mEfKMv4LTdScgURSp3z8wVfLOByn6QRb6Y=;
 b=xCBhSDatjXYJ1yQmW7uhF6DU1r9lssShtLAN/0A7lrwZAfDb8hb2dtEq5NbAN+VGjw
 Yf5P4Y+KxF4vgj1W0uyQ2wyiX8GgG1SFpJrd2gi/0EUn7P7WPbpokb5trDOf/LvN10y1
 Nucf1viwTx37S1rk6J/1uXYOG1jgTGPtkVcceYDtSIJOw/BkQWO8KoeFSy6r9pWNzxW9
 3CQO15AORBZgOol4X2OX+PqlRxEh1OcZvV65/dXsfhla73r4b7DY8AFESE+yOetyTfTd
 mXOO3o6SBMzkM0kETuWwlNFY2jjKx7IqSjhEHP9Wn3FCX7rJTW+MYrRDHCRpoRuj4W/y
 q3fQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU0Omyy3Xm3kZFC4ZTtwHV43saFtbspt8LEYDlG7wFon6ZgtFymT5T8jiySjN/sDJPw8Ov8zy29U58=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YySsCK5hDe/+mefvL28L9NCo1/h6sAcHb44lfQTiFRHgh4brFKq
 59aGtUV5EB+Ty/hQ4nVwSsuBHX/+jX1M1PvVbH6YdvXs7ccMG3AmEu7Gb8P76fA=
X-Gm-Gg: ASbGncv2ROFD6t8SSr+bANpMWoDWK5cEy+TCRVQ0HgqMwjHOl7FPZbZpJlDhXrGW15n
 Knt90rtiibvgvbz4cU5mM12nguQA6JzVbZLvYgJ80q1GJWhOvX7YLVnXmFJ8SQhe9mPcfirHFIY
 y0fsdYH+4RtdcKG6kYdfXb8uFQ4jE/VRmRFcyUlAaJ+ZsHXGJB54vqk5YMYV7U9iiRAInstLdH8
 hKQH9BkGXbCcwHgGvVTKj/cSx3neh4sO8Nhu8dUvUusDYWN6fHTf6VZh6WL2kntRA3+lVM+7TGa
 jMdCQoGdd2fLY4M4ZblI2lctFcG+ydSayOj9Bqwq05bX0imuYvUOA6uXXpeGB+kIPqQdD2kxXJF
 eJA86OuwqPyVhydMCKHN/YcD9oV+t
X-Google-Smtp-Source: AGHT+IGcEWttEyWTq5B1l601OvcNgkQkRe4PgweFiFHW9TRCY66ESSb0W1W/0ogB3wW3F9wIzHy0ww==
X-Received: by 2002:a05:600c:1910:b0:43c:e70d:450c with SMTP id
 5b1f17b1804b1-4409bd8fd96mr9970555e9.22.1745480121293; 
 Thu, 24 Apr 2025 00:35:21 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:a24a:bfda:f031:720d?
 ([2a01:e0a:3d9:2080:a24a:bfda:f031:720d])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4409d2e0414sm9350205e9.40.2025.04.24.00.35.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Apr 2025 00:35:20 -0700 (PDT)
Message-ID: <6be816bb-2163-4691-a728-fcb555e11b77@linaro.org>
Date: Thu, 24 Apr 2025 09:35:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2] drm/panel: himax-hx8279: Always initialize
 goa_{even,odd}_valid in hx8279_check_goa_config()
To: Nathan Chancellor <nathan@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: Jessica Zhang <quic_jesszhan@quicinc.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 dri-devel@lists.freedesktop.org, llvm@lists.linux.dev,
 patches@lists.linux.dev
References: <20250423-panel-himax-hx8279-fix-sometimes-uninitialized-v2-1-fc501c6558d9@kernel.org>
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
In-Reply-To: <20250423-panel-himax-hx8279-fix-sometimes-uninitialized-v2-1-fc501c6558d9@kernel.org>
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

On 23/04/2025 19:41, Nathan Chancellor wrote:
> Clang warns (or errors with CONFIG_WERROR=y):
> 
>    drivers/gpu/drm/panel/panel-himax-hx8279.c:838:6: error: variable 'goa_even_valid' is used uninitialized whenever 'if' condition is false [-Werror,-Wsometimes-uninitialized]
>      838 |         if (num_zero == ARRAY_SIZE(desc->goa_even_timing))
>          |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    drivers/gpu/drm/panel/panel-himax-hx8279.c:842:23: note: uninitialized use occurs here
>      842 |         if (goa_odd_valid != goa_even_valid)
>          |                              ^~~~~~~~~~~~~~
>    drivers/gpu/drm/panel/panel-himax-hx8279.c:838:2: note: remove the 'if' if its condition is always true
>      838 |         if (num_zero == ARRAY_SIZE(desc->goa_even_timing))
>          |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>      839 |                 goa_even_valid = false;
>    drivers/gpu/drm/panel/panel-himax-hx8279.c:818:36: note: initialize the variable 'goa_even_valid' to silence this warning
>      818 |         bool goa_odd_valid, goa_even_valid;
>          |                                           ^
>          |                                            = 0
> 
> Even though only the even valid variable gets flagged, both valid
> variables appear to have the same issue of possibly being used
> uninitialized if the if statement initializing them to false is not
> taken.
> 
> Turn the if statement then variable assignment into a single variable
> assignment, which states that the configuration is valid when there are
> not all zeros, clearing up the warning since the variable will always be
> initialized.
> 
> Fixes: 38d42c261389 ("drm: panel: Add driver for Himax HX8279 DDIC panels")
> Suggested-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---
> Changes in v2:
> - Initialize valid variables once using the inverse of the current
>    condition (Angelo).
> - Link to v1: https://lore.kernel.org/r/20250422-panel-himax-hx8279-fix-sometimes-uninitialized-v1-1-614dba12b30d@kernel.org
> ---
>   drivers/gpu/drm/panel/panel-himax-hx8279.c | 6 ++----
>   1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-himax-hx8279.c b/drivers/gpu/drm/panel/panel-himax-hx8279.c
> index b48b350b62da..fb302d1f91b9 100644
> --- a/drivers/gpu/drm/panel/panel-himax-hx8279.c
> +++ b/drivers/gpu/drm/panel/panel-himax-hx8279.c
> @@ -825,8 +825,7 @@ static int hx8279_check_goa_config(struct hx8279 *hx, struct device *dev)
>   			num_zero++;
>   	}
>   
> -	if (num_zero == ARRAY_SIZE(desc->goa_odd_timing))
> -		goa_odd_valid = false;
> +	goa_odd_valid = (num_zero != ARRAY_SIZE(desc->goa_odd_timing));
>   
>   	/* Up to 3 zeroes is a valid config. Check them all. */
>   	num_zero = 1;
> @@ -835,8 +834,7 @@ static int hx8279_check_goa_config(struct hx8279 *hx, struct device *dev)
>   			num_zero++;
>   	}
>   
> -	if (num_zero == ARRAY_SIZE(desc->goa_even_timing))
> -		goa_even_valid = false;
> +	goa_even_valid = (num_zero != ARRAY_SIZE(desc->goa_even_timing));
>   
>   	/* Programming one without the other would make no sense! */
>   	if (goa_odd_valid != goa_even_valid)
> 
> ---
> base-commit: dcbd5dcc956e2331414fd7020b4655df08deeb87
> change-id: 20250422-panel-himax-hx8279-fix-sometimes-uninitialized-207354fb930c
> 
> Best regards,

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
