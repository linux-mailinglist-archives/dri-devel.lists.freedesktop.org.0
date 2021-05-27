Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0668639356E
	for <lists+dri-devel@lfdr.de>; Thu, 27 May 2021 20:30:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 082B26E05D;
	Thu, 27 May 2021 18:30:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 077FE6E1F8
 for <dri-devel@lists.freedesktop.org>; Thu, 27 May 2021 18:30:13 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 u4-20020a05600c00c4b02901774b80945cso3165402wmm.3
 for <dri-devel@lists.freedesktop.org>; Thu, 27 May 2021 11:30:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=th4fpjlCF9zEoEEQL6PVdHcI+KOR2e327eVJ2akX43w=;
 b=VgH9yPk+yusgKAEZ3cMdWYs6VDKFj8bpLMYsh7qIXky5daSFv1Uqx5TjP5PNWuZLDw
 1iTePgdTkjV3eocy+FDJhD4vQSqSrTvXhPyANhnUpgWyH4bh6ZbFpt0HA8XUGumImR9B
 DwBZ55UWyW408BbMTj50z3VAaQPvWjJWr/cW4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=th4fpjlCF9zEoEEQL6PVdHcI+KOR2e327eVJ2akX43w=;
 b=ULflKyduxbJU80043Rb1kiixaerhU0yqxT2h7RlI7fXZDxSOwBh5e6fgYrm2iYj5m8
 BGZPSvlHRU8SL9r62T9iWl4rUuFJCxgkI2A2cLbCOMvbIp4J1D2MsbDIik4ZtT7OGpL3
 zuy+xGqhDvj5uCCnSLf81toj1+k92fqqwzrcy97KUPEiaSG16rK8Q1ZRjCie86ROXWdL
 Jyp5Adc1dacOuIEcHUzAtfdut01zWNW+OEiXGl13vmgxkQSBgM1KV2gZCFAkioOu1VdT
 7xHxrBOSCUTMsff41m2z2tZm4bR5nDGEU/9LgjY1+NXFP+AMa3KR4/XaOmU7iCj7Ffun
 4Fqg==
X-Gm-Message-State: AOAM530aUGAxD3h2idihMwLDwowi1V6K+B08hrl//rhZiOsZyfuYbsqs
 30mgM+OFEyNpLgXQkFKW/4oREw==
X-Google-Smtp-Source: ABdhPJziW9WSdPo0Wi7PQWmG3oT+MzPgwwTUVGa0LlgKpC/KOMiD96QWcEjQAz/giRnJ8iZOiaeMBw==
X-Received: by 2002:a05:600c:214f:: with SMTP id
 v15mr9959420wml.86.1622140211523; 
 Thu, 27 May 2021 11:30:11 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id m7sm4930102wrv.35.2021.05.27.11.30.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 May 2021 11:30:10 -0700 (PDT)
Date: Thu, 27 May 2021 20:30:09 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Jason Ekstrand <jason@jlekstrand.net>
Subject: Re: [PATCH 19/29] drm/i915: Add an i915_gem_vm_lookup helper
Message-ID: <YK/lMS/h30vd48FF@phenom.ffwll.local>
References: <20210527162650.1182544-1-jason@jlekstrand.net>
 <20210527162650.1182544-20-jason@jlekstrand.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210527162650.1182544-20-jason@jlekstrand.net>
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, May 27, 2021 at 11:26:40AM -0500, Jason Ekstrand wrote:
> This is the VM equivalent of i915_gem_context_lookup.  It's only used
> once in this patch but future patches will need to duplicate this lookup
> code so it's better to have it in a helper.
> 
> Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> ---
>  drivers/gpu/drm/i915/gem/i915_gem_context.c |  6 +-----
>  drivers/gpu/drm/i915/i915_drv.h             | 14 ++++++++++++++
>  2 files changed, 15 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/gem/i915_gem_context.c
> index d247fb223aac7..12a148ba421b6 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
> @@ -1346,11 +1346,7 @@ static int set_ppgtt(struct drm_i915_file_private *file_priv,
>  	if (upper_32_bits(args->value))
>  		return -ENOENT;
>  
> -	rcu_read_lock();
> -	vm = xa_load(&file_priv->vm_xa, args->value);
> -	if (vm && !kref_get_unless_zero(&vm->ref))
> -		vm = NULL;
> -	rcu_read_unlock();
> +	vm = i915_gem_vm_lookup(file_priv, args->value);
>  	if (!vm)
>  		return -ENOENT;
>  
> diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
> index 48316d273af66..fee2342219da1 100644
> --- a/drivers/gpu/drm/i915/i915_drv.h
> +++ b/drivers/gpu/drm/i915/i915_drv.h
> @@ -1871,6 +1871,20 @@ i915_gem_context_lookup(struct drm_i915_file_private *file_priv, u32 id)
>  	return ctx;
>  }
>  
> +static inline struct i915_address_space *
> +i915_gem_vm_lookup(struct drm_i915_file_private *file_priv, u32 id)
> +{
> +	struct i915_address_space *vm;
> +
> +	rcu_read_lock();
> +	vm = xa_load(&file_priv->vm_xa, id);
> +	if (vm && !kref_get_unless_zero(&vm->ref))
> +		vm = NULL;
> +	rcu_read_unlock();
> +
> +	return vm;
> +}
> +
>  /* i915_gem_evict.c */
>  int __must_check i915_gem_evict_something(struct i915_address_space *vm,
>  					  u64 min_size, u64 alignment,
> -- 
> 2.31.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
