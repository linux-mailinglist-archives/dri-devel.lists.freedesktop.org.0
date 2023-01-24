Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A726E679FAD
	for <lists+dri-devel@lfdr.de>; Tue, 24 Jan 2023 18:06:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A51910E6DC;
	Tue, 24 Jan 2023 17:06:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 860AF10E6D4;
 Tue, 24 Jan 2023 17:06:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674579992; x=1706115992;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/HUxB6tfXLaAI9CtMYtyB+45WS2zXKzaSueX41iwTvI=;
 b=BhH5SupgNN0REAUvdvQHROcbiCU45SN8dv4BJfb2ybi8OJ3jWODPxMW8
 bpnp1CaE6o2Du5gG/WEsgG5nn7q4TN9hZlPFcZdwH+HnrWgt9CdJ7JDJj
 ymO8OyT5Z0KvNPwPSNafenDMKgQgUUPBLD13anwNjKCfFTAyeENZEsXL2
 yqnmky/xewKWQz5y2IuopYKqN7X0IRWpba9OVcEwM7Ey3V4REBbhhkhd4
 K9iLlM9/qzYMXwc4TwlENcYz1kIVkfpqhADGtW6ATpbTDsBQ2yeY0znZW
 Ag0vzUihMa0z2IgfCfjiK/Z1mXgf9rfbKtGjTSk1rpn6k/piVFZtMqbyS g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10600"; a="306007410"
X-IronPort-AV: E=Sophos;i="5.97,242,1669104000"; d="scan'208";a="306007410"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jan 2023 09:05:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10600"; a="750895798"
X-IronPort-AV: E=Sophos;i="5.97,242,1669104000"; d="scan'208";a="750895798"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by FMSMGA003.fm.intel.com with ESMTP; 24 Jan 2023 09:05:25 -0800
Received: from mwajdecz-MOBL.ger.corp.intel.com
 (mwajdecz-MOBL.ger.corp.intel.com [10.249.147.192])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 6182837E21;
 Tue, 24 Jan 2023 17:05:25 +0000 (GMT)
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 6/8] drm/i915/guc: Update GuC messages in intel_guc_log.c
Date: Tue, 24 Jan 2023 18:05:20 +0100
Message-Id: <20230124170522.1808-7-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20230124170522.1808-1-michal.wajdeczko@intel.com>
References: <20230124170522.1808-1-michal.wajdeczko@intel.com>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use new macros to have common prefix that also include GT#.

v2: drop redundant GuC strings, minor improvements

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: John Harrison <John.C.Harrison@Intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_guc_log.c | 37 ++++++++++++----------
 1 file changed, 20 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_log.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_log.c
index 68331c538b0a..290bb996b667 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_log.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_log.c
@@ -12,6 +12,7 @@
 #include "i915_memcpy.h"
 #include "intel_guc_capture.h"
 #include "intel_guc_log.h"
+#include "intel_guc_print.h"
 
 #if defined(CONFIG_DRM_I915_DEBUG_GUC)
 #define GUC_LOG_DEFAULT_CRASH_BUFFER_SIZE	SZ_2M
