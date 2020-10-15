Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B8ACD28F722
	for <lists+dri-devel@lfdr.de>; Thu, 15 Oct 2020 18:49:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFA036ED94;
	Thu, 15 Oct 2020 16:49:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F81D6ED95
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Oct 2020 16:49:15 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id y12so4363856wrp.6
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Oct 2020 09:49:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=qcu7vbDkPHQ/dX3NgTIESQdy57qDX1kkbPJO+QtJy7U=;
 b=YX+pr8t3FbpyHf00VK8ZlbMj1z0EZQLLdj8cqVbimoBHqglJJQY6vri+ZumBLz/Pg0
 X4oNhhYpTjQWsCIyEZEhZplvY4V9uawMTFvhkOXqaad7727cHwmGjbJI/EP13XP/fzzn
 5PC8utpu1BcKtOPqAGQ33UWPCcQmJrkS7kwLc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=qcu7vbDkPHQ/dX3NgTIESQdy57qDX1kkbPJO+QtJy7U=;
 b=FnHF5y7adwzeB5K3nGCb9aTASj+Zu5gBlIlq8sS8HEYHN+QOjhxdRdh0qfPZUPYCBx
 wHcoeDveeNxnyWfnSucm8YxmgqepXj769G7W9rY/jmRTAhA0XeadEWdJ/Chl9hgYOaqi
 zz/hydxAxdoOHK5DPoFfH6bCkyy90Ggqfg0zTIP4/9fbG9n6ZT2XIKUg4AJwYxmtrIls
 NdYt+3eg3hXWfdKSMjhISpRimrHSGe6MIwZIO17/XkCr2tUfeVmSMi7R7G3KJeryeZrd
 2XFqKOLVPUhGN23/49zQUDZYUaR8kUjw5oEiH7s3eEZH+V7/J2ZZRlOc1gL5yif9CwZh
 f+7g==
X-Gm-Message-State: AOAM533f+PvmFDMtT8WSlFCJNVz27cGIvZiIspOkIP3Gb49iMCzM6uA8
 4tlgZK5a0KSw4gKCSJR+DWmAKA==
X-Google-Smtp-Source: ABdhPJyv9K9powSi+g3c0tJ2hulpH+XMJ0c3fzWMHzpnDe/dmPLbxFxjyntSdoFtKycWWSiBvrXq0Q==
X-Received: by 2002:adf:9ec2:: with SMTP id b2mr5396302wrf.107.1602780553658; 
 Thu, 15 Oct 2020 09:49:13 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id j7sm4950464wmc.7.2020.10.15.09.49.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Oct 2020 09:49:12 -0700 (PDT)
Date: Thu, 15 Oct 2020 18:49:09 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Subject: Re: [PATCH v4 05/10] drm/ttm: Add vmap/vunmap to TTM and TTM GEM
 helpers
Message-ID: <20201015164909.GC401619@phenom.ffwll.local>
References: <20201015123806.32416-1-tzimmermann@suse.de>
 <20201015123806.32416-6-tzimmermann@suse.de>
 <935d5771-5645-62a6-849c-31e286db1e30@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <935d5771-5645-62a6-849c-31e286db1e30@amd.com>
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
Cc: luben.tuikov@amd.com, airlied@linux.ie, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, chris@chris-wilson.co.uk,
 melissa.srw@gmail.com, ray.huang@amd.com, kraxel@redhat.com, sam@ravnborg.org,
 emil.velikov@collabora.com, linux-samsung-soc@vger.kernel.org,
 jy0922.shim@samsung.com, lima@lists.freedesktop.org,
 oleksandr_andrushchenko@epam.com, krzk@kernel.org, steven.price@arm.com,
 linux-rockchip@lists.infradead.org, kgene@kernel.org, bskeggs@redhat.com,
 linux+etnaviv@armlinux.org.uk, spice-devel@lists.freedesktop.org,
 alyssa.rosenzweig@collabora.com, etnaviv@lists.freedesktop.org,
 hdegoede@redhat.com, xen-devel@lists.xenproject.org,
 virtualization@lists.linux-foundation.org, sean@poorly.run, apaneers@amd.com,
 linux-arm-kernel@lists.infradead.org, linaro-mm-sig@lists.linaro.org,
 amd-gfx@lists.freedesktop.org, tomeu.vizoso@collabora.com,
 sw0312.kim@samsung.com, hjc@rock-chips.com, kyungmin.park@samsung.com,
 miaoqinglang@huawei.com, yuq825@gmail.com,
 Thomas Zimmermann <tzimmermann@suse.de>, alexander.deucher@amd.com,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Oct 15, 2020 at 04:08:13PM +0200, Christian K=F6nig wrote:
