Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 96148667C11
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jan 2023 17:57:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 137AC10E303;
	Thu, 12 Jan 2023 16:57:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DFF410E302;
 Thu, 12 Jan 2023 16:57:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1673542663; x=1705078663;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=LFWfaBaBSYjaapQ05IsoDGjzc+hjHAEDqfXfuRz8U04=;
 b=BLVhTCZe5dbPS7Z8txJ5Sjh5isfBiOHjKxHfGoEDHf39kMqiEhA1Il4E
 wXK0ueIYM0uJ4pPfwHwTMVJaOf0SKU2BOYC9H4asWofyz2GG8hqmWAU0K
 Grb+lnXD3cwcLX3/T1Vc9CYmVBqNyqApP+g06NNnCN0/GBribmAWxdJPW
 +UZWQwEvQrztHJ+szYLQ2K6cEnymznI3wxcVJkkLfDgNlfLrafciFaFaH
 31Jw9/mMqaJAJ/5+ikyqLt4kqAiPvieC8szV5XArygwrBN22wopgiffoD
 tpX1nJN6/1xJmPoYuKXDK0PI+IZ62i6jfA6AvmKGXdbXfeytVnZajgJy4 w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10588"; a="325016405"
X-IronPort-AV: E=Sophos;i="5.97,211,1669104000"; d="scan'208";a="325016405"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2023 08:56:42 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10588"; a="651232669"
X-IronPort-AV: E=Sophos;i="5.97,211,1669104000"; d="scan'208";a="651232669"
Received: from jacton-mobl.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.213.195.171])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2023 08:56:38 -0800
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [RFC 04/12] drm/cgroup: Track clients per owning process
Date: Thu, 12 Jan 2023 16:56:01 +0000
Message-Id: <20230112165609.1083270-5-tvrtko.ursulin@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230112165609.1083270-1-tvrtko.ursulin@linux.intel.com>
References: <20230112165609.1083270-1-tvrtko.ursulin@linux.intel.com>
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
Cc: Rob Clark <robdclark@chromium.org>, Brian Welty <brian.welty@intel.com>,
 Kenny.Ho@amd.com, Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Johannes Weiner <hannes@cmpxchg.org>,
 linux-kernel@vger.kernel.org,
 =?UTF-8?q?St=C3=A9phane=20Marchesin?= <marcheu@chromium.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Zefan Li <lizefan.x@bytedance.com>, Dave Airlie <airlied@redhat.com>,
 Tejun Heo <tj@kernel.org>, cgroups@vger.kernel.org,
 "T . J . Mercier" <tjmercier@google.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

To enable propagation of settings from the cgroup drm controller to drm we
need to start tracking which processes own which drm clients.

Implement that by tracking the struct pid pointer of the owning process in
a new XArray, pointing to a structure containing a list of associated
struct drm_file pointers.

Clients are added and removed under the filelist mutex and RCU list
operations are used below it to allow for lockless lookup.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
---
 drivers/gpu/drm/Makefile     |   1 +
 drivers/gpu/drm/drm_cgroup.c | 133 +++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/drm_file.c   |  20 ++++--
 include/drm/drm_clients.h    |  44 ++++++++++++
 include/drm/drm_file.h       |   4 ++
 5 files changed, 198 insertions(+), 4 deletions(-)
 create mode 100644 drivers/gpu/drm/drm_cgroup.c
 create mode 100644 include/drm/drm_clients.h

diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
index 496fa5a6147a..c036b1b379c4 100644
--- a/drivers/gpu/drm/Makefile
+++ b/drivers/gpu/drm/Makefile
@@ -59,6 +59,7 @@ drm-$(CONFIG_DRM_LEGACY) += \
 	drm_scatter.o \
 	drm_vm.o
 drm-$(CONFIG_DRM_LIB_RANDOM) += lib/drm_random.o
+drm-$(CONFIG_CGROUP_DRM) += drm_cgroup.o
 drm-$(CONFIG_COMPAT) += drm_ioc32.o
 drm-$(CONFIG_DRM_PANEL) += drm_panel.o
 drm-$(CONFIG_OF) += drm_of.o
