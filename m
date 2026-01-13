Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EBB2D176B3
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jan 2026 09:57:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D11BD10E20E;
	Tue, 13 Jan 2026 08:57:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="UN71LJgy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
 [209.85.221.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D821810E20E
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 08:57:19 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id
 ffacd0b85a97d-432d2c96215so4037002f8f.3
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 00:57:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1768294638; x=1768899438; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=jK9iGnImrwXMKC1YV73/07y1jP26PbJgrtzA5NzDhic=;
 b=UN71LJgyMeoKrKcrc26hezMHljm+yuesRc9tq5iy1h6ibWsDOncu/iAKZ83H1Vyn+J
 cXl2xh6YHCYPL8eTf5xQsnRg4tOo9GvLbQcjgbG9xukMurGR8/33H40vY8mIS5eXGAaH
 L4UwQrXIw4EsjUUgu/60j9jU2qKBvq2rTtDLxJktCnW5NNxZDIPb3ZlrUfTa1jreFpfq
 5T4yruHsCO1qCfRoG/NWEGWJofEXfeA3C+yx1rlFv/V44MdC7rYdwk5E6ehk0jThtJVQ
 yKvEjcNwukF/L2Y0Xp976Fk7xV+maEI8afdeK8vwYdnp08N0aDpu3Iqz5XWxiBNPSoKg
 q0cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768294638; x=1768899438;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jK9iGnImrwXMKC1YV73/07y1jP26PbJgrtzA5NzDhic=;
 b=PTxqm7qy5uxw1KA82HwB5srSxqr9QSPTOE/TFkwytHuz0oY8MjStlaX4UG4e+kFnC9
 LB0+Pa/piywhLZ/Cdm6LCaqDK6qBFHMUfbZHcKW+fQ2L3dpTEe3mGAUZo2dUjQBciP35
 GMg/ykXs9OV9AsOd4Csc8CnHWm3m/x6Y4w7LN34qo+ufzGX8sy2GMhj/RqASW9J6sSgM
 Y7v2mRLp5+4ZiX2THARAGIUPwYMd6vGWbtYJXpx/f0D/yuoqketVKX4xKDoMARuGxP+7
 MXMDKDSE+OxkrneCGQJUQ19eo7TNrpVLSTTOOYH75Wv9sXsD8FCKROj97idIJz3Zc15a
 jFkg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV+8Wd0Bj2CETvkkM3JP0Kfk2kBD0bl9hd1MRD35bgK4gLo6UTrlE5GTpwNvYZpY9afGt7teOkdgV8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzHjyMMevhGkGMCciq5KH3/E3a7wfGBzUZdyL9sJBLREsCv4Wi0
 Ip0MoRFoERSPOTS9vikSTVDN1Iydt3OMHOp/HWbZyHHoRQMOrTmUAhDkBSh9ZeN2ynU=
X-Gm-Gg: AY/fxX7/n39w8sLnqEGu1FPXg8gWNL4ItMCRQTc7Gyt94ptsO3vix2CgL0iTA632kb8
 axW5ao0IaJMYt+fitDu+PPnTUZkUoJicK+WV0ke6+9cElKwWamN+lNBdzKNSbtvYiGdWNlZnJtH
 DjSkKyXiHz2IwBvF2wH8PV7dXCEUq94IKjSb1e1JQrKrITKugH5S++UWX+BDa5e+EF/g5HBtWux
 xy6GZZdL89jWA4iJyrnnKs6Sy0wYNpg0xKm7cJ/4DmbkLutNvRoGxHEb9w6WQ/uKVqhzAHS2cj2
 z2XaVwbsa74itAsr6eoar9yWUnApliCvHVbiak/piU8v0hELGzUOhe1taA+HCXxR3XhjL+tOLe/
 TwIrFfR58udluvXOUIWJOJAMYlnlTwSJJwV3UclxZ2GNwqI0oMCoD8i+ZU13qcfrBFyzOkqc47/
 /RpJAUDE2207fCZTe7n91doc01k4KY75hdwsSJ41Qwga1fFXnqjg==
X-Google-Smtp-Source: AGHT+IEoroP5S+dVEfqizCk6v6TXscGzJC2JToIVySdFg4XW8wpYBsON721Sk6e0U9IJbe9zm/YMPg==
X-Received: by 2002:a5d:42c5:0:b0:432:dc23:34f with SMTP id
 ffacd0b85a97d-432dc2307abmr12998698f8f.53.1768294638276; 
 Tue, 13 Jan 2026 00:57:18 -0800 (PST)
Received: from ?IPV6:2a01:e0a:3d9:2080::fa42:7768?
 ([2a01:e0a:3d9:2080::fa42:7768]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-432bd5ee243sm43163902f8f.31.2026.01.13.00.57.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Jan 2026 00:57:17 -0800 (PST)
Message-ID: <4c380dd3-ced4-49b1-a4b6-3c3f5bca1124@linaro.org>
Date: Tue, 13 Jan 2026 09:57:17 +0100
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

Hi,

On 1/9/26 16:52, Avinal Kumar wrote:
> Add mipi_dsi_shutdown_peripheral_multi function and mark
> mipi_dsi_shutdown_peripheral fucntion as deprecated.
                               ^^^^^^^^
Please fix typo

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

                ^^^^^^^^^^^
Please fix typo

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

Please use scripts/checkpatch.pl on your patches

Thanks,
Neil
