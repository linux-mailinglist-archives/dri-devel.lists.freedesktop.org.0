Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FE2592A2D7
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jul 2024 14:35:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9288D10E301;
	Mon,  8 Jul 2024 12:34:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="LLWw0ws+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2017B10E33B
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Jul 2024 12:34:56 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-426526d30aaso19856655e9.0
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Jul 2024 05:34:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1720442094; x=1721046894; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=BgjeWYgiGCxJ1tOnV/HT+93NbLmQDOhmuH//SMbzxXU=;
 b=LLWw0ws+/eSlHtF4ObTwUfo1fGucgfMF71pj6Ph+zEola7227lk8k6unQjprcjUBY1
 OcQ8vqs6eIq2VxjFgUBl7jU++b7BdnYtcUlmIrGLmvp732muitNhYld4zAVxYk+NfJgW
 1JZvxNI8liRSTz/EKO7Z5vCZqJiTuvi9PZPD5me3K4y4Hk5MlS3jBYiD4bxBaXOP31sr
 kYBNS5lXE2Edu+DcfZzo7k75iT7Mj1VVCWo+cauD8NrG8i2/d0GmkVO4/x+7cmVscZKJ
 I7sazaA3T4NqNxkm5LsYpRhLxFNyLrCm5/pVUiuhPRxfA7mhwVp54Ff45Cm/iU0y1Dsf
 3miw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720442094; x=1721046894;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=BgjeWYgiGCxJ1tOnV/HT+93NbLmQDOhmuH//SMbzxXU=;
 b=YM8FJk+wHFUTb5ExExd9d+s1tgNe88vH0lnZWrTvkWlr9W9wflSdzqSzZYuYsflL4C
 9JG7q5hQrVtO3j4WfIZTnSk2ihbtAZVRxwgv8NY6vFI5Kjep4l355y8KZh4COFzIL9qv
 CQY1Ccoistq1UsEDTTw1Y7euFz76pDdsMRpEbI9ZDwynLUBVOm9/obWedujNrjBiv1zw
 s+m4DX2FwVer0XQe9ukqcPLntig+uO7qySTOtnaC0DpocefBR/m+2vItvwogYyRjS7t0
 /lkWmhJvE3oNfSHwqRqGp+n+6m3UQhhnNJw04VUSuci3i3LHKXGWQgwNIcqGDRvqNZYZ
 oFWw==
X-Gm-Message-State: AOJu0Yx5zEDviiUTC6vvcaRSettw6X3vA5PCwxn8fy2R931Cf6UJ7HoM
 oqMAcELSnS1VOUL8p/P0gvT2Y7i/6KjjAxa+L0/CvskEAnGMT8Ep+RCLDwdVefJvaYVmy+Fit/6
 o1II=
X-Google-Smtp-Source: AGHT+IErLgh8R7kUYcr2wJEQ26Y6kVhRoQa2p4zO4Es+NlKn5V+X+U+MS9B9ajG68786iYXyoBM5gw==
X-Received: by 2002:a05:600c:4a96:b0:426:5269:982e with SMTP id
 5b1f17b1804b1-42652699983mr54740075e9.5.1720442093908; 
 Mon, 08 Jul 2024 05:34:53 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:cad:2140:f482:8fc6:e8d0:6d7c?
 ([2a01:e0a:cad:2140:f482:8fc6:e8d0:6d7c])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42662657263sm76659105e9.47.2024.07.08.05.34.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Jul 2024 05:34:53 -0700 (PDT)
Message-ID: <0dd9c497-9d21-4d4e-8165-cab06b38f69a@linaro.org>
Date: Mon, 8 Jul 2024 14:34:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH v5 1/5] drm/panel: boe-th101mb31ig002 : Make it compatible
 with other panel.
