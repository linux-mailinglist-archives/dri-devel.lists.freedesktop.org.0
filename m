Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 802343F9440
	for <lists+dri-devel@lfdr.de>; Fri, 27 Aug 2021 08:23:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5FBD6E8DC;
	Fri, 27 Aug 2021 06:23:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 111286E8DC;
 Fri, 27 Aug 2021 06:23:32 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id t15so2488039wrg.7;
 Thu, 26 Aug 2021 23:23:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-transfer-encoding:content-language;
 bh=DLKnT7OzLz6g63f7cL55oH+PnJmiCXdHzndIZL2NOls=;
 b=shlZqagPFfQMarpdhBFzOQlQZYJU9U8aq3LFK+yErt85yH7JtdE9dlJqzJ/B2rDl+C
 /dHBlC1SrOsPdcmCS+ip44D0b4U3vDmmXG1KHTiuvuzAdd8fc0TS0vcK839ADQ/MTNNH
 9AoMHpLYCCm4Gb2N9Ja4yHDnexXBGJsAoHa4ggK6WUFzWB8svGNd5hcTWNQ7C7spCKqT
 SDZjuW0zXpmkbi+3TqPL1EXa1iQNYByb0wjdioSxuLV04Cvm3vd2TOW81fKL1bjcN9Fm
 ctxE87jDyHvoORGStNqB2VnlEd1Bd+dEsJ/0gpwW8z1ivdea7ckT7wZGdscdCfRDOllj
 B9OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=DLKnT7OzLz6g63f7cL55oH+PnJmiCXdHzndIZL2NOls=;
 b=I/gA+VscEAa9ABWJ0266jNv6dMiaA1s1X5hsPaXKqmqpBr+zSjPws67COv8wJ+wm24
 rU68NnBk0wzWTncgzGp8ER/TMZYsm/QyB0JhrAOOVN0Fe5x5BD11w9C7uTBE6aLrHRBw
 Ibmck44IYTYPtfYPskPYA5s81NINDhoK+U4uEHbCX/HhDrrHer1Nx+y/ZnnwRitKFVnI
 ZWK5xfgaFE2Z9QPYLhNDhbVWoHL3GekML0lLoKJ+zfV51S6Gtx/CrXJY+smsQ9CGIAFZ
 dJGzoxFzqjYE9+40AOC6iEKinLEr2h4f/EPjXH8RracNaEIr1cF7coVncAxF8LkV4Bke
 GiIQ==
X-Gm-Message-State: AOAM530+6I7G74WHMyvPmfiHV7VNFBHNAMltQJ2Fkb6S1psrPHt7IpAX
 uYop3KIVU23Ximm/Xn9sgxDXhrbZ/oidOvkU
X-Google-Smtp-Source: ABdhPJxFtNMFQaaMMFjtBebQiBGybod/fq+RAOCB67dxwveKls0y00whSAZWnEh5KhHxLCgSm4PNNA==
X-Received: by 2002:a5d:470b:: with SMTP id y11mr8132108wrq.213.1630045410712; 
 Thu, 26 Aug 2021 23:23:30 -0700 (PDT)
Received: from [192.168.178.21] (p5b0ea1b5.dip0.t-ipconnect.de.
 [91.14.161.181])
 by smtp.gmail.com with ESMTPSA id r4sm9503088wmq.34.2021.08.26.23.23.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Aug 2021 23:23:30 -0700 (PDT)
Subject: Re: [PATCH v2 2/4] drm/ttm: Clear all DMA mappings on demand
To: Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
References: <20210826172708.229134-1-andrey.grodzovsky@amd.com>
 <20210826172708.229134-3-andrey.grodzovsky@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <8d8a9f74-10ac-978b-92fe-a5456f2a49fc@gmail.com>
Date: Fri, 27 Aug 2021 08:23:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210826172708.229134-3-andrey.grodzovsky@amd.com>
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



