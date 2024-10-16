Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E944D9A0598
	for <lists+dri-devel@lfdr.de>; Wed, 16 Oct 2024 11:33:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64AC710E6DD;
	Wed, 16 Oct 2024 09:33:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="q5k5p5+l";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
 [209.85.221.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61B9210E6DD
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Oct 2024 09:33:53 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id
 ffacd0b85a97d-37d533b5412so3232137f8f.2
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Oct 2024 02:33:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1729071232; x=1729676032; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=F+WITxewHNIb7glOnUHiABffIvLctAWUAIQX7Ma3fuU=;
 b=q5k5p5+lkHf0AXZQeTwVw4AS6CsMrgk5uVY2g0rG7L6nC260otRysVdXgoDH4nBlVD
 RFijydJ80S2IfW47HmnckEZ38ETFveIzl87VJA5V0eVJQNxW/8zEWgDvRFUA1sLUbSE3
 rAIwCzFx6taH314jb5hKE+QAPa7irLUywkQLoHKzdLwc8r6HTiirbPTAgc4c8aluNkg1
 wdWqvN/qHk8SS8FScb80l4H7VEXmWA95ZInlNFPkluqOr+SNI49K7r6K9IGZJ5bjy3qL
 PIlwgnBGdvnKp3Nf0FnEG4z65RQoZYP4BlfPZgPQ672vNYQAQPhtO6GzlZVK66xLOgOK
 2F4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729071232; x=1729676032;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=F+WITxewHNIb7glOnUHiABffIvLctAWUAIQX7Ma3fuU=;
 b=iB+dVoLUAYigWfbGpqHrpF2YJey2HXegVLStQnCe6aWYItLsnxz0FDB8ajcyEGRL8w
 hM1O9s65dSBZmWiX0x1jFjct3F8qQ/TW/DYQDucW7DG7ut63/oZ/IDMA+W8qQLJ1Vc9b
 rAX27iH28I5+xbZv36B7a0+Fd9+XtcUQXUahFR9pQ23UKoPEkflbF7HltQxL1bK+yIxn
 6+whoRBP4hibde23L5w0pZUXTNiMMdk6zuSCefhCDLM0hOLj4rgkfU2yedyoucjEBYzZ
 u8GWh0r28SB5EXoXVap2bVIxqlMq8TF/bqI/pBKyjaqBCFimmtVnLy0Y1LmdJqTuqxmL
 DHQA==
X-Gm-Message-State: AOJu0YxJKiKe8VXD0+lC8jgkaZf3sU2fyJLHaWAwOuQ7/HWSQ9ALsx+c
 9gqroEO3whHHcdr3Z6CGTU/pFeGBfScnr2ETPa9xzYTlXmmmGdPiMQ/Upn6G/p0=
X-Google-Smtp-Source: AGHT+IEDMJBMBz73AiYZw7PYsA0oydwIu6xDz2UbllLbG7/beXiAEU+EzqHuvFU7I1pqm7epmKAt7w==
X-Received: by 2002:adf:f84b:0:b0:37d:238:983 with SMTP id
 ffacd0b85a97d-37d86bbf5ebmr1987023f8f.22.1729071231728; 
 Wed, 16 Oct 2024 02:33:51 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:fd09:f78e:726a:6fa2?
 ([2a01:e0a:982:cbb0:fd09:f78e:726a:6fa2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-37d7fc40a14sm3806605f8f.103.2024.10.16.02.33.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Oct 2024 02:33:51 -0700 (PDT)
Message-ID: <0d912974-d32e-436c-bf68-4e6fbc5731bd@linaro.org>
Date: Wed, 16 Oct 2024 11:33:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 4/6] drm/panel: panel-samsung-s6e3ha2: Include
 <linux/mod_devicetable.h>
To: Thomas Zimmermann <tzimmermann@suse.de>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, Jessica Zhang <quic_jesszhan@quicinc.com>
References: <20241011144632.90434-1-tzimmermann@suse.de>
 <20241011144632.90434-5-tzimmermann@suse.de>
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
In-Reply-To: <20241011144632.90434-5-tzimmermann@suse.de>
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
> Include <linux/mod_devicetable.h> directly to get struct of_device_id.
> Avoids the proxy include via <linux/backlight.h>
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Neil Armstrong <neil.armstrong@linaro.org>
> Cc: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>   drivers/gpu/drm/panel/panel-samsung-s6e63j0x03.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/panel/panel-samsung-s6e63j0x03.c b/drivers/gpu/drm/panel/panel-samsung-s6e63j0x03.c
> index ed53787d1dea..364f1c9a16d9 100644
> --- a/drivers/gpu/drm/panel/panel-samsung-s6e63j0x03.c
> +++ b/drivers/gpu/drm/panel/panel-samsung-s6e63j0x03.c
> @@ -11,6 +11,7 @@
>   #include <linux/backlight.h>
>   #include <linux/delay.h>
>   #include <linux/gpio/consumer.h>
> +#include <linux/mod_devicetable.h>
>   #include <linux/module.h>
>   #include <linux/regulator/consumer.h>
>   

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
