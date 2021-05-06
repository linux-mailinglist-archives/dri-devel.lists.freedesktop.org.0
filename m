Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 54036375B1C
	for <lists+dri-devel@lfdr.de>; Thu,  6 May 2021 21:00:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 934A86ED8D;
	Thu,  6 May 2021 18:57:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 408136EDAB;
 Thu,  6 May 2021 18:57:15 +0000 (UTC)
IronPort-SDR: /WMwd+sS/pwt3tv8IYb/AuvQgEAnasw/zfaVT5/cgsZt8bPhLvOwMB5vfZ+QH1RnCgOToKVZKl
 hBad0JkdejRA==
X-IronPort-AV: E=McAfee;i="6200,9189,9976"; a="196531040"
X-IronPort-AV: E=Sophos;i="5.82,278,1613462400"; d="scan'208";a="196531040"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2021 11:57:14 -0700
IronPort-SDR: 5ERkbM0Xg7LlPGMPtCwpYdkBJXJa1/DRLkbS8kBzAzIL+E6TeiPcZUoLFMYrB9eBbNeLF5X3aB
 Q1oq4RS3cgqw==
X-IronPort-AV: E=Sophos;i="5.82,278,1613462400"; d="scan'208";a="469583667"
Received: from dhiatt-server.jf.intel.com ([10.54.81.3])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2021 11:57:14 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Subject: [RFC PATCH 93/97] drm/i915/guc: Take engine PM when a context is
 pinned with GuC submission
Date: Thu,  6 May 2021 12:14:47 -0700
Message-Id: <20210506191451.77768-94-matthew.brost@intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210506191451.77768-1-matthew.brost@intel.com>
References: <20210506191451.77768-1-matthew.brost@intel.com>
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
Cc: matthew.brost@intel.com, tvrtko.ursulin@intel.com,
 daniele.ceraolospurio@intel.com, jason.ekstrand@intel.com,
 jon.bloomfield@intel.com, daniel.vetter@intel.com, john.c.harrison@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Taking a PM reference to prevent intel_gt_wait_for_idle from short
circuiting while a scheduling of user context could be enabled.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 36 +++++++++++++++++--
 1 file changed, 33 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
index 25c77084c3a0..dd4baaad679f 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
@@ -2026,7 +2026,12 @@ static int guc_context_pre_pin(struct intel_context *ce,
 
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
@@ -2037,6 +2042,9 @@ static void guc_context_unpin(struct intel_context *ce)
 
 	unpin_guc_id(guc, ce, true);
 	lrc_unpin(ce);
+
+	if (likely(!intel_context_is_barrier(ce)))
+		intel_engine_pm_put(ce->engine);
 }
 
 static void guc_context_post_unpin(struct intel_context *ce)
@@ -2922,8 +2930,30 @@ static int guc_virtual_context_pre_pin(struct intel_context *ce,
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
@@ -2972,7 +3002,7 @@ static const struct intel_context_ops virtual_guc_context_ops = {
 
 	.pre_pin = guc_virtual_context_pre_pin,
 	.pin = guc_virtual_context_pin,
-	.unpin = guc_context_unpin,
+	.unpin = guc_virtual_context_unpin,
 	.post_unpin = guc_context_post_unpin,
 
 	.ban = guc_context_ban,
-- 
2.28.0

