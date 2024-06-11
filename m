Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 118D1903459
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jun 2024 09:52:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16EDD10E0FC;
	Tue, 11 Jun 2024 07:52:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="y+Jqa2cf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
 [209.85.221.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B83B10E55C
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jun 2024 07:52:16 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id
 ffacd0b85a97d-35f2c0b7701so293060f8f.0
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jun 2024 00:52:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1718092334; x=1718697134; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=E+i/Z/3ch3+r0A2KLwIIY0Ok9e/HC8f36K3FJuJKx2E=;
 b=y+Jqa2cfYqpkuxokhSvRx7NGDbTQLohwWTCIwmv0t4v1gHbCvmgjJhF79dh4ehrNR6
 XGjepR8y98b2mcQ4GXwsRsT038riV4Z0k6i5jGOxV5Gqb89hmy46oaMKxisDF29APzAt
 2l3YHB9b3SSvq9DZNvRtZlXKvBvGHHZlJtztRPTqA4vLfFcGLbmq6Y5jGQUOD3AEduJP
 wb6Od9xDnGMWi2ucwDvndvb1HthKG5TVgk0Y4KtzMskYUSwyr39EV8UmTuf/I5bMFr19
 TKr9yW7itReF5qYKwrpvdJLR7jVP9nh1IWixnGcsuVZYd5e9MnacX1GUmm4+PreqBIeN
 dQ5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718092334; x=1718697134;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=E+i/Z/3ch3+r0A2KLwIIY0Ok9e/HC8f36K3FJuJKx2E=;
 b=kRwLVUW/w2zZH2KTSkBDO75iHzGQzGY4BuuQk0/quO0V+nIdt4AfDAZHnET7z3U82c
 4avat5E81evOnCSyI5wfhpVoZGOK1rqUirJaHm35N7L8JdoFZHXekrqkuAXDJjo+0h2d
 9L7CarFv0u6g3i6bGpP4lqlpvWF8YNkELj3ERmOZnsjB+fg2qVYWBi2M60fwZ1JCe7s3
 3DziMJWiImh+lUtrmSCyjRRGzsn8V+bFwJ3ILQLXLfTp/LlVSJD90YFteix0F0Qsj2Nk
 0CRRe2S/Upk2fUD7+PiO1COi9vpkAGBhEyq8L4A/gVHXoDbI5kvb64TpfqC2UqB+gXVD
 DQHw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU+NCUHx8FHQcUODpIxQHmwMU93CY1sDcYNcZc9DGFuIBln6HMqcmTWB4wepPrZYr/UpveS2eGAqblikrbhQCa74ouIsUS49xEmc90MK+oA
X-Gm-Message-State: AOJu0YzBxOr5Qez5UR+V247ISKtsT+mb8vqPJ2hdb3MAUVmA203xP6Kx
 ZT0UUgon68gV2v5Pem/neGGJ4QsjNeSPS2/ehDMihNGoKAXWi6ej1jF98mUNSng=
X-Google-Smtp-Source: AGHT+IHbpFLNyHr0v8Vs+79JJ833765mxE2qEwYh61HH/guFxEXNMCK4FT13xTiK8JTlcmdmZO1t1g==
X-Received: by 2002:a05:6000:2cc:b0:35f:2d7b:2e30 with SMTP id
 ffacd0b85a97d-35f2d7b2efdmr929217f8f.34.1718092334519; 
 Tue, 11 Jun 2024 00:52:14 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:5a4:3b2:c750:ef5c?
 ([2a01:e0a:982:cbb0:5a4:3b2:c750:ef5c])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-35ef5fc0a0dsm13055898f8f.91.2024.06.11.00.52.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Jun 2024 00:52:14 -0700 (PDT)
Message-ID: <35fc64da-1f2b-4aa8-841a-7a311a918894@linaro.org>
Date: Tue, 11 Jun 2024 09:52:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH] drm/panel : himax-hx83102: fix incorrect argument to
 mipi_dsi_msleep
To: Tejas Vipin <tejasvipin76@gmail.com>, quic_jesszhan@quicinc.com
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <d9f4546f-c2f9-456d-ba75-85cc195dd9b8@gmail.com>
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
In-Reply-To: <d9f4546f-c2f9-456d-ba75-85cc195dd9b8@gmail.com>
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

On 08/06/2024 11:17, Tejas Vipin wrote:
> 
> From: Tejas Vipin <tejasvipin76@gmail.com>
> Subject: [PATCH] drm/panel : himax-hx83102: fix incorrect argument to
>   mipi_dsi_msleep
> 
> mipi_dsi_msleep expects struct mipi_dsi_multi_context to be passed as a
> value and not as a reference.
> 

Please add a Fixes tag

> Signed-off-by: Tejas Vipin <tejasvipin76@gmail.com>
> ---
>   drivers/gpu/drm/panel/panel-himax-hx83102.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-himax-hx83102.c b/drivers/gpu/drm/panel/panel-himax-hx83102.c
> index 6009a3fe1b8f..ab00fd92cce0 100644
> --- a/drivers/gpu/drm/panel/panel-himax-hx83102.c
> +++ b/drivers/gpu/drm/panel/panel-himax-hx83102.c
> @@ -479,7 +479,7 @@ static int hx83102_disable(struct drm_panel *panel)
>   	mipi_dsi_dcs_set_display_off_multi(&dsi_ctx);
>   	mipi_dsi_dcs_enter_sleep_mode_multi(&dsi_ctx);
>   
> -	mipi_dsi_msleep(&dsi_ctx, 150);
> +	mipi_dsi_msleep(dsi_ctx, 150);
>   
>   	return dsi_ctx.accum_err;
>   }

Thanks,
Neil