diff --git a/drivers/gpu/drm/drm_cgroup.c b/drivers/gpu/drm/drm_cgroup.c
new file mode 100644
index 000000000000..d91512a560ff
--- /dev/null
+++ b/drivers/gpu/drm/drm_cgroup.c
@@ -0,0 +1,133 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2022 Intel Corporation
+ */
+
+#include <drm/drm_drv.h>
+#include <drm/drm_clients.h>
+#include <drm/drm_print.h>
+
+static DEFINE_XARRAY(drm_pid_clients);
+
+static void
+__del_clients(struct drm_pid_clients *clients,
+	      struct drm_file *file_priv,
+	      unsigned long pid)
+{
+	list_del_rcu(&file_priv->clink);
+	if (atomic_dec_and_test(&clients->num)) {
+		xa_erase(&drm_pid_clients, pid);
+		kfree_rcu(clients, rcu);
+	}
+}
+
+void drm_clients_close(struct drm_file *file_priv)
+{
+	struct drm_device *dev = file_priv->minor->dev;
+	struct drm_pid_clients *clients;
+	struct pid *pid;
+
+	lockdep_assert_held(&dev->filelist_mutex);
+
+	pid = rcu_access_pointer(file_priv->pid);
+	clients = xa_load(&drm_pid_clients, (unsigned long)pid);
+	if (drm_WARN_ON_ONCE(dev, !clients))
+		return;
+
+	__del_clients(clients, file_priv, (unsigned long)pid);
+}
+
+static struct drm_pid_clients *__alloc_clients(void)
+{
+	struct drm_pid_clients *clients;
+
+	clients = kmalloc(sizeof(*clients), GFP_KERNEL);
+	if (clients) {
+		atomic_set(&clients->num, 0);
+		INIT_LIST_HEAD(&clients->file_list);
+		init_rcu_head(&clients->rcu);
+	}
+
+	return clients;
+}
+
+int drm_clients_open(struct drm_file *file_priv)
+{
+	struct drm_device *dev = file_priv->minor->dev;
+	struct drm_pid_clients *clients;
+	bool new_client = false;
+	unsigned long pid;
+
+	lockdep_assert_held(&dev->filelist_mutex);
+
+	pid = (unsigned long)rcu_access_pointer(file_priv->pid);
+	clients = xa_load(&drm_pid_clients, pid);
+	if (!clients) {
+		clients = __alloc_clients();
+		if (!clients)
+			return -ENOMEM;
+		new_client = true;
+	}
+	atomic_inc(&clients->num);
+	list_add_tail_rcu(&file_priv->clink, &clients->file_list);
+	if (new_client) {
+		void *xret;
+
+		xret = xa_store(&drm_pid_clients, pid, clients, GFP_KERNEL);
+		if (xa_err(xret)) {
+			list_del_init(&file_priv->clink);
+			kfree(clients);
+			return PTR_ERR(clients);
+		}
+	}
+
+	return 0;
+}
+
+void
+drm_clients_migrate(struct drm_file *file_priv,
+		    struct pid *old,
+		    struct pid *new)
+{
+	struct drm_device *dev = file_priv->minor->dev;
+	struct drm_pid_clients *existing_clients;
+	struct drm_pid_clients *clients;
+
+	lockdep_assert_held(&dev->filelist_mutex);
+
+	existing_clients = xa_load(&drm_pid_clients, (unsigned long)new);
+	clients = xa_load(&drm_pid_clients, (unsigned long)old);
+
+	if (drm_WARN_ON_ONCE(dev, !clients))
+		return;
+	else if (drm_WARN_ON_ONCE(dev, clients == existing_clients))
+		return;
+
+	__del_clients(clients, file_priv, (unsigned long)old);
+
+	if (!existing_clients) {
+		void *xret;
+
+		clients = __alloc_clients();
+		if (!clients)
+			goto err;
+
+		xret = xa_store(&drm_pid_clients, (unsigned long)new, clients,
+				GFP_KERNEL);
+		if (xa_err(xret))
+			goto err;
+	} else {
+		clients = existing_clients;
+	}
+
+	atomic_inc(&clients->num);
+	list_add_tail_rcu(&file_priv->clink, &clients->file_list);
+
+	return;
+
+err:
+	rcu_read_lock();
+	drm_warn(dev, "Failed to migrate client from pid %u to %u!\n",
+		 pid_nr(old), pid_nr(new));
+	rcu_read_unlock();
+}
diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
index f2f8175ece15..5cf446f721f8 100644
--- a/drivers/gpu/drm/drm_file.c
+++ b/drivers/gpu/drm/drm_file.c
@@ -40,6 +40,7 @@
 #include <linux/slab.h>
 
 #include <drm/drm_client.h>
