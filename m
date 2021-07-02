Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 582443BA62E
	for <lists+dri-devel@lfdr.de>; Sat,  3 Jul 2021 01:01:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F9536E214;
	Fri,  2 Jul 2021 23:01:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2D936E214
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Jul 2021 23:01:39 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 g8-20020a1c9d080000b02901f13dd1672aso6560309wme.0
 for <dri-devel@lists.freedesktop.org>; Fri, 02 Jul 2021 16:01:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=6lovVmp0HGkxn/RftMP3PYId6d3dyTdIpYobQdwEghQ=;
 b=awhVYyVI7D5eSkzNXi2CKmpmzlzlJz22dLZ8NS18EQmDXlmndGwtCljDImMC0n4+i0
 G4IRBV2Kct7pqTtrHiykj8M+C5E5awqMeR1EbbkqSoQSlihReG7K65SuInP6ziM6t7Ge
 fIZUmi7W7IiVhKnbt81ZX8dLWUPfWS6l7/UBo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=6lovVmp0HGkxn/RftMP3PYId6d3dyTdIpYobQdwEghQ=;
 b=XsTSDc1zeLCEhDMQchP9P1V3RTmCEcVGRkiUZgQZeuHv1+gIr7qqK3E+xolwli5c+u
 8oUdFbNK6KyE7HNzlzNmkBxRuAyIOkmBtYR0J8qlomkYWmNNYE0nJa3KaKkIQYl1w4e7
 Xx29PGMuwJENkMPLXefseYr4ywpTV7U10jMIuoZz8KeauffvwAJSFFN4FBdag15ks0dy
 aXp0OTw3WhFmm9vh8Ggz/GxV8fI2VWni2vKTWG6UqzfVjnGo5VYWKk5N2pSJk9YPi6mV
 /FspAaVhf3Tg0vpfZwH0KioYSmy/s73s9C61Cm0QN+ZXO6o5T1sOJCfO34znnDDc1vdD
 TMnQ==
X-Gm-Message-State: AOAM533WrI94pW0HwUtEDq57AEbh5W1V6gh4tVAbkcgiHSrCZU60+0P8
 a0/pKPNG6adgQ1cHNH4c+IgdUg==
X-Google-Smtp-Source: ABdhPJz1uwLJSFypFbOnzpr3u5+N4Kh1RafJC1pecYRtRYd9UEXM6VRIPl44zjoyEnXiY8taKQczcQ==
X-Received: by 2002:a7b:cb1a:: with SMTP id u26mr2097420wmj.125.1625266898330; 
 Fri, 02 Jul 2021 16:01:38 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id k14sm4281930wmr.29.2021.07.02.16.01.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Jul 2021 16:01:37 -0700 (PDT)
Date: Sat, 3 Jul 2021 01:01:36 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [PATCH 4/4] drm/msm: always wait for the exclusive fence
Message-ID: <YN+a0NY8jB54zIes@phenom.ffwll.local>
References: <20210702111642.17259-1-christian.koenig@amd.com>
 <20210702111642.17259-5-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210702111642.17259-5-christian.koenig@amd.com>
X-Operating-System: Linux phenom 5.10.0-7-amd64 
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
Cc: daniel.vetter@ffwll.ch, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jul 02, 2021 at 01:16:42PM +0200, Christian König wrote:
> Drivers also need to to sync to the exclusive fence when
> a shared one is present.
> 
> Completely untested since the driver won't even compile on !ARM.

It's really not that hard to set up a cross-compiler, reasonable distros
have that now all packages. Does explain though why you tend to break the
arm build with drm-misc patches.

Please fix this.

> Signed-off-by: Christian König <christian.koenig@amd.com>

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> ---
>  drivers/gpu/drm/msm/msm_gem.c | 16 +++++++---------
>  1 file changed, 7 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
> index a94a43de95ef..72a07e311de3 100644
> --- a/drivers/gpu/drm/msm/msm_gem.c
> +++ b/drivers/gpu/drm/msm/msm_gem.c
> @@ -817,17 +817,15 @@ int msm_gem_sync_object(struct drm_gem_object *obj,
>  	struct dma_fence *fence;
>  	int i, ret;
>  
> -	fobj = dma_resv_shared_list(obj->resv);
> -	if (!fobj || (fobj->shared_count == 0)) {
> -		fence = dma_resv_excl_fence(obj->resv);
> -		/* don't need to wait on our own fences, since ring is fifo */
> -		if (fence && (fence->context != fctx->context)) {
> -			ret = dma_fence_wait(fence, true);
> -			if (ret)
> -				return ret;
> -		}
> +	fence = dma_resv_excl_fence(obj->resv);
> +	/* don't need to wait on our own fences, since ring is fifo */
> +	if (fence && (fence->context != fctx->context)) {
> +		ret = dma_fence_wait(fence, true);
> +		if (ret)
> +			return ret;
>  	}
>  
> +	fobj = dma_resv_shared_list(obj->resv);
>  	if (!exclusive || !fobj)
>  		return 0;
>  
> -- 
> 2.25.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
