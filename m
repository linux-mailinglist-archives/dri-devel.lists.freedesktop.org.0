Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D393C3C5BB3
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jul 2021 14:17:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CDDA89C17;
	Mon, 12 Jul 2021 12:17:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8CEB89C17;
 Mon, 12 Jul 2021 12:17:37 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10042"; a="209943848"
X-IronPort-AV: E=Sophos;i="5.84,232,1620716400"; d="scan'208";a="209943848"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jul 2021 05:17:37 -0700
X-IronPort-AV: E=Sophos;i="5.84,232,1620716400"; d="scan'208";a="648236678"
Received: from aaroncar-mobl2.ger.corp.intel.com (HELO tursulin-mobl2.home)
 ([10.213.240.41])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jul 2021 05:17:36 -0700
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Intel-gfx@lists.freedesktop.org
Subject: [PATCH 4/8] drm/i915: Track runtime spent in closed and unreachable
 GEM contexts
Date: Mon, 12 Jul 2021 13:17:15 +0100
Message-Id: <20210712121719.891536-5-tvrtko.ursulin@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210712121719.891536-1-tvrtko.ursulin@linux.intel.com>
References: <20210712121719.891536-1-tvrtko.ursulin@linux.intel.com>
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
Cc: Chris Wilson <chris@chris-wilson.co.uk>,
 Aravind Iddamsetty <aravind.iddamsetty@intel.com>,
 dri-devel@lists.freedesktop.org, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

As contexts are abandoned we want to remember how much GPU time they used
(per class) so later we can used it for smarter purposes.

As GEM contexts are closed we want to have the DRM client remember how
much GPU time they used (per class) so later we can used it for smarter
purposes.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Reviewed-by: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
Reviewed-by: Chris Wilson <chris@chris-wilson.co.uk>
Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
---
 drivers/gpu/drm/i915/gem/i915_gem_context.c | 25 +++++++++++++++++++--
 drivers/gpu/drm/i915/i915_drm_client.h      |  7 ++++++
 2 files changed, 30 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/gem/i915_gem_context.c
index 5a38cb163f04..d0fe05793af7 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
@@ -842,23 +842,44 @@ static void free_engines_rcu(struct rcu_head *rcu)
 	free_engines(engines);
 }
 
+static void accumulate_runtime(struct i915_drm_client *client,
+			       struct i915_gem_engines *engines)
+{
+	struct i915_gem_engines_iter it;
+	struct intel_context *ce;
+
+	if (!client)
+		return;
+
+	/* Transfer accumulated runtime to the parent GEM context. */
+	for_each_gem_engine(ce, engines, it) {
+		unsigned int class = ce->engine->uabi_class;
+
+		GEM_BUG_ON(class >= ARRAY_SIZE(client->past_runtime));
+		atomic64_add(intel_context_get_total_runtime_ns(ce),
+			     &client->past_runtime[class]);
+	}
+}
+
 static int __i915_sw_fence_call
 engines_notify(struct i915_sw_fence *fence, enum i915_sw_fence_notify state)
 {
 	struct i915_gem_engines *engines =
 		container_of(fence, typeof(*engines), fence);
+	struct i915_gem_context *ctx = engines->ctx;
 
 	switch (state) {
 	case FENCE_COMPLETE:
 		if (!list_empty(&engines->link)) {
-			struct i915_gem_context *ctx = engines->ctx;
 			unsigned long flags;
 
 			spin_lock_irqsave(&ctx->stale.lock, flags);
 			list_del(&engines->link);
 			spin_unlock_irqrestore(&ctx->stale.lock, flags);
 		}
-		i915_gem_context_put(engines->ctx);
+		accumulate_runtime(ctx->client, engines);
+		i915_gem_context_put(ctx);
+
 		break;
 
 	case FENCE_FREE:
diff --git a/drivers/gpu/drm/i915/i915_drm_client.h b/drivers/gpu/drm/i915/i915_drm_client.h
index 6d55f77a08f1..db82180f5859 100644
--- a/drivers/gpu/drm/i915/i915_drm_client.h
+++ b/drivers/gpu/drm/i915/i915_drm_client.h
@@ -13,6 +13,8 @@
 #include <linux/sched.h>
 #include <linux/xarray.h>
 
+#include "gt/intel_engine_types.h"
+
 struct drm_i915_private;
 
 struct i915_drm_clients {
@@ -41,6 +43,11 @@ struct i915_drm_client {
 	bool closed;
 
 	struct i915_drm_clients *clients;
+
+	/**
+	 * @past_runtime: Accumulation of pphwsp runtimes from closed contexts.
+	 */
+	atomic64_t past_runtime[MAX_ENGINE_CLASS + 1];
 };
 
 void i915_drm_clients_init(struct i915_drm_clients *clients,
-- 
2.30.2

