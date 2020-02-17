Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DF53F161937
	for <lists+dri-devel@lfdr.de>; Mon, 17 Feb 2020 18:55:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DD0C6E999;
	Mon, 17 Feb 2020 17:55:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99E346E998
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Feb 2020 17:55:22 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id c9so20840921wrw.8
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Feb 2020 09:55:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=QJ+sAtf0sl4WFA+MtjYOgUYWzpiqGm+srBeq0Yw7h3s=;
 b=EZsS2iSUTXjt/GUPkqOdkXPYOpNWd7Gu5NyJgAyxYJHwtAbjIxTw6gqEEu/xLPulG0
 IRFozHspStxLZjmG6Zndgxgt7EQm2+yT6gM+80Z9TUWNKqUVd6lb0hU6UoAx1ueL/84E
 UzztqGbwIx97I44SQzNw/QK8eWXGyVLDdLSNw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=QJ+sAtf0sl4WFA+MtjYOgUYWzpiqGm+srBeq0Yw7h3s=;
 b=Mnlyq5Xx1qWsl36CP1lnbKPru3U+BWhtrPTSHI1EgjcH10Ve/Wwzq9MmAnPmGud+NU
 OTJZ5xCXHwLl6FoZUx3HKZgopsP7St8YpOuH88P2lpmnpPbAmvEBBvSTcqcbu1qQlJ8t
 +BEooNAKe3BngxZqp+7fAIms5YUYwBGaTGxi7vzLBGkqAT+7eNUeGZIaF2UI/amW3Cei
 EYu2ts0GN6/KiMKXjqA6/1ScGSOcEdzyT+qxXRtrcuIgrGKXrkuol9Pho1JeLsZ4vDZT
 r0eNeLlwnodIcDOitt4JD6MkFzNvCIqlAbBjGef44TlDEHC/VsDugsE7W1Vyt/E4RTY0
 3uzA==
X-Gm-Message-State: APjAAAXm7zY1Um0uJ8zUN5XdOlLn6x6DV1vY+Xe46Uvo1W2Q7XId54Yh
 Y70ulEBbYku064DUWr44V3I8QQ8RZQY=
X-Google-Smtp-Source: APXvYqyJDKap71+xbi+IuYscPsJ8tBI22qhbq/b57AtRC2wcYuxxAGyLOyJ+Lxi4xra0AoW/dFwKIg==
X-Received: by 2002:adf:e5c6:: with SMTP id a6mr23714896wrn.185.1581962121032; 
 Mon, 17 Feb 2020 09:55:21 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id d13sm2240406wrc.64.2020.02.17.09.55.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Feb 2020 09:55:20 -0800 (PST)
Date: Mon, 17 Feb 2020 18:55:18 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [PATCH 5/5] drm/amdgpu: implement amdgpu_gem_prime_move_notify v2
Message-ID: <20200217175518.GL2363188@phenom.ffwll.local>
References: <20200217154509.2265-1-christian.koenig@amd.com>
 <20200217154509.2265-6-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200217154509.2265-6-christian.koenig@amd.com>
X-Operating-System: Linux phenom 5.3.0-3-amd64 
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
Cc: linaro-mm-sig@lists.linaro.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Feb 17, 2020 at 04:45:09PM +0100, Christian K=F6nig wrote:
> Implement the importer side of unpinned DMA-buf handling.
> =

> v2: update page tables immediately
> =

> Signed-off-by: Christian K=F6nig <christian.koenig@amd.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c | 66 ++++++++++++++++++++-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_object.c  |  6 ++
>  2 files changed, 71 insertions(+), 1 deletion(-)
> =

> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c b/drivers/gpu/dr=
m/amd/amdgpu/amdgpu_dma_buf.c
> index 770baba621b3..48de7624d49c 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
> @@ -453,7 +453,71 @@ amdgpu_dma_buf_create_obj(struct drm_device *dev, st=
ruct dma_buf *dma_buf)
>  	return ERR_PTR(ret);
>  }
>  =

