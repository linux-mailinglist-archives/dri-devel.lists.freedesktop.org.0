Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D0960467A8E
	for <lists+dri-devel@lfdr.de>; Fri,  3 Dec 2021 16:50:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B4F86F482;
	Fri,  3 Dec 2021 15:50:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31A596F5BF;
 Fri,  3 Dec 2021 15:50:01 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10186"; a="261004623"
X-IronPort-AV: E=Sophos;i="5.87,284,1631602800"; d="scan'208";a="261004623"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2021 07:50:00 -0800
X-IronPort-AV: E=Sophos;i="5.87,284,1631602800"; d="scan'208";a="501232302"
Received: from barrettd-mobl.ger.corp.intel.com (HELO tursulin-mobl2.home)
 ([10.213.208.70])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2021 07:49:58 -0800
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Intel-gfx@lists.freedesktop.org
Subject: [PATCH 1/7] drm/i915: Explicitly track DRM clients
Date: Fri,  3 Dec 2021 15:49:41 +0000
Message-Id: <20211203154947.3953995-2-tvrtko.ursulin@linux.intel.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211203154947.3953995-1-tvrtko.ursulin@linux.intel.com>
References: <20211203154947.3953995-1-tvrtko.ursulin@linux.intel.com>
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

v15:
 * Dropped tracking of pid/ and name.
 * Dropped RCU freeing of the client object.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Reviewed-by: Chris Wilson <chris@chris-wilson.co.uk> # v11
Reviewed-by: Aravind Iddamsetty <aravind.iddamsetty@intel.com> # v11
Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
---
 drivers/gpu/drm/i915/Makefile          |  1 +
 drivers/gpu/drm/i915/i915_driver.c     |  6 +++
 drivers/gpu/drm/i915/i915_drm_client.c | 68 ++++++++++++++++++++++++++
 drivers/gpu/drm/i915/i915_drm_client.h | 50 +++++++++++++++++++
 drivers/gpu/drm/i915/i915_drv.h        |  5 ++
 drivers/gpu/drm/i915/i915_gem.c        | 21 ++++++--
 6 files changed, 148 insertions(+), 3 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/i915_drm_client.c
 create mode 100644 drivers/gpu/drm/i915/i915_drm_client.h

diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
index 3b5857da4123..2a94e7c441a0 100644
--- a/drivers/gpu/drm/i915/Makefile
+++ b/drivers/gpu/drm/i915/Makefile
@@ -31,6 +31,7 @@ subdir-ccflags-y += -I$(srctree)/$(src)
 
 # core driver code
 i915-y += i915_driver.o \
+	  i915_drm_client.o \
 	  i915_config.o \
 	  i915_irq.o \
 	  i915_getparam.o \
diff --git a/drivers/gpu/drm/i915/i915_driver.c b/drivers/gpu/drm/i915/i915_driver.c
index bbc99fc5888f..a4f8031602b3 100644
--- a/drivers/gpu/drm/i915/i915_driver.c
+++ b/drivers/gpu/drm/i915/i915_driver.c
@@ -73,6 +73,7 @@
 
 #include "i915_debugfs.h"
 #include "i915_driver.h"
+#include "i915_drm_client.h"
 #include "i915_drv.h"
 #include "i915_ioc32.h"
 #include "i915_irq.h"
@@ -349,6 +350,8 @@ static int i915_driver_early_probe(struct drm_i915_private *dev_priv)
 
 	intel_gt_init_early(&dev_priv->gt, dev_priv);
 
+	i915_drm_clients_init(&dev_priv->clients, dev_priv);
+
 	i915_gem_init_early(dev_priv);
 
 	/* This must be called before any calls to HAS_PCH_* */
@@ -368,6 +371,7 @@ static int i915_driver_early_probe(struct drm_i915_private *dev_priv)
 
 err_gem:
 	i915_gem_cleanup_early(dev_priv);
+	i915_drm_clients_fini(&dev_priv->clients);
 	intel_gt_driver_late_release(&dev_priv->gt);
 	intel_region_ttm_device_fini(dev_priv);
 err_ttm:
@@ -387,6 +391,7 @@ static void i915_driver_late_release(struct drm_i915_private *dev_priv)
 	intel_irq_fini(dev_priv);
 	intel_power_domains_cleanup(dev_priv);
 	i915_gem_cleanup_early(dev_priv);
+	i915_drm_clients_fini(&dev_priv->clients);
 	intel_gt_driver_late_release(&dev_priv->gt);
 	intel_region_ttm_device_fini(dev_priv);
 	vlv_suspend_cleanup(dev_priv);
