Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D38551FA4E
	for <lists+dri-devel@lfdr.de>; Mon,  9 May 2022 12:49:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B7E210EA9F;
	Mon,  9 May 2022 10:49:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8790110EA9F;
 Mon,  9 May 2022 10:49:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652093365; x=1683629365;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=5vDNIGHCUTsop4a773BsTnbcVjO1AfW8P1M8ZBXSLes=;
 b=HOvVC9Y6WhzNuiRDg2GhQi9IAJJIhFM9fVyrMdzVDJMW2Z3s5pgmdKj+
 fsheucSCq5lbLXtAQ41flMJdPWN9KPek76G25Hkh0KyHrXWPdOhQ30clU
 jeKaD8UNAKYCWE2Rhphf0HJ+F/uKJpYL7RoQYogxq4nSnHl/q+TLctAY/
 OmDv38ACogaHjhRlwe3zDc6Oua76RB/cIaRKBVty0jpRnYE/8og4lp1Ph
 KAl+/LWnWeahPw7E221T9koNmDDvWPDj7phZ+UwyS6UTrNZY4X6MBFdiL
 fKTgDPJ2mXMB01OXZ26tLgCuqcP7fyLWP2eB5zOdeNN2qNOyAoVNm8FRt g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10341"; a="329605653"
X-IronPort-AV: E=Sophos;i="5.91,211,1647327600"; d="scan'208";a="329605653"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2022 03:49:24 -0700
X-IronPort-AV: E=Sophos;i="5.91,211,1647327600"; d="scan'208";a="893626411"
Received: from mallen2-mobl1.ger.corp.intel.com (HELO [10.252.28.105])
 ([10.252.28.105])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2022 03:49:22 -0700
Message-ID: <5aea48fb-8b80-4873-5e37-64bec9562e46@intel.com>
Date: Mon, 9 May 2022 11:49:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 1/2] drm/i915: Enable THP on Icelake and beyond
Content-Language: en-GB
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Intel-gfx@lists.freedesktop.org
References: <20220429100414.647857-1-tvrtko.ursulin@linux.intel.com>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20220429100414.647857-1-tvrtko.ursulin@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: Eero Tamminen <eero.t.tamminen@intel.com>, dri-devel@lists.freedesktop.org,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 29/04/2022 11:04, Tvrtko Ursulin wrote:
> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> 
> We have a statement from HW designers that the GPU read regression when
> using 2M pages was fixed from Icelake onwards, which was also confirmed
> by bencharking Eero did last year:
> 
> """
> When IOMMU is disabled, enabling THP causes following perf changes on
> TGL-H (GT1):
> 
>      10-15% SynMark Batch[0-3]
>      5-10% MemBW GPU texture, SynMark ShMapVsm
>      3-5% SynMark TerrainFly* + Geom* + Fill* + CSCloth + Batch4
>      1-3% GpuTest Triangle, SynMark TexMem* + DeferredAA + Batch[5-7]
>            + few others
>      -7% MemBW GPU blend
> 
> In the above 3D benchmark names, * means all the variants of tests with
> the same prefix. For example "SynMark TexMem*", means both TexMem128 &
> TexMem512 tests in the synthetic (Intel internal) SynMark test suite.
> 
> In the (public, but proprietary) GfxBench & GLB(enchmark) test suites,
> there are both onscreen and offscreen variants of each test. Unless
> explicitly stated otherwise, numbers are for both variants.
> 
> All tests are run with FullHD monitor. All tests are fullscreen except
> for GLB and GpuTest ones, which are run in 1/2 screen window (GpuTest
> triangle is run both in fullscreen and 1/2 screen window).
> """
> 
> Since the only regression is MemBW GPU blend, against many more gains,
> it sounds it is time to enable THP on Gen11+.
> 
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> References: https://gitlab.freedesktop.org/drm/intel/-/issues/430
> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: Eero Tamminen <eero.t.tamminen@intel.com>

fwiw, for the series,
Reviewed-by: Matthew Auld <matthew.auld@intel.com>

> ---
>   drivers/gpu/drm/i915/gem/i915_gemfs.c | 13 +++++++++----
>   1 file changed, 9 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gem/i915_gemfs.c b/drivers/gpu/drm/i915/gem/i915_gemfs.c
> index ee87874e59dc..c5a6bbc842fc 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gemfs.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gemfs.c
> @@ -28,12 +28,14 @@ int i915_gemfs_init(struct drm_i915_private *i915)
>   	 *
>   	 * One example, although it is probably better with a per-file
>   	 * control, is selecting huge page allocations ("huge=within_size").
> -	 * However, we only do so to offset the overhead of iommu lookups
> -	 * due to bandwidth issues (slow reads) on Broadwell+.
> +	 * However, we only do so on platforms which benefit from it, or to
> +	 * offset the overhead of iommu lookups, where with latter it is a net
> +	 * win even on platforms which would otherwise see some performance
> +	 * regressions such a slow reads issue on Broadwell and Skylake.
>   	 */
>   
>   	opts = NULL;
> -	if (i915_vtd_active(i915)) {
> +	if (GRAPHICS_VER(i915) >= 11 || i915_vtd_active(i915)) {
>   		if (IS_ENABLED(CONFIG_TRANSPARENT_HUGEPAGE)) {
>   			opts = huge_opt;
>   			drm_info(&i915->drm,
> @@ -41,7 +43,10 @@ int i915_gemfs_init(struct drm_i915_private *i915)
>   				 opts);
>   		} else {
>   			drm_notice(&i915->drm,
> -				   "Transparent Hugepage support is recommended for optimal performance when IOMMU is enabled!\n");
> +				   "Transparent Hugepage support is recommended for optimal performance%s\n",
> +				   GRAPHICS_VER(i915) >= 11 ?
> +				   " on this platform!" :
> +				   " when IOMMU is enabled!");
>   		}
>   	}
>   
