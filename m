Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13C4972BFD1
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jun 2023 12:47:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6908410E207;
	Mon, 12 Jun 2023 10:47:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 034D910E1FC;
 Mon, 12 Jun 2023 10:47:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686566834; x=1718102834;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5CzqxR+eK1+VyAwbHzeNfy/O6uP947+6IUq5UcMQAfQ=;
 b=NoMBZ6BwLl/DpYG43VcAt7KRbw44nX8oviHsJz6A1G8WwVTiMTlEAwFe
 Fx8j7qgPft5/Ek6aSMVXaDWfY6DFglz5EeRzTzc28qvyz1YO1prMSDphk
 hd7p8PMZ0fhf1w94FitT4uiZgcMCOl5SPv9iaW18u2pf2WVIOZ2RvDqqr
 9kb9zbIVw5BrZfCAt9WlMeEJ7NzLY2cdleMPKbWFoYz3ukrgVy5TA0vHv
 7dHb3kZKN/7+RhYzm8mhWVIjAzvcMkIuCbqROOzUW/GPpAwwn9AB4qyTi
 JnRoyr3BhI7ae5SOjVReEmAlK83ef+KiyiYi7ix9cBf6/MTVGqkiB3Jvy w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10738"; a="342693252"
X-IronPort-AV: E=Sophos;i="6.00,236,1681196400"; d="scan'208";a="342693252"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2023 03:47:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10738"; a="835439511"
X-IronPort-AV: E=Sophos;i="6.00,236,1681196400"; d="scan'208";a="835439511"
Received: from mcantwex-mobl.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.213.224.167])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2023 03:47:12 -0700
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 4/5] drm/i915: Account ring buffer and context state storage
Date: Mon, 12 Jun 2023 11:46:57 +0100
Message-Id: <20230612104658.1386996-5-tvrtko.ursulin@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230612104658.1386996-1-tvrtko.ursulin@linux.intel.com>
References: <20230612104658.1386996-1-tvrtko.ursulin@linux.intel.com>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Account ring buffers and logical context space against the owning client
memory usage stats.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_context.c |  8 ++++++++
 drivers/gpu/drm/i915/i915_drm_client.c  | 10 ++++++++++
 drivers/gpu/drm/i915/i915_drm_client.h  |  8 ++++++++
 3 files changed, 26 insertions(+)

diff --git a/drivers/gpu/drm/i915/gt/intel_context.c b/drivers/gpu/drm/i915/gt/intel_context.c
index a53b26178f0a..cb6d8e7cdd9d 100644
--- a/drivers/gpu/drm/i915/gt/intel_context.c
+++ b/drivers/gpu/drm/i915/gt/intel_context.c
@@ -6,6 +6,7 @@
 #include "gem/i915_gem_context.h"
 #include "gem/i915_gem_pm.h"
 
+#include "i915_drm_client.h"
 #include "i915_drv.h"
 #include "i915_trace.h"
 
@@ -50,6 +51,7 @@ intel_context_create(struct intel_engine_cs *engine)
 
 int intel_context_alloc_state(struct intel_context *ce)
 {
+	struct i915_gem_context *ctx;
 	int err = 0;
 
 	if (mutex_lock_interruptible(&ce->pin_mutex))
@@ -66,6 +68,12 @@ int intel_context_alloc_state(struct intel_context *ce)
 			goto unlock;
 
 		set_bit(CONTEXT_ALLOC_BIT, &ce->flags);
+
+		rcu_read_lock();
+		ctx = rcu_dereference(ce->gem_context);
+		if (ctx && ctx->file_priv)
+			i915_drm_client_add_context(ctx->file_priv->client, ce);
+		rcu_read_unlock();
 	}
 
 unlock:
diff --git a/drivers/gpu/drm/i915/i915_drm_client.c b/drivers/gpu/drm/i915/i915_drm_client.c
index 3c8d6a46a801..da29d01d1c3d 100644
--- a/drivers/gpu/drm/i915/i915_drm_client.c
+++ b/drivers/gpu/drm/i915/i915_drm_client.c
@@ -142,4 +142,14 @@ void i915_drm_client_remove_object(struct drm_i915_gem_object *obj)
 
 	i915_drm_client_put(client);
 }
+
+void i915_drm_client_add_context(struct i915_drm_client *client,
+				 struct intel_context *ce)
+{
+	if (ce->state)
+		i915_drm_client_add_object(client, ce->state->obj);
+
+	if (ce->ring != ce->engine->legacy.ring && ce->ring->vma)
+		i915_drm_client_add_object(client, ce->ring->vma->obj);
+}
 #endif
diff --git a/drivers/gpu/drm/i915/i915_drm_client.h b/drivers/gpu/drm/i915/i915_drm_client.h
index 5fc897ab1a6b..744e48ed133c 100644
--- a/drivers/gpu/drm/i915/i915_drm_client.h
+++ b/drivers/gpu/drm/i915/i915_drm_client.h
@@ -14,6 +14,7 @@
 
 #include "i915_file_private.h"
 #include "gem/i915_gem_object_types.h"
+#include "gt/intel_context_types.h"
 
 #define I915_LAST_UABI_ENGINE_CLASS I915_ENGINE_CLASS_COMPUTE
 
@@ -72,6 +73,8 @@ void i915_drm_client_fdinfo(struct drm_printer *p, struct drm_file *file);
 void i915_drm_client_add_object(struct i915_drm_client *client,
 				struct drm_i915_gem_object *obj);
 void i915_drm_client_remove_object(struct drm_i915_gem_object *obj);
+void i915_drm_client_add_context(struct i915_drm_client *client,
+				 struct intel_context *ce);
 #else
 static inline void i915_drm_client_add_object(struct i915_drm_client *client,
 					      struct drm_i915_gem_object *obj)
@@ -81,6 +84,11 @@ static inline void i915_drm_client_add_object(struct i915_drm_client *client,
 static inline void i915_drm_client_remove_object(struct drm_i915_gem_object *obj)
 {
 }
+
+static inline void i915_drm_client_add_context(struct i915_drm_client *client,
+					       struct intel_context *ce)
+{
+}
 #endif
 
 #endif /* !__I915_DRM_CLIENT_H__ */
-- 
2.39.2

