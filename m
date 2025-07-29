Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F28BB14F0C
	for <lists+dri-devel@lfdr.de>; Tue, 29 Jul 2025 16:06:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 461EF10E636;
	Tue, 29 Jul 2025 14:06:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="AG4TgF2i";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 830B710E210
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Jul 2025 14:06:35 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-4561ed868b5so36898845e9.0
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Jul 2025 07:06:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1753797994; x=1754402794; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=Fn497pBIb31Sx7BbH71sH1wCChN0m96yZl9gFKIrt2U=;
 b=AG4TgF2iM49Su2E4taYqmhOPGf/OVVI8wIWa77d3DxU8s0pKgj6uN3bxYR5WYUec2t
 jakNp+lTbFmGBXOr7VNAD0QmVOcd/RrFXf2ODgJ4TO8hmZqDMHE9GQQdvoQiJNk1Eln4
 OQRfAMw2m/hOBwTkY6cfv8O7PYIXEGgsEp/S3BCahnJ7jI9p71RbcUHf9BLz5FJPZfWM
 /xyUXcW6/wCs7JxZTPcEbNA4QkH7BrJldf0PGgi32zdaEAtmITgQe0aV+nak5Qc49ZxA
 TwaMSFjyo2SeFzInBo3mSDSwC8L+yG+LlYuCy2EH9NynnBoS+R04gNivgHuvkIJOKqFq
 DAhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753797994; x=1754402794;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=Fn497pBIb31Sx7BbH71sH1wCChN0m96yZl9gFKIrt2U=;
 b=tzrgutVyma9sQG8NKaxtHpcQMhykYnz8iysGrmTBURIlP2Cqg1o6JpwuA7wNZfDb7F
 QvEgtXVlE8sE8cq3+WPsrME3MyGXGtY/pKANr7p/+xGZow6ucHOaUIqtPte4YgRVXEtn
 oJRackawG86Q5VkS8xcBn6TVpDyMzXTLbYsbb8rSEnMJlrvdDPEFhYryGWp5gb8vPoHU
 1T8CClE/oqGFJyxxoyW8JKf+LR2AXz5uQPnDiMJKSVp6LuSm9K8gI2atdMz1i8KYbmQB
 lWmpUyS2+c0NP0ogfCPxsRufmW1wIHgRZn9j+MdBAsG3urEj/jQcdHru61ESKR3WD87y
 bYFg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV9n7VTb7jPRom7Yhn3TK8UJ53W00aXfvlm3a/gy43pBzVQgsYFo/BVgxXQ4Scnu0i/9uYpwd50DDw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzpf/agKi5YKN3l6NdmdZxFoKoINTYRZ8ayus6J8bbK3/21urGc
 aDA/xz1RUDpIJVKS8OjL4iV/qYlmurMIrIp3PP7fYd1/98KBDPSWLFY7oouiA3UuZQM=
X-Gm-Gg: ASbGncsftOY+T21OHaUI7xPJiM4viilg0C+Phc9ZOtJmKdbana9TDwSV5+9WoQtsf1u
 jMKflDIIU7YdbD49WWXxcgJq4au/on0Y9Nns/dkBJohpGFIrrKYF8u2pwa2gxFvVI5nDL3SuSmH
 Xg6Uv4ALrdbYDv+F5ObkTW0eoFTm4zzmMrW0Vn8OXQmlodqz3zqPajGn4uDUHIWZoia2i0C5brE
 eVMHuI+TSuSk0d2DPCPDMzrXgZvJPa0cFWLcncruhFIV+wpAUmY1id7WNIJJBfComVGwfyMMLEk
 UmQNXat13e6aUJADnSCZyyFZ6re2NYciytIDMtrJ4Di6Y1XyWrru1HjWOCfcoIsdiTHDo95hhTz
 N2GhmNHBT+qZ63/4NHkdSQmjoud4E2C3FlwdJ6Oi06VCuLgayQuDACzMT4+El0tz/MLz8qoBq
X-Google-Smtp-Source: AGHT+IF0jH8WRN0uj1ieZOTFoPYfy4emJn+MHYxU9ZEF0XGbevulltaVbFmdQE5WJDFjaDKAdfUMXQ==
X-Received: by 2002:a05:600c:3e0c:b0:456:18f3:b951 with SMTP id
 5b1f17b1804b1-45892814760mr1387415e9.15.1753797993672; 
 Tue, 29 Jul 2025 07:06:33 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:3ae8:20b:c783:9328?
 ([2a01:e0a:3d9:2080:3ae8:20b:c783:9328])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b78dd6cb0fsm3231780f8f.29.2025.07.29.07.06.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Jul 2025 07:06:33 -0700 (PDT)
Message-ID: <cfbad162-e629-45c9-8436-74bb6fc416f2@linaro.org>
Date: Tue, 29 Jul 2025 16:06:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH 16/17] drm/msm/a6xx: Enable IFPC on Adreno X1-85
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250720-ifpc-support-v1-0-9347aa5bcbd6@oss.qualcomm.com>
 <20250720-ifpc-support-v1-16-9347aa5bcbd6@oss.qualcomm.com>
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
In-Reply-To: <20250720-ifpc-support-v1-16-9347aa5bcbd6@oss.qualcomm.com>
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

On 20/07/2025 14:16, Akhil P Oommen wrote:
> Add the IFPC restore register list and enable IFPC support on Adreno
> X1-85 gpu.
> 
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
>   drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 67 ++++++++++++++++++++++++++++++-
>   drivers/gpu/drm/msm/adreno/a6xx_gpu.c     | 15 +++++--
>   drivers/gpu/drm/msm/adreno/a6xx_gpu.h     |  1 +
>   3 files changed, 78 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> index 70f7ad806c34076352d84f32d62c2833422b6e5e..07fcabed472c3b9ca47faf1a8b3f7cf580801981 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> @@ -1343,6 +1343,69 @@ static const uint32_t a7xx_pwrup_reglist_regs[] = {
>   

<snip>

> +
>   static const struct adreno_info a7xx_gpus[] = {
>   	{
>   		.chip_ids = ADRENO_CHIP_IDS(0x07000200),
> @@ -1432,12 +1495,13 @@ static const struct adreno_info a7xx_gpus[] = {
>   		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
>   		.quirks = ADRENO_QUIRK_HAS_CACHED_COHERENT |
>   			  ADRENO_QUIRK_HAS_HW_APRIV |
> -			  ADRENO_QUIRK_PREEMPTION,
> +			  ADRENO_QUIRK_PREEMPTION | ADRENO_QUIRK_IFPC,
>   		.init = a6xx_gpu_init,
>   		.a6xx = &(const struct a6xx_info) {
>   			.hwcg = a740_hwcg,
>   			.protect = &a730_protect,
>   			.pwrup_reglist = &a7xx_pwrup_reglist,
> +			.ifpc_reglist = &a750_ifpc_reglist,
>   			.gmu_chipid = 0x7050001,
>   			.gmu_cgc_mode = 0x00020202,
>   		},
> @@ -1459,6 +1523,7 @@ static const struct adreno_info a7xx_gpus[] = {
>   		.a6xx = &(const struct a6xx_info) {
>   			.protect = &a730_protect,
>   			.pwrup_reglist = &a7xx_pwrup_reglist,
> +			.ifpc_reglist = &a750_ifpc_reglist,

So far it's stable on a750 so I think can safely add ADRENO_QUIRK_IFPC here aswell.

Neil

<snip>

