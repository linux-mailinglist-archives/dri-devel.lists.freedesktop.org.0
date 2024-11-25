Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EC2A9D8A98
	for <lists+dri-devel@lfdr.de>; Mon, 25 Nov 2024 17:46:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 648B310E6A6;
	Mon, 25 Nov 2024 16:46:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="czlhJIHn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
 [209.85.167.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68BAF10E6A6
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Nov 2024 16:46:43 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id
 2adb3069b0e04-53de652f242so831788e87.1
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Nov 2024 08:46:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1732553201; x=1733158001; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=8ykbKQkuo2I4PEhIhBhe30Yc7TSw4jX5a63Tm3U6voo=;
 b=czlhJIHnjbr86+EL4yEVj06djN3gjs50TL2j329l8+gjstb2VDZNo3aZe9KkZpV6nY
 fnJ3aPxFWB9UPZn2mzG8OKgmtkiYumU3eNet/V09Fd/SDW/DMrFm5S/hRrTRW/Jcmbtq
 6cDsGAQZqO+lzxzku+TpaFWaY37S0jTzreqjbo0In2oe8gB1MIItZe6/gKA6G+rj8yYA
 P+4yCzvlf+/sWA7JZpFuTd3rumE9qW2GdwExX8CmwxGenpC5/GYwtZ0GD0UOzKDcxyj+
 U2C3yg4ej4g+vSAu+KRaX5d5kr7sxmr5ebeZ6frORhIpHFEDCx6gy+YpsHbMh1cIgO80
 sj2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732553201; x=1733158001;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8ykbKQkuo2I4PEhIhBhe30Yc7TSw4jX5a63Tm3U6voo=;
 b=Twc1ufSXKTgkMg6fQ5tmfYug0Psgp8kJC4GxV8a2ES81sTrFnPBgc4BDZBifu1wMVB
 0F2XnxR/CYJO3B0Boe4cw/Afsf2ZlImhLIgLR4/zFo90hgciWL7yKsFX6ErG5o9L5uYL
 h1QucUx/jv4AX2EpCDBd4lYNPF5Q7JNBu2OMvtCgQjBQM1fGzx149UkkpaGb2h2cvGuG
 ruQKnh3Cr2rztspX3+WlFt5TvBzq9Zqru06BNEmXwR/YMzY5EbSYUp+Zt265jIxB6l0F
 4ke/DOo1vZxbGIkeDkQmRY5Riopga1RoswVgTQq+eQ3CVtpP7uPIwBYSyJD62iL4Lw4R
 YyyA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUDCDjaFJ9luz81cHCg9I6Y4SUgX/coEx2keqt5pxz9qrh0LkzXbMjk9HycS25OGJyyYD7HWjkFzb4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxbwm7ZaJHGOXhtJwfaQsSCccTaiKbSaSvd1NVuWZliW8ikePgF
 h8982deIDdMXV8EJEwfOD42luMSvAfxkci8YgUDQXzJ72mKxVqKZoog2czxNbD8=
X-Gm-Gg: ASbGncvBRlI88n8ZCXBrmv/G1+qVBIDKhlEZ4ykksKSidB6hxoZiIAXj/btpZULEbVN
 YtRQp11fCtNiPbHpLR5KE59DW1spCqP5OC+HRJPZrfh9gVKnA8jgC+TU6vHud90qadPURCpBBof
 Y8IlDnKRBRRsJbiwAKhsCxJUCBiQO+nzvR7KCcuPZbWErq9aO0RbdWCIYvt4DUZ6Ult9UeW7XNm
 Q46bD0ftAt9hvJrEb7G/Wtc5in9Pt8NzXsEeIlPpmP8hrHwk1QpuUDDH8FbwNrhcFYYoGeBt5L6
 oIRF9dHr2lVKhsv76XgsOEIxcTg/VQ==
X-Google-Smtp-Source: AGHT+IEIEs10x32BmBHwyCvNs3GkmUc0gOFBfdig3YObcsa/6Cquloa5nXm0+6tXaumC980PBV2hcw==
X-Received: by 2002:a05:6512:1593:b0:53d:dd50:1a94 with SMTP id
 2adb3069b0e04-53ddd501c1dmr3313733e87.53.1732553201410; 
 Mon, 25 Nov 2024 08:46:41 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53dd2451091sm1715437e87.65.2024.11.25.08.46.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Nov 2024 08:46:40 -0800 (PST)
Date: Mon, 25 Nov 2024 18:46:37 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Akhil P Oommen <quic_akhilpo@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] drm/msm/adreno: Introduce ADRENO_QUIRK_NO_SYSCACHE
Message-ID: <vfbklrbereo3j5dp2w4pvctef364sb2dqogccmaevjerkm5u43@jytwobqwvuv2>
References: <20241125-a612-gpu-support-v2-0-b7cc38e60191@quicinc.com>
 <20241125-a612-gpu-support-v2-1-b7cc38e60191@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241125-a612-gpu-support-v2-1-b7cc38e60191@quicinc.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Nov 25, 2024 at 10:03:00PM +0530, Akhil P Oommen wrote:
