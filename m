Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CF2F4D6899
	for <lists+dri-devel@lfdr.de>; Fri, 11 Mar 2022 19:43:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3395710EA41;
	Fri, 11 Mar 2022 18:43:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74A1B10EA41;
 Fri, 11 Mar 2022 18:43:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647024193; x=1678560193;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=v02ZaFWhj/S0F00Q2MTPUCcy0zZqHicTzCLKEDSB+go=;
 b=Fkh4lrZ7eG05/fy2S0anzYD/mOS5r1oLBowQJCNCsxv3c1JoYOg1RJwT
 O5XWqKz1A4LGC/1IvzHI0OXP7DSu+oFy4ERTbuWffSaWEvNwjyGrknzRi
 Q4J1Ja8zZlVBsho4Oa7R0K989bi+gue2yFSk59t9Du7Eazlal5pBzFRBk
 WIqs6oD2IwPog/gmOeTG0mycnKSJ0q5HLtCkuF/4pMkHYlrmKFlr2a1gS
 vLyNMmRCXvRNu5T0ZchFye5IRGjBAuCnQAW3cFJzrU5LRHs5EfdLze4+i
 4X+X/2b41O9cG/OMtipuceuENKuRSVe1HCRE+u3fo5hzgvH5fa//JwMW0 Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10283"; a="236233025"
X-IronPort-AV: E=Sophos;i="5.90,174,1643702400"; d="scan'208";a="236233025"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2022 10:43:13 -0800
X-IronPort-AV: E=Sophos;i="5.90,174,1643702400"; d="scan'208";a="633499798"
Received: from rbgreen-mobl3.amr.corp.intel.com (HELO ldmartin-desk2)
 ([10.212.239.245])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2022 10:43:12 -0800
Date: Fri, 11 Mar 2022 10:43:11 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
Subject: Re: [PATCH] drm/i915/guc: Use iosys_map interface to update lrc_desc
Message-ID: <20220311184311.emxlez5jho75iot2@ldmartin-desk2>
X-Patchwork-Hint: comment
References: <20220308164742.692540-1-balasubramani.vivekanandan@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20220308164742.692540-1-balasubramani.vivekanandan@intel.com>
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
Cc: Matthew Brost <matthew.brost@intel.com>, michael.cheng@intel.com,
 wayne.boyer@intel.com, intel-gfx@lists.freedesktop.org,
 casey.g.bowman@intel.com, dri-devel@lists.freedesktop.org,
 siva.mullati@intel.com,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 John Harrison <John.C.Harrison@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Mar 08, 2022 at 10:17:42PM +0530, Balasubramani Vivekanandan wrote:
