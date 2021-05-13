Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B7E637F615
	for <lists+dri-devel@lfdr.de>; Thu, 13 May 2021 13:00:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 871676E879;
	Thu, 13 May 2021 11:00:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 286DD6E879;
 Thu, 13 May 2021 11:00:12 +0000 (UTC)
IronPort-SDR: ar+mLABCh2WzbxQ22jnfW+3Yslbj2EE0EPHrBj9kUtg/xioWDnL5BgqW8YiSE2KlKk/qqEcL1v
 t0KrPT7n5eLg==
X-IronPort-AV: E=McAfee;i="6200,9189,9982"; a="187048069"
X-IronPort-AV: E=Sophos;i="5.82,296,1613462400"; d="scan'208";a="187048069"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2021 04:00:11 -0700
IronPort-SDR: XAf2XGpzVYQVDKdadks1L5CUPuUvzB/SpNus/JZK+rQ8orzIScX2R2Jx09sNLfql56Aoqh+LLx
 FbbKZf+xj0Xw==
X-IronPort-AV: E=Sophos;i="5.82,296,1613462400"; d="scan'208";a="400930390"
Received: from hcadcock-mobl1.ger.corp.intel.com (HELO tursulin-mobl2.home)
 ([10.213.209.166])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2021 04:00:10 -0700
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Intel-gfx@lists.freedesktop.org
Subject: [PATCH 1/7] drm/i915: Expose list of clients in sysfs
Date: Thu, 13 May 2021 11:59:56 +0100
Message-Id: <20210513110002.3641705-2-tvrtko.ursulin@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210513110002.3641705-1-tvrtko.ursulin@linux.intel.com>
References: <20210513110002.3641705-1-tvrtko.ursulin@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Expose a list of clients with open file handles in sysfs.

This will be a basis for a top-like utility showing per-client and per-
engine GPU load.

Currently we only expose each client's pid and name under opaque numbered
directories in /sys/class/drm/card0/clients/.

For instance:

/sys/class/drm/card0/clients/3/name: Xorg
/sys/class/drm/card0/clients/3/pid: 5664

v2:
 Chris Wilson:
 * Enclose new members into dedicated structs.
 * Protect against failed sysfs registration.

v3:
 * sysfs_attr_init.

v4:
 * Fix for internal clients.

v5:
 * Use cyclic ida for client id. (Chris)
 * Do not leak pid reference. (Chris)
 * Tidy code with some locals.

v6:
 * Use xa_alloc_cyclic to simplify locking. (Chris)
 * No need to unregister individial sysfs files. (Chris)
 * Rebase on top of fpriv kref.
 * Track client closed status and reflect in sysfs.

v7:
 * Make drm_client more standalone concept.

v8:
 * Simplify sysfs show. (Chris)
 * Always track name and pid.

v9:
 * Fix cyclic id assignment.

v10:
 * No need for a mutex around xa_alloc_cyclic.
 * Refactor sysfs into own function.
 * Unregister sysfs before freeing pid and name.
 * Move clients setup into own function.

v11:
 * Call clients init directly from driver init. (Chris)

v12:
 * Do not fail client add on id wrap. (Maciej)

v13 (Lucas): Rebase on upstream

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Reviewed-by: Chris Wilson <chris@chris-wilson.co.uk>
Reviewed-by: Aravind Iddamsetty <aravind.iddamsetty@intel.com> # v11
Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
Link: https://patchwork.freedesktop.org/patch/msgid/20210123153733.18139-2-chris@chris-wilson.co.uk
Link: https://patchwork.freedesktop.org/patch/msgid/20210124153136.19124-2-chris@chris-wilson.co.uk
---
 drivers/gpu/drm/i915/Makefile          |   5 +-
 drivers/gpu/drm/i915/i915_drm_client.c | 200 +++++++++++++++++++++++++
 drivers/gpu/drm/i915/i915_drm_client.h |  71 +++++++++
 drivers/gpu/drm/i915/i915_drv.c        |   6 +
 drivers/gpu/drm/i915/i915_drv.h        |   5 +
 drivers/gpu/drm/i915/i915_gem.c        |  21 ++-
 drivers/gpu/drm/i915/i915_sysfs.c      |   8 +
 7 files changed, 311 insertions(+), 5 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/i915_drm_client.c
 create mode 100644 drivers/gpu/drm/i915/i915_drm_client.h

diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
index d0d936d9137b..e89ce541fe68 100644
--- a/drivers/gpu/drm/i915/Makefile
+++ b/drivers/gpu/drm/i915/Makefile
@@ -33,8 +33,9 @@ subdir-ccflags-y += -I$(srctree)/$(src)
 # Please keep these build lists sorted!
 
 # core driver code
-i915-y += i915_drv.o \
-	  i915_config.o \
+i915-y += i915_config.o \
+	  i915_drm_client.o \
+	  i915_drv.o \
 	  i915_irq.o \
 	  i915_getparam.o \
 	  i915_mitigations.o \
diff --git a/drivers/gpu/drm/i915/i915_drm_client.c b/drivers/gpu/drm/i915/i915_drm_client.c
new file mode 100644
index 000000000000..7c2d36860ac1
--- /dev/null
+++ b/drivers/gpu/drm/i915/i915_drm_client.c
@@ -0,0 +1,200 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2020 Intel Corporation
+ */
+
+#include <linux/kernel.h>
+#include <linux/slab.h>
+#include <linux/types.h>
+
+#include "i915_drm_client.h"
+#include "i915_gem.h"
+#include "i915_utils.h"
+
+void i915_drm_clients_init(struct i915_drm_clients *clients,
+			   struct drm_i915_private *i915)
+{
+	clients->i915 = i915;
+
+	clients->next_id = 0;
+	xa_init_flags(&clients->xarray, XA_FLAGS_ALLOC);
+}
+
+static ssize_t
+show_client_name(struct device *kdev, struct device_attribute *attr, char *buf)
+{
+	struct i915_drm_client *client =
+		container_of(attr, typeof(*client), attr.name);
+
+	return sysfs_emit(buf,
+			  READ_ONCE(client->closed) ? "<%s>\n" : "%s\n",
+			  client->name);
+}
+
+static ssize_t
+show_client_pid(struct device *kdev, struct device_attribute *attr, char *buf)
+{
+	struct i915_drm_client *client =
+		container_of(attr, typeof(*client), attr.pid);
+
+	return sysfs_emit(buf,
+			  READ_ONCE(client->closed) ? "<%u>\n" : "%u\n",
+			  pid_nr(client->pid));
+}
+
+static int __client_register_sysfs(struct i915_drm_client *client)
+{
+	const struct {
+		const char *name;
+		struct device_attribute *attr;
+		ssize_t (*show)(struct device *dev,
+				struct device_attribute *attr,
+				char *buf);
+	} files[] = {
+		{ "name", &client->attr.name, show_client_name },
+		{ "pid", &client->attr.pid, show_client_pid },
+	};
+	unsigned int i;
+	char buf[16];
+	int ret;
+
+	ret = scnprintf(buf, sizeof(buf), "%u", client->id);
+	if (ret == sizeof(buf))
+		return -EINVAL;
+
+	client->root = kobject_create_and_add(buf, client->clients->root);
+	if (!client->root)
+		return -ENOMEM;
+
+	for (i = 0; i < ARRAY_SIZE(files); i++) {
+		struct device_attribute *attr = files[i].attr;
+
+		sysfs_attr_init(&attr->attr);
+
+		attr->attr.name = files[i].name;
+		attr->attr.mode = 0444;
+		attr->show = files[i].show;
+
+		ret = sysfs_create_file(client->root, &attr->attr);
+		if (ret)
+			break;
+	}
+
+	if (ret)
+		kobject_put(client->root);
+
+	return ret;
+}
+
+static void __client_unregister_sysfs(struct i915_drm_client *client)
+{
+	kobject_put(fetch_and_zero(&client->root));
+}
+
+static int
+__i915_drm_client_register(struct i915_drm_client *client,
+			   struct task_struct *task)
+{
+	struct i915_drm_clients *clients = client->clients;
+	char *name;
+	int ret;
+
+	name = kstrdup(task->comm, GFP_KERNEL);
+	if (!name)
+		return -ENOMEM;
+
+	client->pid = get_task_pid(task, PIDTYPE_PID);
+	client->name = name;
+
+	if (!clients->root)
+		return 0; /* intel_fbdev_init registers a client before sysfs */
+
+	ret = __client_register_sysfs(client);
+	if (ret)
+		goto err_sysfs;
+
+	return 0;
+
+err_sysfs:
+	put_pid(client->pid);
+	kfree(client->name);
+
+	return ret;
+}
+
+static void __i915_drm_client_unregister(struct i915_drm_client *client)
+{
+	__client_unregister_sysfs(client);
+
+	put_pid(fetch_and_zero(&client->pid));
+	kfree(fetch_and_zero(&client->name));
+}
+
+static void __rcu_i915_drm_client_free(struct work_struct *wrk)
+{
+	struct i915_drm_client *client =
+		container_of(wrk, typeof(*client), rcu.work);
+
+	__i915_drm_client_unregister(client);
+
+	xa_erase(&client->clients->xarray, client->id);
+	kfree(client);
+}
+
+struct i915_drm_client *
+i915_drm_client_add(struct i915_drm_clients *clients, struct task_struct *task)
+{
+	struct i915_drm_client *client;
+	int ret;
+
+	client = kzalloc(sizeof(*client), GFP_KERNEL);
+	if (!client)
+		return ERR_PTR(-ENOMEM);
+
+	kref_init(&client->kref);
+	client->clients = clients;
+	INIT_RCU_WORK(&client->rcu, __rcu_i915_drm_client_free);
+
+	ret = xa_alloc_cyclic(&clients->xarray, &client->id, client,
+			      xa_limit_32b, &clients->next_id, GFP_KERNEL);
+	if (ret < 0)
+		goto err_id;
+
+	ret = __i915_drm_client_register(client, task);
+	if (ret)
+		goto err_register;
+
+	return client;
+
+err_register:
+	xa_erase(&clients->xarray, client->id);
+err_id:
+	kfree(client);
+
+	return ERR_PTR(ret);
+}
+
+void __i915_drm_client_free(struct kref *kref)
+{
+	struct i915_drm_client *client =
+		container_of(kref, typeof(*client), kref);
+
+	queue_rcu_work(system_wq, &client->rcu);
+}
+
+void i915_drm_client_close(struct i915_drm_client *client)
+{
+	GEM_BUG_ON(READ_ONCE(client->closed));
+	WRITE_ONCE(client->closed, true);
+	i915_drm_client_put(client);
+}
+
+void i915_drm_clients_fini(struct i915_drm_clients *clients)
+{
+	while (!xa_empty(&clients->xarray)) {
+		rcu_barrier();
+		flush_workqueue(system_wq);
+	}
+
+	xa_destroy(&clients->xarray);
+}
diff --git a/drivers/gpu/drm/i915/i915_drm_client.h b/drivers/gpu/drm/i915/i915_drm_client.h
new file mode 100644
index 000000000000..150f8e8d34e6
--- /dev/null
+++ b/drivers/gpu/drm/i915/i915_drm_client.h
@@ -0,0 +1,71 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2020 Intel Corporation
+ */
+
+#ifndef __I915_DRM_CLIENT_H__
+#define __I915_DRM_CLIENT_H__
+
+#include <linux/device.h>
+#include <linux/kobject.h>
+#include <linux/kref.h>
+#include <linux/pid.h>
+#include <linux/rcupdate.h>
+#include <linux/sched.h>
+#include <linux/xarray.h>
+
+struct drm_i915_private;
+
+struct i915_drm_clients {
+	struct drm_i915_private *i915;
+
+	struct xarray xarray;
+	u32 next_id;
+
+	struct kobject *root;
+};
+
+struct i915_drm_client {
+	struct kref kref;
+
+	struct rcu_work rcu;
+
+	unsigned int id;
+	struct pid *pid;
+	char *name;
+	bool closed;
+
+	struct i915_drm_clients *clients;
+
+	struct kobject *root;
+	struct {
+		struct device_attribute pid;
+		struct device_attribute name;
+	} attr;
+};
+
+void i915_drm_clients_init(struct i915_drm_clients *clients,
+			   struct drm_i915_private *i915);
+
+static inline struct i915_drm_client *
+i915_drm_client_get(struct i915_drm_client *client)
+{
+	kref_get(&client->kref);
+	return client;
+}
+
+void __i915_drm_client_free(struct kref *kref);
+
+static inline void i915_drm_client_put(struct i915_drm_client *client)
+{
+	kref_put(&client->kref, __i915_drm_client_free);
+}
+
+void i915_drm_client_close(struct i915_drm_client *client);
+
+struct i915_drm_client *i915_drm_client_add(struct i915_drm_clients *clients,
+					    struct task_struct *task);
+
+void i915_drm_clients_fini(struct i915_drm_clients *clients);
+
+#endif /* !__I915_DRM_CLIENT_H__ */
diff --git a/drivers/gpu/drm/i915/i915_drv.c b/drivers/gpu/drm/i915/i915_drv.c
index 5118dc8386b2..2be26aea035b 100644
--- a/drivers/gpu/drm/i915/i915_drv.c
+++ b/drivers/gpu/drm/i915/i915_drv.c
@@ -69,6 +69,7 @@
 #include "gt/intel_rc6.h"
 
 #include "i915_debugfs.h"
