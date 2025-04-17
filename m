Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21BCFA921E9
	for <lists+dri-devel@lfdr.de>; Thu, 17 Apr 2025 17:47:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2E9910EB5B;
	Thu, 17 Apr 2025 15:47:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="jGPxzm3b";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 065CD10EB5B
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Apr 2025 15:47:24 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-43cfe63c592so11374535e9.2
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Apr 2025 08:47:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1744904842; x=1745509642; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=d4SOU60FSeZSZYOagcsyjJRw1ciUsZ3CgR0C+LUaKPQ=;
 b=jGPxzm3boVjcivdT7Mwz0o9wd9dL3bwfw2CBPcBFNk4jQ9Ay9qVitHVjMdlDVMCVoI
 nLxYrlab/4CLyt8VqqCb2MLao+bhxYo5AtNbqaKw+kA63u+U/xr9+uwcTOkeAOHYcdsk
 AmBj49tS5gEXQCQaJMgczIl/paSC3K2VKULhAJTZ0NEUOUl2mSqoQPJ8TZUwkyQU2shf
 U9sbSsGrFNukWl7AGORkQ5ZFe1X0fVW+PrP0cvoYFNxetEDeUAkJYONJCowZJCk4uiIG
 mCX3G+IRZxgTR5zGdkAx6vtNzqMpBwwd1+mGST8TZFqmbBNuGvuywGumT62Upg8mKyTe
 ZkkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744904842; x=1745509642;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=d4SOU60FSeZSZYOagcsyjJRw1ciUsZ3CgR0C+LUaKPQ=;
 b=DW9l0YRJqrOyFAyxVG9tyxp7B6llUbs5DGnJOvSwfEEupWDvVCtZ7YLQVqH6XWHgI+
 YX/1xQK8TA22DPVdQome+zy8zVMYcQnUwPPA4QEHJGI9dkemyEkxPIwTQ3lQQrqyi/Cg
 x9Yzrn+SXbaOuy/CUDtSr8haNryWW599nFvUgicBrnowt+aS78Cb3VbEmab89uOEcFsA
 2Y9OgNUKnDCSNYUkwr2dxf0ncln+rZmHa1yEnV4xvP3CJfpkwHCWwHvecsLAuLFqHgd9
 22Nbhbqq4UB01Yir/VVy+HteB6tkeTP9tBqTid+J5fTpEvgVgI2vrPrJsv4rychZuofX
 MaNQ==
X-Gm-Message-State: AOJu0YzLbucvF+kMlHBKu9qRjSE4SZG6FEeo10Opz3MsReepZDQCdY3n
 bUMKWI+ZpLX7Pauw26E4G9AabLxojytnd2NegSLNiJxXLTYd0PIfl7FPqOk5kdU=
X-Gm-Gg: ASbGncu/ditTuDyOqYTZyGHr4gjyLDt6TVRxGFhXptw2xKzS3ZD7Wm4qCUIHEtgaKMC
 yuKYGDaYlaXWCMtHdSUeIaGyLXe8xofufhIqyUl9yEGZJYCJFjS0Voqr6Z64kiqId/f2Fuyzc8C
 ToLC43Z4VfcHzSnwOkLEfEIYEfq1gVc3xIIy15iVT4C+QAoH71fjTkRppZfOsHU04zp7dvJ0A0p
 JxV6DkSQhoMJaYaSBke0D6zu8qfZHwmIRz4qZAgbVBOlb7bnC+ymHBaARds0JMdxVqm4yf0hQeC
 CY41+G2EGN3R7g4yV+fgzeFcOYuhd0rTKZMqGiq97MmfykYMObp4CYKcn4ext1bg17+apat5R6V
 oT/2GgiJdR/0Iw5VAX6FVb8qvhw==
X-Google-Smtp-Source: AGHT+IEfAJX3GUuUI0f4PcoPivpbAcRA5K17KArPC8M+hzAVEVPWPtZimQgcBVvsyQbJWnMClsv2EQ==
X-Received: by 2002:a05:600c:3d9b:b0:43c:fa0e:471a with SMTP id
 5b1f17b1804b1-4405d5fda13mr64206575e9.5.1744904842486; 
 Thu, 17 Apr 2025 08:47:22 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:a7f9:634b:42d:1546?
 ([2a01:e0a:3d9:2080:a7f9:634b:42d:1546])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4405b58d18csm58956285e9.26.2025.04.17.08.47.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Apr 2025 08:47:22 -0700 (PDT)
Message-ID: <3da72f3e-7ef3-48de-bd7c-faaf0f6ba64b@linaro.org>
Date: Thu, 17 Apr 2025 17:47:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 4/7] drm/bridge: analogic_dp: drop panel_lock
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250401-panel-return-void-v1-0-93e1be33dc8d@oss.qualcomm.com>
 <20250401-panel-return-void-v1-4-93e1be33dc8d@oss.qualcomm.com>
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
In-Reply-To: <20250401-panel-return-void-v1-4-93e1be33dc8d@oss.qualcomm.com>
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

On 01/04/2025 07:11, Dmitry Baryshkov wrote:
> The analogix_dp_prepare_panel() function is called from bridge's
> atomic_pre_enable() and atomic_post_disable() callbacks, which can not
> happen simultaneously. Drop the useless mutex.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>   drivers/gpu/drm/bridge/analogix/analogix_dp_core.c | 5 -----
>   drivers/gpu/drm/bridge/analogix/analogix_dp_core.h | 2 --
>   2 files changed, 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> index 704c6169116eb2601d2ad02dc7294455ceff5460..1ec4d277fe6bb03ad9eb8451ae2af5ad5ada0978 100644
> --- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> +++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> @@ -974,14 +974,11 @@ static int analogix_dp_prepare_panel(struct analogix_dp_device *dp,
>   	if (!dp->plat_data->panel)
>   		return 0;
>   
> -	mutex_lock(&dp->panel_lock);
> -
>   	if (prepare)
>   		ret = drm_panel_prepare(dp->plat_data->panel);
>   	else
>   		ret = drm_panel_unprepare(dp->plat_data->panel);
>   
> -	mutex_unlock(&dp->panel_lock);
>   	return ret;
>   }
>   
> @@ -1523,8 +1520,6 @@ analogix_dp_probe(struct device *dev, struct analogix_dp_plat_data *plat_data)
>   	dp->dev = &pdev->dev;
>   	dp->dpms_mode = DRM_MODE_DPMS_OFF;
>   
> -	mutex_init(&dp->panel_lock);
> -
>   	/*
>   	 * platform dp driver need containor_of the plat_data to get
>   	 * the driver private data, so we need to store the point of
> diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.h b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.h
> index b679d5b71d276f458d905c936160f107225bc6c5..2b54120ba4a3ef55af518a0629a5c8469f275a0f 100644
> --- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.h
> +++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.h
> @@ -169,8 +169,6 @@ struct analogix_dp_device {
>   	bool			fast_train_enable;
>   	bool			psr_supported;
>   
> -	struct mutex		panel_lock;
> -
>   	struct analogix_dp_plat_data *plat_data;
>   };
>   
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
