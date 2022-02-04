Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B69704A9D06
	for <lists+dri-devel@lfdr.de>; Fri,  4 Feb 2022 17:37:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5692410EAC6;
	Fri,  4 Feb 2022 16:37:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2A2010E6D6;
 Fri,  4 Feb 2022 16:37:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643992640; x=1675528640;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bRvy0yRvPJtXyhZUsfuGzBsgNYrC+oyyXYHeceG9qSA=;
 b=eepQR6egvijwD2EpvhCnWlQp8RpZayi+VLcFdaw1K4ca/tvxhJGbgFwi
 PHa5cWReVnPr94szksxF5fEcdtWJgTdJy7CH22kTJSLDvCzf0YwmvajbH
 1tkCcU2/TkACTBybnjLebtsVvLpMQpXnaNsoRZQ8w+hCn4T6QZMdSqWJL
 O9A027x0/effZnJWZyT9a41YcA2l1FBBEvEgAM0pQXBIi1qi9QVOXyHaE
 LtsY/02sq/L6vWE67F31LDtKkfLAPYawYT4zJc2CTAJ1ighlRPeXdMQXX
 9JNF5oR3KaBTQoPeS3aVis+NKVm8UX2hrrNKKpGtHmbOXdP8w1F4nfxbE g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10247"; a="228368857"
X-IronPort-AV: E=Sophos;i="5.88,343,1635231600"; d="scan'208";a="228368857"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2022 08:37:20 -0800
X-IronPort-AV: E=Sophos;i="5.88,343,1635231600"; d="scan'208";a="699724244"
Received: from pwaterl-mobl1.amr.corp.intel.com (HELO mvcheng-desk2.intel.com)
 ([10.212.197.34])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2022 08:37:19 -0800
From: Michael Cheng <michael.cheng@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v5 5/5] drm/i915/gt: replace cache_clflush_range
Date: Fri,  4 Feb 2022 08:37:11 -0800
Message-Id: <20220204163711.439403-6-michael.cheng@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220204163711.439403-1-michael.cheng@intel.com>
References: <20220204163711.439403-1-michael.cheng@intel.com>
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
 wayne.boyer@intel.com, casey.g.bowman@intel.com, lucas.demarchi@intel.com,
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
index 22505aa428d9..5e74c99d5929 100644
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

