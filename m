Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AA7C4B9960
	for <lists+dri-devel@lfdr.de>; Thu, 17 Feb 2022 07:44:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76736896EC;
	Thu, 17 Feb 2022 06:43:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2029610E93B;
 Thu, 17 Feb 2022 06:43:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645080238; x=1676616238;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=neO8M6+jN/i0pmDwBz7qBjTaYvdBNPscF9dP7U9j+yg=;
 b=dq1sktpd5oNgZjVIZaAIAMaxgZQwBuiGj/DHHVci6lfywL6HUEXWJElJ
 9YNHtEy+UA3Dhpb9vsh/HzmgGlgOujQBQ/4LuWxGUl92hMEyEu+HRgP4w
 3/wVUBNUjG0AftJ19lJacQPIbkZO29CkFmsRott+ZN3reg7KOGPdgbNue
 Yw2+S2JRulhR7IXRp4NJnyUflwdThOW1bhgW0zojCErFb2KQq1TVOf6H0
 +0FMkCeqnmroCTjd8jpJ3VF6SfzAlHzuJfUpWlr6le4JiRbQb1ALjLht2
 F/qISA8/+Oj3UeT4CHETeNpNgPtqwq0enZbUwkC5won9+nr8WHsDFbIqs g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10260"; a="249643311"
X-IronPort-AV: E=Sophos;i="5.88,375,1635231600"; d="scan'208";a="249643311"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2022 22:43:57 -0800
X-IronPort-AV: E=Sophos;i="5.88,375,1635231600"; d="scan'208";a="604766774"
Received: from zcmahone-mobl1.amr.corp.intel.com (HELO ldmartin-desk2)
 ([10.252.137.102])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2022 22:43:57 -0800
Date: Wed, 16 Feb 2022 22:43:56 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [Intel-gfx] [PATCH] drm/i915: Kill the fake lmem support
Message-ID: <20220217064356.2lgbytoklvcwyqy3@ldmartin-desk2>
X-Patchwork-Hint: comment
References: <20220216231849.3133289-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20220216231849.3133289-1-lucas.demarchi@intel.com>
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
Cc: Matthew Auld <matthew.auld@intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Feb 16, 2022 at 03:18:49PM -0800, Lucas De Marchi wrote:
>This was useful for early development of lmem, but it's not used
>anymore, so remove it.
>
>Cc: Chris Wilson <chris@chris-wilson.co.uk>
>Cc: Matthew Auld <matthew.auld@intel.com>
>Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>---
> drivers/gpu/drm/i915/Kconfig.unstable       |   8 --
> drivers/gpu/drm/i915/gt/intel_gt.c          |   2 -
> drivers/gpu/drm/i915/gt/intel_region_lmem.c | 112 +-------------------
> drivers/gpu/drm/i915/gt/intel_region_lmem.h |   3 -
> drivers/gpu/drm/i915/i915_driver.c          |  15 ---
> drivers/gpu/drm/i915/i915_params.c          |   5 -
> drivers/gpu/drm/i915/i915_params.h          |   1 -
> 7 files changed, 2 insertions(+), 144 deletions(-)
>
>diff --git a/drivers/gpu/drm/i915/Kconfig.unstable b/drivers/gpu/drm/i915/Kconfig.unstable
>index 0c2276155c2b..cf151a297ed7 100644
>--- a/drivers/gpu/drm/i915/Kconfig.unstable
>+++ b/drivers/gpu/drm/i915/Kconfig.unstable
>@@ -19,11 +19,3 @@ config DRM_I915_UNSTABLE
> 	  Recommended for driver developers _only_.
>
> 	  If in the slightest bit of doubt, say "N".
>-
>-config DRM_I915_UNSTABLE_FAKE_LMEM
>-	bool "Enable the experimental fake lmem"
>-	depends on DRM_I915_UNSTABLE
>-	default n
>-	help
>-	  Convert some system memory into a fake local memory region for
>-	  testing.
>diff --git a/drivers/gpu/drm/i915/gt/intel_gt.c b/drivers/gpu/drm/i915/gt/intel_gt.c
>index e8403fa53909..325ac15439eb 100644
>--- a/drivers/gpu/drm/i915/gt/intel_gt.c
>+++ b/drivers/gpu/drm/i915/gt/intel_gt.c
>@@ -65,8 +65,6 @@ int intel_gt_probe_lmem(struct intel_gt *gt)
> 	int err;
>
> 	mem = intel_gt_setup_lmem(gt);
>-	if (mem == ERR_PTR(-ENODEV))
>-		mem = intel_gt_setup_fake_lmem(gt);
> 	if (IS_ERR(mem)) {
> 		err = PTR_ERR(mem);
> 		if (err == -ENODEV)
>diff --git a/drivers/gpu/drm/i915/gt/intel_region_lmem.c b/drivers/gpu/drm/i915/gt/intel_region_lmem.c
>index cb3f66707b21..df3856e09598 100644
>--- a/drivers/gpu/drm/i915/gt/intel_region_lmem.c
>+++ b/drivers/gpu/drm/i915/gt/intel_region_lmem.c
>@@ -13,60 +13,6 @@
> #include "gem/i915_gem_ttm.h"
> #include "gt/intel_gt.h"
>
>-static int init_fake_lmem_bar(struct intel_memory_region *mem)
>-{
>-	struct drm_i915_private *i915 = mem->i915;
>-	struct i915_ggtt *ggtt = to_gt(i915)->ggtt;
>-	unsigned long n;
>-	int ret;
>-
>-	/* We want to 1:1 map the mappable aperture to our reserved region */
>-
>-	mem->fake_mappable.start = 0;
>-	mem->fake_mappable.size = resource_size(&mem->region);
>-	mem->fake_mappable.color = I915_COLOR_UNEVICTABLE;

I forgot to remove fake_mappable and remap_addr fields from the struct.
I will send a v2 later if people agree to remove the fake lmem.

Lucas De Marchi
