Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69B3C8FB9C7
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jun 2024 19:03:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0934410E57A;
	Tue,  4 Jun 2024 17:03:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="RS9DHlVf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com
 [209.85.208.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E25AC10E57A
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Jun 2024 17:03:10 +0000 (UTC)
Received: by mail-ed1-f50.google.com with SMTP id
 4fb4d7f45d1cf-57a1fe63947so5331597a12.1
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Jun 2024 10:03:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1717520589; x=1718125389; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=vT4NRPNeixA+G6MuIymamVECCUZ9IQFLGyEaqSpBSHg=;
 b=RS9DHlVfZIdaCzCvxg3zxyZVkvNoLMJ1phPuyZCYc930lS4DGQ5RnRMMcHEuRxY8wc
 7RAlMjHPHV0skoMddH1nOjkVlnDeedYGub1Si4ltnJrTKE7NU9eqAKm8kasdH4JljpN7
 wEP5L8qaLLESu+w9w9AZjIoFLFcxIhgysLBKlXwQPLmQD6JCsdpTJaIUqBTiNxZZAUT/
 yz9dN/3GGuIcKA8JyrlZoXJl+Blxki989MR9pZ7mttuxLHqAUOwh4GIVtQVaVXNHRLLO
 mtQqaqbs9Z4bojPuwqeWA2Hhpj+wuwMiH1gFOkJN/LPmRpH/iIBuq4FPqTx8SavUPXKl
 tXNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717520589; x=1718125389;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vT4NRPNeixA+G6MuIymamVECCUZ9IQFLGyEaqSpBSHg=;
 b=vQ3tZ/tSeoNzYYlx95x4w1x3XKBViS7HZT1dNHok1IL0hMAehDx5Yje7oAvf4Z0Qmd
 FOuBRTzy0xR29S2gWk3rlBDFMkEOGzDTRJdWyLBfkcrH944vdHnCrQbAvZeDJ81yYzCd
 EbAqIn/tqHIrHkSDu03kUxq1ziJwo3FnEOsgfKD9P8WXxpPxufbP3JwJ3SFGyso/Wi14
 gA1IOMoRZ2Vjpsor0JGTFeUGorN75I9Qxbbtpc+LEMiHeIAXEmX4uwcN3PBsgKy7waAV
 c/ogSGur8q2xxDFOqTMVUHj6ceBhpZL4GG6GQqcqXPC9aDUVPiJqbQR7uLfFUnGZmNxr
 6cpQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVuqcoodruB+GaiGgSxa0in+BEexdmd4nPJxJSjb1nG0X3Cfq13hNwJ2yh1Ljq3/Wc827Dg7BdLJO4P1SkCt+0Gj8MyPBSJATPOaOO8Exi3
X-Gm-Message-State: AOJu0Yz6CpwJdH+qtGo/9nrvE5651PZ0Mxdg341nuim4ExC8DGDRAXO7
 /9179SR2nPIWayuJJDCs8L9OO/98pjQ040Yyiu0w9FTLZnxrqsUam66almd/lOg=
X-Google-Smtp-Source: AGHT+IEgWg2pjUKwHDa6bycaIJ0McqADKPUWZ9CMQ7XIFyoVyQxXnFBcVvb3dOZX9DbeyDkuE6usRA==
X-Received: by 2002:a50:8e07:0:b0:579:c393:82ad with SMTP id
 4fb4d7f45d1cf-57a8bca2eabmr121356a12.30.1717520588716; 
 Tue, 04 Jun 2024 10:03:08 -0700 (PDT)
Received: from ?IPV6:2a00:f41:909a:a11e:b2c0:1360:9a97:b2b8?
 ([2a00:f41:909a:a11e:b2c0:1360:9a97:b2b8])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-57a31be7c04sm7774939a12.58.2024.06.04.10.03.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Jun 2024 10:03:08 -0700 (PDT)
Message-ID: <4a8a9984-efd4-4aaa-ba48-5ff6b641349c@linaro.org>
Date: Tue, 4 Jun 2024 19:03:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm/a6xx: Print SQE fw version
To: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Rob Clark <robdclark@chromium.org>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 open list <linux-kernel@vger.kernel.org>
References: <20240604154846.500357-1-robdclark@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240604154846.500357-1-robdclark@gmail.com>
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



On 6/4/24 17:48, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> Add the SQE fw version to dmesg and devcoredump.
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>   drivers/gpu/drm/msm/adreno/a6xx_gpu.c       | 32 +++++++++++++++++++--
>   drivers/gpu/drm/msm/adreno/a6xx_gpu.h       |  1 +
>   drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c |  2 ++
>   3 files changed, 33 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> index 56bfb228808d..5a2a005003c8 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -665,6 +665,32 @@ static int a7xx_cp_init(struct msm_gpu *gpu)
>   	return a6xx_idle(gpu, ring) ? 0 : -EINVAL;
>   }
>   
> +static uint32_t get_ucode_version(const uint32_t *data)
> +{
> +	uint32_t version;
> +
> +	/* NOTE: compared to kgsl, we've already stripped off the first dword: */
> +	version = data[0];
> +
> +	if ((version & 0xf) != 0xa)
> +		return version;
> +
> +	version &= ~0xfff;
> +	return  version | ((data[2] & 0xfff000) >> 12);

double space

Some GENMASKy defines w/ FIELD_GET would be nice here..

[...]

>   
> +	DRM_DEV_INFO(&gpu->pdev->dev, "Have SQE version %03x\n", get_ucode_version(buf));


"SQE FW version: [...]" instead?

> +
>   	/* A7xx is safe! */
>   	if (adreno_is_a7xx(adreno_gpu) || adreno_is_a702(adreno_gpu))
>   		return true;
> @@ -714,7 +742,7 @@ static bool a6xx_ucode_check_version(struct a6xx_gpu *a6xx_gpu,
>   		}
>   
>   		DRM_DEV_ERROR(&gpu->pdev->dev,
> -			"a630 SQE ucode is too old. Have version %x need at least %x\n",
> +			"a630 SQE ucode is too old. Have version %03x need at least %03x\n",
>   			buf[0] & 0xfff, 0x190);

This func should probably get updated to use the new getter too,
getting rid of magic masks for e.g.

if (FIELD_GET(SQE_FW_MINMAJ, ver) > 0x190)
	foobarbaz

Konrad
