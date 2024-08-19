Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36F05956EE0
	for <lists+dri-devel@lfdr.de>; Mon, 19 Aug 2024 17:36:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3A0810E2CF;
	Mon, 19 Aug 2024 15:36:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="dk13XKpS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC1DF10E2CF
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Aug 2024 15:36:19 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-4280bbdad3dso34787215e9.0
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Aug 2024 08:36:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1724081778; x=1724686578; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=Zaj59aKVrAtowXfAlcri02aQYdNUrJ98uxFca+ipLVk=;
 b=dk13XKpSk5NdpUfFA8ao0xHM8mtDMIUkxmAxob0sjHK2Fa9Ev3oDcY//pJyBRdYuDY
 08h9VHIinrjQ1qumIv6xiY7169gAj7bZnmPepQ3Wp5HMvBdf3FEeAP/vutCVdubKXx5r
 fIxuxfU9/nOChvw1CkBlUAqaX0CGwSSr4CBWhiYfffUyqjy2yrVrkOe/vwKP1c15GGui
 SFj4dZ8CKP7KkjoXq9DRF5Md6orGbDHY/N3mTWH+chaPVuSxBEC6Iu2T8dcUpwDQxfKg
 8+Oj+MRd+Xuyq0k7JmQCLjxcPiU98lxrjH/uJ6n0cBEitF2ZFCqpatUWQhkpU7zEwon7
 YLGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724081778; x=1724686578;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=Zaj59aKVrAtowXfAlcri02aQYdNUrJ98uxFca+ipLVk=;
 b=AeioaWS5jyWylC2rKIaITohjz2as/Dxs2Yr0N6XUxenAiTEiR0FTn4BvMcKq0kVvkw
 VE1mfLc3p+neGvvMu5D8qq70LDJxtkuUhhjQl72tpSx7iX1T9AA29orGI5lLQY17vnmK
 f0j1mUVy9C9lduHIc0yWaRTGOyu1gJ1aJwz7+iik04HNW2+uTgWlEJKyzIYle923OHMH
 u65uoo02gNpst2ceqpwMo5nLebYuQl8/ohYpJqnbsVvxVU+sqN5RrGLg/Rp+9HqhEMik
 34fMIriQjSRk17oT3QYT9r7gi2PbyufcJOQPIooQHddIc/8ANhRjhqs7GMVKmbA2ysqu
 l+ZQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU+otM5LDiGkuwGzvj/qWYl3hFocYpNZFMBGE/Ov/+72F1csYrF3Ah2GRV5ETJd8WSVi/YTmdc9pDxD+iAWcWkM+tScXvhbulRbuXABnQTF
X-Gm-Message-State: AOJu0Yw9pvPrX99gyN5DYIz+wE0ELdlopXOHb1gJAA+WUGlY5+2a46SF
 LgszCnRgXx0HV17ocdMAx/axYLE8gzSPy9fAaFhr0iCrrjbCV8Jk0t9NM7z83jQ=
X-Google-Smtp-Source: AGHT+IHIIiLXfwadBpfqfQEoziKcvHPzTsUe1RZgWRiLWLfv1Xy/IHTASLKF6VG4I94sfleVZcYjQA==
X-Received: by 2002:a05:600c:4f96:b0:426:686f:cb4c with SMTP id
 5b1f17b1804b1-429ed7db8eemr70822855e9.32.1724081777634; 
 Mon, 19 Aug 2024 08:36:17 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:f54e:4b0a:5175:5727?
 ([2a01:e0a:982:cbb0:f54e:4b0a:5175:5727])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-429ed79be15sm113319105e9.48.2024.08.19.08.36.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Aug 2024 08:36:17 -0700 (PDT)
Message-ID: <4be2f1d1-534c-4c99-a35e-f354c75c88b4@linaro.org>
Date: Mon, 19 Aug 2024 17:36:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH] drm/panel: mantix-mlaf057we51: transition to mipi_dsi
 wrapped functions
