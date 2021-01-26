Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 941A9304BA4
	for <lists+dri-devel@lfdr.de>; Tue, 26 Jan 2021 22:44:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4674B6E466;
	Tue, 26 Jan 2021 21:44:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4914F6E171;
 Tue, 26 Jan 2021 21:44:38 +0000 (UTC)
IronPort-SDR: 78/eRlEvNkkR8qf7PBlMeKsmzGXEHeBH5z3/1c14GMoeENQHKjov/NWVSDUyOPeacEAPKIILP0
 fnkuCkdZ8JTQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9876"; a="198770828"
X-IronPort-AV: E=Sophos;i="5.79,377,1602572400"; d="scan'208";a="198770828"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2021 13:44:37 -0800
IronPort-SDR: tIdx5mzUYWnmP9Naq10L31XyFyKJMLQZTtXw82/SLdxN/7YkQ4w8MmNV01yngExONP6ZgG/XHX
 VLknynncDPPQ==
X-IronPort-AV: E=Sophos;i="5.79,377,1602572400"; d="scan'208";a="362139887"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.76])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-SHA;
 26 Jan 2021 13:44:37 -0800
From: Brian Welty <brian.welty@intel.com>
To: Brian Welty <brian.welty@intel.com>, cgroups@vger.kernel.org,
 Tejun Heo <tj@kernel.org>, dri-devel@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Kenny Ho <Kenny.Ho@amd.com>, amd-gfx@lists.freedesktop.org,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 intel-gfx@lists.freedesktop.org,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Eero Tamminen <eero.t.tamminen@intel.com>
Subject: [RFC PATCH 2/9] drm, cgroup: Bind drm and cgroup subsystem
Date: Tue, 26 Jan 2021 13:46:19 -0800
Message-Id: <20210126214626.16260-3-brian.welty@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210126214626.16260-1-brian.welty@intel.com>
References: <20210126214626.16260-1-brian.welty@intel.com>
MIME-Version: 1.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Kenny Ho <Kenny.Ho@amd.com>

Since the drm subsystem can be compiled as a module and drm devices can
be added and removed during run time, add several functions to bind the
drm subsystem as well as drm devices with drmcg.

Two pairs of functions:
drmcg_bind/drmcg_unbind - used to bind/unbind the drm subsystem to the
cgroup subsystem as the drm core initialize/exit.

drmcg_register_dev/drmcg_unregister_dev - used to register/unregister
drm devices to the cgroup subsystem as the devices are presented/removed
from userspace.

Signed-off-by: Kenny Ho <Kenny.Ho@amd.com>
---
 drivers/gpu/drm/drm_drv.c  |   8 +++
 include/drm/drm_cgroup.h   |  39 +++++++++++
 include/linux/cgroup_drm.h |   4 ++
 kernel/cgroup/drm.c        | 131 +++++++++++++++++++++++++++++++++++++
 4 files changed, 182 insertions(+)
 create mode 100644 include/drm/drm_cgroup.h

diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
index 20d22e41d7ce..3b940926d672 100644
--- a/drivers/gpu/drm/drm_drv.c
+++ b/drivers/gpu/drm/drm_drv.c
@@ -42,6 +42,7 @@
 #include <drm/drm_managed.h>
 #include <drm/drm_mode_object.h>
 #include <drm/drm_print.h>
+#include <drm/drm_cgroup.h>
 
 #include "drm_crtc_internal.h"
 #include "drm_internal.h"
@@ -893,6 +894,8 @@ int drm_dev_register(struct drm_device *dev, unsigned long flags)
 	if (drm_core_check_feature(dev, DRIVER_MODESET))
 		drm_modeset_register_all(dev);
 
