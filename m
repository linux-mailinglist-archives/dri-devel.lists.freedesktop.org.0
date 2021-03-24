Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E95A347D98
	for <lists+dri-devel@lfdr.de>; Wed, 24 Mar 2021 17:22:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E44106EC8F;
	Wed, 24 Mar 2021 16:21:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1237A6EC8D
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Mar 2021 16:21:59 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id x16so25046854wrn.4
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Mar 2021 09:21:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=Irtn7evbQAapmOFyknHAFV3hTOtBL608XyKKcU/zj18=;
 b=BB7l6hN5FF6TXFIwI4yYt7n0pQkDgC3f5H/uYXX5sk1RUgepzYeSH0HNB9F1kuZnhM
 THSuP2zAHBFIpq5OqBgmLCvhZz2BwzETW7VHMEQaseOOWgBiftcK1KPgMPmvvKR37Lvn
 K9im6B4sbSQ8jDe96KfxornY7v4ginmvIh5+c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=Irtn7evbQAapmOFyknHAFV3hTOtBL608XyKKcU/zj18=;
 b=lQwp4dS1ZD/LDgL0lVTzuGWmAt0+/qNFwem2dTl310dOscxGp5yj+JfqgsVV7pUSyO
 QotWdYzI4CrmLrYSe2b3CXQLyg1Fx2nE5yk/Xmx3XgIQxxQXsUVZnHeLlcxfMIsIY25K
 oWS4meB/me3KQlA7U9b69JlgqMtYG+0QT6uCV/GzRIBzNHKv9u1FEoGSz+Ee8K8cEV6l
 bq76q47K3lJBnl8JkGIkVW40a5lak886F6m+EG53hHDz7uj2NK5zcfZkFcIh04NQnJlt
 QtWF5KyS5Sd/4CZPSqso0FJ694YMmaqcWjbg3viqFUAv5zUvGFWzlrtn+maS/rZGkGsj
 ciDQ==
X-Gm-Message-State: AOAM533n8phSQ1GsUp861aKd8k+D9OAB7RB96n4wVrqflfKwOQx2MWlJ
 Weiu0mO56QgdSQBA5g+Kco+51jYFoB7mm6O3
X-Google-Smtp-Source: ABdhPJy2piEVnXLnDB6ik0UTudpuslnTxC7b+FIik03v2qb+dHqQc2JMVgJPH+oq0qoMzxQFZpZbnA==
X-Received: by 2002:a5d:6b89:: with SMTP id n9mr3832499wrx.236.1616602917810; 
 Wed, 24 Mar 2021 09:21:57 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id i26sm3110360wmb.18.2021.03.24.09.21.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Mar 2021 09:21:57 -0700 (PDT)
Date: Wed, 24 Mar 2021 17:21:55 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: Re: [Intel-gfx] [PATCH v9 34/70] drm/i915: Add ww locking around
 vm_access()
Message-ID: <YFtnIxJ66LZ9cisQ@phenom.ffwll.local>
References: <20210323155059.628690-1-maarten.lankhorst@linux.intel.com>
 <20210323155059.628690-35-maarten.lankhorst@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210323155059.628690-35-maarten.lankhorst@linux.intel.com>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
Cc: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Mar 23, 2021 at 04:50:23PM +0100, Maarten Lankhorst wrote:
> i915_gem_object_pin_map potentially needs a ww context, so ensure we
> have one we can revoke.
> =

> Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Reviewed-by: Thomas Hellstr=F6m <thomas.hellstrom@linux.intel.com>

We shouldn't hand-roll our own vm_access callback, generic_access_phys
should be used here instead.

I've applied this, but can you pls do a follow up patch here?

Thanks, Daniel

> ---
>  drivers/gpu/drm/i915/gem/i915_gem_mman.c | 24 ++++++++++++++++++++++--
>  1 file changed, 22 insertions(+), 2 deletions(-)
> =

> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_mman.c b/drivers/gpu/drm/i=
915/gem/i915_gem_mman.c
> index 163208a6260d..2561a2f1e54f 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_mman.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
> @@ -421,7 +421,9 @@ vm_access(struct vm_area_struct *area, unsigned long =
addr,
>  {
>  	struct i915_mmap_offset *mmo =3D area->vm_private_data;
>  	struct drm_i915_gem_object *obj =3D mmo->obj;
> +	struct i915_gem_ww_ctx ww;
>  	void *vaddr;
> +	int err =3D 0;
>  =

>  	if (i915_gem_object_is_readonly(obj) && write)
>  		return -EACCES;
> @@ -430,10 +432,18 @@ vm_access(struct vm_area_struct *area, unsigned lon=
g addr,
>  	if (addr >=3D obj->base.size)
>  		return -EINVAL;
>  =

> +	i915_gem_ww_ctx_init(&ww, true);
> +retry:
> +	err =3D i915_gem_object_lock(obj, &ww);
> +	if (err)
> +		goto out;
> +
>  	/* As this is primarily for debugging, let's focus on simplicity */
>  	vaddr =3D i915_gem_object_pin_map(obj, I915_MAP_FORCE_WC);
> -	if (IS_ERR(vaddr))
> -		return PTR_ERR(vaddr);
> +	if (IS_ERR(vaddr)) {
> +		err =3D PTR_ERR(vaddr);
> +		goto out;
> +	}
>  =

>  	if (write) {
>  		memcpy(vaddr + addr, buf, len);
> @@ -443,6 +453,16 @@ vm_access(struct vm_area_struct *area, unsigned long=
 addr,
>  	}
>  =

>  	i915_gem_object_unpin_map(obj);
> +out:
> +	if (err =3D=3D -EDEADLK) {
> +		err =3D i915_gem_ww_ctx_backoff(&ww);
> +		if (!err)
> +			goto retry;
> +	}
> +	i915_gem_ww_ctx_fini(&ww);
> +
> +	if (err)
> +		return err;
>  =

>  	return len;
>  }
> -- =

> 2.31.0
> =

> _______________________________________________
> Intel-gfx mailing list
> Intel-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gfx

-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
