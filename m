Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A2709BAE44
	for <lists+dri-devel@lfdr.de>; Mon,  4 Nov 2024 09:38:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89C7610E2A7;
	Mon,  4 Nov 2024 08:38:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="mFhI3GYN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F67B10E2A7
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Nov 2024 08:38:11 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-43193678216so34224655e9.0
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Nov 2024 00:38:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1730709490; x=1731314290; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=e83PBrZ2+8RgvR0+f5rIcaJoLoknnY9EikEgarlzHfU=;
 b=mFhI3GYNsTNp5LnT3aJ5XsRVXWkVjQe0kKlsGNi09/WYptuxjWW96yQ4wvmDLcR2M+
 xkMApF4cS153BHObxR5KYvcK5251U0c4RmLnyH/MsXNnTEUMcKtSt/tI8K9ZVYK6/ela
 2ELuAZ/zWzL1i3Tnk18wA0wc/5w/nWmnDHa53jelyCjqaqq7O/pXHVvu3Lks7TyyhsAO
 8ZQ3Yj1dUOJ81r3hvbU7baBgw7J8YNgvWSOHObT/UNfyAvX9ASjgAhPEkNjmIPX5ZFi0
 /7uewYibgFF5UKQvDs+RA0RDENUbMJqgHZrHuUUI3xYAx2X8zSLSn2W++bW6DW9LFpr1
 ac6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730709490; x=1731314290;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=e83PBrZ2+8RgvR0+f5rIcaJoLoknnY9EikEgarlzHfU=;
 b=JPST181bDmX+PSNGV2QkTf3MbhZZTvfhVOtxgSEN5rAd94SQSj4W0he2gq9Z3R6JrW
 JIgY8rb7/TukWQGjDWg6Bootr/5agsSOR3ueUBSBkgzitgY1BH7V+wGypUVRXlj5P7Nr
 d0W1Nq9q1sYObIiB2AXM4guxddkwx3J02U5zZxIZ1z61DrTQKydntaALTZFdYZ/osE28
 t9R+V5hPS9XRnWg+NfHlpLtZy94cuEa2e/HcY5+jIFMrNWThJAs78SGXpDd8fWNhe8ch
 XktjilU6TgzXmXYOhFZPW+CSAwUzRM0bxJDt/LyfO/Apb+0JM3iXoswh6x/N9T8X3mnP
 0AYQ==
X-Gm-Message-State: AOJu0YxdioKQBn8P1P4UaFlQxOKzZaCQSsxe+oH0u/oY3v47bnNRXfdv
 XZ+MUuQmb7qbfteAi48p/uoQcs3u3377EvQrMMRlIs15U62COwlByfc1kt9fz0k=
X-Google-Smtp-Source: AGHT+IE5wB3bk4d8f4ElLNv8NT3FiHd8A7luVTQBq9UWe421zsB6UjMbC/NnsfpUszc4iQVbGfUUrQ==
X-Received: by 2002:a05:600c:4f4a:b0:42c:b9c8:2bb0 with SMTP id
 5b1f17b1804b1-4319ac70637mr256195995e9.4.1730709489609; 
 Mon, 04 Nov 2024 00:38:09 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:5b00:c640:4c96:8a97?
 ([2a01:e0a:982:cbb0:5b00:c640:4c96:8a97])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-431bd8e8471sm181055285e9.4.2024.11.04.00.38.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Nov 2024 00:38:09 -0800 (PST)
Message-ID: <f1c1cb36-0166-48de-8fdb-6ac63a1fd18a@linaro.org>
Date: Mon, 4 Nov 2024 09:38:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH] drm/panel: novatek-nt35950: fix return value check in
 nt35950_probe()
To: Yang Yingliang <yangyingliang@huaweicloud.com>,
 quic_jesszhan@quicinc.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 angelogioacchino.delregno@somainline.org, sam@ravnborg.org,
 marijn.suijten@somainline.org
Cc: dri-devel@lists.freedesktop.org, yangyingliang@huawei.com,
 bobo.shaobowang@huawei.com
References: <20241029123957.1588-1-yangyingliang@huaweicloud.com>
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
In-Reply-To: <20241029123957.1588-1-yangyingliang@huaweicloud.com>
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

On 29/10/2024 13:39, Yang Yingliang wrote:
> From: Yang Yingliang <yangyingliang@huawei.com>
> 
> mipi_dsi_device_register_full() never returns NULL pointer, it
> will return ERR_PTR() when it fails, so replace the check with
> IS_ERR().
> 
> Fixes: 623a3531e9cf ("drm/panel: Add driver for Novatek NT35950 DSI DriverIC panels")
> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
> ---
>   drivers/gpu/drm/panel/panel-novatek-nt35950.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-novatek-nt35950.c b/drivers/gpu/drm/panel/panel-novatek-nt35950.c
> index b036208f9356..08b22b592ab0 100644
> --- a/drivers/gpu/drm/panel/panel-novatek-nt35950.c
> +++ b/drivers/gpu/drm/panel/panel-novatek-nt35950.c
> @@ -481,9 +481,9 @@ static int nt35950_probe(struct mipi_dsi_device *dsi)
>   			return dev_err_probe(dev, -EPROBE_DEFER, "Cannot get secondary DSI host\n");
>   
>   		nt->dsi[1] = mipi_dsi_device_register_full(dsi_r_host, info);
> -		if (!nt->dsi[1]) {
> +		if (IS_ERR(nt->dsi[1])) {
>   			dev_err(dev, "Cannot get secondary DSI node\n");
> -			return -ENODEV;
> +			return PTR_ERR(nt->dsi[1]);
>   		}
>   		num_dsis++;
>   	}

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
