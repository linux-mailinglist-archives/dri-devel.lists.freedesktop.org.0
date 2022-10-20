Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF3946070E3
	for <lists+dri-devel@lfdr.de>; Fri, 21 Oct 2022 09:22:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D35210E5CE;
	Fri, 21 Oct 2022 07:22:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CAE610E191
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Oct 2022 17:57:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666288651; x=1697824651;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jmstPbHfn62rBUvB7x/U8Ae61+nd6iEcKDUGbuo2Fd0=;
 b=Y+c/lc0kbsXmgVhPr/sz/ca2TfXwqe5GExJ710aE7OunY6K6U+gOET7t
 8mCQbJzr742hEEgZd8MjKj8/OcNLGc+/cjT5f6OUPaQubR4VxYAa9S0Vt
 Tz6XKq1HT4di+sbfTNvytQXxo3i2UwimPxTxs4v3BRSwlkShbpc1Z0zcm
 pW1mZhfSBpQeHNqi0YsoRG/MMt1MpLNMrvirqon4Hjx5SbAE1UT2L7o73
 HCCuVcxh9Mkgp2BoWRd+b6ttrJ59wab8LG8V3u7+95B/KUum/qWcc+8Ui
 KOx7jWRDZo3dQ2sihj6+FH76ip6FAqDX0EE2vL92zO777ydnUtFV1/86Z w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10506"; a="305528624"
X-IronPort-AV: E=Sophos;i="5.95,199,1661842800"; d="scan'208";a="305528624"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2022 10:57:30 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10506"; a="772517034"
X-IronPort-AV: E=Sophos;i="5.95,199,1661842800"; d="scan'208";a="772517034"
Received: from gna-nuc-dev34.igk.intel.com ([10.102.80.34])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2022 10:57:26 -0700
From: Maciej Kwapulinski <maciej.kwapulinski@linux.intel.com>
To: Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Arnd Bergmann <arnd@arndb.de>, Jonathan Corbet <corbet@lwn.net>,
 Derek Kiernan <derek.kiernan@xilinx.com>,
 Dragan Cvetic <dragan.cvetic@xilinx.com>,
 Andy Shevchenko <andy.shevchenko@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>, Olof Johansson <olof@lixom.net>
Subject: [PATCH v5 07/10] gna: add GNA_COMPUTE ioctl
Date: Thu, 20 Oct 2022 19:53:31 +0200
Message-Id: <20221020175334.1820519-8-maciej.kwapulinski@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221020175334.1820519-1-maciej.kwapulinski@linux.intel.com>
References: <20221020175334.1820519-1-maciej.kwapulinski@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 21 Oct 2022 07:22:31 +0000
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
Cc: linux-doc@vger.kernel.org,
 Anisha Dattatraya Kulkarni <anisha.dattatraya.kulkarni@intel.com>,
 dri-devel@lists.freedesktop.org,
 Maciej Kwapulinski <maciej.kwapulinski@linux.intel.com>,
 Mikolaj Grzybowski <mikolajx.grzybowski@intel.com>,
 Tomasz Jankowski <tomasz1.jankowski@intel.com>,
 Jianxun Zhang <jianxun.zhang@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Tomasz Jankowski <tomasz1.jankowski@intel.com>

This is the ioctl context part of score request + "do nothing" work queue
implementation. Work queue context actual part will be added by next patch.

signed-off-by: Tomasz Jankowski <tomasz1.jankowski@intel.com>
Tested-by: Mikolaj Grzybowski <mikolajx.grzybowski@intel.com>
Co-developed-by: Anisha Dattatraya Kulkarni <anisha.dattatraya.kulkarni@intel.com>
Signed-off-by: Anisha Dattatraya Kulkarni <anisha.dattatraya.kulkarni@intel.com>
Co-developed-by: Jianxun Zhang <jianxun.zhang@linux.intel.com>
Signed-off-by: Jianxun Zhang <jianxun.zhang@linux.intel.com>
Co-developed-by: Maciej Kwapulinski <maciej.kwapulinski@linux.intel.com>
Signed-off-by: Maciej Kwapulinski <maciej.kwapulinski@linux.intel.com>
---
 drivers/gpu/drm/gna/Kbuild        |   2 +-
 drivers/gpu/drm/gna/gna_device.c  |  33 +++
 drivers/gpu/drm/gna/gna_device.h  |  21 ++
 drivers/gpu/drm/gna/gna_gem.h     |   4 +
 drivers/gpu/drm/gna/gna_ioctl.c   |  27 +++
 drivers/gpu/drm/gna/gna_mem.c     |  43 ++++
 drivers/gpu/drm/gna/gna_mem.h     |   2 +
 drivers/gpu/drm/gna/gna_request.c | 338 ++++++++++++++++++++++++++++++
 drivers/gpu/drm/gna/gna_request.h |  47 +++++
 include/uapi/drm/gna_drm.h        |  57 +++++
 10 files changed, 573 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/gna/gna_request.c
 create mode 100644 drivers/gpu/drm/gna/gna_request.h

