Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B7EBA349FA
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2025 17:35:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF0BE10E0D1;
	Thu, 13 Feb 2025 16:35:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="btVkvgTV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB3F710E411
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2025 16:35:33 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-43962f7b0e4so5584645e9.3
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2025 08:35:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739464532; x=1740069332; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=VkUcjMmDcjBIWHZCqAgxZp7FU0Fk/ys2zKA4pFxdyX4=;
 b=btVkvgTVpQvCuY8mFV0bfMMPTWBydF7F6KlQBQ98PaKJ4hzx61uOCpOzgH94PaFzdb
 kZWWzJxK+rQbaxMu/X97GTmHCDEed1UdG4xb1cTqlYvOcPQZin0jVQ+MyjzwG4jYiUhI
 oHPHSDZHVX9I//NuKN8UKjbXSIwULtmEj9BGAOwKN4x9Y3WOkVMXWUXHVEkFT0CYzZOa
 5Zp+Yd+h2NzYZJ/0rmlherJdG9Yu5SMcNCL28j8Fq9KHEZYsorJD6SIr5EXC6LH3pl+6
 h6LFWXJlVM4QVGKqO9JY1mFR89w/wRfWlbN9RJGYn2e3HY4/21E3iVqblZ2ZMw96TIu6
 QDiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739464532; x=1740069332;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VkUcjMmDcjBIWHZCqAgxZp7FU0Fk/ys2zKA4pFxdyX4=;
 b=DRarVYE2yZ9xwt7eHpDSHtdwFxGx007OFB69PuXHDQoddBBncngLG/XAENEp09HUyW
 Gmo8jczkM/hLDz9U/CaJ/+yr/er+OgFnP+QZFu4qNAc5qdeiF3s+1XiHSQk76XTvMtJI
 ytYl9NP9X1sEB1fujeC57fnCBkO01k+oxj3Y/HXN8GLkIXqm0B/2Leh/vLUdQoQyl/Yi
 NpAYF3FuBib7ERZw17EW1HXYQMZ86bbXcAJEx98wIOnaFEbu8j+m5fvrAcbR0bQKXchL
 /2z3hT7bqDXm6lipLd4ZXpTChb99vhtXncZsQVl+lB4Mnv4cSVKR3HKNwzkNBKBN7KuG
 LpbQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXmoCpXUXOVJqzhx8z4llbCkiaLrz/uBNww7yUqaryepCrRowK+kSST11dRfZz2fvQ+gkuyEWZP8lY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzfOnRwYTOUgvyV/7SYfWWIHOFvuJo11nBcXcw4x2Vu0RUryTTR
 P0CKRUO5vxYuAFogLLn4ismWXgFxvBnuPoVfLF4q6EjNe0bKwWWJwmwWdWvLBgLBhcskfb3+QR2
 C
X-Gm-Gg: ASbGncswfd0uR279xqOTLIKPD6CA3doAZDwADTJKZjd3lfL/LEi2IhparSPZoClvd4L
 Qs8qY7iVvaLcAt+OHH7mErh6cueWq9y/eFJJPtZsW/TAaMJ7YBdCeraQWVxdka6oMoNigD8R9FZ
 uiG/5gDIAT53xiwq3JSpKRDCFLy4G0Q8OjQKx1W4DWMNrCLuFAP7yrPg51WuPvH7tvk4JsXnI+Z
 su7vkBShS1cLYZzP1XKnNlB22vgUniUOewMbOdga4SHKUdM8acVGA6VCmUVjjwH4zjlwX7BJsZ7
 6eJUVIXk+Y1QfQ==
X-Google-Smtp-Source: AGHT+IFM1kxdJteFvAGtFfb2y2uOiPSqES4FB6gOuR+NQII0SSEfN8Pt53ab+u81k2xRmqiGXbaHxQ==
X-Received: by 2002:a7b:cbc7:0:b0:439:65c5:f28a with SMTP id
 5b1f17b1804b1-43965c5f2f4mr12621705e9.16.1739464532321; 
 Thu, 13 Feb 2025 08:35:32 -0800 (PST)
