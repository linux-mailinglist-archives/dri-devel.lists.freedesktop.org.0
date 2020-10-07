Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B3272865B0
	for <lists+dri-devel@lfdr.de>; Wed,  7 Oct 2020 19:17:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25FCE6E97B;
	Wed,  7 Oct 2020 17:17:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D06D6E97E
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Oct 2020 17:17:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
 s=20161220; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Iekuitw/2ruwdqXcZp9yQHI4zJjww2DGLcFJf3x3uNE=; b=ZNH78mSfTgkowEEv5n5I/19+bA
 UhuwGWKuFCYp8hLVWMhKAs8NPezNI5xjrNggNZxvy9g6zISD9WH7nKBpDj7J1pTzGcNo3Zzn1qY40
 YIiTAYcl60hOIOZHyupmt6jWSx7E/66NXdDfg/wTWlWlkQXA6mt3ewNvU+zNwQlMwMMcjilb0OrZx
 LhDn2qkTo+OHXQvygXDXQ+BR7yXpHSJVLnCz8pKDi6m9pd/mMotZGGn3WG9lxMsIEM/G4/PF4BggM
 htCdgFRYFfzScdiaGNgRL0BvYDU3NkUFRZYMrUr+ojuIxdAyLV8AF/+eHvWLlGTogQLzhEDdwH9Si
 RUM5AYrg==;
Received: from dsl-hkibng22-54f986-236.dhcp.inet.fi ([84.249.134.236]
 helo=toshino.localdomain)
 by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <mperttunen@nvidia.com>)
 id 1kQD41-0006P9-7p; Wed, 07 Oct 2020 20:17:17 +0300
From: Mikko Perttunen <mperttunen@nvidia.com>
To: thierry.reding@gmail.com, jonathanh@nvidia.com, digetx@gmail.com,
 airlied@linux.ie, daniel@ffwll.ch
Subject: [PATCH v3 19/20] drm/tegra: Implement new UAPI
Date: Wed,  7 Oct 2020 20:12:37 +0300
Message-Id: <20201007171238.1795964-20-mperttunen@nvidia.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201007171238.1795964-1-mperttunen@nvidia.com>
References: <20201007171238.1795964-1-mperttunen@nvidia.com>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 84.249.134.236
X-SA-Exim-Mail-From: mperttunen@nvidia.com
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
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
Cc: linux-tegra@vger.kernel.org, talho@nvidia.com, bhuntsman@nvidia.com,
 dri-devel@lists.freedesktop.org, Mikko Perttunen <mperttunen@nvidia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Implement the new UAPI, and bump the TegraDRM major version.

Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
---
v3:
* Remove WRITE_RELOC. Relocations are now patched implicitly
  when patching is needed.
* Directly call PM runtime APIs on devices instead of using
  power_on/power_off callbacks.
* Remove incorrect mutex unlock in tegra_drm_ioctl_channel_open
* Use XA_FLAGS_ALLOC1 instead of XA_FLAGS_ALLOC
* Accommodate for removal of timeout field and inlining of
  syncpt_incrs array.
* Copy entire user arrays at a time instead of going through
  elements one-by-one.
* Implement waiting of DMA reservations.
* Split out gather_bo implementation into a separate file.
* Fix length parameter passed to sg_init_one in gather_bo
* Cosmetic cleanup.
---
 drivers/gpu/drm/tegra/Makefile         |   3 +
 drivers/gpu/drm/tegra/drm.c            |  46 +-
 drivers/gpu/drm/tegra/drm.h            |   5 +
 drivers/gpu/drm/tegra/uapi.h           |  63 +++
 drivers/gpu/drm/tegra/uapi/gather_bo.c |  86 ++++
 drivers/gpu/drm/tegra/uapi/gather_bo.h |  22 +
 drivers/gpu/drm/tegra/uapi/submit.c    | 675 +++++++++++++++++++++++++
 drivers/gpu/drm/tegra/uapi/submit.h    |  17 +
 drivers/gpu/drm/tegra/uapi/uapi.c      | 326 ++++++++++++
 9 files changed, 1225 insertions(+), 18 deletions(-)
 create mode 100644 drivers/gpu/drm/tegra/uapi.h
 create mode 100644 drivers/gpu/drm/tegra/uapi/gather_bo.c
 create mode 100644 drivers/gpu/drm/tegra/uapi/gather_bo.h
 create mode 100644 drivers/gpu/drm/tegra/uapi/submit.c
 create mode 100644 drivers/gpu/drm/tegra/uapi/submit.h
 create mode 100644 drivers/gpu/drm/tegra/uapi/uapi.c

diff --git a/drivers/gpu/drm/tegra/Makefile b/drivers/gpu/drm/tegra/Makefile
index d6cf202414f0..059322e88943 100644
--- a/drivers/gpu/drm/tegra/Makefile
+++ b/drivers/gpu/drm/tegra/Makefile
@@ -3,6 +3,9 @@ ccflags-$(CONFIG_DRM_TEGRA_DEBUG) += -DDEBUG
 
 tegra-drm-y := \
 	drm.o \
+	uapi/uapi.o \
+	uapi/submit.o \
+	uapi/gather_bo.o \
 	gem.o \
 	fb.o \
 	dp.o \
diff --git a/drivers/gpu/drm/tegra/drm.c b/drivers/gpu/drm/tegra/drm.c
index 7124b0b0154b..88226dd0fd88 100644
--- a/drivers/gpu/drm/tegra/drm.c
+++ b/drivers/gpu/drm/tegra/drm.c
@@ -20,24 +20,20 @@
 #include <drm/drm_prime.h>
 #include <drm/drm_vblank.h>
 
+#include "uapi.h"
 #include "drm.h"
 #include "gem.h"
 
 #define DRIVER_NAME "tegra"
 #define DRIVER_DESC "NVIDIA Tegra graphics"
 #define DRIVER_DATE "20120330"
-#define DRIVER_MAJOR 0
+#define DRIVER_MAJOR 1
 #define DRIVER_MINOR 0
 #define DRIVER_PATCHLEVEL 0
 
 #define CARVEOUT_SZ SZ_64M
 #define CDMA_GATHER_FETCHES_MAX_NB 16383
 
