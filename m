Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9424A4027A3
	for <lists+dri-devel@lfdr.de>; Tue,  7 Sep 2021 13:13:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14A2389F3B;
	Tue,  7 Sep 2021 11:13:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73B0A89F38;
 Tue,  7 Sep 2021 11:13:50 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10099"; a="242453209"
X-IronPort-AV: E=Sophos;i="5.85,274,1624345200"; d="scan'208";a="242453209"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2021 04:13:49 -0700
X-IronPort-AV: E=Sophos;i="5.85,274,1624345200"; d="scan'208";a="469156813"
Received: from unknown (HELO ettammin-desk.ger.corp.intel.com)
 ([10.251.214.86])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2021 04:13:45 -0700
Subject: Re: [PATCH v4] drm/i915: Use Transparent Hugepages when IOMMU is
 enabled
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, Tvrtko Ursulin
 <tvrtko.ursulin@intel.com>, Chris Wilson <chris@chris-wilson.co.uk>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Matthew Auld <matthew.auld@intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Daniel Vetter <daniel@ffwll.ch>
References: <20210907103407.432646-1-tvrtko.ursulin@linux.intel.com>
From: Eero Tamminen <eero.t.tamminen@intel.com>
Organization: Intel
Message-ID: <e76e521b-b8fa-0e38-7cd4-136101c94539@intel.com>
Date: Tue, 7 Sep 2021 14:13:42 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210907103407.432646-1-tvrtko.ursulin@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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

Hi,

For completeness sake, it might be worth mentioning specifically what 
(synthetic) test-cases regress with THP patch.

* Skylake GT4e:
   20-25% SynMark TexMem*
   (whereas all MemBW GPU tests either improve or are not affected)

* Broxton J4205:
   7% MemBW GPU texture
   2-3% SynMark TexMem*

* Tigerlake-H:
   7% MemBW GPU blend

I have no idea why on GEN9 texture accesses regress, but on GEN12 TGL 
it's render buffer blend that regresses.

Blend (read+write) regressing is especially odd, as neither render 
buffer read nor write regresses.

Maybe that is a GEN12 specific driver bug similar to Mesa/i965 bug from 
few years back in how its shaders access render buffer, that had caused 
SIMD32 accesses to regress memory BW bound test-cases perf a bit 
compared to SIMD16?

(Blend test is likely to run nowadays as SIMD32.)


	- Eero