Received: from linaro.org ([86.123.96.125]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-439653f0556sm7049395e9.1.2025.02.13.08.35.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Feb 2025 08:35:31 -0800 (PST)
Date: Thu, 13 Feb 2025 18:35:30 +0200
From: Abel Vesa <abel.vesa@linaro.org>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Akhil P Oommen <quic_akhilpo@quicinc.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 2/2] drm/msm/a6xx: Print GMU core firmware version at boot
Message-ID: <Z64fUjIfFzs4R8Im@linaro.org>
References: <20241219-topic-gmu_fw_ver-v1-0-d403a70052d8@oss.qualcomm.com>
 <20241219-topic-gmu_fw_ver-v1-2-d403a70052d8@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241219-topic-gmu_fw_ver-v1-2-d403a70052d8@oss.qualcomm.com>
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

On 24-12-19 23:36:56, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Log the version for informational purposes, such as for keeping track
> of possible GMU fw-related failures in crash / CI logs.
> 
> Intentionally not implemented on the if (gmu->legacy) codepath, as
> these registers seem not to be used on there.
> 
> Downstream additionally warns if the firmware version is too old for
> a given GPU, but we already pair the binary to a given GPU, so let's
> not go there at the moment.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> index 14db7376c712d19446b38152e480bd5a1e0a5198..a7ea2b2af1dc3816906236df929df36e37d8f606 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> @@ -729,6 +729,7 @@ static int a6xx_gmu_fw_load(struct a6xx_gmu *gmu)
>  	const struct firmware *fw_image = adreno_gpu->fw[ADRENO_FW_GMU];
>  	const struct block_header *blk;
>  	u32 reg_offset;
> +	u32 ver;
>  
>  	u32 itcm_base = 0x00000000;
>  	u32 dtcm_base = 0x00040000;
> @@ -775,6 +776,12 @@ static int a6xx_gmu_fw_load(struct a6xx_gmu *gmu)
>  		}
>  	}
>  
> +	ver = gmu_read(gmu, REG_A6XX_GMU_CORE_FW_VERSION);
> +	DRM_INFO("Loaded GMU firmware v%u.%u.%u\n",
> +		 FIELD_GET(A6XX_GMU_CORE_FW_VERSION_MAJOR__MASK, ver),
> +		 FIELD_GET(A6XX_GMU_CORE_FW_VERSION_MINOR__MASK, ver),
> +		 FIELD_GET(A6XX_GMU_CORE_FW_VERSION_STEP__MASK, ver));

I get the following spam:

[  109.928924] [drm] Loaded GMU firmware v3.1.10
[  110.301295] [drm] Loaded GMU firmware v3.1.10
[  110.472620] [drm] Loaded GMU firmware v3.1.10
[  111.164303] [drm] Loaded GMU firmware v3.1.10
[  111.864830] [drm] Loaded GMU firmware v3.1.10
...

Stacktrace shows this being called from runtime resume:

[   19.380390] Call trace:
[   19.380391]  show_stack+0x18/0x24 (C)
[   19.380399]  dump_stack_lvl+0x40/0x84
[   19.380403]  dump_stack+0x18/0x24
[   19.380405]  a6xx_gmu_resume+0x450/0xc44 [msm]
[   19.380426]  a6xx_gmu_pm_resume+0x34/0x220 [msm]
[   19.380437]  adreno_runtime_resume+0x28/0x34 [msm]
[   19.380446]  pm_generic_runtime_resume+0x28/0x3c
[   19.380451]  __rpm_callback+0x84/0x390
[   19.380453]  rpm_resume+0x3d0/0x5c0
[   19.380455]  __pm_runtime_resume+0x4c/0x94
[   19.380457]  adreno_get_param+0xdc/0x274 [msm]
[   19.380466]  msm_ioctl_get_param+0x5c/0x68 [msm]
[   19.380475]  drm_ioctl_kernel+0xd4/0x10c [drm]
[   19.380491]  drm_ioctl+0x26c/0x40c [drm]
[   19.380499]  __arm64_sys_ioctl+0x90/0xcc
[   19.380503]  invoke_syscall+0x40/0xf8
[   19.380505]  el0_svc_common+0xac/0xdc
[   19.380506]  do_el0_svc+0x1c/0x28
[   19.380508]  el0_svc+0x34/0x7c
[   19.380512]  el0t_64_sync_handler+0x84/0x108
[   19.380513]  el0t_64_sync+0x198/0x19c

So maybe DRM_INFO_ONCE instead ?

> +
>  	return 0;
>  }
>  
> 
> -- 
> 2.47.1
> 
> 
