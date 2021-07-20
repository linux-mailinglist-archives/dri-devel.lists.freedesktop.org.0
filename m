Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0323B3D02F7
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jul 2021 22:41:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A5B96E55C;
	Tue, 20 Jul 2021 20:40:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23B2B6E49F;
 Tue, 20 Jul 2021 20:40:17 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10051"; a="209421883"
X-IronPort-AV: E=Sophos;i="5.84,256,1620716400"; d="scan'208";a="209421883"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2021 13:40:16 -0700
X-IronPort-AV: E=Sophos;i="5.84,256,1620716400"; d="scan'208";a="414906068"
Received: from dhiatt-server.jf.intel.com ([10.54.81.3])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2021 13:40:15 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Subject: [RFC PATCH 11/42] drm/i915/guc: Take engine PM when a context is
 pinned with GuC submission
Date: Tue, 20 Jul 2021 13:57:31 -0700
Message-Id: <20210720205802.39610-12-matthew.brost@intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210720205802.39610-1-matthew.brost@intel.com>
References: <20210720205802.39610-1-matthew.brost@intel.com>
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
index ab7679957623..29b722ad3f8b 100644
--- a/drivers/gpu/drm/i915/Makefile
+++ b/drivers/gpu/drm/i915/Makefile
@@ -102,6 +102,7 @@ gt-y += \
 	gt/intel_gt_clock_utils.o \
 	gt/intel_gt_irq.o \
 	gt/intel_gt_pm.o \
+	gt/intel_gt_pm_unpark_work.o \
 	gt/intel_gt_pm_irq.o \
 	gt/intel_gt_requests.o \
 	gt/intel_gtt.o \
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
index 2fdfcec3b5fa..8c3332e24d59 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
@@ -2041,7 +2041,12 @@ static int guc_context_pre_pin(struct intel_context *ce,
 
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
@@ -2052,6 +2057,9 @@ static void guc_context_unpin(struct intel_context *ce)
 
 	unpin_guc_id(guc, ce, true);
 	lrc_unpin(ce);
+
+	if (likely(!intel_context_is_barrier(ce)))
+		intel_engine_pm_put(ce->engine);
 }
 
 static void guc_context_post_unpin(struct intel_context *ce)
@@ -2971,8 +2979,30 @@ static int guc_virtual_context_pre_pin(struct intel_context *ce,
 static int guc_virtual_context_pin(struct intel_context *ce, void *vaddr)
 {
 	struct intel_engine_cs *engine = guc_virtual_get_sibling(ce->engine, 0);
+	int ret = __guc_context_pin(ce, engine, vaddr);
+	intel_engine_mask_t tmp, mask = ce->engine->mask;
+
+	if (likely(!ret))
+		for_each_engine_masked(engine, ce->engine->gt, mask, tmp)
+			intel_engine_pm_get(engine);
+
+	return ret;
+}
+
+static void guc_virtual_context_unpin(struct intel_context *ce)
+{
+	intel_engine_mask_t tmp, mask = ce->engine->mask;
+	struct intel_engine_cs *engine;
+	struct intel_guc *guc = ce_to_guc(ce);
 
-	return __guc_context_pin(ce, engine, vaddr);
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
@@ -3009,7 +3039,7 @@ static const struct intel_context_ops virtual_guc_context_ops = {
 
 	.pre_pin = guc_virtual_context_pre_pin,
 	.pin = guc_virtual_context_pin,
-	.unpin = guc_context_unpin,
+	.unpin = guc_virtual_context_unpin,
 	.post_unpin = guc_context_post_unpin,
 
 	.ban = guc_context_ban,
-- 
2.28.0

