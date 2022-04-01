Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4152D4EFBEA
	for <lists+dri-devel@lfdr.de>; Fri,  1 Apr 2022 22:56:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78BCB10E0F9;
	Fri,  1 Apr 2022 20:56:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from letterbox.kde.org (letterbox.kde.org [46.43.1.242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 001FE10E0F9
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Apr 2022 20:56:08 +0000 (UTC)
Received: from vertex.vmware.com (pool-108-36-85-85.phlapa.fios.verizon.net
 [108.36.85.85]) (Authenticated sender: zack)
 by letterbox.kde.org (Postfix) with ESMTPSA id E752C28A54C;
 Fri,  1 Apr 2022 21:56:06 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kde.org; s=users;
 t=1648846567; bh=tfeVlceSRZBZu03W2YFP4TmoUfd1ziVx1HM9W7D9bHM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=cgAs+C1mVGkooOkdPLOeCVduvfX68TJLmbTTvIvA/rfuK5xuwYZ1xybxQB24j5RjT
 ZKL9s19oZgkLX991pv0hF4vnl34bNnFpgBZHAyonHb6nvnautFGjP7Iqe7ok7ilqyG
 04S6qptv6LQxri3ALIpnPAFcGBkg7Mq8uzq8L8oFqbi557fX76WGdCQaHEw8OiqBBi
 9yUjhHwB1kf9XkmXbmwdBu2tU0IgAMku6UazPm9IDdUcarHXOH9K5CbrQ2qXLosrwa
 EUCydbXQ5UBYYZotyOF33NF1BeEhZTh51sF1osTiW6Jm9xRLHGZoS2gn8KYA1nIRxh
 bOMZdXoyRNTIA==
From: Zack Rusin <zack@kde.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 3/3] drm/vmwgfx: Fix gem refcounting on prime exported surfaces
Date: Fri,  1 Apr 2022 16:56:02 -0400
Message-Id: <20220401205602.1172975-3-zack@kde.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220401205602.1172975-1-zack@kde.org>
References: <20220401205602.1172975-1-zack@kde.org>
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
Reply-To: Zack Rusin <zackr@vmware.com>
Cc: krastevm@vmware.com, stable@vger.kernel.org, mombasawalam@vmware.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Zack Rusin <zackr@vmware.com>

vmwgfx exports two different kinds of gpu buffers to the userspace:
surfaces and mob's. Surfaces are backed by mob's. Currently only
surfaces are allowed with prime. Surfaces exported as prime weren't
increasing the reference count on the backing mob's (gem objects), which
meant that if the userspace destroyed the mob's, the exported surface
was becoming invalid and its usage lead to crashes (due to usage after
free).

Surfaces need to increase the reference count on the backing mob's for
the duration of the exported file descriptor for purposes of prime. Same
has to happen when an already existing mob is passed to the surface, its
reference count has to be increased.

This fixes crashes with XA state tracker which is used for xrender
acceleration on xf86-video-vmware.

Signed-off-by: Zack Rusin <zackr@vmware.com>
Cc: <stable@vger.kernel.org> # v5.17+
Reviewed-by: Martin Krastev <krastevm@vmware.com>
Reviewed-by: Maaz Mombasawala <mombasawalam@vmware.com>
---
 drivers/gpu/drm/vmwgfx/ttm_object.c      |  7 ++++++-
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.h      |  2 ++
 drivers/gpu/drm/vmwgfx/vmwgfx_gem.c      |  6 ++----
 drivers/gpu/drm/vmwgfx/vmwgfx_prime.c    | 14 ++++++++++++--
 drivers/gpu/drm/vmwgfx/vmwgfx_resource.c | 12 ++++++++++++
 drivers/gpu/drm/vmwgfx/vmwgfx_surface.c  |  1 +
 6 files changed, 35 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/ttm_object.c b/drivers/gpu/drm/vmwgfx/ttm_object.c
index 26a55fef1ab5..53e9f81f7e1b 100644
--- a/drivers/gpu/drm/vmwgfx/ttm_object.c
+++ b/drivers/gpu/drm/vmwgfx/ttm_object.c
@@ -1,7 +1,7 @@
 /* SPDX-License-Identifier: GPL-2.0 OR MIT */
 /**************************************************************************
  *
- * Copyright (c) 2009-2013 VMware, Inc., Palo Alto, CA., USA
+ * Copyright (c) 2009-2022 VMware, Inc., Palo Alto, CA., USA
  * All Rights Reserved.
  *
  * Permission is hereby granted, free of charge, to any person obtaining a
@@ -51,6 +51,7 @@
 #include <linux/module.h>
 #include "ttm_object.h"
 #include "vmwgfx_drv.h"
+#include "vmwgfx_resource_priv.h"
 
 MODULE_IMPORT_NS(DMA_BUF);
 
@@ -617,6 +618,7 @@ int ttm_prime_handle_to_fd(struct ttm_object_file *tfile,
 	struct ttm_base_object *base;
 	struct dma_buf *dma_buf;
 	struct ttm_prime_object *prime;
+	struct vmw_resource *res;
 	int ret;
 
 	base = ttm_base_object_lookup(tfile, handle);
@@ -667,6 +669,9 @@ int ttm_prime_handle_to_fd(struct ttm_object_file *tfile,
 
 	ret = dma_buf_fd(dma_buf, flags);
 	if (ret >= 0) {
+		res = user_surface_converter->base_obj_to_res(&prime->base);
+		if (res)
+			vmw_resource_prime_ref(res);
 		*prime_fd = ret;
 		ret = 0;
 	} else
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
index eabe3e8e9cf9..bb11f0d0b9b1 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
@@ -853,6 +853,8 @@ void vmw_resource_dirty_update(struct vmw_resource *res, pgoff_t start,
 			       pgoff_t end);
 int vmw_resources_clean(struct vmw_buffer_object *vbo, pgoff_t start,
 			pgoff_t end, pgoff_t *num_prefault);
+void vmw_resource_prime_ref(struct vmw_resource *res);
+void vmw_resource_prime_unref(struct vmw_resource *res);
 
 /**
  * vmw_resource_mob_attached - Whether a resource currently has a mob attached
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_gem.c b/drivers/gpu/drm/vmwgfx/vmwgfx_gem.c
index ce609e7d758f..f41dc638df23 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_gem.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_gem.c
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0 OR MIT */
 /*
- * Copyright 2021 VMware, Inc.
+ * Copyright 2021-2022 VMware, Inc.
  *
  * Permission is hereby granted, free of charge, to any person
  * obtaining a copy of this software and associated documentation
@@ -46,9 +46,8 @@ vmw_buffer_object(struct ttm_buffer_object *bo)
 static void vmw_gem_object_free(struct drm_gem_object *gobj)
 {
 	struct ttm_buffer_object *bo = drm_gem_ttm_of_gem(gobj);
-	if (bo) {
+	if (bo)
 		ttm_bo_put(bo);
-	}
 }
 
 static int vmw_gem_object_open(struct drm_gem_object *obj,
@@ -158,7 +157,6 @@ int vmw_gem_object_create_with_handle(struct vmw_private *dev_priv,
 	return ret;
 }
 
-
 int vmw_gem_object_create_ioctl(struct drm_device *dev, void *data,
 				struct drm_file *filp)
 {
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_prime.c b/drivers/gpu/drm/vmwgfx/vmwgfx_prime.c
index 2d72a5ee7c0c..2896d212db54 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_prime.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_prime.c
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0 OR MIT
 /**************************************************************************
  *
- * Copyright 2013 VMware, Inc., Palo Alto, CA., USA
+ * Copyright 2013-2022 VMware, Inc., Palo Alto, CA., USA
  *
  * Permission is hereby granted, free of charge, to any person obtaining a
  * copy of this software and associated documentation files (the
@@ -31,6 +31,7 @@
  */
 
 #include "vmwgfx_drv.h"
+#include "vmwgfx_resource_priv.h"
 #include "ttm_object.h"
 #include <linux/dma-buf.h>
 
@@ -62,12 +63,21 @@ static void vmw_prime_unmap_dma_buf(struct dma_buf_attachment *attach,
 {
 }
 
+static void vmw_prime_release(struct dma_buf *dma_buf)
+{
+	struct ttm_prime_object *prime = dma_buf->priv;
+	struct vmw_resource *res =
+			user_surface_converter->base_obj_to_res(&prime->base);
+	if (res)
+		vmw_resource_prime_unref(res);
+}
+
 const struct dma_buf_ops vmw_prime_dmabuf_ops =  {
 	.attach = vmw_prime_map_attach,
 	.detach = vmw_prime_map_detach,
 	.map_dma_buf = vmw_prime_map_dma_buf,
 	.unmap_dma_buf = vmw_prime_unmap_dma_buf,
-	.release = NULL,
+	.release = vmw_prime_release,
 };
 
 int vmw_prime_fd_to_handle(struct drm_device *dev,
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_resource.c b/drivers/gpu/drm/vmwgfx/vmwgfx_resource.c
index 6542f1498651..11de5d697351 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_resource.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_resource.c
@@ -1169,3 +1169,15 @@ int vmw_resources_clean(struct vmw_buffer_object *vbo, pgoff_t start,
 
 	return 0;
 }
+
+void vmw_resource_prime_ref(struct vmw_resource *res)
+{
+	if (res->backup)
+		drm_gem_object_get(&res->backup->base.base);
+}
+
+void vmw_resource_prime_unref(struct vmw_resource *res)
+{
+	if (res->backup)
+		drm_gem_object_put(&res->backup->base.base);
+}
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_surface.c b/drivers/gpu/drm/vmwgfx/vmwgfx_surface.c
index 00e8e27e4884..04fdf613df83 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_surface.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_surface.c
@@ -1502,6 +1502,7 @@ vmw_gb_surface_define_internal(struct drm_device *dev,
 				goto out_unlock;
 			} else {
 				backup_handle = req->base.buffer_handle;
+				drm_gem_object_get(&res->backup->base.base);
 			}
 		}
 	} else if (req->base.drm_surface_flags &
-- 
2.32.0

