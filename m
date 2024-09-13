Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 06E72977BDC
	for <lists+dri-devel@lfdr.de>; Fri, 13 Sep 2024 11:08:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 745FA10ECCE;
	Fri, 13 Sep 2024 09:08:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="tEOfFBdV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D60D110ECCE
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Sep 2024 09:08:20 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-42cb806623eso17173815e9.2
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Sep 2024 02:08:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1726218499; x=1726823299; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=2zXx0z+xH+ztolGxVZqnELYkWb3KijRHRTYHi+pwjgg=;
 b=tEOfFBdVQGVgZaVaWcG0z3Tdd8YKhNs5hdfTYWDM++todXbosm/P7vJZOSu21IHTWI
 eB25iYQopQ6SWkef+EWJU2fi8jO0bt85/Bmtm7GeNaK8JLixnt0nSM7QdwJP17+pJEJ1
 1iW3m94zVVuxqTugmIwnyFMxzpMGBXmLJmKiUqRUJpFuQmlx+deIK9pp+INmE+G5wJge
 v2BYo057Bzf0U7/BJY1ajw3q5/YEuXs79bcZOFYt2A7byLzmLzqYdeeDRbBcCwyQhn9Q
 CqyznKOCkwLf9rCT5XHGvwjMXgqlyTre/a6/T7/U/BjDfxwDEy5F/eDQ921LNveIB2/E
 162Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726218499; x=1726823299;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=2zXx0z+xH+ztolGxVZqnELYkWb3KijRHRTYHi+pwjgg=;
 b=Kn9CoVvkN/7S6C2M0qnWsAc4hC9TooQ92gcKI8Ozztppx7Kp1BK1tELDqYLv7gyXwD
 Hy3HagdMViTCPnGHd2nNqVM5qG+YdHoLx6ScH2eWFEjmxONAK15Jb3GyyuMcTRPqZca0
 56EU1xF27zun0BSVFvW10MovUgrWUnsFZRVgxtqBk8zvQQQou4zIS7lWbofk4QyvcDUJ
 W+F9R8BkbYQ/abJRlXrrGp76wn6RaBupCBHQZ3LT45vUi0Vr8b6kj6OU8UfZ1yIu7Qfb
 VR0NAwV5QbzE0yp+PCJeS4HMJvxnGsqtVHJI7gin0npYk9CVb0X0jkiYKFdP8BdF/utM
 9YGA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUKu6Vwq6pHa2dXiX5ryeM6gYzdAF/EadWwtBrg/qSGqME/1z0vLgke+UQXOhM8O18qeBjTGiNaXaA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzoLp0+gxCkxqdxuMKZFf0SNEPA392jQMlU7/5aOqlcVOyRxWU8
 Vai1XoTMbQYJqyK/0Th0d3zrGXe0/xQs/LSVlJ6f97glcFF3MlyLpkM7uB9Mq9E=
X-Google-Smtp-Source: AGHT+IHzdj8Qdeqcflbe7N/Vxy3Vcy9D7hn8FJ/UrFypGxQko7JmlxIesFhGpEOKh4a8XIeaKuTKZw==
X-Received: by 2002:a05:600c:3108:b0:42c:be90:fa2f with SMTP id
 5b1f17b1804b1-42cdb5662bfmr49050235e9.25.1726218498820; 
 Fri, 13 Sep 2024 02:08:18 -0700 (PDT)
Received: from [192.168.7.202] ([212.114.21.58])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42d9b05d5dbsm17380175e9.13.2024.09.13.02.08.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Sep 2024 02:08:18 -0700 (PDT)
Message-ID: <d9ef7158-5cf9-49a2-96b3-c2b91b23e210@linaro.org>
Date: Fri, 13 Sep 2024 11:08:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH] drm/panel: raydium-rm69380: transition to mipi_dsi
 wrapped functions
