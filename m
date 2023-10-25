Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6888C7D6EC4
	for <lists+dri-devel@lfdr.de>; Wed, 25 Oct 2023 16:35:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AF8C10E67B;
	Wed, 25 Oct 2023 14:35:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFE6D10E679;
 Wed, 25 Oct 2023 14:35:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698244545; x=1729780545;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=mn4DKq1NV2AMQVJ7wgjkuKOupss04Zkx10edWJ3mnPo=;
 b=S2imAugFyjtTz2Lev21/4kP89/1x9i/B9QCEfBXiPn2Q0Bb6JCUCyqo3
 15aXmVAX/RUk8VaJON2JZ25yB0Z1pyRzUUtRJkHHZ+CV0YV2VG5d7ykO0
 Lmx83L+B9ggdkoK/7M7AWaj4ZdO0MPLYi1uQdyEf3GX5Yy8kASJljowin
 E/Ee3TRRehflb3ufN90AwjFYd+G9czJhsfh4Witg2gYeJC28wsMlFTmrL
 ZQ1+4AT67njjZTP7EAPk9S3kYVn0UhwV/OBkcHaB2lg6fe09uYz4TPHFC
 OPaRJI2Xu4kXdhbb1jBCJBB4eCFk2833+bA1TdRSJHr2hVc2NEPGW4NrL Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="418439890"
X-IronPort-AV: E=Sophos;i="6.03,250,1694761200"; d="scan'208";a="418439890"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2023 07:35:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="762471114"
X-IronPort-AV: E=Sophos;i="6.03,250,1694761200"; d="scan'208";a="762471114"
Received: from marlonpr-mobl1.ger.corp.intel.com (HELO intel.com)
 ([10.252.33.160])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2023 07:35:40 -0700
From: Andi Shyti <andi.shyti@linux.intel.com>
To: John Harrison <John.C.Harrison@Intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Subject: [PATCH v2 1/5] drm/i915/guc: Create the guc_to_i915() wrapper
Date: Wed, 25 Oct 2023 16:35:11 +0200
Message-ID: <20231025143515.254468-2-andi.shyti@linux.intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231025143515.254468-1-andi.shyti@linux.intel.com>
References: <20231025143515.254468-1-andi.shyti@linux.intel.com>
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
index 89e314b3756b..4e147de5118f 100644
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
index d37698bd6b91..669f2892bf74 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
@@ -4624,12 +4624,12 @@ static bool __guc_submission_supported(struct intel_guc *guc)
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
2.42.0

