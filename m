Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 840959A059A
	for <lists+dri-devel@lfdr.de>; Wed, 16 Oct 2024 11:34:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00C0510E6E2;
	Wed, 16 Oct 2024 09:34:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="wt5Jdrx8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9609710E6E2
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Oct 2024 09:34:09 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-4314f38d274so8965465e9.1
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Oct 2024 02:34:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1729071248; x=1729676048; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=CqUTw7M5GTPuGyS1gFvEjBY3Gd9I+5qKqIvJkOmLPQI=;
 b=wt5Jdrx8TtyYYmOnAqx9bojNW5POQj/xWABBOL5GyhR6uMK/xLVdeW9yrGzwHoPitx
 gUqv3b2obwMP9PW/LGDxz2HamiqzZ82Dd5oQ261oJYzrr/ojQRktgXeeffTP72CWsOFx
 Tb0YrDy+I/+ufq2hdtoHFVBKgqs953S0U+55bMcuan62bccTNHeVgk7T/rPBon2qWpvh
 I1XBPOJhclEQLb3hPCc6uouPLQ4L00HNSVkvL6Ny69eeDlIOIkyLHRvi3YJ9KE7gxxB7
 4O63lNkrDyOExm1Z/8+f954pFJA1zErWCXB4MgbP9hI7yTeox42o/2pesEoorvS0n6Ik
 efrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729071248; x=1729676048;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=CqUTw7M5GTPuGyS1gFvEjBY3Gd9I+5qKqIvJkOmLPQI=;
 b=eLOZqg3NIONKhYEfEfTvglDilTCpoS8+jfSRBCCACJE/AUsB/kz3/XP0MTLSqtqaNS
 aWel2+qEapjW9GaLyRLxS2VkEXJqQzH41TU4dXy92Bw5Ymm5tZur8jtYK5iQRIIxY2g8
 vRZVppPOd8h1DrpfQSzh5zqxgqUvJ/pAjRGCNWMYGuGnEkfMFSpFJBpQVcP0BWsvzQnn
 YMirjxogMwHQ4AiedUJFkLX7EjpDLwsUaM0/cWglrtXMHz25Ccs4AeferkIDHwwrLGwC
 7eyAYlWvFG1xMPe5GCo/w2c6BTDv6TXiBsfe+dmTkZIIwpMeu0RkmKZQC18DZ9C8QpOb
 Gagw==
X-Gm-Message-State: AOJu0Yw2cOGXOceLLlQp8fF2be5Av9FoXuTyvcdXYwjYeVhCafEAm1im
 lxxYThRQUFBIVxKtVMVO+xCAzCqBQtZZyKmH3dj89Djc1A17WoFYo3ZBXy/DVUI=
X-Google-Smtp-Source: AGHT+IELNLWHNx6Kv/rlb+Sh1n0s2cLuGPZi3iLw0xvl8OVhofqZdyDI+1mbp5uovmxG8H4/KSQL/Q==
X-Received: by 2002:a05:600c:1c07:b0:431:555d:e184 with SMTP id
 5b1f17b1804b1-431555de292mr1119985e9.25.1729071247883; 
 Wed, 16 Oct 2024 02:34:07 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:fd09:f78e:726a:6fa2?
 ([2a01:e0a:982:cbb0:fd09:f78e:726a:6fa2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4314fb04e68sm18898535e9.5.2024.10.16.02.34.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Oct 2024 02:34:07 -0700 (PDT)
Message-ID: <c3c5c2ad-e326-4696-8f9c-569a56e8b75c@linaro.org>
Date: Wed, 16 Oct 2024 11:34:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 2/6] drm/panel: Include <linux/of.h>
To: Thomas Zimmermann <tzimmermann@suse.de>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, Jessica Zhang <quic_jesszhan@quicinc.com>
References: <20241011144632.90434-1-tzimmermann@suse.de>
 <20241011144632.90434-3-tzimmermann@suse.de>
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
In-Reply-To: <20241011144632.90434-3-tzimmermann@suse.de>
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

On 11/10/2024 16:41, Thomas Zimmermann wrote:
> Include <linux/of.h> directly to get of_device_is_available(). Avoids
> the proxy include via <linux/backlight.h>
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Neil Armstrong <neil.armstrong@linaro.org>
> Cc: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>   drivers/gpu/drm/drm_panel.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/drm_panel.c b/drivers/gpu/drm/drm_panel.c
> index 19ab0a794add..2379e501c08b 100644
> --- a/drivers/gpu/drm/drm_panel.c
> +++ b/drivers/gpu/drm/drm_panel.c
> @@ -24,6 +24,7 @@
>   #include <linux/backlight.h>
>   #include <linux/err.h>
>   #include <linux/module.h>
> +#include <linux/of.h>
>   
>   #include <drm/drm_crtc.h>
>   #include <drm/drm_panel.h>

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
