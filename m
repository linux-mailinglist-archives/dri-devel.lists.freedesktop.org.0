Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BBEA37F622
	for <lists+dri-devel@lfdr.de>; Thu, 13 May 2021 13:00:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABB1C6ECF1;
	Thu, 13 May 2021 11:00:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4380E6ECDE;
 Thu, 13 May 2021 11:00:16 +0000 (UTC)
IronPort-SDR: rD1lVkODa3pxE/uRDhIzCoigj8vK8ldUd4Bz6HVM6BAIgKkgqoQHu1n8luniKXObkf2na8Qk8l
 xBW0JQnyvM8A==
X-IronPort-AV: E=McAfee;i="6200,9189,9982"; a="187048084"
X-IronPort-AV: E=Sophos;i="5.82,296,1613462400"; d="scan'208";a="187048084"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2021 04:00:15 -0700
IronPort-SDR: /ZULR+HIZ5K9o8ZGPhku/OKy2H5IWk7JcGtNCOjAfHEDfQVbUKkOkZxNoYWZUG/Hyd45WedMVE
 /hK6AKTEyHIg==
X-IronPort-AV: E=Sophos;i="5.82,296,1613462400"; d="scan'208";a="400930449"
Received: from hcadcock-mobl1.ger.corp.intel.com (HELO tursulin-mobl2.home)
 ([10.213.209.166])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2021 04:00:14 -0700
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Intel-gfx@lists.freedesktop.org
Subject: [PATCH 5/7] drm/i915: Track all user contexts per client
Date: Thu, 13 May 2021 12:00:00 +0100
Message-Id: <20210513110002.3641705-6-tvrtko.ursulin@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210513110002.3641705-1-tvrtko.ursulin@linux.intel.com>
References: <20210513110002.3641705-1-tvrtko.ursulin@linux.intel.com>
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
Link: https://patchwork.freedesktop.org/patch/msgid/20210123153733.18139-6-chris@chris-wilson.co.uk
Link: https://patchwork.freedesktop.org/patch/msgid/20210124153136.19124-6-chris@chris-wilson.co.uk
---
 drivers/gpu/drm/i915/gem/i915_gem_context.c       | 12 ++++++++++++
 drivers/gpu/drm/i915/gem/i915_gem_context_types.h |  3 +++
 drivers/gpu/drm/i915/i915_drm_client.c            |  3 +++
 drivers/gpu/drm/i915/i915_drm_client.h            |  5 +++++
 4 files changed, 23 insertions(+)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/gem/i915_gem_context.c
index b8d8366a2cce..1595a608de92 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
@@ -573,6 +573,7 @@ static void set_closed_name(struct i915_gem_context *ctx)
 static void context_close(struct i915_gem_context *ctx)
 {
 	struct i915_address_space *vm;
+	struct i915_drm_client *client;
 
 	/* Flush any concurrent set_engines() */
 	mutex_lock(&ctx->engines_mutex);
@@ -601,6 +602,13 @@ static void context_close(struct i915_gem_context *ctx)
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
@@ -943,6 +951,10 @@ static int gem_context_register(struct i915_gem_context *ctx,
 
 	ctx->client = client;
 
+	spin_lock(&client->ctx_lock);
+	list_add_tail_rcu(&ctx->client_link, &client->ctx_list);
+	spin_unlock(&client->ctx_lock);
+
 	spin_lock(&i915->gem.contexts.lock);
 	list_add_tail(&ctx->link, &i915->gem.contexts.list);
 	spin_unlock(&i915->gem.contexts.lock);
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context_types.h b/drivers/gpu/drm/i915/gem/i915_gem_context_types.h
index eb098f2896c5..8ea3fe3e7414 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_context_types.h
+++ b/drivers/gpu/drm/i915/gem/i915_gem_context_types.h
@@ -102,6 +102,9 @@ struct i915_gem_context {
 	/** client: struct i915_drm_client */
 	struct i915_drm_client *client;
 
+	/** link: &drm_client.context_list */
+	struct list_head client_link;
+
 	/**
 	 * @ref: reference count
 	 *
diff --git a/drivers/gpu/drm/i915/i915_drm_client.c b/drivers/gpu/drm/i915/i915_drm_client.c
index ad3d36c9dee2..0ca81a750895 100644
--- a/drivers/gpu/drm/i915/i915_drm_client.c
+++ b/drivers/gpu/drm/i915/i915_drm_client.c
@@ -196,6 +196,9 @@ i915_drm_client_add(struct i915_drm_clients *clients, struct task_struct *task)
 
 	kref_init(&client->kref);
 	mutex_init(&client->update_lock);
+	spin_lock_init(&client->ctx_lock);
+	INIT_LIST_HEAD(&client->ctx_list);
+
 	client->clients = clients;
 	INIT_RCU_WORK(&client->rcu, __rcu_i915_drm_client_free);
 
diff --git a/drivers/gpu/drm/i915/i915_drm_client.h b/drivers/gpu/drm/i915/i915_drm_client.h
index 6f25e754e978..13f92142e474 100644
--- a/drivers/gpu/drm/i915/i915_drm_client.h
+++ b/drivers/gpu/drm/i915/i915_drm_client.h
@@ -9,10 +9,12 @@
 #include <linux/device.h>
 #include <linux/kobject.h>
 #include <linux/kref.h>
+#include <linux/list.h>
 #include <linux/mutex.h>
 #include <linux/pid.h>
 #include <linux/rcupdate.h>
 #include <linux/sched.h>
+#include <linux/spinlock.h>
 #include <linux/xarray.h>
 
 #include "gt/intel_engine_types.h"
@@ -46,6 +48,9 @@ struct i915_drm_client {
 	struct i915_drm_client_name __rcu *name;
 	bool closed;
 
+	spinlock_t ctx_lock; /* For add/remove from ctx_list. */
+	struct list_head ctx_list; /* List of contexts belonging to client. */
+
 	struct i915_drm_clients *clients;
 
 	struct kobject *root;
-- 
2.30.2

