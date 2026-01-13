Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72177D175F9
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jan 2026 09:49:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9589F10E314;
	Tue, 13 Jan 2026 08:48:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="e5WtkeX1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A76A10E314
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 08:48:58 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-477a219dbcaso57082795e9.3
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 00:48:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1768294137; x=1768898937; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=uIplZHRhc0bqvGNzZc7ZuexnTcKJ7c+gkReXl4SjmdA=;
 b=e5WtkeX1kK8E+THjTXD5zl2N5vx0pbvxOXTFW5Lo8rqwSDI3lR9MyRaPg8/6KLSeNI
 XrXjgaH7L1ECD23xlzZoCvrJPhPtCjW5gNJaosc73oy4c2j7Kh2J9MzJ9VCiFWYgRVOr
 ehCuz7RqtbOLNhVt8Cgo6amPqVe5keri8D6M83z7V+2OU/1dBW7lvnd0JNBiQqSAD+es
 ch0/mECwsC9IHpO9KNZcCbYaughhqX8zadp0igAdWkP8JraNsu/u+5rpKWsTOinfotFL
 UiQb8fnrD8lsT2zjsjn11R5aLLxn65yAa5w/9t/SIAB9V9xn3sTtk94fLLfijtUMVulc
 9k9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768294137; x=1768898937;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uIplZHRhc0bqvGNzZc7ZuexnTcKJ7c+gkReXl4SjmdA=;
 b=Gk5YvBP3q9zQd9oWXj/NE/M8mxL5BGOhjnV47e86DM2tJr4eZNm8SXkP1qhpFuajGd
 5cO2UfCVk9dLsRgCWHrtD4oX4c+HoOEbGVDynPifQcftVTNPD7ppaTK1DOW14Vqe3NHS
 sdC71ke5VxKhwuBMED/llEyJ+K657Xd/PVMi+o+Wrvyy8HSpNCg6EV2RBfG2g1F4+4y6
 N0YvroSccnCx7EclDayHeJu0K+t+mAOJ2l2Vs7F6exlzjnq5l3pX4KZN33d8kB/CUR5J
 rqAahLqvMAUlRTjyKnBgLypwwnl7umWlDl0tNXLYsMoF77Izbrb+uICiygH15X0Y1yJS
 KbXQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWuIHivZHVNgco/m+lXdWwgLzDw9s+m+0UtxyuCsgO/no8wVKoJ+uj7eA0WI9XK/TzS8O1P686TIzY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyo3pzEB1i8gEils9Vn2XZX3KhMMsHyiN5IW4G0Xwh2tFIqmEF+
 pKc8wwKgh2IujTONBIO+1oC9IcSZbGaTrNTaM+4pmK0TUK8JCQHTMWFOiUJWDAHe6JY=
X-Gm-Gg: AY/fxX4zhrTVO38ZXXFMDIq3IhkQ4Hop0aOad4vu+Qo+A7r8vL8sIuleV6AgGGusr8C
 yNpFmA8Bc/gi6NW+TkyXAPjhTuNsTeHDFaQDSeZtzuHfSlihki+6S+fygBm2eJnmkQSmDeMjc7F
 SeD9ZpSJXBj8x6L1wfuK6vY2QrXIKxRTaXeSuah3s6YpzPvS6V9eZT9IhhFjt45U6mQvbE03QuI
 0yInSDBwKj7CqspLLrQMm+WpyPHdyXWgDpxi9QXEPXfUskMvWmdnc15rbAvg6oBtL7Q/Ax6jkjd
 3OXTen+vKsXR/jhKgmC8F28g/adPzwTZnxRu0NHhDaguoVx1eLshddHUphMKrthsSYOT4o7fuKB
 /Rxl/Eo/iJW6q3HH0I9vT8+r3OvPi5Eystexls/O9RKd8OC1+b5wtAAuJc4hMKLS2XR6N+RLomv
 5lPh+zI0qxDKBcOdY7Vu0BGFpkOpemDZwXF4nC5hGu0qt3Ot1OLA==
X-Google-Smtp-Source: AGHT+IEVq4zMh+exAfwLWPqTt1zwcdV5bKni86GoSGiMDDsS401edtmeHzgSVN5IypBq2cvM3hmIQQ==
X-Received: by 2002:a05:600c:840f:b0:47b:d949:9ba9 with SMTP id
 5b1f17b1804b1-47d84b1895fmr254070125e9.13.1768294136508; 
 Tue, 13 Jan 2026 00:48:56 -0800 (PST)
