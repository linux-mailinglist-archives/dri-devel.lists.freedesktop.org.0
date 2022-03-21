Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 167434E32BB
	for <lists+dri-devel@lfdr.de>; Mon, 21 Mar 2022 23:38:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23C0710E4A0;
	Mon, 21 Mar 2022 22:38:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3C9110E05D;
 Mon, 21 Mar 2022 22:38:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647902305; x=1679438305;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=KIIe47oH7dgdXbu5mqYFJ/Qm0yOtpUXHDUdSnbNxF4o=;
 b=MjY8YU2/iIgmSyXtvnnQaP/4A0DdU3g+Egi9BkU27N54ecWF+MBZ2/rT
 c4FqGgndAjYI05yGcOneU4SFTK/HTwFjd0oRFFYy1ur8ND19EJ9EQo9+i
 5qrdiEfXufnUfBNI6yhpBaF5EpQLjaPFXkPeWFDDnHNboGUzkUIhnlQBu
 D93LYYaAzdCnlNKGYP2XDc1b/jjCAIKPStQwp1vDF0X1MqYcs0yOcqZS0
 dWnHlJH7dbaIf9IwD+d6niELfhaUT0avyuqzynCRz5pp0VygQ92s3iDnV
 hyB931w4KHIqs/zCkQl2+PrvMNoK6ObNmis8kRNyx/q9g/s21WGl7pjeo g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10293"; a="255227171"
X-IronPort-AV: E=Sophos;i="5.90,199,1643702400"; d="scan'208";a="255227171"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2022 15:38:24 -0700
X-IronPort-AV: E=Sophos;i="5.90,199,1643702400"; d="scan'208";a="518616785"
Received: from prithika-mobl.amr.corp.intel.com (HELO mvcheng-desk2.intel.com)
 ([10.251.16.248])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2022 15:38:24 -0700
From: Michael Cheng <michael.cheng@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v13 5/5] drm/i915/gt: replace cache_clflush_range
Date: Mon, 21 Mar 2022 15:38:19 -0700
Message-Id: <20220321223819.72833-6-michael.cheng@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220321223819.72833-1-michael.cheng@intel.com>
References: <20220321223819.72833-1-michael.cheng@intel.com>
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
Cc: michael.cheng@intel.com, wayne.boyer@intel.com, casey.g.bowman@intel.com,
 lucas.demarchi@intel.com, dri-devel@lists.freedesktop.org
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
index 46a2087a66de..68a8160ce3e3 100644
--- a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
+++ b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
@@ -2828,7 +2828,7 @@ static void execlists_sanitize(struct intel_engine_cs *engine)
 	sanitize_hwsp(engine);
 
 	/* And scrub the dirty cachelines for the HWSP */
-	clflush_cache_range(engine->status_page.addr, PAGE_SIZE);
+	drm_clflush_virt_range(engine->status_page.addr, PAGE_SIZE);
 
 	intel_engine_reset_pinned_contexts(engine);
 }
diff --git a/drivers/gpu/drm/i915/gt/intel_gtt.c b/drivers/gpu/drm/i915/gt/intel_gtt.c
index aed6de2d5a79..719fd31eee80 100644
--- a/drivers/gpu/drm/i915/gt/intel_gtt.c
+++ b/drivers/gpu/drm/i915/gt/intel_gtt.c
@@ -298,7 +298,7 @@ fill_page_dma(struct drm_i915_gem_object *p, const u64 val, unsigned int count)
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
index 9ec03234d2c2..42c9e8b7bf42 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
@@ -3581,7 +3581,7 @@ static void guc_sanitize(struct intel_engine_cs *engine)
 	sanitize_hwsp(engine);
 
 	/* And scrub the dirty cachelines for the HWSP */
-	clflush_cache_range(engine->status_page.addr, PAGE_SIZE);
+	drm_clflush_virt_range(engine->status_page.addr, PAGE_SIZE);
 
 	intel_engine_reset_pinned_contexts(engine);
 }
-- 
2.25.1

