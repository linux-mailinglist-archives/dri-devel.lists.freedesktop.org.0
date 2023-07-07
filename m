Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1666E74B16E
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jul 2023 15:03:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D7F610E591;
	Fri,  7 Jul 2023 13:02:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D512B10E588;
 Fri,  7 Jul 2023 13:02:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1688734961; x=1720270961;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Elfgl2YQ+qDbupbwkRCXZz2cfEudJZs2nodYRefKpsE=;
 b=EgK8FwHPccYMmvQIguHAo85ft0aZYwAqRv/c7ikDbPKVJYbXLMcYhkXh
 /N5RECoX9TdLX2uQ2YE0ImIkUsZgslqGMsGXl3bE0QivWOfXbagwbc0pY
 XqU2EMVw4AXhSfhMPHnspybhkfaovJFwV2dvPo8beIdWSl3RVti5SJADT
 Rq6b/auQpTfDbNeiRAYi2WJcJDsIhYIkPGEenTglXnU8FlvSykCT224s9
 yN7ZnEEWOJHImT6qtE7Ox0aEKBp84Ens51vYoGPxrnhpdzQTd1OvjRyan
 1POezya1QbcAZANLzjYGddhN5yjnT3iFwYRCFNtQGytUQ9TEHpKYH1GbL Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10764"; a="427570734"
X-IronPort-AV: E=Sophos;i="6.01,187,1684825200"; d="scan'208";a="427570734"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2023 06:02:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10764"; a="1050535678"
X-IronPort-AV: E=Sophos;i="6.01,187,1684825200"; d="scan'208";a="1050535678"
Received: from gjmurphy-mobl.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.213.202.50])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2023 06:02:29 -0700
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 4/5] drm/i915: Account ring buffer and context state storage
Date: Fri,  7 Jul 2023 14:02:19 +0100
Message-Id: <20230707130220.3966836-5-tvrtko.ursulin@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230707130220.3966836-1-tvrtko.ursulin@linux.intel.com>
References: <20230707130220.3966836-1-tvrtko.ursulin@linux.intel.com>
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
 drivers/gpu/drm/i915/gt/intel_context.c | 13 +++++++++++++
 drivers/gpu/drm/i915/i915_drm_client.c  | 10 ++++++++++
 drivers/gpu/drm/i915/i915_drm_client.h  |  8 ++++++++
 3 files changed, 31 insertions(+)

diff --git a/drivers/gpu/drm/i915/gt/intel_context.c b/drivers/gpu/drm/i915/gt/intel_context.c
index a53b26178f0a..8a395b9201e9 100644
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
@@ -66,6 +68,17 @@ int intel_context_alloc_state(struct intel_context *ce)
 			goto unlock;
 
 		set_bit(CONTEXT_ALLOC_BIT, &ce->flags);
+
+		rcu_read_lock();
+		ctx = rcu_dereference(ce->gem_context);
+		if (ctx && !kref_get_unless_zero(&ctx->ref))
+			ctx = NULL;
+		rcu_read_unlock();
+		if (ctx) {
+			if (ctx->client)
+				i915_drm_client_add_context(ctx->client, ce);
+			i915_gem_context_put(ctx);
+		}
 	}
 
 unlock:
diff --git a/drivers/gpu/drm/i915/i915_drm_client.c b/drivers/gpu/drm/i915/i915_drm_client.c
index 2e5e69edc0f9..ffccb6239789 100644
--- a/drivers/gpu/drm/i915/i915_drm_client.c
+++ b/drivers/gpu/drm/i915/i915_drm_client.c
@@ -144,4 +144,14 @@ bool i915_drm_client_remove_object(struct drm_i915_gem_object *obj)
 
 	return true;
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
index 5f58fdf7dcb8..39616b10a51f 100644
--- a/drivers/gpu/drm/i915/i915_drm_client.h
+++ b/drivers/gpu/drm/i915/i915_drm_client.h
@@ -14,6 +14,7 @@
 
 #include "i915_file_private.h"
 #include "gem/i915_gem_object_types.h"
+#include "gt/intel_context_types.h"
 
 #define I915_LAST_UABI_ENGINE_CLASS I915_ENGINE_CLASS_COMPUTE
 
@@ -70,6 +71,8 @@ void i915_drm_client_fdinfo(struct drm_printer *p, struct drm_file *file);
 void i915_drm_client_add_object(struct i915_drm_client *client,
 				struct drm_i915_gem_object *obj);
 bool i915_drm_client_remove_object(struct drm_i915_gem_object *obj);
+void i915_drm_client_add_context(struct i915_drm_client *client,
+				 struct intel_context *ce);
 #else
 static inline void i915_drm_client_add_object(struct i915_drm_client *client,
 					      struct drm_i915_gem_object *obj)
@@ -79,6 +82,11 @@ static inline void i915_drm_client_add_object(struct i915_drm_client *client,
 static inline bool i915_drm_client_remove_object(struct drm_i915_gem_object *obj)
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

