Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DC2599803D
	for <lists+dri-devel@lfdr.de>; Thu, 10 Oct 2024 10:40:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CECB110E2B6;
	Thu, 10 Oct 2024 08:40:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="ZEYhWMan";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
 [209.85.167.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE04710E2B6
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Oct 2024 08:40:00 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id
 2adb3069b0e04-5398d171fa2so766503e87.0
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Oct 2024 01:40:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1728549599; x=1729154399; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=wZzMUO86Zz4fUOgYhmVPC3Kj9INqhNmxL/uh1WoR0Is=;
 b=ZEYhWManceVjlALhPAqZG/wjnblRStrR0S/Sx5SPACLVdepUpeuPhr13qBSlUVg1vF
 XV1RSdvJtgvBwtg0+u5N/rLpeyJheRIxg+yy4c7Ko9GrohjPiOp93/y0hIcmA5z/vKYr
 3H1rYOp8ORuYO3SfZ3wY9F1oYvTDFp80CAPj8RyxO0+uUJFVq2tkc/a+zs1iEFGCIpGJ
 5rNv/jl9mqLEcvh1c9c1HzhqpIcJh7Zi823Ah6EA4U4VnL9356sjW3JU0wHgkBuMM0m/
 zI3FvfbTiI8vJAY49eJnoEWKsp/xC7Kz0CLgnJUZQ+UnkgM973PMYGj2D5KfbEbti3sr
 ox8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728549599; x=1729154399;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=wZzMUO86Zz4fUOgYhmVPC3Kj9INqhNmxL/uh1WoR0Is=;
 b=t6Qnrxn87QS8tGcDmhrtdDxyaE3NQfBuwkPf/3PfTeOdWl6gvSJKTuuN7/SuMdMB9Z
 7gDKijcxgq9ozz5McmQfO9OfoFRl4W63nKQ8BRQc8mo1cDRThGVYU64APXfeuReaPeMd
 Y+a9ja40DsLUkDYXSFNUlQoaxOlJTJ9ICs5nHmMon2C5u0yKdjQ8lnM+3+BHiV8WO53H
 xHrAcbIfmcUvPZNXmNxPx5n1XLiyG440U5o5HyWKOGWn648bih+cqvhgkre+4fJMjDnI
 JA+bB9/8tcBo6+lGkdGXTTmbgvLX7QBEzSbWDFvaQ99mo9LNaAsHvwoJGcF/Fmmtcv6L
 NJSw==
X-Gm-Message-State: AOJu0YzLVbLeh5WKopmOO90akeEjl3kUveslrVUudj1ODlwE5f7R7RM7
 1zCd5luSUc77iR5aZ0dHbeUyqWxBUzQY7TTQcSFqgf7QnKw9th5OZSV64dS1Ig5HeQjPb/qGn8D
 ZNfE=
X-Google-Smtp-Source: AGHT+IGXdHfmbOwGrStXoJgSkAMDQ50vDCsNy5fzTXsxYb5fCw/hrr+pMzPE0BvRi8UgjlYLEFSfkA==
X-Received: by 2002:a5d:5e12:0:b0:37d:4527:ba1c with SMTP id
 ffacd0b85a97d-37d4527bbd6mr1876589f8f.49.1728547903108; 
 Thu, 10 Oct 2024 01:11:43 -0700 (PDT)
Received: from [192.168.7.189] ([212.114.21.58])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-37d4b79fd90sm791241f8f.79.2024.10.10.01.11.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Oct 2024 01:11:42 -0700 (PDT)
Message-ID: <9e36fd62-0511-4d3f-9f18-9c8188b52e07@linaro.org>
Date: Thu, 10 Oct 2024 10:11:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v7 1/3] drm/mipi-dsi: add mipi_dsi_compression_mode_multi
To: Dzmitry Sankouski <dsankouski@gmail.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20241009-starqltechn_integration_upstream-v7-0-9967bd15c7c5@gmail.com>
 <20241009-starqltechn_integration_upstream-v7-1-9967bd15c7c5@gmail.com>
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
In-Reply-To: <20241009-starqltechn_integration_upstream-v7-1-9967bd15c7c5@gmail.com>
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

On 09/10/2024 17:09, Dzmitry Sankouski wrote:
> mipi_dsi_compression_mode_multi can help with
> error handling.
> 
> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
> Signed-off-by: Dzmitry Sankouski <dsankouski@gmail.com>
> ---
> Changes in v7:
> - fix kernel doc

The v6 patch was already merged to drm-misc-next, like the following ones,
cold you send a fixup patch to only fix the kernel doc ?

Thanks,
Neil

> ---
>   drivers/gpu/drm/drm_mipi_dsi.c | 16 ++++++++++++++++
>   include/drm/drm_mipi_dsi.h     |  2 ++
>   2 files changed, 18 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_mipi_dsi.c b/drivers/gpu/drm/drm_mipi_dsi.c
> index 2bc3973d35a1..5e5c5f84daac 100644
> --- a/drivers/gpu/drm/drm_mipi_dsi.c
> +++ b/drivers/gpu/drm/drm_mipi_dsi.c
> @@ -1520,6 +1520,22 @@ void mipi_dsi_compression_mode_ext_multi(struct mipi_dsi_multi_context *ctx,
>   }
>   EXPORT_SYMBOL(mipi_dsi_compression_mode_ext_multi);
>   
> +/**
> + * mipi_dsi_compression_mode_multi() - enable/disable DSC on the peripheral
> + * @ctx: Context for multiple DSI transactions
> + * @enable: Whether to enable or disable the DSC
> + *
> + * Enable or disable Display Stream Compression on the peripheral using the
> + * default Picture Parameter Set and VESA DSC 1.1 algorithm.
> + */
> +void mipi_dsi_compression_mode_multi(struct mipi_dsi_multi_context *ctx,
> +				     bool enable)
> +{
> +	return mipi_dsi_compression_mode_ext_multi(ctx, enable,
> +						   MIPI_DSI_COMPRESSION_DSC, 0);
> +}
> +EXPORT_SYMBOL(mipi_dsi_compression_mode_multi);
> +
>   /**
>    * mipi_dsi_dcs_nop_multi() - send DCS NOP packet
>    * @ctx: Context for multiple DSI transactions
> diff --git a/include/drm/drm_mipi_dsi.h b/include/drm/drm_mipi_dsi.h
> index f725f8654611..94400a78031f 100644
> --- a/include/drm/drm_mipi_dsi.h
> +++ b/include/drm/drm_mipi_dsi.h
> @@ -280,6 +280,8 @@ void mipi_dsi_compression_mode_ext_multi(struct mipi_dsi_multi_context *ctx,
>   					 bool enable,
>   					 enum mipi_dsi_compression_algo algo,
>   					 unsigned int pps_selector);
> +void mipi_dsi_compression_mode_multi(struct mipi_dsi_multi_context *ctx,
> +				     bool enable);
>   void mipi_dsi_picture_parameter_set_multi(struct mipi_dsi_multi_context *ctx,
>   					  const struct drm_dsc_picture_parameter_set *pps);
>   
> 