+#include <drm/drm_clients.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_file.h>
 #include <drm/drm_print.h>
@@ -298,6 +299,7 @@ static void drm_close_helper(struct file *filp)
 
 	mutex_lock(&dev->filelist_mutex);
 	list_del(&file_priv->lhead);
+	drm_clients_close(file_priv);
 	mutex_unlock(&dev->filelist_mutex);
 
 	drm_file_free(file_priv);
@@ -349,10 +351,8 @@ int drm_open_helper(struct file *filp, struct drm_minor *minor)
 
 	if (drm_is_primary_client(priv)) {
 		ret = drm_master_open(priv);
-		if (ret) {
-			drm_file_free(priv);
-			return ret;
-		}
+		if (ret)
+			goto err_free;
 	}
 
 	filp->private_data = priv;
@@ -360,6 +360,9 @@ int drm_open_helper(struct file *filp, struct drm_minor *minor)
 	priv->filp = filp;
 
 	mutex_lock(&dev->filelist_mutex);
+	ret = drm_clients_open(priv);
+	if (ret)
+		goto err_unlock;
 	list_add(&priv->lhead, &dev->filelist);
 	mutex_unlock(&dev->filelist_mutex);
 
@@ -387,6 +390,13 @@ int drm_open_helper(struct file *filp, struct drm_minor *minor)
 #endif
 
 	return 0;
+
+err_unlock:
+	mutex_unlock(&dev->filelist_mutex);
+err_free:
+	drm_file_free(priv);
+
+	return ret;
 }
 
 /**
@@ -526,6 +536,8 @@ void drm_file_update_pid(struct drm_file *filp)
 	dev = filp->minor->dev;
 	mutex_lock(&dev->filelist_mutex);
 	old = rcu_replace_pointer(filp->pid, pid, 1);
+	if (pid != old)
+		drm_clients_migrate(filp, old, pid);
 	mutex_unlock(&dev->filelist_mutex);
 
 	if (pid != old) {
diff --git a/include/drm/drm_clients.h b/include/drm/drm_clients.h
new file mode 100644
index 000000000000..2732fffab3f0
--- /dev/null
+++ b/include/drm/drm_clients.h
@@ -0,0 +1,44 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2022 Intel Corporation
+ */
+
+#ifndef _DRM_CLIENTS_H_
+#define _DRM_CLIENTS_H_
+
+#include <linux/pid.h>
+
+#include <drm/drm_file.h>
+
+struct drm_pid_clients {
+	atomic_t num;
+	struct list_head file_list;
+	struct rcu_head rcu;
+};
+
+#if IS_ENABLED(CONFIG_CGROUP_DRM)
+void drm_clients_close(struct drm_file *file_priv);
+int drm_clients_open(struct drm_file *file_priv);
+
+void
+drm_clients_migrate(struct drm_file *file_priv,
+		    struct pid *old, struct pid *new);
+#else
+static inline void drm_clients_close(struct drm_file *file_priv)
+{
+}
+
+static inline int drm_clients_open(struct drm_file *file_priv)
+{
+	return 0;
+}
+
+static void
+drm_clients_migrate(struct drm_file *file_priv,
+		    struct pid *old, struct pid *new)
+{
+
+}
+#endif
+
+#endif
diff --git a/include/drm/drm_file.h b/include/drm/drm_file.h
index 27d545131d4a..644c5b17d6a7 100644
--- a/include/drm/drm_file.h
+++ b/include/drm/drm_file.h
@@ -279,6 +279,10 @@ struct drm_file {
 	/** @minor: &struct drm_minor for this file. */
 	struct drm_minor *minor;
 
+#if IS_ENABLED(CONFIG_CGROUP_DRM)
+	struct list_head clink;
+#endif
+
 	/**
 	 * @object_idr:
 	 *
-- 
2.34.1

