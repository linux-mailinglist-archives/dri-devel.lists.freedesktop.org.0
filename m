Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E9636C81BD3
	for <lists+dri-devel@lfdr.de>; Mon, 24 Nov 2025 17:58:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80FD810E307;
	Mon, 24 Nov 2025 16:57:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="uRYJmElG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C2F310E307
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Nov 2025 16:57:50 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-477563e28a3so31295635e9.1
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Nov 2025 08:57:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1764003468; x=1764608268; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=NpWVEkTbrBm4aH1ard22F4sG8bJRB+Plzb5tsxuAPOc=;
 b=uRYJmElGPShjbFWP9npTEuN3Ngc5AFvsOwEh6vYvS1T7CuYEWCjsY3pIx+hMaXsjA9
 OP/CR7MuzuMPIrmkDp23psjlBTxGIJoX37hT9nI/W0s922M/dgfdCMHsHkbObQjSUiUX
 CESaQsTSrQCxWUTLHDFDfi9bo+pr5vsOX9SipkkoRznXVTHmK4fyQqpGyOUSji/hOKPK
 K5eJld4Fr53RAudyKDnAlsX1NRN8drD0R1E1ILTC8lBmeoPMIk7822A798hitl0R4n+/
 lDjK2hvnCsnecb7H8J+OQU0N6e6Kd46Ur1W2FPDtwx49lSyV8tlkZMsdhj5vzXQHAiw6
 5wYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764003468; x=1764608268;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NpWVEkTbrBm4aH1ard22F4sG8bJRB+Plzb5tsxuAPOc=;
 b=MBxHqJ7nU8mttnkrIlzzrB+MrXtqW6Xf0wrHXQx1cjiUthiwPnwBMKnsUyOurP7z7N
 AcZ0aWlkrXMWLrgbj27/9NtO0blb8xFXUnEE0lifFz4ESqp55444r6Rl02QJm0EFBjZN
 tf95AG2rjmbYWGI9WQ01FO8Jbfwyv+CdsJtHacI9RR3kCJ4MTaL8IeqHlj5CuK1o5ta7
 QMwbpPVVBUiCcfrTDztP6ilGLHz4tO1eS5dChr6UrzQXDGSNRqObFYr7ynJ0WfhmpTWV
 P8/VGxRIY/trIbkXrSUfL8ecMT5bWlR6WpWppCGjZ8aK575EL941uGxkLyi5oFW+cIpV
 lMJw==
X-Gm-Message-State: AOJu0Yy833GUct3Xvbsot8n0pb8Wopia/tHZ5tFGOhQQlvrxVcReARqC
 pUlMDbTN5NmX0cwS7cAJxx23VRYG3sC0WSkZdPpm0RK/N36sBdEu2wHjl63y/Wv+uTc=
X-Gm-Gg: ASbGncvDms9ukle9ttTB+P2GyCHEfUr6GPmqPBHx6OqI00CcAMaXoYAR2XRuVGykeaX
 riQ6PXg9tQNaUt+QNLmwWzSw4Vk39qHr69rVh2tZ9rnmYAB32jw4ePDzhRumYAw6aKNVH2tlArI
 Is4HtcGRMyK2rPpaw/tvL5ixYOB61CxCz0fxwqXL8EwdXv3vGGl40p/grV8LMl04D1ZeSXvrh7+
 oxFytrbXqtLKNSKukw6ljhTKRrSgkMFlJfyYgbbztgxGfbsuVwr645yj08cvtGRLfsDPvnG5Cco
 Z2hRMJh/9lfndecVnRcxR5s3FvKCxjuT+S5DodehNp8GLdoOcQaOmsaQNRP4FXqWD9GKU21e1RE
 hvz6b91xsBl4W3Xw1KGl3hnk1uZVRfsTeTXi+/xZYYliWhP/71pfLDxHnBPMgZtIrxo/Iy/uDMM
 n2gDZgKvPrGtqDaOFTm7/diQvd+G8/PLV8bjVoYjMnA/3798DZNuMsfvtwQynpdfo=
X-Google-Smtp-Source: AGHT+IGURuV+b8ObuBef2ouGNxDd51MNNWxtCs2zwSrwNiDjxlKuRsNJPHqxs9iiw15qIkWTwS0QEQ==
X-Received: by 2002:a05:600c:35c6:b0:477:a219:cdc3 with SMTP id
 5b1f17b1804b1-477c0513e47mr159458505e9.12.1764003468505; 
 Mon, 24 Nov 2025 08:57:48 -0800 (PST)
Received: from ?IPV6:2a01:e0a:3d9:2080:ab13:96f5:1459:8396?
 ([2a01:e0a:3d9:2080:ab13:96f5:1459:8396])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-477bf36d1fasm197728055e9.7.2025.11.24.08.57.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Nov 2025 08:57:48 -0800 (PST)
Message-ID: <a7d6d4dd-2a2e-42e3-ac47-bdd781a5443c@linaro.org>
Date: Mon, 24 Nov 2025 17:57:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] drm/bridge: lt9611uxc: Increase EDID wait time from 500ms
 to 1000ms
To: Gopi Botlagunta <venkata.botlagunta@oss.qualcomm.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 venkata.valluru@oss.qualcomm.com, jessica.zhang@oss.qualcomm.com
References: <20251121-hdmibridge-v1-1-14c63890f362@oss.qualcomm.com>
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
In-Reply-To: <20251121-hdmibridge-v1-1-14c63890f362@oss.qualcomm.com>
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

On 11/21/25 14:42, Gopi Botlagunta wrote:
> EDID interrupt was coming 600-650 ms after HPD interrupt, resulting
> into EDID read timeout and default resolution of 1024x768 on display.

This is king of vague, can you be more explicit on this issue ? which firmware ?
which display ? which HW setup ?

Any fixes tag ?

Neil

> 
> Signed-off-by: Gopi Botlagunta <venkata.botlagunta@oss.qualcomm.com>
> ---
>   drivers/gpu/drm/bridge/lontium-lt9611uxc.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
> index 38fb8776c0f4..6f2b72fba598 100644
> --- a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
> +++ b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
> @@ -382,7 +382,7 @@ lt9611uxc_bridge_detect(struct drm_bridge *bridge, struct drm_connector *connect
>   static int lt9611uxc_wait_for_edid(struct lt9611uxc *lt9611uxc)
>   {
>   	return wait_event_interruptible_timeout(lt9611uxc->wq, lt9611uxc->edid_read,
> -			msecs_to_jiffies(500));
> +			msecs_to_jiffies(1000));
>   }
>   
>   static int lt9611uxc_get_edid_block(void *data, u8 *buf, unsigned int block, size_t len)
> 
> ---
> base-commit: 3c3d81183061b9e49dd3207fbbbc36314744bf3f
> change-id: 20251121-hdmibridge-e012bfeed3c3
> 
> Best regards,

