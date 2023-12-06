Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7F3A8077C7
	for <lists+dri-devel@lfdr.de>; Wed,  6 Dec 2023 19:44:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C7C610E0D6;
	Wed,  6 Dec 2023 18:43:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62B7F10E0D6;
 Wed,  6 Dec 2023 18:43:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701888235; x=1733424235;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Vf3JtoYX8fGDiV5iMgkOSKocMZXwrm/1TcSqf5gsSFA=;
 b=PG1fS7GksYMlpY4/MV3MiioLE2mpAdH4gI5lic8IaxfU1FR2DsKXtrLf
 73MstD9ubukhiMfBzeztQFvXfHXAra/Wjv6mW3IA/s7t03P1a/i07SyZc
 lifQQcdsFL5xc36nS5W/YKj6/i1eRzUTO4WroaycvPiCZiAPBzLVV+1iK
 giJuqMl6HskV3J7jH3q0sLCgAxXS+0QOAa8pmBh0Dw7MHptVtrOpUhxZU
 fyUKGQdYg6T9HqXXWjGxVVFuv7oGfd6cdHLW8b3f9dV1n5srhPaGVhFVW
 qJG02j5P781/kmHUX0o8GYZg+z0l6bCTzeasbwU5H009mnxPlNEMfX9Cl g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="458433339"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; d="scan'208";a="458433339"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Dec 2023 10:43:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="800436777"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; d="scan'208";a="800436777"
Received: from karthik-mobl.ger.corp.intel.com (HELO intel.com)
 ([10.252.46.178])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Dec 2023 10:43:53 -0800
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Nirmoy Das <nirmoy.das@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>
Subject: [PATCH v3] drm/i915/guc: Create the guc_to_i915() wrapper
Date: Wed,  6 Dec 2023 19:43:22 +0100
Message-ID: <20231206184322.57111-1-andi.shyti@linux.intel.com>
X-Mailer: git-send-email 2.43.0
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
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>,
 Andi Shyti <andi.shyti@linux.intel.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Given a reference to "guc", the guc_to_i915() returns the
pointer to "i915" private data.

Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>
---
Hi,

This is almost a resend of the previous patch (check changelog).
I have taken this one out from the series as this has been
reviewed already.

Thanks,
Andi

Changelog:
----------
v2 -> v3:
https://patchwork.freedesktop.org/series/125583/
 - Taken out from its original series
 - Added Nirmoy's r-b.

v1 -> v2:
 - this patch was included in a bigger series, no change.

 drivers/gpu/drm/i915/gt/intel_gt.h                |  5 +++++
 drivers/gpu/drm/i915/gt/uc/intel_guc.c            |  2 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_capture.c    |  2 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c         |  2 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_log.c        | 10 +++++-----
 drivers/gpu/drm/i915/gt/uc/intel_guc_rc.c         |  2 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c       |  2 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c |  4 ++--
 8 files changed, 17 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_gt.h b/drivers/gpu/drm/i915/gt/intel_gt.h
index b0e453e27ea8..608f5c872928 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt.h
+++ b/drivers/gpu/drm/i915/gt/intel_gt.h
@@ -118,6 +118,11 @@ static inline struct intel_gt *gsc_to_gt(struct intel_gsc *gsc)
 	return container_of(gsc, struct intel_gt, gsc);
 }
 
