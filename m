Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA13CAD031F
	for <lists+dri-devel@lfdr.de>; Fri,  6 Jun 2025 15:24:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB0EB10EA9E;
	Fri,  6 Jun 2025 13:24:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MoyErIVI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D32D210E351;
 Fri,  6 Jun 2025 13:24:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749216293; x=1780752293;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=mR55Kc+kasQ+GdFfuLzdqz3KzIMWEML2Li9QTwOSxo4=;
 b=MoyErIVI6LtQwVkvjNDLg6JV6EIvsFnp0H4utOzOnSwdoEqU+Y2eo+zE
 1qnxlzcMHpuzMHFGxYK+bzjg7pnBQ0bC7ACPmQaBW9bzcHeeZxbQPxNmU
 hajvR7FWDnhkE3eN1AjJUvqPckZm7nWL9x0u5FCFS8tDUR+YtGKjGkroy
 ano7RCGWQN+rS2T9oti7afNeQF51vOgX2k911eDGrVUP4OD31t9bhCyEG
 oBJfOThE4hu7iL8D0kzNMrcBwEPYrbQwV6b+6F/QIbrL93rSEJo/qWJWD
 7JdUp0JAo5XYscsO953QjU9MA+OiW4Ucubpym1zTKN1aXTaxNMZ1M+e4H A==;
X-CSE-ConnectionGUID: Tn3Yhi/1RxGKIr+ZA4lvdQ==
X-CSE-MsgGUID: 4L/8DKrrTqaPcW3a8WsyJg==
X-IronPort-AV: E=McAfee;i="6800,10657,11456"; a="68805142"
X-IronPort-AV: E=Sophos;i="6.16,215,1744095600"; d="scan'208";a="68805142"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2025 06:24:52 -0700
X-CSE-ConnectionGUID: Uu4+QIsIQTyV/d6ER5uSjQ==
X-CSE-MsgGUID: 8g3tbaSETyKuPkm74jU9BQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,215,1744095600"; d="scan'208";a="145835952"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.33])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2025 06:24:46 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Jocelyn Falempe <jfalempe@redhat.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, David
 Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Christian Koenig
 <christian.koenig@amd.com>, Huang Rui <ray.huang@amd.com>, Matthew Auld
 <matthew.auld@intel.com>, Matthew Brost <matthew.brost@intel.com>, Maxime
 Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: Jocelyn Falempe <jfalempe@redhat.com>
Subject: Re: [PATCH v8 5/9] drm/i915: Add intel_bo_panic_setup and
 intel_bo_panic_finish
In-Reply-To: <20250606120519.753928-6-jfalempe@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250606120519.753928-1-jfalempe@redhat.com>
 <20250606120519.753928-6-jfalempe@redhat.com>
Date: Fri, 06 Jun 2025 16:24:43 +0300
Message-ID: <5e5014e3f1cbc9c91d2d6e4a3258c775a468bf46@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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

