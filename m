Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D84846070F9
	for <lists+dri-devel@lfdr.de>; Fri, 21 Oct 2022 09:24:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D333810E5EC;
	Fri, 21 Oct 2022 07:24:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C44B010E101
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Oct 2022 17:57:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666288646; x=1697824646;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5lWJbu10NmqNqY5io9XZwYJCjEF1j/Hn8FDwsp0+GKs=;
 b=OajnuWZotMi/A9eCRpRnfigPbJpX/j05t2//29N0EiEJYO4YBnhcMc/t
 qTVa+EznJZCSgR0PvE5f8CmdIhG8ignfEvZzqJlxeNYz6x93VZX/2734A
 OyGfCa3z/VdtBopDdZvcqzAS1unBsQtH2mVEx6mO4Fz0+VG4tMmm0dVNJ
 /CXTBV6tfSJDEVSoRcER9qgmX4R6B7/JD3zksJcTjhUvIQG1/AaJdNTDH
 fEGLyTjsBnuirBXUibsBLF4RRCnAeVx7BQZAMUe9QwDGTfjLEIig4W8zx
 ThzjPO0c9GW+nPpXJgV8YPUJfyfua6xbSIA4l13Jbt/n0yiIBAYzI1VrR A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10506"; a="305528613"
X-IronPort-AV: E=Sophos;i="5.95,199,1661842800"; d="scan'208";a="305528613"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2022 10:57:26 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10506"; a="772517001"
X-IronPort-AV: E=Sophos;i="5.95,199,1661842800"; d="scan'208";a="772517001"
Received: from gna-nuc-dev34.igk.intel.com ([10.102.80.34])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2022 10:57:23 -0700
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
Subject: [PATCH v5 06/10] gna: add GNA_GEM_NEW and GNA_GEM_FREE ioctls
Date: Thu, 20 Oct 2022 19:53:30 +0200
Message-Id: <20221020175334.1820519-7-maciej.kwapulinski@linux.intel.com>
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
Cc: Maciej Kwapulinski <maciej.kwapulinski@linux.intel.com>,
 Mikolaj Grzybowski <mikolajx.grzybowski@intel.com>,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

drm_gem_shmem_object is base for memory objects provided by the patch

Signed-off-by: Maciej Kwapulinski <maciej.kwapulinski@linux.intel.com>
Tested-by: Mikolaj Grzybowski <mikolajx.grzybowski@intel.com>
---
 drivers/gpu/drm/gna/Kconfig      |  1 +
 drivers/gpu/drm/gna/gna_device.c | 27 +++++++++++-
 drivers/gpu/drm/gna/gna_device.h | 13 ++++++
 drivers/gpu/drm/gna/gna_gem.h    | 15 +++++++
 drivers/gpu/drm/gna/gna_ioctl.c  | 70 ++++++++++++++++++++++++++++++++
 include/uapi/drm/gna_drm.h       | 23 +++++++++++
 6 files changed, 148 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/gna/gna_gem.h

diff --git a/drivers/gpu/drm/gna/Kconfig b/drivers/gpu/drm/gna/Kconfig
index e56b933458dc..6c32716bf43a 100644
--- a/drivers/gpu/drm/gna/Kconfig
+++ b/drivers/gpu/drm/gna/Kconfig
@@ -6,6 +6,7 @@ config DRM_GNA
 	tristate "Intel(R) Gaussian & Neural Accelerator (Intel(R) GNA)"
 	depends on X86 && PCI
 	depends on DRM
+	select DRM_GEM_SHMEM_HELPER
 	help
 	  This option enables the Intel(R) Gaussian & Neural Accelerator
 	  (Intel(R) GNA) driver: gna
diff --git a/drivers/gpu/drm/gna/gna_device.c b/drivers/gpu/drm/gna/gna_device.c
index 592478bca526..ab9e16121dcf 100644
--- a/drivers/gpu/drm/gna/gna_device.c
+++ b/drivers/gpu/drm/gna/gna_device.c
@@ -3,20 +3,27 @@
 
 #include <drm/drm_drv.h>
 #include <drm/drm_file.h>
+#include <drm/drm_gem.h>
 #include <drm/drm_ioctl.h>
 #include <drm/drm_managed.h>
 
 #include <linux/device.h>
 #include <linux/dma-mapping.h>
 #include <linux/module.h>
+#include <linux/slab.h>
 
 #include <uapi/drm/gna_drm.h>
 
 #include "gna_device.h"
+#include "gna_gem.h"
 #define GNA_DDI_VERSION_CURRENT GNA_DDI_VERSION_3
 
