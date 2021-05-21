Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EDA738CC9C
	for <lists+dri-devel@lfdr.de>; Fri, 21 May 2021 19:48:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 126E56F8B3;
	Fri, 21 May 2021 17:48:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FB866E82A
 for <dri-devel@lists.freedesktop.org>; Fri, 21 May 2021 17:48:46 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id u133so11555471wmg.1
 for <dri-devel@lists.freedesktop.org>; Fri, 21 May 2021 10:48:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=0lgsrOVDtH8iJ1/n3dl9Klsz/gWZ0b5FW3aqkQRT7kc=;
 b=VwkcsITfVEQj+CtVNyGDSWavRky6n3jDsiekzqe+0+mDSEu3LUAi/fFrCselbKlclo
 ZAWIstJ/Bj1KN7S6q/4UHPZDOsI7JglhEC6x3n6BU01tfp38oX9UcN+3UovGvSbYDAX0
 54uO4JzkLzhXK2XwwXyWekCtYCc/pshKqDCVY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=0lgsrOVDtH8iJ1/n3dl9Klsz/gWZ0b5FW3aqkQRT7kc=;
 b=CWd32bXK/Nb8gOocTofSSiAOmX7TIadaQ/1vHVNNLcSDp1FelpgNrjosdUK0rHPszg
 Zv9zYnQchlCQmtj5ShI2S8Yg3w0p3B39JB7DzD92D/O/xAe2LVwlsZ7Uct4fPinTTCnb
 iyCvd1QDhleHOmvzivMkLR1kvQMO4MwbZzPSjiwCfNIOoxwoaxgU1Pmp+Eh8aWfOKe5d
 DK5CUQBzNpxfK6MS64Rk2TfIyDwHNQHm8dMfUB4KAAjWwpGj+LgxVfCN8bl7nh0nW4L6
 +Q24y74sjxtMW8d8Al+tZRWLvxG/egLjnOalOA9z3U8e+htH816ODDmZbgsN08X11BS4
 otNA==
X-Gm-Message-State: AOAM5311TKxGSXl8CvvjodemX1P9LoJnjsMnCPuDbayOniDfPV805+sN
 BU0SgYSZtiztZaSCzeuFbm+mk+WDk+ao7A==
X-Google-Smtp-Source: ABdhPJzGENgRIyf/r+T6MiBmVIeXhJRCcETybEL6w/9b+NR1ERJK8SsWUXi2vjJOl9xs+7+tUSh+jA==
X-Received: by 2002:a05:600c:2f17:: with SMTP id
 r23mr9665618wmn.94.1621619324864; 
 Fri, 21 May 2021 10:48:44 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id f7sm223741wmq.30.2021.05.21.10.48.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 May 2021 10:48:44 -0700 (PDT)
Date: Fri, 21 May 2021 19:48:42 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Jason Ekstrand <jason@jlekstrand.net>
Subject: Re: [PATCH 2/4] dma-buf: add dma_resv_get_singleton_rcu (v4)
Message-ID: <YKfyestsJvKeS4k9@phenom.ffwll.local>
References: <20210520190007.534046-1-jason@jlekstrand.net>
 <20210520190007.534046-3-jason@jlekstrand.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210520190007.534046-3-jason@jlekstrand.net>
X-Operating-System: Linux phenom 5.10.32scarlett+ 
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, May 20, 2021 at 02:00:05PM -0500, Jason Ekstrand wrote:
> Add a helper function to get a single fence representing
> all fences in a dma_resv object.
> 
> This fence is either the only one in the object or all not
> signaled fences of the object in a flatted out dma_fence_array.
> 
> v2 (Jason Ekstrand):
>  - Take reference of fences both for creating the dma_fence_array and in
>    the case where we return one fence.
>  - Handle the case where dma_resv_get_list() returns NULL
> 
> v3 (Jason Ekstrand):
>  - Add an _rcu suffix because it is read-only
>  - Rewrite to use dma_resv_get_fences_rcu so it's RCU-safe
>  - Add an EXPORT_SYMBOL_GPL declaration
>  - Re-author the patch to Jason since very little is left of Christian
>    König's original patch
>  - Remove the extra fence argument
> 
> v4 (Jason Ekstrand):
>  - Restore the extra fence argument
> 
> Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
> 
> get_singleton

Spurious thing here.

> ---
>  drivers/dma-buf/dma-resv.c | 122 +++++++++++++++++++++++++++++++++++++
>  include/linux/dma-resv.h   |   3 +
>  2 files changed, 125 insertions(+)
> 
> diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
> index 6ddbeb5dfbf65..25995fc15c370 100644
> --- a/drivers/dma-buf/dma-resv.c
> +++ b/drivers/dma-buf/dma-resv.c
> @@ -33,6 +33,8 @@
>   */
>  
>  #include <linux/dma-resv.h>
> +#include <linux/dma-fence-chain.h>
> +#include <linux/dma-fence-array.h>
>  #include <linux/export.h>
>  #include <linux/mm.h>
>  #include <linux/sched/mm.h>
> @@ -49,6 +51,19 @@
>   * write-side updates.
>   */
>  
> +/**
> + * dma_fence_deep_dive_for_each - deep dive into the fence containers
> + * @fence: resulting fence
> + * @chain: variable for a dma_fence_chain
> + * @index: index into a dma_fence_array
> + * @head: starting point
> + *
> + * Helper to deep dive into the fence containers for flattening them.
> + */
> +#define dma_fence_deep_dive_for_each(fence, chain, index, head)	\
> +	dma_fence_chain_for_each(chain, head)			\
> +		dma_fence_array_for_each(fence, index, chain)

