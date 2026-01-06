Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63002CF7422
	for <lists+dri-devel@lfdr.de>; Tue, 06 Jan 2026 09:17:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEC6710E482;
	Tue,  6 Jan 2026 08:17:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="cgbz8s8P";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95E2E10E482
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Jan 2026 08:17:04 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-477ba2c1ca2so7344445e9.2
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Jan 2026 00:17:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1767687423; x=1768292223; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=8syWFBtwAv35FlUofUesXahbPdch87g6/TEoKmy0khU=;
 b=cgbz8s8PHxdJeRnEJI7fJqm91rKDJ5FY9AXzuaVx0Ac8vajBOKUroDJPe3HPPsCt6g
 zYMHcvGsTfKCsxFY8pVYU3CEc04jC6pr7xdgB4DQnHjFo/rpEQbz6dLIgFako8Kog1NS
 X1Wce9gGdIwYcON4mTuhaJ5JfQ3kZYjWcW7/km6rkmRznJX+svsSsYcRc05/Ek2luhoz
 OYOscKAKiOALUS+S1NnS09aJU0svzU7RQq1jCdcbJVpmSz44IzD83UbLDfLDneNbLLX/
 /hbBhsk88CjQUBa0OrqLzRl/+VdxfPVxT4LtKNzK4uxJtfbew8lMWJHLINRRDvv3d0OW
 P3Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767687423; x=1768292223;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8syWFBtwAv35FlUofUesXahbPdch87g6/TEoKmy0khU=;
 b=WGnsrusJqDskSRYD0FxIxJLP8WJEP1wS0kiNir2oWVIY6Pyc8EL4BaDzskHVSVIk7n
 qv4B31krjNHNFYMchexs2m0cTM13EmPp3vNWMJ0bBqDeM6jyZbIkZLSe7A2juzd5sxUC
 xHHuULJqQKyyuvl1Bl4OwHBAh5UJ7xFzM8DwF0XIiP55iRWIRoMZ/ApAjfNgi9lndc6+
 cX5ENpsQM8v9HahpWanHBQb+adHrLYrzwdpc7t7KgqeSJJ3rZeLUkpCr2OamY7Y3Ezok
 cegJdJK8CK8149gO41+7gEENwIrr+PXZsNFWLtoVRVNBWTf0OGQUn4fDrKyq/+Rh3vvn
 wboQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVgVBx/cF9ow7I/JUOPiua2zQr1NVfwhQg5FsD37TqVLONzMtxK2zficWHK+NqaHyzq/SNhZhXuGQo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyC6GDIdHAf5bcHM/PddZAPpNMOXUerTHBJYQYEofHScgEhNcW9
 98X46ENDHjPqBgtQrtJ8qHiKOKNomuWaR9GdG8tnpeE8e8YDWyqYKYaJkg4Qz2/rfvc=
X-Gm-Gg: AY/fxX6tp7rwBw5oefMkC+wP4Ign5wXfokJB8YvYcNOTUvAAlnDF98g+ub29rXAr9Bq
 c/vksoih+nP2KLzHNpHJEkiMmSi1IAQfm/jdq1gBUd4eBp6xmoOgYMq4KjksixSAupEC2xttYrs
 VbXhtrhK2tBZOreS9IbaCcHUYpuVSEeNsvauT8r7eHSCnT2I+vatXPkSzZmqXyInVqs+YfSHsTx
 m6CcvnPoKufvUD/UF4DoRVoM0pX1l4qEe3nVWILAccIqYI+IE8JmqI9zhp8bHvWm340cZj/S2+M
 3FFULgfC6EjrWf+fg6+OTbv+cSMEQbJwtIBypml80dMX7P/UVmtgi3OdTr6Mc4GqM8QGD2Sz23j
 oxzKezC7czlfbH1KQjIMogWnTLKxU2Q3AmfKOIP3FtfdyGXmv8GC3Xrck2pW33BN6VVbju6UQ1v
 nQYeE7iKPFfKA508tNybhzsWqN1gntlleKe36Zl/K1CYsLNrB59gTFvSUolN4QtGo=