On Fri, 06 Jun 2025, Jocelyn Falempe <jfalempe@redhat.com> wrote:
> Implement both functions for i915 and xe, they prepare the work for
> drm_panic support.
> They both use kmap_try_from_panic(), and map one page at a time, to
> write the panic screen on the framebuffer.
>
> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
> ---
>
>
> v5:
>  * Use iosys_map for intel_bo_panic_map().
>
> v7:
>  * Return int for i915_gem_object_panic_map() (Ville Syrj=C3=A4l=C3=A4)
>
> v8:
>  * Complete rewrite, to use kmap_try_from_panic() which is safe
>    to call from a panic handler
>
>  drivers/gpu/drm/i915/display/intel_bo.c    | 11 +++
>  drivers/gpu/drm/i915/display/intel_bo.h    |  3 +
>  drivers/gpu/drm/i915/gem/i915_gem_object.h |  4 +
>  drivers/gpu/drm/i915/gem/i915_gem_pages.c  | 92 ++++++++++++++++++++++
>  drivers/gpu/drm/xe/display/intel_bo.c      | 55 +++++++++++++
>  5 files changed, 165 insertions(+)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_bo.c b/drivers/gpu/drm/i9=
15/display/intel_bo.c
> index fbd16d7b58d9..83dbd8ae16fe 100644
> --- a/drivers/gpu/drm/i915/display/intel_bo.c
> +++ b/drivers/gpu/drm/i915/display/intel_bo.c
> @@ -1,6 +1,7 @@
>  // SPDX-License-Identifier: MIT
>  /* Copyright =C2=A9 2024 Intel Corporation */
>=20=20
> +#include <drm/drm_panic.h>
>  #include "gem/i915_gem_mman.h"
>  #include "gem/i915_gem_object.h"
>  #include "gem/i915_gem_object_frontbuffer.h"
> @@ -57,3 +58,13 @@ void intel_bo_describe(struct seq_file *m, struct drm_=
gem_object *obj)
>  {
>  	i915_debugfs_describe_obj(m, to_intel_bo(obj));
>  }
> +
> +int intel_bo_panic_setup(struct drm_gem_object *obj, struct drm_scanout_=
buffer *sb)
> +{
> +	return i915_gem_object_panic_setup(to_intel_bo(obj), sb);
> +}
> +
> +void intel_bo_panic_finish(struct drm_gem_object *obj)
> +{
> +	return i915_gem_object_panic_finish(to_intel_bo(obj));
> +}
> diff --git a/drivers/gpu/drm/i915/display/intel_bo.h b/drivers/gpu/drm/i9=
15/display/intel_bo.h
> index ea7a2253aaa5..9ac087ea275d 100644
> --- a/drivers/gpu/drm/i915/display/intel_bo.h
> +++ b/drivers/gpu/drm/i915/display/intel_bo.h
> @@ -4,6 +4,7 @@
>  #ifndef __INTEL_BO__
>  #define __INTEL_BO__
>=20=20
> +#include <drm/drm_panic.h>
>  #include <linux/types.h>
>=20=20
>  struct drm_gem_object;
> @@ -23,5 +24,7 @@ struct intel_frontbuffer *intel_bo_set_frontbuffer(stru=
ct drm_gem_object *obj,
>  						   struct intel_frontbuffer *front);
>=20=20
>  void intel_bo_describe(struct seq_file *m, struct drm_gem_object *obj);
> +int intel_bo_panic_setup(struct drm_gem_object *obj, struct drm_scanout_=
buffer *sb);
> +void intel_bo_panic_finish(struct drm_gem_object *obj);
>=20=20
>  #endif /* __INTEL_BO__ */
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.h b/drivers/gpu/drm=
/i915/gem/i915_gem_object.h
> index c34f41605b46..9a0c1019dcad 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_object.h
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_object.h
> @@ -9,6 +9,7 @@
>  #include <drm/drm_gem.h>
>  #include <drm/drm_file.h>
>  #include <drm/drm_device.h>
> +#include <drm/drm_panic.h>
>=20=20
>  #include "intel_memory_region.h"
>  #include "i915_gem_object_types.h"
> @@ -691,6 +692,9 @@ i915_gem_object_unpin_pages(struct drm_i915_gem_objec=
t *obj)
>  int __i915_gem_object_put_pages(struct drm_i915_gem_object *obj);
>  int i915_gem_object_truncate(struct drm_i915_gem_object *obj);
>=20=20
> +int i915_gem_object_panic_setup(struct drm_i915_gem_object *obj, struct =
drm_scanout_buffer *sb);
> +void i915_gem_object_panic_finish(struct drm_i915_gem_object *obj);
> +
>  /**
>   * i915_gem_object_pin_map - return a contiguous mapping of the entire o=
bject
>   * @obj: the object to map into kernel address space
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_pages.c b/drivers/gpu/drm/=
i915/gem/i915_gem_pages.c
> index 7f83f8bdc8fb..9bdbac3d9433 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_pages.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_pages.c
> @@ -3,6 +3,7 @@
>   * Copyright =C2=A9 2014-2016 Intel Corporation
>   */
>=20=20
> +#include <drm/drm_panic.h>
>  #include <drm/drm_cache.h>
>  #include <linux/vmalloc.h>
>=20=20
> @@ -354,6 +355,97 @@ static void *i915_gem_object_map_pfn(struct drm_i915=
_gem_object *obj,
>  	return vaddr ?: ERR_PTR(-ENOMEM);
>  }
>=20=20
> +static struct page **i915_panic_pages;
> +static int i915_panic_page =3D -1;
> +static void *i915_panic_vaddr;

How do the per module variables work when you have multiple devices?

BR,
Jani.

> +
> +static void i915_panic_kunmap(void)
> +{
> +	if (i915_panic_vaddr) {
> +		drm_clflush_virt_range(i915_panic_vaddr, PAGE_SIZE);
> +		kunmap_local(i915_panic_vaddr);
> +		i915_panic_vaddr =3D NULL;
> +	}
> +}
> +
> +static struct page **i915_gem_object_panic_pages(struct drm_i915_gem_obj=
ect *obj)
> +{
> +	unsigned long n_pages =3D obj->base.size >> PAGE_SHIFT, i;
> +	struct page *page;
> +	struct page **pages;
> +	struct sgt_iter iter;
> +
> +	pages =3D kvmalloc_array(n_pages, sizeof(*pages), GFP_ATOMIC);
> +	if (!pages)
> +		return NULL;
> +
> +	i =3D 0;
> +	for_each_sgt_page(page, iter, obj->mm.pages)
> +		pages[i++] =3D page;
> +	return pages;
> +}
> +
> +/*
> + * The scanout buffer pages are not mapped, so for each pixel,
> + * use kmap_local_page_try_from_panic() to map the page, and write the p=
ixel.
> + * Try to keep the map from the previous pixel, to avoid too much map/un=
map.
> + */
> +static void i915_gem_object_panic_page_set_pixel(struct drm_scanout_buff=
er *sb, unsigned int x,
> +						 unsigned int y, u32 color)
> +{
> +	unsigned int new_page;
> +	unsigned int offset;
> +
> +	offset =3D y * sb->pitch[0] + x * sb->format->cpp[0];
> +
> +	new_page =3D offset >> PAGE_SHIFT;
> +	offset =3D offset % PAGE_SIZE;
> +	if (new_page !=3D i915_panic_page) {
> +		i915_panic_kunmap();
> +		i915_panic_page =3D new_page;
> +		i915_panic_vaddr =3D kmap_local_page_try_from_panic(
> +				   i915_panic_pages[i915_panic_page]);
> +	}
> +	if (i915_panic_vaddr) {
> +		u32 *pix =3D i915_panic_vaddr + offset;
> +		*pix =3D color;
> +	}
> +}
> +
> +/*
> + * Setup the gem framebuffer for drm_panic access.
> + * Use current vaddr if it exists, or setup a list of pages.
> + * pfn is not supported yet.
> + */
> +int i915_gem_object_panic_setup(struct drm_i915_gem_object *obj, struct =
drm_scanout_buffer *sb)
> +{
> +	enum i915_map_type has_type;
> +	void *ptr;
> +
> +	ptr =3D page_unpack_bits(obj->mm.mapping, &has_type);
> +	if (ptr) {
> +		if (i915_gem_object_has_iomem(obj))
> +			iosys_map_set_vaddr_iomem(&sb->map[0], (void __iomem *)ptr);
> +		else
> +			iosys_map_set_vaddr(&sb->map[0], ptr);
> +
> +		return 0;
> +	}
> +	if (i915_gem_object_has_struct_page(obj)) {
> +		i915_panic_pages =3D i915_gem_object_panic_pages(obj);
> +		sb->set_pixel =3D i915_gem_object_panic_page_set_pixel;
> +		i915_panic_page =3D -1;
> +		return 0;
> +	}
> +	return -EOPNOTSUPP;
> +}
> +
> +void i915_gem_object_panic_finish(struct drm_i915_gem_object *obj)
> +{
> +	i915_panic_kunmap();
> +	i915_panic_page =3D -1;
> +}
> +
>  /* get, pin, and map the pages of the object into kernel space */
>  void *i915_gem_object_pin_map(struct drm_i915_gem_object *obj,
>  			      enum i915_map_type type)
> diff --git a/drivers/gpu/drm/xe/display/intel_bo.c b/drivers/gpu/drm/xe/d=
isplay/intel_bo.c
> index 27437c22bd70..eb9a3400c110 100644
> --- a/drivers/gpu/drm/xe/display/intel_bo.c
> +++ b/drivers/gpu/drm/xe/display/intel_bo.c
> @@ -1,6 +1,7 @@
>  // SPDX-License-Identifier: MIT
>  /* Copyright =C2=A9 2024 Intel Corporation */
>=20=20
> +#include <drm/drm_cache.h>
>  #include <drm/drm_gem.h>
>=20=20
>  #include "xe_bo.h"
> @@ -59,3 +60,57 @@ void intel_bo_describe(struct seq_file *m, struct drm_=
gem_object *obj)
>  {
>  	/* FIXME */
>  }
> +
> +static int xe_panic_page =3D -1;
> +static void *xe_panic_vaddr;
> +static struct xe_bo *xe_panic_bo;
> +
> +static void xe_panic_kunmap(void)
> +{
> +	if (xe_panic_vaddr) {
> +		drm_clflush_virt_range(xe_panic_vaddr, PAGE_SIZE);
> +		kunmap_local(xe_panic_vaddr);
> +		xe_panic_vaddr =3D NULL;
> +	}
> +}
> +/*
> + * The scanout buffer pages are not mapped, so for each pixel,
> + * use kmap_local_page_try_from_panic() to map the page, and write the p=
ixel.
> + * Try to keep the map from the previous pixel, to avoid too much map/un=
map.
> + */
> +static void xe_panic_page_set_pixel(struct drm_scanout_buffer *sb, unsig=
ned int x,
> +				    unsigned int y, u32 color)
> +{
> +	unsigned int new_page;
> +	unsigned int offset;
> +
> +	offset =3D y * sb->pitch[0] + x * sb->format->cpp[0];
> +
> +	new_page =3D offset >> PAGE_SHIFT;
> +	offset =3D offset % PAGE_SIZE;
> +	if (new_page !=3D xe_panic_page) {
> +		xe_panic_kunmap();
> +		xe_panic_page =3D new_page;
> +		xe_panic_vaddr =3D ttm_bo_kmap_try_from_panic(&xe_panic_bo->ttm,
> +							    xe_panic_page);
> +	}
> +	if (xe_panic_vaddr) {
> +		u32 *pix =3D xe_panic_vaddr + offset;
> +		*pix =3D color;
> +	}
> +}
> +
> +int intel_bo_panic_setup(struct drm_gem_object *obj, struct drm_scanout_=
buffer *sb)
> +{
> +	struct xe_bo *bo =3D gem_to_xe_bo(obj);
> +
> +	xe_panic_bo =3D bo;
> +	sb->set_pixel =3D xe_panic_page_set_pixel;
> +	return 0;
> +}
> +
> +void intel_bo_panic_finish(struct drm_gem_object *obj)
> +{
> +	xe_panic_kunmap();
> +	xe_panic_page =3D -1;
> +}

--=20
Jani Nikula, Intel
