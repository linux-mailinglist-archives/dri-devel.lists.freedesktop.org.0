Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 21A5C494D6E
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jan 2022 12:54:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B5F110E490;
	Thu, 20 Jan 2022 11:54:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBE3E10E45E;
 Thu, 20 Jan 2022 11:54:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1642679646; x=1674215646;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=hWH9CQcyJ3OyvK1GCGLRnCY5B+LN3QzOt6ywsVoqDPA=;
 b=Ksjkhc82EQmFEnBRIG95KJv+DXGgAslCX+u5picgjiN8c92U4cIuvLtM
 61fks0TdEdNzeb1biZhK0FoBbn03iikAZsSPMTUewfYI6kPKbE2iErYJJ
 e5t4hsLegv4KcQ8w43CDRX0YrAP1goW+cI6KOzNDw620sOeHXEWts1eTd
 ttb3M/u/jjSRcY1UKuM1QNa0tTiBcMy0nCPVKfTP3nlAZpxCrv3M7xjfi
 KPLAADqoBbDTHNY6QgA5OPRyS5UMteh/1qF2cBiP82HYzrZ/xprreO4gQ
 yfeRtcqtlNTN4wWIdiOq8fGOyUhHYbPaqLTBo0TbhiuCi9mE+sc47i8bh g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10232"; a="269734463"
X-IronPort-AV: E=Sophos;i="5.88,302,1635231600"; d="scan'208";a="269734463"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2022 03:54:06 -0800
X-IronPort-AV: E=Sophos;i="5.88,302,1635231600"; d="scan'208";a="767572817"
Received: from ramaling-i9x.iind.intel.com (HELO intel.com) ([10.203.144.108])
 by fmsmga005-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2022 03:54:01 -0800
Date: Thu, 20 Jan 2022 17:23:58 +0530
From: Ramalingam C <ramalingam.c@intel.com>
To: Robert Beckett <bob.beckett@collabora.com>
Subject: Re: [PATCH v2 4/4] drm/i915/uapi: document behaviour for DG2 64K
 support
Message-ID: <20220120115357.GB8264@intel.com>
References: <20220118175036.3840934-1-bob.beckett@collabora.com>
 <20220118175036.3840934-5-bob.beckett@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220118175036.3840934-5-bob.beckett@collabora.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: Tony Ye <tony.ye@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 dri-devel@lists.freedesktop.org, Jordan Justen <jordan.l.justen@intel.com>,
 David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org,
 Kenneth Graunke <kenneth@whitecape.org>,
 Slawomir Milczarek <slawomir.milczarek@intel.com>,
 Matthew Auld <matthew.auld@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 mesa-dev@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2022-01-18 at 17:50:37 +0000, Robert Beckett wrote:
> From: Matthew Auld <matthew.auld@intel.com>
> 
> On discrete platforms like DG2, we need to support a minimum page size
> of 64K when dealing with device local-memory. This is quite tricky for
> various reasons, so try to document the new implicit uapi for this.
> 
> v2: Fixed suggestions on formatting [Daniel]
> 
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Signed-off-by: Ramalingam C <ramalingam.c@intel.com>
> Signed-off-by: Robert Beckett <bob.beckett@collabora.com>
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
> index 5e678917da70..486b7b96291e 100644
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
>  
> @@ -3145,11 +3151,39 @@ struct drm_i915_gem_create_ext {
>  	 *
>  	 * The (page-aligned) allocated size for the object will be returned.
>  	 *
> -	 * Note that for some devices we have might have further minimum
> -	 * page-size restrictions(larger than 4K), like for device local-memory.
> -	 * However in general the final size here should always reflect any
> -	 * rounding up, if for example using the I915_GEM_CREATE_EXT_MEMORY_REGIONS
> -	 * extension to place the object in device local-memory.
> +	 *
> +	 * **DG2 64K min page size implications:**
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
> +	 * **Special DG2 GTT address alignment requirement:**
> +	 *
> +	 * The GTT alignment will also need be at least 2M for  such objects.
> +	 *
> +	 * Note that due to how the hardware implements 64K GTT page support, we
> +	 * have some further complications:
> +	 *
> +	 *   1) The entire PDE(which covers a 2MB virtual address range), must
> +	 *   contain only 64K PTEs, i.e mixing 4K and 64K PTEs in the same
> +	 *   PDE is forbidden by the hardware.
> +	 *
> +	 *   2) We still need to support 4K PTEs for I915_MEMORY_CLASS_SYSTEM
> +	 *   objects.
> +	 *
> +	 * To keep things simple for userland, we mandate that any GTT mappings
> +	 * must be aligned to and rounded up to 2MB. As this only wastes virtual
> +	 * address space and avoids userland having to copy any needlessly
> +	 * complicated PDE sharing scheme (coloring) and only affects GD2, this
> +	 * id deemed to be a good compromise.
"only affects DG2, this is" 

Except these typos, patch looks good to me

Reviewed-by: Ramalingam C <ramalingam.c@intel.com>
>  	 */
>  	__u64 size;
>  	/**
> -- 
> 2.25.1
> 