On 7.9.2021 13.34, Tvrtko Ursulin wrote:
> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> 
> Usage of Transparent Hugepages was disabled in 9987da4b5dcf
> ("drm/i915: Disable THP until we have a GPU read BW W/A"), but since it
> appears majority of performance regressions reported with an enabled IOMMU
> can be almost eliminated by turning them on, lets just do that.
> 
> To err on the side of safety we keep the current default in cases where
> IOMMU is not active, and only when it is default to the "huge=within_size"
> mode. Although there probably would be wins to enable them throughout,
> more extensive testing across benchmarks and platforms would need to be
> done.
> 
> With the patch and IOMMU enabled my local testing on a small Skylake part
> shows OglVSTangent regression being reduced from ~14% (IOMMU on versus
> IOMMU off) to ~2% (same comparison but with THP on).
> 
> More detailed testing done in the below referenced Gitlab issue by Eero:
> 
> Skylake GT4e:
> 
> Performance drops from enabling IOMMU:
> 
>      30-35% SynMark CSDof
>      20-25% Unigine Heaven, MemBW GPU write, SynMark VSTangent
>      ~20% GLB Egypt  (1/2 screen window)
>      10-15% GLB T-Rex (1/2 screen window)
>      8-10% GfxBench T-Rex, MemBW GPU blit
>      7-8% SynMark DeferredAA + TerrainFly* + ZBuffer
>      6-7% GfxBench Manhattan 3.0 + 3.1, SynMark TexMem128 & CSCloth
>      5-6% GfxBench CarChase, Unigine Valley
>      3-5% GfxBench Vulkan & GL AztecRuins + ALU2, MemBW GPU texture,
>           SynMark Fill*, Deferred, TerrainPan*
>      1-2% Most of the other tests
> 
> With the patch drops become:
> 
>      20-25% SynMark TexMem*
>      15-20% GLB Egypt (1/2 screen window)
>      10-15% GLB T-Rex (1/2 screen window)
>      4-7% GfxBench T-Rex, GpuTest Triangle
>      1-8% GfxBench ALU2 (offscreen 1%, onscreen 8%)
>      3% GfxBench Manhattan 3.0, SynMark CSDof
>      2-3% Unigine Heaven + Valley, MemBW GPU texture
>      1-3 GfxBench Manhattan 3.1 + CarChase + Vulkan & GL AztecRuins
> 
> Broxton:
> 
> Performance drops from IOMMU, without patch:
> 
>      30% MemBW GPU write
>      25% SynMark ZBuffer + Fill*
>      20% MemBW GPU blit
>      15% MemBW GPU blend, GpuTest Triangle
>      10-15% MemBW GPU texture
>      10% GLB Egypt, Unigine Heaven (had hangs), SynMark TerrainFly*
>      7-9% GLB T-Rex, GfxBench Manhattan 3.0 + T-Rex,
>           SynMark Deferred* + TexMem*
>      6-8% GfxBench CarChase, Unigine Valley,
>           SynMark CSCloth + ShMapVsm + TerrainPan*
>      5-6% GfxBench Manhattan 3.1 + GL AztecRuins,
>           SynMark CSDof + TexFilterTri
>      2-4% GfxBench ALU2, SynMark DrvRes + GSCloth + ShMapPcf + Batch[0-5] +
>           TexFilterAniso, GpuTest GiMark + 32-bit Julia
> 
> And with patch:
> 
>      15-20% MemBW GPU texture
>      10% SynMark TexMem*
>      8-9% GLB Egypt (1/2 screen window)
>      4-5% GLB T-Rex (1/2 screen window)
>      3-6% GfxBench Manhattan 3.0, GpuTest FurMark,
>           SynMark Deferred + TexFilterTri
>      3-4% GfxBench Manhattan 3.1 + T-Rex, SynMark VSInstancing
>      2-4% GpuTest Triangle, SynMark DeferredAA
>      2-3% Unigine Heaven + Valley
>      1-3% SynMark Terrain*
>      1-2% GfxBench CarChase, SynMark TexFilterAniso + ZBuffer
> 
> Tigerlake-H:
> 
>      20-25% MemBW GPU texture
>      15-20% GpuTest Triangle
>      13-15% SynMark TerrainFly* + DeferredAA + HdrBloom
>      8-10% GfxBench Manhattan 3.1, SynMark TerrainPan* + DrvRes
>      6-7% GfxBench Manhattan 3.0, SynMark TexMem*
>      4-8% GLB onscreen Fill + T-Rex + Egypt (more in onscreen than
>           offscreen versions of T-Rex/Egypt)
>      4-6% GfxBench CarChase + GLES AztecRuins + ALU2, GpuTest 32-bit Julia,
>           SynMark CSDof + DrvState
>      3-5% GfxBench T-Rex + Egypt, Unigine Heaven + Valley, GpuTest Plot3D
>      1-7% Media tests
>      2-3% MemBW GPU blit
>      1-3% Most of the rest of 3D tests
> 
> With the patch:
> 
>      6-8% MemBW GPU blend => the only regression in these tests (compared
>           to IOMMU without THP)
>      4-6% SynMark DrvState (not impacted) + HdrBloom (improved)
>      3-4% GLB T-Rex
>      ~3% GLB Egypt, SynMark DrvRes
>      1-3% GfxBench T-Rex + Egypt, SynMark TexFilterTri
>      1-2% GfxBench CarChase + GLES AztecRuins, Unigine Valley,
>          GpuTest Triangle
>      ~1% GfxBench Manhattan 3.0/3.1, Unigine Heaven
> 
> Perf of several tests actually improved with IOMMU + THP, compared to no
> IOMMU / no THP:
> 
>      10-15% SynMark Batch[0-3]
>      5-10% MemBW GPU texture, SynMark ShMapVsm
>      3-4% SynMark Fill* + Geom*
>      2-3% SynMark TexMem512 + CSCloth
>      1-2% SynMark TexMem128 + DeferredAA
> 
> v2:
>   * Add Kconfig dependency to transparent hugepages and some help text.
>   * Move to helper for easier handling of kernel build options.
> 
> v3:
>   * Drop Kconfig. (Daniel)
> 
> v4:
>   * Add some benchmark results to commit message.
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
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com> # v1
> ---
>   drivers/gpu/drm/i915/gem/i915_gemfs.c | 22 +++++++++++++++++++---
>   1 file changed, 19 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gem/i915_gemfs.c b/drivers/gpu/drm/i915/gem/i915_gemfs.c
> index 5e6e8c91ab38..dbdbdc344d87 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gemfs.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gemfs.c
> @@ -6,7 +6,6 @@
>   
>   #include <linux/fs.h>
>   #include <linux/mount.h>
> -#include <linux/pagemap.h>
>   
>   #include "i915_drv.h"
>   #include "i915_gemfs.h"
> @@ -15,6 +14,7 @@ int i915_gemfs_init(struct drm_i915_private *i915)
>   {
>   	struct file_system_type *type;
>   	struct vfsmount *gemfs;
> +	char *opts;
>   
>   	type = get_fs_type("tmpfs");
>   	if (!type)
> @@ -26,10 +26,26 @@ int i915_gemfs_init(struct drm_i915_private *i915)
>   	 *
>   	 * One example, although it is probably better with a per-file
>   	 * control, is selecting huge page allocations ("huge=within_size").
> -	 * Currently unused due to bandwidth issues (slow reads) on Broadwell+.
> +	 * However, we only do so to offset the overhead of iommu lookups
> +	 * due to bandwidth issues (slow reads) on Broadwell+.
>   	 */
>   
> -	gemfs = kern_mount(type);
> +	opts = NULL;
> +	if (intel_vtd_active()) {
> +		if (IS_ENABLED(CONFIG_TRANSPARENT_HUGEPAGE)) {
> +			static char huge_opt[] = "huge=within_size"; /* r/w */
> +
> +			opts = huge_opt;
> +			drm_info(&i915->drm,
> +				 "Transparent Hugepage mode '%s'\n",
> +				 opts);
> +		} else {
> +			drm_notice(&i915->drm,
> +				   "Transparent Hugepage support is recommended for optimal performance when IOMMU is enabled!\n");
> +		}
> +	}
> +
> +	gemfs = vfs_kern_mount(type, SB_KERNMOUNT, type->name, opts);
>   	if (IS_ERR(gemfs))
>   		return PTR_ERR(gemfs);
>   
> 
