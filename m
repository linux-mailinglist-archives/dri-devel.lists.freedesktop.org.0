Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 01BA83C5BB0
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jul 2021 14:17:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56BE089B20;
	Mon, 12 Jul 2021 12:17:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54ADD89C09;
 Mon, 12 Jul 2021 12:17:35 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10042"; a="209943841"
X-IronPort-AV: E=Sophos;i="5.84,232,1620716400"; d="scan'208";a="209943841"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jul 2021 05:17:35 -0700
X-IronPort-AV: E=Sophos;i="5.84,232,1620716400"; d="scan'208";a="648236651"
Received: from aaroncar-mobl2.ger.corp.intel.com (HELO tursulin-mobl2.home)
 ([10.213.240.41])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jul 2021 05:17:33 -0700
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Intel-gfx@lists.freedesktop.org
Subject: [PATCH 2/8] drm/i915: Update client name on context create
Date: Mon, 12 Jul 2021 13:17:13 +0100
Message-Id: <20210712121719.891536-3-tvrtko.ursulin@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210712121719.891536-1-tvrtko.ursulin@linux.intel.com>
References: <20210712121719.891536-1-tvrtko.ursulin@linux.intel.com>
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
Cc: Chris Wilson <chris@chris-wilson.co.uk>,
 Aravind Iddamsetty <aravind.iddamsetty@intel.com>,
 dri-devel@lists.freedesktop.org, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Some clients have the DRM fd passed to them over a socket by the X server.

Grab the real client and pid when they create their first context and
update the exposed data for more useful enumeration.

To enable lockless access to client name and pid data from the following
patches, we also make these fields rcu protected. In this way asynchronous
code paths where both contexts which remain after the client exit, and
access to client name and pid as they are getting updated due context
creation running in parallel with name/pid queries.

v2:
 * Do not leak the pid reference and borrow context idr_lock. (Chris)

v3:
 * More avoiding leaks. (Chris)

v4:
 * Move update completely to drm client. (Chris)
 * Do not lose previous client data on failure to re-register and simplify
   update to only touch what it needs.

v5:
 * Reuse ext_data local. (Chris)

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Reviewed-by: Chris Wilson <chris@chris-wilson.co.uk>
Reviewed-by: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
---
 drivers/gpu/drm/i915/gem/i915_gem_context.c |  5 ++
 drivers/gpu/drm/i915/i915_drm_client.c      | 66 +++++++++++++++++++--
 drivers/gpu/drm/i915/i915_drm_client.h      | 34 ++++++++++-
 3 files changed, 97 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/gem/i915_gem_context.c
index 7d6f52d8a801..ae9d4e087a92 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
@@ -78,6 +78,7 @@
 #include "gt/intel_gpu_commands.h"
 #include "gt/intel_ring.h"
 
+#include "i915_drm_client.h"
 #include "i915_gem_context.h"
 #include "i915_globals.h"
 #include "i915_trace.h"
@@ -1996,6 +1997,10 @@ int i915_gem_context_create_ioctl(struct drm_device *dev, void *data,
 			goto err_pc;
 	}
 
