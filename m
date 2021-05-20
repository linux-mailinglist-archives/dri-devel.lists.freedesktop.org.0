Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF90238B2BE
	for <lists+dri-devel@lfdr.de>; Thu, 20 May 2021 17:13:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E0486F48A;
	Thu, 20 May 2021 15:13:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EF4F6F482;
 Thu, 20 May 2021 15:13:11 +0000 (UTC)
IronPort-SDR: HfV2S53LmLsRM4n5UKJpu2odh1igqvx/uK+uXwLthW/cYiX/HeE/R+smkadmi79maTv/GS/aR2
 8mgKzGkoOVww==
X-IronPort-AV: E=McAfee;i="6200,9189,9989"; a="265162768"
X-IronPort-AV: E=Sophos;i="5.82,313,1613462400"; d="scan'208";a="265162768"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2021 08:13:08 -0700
IronPort-SDR: 5gFOig8H93Z0VFvPmvPUGV0qk5N9cbH6xX1dSrlXr2Nr7qyZb+qzQiKYrnqEd8UE4NimCCfuus
 vD2BJB4XmX/w==
X-IronPort-AV: E=Sophos;i="5.82,313,1613462400"; d="scan'208";a="543619204"
Received: from fgrogers-mobl.ger.corp.intel.com (HELO tursulin-mobl2.home)
 ([10.213.241.97])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2021 08:13:06 -0700
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Intel-gfx@lists.freedesktop.org
Subject: [RFC 1/7] drm/i915: Explicitly track DRM clients
Date: Thu, 20 May 2021 16:12:48 +0100
Message-Id: <20210520151254.959958-2-tvrtko.ursulin@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210520151254.959958-1-tvrtko.ursulin@linux.intel.com>
References: <20210520151254.959958-1-tvrtko.ursulin@linux.intel.com>
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
Cc: Chris Wilson <chris@chris-wilson.co.uk>,
 Aravind Iddamsetty <aravind.iddamsetty@intel.com>,
 dri-devel@lists.freedesktop.org, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Tracking DRM clients more explicitly will allow later patches to
accumulate past and current GPU usage in a centralised place and also
consolidate access to owning task pid/name.

Unique client id is also assigned for the purpose of distinguishing/
consolidating between multiple file descriptors owned by the same process.

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

v13 (Lucas): Rebase.

v14:
 * Dropped sysfs bits.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Reviewed-by: Chris Wilson <chris@chris-wilson.co.uk> # v11
Reviewed-by: Aravind Iddamsetty <aravind.iddamsetty@intel.com> # v11
Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
---
 drivers/gpu/drm/i915/Makefile          |   5 +-
 drivers/gpu/drm/i915/i915_drm_client.c | 113 +++++++++++++++++++++++++
 drivers/gpu/drm/i915/i915_drm_client.h |  61 +++++++++++++
 drivers/gpu/drm/i915/i915_drv.c        |   6 ++
 drivers/gpu/drm/i915/i915_drv.h        |   5 ++
 drivers/gpu/drm/i915/i915_gem.c        |  21 ++++-
 6 files changed, 206 insertions(+), 5 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/i915_drm_client.c
 create mode 100644 drivers/gpu/drm/i915/i915_drm_client.h

diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
index 6947495bf34b..f3f5c4571623 100644
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
index 000000000000..83080d9836b0
--- /dev/null
+++ b/drivers/gpu/drm/i915/i915_drm_client.c
@@ -0,0 +1,113 @@
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
+static int
+__i915_drm_client_register(struct i915_drm_client *client,
+			   struct task_struct *task)
+{
+	char *name;
+
+	name = kstrdup(task->comm, GFP_KERNEL);
+	if (!name)
+		return -ENOMEM;
+
+	client->pid = get_task_pid(task, PIDTYPE_PID);
+	client->name = name;
+
+	return 0;
+}
+
+static void __i915_drm_client_unregister(struct i915_drm_client *client)
+{
+	put_pid(fetch_and_zero(&client->pid));
+	kfree(fetch_and_zero(&client->name));
+}
+
+static void __rcu_i915_drm_client_free(struct work_struct *wrk)
+{
+	struct i915_drm_client *client =
+		container_of(wrk, typeof(*client), rcu.work);
+
+	xa_erase(&client->clients->xarray, client->id);
+
+	__i915_drm_client_unregister(client);
+
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
index 000000000000..396f1e336b3f
--- /dev/null
+++ b/drivers/gpu/drm/i915/i915_drm_client.h
@@ -0,0 +1,61 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2020 Intel Corporation
+ */
+
+#ifndef __I915_DRM_CLIENT_H__
+#define __I915_DRM_CLIENT_H__
+
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
index 2f06bb7b3ed2..33eb7b52b58b 100644
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
index 9cb02618ba15..f0bbe8d3195e 100644
--- a/drivers/gpu/drm/i915/i915_drv.h
+++ b/drivers/gpu/drm/i915/i915_drv.h
@@ -94,6 +94,7 @@
 #include "intel_wakeref.h"
 #include "intel_wopcm.h"
 
+#include "i915_drm_client.h"
 #include "i915_gem.h"
 #include "i915_gem_gtt.h"
 #include "i915_gpu_error.h"
@@ -220,6 +221,8 @@ struct drm_i915_file_private {
 	/** ban_score: Accumulated score of all ctx bans and fast hangs. */
 	atomic_t ban_score;
 	unsigned long hang_timestamp;
+
+	struct i915_drm_client *client;
 };
 
 /* Interface history:
@@ -1161,6 +1164,8 @@ struct drm_i915_private {
 
 	struct i915_pmu pmu;
 
+	struct i915_drm_clients clients;
+
 	struct i915_hdcp_comp_master *hdcp_master;
 	bool hdcp_comp_added;
 
diff --git a/drivers/gpu/drm/i915/i915_gem.c b/drivers/gpu/drm/i915/i915_gem.c
index cffd7f4f87dc..1445c7a7ef76 100644
--- a/drivers/gpu/drm/i915/i915_gem.c
+++ b/drivers/gpu/drm/i915/i915_gem.c
@@ -1181,25 +1181,40 @@ void i915_gem_cleanup_early(struct drm_i915_private *dev_priv)
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
 
-- 
2.30.2

