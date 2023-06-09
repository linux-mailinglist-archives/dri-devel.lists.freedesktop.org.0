Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DECD72993D
	for <lists+dri-devel@lfdr.de>; Fri,  9 Jun 2023 14:12:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6537F10E6AB;
	Fri,  9 Jun 2023 12:12:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9BD210E6AB;
 Fri,  9 Jun 2023 12:11:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686312719; x=1717848719;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=u16cA1catl/aRkwsypx6kmoePe8SsYbgiNfEw7q+5LE=;
 b=DlXKHpC41pPEDuIQ4XJE0WqYk0e5GSEYSNook8bHW/txhQkveR43RI0E
 bOArSCQC2ts4r9mFYv+//bIQDC1pDaoGjByNL4hGnSYyvxPTOC4cKAwVO
 5Kj5eP/7+XNjecKfDOyRYhJOJeMTu7ny9hY743eMKebvOfDhzRod2TQFO
 7bRQl4ddu4cn87LlnG2RZ9tSRbdBVOAksQzQEq3ddcDRrJgEALcW5QK/m
 hZ1zJtRYq2I/kfuks6jlaz1tGUp3tJ3oKAsF7qWhdabiWkY/h0I4ClkbG
 IV5z/TXk7osjqUF9tiaQzZ0b6y/XeqiYTlw3ulne+m1ZoVVAla67ZIVJ5 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10735"; a="356474755"
X-IronPort-AV: E=Sophos;i="6.00,229,1681196400"; d="scan'208";a="356474755"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2023 05:11:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10735"; a="740150883"
X-IronPort-AV: E=Sophos;i="6.00,229,1681196400"; d="scan'208";a="740150883"
Received: from pjdillon-mobl1.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.213.210.241])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2023 05:11:58 -0700
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 5/8] drm/i915: Account ring buffer and context state storage
Date: Fri,  9 Jun 2023 13:11:40 +0100
Message-Id: <20230609121143.1232420-6-tvrtko.ursulin@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230609121143.1232420-1-tvrtko.ursulin@linux.intel.com>
References: <20230609121143.1232420-1-tvrtko.ursulin@linux.intel.com>
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
 drivers/gpu/drm/i915/gem/i915_gem_context.c |  6 ++++++
 drivers/gpu/drm/i915/i915_drm_client.c      | 10 ++++++++++
 drivers/gpu/drm/i915/i915_drm_client.h      |  9 +++++++++
 3 files changed, 25 insertions(+)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/gem/i915_gem_context.c
index 35cf6608180e..3f4c74aed3c5 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
@@ -1703,6 +1703,8 @@ static void gem_context_register(struct i915_gem_context *ctx,
 				 u32 id)
 {
 	struct drm_i915_private *i915 = ctx->i915;
+	struct i915_gem_engines_iter it;
+	struct intel_context *ce;
 	void *old;
 
 	ctx->file_priv = fpriv;
@@ -1721,6 +1723,10 @@ static void gem_context_register(struct i915_gem_context *ctx,
 	list_add_tail(&ctx->link, &i915->gem.contexts.list);
 	spin_unlock(&i915->gem.contexts.lock);
 
+	for_each_gem_engine(ce, i915_gem_context_lock_engines(ctx), it)
+		i915_drm_client_add_context(fpriv->client, ce);
+	i915_gem_context_unlock_engines(ctx);
+
 	/* And finally expose ourselves to userspace via the idr */
 	old = xa_store(&fpriv->context_xa, id, ctx, GFP_KERNEL);
 	WARN_ON(old);
diff --git a/drivers/gpu/drm/i915/i915_drm_client.c b/drivers/gpu/drm/i915/i915_drm_client.c
index b0b35bcdd2b3..31316edbf30b 100644
--- a/drivers/gpu/drm/i915/i915_drm_client.c
+++ b/drivers/gpu/drm/i915/i915_drm_client.c
@@ -145,4 +145,14 @@ void i915_drm_client_remove_object(struct drm_i915_gem_object *obj)
 
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
index dfeaaf204c00..e1e2a7cca1b1 100644
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
@@ -82,6 +85,12 @@ static inline void i915_drm_client_add_object(struct i915_drm_client *client,
 static inline void i915_drm_client_remove_object(struct drm_i915_gem_object *obj)
 {
 
+}
+
+static inline void i915_drm_client_add_context(struct i915_drm_client *client,
+					       struct intel_context *ce)
+{
+
 }
 #endif
 
-- 
2.39.2

