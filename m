Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E96A92A2EE
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jul 2024 14:38:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE70110E10B;
	Mon,  8 Jul 2024 12:38:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="bloH3piG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 000A410E10B
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Jul 2024 12:38:43 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-4265b7514fcso13824105e9.1
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Jul 2024 05:38:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1720442322; x=1721047122; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=/aU2q954k7Pqzke3Hv8uoJ/bxX1c3M9argU9x2Zn9lI=;
 b=bloH3piGSbzZVxLsmesJzaVI+uShH2jxdGaE68pSH9QvRnMt7u5R7t2Ea2ZgD+vSPd
 jy6O55buHqM1B1WBzFsMjP5ugBeN0qgDDoc4zyXaOMJsShXQZdD3IAAYWDYmfi2lmuIj
 BE1il6LF+5B1wWUwEPdTmWaEP9wANZkoNW2/tbj79VFlqjx+PwgkjKrJco4TU4Oz8F+S
 vtW1GC/UMWZgV7KwCT7abhWTFT+aRMPw+P10f4obkwiTm3oD+VTx16FGAV0hoeXwJYbp
 8EMrW8ffp9s4/Gj5oK7fgJgGqHxMRI+cVvZ1DG7tMvqoJPKPwqz72Rb2slL5ROwiqlp5
 1ifg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720442322; x=1721047122;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=/aU2q954k7Pqzke3Hv8uoJ/bxX1c3M9argU9x2Zn9lI=;
 b=Fe7W78Q/xehKrUuiyZMKcoCXUB6KSZ4OKG3rrZM3BiuQXUYmjIzQJs60qt6Grvg9zy
 GlB8czj4lAbtvWdw3hTFYkz8Ides4P6CgeZ9rMN5e5+Xq82YTWnc7DkAtz6yPi3xi2U+
 ELtgc3+a5e5STrkNJ08d4ZGbKbF2CW2Oo9MUvsBkpM/t3/zSRoGcD6MAVwRRcN4vFOcG
 T64s9FVc7SF5E2Bp69JJo6OFOdgLdmM/l9pwIoHWuvzDJ2xz92NxgoJfE03zv2/7qwlc
 J55AQK4x+23ZsJlu6j9HnCpAUxJv4ujgnPtdiSdr5qLXGpyalsESNA/sdOjKm8CmDgqV
 HUmw==
X-Gm-Message-State: AOJu0YyO26wT9hHC8ftgNaGKvdEVEVUE0ZNhXt03Y9GznrqEUsr2rGt8
 MBX5v/gjxRyG94XJ5PkEsmmsAM/vJS5RDMMdzcsUftN5IjsYsjMaJNy5MYnPg9k=
X-Google-Smtp-Source: AGHT+IHI8RarLRg+heMdg+FAHprVbDdDgCFup50F66S9t2pYqCuDtpC35tI5zdb8tPj++iEFcuu8Ww==
X-Received: by 2002:a05:600c:3510:b0:424:aa83:ef27 with SMTP id
 5b1f17b1804b1-4264b0c5393mr107505895e9.1.1720442322192; 
 Mon, 08 Jul 2024 05:38:42 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:cad:2140:f482:8fc6:e8d0:6d7c?
 ([2a01:e0a:cad:2140:f482:8fc6:e8d0:6d7c])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4266c3650f4sm24577855e9.1.2024.07.08.05.38.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Jul 2024 05:38:41 -0700 (PDT)
Message-ID: <c2a810b1-2926-4b4b-8939-e93b4f3673fe@linaro.org>
Date: Mon, 8 Jul 2024 14:38:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH v5 5/5] drm/panel: :boe-th101mb31ig002: Support for
 starry-er88577 MIPI-DSI panel
To: Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>,
 robh@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 airlied@gmail.com, daniel@ffwll.ch, mripard@kernel.org, dianders@google.com,
 hsinyi@google.com, awarnecke002@hotmail.com, quic_jesszhan@quicinc.com,
 dmitry.baryshkov@linaro.org
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240704072958.27876-1-lvzhaoxiong@huaqin.corp-partner.google.com>
 <20240704072958.27876-6-lvzhaoxiong@huaqin.corp-partner.google.com>
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
In-Reply-To: <20240704072958.27876-6-lvzhaoxiong@huaqin.corp-partner.google.com>
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

