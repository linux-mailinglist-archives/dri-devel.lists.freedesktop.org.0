Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ABA67BABDA
	for <lists+dri-devel@lfdr.de>; Thu,  5 Oct 2023 23:16:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A04310E49C;
	Thu,  5 Oct 2023 21:16:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 808CF10E409;
 Thu,  5 Oct 2023 21:16:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696540608; x=1728076608;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=FAkN7O4m38Ls2XkJ7xlrrvbzamnKqkvckJewNIJTidU=;
 b=NeojmrUsvWjjdMojAae6r1zeK63g7BnxcEuJ/PoZHdB1WMaPk28rzEor
 d5/HEeHIgdPY/59Y5sizyh4uYciosGsoDX5iBV7LGL0tEDcmbiweEfhvH
 S6YTcDaO5o/Jzbq4ZCEFaIEMbDacoobbxEbYa8/y3vDWsoBdAm7GCPASb
 lMTXhlBGGzlweBjGhkMmRpQIdRWBQorzEU6vtXVQJCj++KjTKaz9Dj3PI
 jNOcRZsJUGYzvV5nG4/Qw2ontZVYKCVS56hE4PfFe8STLzb22cX/P4syR
 uXE9YDw7rXhlJ6+Nrt0UQEzjg6bUA5eJkAqOD7wEkcNm2s4339u6RnrHV Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="368698074"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; d="scan'208";a="368698074"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2023 14:16:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="868093730"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; d="scan'208";a="868093730"
Received: from cchew3-mobl.gar.corp.intel.com (HELO intel.com)
 ([10.213.41.249])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2023 14:16:44 -0700
From: Andi Shyti <andi.shyti@linux.intel.com>
To: John Harrison <John.C.Harrison@Intel.com>
Subject: [PATCH] drm/i915/guc: Create the guc_to_i915() wrapper
Date: Thu,  5 Oct 2023 23:16:26 +0200
Message-Id: <20231005211626.778227-1-andi.shyti@linux.intel.com>
X-Mailer: git-send-email 2.40.1
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
---
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
index 970bedf6b78a..12a638f05d63 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt.h
+++ b/drivers/gpu/drm/i915/gt/intel_gt.h
@@ -114,6 +114,11 @@ static inline struct intel_gt *gsc_to_gt(struct intel_gsc *gsc)
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
index 27df41c53b89..db3ecbcd78c5 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
@@ -324,7 +324,7 @@ static u32 guc_ctl_wa_flags(struct intel_guc *guc)
 
 static u32 guc_ctl_devid(struct intel_guc *guc)
 {
-	struct drm_i915_private *i915 = guc_to_gt(guc)->i915;
+	struct drm_i915_private *i915 = guc_to_i915(guc);
 
 	return (INTEL_DEVID(i915) << 16) | INTEL_REVID(i915);
 }
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_capture.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_capture.c
index 331cec07c125..8cfc93d5d27d 100644
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
index 6e22af31513a..2d108a33b4e0 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
@@ -238,7 +238,7 @@ int intel_guc_ct_init(struct intel_guc_ct *ct)
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
index 2cce5ec1ff00..2e6576bcfc14 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
@@ -4543,12 +4543,12 @@ static bool __guc_submission_supported(struct intel_guc *guc)
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
2.40.1

