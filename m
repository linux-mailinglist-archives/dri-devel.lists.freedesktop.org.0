Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D23C9E3BB8
	for <lists+dri-devel@lfdr.de>; Wed,  4 Dec 2024 14:53:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9354C10ED39;
	Wed,  4 Dec 2024 13:53:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mblankhorst.nl (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DF3D10ED2F
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Dec 2024 13:53:21 +0000 (UTC)
From: Maarten Lankhorst <dev@lankhorst.se>
To: linux-kernel@vger.kernel.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Tejun Heo <tj@kernel.org>,
 Zefan Li <lizefan.x@bytedance.com>, Johannes Weiner <hannes@cmpxchg.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Friedrich Vock <friedrich.vock@gmx.de>, Maxime Ripard <mripard@kernel.org>
Cc: cgroups@vger.kernel.org, linux-mm@kvack.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maarten Lankhorst <dev@lankhorst.se>
Subject: [PATCH v2 2/7] drm/drv: Add drmm managed registration helper for dmem
 cgroups.
Date: Wed,  4 Dec 2024 14:44:02 +0100
Message-ID: <20241204134410.1161769-3-dev@lankhorst.se>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241204134410.1161769-1-dev@lankhorst.se>
References: <20241204134410.1161769-1-dev@lankhorst.se>
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

Drivers will need to register dmem regions at probe time, so let's
give them a drm-managed helper.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
---
 drivers/gpu/drm/drm_drv.c | 32 ++++++++++++++++++++++++++++++++
 include/drm/drm_drv.h     |  5 +++++
 2 files changed, 37 insertions(+)

diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
index c2c172eb25df7..3cf440eee8a2a 100644
--- a/drivers/gpu/drm/drm_drv.c
+++ b/drivers/gpu/drm/drm_drv.c
@@ -26,6 +26,7 @@
  * DEALINGS IN THE SOFTWARE.
  */
 
+#include <linux/cgroup_dmem.h>
 #include <linux/debugfs.h>
 #include <linux/fs.h>
 #include <linux/module.h>
@@ -820,6 +821,37 @@ void drm_dev_put(struct drm_device *dev)
 }
 EXPORT_SYMBOL(drm_dev_put);
 
+static void drmm_cg_unregister_region(struct drm_device *dev, void *arg)
+{
+	dmem_cgroup_unregister_region(arg);
+}
+
+/**
+ * drmm_cgroup_register_region - Register a region of a DRM device to cgroups
+ * @dev: device for region
+ * @region_name: Region name for registering
+ * @size: Size of region in bytes
+ *
+ * This decreases the ref-count of @dev by one. The device is destroyed if the
+ * ref-count drops to zero.
+ */
+struct dmem_cgroup_region *drmm_cgroup_register_region(struct drm_device *dev, const char *region_name, u64 size)
+{
+	struct dmem_cgroup_region *region;
+	int ret;
+
+	region = dmem_cgroup_register_region(size, "drm/%s/%s", dev->unique, region_name);
+	if (IS_ERR_OR_NULL(region))
+		return region;
+
+	ret = drmm_add_action_or_reset(dev, drmm_cg_unregister_region, region);
+	if (ret)
+		return ERR_PTR(ret);
+
+	return region;
+}
+EXPORT_SYMBOL_GPL(drmm_cgroup_register_region);
+
 static int create_compat_control_link(struct drm_device *dev)
 {
 	struct drm_minor *minor;
diff --git a/include/drm/drm_drv.h b/include/drm/drm_drv.h
index 1bbbcb8e2d231..7dd49d9ab5058 100644
--- a/include/drm/drm_drv.h
+++ b/include/drm/drm_drv.h
@@ -34,6 +34,7 @@
 
 #include <drm/drm_device.h>
 
+struct dmem_cgroup_region;
 struct drm_fb_helper;
 struct drm_fb_helper_surface_size;
 struct drm_file;
@@ -438,6 +439,10 @@ void *__devm_drm_dev_alloc(struct device *parent,
 			   const struct drm_driver *driver,
 			   size_t size, size_t offset);
 
+struct dmem_cgroup_region *
+drmm_cgroup_register_region(struct drm_device *dev,
+			    const char *region_name, u64 size);
+
 /**
  * devm_drm_dev_alloc - Resource managed allocation of a &drm_device instance
  * @parent: Parent device object
-- 
2.43.0

