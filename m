Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E0A447D8FF
	for <lists+dri-devel@lfdr.de>; Wed, 22 Dec 2021 22:53:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2494010E30F;
	Wed, 22 Dec 2021 21:53:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED03910E30F
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Dec 2021 21:53:15 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id o6so13818050edc.4
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Dec 2021 13:53:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=yBDJCmeaT+tM7/3ZGzr3jqJyscYabJL4fOLvv95NZ8Y=;
 b=TeelYZqeWHWDKFtFiBJXZ1GpKy8D7JsVxszcrXd7AMSOFZpl42DDrNPK3nDh26/Oo0
 SMAzaLQYMD1NeJ/p/LUFyqlNeqeSp/0J0uXufjC7dI+QEwYV07GaUEjqoHQLHtYjPXwv
 vX6mP8otA5kQ1QmfpeaM93b5ZzGWMdzb1Bf9o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=yBDJCmeaT+tM7/3ZGzr3jqJyscYabJL4fOLvv95NZ8Y=;
 b=FhgJxu33UAri/bKgoY4oP03lJRKMfkdg2HWX/nkLro4eNqUCkUdYNsV0TmUJ0ApeOl
 qM1UULlrQwDMi099NMm/V2Erjn5q9twjqNrD+EVjzkwUWS6kJyjoWloD9KVq9yIFSVWR
 UeHokKZPjwY4tRqCerYSdzgf2FTjTw1nZQNvo6vbAuNspMgrzVj/QDEMdw9yah3CuRKk
 3M1iOycsJkIXqsgOu/jffACJUXONiERJ4cj7UiwnpAR5tBuZpKB4C+74VXWEbQUlOFUl
 ZnJyzvUm0bCF63FDRo0W8PMDp1NO2O1hBVbsioLSZdqKZS6ozVRTCZeTuwTILr5iHcUO
 GErg==
X-Gm-Message-State: AOAM531MblHscxhqyQ+jLsVwL2wmfuNMc5Kn0/apoX+enVV1nx9QKbuz
 +lSSvXzAZGmrXCj+0ofwUm1TdQ==
X-Google-Smtp-Source: ABdhPJwgrUJcT/9tjLzdw/pZnJlRl0CYKBxXTvQbO1TJ9r3hWHI/E/5nmcelnHOMi+EKS/8k3+U5xg==
X-Received: by 2002:a17:907:168b:: with SMTP id
 hc11mr4155613ejc.518.1640209994552; 
 Wed, 22 Dec 2021 13:53:14 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id qw20sm1110251ejc.185.2021.12.22.13.53.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Dec 2021 13:53:14 -0800 (PST)
Date: Wed, 22 Dec 2021 22:53:12 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [PATCH 17/24] drm/amdgpu: use dma_resv_get_singleton in
 amdgpu_pasid_free_cb
Message-ID: <YcOeSCEZ/MYqP1Sr@phenom.ffwll.local>
References: <20211207123411.167006-1-christian.koenig@amd.com>
 <20211207123411.167006-18-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211207123411.167006-18-christian.koenig@amd.com>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
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
Cc: linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Dec 07, 2021 at 01:34:04PM +0100, Christian König wrote:
> Makes the code a bit more simpler.
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ids.c | 23 +++--------------------
>  1 file changed, 3 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ids.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ids.c
> index be48487e2ca7..888d97143177 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ids.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ids.c
> @@ -107,36 +107,19 @@ static void amdgpu_pasid_free_cb(struct dma_fence *fence,
>  void amdgpu_pasid_free_delayed(struct dma_resv *resv,
>  			       u32 pasid)
>  {
> -	struct dma_fence *fence, **fences;
>  	struct amdgpu_pasid_cb *cb;
> -	unsigned count;
> +	struct dma_fence *fence;
>  	int r;
>  
> -	r = dma_resv_get_fences(resv, true, &count, &fences);
> +	r = dma_resv_get_singleton(resv, true, &fence);
>  	if (r)
>  		goto fallback;
>  
> -	if (count == 0) {
> +	if (!fence) {
>  		amdgpu_pasid_free(pasid);
>  		return;
>  	}
>  
> -	if (count == 1) {
> -		fence = fences[0];
> -		kfree(fences);
> -	} else {
> -		uint64_t context = dma_fence_context_alloc(1);
> -		struct dma_fence_array *array;
> -
> -		array = dma_fence_array_create(count, fences, context,
> -					       1, false);
> -		if (!array) {
> -			kfree(fences);
> -			goto fallback;
> -		}
> -		fence = &array->base;
> -	}
> -
>  	cb = kmalloc(sizeof(*cb), GFP_KERNEL);
>  	if (!cb) {
>  		/* Last resort when we are OOM */
> -- 
> 2.25.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