>This patch is continuation of the effort to move all pointers in i915,
>which at any point may be pointing to device memory or system memory, to
>iosys_map interface.
>More details about the need of this change is explained in the patch
>series which initiated this task
>https://patchwork.freedesktop.org/series/99711/
>
>This patch converts all access to the lrc_desc through iosys_map
>interfaces.
>
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>Cc: John Harrison <John.C.Harrison@Intel.com>
>Cc: Matthew Brost <matthew.brost@intel.com>
>Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
>---
> drivers/gpu/drm/i915/gt/uc/intel_guc.h        |  2 +-
> .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 68 ++++++++++++-------
> 2 files changed, 43 insertions(+), 27 deletions(-)
>
>diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.h b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
>index e439e6c1ac8b..cbbc24dbaf0f 100644
>--- a/drivers/gpu/drm/i915/gt/uc/intel_guc.h
>+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
>@@ -168,7 +168,7 @@ struct intel_guc {
> 	/** @lrc_desc_pool: object allocated to hold the GuC LRC descriptor pool */
> 	struct i915_vma *lrc_desc_pool;
> 	/** @lrc_desc_pool_vaddr: contents of the GuC LRC descriptor pool */
>-	void *lrc_desc_pool_vaddr;
>+	struct iosys_map lrc_desc_pool_vaddr;

s/_vaddr/_map/ for consistency with intel_guc_ads

>
> 	/**
> 	 * @context_lookup: used to resolve intel_context from guc_id, if a
>diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>index 9ec03234d2c2..84b17ded886a 100644
>--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>@@ -467,13 +467,14 @@ static u32 *get_wq_pointer(struct guc_process_desc *desc,
> 	return &__get_parent_scratch(ce)->wq[ce->parallel.guc.wqi_tail / sizeof(u32)];
> }
>
>-static struct guc_lrc_desc *__get_lrc_desc(struct intel_guc *guc, u32 index)
>+static void __write_lrc_desc(struct intel_guc *guc, u32 index,
>+			     struct guc_lrc_desc *desc)
> {
>-	struct guc_lrc_desc *base = guc->lrc_desc_pool_vaddr;
>+	unsigned int size = sizeof(struct guc_lrc_desc);
>
> 	GEM_BUG_ON(index >= GUC_MAX_CONTEXT_ID);
>
>-	return &base[index];
>+	iosys_map_memcpy_to(&guc->lrc_desc_pool_vaddr, index * size, desc, size);

you are not using size anywhere else, so it would be preferred to keep the size
calculation inside this call.

	iosys_map_memcpy_to(&guc->lrc_desc_pool_vaddr, index * size, desc, sizeof(*desc));

which also avoids accidentally using the wrong struct if we ever change
the type of what we are copying.

> }
>
> static inline struct intel_context *__get_context(struct intel_guc *guc, u32 id)
>@@ -489,20 +490,28 @@ static int guc_lrc_desc_pool_create(struct intel_guc *guc)
> {
> 	u32 size;
> 	int ret;
>+	void *addr;

vaddr for consistency

>
> 	size = PAGE_ALIGN(sizeof(struct guc_lrc_desc) *
> 			  GUC_MAX_CONTEXT_ID);
> 	ret = intel_guc_allocate_and_map_vma(guc, size, &guc->lrc_desc_pool,
>-					     (void **)&guc->lrc_desc_pool_vaddr);
>+					     &addr);
>+
> 	if (ret)
> 		return ret;
>
>+	if (i915_gem_object_is_lmem(guc->lrc_desc_pool->obj))
>+		iosys_map_set_vaddr_iomem(&guc->lrc_desc_pool_vaddr,
>+					  (void __iomem *)addr);
>+	else
>+		iosys_map_set_vaddr(&guc->lrc_desc_pool_vaddr, addr);
>+
> 	return 0;
> }
>
> static void guc_lrc_desc_pool_destroy(struct intel_guc *guc)
> {
>-	guc->lrc_desc_pool_vaddr = NULL;
>+	iosys_map_clear(&guc->lrc_desc_pool_vaddr);
> 	i915_vma_unpin_and_release(&guc->lrc_desc_pool, I915_VMA_RELEASE_MAP);
> }
>
>@@ -513,9 +522,11 @@ static inline bool guc_submission_initialized(struct intel_guc *guc)
>
> static inline void _reset_lrc_desc(struct intel_guc *guc, u32 id)
> {
>-	struct guc_lrc_desc *desc = __get_lrc_desc(guc, id);
>+	unsigned int size = sizeof(struct guc_lrc_desc);
>
>-	memset(desc, 0, sizeof(*desc));
>+	GEM_BUG_ON(id >= GUC_MAX_CONTEXT_ID);
>+
>+	iosys_map_memset(&guc->lrc_desc_pool_vaddr, id * size, 0, size);

ditto. And maybe move it be close to __write_lrc_desc. I don't really
understand the difference here with 1 underscore vs the 2. Maybe as a
follow up just reconcile them?

The rest I left to another reply to focus on what may be the only
real issue I see in this patch and to get feedback from other people.

thanks
Lucas De Marchi
