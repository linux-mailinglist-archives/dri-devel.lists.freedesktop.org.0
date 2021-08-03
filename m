Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 694AA3DF760
	for <lists+dri-devel@lfdr.de>; Wed,  4 Aug 2021 00:12:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4F896E16D;
	Tue,  3 Aug 2021 22:11:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E1A46E167;
 Tue,  3 Aug 2021 22:11:55 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10065"; a="235745898"
X-IronPort-AV: E=Sophos;i="5.84,292,1620716400"; d="scan'208";a="235745898"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Aug 2021 15:11:53 -0700
X-IronPort-AV: E=Sophos;i="5.84,292,1620716400"; d="scan'208";a="511512703"
Received: from dhiatt-server.jf.intel.com ([10.54.81.3])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Aug 2021 15:11:53 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Subject: [PATCH 10/46] drm/i915/guc: Take engine PM when a context is pinned
 with GuC submission
Date: Tue,  3 Aug 2021 15:29:07 -0700
Message-Id: <20210803222943.27686-11-matthew.brost@intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210803222943.27686-1-matthew.brost@intel.com>
References: <20210803222943.27686-1-matthew.brost@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Taking a PM reference to prevent intel_gt_wait_for_idle from short
circuiting while a scheduling of user context could be enabled.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/i915/Makefile                 |  1 +
 .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 36 +++++++++++++++++--
 2 files changed, 34 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
index 903de270f2db..5e3a1e2095b0 100644
--- a/drivers/gpu/drm/i915/Makefile
+++ b/drivers/gpu/drm/i915/Makefile
@@ -103,6 +103,7 @@ gt-y += \
 	gt/intel_gt_clock_utils.o \
 	gt/intel_gt_irq.o \
 	gt/intel_gt_pm.o \
+	gt/intel_gt_pm_unpark_work.o \
 	gt/intel_gt_pm_irq.o \
 	gt/intel_gt_requests.o \
 	gt/intel_gtt.o \
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
index 7fe4d1559a81..c5d9548bfd00 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
@@ -2056,7 +2056,12 @@ static int guc_context_pre_pin(struct intel_context *ce,
 
 static int guc_context_pin(struct intel_context *ce, void *vaddr)
 {
-	return __guc_context_pin(ce, ce->engine, vaddr);
+	int ret = __guc_context_pin(ce, ce->engine, vaddr);
+
+	if (likely(!ret && !intel_context_is_barrier(ce)))
+		intel_engine_pm_get(ce->engine);
+
+	return ret;
 }
 
 static void guc_context_unpin(struct intel_context *ce)
@@ -2067,6 +2072,9 @@ static void guc_context_unpin(struct intel_context *ce)
 
 	unpin_guc_id(guc, ce, true);
 	lrc_unpin(ce);
+
+	if (likely(!intel_context_is_barrier(ce)))
+		intel_engine_pm_put(ce->engine);
 }
 
 static void guc_context_post_unpin(struct intel_context *ce)
@@ -3002,8 +3010,30 @@ static int guc_virtual_context_pre_pin(struct intel_context *ce,
 static int guc_virtual_context_pin(struct intel_context *ce, void *vaddr)
 {
 	struct intel_engine_cs *engine = guc_virtual_get_sibling(ce->engine, 0);
+	int ret = __guc_context_pin(ce, engine, vaddr);
+	intel_engine_mask_t tmp, mask = ce->engine->mask;
+
+	if (likely(!ret))
+		for_each_engine_masked(engine, ce->engine->gt, mask, tmp)
+			intel_engine_pm_get(engine);
 
-	return __guc_context_pin(ce, engine, vaddr);
+	return ret;
+}
+
+static void guc_virtual_context_unpin(struct intel_context *ce)
+{
+	intel_engine_mask_t tmp, mask = ce->engine->mask;
+	struct intel_engine_cs *engine;
+	struct intel_guc *guc = ce_to_guc(ce);
+
+	GEM_BUG_ON(context_enabled(ce));
+	GEM_BUG_ON(intel_context_is_barrier(ce));
+
+	unpin_guc_id(guc, ce, true);
+	lrc_unpin(ce);
+
+	for_each_engine_masked(engine, ce->engine->gt, mask, tmp)
+		intel_engine_pm_put(engine);
 }
 
 static void guc_virtual_context_enter(struct intel_context *ce)
@@ -3040,7 +3070,7 @@ static const struct intel_context_ops virtual_guc_context_ops = {
 
 	.pre_pin = guc_virtual_context_pre_pin,
 	.pin = guc_virtual_context_pin,
-	.unpin = guc_context_unpin,
+	.unpin = guc_virtual_context_unpin,
 	.post_unpin = guc_context_post_unpin,
 
 	.ban = guc_context_ban,
-- 
2.28.0

