Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AC0190C8B2
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jun 2024 13:13:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46C3910E52C;
	Tue, 18 Jun 2024 11:13:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="lFhBHEZO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9B4E10E211
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2024 11:13:14 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id
 2adb3069b0e04-52c85a7f834so6817385e87.0
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2024 04:13:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1718709193; x=1719313993; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=JZUe7gF67J9gDxOaoNUrJWpHp/2/v3KlOF4371wquz0=;
 b=lFhBHEZO4QZHdlYtGJdrA2wp/Xfrxas+nUWvuYCOO+bmJn4m43j4jgOobdpZ4MfCE/
 p9NuxNTH/wQ/pvXzQDWreW/O1U6zwF4u7MHe9CaWEYDnQ5uv+6QIcO7oo/LSU2A3qHVW
 R5XiFzjPmj4/7Pw3Uo7KxpMKl4JpjbZcRDMJ0GnrfT8zfuFNtc0RrxAQXlFdLbXMtMq/
 4O61HtODou0py0/rJd/jMf9ep6omrhJZWsj1wjwjXKn8Fyerqqeu8c6+K3NrhHvWPLJy
 4UdeFF0oMy59FoDeP8k88xxNuzjjtWJ9VSLOtHG8AbnJjVg60tslacXVfwBUedyQBCkZ
 tNHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718709193; x=1719313993;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=JZUe7gF67J9gDxOaoNUrJWpHp/2/v3KlOF4371wquz0=;
 b=YUQUY602Z+1G3lZePML5KJ3gtMAJZS2bb9myhIpfnc+yP04JKByvAIUqNAPlnSa+Ms
 TlzwdTZIqA5ZnztFPE5I7NyHjNqMe7eR1m/4tjIaQNv2zAX8RY2n+OLwlRrAwP82sWK2
 cg1aqQLRaPb0PcudegYumWOs0L45Ky8sXX6nfm6MjvLKeeA5nCTsKg2XGBBBf4ofOsHT
 t2f5g/VWGUvfHZQnPYSXzRXb4co3UPSBqNqi2vMKGXFkrnn4OndOi8KSn4c/j5pfYDdG
 3/DjlipIz8V4cyugPkZAyH1FAaiKKSE4E5m7OsadiLhWYgTdp8ICr8qcgA5qeqd7+IV6
 jQ4w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXt98Lu6THcORG7NW3ajGANTvnA34guroHv7/I+3GE8LXtrmVsqfx+6HmVewYVCiMIG7ypp7tFj7PvIXHNLuy/3DflDXNalV/t3MP6SdwQr
X-Gm-Message-State: AOJu0YyElu6KrXS3I/iJyQTzH3gT1VSz5NYTi7g802O/KPxGOSrZf7x2
 TtQiYPIuYR2xpWKd4eXOoHfe3fkUgGKmQuRZPqbjR3pn2Bk51wjqXiJ7V5YDjeQ=
X-Google-Smtp-Source: AGHT+IFvHh/ds3YGzEZJqogwunAMiM1SJOHwoExwr3tTrv56ocyHxKE2bN01RmdOChtzhx+k1jIP3g==
X-Received: by 2002:a05:6512:15a:b0:52c:958a:4afa with SMTP id
 2adb3069b0e04-52ca6e65889mr6824542e87.23.1718709192614; 
 Tue, 18 Jun 2024 04:13:12 -0700 (PDT)
Received: from ?IPV6:2a00:f41:9028:9df3:4fb7:492b:2c94:7283?
 ([2a00:f41:9028:9df3:4fb7:492b:2c94:7283])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52cbb24b860sm652495e87.191.2024.06.18.04.13.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Jun 2024 04:13:12 -0700 (PDT)
Message-ID: <c3ab8619-2842-4e90-883a-04e45fb18394@linaro.org>
Date: Tue, 18 Jun 2024 13:13:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/5] drm/msm/adreno: Move hwcg table into a6xx specific
 info
To: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Rob Clark <robdclark@chromium.org>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 open list <linux-kernel@vger.kernel.org>
References: <20240617225127.23476-1-robdclark@gmail.com>
 <20240617225127.23476-5-robdclark@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240617225127.23476-5-robdclark@gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 6/18/24 00:51, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> Introduce a6xx_info where we can stash gen specific stuff without
> polluting the toplevel adreno_info struct.
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>   drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 65 +++++++++++++++++------
>   drivers/gpu/drm/msm/adreno/a6xx_gpu.c     |  6 +--
>   drivers/gpu/drm/msm/adreno/a6xx_gpu.h     |  9 ++++
>   drivers/gpu/drm/msm/adreno/adreno_gpu.h   |  6 ++-
>   4 files changed, 67 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> index bcc2f4d8cfc6..96d93251fdd6 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> @@ -7,6 +7,7 @@
>    */
>   
>   #include "adreno_gpu.h"
> +#include "a6xx_gpu.h"
>   #include "a6xx.xml.h"
>   #include "a6xx_gmu.xml.h"
>   
> @@ -465,7 +466,9 @@ static const struct adreno_info a6xx_gpus[] = {
>   		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
>   		.init = a6xx_gpu_init,
>   		.zapfw = "a610_zap.mdt",
> -		.hwcg = a612_hwcg,
> +		.a6xx = &(struct a6xx_info) {

const

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