Since this is is just internal helper in the .c file we generally don't
document it. Maybe small comment if you feel it's worth it.

> +
>  DEFINE_WD_CLASS(reservation_ww_class);
>  EXPORT_SYMBOL(reservation_ww_class);
>  
> @@ -517,6 +532,113 @@ int dma_resv_get_fences_rcu(struct dma_resv *obj,
>  }
>  EXPORT_SYMBOL_GPL(dma_resv_get_fences_rcu);
>  
> +/**
> + * dma_resv_get_singleton - get a single fence for the dma_resv object

Name doesn't match here.

> + * @obj: the reservation object
> + * @extra: extra fence to add to the resulting array
> + * @result: resulting dma_fence
> + *
> + * Get a single fence representing all unsignaled fences in the dma_resv object
> + * plus the given extra fence. If we got only one fence return a new
> + * reference to that, otherwise return a dma_fence_array object.
> + *
> + * RETURNS
> + * Returns -NOMEM if allocations fail, zero otherwise.

Kernel often encodes this in ERR_PTR so that you don't have to pass a
pointer to store the result. Would feel more kerenl-y I think that way. So
no result parameter, and on alloc failure you'd return

	return ERR_PTR(-ENOMEM);

> + */
> +int dma_resv_get_singleton_rcu(struct dma_resv *obj, struct dma_fence *extra,

tbh the _rcu here is confusing. I think _unlocked is the better suffix,
maybe we should rename dma_resv_get_fences_rcu too for consistency. The
rcu-ness of the lookup isn't leaked to callers at all, so no point giving
them a panic.

> +			       struct dma_fence **result)
> +{
> +	struct dma_fence **resv_fences, *fence, *chain, **fences;
> +	struct dma_fence_array *array;
> +	unsigned int num_resv_fences, num_fences;
> +	unsigned int ret, i, j;
> +
> +	ret = dma_resv_get_fences_rcu(obj, NULL, &num_resv_fences, &resv_fences);
> +	if (ret)
> +		return ret;
> +
> +	num_fences = 0;
> +	*result = NULL;
> +
> +	if (num_resv_fences == 0 && !extra)
> +		return 0;
> +
> +	for (i = 0; i < num_resv_fences; ++i) {
> +		dma_fence_deep_dive_for_each(fence, chain, j, resv_fences[i]) {
> +			if (dma_fence_is_signaled(fence))
> +				continue;
> +
> +			*result = fence;
> +			++num_fences;
> +		}
> +	}
> +
> +	if (extra) {
> +		dma_fence_deep_dive_for_each(fence, chain, j, extra) {
> +			if (dma_fence_is_signaled(fence))
> +				continue;
> +
> +			*result = fence;
> +			++num_fences;
> +		}
> +	}
> +
> +	if (num_fences <= 1) {
> +		*result = dma_fence_get(*result);
> +		goto put_resv_fences;
> +	}
> +
> +	fences = kmalloc_array(num_fences, sizeof(struct dma_fence*),
> +			       GFP_KERNEL);
> +	if (!fences) {
> +		*result = NULL;
> +		ret = -ENOMEM;
> +		goto put_resv_fences;
> +	}
> +
> +	num_fences = 0;
> +	for (i = 0; i < num_resv_fences; ++i) {
> +		dma_fence_deep_dive_for_each(fence, chain, j, resv_fences[i]) {
> +			if (!dma_fence_is_signaled(fence))
> +				fences[num_fences++] = dma_fence_get(fence);
> +		}
> +	}
> +
> +	if (extra) {
> +		dma_fence_deep_dive_for_each(fence, chain, j, extra) {
> +			if (dma_fence_is_signaled(fence))
> +				fences[num_fences++] = dma_fence_get(fence);
> +		}
> +	}
> +
> +	if (num_fences <= 1) {
> +		*result = num_fences ? fences[0] : NULL;
> +		kfree(fences);
> +		goto put_resv_fences;
> +	}
> +
> +	array = dma_fence_array_create(num_fences, fences,
> +				       dma_fence_context_alloc(1),
> +				       1, false);
> +	if (array) {
> +		*result = &array->base;
> +	} else {
> +		*result = NULL;
> +		while (num_fences--)
> +			dma_fence_put(fences[num_fences]);
> +		kfree(fences);
> +		ret = -ENOMEM;
> +	}
> +
> +put_resv_fences:
> +	while (num_resv_fences--)
> +		dma_fence_put(resv_fences[num_resv_fences]);
> +	kfree(resv_fences);
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(dma_resv_get_singleton_rcu);

With the nits addressed:

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> +
>  /**
>   * dma_resv_wait_timeout_rcu - Wait on reservation's objects
>   * shared and/or exclusive fences.
> diff --git a/include/linux/dma-resv.h b/include/linux/dma-resv.h
> index d44a77e8a7e34..d49ca263e78b4 100644
> --- a/include/linux/dma-resv.h
> +++ b/include/linux/dma-resv.h
> @@ -285,6 +285,9 @@ int dma_resv_get_fences_rcu(struct dma_resv *obj,
>  
>  int dma_resv_copy_fences(struct dma_resv *dst, struct dma_resv *src);
>  
> +int dma_resv_get_singleton_rcu(struct dma_resv *obj, struct dma_fence *extra,
> +			       struct dma_fence **result);
> +
>  long dma_resv_wait_timeout_rcu(struct dma_resv *obj, bool wait_all, bool intr,
>  			       unsigned long timeout);
>  
> -- 
> 2.31.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