> There are a few chipsets which don't have system cache a.k.a LLC.
> Currently, the assumption in the driver is that the system cache
> availability correlates with the presence of GMU or RPMH, which
> is not true. For instance, Snapdragon 6 Gen 1 has RPMH and a GPU
> with a full blown GMU, but doesnot have a system cache. So,
> introduce an Adreno Quirk flag to check support for system cache
> instead of using gmu_wrapper flag.
> 
> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 3 ++-
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c     | 7 +------
>  drivers/gpu/drm/msm/adreno/adreno_gpu.h   | 1 +
>  3 files changed, 4 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> index 0c560e84ad5a..5e389f6b8b8a 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> @@ -682,6 +682,7 @@ static const struct adreno_info a6xx_gpus[] = {
>  		},
>  		.gmem = (SZ_128K + SZ_4K),
>  		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
> +		.quirks = ADRENO_QUIRK_NO_SYSCACHE,
>  		.init = a6xx_gpu_init,
>  		.zapfw = "a610_zap.mdt",
>  		.a6xx = &(const struct a6xx_info) {
> @@ -1331,7 +1332,7 @@ static const struct adreno_info a7xx_gpus[] = {
>  		},
>  		.gmem = SZ_128K,
>  		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
> -		.quirks = ADRENO_QUIRK_HAS_HW_APRIV,
> +		.quirks = ADRENO_QUIRK_HAS_HW_APRIV | ADRENO_QUIRK_NO_SYSCACHE,
>  		.init = a6xx_gpu_init,
>  		.zapfw = "a702_zap.mbn",
>  		.a6xx = &(const struct a6xx_info) {
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> index 019610341df1..a8b928d0f320 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -1863,10 +1863,6 @@ static void a7xx_llc_activate(struct a6xx_gpu *a6xx_gpu)
>  
>  static void a6xx_llc_slices_destroy(struct a6xx_gpu *a6xx_gpu)
>  {
> -	/* No LLCC on non-RPMh (and by extension, non-GMU) SoCs */
> -	if (adreno_has_gmu_wrapper(&a6xx_gpu->base))
> -		return;
> -

Shouldn't it also be a NO_SYSCACHE check?

>  	llcc_slice_putd(a6xx_gpu->llc_slice);
>  	llcc_slice_putd(a6xx_gpu->htw_llc_slice);
>  }
> @@ -1876,8 +1872,7 @@ static void a6xx_llc_slices_init(struct platform_device *pdev,
>  {
>  	struct device_node *phandle;
>  
> -	/* No LLCC on non-RPMh (and by extension, non-GMU) SoCs */
> -	if (adreno_has_gmu_wrapper(&a6xx_gpu->base))
> +	if (a6xx_gpu->base.info->quirks & ADRENO_QUIRK_NO_SYSCACHE)
>  		return;
>  
>  	/*
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> index e71f420f8b3a..398be2218110 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> @@ -57,6 +57,7 @@ enum adreno_family {
>  #define ADRENO_QUIRK_HAS_HW_APRIV		BIT(3)
>  #define ADRENO_QUIRK_HAS_CACHED_COHERENT	BIT(4)
>  #define ADRENO_QUIRK_PREEMPTION			BIT(5)
> +#define ADRENO_QUIRK_NO_SYSCACHE		BIT(6)
>  
>  /* Helper for formating the chip_id in the way that userspace tools like
>   * crashdec expect.
> 
> -- 
> 2.45.2
> 

-- 
With best wishes
Dmitry
