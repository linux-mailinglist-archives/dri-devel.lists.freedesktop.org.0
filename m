Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B56AB3B15D3
	for <lists+dri-devel@lfdr.de>; Wed, 23 Jun 2021 10:29:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBCB06E873;
	Wed, 23 Jun 2021 08:29:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8662D6E873;
 Wed, 23 Jun 2021 08:29:00 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 h21-20020a1ccc150000b02901d4d33c5ca0so740342wmb.3; 
 Wed, 23 Jun 2021 01:29:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=iGLnjprEGYlXcZhGs3cEjGPCgjZd4lu1pdphqPFGrAk=;
 b=hn1OT7a5ErM/BbqDEIhwJUJXm3D4BDwroSHwOULWH9DyBhUnIxxRh926G+SbboAtsc
 EsMv6KyZCLphhKupf5CNk44+SRwx9/GGYbKBjyi7HfKI+xzYSlXXDgPC1kIQxV76gi8Z
 gKWwPWoT4HeAeuAMXgz96Ajn1FFHiT5MjEDXk0EEFfdJReK89CWoCpfbt2KekI0NbIr+
 GloRkEyh5R9KUnTbGU6YygsiBtro4kRzseZsBgu4SArtQ8BZjUvYG4Iax93ci7373Mii
 iS4Bu2w7/UqaXSqA2LMMjviO8d79wsxz0S5/kqQ7Y9ww4OM+zb7z0cy13w0W6YJj0fLu
 XFNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=iGLnjprEGYlXcZhGs3cEjGPCgjZd4lu1pdphqPFGrAk=;
 b=V+EXle5FojVk3IiXl61qlTPe8inTI24AjAat7/rr50AYa+M7ltegWvewDOuLSx6AHv
 BttPT75v/8ReibnBV/MplI8pqUCRlqPyUudzSsyqr5Bw58Egr4h6/s+KbW+o309NQ6UI
 hGIgs1G5aDMBB0uxesb07ZPDvaANF4+hyTpHCJFxOGGlqVxa8Z19IY1KPQq1BPJVEqjj
 WV3oFqftovi88zMyiJIkznin/d2xQ2mwDNwrpJAr3CRIdjNiVyI2L40LUnykJpQvg0Ea
 PT4NlDBk0nw6YGsLvIHINw+lQUCnqtv0A5jO3yUWBobypP3IFpMKtvLPoMZRD3THnzT1
 93RA==
X-Gm-Message-State: AOAM533p2a4paf29C644l7Uy9C733LCtFoGQVD2EWPTIMYHehDOZfoP8
 XSubhqKRpJfHfJ/rowL1K8M=
X-Google-Smtp-Source: ABdhPJy0daVOZ0ZzvkGD8uQj/iFySMHissc7mUK18SsdoNhhNOswCLaQqFyTlA5VruYHtSG4OdzYNA==
X-Received: by 2002:a1c:a406:: with SMTP id n6mr9408542wme.130.1624436939248; 
 Wed, 23 Jun 2021 01:28:59 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:69e4:a619:aa86:4e9c?
 ([2a02:908:1252:fb60:69e4:a619:aa86:4e9c])
 by smtp.gmail.com with ESMTPSA id y4sm2048949wrw.71.2021.06.23.01.28.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Jun 2021 01:28:58 -0700 (PDT)
Subject: Re: [PATCH 6/6] drm/ttm: Fix multihop assert on eviction.
To: Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
References: <20210622162339.761651-1-andrey.grodzovsky@amd.com>
 <20210622162339.761651-6-andrey.grodzovsky@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <8172566c-82e5-3490-13e1-cf3e6f0839a8@gmail.com>
Date: Wed, 23 Jun 2021 10:28:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210622162339.761651-6-andrey.grodzovsky@amd.com>
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
Cc: Lang.Yu@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 22.06.21 um 18:23 schrieb Andrey Grodzovsky:
> Problem:
> Under memory pressure when GTT domain is almost full multihop assert
> will come up when trying to evict LRU BO from VRAM to SYSTEM.
>
> Fix:
> Don't assert on multihop error in evict code but rather do a retry
> as we do in ttm_bo_move_buffer
>
> Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>