On 04/07/2024 09:29, Zhaoxiong Lv wrote:
> The init_code of the starry-er88577 panel is very similar to the
> panel-boe-th101mb31ig002-28a.c driver, so we make it compatible with
> the panel-boe-th101mb31ig002-28a.c driver
> 
> Signed-off-by: Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>
> ---
> Changes between V5 and V4:
> -  1. Compatible with starry-er88577 panel in panel-boe-th101mb31ig002-28a.c driver,.
> v4: https://lore.kernel.org/all/20240620115245.31540-3-lvzhaoxiong@huaqin.corp-partner.google.com/
> 
> Changes between V4 and V3:
> -  1. Adjust the ".clock" assignment format.
> v3: https://lore.kernel.org/all/20240614145609.25432-3-lvzhaoxiong@huaqin.corp-partner.google.com/
> 
> Changes between V3 and V2:
> -  Separate Starry-er88577 from the panel-kingdisplay-kd101ne3 driver.
> -  Use mipi_dsi_dcs_set_display_on_multi().
> -  Use mipi_dsi_dcs_exit_sleep_mode_multi() and mipi_dsi_msleep().
> v2: https://lore.kernel.org/all/20240601084528.22502-5-lvzhaoxiong@huaqin.corp-partner.google.com/
> 
> Changes between V2 and V1:
> -  Add compatible for Starry er88577 in panel-kingdisplay-kd101ne3 drivers.
> 
> ---
>   .../drm/panel/panel-boe-th101mb31ig002-28a.c  | 119 ++++++++++++++++++
>   1 file changed, 119 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panel/panel-boe-th101mb31ig002-28a.c b/drivers/gpu/drm/panel/panel-boe-th101mb31ig002-28a.c
> index 736bfba607cf..c103236cc970 100644
> --- a/drivers/gpu/drm/panel/panel-boe-th101mb31ig002-28a.c
> +++ b/drivers/gpu/drm/panel/panel-boe-th101mb31ig002-28a.c
> @@ -25,6 +25,12 @@ struct panel_desc {
>   	enum mipi_dsi_pixel_format format;
>   	int (*init)(struct boe_th101mb31ig002 *ctx);
>   	unsigned int lanes;
> +	bool lp11_before_reset;
> +	unsigned int vcioo_to_lp11_delay_ms;
> +	unsigned int lp11_to_reset_delay_ms;
> +	unsigned int backlight_off_to_display_off_delay_ms;
> +	unsigned int enter_sleep_to_reset_down_delay_ms;
> +	unsigned int power_off_delay_ms;
>   };
>   
>   struct boe_th101mb31ig002 {
> @@ -108,6 +114,65 @@ static int boe_th101mb31ig002_enable(struct boe_th101mb31ig002 *ctx)
>   	return dsi_ctx.accum_err;
>   }
>   
> +static int starry_er88577_init_cmd(struct boe_th101mb31ig002 *ctx)
> +{
> +	struct mipi_dsi_multi_context dsi_ctx = { .dsi = ctx->dsi };
> +
> +	msleep(70);
> +
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xe0, 0xab, 0xba);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xe1, 0xba, 0xab);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb1, 0x10, 0x01, 0x47, 0xff);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb2, 0x0c, 0x14, 0x04, 0x50, 0x50, 0x14);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb3, 0x56, 0x53, 0x00);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb4, 0x33, 0x30, 0x04);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb6, 0xb0, 0x00, 0x00, 0x10, 0x00, 0x10,
> +					       0x00);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb8, 0x05, 0x12, 0x29, 0x49, 0x40);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb9, 0x7c, 0x61, 0x4f, 0x42, 0x3e, 0x2d,
> +					       0x31, 0x1a, 0x33, 0x33, 0x33, 0x52, 0x40,
> +					       0x47, 0x38, 0x34, 0x26, 0x0e, 0x06, 0x7c,
> +					       0x61, 0x4f, 0x42, 0x3e, 0x2d, 0x31, 0x1a,
> +					       0x33, 0x33, 0x33, 0x52, 0x40, 0x47, 0x38,
> +					       0x34, 0x26, 0x0e, 0x06);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xc0, 0xcc, 0x76, 0x12, 0x34, 0x44, 0x44,
> +					       0x44, 0x44, 0x98, 0x04, 0x98, 0x04, 0x0f,
> +					       0x00, 0x00, 0xc1);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xc1, 0x54, 0x94, 0x02, 0x85, 0x9f, 0x00,
> +					       0x6f, 0x00, 0x54, 0x00);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xc2, 0x17, 0x09, 0x08, 0x89, 0x08, 0x11,
> +					       0x22, 0x20, 0x44, 0xff, 0x18, 0x00);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xc3, 0x87, 0x47, 0x05, 0x05, 0x1c, 0x1c,
> +					       0x1d, 0x1d, 0x02, 0x1e, 0x1e, 0x1f, 0x1f,
> +					       0x0f, 0x0f, 0x0d, 0x0d, 0x13, 0x13, 0x11,
> +					       0x11, 0x24);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xc4, 0x06, 0x06, 0x04, 0x04, 0x1c, 0x1c,
> +					       0x1d, 0x1d, 0x02, 0x1e, 0x1e, 0x1f, 0x1f,
> +					       0x0e, 0x0e, 0x0c, 0x0c, 0x12, 0x12, 0x10,
> +					       0x10, 0x24);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xc8, 0x21, 0x00, 0x31, 0x42, 0x34, 0x16);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xca, 0xcb, 0x43);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xcd, 0x0e, 0x4b, 0x4b, 0x20, 0x19, 0x6b,
> +					       0x06, 0xb3);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xd2, 0xe3, 0x2b, 0x38, 0x08);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xd4, 0x00, 0x01, 0x00, 0x0e, 0x04, 0x44,
> +					       0x08, 0x10, 0x00, 0x00, 0x00);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xe6, 0x80, 0x09, 0xff, 0xff, 0xff, 0xff,
> +					       0xff, 0xff);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf0, 0x12, 0x03, 0x20, 0x00, 0xff);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf3, 0x00);
> +
> +	mipi_dsi_dcs_exit_sleep_mode_multi(&dsi_ctx);
> +
> +	mipi_dsi_msleep(&dsi_ctx, 120);
> +
> +	mipi_dsi_dcs_set_display_on_multi(&dsi_ctx);
> +
> +	mipi_dsi_msleep(&dsi_ctx, 20);
> +
> +	return dsi_ctx.accum_err;
> +}
> +
>   static int boe_th101mb31ig002_disable(struct drm_panel *panel)
>   {
>   	struct boe_th101mb31ig002 *ctx = container_of(panel,
> @@ -115,12 +180,18 @@ static int boe_th101mb31ig002_disable(struct drm_panel *panel)
>   						      panel);
>   	struct mipi_dsi_multi_context dsi_ctx = { .dsi = ctx->dsi };
>   
> +	if (ctx->desc->backlight_off_to_display_off_delay_ms)
> +		mipi_dsi_msleep(&dsi_ctx, ctx->desc->backlight_off_to_display_off_delay_ms);
> +
>   	mipi_dsi_dcs_set_display_off_multi(&dsi_ctx);
>   
>   	mipi_dsi_msleep(&dsi_ctx, 120);
>   
>   	mipi_dsi_dcs_enter_sleep_mode_multi(&dsi_ctx);
>   
> +	if (ctx->desc->enter_sleep_to_reset_down_delay_ms)
> +		mipi_dsi_msleep(&dsi_ctx, ctx->desc->enter_sleep_to_reset_down_delay_ms);
> +
>   	return dsi_ctx.accum_err;
>   }
>   
> @@ -134,6 +205,9 @@ static int boe_th101mb31ig002_unprepare(struct drm_panel *panel)
>   	gpiod_set_value_cansleep(ctx->enable, 0);
>   	regulator_disable(ctx->power);
>   
> +	if(ctx->desc->power_off_delay_ms)
> +		msleep(ctx->desc->power_off_delay_ms);
> +
>   	return 0;
>   }
>   
> @@ -151,6 +225,18 @@ static int boe_th101mb31ig002_prepare(struct drm_panel *panel)
>   		return ret;
>   	}
>   
> +	if (ctx->desc->vcioo_to_lp11_delay_ms)
> +		msleep(ctx->desc->vcioo_to_lp11_delay_ms);
> +
> +	if (ctx->desc->lp11_before_reset) {
> +		ret = mipi_dsi_dcs_nop(ctx->dsi);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	if (ctx->desc->lp11_to_reset_delay_ms)
> +		msleep(ctx->desc->lp11_to_reset_delay_ms);
> +
>   	gpiod_set_value_cansleep(ctx->enable, 1);
>   	msleep(50);
>   	boe_th101mb31ig002_reset(ctx);
> @@ -187,6 +273,36 @@ static const struct panel_desc boe_th101mb31ig002_desc = {
>   	.init = boe_th101mb31ig002_enable,
>   };
>   
> +static const struct drm_display_mode starry_er88577_default_mode = {
> +	.clock	= (800 + 25 + 25 + 25) * (1280 + 20 + 4 + 12) * 60 / 1000,
> +	.hdisplay = 800,
> +	.hsync_start = 800 + 25,
> +	.hsync_end = 800 + 25 + 25,
> +	.htotal = 800 + 25 + 25 + 25,
> +	.vdisplay = 1280,
> +	.vsync_start = 1280 + 20,
> +	.vsync_end = 1280 + 20 + 4,
> +	.vtotal = 1280 + 20 + 4 + 12,
> +	.width_mm = 135,
> +	.height_mm = 216,
> +	.type = DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED,
> +};
> +
> +static const struct panel_desc starry_er88577_desc = {
> +	.modes = &starry_er88577_default_mode,
> +	.lanes = 4,
> +	.format = MIPI_DSI_FMT_RGB888,
> +	.mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_SYNC_PULSE |
> +		      MIPI_DSI_MODE_LPM,
> +	.init = starry_er88577_init_cmd,
> +	.lp11_before_reset = true,
> +	.vcioo_to_lp11_delay_ms = 5,
> +	.lp11_to_reset_delay_ms = 50,
> +	.backlight_off_to_display_off_delay_ms = 100,
> +	.enter_sleep_to_reset_down_delay_ms = 100,
> +	.power_off_delay_ms = 1000,
> +};
> +
>   static int boe_th101mb31ig002_get_modes(struct drm_panel *panel,
>   					struct drm_connector *connector)
>   {
> @@ -312,6 +428,9 @@ static const struct of_device_id boe_th101mb31ig002_of_match[] = {
>   	{ .compatible = "boe,th101mb31ig002-28a",
>   	  .data = &boe_th101mb31ig002_desc
>   	},
> +	{ .compatible = "starry,er88577",
> +	  .data = &starry_er88577_desc
> +	},
>   	{ /* sentinel */ }
>   };
>   MODULE_DEVICE_TABLE(of, boe_th101mb31ig002_of_match);

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
