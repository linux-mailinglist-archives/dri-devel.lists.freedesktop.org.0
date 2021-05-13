Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B0F437F61D
	for <lists+dri-devel@lfdr.de>; Thu, 13 May 2021 13:00:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 198896ECE3;
	Thu, 13 May 2021 11:00:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A76876ECDD;
 Thu, 13 May 2021 11:00:13 +0000 (UTC)
IronPort-SDR: AqXKoflitJalCKic6a1iofeKDfWGRNGxHp14pbf7kKGKYkptQMYqw0XYJ5ek2fU7BZjYFReCSt
 DDckuHBQZahw==
X-IronPort-AV: E=McAfee;i="6200,9189,9982"; a="187048073"
X-IronPort-AV: E=Sophos;i="5.82,296,1613462400"; d="scan'208";a="187048073"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2021 04:00:12 -0700
IronPort-SDR: IdHena4oLvKtn53r6ZCz2CUkS76BxwmXdU7uh7Po8nk5VhIT/J4PyozvnGgvY8IeXDS0BI1KE1
 19Wdwbwlh9dg==
X-IronPort-AV: E=Sophos;i="5.82,296,1613462400"; d="scan'208";a="400930405"
Received: from hcadcock-mobl1.ger.corp.intel.com (HELO tursulin-mobl2.home)
 ([10.213.209.166])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2021 04:00:11 -0700
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Intel-gfx@lists.freedesktop.org
Subject: [PATCH 2/7] drm/i915: Update client name on context create
Date: Thu, 13 May 2021 11:59:57 +0100
Message-Id: <20210513110002.3641705-3-tvrtko.ursulin@linux.intel.com>
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
Link: https://patchwork.freedesktop.org/patch/msgid/20210123153733.18139-3-chris@chris-wilson.co.uk
Link: https://patchwork.freedesktop.org/patch/msgid/20210124153136.19124-3-chris@chris-wilson.co.uk
---
 drivers/gpu/drm/i915/gem/i915_gem_context.c |  5 ++
 drivers/gpu/drm/i915/i915_drm_client.c      | 93 +++++++++++++++++----
 drivers/gpu/drm/i915/i915_drm_client.h      | 34 +++++++-
 3 files changed, 115 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/gem/i915_gem_context.c
index 188dee13e017..e5f8d94666e8 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
@@ -76,6 +76,7 @@
 #include "gt/intel_gpu_commands.h"
 #include "gt/intel_ring.h"
 
+#include "i915_drm_client.h"
 #include "i915_gem_context.h"
 #include "i915_globals.h"
 #include "i915_trace.h"
@@ -2321,6 +2322,10 @@ int i915_gem_context_create_ioctl(struct drm_device *dev, void *data,
 		return -EIO;
 	}
 
+	ret = i915_drm_client_update(ext_data.fpriv->client, current);
+	if (ret)
+		return ret;
+
 	ext_data.ctx = i915_gem_create_context(i915, args->flags);
 	if (IS_ERR(ext_data.ctx))
 		return PTR_ERR(ext_data.ctx);
diff --git a/drivers/gpu/drm/i915/i915_drm_client.c b/drivers/gpu/drm/i915/i915_drm_client.c
index 7c2d36860ac1..ad3d36c9dee2 100644
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
 
@@ -25,10 +28,15 @@ show_client_name(struct device *kdev, struct device_attribute *attr, char *buf)
 {
 	struct i915_drm_client *client =
 		container_of(attr, typeof(*client), attr.name);
+	int ret;
 
-	return sysfs_emit(buf,
-			  READ_ONCE(client->closed) ? "<%s>\n" : "%s\n",
-			  client->name);
+	rcu_read_lock();
+	ret = sysfs_emit(buf,
+			 READ_ONCE(client->closed) ? "<%s>\n" : "%s\n",
+			 i915_drm_client_name(client));
+	rcu_read_unlock();
+
+	return ret;
 }
 
 static ssize_t
@@ -36,10 +44,15 @@ show_client_pid(struct device *kdev, struct device_attribute *attr, char *buf)
 {
 	struct i915_drm_client *client =
 		container_of(attr, typeof(*client), attr.pid);
+	int ret;
+
+	rcu_read_lock();
+	ret = sysfs_emit(buf,
+			 READ_ONCE(client->closed) ? "<%u>\n" : "%u\n",
+			 pid_nr(i915_drm_client_pid(client)));
+	rcu_read_unlock();
 
-	return sysfs_emit(buf,
-			  READ_ONCE(client->closed) ? "<%u>\n" : "%u\n",
-			  pid_nr(client->pid));
+	return ret;
 }
 
 static int __client_register_sysfs(struct i915_drm_client *client)
@@ -91,20 +104,46 @@ static void __client_unregister_sysfs(struct i915_drm_client *client)
 	kobject_put(fetch_and_zero(&client->root));
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
 	struct i915_drm_clients *clients = client->clients;
-	char *name;
+	struct i915_drm_client_name *name;
 	int ret;
 
-	name = kstrdup(task->comm, GFP_KERNEL);
+	name = get_name(client, task);
 	if (!name)
 		return -ENOMEM;
 
-	client->pid = get_task_pid(task, PIDTYPE_PID);
-	client->name = name;
+	RCU_INIT_POINTER(client->name, name);
 
 	if (!clients->root)
 		return 0; /* intel_fbdev_init registers a client before sysfs */
@@ -116,18 +155,22 @@ __i915_drm_client_register(struct i915_drm_client *client,
 	return 0;
 
 err_sysfs:
-	put_pid(client->pid);
-	kfree(client->name);
-
+	RCU_INIT_POINTER(client->name, NULL);
+	call_rcu(&name->rcu, free_name);
 	return ret;
 }
 
 static void __i915_drm_client_unregister(struct i915_drm_client *client)
 {
+	struct i915_drm_client_name *name;
+
 	__client_unregister_sysfs(client);
 
-	put_pid(fetch_and_zero(&client->pid));
-	kfree(fetch_and_zero(&client->name));
+	mutex_lock(&client->update_lock);
+	name = rcu_replace_pointer(client->name, NULL, true);
+	mutex_unlock(&client->update_lock);
+
+	call_rcu(&name->rcu, free_name);
 }
 
 static void __rcu_i915_drm_client_free(struct work_struct *wrk)
@@ -152,6 +195,7 @@ i915_drm_client_add(struct i915_drm_clients *clients, struct task_struct *task)
 		return ERR_PTR(-ENOMEM);
 
 	kref_init(&client->kref);
+	mutex_init(&client->update_lock);
 	client->clients = clients;
 	INIT_RCU_WORK(&client->rcu, __rcu_i915_drm_client_free);
 
@@ -189,6 +233,25 @@ void i915_drm_client_close(struct i915_drm_client *client)
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
index 150f8e8d34e6..556a59d6b834 100644
--- a/drivers/gpu/drm/i915/i915_drm_client.h
+++ b/drivers/gpu/drm/i915/i915_drm_client.h
@@ -9,6 +9,7 @@
 #include <linux/device.h>
 #include <linux/kobject.h>
 #include <linux/kref.h>
+#include <linux/mutex.h>
 #include <linux/pid.h>
 #include <linux/rcupdate.h>
 #include <linux/sched.h>
@@ -25,14 +26,22 @@ struct i915_drm_clients {
 	struct kobject *root;
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
@@ -66,6 +75,27 @@ void i915_drm_client_close(struct i915_drm_client *client);
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