Received: from ?IPV6:2a01:e0a:3d9:2080::fa42:7768?
 ([2a01:e0a:3d9:2080::fa42:7768]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47d7f668e03sm408792255e9.14.2026.01.13.00.48.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Jan 2026 00:48:55 -0800 (PST)
Message-ID: <8647ce72-7fce-48b4-be88-099ebc865423@linaro.org>
Date: Tue, 13 Jan 2026 09:48:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH v2 1/2] drm/mipi-dsi: add
 mipi_dsi_shutdown_peripheral_multi
To: Avinal Kumar <avinal.xlvii@gmail.com>, dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch
References: <20260109155203.34886-1-avinal.xlvii@gmail.com>
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
In-Reply-To: <20260109155203.34886-1-avinal.xlvii@gmail.com>
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

On 1/9/26 16:52, Avinal Kumar wrote:
> Add mipi_dsi_shutdown_peripheral_multi function and mark
> mipi_dsi_shutdown_peripheral fucntion as deprecated.
> 
> Signed-off-by: Avinal Kumar <avinal.xlvii@gmail.com>
> ---
>   drivers/gpu/drm/drm_mipi_dsi.c | 28 ++++++++++++++++++++++++++++
>   include/drm/drm_mipi_dsi.h     |  1 +
>   2 files changed, 29 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_mipi_dsi.c b/drivers/gpu/drm/drm_mipi_dsi.c
> index a712e177b350..2fed50172a44 100644
> --- a/drivers/gpu/drm/drm_mipi_dsi.c
> +++ b/drivers/gpu/drm/drm_mipi_dsi.c
> @@ -587,6 +587,9 @@ EXPORT_SYMBOL(mipi_dsi_create_packet);
>    * mipi_dsi_shutdown_peripheral() - sends a Shutdown Peripheral command
>    * @dsi: DSI peripheral device
>    *
> + * This function is deprecated. Use mipi_dsi_shutdown_peripheral_multi()
> + * instead.
> + *
>    * Return: 0 on success or a negative error code on failure.
>    */
>   int mipi_dsi_shutdown_peripheral(struct mipi_dsi_device *dsi)
> @@ -1980,6 +1983,31 @@ void mipi_dsi_dcs_set_tear_scanline_multi(struct mipi_dsi_multi_context *ctx,
>   }
>   EXPORT_SYMBOL(mipi_dsi_dcs_set_tear_scanline_multi);
>   
> +/**
> + * mipi_dsi_shutdown_peripheral_multi() - sends a Shutdown Peripheral command
> + * @ctx: Context for multiple DSI transactions
> + *
> + * Like mipi_dsi_shutdown_peripheral() but deals with errors in a way that
> + * makes it convienient to make seeral calls in a row.
> + */
> +void mipi_dsi_shutdown_peripheral_multi(struct mipi_dsi_multi_context *ctx)
> +{
> +	struct mipi_dsi_device *dsi = ctx->dsi;
> +	struct device *dev = &dsi->dev;
> +	int ret;
> +
> +	if (ctx->accum_err)
> +		return;
> +
> +	ret = mipi_dsi_shutdown_peripheral(dsi);
> +	if (ret < 0) {
> +		ctx->accum_err = ret;
> +		dev_err(dev, "Failed to shutdown peripheral: %d\n",
> +			ctx->accum_err);
> +	}
> +}
> +EXPORT_SYMBOL(mipi_dsi_shutdown_peripheral_multi);
> +
>   static int mipi_dsi_drv_probe(struct device *dev)
>   {
>   	struct mipi_dsi_driver *drv = to_mipi_dsi_driver(dev->driver);
> diff --git a/include/drm/drm_mipi_dsi.h b/include/drm/drm_mipi_dsi.h
> index 3aba7b380c8d..19ccdf5eeb5f 100644
> --- a/include/drm/drm_mipi_dsi.h
> +++ b/include/drm/drm_mipi_dsi.h
> @@ -389,6 +389,7 @@ void mipi_dsi_dcs_set_page_address_multi(struct mipi_dsi_multi_context *ctx,
>   void mipi_dsi_dcs_set_tear_scanline_multi(struct mipi_dsi_multi_context *ctx,
>   					  u16 scanline);
>   void mipi_dsi_dcs_set_tear_off_multi(struct mipi_dsi_multi_context *ctx);
> +void mipi_dsi_shutdown_peripheral_multi(struct mipi_dsi_multi_context *ctx);
>   
>   /**
>    * mipi_dsi_generic_write_seq_multi - transmit data using a generic write packet

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil
