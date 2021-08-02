Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 781613DD2E8
	for <lists+dri-devel@lfdr.de>; Mon,  2 Aug 2021 11:25:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F7986E544;
	Mon,  2 Aug 2021 09:25:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11C566E52C;
 Mon,  2 Aug 2021 09:25:51 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10063"; a="211548823"
X-IronPort-AV: E=Sophos;i="5.84,288,1620716400"; d="scan'208";a="211548823"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Aug 2021 02:25:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,288,1620716400"; d="scan'208";a="418625218"
Received: from gaia.fi.intel.com ([10.237.72.192])
 by orsmga006.jf.intel.com with ESMTP; 02 Aug 2021 02:25:48 -0700
Received: by gaia.fi.intel.com (Postfix, from userid 1000)
 id 7E3A15C1F99; Mon,  2 Aug 2021 12:24:41 +0300 (EEST)
From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
To: Matthew Auld <matthew.auld@intel.com>, intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH v2 1/2] drm/i915: document caching related bits
In-Reply-To: <20210721114449.196015-1-matthew.auld@intel.com>
References: <20210721114449.196015-1-matthew.auld@intel.com>
Date: Mon, 02 Aug 2021 12:24:41 +0300
Message-ID: <87v94o2o86.fsf@gaia.fi.intel.com>
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

Matthew Auld <matthew.auld@intel.com> writes:

> Try to document the object caching related bits, like cache_coherent and
> cache_dirty.
>
> v2(Ville):
>  - As pointed out by Ville, fix the completely incorrect assumptions
>    about the "partial" coherency on shared LLC platforms.
>
> Suggested-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> Cc: Mika Kuoppala <mika.kuoppala@linux.intel.com>
> ---
>  .../gpu/drm/i915/gem/i915_gem_object_types.h  | 173 +++++++++++++++++-
>  drivers/gpu/drm/i915/i915_drv.h               |   9 -
>  2 files changed, 169 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object_types.h b/drivers/g=
pu/drm/i915/gem/i915_gem_object_types.h
> index ef3de2ae9723..a809424bc8c1 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
> @@ -92,6 +92,76 @@ struct drm_i915_gem_object_ops {
>  	const char *name; /* friendly name for debug, e.g. lockdep classes */
>  };
>=20=20
> +/**
> + * enum i915_cache_level - The supported GTT caching values for system m=
emory
> + * pages.
> + *
> + * These translate to some special GTT PTE bits when binding pages into =
some
> + * address space. It also determines whether an object, or rather its pa=
ges are
> + * coherent with the GPU, when also reading or writing through the CPU c=
ache
> + * with those pages.
> + *
> + * Userspace can also control this through struct drm_i915_gem_caching.
> + */
> +enum i915_cache_level {
> +	/**
> +	 * @I915_CACHE_NONE:
> +	 *
> +	 * Not coherent with the CPU cache. If the cache is dirty and we need
> +	 * the underlying pages to be coherent with some later GPU access then
> +	 * we need to manually flush the pages.
> +	 *
> +	 * Note that on shared LLC platforms reads and writes through the CPU
> +	 * cache are still coherent even with this setting. See also
> +	 * &drm_i915_gem_object.cache_coherent for more details.
> +	 *
> +	 * Note that on platforms with a shared LLC this should ideally only be
> +	 * used for scanout surfaces, otherwise we end up over-flushing in some
> +	 * places.
> +	 */
> +	I915_CACHE_NONE =3D 0,
> +	/**
> +	 * @I915_CACHE_LLC:
> +	 *
> +	 * Coherent with the CPU cache. If the cache is dirty, then the GPU will
> +	 * ensure that access remains coherent, when both reading and writing
> +	 * through the CPU cache.
> +	 *
> +	 * Not used for scanout surfaces.
> +	 *
> +	 * Applies to both platforms with shared LLC(HAS_LLC), and snooping
> +	 * based platforms(HAS_SNOOP).
> +	 *
> +	 * This should be the default for platforms which share the LLC with the
> +	 * CPU. The only exception is scanout objects, where the display engine
> +	 * is not coherent with the LLC. For such objects I915_CACHE_NONE or
> +	 * I915_CACHE_WT should be used.
> +	 */
> +	I915_CACHE_LLC,
> +	/**
> +	 * @I915_CACHE_L3_LLC:
> +	 *
> +	 * Explicitly enable the Gfx L3 cache, with snooped LLC.
> +	 *
> +	 * The Gfx L3 sits between the domain specific caches, e.g
> +	 * sampler/render caches, and the larger LLC. LLC is coherent with the
> +	 * GPU, but L3 is only visible to the GPU, so likely needs to be flushed
> +	 * when the workload completes.
> +	 *
> +	 * Not used for scanout surfaces.
> +	 *
> +	 * Only exposed on some gen7 + GGTT. More recent hardware has dropped
> +	 * this.
> +	 */

This is stellar. Thanks!
-Mika

> +	I915_CACHE_L3_LLC,
> +	/**
> +	 * @I915_CACHE_WT:
> +	 *
> +	 * hsw:gt3e Write-through for scanout buffers.
> +	 */
> +	I915_CACHE_WT,
> +};
> +
>  enum i915_map_type {
>  	I915_MAP_WB =3D 0,
>  	I915_MAP_WC,
> @@ -228,14 +298,109 @@ struct drm_i915_gem_object {
>  	unsigned int mem_flags;
>  #define I915_BO_FLAG_STRUCT_PAGE BIT(0) /* Object backed by struct pages=
 */
>  #define I915_BO_FLAG_IOMEM       BIT(1) /* Object backed by IO memory */
> -	/*
> -	 * Is the object to be mapped as read-only to the GPU
> -	 * Only honoured if hardware has relevant pte bit
> +	/**
> +	 * @cache_level: The desired GTT caching level.
> +	 *
> +	 * See enum i915_cache_level for possible values, along with what
> +	 * each does.
>  	 */
>  	unsigned int cache_level:3;
> -	unsigned int cache_coherent:2;
> +	/**
> +	 * @cache_coherent:
> +	 *
> +	 * Track whether the pages are coherent with the GPU if reading or
> +	 * writing through the CPU caches. The largely depends on the
> +	 * @cache_level setting.
> +	 *
> +	 * On platforms which don't have the shared LLC(HAS_SNOOP), like on Atom
> +	 * platforms, coherency must be explicitly requested with some special
> +	 * GTT caching bits(see enum i915_cache_level). When enabling coherency
> +	 * it does come at a performance and power cost on such platforms. On
> +	 * the flip side the kernel does need to manually flush any buffers
> +	 * which need to be coherent with the GPU, if the object is not
> +	 * coherent i.e @cache_coherent is zero.
> +	 *
> +	 * On platforms that share the LLC with the CPU(HAS_LLC), all GT memory
> +	 * access will automatically snoop the CPU caches(even with CACHE_NONE).
> +	 * The one exception is when dealing with the display engine, like with
> +	 * scanout surfaces. To handle this the kernel will always flush the
> +	 * surface out of the CPU caches when preparing it for scanout.  Also
> +	 * note that since scanout surfaces are only ever read by the display
> +	 * engine we only need to care about flushing any writes through the CPU
> +	 * cache, reads on the other hand will always be coherent.
> +	 *
> +	 * Something strange here is why @cache_coherent is not a simple
> +	 * boolean, i.e coherent vs non-coherent. The reasoning for this is back
> +	 * to the display engine not being fully coherent. As a result scanout
> +	 * surfaces will either be marked as I915_CACHE_NONE or I915_CACHE_WT.
> +	 * In the case of seeing I915_CACHE_NONE the kernel makes the assumption
> +	 * that this is likely a scanout surface, and will set @cache_coherent
> +	 * as only I915_BO_CACHE_COHERENT_FOR_READ, on platforms with the shared
> +	 * LLC. The kernel uses this to avoid flushing reads, while then also
> +	 * applying some optimisations to always flush writes through the CPU
> +	 * cache as early as possible, where it can, in effect keeping
> +	 * @cache_dirty clean, so we can potentially avoid stalling when
> +	 * flushing the surface just before doing the scanout.  This does mean
> +	 * we might unnecessarily flush non-scanout objects in some places, but
> +	 * the default assumption is that all normal objects should be using
> +	 * I915_CACHE_LLC, at least on platforms with the shared LLC.
> +	 *
> +	 * I915_BO_CACHE_COHERENT_FOR_READ:
> +	 *
> +	 * When reading through the CPU cache, the GPU is still coherent. Reads
> +	 * through the CPU cache only become a concern when writes can bypass
> +	 * the CPU cache.
> +	 *
> +	 * As an example, if some object is mapped on the CPU with write-back
> +	 * caching, and we read some page, then the cache likely now contains
> +	 * the data from that read. At this point the cache and main memory
> +	 * match up, so all good. But next the GPU needs to write some data to
> +	 * that same page. Now if the @cache_level is I915_CACHE_NONE and the
> +	 * the platform doesn't have the shared LLC, then the GPU will
> +	 * effectively skip invalidating the cache(or however that works
> +	 * internally) when writing the new value.  This is really bad since the
> +	 * GPU has just written some new data to main memory, but the CPU cache
> +	 * is still valid and now contains stale data. As a result the next time
> +	 * we do a cached read with the CPU, we are rewarded with stale data.
> +	 * Likewise if the cache is later flushed, we might be rewarded with
> +	 * overwriting main memory with stale data.
> +	 *
> +	 * I915_BO_CACHE_COHERENT_FOR_WRITE:
> +	 *
> +	 * When writing through the CPU cache, the GPU is still coherent. Note
> +	 * that this also implies I915_BO_CACHE_COHERENT_FOR_READ.
> +	 */
>  #define I915_BO_CACHE_COHERENT_FOR_READ BIT(0)
>  #define I915_BO_CACHE_COHERENT_FOR_WRITE BIT(1)
> +	unsigned int cache_coherent:2;
> +
> +	/**
> +	 * @cache_dirty:
> +	 *
> +	 * Track if we are we dirty with writes through the CPU cache for this
> +	 * object. As a result reading directly from main memory might yield
> +	 * stale data.
> +	 *
> +	 * This also ties into whether the kernel is tracking the object as
> +	 * coherent with the GPU, as per @cache_coherent, as it determines if
> +	 * flushing might be needed at various points.
> +	 *
> +	 * Another part of @cache_dirty is managing flushing when first
> +	 * acquiring the pages for system memory, at this point the pages are
> +	 * considered foreign, so the default assumption is that the cache is
> +	 * dirty, for example the page zeroing done by the kernel might leave
> +	 * writes though the CPU cache, or swapping-in, while the actual data in
> +	 * main memory is potentially stale.  Note that this is a potential
> +	 * security issue when dealing with userspace objects and zeroing. Now,
> +	 * whether we actually need apply the big sledgehammer of flushing all
> +	 * the pages on acquire depends on if @cache_coherent is marked as
> +	 * I915_BO_CACHE_COHERENT_FOR_WRITE, i.e that the GPU will be coherent
> +	 * for both reads and writes though the CPU cache.
> +	 *
> +	 * Note that on shared LLC platforms we still apply the heavy flush for
> +	 * I915_CACHE_NONE objects, under the assumption that this is going to
> +	 * be used for scanout.
> +	 */
>  	unsigned int cache_dirty:1;
>=20=20
>  	/**
> diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_=
drv.h
> index f99b6c0dd068..ac144d0c69a5 100644
> --- a/drivers/gpu/drm/i915/i915_drv.h
> +++ b/drivers/gpu/drm/i915/i915_drv.h
> @@ -394,15 +394,6 @@ struct drm_i915_display_funcs {
>  	void (*read_luts)(struct intel_crtc_state *crtc_state);
>  };
>=20=20
> -enum i915_cache_level {
> -	I915_CACHE_NONE =3D 0,
> -	I915_CACHE_LLC, /* also used for snoopable memory on non-LLC */
> -	I915_CACHE_L3_LLC, /* gen7+, L3 sits between the domain specifc
> -			      caches, eg sampler/render caches, and the
> -			      large Last-Level-Cache. LLC is coherent with
> -			      the CPU, but L3 is only visible to the GPU. */
> -	I915_CACHE_WT, /* hsw:gt3e WriteThrough for scanouts */
> -};
>=20=20
>  #define I915_COLOR_UNEVICTABLE (-1) /* a non-vma sharing the address spa=
ce */
>=20=20
> --=20
> 2.26.3
