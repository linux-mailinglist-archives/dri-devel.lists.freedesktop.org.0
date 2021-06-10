Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F4213A29D3
	for <lists+dri-devel@lfdr.de>; Thu, 10 Jun 2021 13:05:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51F4E6ECEC;
	Thu, 10 Jun 2021 11:05:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E535D6ECD4
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Jun 2021 11:05:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
 s=20161220; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=nn9/uo3sG268ndwVjh44m3ZMxE0zjjmzXbHB8FGSRgI=; b=XKqjX9AlcW9ArLuHtmIsRAxZeY
 q8hyAoAW4MA5nMonrR8DlpViBy9Eh2QwV70jYnMjtFKSXrXmvI69FJHXzqNrkC/oBmn2vwmmvPJSZ
 DJDXVUJkkwzvayoexAmLvDErjfkV7yUb7QM7XA0D4CveiiNuuq1aajTZW4u9mDbkuPVJZI+39mOZP
 8PgTeen1VFHBd8wQe1+YDeDaY2N8DXaum5fMr5SI3NzRBmlCplJdq19n+Gx3YUB7aib6eTYpvcG/p
 WJjcdOP0hnz82ixOt6p5i1pUGX7lUo04f2WMTxO5dCM3gfXrDDr3Gx0ajfCF4L+9aDA6BxUbyYfsw
 XC2cH+xg==;
Received: from dsl-hkibng22-54f986-236.dhcp.inet.fi ([84.249.134.236]
 helo=toshino.localdomain)
 by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <mperttunen@nvidia.com>)
 id 1lrIUt-0001s7-E1; Thu, 10 Jun 2021 14:05:15 +0300
From: Mikko Perttunen <mperttunen@nvidia.com>
To: thierry.reding@gmail.com, jonathanh@nvidia.com, digetx@gmail.com,
 airlied@linux.ie, daniel@ffwll.ch
Subject: [PATCH v7 10/15] drm/tegra: Implement new UAPI
Date: Thu, 10 Jun 2021 14:04:51 +0300
Message-Id: <20210610110456.3692391-11-mperttunen@nvidia.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210610110456.3692391-1-mperttunen@nvidia.com>
References: <20210610110456.3692391-1-mperttunen@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Mikko Perttunen <mperttunen@nvidia.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Implement the non-submission parts of the new UAPI, including
channel management and memory mapping. The UAPI is under the
CONFIG_DRM_TEGRA_STAGING config flag for now.

Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
---
v7:
* Remove unused gem_create/mmap functions
* Use gem->size for BO size - the bare size property is not
  always filled
v6:
* Whitespace fixes
* Tell userspace if engine is cache coherent when opening
  a channel
* Removed uapi subdirectory
* Reuse tegra_drm_context instead of creating new
  tegra_drm_channel_ctx
* Remove tegra_drm_channel_ctx_lock
* Simplify id variable names
* Remove unused close_channel_ctx function
* Use tegra_gem_lookup
* Clean up channel_open by outlining client-finding
  code
* Use DMA API path when there is no IOMMU
* Remove unnecessary comment
* Remove new GEM_CREATE/GEM_MMAP
* Move unlock in channel_map to avoid double unlock
  on error path.
v5:
* Set iova_end in both mapping paths
v4:
* New patch, split out from combined UAPI + submit patch.
---
 drivers/gpu/drm/tegra/Makefile |   1 +
 drivers/gpu/drm/tegra/drm.c    |  37 +++--
 drivers/gpu/drm/tegra/drm.h    |  10 ++
 drivers/gpu/drm/tegra/uapi.c   | 263 +++++++++++++++++++++++++++++++++
 drivers/gpu/drm/tegra/uapi.h   |  51 +++++++
 5 files changed, 346 insertions(+), 16 deletions(-)
 create mode 100644 drivers/gpu/drm/tegra/uapi.c
 create mode 100644 drivers/gpu/drm/tegra/uapi.h

