Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D679D4EEF3A
	for <lists+dri-devel@lfdr.de>; Fri,  1 Apr 2022 16:22:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B493C10E3C8;
	Fri,  1 Apr 2022 14:22:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF54F10E3C8;
 Fri,  1 Apr 2022 14:22:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648822937; x=1680358937;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=g2OF5FniwJfXNSIAPNOzdPtL7jRPUucdFsSUQ4Oy/xQ=;
 b=lO0bQEGy03yWegIAkp7DsyW1nhlDgTBfpTKjZHJ/Y/2aH1DKoxGdepSy
 U+/ynefyW8FUo4vWY33XybVJjTr54WIAu2UYalydTLNU0h1XucAcoOuxA
 UUXV0DK1fV5+gtIfQ9Yp+Xf4qkHHxAP9gNYQttZo7k0uo1L2/Hyxoz2XB
 dj4hUG3ofyCy+A0QpFjguaeox9NkaOcZ2J1Pi2vtLJGP/IqitcUY+Hgpj
 DpQWIat/9W3/aJsgVFbWJI/1WXukUTYRWor3BUi/LeE4AYKZF3pbBly7/
 RdGL9klV4Kjv8E7ahc/EwtKjkMSUkZ6kUeehvGZiivFVbeLsiRBQjXgl9 w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10304"; a="240085452"
X-IronPort-AV: E=Sophos;i="5.90,227,1643702400"; d="scan'208";a="240085452"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2022 07:22:17 -0700
X-IronPort-AV: E=Sophos;i="5.90,227,1643702400"; d="scan'208";a="655753525"
Received: from ewanhaye-mobl.ger.corp.intel.com (HELO tursulin-mobl2.home)
 ([10.213.217.32])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2022 07:22:16 -0700
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Intel-gfx@lists.freedesktop.org
Subject: [CI 4/8] drm/i915: Track all user contexts per client
Date: Fri,  1 Apr 2022 15:22:01 +0100
Message-Id: <20220401142205.3123159-5-tvrtko.ursulin@linux.intel.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220401142205.3123159-1-tvrtko.ursulin@linux.intel.com>
References: <20220401142205.3123159-1-tvrtko.ursulin@linux.intel.com>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

We soon want to start answering questions like how much GPU time is the
context belonging to a client which exited still using.

To enable this we start tracking all context belonging to a client on a
separate list.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Reviewed-by: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
Reviewed-by: Chris Wilson <chris@chris-wilson.co.uk>
Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_context.c       | 13 +++++++++++++
 drivers/gpu/drm/i915/gem/i915_gem_context_types.h |  3 +++
 drivers/gpu/drm/i915/i915_drm_client.c            |  2 ++
 drivers/gpu/drm/i915/i915_drm_client.h            |  5 +++++
 4 files changed, 23 insertions(+)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/gem/i915_gem_context.c
index 50cc87b0cf97..92652528b7f9 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
@@ -1491,6 +1491,8 @@ static void set_closed_name(struct i915_gem_context *ctx)
 
 static void context_close(struct i915_gem_context *ctx)
 {
+	struct i915_drm_client *client;
+
 	/* Flush any concurrent set_engines() */
 	mutex_lock(&ctx->engines_mutex);
 	unpin_engines(__context_engines_static(ctx));
@@ -1515,6 +1517,13 @@ static void context_close(struct i915_gem_context *ctx)
 	list_del(&ctx->link);
 	spin_unlock(&ctx->i915->gem.contexts.lock);
 
+	client = ctx->client;
+	if (client) {
+		spin_lock(&client->ctx_lock);
+		list_del_rcu(&ctx->client_link);
+		spin_unlock(&client->ctx_lock);
+	}
+
 	mutex_unlock(&ctx->mutex);
 
 	/*
@@ -1696,6 +1705,10 @@ static void gem_context_register(struct i915_gem_context *ctx,
 	old = xa_store(&fpriv->context_xa, id, ctx, GFP_KERNEL);
 	WARN_ON(old);
 
+	spin_lock(&ctx->client->ctx_lock);
+	list_add_tail_rcu(&ctx->client_link, &ctx->client->ctx_list);
+	spin_unlock(&ctx->client->ctx_lock);
+
 	spin_lock(&i915->gem.contexts.lock);
 	list_add_tail(&ctx->link, &i915->gem.contexts.list);
 	spin_unlock(&i915->gem.contexts.lock);
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context_types.h b/drivers/gpu/drm/i915/gem/i915_gem_context_types.h
index 93d24f189ba9..5946dcb11cf5 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_context_types.h
+++ b/drivers/gpu/drm/i915/gem/i915_gem_context_types.h
@@ -296,6 +296,9 @@ struct i915_gem_context {
 	/** @client: struct i915_drm_client */
 	struct i915_drm_client *client;
 
+	/** link: &drm_client.context_list */
+	struct list_head client_link;
+
 	/**
 	 * @ref: reference count
 	 *
diff --git a/drivers/gpu/drm/i915/i915_drm_client.c b/drivers/gpu/drm/i915/i915_drm_client.c
index e61e9ba15256..91a8559bebf7 100644
--- a/drivers/gpu/drm/i915/i915_drm_client.c
+++ b/drivers/gpu/drm/i915/i915_drm_client.c
@@ -38,6 +38,8 @@ struct i915_drm_client *i915_drm_client_add(struct i915_drm_clients *clients)
 		goto err;
 
 	kref_init(&client->kref);
+	spin_lock_init(&client->ctx_lock);
+	INIT_LIST_HEAD(&client->ctx_list);
 	client->clients = clients;
 
 	return client;
diff --git a/drivers/gpu/drm/i915/i915_drm_client.h b/drivers/gpu/drm/i915/i915_drm_client.h
index cbc3161ab021..191368386ace 100644
--- a/drivers/gpu/drm/i915/i915_drm_client.h
+++ b/drivers/gpu/drm/i915/i915_drm_client.h
@@ -7,6 +7,8 @@
 #define __I915_DRM_CLIENT_H__
 
 #include <linux/kref.h>
+#include <linux/list.h>
+#include <linux/spinlock.h>
 #include <linux/xarray.h>
 
 #include "gt/intel_engine_types.h"
@@ -27,6 +29,9 @@ struct i915_drm_client {
 
 	unsigned int id;
 
+	spinlock_t ctx_lock; /* For add/remove from ctx_list. */
+	struct list_head ctx_list; /* List of contexts belonging to client. */
+
 	struct i915_drm_clients *clients;
 
 	/**
-- 
2.32.0