+	drmcg_register_dev(dev);
+
 	DRM_INFO("Initialized %s %d.%d.%d %s for %s on minor %d\n",
 		 driver->name, driver->major, driver->minor,
 		 driver->patchlevel, driver->date,
@@ -928,6 +931,8 @@ EXPORT_SYMBOL(drm_dev_register);
  */
 void drm_dev_unregister(struct drm_device *dev)
 {
+	drmcg_unregister_dev(dev);
+
 	if (drm_core_check_feature(dev, DRIVER_LEGACY))
 		drm_lastclose(dev);
 
@@ -1030,6 +1035,7 @@ static const struct file_operations drm_stub_fops = {
 
 static void drm_core_exit(void)
 {
+	drmcg_unbind();
 	unregister_chrdev(DRM_MAJOR, "drm");
 	debugfs_remove(drm_debugfs_root);
 	drm_sysfs_destroy();
@@ -1056,6 +1062,8 @@ static int __init drm_core_init(void)
 	if (ret < 0)
 		goto error;
 
+	drmcg_bind(&drm_minor_acquire, &drm_dev_put);
+
 	drm_core_init_complete = true;
 
 	DRM_DEBUG("Initialized\n");
diff --git a/include/drm/drm_cgroup.h b/include/drm/drm_cgroup.h
new file mode 100644
index 000000000000..530c9a0b3238
--- /dev/null
+++ b/include/drm/drm_cgroup.h
@@ -0,0 +1,39 @@
+/* SPDX-License-Identifier: MIT
+ * Copyright 2019 Advanced Micro Devices, Inc.
+ */
+#ifndef __DRM_CGROUP_H__
+#define __DRM_CGROUP_H__
+
+#ifdef CONFIG_CGROUP_DRM
+
+void drmcg_bind(struct drm_minor (*(*acq_dm)(unsigned int minor_id)),
+		void (*put_ddev)(struct drm_device *dev));
+
+void drmcg_unbind(void);
+
+void drmcg_register_dev(struct drm_device *dev);
+
+void drmcg_unregister_dev(struct drm_device *dev);
+
+#else
+
+static inline void drmcg_bind(
+		struct drm_minor (*(*acq_dm)(unsigned int minor_id)),
+		void (*put_ddev)(struct drm_device *dev))
+{
+}
+
+static inline void drmcg_unbind(void)
+{
+}
+
+static inline void drmcg_register_dev(struct drm_device *dev)
+{
+}
+
+static inline void drmcg_unregister_dev(struct drm_device *dev)
+{
+}
+
+#endif /* CONFIG_CGROUP_DRM */
+#endif /* __DRM_CGROUP_H__ */
diff --git a/include/linux/cgroup_drm.h b/include/linux/cgroup_drm.h
index 345af54a5d41..307bb75db248 100644
--- a/include/linux/cgroup_drm.h
+++ b/include/linux/cgroup_drm.h
@@ -5,6 +5,10 @@
 #define _CGROUP_DRM_H
 
 #include <linux/cgroup.h>
+#include <drm/drm_file.h>
+
+/* limit defined per the way drm_minor_alloc operates */
+#define MAX_DRM_DEV (64 * DRM_MINOR_RENDER)
 
 #ifdef CONFIG_CGROUP_DRM
 
diff --git a/kernel/cgroup/drm.c b/kernel/cgroup/drm.c
index 5e38a8230922..061bb9c458e4 100644
--- a/kernel/cgroup/drm.c
+++ b/kernel/cgroup/drm.c
@@ -1,11 +1,142 @@
 // SPDX-License-Identifier: MIT
 // Copyright 2019 Advanced Micro Devices, Inc.
+#include <linux/bitmap.h>
+#include <linux/mutex.h>
 #include <linux/slab.h>
 #include <linux/cgroup.h>
 #include <linux/cgroup_drm.h>
+#include <drm/drm_file.h>
+#include <drm/drm_device.h>
+#include <drm/drm_cgroup.h>
 
 static struct drmcg *root_drmcg __read_mostly;
 
+/* global mutex for drmcg across all devices */
+static DEFINE_MUTEX(drmcg_mutex);
+
+static DECLARE_BITMAP(known_devs, MAX_DRM_DEV);
+
+static struct drm_minor (*(*acquire_drm_minor)(unsigned int minor_id));
+
+static void (*put_drm_dev)(struct drm_device *dev);
+
+/**
+ * drmcg_bind - Bind DRM subsystem to cgroup subsystem
+ * @acq_dm: function pointer to the drm_minor_acquire function
+ * @put_ddev: function pointer to the drm_dev_put function
+ *
+ * This function binds some functions from the DRM subsystem and make
+ * them available to the drmcg subsystem.
+ *
+ * drmcg_unbind does the opposite of this function
+ */
+void drmcg_bind(struct drm_minor (*(*acq_dm)(unsigned int minor_id)),
+		void (*put_ddev)(struct drm_device *dev))
+{
+	mutex_lock(&drmcg_mutex);
+	acquire_drm_minor = acq_dm;
+	put_drm_dev = put_ddev;
+	mutex_unlock(&drmcg_mutex);
+}
+EXPORT_SYMBOL(drmcg_bind);
+
+/**
+ * drmcg_unbind - Unbind DRM subsystem from cgroup subsystem
+ *
+ * drmcg_bind does the opposite of this function
+ */
+void drmcg_unbind(void)
+{
+	mutex_lock(&drmcg_mutex);
+	acquire_drm_minor = NULL;
+	put_drm_dev = NULL;
+	mutex_unlock(&drmcg_mutex);
+}
+EXPORT_SYMBOL(drmcg_unbind);
+
+/**
+ * drmcg_register_dev - register a DRM device for usage in drm cgroup
+ * @dev: DRM device
+ *
+ * This function make a DRM device visible to the cgroup subsystem.
+ * Once the drmcg is aware of the device, drmcg can start tracking and
+ * control resource usage for said device.
+ *
+ * drmcg_unregister_dev reverse the operation of this function
+ */
+void drmcg_register_dev(struct drm_device *dev)
+{
+	if (WARN_ON(dev->primary->index >= MAX_DRM_DEV))
+		return;
+
+	mutex_lock(&drmcg_mutex);
+	set_bit(dev->primary->index, known_devs);
+	mutex_unlock(&drmcg_mutex);
+}
+EXPORT_SYMBOL(drmcg_register_dev);
+
+/**
+ * drmcg_unregister_dev - Iterate through all stored DRM minors
+ * @dev: DRM device
+ *
+ * Unregister @dev so that drmcg no longer control resource usage
+ * of @dev.  The @dev was registered to drmcg using
+ * drmcg_register_dev function
+ */
+void drmcg_unregister_dev(struct drm_device *dev)
+{
+	if (WARN_ON(dev->primary->index >= MAX_DRM_DEV))
+		return;
+
+	mutex_lock(&drmcg_mutex);
+	clear_bit(dev->primary->index, known_devs);
+	mutex_unlock(&drmcg_mutex);
+}
+EXPORT_SYMBOL(drmcg_unregister_dev);
+
+/**
+ * drm_minor_for_each - Iterate through all stored DRM minors
+ * @fn: Function to be called for each pointer.
+ * @data: Data passed to callback function.
+ *
+ * The callback function will be called for each registered device, passing
+ * the minor, the @drm_minor entry and @data.
+ *
+ * If @fn returns anything other than %0, the iteration stops and that
+ * value is returned from this function.
+ */
+static int drm_minor_for_each(int (*fn)(int id, void *p, void *data),
+		void *data)
+{
+	int rc = 0;
+
+	mutex_lock(&drmcg_mutex);
+	if (acquire_drm_minor) {
+		unsigned int minor;
+		struct drm_minor *dm;
+
+		minor = find_next_bit(known_devs, MAX_DRM_DEV, 0);
+		while (minor < MAX_DRM_DEV) {
+			dm = acquire_drm_minor(minor);
+
+			if (IS_ERR(dm))
+				continue;
+
+			rc = fn(minor, (void *)dm, data);
+
+			put_drm_dev(dm->dev); /* release from acquire_drm_minor */
+
+			if (rc)
+				break;
+
+			minor = find_next_bit(known_devs, MAX_DRM_DEV, minor+1);
+		}
+	}
+	mutex_unlock(&drmcg_mutex);
+
+	return rc;
+}
+
 static void drmcg_css_free(struct cgroup_subsys_state *css)
 {
 	struct drmcg *drmcg = css_to_drmcg(css);
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