diff --git a/drivers/gpu/drm/tegra/Makefile b/drivers/gpu/drm/tegra/Makefile
index d6cf202414f0..783475ffd943 100644
--- a/drivers/gpu/drm/tegra/Makefile
+++ b/drivers/gpu/drm/tegra/Makefile
@@ -3,6 +3,7 @@ ccflags-$(CONFIG_DRM_TEGRA_DEBUG) += -DDEBUG
 
 tegra-drm-y := \
 	drm.o \
+	uapi.o \
 	gem.o \
 	fb.o \
 	dp.o \
diff --git a/drivers/gpu/drm/tegra/drm.c b/drivers/gpu/drm/tegra/drm.c
index 00ac687c81b5..05ceddfef643 100644
--- a/drivers/gpu/drm/tegra/drm.c
+++ b/drivers/gpu/drm/tegra/drm.c
@@ -21,6 +21,7 @@
 #include <drm/drm_prime.h>
 #include <drm/drm_vblank.h>
 
+#include "uapi.h"
 #include "drm.h"
 #include "gem.h"
 
@@ -34,11 +35,6 @@
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
@@ -94,7 +90,8 @@ static int tegra_drm_open(struct drm_device *drm, struct drm_file *filp)
 	if (!fpriv)
 		return -ENOMEM;
 
-	idr_init_base(&fpriv->contexts, 1);
+	idr_init_base(&fpriv->legacy_contexts, 1);
+	xa_init_flags(&fpriv->contexts, XA_FLAGS_ALLOC1);
 	mutex_init(&fpriv->lock);
 	filp->driver_priv = fpriv;
 
