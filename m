Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 85B704BB0FC
	for <lists+dri-devel@lfdr.de>; Fri, 18 Feb 2022 05:57:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4709C10EBA5;
	Fri, 18 Feb 2022 04:57:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C10E10EB91;
 Fri, 18 Feb 2022 04:57:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645160257; x=1676696257;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=l7ftpFnCb/O18IQbZiuP+YjPFB7WGOV4wq64D8YJp0E=;
 b=iS/beWCRv+byLKkYVXdk+WIQwULKWky8uydPNHpeGzWUSiBCWZk2++ZW
 24RuUtYWijwR2pbUVyH0EyzPzYqTSvv0nmx9qN6dAqyJ4NeSw8U0IV4fT
 tVxq9CPlrH9/zWPpd8ZX+NxEW5K8WZRGvvTFSw+geAc2Wdik/+7VyvMy4
 NsqrO10tKv+dyGMYY399qKKg/MbY4Hj4SARegKA/h3BVhDFd1FYao54zc
 MybpBgX8lsnDOknogyoQ7b05cm5fT8yq6mqE0F7WciFT3lCGpUpxs/+L8
 l9UDp/Co2nYGYTyWRq1cWbNm9IelUnYvVXi+5hd3k/uf1HLqBfNwh4LsK Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10261"; a="314316593"
X-IronPort-AV: E=Sophos;i="5.88,377,1635231600"; d="scan'208";a="314316593"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2022 20:57:36 -0800
X-IronPort-AV: E=Sophos;i="5.88,377,1635231600"; d="scan'208";a="546104238"
Received: from bmeland-mobl2.amr.corp.intel.com (HELO localhost)
 ([10.212.148.192])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2022 20:57:36 -0800
From: Jordan Justen <jordan.l.justen@intel.com>
To: Robert Beckett <bob.beckett@collabora.com>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, David Airlie
 <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH v8 5/5] drm/i915/uapi: document behaviour for DG2 64K
 support
In-Reply-To: <20220208203419.1094362-6-bob.beckett@collabora.com>
References: <20220208203419.1094362-1-bob.beckett@collabora.com>
 <20220208203419.1094362-6-bob.beckett@collabora.com>
Date: Thu, 17 Feb 2022 20:57:35 -0800
Message-ID: <87ee40ojpc.fsf@jljusten-skl>
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
Cc: Robert Beckett <bob.beckett@collabora.com>,
 Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 Kenneth Graunke <kenneth@whitecape.org>, Tony Ye <tony.ye@intel.com>,
 Slawomir Milczarek <slawomir.milczarek@intel.com>,
 Matthew Auld <matthew.auld@intel.com>, mesa-dev@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Robert Beckett <bob.beckett@collabora.com> writes:

