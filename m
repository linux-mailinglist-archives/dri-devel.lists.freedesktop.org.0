Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F1683D9300
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jul 2021 18:16:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF7056E20E;
	Wed, 28 Jul 2021 16:16:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7990F6E20E;
 Wed, 28 Jul 2021 16:16:32 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10059"; a="212423177"
X-IronPort-AV: E=Sophos;i="5.84,276,1620716400"; d="scan'208";a="212423177"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2021 09:16:27 -0700
X-IronPort-AV: E=Sophos;i="5.84,276,1620716400"; d="scan'208";a="566922494"
Received: from hseyedro-mobl.amr.corp.intel.com (HELO intel.com)
 ([10.213.174.18])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2021 09:16:26 -0700
Date: Wed, 28 Jul 2021 12:16:25 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Subject: Re: [PATCH] drm/i915: Use Transparent Hugepages when IOMMU is enabled
Message-ID: <YQGC2a1OsjaMqSv1@intel.com>
References: <20210728141249.357067-1-tvrtko.ursulin@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210728141249.357067-1-tvrtko.ursulin@linux.intel.com>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>, Intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Chris Wilson <chris@chris-wilson.co.uk>,
 Matthew Auld <matthew.auld@intel.com>,
 Eero Tamminen <eero.t.tamminen@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jul 28, 2021 at 03:12:49PM +0100, Tvrtko Ursulin wrote:
> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> 
> Usage of Transparent Hugepages was disabled in 9987da4b5dcf
> ("drm/i915: Disable THP until we have a GPU read BW W/A"), but since it
> appears majority of performance regressions reported with an enabled IOMMU
> can be almost eliminated by turning them on, lets do that by adding a
> couple of Kconfig options.
> 
> To err on the side of safety we keep the current default in cases where
> IOMMU is not active, and only when it is default to the "huge=within_size"
> mode. Although there probably would be wins to enable them throughout,
> more extensive testing across benchmarks and platforms would need to be
> done.
> 
> With the patch and IOMMU enabled my local testing on a small Skylake part
> shows OglVSTangent regression being reduced from ~14% to ~2%.
> 
> References: b901bb89324a ("drm/i915/gemfs: enable THP")
> References: 9987da4b5dcf ("drm/i915: Disable THP until we have a GPU read BW W/A")
> References: https://gitlab.freedesktop.org/drm/intel/-/issues/430
> Co-developed-by: Chris Wilson <chris@chris-wilson.co.uk>
> Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: Eero Tamminen <eero.t.tamminen@intel.com>
> Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> ---
>  drivers/gpu/drm/i915/Kconfig.profile  | 46 +++++++++++++++++++++++++++
>  drivers/gpu/drm/i915/gem/i915_gemfs.c | 11 +++++--
>  2 files changed, 55 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/Kconfig.profile b/drivers/gpu/drm/i915/Kconfig.profile
> index 39328567c200..c64c3d39a0f9 100644
> --- a/drivers/gpu/drm/i915/Kconfig.profile
> +++ b/drivers/gpu/drm/i915/Kconfig.profile
> @@ -119,3 +119,49 @@ config DRM_I915_TIMESLICE_DURATION
>  	  /sys/class/drm/card?/engine/*/timeslice_duration_ms
>  
>  	  May be 0 to disable timeslicing.
> +
> +choice
> +	prompt "Transparent Hugepage Support (native)"
> +	default DRM_I915_THP_NATIVE_NEVER
> +	help
> +	  Select the preferred method for allocating from Transparent Hugepages
> +	  when IOMMU is not enabled.
> +
> +	config DRM_I915_THP_NATIVE_NEVER
> +	bool "Never"
> +
> +	config DRM_I915_THP_NATIVE_WITHIN
> +	bool "Within"
> +
> +	config DRM_I915_THP_NATIVE_ALWAYS
> +	bool "Always"
> +endchoice
> +
> +config DRM_I915_THP_NATIVE
> +	string
> +	default "always" if DRM_I915_THP_NATIVE_ALWAYS
> +	default "within_size" if DRM_I915_THP_NATIVE_WITHIN
> +	default "never" if DRM_I915_THP_NATIVE_NEVER
> +
> +choice
> +	prompt "Transparent Hugepage Support (IOMMU)"
> +	default DRM_I915_THP_IOMMU_WITHIN
> +	help
> +	  Select the preferred method for allocating from Transparent Hugepages
> +	  with IOMMU active.
> +
> +	config DRM_I915_THP_IOMMU_NEVER
> +	bool "Never"
> +
> +	config DRM_I915_THP_IOMMU_WITHIN
> +	bool "Within"
> +
> +	config DRM_I915_THP_IOMMU_ALWAYS
> +	bool "Always"
> +endchoice
> +
> +config DRM_I915_THP_IOMMU
> +	string
> +	default "always" if DRM_I915_THP_IOMMU_ALWAYS
> +	default "within_size" if DRM_I915_THP_IOMMU_WITHIN
> +	default "never" if DRM_I915_THP_IOMMU_NEVER
> diff --git a/drivers/gpu/drm/i915/gem/i915_gemfs.c b/drivers/gpu/drm/i915/gem/i915_gemfs.c
> index 5e6e8c91ab38..b71d2b2d2ada 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gemfs.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gemfs.c
> @@ -13,8 +13,11 @@
>  
>  int i915_gemfs_init(struct drm_i915_private *i915)
>  {
> +	char thp_native[] = "huge=" CONFIG_DRM_I915_THP_NATIVE;
> +	char thp_iommu[] = "huge=" CONFIG_DRM_I915_THP_IOMMU;
>  	struct file_system_type *type;
>  	struct vfsmount *gemfs;
> +	char *opts;
>  
>  	type = get_fs_type("tmpfs");
>  	if (!type)
> @@ -26,15 +29,19 @@ int i915_gemfs_init(struct drm_i915_private *i915)
>  	 *
>  	 * One example, although it is probably better with a per-file
>  	 * control, is selecting huge page allocations ("huge=within_size").
> -	 * Currently unused due to bandwidth issues (slow reads) on Broadwell+.
> +	 * However, we only do so to offset the overhead of iommu lookups
> +	 * due to bandwidth issues (slow reads) on Broadwell+.
>  	 */
> +	opts = intel_vtd_active() ? thp_iommu : thp_native;

at first sight I got confused on why we where having to configs, then
very few drivers using the mount option there, so it took me a few
minutes to realize it... but I know understood the goal...

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

>  
> -	gemfs = kern_mount(type);
> +	gemfs = vfs_kern_mount(type, SB_KERNMOUNT, type->name, opts);
>  	if (IS_ERR(gemfs))
>  		return PTR_ERR(gemfs);
>  
>  	i915->mm.gemfs = gemfs;
>  
> +	drm_info(&i915->drm, "Transparent Hugepage mode '%s'", opts);
> +
>  	return 0;
>  }
>  
> -- 
> 2.30.2
> 
