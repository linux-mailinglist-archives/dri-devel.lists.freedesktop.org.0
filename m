Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B950A49D3AE
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jan 2022 21:37:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F46810E942;
	Wed, 26 Jan 2022 20:36:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76D2410E421;
 Wed, 26 Jan 2022 20:36:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643229387; x=1674765387;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Wjra7qj+Jb90MP4e8anE/k/B8s165O1uD6Gx6XBX3sk=;
 b=aNRgE2xxfZxTAOSg9Qd6DTGwTfqyJPmMcdbLdDMbxpvz0tfXJ/Ye9o+G
 /ovI0SabKB6s9Nu3a2xWUEwHeaeOqes5aMVqdtlIqelH8Rb6s5mNHD96a
 8JG40VAl6Lh6gwU4U+DHul0ExK+2VuEEzglSN2mZlJmZxpysEMiWqhf1G
 6l35Xuif+hDIASDPU/sjfTIOWLEWThYQtXoyi2ZVEow50TRbcpGjwlHQw
 2tCjd+QYXz2CmVlTnzhTr83M8phj0dIEg2OzW3X3LGNmp7sxb+0kcX+ii
 UYCjY9mnD18yl6t9VCSbErIQqvksGDX/FjsLnT80iFxSAikdLW/JnFEI1 Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10239"; a="333000504"
X-IronPort-AV: E=Sophos;i="5.88,319,1635231600"; d="scan'208";a="333000504"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2022 12:36:23 -0800
X-IronPort-AV: E=Sophos;i="5.88,319,1635231600"; d="scan'208";a="581221516"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.202])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2022 12:36:23 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 08/19] drm/i915/guc: Convert engine record to dma_buf_map
Date: Wed, 26 Jan 2022 12:36:51 -0800
Message-Id: <20220126203702.1784589-9-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.35.0
In-Reply-To: <20220126203702.1784589-1-lucas.demarchi@intel.com>
References: <20220126203702.1784589-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 dri-devel@lists.freedesktop.org,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use dma_buf_map to read fields from the dma_blob so access to IO and
system memory is abstracted away.

Cc: Matt Roper <matthew.d.roper@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: John Harrison <John.C.Harrison@Intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c        | 14 ++++++--------
 drivers/gpu/drm/i915/gt/uc/intel_guc_ads.h        |  3 ++-
 drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c | 11 +++++++----
 3 files changed, 15 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
index 2ffe5836f95e..fe1e71adfca1 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
@@ -698,18 +698,16 @@ void intel_guc_ads_reset(struct intel_guc *guc)
 
 u32 intel_guc_engine_usage_offset(struct intel_guc *guc)
 {
-	struct __guc_ads_blob *blob = guc->ads_blob;
-	u32 base = intel_guc_ggtt_offset(guc, guc->ads_vma);
-	u32 offset = base + ptr_offset(blob, engine_usage);
-
-	return offset;
+	return intel_guc_ggtt_offset(guc, guc->ads_vma) +
+		offsetof(struct __guc_ads_blob, engine_usage);
 }
 
-struct guc_engine_usage_record *intel_guc_engine_usage(struct intel_engine_cs *engine)
+struct dma_buf_map intel_guc_engine_usage_record_map(struct intel_engine_cs *engine)
 {
 	struct intel_guc *guc = &engine->gt->uc.guc;
-	struct __guc_ads_blob *blob = guc->ads_blob;
 	u8 guc_class = engine_class_to_guc_class(engine->class);
+	size_t offset = offsetof(struct __guc_ads_blob,
+				 engine_usage.engines[guc_class][ilog2(engine->logical_mask)]);
 
-	return &blob->engine_usage.engines[guc_class][ilog2(engine->logical_mask)];
+	return DMA_BUF_MAP_INIT_OFFSET(&guc->ads_map, offset);
 }
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.h
index e74c110facff..27f5b1f9ddac 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.h
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.h
@@ -7,6 +7,7 @@
 #define _INTEL_GUC_ADS_H_
 
 #include <linux/types.h>
+#include <linux/dma-buf-map.h>
 
 struct intel_guc;
 struct drm_printer;
@@ -18,7 +19,7 @@ void intel_guc_ads_init_late(struct intel_guc *guc);
 void intel_guc_ads_reset(struct intel_guc *guc);
 void intel_guc_ads_print_policy_info(struct intel_guc *guc,
 				     struct drm_printer *p);
-struct guc_engine_usage_record *intel_guc_engine_usage(struct intel_engine_cs *engine);
+struct dma_buf_map intel_guc_engine_usage_record_map(struct intel_engine_cs *engine);
 u32 intel_guc_engine_usage_offset(struct intel_guc *guc);
 
 #endif
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
index db9615dcb0ec..57bfb4ad0ab8 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
@@ -1125,14 +1125,17 @@ __extend_last_switch(struct intel_guc *guc, u64 *prev_start, u32 new_start)
 	*prev_start = ((u64)gt_stamp_hi << 32) | new_start;
 }
 
+#define record_read(map_, field_) \
+	dma_buf_map_read_field(map_, struct guc_engine_usage_record, field_)
+
 static void guc_update_engine_gt_clks(struct intel_engine_cs *engine)
 {
-	struct guc_engine_usage_record *rec = intel_guc_engine_usage(engine);
+	struct dma_buf_map rec_map = intel_guc_engine_usage_record_map(engine);
 	struct intel_engine_guc_stats *stats = &engine->stats.guc;
 	struct intel_guc *guc = &engine->gt->uc.guc;
-	u32 last_switch = rec->last_switch_in_stamp;
-	u32 ctx_id = rec->current_context_index;
-	u32 total = rec->total_runtime;
+	u32 last_switch = record_read(&rec_map, last_switch_in_stamp);
+	u32 ctx_id = record_read(&rec_map, current_context_index);
+	u32 total = record_read(&rec_map, total_runtime);
 
 	lockdep_assert_held(&guc->timestamp.lock);
 
-- 
2.35.0

