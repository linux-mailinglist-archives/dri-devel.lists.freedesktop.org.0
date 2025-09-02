Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AC8EB40842
	for <lists+dri-devel@lfdr.de>; Tue,  2 Sep 2025 16:59:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C2DD10E788;
	Tue,  2 Sep 2025 14:59:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="O2Jiuv33";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAF3C10E785;
 Tue,  2 Sep 2025 14:59:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756825180; x=1788361180;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=vDmXH55NIAF/iJDyxaMzr02S19+EYKdkSPtubaiyCyk=;
 b=O2Jiuv33q06UHfqhm09pPOXvLDhMOmXPXJm3Zt5zVeUXgegcTQHthGAM
 kQ9WcdvoG3zGuTwytxYHXReuX4AjMuViPwuOEO9TS4Ymof8MJLgW86USA
 XKLkSZ2qiuLTcbN7YFaqi20+YI8OlBvNd6xJyMXh/6y2QabgnGcgp7m0H
 fKuqf/4U4BGScU5LrAsZM2Qal8Y7fi1usc4u3Q2biN/cBv+e58WNhKlsw
 UZ4hZnOb82cAUTskEVPfeqC+hP8mGHDWK1eod3wUFc47pArBM+DV9R+5X
 bEsr3mnd61l3U8zR2lnC9pAI+YIW25grmFw8cqki9dAIUHjoLOCtIwoyq A==;
X-CSE-ConnectionGUID: dpnNrA/0SFe87VzxMMrijg==
X-CSE-MsgGUID: o+tNdEoKR6G3A+W+2dI2DQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="59052454"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="59052454"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2025 07:59:39 -0700
X-CSE-ConnectionGUID: gnZHfUcPTo6N3QPQ0TAk6w==
X-CSE-MsgGUID: 8fXfvuiMRWqfQqmhFXx7tQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; d="scan'208";a="171451041"
Received: from dhhellew-desk2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.193])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2025 07:59:33 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Jocelyn Falempe <jfalempe@redhat.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Rodrigo Vivi
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
Subject: Re: [PATCH v11 06/11] drm/i915: Add intel_bo_alloc_framebuffer()
In-Reply-To: <20250624091501.257661-7-jfalempe@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250624091501.257661-1-jfalempe@redhat.com>
 <20250624091501.257661-7-jfalempe@redhat.com>
Date: Tue, 02 Sep 2025 17:59:30 +0300
Message-ID: <508c32788930b591fdb578f4f406278a8818d771@intel.com>
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