To: Tejas Vipin <tejasvipin76@gmail.com>, agx@sigxcpu.org, kernel@puri.sm
Cc: dianders@chromium.org, quic_jesszhan@quicinc.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20240818072356.870465-1-tejasvipin76@gmail.com>
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
In-Reply-To: <20240818072356.870465-1-tejasvipin76@gmail.com>
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

On 18/08/2024 09:23, Tejas Vipin wrote:
> Changes the mantix-mlaf057we51 panel to use multi style functions for
> improved error handling.
> 
> Signed-off-by: Tejas Vipin <tejasvipin76@gmail.com>
> ---
>   .../gpu/drm/panel/panel-mantix-mlaf057we51.c  | 79 +++++++------------
>   1 file changed, 27 insertions(+), 52 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-mantix-mlaf057we51.c b/drivers/gpu/drm/panel/panel-mantix-mlaf057we51.c
> index ea4a6bf6d35b..4db852ffb0f6 100644
> --- a/drivers/gpu/drm/panel/panel-mantix-mlaf057we51.c
> +++ b/drivers/gpu/drm/panel/panel-mantix-mlaf057we51.c
> @@ -23,7 +23,7 @@
>   
>   /* Manufacturer specific Commands send via DSI */
>   #define MANTIX_CMD_OTP_STOP_RELOAD_MIPI 0x41
> -#define MANTIX_CMD_INT_CANCEL           0x4C
> +#define MANTIX_CMD_INT_CANCEL           0x4c

Please move cleanups to separate patches


Otherwise it looks good.

Neil

