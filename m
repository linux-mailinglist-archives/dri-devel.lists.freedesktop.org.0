Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C5194EDB6C
	for <lists+dri-devel@lfdr.de>; Thu, 31 Mar 2022 16:09:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 621AE10EC08;
	Thu, 31 Mar 2022 14:09:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2515810E732;
 Thu, 31 Mar 2022 14:09:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648735772; x=1680271772;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=g2OF5FniwJfXNSIAPNOzdPtL7jRPUucdFsSUQ4Oy/xQ=;
 b=UeK9lYdVxbSrQPIat3Dqbq3SYNODTnK8X9yNSC7K+aiW4QcPO6voB+yi
 2UjSRW1+wwDlSd1V8bDJnA/PDj4gMJ8fyWUVNr+aqpFaMrJvpBBqPZfhK
 zZ/pdMgNlqj8YaEBZrl8Y/8z9FEZzI7f9qS+NPHW6jhPdKA62nHfXhzSM
 cAT0fpYHSaWc0SIi7N1o5T45wwP5Nh0QIpcZLbTj/cwwYOnB/uYfhByhp
 oGlk7iTer7lII1Q4IXVYp+iaZPNDTrr1uo9ZoyvJVqjCJPLznHWsD2egh
 xPf001xUy7IwfqT726C6HVkitqkT+zr+dB9K/Q8piwewRxz1v4TaL8h0u w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10302"; a="259825431"
X-IronPort-AV: E=Sophos;i="5.90,225,1643702400"; d="scan'208";a="259825431"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2022 07:09:31 -0700
X-IronPort-AV: E=Sophos;i="5.90,225,1643702400"; d="scan'208";a="606114192"
Received: from juanniex-mobl.ger.corp.intel.com (HELO tursulin-mobl2.home)
 ([10.213.215.247])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2022 07:09:30 -0700
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Intel-gfx@lists.freedesktop.org
Subject: [PATCH 4/8] drm/i915: Track all user contexts per client
Date: Thu, 31 Mar 2022 15:09:16 +0100
Message-Id: <20220331140920.2986689-5-tvrtko.ursulin@linux.intel.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220331140920.2986689-1-tvrtko.ursulin@linux.intel.com>
References: <20220331140920.2986689-1-tvrtko.ursulin@linux.intel.com>
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

