Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6D9FB2C966
	for <lists+dri-devel@lfdr.de>; Tue, 19 Aug 2025 18:22:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7618E10E641;
	Tue, 19 Aug 2025 16:22:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GHib9DjB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A662810E1FA;
 Tue, 19 Aug 2025 16:22:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755620542; x=1787156542;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=W5BXlbdL6VMt9fy51GQ8P4Eh8jE43eeq4m0X4bsoFVk=;
 b=GHib9DjBJp6vJDDrh8UTl313YE1glh1dQ+sVhVmFjvrydx5PpOYGcrlK
 chhJROyMBjt9b7kAO2q1T3mftxWawLh/1ysd9mVvWMv87VbJMeJ3KH1FB
 S4ReA/bZ12htap3I1Ku3axfYIl24CFhkBsFREcl2GNfaTVYd/Nns8LuRn
 RP6Ha3Opy3SgfPxX25W5XkEOc3RSfpznSQmKz0VrD74Bg0mCCHuUfeOzP
 KvgdoXeAcdBw2LERAclxM5jcT9RqgvvsOvruBM/6QzUsoHWdWpu+UoxFg
 6h0LxtsHLU7lQ+9+0mObDqUJycg4GF18AkA50QBvQ135G4MTFYY1z5oIY Q==;
X-CSE-ConnectionGUID: biOxvtDzTdinLU52NnluXw==
X-CSE-MsgGUID: mpqTsHliReGUAi5TT3IAIQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11527"; a="57784061"
X-IronPort-AV: E=Sophos;i="6.17,302,1747724400"; d="scan'208";a="57784061"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2025 09:22:21 -0700
X-CSE-ConnectionGUID: KRj5XQo4TCqnKLwiAeRdFQ==
X-CSE-MsgGUID: L0XRhVf3RUKqK362RJBLlw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,302,1747724400"; d="scan'208";a="172326288"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO [10.245.244.175])
 ([10.245.244.175])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2025 09:22:14 -0700
Message-ID: <a781f7781a9bf510c3707a5c9a235e1dab785617.camel@linux.intel.com>
Subject: Re: [RFC 3/3] drm/xe: Add DRM_XE_GEM_CREATE_FLAG_PINNED flag and
 implementation
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Maarten Lankhorst <dev@lankhorst.se>, Lucas De Marchi	
 <lucas.demarchi@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, David
 Airlie	 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Maxime Ripard
 <mripard@kernel.org>, Natalie Vock <natalie.vock@gmx.de>, Tejun Heo	
 <tj@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>, 'Michal
 =?ISO-8859-1?Q?Koutn=FD=27?=	 <mkoutny@suse.com>, Michal Hocko
 <mhocko@kernel.org>, Roman Gushchin	 <roman.gushchin@linux.dev>, Shakeel
 Butt <shakeel.butt@linux.dev>, Muchun Song	 <muchun.song@linux.dev>, Andrew
 Morton <akpm@linux-foundation.org>, David Hildenbrand <david@redhat.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, "'Liam R . Howlett'"	
 <Liam.Howlett@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport	
 <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, Thomas
 Zimmermann	 <tzimmermann@suse.de>
Cc: Michal Hocko <mhocko@suse.com>, intel-xe@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 cgroups@vger.kernel.org, linux-mm@kvack.org
Date: Tue, 19 Aug 2025 18:22:12 +0200
In-Reply-To: <20250819114932.597600-8-dev@lankhorst.se>
References: <20250819114932.597600-5-dev@lankhorst.se>
 <20250819114932.597600-8-dev@lankhorst.se>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
MIME-Version: 1.0
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

Hi, Maarten,

On Tue, 2025-08-19 at 13:49 +0200, Maarten Lankhorst wrote:
> Add an option to pin memory through the science of cgroup accounting.
> A bo will be pinned for its entire lifetime, and this allows buffers
> that are pinned for dma-buf export without requiring the pinning to
> be
> done at the dma-buf layer for all devices.
>=20
> For now only implement VRAM pinning. Dave Airlie has a series to
> implement
> memcg accounting for the GPU but that is not ready yet.

Previous discussions around this have favoured a UAPI where we pin a
gpu-vm range, with a pin at mapping time, or dma-buf pin time where
required, this allows for dynamic pinning and unpinning, and would
avoid having separate pinning interfaces for bos and userptr.

