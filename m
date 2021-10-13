Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E0A2642C295
	for <lists+dri-devel@lfdr.de>; Wed, 13 Oct 2021 16:14:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 970B96E044;
	Wed, 13 Oct 2021 14:14:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C7C76EA04
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Oct 2021 14:14:49 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id r10so8821073wra.12
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Oct 2021 07:14:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=QGMl28YhRUiVkwlLZBmVBXM/gyOekGqQg/96lael90E=;
 b=P0JFBTHJb1PbNMI8zjyzr7d9fJsFYOFHA0yBi6E2RZWs9BbG3pgP09Q5ZbfNPBYrfe
 omcKg0S8cPzW2K3NVO1TtfBvQGSQmGi81ZTXvdFcqcuT3/GvLOrN8on5acW1QONc+L3Q
 dVWlOopJ2jZgRk57IgcSw6BClvk7y94ehK1mY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=QGMl28YhRUiVkwlLZBmVBXM/gyOekGqQg/96lael90E=;
 b=nV9r7CGDv5b60RSkqV4fAmpFARjmtanLr13IVIqa9B57X5yRoWNE+kKlEdyVvJB2Y8
 4ZF9+gueqe+eqjFTyM6jfr98JmoCB/IGE5Qv5Oj2j9D349IfQuazVgC2AMe8NwbfkkJg
 oACW2P4ohpsZVcZ8Tgsa1+pJxn/lNH6L14ehFE0Y2aPhQGa9G+YEkYj8cxJeILT8KCmg
 mx65GNvc2OMvZERi19uv2ikJwf4/LBMlLC9KWNl83hSKLC/s7HEea6EYZ7rKiubv8fOo
 pL6LdZQgjj74o/DTKWXFszhCNZVuyQ0ix6XWMxv2gH8yh/OqmGFt6pT4dX8nFuy3o3s8
 nPPg==
X-Gm-Message-State: AOAM533BliKuXk43q347oLyvfOtziGSlOKV/gccjQWJ4mQephpihDqPZ
 BWCJ2RXQfIylEYhY+hd/KbAwmA==
X-Google-Smtp-Source: ABdhPJz3DWZJUUUVjvwZK5GxUdwNkVvvYKU7kkJTlhYb5/u8jsP/6ywjOD2vzguomUiuBwi9+TI1iA==
X-Received: by 2002:a5d:6ad2:: with SMTP id u18mr40933209wrw.47.1634134487220; 
 Wed, 13 Oct 2021 07:14:47 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id b190sm5490616wmd.25.2021.10.13.07.14.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Oct 2021 07:14:46 -0700 (PDT)
Date: Wed, 13 Oct 2021 16:14:44 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Cc: linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 daniel@ffwll.ch, tvrtko.ursulin@linux.intel.com
Subject: Re: [PATCH 14/28] drm/msm: use new iterator in msm_gem_describe
Message-ID: <YWbp1PoezuLqHpKZ@phenom.ffwll.local>
References: <20211005113742.1101-1-christian.koenig@amd.com>
 <20211005113742.1101-15-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211005113742.1101-15-christian.koenig@amd.com>
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

On Tue, Oct 05, 2021 at 01:37:28PM +0200, Christian König wrote:
> Simplifying the code a bit. Also drop the RCU read side lock since the
> object is locked anyway.
> 
> Untested since I can't get the driver to compile on !ARM.

Cross-compiler install is pretty easy and you should have that for pushing
drm changes to drm-misc :-)

> Signed-off-by: Christian König <christian.koenig@amd.com>

Assuming this compiles, it looks correct.

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> ---
>  drivers/gpu/drm/msm/msm_gem.c | 19 +++++--------------
>  1 file changed, 5 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
> index 40a9863f5951..5bd511f07c07 100644
> --- a/drivers/gpu/drm/msm/msm_gem.c
> +++ b/drivers/gpu/drm/msm/msm_gem.c
> @@ -880,7 +880,7 @@ void msm_gem_describe(struct drm_gem_object *obj, struct seq_file *m,
>  {
>  	struct msm_gem_object *msm_obj = to_msm_bo(obj);
>  	struct dma_resv *robj = obj->resv;
> -	struct dma_resv_list *fobj;
> +	struct dma_resv_iter cursor;
>  	struct dma_fence *fence;
>  	struct msm_gem_vma *vma;
>  	uint64_t off = drm_vma_node_start(&obj->vma_node);
> @@ -955,22 +955,13 @@ void msm_gem_describe(struct drm_gem_object *obj, struct seq_file *m,
>  		seq_puts(m, "\n");
>  	}
>  
> -	rcu_read_lock();
> -	fobj = dma_resv_shared_list(robj);
> -	if (fobj) {
> -		unsigned int i, shared_count = fobj->shared_count;
> -
> -		for (i = 0; i < shared_count; i++) {
> -			fence = rcu_dereference(fobj->shared[i]);
> +	dma_resv_for_each_fence(&cursor, robj, true, fence) {
> +		if (dma_resv_iter_is_exclusive(&cursor))
> +			describe_fence(fence, "Exclusive", m);
> +		else
>  			describe_fence(fence, "Shared", m);
> -		}
>  	}
>  
> -	fence = dma_resv_excl_fence(robj);
> -	if (fence)
> -		describe_fence(fence, "Exclusive", m);
> -	rcu_read_unlock();
> -
>  	msm_gem_unlock(obj);
>  }
>  
> -- 
> 2.25.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
