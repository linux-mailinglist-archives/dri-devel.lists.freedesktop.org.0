Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D385220340F
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jun 2020 11:55:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C205B6E165;
	Mon, 22 Jun 2020 09:55:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 782F86E15A
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jun 2020 09:55:29 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id l11so16015934wru.0
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jun 2020 02:55:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=q5LJPqagiU0zu76gLT0Rc2+3L2QIPLyD8VTMU4dbCpQ=;
 b=TocVquN1kf64v6aUVsbHpKh0A/uqd0DqNFvgZCWUQKE1Ed5BbbrFqZWvDtdyI1RxQ6
 gNTwYorVyqD+DAlD6d4bdQBSGdJS2fP543utFjG0CxV9enJ41sD2hpE1BvXZYztkQktT
 midUMaOgoxNj5GpscEw0yHDL8+G0E8aFED6xA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=q5LJPqagiU0zu76gLT0Rc2+3L2QIPLyD8VTMU4dbCpQ=;
 b=SgZWWNYrN4yZyjALd+WvQlT/GlmsNS6ifGit1yrphHiQIcszisdkyC5faX5Rv3lGfE
 jO55n31jYuad/A6KVI4SgBvAeGPYy5GnnswKXQRfSnkGslX0gmao0fNwfynBjnQ7x/nL
 QsQw0f/8Y/Q76YT15V8LZi4b1DusJkjhb60ohJ2rfhZRQ96pluVP2ST0bqd6f/2OCp91
 5BGmJ/uQjjn7iolLp0xlLQjqGgHUy3rKoKJJWWtf8JvIFnKAMFDb0a+SQOrKScX/aE+n
 BIi0YIulDVhXHkNwJoj7Jj9FgZfQq2Qb6FUkVx9kUXu9Sym0N25QtqU7z2gxObje9R8Y
 MgvA==
X-Gm-Message-State: AOAM5329ipWdL7BYtX1cUQO/mOFIDVk7rKg0aQQUYDdz1h7xwaylC8ZZ
 XmrGYdMndKHM1lmnp6CfsCEHfw==
X-Google-Smtp-Source: ABdhPJypNAKJ1GDRaCqbxeL78reScNhAZ3tM2/L/jOlNdlYr7ZmIMMX3dHqk7j4Ru/+6mN6Cbh0paA==
X-Received: by 2002:a5d:4dc2:: with SMTP id f2mr18527719wru.399.1592819728141; 
 Mon, 22 Jun 2020 02:55:28 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id a22sm2958129wmb.4.2020.06.22.02.55.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Jun 2020 02:55:27 -0700 (PDT)
Date: Mon, 22 Jun 2020 11:55:25 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
Subject: Re: [PATCH v2 7/8] drm/amdgpu: Fix sdma code crash post device unplug
Message-ID: <20200622095525.GG20149@phenom.ffwll.local>
References: <1592719388-13819-1-git-send-email-andrey.grodzovsky@amd.com>
 <1592719388-13819-8-git-send-email-andrey.grodzovsky@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1592719388-13819-8-git-send-email-andrey.grodzovsky@amd.com>
X-Operating-System: Linux phenom 5.6.0-1-amd64 
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
Cc: daniel.vetter@ffwll.ch, michel@daenzer.net, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, ckoenig.leichtzumerken@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Jun 21, 2020 at 02:03:07AM -0400, Andrey Grodzovsky wrote:
> entity->rq becomes null aftre device unplugged so just return early
> in that case.
> 
> Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>

That looks very deep in amdgpu internals ... how do you even get in here
after the device is fully unplugged on the sw side?

Is this amdkfd doing something stupid because entirely unaware of what
amdgpu has done? Something else? Just feels like this is just duct-taping
over a more fundamental problem, after hotunplug no one should be able to
even submit anything new, or do bo moves, or well anything really.
-Daniel

> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c | 21 ++++++++++++++++-----
>  1 file changed, 16 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c
> index 8d9c6fe..d252427 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c
> @@ -24,6 +24,7 @@
>  #include "amdgpu_job.h"
>  #include "amdgpu_object.h"
>  #include "amdgpu_trace.h"
> +#include <drm/drm_drv.h>
>  
>  #define AMDGPU_VM_SDMA_MIN_NUM_DW	256u
>  #define AMDGPU_VM_SDMA_MAX_NUM_DW	(16u * 1024u)
> @@ -94,7 +95,12 @@ static int amdgpu_vm_sdma_commit(struct amdgpu_vm_update_params *p,
>  	struct drm_sched_entity *entity;
>  	struct amdgpu_ring *ring;
>  	struct dma_fence *f;
> -	int r;
> +	int r, idx;
> +
> +	if (!drm_dev_enter(p->adev->ddev, &idx)) {
> +		r = -ENODEV;
> +		goto nodev;
> +	}
>  
>  	entity = p->immediate ? &p->vm->immediate : &p->vm->delayed;
>  	ring = container_of(entity->rq->sched, struct amdgpu_ring, sched);
> @@ -104,7 +110,7 @@ static int amdgpu_vm_sdma_commit(struct amdgpu_vm_update_params *p,
>  	WARN_ON(ib->length_dw > p->num_dw_left);
>  	r = amdgpu_job_submit(p->job, entity, AMDGPU_FENCE_OWNER_VM, &f);
>  	if (r)
> -		goto error;
> +		goto job_fail;
>  
>  	if (p->unlocked) {
>  		struct dma_fence *tmp = dma_fence_get(f);
> @@ -118,10 +124,15 @@ static int amdgpu_vm_sdma_commit(struct amdgpu_vm_update_params *p,
>  	if (fence && !p->immediate)
>  		swap(*fence, f);
>  	dma_fence_put(f);
> -	return 0;
>  
> -error:
> -	amdgpu_job_free(p->job);
> +	r = 0;
> +
> +job_fail:
> +	drm_dev_exit(idx);
> +nodev:
> +	if (r)
> +		amdgpu_job_free(p->job);
> +
>  	return r;
>  }
>  
> -- 
> 2.7.4
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
