Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B474DA2580A
	for <lists+dri-devel@lfdr.de>; Mon,  3 Feb 2025 12:24:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD58010E480;
	Mon,  3 Feb 2025 11:24:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 8E2F510E480
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Feb 2025 11:24:14 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 43C3111FB
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Feb 2025 03:24:38 -0800 (PST)
Received: from e110455-lin.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 8FA7B3F58B
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Feb 2025 03:24:13 -0800 (PST)
Date: Mon, 3 Feb 2025 11:23:53 +0000
From: Liviu Dudau <liviu.dudau@arm.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Danilo Krummrich <dakr@kernel.org>, asahi@lists.linux.dev,
 Asahi Lina <lina@asahilina.net>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Frank Binns <frank.binns@imgtec.com>, Matt Coster <matt.coster@imgtec.com>,
 Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
 Steven Price <steven.price@arm.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 nouveau@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 akash.goel@arm.com
Subject: Re: [PATCH 0/4] drm/gpuvm: Add support for single-page-filled mappings
Message-ID: <Z6CnSZz_Dm3YpZbx@e110455-lin.cambridge.arm.com>
References: <20250202-gpuvm-single-page-v1-0-8cbd44fdcbd4@asahilina.net>
 <Z5-_O8vkCO0LXcl7@pollux.localdomain>
 <20250203102153.145229e0@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250203102153.145229e0@collabora.com>
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

On Mon, Feb 03, 2025 at 10:21:53AM +0100, Boris Brezillon wrote:
> +Akash with whom we've been discussing adding a 'REPEAT' mode to
> drm_gpuvm/panthor.
> 
> On Sun, 2 Feb 2025 19:53:47 +0100
> Danilo Krummrich <dakr@kernel.org> wrote:
> 
> > Hi Lina,
> > 
> > On Sun, Feb 02, 2025 at 10:34:49PM +0900, Asahi Lina wrote:
> > > Some hardware requires dummy page mappings to efficiently implement
> > > Vulkan sparse features. These mappings consist of the same physical
> > > memory page, repeated for a large range of address space (e.g. 16GiB).
> > > 
> > > Add support for this to drm_gpuvm. Currently, drm_gpuvm expects BO
> > > ranges to correspond 1:1 to virtual memory ranges that are mapped, and
> > > does math on the BO offset accordingly. To make single page mappings
> > > work, we need a way to turn off that math, keeping the BO offset always
> > > constant and pointing to the same page (typically BO offset 0).
> > > 
> > > To make this work, we need to handle all the corner cases when these
> > > mappings intersect with regular mappings. The rules are simply to never
> > > mix or merge a "regular" mapping with a single page mapping.
> > > 
> > > drm_gpuvm has support for a flags field in drm_gpuva objects. This is
> > > normally managed by drivers directly. We can introduce a
> > > DRM_GPUVA_SINGLE_PAGE flag to handle this. However, to make it work,
> > > sm_map and friends need to know ahead of time whether the new mapping is
> > > a single page mapping or not. Therefore, we need to add an argument to
> > > these functions so drivers can provide the flags to be filled into
> > > drm_gpuva.flags.
> > > 
> > > These changes should not affect any existing drivers that use drm_gpuvm
> > > other than the API change:
> > > 
> > > - imagination: Does not use flags at all
> > > - nouveau: Only uses drm_gpuva_invalidate(), which is only called on
> > >   existing drm_gpuva objects (after the map steps)
> > > - panthor: Does not use flags at all
> > > - xe: Does not use drm_gpuva_init_from_op() or
> > >   drm_gpuva_remap()/drm_gpuva_map() (which call it). This means that the
> > > flags field of the gpuva object is managed by the driver only, so these
> > > changes cannot clobber it.
> > > 
> > > Note that the way this is implemented, drm_gpuvm does not need to know
> > > the GPU page size. It only has to never do math on the BO offset to meet
> > > the requirements.
> > > 
> > > I suspect that after this change there could be some cleanup possible in
> > > the xe driver (which right now passes flags around in various
> > > driver-specific ways from the map step through to drm_gpuva objects),
> > > but I'll leave that to the Xe folks.
> > > 
> > > Signed-off-by: Asahi Lina <lina@asahilina.net>
> > > ---
> > > Asahi Lina (4):
> > >       drm/gpuvm: Add a flags argument to drm_gpuvm_sm_map[_*]
> > >       drm/gpuvm: Plumb through flags into drm_gpuva_op_map
> > >       drm/gpuvm: Add DRM_GPUVA_SINGLE_PAGE flag and logic
> > >       drm/gpuvm: Plumb through flags into drm_gpuva_init  
> > 
> > Without looking into any details yet:
> > 
> > This is a bit of tricky one, since we're not even close to having a user for
> > this new feature upstream yet, are we?
> 
> Actually, we would be interesting in having this feature hooked up in
> panthor. One use case we have is Vulkan sparse bindings, of course. But
> we also have cases where we need to map a dummy page repeatedly on the
> FW side. The approach we've been considering is slightly different:
> pass a DRM_GPUVA_REPEAT_FLAG along with GEM range, so we can repeat a
> range of the GEM (see the below diff, which is completely untested by
> the way), but I think we'd be fine with this SINGLE_PAGE flag.

Unless I've misunderstood the intent completely, it looks like Xe also wants
something similar although they call it CPU_ADDR_MIRROR for some reason:

https://lore.kernel.org/r/20250129195212.745731-9-matthew.brost@intel.com

Best regards,
Liviu