+#include "i915_drm_client.h"
 #include "i915_drv.h"
 #include "i915_ioc32.h"
 #include "i915_irq.h"
@@ -339,6 +340,8 @@ static int i915_driver_early_probe(struct drm_i915_private *dev_priv)
 
 	intel_gt_init_early(&dev_priv->gt, dev_priv);
 
+	i915_drm_clients_init(&dev_priv->clients, dev_priv);
+
 	i915_gem_init_early(dev_priv);
 
 	/* This must be called before any calls to HAS_PCH_* */
@@ -358,6 +361,7 @@ static int i915_driver_early_probe(struct drm_i915_private *dev_priv)
 
 err_gem:
 	i915_gem_cleanup_early(dev_priv);
+	i915_drm_clients_fini(&dev_priv->clients);
 	intel_gt_driver_late_release(&dev_priv->gt);
 	vlv_suspend_cleanup(dev_priv);
 err_workqueues:
@@ -375,6 +379,7 @@ static void i915_driver_late_release(struct drm_i915_private *dev_priv)
 	intel_irq_fini(dev_priv);
 	intel_power_domains_cleanup(dev_priv);
 	i915_gem_cleanup_early(dev_priv);
+	i915_drm_clients_fini(&dev_priv->clients);
 	intel_gt_driver_late_release(&dev_priv->gt);
 	vlv_suspend_cleanup(dev_priv);
 	i915_workqueues_cleanup(dev_priv);
