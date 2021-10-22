Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B72DE437213
	for <lists+dri-devel@lfdr.de>; Fri, 22 Oct 2021 08:47:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C05226E53C;
	Fri, 22 Oct 2021 06:47:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEAC06E4AB;
 Fri, 22 Oct 2021 06:47:12 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10144"; a="229182524"
X-IronPort-AV: E=Sophos;i="5.87,171,1631602800"; d="scan'208";a="229182524"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2021 23:47:12 -0700
X-IronPort-AV: E=Sophos;i="5.87,171,1631602800"; d="scan'208";a="463937538"
Received: from ginagrec-mobl2.amr.corp.intel.com (HELO ldmartin-desk2)
 ([10.254.48.36])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2021 23:47:11 -0700
Date: Thu, 21 Oct 2021 23:47:09 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Ramalingam C <ramalingam.c@intel.com>
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 Daniel Vetter <daniel@ffwll.ch>, CQ Tang <cq.tang@intel.com>,
 Matthew Auld <matthew.auld@intel.com>, rodrigo.vivi@intel.com,
 Hellstrom Thomas <thomas.hellstrom@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Subject: Re: [PATCH v2 02/17] drm/i915/xehpsdv: set min page-size to 64K
Message-ID: <20211022064709.lgd3g7jaun3e7hlr@ldmartin-desk2>
References: <20211021142627.31058-1-ramalingam.c@intel.com>
 <20211021142627.31058-3-ramalingam.c@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20211021142627.31058-3-ramalingam.c@intel.com>
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

On Thu, Oct 21, 2021 at 07:56:12PM +0530, Ramalingam C wrote:
>From: Matthew Auld <matthew.auld@intel.com>
>
>LMEM should be allocated at 64K granularity, since 4K page support will
>eventually be dropped for LMEM when using the PPGTT.

this is not for xehpsdv only. So this should probably drop the prefix
and be:

For discrete cards that support 64k pages we should be using it since 4K
page support ...



Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marhci

>
>Signed-off-by: Matthew Auld <matthew.auld@intel.com>
>Signed-off-by: Stuart Summers <stuart.summers@intel.com>
>Signed-off-by: Ramalingam C <ramalingam.c@intel.com>
>Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
>Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>---
> drivers/gpu/drm/i915/gem/i915_gem_stolen.c  | 6 +++++-
> drivers/gpu/drm/i915/gt/intel_region_lmem.c | 5 ++++-
> 2 files changed, 9 insertions(+), 2 deletions(-)
>
>diff --git a/drivers/gpu/drm/i915/gem/i915_gem_stolen.c b/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
>index ddd37ccb1362..f52a06f05fc7 100644
>--- a/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
>+++ b/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
>@@ -778,6 +778,7 @@ i915_gem_stolen_lmem_setup(struct drm_i915_private *i915, u16 type,
> 	struct intel_uncore *uncore = &i915->uncore;
> 	struct pci_dev *pdev = to_pci_dev(i915->drm.dev);
> 	struct intel_memory_region *mem;
>+	resource_size_t min_page_size;
> 	resource_size_t io_start;
> 	resource_size_t lmem_size;
> 	u64 lmem_base;
>@@ -789,8 +790,11 @@ i915_gem_stolen_lmem_setup(struct drm_i915_private *i915, u16 type,
> 	lmem_size = pci_resource_len(pdev, 2) - lmem_base;
> 	io_start = pci_resource_start(pdev, 2) + lmem_base;
>
>+	min_page_size = HAS_64K_PAGES(i915) ? I915_GTT_PAGE_SIZE_64K :
>+						I915_GTT_PAGE_SIZE_4K;
>+
> 	mem = intel_memory_region_create(i915, lmem_base, lmem_size,
>-					 I915_GTT_PAGE_SIZE_4K, io_start,
>+					 min_page_size, io_start,
> 					 type, instance,
> 					 &i915_region_stolen_lmem_ops);
> 	if (IS_ERR(mem))
>diff --git a/drivers/gpu/drm/i915/gt/intel_region_lmem.c b/drivers/gpu/drm/i915/gt/intel_region_lmem.c
>index afb35d2e5c73..073d28d96669 100644
>--- a/drivers/gpu/drm/i915/gt/intel_region_lmem.c
>+++ b/drivers/gpu/drm/i915/gt/intel_region_lmem.c
>@@ -193,6 +193,7 @@ static struct intel_memory_region *setup_lmem(struct intel_gt *gt)
> 	struct intel_uncore *uncore = gt->uncore;
> 	struct pci_dev *pdev = to_pci_dev(i915->drm.dev);
> 	struct intel_memory_region *mem;
>+	resource_size_t min_page_size;
> 	resource_size_t io_start;
> 	resource_size_t lmem_size;
> 	int err;
>@@ -207,10 +208,12 @@ static struct intel_memory_region *setup_lmem(struct intel_gt *gt)
> 	if (GEM_WARN_ON(lmem_size > pci_resource_len(pdev, 2)))
> 		return ERR_PTR(-ENODEV);
>
>+	min_page_size = HAS_64K_PAGES(i915) ? I915_GTT_PAGE_SIZE_64K :
>+						I915_GTT_PAGE_SIZE_4K;
> 	mem = intel_memory_region_create(i915,
> 					 0,
> 					 lmem_size,
>-					 I915_GTT_PAGE_SIZE_4K,
>+					 min_page_size,
> 					 io_start,
> 					 INTEL_MEMORY_LOCAL,
> 					 0,
>-- 
>2.20.1
>
