Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A096B49B8E0
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jan 2022 17:37:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E40310E180;
	Tue, 25 Jan 2022 16:37:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E928D10E180
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jan 2022 16:37:39 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id s5so31591105ejx.2
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jan 2022 08:37:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=vm2bLJHXdB/YdOle+SsitdL7IebwbVWqSP+FFImOC7A=;
 b=R5oWJ5Fq974jBOUL1X9ebKf3hj74Rm9K/xLfDZ7vaft2E2rROtqdzWFAmgAPXvCx0x
 quRyDbkizdru02ggipPnU3JaWMxoxXnVrcmGytcdgIRrYXGb1W/OqpIY29Wmx4CK1Yza
 QjKuIcoD76A6JvSXsMIir1iKDOjsuYQR2Cq7g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=vm2bLJHXdB/YdOle+SsitdL7IebwbVWqSP+FFImOC7A=;
 b=Ly1tdj+qORAYfvSv4+S9KobpKabgsx9S+KSloBASL60ZhreA51lliTCQI7fIldQQYl
 sw/crF9fLM844Gojj/DU8L+kHAuKvKZFx6L8WMaeVb1/R4sshxLgib94LJn+3ewSoDbU
 J35cBSeONnsIeqZj7elY9Hd8/pQeq3vq4jW0DQuaJrurr/g3Zz4IzEV0aQn3fQ67mlXH
 +8sh9ooPo2TlPBrTxc2osME6IwmYdoh2cknI125y5OZhBM32Elfn/fdTw0VmcGj86zRr
 ROHbdOOgZycNSQqXuF1LTKW+YQHqZn91sHYtkCoj+b5spTXIz52IgO2xbr6LISqjCYTk
 zxFA==
X-Gm-Message-State: AOAM533XGI8SrFBMbTs5Dqg07sF0Waj/3sTl3VDfyGQa8iX01j8Dn7sz
 rsw8F65bHXhxbSr4IVgUHuJq7A==
X-Google-Smtp-Source: ABdhPJzISu6zP4D6/gOhVlPupdzk/Ubsy2+NmQaJeFdr78eDY3iFPIfOqGGJ0LWX8aqAQDTiDGIwvw==
X-Received: by 2002:a17:906:65c8:: with SMTP id
 z8mr17944607ejn.727.1643128658309; 
 Tue, 25 Jan 2022 08:37:38 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id l2sm8418412eds.28.2022.01.25.08.37.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Jan 2022 08:37:37 -0800 (PST)
Date: Tue, 25 Jan 2022 17:37:36 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [PATCH 04/12] drm/ttm: add common accounting to the resource mgr
 v2
