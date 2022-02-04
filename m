Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BE08E4A9E11
	for <lists+dri-devel@lfdr.de>; Fri,  4 Feb 2022 18:45:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C0CA10EEEA;
	Fri,  4 Feb 2022 17:45:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0A4A10EDB5;
 Fri,  4 Feb 2022 17:45:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643996711; x=1675532711;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=HTM6wgGDyctdrDu0SVmG4tpgqCszIpXkL32fGSiQcio=;
 b=UNfM/zYH02wdSD51S9x1wHmwFiw+tTPcCGrBFu3s7EhRDyebfbkzshlF
 ts1kC3WuAUIUtUTzLCuyh4Mq3RdBZfVuNp2ME2kipDwqk376vn7Cz0MFo
 p1M9GeHMkWf444Qc/0/kMzqR6FJhpx/72x9PrHzRmk21qLY60AHZKnE/B
 X7obiQcCYqdER0cCtTsqHEjyZdX888niDTrl0Sg4PPCpzSwtMYx+fsv7M
 4TNrakzsgV9BkkU8adhI4IyLqwBF/leiw5dPf1PPZCe/noSqLsdIm+P24
 31ZTHh7rpWQ4KMLBjNATG1Twx6OsEovdzDmeV9Ac3Ij9mUatcwhdJuyZX A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10248"; a="247242178"
X-IronPort-AV: E=Sophos;i="5.88,343,1635231600"; d="scan'208";a="247242178"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2022 09:45:09 -0800
X-IronPort-AV: E=Sophos;i="5.88,343,1635231600"; d="scan'208";a="539240811"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.202])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2022 09:45:08 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 09/19] drm/i915/guc: Convert engine record to iosys_map
Date: Fri,  4 Feb 2022 09:44:26 -0800
Message-Id: <20220204174436.830121-10-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220204174436.830121-1-lucas.demarchi@intel.com>
References: <20220204174436.830121-1-lucas.demarchi@intel.com>
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
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 John Harrison <John.C.Harrison@Intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use iosys_map to read fields from the dma_blob so access to IO and
system memory is abstracted away.

Cc: Matt Roper <matthew.d.roper@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: John Harrison <John.C.Harrison@Intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c      | 14 ++++++--------
 drivers/gpu/drm/i915/gt/uc/intel_guc_ads.h      |  3 ++-
 .../gpu/drm/i915/gt/uc/intel_guc_submission.c   | 17 ++++++++++-------
 3 files changed, 18 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
index 6311b9da87e4..1d21a2d457e0 100644
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
+struct iosys_map intel_guc_engine_usage_record_map(struct intel_engine_cs *engine)
 {
 	struct intel_guc *guc = &engine->gt->uc.guc;
-	struct __guc_ads_blob *blob = guc->ads_blob;
 	u8 guc_class = engine_class_to_guc_class(engine->class);
+	size_t offset = offsetof(struct __guc_ads_blob,
+				 engine_usage.engines[guc_class][ilog2(engine->logical_mask)]);
 
-	return &blob->engine_usage.engines[guc_class][ilog2(engine->logical_mask)];
+	return IOSYS_MAP_INIT_OFFSET(&guc->ads_map, offset);
 }
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.h
index e74c110facff..1c64f4d6ea21 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.h
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.h
@@ -7,6 +7,7 @@
 #define _INTEL_GUC_ADS_H_
 
 #include <linux/types.h>
+#include <linux/iosys-map.h>
 
 struct intel_guc;
 struct drm_printer;
@@ -18,7 +19,7 @@ void intel_guc_ads_init_late(struct intel_guc *guc);
 void intel_guc_ads_reset(struct intel_guc *guc);
 void intel_guc_ads_print_policy_info(struct intel_guc *guc,
 				     struct drm_printer *p);
-struct guc_engine_usage_record *intel_guc_engine_usage(struct intel_engine_cs *engine);
+struct iosys_map intel_guc_engine_usage_record_map(struct intel_engine_cs *engine);
 u32 intel_guc_engine_usage_offset(struct intel_guc *guc);
 
 #endif
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
index b3a429a92c0d..6d34842f68b4 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
@@ -1139,6 +1139,9 @@ __extend_last_switch(struct intel_guc *guc, u64 *prev_start, u32 new_start)
 	*prev_start = ((u64)gt_stamp_hi << 32) | new_start;
 }
 
+#define record_read(map_, field_) \
+	iosys_map_rd_field(map_, struct guc_engine_usage_record, field_)
+
 /*
  * GuC updates shared memory and KMD reads it. Since this is not synchronized,
  * we run into a race where the value read is inconsistent. Sometimes the
@@ -1153,17 +1156,17 @@ __extend_last_switch(struct intel_guc *guc, u64 *prev_start, u32 new_start)
 static void __get_engine_usage_record(struct intel_engine_cs *engine,
 				      u32 *last_in, u32 *id, u32 *total)
 {
-	struct guc_engine_usage_record *rec = intel_guc_engine_usage(engine);
+	struct iosys_map rec_map = intel_guc_engine_usage_record_map(engine);
 	int i = 0;
 
 	do {
-		*last_in = READ_ONCE(rec->last_switch_in_stamp);
-		*id = READ_ONCE(rec->current_context_index);
-		*total = READ_ONCE(rec->total_runtime);
+		*last_in = record_read(&rec_map, last_switch_in_stamp);
+		*id = record_read(&rec_map, current_context_index);
+		*total = record_read(&rec_map, total_runtime);
 
-		if (READ_ONCE(rec->last_switch_in_stamp) == *last_in &&
-		    READ_ONCE(rec->current_context_index) == *id &&
-		    READ_ONCE(rec->total_runtime) == *total)
+		if (record_read(&rec_map, last_switch_in_stamp) == *last_in &&
+		    record_read(&rec_map, current_context_index) == *id &&
+		    record_read(&rec_map, total_runtime) == *total)
 			break;
 	} while (++i < 6);
 }
-- 
2.35.1