Am 26.08.21 um 19:27 schrieb Andrey Grodzovsky:
> Used by drivers supporting hot unplug to handle all
> DMA IOMMU group related dependencies before the group
> is removed during device removal and we try to access
> it after free when last device pointer from user space
> is dropped.
>
> Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
> ---
>   drivers/gpu/drm/ttm/ttm_device.c | 45 ++++++++++++++++++++++++++++++++
>   include/drm/ttm/ttm_device.h     |  1 +
>   2 files changed, 46 insertions(+)
>
> diff --git a/drivers/gpu/drm/ttm/ttm_device.c b/drivers/gpu/drm/ttm/ttm_device.c
> index 5f31acec3ad7..ea50aba13743 100644
> --- a/drivers/gpu/drm/ttm/ttm_device.c
> +++ b/drivers/gpu/drm/ttm/ttm_device.c
> @@ -245,3 +245,48 @@ void ttm_device_fini(struct ttm_device *bdev)
>   	ttm_global_release();
>   }
>   EXPORT_SYMBOL(ttm_device_fini);
> +
> +void ttm_device_clear_dma_mappings(struct ttm_device *bdev)
> +{
> +	struct ttm_resource_manager *man;
> +	struct ttm_buffer_object *bo;
> +	unsigned int i, j;
> +
> +	spin_lock(&bdev->lru_lock);
> +	for (i = TTM_PL_SYSTEM; i < TTM_NUM_MEM_TYPES; ++i) {
> +		man = ttm_manager_type(bdev, i);
> +		if (!man || !man->use_tt)
> +			continue;
> +
> +		while (!list_empty(&man->pinned)) {
> +			bo = list_first_entry(&man->pinned, struct ttm_buffer_object, lru);
> +			/* Take ref against racing releases once lru_lock is unlocked */
> +			ttm_bo_get(bo);

This should probably use ttm_bo_get_unless_zero() since it is possible 
that the BO is already cleaning up in another thread.

> +			list_del_init(&bo->lru);
> +			spin_unlock(&bdev->lru_lock);
> +
> +			if (bo->ttm)
> +				ttm_tt_destroy_common(bo->bdev, bo->ttm);

That needs to be ttm_tt_unpopulate() or otherwise we will mess up the 
statistics.

> +
> +			ttm_bo_put(bo);
> +			spin_lock(&bdev->lru_lock);
> +		}
> +
> +		for (j = 0; j < TTM_MAX_BO_PRIORITY; ++j) {
> +			while (!list_empty(&man->lru[j])) {
> +				bo = list_first_entry(&man->lru[j], struct ttm_buffer_object, lru);
> +				ttm_bo_get(bo);

Same here of course.

> +				list_del_init(&bo->lru);
> +				spin_unlock(&bdev->lru_lock);
> +
> +				if (bo->ttm)
> +					ttm_tt_destroy_common(bo->bdev, bo->ttm);.

Same here.

Christian.

> +
> +				ttm_bo_put(bo);
> +				spin_lock(&bdev->lru_lock);
> +			}
> +		}
> +	}
> +	spin_unlock(&bdev->lru_lock);
> +}
> +EXPORT_SYMBOL(ttm_device_clear_dma_mappings);
> diff --git a/include/drm/ttm/ttm_device.h b/include/drm/ttm/ttm_device.h
> index cd592f8e941b..d2837decb49a 100644
> --- a/include/drm/ttm/ttm_device.h
> +++ b/include/drm/ttm/ttm_device.h
> @@ -298,5 +298,6 @@ int ttm_device_init(struct ttm_device *bdev, struct ttm_device_funcs *funcs,
>   		    struct drm_vma_offset_manager *vma_manager,
>   		    bool use_dma_alloc, bool use_dma32);
>   void ttm_device_fini(struct ttm_device *bdev);
> +void ttm_device_clear_dma_mappings(struct ttm_device *bdev);
>   
>   #endif

