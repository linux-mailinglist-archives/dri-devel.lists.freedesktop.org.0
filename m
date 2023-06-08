Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A382728313
	for <lists+dri-devel@lfdr.de>; Thu,  8 Jun 2023 16:52:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6B4F10E5DD;
	Thu,  8 Jun 2023 14:51:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F24AF10E049;
 Thu,  8 Jun 2023 14:51:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686235907; x=1717771907;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=HcgGUpI0tVSxvBcGkkaGuHAl6ROkYc89poNElXA2Jdk=;
 b=HH7/cEBqhEcMY/uQXnrWe1YQbJ66aU6Z91GZ07Dt9hod+fvXqxglJJoF
 jqKd6mktaDKxmkgm9SPjsrfRNJXzxdEklIDowf/X2UGUrUWe8QCjax2aR
 cYjzx0w6HwvfK8QKYre2aBaxyZge2h35gMHMrW8apLZccJZky+8hIZZ0G
 0sf4bBXwv8cgycWpBOH7GkHKNYmXEdTtJkwn5ayAPAeINUGAm4Fi1MK4t
 7LIiCPne7iMsXl+ZisIwpOC2t6L0MX25GSgVdxbM3u5eYp0D84fMQ4XIF
 gWKu42/dMACDEZ45esA9aXJFZnVIRIhTGhIaXQP1qaXt3G1KnfrgntXF+ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10735"; a="336957604"
X-IronPort-AV: E=Sophos;i="6.00,227,1681196400"; d="scan'208";a="336957604"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2023 07:51:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10735"; a="704134536"
X-IronPort-AV: E=Sophos;i="6.00,227,1681196400"; d="scan'208";a="704134536"
Received: from rirwin-mobl3.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.213.239.227])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2023 07:51:46 -0700
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 4/5] drm/i915: Account ring buffer and context state storage
Date: Thu,  8 Jun 2023 15:51:32 +0100
Message-Id: <20230608145133.1059554-5-tvrtko.ursulin@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230608145133.1059554-1-tvrtko.ursulin@linux.intel.com>
References: <20230608145133.1059554-1-tvrtko.ursulin@linux.intel.com>
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
index 4cacca568375..777930f4995f 100644
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
index 0db68b4d7a4f..a5c29a105af3 100644
--- a/drivers/gpu/drm/i915/i915_drm_client.h
+++ b/drivers/gpu/drm/i915/i915_drm_client.h
@@ -15,6 +15,7 @@
 
 #include "i915_file_private.h"
 #include "gem/i915_gem_object_types.h"
+#include "gt/intel_context_types.h"
 
 #define I915_LAST_UABI_ENGINE_CLASS I915_ENGINE_CLASS_COMPUTE
 
@@ -73,6 +74,8 @@ void i915_drm_client_fdinfo(struct drm_printer *p, struct drm_file *file);
 void i915_drm_client_add_object(struct i915_drm_client *client,
 				struct drm_i915_gem_object *obj);
 void i915_drm_client_remove_object(struct drm_i915_gem_object *obj);
+void i915_drm_client_add_context(struct i915_drm_client *client,
+				 struct intel_context *ce);
 #else
 static inline void i915_drm_client_add_object(struct i915_drm_client *client,
 					      struct drm_i915_gem_object *obj)
@@ -83,6 +86,12 @@ static inline void i915_drm_client_add_object(struct i915_drm_client *client,
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

