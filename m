Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B97839E5CD
	for <lists+dri-devel@lfdr.de>; Mon,  7 Jun 2021 19:46:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12F5E6E99D;
	Mon,  7 Jun 2021 17:46:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DEBB6E986;
 Mon,  7 Jun 2021 17:46:07 +0000 (UTC)
IronPort-SDR: AxfzeIXs8tIKNRAqi7VnXetUhKQyUfnwZcq11VYyHv5AQkTNn7TejZd/bFjU9KSS8U+eV2AKbZ
 H2GKEFSgwfKg==
X-IronPort-AV: E=McAfee;i="6200,9189,10008"; a="191999373"
X-IronPort-AV: E=Sophos;i="5.83,255,1616482800"; d="scan'208";a="191999373"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2021 10:46:06 -0700
IronPort-SDR: 5qvGnNoBIQjrjiHlmCjDpVkz6N1cuJEA3kdRiqpWmoJlkbl46YxGgep6/ZY8aScZUJa76Inwzd
 xl6DLLSNfD1w==
X-IronPort-AV: E=Sophos;i="5.83,255,1616482800"; d="scan'208";a="551970188"
Received: from dhiatt-server.jf.intel.com ([10.54.81.3])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2021 10:46:06 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Subject: [PATCH 12/13] drm/i915/guc: Unified GuC log
Date: Mon,  7 Jun 2021 11:03:54 -0700
Message-Id: <20210607180356.165785-13-matthew.brost@intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210607180356.165785-1-matthew.brost@intel.com>
References: <20210607180356.165785-1-matthew.brost@intel.com>
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
Cc: daniele.ceraolospurio@intel.com, john.c.harrison@intel.com,
 Michal.Wajdeczko@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: John Harrison <John.C.Harrison@Intel.com>

GuC v57 unified the 'DPC' and 'ISR' buffers into a single buffer with
the option for it to be larger.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_guc.c      | 15 ++++-------
 drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h |  9 +++----
 drivers/gpu/drm/i915/gt/uc/intel_guc_log.c  | 29 +++++++--------------
 drivers/gpu/drm/i915/gt/uc/intel_guc_log.h  |  6 ++---
 4 files changed, 20 insertions(+), 39 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
index b773567cb080..6661dcb02239 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
@@ -219,24 +219,19 @@ static u32 guc_ctl_log_params_flags(struct intel_guc *guc)
 
 	BUILD_BUG_ON(!CRASH_BUFFER_SIZE);
 	BUILD_BUG_ON(!IS_ALIGNED(CRASH_BUFFER_SIZE, UNIT));
-	BUILD_BUG_ON(!DPC_BUFFER_SIZE);
-	BUILD_BUG_ON(!IS_ALIGNED(DPC_BUFFER_SIZE, UNIT));
-	BUILD_BUG_ON(!ISR_BUFFER_SIZE);
-	BUILD_BUG_ON(!IS_ALIGNED(ISR_BUFFER_SIZE, UNIT));
+	BUILD_BUG_ON(!DEBUG_BUFFER_SIZE);
+	BUILD_BUG_ON(!IS_ALIGNED(DEBUG_BUFFER_SIZE, UNIT));
 
 	BUILD_BUG_ON((CRASH_BUFFER_SIZE / UNIT - 1) >
 			(GUC_LOG_CRASH_MASK >> GUC_LOG_CRASH_SHIFT));
-	BUILD_BUG_ON((DPC_BUFFER_SIZE / UNIT - 1) >
-			(GUC_LOG_DPC_MASK >> GUC_LOG_DPC_SHIFT));
-	BUILD_BUG_ON((ISR_BUFFER_SIZE / UNIT - 1) >
-			(GUC_LOG_ISR_MASK >> GUC_LOG_ISR_SHIFT));
+	BUILD_BUG_ON((DEBUG_BUFFER_SIZE / UNIT - 1) >
+			(GUC_LOG_DEBUG_MASK >> GUC_LOG_DEBUG_SHIFT));
 
 	flags = GUC_LOG_VALID |
 		GUC_LOG_NOTIFY_ON_HALF_FULL |
 		FLAG |
 		((CRASH_BUFFER_SIZE / UNIT - 1) << GUC_LOG_CRASH_SHIFT) |
-		((DPC_BUFFER_SIZE / UNIT - 1) << GUC_LOG_DPC_SHIFT) |
-		((ISR_BUFFER_SIZE / UNIT - 1) << GUC_LOG_ISR_SHIFT) |
+		((DEBUG_BUFFER_SIZE / UNIT - 1) << GUC_LOG_DEBUG_SHIFT) |
 		(offset << GUC_LOG_BUF_ADDR_SHIFT);
 
 	#undef UNIT
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
index f2df5c11c11d..617ec601648d 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
@@ -81,10 +81,8 @@
 #define   GUC_LOG_ALLOC_IN_MEGABYTE	(1 << 3)
 #define   GUC_LOG_CRASH_SHIFT		4
 #define   GUC_LOG_CRASH_MASK		(0x3 << GUC_LOG_CRASH_SHIFT)
-#define   GUC_LOG_DPC_SHIFT		6
-#define   GUC_LOG_DPC_MASK	        (0x7 << GUC_LOG_DPC_SHIFT)
-#define   GUC_LOG_ISR_SHIFT		9
-#define   GUC_LOG_ISR_MASK	        (0x7 << GUC_LOG_ISR_SHIFT)
+#define   GUC_LOG_DEBUG_SHIFT		6
+#define   GUC_LOG_DEBUG_MASK	        (0xF << GUC_LOG_DEBUG_SHIFT)
 #define   GUC_LOG_BUF_ADDR_SHIFT	12
 
 #define GUC_CTL_WA			1