> Am 15.10.20 um 14:38 schrieb Thomas Zimmermann:
> > The new functions ttm_bo_{vmap,vunmap}() map and unmap a TTM BO in kern=
el
> > address space. The mapping's address is returned as struct dma_buf_map.
> > Each function is a simplified version of TTM's existing kmap code. Both
> > functions respect the memory's location ani/or writecombine flags.
> > =

> > On top TTM's functions, GEM TTM helpers got drm_gem_ttm_{vmap,vunmap}(),
> > two helpers that convert a GEM object into the TTM BO and forward the c=
all
> > to TTM's vmap/vunmap. These helpers can be dropped into the rsp GEM obj=
ect
> > callbacks.
> > =

> > v4:
> > 	* drop ttm_kmap_obj_to_dma_buf() in favor of vmap helpers (Daniel,
> > 	  Christian)
> =

> Bunch of minor comments below, but over all look very solid to me.

Yeah I think just duplicating the ttm bo map stuff for vmap is indeed the
cleanest. And then we can maybe push the combinatorial monster into
vmwgfx, which I think is the only user after this series. Or perhaps a
dedicated set of helpers to map an invidual page (again using the
dma_buf_map stuff).

I'll let Christian with the details, but at a high level this is
definitely

Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>

Thanks a lot for doing all this.
-Daniel

> =

> > =

> > Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> > ---
> >   drivers/gpu/drm/drm_gem_ttm_helper.c | 38 +++++++++++++++
> >   drivers/gpu/drm/ttm/ttm_bo_util.c    | 72 ++++++++++++++++++++++++++++
> >   include/drm/drm_gem_ttm_helper.h     |  6 +++
> >   include/drm/ttm/ttm_bo_api.h         | 28 +++++++++++
> >   include/linux/dma-buf-map.h          | 20 ++++++++
> >   5 files changed, 164 insertions(+)
> > =