@@ -419,7 +416,7 @@ static int tegra_client_open(struct tegra_drm_file *fpriv,
 	if (err < 0)
 		return err;
 
-	err = idr_alloc(&fpriv->contexts, context, 1, 0, GFP_KERNEL);
+	err = idr_alloc(&fpriv->legacy_contexts, context, 1, 0, GFP_KERNEL);
 	if (err < 0) {
 		client->ops->close_channel(context);
 		return err;
@@ -474,13 +471,13 @@ static int tegra_close_channel(struct drm_device *drm, void *data,
 
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
@@ -499,7 +496,7 @@ static int tegra_get_syncpt(struct drm_device *drm, void *data,
 
 	mutex_lock(&fpriv->lock);
 
-	context = idr_find(&fpriv->contexts, args->context);
+	context = idr_find(&fpriv->legacy_contexts, args->context);
 	if (!context) {
 		err = -ENODEV;
 		goto unlock;
@@ -528,7 +525,7 @@ static int tegra_submit(struct drm_device *drm, void *data,
 
 	mutex_lock(&fpriv->lock);
 
-	context = idr_find(&fpriv->contexts, args->context);
+	context = idr_find(&fpriv->legacy_contexts, args->context);
 	if (!context) {
 		err = -ENODEV;
 		goto unlock;
@@ -553,7 +550,7 @@ static int tegra_get_syncpt_base(struct drm_device *drm, void *data,
 
 	mutex_lock(&fpriv->lock);
 
-	context = idr_find(&fpriv->contexts, args->context);
+	context = idr_find(&fpriv->legacy_contexts, args->context);
 	if (!context) {
 		err = -ENODEV;
 		goto unlock;
@@ -722,10 +719,17 @@ static int tegra_gem_get_flags(struct drm_device *drm, void *data,
 
 static const struct drm_ioctl_desc tegra_drm_ioctls[] = {
 #ifdef CONFIG_DRM_TEGRA_STAGING
-	DRM_IOCTL_DEF_DRV(TEGRA_GEM_CREATE, tegra_gem_create,
+	DRM_IOCTL_DEF_DRV(TEGRA_CHANNEL_OPEN, tegra_drm_ioctl_channel_open,
+			  DRM_RENDER_ALLOW),
+	DRM_IOCTL_DEF_DRV(TEGRA_CHANNEL_CLOSE, tegra_drm_ioctl_channel_close,
 			  DRM_RENDER_ALLOW),
-	DRM_IOCTL_DEF_DRV(TEGRA_GEM_MMAP, tegra_gem_mmap,
+	DRM_IOCTL_DEF_DRV(TEGRA_CHANNEL_MAP, tegra_drm_ioctl_channel_map,
 			  DRM_RENDER_ALLOW),
+	DRM_IOCTL_DEF_DRV(TEGRA_CHANNEL_UNMAP, tegra_drm_ioctl_channel_unmap,
+			  DRM_RENDER_ALLOW),
+
+	DRM_IOCTL_DEF_DRV(TEGRA_GEM_CREATE, tegra_gem_create, DRM_RENDER_ALLOW),
+	DRM_IOCTL_DEF_DRV(TEGRA_GEM_MMAP, tegra_gem_mmap, DRM_RENDER_ALLOW),
 	DRM_IOCTL_DEF_DRV(TEGRA_SYNCPT_READ, tegra_syncpt_read,
 			  DRM_RENDER_ALLOW),
 	DRM_IOCTL_DEF_DRV(TEGRA_SYNCPT_INCR, tegra_syncpt_incr,
@@ -779,10 +783,11 @@ static void tegra_drm_postclose(struct drm_device *drm, struct drm_file *file)
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
index 536861017d24..8b28327c931c 100644
--- a/drivers/gpu/drm/tegra/drm.h
+++ b/drivers/gpu/drm/tegra/drm.h
@@ -64,12 +64,22 @@ struct tegra_drm {
 	struct tegra_display_hub *hub;
 };
 
+static inline struct host1x *tegra_drm_to_host1x(struct tegra_drm *tegra)
+{
+	return dev_get_drvdata(tegra->drm->dev->parent);
+}
+
 struct tegra_drm_client;
 
 struct tegra_drm_context {
 	struct tegra_drm_client *client;
 	struct host1x_channel *channel;
+
+	/* Only used by legacy UAPI. */
 	unsigned int id;
+
+	/* Only used by new UAPI. */
+	struct xarray mappings;
 };
 
 struct tegra_drm_client_ops {
diff --git a/drivers/gpu/drm/tegra/uapi.c b/drivers/gpu/drm/tegra/uapi.c
new file mode 100644
index 000000000000..1e5b29f8ae71
--- /dev/null
+++ b/drivers/gpu/drm/tegra/uapi.c
@@ -0,0 +1,263 @@
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
+#include "drm.h"
+#include "uapi.h"
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
+static void tegra_drm_channel_ctx_close(struct tegra_drm_context *ctx)
+{
+	struct tegra_drm_mapping *mapping;
+	unsigned long id;
+
+	xa_for_each(&ctx->mappings, id, mapping)
+		tegra_drm_mapping_put(mapping);
+
+	xa_destroy(&ctx->mappings);
+
+	host1x_channel_put(ctx->channel);
+
+	kfree(ctx);
+}
+
+void tegra_drm_uapi_close_file(struct tegra_drm_file *file)
+{
+	unsigned long ctx_id;
+	struct tegra_drm_context *ctx;
+
+	xa_for_each(&file->contexts, ctx_id, ctx)
+		tegra_drm_channel_ctx_close(ctx);
+
+	xa_destroy(&file->contexts);
+}
+
+static struct tegra_drm_client *tegra_drm_find_client(struct tegra_drm *tegra,
+						      u32 class)
+{
+	struct tegra_drm_client *client;
+
+	list_for_each_entry(client, &tegra->clients, list)
+		if (client->base.class == class)
+			return client;
+
+	return NULL;
+}
+
+int tegra_drm_ioctl_channel_open(struct drm_device *drm, void *data,
+				 struct drm_file *file)
+{
+	struct tegra_drm_file *fpriv = file->driver_priv;
+	struct tegra_drm *tegra = drm->dev_private;
+	struct drm_tegra_channel_open *args = data;
+	struct tegra_drm_client *client = NULL;
+	struct tegra_drm_context *ctx;
+	int err;
+
+	if (args->flags)
+		return -EINVAL;
+
+	ctx = kzalloc(sizeof(*ctx), GFP_KERNEL);
+	if (!ctx)
+		return -ENOMEM;
+
+	client = tegra_drm_find_client(tegra, args->host1x_class);
+	if (!client) {
+		err = -ENODEV;
+		goto free_ctx;
+	}
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
+	args->hardware_flags = 0;
+	if (device_get_dma_attr(client->base.dev) == DEV_DMA_COHERENT)
+		args->hardware_flags |= DRM_TEGRA_CHANNEL_OPEN_HW_CACHE_COHERENT;
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
+	struct tegra_drm_context *ctx;
+
+	mutex_lock(&fpriv->lock);
+	ctx = xa_load(&fpriv->contexts, args->channel_ctx);
+	if (!ctx) {
+		mutex_unlock(&fpriv->lock);
+		return -EINVAL;
+	}
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
+	struct tegra_drm_mapping *mapping;
+	struct tegra_drm_context *ctx;
+	int err = 0;
+
+	if (args->flags & ~DRM_TEGRA_CHANNEL_MAP_READWRITE)
+		return -EINVAL;
+
+	mutex_lock(&fpriv->lock);
+	ctx = xa_load(&fpriv->contexts, args->channel_ctx);
+	if (!ctx) {
+		mutex_unlock(&fpriv->lock);
+		return -EINVAL;
+	}
+
+	mapping = kzalloc(sizeof(*mapping), GFP_KERNEL);
+	if (!mapping) {
+		err = -ENOMEM;
+		goto unlock;
+	}
+
+	kref_init(&mapping->ref);
+
+	mapping->dev = ctx->client->base.dev;
+	mapping->bo = tegra_gem_lookup(file, args->handle);
+	if (!mapping->bo) {
+		err = -EINVAL;
+		goto unlock;
+	}
+
+	if (ctx->client->base.group) {
+		/* IOMMU domain managed directly using IOMMU API */
+		host1x_bo_pin(mapping->dev, mapping->bo,
+			      &mapping->iova);
+	} else {
+		/* No IOMMU, or IOMMU managed through DMA API */
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
+		mapping->iova = sg_dma_address(mapping->sgt->sgl);
+	}
+
+	mapping->iova_end = mapping->iova + host1x_to_tegra_bo(mapping->bo)->gem.size;
+
+	err = xa_alloc(&ctx->mappings, &args->mapping_id, mapping,
+		       XA_LIMIT(1, U32_MAX), GFP_KERNEL);
+	if (err < 0)
+		goto unmap;
+
+	mutex_unlock(&fpriv->lock);
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
+	host1x_bo_put(mapping->bo);
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
+	struct tegra_drm_mapping *mapping;
+	struct tegra_drm_context *ctx;
+
+	mutex_lock(&fpriv->lock);
+	ctx = xa_load(&fpriv->contexts, args->channel_ctx);
+	if (!ctx) {
+		mutex_unlock(&fpriv->lock);
+		return -EINVAL;
+	}
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
diff --git a/drivers/gpu/drm/tegra/uapi.h b/drivers/gpu/drm/tegra/uapi.h
new file mode 100644
index 000000000000..fbef39726c29
--- /dev/null
+++ b/drivers/gpu/drm/tegra/uapi.h
@@ -0,0 +1,51 @@
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
+				  struct drm_file *file);
+int tegra_drm_ioctl_channel_submit(struct drm_device *drm, void *data,
+				   struct drm_file *file);
+
+void tegra_drm_uapi_close_file(struct tegra_drm_file *file);
+void tegra_drm_mapping_put(struct tegra_drm_mapping *mapping);
+
+#endif
-- 
2.30.1