@@ -311,8 +309,7 @@ struct guc_ads {
 /* GuC logging structures */
 
 enum guc_log_buffer_type {
-	GUC_ISR_LOG_BUFFER,
-	GUC_DPC_LOG_BUFFER,
+	GUC_DEBUG_LOG_BUFFER,
 	GUC_CRASH_DUMP_LOG_BUFFER,
 	GUC_MAX_LOG_BUFFER
 };
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_log.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_log.c
index c36d5eb5bbb9..ac0931f0374b 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_log.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_log.c
@@ -197,10 +197,8 @@ static bool guc_check_log_buf_overflow(struct intel_guc_log *log,
 static unsigned int guc_get_log_buffer_size(enum guc_log_buffer_type type)
 {
 	switch (type) {
-	case GUC_ISR_LOG_BUFFER:
-		return ISR_BUFFER_SIZE;
-	case GUC_DPC_LOG_BUFFER:
-		return DPC_BUFFER_SIZE;
+	case GUC_DEBUG_LOG_BUFFER:
+		return DEBUG_BUFFER_SIZE;
 	case GUC_CRASH_DUMP_LOG_BUFFER:
 		return CRASH_BUFFER_SIZE;
 	default:
@@ -245,7 +243,7 @@ static void guc_read_update_log_buffer(struct intel_guc_log *log)
 	src_data += PAGE_SIZE;
 	dst_data += PAGE_SIZE;
 
-	for (type = GUC_ISR_LOG_BUFFER; type < GUC_MAX_LOG_BUFFER; type++) {
+	for (type = GUC_DEBUG_LOG_BUFFER; type < GUC_MAX_LOG_BUFFER; type++) {
 		/*
 		 * Make a copy of the state structure, inside GuC log buffer
 		 * (which is uncached mapped), on the stack to avoid reading
@@ -463,21 +461,16 @@ int intel_guc_log_create(struct intel_guc_log *log)
 	 *  +===============================+ 00B
 	 *  |    Crash dump state header    |
 	 *  +-------------------------------+ 32B
-	 *  |       DPC state header        |
+	 *  |      Debug state header       |
 	 *  +-------------------------------+ 64B
-	 *  |       ISR state header        |
-	 *  +-------------------------------+ 96B
 	 *  |                               |
 	 *  +===============================+ PAGE_SIZE (4KB)
 	 *  |        Crash Dump logs        |
 	 *  +===============================+ + CRASH_SIZE
-	 *  |           DPC logs            |
-	 *  +===============================+ + DPC_SIZE
-	 *  |           ISR logs            |
-	 *  +===============================+ + ISR_SIZE
+	 *  |          Debug logs           |
+	 *  +===============================+ + DEBUG_SIZE
 	 */
-	guc_log_size = PAGE_SIZE + CRASH_BUFFER_SIZE + DPC_BUFFER_SIZE +
-			ISR_BUFFER_SIZE;
+	guc_log_size = PAGE_SIZE + CRASH_BUFFER_SIZE + DEBUG_BUFFER_SIZE;
 
 	vma = intel_guc_allocate_vma(guc, guc_log_size);
 	if (IS_ERR(vma)) {
@@ -675,10 +668,8 @@ static const char *
 stringify_guc_log_type(enum guc_log_buffer_type type)
 {
 	switch (type) {
-	case GUC_ISR_LOG_BUFFER:
-		return "ISR";
-	case GUC_DPC_LOG_BUFFER:
-		return "DPC";
+	case GUC_DEBUG_LOG_BUFFER:
+		return "DEBUG";
 	case GUC_CRASH_DUMP_LOG_BUFFER:
 		return "CRASH";
 	default:
@@ -708,7 +699,7 @@ void intel_guc_log_info(struct intel_guc_log *log, struct drm_printer *p)
 
 	drm_printf(p, "\tRelay full count: %u\n", log->relay.full_count);
 
-	for (type = GUC_ISR_LOG_BUFFER; type < GUC_MAX_LOG_BUFFER; type++) {
+	for (type = GUC_DEBUG_LOG_BUFFER; type < GUC_MAX_LOG_BUFFER; type++) {
 		drm_printf(p, "\t%s:\tflush count %10u, overflow count %10u\n",
 			   stringify_guc_log_type(type),
 			   log->stats[type].flush,
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_log.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_log.h
index 11fccd0b2294..ac1ee1d5ce10 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_log.h
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_log.h
@@ -17,12 +17,10 @@ struct intel_guc;
 
 #ifdef CONFIG_DRM_I915_DEBUG_GUC
 #define CRASH_BUFFER_SIZE	SZ_2M
-#define DPC_BUFFER_SIZE		SZ_8M
-#define ISR_BUFFER_SIZE		SZ_8M
+#define DEBUG_BUFFER_SIZE	SZ_16M
 #else
 #define CRASH_BUFFER_SIZE	SZ_8K
-#define DPC_BUFFER_SIZE		SZ_32K
-#define ISR_BUFFER_SIZE		SZ_32K
+#define DEBUG_BUFFER_SIZE	SZ_64K
 #endif
 
 /*
-- 
2.28.0

