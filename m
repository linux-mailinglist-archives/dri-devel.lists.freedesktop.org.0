Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 184634B019D
	for <lists+dri-devel@lfdr.de>; Thu, 10 Feb 2022 01:39:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFFA710E70B;
	Thu, 10 Feb 2022 00:39:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF8BB10E6C5;
 Thu, 10 Feb 2022 00:39:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644453552; x=1675989552;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=dgLlbbEhY5qijXM7qOREhUoDQwP/TPT9aXOmmK5zR9k=;
 b=XCd7bhgacYHd9uKv9B2U83HblgGpalGYx5LkPynQx0lzuq7esjuuX5nu
 4Hmg+iOJ+hVwo4XX9FDkulxU+FMwPw5JoT/j7wl8IEpW/GIAw+4p7tNq6
 8+fBJu+qHcpVZkqK9mVRL3U02AOYfebkIAj4jxsqD0fLZEO/uEvGNgD+J
 W/Qag0RVHLjKmCbqiBX+KLoCTyWhAuog+nQlRT/Pyg8jozh2uZIJ0yZvf
 IiLTpyp4XeHiRco1oZiIQF3OZp4bClsrfFxaHIjt9nT42SBkM9E5gTETt
 8Fm4yOImptnrOGib5TZEPdzuSsr43r6cQfCFEwy/o9EoisUVdmnXXy0mH g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10253"; a="230023284"
X-IronPort-AV: E=Sophos;i="5.88,357,1635231600"; d="scan'208";a="230023284"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2022 16:39:12 -0800
X-IronPort-AV: E=Sophos;i="5.88,357,1635231600"; d="scan'208";a="482544774"
Received: from sroy1-mobl.amr.corp.intel.com (HELO mvcheng-desk2.intel.com)
 ([10.209.85.186])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2022 16:39:12 -0800
From: Michael Cheng <michael.cheng@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v8 6/6] drm/i915/gt: replace cache_clflush_range
Date: Wed,  9 Feb 2022 16:39:04 -0800
Message-Id: <20220210003904.1055898-7-michael.cheng@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220210003904.1055898-1-michael.cheng@intel.com>
References: <20220210003904.1055898-1-michael.cheng@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: tvrtko.ursulin@linux.intel.com, michael.cheng@intel.com,
 balasubramani.vivekanandan@intel.com, wayne.boyer@intel.com,
 casey.g.bowman@intel.com, lucas.demarchi@intel.com,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Replace all occurance of cache_clflush_range with
drm_clflush_virt_range. This will prevent compile errors on non-x86
platforms.

Signed-off-by: Michael Cheng <michael.cheng@intel.com>
---
 drivers/gpu/drm/i915/gt/gen8_ppgtt.c                 | 12 ++++++------
 drivers/gpu/drm/i915/gt/intel_execlists_submission.c |  2 +-
 drivers/gpu/drm/i915/gt/intel_gtt.c                  |  2 +-
 drivers/gpu/drm/i915/gt/intel_ppgtt.c                |  2 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c    |  2 +-
 5 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/gen8_ppgtt.c b/drivers/gpu/drm/i915/gt/gen8_ppgtt.c
index c43e724afa9f..d0999e92621b 100644
--- a/drivers/gpu/drm/i915/gt/gen8_ppgtt.c
+++ b/drivers/gpu/drm/i915/gt/gen8_ppgtt.c
@@ -444,11 +444,11 @@ gen8_ppgtt_insert_pte(struct i915_ppgtt *ppgtt,
 				pd = pdp->entry[gen8_pd_index(idx, 2)];
 			}
 
-			clflush_cache_range(vaddr, PAGE_SIZE);
+			drm_clflush_virt_range(vaddr, PAGE_SIZE);
 			vaddr = px_vaddr(i915_pt_entry(pd, gen8_pd_index(idx, 1)));
 		}
 	} while (1);
-	clflush_cache_range(vaddr, PAGE_SIZE);
+	drm_clflush_virt_range(vaddr, PAGE_SIZE);
 
 	return idx;
 }
@@ -532,7 +532,7 @@ static void gen8_ppgtt_insert_huge(struct i915_address_space *vm,
 			}
 		} while (rem >= page_size && index < I915_PDES);
 
