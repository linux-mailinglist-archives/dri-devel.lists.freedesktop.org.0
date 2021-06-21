Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D88393AEBDC
	for <lists+dri-devel@lfdr.de>; Mon, 21 Jun 2021 16:57:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AFD56E1A5;
	Mon, 21 Jun 2021 14:57:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D65376E1B3
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jun 2021 14:57:02 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id f15so4581388wro.8
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jun 2021 07:57:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=g68Ws2VnmzGyW1cBPGZ/o0J8y6ARMnbbGRWOqQlEJxs=;
 b=X2IDfkIxbJ0s9+Q1ArBqGcjp3kz+7gAVl0w13GT6k6EA6jg2uckMyzEBwTy1Y3EZR9
 Hj+NfiAGxH5x1ae41S2f/2DgkOcdDg0UqD2GlPW8FOFXD9qSRGucEO0P07x4xT9T1pZC
 iJhOT9X29snbBR4l3KFCBLIpYh9YVRF8dVMCI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=g68Ws2VnmzGyW1cBPGZ/o0J8y6ARMnbbGRWOqQlEJxs=;
 b=YHstFCiwTI0BDi2v820uA3XVSfYYbTNWMgJY9l2ByKHAVA6bChLXAwHuHlNHAfHwCw
 gkvZjTD7rv2Fg4ayFo5Rs62gYxknCc3b9OZQ6CtIqem4lgaFKKrRQ/W660HjkmLIFORX
 QQTfqtkqelrmdHdWH3JgUWOMbxOGADnys32RhBhHusKeioTiK8dWM/H2VxcnQS9d+Dm6
 aW9n2kv3YxzzZh+rSKMEUaPV+8kj4FftiwTo3Tazm9luAezVJdaJA6VbqUlsW3Jp2MF0
 8fAbxnspSJL8iIqEf/7fC5Wh0Q0kbfZktiNPqXUxEReoannbP2vSHFzBUzJjMNZcqX46
 V5kg==
X-Gm-Message-State: AOAM532ICYITcC7C9x4cKQadhTc/UtmeOaqrJCczD6qPhEvv74+VdKCH
 MX8LZeIZ/tslhPQT/dxAIL/P5A==
X-Google-Smtp-Source: ABdhPJwrnsvpBjyEgrZBds+k7kVQd87VKPDVal9OWYtORo8ETKQeuXpXpFPGVmSN6e3iRAghKh8gFg==
X-Received: by 2002:a05:6000:1203:: with SMTP id
 e3mr28555873wrx.107.1624287421564; 
 Mon, 21 Jun 2021 07:57:01 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id k5sm17931075wmk.11.2021.06.21.07.57.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Jun 2021 07:57:01 -0700 (PDT)
Date: Mon, 21 Jun 2021 16:56:59 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [PATCH 3/3] drm/amdgpu: wait for moving fence after pinning
Message-ID: <YNCouxCGTBCq6hl+@phenom.ffwll.local>
References: <20210621130328.11070-1-christian.koenig@amd.com>
 <20210621130328.11070-3-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210621130328.11070-3-christian.koenig@amd.com>
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
Cc: daniel.vetter@ffwll.ch, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jun 21, 2021 at 03:03:28PM +0200, Christian König wrote:
> We actually need to wait for the moving fence after pinning
> the BO to make sure that the pin is completed.
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>
> CC: stable@kernel.org
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c | 14 +++++++++++++-
>  1 file changed, 13 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
> index baa980a477d9..37ec59365080 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
> @@ -214,9 +214,21 @@ static int amdgpu_dma_buf_pin(struct dma_buf_attachment *attach)
>  {
>  	struct drm_gem_object *obj = attach->dmabuf->priv;
>  	struct amdgpu_bo *bo = gem_to_amdgpu_bo(obj);
> +	int r;
>  
>  	/* pin buffer into GTT */
> -	return amdgpu_bo_pin(bo, AMDGPU_GEM_DOMAIN_GTT);
> +	r = amdgpu_bo_pin(bo, AMDGPU_GEM_DOMAIN_GTT);
> +	if (r)
> +		return r;
> +
> +	if (bo->tbo.moving) {

dma-buf.c guarantees we have the reservation here, so we're fine.

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> +		r = dma_fence_wait(bo->tbo.moving, true);
> +		if (r) {
> +			amdgpu_bo_unpin(bo);
> +			return r;
> +		}
> +	}
> +	return 0;
>  }
>  
>  /**
> -- 
> 2.25.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
