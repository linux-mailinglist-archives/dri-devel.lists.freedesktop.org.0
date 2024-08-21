Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D1BF95A125
	for <lists+dri-devel@lfdr.de>; Wed, 21 Aug 2024 17:13:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A10D910E24B;
	Wed, 21 Aug 2024 15:13:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Y9a5lU1M";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2559610E1E9
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Aug 2024 15:13:42 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id
 ffacd0b85a97d-3718eaf4046so4515586f8f.3
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Aug 2024 08:13:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1724253220; x=1724858020; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=pIR4lqHHFxU3fKIt67SGkiDEFZC8/bXJ+Q/DzVc8pSM=;
 b=Y9a5lU1MzrenyPPleCGYwOaSKi3fm+/+bGkuWxs2Eqrjg+RRK+Tlu1OnAwip3J236l
 lWxok8kRnLyyOqqTv7qX2/R6EugH40DaYY/6nEjq/FHR41cdicMwXP+BnebsAWJ3R7Lz
 a2PM8dRYXE5+5fN0KjLgFsL/V+exeaPYK9geEiT2lUHCQTs1vxQ/vylazJ8mdvD/CVi4
 Ayw46gFWn6GN2jSZ3JQ0fhWfw/Hqn3s7IdhhOoSLyBo8VXZg0uhQEd4Hz3Ac8fBdavGT
 TE9v6KMCzdNT2XXJTzw4LgG3To/wElk+D0UQaeoq4qNBPGz0aHynkKxT6laX09w2OF3r
 rWAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724253220; x=1724858020;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=pIR4lqHHFxU3fKIt67SGkiDEFZC8/bXJ+Q/DzVc8pSM=;
 b=we+6iBIFgxjA3roourUe5NwQDsGjwRcw4emJoMXuXY3NVAAuSWHwFlQTmdmruUSfg9
 4pFhXu6tdi2jIA+xEG4BQPrwlsghjFZFJ6iCLwXasqLeXblIq1sn+zR/f0gczbtz72Hw
 2Vh6smeZfEvMsYTDn4/iB2tlYK7odK8/uQJfhTvPWgXu4otUK4H9BxYjCYTtSJqalTpt
 j+guFPGtaujl+V3Unma/rQwj48NBKbGm/CeDQXomnOLE6rAts1IH+CQbmpVen1M3Xjcq
 UaptBU9brCawcF3AaSQc98uLRS9fvu6wzHGVKKpYcAGaLb8u8ZP2wQBKC+QNPkX37iY2
 4Kig==
X-Gm-Message-State: AOJu0YznWl5aZU5JcGfd2pVR7Ec7ZZeC+etvFbeBh9kUY/d4SaUgKnwe
 26j86jyjlNrsqtscwqtfryJuHf64c7o9jadjwnjWSvFDPM2lNksxZ2J7E9wYaiQ=
X-Google-Smtp-Source: AGHT+IGMQgJBsrQBoo56iqyJBR19TZtSD3M9DxXHRpIRSOJSFJQRfnQFYlZ74pcNAUTh068m3z+D3g==
X-Received: by 2002:a5d:548c:0:b0:371:7dfc:5868 with SMTP id
 ffacd0b85a97d-372fd732256mr2006019f8f.57.1724253219751; 
 Wed, 21 Aug 2024 08:13:39 -0700 (PDT)
Received: from ?IPV6:2001:861:d40:6fb0:ac85:2805:6b0e:5197?
 ([2001:861:d40:6fb0:ac85:2805:6b0e:5197])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-371898498casm15830268f8f.42.2024.08.21.08.13.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Aug 2024 08:13:39 -0700 (PDT)
Message-ID: <50f0b204-f10a-42b3-9557-4e7f9b2b6d64@linaro.org>
Date: Wed, 21 Aug 2024 17:13:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 27/86] drm/meson: Run DRM default client setup
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@gmail.com, jfalempe@redhat.com, javierm@redhat.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
References: <20240821130348.73038-1-tzimmermann@suse.de>
 <20240821130348.73038-28-tzimmermann@suse.de>
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
In-Reply-To: <20240821130348.73038-28-tzimmermann@suse.de>
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

On 21/08/2024 14:59, Thomas Zimmermann wrote:
> Call drm_client_setup() to run the kernel's default client setup
> for DRM. Set fbdev_probe in struct drm_driver, so that the client
> setup can start the common fbdev client.
> 
> The meson driver specifies a preferred color mode of 32. As this
> is the default if no format has been given, leave it out entirely.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Neil Armstrong <neil.armstrong@linaro.org>
> Cc: Kevin Hilman <khilman@baylibre.com>
> Cc: Jerome Brunet <jbrunet@baylibre.com>
> Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> ---
>   drivers/gpu/drm/meson/meson_drv.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/meson/meson_drv.c b/drivers/gpu/drm/meson/meson_drv.c
> index 4bd0baa2a4f5..2f76f48da38d 100644
> --- a/drivers/gpu/drm/meson/meson_drv.c
> +++ b/drivers/gpu/drm/meson/meson_drv.c
> @@ -17,6 +17,7 @@
>   
>   #include <drm/drm_aperture.h>
>   #include <drm/drm_atomic_helper.h>
> +#include <drm/drm_client_setup.h>
>   #include <drm/drm_drv.h>
>   #include <drm/drm_fbdev_dma.h>
>   #include <drm/drm_gem_dma_helper.h>
> @@ -98,6 +99,7 @@ static const struct drm_driver meson_driver = {
>   
>   	/* DMA Ops */
>   	DRM_GEM_DMA_DRIVER_OPS_WITH_DUMB_CREATE(meson_dumb_create),
> +	DRM_FBDEV_DMA_DRIVER_OPS,
>   
>   	/* Misc */
>   	.fops			= &fops,
> @@ -353,7 +355,7 @@ static int meson_drv_bind_master(struct device *dev, bool has_components)
>   	if (ret)
>   		goto uninstall_irq;
>   
> -	drm_fbdev_dma_setup(drm, 32);
> +	drm_client_setup(drm, NULL);
>   
>   	return 0;
>   

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
