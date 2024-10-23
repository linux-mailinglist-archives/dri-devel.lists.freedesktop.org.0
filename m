Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AFA4F9AC0DD
	for <lists+dri-devel@lfdr.de>; Wed, 23 Oct 2024 10:00:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D04510E779;
	Wed, 23 Oct 2024 08:00:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mblankhorst.nl (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A127510E77D
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Oct 2024 08:00:52 +0000 (UTC)
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: intel-xe@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Tejun Heo <tj@kernel.org>,
 Zefan Li <lizefan.x@bytedance.com>, Johannes Weiner <hannes@cmpxchg.org>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: Friedrich Vock <friedrich.vock@gmx.de>, cgroups@vger.kernel.org,
 linux-mm@kvack.org, Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: [PATCH 7/7] [DISCUSSION] drm/gem: Add cgroup memory accounting
Date: Wed, 23 Oct 2024 09:53:00 +0200
Message-ID: <20241023075302.27194-8-maarten.lankhorst@linux.intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241023075302.27194-1-maarten.lankhorst@linux.intel.com>
References: <20241023075302.27194-1-maarten.lankhorst@linux.intel.com>
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

From: Maxime Ripard <mripard@kernel.org>

In order to support any device using the GEM support, let's register a
dev cgroup device in the drm_dev_register path, and account for
allocated buffers in the buffer allocation path.

Marked discussion by Maarten Lankhorst:
This is only implemented for drm_gem_dma_helper.c, and breaks the other
drivers. It's still here for discussion, as we need to figure out how to
make something like this work for both TTM and GEM drivers.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
---
 drivers/gpu/drm/drm_drv.c            | 11 ++++++++++-
 drivers/gpu/drm/drm_gem.c            |  4 ++++
 drivers/gpu/drm/drm_gem_dma_helper.c |  4 ++++
 include/drm/drm_device.h             |  4 ++++
 include/drm/drm_gem.h                |  2 ++
 5 files changed, 24 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
index 251d1d69b09c5..6b1cffd1f52c6 100644
--- a/drivers/gpu/drm/drm_drv.c
+++ b/drivers/gpu/drm/drm_drv.c
@@ -930,6 +930,12 @@ int drm_dev_register(struct drm_device *dev, unsigned long flags)
 	if (drm_dev_needs_global_mutex(dev))
 		mutex_lock(&drm_global_mutex);
 
+	ret = drmm_cgroup_register_device(dev, &dev->cg);
+	if (ret) {
+		DRM_ERROR("Cannot create cgroup device.\n");
+		goto out_unlock;
+	}
+
 	if (drm_core_check_feature(dev, DRIVER_COMPUTE_ACCEL))
 		accel_debugfs_register(dev);
 	else
@@ -937,7 +943,7 @@ int drm_dev_register(struct drm_device *dev, unsigned long flags)
 
 	ret = drm_minor_register(dev, DRM_MINOR_RENDER);
 	if (ret)
-		goto err_minors;
+		goto out_unregister_cgroup;
 
 	ret = drm_minor_register(dev, DRM_MINOR_PRIMARY);
 	if (ret)
@@ -982,6 +988,8 @@ int drm_dev_register(struct drm_device *dev, unsigned long flags)
 	drm_minor_unregister(dev, DRM_MINOR_ACCEL);
 	drm_minor_unregister(dev, DRM_MINOR_PRIMARY);
 	drm_minor_unregister(dev, DRM_MINOR_RENDER);
+out_unregister_cgroup:
+	dev_cgroup_unregister_device(&dev->cg);
 out_unlock:
 	if (drm_dev_needs_global_mutex(dev))
 		mutex_unlock(&drm_global_mutex);
@@ -1024,6 +1032,7 @@ void drm_dev_unregister(struct drm_device *dev)
 	drm_minor_unregister(dev, DRM_MINOR_PRIMARY);
 	drm_minor_unregister(dev, DRM_MINOR_RENDER);
 	drm_debugfs_dev_fini(dev);
+	dev_cgroup_unregister_device(&dev->cg);
 }
 EXPORT_SYMBOL(drm_dev_unregister);
 
diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
index ee811764c3df4..95af268d9dd9b 100644
--- a/drivers/gpu/drm/drm_gem.c
+++ b/drivers/gpu/drm/drm_gem.c
@@ -110,6 +110,10 @@ drm_gem_init(struct drm_device *dev)
 				    DRM_FILE_PAGE_OFFSET_START,
 				    DRM_FILE_PAGE_OFFSET_SIZE);
 
+	dev->cg.regions[0].size = U64_MAX;
+	dev->cg.regions[0].name = "gem";
+	dev->cg.num_regions++;
+
 	return drmm_add_action(dev, drm_gem_init_release, NULL);
 }
 
diff --git a/drivers/gpu/drm/drm_gem_dma_helper.c b/drivers/gpu/drm/drm_gem_dma_helper.c
index 870b90b78bc4e..32eafbf4aa814 100644
--- a/drivers/gpu/drm/drm_gem_dma_helper.c
+++ b/drivers/gpu/drm/drm_gem_dma_helper.c
@@ -106,6 +106,10 @@ __drm_gem_dma_create(struct drm_device *drm, size_t size, bool private)
 		goto error;
 	}
 
+	ret = dev_cgroup_try_charge(&drm->cg, 0, size, &dma_obj->base.cgroup_pool_state, NULL);
+	if (ret)
+		goto error;
+
 	return dma_obj;
 
 error:
diff --git a/include/drm/drm_device.h b/include/drm/drm_device.h
index c91f87b5242d7..bdb7656e7db67 100644
--- a/include/drm/drm_device.h
+++ b/include/drm/drm_device.h
@@ -1,6 +1,7 @@
 #ifndef _DRM_DEVICE_H_
 #define _DRM_DEVICE_H_
 
+#include <linux/cgroup_dev.h>
 #include <linux/list.h>
 #include <linux/kref.h>
 #include <linux/mutex.h>
@@ -317,6 +318,9 @@ struct drm_device {
 	 * Root directory for debugfs files.
 	 */
 	struct dentry *debugfs_root;
+
+	/** @cg: device cgroup bookkeeping */
+	struct dev_cgroup_device cg;
 };
 
 #endif
diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h
index 5b8b1b059d32c..cc998abea7924 100644
--- a/include/drm/drm_gem.h
+++ b/include/drm/drm_gem.h
@@ -430,6 +430,8 @@ struct drm_gem_object {
 	 * The current LRU list that the GEM object is on.
 	 */
 	struct drm_gem_lru *lru;
+
+	struct dev_cgroup_pool_state *cgroup_pool_state;
 };
 
 /**
-- 
2.45.2

