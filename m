Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4737240FAD5
	for <lists+dri-devel@lfdr.de>; Fri, 17 Sep 2021 16:53:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD7126ED82;
	Fri, 17 Sep 2021 14:53:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32DA16ED29
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Sep 2021 14:53:36 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id c21so30782531edj.0
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Sep 2021 07:53:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=i7wK8PAy0pTln1Ij7WUju223Tboi1RO9p+q6y08OLdQ=;
 b=UUlDPJH5THY/fyLkI2T7gaCqZRXS3ctAzfWpLsWlez/mGxf+1bKjUyVjIelTu+4raQ
 ie843+Jb4jSnRKKXHBzpaTEKWlrvs5yqOUZk+4FksFw9KMVm2OKu5zCtfIRe2zZ0u7tr
 dxk43ymJdoEHjaFGj9tOPTHm6xUKu+/uGoAQU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=i7wK8PAy0pTln1Ij7WUju223Tboi1RO9p+q6y08OLdQ=;
 b=uhQmT6cSU8qhikrSOaXG62ALtSUNZvpFXJWcecJ4okfYSqtXzfAxU9Gc2s4TzWL2F0
 Nxqx7yOrlEljVkfAJ8Pfa1+pIFEp369GGY7HL7KOpS5BkGj5+CAsqkBe2nvfizqiGuhH
 rRIU/Afp6IxKYCP2KIl2dNNbaNQOHNPNOS7vuxGdyJqI9/inUr2+B4fYrIIChfUzFmbk
 lPeSbTzCguQqHy4fE+ZAUnxfCWRPy93dovN2zbQQYYXvjaFKQS+FrpYy7Dcr75bSOlMA
 C70+nu15WgyOw7qFC+WnyLedGMZ8RBjXcuzpU/M06L2YHlUb5KyFtSfD0fLReSTy66Ow
 vhMw==
X-Gm-Message-State: AOAM530ERrsqfhuMjl+kVQYhjH9/N2+m79lmTmNF1EoJqFl2h7ypa47M
 q4foceE1soi+C1cqX/UUUlwQuA==
X-Google-Smtp-Source: ABdhPJz8wdHWvCd01v4kCjRcWM6KPrx/VnjgO/KDJQJBvz9h1g3363BbbrSpXMNQj/pYRAh1e1Vezw==
X-Received: by 2002:a17:906:3fd7:: with SMTP id
 k23mr12397223ejj.176.1631890414444; 
 Fri, 17 Sep 2021 07:53:34 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id ml12sm2429067ejb.29.2021.09.17.07.53.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Sep 2021 07:53:34 -0700 (PDT)
Date: Fri, 17 Sep 2021 16:53:32 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Cc: linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 daniel@ffwll.ch
Subject: Re: [PATCH 20/26] drm: use new iterator in
 drm_gem_fence_array_add_implicit v2
Message-ID: <YUSr7AN3vv6kpreo@phenom.ffwll.local>
References: <20210917123513.1106-1-christian.koenig@amd.com>
 <20210917123513.1106-21-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210917123513.1106-21-christian.koenig@amd.com>
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

On Fri, Sep 17, 2021 at 02:35:07PM +0200, Christian König wrote:
> Simplifying the code a bit.
> 
> v2: add missing rcu_read_lock()/unlock()
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>

This will be gone as soon as I can land the last conversion patches. Plus
it's always called with dma_resv_lock held.

I wouldn't bother tbh.
-Daniel

> ---
>  drivers/gpu/drm/drm_gem.c | 34 ++++++++++++----------------------
>  1 file changed, 12 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
> index 09c820045859..c2c41b668f40 100644
> --- a/drivers/gpu/drm/drm_gem.c
> +++ b/drivers/gpu/drm/drm_gem.c
> @@ -1340,31 +1340,21 @@ int drm_gem_fence_array_add_implicit(struct xarray *fence_array,
>  				     struct drm_gem_object *obj,
>  				     bool write)
>  {
> -	int ret;
> -	struct dma_fence **fences;
> -	unsigned int i, fence_count;
> -
> -	if (!write) {
> -		struct dma_fence *fence =
> -			dma_resv_get_excl_unlocked(obj->resv);
> -
> -		return drm_gem_fence_array_add(fence_array, fence);
> -	}
> -
> -	ret = dma_resv_get_fences(obj->resv, NULL,
> -						&fence_count, &fences);
> -	if (ret || !fence_count)
> -		return ret;
> -
> -	for (i = 0; i < fence_count; i++) {
> -		ret = drm_gem_fence_array_add(fence_array, fences[i]);
> +	struct dma_resv_iter cursor;
> +	struct dma_fence *fence;
> +	int ret = 0;
> +
> +	rcu_read_lock();
> +	dma_resv_iter_begin(&cursor, obj->resv, write);
> +	dma_resv_for_each_fence_unlocked(&cursor, fence) {
> +		rcu_read_unlock();
> +		ret = drm_gem_fence_array_add(fence_array, fence);
> +		rcu_read_lock();
>  		if (ret)
>  			break;
>  	}
> -
> -	for (; i < fence_count; i++)
> -		dma_fence_put(fences[i]);
> -	kfree(fences);
> +	dma_resv_iter_end(&cursor);
> +	rcu_read_unlock();
>  	return ret;
>  }
>  EXPORT_SYMBOL(drm_gem_fence_array_add_implicit);
> -- 
> 2.25.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
