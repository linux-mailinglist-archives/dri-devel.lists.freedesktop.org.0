Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88049A9A5AF
	for <lists+dri-devel@lfdr.de>; Thu, 24 Apr 2025 10:20:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 008D610E22B;
	Thu, 24 Apr 2025 08:20:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="TQ/xLKyQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 444A610E22B
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Apr 2025 08:20:27 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id
 ffacd0b85a97d-39ac9aea656so882775f8f.3
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Apr 2025 01:20:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1745482825; x=1746087625; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=2UIjTEcS5ZEUnsgAPWbRBZciAfnbC9hHPHaZHT5HHdY=;
 b=TQ/xLKyQt9ZwrVtyp2WbnPEqr0rXv6mnGdGCTW4Zu1eVcqZtclNJdODJ2E2Kx7xjf8
 DnPRNb3By4XKaGHAeUSxh0jj5EME4t13NO671iYdOc3TBnNX9DHHuTmlW4fqYlJ38RTz
 rBTXmmAt8Gw+7vtUECXMNLjFNUqApUypWylCNOG79poTQ1L7oq0PKm5HS/L368n6SErI
 lQwNGZfk0mw+3qsEjfvEwwRXsPBW60kthULgrqrle1/MY9N2xWJiMGjtQwALHfBctKut
 mkilDDZ2GfeAVqHlWjrCWEmVs+Nxi32rUvTPXkm8wwCc4ckie8hIopGT+xOOjFnAfQxm
 M1kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745482825; x=1746087625;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=2UIjTEcS5ZEUnsgAPWbRBZciAfnbC9hHPHaZHT5HHdY=;
 b=Ye52sezC3EeBkCKlIixjQOSqv4oDvGnGiM0wZPStT2diq47OvZLG7ySjsOpRK3DYCa
 pYytnjT6wCAHZ9TbJCZiUK3gDAAu95ltRRfzZtNTtYDgFHIJXlDHGUwGOf4+7/qLfSZo
 fM9S6Ny8nLi8HTzmPeRXNtEOUFgM/PiOFd9+keoDu10T++W/eC1tzlov5fvST09YXH2L
 KYkNP2npZQgRtJhv6OaSLfl2IVFlGJaB8g5JEKRusz9Kagu9w9hiIUpTpb/4AQg8uyt/
 +BFeks3oJs8o8eb2TxR8PJMhuuML1kdRRK65zZy3yIheoWk/NYMZq97Eq0tZFNnrFIek
 pefw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVY7Y4lDv6aBvNnQxjMWNA/bdaF0CUH46dNIJ9hIOusjGbmxg6ZLAJV2KovUzB5mig6bLqsweRFZhU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yye+AmG3yxsvftRmXI33lLKa7+bqoVk7E6K7KgdRNuOtSKjXpC0
 i1QJvQutHm3Zzq+7kTeqH15jR2SxarHQqYk4zsFyq6Kc/oki7BOoOBicf5Fsrnw=
X-Gm-Gg: ASbGncu64GJSebzph5Z1kj0+pamcu+EXhqOjyT4oTId04kPdSybNWVE3NZrPO+ZCrYe
 Z+agukal8iny8dSiJOqXZn0guIYRzHJkizT0GO48bjKMdhXj71qw/IKuRg4QblZ1G0p4xw0NlvU
 iiLupEo65Li7VebNPI/zxxW7SubDBPNofyquK76oihM1gCY/CAJpGllsQl78ac839698pmPXW/J
 YzPvvHcTC5Z64W7XOz3CqParNyOMgwx/q0dyrQNjLIrb3B1YxG4a3bHgZKZk3b/4UQ6FQPBhTjs
 mQDvUDv3du8A9PvUjQXXBc27OhLDCopzukPz8CBl/PzD1MXCDNXpiQzrPX1HHKC6bX9+35Jtkzo
 A+kMFxyGaZb0Ifv25rA==
X-Google-Smtp-Source: AGHT+IHBK3pVJPc3YB+cI3CSl9tsM64w5vNMKCGAdlXyTj8g17Moufdmpj+OGx6bKPoP5csXDzubIg==
X-Received: by 2002:a5d:588f:0:b0:39a:e71d:ee34 with SMTP id
 ffacd0b85a97d-3a06cfa8d1bmr1117330f8f.37.1745482824838; 
 Thu, 24 Apr 2025 01:20:24 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:a24a:bfda:f031:720d?
 ([2a01:e0a:3d9:2080:a24a:bfda:f031:720d])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a06d532ac1sm1244633f8f.72.2025.04.24.01.20.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Apr 2025 01:20:24 -0700 (PDT)
Message-ID: <edabbb76-ab0d-489c-b034-fdc6dda59102@linaro.org>
Date: Thu, 24 Apr 2025 10:20:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] drm: panel: himax-hx8279: avoid using an uninitialized
 variable
To: Arnd Bergmann <arnd@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Jessica Zhang <quic_jesszhan@quicinc.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250423163214.2276114-1-arnd@kernel.org>
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
In-Reply-To: <20250423163214.2276114-1-arnd@kernel.org>
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

Hi,

On 23/04/2025 18:32, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> goa_even_valid is only initialized in one branch but not the other:
> 
> drivers/gpu/drm/panel/panel-himax-hx8279.c:838:6: error: variable 'goa_even_valid' is used uninitialized whenever 'if' condition is false [-Werror,-Wsometimes-uninitialized]
>    838 |         if (num_zero == ARRAY_SIZE(desc->goa_even_timing))
>        |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> drivers/gpu/drm/panel/panel-himax-hx8279.c:842:23: note: uninitialized use occurs here
>    842 |         if (goa_odd_valid != goa_even_valid)
>        |                              ^~~~~~~~~~~~~~
> 
> Change the initialization to set it to the value of the condition instead.
> 
> Fixes: 38d42c261389 ("drm: panel: Add driver for Himax HX8279 DDIC panels")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>   drivers/gpu/drm/panel/panel-himax-hx8279.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-himax-hx8279.c b/drivers/gpu/drm/panel/panel-himax-hx8279.c
> index b48b350b62da..4f548430654a 100644
> --- a/drivers/gpu/drm/panel/panel-himax-hx8279.c
> +++ b/drivers/gpu/drm/panel/panel-himax-hx8279.c
> @@ -835,8 +835,7 @@ static int hx8279_check_goa_config(struct hx8279 *hx, struct device *dev)
>   			num_zero++;
>   	}
>   
> -	if (num_zero == ARRAY_SIZE(desc->goa_even_timing))
> -		goa_even_valid = false;
> +	goa_even_valid = (num_zero != ARRAY_SIZE(desc->goa_even_timing));
>   
>   	/* Programming one without the other would make no sense! */
>   	if (goa_odd_valid != goa_even_valid)

Thanks, Applying https://lore.kernel.org/all/20250423-panel-himax-hx8279-fix-sometimes-uninitialized-v2-1-fc501c6558d9@kernel.org/
instead since more complete.

Neil