diff --git a/drivers/gpu/drm/gna/Kbuild b/drivers/gpu/drm/gna/Kbuild
index 101880869dc4..15c5e4fe7e4d 100644
--- a/drivers/gpu/drm/gna/Kbuild
+++ b/drivers/gpu/drm/gna/Kbuild
@@ -1,5 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0-only
 
-gna-y := gna_device.o gna_ioctl.o gna_mem.o gna_pci.o
+gna-y := gna_device.o gna_ioctl.o gna_mem.o gna_pci.o gna_request.o
 
 obj-$(CONFIG_DRM_GNA) += gna.o
diff --git a/drivers/gpu/drm/gna/gna_device.c b/drivers/gpu/drm/gna/gna_device.c
index ab9e16121dcf..0f8ec5a9dde4 100644
--- a/drivers/gpu/drm/gna/gna_device.c
+++ b/drivers/gpu/drm/gna/gna_device.c
@@ -11,11 +11,14 @@
 #include <linux/dma-mapping.h>
 #include <linux/module.h>
 #include <linux/slab.h>
+#include <linux/workqueue.h>
 
 #include <uapi/drm/gna_drm.h>
 
 #include "gna_device.h"
 #include "gna_gem.h"
+#include "gna_request.h"
+
 #define GNA_DDI_VERSION_CURRENT GNA_DDI_VERSION_3
 
 DEFINE_DRM_GEM_FOPS(gna_drm_fops);
@@ -24,6 +27,7 @@ static const struct drm_ioctl_desc gna_drm_ioctls[] = {
 	DRM_IOCTL_DEF_DRV(GNA_GET_PARAMETER, gna_getparam_ioctl, DRM_RENDER_ALLOW),
 	DRM_IOCTL_DEF_DRV(GNA_GEM_NEW, gna_gem_new_ioctl, DRM_RENDER_ALLOW),
 	DRM_IOCTL_DEF_DRV(GNA_GEM_FREE, gna_gem_free_ioctl, DRM_RENDER_ALLOW),
+	DRM_IOCTL_DEF_DRV(GNA_COMPUTE, gna_score_ioctl, DRM_RENDER_ALLOW),
 };
 
 
@@ -43,6 +47,24 @@ static int gna_drm_dev_init(struct drm_device *dev)
 	return drmm_add_action_or_reset(dev, gna_drm_dev_fini, NULL);
 }
 
