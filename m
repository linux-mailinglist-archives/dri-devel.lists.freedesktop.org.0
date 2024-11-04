Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FF0D9BAE2B
	for <lists+dri-devel@lfdr.de>; Mon,  4 Nov 2024 09:34:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 839E710E105;
	Mon,  4 Nov 2024 08:34:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="syZWkdhi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C60D710E105
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Nov 2024 08:34:19 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id
 ffacd0b85a97d-37d4a5ecc44so2489576f8f.2
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Nov 2024 00:34:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1730709258; x=1731314058; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=0ApKzuM1Dy1yHlR1OnkyQgRDQp0Q55UQ4hWD1IiDoII=;
 b=syZWkdhiGFeT9K3SpIy9kEbzqlwNQrcIVR1CwWX5K94f6wPgfNLx2kxDzOHJJFiIGG
 3Kh6tuPvYD1Ky8C7mBIyJfjdfW+BsumGujzF/+53u4klgOWKT/ovDy3LCVgb2RzW5phB
 qy+VnBScLmN6chONykD3B5fI/c18e9L84M1TgQJm5GE4yqwSO8+kdR8M1+4eQGfabnk4
 ecaojO5NXfRJ1D4NfWsEju0jE2GWY1afsTtXnEwHm/QBXZ6byS0n5iN3O+bsGn4ACOHr
 1FJlt5MbrxuSijh2HXkLSGjetrPB4Qznufqa1jT1dH3XtTOhIUOPsXCqwlwFTScmcPoY
 SpKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730709258; x=1731314058;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=0ApKzuM1Dy1yHlR1OnkyQgRDQp0Q55UQ4hWD1IiDoII=;
 b=To4B1MpWn/V28aluZ+9qRmWflcauwpcHoSqSgMmvKg5XZkWIKnPaAWLFxd7QlXLyxO
 AB62IMqwrsEEiXjrh8+8eTdCCQQ/7TnM0Q4TRTFbpDjYLKFp8lPsA1xSRV2oTzyhwkzs
 qwC3DBACGs3/b74vdo6MNyhbEiygKQJsDkBSyOYcSfHll8SvUmZ4kSM0tn1RBJLlPGsY
 YUh1CAEQs3IO9O4fTBCNg3ZlxIy3aSGfuxeDGJUbamgJu5Xa4i8QOGnEJrnrP/buD5/S
 sErX1tspRMJRB7CC07DMqd2qc9kdv13P0MoKG+dzYh1hFy+yzJVXD37mIo2IorNnU1OH
 +1Kw==
X-Gm-Message-State: AOJu0YwXqMAMSxjKn6NalRk154atI9YJ/wCfe8M+nwAALeIqoF1v9s4Q
 meTmEhyPFl9Xy2v2Q8G8NIDeK8HqVmHTCcTAWB38fPkDVwvF8W9IR2d0eZU8FMk=
X-Google-Smtp-Source: AGHT+IFxmI5A9LHrUN21bEWOHNg1hm+NCdXeoy97NqjdjCzBuK2/l+VfezM4eItvxCTFN1s/k5MfCg==
X-Received: by 2002:adf:edc2:0:b0:37d:4ebe:164b with SMTP id
 ffacd0b85a97d-380611e1252mr20361114f8f.44.1730709257844; 
 Mon, 04 Nov 2024 00:34:17 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:5b00:c640:4c96:8a97?
 ([2a01:e0a:982:cbb0:5b00:c640:4c96:8a97])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-381c113dd95sm12652484f8f.83.2024.11.04.00.34.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Nov 2024 00:34:17 -0800 (PST)
Message-ID: <e4bf88e3-e77f-49dd-84b8-e3fa3d8ee95e@linaro.org>
Date: Mon, 4 Nov 2024 09:34:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] drm/bridge: it6505: Fix inverted reset polarity
To: Chen-Yu Tsai <wenst@chromium.org>, Andrzej Hajda
 <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 stable@vger.kernel.org
References: <20241029095411.657616-1-wenst@chromium.org>
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
In-Reply-To: <20241029095411.657616-1-wenst@chromium.org>
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

On 29/10/2024 10:54, Chen-Yu Tsai wrote:
> The IT6505 bridge chip has a active low reset line. Since it is a
> "reset" and not an "enable" line, the GPIO should be asserted to
> put it in reset and deasserted to bring it out of reset during
> the power on sequence.
> 
> The polarity was inverted when the driver was first introduced, likely
> because the device family that was targeted had an inverting level
> shifter on the reset line.
> 
> The MT8186 Corsola devices already have the IT6505 in their device tree,
> but the whole display pipeline is actually disabled and won't be enabled
> until some remaining issues are sorted out. The other known user is
> the MT8183 Kukui / Jacuzzi family; their device trees currently do not
> have the IT6505 included.
> 
> Fix the polarity in the driver while there are no actual users.
> 
> Fixes: b5c84a9edcd4 ("drm/bridge: add it6505 driver")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> ---
>   drivers/gpu/drm/bridge/ite-it6505.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/ite-it6505.c b/drivers/gpu/drm/bridge/ite-it6505.c
> index 7502a5f81557..df7ecdf0f422 100644
> --- a/drivers/gpu/drm/bridge/ite-it6505.c
> +++ b/drivers/gpu/drm/bridge/ite-it6505.c
> @@ -2618,9 +2618,9 @@ static int it6505_poweron(struct it6505 *it6505)
>   	/* time interval between OVDD and SYSRSTN at least be 10ms */
>   	if (pdata->gpiod_reset) {
>   		usleep_range(10000, 20000);
> -		gpiod_set_value_cansleep(pdata->gpiod_reset, 0);
> -		usleep_range(1000, 2000);
>   		gpiod_set_value_cansleep(pdata->gpiod_reset, 1);
> +		usleep_range(1000, 2000);
> +		gpiod_set_value_cansleep(pdata->gpiod_reset, 0);
>   		usleep_range(25000, 35000);
>   	}
>   
> @@ -2651,7 +2651,7 @@ static int it6505_poweroff(struct it6505 *it6505)
>   	disable_irq_nosync(it6505->irq);
>   
>   	if (pdata->gpiod_reset)
> -		gpiod_set_value_cansleep(pdata->gpiod_reset, 0);
> +		gpiod_set_value_cansleep(pdata->gpiod_reset, 1);
>   
>   	if (pdata->pwr18) {
>   		err = regulator_disable(pdata->pwr18);
> @@ -3205,7 +3205,7 @@ static int it6505_init_pdata(struct it6505 *it6505)
>   		return PTR_ERR(pdata->ovdd);
>   	}
>   
> -	pdata->gpiod_reset = devm_gpiod_get(dev, "reset", GPIOD_OUT_LOW);
> +	pdata->gpiod_reset = devm_gpiod_get(dev, "reset", GPIOD_OUT_HIGH);
>   	if (IS_ERR(pdata->gpiod_reset)) {
>   		dev_err(dev, "gpiod_reset gpio not found");
>   		return PTR_ERR(pdata->gpiod_reset);

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
