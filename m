Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 79D3F4211D7
	for <lists+dri-devel@lfdr.de>; Mon,  4 Oct 2021 16:45:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E44EF6EA16;
	Mon,  4 Oct 2021 14:45:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 334F16EA0D;
 Mon,  4 Oct 2021 14:45:21 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10126"; a="248714009"
X-IronPort-AV: E=Sophos;i="5.85,346,1624345200"; d="scan'208";a="248714009"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2021 07:37:19 -0700
X-IronPort-AV: E=Sophos;i="5.85,346,1624345200"; d="scan'208";a="622303693"
Received: from shearne-mobl.ger.corp.intel.com (HELO tursulin-mobl2.home)
 ([10.213.208.122])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2021 07:37:18 -0700
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Subject: [RFC 5/8] drm/i915: Keep track of registered clients indexed by task
 struct
Date: Mon,  4 Oct 2021 15:36:47 +0100
Message-Id: <20211004143650.699120-6-tvrtko.ursulin@linux.intel.com>
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

A simple hash table of registered clients indexed by the task struct
pointer is kept to be used in a following patch.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_context.c |  2 ++
 drivers/gpu/drm/i915/i915_drm_client.c      | 31 ++++++++++++++++++++-
 drivers/gpu/drm/i915/i915_drm_client.h      | 13 +++++++++
 3 files changed, 45 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/gem/i915_gem_context.c
index d1992ba59ed8..8d4d687ab1d0 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
@@ -1932,6 +1932,8 @@ int i915_gem_context_create_ioctl(struct drm_device *dev, void *data,
 		return -EIO;
 	}
 
+	i915_drm_client_update_owner(ext_data.fpriv->client, current);
+
 	ext_data.pc = proto_context_create(i915, args->flags);
 	if (IS_ERR(ext_data.pc))
 		return PTR_ERR(ext_data.pc);
diff --git a/drivers/gpu/drm/i915/i915_drm_client.c b/drivers/gpu/drm/i915/i915_drm_client.c
index 91a8559bebf7..82b9636482ef 100644
--- a/drivers/gpu/drm/i915/i915_drm_client.c
+++ b/drivers/gpu/drm/i915/i915_drm_client.c
@@ -18,6 +18,9 @@ void i915_drm_clients_init(struct i915_drm_clients *clients,
 	clients->next_id = 0;
 
 	xa_init_flags(&clients->xarray, XA_FLAGS_ALLOC | XA_FLAGS_LOCK_IRQ);
+
+	rwlock_init(&clients->lock);
+	hash_init(clients->tasks);
 }
 
 struct i915_drm_client *i915_drm_client_add(struct i915_drm_clients *clients)
@@ -42,6 +45,8 @@ struct i915_drm_client *i915_drm_client_add(struct i915_drm_clients *clients)
 	INIT_LIST_HEAD(&client->ctx_list);
 	client->clients = clients;
 
+	i915_drm_client_update_owner(client, current);
+
 	return client;
 
 err:
@@ -54,9 +59,14 @@ void __i915_drm_client_free(struct kref *kref)
 {
 	struct i915_drm_client *client =
 		container_of(kref, typeof(*client), kref);
-	struct xarray *xa = &client->clients->xarray;
+	struct i915_drm_clients *clients = client->clients;
+	struct xarray *xa = &clients->xarray;
 	unsigned long flags;
 
+	write_lock(&clients->lock);
+	hash_del(&client->node);
+	write_unlock(&clients->lock);
+
 	xa_lock_irqsave(xa, flags);
 	__xa_erase(xa, client->id);
 	xa_unlock_irqrestore(xa, flags);
@@ -68,3 +78,22 @@ void i915_drm_clients_fini(struct i915_drm_clients *clients)
 	GEM_BUG_ON(!xa_empty(&clients->xarray));
 	xa_destroy(&clients->xarray);
 }
+
+void i915_drm_client_update_owner(struct i915_drm_client *client,
+				  struct task_struct *owner)
+{
+	struct i915_drm_clients *clients;
+
+	if (READ_ONCE(client->owner) == owner)
+		return;
+
+	clients = client->clients;
+	write_lock(&clients->lock);
+	if (READ_ONCE(client->owner) != owner) {
+		if (client->owner)
+			hash_del(&client->node);
+		client->owner = owner;
+		hash_add(clients->tasks, &client->node, (uintptr_t)owner);
+	}
+	write_unlock(&clients->lock);
+}
diff --git a/drivers/gpu/drm/i915/i915_drm_client.h b/drivers/gpu/drm/i915/i915_drm_client.h
index 0207dfad4568..42fd79f0558a 100644
--- a/drivers/gpu/drm/i915/i915_drm_client.h
+++ b/drivers/gpu/drm/i915/i915_drm_client.h
@@ -6,8 +6,11 @@
 #ifndef __I915_DRM_CLIENT_H__
 #define __I915_DRM_CLIENT_H__
 
+#include <linux/hashtable.h>
 #include <linux/kref.h>
 #include <linux/list.h>
+#include <linux/rwlock.h>
+#include <linux/sched.h>
 #include <linux/spinlock.h>
 #include <linux/xarray.h>
 
@@ -18,6 +21,9 @@ struct i915_drm_clients {
 
 	struct xarray xarray;
 	u32 next_id;
+
+	rwlock_t lock;
+	DECLARE_HASHTABLE(tasks, 6);
 };
 
 struct i915_drm_client {
@@ -28,6 +34,9 @@ struct i915_drm_client {
 	spinlock_t ctx_lock; /* For add/remove from ctx_list. */
 	struct list_head ctx_list; /* List of contexts belonging to client. */
 
+	struct task_struct *owner; /* No reference kept, never dereferenced. */
+	struct hlist_node node;
+
 	struct i915_drm_clients *clients;
 };
 
@@ -52,4 +61,8 @@ struct i915_drm_client *i915_drm_client_add(struct i915_drm_clients *clients);
 
 void i915_drm_clients_fini(struct i915_drm_clients *clients);
 
+void i915_drm_client_update_owner(struct i915_drm_client *client,
+				  struct task_struct *owner);
+
+
 #endif /* !__I915_DRM_CLIENT_H__ */
-- 
2.30.2