+static void gna_workqueue_fini(struct drm_device *drm, void *data)
+{
+	struct workqueue_struct *request_wq = data;
+
+	destroy_workqueue(request_wq);
+}
+
+static int gna_workqueue_init(struct gna_device *gna_priv)
+{
+	const char *name = gna_name(gna_priv);
+
+	gna_priv->request_wq = create_singlethread_workqueue(name);
+	if (!gna_priv->request_wq)
+		return -EFAULT;
+
+	return drmm_add_action_or_reset(&gna_priv->drm, gna_workqueue_fini, gna_priv->request_wq);
+}
+
 static struct drm_gem_object *gna_create_gem_object(struct drm_device *dev,
 						size_t size)
 {
@@ -90,6 +112,8 @@ int gna_probe(struct device *parent, struct gna_dev_info *dev_info, void __iomem
 	gna_priv->iobase = iobase;
 	gna_priv->info = *dev_info;
 
+	atomic_set(&gna_priv->enqueued_requests, 0);
+
 	if (!(sizeof(dma_addr_t) > 4) ||
 		dma_set_mask(parent, DMA_BIT_MASK(64))) {
 		err = dma_set_mask(parent, DMA_BIT_MASK(32));
@@ -106,6 +130,15 @@ int gna_probe(struct device *parent, struct gna_dev_info *dev_info, void __iomem
 
 	dev_dbg(parent, "maximum memory size %llu num pd %d\n",
 		gna_priv->info.max_hw_mem, gna_priv->info.num_pagetables);
+	atomic_set(&gna_priv->request_count, 0);
+
+	mutex_init(&gna_priv->reqlist_lock);
+	INIT_LIST_HEAD(&gna_priv->request_list);
+
+	err = gna_workqueue_init(gna_priv);
+	if (err)
+		return err;
+
 
 	dev_set_drvdata(parent, drm_dev);
 
diff --git a/drivers/gpu/drm/gna/gna_device.h b/drivers/gpu/drm/gna/gna_device.h
index 329729f392d8..b628ffa9970f 100644
--- a/drivers/gpu/drm/gna/gna_device.h
+++ b/drivers/gpu/drm/gna/gna_device.h
@@ -7,7 +7,10 @@
 #include <drm/drm_device.h>
 #include <drm/drm_gem_shmem_helper.h>
 
+#include <linux/atomic.h>
 #include <linux/io.h>
+#include <linux/list.h>
+#include <linux/mutex.h>
 #include <linux/types.h>
 
 #include "gna_gem.h"
@@ -22,6 +25,7 @@
 #define DRIVER_MINOR		0
 #define DRIVER_PATCHLEVEL	0
 
+struct workqueue_struct;
 union gna_parameter;
 struct drm_file;
 struct device;
@@ -37,6 +41,15 @@ struct gna_device {
 	struct gna_hw_info hw_info;
 
 	struct gna_mmu_object mmu;
+
+	struct list_head request_list;
+	/* protects request_list */
+	struct mutex reqlist_lock;
+	struct workqueue_struct *request_wq;
+	atomic_t request_count;
+
+	/* requests that are in queue to be run +1 for currently processed one */
+	atomic_t enqueued_requests;
 };
 
 int gna_probe(struct device *parent, struct gna_dev_info *dev_info, void __iomem *iobase);
@@ -51,11 +64,19 @@ int gna_gem_new_ioctl(struct drm_device *dev, void *data,
 int gna_gem_free_ioctl(struct drm_device *dev, void *data,
 		struct drm_file *file);
 
+int gna_score_ioctl(struct drm_device *dev, void *data,
+		struct drm_file *file);
+
 static inline u32 gna_reg_read(struct gna_device *gna_priv, u32 reg)
 {
 	return readl(gna_priv->iobase + reg);
 }
 
+static inline const char *gna_name(struct gna_device *gna_priv)
+{
+	return gna_priv->drm.unique;
+}
+
 static inline struct device *gna_dev(struct gna_device *gna_priv)
 {
 	return gna_priv->drm.dev;
diff --git a/drivers/gpu/drm/gna/gna_gem.h b/drivers/gpu/drm/gna/gna_gem.h
index f8fa6f35a788..18ffa8245380 100644
--- a/drivers/gpu/drm/gna/gna_gem.h
+++ b/drivers/gpu/drm/gna/gna_gem.h
@@ -6,10 +6,14 @@
 
 #include <drm/drm_gem_shmem_helper.h>
 
+#include <linux/workqueue.h>
+
 struct gna_gem_object {
 	struct drm_gem_shmem_object base;
 
 	uint32_t handle;
+
+	struct work_struct work;
 };
 
 #endif /* __GNA_GEM_H__ */
diff --git a/drivers/gpu/drm/gna/gna_ioctl.c b/drivers/gpu/drm/gna/gna_ioctl.c
index 5051e9af6b06..ab3a2b789589 100644
--- a/drivers/gpu/drm/gna/gna_ioctl.c
+++ b/drivers/gpu/drm/gna/gna_ioctl.c
@@ -5,10 +5,33 @@
 #include <drm/drm_gem_shmem_helper.h>
 #include <drm/drm_file.h>
 
+#include <linux/workqueue.h>
+
 #include <uapi/drm/gna_drm.h>
 
 #include "gna_device.h"
 #include "gna_gem.h"
+#include "gna_request.h"
+
+int gna_score_ioctl(struct drm_device *dev, void *data,
+		struct drm_file *file)
+{
+	union gna_compute *score_args = data;
+	u64 request_id;
+	int ret;
+
+	ret = gna_validate_score_config(&score_args->in.config, to_gna_device(dev));
+	if (ret)
+		return ret;
+
+	ret = gna_enqueue_request(&score_args->in.config, file, &request_id);
+	if (ret)
+		return ret;
+
+	score_args->out.request_id = request_id;
+
+	return 0;
+}
 
 int gna_gem_free_ioctl(struct drm_device *dev, void *data,
 		struct drm_file *file)
@@ -25,6 +48,9 @@ int gna_gem_free_ioctl(struct drm_device *dev, void *data,
 
 	gnagemo = to_gna_gem_obj(to_drm_gem_shmem_obj(drmgemo));
 
+	queue_work(gna_priv->request_wq, &gnagemo->work);
+	cancel_work_sync(&gnagemo->work);
+
 	ret = drm_gem_handle_delete(file, args->handle);
 
 	drm_gem_object_put(drmgemo);
@@ -84,5 +110,6 @@ int gna_gem_new_ioctl(struct drm_device *dev, void *data,
 	gnagemo = to_gna_gem_obj(drmgemshm);
 	gnagemo->handle = args->out.handle;
 
+	INIT_WORK(&gnagemo->work, gna_gem_obj_release_work);
 	return 0;
 }
diff --git a/drivers/gpu/drm/gna/gna_mem.c b/drivers/gpu/drm/gna/gna_mem.c
index 21e266583e27..54c5a4d68d06 100644
--- a/drivers/gpu/drm/gna/gna_mem.c
+++ b/drivers/gpu/drm/gna/gna_mem.c
@@ -1,15 +1,23 @@
 // SPDX-License-Identifier: GPL-2.0-only
 // Copyright(c) 2017-2022 Intel Corporation
 
+#include <drm/drm_gem_shmem_helper.h>
 #include <drm/drm_managed.h>
 
+#include <linux/atomic.h>
 #include <linux/device.h>
 #include <linux/dma-mapping.h>
+#include <linux/kref.h>
+#include <linux/list.h>
 #include <linux/math.h>
 #include <linux/mm.h>
+#include <linux/mutex.h>
+#include <linux/workqueue.h>
 
 #include "gna_device.h"
+#include "gna_gem.h"
 #include "gna_mem.h"
+#include "gna_request.h"
 
 static void gna_mmu_set(struct gna_device *gna_priv)
 {
@@ -76,3 +84,38 @@ int gna_mmu_init(struct gna_device *gna_priv)
 
 	return 0;
 }
+
+static void gna_delete_score_requests(u32 handle, struct gna_device *gna_priv)
+{
+	struct gna_request *req, *temp_req;
+	struct list_head *reqs_list;
+	int i;
+
+	mutex_lock(&gna_priv->reqlist_lock);
+
+	reqs_list = &gna_priv->request_list;
+	if (!list_empty(reqs_list)) {
+		list_for_each_entry_safe(req, temp_req, reqs_list, node) {
+			for (i = 0; i < req->buffer_count; ++i) {
+				if (req->buffer_list[i].gna.handle == handle) {
+					list_del_init(&req->node);
+					cancel_work_sync(&req->work);
+					atomic_dec(&gna_priv->enqueued_requests);
+					kref_put(&req->refcount, gna_request_release);
+					break;
+				}
+			}
+		}
+	}
+
+	mutex_unlock(&gna_priv->reqlist_lock);
+}
+
+void gna_gem_obj_release_work(struct work_struct *work)
+{
+	struct gna_gem_object *gnagemo;
+
+	gnagemo = container_of(work, struct gna_gem_object, work);
+
+	gna_delete_score_requests(gnagemo->handle, to_gna_device(gnagemo->base.base.dev));
+}
diff --git a/drivers/gpu/drm/gna/gna_mem.h b/drivers/gpu/drm/gna/gna_mem.h
index f9b8dcb1399f..9d8251900231 100644
--- a/drivers/gpu/drm/gna/gna_mem.h
+++ b/drivers/gpu/drm/gna/gna_mem.h
@@ -47,4 +47,6 @@ struct gna_mmu_object {
 
 int gna_mmu_init(struct gna_device *gna_priv);
 
+void gna_gem_obj_release_work(struct work_struct *work);
+
 #endif // __GNA_MEM_H__
diff --git a/drivers/gpu/drm/gna/gna_request.c b/drivers/gpu/drm/gna/gna_request.c
new file mode 100644
index 000000000000..7151d7c2b353
--- /dev/null
+++ b/drivers/gpu/drm/gna/gna_request.c
@@ -0,0 +1,338 @@
+// SPDX-License-Identifier: GPL-2.0-only
+// Copyright(c) 2017-2022 Intel Corporation
+
+#include <drm/drm_file.h>
+#include <drm/drm_gem.h>
+#include <drm/drm_gem_shmem_helper.h>
+
+#include <linux/atomic.h>
+#include <linux/device.h>
+#include <linux/kernel.h>
+#include <linux/list.h>
+#include <linux/math.h>
+#include <linux/mutex.h>
+#include <linux/slab.h>
+#include <linux/uaccess.h>
+
+#include "gna_device.h"
+#include "gna_request.h"
+
+int gna_validate_score_config(struct gna_compute_cfg *compute_cfg,
+			struct gna_device *gna_priv)
+{
+	size_t buffers_size;
+
+	if (compute_cfg->gna_mode > GNA_MODE_XNN) {
+		dev_dbg(gna_dev(gna_priv), "invalid mode: %d\n", compute_cfg->gna_mode);
+		return -EINVAL;
+	}
+
+	if (compute_cfg->layer_count > gna_priv->info.max_layer_count) {
+		dev_dbg(gna_dev(gna_priv), "max layer count exceeded: %u > %u\n",
+			compute_cfg->layer_count, gna_priv->info.max_layer_count);
+		return -EINVAL;
+	}
+
+	if (compute_cfg->buffer_count == 0) {
+		dev_dbg(gna_dev(gna_priv), "no buffers\n");
+		return -EINVAL;
+	}
+
+	buffers_size = sizeof(struct gna_buffer) * compute_cfg->buffer_count;
+	if (!access_ok(u64_to_user_ptr(compute_cfg->buffers_ptr), buffers_size))
+		return -EACCES;
+
+	return 0;
+}
+
+static void gna_request_make_zombie(struct gna_request *score_request)
+{
+	int i;
+
+	for (i = 0; i < score_request->buffer_count; i++) {
+		kvfree((void *)(uintptr_t)score_request->buffer_list[i].gna.patches_ptr);
+		drm_gem_object_put(&score_request->buffer_list[i].gem->base.base);
+	}
+	kvfree(score_request->buffer_list);
+	score_request->buffer_list = NULL;
+	score_request->buffer_count = 0;
+}
+
+static void gna_request_process(struct work_struct *work)
+{
+	struct gna_request *score_request;
+	struct gna_device *gna_priv;
+
+	score_request = container_of(work, struct gna_request, work);
+	gna_priv = to_gna_device(score_request->drm_f->minor->dev);
+
+	gna_request_make_zombie(score_request);
+
+	atomic_dec(&gna_priv->enqueued_requests);
+}
+
+static struct gna_request *gna_request_create(struct drm_file *file,
+				       struct gna_compute_cfg *compute_cfg)
+{
+
+	struct gna_device *gna_priv = file->driver_priv;
+	struct gna_request *score_request;
+
+	if (IS_ERR(gna_priv))
+		return NULL;
+
+	score_request = kzalloc(sizeof(*score_request), GFP_KERNEL);
+	if (!score_request)
+		return NULL;
+	kref_init(&score_request->refcount);
+
+	dev_dbg(gna_dev(gna_priv), "labase: %d, lacount: %d\n",
+		compute_cfg->layer_base, compute_cfg->layer_count);
+
+	score_request->request_id = atomic_inc_return(&gna_priv->request_count);
+	score_request->compute_cfg = *compute_cfg;
+	score_request->drm_f = file;
+	INIT_WORK(&score_request->work, gna_request_process);
+	INIT_LIST_HEAD(&score_request->node);
+
+	return score_request;
+}
+
+/*
+ * returns true if [inner_offset, inner_size) is embraced by [0, outer_size). False otherwise.
+ */
+static bool gna_validate_ranges(u64 outer_size, u64 inner_offset, u64 inner_size)
+{
+	return inner_offset < outer_size &&
+		inner_size <= (outer_size - inner_offset);
+}
+
+static int gna_validate_patches(struct gna_device *gna_priv, __u64 buffer_size,
+				struct gna_memory_patch *patches, u64 count)
+{
+	u64 idx;
+
+	for (idx = 0; idx < count; ++idx) {
+		if (patches[idx].size > 8) {
+			dev_dbg(gna_dev(gna_priv), "invalid patch size: %llu\n", patches[idx].size);
+			return -EINVAL;
+		}
+
+		if (!gna_validate_ranges(buffer_size, patches[idx].offset, patches[idx].size)) {
+			dev_dbg(gna_dev(gna_priv),
+				"patch out of bounds. buffer size: %llu, patch offset/size:%llu/%llu\n",
+				buffer_size, patches[idx].offset, patches[idx].size);
+			return -EINVAL;
+		}
+	}
+
+	return 0;
+}
+
+static int gna_buffer_fill_patches(struct gna_buffer *buffer, struct gna_device *gna_priv)
+{
+	__u64 patches_user = buffer->patches_ptr;
+	struct gna_memory_patch *patches;
+	/* At this point, the buffer points to a memory region in kernel space where the copied
+	 * patches_ptr also lives, but the value of it is still an address from user space. This
+	 * function will set patches_ptr to either an address in kernel space or null before it
+	 * exits.
+	 */
+	u64 patch_count;
+	int ret;
+
+	buffer->patches_ptr = 0;
+	patch_count = buffer->patch_count;
+	if (!patch_count)
+		return 0;
+
+	patches = kvmalloc_array(patch_count, sizeof(struct gna_memory_patch), GFP_KERNEL);
+	if (!patches)
+		return -ENOMEM;
+
+	if (copy_from_user(patches, u64_to_user_ptr(patches_user),
+				sizeof(struct gna_memory_patch) * patch_count)) {
+		ret = -EFAULT;
+		goto err_fill_patches;
+	}
+
+	ret = gna_validate_patches(gna_priv, buffer->size, patches, patch_count);
+	if (ret) {
+		dev_dbg(gna_dev(gna_priv), "buffer %p: patches' validation failed\n", buffer);
+		goto err_fill_patches;
+	}
+
+	buffer->patches_ptr = (uintptr_t)patches;
+
+	return 0;
+
+err_fill_patches:
+	kvfree(patches);
+	return ret;
+}
+
+static int gna_request_fill_buffers(struct gna_request *score_request,
+				    struct gna_compute_cfg *compute_cfg)
+{
+	struct gna_buffer_with_object *buffer_list;
+	struct gna_buffer_with_object *buffer;
+	struct gna_buffer *cfg_buffers;
+	struct drm_gem_object *drmgemo;
+	struct gna_device *gna_priv;
+	u64 buffers_total_size = 0;
+	size_t gem_obj_size;
+	u64 buffer_count;
+	u32 handle;
+	u64 i, j;
+	int ret;
+
+
+	gna_priv = to_gna_device(score_request->drm_f->minor->dev);
+
+	buffer_count = compute_cfg->buffer_count;
+	buffer_list = kvmalloc_array(buffer_count, sizeof(*buffer_list), GFP_KERNEL);
+	if (!buffer_list)
+		return -ENOMEM;
+
+	cfg_buffers = u64_to_user_ptr(compute_cfg->buffers_ptr);
+	for (i = 0; i < buffer_count; ++i) {
+		if (copy_from_user(&buffer_list[i].gna, cfg_buffers+i,
+					sizeof(*buffer_list))) {
+			ret = -EFAULT;
+			goto err_free_buffers;
+		}
+		buffer_list[i].gem = NULL;
+	}
+
+	for (i = 0; i < buffer_count; i++) {
+		buffer = &buffer_list[i];
+		handle = buffer->gna.handle;
+
+		if (buffer->gna.offset != 0) {
+			dev_dbg(gna_dev(gna_priv), "buffer->offset = %llu for handle %u in score config\n",
+				buffer->gna.offset, buffer->gna.handle);
+			return -EINVAL;
+		}
+
+		for (j = 0; j < i; j++) {
+			if (buffer_list[j].gna.handle == handle) {
+				dev_dbg(gna_dev(gna_priv),
+					"doubled memory id in score config; id:%u\n", handle);
+				ret = -EINVAL;
+				goto err_zero_patch_user_ptr;
+			}
+		}
+
+		buffers_total_size +=
+			round_up(buffer->gna.size, PAGE_SIZE);
+		if (buffers_total_size > gna_priv->info.max_hw_mem) {
+			dev_dbg(gna_dev(gna_priv), "buffers' %p total size too big\n", buffer);
+			ret = -EINVAL;
+			goto err_zero_patch_user_ptr;
+		}
+
+		drmgemo = drm_gem_object_lookup(score_request->drm_f, handle);
+
+		if (!drmgemo) {
+			dev_dbg(gna_dev(gna_priv), "memory object %u not found\n", handle);
+			ret = -EINVAL;
+			goto err_zero_patch_user_ptr;
+		}
+
+		// we are still in sys call context, but prior request is enqueued.
+		// request may slip into queue while some gna_gem_object being deleted
+		// border case + not too much harm.
+		buffer->gem = to_gna_gem_obj(to_drm_gem_shmem_obj(drmgemo));
+
+		gem_obj_size = drmgemo->size;
+
+		if (!gna_validate_ranges(gem_obj_size, 0, buffer->gna.size)) {
+			dev_dbg(gna_dev(gna_priv),
+				"buffer out of bounds. mo size: %zu, buffer size:%llu\n",
+				gem_obj_size, buffer->gna.size);
+			ret = -EINVAL;
+			goto err_zero_patch_user_ptr;
+		}
+
+		ret = gna_buffer_fill_patches(&buffer->gna, gna_priv);
+		if (ret)
+			goto err_free_patches;
+	}
+
+	score_request->buffer_list = buffer_list;
+	score_request->buffer_count = buffer_count;
+
+	return 0;
+
+err_zero_patch_user_ptr:
+	/* patches_ptr may still hold an address in userspace.
+	 * Don't pass it to kvfree().
+	 */
+	buffer->gna.patches_ptr = 0;
+
+err_free_patches:
+	/* patches_ptr of each processed buffer should be either
+	 * null or pointing to an allocated memory block in the
+	 * kernel at this point.
+	 */
+	for (j = 0; j <= i; j++) {
+		kvfree((void *)(uintptr_t)buffer_list[j].gna.patches_ptr);
+		drm_gem_object_put(&buffer_list[j].gem->base.base);
+	}
+
+err_free_buffers:
+	kvfree(buffer_list);
+	return ret;
+}
+
+int gna_enqueue_request(struct gna_compute_cfg *compute_cfg,
+			struct drm_file *file, u64 *request_id)
+{
+	bool is_qos = !!(compute_cfg->flags & GNA_FLAG_SCORE_QOS);
+	struct gna_device *gna_priv = file->driver_priv;
+	struct gna_request *score_request;
+	u64 pos_in_queue;
+	int ret;
+
+	pos_in_queue = atomic_inc_return(&gna_priv->enqueued_requests);
+	if (is_qos && pos_in_queue != 1) {
+		ret = -EBUSY;
+		goto ERR_UNQUEUE_REQUEST;
+	}
+
+	score_request = gna_request_create(file, compute_cfg);
+	if (!score_request) {
+		ret = -ENOMEM;
+		goto ERR_UNQUEUE_REQUEST;
+	}
+
+	ret = gna_request_fill_buffers(score_request, compute_cfg);
+	if (ret) {
+		kref_put(&score_request->refcount, gna_request_release);
+		goto ERR_UNQUEUE_REQUEST;
+	}
+
+	kref_get(&score_request->refcount);
+	mutex_lock(&gna_priv->reqlist_lock);
+	list_add_tail(&score_request->node, &gna_priv->request_list);
+	mutex_unlock(&gna_priv->reqlist_lock);
+
+	queue_work(gna_priv->request_wq, &score_request->work);
+	kref_put(&score_request->refcount, gna_request_release);
+
+	*request_id = score_request->request_id;
+
+	return 0;
+
+ERR_UNQUEUE_REQUEST:
+	atomic_dec(&gna_priv->enqueued_requests);
+	return ret;
+}
+
+void gna_request_release(struct kref *ref)
+{
+	struct gna_request *score_request =
+		container_of(ref, struct gna_request, refcount);
+	gna_request_make_zombie(score_request);
+	kfree(score_request);
+}
diff --git a/drivers/gpu/drm/gna/gna_request.h b/drivers/gpu/drm/gna/gna_request.h
new file mode 100644
index 000000000000..432c30863e7e
--- /dev/null
+++ b/drivers/gpu/drm/gna/gna_request.h
@@ -0,0 +1,47 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/* Copyright(c) 2017-2022 Intel Corporation */
+
+#ifndef __GNA_REQUEST_H__
+#define __GNA_REQUEST_H__
+
+#include <linux/kref.h>
+#include <linux/types.h>
+#include <linux/workqueue.h>
+
+#include <uapi/drm/gna_drm.h>
+
+struct gna_device;
+struct gna_gem_object;
+struct drm_file;
+
+struct gna_buffer_with_object {
+	struct gna_buffer gna;
+	struct gna_gem_object *gem;
+};
+
+struct gna_request {
+	u64 request_id;
+
+	struct kref refcount;
+
+	struct drm_file *drm_f;
+
+	struct list_head node;
+
+	struct gna_compute_cfg compute_cfg;
+
+	struct gna_buffer_with_object *buffer_list;
+	u64 buffer_count;
+
+	struct work_struct work;
+};
+
+int gna_validate_score_config(struct gna_compute_cfg *compute_cfg,
+			struct gna_device *gna_priv);
+
+int gna_enqueue_request(struct gna_compute_cfg *compute_cfg,
+			struct drm_file *file, u64 *request_id);
+
+void gna_request_release(struct kref *ref);
+
+#endif // __GNA_REQUEST_H__
diff --git a/include/uapi/drm/gna_drm.h b/include/uapi/drm/gna_drm.h
index 5391446bad7d..aaae9a46dec5 100644
--- a/include/uapi/drm/gna_drm.h
+++ b/include/uapi/drm/gna_drm.h
@@ -4,12 +4,17 @@
 #ifndef _GNA_DRM_H_
 #define _GNA_DRM_H_
 
+#include <linux/const.h>
 #include <linux/types.h>
 
 #include "drm.h"
 
 #define GNA_DDI_VERSION_3 3
 
+/* Operation modes */
+#define GNA_MODE_GMM	0
+#define GNA_MODE_XNN	1
+
 #define GNA_PARAM_RECOVERY_TIMEOUT	1
 #define GNA_PARAM_DEVICE_TYPE		2
 #define GNA_PARAM_INPUT_BUFFER_S	3
@@ -21,6 +26,46 @@
 #define GNA_DEV_TYPE_3_0	0x30
 #define GNA_DEV_TYPE_3_5	0x35
 
+#define GNA_FLAG_SCORE_QOS	_BITUL(0)
+
+/*
+ * Structure describes part of memory to be overwritten before starting GNA
+ */
+struct gna_memory_patch {
+	/* offset from targeted memory */
+	__u64 offset;
+
+	__u64 size;
+	__u64 value;
+};
+
+struct gna_buffer {
+	__u32 handle;
+	__u32 pad;
+
+	__u64 offset;
+	__u64 size;
+
+	__u64 patch_count;
+	__u64 patches_ptr;
+};
+
+struct gna_compute_cfg {
+	__u32 layer_base;
+	__u32 layer_count;
+
+	/* List of GNA memory buffers */
+	__u64 buffers_ptr;
+	__u64 buffer_count;
+
+	__u8 active_list_on;
+	__u8 gna_mode;
+	__u8 hw_perf_encoding;
+	__u8 flags;
+
+	__u8 pad[4];
+};
+
 typedef __u64 gna_param_id;
 
 union gna_parameter {
@@ -33,6 +78,16 @@ union gna_parameter {
 	} out;
 };
 
+union gna_compute {
+	struct {
+		struct gna_compute_cfg config;
+	} in;
+
+	struct {
+		__u64 request_id;
+	} out;
+};
+
 struct gna_mem_id {
 	__u32 handle;
 	__u32 pad;
@@ -55,9 +110,11 @@ struct gna_gem_free {
 #define DRM_GNA_GET_PARAMETER		0x00
 #define DRM_GNA_GEM_NEW			0x01
 #define DRM_GNA_GEM_FREE		0x02
+#define DRM_GNA_COMPUTE			0x03
 
 #define DRM_IOCTL_GNA_GET_PARAMETER	DRM_IOWR(DRM_COMMAND_BASE + DRM_GNA_GET_PARAMETER, union gna_parameter)
 #define DRM_IOCTL_GNA_GEM_NEW		DRM_IOWR(DRM_COMMAND_BASE + DRM_GNA_GEM_NEW, union gna_gem_new)
 #define DRM_IOCTL_GNA_GEM_FREE		DRM_IOWR(DRM_COMMAND_BASE + DRM_GNA_GEM_FREE, struct gna_gem_free)
+#define DRM_IOCTL_GNA_COMPUTE		DRM_IOWR(DRM_COMMAND_BASE + DRM_GNA_COMPUTE, union gna_compute)
 
 #endif /* _GNA_DRM_H_ */
-- 
2.25.1

