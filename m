Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 259577A93F6
	for <lists+dri-devel@lfdr.de>; Thu, 21 Sep 2023 13:49:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3F4A10E5DA;
	Thu, 21 Sep 2023 11:49:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CD2510E5D4;
 Thu, 21 Sep 2023 11:49:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695296943; x=1726832943;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=OMEwk0X8NNrrJfGShu2S3rKH+WcQr9i/VJ2no0E2OfU=;
 b=TMA4OtBIO3hBlC9rxNhAZ/aoK6woZTRm1pXk/fJJsgy8pCQ+jOzN649H
 JQzHvDnWKv/1AJYW4PnA1VbssCzoJwi9bC3PfOzDTkjX9uFAMHP+J5Mdj
 BolZB0ZC3gxkyzEW+Y8RdAZdZVM64CyhyVy5G+ZOht5rax1f4O7sYzJwp
 g0fqEqbh/N5wEuHscrmOlyF0U4ynJCd5537ebHLP5b0Ps1ureXkLLuhHj
 Q/Tu8t6hEoaTVxk+Ilyhp8f5sDxo12R1vgwr6hiS00JCMqebeqk6C0xIj
 D88IZ5G3fnAgJK1FSWH5iGO2FiiMRVJTuASu3lf0ChOH38n6vLaQ/AFM7 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="384336796"
X-IronPort-AV: E=Sophos;i="6.03,165,1694761200"; d="scan'208";a="384336796"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2023 04:49:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="920700893"
X-IronPort-AV: E=Sophos;i="6.03,165,1694761200"; d="scan'208";a="920700893"
Received: from asilke-mobl2.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.213.199.249])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2023 04:49:01 -0700
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 4/5] drm/i915: Account ring buffer and context state storage
Date: Thu, 21 Sep 2023 12:48:51 +0100
Message-Id: <20230921114852.192862-5-tvrtko.ursulin@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230921114852.192862-1-tvrtko.ursulin@linux.intel.com>
References: <20230921114852.192862-1-tvrtko.ursulin@linux.intel.com>
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
Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Account ring buffers and logical context space against the owning client
memory usage stats.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Reviewed-by: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_context.c | 14 ++++++++++++++
 drivers/gpu/drm/i915/i915_drm_client.c  | 10 ++++++++++
 drivers/gpu/drm/i915/i915_drm_client.h  |  9 +++++++++
 3 files changed, 33 insertions(+)

diff --git a/drivers/gpu/drm/i915/gt/intel_context.c b/drivers/gpu/drm/i915/gt/intel_context.c
index a53b26178f0a..a2f1245741bb 100644
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
@@ -66,6 +68,18 @@ int intel_context_alloc_state(struct intel_context *ce)
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
+				i915_drm_client_add_context_objects(ctx->client,
+								    ce);
+			i915_gem_context_put(ctx);
+		}
 	}
 
 unlock:
diff --git a/drivers/gpu/drm/i915/i915_drm_client.c b/drivers/gpu/drm/i915/i915_drm_client.c
index 2e5e69edc0f9..a61356012df8 100644
--- a/drivers/gpu/drm/i915/i915_drm_client.c
+++ b/drivers/gpu/drm/i915/i915_drm_client.c
@@ -144,4 +144,14 @@ bool i915_drm_client_remove_object(struct drm_i915_gem_object *obj)
 
 	return true;
 }
+
+void i915_drm_client_add_context_objects(struct i915_drm_client *client,
+					 struct intel_context *ce)
+{
+	if (ce->state)
+		i915_drm_client_add_object(client, ce->state->obj);
+
+	if (ce->ring != ce->engine->legacy.ring && ce->ring->vma)
+		i915_drm_client_add_object(client, ce->ring->vma->obj);
+}
 #endif
diff --git a/drivers/gpu/drm/i915/i915_drm_client.h b/drivers/gpu/drm/i915/i915_drm_client.h
index 5f58fdf7dcb8..69cedfcd3d69 100644
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
+void i915_drm_client_add_context_objects(struct i915_drm_client *client,
+					 struct intel_context *ce);
 #else
 static inline void i915_drm_client_add_object(struct i915_drm_client *client,
 					      struct drm_i915_gem_object *obj)
@@ -79,6 +82,12 @@ static inline void i915_drm_client_add_object(struct i915_drm_client *client,
 static inline bool i915_drm_client_remove_object(struct drm_i915_gem_object *obj)
 {
 }
+
+static inline void
+i915_drm_client_add_context_objects(struct i915_drm_client *client,
+				    struct intel_context *ce)
+{
+}
 #endif
 
 #endif /* !__I915_DRM_CLIENT_H__ */
-- 
2.39.2

