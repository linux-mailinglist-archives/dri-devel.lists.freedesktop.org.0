Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9AAEB2ADF3
	for <lists+dri-devel@lfdr.de>; Mon, 18 Aug 2025 18:19:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6139C10E06A;
	Mon, 18 Aug 2025 16:19:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="jir7ZIrP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBAB110E06A
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Aug 2025 16:19:53 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id
 ffacd0b85a97d-3bb2fb3a436so2364810f8f.1
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Aug 2025 09:19:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1755533992; x=1756138792; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=5fL7TtM/2t3RFsvN7yE5RFNF0N3gevEnIHjTT5UTl+w=;
 b=jir7ZIrP62Ezhj/ZG+xjwCrw2xMUg3IPDy0px+xn03umyA1VbZYiLZNkS3kswFylpM
 6WT2pKVO5dudqiDtTaKe73me4k9gJUeyhtDaBJM0pgJIdB8/V69tZ8mc5nXCkwcgsSVF
 fO5nn+EEVK75tS+2x3+b/c1EPgHPbsiwdZk6BNfl4PhGUlq7psQAEUWWByEyYK0jlIus
 kzsyH3kkIE2h3cA8yBX1FdkHjtNtqXUhUNTqR5uacRbF+PUBr9nzKVQWJkMCKJzV1i+9
 uJOcusZW3vYuTHOBpeTm4l1AIwQZGxTCuaY87hOTcphQ/FfPhc8qq7nAIjlCLsjAwhiF
 G8uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755533992; x=1756138792;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=5fL7TtM/2t3RFsvN7yE5RFNF0N3gevEnIHjTT5UTl+w=;
 b=FFzVFX7wJXfwyjeqI5Ond8Xr6N736a6gCFsd0bnOBSu/Jl9tWIliqrbCroIyr7FXAc
 +MuD2qL/TkF5zRSNxPbjzmmJW8xaVipXvyqj/mNv8b3jnB53LAaI13rB9MavjTI2mRr1
 8MrMkCmGhN3k5RGfRGZzrdUWYMnPlxqHvYThtc7CkXSXVise3IhXn8pnvxj12VkRPah+
 4fjIA+Awl2+UvoGVPioSbRYR1x90cnkcaOx1Abdfh5v3Eicurcj+J2Y4Dj/Sr5R3bobp
 6tZLKB9slqs+ycT1Q502MiZLDIgQg7A7a54/DVsPdIwrpuB4Rx86SpX4cKxXvxgZLGRX
 p4DA==
X-Gm-Message-State: AOJu0Yx48d/UOvAFlVH7xiRB3PR+//0dNPSjK9Gk/CP3QdvEGex2fwM/
 wyxy8W+M1EQZvIggzBOHfTJUp+jK39v5P7/1uEqajqAg50izEFJS8zbh5SG3YO65P0o=
X-Gm-Gg: ASbGncvd/Ny4dwscTgQB3LDxieJgjpw6BmNdhkXMee1DoCR7z63WGw9Dm9XtBsY5ooc
 HDPGwVH8zKWYRPtnDjw+wYSOk72wcj0Iyh5FM3JjNahu3lfCdnLmDgmEfd8yK1V7XDhNq6G42ZF
 oGSQjoO6KztM8ChBYgxXBLDFSTPFY6DMNX9f+Z9tSIsfaiiictcVKROX6zC637xDggulmcOQ+SR
 zPz6NSfbeYCXpybxzR4tS2xYOlP4zu7yKDPhM31WncoVINWSPyA6oB56qeR1qX93C9oRW48dDcd
 nwdM8/izBMO7P9vaSW8UPWwP+YxifOlchSjSVZC43+fiit6YzymC570gw9uFEHzHwFrVp1zgez/
 OTEsMpDAVpbTvZ7kA97adeho8oRGz5v4AhhzSvko2ATLM5Lp6zp+WLyPvqYUQBrsqVqZoQBUs
X-Google-Smtp-Source: AGHT+IE9opMCmGbnh8RDdRVUqADAi8F3vNaDa7AHOcnXCx2CQ4cjiKE06vSx53oJwErFtRNfKVc+sQ==
X-Received: by 2002:a5d:5d09:0:b0:3b7:899c:e867 with SMTP id
 ffacd0b85a97d-3bc6a83c6a5mr7373472f8f.59.1755533992290; 
 Mon, 18 Aug 2025 09:19:52 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:70d:8646:e014:cc6e?
 ([2a01:e0a:3d9:2080:70d:8646:e014:cc6e])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3c077c57d32sm78852f8f.64.2025.08.18.09.19.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Aug 2025 09:19:51 -0700 (PDT)
Message-ID: <0627bc95-7fbf-482e-855e-171b6014f6d9@linaro.org>
Date: Mon, 18 Aug 2025 18:19:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH] drm/panel: panel-samsung-s6e88a0-ams427ap24: Fix includes
To: Thomas Zimmermann <tzimmermann@suse.de>, jessica.zhang@oss.qualcomm.com
Cc: dri-devel@lists.freedesktop.org
References: <20250812082509.227879-1-tzimmermann@suse.de>
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
In-Reply-To: <20250812082509.227879-1-tzimmermann@suse.de>
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

On 12/08/2025 10:25, Thomas Zimmermann wrote:
> Include <linux/property.h> to declare device_property_read_bool() and
> <linux/mod_devicetable.h> to declare struct of_device_id. Avoids the
> dependency on the backlight header to include both.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   drivers/gpu/drm/panel/panel-samsung-s6e88a0-ams427ap24.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panel/panel-samsung-s6e88a0-ams427ap24.c b/drivers/gpu/drm/panel/panel-samsung-s6e88a0-ams427ap24.c
> index e91f50662997..7e2f4e043d62 100644
> --- a/drivers/gpu/drm/panel/panel-samsung-s6e88a0-ams427ap24.c
> +++ b/drivers/gpu/drm/panel/panel-samsung-s6e88a0-ams427ap24.c
> @@ -7,7 +7,9 @@
>   #include <linux/backlight.h>
>   #include <linux/delay.h>
>   #include <linux/gpio/consumer.h>
> +#include <linux/mod_devicetable.h>
>   #include <linux/module.h>
> +#include <linux/property.h>
>   #include <linux/regulator/consumer.h>
>   
>   #include <video/mipi_display.h>

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
