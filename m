Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2781E2C673D
	for <lists+dri-devel@lfdr.de>; Fri, 27 Nov 2020 14:53:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 542E86EDCA;
	Fri, 27 Nov 2020 13:53:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BBD06EDC6;
 Fri, 27 Nov 2020 13:52:58 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 23133764-1500050 for multiple; Fri, 27 Nov 2020 13:52:54 +0000
MIME-Version: 1.0
In-Reply-To: <20201127120718.454037-119-matthew.auld@intel.com>
References: <20201127120718.454037-1-matthew.auld@intel.com>
 <20201127120718.454037-119-matthew.auld@intel.com>
Subject: Re: [Intel-gfx] [RFC PATCH 118/162] drm/i915/dg1: Reserve first 1MB
 of local memory
From: Chris Wilson <chris@chris-wilson.co.uk>
To: Matthew Auld <matthew.auld@intel.com>, intel-gfx@lists.freedesktop.org
Date: Fri, 27 Nov 2020 13:52:54 +0000
Message-ID: <160648517402.2925.2248861493310859776@build.alporthouse.com>
User-Agent: alot/0.9
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Matthew Auld (2020-11-27 12:06:34)
> From: Imre Deak <imre.deak@intel.com>
> 
> On DG1 A0/B0 steppings the first 1MB of local memory must be reserved.
> One reason for this is that the 0xA0000-0xB0000 range is not accessible
> by the display, probably since this region is redirected to another
> memory location for legacy VGA compatibility.
> 
> BSpec: 50586
> Testcase: igt/kms_big_fb/linear-64bpp-rotate-0
> Signed-off-by: Imre Deak <imre.deak@intel.com>
> ---
>  drivers/gpu/drm/i915/intel_region_lmem.c | 52 ++++++++++++++++++++++++
>  1 file changed, 52 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/intel_region_lmem.c b/drivers/gpu/drm/i915/intel_region_lmem.c
> index 939cf0d195a5..eafef7034680 100644
> --- a/drivers/gpu/drm/i915/intel_region_lmem.c
> +++ b/drivers/gpu/drm/i915/intel_region_lmem.c
> @@ -137,6 +137,48 @@ intel_setup_fake_lmem(struct drm_i915_private *i915)
>         return mem;
>  }
>  
> +static void get_legacy_lowmem_region(struct intel_uncore *uncore,
> +                                    u64 *start, u32 *size)
> +{
> +       *start = 0;
> +       *size = 0;
> +
> +       if (!IS_DG1_REVID(uncore->i915, DG1_REVID_A0, DG1_REVID_B0))
> +               return;
> +
> +       *size = SZ_1M;
> +
> +       DRM_DEBUG_DRIVER("LMEM: reserved legacy low-memory [0x%llx-0x%llx]\n",
> +                        *start, *start + *size);
> +}
> +
> +static int reserve_lowmem_region(struct intel_uncore *uncore,
> +                                struct intel_memory_region *mem)
> +{
> +       u64 reserve_start;
> +       u64 reserve_end;
> +       u64 region_start;
> +       u32 region_size;
> +       int ret;
> +
> +       get_legacy_lowmem_region(uncore, &region_start, &region_size);
> +       reserve_start = region_start;
> +       reserve_end = region_start + region_size;
> +
> +       if (!reserve_end)
> +               return 0;
> +
> +       DRM_INFO("LMEM: reserving low-memory region [0x%llx-0x%llx]\n",
> +                reserve_start, reserve_end);
> +       ret = i915_buddy_alloc_range(&mem->mm, &mem->reserved,
> +                                    reserve_start,
> +                                    reserve_end - reserve_start);

Isn't this now relative to the stolen offset? Should this be reserved,
or excluded like stolen?
-Chris
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