-struct tegra_drm_file {
-	struct idr contexts;
-	struct mutex lock;
-};
-
 static int tegra_atomic_check(struct drm_device *drm,
 			      struct drm_atomic_state *state)
 {
@@ -90,7 +86,8 @@ static int tegra_drm_open(struct drm_device *drm, struct drm_file *filp)
 	if (!fpriv)
 		return -ENOMEM;
 
-	idr_init(&fpriv->contexts);
+	idr_init(&fpriv->legacy_contexts);
+	xa_init_flags(&fpriv->contexts, XA_FLAGS_ALLOC1);
 	mutex_init(&fpriv->lock);
 	filp->driver_priv = fpriv;
 
@@ -432,7 +429,7 @@ static int tegra_client_open(struct tegra_drm_file *fpriv,
 	if (err < 0)
 		return err;
 
-	err = idr_alloc(&fpriv->contexts, context, 1, 0, GFP_KERNEL);
+	err = idr_alloc(&fpriv->legacy_contexts, context, 1, 0, GFP_KERNEL);
 	if (err < 0) {
 		client->ops->close_channel(context);
 		return err;
@@ -487,13 +484,13 @@ static int tegra_close_channel(struct drm_device *drm, void *data,
 
 	mutex_lock(&fpriv->lock);
 
-	context = idr_find(&fpriv->contexts, args->context);
+	context = idr_find(&fpriv->legacy_contexts, args->context);
 	if (!context) {
 		err = -EINVAL;
 		goto unlock;
 	}
 
-	idr_remove(&fpriv->contexts, context->id);
+	idr_remove(&fpriv->legacy_contexts, context->id);
 	tegra_drm_context_free(context);
 
 unlock:
@@ -512,7 +509,7 @@ static int tegra_get_syncpt(struct drm_device *drm, void *data,
 
 	mutex_lock(&fpriv->lock);
 
-	context = idr_find(&fpriv->contexts, args->context);
+	context = idr_find(&fpriv->legacy_contexts, args->context);
 	if (!context) {
 		err = -ENODEV;
 		goto unlock;
@@ -541,7 +538,7 @@ static int tegra_submit(struct drm_device *drm, void *data,
 
 	mutex_lock(&fpriv->lock);
 
-	context = idr_find(&fpriv->contexts, args->context);
+	context = idr_find(&fpriv->legacy_contexts, args->context);
 	if (!context) {
 		err = -ENODEV;
 		goto unlock;
@@ -566,7 +563,7 @@ static int tegra_get_syncpt_base(struct drm_device *drm, void *data,
 
 	mutex_lock(&fpriv->lock);
 
-	context = idr_find(&fpriv->contexts, args->context);
+	context = idr_find(&fpriv->legacy_contexts, args->context);
 	if (!context) {
 		err = -ENODEV;
 		goto unlock;
@@ -734,11 +731,23 @@ static int tegra_gem_get_flags(struct drm_device *drm, void *data,
 #endif
 
 static const struct drm_ioctl_desc tegra_drm_ioctls[] = {
-#ifdef CONFIG_DRM_TEGRA_STAGING
-	DRM_IOCTL_DEF_DRV(TEGRA_GEM_CREATE, tegra_gem_create,
+	DRM_IOCTL_DEF_DRV(TEGRA_CHANNEL_OPEN, tegra_drm_ioctl_channel_open,
+			  DRM_RENDER_ALLOW),
+	DRM_IOCTL_DEF_DRV(TEGRA_CHANNEL_CLOSE, tegra_drm_ioctl_channel_close,
+			  DRM_RENDER_ALLOW),
+	DRM_IOCTL_DEF_DRV(TEGRA_CHANNEL_MAP, tegra_drm_ioctl_channel_map,
 			  DRM_RENDER_ALLOW),
-	DRM_IOCTL_DEF_DRV(TEGRA_GEM_MMAP, tegra_gem_mmap,
+	DRM_IOCTL_DEF_DRV(TEGRA_CHANNEL_UNMAP, tegra_drm_ioctl_channel_unmap,
 			  DRM_RENDER_ALLOW),
+	DRM_IOCTL_DEF_DRV(TEGRA_CHANNEL_SUBMIT, tegra_drm_ioctl_channel_submit,
+			  DRM_RENDER_ALLOW),
+	DRM_IOCTL_DEF_DRV(TEGRA_GEM_CREATE, tegra_drm_ioctl_gem_create,
+			  DRM_RENDER_ALLOW),
+	DRM_IOCTL_DEF_DRV(TEGRA_GEM_MMAP, tegra_drm_ioctl_gem_mmap,
+			  DRM_RENDER_ALLOW),
+#ifdef CONFIG_DRM_TEGRA_STAGING
+	DRM_IOCTL_DEF_DRV(TEGRA_GEM_CREATE_LEGACY, tegra_gem_create, DRM_RENDER_ALLOW),
+	DRM_IOCTL_DEF_DRV(TEGRA_GEM_MMAP_LEGACY, tegra_gem_mmap, DRM_RENDER_ALLOW),
 	DRM_IOCTL_DEF_DRV(TEGRA_SYNCPT_READ, tegra_syncpt_read,
 			  DRM_RENDER_ALLOW),
 	DRM_IOCTL_DEF_DRV(TEGRA_SYNCPT_INCR, tegra_syncpt_incr,
@@ -792,10 +801,11 @@ static void tegra_drm_postclose(struct drm_device *drm, struct drm_file *file)
 	struct tegra_drm_file *fpriv = file->driver_priv;
 
 	mutex_lock(&fpriv->lock);
-	idr_for_each(&fpriv->contexts, tegra_drm_context_cleanup, NULL);
+	idr_for_each(&fpriv->legacy_contexts, tegra_drm_context_cleanup, NULL);
+	tegra_drm_uapi_close_file(fpriv);
 	mutex_unlock(&fpriv->lock);
 
-	idr_destroy(&fpriv->contexts);
+	idr_destroy(&fpriv->legacy_contexts);
 	mutex_destroy(&fpriv->lock);
 	kfree(fpriv);
 }
diff --git a/drivers/gpu/drm/tegra/drm.h b/drivers/gpu/drm/tegra/drm.h
index 3fc42fd97911..42f8a301555c 100644
--- a/drivers/gpu/drm/tegra/drm.h
+++ b/drivers/gpu/drm/tegra/drm.h
@@ -58,6 +58,11 @@ struct tegra_drm {
 	struct tegra_display_hub *hub;
 };
 
+static inline struct host1x *tegra_drm_to_host1x(struct tegra_drm *tegra)
+{
+	return dev_get_drvdata(tegra->drm->dev->parent);
+}
+
 struct tegra_drm_client;
 
 struct tegra_drm_context {
diff --git a/drivers/gpu/drm/tegra/uapi.h b/drivers/gpu/drm/tegra/uapi.h
new file mode 100644
index 000000000000..5c422607e8fa
--- /dev/null
+++ b/drivers/gpu/drm/tegra/uapi.h
@@ -0,0 +1,63 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/* Copyright (c) 2020 NVIDIA Corporation */
+
+#ifndef _TEGRA_DRM_UAPI_H
+#define _TEGRA_DRM_UAPI_H
+
+#include <linux/dma-mapping.h>
+#include <linux/idr.h>
+#include <linux/kref.h>
+#include <linux/xarray.h>
+
+#include <drm/drm.h>
+
+struct drm_file;
+struct drm_device;
+
+struct tegra_drm_file {
+	/* Legacy UAPI state */
+	struct idr legacy_contexts;
+	struct mutex lock;
+
+	/* New UAPI state */
+	struct xarray contexts;
+};
+
+struct tegra_drm_channel_ctx {
+	struct tegra_drm_client *client;
+	struct host1x_channel *channel;
+	struct xarray mappings;
+};
+
+struct tegra_drm_mapping {
+	struct kref ref;
+
+	struct device *dev;
+	struct host1x_bo *bo;
+	struct sg_table *sgt;
+	enum dma_data_direction direction;
+	dma_addr_t iova;
+	dma_addr_t iova_end;
+};
+
+int tegra_drm_ioctl_channel_open(struct drm_device *drm, void *data,
+				 struct drm_file *file);
+int tegra_drm_ioctl_channel_close(struct drm_device *drm, void *data,
+				  struct drm_file *file);
+int tegra_drm_ioctl_channel_map(struct drm_device *drm, void *data,
+				struct drm_file *file);
+int tegra_drm_ioctl_channel_unmap(struct drm_device *drm, void *data,
+				struct drm_file *file);
+int tegra_drm_ioctl_channel_submit(struct drm_device *drm, void *data,
+				   struct drm_file *file);
+int tegra_drm_ioctl_gem_create(struct drm_device *drm, void *data,
+				struct drm_file *file);
+int tegra_drm_ioctl_gem_mmap(struct drm_device *drm, void *data,
+				struct drm_file *file);
+
+void tegra_drm_uapi_close_file(struct tegra_drm_file *file);
+void tegra_drm_mapping_put(struct tegra_drm_mapping *mapping);
+struct tegra_drm_channel_ctx *
+tegra_drm_channel_ctx_lock(struct tegra_drm_file *file, u32 id);
+
+#endif
diff --git a/drivers/gpu/drm/tegra/uapi/gather_bo.c b/drivers/gpu/drm/tegra/uapi/gather_bo.c
new file mode 100644
index 000000000000..b487a0d44648
--- /dev/null
+++ b/drivers/gpu/drm/tegra/uapi/gather_bo.c
@@ -0,0 +1,86 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/* Copyright (c) 2020 NVIDIA Corporation */
+
+#include <linux/scatterlist.h>
+#include <linux/slab.h>
+
+#include "gather_bo.h"
+
+static struct host1x_bo *gather_bo_get(struct host1x_bo *host_bo)
+{
+	struct gather_bo *bo = container_of(host_bo, struct gather_bo, base);
+
+	kref_get(&bo->ref);
+
+	return host_bo;
+}
+
+static void gather_bo_release(struct kref *ref)
+{
+	struct gather_bo *bo = container_of(ref, struct gather_bo, ref);
+
+	kfree(bo->gather_data);
+	kfree(bo);
+}
+
+void gather_bo_put(struct host1x_bo *host_bo)
+{
+	struct gather_bo *bo = container_of(host_bo, struct gather_bo, base);
+
+	kref_put(&bo->ref, gather_bo_release);
+}
+
+static struct sg_table *
+gather_bo_pin(struct device *dev, struct host1x_bo *host_bo, dma_addr_t *phys)
+{
+	struct gather_bo *bo = container_of(host_bo, struct gather_bo, base);
+	struct sg_table *sgt;
+	int err;
+
+	if (phys) {
+		*phys = virt_to_phys(bo->gather_data);
+		return NULL;
+	}
+
+	sgt = kzalloc(sizeof(*sgt), GFP_KERNEL);
+	if (!sgt)
+		return ERR_PTR(-ENOMEM);
+
+	err = sg_alloc_table(sgt, 1, GFP_KERNEL);
+	if (err) {
+		kfree(sgt);
+		return ERR_PTR(err);
+	}
+
+	sg_init_one(sgt->sgl, bo->gather_data, bo->gather_data_words*4);
+
+	return sgt;
+}
+
+static void gather_bo_unpin(struct device *dev, struct sg_table *sgt)
+{
+	if (sgt) {
+		sg_free_table(sgt);
+		kfree(sgt);
+	}
+}
+
+static void *gather_bo_mmap(struct host1x_bo *host_bo)
+{
+	struct gather_bo *bo = container_of(host_bo, struct gather_bo, base);
+
+	return bo->gather_data;
+}
+
+static void gather_bo_munmap(struct host1x_bo *host_bo, void *addr)
+{
+}
+
+const struct host1x_bo_ops gather_bo_ops = {
+	.get = gather_bo_get,
+	.put = gather_bo_put,
+	.pin = gather_bo_pin,
+	.unpin = gather_bo_unpin,
+	.mmap = gather_bo_mmap,
+	.munmap = gather_bo_munmap,
+};
diff --git a/drivers/gpu/drm/tegra/uapi/gather_bo.h b/drivers/gpu/drm/tegra/uapi/gather_bo.h
new file mode 100644
index 000000000000..6b4c9d83ac91
--- /dev/null
+++ b/drivers/gpu/drm/tegra/uapi/gather_bo.h
@@ -0,0 +1,22 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/* Copyright (c) 2020 NVIDIA Corporation */
+
+#ifndef _TEGRA_DRM_SUBMIT_GATHER_BO_H
+#define _TEGRA_DRM_SUBMIT_GATHER_BO_H
+
+#include <linux/host1x.h>
+#include <linux/kref.h>
+
+struct gather_bo {
+	struct host1x_bo base;
+
+	struct kref ref;
+
+	u32 *gather_data;
+	size_t gather_data_words;
+};
+
+extern const struct host1x_bo_ops gather_bo_ops;
+void gather_bo_put(struct host1x_bo *host_bo);
+
+#endif
diff --git a/drivers/gpu/drm/tegra/uapi/submit.c b/drivers/gpu/drm/tegra/uapi/submit.c
new file mode 100644
index 000000000000..95141f1516e5
--- /dev/null
+++ b/drivers/gpu/drm/tegra/uapi/submit.c
@@ -0,0 +1,675 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/* Copyright (c) 2020 NVIDIA Corporation */
+
+#include <linux/dma-fence-array.h>
+#include <linux/file.h>
+#include <linux/host1x.h>
+#include <linux/iommu.h>
+#include <linux/kref.h>
+#include <linux/list.h>
+#include <linux/nospec.h>
+#include <linux/pm_runtime.h>
+#include <linux/sync_file.h>
+
+#include <drm/drm_drv.h>
+#include <drm/drm_file.h>
+
+#include "../uapi.h"
+#include "../drm.h"
+#include "../gem.h"
+
+#include "gather_bo.h"
+#include "submit.h"
+
+static struct tegra_drm_mapping *
+tegra_drm_mapping_get(struct tegra_drm_channel_ctx *ctx, u32 id)
+{
+	struct tegra_drm_mapping *mapping;
+
+	xa_lock(&ctx->mappings);
+	mapping = xa_load(&ctx->mappings, id);
+	if (mapping)
+		kref_get(&mapping->ref);
+	xa_unlock(&ctx->mappings);
+
+	return mapping;
+}
+
+static void *alloc_copy_user_array(void __user *from, size_t count, size_t size)
+{
+	unsigned long copy_err;
+	size_t copy_len;
+	void *data;
+
+	if (check_mul_overflow(count, size, &copy_len))
+		return ERR_PTR(-EINVAL);
+
+	data = kvmalloc(copy_len, GFP_KERNEL);
+	if (!data)
+		return ERR_PTR(-ENOMEM);
+
+	copy_err = copy_from_user(data, from, copy_len);
+	if (copy_err) {
+		kvfree(data);
+		return ERR_PTR(-EFAULT);
+	}
+
+	return data;
+}
+
+static int submit_copy_gather_data(struct drm_device *drm,
+				   struct gather_bo **pbo,
+				   struct drm_tegra_channel_submit *args)
+{
+	unsigned long copy_err;
+	struct gather_bo *bo;
+	size_t copy_len;
+
+	if (args->gather_data_words == 0) {
+		drm_info(drm, "gather_data_words can't be 0");
+		return -EINVAL;
+	}
+
+	if (check_mul_overflow((size_t)args->gather_data_words, (size_t)4, &copy_len))
+		return -EINVAL;
+
+	bo = kzalloc(sizeof(*bo), GFP_KERNEL);
+	if (!bo)
+		return -ENOMEM;
+
+	kref_init(&bo->ref);
+	host1x_bo_init(&bo->base, &gather_bo_ops);
+
+	bo->gather_data = kmalloc(copy_len, GFP_KERNEL | __GFP_NOWARN);
+	if (!bo->gather_data) {
+		kfree(bo);
+		return -ENOMEM;
+	}
+
+	copy_err = copy_from_user(bo->gather_data,
+				  u64_to_user_ptr(args->gather_data_ptr),
+				  copy_len);
+	if (copy_err) {
+		kfree(bo->gather_data);
+		kfree(bo);
+		return -EFAULT;
+	}
+
+	bo->gather_data_words = args->gather_data_words;
+
+	*pbo = bo;
+
+	return 0;
+}
+
+static int submit_write_reloc(struct gather_bo *bo,
+			      struct drm_tegra_submit_buf *buf,
+			      struct tegra_drm_mapping *mapping)
+{
+	/* TODO check that target_offset is within bounds */
+	dma_addr_t iova = mapping->iova + buf->reloc.target_offset;
+	u32 written_ptr = (u32)(iova >> buf->reloc.shift);
+
+	if (buf->flags & DRM_TEGRA_SUBMIT_BUF_RELOC_BLOCKLINEAR)
+		written_ptr |= BIT(39);
+
+	if (buf->reloc.gather_offset_words >= bo->gather_data_words)
+		return -EINVAL;
+
+	buf->reloc.gather_offset_words = array_index_nospec(
+		buf->reloc.gather_offset_words, bo->gather_data_words);
+
+	bo->gather_data[buf->reloc.gather_offset_words] = written_ptr;
+
+	return 0;
+}
+
+static void submit_unlock_resv(struct tegra_drm_submit_data *job_data,
+			       struct ww_acquire_ctx *acquire_ctx)
+{
+	u32 i;
+
+	for (i = 0; i < job_data->num_used_mappings; i++) {
+		struct tegra_bo *bo = host1x_to_tegra_bo(
+			job_data->used_mappings[i].mapping->bo);
+
+		dma_resv_unlock(bo->gem.resv);
+	}
+
+	ww_acquire_fini(acquire_ctx);
+}
+
+static int submit_handle_resv(struct tegra_drm_submit_data *job_data,
+			      struct ww_acquire_ctx *acquire_ctx,
+			      struct xarray *implicit_fences)
+{
+	struct tegra_drm_used_mapping *mappings = job_data->used_mappings;
+	struct tegra_bo *bo;
+	int contended = -1;
+	int err;
+	u32 i;
+
+	/* Based on drm_gem_lock_reservations */
+
+	ww_acquire_init(acquire_ctx, &reservation_ww_class);
+
+retry:
+	if (contended != -1) {
+		bo = host1x_to_tegra_bo(mappings[contended].mapping->bo);
+
+		err = dma_resv_lock_slow_interruptible(bo->gem.resv, acquire_ctx);
+		if (err) {
+			ww_acquire_done(acquire_ctx);
+			return err;
+		}
+	}
+
+	for (i = 0; i < job_data->num_used_mappings; i++) {
+		bo = host1x_to_tegra_bo(mappings[i].mapping->bo);
+
+		if (i == contended)
+			continue;
+
+		err = dma_resv_lock_interruptible(bo->gem.resv, acquire_ctx);
+		if (err) {
+			int j;
+
+			for (j = 0; j < i; j++) {
+				bo = host1x_to_tegra_bo(mappings[j].mapping->bo);
+				dma_resv_unlock(bo->gem.resv);
+			}
+
+			if (contended != -1 && contended >= i) {
+				bo = host1x_to_tegra_bo(mappings[contended].mapping->bo);
+				dma_resv_unlock(bo->gem.resv);
+			}
+
+			if (err == -EDEADLK) {
+				contended = i;
+				goto retry;
+			}
+
+			ww_acquire_done(acquire_ctx);
+			return err;
+		}
+	}
+
+	ww_acquire_done(acquire_ctx);
+
+	for (i = 0; i < job_data->num_used_mappings; i++) {
+		bo = host1x_to_tegra_bo(mappings[i].mapping->bo);
+
+		if (mappings[i].flags & DRM_TEGRA_SUBMIT_BUF_RESV_WRITE) {
+			err = drm_gem_fence_array_add_implicit(implicit_fences,
+							       &bo->gem, true);
+			if (err < 0)
+				goto unlock_resv;
+		} else if (mappings[i].flags & DRM_TEGRA_SUBMIT_BUF_RESV_READ) {
+			err = dma_resv_reserve_shared(bo->gem.resv, 1);
+			if (err < 0)
+				goto unlock_resv;
+
+			err = drm_gem_fence_array_add_implicit(implicit_fences,
+							       &bo->gem, false);
+			if (err < 0)
+				goto unlock_resv;
+		}
+	}
+
+	return 0;
+
+unlock_resv:
+	submit_unlock_resv(job_data, acquire_ctx);
+
+	return err;
+}
+
+static int submit_process_bufs(struct drm_device *drm, struct gather_bo *bo,
+			       struct tegra_drm_submit_data *job_data,
+			       struct tegra_drm_channel_ctx *ctx,
+			       struct drm_tegra_channel_submit *args,
+			       struct ww_acquire_ctx *acquire_ctx,
+			       bool *need_implicit_fences)
+{
+	struct tegra_drm_used_mapping *mappings;
+	struct drm_tegra_submit_buf *bufs;
+	int err;
+	u32 i;
+
+	bufs = alloc_copy_user_array(u64_to_user_ptr(args->bufs_ptr),
+				     args->num_bufs, sizeof(*bufs));
+	if (IS_ERR(bufs))
+		return PTR_ERR(bufs);
+
+	mappings = kcalloc(args->num_bufs, sizeof(*mappings), GFP_KERNEL);
+	if (!mappings) {
+		err = -ENOMEM;
+		goto done;
+	}
+
+	*need_implicit_fences = false;
+
+	for (i = 0; i < args->num_bufs; i++) {
+		struct drm_tegra_submit_buf *buf = &bufs[i];
+		struct tegra_drm_mapping *mapping;
+
+		if (buf->flags & ~(DRM_TEGRA_SUBMIT_BUF_RELOC_BLOCKLINEAR |
+				   DRM_TEGRA_SUBMIT_BUF_RESV_READ |
+				   DRM_TEGRA_SUBMIT_BUF_RESV_WRITE)) {
+			err = -EINVAL;
+			goto drop_refs;
+		}
+
+		if (buf->reserved[0] || buf->reserved[1]) {
+			err = -EINVAL;
+			goto drop_refs;
+		}
+
+		mapping = tegra_drm_mapping_get(ctx, buf->mapping_id);
+		if (!mapping) {
+			drm_info(drm, "invalid mapping_id for buf: %u",
+				 buf->mapping_id);
+			err = -EINVAL;
+			goto drop_refs;
+		}
+
+		err = submit_write_reloc(bo, buf, mapping);
+		if (err) {
+			tegra_drm_mapping_put(mapping);
+			goto drop_refs;
+		}
+
+		mappings[i].mapping = mapping;
+		mappings[i].flags = buf->flags;
+
+		if (buf->flags & (DRM_TEGRA_SUBMIT_BUF_RESV_READ |
+				  DRM_TEGRA_SUBMIT_BUF_RESV_WRITE))
+			*need_implicit_fences = true;
+	}
+
+	job_data->used_mappings = mappings;
+	job_data->num_used_mappings = i;
+
+	err = 0;
+
+	goto done;
+
+drop_refs:
+	for (;;) {
+		if (i-- == 0)
+			break;
+
+		tegra_drm_mapping_put(mappings[i].mapping);
+	}
+
+	kfree(mappings);
+	job_data->used_mappings = NULL;
+
+done:
+	kvfree(bufs);
+
+	return err;
+}
+
+static int submit_get_syncpt(struct drm_device *drm, struct host1x_job *job,
+			     struct drm_tegra_channel_submit *args)
+{
+	struct drm_tegra_submit_syncpt_incr *incr;
+	struct host1x_syncpt *sp;
+
+	if (args->syncpt_incrs[1].num_incrs != 0) {
+		drm_info(drm, "Only 1 syncpoint supported for now");
+		return -EINVAL;
+	}
+
+	incr = &args->syncpt_incrs[0];
+
+	if ((incr->flags & ~DRM_TEGRA_SUBMIT_SYNCPT_INCR_CREATE_SYNC_FILE) ||
+	    incr->reserved[0] || incr->reserved[1] || incr->reserved[2])
+		return -EINVAL;
+
+	/* Syncpt ref will be dropped on job release */
+	sp = host1x_syncpt_fd_get(incr->syncpt_fd);
+	if (IS_ERR(sp))
+		return PTR_ERR(sp);
+
+	job->syncpt = sp;
+	job->syncpt_incrs = incr->num_incrs;
+
+	return 0;
+}
+
+static int submit_job_add_gather(struct host1x_job *job,
+				 struct tegra_drm_channel_ctx *ctx,
+				 struct drm_tegra_submit_cmd_gather_uptr *cmd,
+				 struct gather_bo *bo, u32 *offset,
+				 struct tegra_drm_submit_data *job_data)
+{
+	u32 next_offset;
+
+	if (cmd->reserved[0] || cmd->reserved[1] || cmd->reserved[2])
+		return -EINVAL;
+
+	/* Check for maximum gather size */
+	if (cmd->words > 16383)
+		return -EINVAL;
+
+	if (check_add_overflow(*offset, cmd->words, &next_offset))
+		return -EINVAL;
+
+	if (next_offset > bo->gather_data_words)
+		return -EINVAL;
+
+	host1x_job_add_gather(job, &bo->base, cmd->words, *offset * 4);
+
+	*offset = next_offset;
+
+	return 0;
+}
+
+static int submit_create_job(struct drm_device *drm, struct host1x_job **pjob,
+			     struct gather_bo *bo,
+			     struct tegra_drm_channel_ctx *ctx,
+			     struct drm_tegra_channel_submit *args,
+			     struct tegra_drm_submit_data *job_data,
+			     bool need_implicit_fences)
+{
+	struct drm_tegra_submit_cmd *cmds;
+	u32 i, gather_offset = 0;
+	struct host1x_job *job;
+	u32 num_cmds;
+	int err;
+
+	cmds = alloc_copy_user_array(u64_to_user_ptr(args->cmds_ptr),
+				     args->num_cmds, sizeof(*cmds));
+	if (IS_ERR(cmds))
+		return PTR_ERR(cmds);
+
+	num_cmds = args->num_cmds;
+	if (need_implicit_fences)
+		num_cmds++;
+
+	job = host1x_job_alloc(ctx->channel, num_cmds, 0);
+	if (!job) {
+		err = -ENOMEM;
+		goto done;
+	}
+
+	err = submit_get_syncpt(drm, job, args);
+	if (err < 0)
+		goto free_job;
+
+	job->client = &ctx->client->base;
+	job->class = ctx->client->base.class;
+	job->serialize = true;
+
+	if (need_implicit_fences) {
+		u32 threshold = host1x_syncpt_incr_max(job->syncpt, 1) - 1;
+		host1x_job_add_wait(job, host1x_syncpt_id(job->syncpt), threshold);
+	}
+
+	for (i = 0; i < args->num_cmds; i++) {
+		struct drm_tegra_submit_cmd *cmd = &cmds[i];
+
+		if (cmd->type == DRM_TEGRA_SUBMIT_CMD_GATHER_UPTR) {
+			err = submit_job_add_gather(job, ctx, &cmd->gather_uptr,
+						    bo, &gather_offset,
+						    job_data);
+			if (err)
+				goto free_job;
+		} else if (cmd->type == DRM_TEGRA_SUBMIT_CMD_WAIT_SYNCPT) {
+			if (cmd->wait_syncpt.reserved[0] ||
+			    cmd->wait_syncpt.reserved[1]) {
+				err = -EINVAL;
+				goto free_job;
+			}
+
+			host1x_job_add_wait(job, cmd->wait_syncpt.id,
+					    cmd->wait_syncpt.threshold);
+		} else if (cmd->type == DRM_TEGRA_SUBMIT_CMD_WAIT_SYNC_FILE) {
+			struct dma_fence *f;
+
+			if (cmd->wait_sync_file.reserved[0] ||
+			    cmd->wait_sync_file.reserved[1] ||
+			    cmd->wait_sync_file.reserved[2]) {
+				err = -EINVAL;
+				goto free_job;
+			}
+
+			f = sync_file_get_fence(cmd->wait_sync_file.fd);
+			if (!f) {
+				err = -EINVAL;
+				goto free_job;
+			}
+
+			err = dma_fence_wait(f, true);
+			dma_fence_put(f);
+
+			if (err)
+				goto free_job;
+		} else {
+			err = -EINVAL;
+			goto free_job;
+		}
+	}
+
+	if (gather_offset == 0) {
+		drm_info(drm, "Job must have at least one gather");
+		err = -EINVAL;
+		goto free_job;
+	}
+
+	*pjob = job;
+
+	err = 0;
+	goto done;
+
+free_job:
+	host1x_job_put(job);
+
+done:
+	kvfree(cmds);
+
+	return err;
+}
+
+static int submit_create_postfences(struct host1x_job *job,
+				    struct drm_tegra_channel_submit *args)
+{
+	struct drm_tegra_submit_syncpt_incr *incr = &args->syncpt_incrs[0];
+	struct tegra_drm_submit_data *job_data = job->user_data;
+	struct dma_fence *fence;
+	int err = 0;
+	u32 i;
+
+	fence = host1x_fence_create(job->syncpt, job->syncpt_end);
+	if (IS_ERR(fence))
+		return PTR_ERR(fence);
+
+	incr->fence_value = job->syncpt_end;
+
+	for (i = 0; i < job_data->num_used_mappings; i++) {
+		struct tegra_drm_used_mapping *um = &job_data->used_mappings[i];
+		struct tegra_bo *bo = host1x_to_tegra_bo(um->mapping->bo);
+
+		if (um->flags & DRM_TEGRA_SUBMIT_BUF_RESV_READ)
+			dma_resv_add_shared_fence(bo->gem.resv, fence);
+
+		if (um->flags & DRM_TEGRA_SUBMIT_BUF_RESV_WRITE)
+			dma_resv_add_excl_fence(bo->gem.resv, fence);
+	}
+
+	if (incr->flags & DRM_TEGRA_SUBMIT_SYNCPT_INCR_CREATE_SYNC_FILE) {
+		struct sync_file *sf;
+
+		err = get_unused_fd_flags(O_CLOEXEC);
+		if (err < 0)
+			goto put_fence;
+
+		sf = sync_file_create(fence);
+		if (!sf) {
+			err = -ENOMEM;
+			goto put_fence;
+		}
+
+		fd_install(err, sf->file);
+		incr->sync_file_fd = err;
+		err = 0;
+	}
+
+put_fence:
+	dma_fence_put(fence);
+
+	return err;
+}
+
+static void release_job(struct host1x_job *job)
+{
+	struct tegra_drm_client *client =
+		container_of(job->client, struct tegra_drm_client, base);
+	struct tegra_drm_submit_data *job_data = job->user_data;
+	u32 i;
+
+	for (i = 0; i < job_data->num_used_mappings; i++)
+		tegra_drm_mapping_put(job_data->used_mappings[i].mapping);
+
+	kfree(job_data->used_mappings);
+	kfree(job_data);
+
+	pm_runtime_put_autosuspend(client->base.dev);
+}
+
+int tegra_drm_ioctl_channel_submit(struct drm_device *drm, void *data,
+				   struct drm_file *file)
+{
+	struct tegra_drm_file *fpriv = file->driver_priv;
+	struct drm_tegra_channel_submit *args = data;
+	struct tegra_drm_submit_data *job_data;
+	struct ww_acquire_ctx acquire_ctx;
+	struct tegra_drm_channel_ctx *ctx;
+	DEFINE_XARRAY(implicit_fences);
+	bool need_implicit_fences;
+	struct host1x_job *job;
+	struct gather_bo *bo;
+	u32 i;
+	int err;
+
+	if (args->reserved0 || args->reserved1)
+		return -EINVAL;
+
+	ctx = tegra_drm_channel_ctx_lock(fpriv, args->channel_ctx);
+	if (!ctx)
+		return -EINVAL;
+
+	/* Allocate gather BO and copy gather words in. */
+	err = submit_copy_gather_data(drm, &bo, args);
+	if (err)
+		goto unlock;
+
+	job_data = kzalloc(sizeof(*job_data), GFP_KERNEL);
+	if (!job_data) {
+		err = -ENOMEM;
+		goto put_bo;
+	}
+
+	/* Get data buffer mappings and do relocation patching. */
+	err = submit_process_bufs(drm, bo, job_data, ctx, args, &acquire_ctx,
+				  &need_implicit_fences);
+	if (err)
+		goto free_job_data;
+
+	/* Allocate host1x_job and add gathers and waits to it. */
+	err = submit_create_job(drm, &job, bo, ctx, args,
+				job_data, need_implicit_fences);
+	if (err)
+		goto free_job_data;
+
+	/* Map gather data for Host1x. */
+	err = host1x_job_pin(job, ctx->client->base.dev);
+	if (err)
+		goto put_job;
+
+	/* Boot engine. */
+	err = pm_runtime_get_sync(ctx->client->base.dev);
+	if (err < 0)
+		goto put_pm_runtime;
+
+	job->user_data = job_data;
+	job->release = release_job;
+	job->timeout = 10000;
+
+	/*
+	 * job_data is now part of job reference counting, so don't release
+	 * it from here.
+	 */
+	job_data = NULL;
+
+	if (need_implicit_fences) {
+		xa_init_flags(&implicit_fences, XA_FLAGS_ALLOC);
+
+		/*
+		 * Lock DMA reservations, reserve fence slots and
+		 * retrieve prefences.
+		 */
+		err = submit_handle_resv(job->user_data, &acquire_ctx,
+					 &implicit_fences);
+		if (err)
+			goto put_pm_runtime;
+	}
+
+	/* Submit job to hardware. */
+	err = host1x_job_submit(job);
+	if (err)
+		goto unlock_resv;
+
+	/* Return postfences to userspace and add fences to DMA reservations. */
+	err = submit_create_postfences(job, args);
+
+	if (need_implicit_fences) {
+		struct dma_fence *fence;
+		unsigned long index;
+		int err = 0;
+
+		/* Unlock DMA reservations. */
+		submit_unlock_resv(job->user_data, &acquire_ctx);
+
+		/* Wait for fences and unblock job. */
+		xa_for_each(&implicit_fences, index, fence) {
+			err = dma_fence_wait(fence, false);
+			if (err < 0)
+				break;
+		}
+
+		xa_destroy(&implicit_fences);
+
+		if (err == 0)
+			host1x_syncpt_incr(job->syncpt);
+	}
+
+	goto put_job;
+
+unlock_resv:
+	if (need_implicit_fences) {
+		submit_unlock_resv(job->user_data, &acquire_ctx);
+		xa_destroy(&implicit_fences);
+	}
+put_pm_runtime:
+	if (!job->release)
+		pm_runtime_put(ctx->client->base.dev);
+	host1x_job_unpin(job);
+put_job:
+	host1x_job_put(job);
+free_job_data:
+	if (job_data && job_data->used_mappings) {
+		for (i = 0; i < job_data->num_used_mappings; i++)
+			tegra_drm_mapping_put(job_data->used_mappings[i].mapping);
+		kfree(job_data->used_mappings);
+	}
+	if (job_data)
+		kfree(job_data);
+put_bo:
+	gather_bo_put(&bo->base);
+unlock:
+	mutex_unlock(&fpriv->lock);
+	return err;
+}
diff --git a/drivers/gpu/drm/tegra/uapi/submit.h b/drivers/gpu/drm/tegra/uapi/submit.h
new file mode 100644
index 000000000000..0a165e9e4bda
--- /dev/null
+++ b/drivers/gpu/drm/tegra/uapi/submit.h
@@ -0,0 +1,17 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/* Copyright (c) 2020 NVIDIA Corporation */
+
+#ifndef _TEGRA_DRM_UAPI_SUBMIT_H
+#define _TEGRA_DRM_UAPI_SUBMIT_H
+
+struct tegra_drm_used_mapping {
+	struct tegra_drm_mapping *mapping;
+	u32 flags;
+};
+
+struct tegra_drm_submit_data {
+	struct tegra_drm_used_mapping *used_mappings;
+	u32 num_used_mappings;
+};
+
+#endif
diff --git a/drivers/gpu/drm/tegra/uapi/uapi.c b/drivers/gpu/drm/tegra/uapi/uapi.c
new file mode 100644
index 000000000000..9bd7766e759a
--- /dev/null
+++ b/drivers/gpu/drm/tegra/uapi/uapi.c
@@ -0,0 +1,326 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/* Copyright (c) 2020 NVIDIA Corporation */
+
+#include <linux/host1x.h>
+#include <linux/iommu.h>
+#include <linux/list.h>
+
+#include <drm/drm_drv.h>
+#include <drm/drm_file.h>
+
+#include "../uapi.h"
+#include "../drm.h"
+
+struct tegra_drm_channel_ctx *
+tegra_drm_channel_ctx_lock(struct tegra_drm_file *file, u32 id)
+{
+	struct tegra_drm_channel_ctx *ctx;
+
+	mutex_lock(&file->lock);
+	ctx = xa_load(&file->contexts, id);
+	if (!ctx)
+		mutex_unlock(&file->lock);
+
+	return ctx;
+}
+
+static void tegra_drm_mapping_release(struct kref *ref)
+{
+	struct tegra_drm_mapping *mapping =
+		container_of(ref, struct tegra_drm_mapping, ref);
+
+	if (mapping->sgt)
+		dma_unmap_sgtable(mapping->dev, mapping->sgt,
+				  mapping->direction, DMA_ATTR_SKIP_CPU_SYNC);
+
+	host1x_bo_unpin(mapping->dev, mapping->bo, mapping->sgt);
+	host1x_bo_put(mapping->bo);
+
+	kfree(mapping);
+}
+
+void tegra_drm_mapping_put(struct tegra_drm_mapping *mapping)
+{
+	kref_put(&mapping->ref, tegra_drm_mapping_release);
+}
+
+static void tegra_drm_channel_ctx_close(struct tegra_drm_channel_ctx *ctx)
+{
+	unsigned long mapping_id;
+	struct tegra_drm_mapping *mapping;
+
+	xa_for_each(&ctx->mappings, mapping_id, mapping)
+		tegra_drm_mapping_put(mapping);
+
+	xa_destroy(&ctx->mappings);
+
+	host1x_channel_put(ctx->channel);
+
+	kfree(ctx);
+}
+
+int close_channel_ctx(int id, void *p, void *data)
+{
+	struct tegra_drm_channel_ctx *ctx = p;
+
+	tegra_drm_channel_ctx_close(ctx);
+
+	return 0;
+}
+
+void tegra_drm_uapi_close_file(struct tegra_drm_file *file)
+{
+	unsigned long ctx_id;
+	struct tegra_drm_channel_ctx *ctx;
+
+	xa_for_each(&file->contexts, ctx_id, ctx)
+		tegra_drm_channel_ctx_close(ctx);
+
+	xa_destroy(&file->contexts);
+}
+
+int tegra_drm_ioctl_channel_open(struct drm_device *drm, void *data,
+				 struct drm_file *file)
+{
+	struct tegra_drm_file *fpriv = file->driver_priv;
+	struct tegra_drm *tegra = drm->dev_private;
+	struct drm_tegra_channel_open *args = data;
+	struct tegra_drm_client *client = NULL;
+	struct tegra_drm_channel_ctx *ctx;
+	int err;
+
+	if (args->flags || args->reserved[0] || args->reserved[1])
+		return -EINVAL;
+
+	ctx = kzalloc(sizeof(*ctx), GFP_KERNEL);
+	if (!ctx)
+		return -ENOMEM;
+
+	err = -ENODEV;
+	list_for_each_entry(client, &tegra->clients, list) {
+		if (client->base.class == args->host1x_class) {
+			err = 0;
+			break;
+		}
+	}
+	if (err)
+		goto free_ctx;
+
+	if (client->shared_channel) {
+		ctx->channel = host1x_channel_get(client->shared_channel);
+	} else {
+		ctx->channel = host1x_channel_request(&client->base);
+		if (!ctx->channel) {
+			err = -EBUSY;
+			goto free_ctx;
+		}
+	}
+
+	err = xa_alloc(&fpriv->contexts, &args->channel_ctx, ctx,
+		       XA_LIMIT(1, U32_MAX), GFP_KERNEL);
+	if (err < 0)
+		goto put_channel;
+
+	ctx->client = client;
+	xa_init_flags(&ctx->mappings, XA_FLAGS_ALLOC1);
+
+	args->hardware_version = client->version;
+
+	return 0;
+
+put_channel:
+	host1x_channel_put(ctx->channel);
+free_ctx:
+	kfree(ctx);
+
+	return err;
+}
+
+int tegra_drm_ioctl_channel_close(struct drm_device *drm, void *data,
+				  struct drm_file *file)
+{
+	struct tegra_drm_file *fpriv = file->driver_priv;
+	struct drm_tegra_channel_close *args = data;
+	struct tegra_drm_channel_ctx *ctx;
+
+	if (args->reserved[0])
+		return -EINVAL;
+
+	ctx = tegra_drm_channel_ctx_lock(fpriv, args->channel_ctx);
+	if (!ctx)
+		return -EINVAL;
+
+	xa_erase(&fpriv->contexts, args->channel_ctx);
+
+	mutex_unlock(&fpriv->lock);
+
+	tegra_drm_channel_ctx_close(ctx);
+
+	return 0;
+}
+
+int tegra_drm_ioctl_channel_map(struct drm_device *drm, void *data,
+				struct drm_file *file)
+{
+	struct tegra_drm_file *fpriv = file->driver_priv;
+	struct drm_tegra_channel_map *args = data;
+	struct tegra_drm_channel_ctx *ctx;
+	struct tegra_drm_mapping *mapping;
+	struct drm_gem_object *gem;
+	u32 mapping_id;
+	int err = 0;
+
+	if (args->flags & ~DRM_TEGRA_CHANNEL_MAP_READWRITE)
+		return -EINVAL;
+	if (args->reserved[0] || args->reserved[1])
+		return -EINVAL;
+
+	if (!IS_ALIGNED(args->offset, 0x1000) ||
+	    !IS_ALIGNED(args->length, 0x1000))
+		return -EINVAL;
+
+	ctx = tegra_drm_channel_ctx_lock(fpriv, args->channel_ctx);
+	if (!ctx)
+		return -EINVAL;
+
+	mapping = kzalloc(sizeof(*mapping), GFP_KERNEL);
+	if (!mapping) {
+		err = -ENOMEM;
+		goto unlock;
+	}
+
+	kref_init(&mapping->ref);
+
+	gem = drm_gem_object_lookup(file, args->handle);
+	if (!gem) {
+		err = -EINVAL;
+		goto unlock;
+	}
+
+	if (args->offset >= gem->size || args->length > gem->size ||
+	    args->offset > gem->size - args->length) {
+		err = -EINVAL;
+		goto put_gem;
+	}
+
+	mapping->dev = ctx->client->base.dev;
+	mapping->bo = &container_of(gem, struct tegra_bo, gem)->base;
+
+	if (!iommu_get_domain_for_dev(mapping->dev) ||
+	    ctx->client->base.group) {
+		host1x_bo_pin(mapping->dev, mapping->bo,
+			      &mapping->iova);
+	} else {
+		mapping->direction = DMA_TO_DEVICE;
+		if (args->flags & DRM_TEGRA_CHANNEL_MAP_READWRITE)
+			mapping->direction = DMA_BIDIRECTIONAL;
+
+		mapping->sgt =
+			host1x_bo_pin(mapping->dev, mapping->bo, NULL);
+		if (IS_ERR(mapping->sgt)) {
+			err = PTR_ERR(mapping->sgt);
+			goto put_gem;
+		}
+
+		err = dma_map_sgtable(mapping->dev, mapping->sgt,
+				      mapping->direction,
+				      DMA_ATTR_SKIP_CPU_SYNC);
+		if (err)
+			goto unpin;
+
+		/* TODO only map the requested part */
+		mapping->iova = sg_dma_address(mapping->sgt->sgl) + args->offset;
+		mapping->iova_end = mapping->iova + gem->size;
+	}
+
+	mutex_unlock(&fpriv->lock);
+
+	err = xa_alloc(&ctx->mappings, &mapping_id, mapping,
+		       XA_LIMIT(1, U32_MAX), GFP_KERNEL);
+	if (err < 0)
+		goto unmap;
+
+	/* TODO: if appropriate, return actual IOVA */
+	args->iova = U64_MAX;
+	args->mapping_id = mapping_id;
+
+	return 0;
+
+unmap:
+	if (mapping->sgt) {
+		dma_unmap_sgtable(mapping->dev, mapping->sgt,
+				  mapping->direction, DMA_ATTR_SKIP_CPU_SYNC);
+	}
+unpin:
+	host1x_bo_unpin(mapping->dev, mapping->bo, mapping->sgt);
+put_gem:
+	drm_gem_object_put(gem);
+	kfree(mapping);
+unlock:
+	mutex_unlock(&fpriv->lock);
+	return err;
+}
+
+int tegra_drm_ioctl_channel_unmap(struct drm_device *drm, void *data,
+				  struct drm_file *file)
+{
+	struct tegra_drm_file *fpriv = file->driver_priv;
+	struct drm_tegra_channel_unmap *args = data;
+	struct tegra_drm_channel_ctx *ctx;
+	struct tegra_drm_mapping *mapping;
+
+	if (args->reserved[0] || args->reserved[1])
+		return -EINVAL;
+
+	ctx = tegra_drm_channel_ctx_lock(fpriv, args->channel_ctx);
+	if (!ctx)
+		return -EINVAL;
+
+	mapping = xa_erase(&ctx->mappings, args->mapping_id);
+
+	mutex_unlock(&fpriv->lock);
+
+	if (mapping) {
+		tegra_drm_mapping_put(mapping);
+		return 0;
+	} else {
+		return -EINVAL;
+	}
+}
+
+int tegra_drm_ioctl_gem_create(struct drm_device *drm, void *data,
+			       struct drm_file *file)
+{
+	struct drm_tegra_gem_create *args = data;
+	struct tegra_bo *bo;
+
+	if (args->flags)
+		return -EINVAL;
+
+	bo = tegra_bo_create_with_handle(file, drm, args->size, args->flags,
+					 &args->handle);
+	if (IS_ERR(bo))
+		return PTR_ERR(bo);
+
+	return 0;
+}
+
+int tegra_drm_ioctl_gem_mmap(struct drm_device *drm, void *data,
+			     struct drm_file *file)
+{
+	struct drm_tegra_gem_mmap *args = data;
+	struct drm_gem_object *gem;
+	struct tegra_bo *bo;
+
+	gem = drm_gem_object_lookup(file, args->handle);
+	if (!gem)
+		return -EINVAL;
+
+	bo = to_tegra_bo(gem);
+
+	args->offset = drm_vma_node_offset_addr(&bo->gem.vma_node);
+
+	drm_gem_object_put(gem);
+
+	return 0;
+}
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