> +/**
> + * amdgpu_dma_buf_move_notify - &attach.move_notify implementation
> + *
> + * @attach: the DMA-buf attachment
> + *
> + * Invalidate the DMA-buf attachment, making sure that the we re-create =
the
> + * mapping before the next use.
> + */
> +static void
> +amdgpu_dma_buf_move_notify(struct dma_buf_attachment *attach)
> +{
> +	struct drm_gem_object *obj =3D attach->importer_priv;
> +	struct ww_acquire_ctx *ticket =3D dma_resv_locking_ctx(obj->resv);
> +	struct amdgpu_bo *bo =3D gem_to_amdgpu_bo(obj);
> +	struct amdgpu_device *adev =3D amdgpu_ttm_adev(bo->tbo.bdev);
> +	struct ttm_operation_ctx ctx =3D { false, false };
> +	struct ttm_placement placement =3D {};
> +	struct amdgpu_vm_bo_base *bo_base;
> +	int r;
> +
> +	if (bo->tbo.mem.mem_type =3D=3D TTM_PL_SYSTEM)
> +		return;
> +
> +	r =3D ttm_bo_validate(&bo->tbo, &placement, &ctx);
> +	if (r) {
> +		DRM_ERROR("Failed to invalidate DMA-buf import (%d))\n", r);
> +		return;
> +	}
> +
> +	for (bo_base =3D bo->vm_bo; bo_base; bo_base =3D bo_base->next) {
> +		struct amdgpu_vm *vm =3D bo_base->vm;
> +		struct dma_resv *resv =3D vm->root.base.bo->tbo.base.resv;
> +
> +		if (ticket) {

Yeah so this is kinda why I've been a total pain about the exact semantics
of the move_notify hook. I think we should flat-out require that importers
_always_ have a ticket attach when they call this, and that they can cope
with additional locks being taken (i.e. full EDEADLCK) handling.

Simplest way to force that contract is to add a dummy 2nd ww_mutex lock to
the dma_resv object, which we then can take #ifdef
CONFIG_WW_MUTEX_SLOWPATH_DEBUG. Plus mabye a WARN_ON(!ticket).

Now the real disaster is how we handle deadlocks. Two issues:

- Ideally we'd keep any lock we've taken locked until the end, it helps
  needless backoffs. I've played around a bit with that but not even poc
  level, just an idea:

https://cgit.freedesktop.org/~danvet/drm/commit/?id=3Db1799c5a0f02df9e1bb08=
d27be37331255ab7582

  Idea is essentially to track a list of objects we had to lock as part of
  the ttm_bo_validate of the main object.

- Second one is if we get a EDEADLCK on one of these sublocks (like the
  one here). We need to pass that up the entire callchain, including a
  temporary reference (we have to drop locks to do the ww_mutex_lock_slow
  call), and need a custom callback to drop that temporary reference
  (since that's all driver specific, might even be internal ww_mutex and
  not anything remotely looking like a normal dma_buf). This probably
  needs the exec util helpers from ttm, but at the dma_resv level, so that
  we can do something like this:

struct dma_resv_ticket {
	struct ww_acquire_ctx base;

	/* can be set by anyone (including other drivers) that got hold of
	 * this ticket and had to acquire some new lock. This lock might
	 * protect anything, including driver-internal stuff, and isn't
	 * required to be a dma_buf or even just a dma_resv. */
	struct ww_mutex *contended_lock;

	/* callback which the driver (which might be a dma-buf exporter
	 * and not matching the driver that started this locking ticket)
	 * sets together with @contended_lock, for the main driver to drop
	 * when it calls dma_resv_unlock on the contended_lock. */
	void (drop_ref*)(struct ww_mutex *contended_lock);
};

This is all supremely nasty (also ttm_bo_validate would need to be
improved to handle these sublocks and random new objects that could force
a ww_mutex_lock_slow).

Plan B would be to throw our hands into and declare that "move_notify is
best effort only and can fail for any reason". Exactly like ttm eviction
currently does, even with all your hacks to do at least some dma_resv_lock
(but not the full slowpath).

Given how much "fun" you have with all the low memory handling and ttm
fundamentally being best-effort only (despite that dma_resv would allow us
to do this right, with some work) I'm not sure that's a good idea to
extend to a cross-driver interface. Personally I'd lean towards fixing
this first fully (in ttm/amdgpu), and then using that to implement
move_notify correctly.

Or just add an int return value here and mandate that importers must
handle eviction failures. Exactly like ttm_mem_evict_first can currently
still fail for various reasons.

(Sorry this isn't exactly the mail you hoped for)

Cheers, Daniel

> +			/* When we get an error here it means that somebody
> +			 * else is holding the VM lock and updating page tables
> +			 * So we can just continue here.
> +			 */
> +			r =3D dma_resv_lock(resv, ticket);
> +			if (r)
> +				continue;
> +
> +		} else {
> +			/* TODO: This is more problematic and we actually need
> +			 * to allow page tables updates without holding the
> +			 * lock.
> +			 */
> +			if (!dma_resv_trylock(resv))
> +				continue;
> +		}
> +
> +		r =3D amdgpu_vm_clear_freed(adev, vm, NULL);
> +		if (!r)
> +			r =3D amdgpu_vm_handle_moved(adev, vm);
> +
> +		if (r && r !=3D -EBUSY)
> +			DRM_ERROR("Failed to invalidate VM page tables (%d))\n",
> +				  r);
> +
> +		dma_resv_unlock(resv);
> +	}
> +}
> +
>  static const struct dma_buf_attach_ops amdgpu_dma_buf_attach_ops =3D {
> +	.move_notify =3D amdgpu_dma_buf_move_notify
>  };
>  =

>  /**
> @@ -489,7 +553,7 @@ struct drm_gem_object *amdgpu_gem_prime_import(struct=
 drm_device *dev,
>  		return obj;
>  =

>  	attach =3D dma_buf_dynamic_attach(dma_buf, dev->dev,
> -					&amdgpu_dma_buf_attach_ops, NULL);
> +					&amdgpu_dma_buf_attach_ops, obj);
>  	if (IS_ERR(attach)) {
>  		drm_gem_object_put(obj);
>  		return ERR_CAST(attach);
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/drm=
/amd/amdgpu/amdgpu_object.c
> index 8ae260822908..8c480c898b0d 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> @@ -926,6 +926,9 @@ int amdgpu_bo_pin_restricted(struct amdgpu_bo *bo, u3=
2 domain,
>  		return 0;
>  	}
>  =

> +	if (bo->tbo.base.import_attach)
> +		dma_buf_pin(bo->tbo.base.import_attach);
> +
>  	bo->flags |=3D AMDGPU_GEM_CREATE_VRAM_CONTIGUOUS;
>  	/* force to pin into visible video ram */
>  	if (!(bo->flags & AMDGPU_GEM_CREATE_NO_CPU_ACCESS))
> @@ -1009,6 +1012,9 @@ int amdgpu_bo_unpin(struct amdgpu_bo *bo)
>  =

>  	amdgpu_bo_subtract_pin_size(bo);
>  =

> +	if (bo->tbo.base.import_attach)
> +		dma_buf_unpin(bo->tbo.base.import_attach);
> +
>  	for (i =3D 0; i < bo->placement.num_placement; i++) {
>  		bo->placements[i].lpfn =3D 0;
>  		bo->placements[i].flags &=3D ~TTM_PL_FLAG_NO_EVICT;
> -- =

> 2.17.1
> =


-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
