Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D76B23E102D
	for <lists+dri-devel@lfdr.de>; Thu,  5 Aug 2021 10:23:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C35316E2E1;
	Thu,  5 Aug 2021 08:23:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2A4C6E2DF
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Aug 2021 08:23:08 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id n17so6813353lft.13
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Aug 2021 01:23:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=+e6CGQXxPMJe6R9jF7UtUP2EM2nwkAeOu++SZ0r1h48=;
 b=g9Fw9rp8HJt6YVrjbNKeYQ1cxVRtK7R5x5yue0bGcwObp8XT8wnN1ueN0WXsG0n46f
 hJtSGe20wDlez9DuciC9s+qlj4cmcdzZ+oVIymjn3Q3IQhU7zhoft9qfOpmHlSZYhIxJ
 jCN/BeTXg3D3L/XQuJdM3DSCT7/P3KFXDJcYKPza+o7lLDyn2iFtMQyThi6k1g749Go9
 pjt2FCuQ0EwfxacwyBIZvcZqGDT2MwhoULpYjSx0CfoCY6YYZFl9Fdp0l7mlN2eTpVCn
 h0IPLKTpJ0fMHtpT7TsyuuRGsE311a+5PgEy0+im9sj5WD1OOa+3+hKnyNEDVkQJ71Fz
 5btQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=+e6CGQXxPMJe6R9jF7UtUP2EM2nwkAeOu++SZ0r1h48=;
 b=XBOGiGX612xkahNqaiZ1j0QoFsuFckZZjwqhbScvej8fuMgC0Umr2WD5pYSgD7LQMW
 h/oWLtJfAg3GK31WSWX50lE7rRS4u6Kk4p/KcTm7NcIG/Ci0gX6QFoPAuqcwOT8iXw+V
 kHost1czCegS4GeuZUz9eMTy7kDy63BVXL7lOLDSpri9jRb3+57mufA4UzorYtxkWAPh
 dFTOX/qvhYtzPJ9U33phSbacUosAVHQunM6CF+5ynDiK+BdgSXy8vwq09GshsK358OuU
 E+rVXtb2BBZle4iywXQXYsnaxlp2649sdUpINvzQVODCOLIOckpQo3rQ8bYSYWN2Y8jk
 JDTw==
X-Gm-Message-State: AOAM53025UhxfWjGrR9CvLD5RjUMIYaHD37AYqu5j2pIgbQkT7K0tPgj
 VLF5jDsSsKBjTvu5KBG5KLlS8w==
X-Google-Smtp-Source: ABdhPJy/d8s2887ufCuc62214Nvv1BektY4zjKTu/arCogjXCRDEpuyLUIGwPdFqdI23mNRuLRdaqw==
X-Received: by 2002:ac2:569e:: with SMTP id 30mr2756171lfr.322.1628151787049; 
 Thu, 05 Aug 2021 01:23:07 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id w10sm440434lfa.66.2021.08.05.01.23.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Aug 2021 01:23:06 -0700 (PDT)
Subject: Re: [PATCH -next v2] drm/msm: Use list_move_tail instead of
 list_del/list_add_tail in msm_gem.c
To: Baokun Li <libaokun1@huawei.com>, linux-kernel@vger.kernel.org,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Cc: weiyongjun1@huawei.com, yuehaibing@huawei.com, yangjihong1@huawei.com,
 yukuai3@huawei.com, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 kernel-janitors@vger.kernel.org, Hulk Robot <hulkci@huawei.com>
References: <20210609072838.1369371-1-libaokun1@huawei.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <0ac0b93f-65f6-930b-a224-12ebf919ad9d@linaro.org>
Date: Thu, 5 Aug 2021 11:23:05 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210609072838.1369371-1-libaokun1@huawei.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
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

On 09/06/2021 10:28, Baokun Li wrote:
> Using list_move_tail() instead of list_del() + list_add_tail() in msm_gem.c.
> 
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Baokun Li <libaokun1@huawei.com>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
> V1->V2:
> 	CC mailist
> 
>   drivers/gpu/drm/msm/msm_gem.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
> index 1865919368f2..5b7d63d3750a 100644
> --- a/drivers/gpu/drm/msm/msm_gem.c
> +++ b/drivers/gpu/drm/msm/msm_gem.c
> @@ -854,8 +854,7 @@ void msm_gem_active_get(struct drm_gem_object *obj, struct msm_gpu *gpu)
>   		mutex_lock(&priv->mm_lock);
>   		if (msm_obj->evictable)
>   			mark_unevictable(msm_obj);
> -		list_del(&msm_obj->mm_list);
> -		list_add_tail(&msm_obj->mm_list, &gpu->active_list);
> +		list_move_tail(&msm_obj->mm_list, &gpu->active_list);
>   		mutex_unlock(&priv->mm_lock);
>   	}
>   }
> 


-- 
With best wishes
Dmitry