To: Tejas Vipin <tejasvipin76@gmail.com>, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch
Cc: quic_jesszhan@quicinc.com, dianders@chromium.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20240907140130.410349-1-tejasvipin76@gmail.com>
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
In-Reply-To: <20240907140130.410349-1-tejasvipin76@gmail.com>
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

Hi,
On 07/09/2024 16:01, Tejas Vipin wrote:
> Changes the raydium-rm69380 panel to use multi style functions for
> improved error handling.
> 
> Signed-off-by: Tejas Vipin <tejasvipin76@gmail.com>
> ---
>   drivers/gpu/drm/panel/panel-raydium-rm69380.c | 95 ++++++-------------
>   1 file changed, 30 insertions(+), 65 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-raydium-rm69380.c b/drivers/gpu/drm/panel/panel-raydium-rm69380.c
> index 4dca6802faef..bdab844dab55 100644
> --- a/drivers/gpu/drm/panel/panel-raydium-rm69380.c
> +++ b/drivers/gpu/drm/panel/panel-raydium-rm69380.c
> @@ -46,108 +46,73 @@ static void rm69380_reset(struct rm69380_panel *ctx)
>   static int rm69380_on(struct rm69380_panel *ctx)
>   {
>   	struct mipi_dsi_device *dsi = ctx->dsi[0];
> -	struct device *dev = &dsi->dev;
> -	int ret;
> +	struct mipi_dsi_multi_context dsi_ctx = { .dsi = dsi };
>   
>   	dsi->mode_flags |= MIPI_DSI_MODE_LPM;
>   	if (ctx->dsi[1])
>   		ctx->dsi[1]->mode_flags |= MIPI_DSI_MODE_LPM;
>   
> -	mipi_dsi_dcs_write_seq(dsi, 0xfe, 0xd4);
> -	mipi_dsi_dcs_write_seq(dsi, 0x00, 0x80);
> -	mipi_dsi_dcs_write_seq(dsi, 0xfe, 0xd0);
> -	mipi_dsi_dcs_write_seq(dsi, 0x48, 0x00);
> -	mipi_dsi_dcs_write_seq(dsi, 0xfe, 0x26);
> -	mipi_dsi_dcs_write_seq(dsi, 0x75, 0x3f);
> -	mipi_dsi_dcs_write_seq(dsi, 0x1d, 0x1a);
> -	mipi_dsi_dcs_write_seq(dsi, 0xfe, 0x00);
> -	mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_WRITE_CONTROL_DISPLAY, 0x28);
> -	mipi_dsi_dcs_write_seq(dsi, 0xc2, 0x08);
> -
> -	ret = mipi_dsi_dcs_set_tear_on(dsi, MIPI_DSI_DCS_TEAR_MODE_VBLANK);
> -	if (ret < 0) {
> -		dev_err(dev, "Failed to set tear on: %d\n", ret);
> -		return ret;
> -	}
> -
> -	ret = mipi_dsi_dcs_exit_sleep_mode(dsi);
> -	if (ret < 0) {
> -		dev_err(dev, "Failed to exit sleep mode: %d\n", ret);
> -		return ret;
> -	}
> -	msleep(20);
> -
> -	ret = mipi_dsi_dcs_set_display_on(dsi);
> -	if (ret < 0) {
> -		dev_err(dev, "Failed to set display on: %d\n", ret);
> -		return ret;
> -	}
> -	msleep(36);
> -
> -	return 0;
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xfe, 0xd4);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x00, 0x80);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xfe, 0xd0);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x48, 0x00);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xfe, 0x26);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x75, 0x3f);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x1d, 0x1a);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xfe, 0x00);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MIPI_DCS_WRITE_CONTROL_DISPLAY, 0x28);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xc2, 0x08);
> +
> +	mipi_dsi_dcs_set_tear_on_multi(&dsi_ctx, MIPI_DSI_DCS_TEAR_MODE_VBLANK);
> +	mipi_dsi_dcs_exit_sleep_mode_multi(&dsi_ctx);
> +	mipi_dsi_msleep(&dsi_ctx, 20);
> +
> +	mipi_dsi_dcs_set_display_on_multi(&dsi_ctx);
> +	mipi_dsi_msleep(&dsi_ctx, 36);
> +
> +	return dsi_ctx.accum_err;
>   }
>   
> -static int rm69380_off(struct rm69380_panel *ctx)
> +static void rm69380_off(struct rm69380_panel *ctx)
>   {
>   	struct mipi_dsi_device *dsi = ctx->dsi[0];
> -	struct device *dev = &dsi->dev;
> -	int ret;
> +	struct mipi_dsi_multi_context dsi_ctx = { .dsi = dsi };
>   
>   	dsi->mode_flags &= ~MIPI_DSI_MODE_LPM;
>   	if (ctx->dsi[1])
>   		ctx->dsi[1]->mode_flags &= ~MIPI_DSI_MODE_LPM;
>   
> -	ret = mipi_dsi_dcs_set_display_off(dsi);
> -	if (ret < 0) {
> -		dev_err(dev, "Failed to set display off: %d\n", ret);
> -		return ret;
> -	}
> -	msleep(35);
> -
> -	ret = mipi_dsi_dcs_enter_sleep_mode(dsi);
> -	if (ret < 0) {
> -		dev_err(dev, "Failed to enter sleep mode: %d\n", ret);
> -		return ret;
> -	}
> -	msleep(20);
> -
> -	return 0;
> +	mipi_dsi_dcs_set_display_off_multi(&dsi_ctx);
> +	mipi_dsi_msleep(&dsi_ctx, 35);
> +	mipi_dsi_dcs_enter_sleep_mode_multi(&dsi_ctx);
> +	mipi_dsi_msleep(&dsi_ctx, 20);
>   }
>   
>   static int rm69380_prepare(struct drm_panel *panel)
>   {
>   	struct rm69380_panel *ctx = to_rm69380_panel(panel);
> -	struct device *dev = &ctx->dsi[0]->dev;
>   	int ret;
>   
>   	ret = regulator_bulk_enable(ARRAY_SIZE(ctx->supplies), ctx->supplies);
> -	if (ret < 0) {
> -		dev_err(dev, "Failed to enable regulators: %d\n", ret);
> -		return ret;
> -	}
> +	if (ret < 0)
> +		return ret;	
>   
>   	rm69380_reset(ctx);
>   
>   	ret = rm69380_on(ctx);
>   	if (ret < 0) {
> -		dev_err(dev, "Failed to initialize panel: %d\n", ret);
>   		gpiod_set_value_cansleep(ctx->reset_gpio, 1);
>   		regulator_bulk_disable(ARRAY_SIZE(ctx->supplies), ctx->supplies);
> -		return ret;
>   	}
>   
> -	return 0;
> +	return ret;
>   }
>   
>   static int rm69380_unprepare(struct drm_panel *panel)
>   {
>   	struct rm69380_panel *ctx = to_rm69380_panel(panel);
> -	struct device *dev = &ctx->dsi[0]->dev;
> -	int ret;
>   
> -	ret = rm69380_off(ctx);
> -	if (ret < 0)
> -		dev_err(dev, "Failed to un-initialize panel: %d\n", ret);
> +	rm69380_off(ctx);
>   
>   	gpiod_set_value_cansleep(ctx->reset_gpio, 1);
>   	regulator_bulk_disable(ARRAY_SIZE(ctx->supplies), ctx->supplies);

I get:
-:129: ERROR:TRAILING_WHITESPACE: trailing whitespace
#129: FILE: drivers/gpu/drm/panel/panel-raydium-rm69380.c:97:
+^Iif (ret < 0) $

-:130: ERROR:TRAILING_WHITESPACE: trailing whitespace
#130: FILE: drivers/gpu/drm/panel/panel-raydium-rm69380.c:98:
+^I^Ireturn ret;^I$

could you fix those ?

Thanks,
Neil