@@ -1017,6 +1022,7 @@ static void i915_driver_postclose(struct drm_device *dev, struct drm_file *file)
 	struct drm_i915_file_private *file_priv = file->driver_priv;
 
 	i915_gem_context_close(file);
+	i915_drm_client_put(file_priv->client);
 
 	kfree_rcu(file_priv, rcu);
 
diff --git a/drivers/gpu/drm/i915/i915_drm_client.c b/drivers/gpu/drm/i915/i915_drm_client.c
new file mode 100644
index 000000000000..e61e9ba15256
--- /dev/null
+++ b/drivers/gpu/drm/i915/i915_drm_client.c
@@ -0,0 +1,68 @@
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
+	clients->next_id = 0;
+
+	xa_init_flags(&clients->xarray, XA_FLAGS_ALLOC | XA_FLAGS_LOCK_IRQ);
+}
+
+struct i915_drm_client *i915_drm_client_add(struct i915_drm_clients *clients)
+{
+	struct i915_drm_client *client;
+	struct xarray *xa = &clients->xarray;
+	int ret;
+
+	client = kzalloc(sizeof(*client), GFP_KERNEL);
+	if (!client)
+		return ERR_PTR(-ENOMEM);
+
+	xa_lock_irq(xa);
+	ret = __xa_alloc_cyclic(xa, &client->id, client, xa_limit_32b,
+				&clients->next_id, GFP_KERNEL);
+	xa_unlock_irq(xa);
+	if (ret < 0)
+		goto err;
+
+	kref_init(&client->kref);
+	client->clients = clients;
+
+	return client;
+
+err:
+	kfree(client);
+
+	return ERR_PTR(ret);
+}
+
+void __i915_drm_client_free(struct kref *kref)
+{
+	struct i915_drm_client *client =
+		container_of(kref, typeof(*client), kref);
+	struct xarray *xa = &client->clients->xarray;
+	unsigned long flags;
+
+	xa_lock_irqsave(xa, flags);
+	__xa_erase(xa, client->id);
+	xa_unlock_irqrestore(xa, flags);
+	kfree(client);
+}
+
+void i915_drm_clients_fini(struct i915_drm_clients *clients)
+{
+	GEM_BUG_ON(!xa_empty(&clients->xarray));
+	xa_destroy(&clients->xarray);
+}
diff --git a/drivers/gpu/drm/i915/i915_drm_client.h b/drivers/gpu/drm/i915/i915_drm_client.h
new file mode 100644
index 000000000000..e8986ad51176
--- /dev/null
+++ b/drivers/gpu/drm/i915/i915_drm_client.h
@@ -0,0 +1,50 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2020 Intel Corporation
+ */
+
+#ifndef __I915_DRM_CLIENT_H__
+#define __I915_DRM_CLIENT_H__
+
+#include <linux/kref.h>
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
+	unsigned int id;
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
+struct i915_drm_client *i915_drm_client_add(struct i915_drm_clients *clients);
+
+void i915_drm_clients_fini(struct i915_drm_clients *clients);
+
+#endif /* !__I915_DRM_CLIENT_H__ */
diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
index 85bb8d3107f0..d44016bbb0e4 100644
--- a/drivers/gpu/drm/i915/i915_drv.h
+++ b/drivers/gpu/drm/i915/i915_drv.h
@@ -96,6 +96,7 @@
 #include "intel_wakeref.h"
 #include "intel_wopcm.h"
 
+#include "i915_drm_client.h"
 #include "i915_gem.h"
 #include "i915_gem_gtt.h"
 #include "i915_gpu_error.h"
@@ -258,6 +259,8 @@ struct drm_i915_file_private {
 	/** ban_score: Accumulated score of all ctx bans and fast hangs. */
 	atomic_t ban_score;
 	unsigned long hang_timestamp;
+
+	struct i915_drm_client *client;
 };
 
 /* Interface history:
@@ -1048,6 +1051,8 @@ struct drm_i915_private {
 
 	struct i915_pmu pmu;
 
+	struct i915_drm_clients clients;
+
 	struct i915_hdcp_comp_master *hdcp_master;
 	bool hdcp_comp_added;
 
diff --git a/drivers/gpu/drm/i915/i915_gem.c b/drivers/gpu/drm/i915/i915_gem.c
index 527228d4da7e..c5b58a2512de 100644
--- a/drivers/gpu/drm/i915/i915_gem.c
+++ b/drivers/gpu/drm/i915/i915_gem.c
@@ -1178,25 +1178,40 @@ void i915_gem_cleanup_early(struct drm_i915_private *dev_priv)
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
+	client = i915_drm_client_add(&i915->clients);
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
+	i915_drm_client_put(client);
+err_client:
+	kfree(file_priv);
+err_alloc:
 	return ret;
 }
 
-- 
2.32.0