To: Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>,
 robh@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 airlied@gmail.com, daniel@ffwll.ch, mripard@kernel.org, dianders@google.com,
 hsinyi@google.com, awarnecke002@hotmail.com, quic_jesszhan@quicinc.com,
 dmitry.baryshkov@linaro.org
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240704072958.27876-1-lvzhaoxiong@huaqin.corp-partner.google.com>
 <20240704072958.27876-2-lvzhaoxiong@huaqin.corp-partner.google.com>
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
In-Reply-To: <20240704072958.27876-2-lvzhaoxiong@huaqin.corp-partner.google.com>
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
> This driver currently only applies to one panel. Modify it to be
> compatible with other panels.
> 
> Signed-off-by: Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>
> ---
>   .../drm/panel/panel-boe-th101mb31ig002-28a.c  | 40 +++++++++++++++----
>   1 file changed, 33 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-boe-th101mb31ig002-28a.c b/drivers/gpu/drm/panel/panel-boe-th101mb31ig002-28a.c
> index 763e9f8342d3..159e401ad0e6 100644
> --- a/drivers/gpu/drm/panel/panel-boe-th101mb31ig002-28a.c
> +++ b/drivers/gpu/drm/panel/panel-boe-th101mb31ig002-28a.c
> @@ -17,11 +17,21 @@
>   #include <drm/drm_modes.h>
>   #include <drm/drm_panel.h>
>   
> +struct panel_desc {
> +	const struct drm_display_mode *modes;
> +	unsigned long mode_flags;
> +	enum mipi_dsi_pixel_format format;
> +	const struct panel_init_cmd *init_cmds;
> +	unsigned int lanes;
> +};
> +
>   struct boe_th101mb31ig002 {
>   	struct drm_panel panel;
>   
>   	struct mipi_dsi_device *dsi;
>   
> +	const struct panel_desc *desc;
> +
>   	struct regulator *power;
>   	struct gpio_desc *enable;
>   	struct gpio_desc *reset;
> @@ -161,7 +171,10 @@ static int boe_th101mb31ig002_prepare(struct drm_panel *panel)
>   	gpiod_set_value_cansleep(ctx->enable, 1);
>   	msleep(50);
>   	boe_th101mb31ig002_reset(ctx);
> -	boe_th101mb31ig002_enable(panel);
> +
> +	ret = ctx->desc->init(ctx);
> +	if (ret)
> +		return ret;

There's no ->init in struct panel_desc

>   
>   	return 0;
>   }
> @@ -181,6 +194,16 @@ static const struct drm_display_mode boe_th101mb31ig002_default_mode = {
>   	.type = DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED,
>   };
>   
> +static const struct panel_desc boe_th101mb31ig002_desc = {
> +	.modes = &boe_th101mb31ig002_default_mode,
> +	.lanes = 4,
> +	.format = MIPI_DSI_FMT_RGB888,
> +	.mode_flags = MIPI_DSI_MODE_VIDEO_BURST |
> +			  MIPI_DSI_MODE_NO_EOT_PACKET |
> +			  MIPI_DSI_MODE_LPM,
> +	.init_cmds = boe_th101mb31ig002_enable,
> +};
> +
>   static int boe_th101mb31ig002_get_modes(struct drm_panel *panel,
>   					struct drm_connector *connector)
>   {
> @@ -237,6 +260,7 @@ static const struct drm_panel_funcs boe_th101mb31ig002_funcs = {
>   static int boe_th101mb31ig002_dsi_probe(struct mipi_dsi_device *dsi)
>   {
>   	struct boe_th101mb31ig002 *ctx;
> +	const struct panel_desc *desc;
>   	int ret;
>   
>   	ctx = devm_kzalloc(&dsi->dev, sizeof(*ctx), GFP_KERNEL);
> @@ -246,11 +270,11 @@ static int boe_th101mb31ig002_dsi_probe(struct mipi_dsi_device *dsi)
>   	mipi_dsi_set_drvdata(dsi, ctx);
>   	ctx->dsi = dsi;
>   
> -	dsi->lanes = 4;
> -	dsi->format = MIPI_DSI_FMT_RGB888;
> -	dsi->mode_flags = MIPI_DSI_MODE_VIDEO_BURST |
> -			  MIPI_DSI_MODE_NO_EOT_PACKET |
> -			  MIPI_DSI_MODE_LPM;
> +	desc = of_device_get_match_data(&dsi->dev);

use device_get_match_data() instead, and check the return

> +	dsi->lanes = desc->lanes;
> +	dsi->format = desc->format;
> +	dsi->mode_flags = desc->mode_flags;
> +	ctx->desc = desc;
>   
>   	ctx->power = devm_regulator_get(&dsi->dev, "power");
>   	if (IS_ERR(ctx->power))
> @@ -302,7 +326,9 @@ static void boe_th101mb31ig002_dsi_remove(struct mipi_dsi_device *dsi)
>   }
>   
>   static const struct of_device_id boe_th101mb31ig002_of_match[] = {
> -	{ .compatible = "boe,th101mb31ig002-28a", },
> +	{ .compatible = "boe,th101mb31ig002-28a",
> +	  .data = &boe_th101mb31ig002_desc
> +	},

Weird indentation, please use :
	{
		.compatible = ..,
		.data = ...,
	},

>   	{ /* sentinel */ }
>   };
>   MODULE_DEVICE_TABLE(of, boe_th101mb31ig002_of_match);

Thanks,
Neil
