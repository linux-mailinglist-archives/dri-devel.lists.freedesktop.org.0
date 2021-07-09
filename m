Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AD393C29AA
	for <lists+dri-devel@lfdr.de>; Fri,  9 Jul 2021 21:29:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F8EB6EA6D;
	Fri,  9 Jul 2021 19:29:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00A5F6EA6D
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Jul 2021 19:29:36 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 j16-20020a05600c1c10b0290204b096b0caso6950210wms.1
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Jul 2021 12:29:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oia4tcEzeIofOiob91SyDfZH5klf9jnj07ifF12omHU=;
 b=EAW3cdmmaJigYehNSd92YwenxPmUjVVc0NEJ8WAV12VMBPAVlpqJpo6MV7ZJVMqPQ4
 k3cMaAlU90j/RnhbQ5JZnPqixErnsALeQrtf/HDR00CABRZzHZSVx5Zo1cYA7/OJhd3p
 M2Na3Y43pPouwTI4GOPd7FPrFN7zrlLJBe/eLDnMIWutK8+Hx84cXyY+i5IUGBBYMlwy
 VgubVk5HmwtE09mOU4zchYxsiK4o1cLL8IxrPy6rOWyZ4i9bZUaxrCxqWuCqVzU1BzsC
 4+1CyqkcBvkeGCnkihLTmhGi28G5QgzZxzFnJ+nPTmv1IJm9eFbztSqWKwsFWq4ugmx1
 n0/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oia4tcEzeIofOiob91SyDfZH5klf9jnj07ifF12omHU=;
 b=h2tfrbWKbVDaCzK+/ne0BvE2+NSOMCEoCpUNFqsm5m8DcTHcAdUgTR00DU1s9KO8J6
 Gf1fs7QNs/5Nred7b6Gup3LP6BJWBTpu/d0gpz6tkzX4yaSL6y1BeC1SrUOsgJGYfte5
 MTztBT7jSjs2jKW9j2HJ3U4eaci+ceRg1+DGvKqq87N2+A0J6VHvjnKxhr6/FZBo/4Xw
 hxQaj3XLnM7Jg5dE0rBYhQex4HkAwwj4rk1iYYZ7PEl7ukJgT2nKKkIdI+rGEwfQa+g6
 ALDRqWieCnKIsX2PQqimnaW4ngz/oE62EOmxVC+Mu9DnzvERAzGhlVkACFSJvqlN5Oro
 1RAw==
X-Gm-Message-State: AOAM530GZcnz/ucjtvmSfa57ynsfc20Dy3JA8xFyhsXkBN122wStfrA3
 GUUwfadimOcvzCDABcBsjJY7G9oRcX8=
X-Google-Smtp-Source: ABdhPJyK7hm/SDPsm39+6JZIwtvobK2HqAZBV7EmYOaslcQFUvbaqCXtRilI1T6peOEXhcMIitKKxw==
X-Received: by 2002:a1c:b403:: with SMTP id d3mr41258282wmf.79.1625858975541; 
 Fri, 09 Jul 2021 12:29:35 -0700 (PDT)
Received: from localhost ([62.96.65.119])
 by smtp.gmail.com with ESMTPSA id p5sm6346396wrd.25.2021.07.09.12.29.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Jul 2021 12:29:34 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH v8 09/14] drm/tegra: Implement new UAPI
Date: Fri,  9 Jul 2021 21:31:41 +0200
Message-Id: <20210709193146.2859516-10-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210709193146.2859516-1-thierry.reding@gmail.com>
References: <20210709193146.2859516-1-thierry.reding@gmail.com>
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
Cc: linux-tegra@vger.kernel.org, Dmitry Osipenko <digetx@gmail.com>,
 dri-devel@lists.freedesktop.org, Mikko Perttunen <mperttunen@nvidia.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Mikko Perttunen <mperttunen@nvidia.com>

