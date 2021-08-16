Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 701913ECE70
	for <lists+dri-devel@lfdr.de>; Mon, 16 Aug 2021 08:08:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E89189BF0;
	Mon, 16 Aug 2021 06:08:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1285389BD5;
 Mon, 16 Aug 2021 06:08:21 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id w24so3051475wmi.5;
 Sun, 15 Aug 2021 23:08:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=r/nHbEzboSNUFm0n5Kb5WDXFEoEgqApNclI3Nq97ty0=;
 b=ie5fQk6Qnd9hKkCia2eNH/XTgxZyoKcBv9kjT2vdiPawNoVz5IKxsjRfWwx/7u6DA3
 B3LMBIAvP0TMgYBJx3lGZMHVXYctir4WQUKBASHWyGABZPZps96mKIQe+Reyd0unhPYr
 c+AZwtegayBCmm26xwM05NB0SEtleph6zmB/uuULWAhXPOhmAXdBskGRGwMRWe7p+mcj
 pZElukYdvy8dQba8GYnNIWLQDpXyzAZ4UnVbekjJaY5NyGL8Zm4Al6YVcx58wqCVUcNh
 UA9nx5FglQx0DHoZeGALT5L41wP0uAhysJ46xHa05/8Uc3jrfaarGhilslX7mCpAEnwh
 ssbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=r/nHbEzboSNUFm0n5Kb5WDXFEoEgqApNclI3Nq97ty0=;
 b=nz/JUQBR9tZcOp9XHl84TumGPpDci0hkOfLwmRdP0AXrx6Mtuw4NaJ+PFj7YY0IVxC
 mzlnRBnMs8RPJ6SmAnZoK1q5ADW3MQknC/SFAK7h2YrKwLeUM11Y4+kurhIXd0VhdAzP
 O+De2mFTcgh9pGe93y8jVRlxbYfHkb0N+WNaHmohZkxepdIJFXYn9HLlAfGv/cetkR/5
 OFCvVuSujNLs49R4NIcV/YJoEDXQ3UGu6gGMWYV5En7e3uqqWB9tUtIvzLDprt72byao
 vWLOKu8FepkX/28shB/YMZACBXUqVjUpWCwLfkdvP230re66S/E/tG8hzouBOKLW+I4X
 IiCQ==
X-Gm-Message-State: AOAM530MPY1pGJyCbVZVxxYY/e+ccDUNxZBGLzinMdVmQCEKKoX3J1DV
 5xsLVgC5MouFvF1hpJP6+14=
X-Google-Smtp-Source: ABdhPJyxgM9YzKO1jjyjOL7VHA3knQ2ZTEXygRcCRRbxotj675P0dVv4dSpKCKsWvWTeiOXXEUNTiQ==
X-Received: by 2002:a1c:a181:: with SMTP id k123mr13413029wme.90.1629094099521; 
 Sun, 15 Aug 2021 23:08:19 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:7d83:fd8:eb16:8605?
 ([2a02:908:1252:fb60:7d83:fd8:eb16:8605])
 by smtp.gmail.com with ESMTPSA id l2sm9347965wme.28.2021.08.15.23.08.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 15 Aug 2021 23:08:18 -0700 (PDT)
Subject: Re: [PATCH] drivers:gpu:drm:amd:amdgpu:fix a potential use-after-free
To: lwt105 <3061522931@qq.com>, alexander.deucher@amd.com
Cc: christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@linux.ie,
 daniel@ffwll.ch, sumit.semwal@linaro.org, nirmoy.das@amd.com,
 chenli@uniontech.com, JinhuiEric.Huang@amd.com, mh12gx2825@gmail.com,
 lee.jones@linaro.org, kevin1.wang@amd.com, luben.tuikov@amd.com,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org
References: <tencent_D167B6522B17C0228524C70F9CA5EEBBEC09@qq.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <fac65461-6ee2-e5dc-3af8-df9bfaecd6d4@gmail.com>
Date: Mon, 16 Aug 2021 08:08:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <tencent_D167B6522B17C0228524C70F9CA5EEBBEC09@qq.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
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

Am 13.08.21 um 05:28 schrieb lwt105:
> in line 1503, "dma_fence_put(fence);" drop the reference to fence and may
> cause fence to be released. However, fence is used subsequently in line
> 1510 "fence->error". This may result in an use-after-free bug.
>
> It can be fixed by recording fence->error in an variable before dropping
> the reference to fence and referencing it after dropping.
>
> Signed-off-by: lwt105 <3061522931@qq.com>

Good catch.

> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c | 7 ++++---
>   1 file changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> index 30fa1f61e0e5..99d03180e113 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> @@ -1486,7 +1486,7 @@ static int amdgpu_cs_wait_all_fences(struct amdgpu_device *adev,
>   				     struct drm_amdgpu_fence *fences)
>   {
>   	uint32_t fence_count = wait->in.fence_count;
> -	unsigned int i;
> +	unsigned int i, error;
>   	long r = 1;

Would be nice to have if you could reuse the "r" variable here instead 
of a new one.

Regards,
Christian.

>   
>   	for (i = 0; i < fence_count; i++) {
> @@ -1500,6 +1500,7 @@ static int amdgpu_cs_wait_all_fences(struct amdgpu_device *adev,
>   			continue;
>   
>   		r = dma_fence_wait_timeout(fence, true, timeout);
> +		error = fence->error;
>   		dma_fence_put(fence);
>   		if (r < 0)
>   			return r;
> @@ -1507,8 +1508,8 @@ static int amdgpu_cs_wait_all_fences(struct amdgpu_device *adev,
>   		if (r == 0)
>   			break;
>   
> -		if (fence->error)
> -			return fence->error;
> +		if (error)
> +			return error;
>   	}
>   
>   	memset(wait, 0, sizeof(*wait));

