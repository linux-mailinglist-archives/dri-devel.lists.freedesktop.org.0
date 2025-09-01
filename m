Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ADE3B3DCF1
	for <lists+dri-devel@lfdr.de>; Mon,  1 Sep 2025 10:47:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CDF910E0AD;
	Mon,  1 Sep 2025 08:47:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="XKqivRFl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4943910E0AD
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Sep 2025 08:47:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1756716448;
 bh=KbPhnUOETMMFwF4s4laWo3ilXs2rgcuT1k1iKLPpCk0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=XKqivRFlonVfPGp8eMySmy7DiiLTvC2k0Mlj2y5/Zro2UzOroPFHXhxzLpxf2XLg5
 x914lO5My7qzuDAMK2D1HVSkEa0qB8fONbTqXjZAaMbFnyIUmh5mhwj7M26+sZ/Qzj
 LGALq5qjWtIMl0GeSlbNEUUylDXYi3WpP4mnpnoQoTZBmAy4LF3S6u2DguUFg39hAM
 AB+i51EQuQ4IjkWAUkUL/Q3Ue1so+LWostgTq8TO/yoMhYfZv3zckx7V18J/FD4nJP
 Q7jo2juEPOO0i7emc1+dGeQfBDtoHqEnhFYUML0k86rGdeRBDySzFr56CTfblgZOp5
 rRp7XgZ92QgGg==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 806D817E127E;
 Mon,  1 Sep 2025 10:47:28 +0200 (CEST)
Date: Mon, 1 Sep 2025 10:47:23 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Adrian Larumbe <adrian.larumbe@collabora.com>
Cc: Faith Ekstrand <faith@gfxstrand.net>, dri-devel@lists.freedesktop.org,
 Faith Ekstrand <faith.ekstrand@collabora.com>, Steven Price
 <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>
Subject: Re: [PATCH 1/7] drm/shmem: Add a drm_gem_shmem_sync_mmap() helper
Message-ID: <20250901104723.0534e46f@fedora>
In-Reply-To: <56gfcb5z757iw5lmj3fkbew37nc7n2oacsxkagu5tlx4h24qeb@lauynfvexbtf>
References: <20250822142954.902402-1-faith.ekstrand@collabora.com>
 <20250822142954.902402-2-faith.ekstrand@collabora.com>
 <56gfcb5z757iw5lmj3fkbew37nc7n2oacsxkagu5tlx4h24qeb@lauynfvexbtf>
Organization: Collabora
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

Hi Adrian,

On Mon, 1 Sep 2025 09:18:49 +0100
Adrian Larumbe <adrian.larumbe@collabora.com> wrote:

> Hi Faith,
> 
> On 22.08.2025 10:29, Faith Ekstrand wrote:
> > This enables syncing mapped GEM objects between the CPU and GPU via calls
> > to dma_sync_*().  It's a bit annoying as it requires walking the sg_table
> > so it's best if every driver doesn't hand-roll it.
> >
> > Signed-off-by: Faith Ekstrand <faith.ekstrand@collabora.com>
> > ---
> >  drivers/gpu/drm/drm_gem_shmem_helper.c | 64 ++++++++++++++++++++++++++
> >  include/drm/drm_gem_shmem_helper.h     |  3 ++
> >  2 files changed, 67 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
> > index 8ac0b1fa5287..50907c1fa11f 100644
> > --- a/drivers/gpu/drm/drm_gem_shmem_helper.c
> > +++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
> > @@ -658,6 +658,70 @@ int drm_gem_shmem_mmap(struct drm_gem_shmem_object *shmem, struct vm_area_struct
> >  }
> >  EXPORT_SYMBOL_GPL(drm_gem_shmem_mmap);
> >
> > +/**
> > + * drm_gem_shmem_sync_mmap - Sync memor-mapped data to/from the device
> > + * @shmem: shmem GEM object
> > + * @offset: Offset into the GEM object
> > + * @size: Size of the area to sync
> > + *
> > + * Returns:
> > + * 0 on success or a negative error code on failure.
> > + */
> > +int
> > +drm_gem_shmem_sync_mmap(struct drm_gem_shmem_object *shmem,
> > +			size_t offset, size_t size,
> > +			enum dma_data_direction dir)
> > +{
> > +	struct drm_device *dev = shmem->base.dev;
> > +	struct sg_table *sgt;
> > +	struct scatterlist *sgl;
> > +	unsigned int count;
> > +
> > +	if (dir == DMA_NONE)
> > +		return 0;
> > +
> > +	/* Don't bother if it's WC-mapped */
> > +	if (shmem->map_wc)
> > +		return 0;
> > +
> > +	if (size == 0)
> > +		return 0;
> > +
> > +	if (offset + size < offset || offset + size > shmem->base.size)
> > +		return -EINVAL;
> > +
> > +	sgt = drm_gem_shmem_get_pages_sgt(shmem);
> > +	if (IS_ERR(sgt))
> > +		return PTR_ERR(sgt);  
> 
> This will allocate pages when the BO had no backing storage yet, otherwise it'll increase the
> refcnt on those pages, but seems to me this will leave the reference count imbalanced.

That may be how we want things to be, but that's not the case in
practice. At the moment, drm_gem_shmem_get_pages_sgt() only increases
the pages refcount if no sgt exists and one needs to be created,
otherwise it simply returns the sgt attached to drm_gem_shmem_object.
This implicit ref on pages is only released when the GEM object is
destroyed, meaning the sgt/pages lifetime is bound to the GEM object
lifetime. That's definitely something we need to address if we want to
have a generic GEM-shmem shrinker, but I don't think this is needed
here.

> 
> I'd say running this function on an object with no storage backing should be considered a no-op:
> 
> ```
> 	if (!shmem->pages)
> 		return 0;
> ```

The mmap()/vmap() implementations call get_pages(), so I would expect
the !shmem->pages case to return an error, not zero. Of course, it
no longer stands if drivers overload the mmap() implementation and call
get_pages() in their fault handler path, in which case, I agree,
returning zero is better, but that's probably something I would let the
drivers check themselves before calling drm_gem_shmem_sync_mmap().

> 
> On top of that, there are code paths in which we allocate pages, but produce no sgtable for them,
> like drm_gem_shmem_mmap(), so maybe we could do as follows:
> 
> ```
> 	if (!shmem->sgt) {
> 		int ret;
> 
> 		ret = dma_resv_lock_interruptible(shmem->base.resv, NULL);
> 		if (ret)
> 			return ret;
> 
> 		sgt = drm_gem_shmem_get_sg_table(shmem);
> 		if (IS_ERR(sgt))
> 			return ret;
> 
> 		shmem->sgt = sgt;
> 	}
> ```

I'm not too sure we want to force an sgt creation if the driver doesn't
need it. What we want to do though is force drivers who need an sgt
to explicitly call _get_pages() instead of relying on the implicit
pages ref currently held by shmem::sgt. But it's all orthogonal to the
changes being proposed in this patch, I think.

Regards,

Boris