-		clflush_cache_range(vaddr, PAGE_SIZE);
+		drm_clflush_virt_range(vaddr, PAGE_SIZE);
 
 		/*
 		 * Is it safe to mark the 2M block as 64K? -- Either we have
@@ -548,7 +548,7 @@ static void gen8_ppgtt_insert_huge(struct i915_address_space *vm,
 					      I915_GTT_PAGE_SIZE_2M)))) {
 			vaddr = px_vaddr(pd);
 			vaddr[maybe_64K] |= GEN8_PDE_IPS_64K;
-			clflush_cache_range(vaddr, PAGE_SIZE);
+			drm_clflush_virt_range(vaddr, PAGE_SIZE);
 			page_size = I915_GTT_PAGE_SIZE_64K;
 
 			/*
@@ -569,7 +569,7 @@ static void gen8_ppgtt_insert_huge(struct i915_address_space *vm,
 				for (i = 1; i < index; i += 16)
 					memset64(vaddr + i, encode, 15);
 
-				clflush_cache_range(vaddr, PAGE_SIZE);
+				drm_clflush_virt_range(vaddr, PAGE_SIZE);
 			}
 		}
 
@@ -617,7 +617,7 @@ static void gen8_ppgtt_insert_entry(struct i915_address_space *vm,
 
 	vaddr = px_vaddr(i915_pt_entry(pd, gen8_pd_index(idx, 1)));
 	vaddr[gen8_pd_index(idx, 0)] = gen8_pte_encode(addr, level, flags);
-	clflush_cache_range(&vaddr[gen8_pd_index(idx, 0)], sizeof(*vaddr));
+	drm_clflush_virt_range(&vaddr[gen8_pd_index(idx, 0)], sizeof(*vaddr));
 }
 
 static int gen8_init_scratch(struct i915_address_space *vm)
diff --git a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
index cc561cfae808..bbe33794b34d 100644
--- a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
+++ b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
@@ -2822,7 +2822,7 @@ static void execlists_sanitize(struct intel_engine_cs *engine)
 	sanitize_hwsp(engine);
 
 	/* And scrub the dirty cachelines for the HWSP */
-	clflush_cache_range(engine->status_page.addr, PAGE_SIZE);
+	drm_clflush_virt_range(engine->status_page.addr, PAGE_SIZE);
 
 	intel_engine_reset_pinned_contexts(engine);
 }
diff --git a/drivers/gpu/drm/i915/gt/intel_gtt.c b/drivers/gpu/drm/i915/gt/intel_gtt.c
index 0d6bbc8c57f2..9b594be9102f 100644
--- a/drivers/gpu/drm/i915/gt/intel_gtt.c
+++ b/drivers/gpu/drm/i915/gt/intel_gtt.c
@@ -255,7 +255,7 @@ fill_page_dma(struct drm_i915_gem_object *p, const u64 val, unsigned int count)
 	void *vaddr = __px_vaddr(p);
 
 	memset64(vaddr, val, count);
-	clflush_cache_range(vaddr, PAGE_SIZE);
+	drm_clflush_virt_range(vaddr, PAGE_SIZE);
 }
 
 static void poison_scratch_page(struct drm_i915_gem_object *scratch)
diff --git a/drivers/gpu/drm/i915/gt/intel_ppgtt.c b/drivers/gpu/drm/i915/gt/intel_ppgtt.c
index 48e6e2f87700..bd474a5123cb 100644
--- a/drivers/gpu/drm/i915/gt/intel_ppgtt.c
+++ b/drivers/gpu/drm/i915/gt/intel_ppgtt.c
@@ -90,7 +90,7 @@ write_dma_entry(struct drm_i915_gem_object * const pdma,
 	u64 * const vaddr = __px_vaddr(pdma);
 
 	vaddr[idx] = encoded_entry;
-	clflush_cache_range(&vaddr[idx], sizeof(u64));
+	drm_clflush_virt_range(&vaddr[idx], sizeof(u64));
 }
 
 void
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
index b3a429a92c0d..89020706adc4 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
@@ -3573,7 +3573,7 @@ static void guc_sanitize(struct intel_engine_cs *engine)
 	sanitize_hwsp(engine);
 
 	/* And scrub the dirty cachelines for the HWSP */
-	clflush_cache_range(engine->status_page.addr, PAGE_SIZE);
+	drm_clflush_virt_range(engine->status_page.addr, PAGE_SIZE);
 
 	intel_engine_reset_pinned_contexts(engine);
 }
-- 
2.25.1