Message-ID: <YfAnUIRhBwj7WOJE@phenom.ffwll.local>
References: <20220124122514.1832-1-christian.koenig@amd.com>
 <20220124122514.1832-5-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220124122514.1832-5-christian.koenig@amd.com>
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
Cc: thomas.hellstrom@linux.intel.com, ray.huang@amd.com,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jan 24, 2022 at 01:25:06PM +0100, Christian König wrote:
> It makes sense to have this in the common manager for debugging and
> accounting of how much resources are used.
> 
> v2: cleanup kerneldoc a bit
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>
> Reviewed-by: Huang Rui <ray.huang@amd.com>
> ---
>  drivers/gpu/drm/ttm/ttm_resource.c |  8 ++++++++
>  include/drm/ttm/ttm_resource.h     | 20 +++++++++++++++++++-
>  2 files changed, 27 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/ttm/ttm_resource.c b/drivers/gpu/drm/ttm/ttm_resource.c
> index 7fdd58b53c61..b8362492980d 100644
> --- a/drivers/gpu/drm/ttm/ttm_resource.c
> +++ b/drivers/gpu/drm/ttm/ttm_resource.c
> @@ -33,6 +33,8 @@ void ttm_resource_init(struct ttm_buffer_object *bo,
>                         const struct ttm_place *place,
>                         struct ttm_resource *res)
>  {
> +	struct ttm_resource_manager *man;
> +
>  	res->start = 0;
>  	res->num_pages = PFN_UP(bo->base.size);
>  	res->mem_type = place->mem_type;
> @@ -42,12 +44,16 @@ void ttm_resource_init(struct ttm_buffer_object *bo,
>  	res->bus.is_iomem = false;
>  	res->bus.caching = ttm_cached;
>  	res->bo = bo;
> +
> +	man = ttm_manager_type(bo->bdev, place->mem_type);
> +	atomic64_add(bo->base.size, &man->usage);

Doing this with atomics doesn't make a lot of sense to me. Yes with the
current organization it's the only thing to do in drivers, but if we move
this into ttm there's no reason we can track this together with the lru,
consistently with the lru, and under the same spinlock like the lru.

And at least spot-checking a few places the very next thing we generally
do is take the lru lock since there's really no other way to get the
resource into or out of the resource manager.

I think doing atomics for statistics when there's no need is not great,
because then people start using atomics for all kinds of other things, and
then get the barriers wrong. In i915 (simply due to the grotesque amount
of buggy overuse of atomics, both atomic_t and atomic bitfields) we've put
a hard block in place for any atomic addition. So that's why I'm a bit on
a crusade, but I also genuinely don't see why we need them here. All they
do is cost more since we have to take the spinlock anyway, the accounting
is just going to be a slight different (and imo more accurate) place.

Thoughts?

Cheers, Daniel

>  }
>  EXPORT_SYMBOL(ttm_resource_init);
>  
>  void ttm_resource_fini(struct ttm_resource_manager *man,
>  		       struct ttm_resource *res)
>  {
> +	atomic64_sub(res->bo->base.size, &man->usage);
>  }
>  EXPORT_SYMBOL(ttm_resource_fini);
>  
> @@ -149,6 +155,7 @@ void ttm_resource_manager_init(struct ttm_resource_manager *man,
>  	spin_lock_init(&man->move_lock);
>  	man->bdev = bdev;
>  	man->size = p_size;
> +	atomic64_set(&man->usage, 0);
>  
>  	for (i = 0; i < TTM_MAX_BO_PRIORITY; ++i)
>  		INIT_LIST_HEAD(&man->lru[i]);
> @@ -221,6 +228,7 @@ void ttm_resource_manager_debug(struct ttm_resource_manager *man,
>  	drm_printf(p, "  use_type: %d\n", man->use_type);
>  	drm_printf(p, "  use_tt: %d\n", man->use_tt);
>  	drm_printf(p, "  size: %llu\n", man->size);
> +	drm_printf(p, "  usage: %llu\n", atomic64_read(&man->usage));
>  	if (man->func->debug)
>  		man->func->debug(man, p);
>  }
> diff --git a/include/drm/ttm/ttm_resource.h b/include/drm/ttm/ttm_resource.h
> index 69eea9d6399b..3d391279b33f 100644
> --- a/include/drm/ttm/ttm_resource.h
> +++ b/include/drm/ttm/ttm_resource.h
> @@ -27,6 +27,7 @@
>  
>  #include <linux/types.h>
>  #include <linux/mutex.h>
> +#include <linux/atomic.h>
>  #include <linux/dma-buf-map.h>
>  #include <linux/dma-fence.h>
>  #include <drm/drm_print.h>
> @@ -132,8 +133,12 @@ struct ttm_resource_manager {
>  	/*
>  	 * Protected by the global->lru_lock.
>  	 */
> -
>  	struct list_head lru[TTM_MAX_BO_PRIORITY];
> +
> +	/**
> +	 * @usage: How much of the region is used, has its own protection.
> +	 */
> +	atomic64_t usage;
>  };
>  
>  /**
> @@ -261,6 +266,19 @@ ttm_resource_manager_cleanup(struct ttm_resource_manager *man)
>  	man->move = NULL;
>  }
>  
> +/**
> + * ttm_resource_manager_usage
> + *
> + * @man: A memory manager object.
> + *
> + * Return how many resources are currently used.
> + */
> +static inline uint64_t
> +ttm_resource_manager_usage(struct ttm_resource_manager *man)
> +{
> +	return atomic64_read(&man->usage);
> +}
> +
>  void ttm_resource_init(struct ttm_buffer_object *bo,
>                         const struct ttm_place *place,
>                         struct ttm_resource *res);
> -- 
> 2.25.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
