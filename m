Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 55F89956F02
	for <lists+dri-devel@lfdr.de>; Mon, 19 Aug 2024 17:41:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7C1110E2E2;
	Mon, 19 Aug 2024 15:41:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="qHugSWo/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64BB610E2E2
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Aug 2024 15:41:11 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-428141be2ddso34713515e9.2
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Aug 2024 08:41:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1724082070; x=1724686870; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=MrzATe8rYIud1EQmdYYD4F8xYF1fCvbf9TZacojasoA=;
 b=qHugSWo/n5QrkAlTIZsFQfpwjSCsV/qYoBN+zKj1+Sugx/mv3S8FjM5WH5jvYdtRWa
 Ye01ADH6ZjpxqT0IPtpdumCZXkO+W5sJMmuxAJA65ngjRmq9CPXflmAupF/ZVH2iCafB
 2/g1Ul2NcwRL6LQd1IcU5JtoBcGkcxiCXnO7BlUzY+D9yGcRke2Dcv5qgxdvIAq8aT3r
 j+OJ6NtjSAIpTRwVt2UN/Kq6rVzo4LhoZ+r+T0TDa1QkmQhOA/P3irBuxEpADgXdqiwv
 Fu2sRR8N9Fc4UIRh5JzdJaqETy9rBElG0fAzOMEMQF8mYZM7tiDZCi9YSFzHi/uBpgPu
 GAfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724082070; x=1724686870;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=MrzATe8rYIud1EQmdYYD4F8xYF1fCvbf9TZacojasoA=;
 b=nzQ6I6/Rr7z1lkLlPBGb1FWARq9Ob9Zg0JczUquU5VbTOrEyiXkh0r3yB6FmKP57vH
 F1pnNiCK5q/lj5zT3AZCeQpIukKV7j0RP+ctpxB1iAQkiA1CNxNOwoO9/orY/FMdeEcm
 DXm1CMW27QZx4oQjk415jiWcLWiYXk3kLB9xVgO4jYmf7jHcAmaF+zb8yVLJ2r1NUhYR
 5NvJ4ypzNu7caI3P9ZEDezovEFm0ouexxPUqeqOIHAzlP8xifvsiyguXr8o10UgjLRCg
 5eIW17Jg0yVXTQ11EWBDoO1j3LOFv5FvHmuVPO4WhnmDfmcCMf/TWols2lEnPaOozPcC
 jE3Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCX8Bxoq17K8MNqYfUHtMbWTKCwIoPyQc9HWunO8yro/ialXtinEGXxS3XlhHTiYUpUNqLn5l2w9uEs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxHw+2A7Yxn6O+I/8bjI/fSjZSGcOK7O0v3TgOUshqjWxf3CvQx
 pj7k7t4w1eZH+Ilt9s6YR3eKn68VA5VKGLAVXhhxOvPdcWegQ9ZqPLnf4XkyxLc=
X-Google-Smtp-Source: AGHT+IGbaGgDjlkcjOOxjw1s5hMx81Sydj4FWl7Oz+csh+yXsVHvtIbKTUYageb60ZuUGTwv5aH3nQ==
X-Received: by 2002:a5d:408f:0:b0:368:5b80:b8d with SMTP id
 ffacd0b85a97d-37194456508mr6323850f8f.21.1724082069174; 
 Mon, 19 Aug 2024 08:41:09 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:f54e:4b0a:5175:5727?
 ([2a01:e0a:982:cbb0:f54e:4b0a:5175:5727])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3718985a286sm10817742f8f.54.2024.08.19.08.41.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Aug 2024 08:41:08 -0700 (PDT)
Message-ID: <b783f932-851f-4ea5-a2cc-d39061c60652@linaro.org>
Date: Mon, 19 Aug 2024 17:41:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH] drm/panel: ili9341: Add comments for ILI9341 register
To: Abhishek Tamboli <abhishektamboli9@gmail.com>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, daniel@ffwll.ch
Cc: quic_jesszhan@quicinc.com, dri-devel@lists.freedesktop.org,
 skhan@linuxfoundation.org, rbmarliere@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-kernel@vger.kernel.org
References: <20240812171019.561321-1-abhishektamboli9@gmail.com>
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
In-Reply-To: <20240812171019.561321-1-abhishektamboli9@gmail.com>
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

On 12/08/2024 19:10, Abhishek Tamboli wrote:
> TODO : Add missing comments for ILI9341 register definition.

Please rephrase the commit message, and explain why in a proper english sentence.

Neil

> 
> Signed-off-by: Abhishek Tamboli <abhishektamboli9@gmail.com>
> ---
>   drivers/gpu/drm/panel/panel-ilitek-ili9341.c | 14 +++++++-------
>   1 file changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-ilitek-ili9341.c b/drivers/gpu/drm/panel/panel-ilitek-ili9341.c
> index 775d5d5e828c..cba6a6952568 100644
> --- a/drivers/gpu/drm/panel/panel-ilitek-ili9341.c
> +++ b/drivers/gpu/drm/panel/panel-ilitek-ili9341.c
> @@ -121,19 +121,19 @@ struct ili9341_config {
>   	const struct drm_display_mode mode;
>   	/* ca: TODO: need comments for this register */
>   	u8 ca[ILI9341_CA_LEN];
> -	/* power_b: TODO: need comments for this register */
> +	/* power_b: Power control B (CFh) */
>   	u8 power_b[ILI9341_POWER_B_LEN];
> -	/* power_seq: TODO: need comments for this register */
> +	/* pdtcaower_seq: Power on sequence control (EDh) */
>   	u8 power_seq[ILI9341_POWER_SEQ_LEN];
> -	/* dtca: TODO: need comments for this register */
> +	/* dtca: Driver timing control A (E8h) */
>   	u8 dtca[ILI9341_DTCA_LEN];
> -	/* dtcb: TODO: need comments for this register */
> +	/* dtcb: Driver timing control B (EAh) */
>   	u8 dtcb[ILI9341_DTCB_LEN];
> -	/* power_a: TODO: need comments for this register */
> +	/* power_a: Power control A (CBh) */
>   	u8 power_a[ILI9341_POWER_A_LEN];
>   	/* frc: Frame Rate Control (In Normal Mode/Full Colors) (B1h) */
>   	u8 frc[ILI9341_FRC_LEN];
> -	/* prc: TODO: need comments for this register */
> +	/* prc: Pump ratio control (F7h) */
>   	u8 prc;
>   	/* dfc_1: B6h DISCTRL (Display Function Control) */
>   	u8 dfc_1[ILI9341_DFC_1_LEN];
> @@ -147,7 +147,7 @@ struct ili9341_config {
>   	u8 vcom_2;
>   	/* address_mode: Memory Access Control (36h) */
>   	u8 address_mode;
> -	/* g3amma_en: TODO: need comments for this register */
> +	/* g3amma_en: Enable 3G (F2h) */
>   	u8 g3amma_en;
>   	/* rgb_interface: RGB Interface Signal Control (B0h) */
>   	u8 rgb_interface;
> --
> 2.34.1
> 

