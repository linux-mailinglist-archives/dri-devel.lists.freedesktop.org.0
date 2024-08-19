Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 938F9956EDB
	for <lists+dri-devel@lfdr.de>; Mon, 19 Aug 2024 17:34:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA72510E2CE;
	Mon, 19 Aug 2024 15:34:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="GZrLT+pq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2C2210E2D0
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Aug 2024 15:34:36 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-4280ca0791bso36488385e9.1
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Aug 2024 08:34:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1724081675; x=1724686475; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=gELSb0mONNzrVXHjZTppbBGkLEu9pviFKrK4IGH6TKs=;
 b=GZrLT+pqXP11hU3AynWgNmW04ZmaORZYObuqYaYonbqWcEwc8AAFcNdn8/VXQ2+7n/
 whTPk7rsxpfDlLVZrUyIdttiGc/csuHcrTVZ4IqFyqmCT430AEVxsE4a1hNUbitfHwIf
 c97jR/WhVcZe3DCB7937XK2V2AeknCRmJeP6iJDDZrK3Wbt88Ak1ABwizuIiWv0u6lOO
 rBvRLJa9v7RWfrkqPeq6qQUWDz8hdor60S1mRTcwOvlSrBeTNo5jUCu1ktZsin/dycBa
 PKSI8rGTa4rQ9MRL8BEmeUzNgkUykVdHUnHVupI78mo3jKhoc3INEw9TbipxZ3L0beNE
 7NOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724081675; x=1724686475;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=gELSb0mONNzrVXHjZTppbBGkLEu9pviFKrK4IGH6TKs=;
 b=ZC5DoPiYjqZAZVIwRfRtjolobuO6Ccr10GM1GtzW7FCzESqrQGpra6kGSsGjfsgWRY
 3uceodRmkpVkKw712M4I64MMEJ3oYwDZFASIm6dmWvxwCQpBUTgwGF4/0zN1nwJP5R70
 RPpFLRZmFmw4hB4WF77q7h/H5tKl60LbVM5FtWkgF5CbCcyFXMGWyZIAot9lAmGhs/6D
 5bq8SzENXR/LfffF+NlVkBQ/qx7/R43WrXQreCS1UWNN1g0MHmfQSSo8nk4OcHw6gXyg
 fn03YT/gXxICgCH+SflUQsJK8N6kk2VpL17odaMtiuUvEWVsfpvX2Q7Ek+fwOygFMMGF
 tMPg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWpoKmFBtGSTTm45Gbh+n5ZLCi4vKQCCwptC32UunyWMMiLHJo5+ufW74K2yBEM95lPS2erE8QK+D2oRpGbRqedlwzvDIuS75lisqQJMRKS
X-Gm-Message-State: AOJu0YyDi+uj6Om1I0FVoufzvRRQ2giDoxDLEf6er8ibJHghV/aHx0Lo
 GOOhe4/c9TPsiYO95z/g0vWiYhY1NATiDKXIpw+1IJjom6NcFzwFux+SovzOa9W3JuHaVj++CaS
 o
X-Google-Smtp-Source: AGHT+IHMaUUYq+Edi91ZeQKQp/ozhDLsN2BfvaefQx6mMZkbY2NlgErzK4DrnNKPD89uUTge96ByFw==
X-Received: by 2002:a05:6000:1112:b0:371:728e:d000 with SMTP id
 ffacd0b85a97d-3719431768fmr6655547f8f.1.1724081674040; 
 Mon, 19 Aug 2024 08:34:34 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:f54e:4b0a:5175:5727?
 ([2a01:e0a:982:cbb0:f54e:4b0a:5175:5727])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-429ed7945b8sm114207095e9.44.2024.08.19.08.34.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Aug 2024 08:34:33 -0700 (PDT)
Message-ID: <cd53b240-0db6-4d27-85d6-e2004086fd29@linaro.org>
Date: Mon, 19 Aug 2024 17:34:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH -next 6/8] drm/panel: khadas-ts050: Make ts050_panel_data
 and ts050v2_panel_data static
To: Jinjie Ruan <ruanjinjie@huawei.com>, quic_jesszhan@quicinc.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20240819120043.3884933-1-ruanjinjie@huawei.com>
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
In-Reply-To: <20240819120043.3884933-1-ruanjinjie@huawei.com>
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

On 19/08/2024 14:00, Jinjie Ruan wrote:
> The sparse tool complains as follows:
> 
> drivers/gpu/drm/panel/panel-khadas-ts050.c:620:32: warning:
> 	symbol 'ts050_panel_data' was not declared. Should it be static?
> 
> drivers/gpu/drm/panel/panel-khadas-ts050.c:625:32: warning:
> 	symbol 'ts050v2_panel_data' was not declared. Should it be static?
> 
> These symbols are not used outside panel-khadas-ts050.c, so marks them static.
> 
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> ---
>   drivers/gpu/drm/panel/panel-khadas-ts050.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-khadas-ts050.c b/drivers/gpu/drm/panel/panel-khadas-ts050.c
> index 14932cb3defc..0e5e8e57bd1e 100644
> --- a/drivers/gpu/drm/panel/panel-khadas-ts050.c
> +++ b/drivers/gpu/drm/panel/panel-khadas-ts050.c
> @@ -617,12 +617,12 @@ static const struct khadas_ts050_panel_cmd ts050_init_code[] = {
>   	{0xd4, {0x04}, 0x01}, /* RGBMIPICTRL: VSYNC front porch = 4 */
>   };
>   
> -struct khadas_ts050_panel_data ts050_panel_data = {
> +static struct khadas_ts050_panel_data ts050_panel_data = {
>   	.init_code = (struct khadas_ts050_panel_cmd *)ts050_init_code,
>   	.len = ARRAY_SIZE(ts050_init_code)
>   };
>   
> -struct khadas_ts050_panel_data ts050v2_panel_data = {
> +static struct khadas_ts050_panel_data ts050v2_panel_data = {
>   	.init_code = (struct khadas_ts050_panel_cmd *)ts050v2_init_code,
>   	.len = ARRAY_SIZE(ts050v2_init_code)
>   };

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
