Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A003447D8E5
	for <lists+dri-devel@lfdr.de>; Wed, 22 Dec 2021 22:39:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60B9110E2E7;
	Wed, 22 Dec 2021 21:39:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4066210E2E5
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Dec 2021 21:39:44 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id m21so14960893edc.0
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Dec 2021 13:39:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=nw1vcdiLVYMep5XJh+Ei6gNWSN3eFbVTKO+rs9QcGRo=;
 b=RxRjpCs+LV+PD3aTUZt8LIeQUugNN6d6TrlDTQGiX1TeQis+RnQFMDgGERl39W/0wC
 VzOSPAgwgluxZfP/Pj920xnY9SYsf0yvGZ8Ohoq9CkK97Vgw8MD1tXbAn2fUWNbxk9G3
 tNm7PkPIhHmJAemuv1m9wk9KhyuEAWzfQIQr4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=nw1vcdiLVYMep5XJh+Ei6gNWSN3eFbVTKO+rs9QcGRo=;
 b=ZmwSxvbAxyJI/Zj7Vir4YpOHGxxezmDnuTIACzwVPbP992VDCEOUfQLh650Q8+r6NE
 Fn6WmpuqkrImjd7Rcdpje38dugGEWUfz5vimm9IGsdh35n1pDOMweqK/u803yzMm6z4e
 XK6mNnRsfZeVSIDT6agWqmaw7Vfo2+x3ZxNJQ1zZ49PZIfKiyuyHTTWH7FumbDk+qAvJ
 D3iaY/oo9DwPNAmIbhpTWsmKqUjOz4scwJiNgdhYhRIwn2Id66xhrRWXIn6PTJ4zvcAi
 IEr57DrZmc9AnwnZZNzox1Bi+7RpH1JOLtWiKuAXjlzHMqsTAXlqFFFJfXo8E2XAUu1R
 pMAQ==
X-Gm-Message-State: AOAM533VQWmqb5YKyWJ4jOpiHc7h8siWHTRtTF3Jta1FBw6PFNHUjSwS
 fK4JACqAPrmfqRlEQ/H71nHJfQ==
X-Google-Smtp-Source: ABdhPJwaOEwtCD9whrD3kuNlue5gRJQNEOv3PNpX4Tnb5qb0tf2zPcUx8pT4PtRDHjgQEHclLKHTFw==
X-Received: by 2002:a05:6402:11cf:: with SMTP id
 j15mr2428041edw.220.1640209182813; 
 Wed, 22 Dec 2021 13:39:42 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id b10sm1325291ede.52.2021.12.22.13.39.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Dec 2021 13:39:42 -0800 (PST)
Date: Wed, 22 Dec 2021 22:39:40 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [PATCH 12/24] dma-buf: finally make dma_resv_excl_fence private
Message-ID: <YcObHJFmw7w8Hp3J@phenom.ffwll.local>
References: <20211207123411.167006-1-christian.koenig@amd.com>
 <20211207123411.167006-13-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211207123411.167006-13-christian.koenig@amd.com>
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

On Tue, Dec 07, 2021 at 01:33:59PM +0100, Christian König wrote:
> Drivers should never touch this directly.
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>
> ---
>  drivers/dma-buf/dma-resv.c | 17 +++++++++++++++++
>  include/linux/dma-resv.h   | 17 -----------------
>  2 files changed, 17 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
> index 694716a3d66d..9acceabc9399 100644
> --- a/drivers/dma-buf/dma-resv.c
> +++ b/drivers/dma-buf/dma-resv.c
> @@ -147,6 +147,23 @@ void dma_resv_fini(struct dma_resv *obj)
>  }
>  EXPORT_SYMBOL(dma_resv_fini);
>  
> +/**
> + * dma_resv_excl_fence - return the object's exclusive fence
> + * @obj: the reservation object
> + *
> + * Returns the exclusive fence (if any). Caller must either hold the objects
> + * through dma_resv_lock() or the RCU read side lock through rcu_read_lock(),
> + * or one of the variants of each
> + *
> + * RETURNS
> + * The exclusive fence or NULL
> + */

Same thing with us not documenting internals, pls drop the comment
outright it doesn't really explain anything. With that:

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> +static inline struct dma_fence *
> +dma_resv_excl_fence(struct dma_resv *obj)
> +{
> +	return rcu_dereference_check(obj->fence_excl, dma_resv_held(obj));
> +}
> +
>  /**
>   * dma_resv_shared_list - get the reservation object's shared fence list
>   * @obj: the reservation object
> diff --git a/include/linux/dma-resv.h b/include/linux/dma-resv.h
> index cdfbbda6f600..40ac9d486f8f 100644
> --- a/include/linux/dma-resv.h
> +++ b/include/linux/dma-resv.h
> @@ -412,23 +412,6 @@ static inline void dma_resv_unlock(struct dma_resv *obj)
>  	ww_mutex_unlock(&obj->lock);
>  }
>  
> -/**
> - * dma_resv_excl_fence - return the object's exclusive fence
> - * @obj: the reservation object
> - *
> - * Returns the exclusive fence (if any). Caller must either hold the objects
> - * through dma_resv_lock() or the RCU read side lock through rcu_read_lock(),
> - * or one of the variants of each
> - *
> - * RETURNS
> - * The exclusive fence or NULL
> - */
> -static inline struct dma_fence *
> -dma_resv_excl_fence(struct dma_resv *obj)
> -{
> -	return rcu_dereference_check(obj->fence_excl, dma_resv_held(obj));
> -}
> -
>  void dma_resv_init(struct dma_resv *obj);
>  void dma_resv_fini(struct dma_resv *obj);
>  int dma_resv_reserve_shared(struct dma_resv *obj, unsigned int num_fences);
> -- 
> 2.25.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
