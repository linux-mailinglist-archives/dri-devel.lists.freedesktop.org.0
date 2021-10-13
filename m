Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B1DE42C214
	for <lists+dri-devel@lfdr.de>; Wed, 13 Oct 2021 16:06:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E43CF6E0D0;
	Wed, 13 Oct 2021 14:06:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E90BA6EA22
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Oct 2021 14:06:13 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id o20so8883348wro.3
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Oct 2021 07:06:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=cIG68W/tQJNgWN+jsVPFh0cg8v247trbObwIJoHes/8=;
 b=HEbyI7lPjO/SeLtFv2N47Myw4+qpe2RXDpO6C1fJpiGMP64+S8rRjTdQr/nN9d9NXo
 xiNpscMX/s53q1YD3kWt5GT/kePPKjZRRrSh5fJYmpjvk/kGhEF0ekf5a2uG+AhQNEhy
 vr6CeyNj14gersIusRRdOLU0D9Vw18z/uenPA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=cIG68W/tQJNgWN+jsVPFh0cg8v247trbObwIJoHes/8=;
 b=ytAaDIQCXN8cNKq9R6V39zJsv/46tqmLyQdF+/F2axKkV0IaMGyjxVb8QEmUgE2YMq
 6A8isSoiAknlb/w+Uhl8zkvpcPpfFgslt5NDtYZ5UdRnVl3xziD6Od7PuFzllrkbUVVQ
 wPiHV0VeRHXKgmorXogCDemiQsWnEJ1lBoSbgS6fLd12vAI6L6JIUvPfu2/c2wfr+xww
 mRUcE3VxKjGG3AjE8jxCpm+OJXl9Wn2YbVBfVSay8/QiVmqmcj3dHzMntEN24qaiY0T1
 xt8DSiUJqS9OEGX9nj/tsGttXgEC36OtBUuaSApAFsWFYStnH/H62G1kSZpm/LIjTx6/
 CXXA==
X-Gm-Message-State: AOAM533O/2nGEz7v28f2ydEqkGkQ3k108wuEPj9HB4TOtf7YVV3ffRu0
 24TnVKEyh0Tmec/k9rRUdh/pgw==
X-Google-Smtp-Source: ABdhPJwjgQ0DiXTrs41jVl5BYH6DQcXR5MUd9Sxq+V+NNJmQjSNclYZi7GSa7EEkZ0U+lattZFKFBQ==
X-Received: by 2002:adf:a183:: with SMTP id u3mr40196310wru.330.1634133972353; 
 Wed, 13 Oct 2021 07:06:12 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id e16sm11711795wrw.17.2021.10.13.07.06.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Oct 2021 07:06:11 -0700 (PDT)
Date: Wed, 13 Oct 2021 16:06:10 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Cc: linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 daniel@ffwll.ch, tvrtko.ursulin@linux.intel.com
Subject: Re: [PATCH 11/28] drm/amdgpu: use the new iterator in amdgpu_sync_resv
Message-ID: <YWbn0hZQgYAohsrz@phenom.ffwll.local>
References: <20211005113742.1101-1-christian.koenig@amd.com>
 <20211005113742.1101-12-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211005113742.1101-12-christian.koenig@amd.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Oct 05, 2021 at 01:37:25PM +0200, Christian König wrote:
> Simplifying the code a bit.
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

Yeah these iterators rock :-)
-Daniel

> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c | 44 ++++++++----------------
>  1 file changed, 14 insertions(+), 30 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c
> index 862eb3c1c4c5..f7d8487799b2 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c
> @@ -252,41 +252,25 @@ int amdgpu_sync_resv(struct amdgpu_device *adev, struct amdgpu_sync *sync,
>  		     struct dma_resv *resv, enum amdgpu_sync_mode mode,
>  		     void *owner)
>  {
> -	struct dma_resv_list *flist;
> +	struct dma_resv_iter cursor;
>  	struct dma_fence *f;
> -	unsigned i;
> -	int r = 0;
> +	int r;
>  
>  	if (resv == NULL)
>  		return -EINVAL;
>  
> -	/* always sync to the exclusive fence */
> -	f = dma_resv_excl_fence(resv);
> -	dma_fence_chain_for_each(f, f) {
> -		struct dma_fence_chain *chain = to_dma_fence_chain(f);
> -
> -		if (amdgpu_sync_test_fence(adev, mode, owner, chain ?
> -					   chain->fence : f)) {
> -			r = amdgpu_sync_fence(sync, f);
> -			dma_fence_put(f);
> -			if (r)
> -				return r;
> -			break;
> -		}
> -	}
> -
> -	flist = dma_resv_shared_list(resv);
> -	if (!flist)
> -		return 0;
> -
> -	for (i = 0; i < flist->shared_count; ++i) {
> -		f = rcu_dereference_protected(flist->shared[i],
> -					      dma_resv_held(resv));
> -
> -		if (amdgpu_sync_test_fence(adev, mode, owner, f)) {
> -			r = amdgpu_sync_fence(sync, f);
> -			if (r)
> -				return r;
> +	dma_resv_for_each_fence(&cursor, resv, true, f) {
> +		dma_fence_chain_for_each(f, f) {
> +			struct dma_fence_chain *chain = to_dma_fence_chain(f);
> +
> +			if (amdgpu_sync_test_fence(adev, mode, owner, chain ?
> +						   chain->fence : f)) {
> +				r = amdgpu_sync_fence(sync, f);
> +				dma_fence_put(f);
> +				if (r)
> +					return r;
> +				break;
> +			}
>  		}
>  	}
>  	return 0;
> -- 
> 2.25.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
