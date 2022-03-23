Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 178A24E533E
	for <lists+dri-devel@lfdr.de>; Wed, 23 Mar 2022 14:37:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1277910E32D;
	Wed, 23 Mar 2022 13:37:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com
 [IPv6:2a00:1450:4864:20::644])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30A6610E32D
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Mar 2022 13:36:59 +0000 (UTC)
Received: by mail-ej1-x644.google.com with SMTP id d10so2865549eje.10
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Mar 2022 06:36:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=ELVqvMcqcAeU3P3xC6L+LpMmpFylloo4jTqkwywXU1M=;
 b=hkkSvfbXdqPFrdqyQkZhULE+toNREQj2iPGoZatFJBXIyEeCxOUld2z+oCuAzmvqxf
 eI6xEXts4y2u9Fi45sLsiyKHyp4UkC3JLFqwXI1ai5SECiCgUPjD7jr56hmlwJzrsOef
 FZxSgdM9/jqbI0mU8U5t7kHyRhLgqjRfrIGtA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=ELVqvMcqcAeU3P3xC6L+LpMmpFylloo4jTqkwywXU1M=;
 b=LPLRqkm60YVl9oAHwvNW417sipsRul5i9yTcD/57PTlnnPYXSHvZVnYcs/c6uUPbJD
 iCNJLQ/PSR0ASXHIzVR7mC7wAIYhmVzClMvUTezMj5sSa//HaEIcAVe5QJf1Ce80d9t2
 +iRSva5iVVLtPd3YVzsn+gGVP3SnVEcc+/nqwKHgdN72OZ04tK7mvpuylBpPyEH8lA10
 7sKe7j/JlrMTFAUmiASUX9gOuHgdCU6/g7B4SwdZ+aoZRy1j3qPEnVxvcVl4PuAi7Co0
 DymYNVTYB7xjaqMzQrTGbZhykG8S7XOkTvmuuCV/Ki9ocjCIVupxQ0690vakQ6B+/56R
 87aw==
X-Gm-Message-State: AOAM530uwz1Bmlk4Yei1uoX9VqC/vTKR7PKNMsyZGBgXsjVUkgKTH+gn
 37qsoFBfbvbh6L9S4xS7wW3Sjg==
X-Google-Smtp-Source: ABdhPJz1p/a97rvCI6QzdwyeuvWm5IZrHetV5YzoYjPYi3JAQlVB+l9ED19ytqFR0f3mA9VA+0lxFA==
X-Received: by 2002:a17:906:3cea:b0:6da:ea45:ea9e with SMTP id
 d10-20020a1709063cea00b006daea45ea9emr31055072ejh.574.1648042617432; 
 Wed, 23 Mar 2022 06:36:57 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 o12-20020a50c90c000000b0041907e62024sm8645949edh.85.2022.03.23.06.36.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Mar 2022 06:36:57 -0700 (PDT)
Date: Wed, 23 Mar 2022 14:36:55 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [PATCH 10/23] dma-buf: finally make dma_resv_excl_fence private v2
Message-ID: <YjsidyNMKqhsNY0j@phenom.ffwll.local>
References: <20220321135856.1331-1-christian.koenig@amd.com>
 <20220321135856.1331-10-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220321135856.1331-10-christian.koenig@amd.com>
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
Cc: daniel.vetter@ffwll.ch,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Mar 21, 2022 at 02:58:43PM +0100, Christian König wrote:
> Drivers should never touch this directly.
> 
> v2: fix rebase clash
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

I guess as soon as we have the rdma ack you can land up to this patch?
-Daniel

> ---
>  drivers/dma-buf/dma-resv.c |  6 ++++++
>  include/linux/dma-resv.h   | 17 -----------------
>  2 files changed, 6 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
> index c09fd8da0c85..1c9af97fe904 100644
> --- a/drivers/dma-buf/dma-resv.c
> +++ b/drivers/dma-buf/dma-resv.c
> @@ -140,6 +140,12 @@ void dma_resv_fini(struct dma_resv *obj)
>  }
>  EXPORT_SYMBOL(dma_resv_fini);
>  
> +static inline struct dma_fence *
> +dma_resv_excl_fence(struct dma_resv *obj)
> +{
> +       return rcu_dereference_check(obj->fence_excl, dma_resv_held(obj));
> +}
> +
>  static inline struct dma_resv_list *dma_resv_shared_list(struct dma_resv *obj)
>  {
>  	return rcu_dereference_check(obj->fence, dma_resv_held(obj));
> diff --git a/include/linux/dma-resv.h b/include/linux/dma-resv.h
> index 08512c1e215d..20e13f36710a 100644
> --- a/include/linux/dma-resv.h
> +++ b/include/linux/dma-resv.h
> @@ -423,23 +423,6 @@ static inline void dma_resv_unlock(struct dma_resv *obj)
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