@@ -984,6 +989,7 @@ static void i915_driver_postclose(struct drm_device *dev, struct drm_file *file)
 	struct drm_i915_file_private *file_priv = file->driver_priv;
 
 	i915_gem_context_close(file);
+	i915_drm_client_close(file_priv->client);
 
 	kfree_rcu(file_priv, rcu);
 
diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
index 61308ce19059..6c0f12248156 100644
--- a/drivers/gpu/drm/i915/i915_drv.h
+++ b/drivers/gpu/drm/i915/i915_drv.h
@@ -95,6 +95,7 @@
 #include "intel_wakeref.h"
 #include "intel_wopcm.h"
 
+#include "i915_drm_client.h"
 #include "i915_gem.h"
 #include "i915_gem_gtt.h"
 #include "i915_gpu_error.h"
@@ -221,6 +222,8 @@ struct drm_i915_file_private {
 	/** ban_score: Accumulated score of all ctx bans and fast hangs. */
 	atomic_t ban_score;
 	unsigned long hang_timestamp;
+
+	struct i915_drm_client *client;
 };
 
 /* Interface history:
@@ -1160,6 +1163,8 @@ struct drm_i915_private {
 
 	struct i915_pmu pmu;
 
+	struct i915_drm_clients clients;
+
 	struct i915_hdcp_comp_master *hdcp_master;
 	bool hdcp_comp_added;
 
diff --git a/drivers/gpu/drm/i915/i915_gem.c b/drivers/gpu/drm/i915/i915_gem.c
index d0018c5f88bd..8643b2a67f6d 100644
--- a/drivers/gpu/drm/i915/i915_gem.c
+++ b/drivers/gpu/drm/i915/i915_gem.c
@@ -1182,25 +1182,40 @@ void i915_gem_cleanup_early(struct drm_i915_private *dev_priv)
 int i915_gem_open(struct drm_i915_private *i915, struct drm_file *file)
 {
 	struct drm_i915_file_private *file_priv;
-	int ret;
+	struct i915_drm_client *client;
+	int ret = -ENOMEM;
 
 	DRM_DEBUG("\n");
 
 	file_priv = kzalloc(sizeof(*file_priv), GFP_KERNEL);
 	if (!file_priv)
-		return -ENOMEM;
+		goto err_alloc;
+
+	client = i915_drm_client_add(&i915->clients, current);
+	if (IS_ERR(client)) {
+		ret = PTR_ERR(client);
+		goto err_client;
+	}
 
 	file->driver_priv = file_priv;
 	file_priv->dev_priv = i915;
 	file_priv->file = file;
+	file_priv->client = client;
 
 	file_priv->bsd_engine = -1;
 	file_priv->hang_timestamp = jiffies;
 
 	ret = i915_gem_context_open(i915, file);
 	if (ret)
-		kfree(file_priv);
+		goto err_context;
+
+	return 0;
 
+err_context:
+	i915_drm_client_close(client);
+err_client:
+	kfree(file_priv);
+err_alloc:
 	return ret;
 }
 
diff --git a/drivers/gpu/drm/i915/i915_sysfs.c b/drivers/gpu/drm/i915/i915_sysfs.c
index 4c6b5d52b5ca..e7aef29068ac 100644
--- a/drivers/gpu/drm/i915/i915_sysfs.c
+++ b/drivers/gpu/drm/i915/i915_sysfs.c
@@ -554,6 +554,11 @@ void i915_setup_sysfs(struct drm_i915_private *dev_priv)
 	struct device *kdev = dev_priv->drm.primary->kdev;
 	int ret;
 
+	dev_priv->clients.root =
+		kobject_create_and_add("clients", &kdev->kobj);
+	if (!dev_priv->clients.root)
+		drm_warn(&dev_priv->drm, "Per-client sysfs setup failed\n");
+
 #ifdef CONFIG_PM
 	if (HAS_RC6(dev_priv)) {
 		ret = sysfs_merge_group(&kdev->kobj,
@@ -621,4 +626,7 @@ void i915_teardown_sysfs(struct drm_i915_private *dev_priv)
 	sysfs_unmerge_group(&kdev->kobj, &rc6_attr_group);
 	sysfs_unmerge_group(&kdev->kobj, &rc6p_attr_group);
 #endif
+
+	if (dev_priv->clients.root)
+		kobject_put(dev_priv->clients.root);
 }
-- 
2.30.2