>   #define MANTIX_CMD_SPI_FINISH           0x90
>   
>   struct mantix {
> @@ -45,82 +45,57 @@ static inline struct mantix *panel_to_mantix(struct drm_panel *panel)
>   	return container_of(panel, struct mantix, panel);
>   }
>   
> -static int mantix_init_sequence(struct mantix *ctx)
> +static void mantix_init_sequence(struct mipi_dsi_multi_context *dsi_ctx)
>   {
> -	struct mipi_dsi_device *dsi = to_mipi_dsi_device(ctx->dev);
> -	struct device *dev = ctx->dev;
> -
>   	/*
>   	 * Init sequence was supplied by the panel vendor.
>   	 */
> -	mipi_dsi_generic_write_seq(dsi, MANTIX_CMD_OTP_STOP_RELOAD_MIPI, 0x5A);
> -
> -	mipi_dsi_generic_write_seq(dsi, MANTIX_CMD_INT_CANCEL, 0x03);
> -	mipi_dsi_generic_write_seq(dsi, MANTIX_CMD_OTP_STOP_RELOAD_MIPI, 0x5A, 0x03);
> -	mipi_dsi_generic_write_seq(dsi, 0x80, 0xA9, 0x00);
> +	mipi_dsi_generic_write_seq_multi(dsi_ctx, MANTIX_CMD_OTP_STOP_RELOAD_MIPI, 0x5a);
>   
> -	mipi_dsi_generic_write_seq(dsi, MANTIX_CMD_OTP_STOP_RELOAD_MIPI, 0x5A, 0x09);
> -	mipi_dsi_generic_write_seq(dsi, 0x80, 0x64, 0x00, 0x64, 0x00, 0x00);
> -	msleep(20);
> +	mipi_dsi_generic_write_seq_multi(dsi_ctx, MANTIX_CMD_INT_CANCEL, 0x03);
> +	mipi_dsi_generic_write_seq_multi(dsi_ctx, MANTIX_CMD_OTP_STOP_RELOAD_MIPI, 0x5a, 0x03);
> +	mipi_dsi_generic_write_seq_multi(dsi_ctx, 0x80, 0xa9, 0x00);
>   
> -	mipi_dsi_generic_write_seq(dsi, MANTIX_CMD_SPI_FINISH, 0xA5);
> -	mipi_dsi_generic_write_seq(dsi, MANTIX_CMD_OTP_STOP_RELOAD_MIPI, 0x00, 0x2F);
> -	msleep(20);
> +	mipi_dsi_generic_write_seq_multi(dsi_ctx, MANTIX_CMD_OTP_STOP_RELOAD_MIPI, 0x5a, 0x09);
> +	mipi_dsi_generic_write_seq_multi(dsi_ctx, 0x80, 0x64, 0x00, 0x64, 0x00, 0x00);
> +	mipi_dsi_msleep(dsi_ctx, 20);
>   
> -	dev_dbg(dev, "Panel init sequence done\n");
> -	return 0;
> +	mipi_dsi_generic_write_seq_multi(dsi_ctx, MANTIX_CMD_SPI_FINISH, 0xa5);
> +	mipi_dsi_generic_write_seq_multi(dsi_ctx, MANTIX_CMD_OTP_STOP_RELOAD_MIPI, 0x00, 0x2f);
> +	mipi_dsi_msleep(dsi_ctx, 20);
>   }
>   
>   static int mantix_enable(struct drm_panel *panel)
>   {
>   	struct mantix *ctx = panel_to_mantix(panel);
> -	struct device *dev = ctx->dev;
> -	struct mipi_dsi_device *dsi = to_mipi_dsi_device(dev);
> -	int ret;
> +	struct mipi_dsi_device *dsi = to_mipi_dsi_device(ctx->dev);
> +	struct mipi_dsi_multi_context dsi_ctx = { .dsi = dsi };
>   
> -	ret = mantix_init_sequence(ctx);
> -	if (ret < 0) {
> -		dev_err(ctx->dev, "Panel init sequence failed: %d\n", ret);
> -		return ret;
> -	}
> +	mantix_init_sequence(&dsi_ctx);
> +	if (!dsi_ctx.accum_err)
> +		dev_dbg(ctx->dev, "Panel init sequence done\n");
>   
> -	ret = mipi_dsi_dcs_exit_sleep_mode(dsi);
> -	if (ret < 0) {
> -		dev_err(dev, "Failed to exit sleep mode\n");
> -		return ret;
> -	}
> -	msleep(20);
> +	mipi_dsi_dcs_exit_sleep_mode_multi(&dsi_ctx);
> +	mipi_dsi_msleep(&dsi_ctx, 20);
>   
> -	ret = mipi_dsi_dcs_set_display_on(dsi);
> -	if (ret)
> -		return ret;
> -	usleep_range(10000, 12000);
> +	mipi_dsi_dcs_set_display_on_multi(&dsi_ctx);
> +	mipi_dsi_usleep_range(&dsi_ctx, 10000, 12000);
>   
> -	ret = mipi_dsi_turn_on_peripheral(dsi);
> -	if (ret < 0) {
> -		dev_err(dev, "Failed to turn on peripheral\n");
> -		return ret;
> -	}
> +	mipi_dsi_turn_on_peripheral_multi(&dsi_ctx);
>   
> -	return 0;
> +	return dsi_ctx.accum_err;
>   }
>   
>   static int mantix_disable(struct drm_panel *panel)
>   {
>   	struct mantix *ctx = panel_to_mantix(panel);
>   	struct mipi_dsi_device *dsi = to_mipi_dsi_device(ctx->dev);
> -	int ret;
> -
> -	ret = mipi_dsi_dcs_set_display_off(dsi);
> -	if (ret < 0)
> -		dev_err(ctx->dev, "Failed to turn off the display: %d\n", ret);
> +	struct mipi_dsi_multi_context dsi_ctx = { .dsi = dsi };
>   
> -	ret = mipi_dsi_dcs_enter_sleep_mode(dsi);
> -	if (ret < 0)
> -		dev_err(ctx->dev, "Failed to enter sleep mode: %d\n", ret);
> +	mipi_dsi_dcs_set_display_off_multi(&dsi_ctx);
> +	mipi_dsi_dcs_enter_sleep_mode_multi(&dsi_ctx);
>   
> -
> -	return 0;
> +	return dsi_ctx.accum_err;
>   }
>   
>   static int mantix_unprepare(struct drm_panel *panel)