> From: Matthew Auld <matthew.auld@intel.com>
>
> On discrete platforms like DG2, we need to support a minimum page size
> of 64K when dealing with device local-memory. This is quite tricky for
> various reasons, so try to document the new implicit uapi for this.
>
> v3: fix typos and less emphasis
> v2: Fixed suggestions on formatting [Daniel]
>
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Signed-off-by: Ramalingam C <ramalingam.c@intel.com>
> Signed-off-by: Robert Beckett <bob.beckett@collabora.com>
> Acked-by: Jordan Justen <jordan.l.justen@intel.com>
> Reviewed-by: Ramalingam C <ramalingam.c@intel.com>
> Reviewed-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> cc: Simon Ser <contact@emersion.fr>
> cc: Pekka Paalanen <ppaalanen@gmail.com>
> Cc: Jordan Justen <jordan.l.justen@intel.com>
> Cc: Kenneth Graunke <kenneth@whitecape.org>
> Cc: mesa-dev@lists.freedesktop.org
> Cc: Tony Ye <tony.ye@intel.com>
> Cc: Slawomir Milczarek <slawomir.milczarek@intel.com>
> ---
>  include/uapi/drm/i915_drm.h | 44 ++++++++++++++++++++++++++++++++-----
>  1 file changed, 39 insertions(+), 5 deletions(-)
>
> diff --git a/include/uapi/drm/i915_drm.h b/include/uapi/drm/i915_drm.h
> index 5e678917da70..77e5e74c32c1 100644
> --- a/include/uapi/drm/i915_drm.h
> +++ b/include/uapi/drm/i915_drm.h
> @@ -1118,10 +1118,16 @@ struct drm_i915_gem_exec_object2 {
>  	/**
>  	 * When the EXEC_OBJECT_PINNED flag is specified this is populated by
>  	 * the user with the GTT offset at which this object will be pinned.
> +	 *
>  	 * When the I915_EXEC_NO_RELOC flag is specified this must contain the
>  	 * presumed_offset of the object.
> +	 *
>  	 * During execbuffer2 the kernel populates it with the value of the
>  	 * current GTT offset of the object, for future presumed_offset writes.
> +	 *
> +	 * See struct drm_i915_gem_create_ext for the rules when dealing with
> +	 * alignment restrictions with I915_MEMORY_CLASS_DEVICE, on devices with
> +	 * minimum page sizes, like DG2.
>  	 */
>  	__u64 offset;
>=20=20
> @@ -3145,11 +3151,39 @@ struct drm_i915_gem_create_ext {
>  	 *
>  	 * The (page-aligned) allocated size for the object will be returned.
>  	 *
> -	 * Note that for some devices we have might have further minimum
> -	 * page-size restrictions(larger than 4K), like for device local-memory.
> -	 * However in general the final size here should always reflect any
> -	 * rounding up, if for example using the I915_GEM_CREATE_EXT_MEMORY_REG=
IONS
> -	 * extension to place the object in device local-memory.
> +	 *
> +	 * DG2 64K min page size implications:
> +	 *
> +	 * On discrete platforms, starting from DG2, we have to contend with GTT
> +	 * page size restrictions when dealing with I915_MEMORY_CLASS_DEVICE
> +	 * objects.  Specifically the hardware only supports 64K or larger GTT
> +	 * page sizes for such memory. The kernel will already ensure that all
> +	 * I915_MEMORY_CLASS_DEVICE memory is allocated using 64K or larger page
> +	 * sizes underneath.
> +	 *
> +	 * Note that the returned size here will always reflect any required
> +	 * rounding up done by the kernel, i.e 4K will now become 64K on devices
> +	 * such as DG2.
> +	 *
> +	 * Special DG2 GTT address alignment requirement:
> +	 *
> +	 * The GTT alignment will also need to be at least 2M for such objects.
> +	 *
> +	 * Note that due to how the hardware implements 64K GTT page support, we
> +	 * have some further complications:
> +	 *
> +	 *   1) The entire PDE (which covers a 2MB virtual address range), must
> +	 *   contain only 64K PTEs, i.e mixing 4K and 64K PTEs in the same
> +	 *   PDE is forbidden by the hardware.
> +	 *
> +	 *   2) We still need to support 4K PTEs for I915_MEMORY_CLASS_SYSTEM
> +	 *   objects.
> +	 *
> +	 * To keep things simple for userland, we mandate that any GTT mappings
> +	 * must be aligned to and rounded up to 2MB.

Could I get a clarification about this "rounded up" part.

Currently Mesa is aligning the start of each and every buffer VMA to be
2MiB aligned. But, we are *not* taking any steps to "round up" the size
of buffers to 2MiB alignment.

Bob's Mesa MR from a while ago,

https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/14599

was trying to add this "round up" size for buffers. We didn't accept
this MR because we thought if we have ensured that no other buffer will
use the same 2MiB VMA range, then it should not be required.

If what we are doing is ok, then maybe this "round up" language should
be dropped? Or, perhaps the "round up" mentioned here isn't implying we
must align the size of buffers that we create, and I'm misinterpreting
this.

-Jordan

> As this only wastes virtual
> +	 * address space and avoids userland having to copy any needlessly
> +	 * complicated PDE sharing scheme (coloring) and only affects DG2, this
> +	 * is deemed to be a good compromise.
>  	 */
>  	__u64 size;
>  	/**
> --=20
> 2.25.1