@@ -39,7 +40,6 @@ struct guc_log_section {
 static void _guc_log_init_sizes(struct intel_guc_log *log)
 {
 	struct intel_guc *guc = log_to_guc(log);
-	struct drm_i915_private *i915 = guc_to_gt(guc)->i915;
 	static const struct guc_log_section sections[GUC_LOG_SECTIONS_LIMIT] = {
 		{
 			GUC_LOG_CRASH_MASK >> GUC_LOG_CRASH_SHIFT,
@@ -82,12 +82,12 @@ static void _guc_log_init_sizes(struct intel_guc_log *log)
 		}
 
 		if (!IS_ALIGNED(log->sizes[i].bytes, log->sizes[i].units))
-			drm_err(&i915->drm, "Mis-aligned GuC log %s size: 0x%X vs 0x%X!",
+			guc_err(guc, "Mis-aligned log %s size: 0x%X vs 0x%X!\n",
 				sections[i].name, log->sizes[i].bytes, log->sizes[i].units);
 		log->sizes[i].count = log->sizes[i].bytes / log->sizes[i].units;
 
 		if (!log->sizes[i].count) {
-			drm_err(&i915->drm, "Zero GuC log %s size!", sections[i].name);
+			guc_err(guc, "Zero log %s size!\n", sections[i].name);
 		} else {
 			/* Size is +1 unit */
 			log->sizes[i].count--;
@@ -95,15 +95,17 @@ static void _guc_log_init_sizes(struct intel_guc_log *log)
 
 		/* Clip to field size */
 		if (log->sizes[i].count > sections[i].max) {
-			drm_err(&i915->drm, "GuC log %s size too large: %d vs %d!",
+			guc_err(guc, "log %s size too large: %d vs %d!\n",
 				sections[i].name, log->sizes[i].count + 1, sections[i].max + 1);
 			log->sizes[i].count = sections[i].max;
 		}
 	}
 
 	if (log->sizes[GUC_LOG_SECTIONS_CRASH].units != log->sizes[GUC_LOG_SECTIONS_DEBUG].units) {
-		drm_err(&i915->drm, "Unit mis-match for GuC log crash and debug sections: %d vs %d!",
+		guc_err(guc, "Unit mis-match between log sections: %s = %d vs %s = %d!\n",
+			sections[GUC_LOG_SECTIONS_CRASH].name,
 			log->sizes[GUC_LOG_SECTIONS_CRASH].units,
+			sections[GUC_LOG_SECTIONS_DEBUG].name,
 			log->sizes[GUC_LOG_SECTIONS_DEBUG].units);
 		log->sizes[GUC_LOG_SECTIONS_CRASH].units = log->sizes[GUC_LOG_SECTIONS_DEBUG].units;
 		log->sizes[GUC_LOG_SECTIONS_CRASH].count = 0;
@@ -374,6 +376,7 @@ size_t intel_guc_get_log_buffer_offset(struct intel_guc_log *log,
 
 static void _guc_log_copy_debuglogs_for_relay(struct intel_guc_log *log)
 {
+	struct intel_guc *guc = log_to_guc(log);
 	unsigned int buffer_size, read_offset, write_offset, bytes_to_copy, full_cnt;
 	struct guc_log_buffer_state *log_buf_state, *log_buf_snapshot_state;
 	struct guc_log_buffer_state log_buf_state_local;
@@ -383,7 +386,7 @@ static void _guc_log_copy_debuglogs_for_relay(struct intel_guc_log *log)
 
 	mutex_lock(&log->relay.lock);
 
-	if (WARN_ON(!intel_guc_log_relay_created(log)))
+	if (guc_WARN_ON(guc, !intel_guc_log_relay_created(log)))
 		goto out_unlock;
 
 	/* Get the pointer to shared GuC log buffer */
@@ -398,7 +401,7 @@ static void _guc_log_copy_debuglogs_for_relay(struct intel_guc_log *log)
 		 * Used rate limited to avoid deluge of messages, logs might be
 		 * getting consumed by User at a slow rate.
 		 */
-		DRM_ERROR_RATELIMITED("no sub-buffer to copy general logs\n");
+		guc_err_ratelimited(guc, "no sub-buffer to copy general logs\n");
 		log->relay.full_count++;
 
 		goto out_unlock;
@@ -451,7 +454,7 @@ static void _guc_log_copy_debuglogs_for_relay(struct intel_guc_log *log)
 			write_offset = buffer_size;
 		} else if (unlikely((read_offset > buffer_size) ||
 				    (write_offset > buffer_size))) {
-			DRM_ERROR("invalid log buffer state\n");
+			guc_err(guc, "invalid log buffer state\n");
 			/* copy whole buffer as offsets are unreliable */
 			read_offset = 0;
 			write_offset = buffer_size;
@@ -547,7 +550,7 @@ static int guc_log_relay_create(struct intel_guc_log *log)
 					subbuf_size, n_subbufs,
 					&relay_callbacks, dev_priv);
 	if (!guc_log_relay_chan) {
-		DRM_ERROR("Couldn't create relay chan for GuC logging\n");
+		guc_err(guc, "Couldn't create relay channel for logging\n");
 
 		ret = -ENOMEM;
 		return ret;
@@ -596,7 +599,7 @@ static u32 __get_default_log_level(struct intel_guc_log *log)
 	}
 
 	if (i915->params.guc_log_level > GUC_LOG_LEVEL_MAX) {
-		DRM_WARN("Incompatible option detected: %s=%d, %s!\n",
+		guc_warn(guc, "Incompatible option detected: %s=%d, %s!\n",
 			 "guc_log_level", i915->params.guc_log_level,
 			 "verbosity too high");
 		return (IS_ENABLED(CONFIG_DRM_I915_DEBUG) ||
@@ -641,15 +644,15 @@ int intel_guc_log_create(struct intel_guc_log *log)
 	log->buf_addr = vaddr;
 
 	log->level = __get_default_log_level(log);
-	DRM_DEBUG_DRIVER("guc_log_level=%d (%s, verbose:%s, verbosity:%d)\n",
-			 log->level, str_enabled_disabled(log->level),
-			 str_yes_no(GUC_LOG_LEVEL_IS_VERBOSE(log->level)),
-			 GUC_LOG_LEVEL_TO_VERBOSITY(log->level));
+	guc_dbg(guc, "guc_log_level=%d (%s, verbose:%s, verbosity:%d)\n",
+		log->level, str_enabled_disabled(log->level),
+		str_yes_no(GUC_LOG_LEVEL_IS_VERBOSE(log->level)),
+		GUC_LOG_LEVEL_TO_VERBOSITY(log->level));
 
 	return 0;
 
 err:
-	DRM_ERROR("Failed to allocate or map GuC log buffer. %d\n", ret);
+	guc_err(guc, "Failed to allocate or map log buffer %pe\n", ERR_PTR(ret));
 	return ret;
 }
 
@@ -687,7 +690,7 @@ int intel_guc_log_set_level(struct intel_guc_log *log, u32 level)
 					     GUC_LOG_LEVEL_IS_ENABLED(level),
 					     GUC_LOG_LEVEL_TO_VERBOSITY(level));
 	if (ret) {
-		DRM_DEBUG_DRIVER("guc_log_control action failed %d\n", ret);
+		guc_dbg(guc, "guc_log_control action failed %pe\n", ERR_PTR(ret));
 		goto out_unlock;
 	}
 
@@ -905,7 +908,7 @@ int intel_guc_log_dump(struct intel_guc_log *log, struct drm_printer *p,
 
 	map = i915_gem_object_pin_map_unlocked(obj, I915_MAP_WC);
 	if (IS_ERR(map)) {
-		DRM_DEBUG("Failed to pin object\n");
+		guc_dbg(guc, "Failed to pin log object: %pe\n", map);
 		drm_puts(p, "(log data unaccessible)\n");
 		free_page((unsigned long)page);
 		return PTR_ERR(map);
-- 
2.25.1