Reviewed-by: Christian König <christian.koenig@amd.com>

But I think you need to move this patch earlier in the series or 
otherwise you break amdgpu eviction in between.

Christian.

> ---
>   drivers/gpu/drm/ttm/ttm_bo.c | 63 +++++++++++++++++++-----------------
>   1 file changed, 34 insertions(+), 29 deletions(-)
>
> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
> index 45145d02aed2..5a2dc712c632 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
> @@ -485,6 +485,31 @@ void ttm_bo_unlock_delayed_workqueue(struct ttm_device *bdev, int resched)
>   }
>   EXPORT_SYMBOL(ttm_bo_unlock_delayed_workqueue);
>   
> +static int ttm_bo_bounce_temp_buffer(struct ttm_buffer_object *bo,
> +				     struct ttm_resource **mem,
> +				     struct ttm_operation_ctx *ctx,
> +				     struct ttm_place *hop)
> +{
> +	struct ttm_placement hop_placement;
> +	struct ttm_resource *hop_mem;
> +	int ret;
> +
> +	hop_placement.num_placement = hop_placement.num_busy_placement = 1;
> +	hop_placement.placement = hop_placement.busy_placement = hop;
> +
> +	/* find space in the bounce domain */
> +	ret = ttm_bo_mem_space(bo, &hop_placement, &hop_mem, ctx);
> +	if (ret)
> +		return ret;
> +	/* move to the bounce domain */
> +	ret = ttm_bo_handle_move_mem(bo, hop_mem, false, ctx, NULL);
> +	if (ret) {
> +		ttm_resource_free(bo, &hop_mem);
> +		return ret;
> +	}
> +	return 0;
> +}
> +
>   static int ttm_bo_evict(struct ttm_buffer_object *bo,
>   			struct ttm_operation_ctx *ctx)
>   {
> @@ -524,12 +549,17 @@ static int ttm_bo_evict(struct ttm_buffer_object *bo,
>   		goto out;
>   	}
>   
> +bounce:
>   	ret = ttm_bo_handle_move_mem(bo, evict_mem, true, ctx, &hop);
> -	if (unlikely(ret)) {
> -		WARN(ret == -EMULTIHOP, "Unexpected multihop in eviction - likely driver bug\n");
> -		if (ret != -ERESTARTSYS)
> +	if (ret == -EMULTIHOP) {
> +		ret = ttm_bo_bounce_temp_buffer(bo, &evict_mem, ctx, &hop);
> +		if (ret) {
>   			pr_err("Buffer eviction failed\n");
> -		ttm_resource_free(bo, &evict_mem);
> +			ttm_resource_free(bo, &evict_mem);
> +			goto out;
> +		}
> +		/* try and move to final place now. */
> +		goto bounce;
>   	}
>   out:
>   	return ret;
> @@ -844,31 +874,6 @@ int ttm_bo_mem_space(struct ttm_buffer_object *bo,
>   }
>   EXPORT_SYMBOL(ttm_bo_mem_space);
>   
> -static int ttm_bo_bounce_temp_buffer(struct ttm_buffer_object *bo,
> -				     struct ttm_resource **mem,
> -				     struct ttm_operation_ctx *ctx,
> -				     struct ttm_place *hop)
> -{
> -	struct ttm_placement hop_placement;
> -	struct ttm_resource *hop_mem;
> -	int ret;
> -
> -	hop_placement.num_placement = hop_placement.num_busy_placement = 1;
> -	hop_placement.placement = hop_placement.busy_placement = hop;
> -
> -	/* find space in the bounce domain */
> -	ret = ttm_bo_mem_space(bo, &hop_placement, &hop_mem, ctx);
> -	if (ret)
> -		return ret;
> -	/* move to the bounce domain */
> -	ret = ttm_bo_handle_move_mem(bo, hop_mem, false, ctx, NULL);
> -	if (ret) {
> -		ttm_resource_free(bo, &hop_mem);
> -		return ret;
> -	}
> -	return 0;
> -}
> -
>   static int ttm_bo_move_buffer(struct ttm_buffer_object *bo,
>   			      struct ttm_placement *placement,
>   			      struct ttm_operation_ctx *ctx)

