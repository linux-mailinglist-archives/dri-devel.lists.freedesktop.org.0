Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BFF845DDE1
	for <lists+dri-devel@lfdr.de>; Thu, 25 Nov 2021 16:47:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B997F6EAB7;
	Thu, 25 Nov 2021 15:47:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87ED86EAB4
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Nov 2021 15:47:27 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id i5so12588549wrb.2
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Nov 2021 07:47:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=GrYTK8K69bBPxxO0M+FvuVC8uOT906Mq4gG8ozU4uk4=;
 b=d3wDvLB9aibDUksaMaJq0BzCsxenfX7o/qh4G09m6w3hGehD+WLtkdEKOfV/7xmM4p
 o1alxzNE3KLzxu4Ad0ohpwHVVU1k6iqQd5mAQ6qjNGXOdwNMEZBir978i8nB25cdn6JY
 n2oFt7seHvCaEi8DaO6BIa6O8e0mZYu8KAOKU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=GrYTK8K69bBPxxO0M+FvuVC8uOT906Mq4gG8ozU4uk4=;
 b=x+V8ozq+DN228lfDntcDDrGb7/68yrSQ357Bz1hucYJAgvaL4cNqxRuUWodM72+gjm
 Tp+R+fbL4XoN7t0G0kOVGlQXWO1gzrTqYobrOk2RmSHn2ANoZaI3CUVS3yH6RruvKlB2
 GKMImH70jd1QCTHud9UeQ2aN2GF1k7JkCd+svuFJbrGwy7Qq6pGpHknYNS8NgSO6z32Y
 0RHMbTFBZm8P0LGa7mFVMGNd0PzftQ48gjafZ03WpSSQTBOvWhT4JMf1GToClvGWtEfc
 QJbaWOJtpGWznMXk8UCU2idGPp+syILwVAY4DsGMcB3+J/nMZK1jfrxWe9oW+alxEpgg
 ALTA==
X-Gm-Message-State: AOAM533WL12C1am9SWtChimNXrWxvK7EQtXvab64IeKMo2jCUWgTjNfV
 r0/X+YFr702HiKzQP/8VI9NJeQ==
X-Google-Smtp-Source: ABdhPJyJKxgo85AFU7bZqlQKZR/U22Xtoer9r53DLE3Pttwt+lXpKP86T5A0OTOsLHUXdHbcZKm8Dw==
X-Received: by 2002:a5d:50c7:: with SMTP id f7mr7272141wrt.327.1637855246069; 
 Thu, 25 Nov 2021 07:47:26 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id f18sm3113464wre.7.2021.11.25.07.47.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Nov 2021 07:47:25 -0800 (PST)
Date: Thu, 25 Nov 2021 16:47:23 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [PATCH 19/26] drm: support more than one write fence in
 drm_gem_plane_helper_prepare_fb
Message-ID: <YZ+wCxjFSI4EAIvx@phenom.ffwll.local>
References: <20211123142111.3885-1-christian.koenig@amd.com>
 <20211123142111.3885-20-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211123142111.3885-20-christian.koenig@amd.com>
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

On Tue, Nov 23, 2021 at 03:21:04PM +0100, Christian König wrote:
> Use dma_resv_get_singleton() here to eventually get more than one write
> fence as single fence.

Yeah this is nice, atomic commit helpers not supporting multiple write
fences was really my main worry in this entire endeavour. Otherwise looks
all rather reasonable.

I'll try to find some review bandwidth, but would be really if you can
volunteer others too (especially making sure ttm drivers set the KERNEL
fences correctly in all cases).
-Daniel


> 
> Signed-off-by: Christian König <christian.koenig@amd.com>
> ---
>  drivers/gpu/drm/drm_gem_atomic_helper.c | 18 +++++++-----------
>  1 file changed, 7 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_gem_atomic_helper.c b/drivers/gpu/drm/drm_gem_atomic_helper.c
> index c3189afe10cb..9338ddb7edff 100644
> --- a/drivers/gpu/drm/drm_gem_atomic_helper.c
> +++ b/drivers/gpu/drm/drm_gem_atomic_helper.c
> @@ -143,25 +143,21 @@
>   */
>  int drm_gem_plane_helper_prepare_fb(struct drm_plane *plane, struct drm_plane_state *state)
>  {
> -	struct dma_resv_iter cursor;
>  	struct drm_gem_object *obj;
>  	struct dma_fence *fence;
> +	int ret;
>  
>  	if (!state->fb)
>  		return 0;
>  
>  	obj = drm_gem_fb_get_obj(state->fb, 0);
> -	dma_resv_iter_begin(&cursor, obj->resv, false);
> -	dma_resv_for_each_fence_unlocked(&cursor, fence) {
> -		/* TODO: Currently there should be only one write fence, so this
> -		 * here works fine. But drm_atomic_set_fence_for_plane() should
> -		 * be changed to be able to handle more fences in general for
> -		 * multiple BOs per fb anyway. */
> -		dma_fence_get(fence);
> -		break;
> -	}
> -	dma_resv_iter_end(&cursor);
> +	ret = dma_resv_get_singleton(obj->resv, false, &fence);
> +	if (ret)
> +		return ret;
>  
> +	/* TODO: drm_atomic_set_fence_for_plane() should be changed to be able
> +	 * to handle more fences in general for multiple BOs per fb.
> +	 */
>  	drm_atomic_set_fence_for_plane(state, fence);
>  	return 0;
>  }
> -- 
> 2.25.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
