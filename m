Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 534C34C3C65
	for <lists+dri-devel@lfdr.de>; Fri, 25 Feb 2022 04:25:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BB2D10E849;
	Fri, 25 Feb 2022 03:24:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D77410E749;
 Fri, 25 Feb 2022 03:24:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645759487; x=1677295487;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=a6lWFd5AMKtcHRUgjEjG5ptC1lSbiMVYivnOQ0R+iAk=;
 b=i1qn1q2/kQl80loAWp7ZqQrgx6uj0p9GDxFJVeI2nqGgaqsC6df+R6fZ
 vD2oU9fTO3591c/oVEKFrFhvnjLLLbC8oMRo/iArZLRNB+0ufeCMh4zzs
 VQ6l/JzQQ1sF/bGsuojxR9sX9PSJVxK1Qx0d0rKGsCYXn/GdmezKDy7w6
 MU4dqnSYAZ3GQ3g/5GsWLR9UR8NsAvcm2ZBb5zf8KVYVfzZJXZLN2HlvJ
 /Ak1MwZF4Ep2GkvFGItANMqaSbJC0QwSrXvjvPGginq8kmgLG5QkOfK/w
 mHi8AvKc/YJsKrt71En6osceLYrD6D7zwH/yS1nm7kz2qSCYCHzl50Elu g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10268"; a="277044514"
X-IronPort-AV: E=Sophos;i="5.90,135,1643702400"; d="scan'208";a="277044514"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2022 19:24:45 -0800
X-IronPort-AV: E=Sophos;i="5.90,135,1643702400"; d="scan'208";a="638087465"
Received: from slwinche-mobl1.amr.corp.intel.com (HELO
 mvcheng-desk2.intel.com) ([10.212.150.224])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2022 19:24:44 -0800
From: Michael Cheng <michael.cheng@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v12 6/6] drm/i915/gt: replace cache_clflush_range
Date: Thu, 24 Feb 2022 19:24:36 -0800
Message-Id: <20220225032436.904942-7-michael.cheng@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220225032436.904942-1-michael.cheng@intel.com>
References: <20220225032436.904942-1-michael.cheng@intel.com>
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

Replace all occurrence of cache_clflush_range with drm_clflush_virt_range.
This will prevent compile errors on non-x86 platforms.

Signed-off-by: Michael Cheng <michael.cheng@intel.com>
Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/i915/gt/gen8_ppgtt.c                 | 12 ++++++------
 drivers/gpu/drm/i915/gt/intel_execlists_submission.c |  2 +-
 drivers/gpu/drm/i915/gt/intel_gtt.c                  |  2 +-
 drivers/gpu/drm/i915/gt/intel_ppgtt.c                |  2 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c    |  2 +-
 5 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/gen8_ppgtt.c b/drivers/gpu/drm/i915/gt/gen8_ppgtt.c
index f574da00eff1..c7bd5d71b03e 100644
--- a/drivers/gpu/drm/i915/gt/gen8_ppgtt.c
+++ b/drivers/gpu/drm/i915/gt/gen8_ppgtt.c
@@ -454,11 +454,11 @@ gen8_ppgtt_insert_pte(struct i915_ppgtt *ppgtt,
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
@@ -631,7 +631,7 @@ static void gen8_ppgtt_insert_huge(struct i915_address_space *vm,
 			}
 		} while (rem >= page_size && index < I915_PDES);
 
-		clflush_cache_range(vaddr, PAGE_SIZE);
+		drm_clflush_virt_range(vaddr, PAGE_SIZE);
 
 		/*
 		 * Is it safe to mark the 2M block as 64K? -- Either we have
@@ -647,7 +647,7 @@ static void gen8_ppgtt_insert_huge(struct i915_address_space *vm,
 					      I915_GTT_PAGE_SIZE_2M)))) {
 			vaddr = px_vaddr(pd);
 			vaddr[maybe_64K] |= GEN8_PDE_IPS_64K;
-			clflush_cache_range(vaddr, PAGE_SIZE);
+			drm_clflush_virt_range(vaddr, PAGE_SIZE);
 			page_size = I915_GTT_PAGE_SIZE_64K;
 
 			/*
@@ -668,7 +668,7 @@ static void gen8_ppgtt_insert_huge(struct i915_address_space *vm,
 				for (i = 1; i < index; i += 16)
 					memset64(vaddr + i, encode, 15);
 
-				clflush_cache_range(vaddr, PAGE_SIZE);
+				drm_clflush_virt_range(vaddr, PAGE_SIZE);
 			}
 		}
 
@@ -722,7 +722,7 @@ static void gen8_ppgtt_insert_entry(struct i915_address_space *vm,
 
 	vaddr = px_vaddr(pt);
 	vaddr[gen8_pd_index(idx, 0)] = gen8_pte_encode(addr, level, flags);
-	clflush_cache_range(&vaddr[gen8_pd_index(idx, 0)], sizeof(*vaddr));
+	drm_clflush_virt_range(&vaddr[gen8_pd_index(idx, 0)], sizeof(*vaddr));
 }
 
 static void __xehpsdv_ppgtt_insert_entry_lm(struct i915_address_space *vm,
diff --git a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
index 89aef3ce53f0..d6f02dce45a0 100644
--- a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
+++ b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
@@ -2823,7 +2823,7 @@ static void execlists_sanitize(struct intel_engine_cs *engine)
 	sanitize_hwsp(engine);
 
 	/* And scrub the dirty cachelines for the HWSP */
-	clflush_cache_range(engine->status_page.addr, PAGE_SIZE);
+	drm_clflush_virt_range(engine->status_page.addr, PAGE_SIZE);
 
 	intel_engine_reset_pinned_contexts(engine);
 }
diff --git a/drivers/gpu/drm/i915/gt/intel_gtt.c b/drivers/gpu/drm/i915/gt/intel_gtt.c
index c548c193cd35..fc314946d426 100644
--- a/drivers/gpu/drm/i915/gt/intel_gtt.c
+++ b/drivers/gpu/drm/i915/gt/intel_gtt.c
@@ -268,7 +268,7 @@ fill_page_dma(struct drm_i915_gem_object *p, const u64 val, unsigned int count)
 	void *vaddr = __px_vaddr(p);
 
 	memset64(vaddr, val, count);
-	clflush_cache_range(vaddr, PAGE_SIZE);
+	drm_clflush_virt_range(vaddr, PAGE_SIZE);
 }
 
 static void poison_scratch_page(struct drm_i915_gem_object *scratch)
diff --git a/drivers/gpu/drm/i915/gt/intel_ppgtt.c b/drivers/gpu/drm/i915/gt/intel_ppgtt.c
index d91e2beb7517..d8b94d638559 100644
--- a/drivers/gpu/drm/i915/gt/intel_ppgtt.c
+++ b/drivers/gpu/drm/i915/gt/intel_ppgtt.c
@@ -91,7 +91,7 @@ write_dma_entry(struct drm_i915_gem_object * const pdma,
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

