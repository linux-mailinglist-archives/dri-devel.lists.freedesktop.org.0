Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 626B7421197
	for <lists+dri-devel@lfdr.de>; Mon,  4 Oct 2021 16:40:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB7016E9D4;
	Mon,  4 Oct 2021 14:39:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C806E6E9D3;
 Mon,  4 Oct 2021 14:39:52 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10126"; a="224221471"
X-IronPort-AV: E=Sophos;i="5.85,346,1624345200"; d="scan'208";a="224221471"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2021 07:37:24 -0700
X-IronPort-AV: E=Sophos;i="5.85,346,1624345200"; d="scan'208";a="622303735"
Received: from shearne-mobl.ger.corp.intel.com (HELO tursulin-mobl2.home)
 ([10.213.208.122])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2021 07:37:23 -0700
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Subject: [RFC 8/8] drm/i915: Connect with the process nice change notifier
Date: Mon,  4 Oct 2021 15:36:50 +0100
Message-Id: <20211004143650.699120-9-tvrtko.ursulin@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211004143650.699120-1-tvrtko.ursulin@linux.intel.com>
References: <20211004143650.699120-1-tvrtko.ursulin@linux.intel.com>
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

From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Connect i915 with the process nice change notifier so that our scheduling
can react to runtime adjustments, on top of previously added nice value
inheritance at context create time.

To achieve this we use the previously added map of clients per owning
tasks in combination with the list of GEM contexts per client.

To avoid possibly unnecessary complications the updated context nice value
will only apply to future submissions against the context.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
---
 drivers/gpu/drm/i915/i915_drm_client.c | 31 ++++++++++++++++++++++++++
 drivers/gpu/drm/i915/i915_drm_client.h |  3 +++
 2 files changed, 34 insertions(+)

diff --git a/drivers/gpu/drm/i915/i915_drm_client.c b/drivers/gpu/drm/i915/i915_drm_client.c
index 82b9636482ef..e34c1228f65b 100644
--- a/drivers/gpu/drm/i915/i915_drm_client.c
+++ b/drivers/gpu/drm/i915/i915_drm_client.c
@@ -7,10 +7,35 @@
 #include <linux/slab.h>
 #include <linux/types.h>
 
+#include "gem/i915_gem_context.h"
 #include "i915_drm_client.h"
 #include "i915_gem.h"
 #include "i915_utils.h"
 
+static int
+clients_notify(struct notifier_block *nb, unsigned long val, void *ptr)
+{
+	struct i915_drm_clients *clients =
+		container_of(nb, typeof(*clients), prio_notifier);
+	struct i915_drm_client *client;
+
+	rcu_read_lock();
+	read_lock(&clients->lock);
+	hash_for_each_possible(clients->tasks, client, node, (uintptr_t)ptr) {
+		struct i915_gem_context *ctx;
+
+		if (client->owner != ptr)
+			continue;
+
+		list_for_each_entry_rcu(ctx, &client->ctx_list, client_link)
+			ctx->sched.nice = (int)val;
+	}
+	read_unlock(&clients->lock);
+	rcu_read_unlock();
+
+	return NOTIFY_DONE;
+}
+
 void i915_drm_clients_init(struct i915_drm_clients *clients,
 			   struct drm_i915_private *i915)
 {
@@ -21,6 +46,10 @@ void i915_drm_clients_init(struct i915_drm_clients *clients,
 
 	rwlock_init(&clients->lock);
 	hash_init(clients->tasks);
+
+	memset(&clients->prio_notifier, 0, sizeof(clients->prio_notifier));
+	clients->prio_notifier.notifier_call = clients_notify;
+	register_user_nice_notifier(&clients->prio_notifier);
 }
 
 struct i915_drm_client *i915_drm_client_add(struct i915_drm_clients *clients)
@@ -75,6 +104,8 @@ void __i915_drm_client_free(struct kref *kref)
 
 void i915_drm_clients_fini(struct i915_drm_clients *clients)
 {
+	unregister_user_nice_notifier(&clients->prio_notifier);
+
 	GEM_BUG_ON(!xa_empty(&clients->xarray));
 	xa_destroy(&clients->xarray);
 }
diff --git a/drivers/gpu/drm/i915/i915_drm_client.h b/drivers/gpu/drm/i915/i915_drm_client.h
index 42fd79f0558a..dda26aa42ac9 100644
--- a/drivers/gpu/drm/i915/i915_drm_client.h
+++ b/drivers/gpu/drm/i915/i915_drm_client.h
@@ -9,6 +9,7 @@
 #include <linux/hashtable.h>
 #include <linux/kref.h>
 #include <linux/list.h>
+#include <linux/notifier.h>
 #include <linux/rwlock.h>
 #include <linux/sched.h>
 #include <linux/spinlock.h>
@@ -24,6 +25,8 @@ struct i915_drm_clients {
 
 	rwlock_t lock;
 	DECLARE_HASHTABLE(tasks, 6);
+
+	struct notifier_block prio_notifier;
 };
 
 struct i915_drm_client {
-- 
2.30.2