X-Google-Smtp-Source: AGHT+IEzhJITnseqv48zSnNBgW6mLJVVAMC7JybLA/blo46nMNV5TehlsEQlB1OMvgCVTp6hKqqWAQ==
X-Received: by 2002:a05:600c:8591:b0:475:e09c:960e with SMTP id
 5b1f17b1804b1-47d7f3802admr19536335e9.32.1767687423019; 
 Tue, 06 Jan 2026 00:17:03 -0800 (PST)
Received: from ?IPV6:2a01:e0a:3d9:2080:d283:7a7e:4c57:678d?
 ([2a01:e0a:3d9:2080:d283:7a7e:4c57:678d])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47d7fb50da2sm12170865e9.17.2026.01.06.00.17.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Jan 2026 00:17:02 -0800 (PST)
Message-ID: <8bcc749c-84ba-4f1d-a383-51f58e8a5422@linaro.org>
Date: Tue, 6 Jan 2026 09:17:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] drm/panel: himax-hx83102: change to
 gpiod_set_value_cansleep
To: Vladimir Yakovlev <vovchkir@gmail.com>,
 Cong Yang <yangcong5@huaqin.corp-partner.google.com>
Cc: Jessica Zhang <jesszhan0024@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20251208161613.3763049-1-vovchkir@gmail.com>
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
In-Reply-To: <20251208161613.3763049-1-vovchkir@gmail.com>
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

On 12/8/25 17:16, Vladimir Yakovlev wrote:
> It's better to use gpiod_set_value_cansleep because the panel can be
> connected via i2c/spi expander or similar external devices
> 
> for reference see Documentation/driver-api/gpio/consumer.rst
> 
> Signed-off-by: Vladimir Yakovlev <vovchkir@gmail.com>
> ---
>   drivers/gpu/drm/panel/panel-himax-hx83102.c | 12 ++++++------
>   1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-himax-hx83102.c b/drivers/gpu/drm/panel/panel-himax-hx83102.c
> index 602f1adfc8ee..f31e502f71a3 100644
> --- a/drivers/gpu/drm/panel/panel-himax-hx83102.c
> +++ b/drivers/gpu/drm/panel/panel-himax-hx83102.c
> @@ -1049,7 +1049,7 @@ static int hx83102_unprepare(struct drm_panel *panel)
>   {
>   	struct hx83102 *ctx = panel_to_hx83102(panel);
>   
> -	gpiod_set_value(ctx->enable_gpio, 0);
> +	gpiod_set_value_cansleep(ctx->enable_gpio, 0);
>   	usleep_range(1000, 2000);
>   	regulator_disable(ctx->avee);
>   	regulator_disable(ctx->avdd);
> @@ -1065,7 +1065,7 @@ static int hx83102_prepare(struct drm_panel *panel)
>   	struct mipi_dsi_device *dsi = ctx->dsi;
>   	struct mipi_dsi_multi_context dsi_ctx = { .dsi = dsi };
>   
> -	gpiod_set_value(ctx->enable_gpio, 0);
> +	gpiod_set_value_cansleep(ctx->enable_gpio, 0);
>   	usleep_range(1000, 1500);
>   
>   	dsi_ctx.accum_err = regulator_enable(ctx->pp1800);
> @@ -1089,11 +1089,11 @@ static int hx83102_prepare(struct drm_panel *panel)
>   
>   	usleep_range(1000, 2000);
>   
> -	gpiod_set_value(ctx->enable_gpio, 1);
> +	gpiod_set_value_cansleep(ctx->enable_gpio, 1);
>   	usleep_range(1000, 2000);
> -	gpiod_set_value(ctx->enable_gpio, 0);
> +	gpiod_set_value_cansleep(ctx->enable_gpio, 0);
>   	usleep_range(1000, 2000);
> -	gpiod_set_value(ctx->enable_gpio, 1);
> +	gpiod_set_value_cansleep(ctx->enable_gpio, 1);
>   	usleep_range(6000, 10000);
>   
>   	dsi_ctx.accum_err = ctx->desc->init(ctx);
> @@ -1107,7 +1107,7 @@ static int hx83102_prepare(struct drm_panel *panel)
>   	return 0;
>   
>   poweroff:
> -	gpiod_set_value(ctx->enable_gpio, 0);
> +	gpiod_set_value_cansleep(ctx->enable_gpio, 0);
>   	regulator_disable(ctx->avee);
>   poweroffavdd:
>   	regulator_disable(ctx->avdd);

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil
