Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DE6E5836CC
	for <lists+dri-devel@lfdr.de>; Thu, 28 Jul 2022 04:23:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A56BF10F10E;
	Thu, 28 Jul 2022 02:21:28 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6896510F405;
 Thu, 28 Jul 2022 02:20:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1658974833; x=1690510833;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=lHgrQyukX8B1tx4Z2b410Da48wr2HK38otOT/xYei9U=;
 b=b6WjwDj3Gdn98hX1j6vT4hU8UDcHkHKKDAMDjJrzL1r7rubwke/3kNUW
 WBicKdmjGFbxjnPHSjQOYQN/m/iegwvCVmELowDeNNYXsEc7rSIvl2wCb
 JhdxkCoZYiSDjdlnO2wrDpdPKi2HtsrRU9b/w2w/dkdl5iN2g0CzRiT0D
 VjYyrYhWZvsETlsrx9CfCDX1a7dHQU0t49fkNrcGFyMxf1T7r04G8Rln/
 3L9H4IL4W8rzSaeSnlmoD5zkPleTxnEisbpEGP0cdnmHxOEs8kcKVIPTM
 Mbmbo42mlISOuw1baFuw1WG6uBmyoUJcLe2spGdhwHYGphCREczB2bhj+ w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10421"; a="285947582"
X-IronPort-AV: E=Sophos;i="5.93,196,1654585200"; d="scan'208";a="285947582"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2022 19:20:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,196,1654585200"; d="scan'208";a="600648465"
Received: from relo-linux-5.jf.intel.com ([10.165.21.134])
 by orsmga002.jf.intel.com with ESMTP; 27 Jul 2022 19:20:28 -0700
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Subject: [PATCH 2/7] drm/i915/guc: Fix capture size warning and bump the size
Date: Wed, 27 Jul 2022 19:20:23 -0700
Message-Id: <20220728022028.2190627-3-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220728022028.2190627-1-John.C.Harrison@Intel.com>
References: <20220728022028.2190627-1-John.C.Harrison@Intel.com>
MIME-Version: 1.0
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
 Swindon SN3 1RJ
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
Cc: John Harrison <John.C.Harrison@Intel.com>, DRI-Devel@Lists.FreeDesktop.Org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: John Harrison <John.C.Harrison@Intel.com>

There was a size check to warn if the GuC error state capture buffer
allocation would be too small to fit a reasonable amount of capture
data for the current platform. Unfortunately, the test was done too
early in the boot sequence and was actually testing 'if(-ENODEV >
size)'.

Move the check to be later. The check is only used to print a warning
message, so it doesn't really matter how early or late it is done.
Note that it is not possible to dynamically size the buffer because
the allocation needs to be done before the engine information is
available (at least, it would be in the intended two-phase GuC init
process).

Now that the check works, it is reporting size too small for newer
platforms. The check includes a 3x oversample multiplier to allow for
multiple error captures to be bufferd by GuC before i915 has a chance
to read them out. This is less important than simply being big enough
to fit the first capture.

So a) bump the default size to be large enough for one capture minimum
and b) make the warning only if one capture won't fit, instead use a
notice for the 3x size.

Note that the size estimate is a worst case scenario. Actual captures
will likely be smaller.

Lastly, use drm_warn istead of DRM_WARN as the former provides more
infmration and the latter is deprecated.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
---
 .../gpu/drm/i915/gt/uc/intel_guc_capture.c    | 40 ++++++++++++++-----
 .../gpu/drm/i915/gt/uc/intel_guc_capture.h    |  1 -
 drivers/gpu/drm/i915/gt/uc/intel_guc_log.c    |  4 --
 drivers/gpu/drm/i915/gt/uc/intel_guc_log.h    |  4 +-
 4 files changed, 31 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_capture.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_capture.c
index 75257bd20ff01..b54b7883320b1 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_capture.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_capture.c
@@ -600,10 +600,8 @@ intel_guc_capture_getnullheader(struct intel_guc *guc,
 	return 0;
 }
 
-#define GUC_CAPTURE_OVERBUFFER_MULTIPLIER 3
-
-int
-intel_guc_capture_output_min_size_est(struct intel_guc *guc)
+static int
+guc_capture_output_min_size_est(struct intel_guc *guc)
 {
 	struct intel_gt *gt = guc_to_gt(guc);
 	struct intel_engine_cs *engine;
@@ -623,13 +621,8 @@ intel_guc_capture_output_min_size_est(struct intel_guc *guc)
 	 * For each engine instance, there would be 1 x guc_state_capture_group_t output
 	 * followed by 3 x guc_state_capture_t lists. The latter is how the register
 	 * dumps are split across different register types (where the '3' are global vs class
-	 * vs instance). Finally, let's multiply the whole thing by 3x (just so we are
-	 * not limited to just 1 round of data in a worst case full register dump log)
-	 *
-	 * NOTE: intel_guc_log that allocates the log buffer would round this size up to
-	 * a power of two.
+	 * vs instance).
 	 */
-
 	for_each_engine(engine, gt, id) {
 		worst_min_size += sizeof(struct guc_state_capture_group_header_t) +
 					 (3 * sizeof(struct guc_state_capture_header_t));
@@ -649,7 +642,30 @@ intel_guc_capture_output_min_size_est(struct intel_guc *guc)
 
 	worst_min_size += (num_regs * sizeof(struct guc_mmio_reg));
 
-	return (worst_min_size * GUC_CAPTURE_OVERBUFFER_MULTIPLIER);
+	return worst_min_size;
+}
+
+/*
+ * Add on a 3x multiplier to allow for multiple back-to-back captures occurring
+ * before the i915 can read the data out and process it
+ */
+#define GUC_CAPTURE_OVERBUFFER_MULTIPLIER 3
+
+static void check_guc_capture_size(struct intel_guc *guc)
+{
+	struct drm_i915_private *i915 = guc_to_gt(guc)->i915;
+	int min_size = guc_capture_output_min_size_est(guc);
+	int spare_size = min_size * GUC_CAPTURE_OVERBUFFER_MULTIPLIER;
+
+	if (min_size < 0)
+		drm_warn(&i915->drm, "Failed to calculate GuC error state capture buffer minimum size: %d!\n",
+			 min_size);
+	else if (min_size > CAPTURE_BUFFER_SIZE)
+		drm_warn(&i915->drm, "GuC error state capture buffer is too small: %d < %d\n",
+			 CAPTURE_BUFFER_SIZE, min_size);
+	else if (spare_size > CAPTURE_BUFFER_SIZE)
+		drm_notice(&i915->drm, "GuC error state capture buffer maybe too small: %d < %d (min = %d)\n",
+			   CAPTURE_BUFFER_SIZE, spare_size, min_size);
 }
 
 /*
@@ -1580,5 +1596,7 @@ int intel_guc_capture_init(struct intel_guc *guc)
 	INIT_LIST_HEAD(&guc->capture->outlist);
 	INIT_LIST_HEAD(&guc->capture->cachelist);
 
+	check_guc_capture_size(guc);
+
 	return 0;
 }
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_capture.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_capture.h
index d3d7bd0b6db64..fbd3713c7832d 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_capture.h
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_capture.h
@@ -21,7 +21,6 @@ int intel_guc_capture_print_engine_node(struct drm_i915_error_state_buf *m,
 void intel_guc_capture_get_matching_node(struct intel_gt *gt, struct intel_engine_coredump *ee,
 					 struct intel_context *ce);
 void intel_guc_capture_process(struct intel_guc *guc);
-int intel_guc_capture_output_min_size_est(struct intel_guc *guc);
 int intel_guc_capture_getlist(struct intel_guc *guc, u32 owner, u32 type, u32 classid,
 			      void **outptr);
 int intel_guc_capture_getlistsize(struct intel_guc *guc, u32 owner, u32 type, u32 classid,
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_log.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_log.c
index 492bbf419d4df..991d4a02248dc 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_log.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_log.c
@@ -487,10 +487,6 @@ int intel_guc_log_create(struct intel_guc_log *log)
 
 	GEM_BUG_ON(log->vma);
 
-	if (intel_guc_capture_output_min_size_est(guc) > CAPTURE_BUFFER_SIZE)
-		DRM_WARN("GuC log buffer for state_capture maybe too small. %d < %d\n",
-			 CAPTURE_BUFFER_SIZE, intel_guc_capture_output_min_size_est(guc));
-
 	guc_log_size = intel_guc_log_size(log);
 
 	vma = intel_guc_allocate_vma(guc, guc_log_size);
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_log.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_log.h
index 18007e639be99..dc9715411d626 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_log.h
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_log.h
@@ -22,11 +22,11 @@ struct intel_guc;
 #elif defined(CONFIG_DRM_I915_DEBUG_GEM)
 #define CRASH_BUFFER_SIZE	SZ_1M
 #define DEBUG_BUFFER_SIZE	SZ_2M
-#define CAPTURE_BUFFER_SIZE	SZ_1M
+#define CAPTURE_BUFFER_SIZE	SZ_4M
 #else
 #define CRASH_BUFFER_SIZE	SZ_8K
 #define DEBUG_BUFFER_SIZE	SZ_64K
-#define CAPTURE_BUFFER_SIZE	SZ_16K
+#define CAPTURE_BUFFER_SIZE	SZ_2M
 #endif
 
 /*
-- 
2.37.1

