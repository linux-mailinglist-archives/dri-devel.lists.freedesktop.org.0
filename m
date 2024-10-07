Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DECC9926C7
	for <lists+dri-devel@lfdr.de>; Mon,  7 Oct 2024 10:18:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E873510E1D6;
	Mon,  7 Oct 2024 08:17:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="y3kH+/z9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBEEC10E1D6
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Oct 2024 08:17:58 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id
 ffacd0b85a97d-37cd26c6dd1so4113076f8f.3
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Oct 2024 01:17:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1728289077; x=1728893877; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=O1edDQaZrOkr576aznoG41NUZzv1eU7bE/W4vr93KFU=;
 b=y3kH+/z9FLG/tCm/Yde3/0l2LYleP04LhhxBhxP39wrY3Oi4v5VZiYqZt/j9CSo/dB
 m72sobAYUbaCTAjwLYMr2FtzNa6lZ0ZcLpdXWilHrZJWeIYNpL5uBvpv+U3kAv1zsyAz
 d9x7U2ALSr/OkpZFroCG5ULgOPzvRlnvcbSM/sYE3YTQZVXHaTmF/j7xJwOXT2YVRBI6
 +u4xGgIOTjQhJdXcQmeotMNSvPewHnhvUR3BeDSJ2p2+s5vqsuU6rA487GJLz2oI+Zuv
 bLbkh1QEWtCF6iQm7yDtesy9ENpw2gpEyxJAoexYEN8yuBRkHvMpn23RFYjlc2i6E6K3
 Rt4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728289077; x=1728893877;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=O1edDQaZrOkr576aznoG41NUZzv1eU7bE/W4vr93KFU=;
 b=KrJb2Kfefsv5mm2TH1GXRJzTdR6vMlPZ2fS3utAMiTgMj5mauNp6qop1qcDPhUPHqI
 FdoD99TQ/kARz02kQyJLIQ7Z3ec/PZeEcN6u0H57gN9JZLEsdvcTFjY8w7J2kzInTVGM
 TVKLH0KMInihVRUOGIYLmxBl+DeqP5RxUUK3MkCeiU/KGgQE3RnZkbxGMbEkpNQfLy4o
 ZwqQUqHXmfF1TQnW3yyYGUqDgAZAR8sEMfzDMyeOw8+oJ0Qd3fo9O+s6FJC8Qk3ENMZL
 WrGkfovUow98zI8uKrVtYpwUfAAA8erbI/4uWIGe+YeaYX6CGroYhPLrQBnJJRcL0rsw
 eiKg==
X-Gm-Message-State: AOJu0YwZLPuaVckDi6+BEMRoTr9OnFgEtD4oSqWcTbm06/gqtAIUgZw0
 BxKzzcjUn9CHFxFPPn4TjHU+1KGxrzYdZXc1BXqsoLzPb+MXt+s5yB1l/yhY+5M=
X-Google-Smtp-Source: AGHT+IG9XJst6wsrAQL6BA85JuUkMdJMS7rThtpc/T8etcJuu3WuC0kKVQ3Uxb4DcOCO9c5BpMzHxw==
X-Received: by 2002:adf:ab15:0:b0:374:c7f8:3d50 with SMTP id
 ffacd0b85a97d-37d0eaea9a4mr8942994f8f.58.1728289076954; 
 Mon, 07 Oct 2024 01:17:56 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:a99f:3c24:fa3b:1e7?
 ([2a01:e0a:982:cbb0:a99f:3c24:fa3b:1e7])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-37d16972fe9sm5142480f8f.108.2024.10.07.01.17.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Oct 2024 01:17:56 -0700 (PDT)
Message-ID: <8320f7d4-cbf4-45d2-9cad-a71eb16d5924@linaro.org>
Date: Mon, 7 Oct 2024 10:17:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v6 1/3] drm/mipi-dsi: add mipi_dsi_compression_mode_multi
To: Dzmitry Sankouski <dsankouski@gmail.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20241006-starqltechn_integration_upstream-v6-0-8336b9cd6c34@gmail.com>
 <20241006-starqltechn_integration_upstream-v6-1-8336b9cd6c34@gmail.com>
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
In-Reply-To: <20241006-starqltechn_integration_upstream-v6-1-8336b9cd6c34@gmail.com>
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

On 06/10/2024 20:18, Dzmitry Sankouski wrote:
> mipi_dsi_compression_mode_multi can help with
> error handling.
> 
> Signed-off-by: Dzmitry Sankouski <dsankouski@gmail.com>
> ---
>   drivers/gpu/drm/drm_mipi_dsi.c | 16 ++++++++++++++++
>   include/drm/drm_mipi_dsi.h     |  2 ++
>   2 files changed, 18 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_mipi_dsi.c b/drivers/gpu/drm/drm_mipi_dsi.c
> index 2bc3973d35a1..d8ee74701f1e 100644
> --- a/drivers/gpu/drm/drm_mipi_dsi.c
> +++ b/drivers/gpu/drm/drm_mipi_dsi.c
> @@ -1520,6 +1520,22 @@ void mipi_dsi_compression_mode_ext_multi(struct mipi_dsi_multi_context *ctx,
>   }
>   EXPORT_SYMBOL(mipi_dsi_compression_mode_ext_multi);
>   
> +/**
> + * mipi_dsi_compression_mode_multi() - enable/disable DSC on the peripheral
> + * @dsi: DSI peripheral device
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

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