In particular if we don't know at bo creation time which buffer objects
will be exported with a method requiring pinning, how would UMD deduce
what buffer objects to pin?

Thanks,
Thomas



>=20
> Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
> ---
> =C2=A0drivers/gpu/drm/xe/xe_bo.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 66
> ++++++++++++++++++++++++++++++++-
> =C2=A0drivers/gpu/drm/xe/xe_dma_buf.c | 10 ++++-
> =C2=A0include/uapi/drm/xe_drm.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 10 =
++++-
> =C2=A03 files changed, 82 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index 6fea39842e1e6..4095e6bd04ea9 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -5,6 +5,7 @@
> =C2=A0
> =C2=A0#include "xe_bo.h"
> =C2=A0
> +#include <linux/cgroup_dmem.h>
> =C2=A0#include <linux/dma-buf.h>
> =C2=A0#include <linux/nospec.h>
> =C2=A0
> @@ -208,7 +209,8 @@ static bool force_contiguous(u32 bo_flags)
> =C2=A0	 * must be contiguous, also only contiguous BOs support
> xe_bo_vmap.
> =C2=A0	 */
> =C2=A0	return bo_flags & XE_BO_FLAG_NEEDS_CPU_ACCESS &&
> -	=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bo_flags & XE_BO_FLAG_PINNED;
> +	=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bo_flags & XE_BO_FLAG_PINNED &&
> +	=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 !(bo_flags & XE_BO_FLAG_USER);
> =C2=A0}
> =C2=A0
> =C2=A0static void add_vram(struct xe_device *xe, struct xe_bo *bo,
> @@ -1697,6 +1699,16 @@ static void xe_gem_object_free(struct
> drm_gem_object *obj)
> =C2=A0	ttm_bo_put(container_of(obj, struct ttm_buffer_object,
> base));
> =C2=A0}
> =C2=A0
> +static void xe_bo_unpin_user(struct xe_bo *bo)
> +{
> +	xe_bo_unpin_external(bo);
> +
> +	if (bo->flags & XE_BO_FLAG_SYSTEM)
> +		WARN_ON(1);
> +	else
> +		dmem_cgroup_unpin(bo->ttm.resource->css,
> xe_bo_size(bo));
> +}
> +
> =C2=A0static void xe_gem_object_close(struct drm_gem_object *obj,
> =C2=A0				struct drm_file *file_priv)
> =C2=A0{
> @@ -1708,6 +1720,10 @@ static void xe_gem_object_close(struct
> drm_gem_object *obj,
> =C2=A0		xe_bo_lock(bo, false);
> =C2=A0		ttm_bo_set_bulk_move(&bo->ttm, NULL);
> =C2=A0		xe_bo_unlock(bo);
> +	} else if (bo->flags & XE_BO_FLAG_PINNED) {
> +		xe_bo_lock(bo, false);
> +		xe_bo_unpin_user(bo);
> +		xe_bo_unlock(bo);
> =C2=A0	}
> =C2=A0}
> =C2=A0
> @@ -2128,8 +2144,27 @@ struct xe_bo *xe_bo_create_user(struct
> xe_device *xe, struct xe_tile *tile,
> =C2=A0	struct xe_bo *bo =3D __xe_bo_create_locked(xe, tile, vm, size,
> 0, ~0ULL,
> =C2=A0						 cpu_caching,
> ttm_bo_type_device,
> =C2=A0						 flags |
> XE_BO_FLAG_USER, 0);
> -	if (!IS_ERR(bo))
> +	if (!IS_ERR(bo)) {
> +		int ret =3D 0;
> +
> +		if (bo->flags & XE_BO_FLAG_PINNED) {
> +			if (bo->flags & XE_BO_FLAG_SYSTEM) {
> +				ret =3D -ENOSYS; // TODO
> +			} else {
> +				ret =3D dmem_cgroup_try_pin(bo-
> >ttm.resource->css, size);
> +			}
> +			if (!ret)
> +				ret =3D xe_bo_pin_external(bo);
> +			else if (ret =3D=3D -EAGAIN)
> +				ret =3D -ENOSPC;
> +		}
> +
> =C2=A0		xe_bo_unlock_vm_held(bo);
> +		if (ret) {
> +			xe_bo_put(bo);
> +			return ERR_PTR(ret);
> +		}
> +	}
> =C2=A0
> =C2=A0	return bo;
> =C2=A0}
> @@ -2745,6 +2780,28 @@ int xe_gem_create_ioctl(struct drm_device
> *dev, void *data,
> =C2=A0			 args->cpu_caching =3D=3D
> DRM_XE_GEM_CPU_CACHING_WB))
> =C2=A0		return -EINVAL;
> =C2=A0
> +	if (XE_IOCTL_DBG(xe, args->flags &
> DRM_XE_GEM_CREATE_FLAG_PINNED)) {
> +		bool pinned_flag =3D true;
> +		/* Only allow a single placement for pinning */
> +		if (XE_IOCTL_DBG(xe, pinned_flag && hweight32(args-
> >placement) !=3D 1))
> +			return -EINVAL;
> +
> +		/* Meant for exporting, do not allow a VM-local BO
> */
> +		if (XE_IOCTL_DBG(xe, pinned_flag && args->vm_id))
> +			return -EINVAL;
> +
> +		/* Similarly, force fail at creation time for now.
> We may relax this requirement later */
> +		if (XE_IOCTL_DBG(xe, pinned_flag && args->flags &
> DRM_XE_GEM_CREATE_FLAG_DEFER_BACKING))
> +			return -EINVAL;
> +
> +		/* Require the appropriate cgroups to be enabled. */
> +		if (XE_IOCTL_DBG(xe, pinned_flag &&
> !IS_ENABLED(CONFIG_CGROUP_DMEM) && bo_flags & XE_BO_FLAG_VRAM_MASK)
> ||
> +		=C2=A0=C2=A0=C2=A0 XE_IOCTL_DBG(xe, pinned_flag &&
> !IS_ENABLED(CONFIG_MEMCG) && bo_flags & XE_BO_FLAG_SYSTEM))
> +			return -EINVAL;
> +
> +		bo_flags |=3D XE_BO_FLAG_PINNED;
> +	}
> +
> =C2=A0	if (args->vm_id) {
> =C2=A0		vm =3D xe_vm_lookup(xef, args->vm_id);
> =C2=A0		if (XE_IOCTL_DBG(xe, !vm))
> @@ -2790,6 +2847,11 @@ int xe_gem_create_ioctl(struct drm_device
> *dev, void *data,
> =C2=A0		__xe_bo_unset_bulk_move(bo);
> =C2=A0		xe_vm_unlock(vm);
> =C2=A0	}
> +	if (bo->flags & XE_BO_FLAG_PINNED) {
> +		xe_bo_lock(bo, false);
> +		xe_bo_unpin_user(bo);
> +		xe_bo_unlock(bo);
> +	}
> =C2=A0out_put:
> =C2=A0	xe_bo_put(bo);
> =C2=A0out_vm:
> diff --git a/drivers/gpu/drm/xe/xe_dma_buf.c
> b/drivers/gpu/drm/xe/xe_dma_buf.c
> index 346f857f38374..6719f4552ad37 100644
> --- a/drivers/gpu/drm/xe/xe_dma_buf.c
> +++ b/drivers/gpu/drm/xe/xe_dma_buf.c
> @@ -53,6 +53,11 @@ static int xe_dma_buf_pin(struct
> dma_buf_attachment *attach)
> =C2=A0	struct xe_device *xe =3D xe_bo_device(bo);
> =C2=A0	int ret;
> =C2=A0
> +	if (bo->flags & XE_BO_FLAG_PINNED) {
> +		ttm_bo_pin(&bo->ttm);
> +		return 0;
> +	}
> +
> =C2=A0	/*
> =C2=A0	 * For now only support pinning in TT memory, for two
> reasons:
> =C2=A0	 * 1) Avoid pinning in a placement not accessible to some
> importers.
> @@ -83,7 +88,10 @@ static void xe_dma_buf_unpin(struct
> dma_buf_attachment *attach)
> =C2=A0	struct drm_gem_object *obj =3D attach->dmabuf->priv;
> =C2=A0	struct xe_bo *bo =3D gem_to_xe_bo(obj);
> =C2=A0
> -	xe_bo_unpin_external(bo);
> +	if (bo->flags & XE_BO_FLAG_PINNED)
> +		ttm_bo_unpin(&bo->ttm);
> +	else
> +		xe_bo_unpin_external(bo);
> =C2=A0}
> =C2=A0
> =C2=A0static struct sg_table *xe_dma_buf_map(struct dma_buf_attachment
> *attach,
> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> index c721e130c1d2d..3184fa38ce17e 100644
> --- a/include/uapi/drm/xe_drm.h
> +++ b/include/uapi/drm/xe_drm.h
> @@ -765,12 +765,15 @@ struct drm_xe_device_query {
> =C2=A0 *=C2=A0=C2=A0=C2=A0 until the object is either bound to a virtual =
memory region
> via
> =C2=A0 *=C2=A0=C2=A0=C2=A0 VM_BIND or accessed by the CPU. As a result, n=
o backing memory
> is
> =C2=A0 *=C2=A0=C2=A0=C2=A0 reserved at the time of GEM object creation.
> - *=C2=A0 - %DRM_XE_GEM_CREATE_FLAG_SCANOUT
> + *=C2=A0 - %DRM_XE_GEM_CREATE_FLAG_SCANOUT - GEM object will be used
> + *=C2=A0=C2=A0=C2=A0 display framebuffer.
> =C2=A0 *=C2=A0 - %DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM - When using =
VRAM
> as a
> =C2=A0 *=C2=A0=C2=A0=C2=A0 possible placement, ensure that the correspond=
ing VRAM
> allocation
> =C2=A0 *=C2=A0=C2=A0=C2=A0 will always use the CPU accessible part of VRA=
M. This is
> important
> =C2=A0 *=C2=A0=C2=A0=C2=A0 for small-bar systems (on full-bar systems thi=
s gets turned
> into a
> =C2=A0 *=C2=A0=C2=A0=C2=A0 noop).
> + *=C2=A0 - %DRM_XE_GEM_CREATE_FLAG_PINNED - Pin the backing memory
> permanently
> + *=C2=A0=C2=A0=C2=A0 on allocation, if withing cgroups limits.
> =C2=A0 *=C2=A0=C2=A0=C2=A0 Note1: System memory can be used as an extra p=
lacement if the
> kernel
> =C2=A0 *=C2=A0=C2=A0=C2=A0 should spill the allocation to system memory, =
if space can't
> be made
> =C2=A0 *=C2=A0=C2=A0=C2=A0 available in the CPU accessible part of VRAM (=
giving the same
> @@ -781,6 +784,10 @@ struct drm_xe_device_query {
> =C2=A0 *=C2=A0=C2=A0=C2=A0 need to use VRAM for display surfaces, therefo=
re the kernel
> requires
> =C2=A0 *=C2=A0=C2=A0=C2=A0 setting this flag for such objects, otherwise =
an error is
> thrown on
> =C2=A0 *=C2=A0=C2=A0=C2=A0 small-bar systems.
> + *=C2=A0=C2=A0=C2=A0 Note3: %DRM_XE_GEM_CREATE_FLAG_PINNED requires the =
BO to have
> only
> + *=C2=A0=C2=A0=C2=A0 a single placement, no vm_id, requires (device) mem=
ory cgroups
> enabled,
> + *=C2=A0=C2=A0=C2=A0 and is incompatible with the %DEFER_BACKING and
> %NEEDS_VISIBLE_VRAM
> + *=C2=A0=C2=A0=C2=A0 flags.
> =C2=A0 *
> =C2=A0 * @cpu_caching supports the following values:
> =C2=A0 *=C2=A0 - %DRM_XE_GEM_CPU_CACHING_WB - Allocate the pages with wri=
te-
> back
> @@ -827,6 +834,7 @@ struct drm_xe_gem_create {
> =C2=A0#define DRM_XE_GEM_CREATE_FLAG_DEFER_BACKING		(1 << 0)
> =C2=A0#define DRM_XE_GEM_CREATE_FLAG_SCANOUT			(1 << 1)
> =C2=A0#define DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM	(1 << 2)
> +#define DRM_XE_GEM_CREATE_FLAG_PINNED			(1 << 3)
> =C2=A0	/**
> =C2=A0	 * @flags: Flags, currently a mask of memory instances of
> where BO can
> =C2=A0	 * be placed

