Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 816174EDB5F
	for <lists+dri-devel@lfdr.de>; Thu, 31 Mar 2022 16:09:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F0EF10E331;
	Thu, 31 Mar 2022 14:09:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D77CA10E24B;
 Thu, 31 Mar 2022 14:09:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648735768; x=1680271768;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=LtD+eh3+kfGMxzyWaabXPEKxDWSckfiN9pftCap9BvY=;
 b=i/vB6W1Zid0p+/HlLfpM/qiKBXIqIs3XBjD6yfks9u/EzObrEyxURPmL
 Fhe66MTZR/nxtOJQSOF/Y6EJPN9GVSTJ0+oWBKdoCPvvJ7x+4oNPSFUtd
 WjetHq2Q1gvRMt88pqsOAg8dVID/PPeO8HSyAJ836gXe2CKfXLIpGPWcf
 /x58JPdcn8fztAMOGuBmHYYVSQbWDGW1xbOFLCUPM3bMAmumTpNvc9HzG
 ZGpbIhU1FVBUHDS+3GUy6PAW91bcvjWtUr7h423YFNLFYdgDvy67l5A6L
 mAJIwoOUM1H63s/vsg2jDi0xnrgClru0sZXLBTBgeRgwNTk3PkfStDrnw A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10302"; a="259825412"
X-IronPort-AV: E=Sophos;i="5.90,225,1643702400"; d="scan'208";a="259825412"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2022 07:09:28 -0700
X-IronPort-AV: E=Sophos;i="5.90,225,1643702400"; d="scan'208";a="606114168"
Received: from juanniex-mobl.ger.corp.intel.com (HELO tursulin-mobl2.home)
 ([10.213.215.247])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2022 07:09:27 -0700
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Intel-gfx@lists.freedesktop.org
Subject: [PATCH 1/8] drm/i915: Explicitly track DRM clients
Date: Thu, 31 Mar 2022 15:09:13 +0100
Message-Id: <20220331140920.2986689-2-tvrtko.ursulin@linux.intel.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220331140920.2986689-1-tvrtko.ursulin@linux.intel.com>
References: <20220331140920.2986689-1-tvrtko.ursulin@linux.intel.com>
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
Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 drivers/gpu/drm/i915/Makefile            |  1 +
 drivers/gpu/drm/i915/i915_driver.c       |  6 +++
 drivers/gpu/drm/i915/i915_drm_client.c   | 68 ++++++++++++++++++++++++
 drivers/gpu/drm/i915/i915_drm_client.h   | 50 +++++++++++++++++
 drivers/gpu/drm/i915/i915_drv.h          |  3 ++
 drivers/gpu/drm/i915/i915_file_private.h |  3 ++
 drivers/gpu/drm/i915/i915_gem.c          | 21 ++++++--
 7 files changed, 149 insertions(+), 3 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/i915_drm_client.c
 create mode 100644 drivers/gpu/drm/i915/i915_drm_client.h

diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
index c1d5540f6052..6d4c628ae355 100644
--- a/drivers/gpu/drm/i915/Makefile
+++ b/drivers/gpu/drm/i915/Makefile
@@ -32,6 +32,7 @@ subdir-ccflags-y += -I$(srctree)/$(src)
 
 # core driver code
 i915-y += i915_driver.o \
+	  i915_drm_client.o \
 	  i915_config.o \
 	  i915_getparam.o \
 	  i915_ioctl.o \
diff --git a/drivers/gpu/drm/i915/i915_driver.c b/drivers/gpu/drm/i915/i915_driver.c
index 15808ecc421a..b2df273e6d7b 100644
--- a/drivers/gpu/drm/i915/i915_driver.c
+++ b/drivers/gpu/drm/i915/i915_driver.c
@@ -77,6 +77,7 @@
 #include "i915_file_private.h"
 #include "i915_debugfs.h"
 #include "i915_driver.h"
+#include "i915_drm_client.h"
 #include "i915_drv.h"
 #include "i915_getparam.h"
 #include "i915_ioc32.h"
@@ -355,6 +356,8 @@ static int i915_driver_early_probe(struct drm_i915_private *dev_priv)
 
 	intel_root_gt_init_early(dev_priv);
 
+	i915_drm_clients_init(&dev_priv->clients, dev_priv);
+
 	i915_gem_init_early(dev_priv);
 
 	/* This must be called before any calls to HAS_PCH_* */
@@ -375,6 +378,7 @@ static int i915_driver_early_probe(struct drm_i915_private *dev_priv)
 err_gem:
 	i915_gem_cleanup_early(dev_priv);
 	intel_gt_driver_late_release_all(dev_priv);
+	i915_drm_clients_fini(&dev_priv->clients);
 	intel_region_ttm_device_fini(dev_priv);
 err_ttm:
 	vlv_suspend_cleanup(dev_priv);
@@ -394,6 +398,7 @@ static void i915_driver_late_release(struct drm_i915_private *dev_priv)
 	intel_power_domains_cleanup(dev_priv);
 	i915_gem_cleanup_early(dev_priv);
 	intel_gt_driver_late_release_all(dev_priv);
+	i915_drm_clients_fini(&dev_priv->clients);
 	intel_region_ttm_device_fini(dev_priv);
 	vlv_suspend_cleanup(dev_priv);
 	i915_workqueues_cleanup(dev_priv);
@@ -1009,6 +1014,7 @@ static void i915_driver_postclose(struct drm_device *dev, struct drm_file *file)
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
index 799f386a7ef2..bbda3e01d03d 100644
--- a/drivers/gpu/drm/i915/i915_drv.h
+++ b/drivers/gpu/drm/i915/i915_drv.h
@@ -61,6 +61,7 @@
 #include "gt/intel_workarounds.h"
 #include "gt/uc/intel_uc.h"
 
+#include "i915_drm_client.h"
 #include "i915_gem.h"
 #include "i915_gpu_error.h"
 #include "i915_params.h"
@@ -826,6 +827,8 @@ struct drm_i915_private {
 
 	struct i915_pmu pmu;
 
+	struct i915_drm_clients clients;
+
 	struct i915_hdcp_comp_master *hdcp_master;
 	bool hdcp_comp_added;
 
diff --git a/drivers/gpu/drm/i915/i915_file_private.h b/drivers/gpu/drm/i915/i915_file_private.h
index fb16cc431b2a..f42877869692 100644
--- a/drivers/gpu/drm/i915/i915_file_private.h
+++ b/drivers/gpu/drm/i915/i915_file_private.h
@@ -12,6 +12,7 @@
 
 struct drm_i915_private;
 struct drm_file;
+struct i915_drm_client;
 
 struct drm_i915_file_private {
 	struct drm_i915_private *dev_priv;
@@ -103,6 +104,8 @@ struct drm_i915_file_private {
 	/** ban_score: Accumulated score of all ctx bans and fast hangs. */
 	atomic_t ban_score;
 	unsigned long hang_timestamp;
+
+	struct i915_drm_client *client;
 };
 
 #endif /* __I915_FILE_PRIVATE_H__ */
diff --git a/drivers/gpu/drm/i915/i915_gem.c b/drivers/gpu/drm/i915/i915_gem.c
index 44741f842852..702e5b89be22 100644
--- a/drivers/gpu/drm/i915/i915_gem.c
+++ b/drivers/gpu/drm/i915/i915_gem.c
@@ -1227,25 +1227,40 @@ void i915_gem_cleanup_early(struct drm_i915_private *dev_priv)
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

