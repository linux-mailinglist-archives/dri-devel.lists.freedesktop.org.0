Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C9E5B42CC63
	for <lists+dri-devel@lfdr.de>; Wed, 13 Oct 2021 22:57:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A4AE6EBA2;
	Wed, 13 Oct 2021 20:56:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 298066EB8F;
 Wed, 13 Oct 2021 20:56:11 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10136"; a="207649426"
X-IronPort-AV: E=Sophos;i="5.85,371,1624345200"; d="scan'208";a="207649426"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2021 13:47:21 -0700
X-IronPort-AV: E=Sophos;i="5.85,371,1624345200"; d="scan'208";a="524782731"
Received: from jons-linux-dev-box.fm.intel.com ([10.1.27.20])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2021 13:47:20 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Cc: <john.c.harrison@intel.com>
Subject: [PATCH 11/25] drm/i915/guc: Implement parallel context pin / unpin
 functions
Date: Wed, 13 Oct 2021 13:42:17 -0700
Message-Id: <20211013204231.19287-12-matthew.brost@intel.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211013204231.19287-1-matthew.brost@intel.com>
References: <20211013204231.19287-1-matthew.brost@intel.com>
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

Parallel contexts are perma-pinned by the upper layers which makes the
backend implementation rather simple. The parent pins the guc_id and
children increment the parent's pin count on pin to ensure all the
contexts are unpinned before we disable scheduling with the GuC / or
deregister the context.

v2:
 (Daniel Vetter)
  - Perma-pin parallel contexts

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 70 +++++++++++++++++++
 1 file changed, 70 insertions(+)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
index c4d7a5c3b558..9fc40e3c1794 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
@@ -2585,6 +2585,76 @@ static const struct intel_context_ops virtual_guc_context_ops = {
 	.get_sibling = guc_virtual_get_sibling,
 };
 
+/* Future patches will use this function */
+__maybe_unused
+static int guc_parent_context_pin(struct intel_context *ce, void *vaddr)
+{
+	struct intel_engine_cs *engine = guc_virtual_get_sibling(ce->engine, 0);
+	struct intel_guc *guc = ce_to_guc(ce);
+	int ret;
+
+	GEM_BUG_ON(!intel_context_is_parent(ce));
+	GEM_BUG_ON(!intel_engine_is_virtual(ce->engine));
+
+	ret = pin_guc_id(guc, ce);
+	if (unlikely(ret < 0))
+		return ret;
+
+	return __guc_context_pin(ce, engine, vaddr);
+}
+
+/* Future patches will use this function */
+__maybe_unused
+static int guc_child_context_pin(struct intel_context *ce, void *vaddr)
+{
+	struct intel_engine_cs *engine = guc_virtual_get_sibling(ce->engine, 0);
+
+	GEM_BUG_ON(!intel_context_is_child(ce));
+	GEM_BUG_ON(!intel_engine_is_virtual(ce->engine));
+
+	__intel_context_pin(ce->parallel.parent);
+	return __guc_context_pin(ce, engine, vaddr);
+}
+
+/* Future patches will use this function */
+__maybe_unused
+static void guc_parent_context_unpin(struct intel_context *ce)
+{
+	struct intel_guc *guc = ce_to_guc(ce);
+
+	GEM_BUG_ON(context_enabled(ce));
+	GEM_BUG_ON(intel_context_is_barrier(ce));
+	GEM_BUG_ON(!intel_context_is_parent(ce));
+	GEM_BUG_ON(!intel_engine_is_virtual(ce->engine));
+
+	unpin_guc_id(guc, ce);
+	lrc_unpin(ce);
+}
+
+/* Future patches will use this function */
+__maybe_unused
+static void guc_child_context_unpin(struct intel_context *ce)
+{
+	GEM_BUG_ON(context_enabled(ce));
+	GEM_BUG_ON(intel_context_is_barrier(ce));
+	GEM_BUG_ON(!intel_context_is_child(ce));
+	GEM_BUG_ON(!intel_engine_is_virtual(ce->engine));
+
+	lrc_unpin(ce);
+}
+
+/* Future patches will use this function */
+__maybe_unused
+static void guc_child_context_post_unpin(struct intel_context *ce)
+{
+	GEM_BUG_ON(!intel_context_is_child(ce));
+	GEM_BUG_ON(!intel_context_is_pinned(ce->parallel.parent));
+	GEM_BUG_ON(!intel_engine_is_virtual(ce->engine));
+
+	lrc_post_unpin(ce);
+	intel_context_unpin(ce->parallel.parent);
+}
+
 static bool
 guc_irq_enable_breadcrumbs(struct intel_breadcrumbs *b)
 {
-- 
2.32.0