+static inline struct drm_i915_private *guc_to_i915(struct intel_guc *guc)
+{
+	return guc_to_gt(guc)->i915;
+}
+
 void intel_gt_common_init_early(struct intel_gt *gt);
 int intel_root_gt_init_early(struct drm_i915_private *i915);
 int intel_gt_assign_ggtt(struct intel_gt *gt);
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
index 3f3df1166b86..2b450c43bbd7 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
@@ -330,7 +330,7 @@ static u32 guc_ctl_wa_flags(struct intel_guc *guc)
 
 static u32 guc_ctl_devid(struct intel_guc *guc)
 {
-	struct drm_i915_private *i915 = guc_to_gt(guc)->i915;
+	struct drm_i915_private *i915 = guc_to_i915(guc);
 
 	return (INTEL_DEVID(i915) << 16) | INTEL_REVID(i915);
 }
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_capture.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_capture.c
index a4da0208c883..a1cd40d80517 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_capture.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_capture.c
@@ -355,7 +355,7 @@ guc_capture_alloc_steered_lists(struct intel_guc *guc,
 static const struct __guc_mmio_reg_descr_group *
 guc_capture_get_device_reglist(struct intel_guc *guc)
 {
-	struct drm_i915_private *i915 = guc_to_gt(guc)->i915;
+	struct drm_i915_private *i915 = guc_to_i915(guc);
 	const struct __guc_mmio_reg_descr_group *lists;
 
 	if (GRAPHICS_VER(i915) >= 12)
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
index ed6ce73ef3b0..0d5197c0824a 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
@@ -265,7 +265,7 @@ int intel_guc_ct_init(struct intel_guc_ct *ct)
 	u32 *cmds;
 	int err;
 
-	err = i915_inject_probe_error(guc_to_gt(guc)->i915, -ENXIO);
+	err = i915_inject_probe_error(guc_to_i915(guc), -ENXIO);
 	if (err)
 		return err;
 
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_log.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_log.c
index 55bc8b55fbc0..bf16351c9349 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_log.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_log.c
@@ -520,7 +520,7 @@ void intel_guc_log_init_early(struct intel_guc_log *log)
 static int guc_log_relay_create(struct intel_guc_log *log)
 {
 	struct intel_guc *guc = log_to_guc(log);
-	struct drm_i915_private *i915 = guc_to_gt(guc)->i915;
+	struct drm_i915_private *i915 = guc_to_i915(guc);
 	struct rchan *guc_log_relay_chan;
 	size_t n_subbufs, subbuf_size;
 	int ret;
@@ -573,7 +573,7 @@ static void guc_log_relay_destroy(struct intel_guc_log *log)
 static void guc_log_copy_debuglogs_for_relay(struct intel_guc_log *log)
 {
 	struct intel_guc *guc = log_to_guc(log);
-	struct drm_i915_private *i915 = guc_to_gt(guc)->i915;
+	struct drm_i915_private *i915 = guc_to_i915(guc);
 	intel_wakeref_t wakeref;
 
 	_guc_log_copy_debuglogs_for_relay(log);
@@ -589,7 +589,7 @@ static void guc_log_copy_debuglogs_for_relay(struct intel_guc_log *log)
 static u32 __get_default_log_level(struct intel_guc_log *log)
 {
 	struct intel_guc *guc = log_to_guc(log);
-	struct drm_i915_private *i915 = guc_to_gt(guc)->i915;
+	struct drm_i915_private *i915 = guc_to_i915(guc);
 
 	/* A negative value means "use platform/config default" */
 	if (i915->params.guc_log_level < 0) {
@@ -664,7 +664,7 @@ void intel_guc_log_destroy(struct intel_guc_log *log)
 int intel_guc_log_set_level(struct intel_guc_log *log, u32 level)
 {
 	struct intel_guc *guc = log_to_guc(log);
-	struct drm_i915_private *i915 = guc_to_gt(guc)->i915;
+	struct drm_i915_private *i915 = guc_to_i915(guc);
 	intel_wakeref_t wakeref;
 	int ret = 0;
 
@@ -796,7 +796,7 @@ void intel_guc_log_relay_flush(struct intel_guc_log *log)
 static void guc_log_relay_stop(struct intel_guc_log *log)
 {
 	struct intel_guc *guc = log_to_guc(log);
-	struct drm_i915_private *i915 = guc_to_gt(guc)->i915;
+	struct drm_i915_private *i915 = guc_to_i915(guc);
 
 	if (!log->relay.started)
 		return;
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_rc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_rc.c
index 1adec6de223c..9df7927304ae 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_rc.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_rc.c
@@ -14,7 +14,7 @@ static bool __guc_rc_supported(struct intel_guc *guc)
 {
 	/* GuC RC is unavailable for pre-Gen12 */
 	return guc->submission_supported &&
-		GRAPHICS_VER(guc_to_gt(guc)->i915) >= 12;
+		GRAPHICS_VER(guc_to_i915(guc)) >= 12;
 }
 
 static bool __guc_rc_selected(struct intel_guc *guc)
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
index 2dfb07cc4b33..3e681ab6fbf9 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
@@ -34,7 +34,7 @@ static bool __detect_slpc_supported(struct intel_guc *guc)
 {
 	/* GuC SLPC is unavailable for pre-Gen12 */
 	return guc->submission_supported &&
-		GRAPHICS_VER(guc_to_gt(guc)->i915) >= 12;
+		GRAPHICS_VER(guc_to_i915(guc)) >= 12;
 }
 
 static bool __guc_slpc_selected(struct intel_guc *guc)
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
index 04f8377fd7a3..92fcd4f1c02a 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
@@ -4626,12 +4626,12 @@ static bool __guc_submission_supported(struct intel_guc *guc)
 {
 	/* GuC submission is unavailable for pre-Gen11 */
 	return intel_guc_is_supported(guc) &&
-	       GRAPHICS_VER(guc_to_gt(guc)->i915) >= 11;
+	       GRAPHICS_VER(guc_to_i915(guc)) >= 11;
 }
 
 static bool __guc_submission_selected(struct intel_guc *guc)
 {
-	struct drm_i915_private *i915 = guc_to_gt(guc)->i915;
+	struct drm_i915_private *i915 = guc_to_i915(guc);
 
 	if (!intel_guc_submission_is_supported(guc))
 		return false;
-- 
2.43.0

