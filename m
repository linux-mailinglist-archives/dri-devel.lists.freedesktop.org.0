Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B45233F4955
	for <lists+dri-devel@lfdr.de>; Mon, 23 Aug 2021 13:05:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D953089ACC;
	Mon, 23 Aug 2021 11:05:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7880589ACC
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Aug 2021 11:05:05 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id f5so25612237wrm.13
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Aug 2021 04:05:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=mMN4/LqdNkBkO8MGmUyNcMBgqi2EutDIxWJzBZnk49M=;
 b=vEGyyHRk85DpbeAz1Kovj7RM0IfNSU5fHHkanUAkCx6QdECXT3lS8Dgm/pjsz4bMzL
 Tpj8ofMQvXnDe+1QyBaE8fxJWHbsV9CwzJb/WId52HDKgmAIQs3NQX6XNYQKXHUKFF2F
 Q1FHf0fujcTNJRC4HuyiNmyBwhqFVuKEWaVUXYcXHjQOK/niTWHq2j+Lw+AlaNKi2jnC
 HuNa/mBN/6fvCAUP1dUbRBsmejtSdXaHVBcetiXAsqENYnHyh5wSEtwyj9KClrcg0lkf
 WZYLdTNW9ZMBG20/Bsgdtsk7ZfMuhQmydxNtkYhpG+u4aFbouAQ71cjR/lsZq1Ci/myO
 s/4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=mMN4/LqdNkBkO8MGmUyNcMBgqi2EutDIxWJzBZnk49M=;
 b=clTM+9AJV4oM5iD2G9f/miTQ7wUHRyOWAWIcjFImiPX365N1WmkLM4Itbi2OvjBydV
 fOO+Hb4umWHNFQPSK6Bai2WjjPnkBS2llgQk5UGuBs5Kj8VfSFMnKhhDWzj4yC8iaLx3
 VYoDHX1UhIDXMoGKFtoiFZs+iVU+at0UG/W/mfpE2o1MTvqBoLJ9I3Ag4QeLsjMFbDwS
 Len/BzxEpAZ8wP7MNvZ8fLj1Ar3ZgcOSgbldEB9G0VSvfx6hV5Tbe0j2q40pYG57pY43
 qK3jIg/Nn8Pq9pQuUdrZ8RFr9CHAUsP9E5DZQHdbiottVNFSpYX250luNEE+jc/IqjxU
 /Zsw==
X-Gm-Message-State: AOAM532AviRWzO9KPtKXPArvu4HpsbnE4C+7xR6IvyQWUzoyFfM5oIWv
 QnWcPg5SH+oe76vTIE23wyo=
X-Google-Smtp-Source: ABdhPJyffX8TRGQfb1WNnCr8pAfQH7EDA+Tpf3ThghKNxGZYrQfSD4kCZb8qvAP4fmnuctyuhkZCMA==
X-Received: by 2002:adf:fcc5:: with SMTP id f5mr13289290wrs.114.1629716703978; 
 Mon, 23 Aug 2021 04:05:03 -0700 (PDT)
Received: from [192.168.178.21] (p5b0ea1b5.dip0.t-ipconnect.de.
 [91.14.161.181])
 by smtp.gmail.com with ESMTPSA id b4sm3961878wrp.33.2021.08.23.04.05.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Aug 2021 04:05:02 -0700 (PDT)
Subject: Re: [PATCH 1/5] drm/vmwgfx: unbind in vmw_ttm_unpopulate
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
To: daniel.vetter@ffwll.ch, airlied@gmail.com
Cc: dri-devel@lists.freedesktop.org,
 =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
References: <20210728130552.2074-1-christian.koenig@amd.com>
Message-ID: <eebf6fc4-c299-6aa7-f91c-16029c5c3444@gmail.com>
Date: Mon, 23 Aug 2021 13:05:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210728130552.2074-1-christian.koenig@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
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

Adding Thomas on CC as well.

Just a gentle ping. I think the patch set makes sense now.

Regards,
Christian.

Am 28.07.21 um 15:05 schrieb Christian König:
> Doing this in vmw_ttm_destroy() is to late.
>
> It turned out that this is not a good idea at all because it leaves pointers
> to freed up system memory pages in the GART tables of the drivers.
>
> Signed-off-by: Christian König <christian.koenig@amd.com>
> ---
>   drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c | 9 +++------
>   1 file changed, 3 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c b/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
> index b0973c27e774..904031d03dbe 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
> @@ -526,14 +526,9 @@ static void vmw_ttm_destroy(struct ttm_device *bdev, struct ttm_tt *ttm)
>   	struct vmw_ttm_tt *vmw_be =
>   		container_of(ttm, struct vmw_ttm_tt, dma_ttm);
>   
> -	vmw_ttm_unbind(bdev, ttm);
>   	ttm_tt_destroy_common(bdev, ttm);
>   	vmw_ttm_unmap_dma(vmw_be);
> -	if (vmw_be->dev_priv->map_mode == vmw_dma_alloc_coherent)
> -		ttm_tt_fini(&vmw_be->dma_ttm);
> -	else
> -		ttm_tt_fini(ttm);
> -
> +	ttm_tt_fini(ttm);
>   	if (vmw_be->mob)
>   		vmw_mob_destroy(vmw_be->mob);
>   
> @@ -578,6 +573,8 @@ static void vmw_ttm_unpopulate(struct ttm_device *bdev,
>   						 dma_ttm);
>   	unsigned int i;
>   
> +	vmw_ttm_unbind(bdev, ttm);
> +
>   	if (vmw_tt->mob) {
>   		vmw_mob_destroy(vmw_tt->mob);
>   		vmw_tt->mob = NULL;