+DEFINE_DRM_GEM_FOPS(gna_drm_fops);
+
 static const struct drm_ioctl_desc gna_drm_ioctls[] = {
 	DRM_IOCTL_DEF_DRV(GNA_GET_PARAMETER, gna_getparam_ioctl, DRM_RENDER_ALLOW),
+	DRM_IOCTL_DEF_DRV(GNA_GEM_NEW, gna_gem_new_ioctl, DRM_RENDER_ALLOW),
+	DRM_IOCTL_DEF_DRV(GNA_GEM_FREE, gna_gem_free_ioctl, DRM_RENDER_ALLOW),
 };
 
 
@@ -36,10 +43,28 @@ static int gna_drm_dev_init(struct drm_device *dev)
 	return drmm_add_action_or_reset(dev, gna_drm_dev_fini, NULL);
 }
 
+static struct drm_gem_object *gna_create_gem_object(struct drm_device *dev,
+						size_t size)
+{
+	struct drm_gem_shmem_object *dshmem;
+	struct gna_gem_object *shmem;
+
+	shmem = kzalloc(sizeof(*shmem), GFP_KERNEL);
+	if (!shmem)
+		return NULL;
+
+	dshmem = &shmem->base;
+
+	return &dshmem->base;
+}
+
 static const struct drm_driver gna_drm_driver = {
-	.driver_features = DRIVER_RENDER,
+	.driver_features = DRIVER_GEM | DRIVER_RENDER,
+	.gem_create_object = gna_create_gem_object,
+
 	.ioctls = gna_drm_ioctls,
 	.num_ioctls = ARRAY_SIZE(gna_drm_ioctls),
+	.fops = &gna_drm_fops,
 
 	.name = DRIVER_NAME,
 	.desc = DRIVER_DESC,
diff --git a/drivers/gpu/drm/gna/gna_device.h b/drivers/gpu/drm/gna/gna_device.h
index 035c627e33b7..329729f392d8 100644
--- a/drivers/gpu/drm/gna/gna_device.h
+++ b/drivers/gpu/drm/gna/gna_device.h
@@ -5,10 +5,12 @@
 #define __GNA_DEVICE_H__
 
 #include <drm/drm_device.h>
+#include <drm/drm_gem_shmem_helper.h>
 
 #include <linux/io.h>
 #include <linux/types.h>
 
+#include "gna_gem.h"
 #include "gna_hw.h"
 #include "gna_mem.h"
 
@@ -43,6 +45,12 @@ int gna_getparam(struct gna_device *gna_priv, union gna_parameter *param);
 int gna_getparam_ioctl(struct drm_device *dev, void *data,
 		struct drm_file *file);
 
+int gna_gem_new_ioctl(struct drm_device *dev, void *data,
+		struct drm_file *file);
+
+int gna_gem_free_ioctl(struct drm_device *dev, void *data,
+		struct drm_file *file);
+
 static inline u32 gna_reg_read(struct gna_device *gna_priv, u32 reg)
 {
 	return readl(gna_priv->iobase + reg);
@@ -58,4 +66,9 @@ static inline struct gna_device *to_gna_device(struct drm_device *dev)
 	return container_of(dev, struct gna_device, drm);
 }
 
+static inline struct gna_gem_object *to_gna_gem_obj(struct drm_gem_shmem_object *drm_gem_shmem)
+{
+	return container_of(drm_gem_shmem, struct gna_gem_object, base);
+}
+
 #endif /* __GNA_DEVICE_H__ */
diff --git a/drivers/gpu/drm/gna/gna_gem.h b/drivers/gpu/drm/gna/gna_gem.h
new file mode 100644
index 000000000000..f8fa6f35a788
--- /dev/null
+++ b/drivers/gpu/drm/gna/gna_gem.h
@@ -0,0 +1,15 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/* Copyright(c) 2017-2022 Intel Corporation */
+
+#ifndef __GNA_GEM_H__
+#define __GNA_GEM_H__
+
+#include <drm/drm_gem_shmem_helper.h>
+
+struct gna_gem_object {
+	struct drm_gem_shmem_object base;
+
+	uint32_t handle;
+};
+
+#endif /* __GNA_GEM_H__ */
diff --git a/drivers/gpu/drm/gna/gna_ioctl.c b/drivers/gpu/drm/gna/gna_ioctl.c
index 21eb7aae4ad2..5051e9af6b06 100644
--- a/drivers/gpu/drm/gna/gna_ioctl.c
+++ b/drivers/gpu/drm/gna/gna_ioctl.c
@@ -2,11 +2,34 @@
 // Copyright(c) 2017-2022 Intel Corporation
 
 #include <drm/drm_device.h>
+#include <drm/drm_gem_shmem_helper.h>
 #include <drm/drm_file.h>
 
 #include <uapi/drm/gna_drm.h>
 
 #include "gna_device.h"
+#include "gna_gem.h"
+
+int gna_gem_free_ioctl(struct drm_device *dev, void *data,
+		struct drm_file *file)
+{
+	struct gna_device *gna_priv = to_gna_device(dev);
+	struct gna_gem_free *args = data;
+	struct gna_gem_object *gnagemo;
+	struct drm_gem_object *drmgemo;
+	int ret;
+
+	drmgemo = drm_gem_object_lookup(file, args->handle);
+	if (!drmgemo)
+		return -ENOENT;
+
+	gnagemo = to_gna_gem_obj(to_drm_gem_shmem_obj(drmgemo));
+
+	ret = drm_gem_handle_delete(file, args->handle);
+
+	drm_gem_object_put(drmgemo);
+	return ret;
+}
 
 int gna_getparam_ioctl(struct drm_device *dev, void *data,
 		struct drm_file *file)
@@ -16,3 +39,50 @@ int gna_getparam_ioctl(struct drm_device *dev, void *data,
 
 	return gna_getparam(gna_priv, param);
 }
+
+static struct drm_gem_shmem_object *
+drm_gem_shmem_create_with_handle(struct drm_file *file_priv,
+				struct drm_device *dev, size_t size,
+				uint32_t *handle)
+{
+	struct drm_gem_shmem_object *shmem;
+	int ret;
+
+	shmem = drm_gem_shmem_create(dev, size);
+	if (IS_ERR(shmem))
+		return shmem;
+
+	/*
+	 * Allocate an id of idr table where the obj is registered
+	 * and handle has the id what user can see.
+	 */
+	ret = drm_gem_handle_create(file_priv, &shmem->base, handle);
+	/* drop reference from allocate - handle holds it now. */
+	drm_gem_object_put(&shmem->base);
+	if (ret)
+		return ERR_PTR(ret);
+
+	return shmem;
+}
+
+int gna_gem_new_ioctl(struct drm_device *dev, void *data,
+		struct drm_file *file)
+{
+	struct drm_gem_shmem_object *drmgemshm;
+	struct gna_gem_object *gnagemo;
+	union gna_gem_new *args = data;
+
+	drmgemshm = drm_gem_shmem_create_with_handle(file, dev, args->in.size,
+						&args->out.handle);
+
+	if (IS_ERR(drmgemshm))
+		return PTR_ERR(drmgemshm);
+
+	args->out.size_granted = drmgemshm->base.size;
+	args->out.vma_fake_offset = drm_vma_node_offset_addr(&drmgemshm->base.vma_node);
+
+	gnagemo = to_gna_gem_obj(drmgemshm);
+	gnagemo->handle = args->out.handle;
+
+	return 0;
+}
diff --git a/include/uapi/drm/gna_drm.h b/include/uapi/drm/gna_drm.h
index 5a7cfd7e5df2..5391446bad7d 100644
--- a/include/uapi/drm/gna_drm.h
+++ b/include/uapi/drm/gna_drm.h
@@ -33,8 +33,31 @@ union gna_parameter {
 	} out;
 };
 
+struct gna_mem_id {
+	__u32 handle;
+	__u32 pad;
+	__u64 vma_fake_offset;
+	__u64 size_granted;
+};
+
+union gna_gem_new {
+	struct {
+		__u64 size;
+	} in;
+
+	struct gna_mem_id out;
+};
+
+struct gna_gem_free {
+	__u32 handle;
+};
+
 #define DRM_GNA_GET_PARAMETER		0x00
+#define DRM_GNA_GEM_NEW			0x01
+#define DRM_GNA_GEM_FREE		0x02
 
 #define DRM_IOCTL_GNA_GET_PARAMETER	DRM_IOWR(DRM_COMMAND_BASE + DRM_GNA_GET_PARAMETER, union gna_parameter)
+#define DRM_IOCTL_GNA_GEM_NEW		DRM_IOWR(DRM_COMMAND_BASE + DRM_GNA_GEM_NEW, union gna_gem_new)
+#define DRM_IOCTL_GNA_GEM_FREE		DRM_IOWR(DRM_COMMAND_BASE + DRM_GNA_GEM_FREE, struct gna_gem_free)
 
 #endif /* _GNA_DRM_H_ */
-- 
2.25.1