On Tue, 24 Jun 2025, Jocelyn Falempe <jfalempe@redhat.com> wrote:
> Encapsulate the struct intel_framebuffer into an xe_framebuffer
> or i915_framebuffer, and allow to add specific fields for each
> variant for the panic use-case.
> This is particularly needed to have a struct xe_res_cursor available
> to support drm panic on discrete GPU.
>
> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
> ---
>
> v11:
>  * Added in v11
>
>  drivers/gpu/drm/i915/display/i9xx_plane.c     |  3 ++-
>  drivers/gpu/drm/i915/display/intel_bo.c       |  6 +++++
>  drivers/gpu/drm/i915/display/intel_bo.h       |  2 ++
>  drivers/gpu/drm/i915/display/intel_fb.c       |  2 +-
>  .../drm/i915/display/skl_universal_plane.c    |  2 +-
>  drivers/gpu/drm/i915/gem/i915_gem_object.h    |  2 ++
>  drivers/gpu/drm/i915/gem/i915_gem_pages.c     | 22 +++++++++++++++++
>  drivers/gpu/drm/xe/display/intel_bo.c         | 24 +++++++++++++++++++
>  8 files changed, 60 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/i9xx_plane.c b/drivers/gpu/drm/=
i915/display/i9xx_plane.c
> index e7e35fd4bdc3..f291ced989dc 100644
> --- a/drivers/gpu/drm/i915/display/i9xx_plane.c
> +++ b/drivers/gpu/drm/i915/display/i9xx_plane.c
> @@ -15,6 +15,7 @@
>  #include "i9xx_plane.h"
>  #include "i9xx_plane_regs.h"
>  #include "intel_atomic.h"
> +#include "intel_bo.h"
>  #include "intel_de.h"
>  #include "intel_display_irq.h"
>  #include "intel_display_regs.h"
> @@ -1174,7 +1175,7 @@ i9xx_get_initial_plane_config(struct intel_crtc *cr=
tc,
>=20=20
>  	drm_WARN_ON(display->drm, pipe !=3D crtc->pipe);
>=20=20
> -	intel_fb =3D kzalloc(sizeof(*intel_fb), GFP_KERNEL);
> +	intel_fb =3D intel_bo_alloc_framebuffer();
>  	if (!intel_fb) {
>  		drm_dbg_kms(display->drm, "failed to alloc fb\n");
>  		return;
> diff --git a/drivers/gpu/drm/i915/display/intel_bo.c b/drivers/gpu/drm/i9=
15/display/intel_bo.c
> index fbd16d7b58d9..bcf2eded7469 100644
> --- a/drivers/gpu/drm/i915/display/intel_bo.c
> +++ b/drivers/gpu/drm/i915/display/intel_bo.c
> @@ -1,6 +1,7 @@
>  // SPDX-License-Identifier: MIT
>  /* Copyright =C2=A9 2024 Intel Corporation */
>=20=20
> +#include "display/intel_display_types.h"
>  #include "gem/i915_gem_mman.h"
>  #include "gem/i915_gem_object.h"
>  #include "gem/i915_gem_object_frontbuffer.h"
> @@ -57,3 +58,8 @@ void intel_bo_describe(struct seq_file *m, struct drm_g=
em_object *obj)
>  {
>  	i915_debugfs_describe_obj(m, to_intel_bo(obj));
>  }
> +
> +struct intel_framebuffer *intel_bo_alloc_framebuffer(void)
> +{
> +	return i915_gem_object_alloc_framebuffer();
> +}
> diff --git a/drivers/gpu/drm/i915/display/intel_bo.h b/drivers/gpu/drm/i9=
15/display/intel_bo.h
> index ea7a2253aaa5..315a81768c73 100644
> --- a/drivers/gpu/drm/i915/display/intel_bo.h
> +++ b/drivers/gpu/drm/i915/display/intel_bo.h
> @@ -7,6 +7,7 @@
>  #include <linux/types.h>
>=20=20
>  struct drm_gem_object;
> +struct intel_framebuffer;
>  struct seq_file;
>  struct vm_area_struct;
>=20=20
> @@ -23,5 +24,6 @@ struct intel_frontbuffer *intel_bo_set_frontbuffer(stru=
ct drm_gem_object *obj,
>  						   struct intel_frontbuffer *front);
>=20=20
>  void intel_bo_describe(struct seq_file *m, struct drm_gem_object *obj);
> +struct intel_framebuffer *intel_bo_alloc_framebuffer(void);
>=20=20
>  #endif /* __INTEL_BO__ */
> diff --git a/drivers/gpu/drm/i915/display/intel_fb.c b/drivers/gpu/drm/i9=
15/display/intel_fb.c
> index 763b36c4de10..6158031821fd 100644
> --- a/drivers/gpu/drm/i915/display/intel_fb.c
> +++ b/drivers/gpu/drm/i915/display/intel_fb.c
> @@ -2346,7 +2346,7 @@ intel_framebuffer_create(struct drm_gem_object *obj,
>  	struct intel_framebuffer *intel_fb;
>  	int ret;
>=20=20
> -	intel_fb =3D kzalloc(sizeof(*intel_fb), GFP_KERNEL);
> +	intel_fb =3D intel_bo_alloc_framebuffer();
>  	if (!intel_fb)
>  		return ERR_PTR(-ENOMEM);
>=20=20
> diff --git a/drivers/gpu/drm/i915/display/skl_universal_plane.c b/drivers=
/gpu/drm/i915/display/skl_universal_plane.c
> index 1ba04f1b3ec0..cbd0521a201c 100644
> --- a/drivers/gpu/drm/i915/display/skl_universal_plane.c
> +++ b/drivers/gpu/drm/i915/display/skl_universal_plane.c
> @@ -3029,7 +3029,7 @@ skl_get_initial_plane_config(struct intel_crtc *crt=
c,
>  		return;
>  	}
>=20=20
> -	intel_fb =3D kzalloc(sizeof(*intel_fb), GFP_KERNEL);
> +	intel_fb =3D intel_bo_alloc_framebuffer();
>  	if (!intel_fb) {
>  		drm_dbg_kms(display->drm, "failed to alloc fb\n");
>  		return;
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.h b/drivers/gpu/drm=
/i915/gem/i915_gem_object.h
> index c34f41605b46..364941444a0a 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_object.h
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_object.h
> @@ -17,6 +17,7 @@
>  #include "i915_vma_types.h"
>=20=20
>  enum intel_region_id;
> +struct intel_framebuffer;
>=20=20
>  #define obj_to_i915(obj__) to_i915((obj__)->base.dev)
>=20=20
> @@ -691,6 +692,7 @@ i915_gem_object_unpin_pages(struct drm_i915_gem_objec=
t *obj)
>  int __i915_gem_object_put_pages(struct drm_i915_gem_object *obj);
>  int i915_gem_object_truncate(struct drm_i915_gem_object *obj);
>=20=20
> +struct intel_framebuffer *i915_gem_object_alloc_framebuffer(void);
>  /**
>   * i915_gem_object_pin_map - return a contiguous mapping of the entire o=
bject
>   * @obj: the object to map into kernel address space
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_pages.c b/drivers/gpu/drm/=
i915/gem/i915_gem_pages.c
> index 7f83f8bdc8fb..10b84970f17f 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_pages.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_pages.c
> @@ -6,6 +6,7 @@
>  #include <drm/drm_cache.h>
>  #include <linux/vmalloc.h>
>=20=20
> +#include "display/intel_display_types.h"

This one slipped through... non-display parts of i915 should not be
adding more display/ includes, and should not poke at display data
types.

>  #include "gt/intel_gt.h"
>  #include "gt/intel_tlb.h"
>=20=20
> @@ -354,6 +355,27 @@ static void *i915_gem_object_map_pfn(struct drm_i915=
_gem_object *obj,
>  	return vaddr ?: ERR_PTR(-ENOMEM);
>  }
>=20=20
> +struct i915_panic_data {
> +	struct page **pages;
> +	int page;
> +	void *vaddr;
> +};
> +
> +struct i915_framebuffer {
> +	struct intel_framebuffer base;
> +	struct i915_panic_data panic;
> +};
> +
> +struct intel_framebuffer *i915_gem_object_alloc_framebuffer(void)
> +{
> +	struct i915_framebuffer *i915_fb;
> +
> +	i915_fb =3D kzalloc(sizeof(*i915_fb), GFP_KERNEL);
> +	if (i915_fb)
> +		return &i915_fb->base;
> +	return NULL;
> +}
> +
>  /* get, pin, and map the pages of the object into kernel space */
>  void *i915_gem_object_pin_map(struct drm_i915_gem_object *obj,
>  			      enum i915_map_type type)
> diff --git a/drivers/gpu/drm/xe/display/intel_bo.c b/drivers/gpu/drm/xe/d=
isplay/intel_bo.c
> index 27437c22bd70..926fcd9c86e1 100644
> --- a/drivers/gpu/drm/xe/display/intel_bo.c
> +++ b/drivers/gpu/drm/xe/display/intel_bo.c
> @@ -3,6 +3,8 @@
>=20=20
>  #include <drm/drm_gem.h>
>=20=20
> +#include "intel_display_types.h"
> +

This file is also supposed to be an abstraction layer, and should not be
looking at intel framebuffer details.

*sad trombone*

Jocelyn, not your fault, it's our fault, and it's also a bunch more todo
items and refactoring for us. :(

BR;
Jani.


>  #include "xe_bo.h"
>  #include "intel_bo.h"
>=20=20
> @@ -59,3 +61,25 @@ void intel_bo_describe(struct seq_file *m, struct drm_=
gem_object *obj)
>  {
>  	/* FIXME */
>  }
> +
> +struct xe_panic_data {
> +	struct page **pages;
> +	int page;
> +	void *vaddr;
> +};
> +
> +struct xe_framebuffer {
> +	struct intel_framebuffer base;
> +	struct xe_panic_data panic;
> +};
> +
> +struct intel_framebuffer *intel_bo_alloc_framebuffer(void)
> +{
> +	struct xe_framebuffer *xe_fb;
> +
> +	xe_fb =3D kzalloc(sizeof(*xe_fb), GFP_KERNEL);
> +	if (xe_fb)
> +		return &xe_fb->base;
> +	return NULL;
> +}
> +

--=20
Jani Nikula, Intel
