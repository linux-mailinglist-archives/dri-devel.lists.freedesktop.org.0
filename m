Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FF713989D4
	for <lists+dri-devel@lfdr.de>; Wed,  2 Jun 2021 14:41:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07BF56EC7B;
	Wed,  2 Jun 2021 12:41:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F56D6EC7B
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Jun 2021 12:41:33 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id jt22so3633930ejb.7
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Jun 2021 05:41:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=4H2HyJ+5yfl0LsJaV8QZfV2xPEecKr6ZSnYPtzSRJAk=;
 b=ib8Tq60AaaC6O7ZREkd9zp1c1DCQPPQgizx4PMwXF7UU08//UaDKLJTnbNZ79xEgqP
 3ZXfo3VNcRggqfUkYJC4Wkb+tCl+TvoxhERVKKnlLfKi7/XIs5AQnoSi6F6RmK9bKban
 IGEGX99KxcIFrY0wk2BP39yy20BLTFH4byH/s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=4H2HyJ+5yfl0LsJaV8QZfV2xPEecKr6ZSnYPtzSRJAk=;
 b=sSSTDR2VgJ6joUrSbUp4SqnBayY0zkwJNMfW4Vyasd0iLEzRkdp2qa2aWRNiKekm2v
 qc6FEsoilOV1FAHCjzFZEcpW45Va189kQbS//b98LWTre2s7+AUroFoIGGc5q9qE9hEv
 uA/rCJN7Ad/EkIsSzDjn9SkFgvO6z2FyjoYtBjzLNUR5rJvo+OAqgFJftKSogyael5xO
 uY6Q7cpcmQfl8DIHIHTjNBGycLamwOF2yBxMryyKFm045rlNUt6FkpAqs7cmVHd5CEek
 Peygwp7605o9LXidwKtEfuFHJGPShC6Q6CBUjXN5zYf3x5IhpGSX583m8MR7jNa3mLFm
 5nhA==
X-Gm-Message-State: AOAM530BEEVPFsl0XqMT1RWPDa9exa16CJCt86dKq6HbuCRA69diR3eV
 CDZ+QXBwvnn0MAoj3HkIFFzvIQ==
X-Google-Smtp-Source: ABdhPJzozKfvYMCxgldy/OqpZI+LzEVV5l7LBFLs1dzrmqjnShwfvBPs+VvldFAm6THXIYHd+J6ocA==
X-Received: by 2002:a17:906:49c8:: with SMTP id
 w8mr24781041ejv.497.1622637692529; 
 Wed, 02 Jun 2021 05:41:32 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id t18sm1304070edw.47.2021.06.02.05.41.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Jun 2021 05:41:31 -0700 (PDT)
Date: Wed, 2 Jun 2021 14:41:30 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [PATCH 3/7] dma-buf: cleanup dma-resv shared fence debugging a bit
Message-ID: <YLd8ekMOcB1r0oVm@phenom.ffwll.local>
References: <20210602111714.212426-1-christian.koenig@amd.com>
 <20210602111714.212426-3-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210602111714.212426-3-christian.koenig@amd.com>
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
Cc: dri-devel@lists.freedesktop.org, jason@jlekstrand.net
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jun 02, 2021 at 01:17:10PM +0200, Christian König wrote:
> Make that a function instead of inline.
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>

Hm yeah pulling that out makes some sense.

> ---
>  drivers/dma-buf/dma-resv.c | 18 ++++++++++++++++++
>  include/linux/dma-resv.h   | 15 +++++++--------
>  2 files changed, 25 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
> index 87f5d82d992a..6c6195315e9f 100644
> --- a/drivers/dma-buf/dma-resv.c
> +++ b/drivers/dma-buf/dma-resv.c
> @@ -208,6 +208,24 @@ int dma_resv_reserve_shared(struct dma_resv *obj, unsigned int num_fences)
>  }
>  EXPORT_SYMBOL(dma_resv_reserve_shared);
>  
> +#ifdef CONFIG_DEBUG_MUTEXES
> +/**
> + * dma_resv_reset_shared_max - reset shared fences for debugging
> + * @obj: the dma_resv object to reset
> + *
> + * Reset the shared_max to test if drivers do correct slot allocation.

I'd phrase this as

"Reset the number of pre-reserved shared slots to test that drivers do
correct slot allocation using dma_resv_reserve_shared(). See also
&dma_resv_list.shared_max."

That way it's a bit clearer how it all ties together.

The kerneldoc for dma_resv_list is also a bit thin, but another patch for
that. With the kerneldoc polish:

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>


> + */
> +void dma_resv_reset_shared_max(struct dma_resv *obj)
> +{
> +	/* Test shared fence slot reservation */
> +	if (rcu_access_pointer(obj->fence)) {
> +		struct dma_resv_list *fence = dma_resv_get_list(obj);
> +
> +		fence->shared_max = fence->shared_count;
> +	}
> +}
> +#endif
> +
>  /**
>   * dma_resv_add_shared_fence - Add a fence to a shared slot
>   * @obj: the reservation object
> diff --git a/include/linux/dma-resv.h b/include/linux/dma-resv.h
> index d44a77e8a7e3..f32a3d176513 100644
> --- a/include/linux/dma-resv.h
> +++ b/include/linux/dma-resv.h
> @@ -92,6 +92,12 @@ static inline struct dma_resv_list *dma_resv_get_list(struct dma_resv *obj)
>  					 dma_resv_held(obj));
>  }
>  
> +#ifdef CONFIG_DEBUG_MUTEXES
> +void dma_resv_reset_shared_max(struct dma_resv *obj);
> +#else
> +static inline void dma_resv_reset_shared_max(struct dma_resv *obj) {}
> +#endif
> +
>  /**
>   * dma_resv_lock - lock the reservation object
>   * @obj: the reservation object
> @@ -215,14 +221,7 @@ static inline struct ww_acquire_ctx *dma_resv_locking_ctx(struct dma_resv *obj)
>   */
>  static inline void dma_resv_unlock(struct dma_resv *obj)
>  {
> -#ifdef CONFIG_DEBUG_MUTEXES
> -	/* Test shared fence slot reservation */
> -	if (rcu_access_pointer(obj->fence)) {
> -		struct dma_resv_list *fence = dma_resv_get_list(obj);
> -
> -		fence->shared_max = fence->shared_count;
> -	}
> -#endif
> +	dma_resv_reset_shared_max(obj);
>  	ww_mutex_unlock(&obj->lock);
>  }
>  
> -- 
> 2.25.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