> > diff --git a/drivers/gpu/drm/drm_gem_ttm_helper.c b/drivers/gpu/drm/drm=
_gem_ttm_helper.c
> > index 0e4fb9ba43ad..db4c14d78a30 100644
> > --- a/drivers/gpu/drm/drm_gem_ttm_helper.c
> > +++ b/drivers/gpu/drm/drm_gem_ttm_helper.c
> > @@ -49,6 +49,44 @@ void drm_gem_ttm_print_info(struct drm_printer *p, u=
nsigned int indent,
> >   }
> >   EXPORT_SYMBOL(drm_gem_ttm_print_info);
> > +/**
> > + * drm_gem_ttm_vmap() - vmap &ttm_buffer_object
> > + * @gem: GEM object.
> > + * @map: [out] returns the dma-buf mapping.
> > + *
> > + * Maps a GEM object with ttm_bo_vmap(). This function can be used as
> > + * &drm_gem_object_funcs.vmap callback.
> > + *
> > + * Returns:
> > + * 0 on success, or a negative errno code otherwise.
> > + */
> > +int drm_gem_ttm_vmap(struct drm_gem_object *gem,
> > +		     struct dma_buf_map *map)
> > +{
> > +	struct ttm_buffer_object *bo =3D drm_gem_ttm_of_gem(gem);
> > +
> > +	return ttm_bo_vmap(bo, map);
> > +
> > +}
> > +EXPORT_SYMBOL(drm_gem_ttm_vmap);
> > +
> > +/**
> > + * drm_gem_ttm_vunmap() - vunmap &ttm_buffer_object
> > + * @gem: GEM object.
> > + * @map: dma-buf mapping.
> > + *
> > + * Unmaps a GEM object with ttm_bo_vunmap(). This function can be used=
 as
> > + * &drm_gem_object_funcs.vmap callback.
> > + */
> > +void drm_gem_ttm_vunmap(struct drm_gem_object *gem,
> > +			struct dma_buf_map *map)
> > +{
> > +	struct ttm_buffer_object *bo =3D drm_gem_ttm_of_gem(gem);
> > +
> > +	ttm_bo_vunmap(bo, map);
> > +}
> > +EXPORT_SYMBOL(drm_gem_ttm_vunmap);
> > +
> >   /**
> >    * drm_gem_ttm_mmap() - mmap &ttm_buffer_object
> >    * @gem: GEM object.
> > diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c b/drivers/gpu/drm/ttm/tt=
m_bo_util.c
> > index bdee4df1f3f2..80c42c774c7d 100644
> > --- a/drivers/gpu/drm/ttm/ttm_bo_util.c
> > +++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
> > @@ -32,6 +32,7 @@
> >   #include <drm/ttm/ttm_bo_driver.h>
> >   #include <drm/ttm/ttm_placement.h>
> >   #include <drm/drm_vma_manager.h>
> > +#include <linux/dma-buf-map.h>
> >   #include <linux/io.h>
> >   #include <linux/highmem.h>
> >   #include <linux/wait.h>
> > @@ -526,6 +527,77 @@ void ttm_bo_kunmap(struct ttm_bo_kmap_obj *map)
> >   }
> >   EXPORT_SYMBOL(ttm_bo_kunmap);
> > +int ttm_bo_vmap(struct ttm_buffer_object *bo, struct dma_buf_map *map)
> > +{
> > +	struct ttm_resource *mem =3D &bo->mem;
> > +	int ret;
> > +
> > +	ret =3D ttm_mem_io_reserve(bo->bdev, mem);
> > +	if (ret)
> > +		return ret;
> > +
> > +	if (mem->bus.is_iomem) {
> > +		void __iomem *vaddr_iomem;
> > +		unsigned long size =3D bo->num_pages << PAGE_SHIFT;
> =

> Please use uint64_t here and make sure to cast bo->num_pages before
> shifting.
> =

> We have an unit tests of allocating a 8GB BO and that should work on a 32=
bit
> machine as well :)
> =

> > +
> > +		if (mem->bus.addr)
> > +			vaddr_iomem =3D (void *)(((u8 *)mem->bus.addr));
> > +		else if (mem->placement & TTM_PL_FLAG_WC)
> =

> I've just nuked the TTM_PL_FLAG_WC flag in drm-misc-next. There is a new
> mem->bus.caching enum as replacement.
> =

> > +			vaddr_iomem =3D ioremap_wc(mem->bus.offset, size);
> > +		else
> > +			vaddr_iomem =3D ioremap(mem->bus.offset, size);
> > +
> > +		if (!vaddr_iomem)
> > +			return -ENOMEM;
> > +
> > +		dma_buf_map_set_vaddr_iomem(map, vaddr_iomem);
> > +
> > +	} else {
> > +		struct ttm_operation_ctx ctx =3D {
> > +			.interruptible =3D false,
> > +			.no_wait_gpu =3D false
> > +		};
> > +		struct ttm_tt *ttm =3D bo->ttm;
> > +		pgprot_t prot;
> > +		void *vaddr;
> > +
> > +		BUG_ON(!ttm);
> =

> I think we can drop this, populate will just crash badly anyway.
> =

> > +
> > +		ret =3D ttm_tt_populate(bo->bdev, ttm, &ctx);
> > +		if (ret)
> > +			return ret;
> > +
> > +		/*
> > +		 * We need to use vmap to get the desired page protection
> > +		 * or to make the buffer object look contiguous.
> > +		 */
> > +		prot =3D ttm_io_prot(mem->placement, PAGE_KERNEL);
> =

> The calling convention has changed on drm-misc-next as well, but should be
> trivial to adapt.
> =

> Regards,
> Christian.
> =