+	ret = i915_drm_client_update(ext_data.fpriv->client, current);
+	if (ret)
+		goto err_pc;
+
 	if (GRAPHICS_VER(i915) > 12) {
 		struct i915_gem_context *ctx;
 
diff --git a/drivers/gpu/drm/i915/i915_drm_client.c b/drivers/gpu/drm/i915/i915_drm_client.c
index 83080d9836b0..0b7a70ed61d0 100644
--- a/drivers/gpu/drm/i915/i915_drm_client.c
+++ b/drivers/gpu/drm/i915/i915_drm_client.c
@@ -7,7 +7,10 @@
 #include <linux/slab.h>
 #include <linux/types.h>
 
+#include <drm/drm_print.h>
+
 #include "i915_drm_client.h"
+#include "i915_drv.h"
 #include "i915_gem.h"
 #include "i915_utils.h"
 
@@ -20,26 +23,57 @@ void i915_drm_clients_init(struct i915_drm_clients *clients,
 	xa_init_flags(&clients->xarray, XA_FLAGS_ALLOC);
 }
 
+static struct i915_drm_client_name *get_name(struct i915_drm_client *client,
+					     struct task_struct *task)
+{
+	struct i915_drm_client_name *name;
+	int len = strlen(task->comm);
+
+	name = kmalloc(struct_size(name, name, len + 1), GFP_KERNEL);
+	if (!name)
+		return NULL;
+
+	init_rcu_head(&name->rcu);
+	name->client = client;
+	name->pid = get_task_pid(task, PIDTYPE_PID);
+	memcpy(name->name, task->comm, len + 1);
+
+	return name;
+}
+
+static void free_name(struct rcu_head *rcu)
+{
+	struct i915_drm_client_name *name =
+		container_of(rcu, typeof(*name), rcu);
+
+	put_pid(name->pid);
+	kfree(name);
+}
+
 static int
 __i915_drm_client_register(struct i915_drm_client *client,
 			   struct task_struct *task)
 {
-	char *name;
+	struct i915_drm_client_name *name;
 
-	name = kstrdup(task->comm, GFP_KERNEL);
+	name = get_name(client, task);
 	if (!name)
 		return -ENOMEM;
 
-	client->pid = get_task_pid(task, PIDTYPE_PID);
-	client->name = name;
+	RCU_INIT_POINTER(client->name, name);
 
 	return 0;
 }
 
 static void __i915_drm_client_unregister(struct i915_drm_client *client)
 {
-	put_pid(fetch_and_zero(&client->pid));
-	kfree(fetch_and_zero(&client->name));
+	struct i915_drm_client_name *name;
+
+	mutex_lock(&client->update_lock);
+	name = rcu_replace_pointer(client->name, NULL, true);
+	mutex_unlock(&client->update_lock);
+
+	call_rcu(&name->rcu, free_name);
 }
 
 static void __rcu_i915_drm_client_free(struct work_struct *wrk)
@@ -65,6 +99,7 @@ i915_drm_client_add(struct i915_drm_clients *clients, struct task_struct *task)
 		return ERR_PTR(-ENOMEM);
 
 	kref_init(&client->kref);
+	mutex_init(&client->update_lock);
 	client->clients = clients;
 	INIT_RCU_WORK(&client->rcu, __rcu_i915_drm_client_free);
 
@@ -102,6 +137,25 @@ void i915_drm_client_close(struct i915_drm_client *client)
 	i915_drm_client_put(client);
 }
 
+int
+i915_drm_client_update(struct i915_drm_client *client,
+		       struct task_struct *task)
+{
+	struct i915_drm_client_name *name;
+
+	name = get_name(client, task);
+	if (!name)
+		return -ENOMEM;
+
+	mutex_lock(&client->update_lock);
+	if (name->pid != rcu_dereference_protected(client->name, true)->pid)
+		name = rcu_replace_pointer(client->name, name, true);
+	mutex_unlock(&client->update_lock);
+
+	call_rcu(&name->rcu, free_name);
+	return 0;
+}
+
 void i915_drm_clients_fini(struct i915_drm_clients *clients)
 {
 	while (!xa_empty(&clients->xarray)) {
diff --git a/drivers/gpu/drm/i915/i915_drm_client.h b/drivers/gpu/drm/i915/i915_drm_client.h
index 396f1e336b3f..6d55f77a08f1 100644
--- a/drivers/gpu/drm/i915/i915_drm_client.h
+++ b/drivers/gpu/drm/i915/i915_drm_client.h
@@ -7,6 +7,7 @@
 #define __I915_DRM_CLIENT_H__
 
 #include <linux/kref.h>
+#include <linux/mutex.h>
 #include <linux/pid.h>
 #include <linux/rcupdate.h>
 #include <linux/sched.h>
@@ -21,14 +22,22 @@ struct i915_drm_clients {
 	u32 next_id;
 };
 
+struct i915_drm_client_name {
+	struct rcu_head rcu;
+	struct i915_drm_client *client;
+	struct pid *pid;
+	char name[];
+};
+
 struct i915_drm_client {
 	struct kref kref;
 
 	struct rcu_work rcu;
 
+	struct mutex update_lock; /* Serializes name and pid updates. */
+
 	unsigned int id;
-	struct pid *pid;
-	char *name;
+	struct i915_drm_client_name __rcu *name;
 	bool closed;
 
 	struct i915_drm_clients *clients;
@@ -56,6 +65,27 @@ void i915_drm_client_close(struct i915_drm_client *client);
 struct i915_drm_client *i915_drm_client_add(struct i915_drm_clients *clients,
 					    struct task_struct *task);
 
+int i915_drm_client_update(struct i915_drm_client *client,
+			   struct task_struct *task);
+
+static inline const struct i915_drm_client_name *
+__i915_drm_client_name(const struct i915_drm_client *client)
+{
+	return rcu_dereference(client->name);
+}
+
+static inline const char *
+i915_drm_client_name(const struct i915_drm_client *client)
+{
+	return __i915_drm_client_name(client)->name;
+}
+
+static inline struct pid *
+i915_drm_client_pid(const struct i915_drm_client *client)
+{
+	return __i915_drm_client_name(client)->pid;
+}
+
 void i915_drm_clients_fini(struct i915_drm_clients *clients);
 
 #endif /* !__I915_DRM_CLIENT_H__ */
-- 
2.30.2