Implement the non-submission parts of the new UAPI, including
channel management and memory mapping. The UAPI is under the
CONFIG_DRM_TEGRA_STAGING config flag for now.

Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
Signed-off-by: Thierry Reding <treding@nvidia.com>
---
Changes in v8:
- rebase on top of latest UABI changes

 drivers/gpu/drm/tegra/Makefile |   1 +
 drivers/gpu/drm/tegra/drm.c    |  37 ++--
 drivers/gpu/drm/tegra/drm.h    |  10 ++
 drivers/gpu/drm/tegra/uapi.c   | 313 +++++++++++++++++++++++++++++++++
 drivers/gpu/drm/tegra/uapi.h   |  51 ++++++
 5 files changed, 396 insertions(+), 16 deletions(-)
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
index cddee6425461..6ee08e49ec57 100644
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
index 000000000000..48e872c768a9
--- /dev/null
+++ b/drivers/gpu/drm/tegra/uapi.c
@@ -0,0 +1,313 @@
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
+static void tegra_drm_channel_context_close(struct tegra_drm_context *context)
+{
+	struct tegra_drm_mapping *mapping;
+	unsigned long id;
+
+	xa_for_each(&context->mappings, id, mapping)
+		tegra_drm_mapping_put(mapping);
+
+	xa_destroy(&context->mappings);
+
+	host1x_channel_put(context->channel);
+
+	kfree(context);
+}
+
+void tegra_drm_uapi_close_file(struct tegra_drm_file *file)
+{
+	struct tegra_drm_context *context;
+	unsigned long id;
+
+	xa_for_each(&file->contexts, id, context)
+		tegra_drm_channel_context_close(context);
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
+	struct tegra_drm_context *context;
+	int err;
+
+	if (args->flags)
+		return -EINVAL;
+
+	context = kzalloc(sizeof(*context), GFP_KERNEL);
+	if (!context)
+		return -ENOMEM;
+
+	client = tegra_drm_find_client(tegra, args->host1x_class);
+	if (!client) {
+		err = -ENODEV;
+		goto free;
+	}
+
+	if (client->shared_channel) {
+		context->channel = host1x_channel_get(client->shared_channel);
+	} else {
+		context->channel = host1x_channel_request(&client->base);
+		if (!context->channel) {
+			err = -EBUSY;
+			goto free;
+		}
+	}
+
+	err = xa_alloc(&fpriv->contexts, &args->context, context,
+		       XA_LIMIT(1, U32_MAX), GFP_KERNEL);
+	if (err < 0)
+		goto put_channel;
+
+	context->client = client;
+	xa_init_flags(&context->mappings, XA_FLAGS_ALLOC1);
+
+	args->version = client->version;
+	args->capabilities = 0;
+
+	if (device_get_dma_attr(client->base.dev) == DEV_DMA_COHERENT)
+		args->capabilities |= DRM_TEGRA_CHANNEL_CAP_CACHE_COHERENT;
+
+	return 0;
+
+put_channel:
+	host1x_channel_put(context->channel);
+free:
+	kfree(context);
+
+	return err;
+}
+
+int tegra_drm_ioctl_channel_close(struct drm_device *drm, void *data,
+				  struct drm_file *file)
+{
+	struct tegra_drm_file *fpriv = file->driver_priv;
+	struct drm_tegra_channel_close *args = data;
+	struct tegra_drm_context *context;
+
+	mutex_lock(&fpriv->lock);
+
+	context = xa_load(&fpriv->contexts, args->context);
+	if (!context) {
+		mutex_unlock(&fpriv->lock);
+		return -EINVAL;
+	}
+
+	xa_erase(&fpriv->contexts, args->context);
+
+	mutex_unlock(&fpriv->lock);
+
+	tegra_drm_channel_context_close(context);
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
+	struct tegra_drm_context *context;
+	int err = 0;
+
+	if (args->flags & ~DRM_TEGRA_CHANNEL_MAP_READ_WRITE)
+		return -EINVAL;
+
+	mutex_lock(&fpriv->lock);
+
+	context = xa_load(&fpriv->contexts, args->context);
+	if (!context) {
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
+	mapping->dev = context->client->base.dev;
+	mapping->bo = tegra_gem_lookup(file, args->handle);
+	if (!mapping->bo) {
+		err = -EINVAL;
+		goto unlock;
+	}
+
+	if (context->client->base.group) {
+		/* IOMMU domain managed directly using IOMMU API */
+		host1x_bo_pin(mapping->dev, mapping->bo, &mapping->iova);
+	} else {
+		switch (args->flags & DRM_TEGRA_CHANNEL_MAP_READ_WRITE) {
+		case DRM_TEGRA_CHANNEL_MAP_READ_WRITE:
+			mapping->direction = DMA_BIDIRECTIONAL;
+			break;
+
+		case DRM_TEGRA_CHANNEL_MAP_WRITE:
+			mapping->direction = DMA_FROM_DEVICE;
+			break;
+
+		case DRM_TEGRA_CHANNEL_MAP_READ:
+			mapping->direction = DMA_TO_DEVICE;
+			break;
+
+		default:
+			return -EINVAL;
+		}
+
+		mapping->sgt = host1x_bo_pin(mapping->dev, mapping->bo, NULL);
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
+	mapping->iova_end = mapping->iova + host1x_to_tegra_bo(mapping->bo)->size;
+
+	err = xa_alloc(&context->mappings, &args->mapping, mapping,
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
+	struct tegra_drm_context *context;
+
+	mutex_lock(&fpriv->lock);
+
+	context = xa_load(&fpriv->contexts, args->context);
+	if (!context) {
+		mutex_unlock(&fpriv->lock);
+		return -EINVAL;
+	}
+
+	mapping = xa_erase(&context->mappings, args->mapping);
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
2.32.0