> 
> --->8---
> diff --git a/drivers/gpu/drm/drm_gpuvm.c b/drivers/gpu/drm/drm_gpuvm.c
> index f9eb56f24bef..ea61f3ffaddf 100644
> --- a/drivers/gpu/drm/drm_gpuvm.c
> +++ b/drivers/gpu/drm/drm_gpuvm.c
> @@ -2053,16 +2053,17 @@ EXPORT_SYMBOL_GPL(drm_gpuva_unmap);
>  
>  static int
>  op_map_cb(const struct drm_gpuvm_ops *fn, void *priv,
> -      u64 addr, u64 range,
> -      struct drm_gem_object *obj, u64 offset)
> +      u64 addr, u64 va_range,
> +      struct drm_gem_object *obj, u64 offset, u64 gem_range)
>  {
>      struct drm_gpuva_op op = {};
>  
>      op.op = DRM_GPUVA_OP_MAP;
>      op.map.va.addr = addr;
> -    op.map.va.range = range;
> +    op.map.va.range = va_range;
>      op.map.gem.obj = obj;
>      op.map.gem.offset = offset;
> +    op.map.gem.range = gem_range;
>  
>      return fn->sm_step_map(&op, priv);
>  }
> @@ -2102,7 +2103,8 @@ static int
>  __drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm,
>             const struct drm_gpuvm_ops *ops, void *priv,
>             u64 req_addr, u64 req_range,
> -           struct drm_gem_object *req_obj, u64 req_offset)
> +           struct drm_gem_object *req_obj,
> +           u64 req_offset, u64 req_gem_range)
>  {
>      struct drm_gpuva *va, *next;
>      u64 req_end = req_addr + req_range;
> @@ -2237,7 +2239,7 @@ __drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm,
>  
>      return op_map_cb(ops, priv,
>               req_addr, req_range,
> -             req_obj, req_offset);
> +             req_obj, req_offset, req_gem_range);
>  }
>  
>  static int
> @@ -2344,10 +2346,43 @@ drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm, void *priv,
>  
>      return __drm_gpuvm_sm_map(gpuvm, ops, priv,
>                    req_addr, req_range,
> -                  req_obj, req_offset);
> +                  req_obj, req_offset, 0);
>  }
>  EXPORT_SYMBOL_GPL(drm_gpuvm_sm_map);
>  
> +/**
> + * drm_gpuvm_sm_map_repeat() - repeatedly maps a GEM range over a VA range
> + * @gpuvm: the &drm_gpuvm representing the GPU VA space
> + * @priv: pointer to a driver private data structure
> + * @req_addr: the start address of the new mapping
> + * @req_range: the range of the new mapping
> + * @req_obj: the &drm_gem_object to map
> + * @req_offset: the offset within the &drm_gem_object
> + * @req_gem_range: the offset within the &drm_gem_object
> + *
> + * Same as drm_gpuvm_sm_map() except it repeats a GEM range over a VA range
> + *
> + * Returns: 0 on success or a negative error code
> + */
> +int
> +drm_gpuvm_sm_map_repeat(struct drm_gpuvm *gpuvm, void *priv,
> +            u64 req_addr, u64 req_range,
> +            struct drm_gem_object *req_obj,
> +            u64 req_offset, u64 req_gem_range)
> +{
> +    const struct drm_gpuvm_ops *ops = gpuvm->ops;
> +
> +    if (unlikely(!(ops && ops->sm_step_map &&
> +               ops->sm_step_remap &&
> +               ops->sm_step_unmap)))
> +        return -EINVAL;
> +
> +    return __drm_gpuvm_sm_map(gpuvm, ops, priv,
> +                  req_addr, req_range,
> +                  req_obj, req_offset, req_gem_range);
> +}
> +EXPORT_SYMBOL_GPL(drm_gpuvm_sm_map_repeat);
> +
>  /**
>   * drm_gpuvm_sm_unmap() - creates the &drm_gpuva_ops to split on unmap
>   * @gpuvm: the &drm_gpuvm representing the GPU VA space
> @@ -2536,7 +2571,7 @@ drm_gpuvm_sm_map_ops_create(struct drm_gpuvm *gpuvm,
>  
>      ret = __drm_gpuvm_sm_map(gpuvm, &gpuvm_list_ops, &args,
>                   req_addr, req_range,
> -                 req_obj, req_offset);
> +                 req_obj, req_offset, 0);
>      if (ret)
>          goto err_free_ops;
>  
> diff --git a/include/drm/drm_gpuvm.h b/include/drm/drm_gpuvm.h
> index 00d4e43b76b6..8157ede365d1 100644
> --- a/include/drm/drm_gpuvm.h
> +++ b/include/drm/drm_gpuvm.h
> @@ -846,6 +846,14 @@ struct drm_gpuva_op_map {
>           */
>          u64 offset;
>  
> +        /**
> +         * @gem.range: the range of the GEM to map
> +         *
> +         * If smaller than va.range, the GEM range should be mapped
> +         * multiple times over the VA range.
> +         */
> +        u64 range;
> +
>          /**
>           * @gem.obj: the &drm_gem_object to map
>           */
> @@ -1203,6 +1211,11 @@ int drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm, void *priv,
>               u64 addr, u64 range,
>               struct drm_gem_object *obj, u64 offset);
>  
> +int drm_gpuvm_sm_map_repeat(struct drm_gpuvm *gpuvm, void *priv,
> +                u64 addr, u64 range,
> +                struct drm_gem_object *obj,
> +                u64 offset, u64 gem_range);
> +
>  int drm_gpuvm_sm_unmap(struct drm_gpuvm *gpuvm, void *priv,
>                 u64 addr, u64 range);

-- 
====================
| I would like to |
| fix the world,  |
| but they're not |
| giving me the   |
 \ source code!  /
  ---------------
    ¯\_(ツ)_/¯