> > +		vaddr =3D vmap(ttm->pages, bo->num_pages, 0, prot);
> > +		if (!vaddr)
> > +			return -ENOMEM;
> > +
> > +		dma_buf_map_set_vaddr(map, vaddr);
> > +	}
> > +
> > +	return 0;
> > +}
> > +EXPORT_SYMBOL(ttm_bo_vmap);
> > +
> > +void ttm_bo_vunmap(struct ttm_buffer_object *bo, struct dma_buf_map *m=
ap)
> > +{
> > +	if (dma_buf_map_is_null(map))
> > +		return;
> > +
> > +	if (map->is_iomem)
> > +		iounmap(map->vaddr_iomem);
> > +	else
> > +		vunmap(map->vaddr);
> > +	dma_buf_map_clear(map);
> > +
> > +	ttm_mem_io_free(bo->bdev, &bo->mem);
> > +}
> > +EXPORT_SYMBOL(ttm_bo_vunmap);
> > +
> >   static int ttm_bo_wait_free_node(struct ttm_buffer_object *bo,
> >   				 bool dst_use_tt)
> >   {
> > diff --git a/include/drm/drm_gem_ttm_helper.h b/include/drm/drm_gem_ttm=
_helper.h
> > index 118cef76f84f..7c6d874910b8 100644
> > --- a/include/drm/drm_gem_ttm_helper.h
> > +++ b/include/drm/drm_gem_ttm_helper.h
> > @@ -10,11 +10,17 @@
> >   #include <drm/ttm/ttm_bo_api.h>
> >   #include <drm/ttm/ttm_bo_driver.h>
> > +struct dma_buf_map;
> > +
> >   #define drm_gem_ttm_of_gem(gem_obj) \
> >   	container_of(gem_obj, struct ttm_buffer_object, base)
> >   void drm_gem_ttm_print_info(struct drm_printer *p, unsigned int inden=
t,
> >   			    const struct drm_gem_object *gem);
> > +int drm_gem_ttm_vmap(struct drm_gem_object *gem,
> > +		     struct dma_buf_map *map);
> > +void drm_gem_ttm_vunmap(struct drm_gem_object *gem,
> > +			struct dma_buf_map *map);
> >   int drm_gem_ttm_mmap(struct drm_gem_object *gem,
> >   		     struct vm_area_struct *vma);
> > diff --git a/include/drm/ttm/ttm_bo_api.h b/include/drm/ttm/ttm_bo_api.h
> > index 37102e45e496..2c59a785374c 100644
> > --- a/include/drm/ttm/ttm_bo_api.h
> > +++ b/include/drm/ttm/ttm_bo_api.h
> > @@ -48,6 +48,8 @@ struct ttm_bo_global;
> >   struct ttm_bo_device;
> > +struct dma_buf_map;
> > +
> >   struct drm_mm_node;
> >   struct ttm_placement;
> > @@ -494,6 +496,32 @@ int ttm_bo_kmap(struct ttm_buffer_object *bo, unsi=
gned long start_page,
> >    */
> >   void ttm_bo_kunmap(struct ttm_bo_kmap_obj *map);
> > +/**
> > + * ttm_bo_vmap
> > + *
> > + * @bo: The buffer object.
> > + * @map: pointer to a struct dma_buf_map representing the map.
> > + *
> > + * Sets up a kernel virtual mapping, using ioremap or vmap to the
> > + * data in the buffer object. The parameter @map returns the virtual
> > + * address as struct dma_buf_map. Unmap the buffer with ttm_bo_vunmap(=
).
> > + *
> > + * Returns
> > + * -ENOMEM: Out of memory.
> > + * -EINVAL: Invalid range.
> > + */
> > +int ttm_bo_vmap(struct ttm_buffer_object *bo, struct dma_buf_map *map);
> > +
> > +/**
> > + * ttm_bo_vunmap
> > + *
> > + * @bo: The buffer object.
> > + * @map: Object describing the map to unmap.
> > + *
> > + * Unmaps a kernel map set up by ttm_bo_vmap().
> > + */
> > +void ttm_bo_vunmap(struct ttm_buffer_object *bo, struct dma_buf_map *m=
ap);
> > +
> >   /**
> >    * ttm_bo_mmap_obj - mmap memory backed by a ttm buffer object.
> >    *
> > diff --git a/include/linux/dma-buf-map.h b/include/linux/dma-buf-map.h
> > index fd1aba545fdf..2e8bbecb5091 100644
> > --- a/include/linux/dma-buf-map.h
> > +++ b/include/linux/dma-buf-map.h
> > @@ -45,6 +45,12 @@
> >    *
> >    *	dma_buf_map_set_vaddr(&map. 0xdeadbeaf);
> >    *
> > + * To set an address in I/O memory, use dma_buf_map_set_vaddr_iomem().
> > + *
> > + * .. code-block:: c
> > + *
> > + *	dma_buf_map_set_vaddr_iomem(&map. 0xdeadbeaf);
> > + *
> >    * Test if a mapping is valid with either dma_buf_map_is_set() or
> >    * dma_buf_map_is_null().
> >    *
> > @@ -118,6 +124,20 @@ static inline void dma_buf_map_set_vaddr(struct dm=
a_buf_map *map, void *vaddr)
> >   	map->is_iomem =3D false;
> >   }
> > +/**
> > + * dma_buf_map_set_vaddr_iomem - Sets a dma-buf mapping structure to a=
n address in I/O memory
> > + * @map:		The dma-buf mapping structure
> > + * @vaddr_iomem:	An I/O-memory address
> > + *
> > + * Sets the address and the I/O-memory flag.
> > + */
> > +static inline void dma_buf_map_set_vaddr_iomem(struct dma_buf_map *map,
> > +					       void __iomem *vaddr_iomem)
> > +{
> > +	map->vaddr_iomem =3D vaddr_iomem;
> > +	map->is_iomem =3D true;
> > +}
> > +
> >   /**
> >    * dma_buf_map_is_equal - Compares two dma-buf mapping structures for=
 equality
> >    * @lhs:	The dma-buf mapping structure
> =


-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
