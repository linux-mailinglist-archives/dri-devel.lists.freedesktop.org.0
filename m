Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A431A42C31F
	for <lists+dri-devel@lfdr.de>; Wed, 13 Oct 2021 16:27:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13A886EA2A;
	Wed, 13 Oct 2021 14:27:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02F7B6E874
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Oct 2021 14:27:50 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id t2so9042229wrb.8
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Oct 2021 07:27:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=PqWjk4ivgfgdmUTbUdhe8qKxTDFjMlzX5VtUne0kt9E=;
 b=MJO5DikINvlvxLDHZftSGsOfXYEtFQp5DFnLpJnWfwcehW3HSp/831g0ISMfNXuD7y
 EMdnTZHalFFzCw7XSg0hyLGN47MaVS0sM/Ke4a3SZ0ujhM5I/cpTvz90dOpmNp9PG0x6
 vz7VP07sh1yuIocTbqoAIxY52bOObOxD+1Yuo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=PqWjk4ivgfgdmUTbUdhe8qKxTDFjMlzX5VtUne0kt9E=;
 b=0PwqlNuy7yRheQMqijdoVlVeCRpgDHXRnuDxyM0fJJdIsNLvYsCZUdHOdgPuI32FZx
 GseeC5iSoBK2kyO6+IvWLEgPQ4Se3AFCVByOThC5oT/EtVZGS1IiEb2ZsHrTfb1iJ6Ij
 0UhVA2aqiHcPc9URvUj1qTTxDfIdlG9NfqilvkAR+mVZES24ekFptxl4nyxCFyhW91f1
 8O175U9pWPz8771cSkkqcuQJvjb9tZ+MbxlisM50pWkd3rp5d1YGBtJ7MucgrY9z9Aez
 ZOnXyBVw8SdYznX7XR+HlRuldNJNxCPuzCjzRwNp+mGozDPdo0f149M2sjFMcy2Vz+Ld
 8ozA==
X-Gm-Message-State: AOAM530jXvJdueuep2nJNXyIGopVsxgIulEJpPLXQ6KGzp/Y5eTVGyeh
 eiNVLbqQ0A8hrnCfcLGjhesqeg==
X-Google-Smtp-Source: ABdhPJx8QN6s6cVcK+URTSep+/bLRlSC2lp2+Mkp8t5DSQIxj3ntebiDoxR19oO22ez7dxmZpk0p0w==
X-Received: by 2002:a05:6000:1541:: with SMTP id
 1mr38961887wry.273.1634135268480; 
 Wed, 13 Oct 2021 07:27:48 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id u5sm5291752wmm.39.2021.10.13.07.27.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Oct 2021 07:27:48 -0700 (PDT)
Date: Wed, 13 Oct 2021 16:27:46 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Cc: linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 daniel@ffwll.ch, tvrtko.ursulin@linux.intel.com
Subject: Re: [PATCH 25/28] drm/nouveau: use the new iterator in
 nouveau_fence_sync
Message-ID: <YWbs4iA1oWq9xN5n@phenom.ffwll.local>
References: <20211005113742.1101-1-christian.koenig@amd.com>
 <20211005113742.1101-26-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211005113742.1101-26-christian.koenig@amd.com>
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

On Tue, Oct 05, 2021 at 01:37:39PM +0200, Christian König wrote:
> Simplifying the code a bit.
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>

A bit a trick conversion since the previous code was clever with the ret
handling in the loop, but looks correct.

Please mention in the commit message that this code now also waits for all
shared fences in all cases. Previously if we found an exclusive fence, we
bailed out. That needs to be recorded in the commit message, together with
an explainer that defacto too many other drivers have broken this rule
already, and so you have to always iterate all fences.

With that added:

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>


> ---
>  drivers/gpu/drm/nouveau/nouveau_fence.c | 48 +++++++------------------
>  1 file changed, 12 insertions(+), 36 deletions(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nouveau_fence.c b/drivers/gpu/drm/nouveau/nouveau_fence.c
> index 05d0b3eb3690..26f9299df881 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_fence.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_fence.c
> @@ -339,14 +339,15 @@ nouveau_fence_wait(struct nouveau_fence *fence, bool lazy, bool intr)
>  }
>  
>  int
> -nouveau_fence_sync(struct nouveau_bo *nvbo, struct nouveau_channel *chan, bool exclusive, bool intr)
> +nouveau_fence_sync(struct nouveau_bo *nvbo, struct nouveau_channel *chan,
> +		   bool exclusive, bool intr)
>  {
>  	struct nouveau_fence_chan *fctx = chan->fence;
> -	struct dma_fence *fence;
>  	struct dma_resv *resv = nvbo->bo.base.resv;
> -	struct dma_resv_list *fobj;
> +	struct dma_resv_iter cursor;
> +	struct dma_fence *fence;
>  	struct nouveau_fence *f;
> -	int ret = 0, i;
> +	int ret;
>  
>  	if (!exclusive) {
>  		ret = dma_resv_reserve_shared(resv, 1);
> @@ -355,10 +356,7 @@ nouveau_fence_sync(struct nouveau_bo *nvbo, struct nouveau_channel *chan, bool e
>  			return ret;
>  	}
>  
> -	fobj = dma_resv_shared_list(resv);
> -	fence = dma_resv_excl_fence(resv);
> -
> -	if (fence) {
> +	dma_resv_for_each_fence(&cursor, resv, exclusive, fence) {
>  		struct nouveau_channel *prev = NULL;
>  		bool must_wait = true;
>  
> @@ -366,41 +364,19 @@ nouveau_fence_sync(struct nouveau_bo *nvbo, struct nouveau_channel *chan, bool e
>  		if (f) {
>  			rcu_read_lock();
>  			prev = rcu_dereference(f->channel);
> -			if (prev && (prev == chan || fctx->sync(f, prev, chan) == 0))
> +			if (prev && (prev == chan ||
> +				     fctx->sync(f, prev, chan) == 0))
>  				must_wait = false;
>  			rcu_read_unlock();
>  		}
>  
> -		if (must_wait)
> +		if (must_wait) {
>  			ret = dma_fence_wait(fence, intr);
> -
> -		return ret;
> -	}
> -
> -	if (!exclusive || !fobj)
> -		return ret;
> -
> -	for (i = 0; i < fobj->shared_count && !ret; ++i) {
> -		struct nouveau_channel *prev = NULL;
> -		bool must_wait = true;
> -
> -		fence = rcu_dereference_protected(fobj->shared[i],
> -						dma_resv_held(resv));
> -
> -		f = nouveau_local_fence(fence, chan->drm);
> -		if (f) {
> -			rcu_read_lock();
> -			prev = rcu_dereference(f->channel);
> -			if (prev && (prev == chan || fctx->sync(f, prev, chan) == 0))
> -				must_wait = false;
> -			rcu_read_unlock();
> +			if (ret)
> +				return ret;
>  		}
> -
> -		if (must_wait)
> -			ret = dma_fence_wait(fence, intr);
>  	}
> -
> -	return ret;
> +	return 0;
>  }
>  
>  void
> -- 
> 2.25.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
