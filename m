Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A964B02FFD
	for <lists+dri-devel@lfdr.de>; Sun, 13 Jul 2025 10:39:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9CEC10E149;
	Sun, 13 Jul 2025 08:39:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com
 [209.85.218.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2D3B10E149
 for <dri-devel@lists.freedesktop.org>; Sun, 13 Jul 2025 08:39:06 +0000 (UTC)
Received: by mail-ej1-f48.google.com with SMTP id
 a640c23a62f3a-ae3c5f666bfso594120066b.3
 for <dri-devel@lists.freedesktop.org>; Sun, 13 Jul 2025 01:39:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752395945; x=1753000745;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lG9JQh/GozvL9//gDbTGOaeRuXWuvbq3OvfmMde7+eU=;
 b=fafpbvweliSZtSFmJKPOZH+k0bBWQqap4pAHbVYHSJlcSdIdITwXEstXSZMv9GUZof
 jh7sZ5dYw7rB3TrxSWOBpdZyuE9gUVgbEOeCVOJ0lo/nPLRivFycIX7OA4HUugCSGI27
 T0i/IhEUZW+tOjCMHDN7Jx0ZrG+QNpeCWs2aY/eWJwVjsu6FcUnh2P6l4h7r+VrE+Db3
 Hw4VvaxGOR9PFojkTyno3H1evvPM6lc3zAO89F7I56wu8ICT696hWeS1SusYRqqX3/fS
 eeUp1YKUSRoygZaKaKsXk1ALhR8X+3TfXWCBeNBitzRsRs5TUtMWJQEBHMIreO1ldixH
 S3TA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUnW4IDY+x16kTxq7g1oCdcd20CwyI+Vd6cizVkaZiDFFsagZMZQ9RvGwfbIElyZtxl7WAUg9Wrwc8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyHjuBUstXhh6dWfhkeiuiyH9rhh5Js3bhaG2wbnNUbR3uyGPCW
 xkdatXPiEVP7VFaPKvmjSeKneIU1WsyBgt+Mh7cpnvJOwXgbGRMinoCu
X-Gm-Gg: ASbGncs18GOfavvcmA0QOVe/6aQS5rhJs89VhGjlIgsegEjy+BiM59x+nKgS+S2estj
 nig1y5wU3SKTxeDc7Sw9cjIakE9ZZqQWRUgovD4yGD2MCR9vOf8E7+04w6mbVKsD2fBW9BEDWNQ
 wZUhP0y8WLpw2+hP1kEi4olzb0BNSMRmcoBtXpdd1Cwtrf+Csm6YbazYo9G7+/EMMOZDD2tU3hQ
 C++/Bq4SyRPbcY0cC6Ih81Fdk83S2IDS78mtHmjZx7dDpuxLa6xhZYVNLooQ5EXKUEukKCvLLrg
 waT0i3V7t0R9OtNgouuRK8DsXz2VM8plUrF5J1MQKo5ohm4GoNXGGKIvIGw3i/k7Qq04xkH4/al
 kyA7djvuoQSuzj0SF9/HTjjCfdtmUBmO5tUshO29/CcTr5KOmcMAh6q3G
X-Google-Smtp-Source: AGHT+IEa2lM3UzIV7ubuY5TutdocDGuU70l1jaNNDF5JCxx65P6yZ73AaDlB42Tq/yqMBFEUiwZErw==
X-Received: by 2002:a17:907:720d:b0:ae3:5110:28a0 with SMTP id
 a640c23a62f3a-ae6fc0bdaf4mr877962066b.44.1752395944907; 
 Sun, 13 Jul 2025 01:39:04 -0700 (PDT)
Received: from [10.42.0.1] (cst-prg-46-162.cust.vodafone.cz. [46.135.46.162])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ae6e7e90a42sm610876266b.27.2025.07.13.01.39.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 13 Jul 2025 01:39:04 -0700 (PDT)
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Date: Sun, 13 Jul 2025 10:38:53 +0200
Subject: [PATCH v8 03/10] accel/rocket: Add IOCTL for BO creation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250713-6-10-rocket-v8-3-64fa3115e910@tomeuvizoso.net>
References: <20250713-6-10-rocket-v8-0-64fa3115e910@tomeuvizoso.net>
In-Reply-To: <20250713-6-10-rocket-v8-0-64fa3115e910@tomeuvizoso.net>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, 
 Kever Yang <kever.yang@rock-chips.com>, Robin Murphy <robin.murphy@arm.com>, 
 Daniel Stone <daniel@fooishbar.org>, Da Xue <da@libre.computer>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Jeff Hugo <jeff.hugo@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org, 
 Tomeu Vizoso <tomeu@tomeuvizoso.net>
X-Mailer: b4 0.14.2
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

This uses the SHMEM DRM helpers and we map right away to the CPU and NPU
sides, as all buffers are expected to be accessed from both.

v2:
- Sync the IOMMUs for the other cores when mapping and unmapping.

v3:
- Make use of GPL-2.0-only for the copyright notice (Jeff Hugo)

v6:
- Use mutexes guard (Markus Elfring)

v7:
- Assign its own IOMMU domain to each client, for isolation (Daniel
  Stone and Robin Murphy)

v8:
- Correctly acquire a reference to the IOMMU (Robin Murphy)
- Allocate DMA address ourselves with drm_mm (Robin Murphy)
- Use refcount_read (Heiko Stuebner)
- Remove superfluous dma_sync_sgtable_for_device (Robin Murphy)

Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
Tested-by: Heiko Stuebner <heiko@sntech.de>
Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>
---
 drivers/accel/rocket/Makefile     |   3 +-
 drivers/accel/rocket/rocket_drv.c |  15 ++++-
 drivers/accel/rocket/rocket_drv.h |   4 ++
 drivers/accel/rocket/rocket_gem.c | 125 ++++++++++++++++++++++++++++++++++++++
 drivers/accel/rocket/rocket_gem.h |  30 +++++++++
 include/uapi/drm/rocket_accel.h   |  44 ++++++++++++++
 6 files changed, 219 insertions(+), 2 deletions(-)

diff --git a/drivers/accel/rocket/Makefile b/drivers/accel/rocket/Makefile
index abdd75f2492eaecf8bf5e78a2ac150ea19ac3e96..4deef267f9e1238c4d8bd108dcc8afd9dc8b2b8f 100644
--- a/drivers/accel/rocket/Makefile
+++ b/drivers/accel/rocket/Makefile
@@ -5,4 +5,5 @@ obj-$(CONFIG_DRM_ACCEL_ROCKET) := rocket.o
 rocket-y := \
 	rocket_core.o \
 	rocket_device.o \
-	rocket_drv.o
+	rocket_drv.o \
+	rocket_gem.o
diff --git a/drivers/accel/rocket/rocket_drv.c b/drivers/accel/rocket/rocket_drv.c
index a5df94f6b1259ae335fbccd0105ba44f3432999c..8b7fbe9226f424b69d409e47b58651cba8c42bcf 100644
--- a/drivers/accel/rocket/rocket_drv.c
+++ b/drivers/accel/rocket/rocket_drv.c
@@ -5,6 +5,7 @@
 #include <drm/drm_drv.h>
 #include <drm/drm_gem.h>
 #include <drm/drm_ioctl.h>
+#include <drm/rocket_accel.h>
 #include <linux/clk.h>
 #include <linux/err.h>
 #include <linux/iommu.h>
@@ -13,6 +14,7 @@
 #include <linux/pm_runtime.h>
 
 #include "rocket_drv.h"
+#include "rocket_gem.h"
 
 /*
  * Facade device, used to expose a single DRM device to userspace, that
@@ -69,6 +71,7 @@ rocket_open(struct drm_device *dev, struct drm_file *file)
 {
 	struct rocket_device *rdev = to_rocket_device(dev);
 	struct rocket_file_priv *rocket_priv;
+	u64 start, end;
 	int ret;
 
 	if (!try_module_get(THIS_MODULE))
@@ -89,6 +92,11 @@ rocket_open(struct drm_device *dev, struct drm_file *file)
 
 	file->driver_priv = rocket_priv;
 
+	start = rocket_priv->domain->domain->geometry.aperture_start;
+	end = rocket_priv->domain->domain->geometry.aperture_end;
+	drm_mm_init(&rocket_priv->mm, start, end - start + 1);
+	mutex_init(&rocket_priv->mm_lock);
+
 	return 0;
 
 err_free:
@@ -103,6 +111,8 @@ rocket_postclose(struct drm_device *dev, struct drm_file *file)
 {
 	struct rocket_file_priv *rocket_priv = file->driver_priv;
 
+	mutex_destroy(&rocket_priv->mm_lock);
+	drm_mm_takedown(&rocket_priv->mm);
 	rocket_iommu_domain_put(rocket_priv->domain);
 	kfree(rocket_priv);
 	module_put(THIS_MODULE);
@@ -111,6 +121,8 @@ rocket_postclose(struct drm_device *dev, struct drm_file *file)
 static const struct drm_ioctl_desc rocket_drm_driver_ioctls[] = {
 #define ROCKET_IOCTL(n, func) \
 	DRM_IOCTL_DEF_DRV(ROCKET_##n, rocket_ioctl_##func, 0)
+
+	ROCKET_IOCTL(CREATE_BO, create_bo),
 };
 
 DEFINE_DRM_ACCEL_FOPS(rocket_accel_driver_fops);
@@ -120,9 +132,10 @@ DEFINE_DRM_ACCEL_FOPS(rocket_accel_driver_fops);
  * - 1.0 - initial interface
  */
 static const struct drm_driver rocket_drm_driver = {
-	.driver_features	= DRIVER_COMPUTE_ACCEL,
+	.driver_features	= DRIVER_COMPUTE_ACCEL | DRIVER_GEM,
 	.open			= rocket_open,
 	.postclose		= rocket_postclose,
+	.gem_create_object	= rocket_gem_create_object,
 	.ioctls			= rocket_drm_driver_ioctls,
 	.num_ioctls		= ARRAY_SIZE(rocket_drm_driver_ioctls),
 	.fops			= &rocket_accel_driver_fops,
diff --git a/drivers/accel/rocket/rocket_drv.h b/drivers/accel/rocket/rocket_drv.h
index 36b1291b0ead388b8843965758c57a0405315519..2944e0136ab991da61fb8f66f7e9c1ba214878a6 100644
--- a/drivers/accel/rocket/rocket_drv.h
+++ b/drivers/accel/rocket/rocket_drv.h
@@ -4,6 +4,8 @@
 #ifndef __ROCKET_DRV_H__
 #define __ROCKET_DRV_H__
 
+#include <drm/drm_mm.h>
+
 #include "rocket_device.h"
 
 struct rocket_iommu_domain {
@@ -15,6 +17,8 @@ struct rocket_file_priv {
 	struct rocket_device *rdev;
 
 	struct rocket_iommu_domain *domain;
+	struct drm_mm mm;
+	struct mutex mm_lock;
 };
 
 struct rocket_iommu_domain *rocket_iommu_domain_get(struct rocket_file_priv *rocket_priv);
diff --git a/drivers/accel/rocket/rocket_gem.c b/drivers/accel/rocket/rocket_gem.c
new file mode 100644
index 0000000000000000000000000000000000000000..05cf46040865c01fe14a169c865227780f2db679
--- /dev/null
+++ b/drivers/accel/rocket/rocket_gem.c
@@ -0,0 +1,125 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/* Copyright 2024-2025 Tomeu Vizoso <tomeu@tomeuvizoso.net> */
+
+#include <drm/drm_device.h>
+#include <drm/drm_utils.h>
+#include <drm/rocket_accel.h>
+#include <linux/dma-mapping.h>
+#include <linux/iommu.h>
+
+#include "rocket_drv.h"
+#include "rocket_gem.h"
+
+static void rocket_gem_bo_free(struct drm_gem_object *obj)
+{
+	struct rocket_gem_object *bo = to_rocket_bo(obj);
+	struct rocket_file_priv *rocket_priv = bo->driver_priv;
+	size_t unmapped;
+
+	drm_WARN_ON(obj->dev, refcount_read(&bo->base.pages_use_count) > 1);
+
+	unmapped = iommu_unmap(bo->domain->domain, bo->mm.start, bo->size);
+	drm_WARN_ON(obj->dev, unmapped != bo->size);
+
+	mutex_lock(&rocket_priv->mm_lock);
+	drm_mm_remove_node(&bo->mm);
+	mutex_unlock(&rocket_priv->mm_lock);
+
+	rocket_iommu_domain_put(bo->domain);
+	bo->domain = NULL;
+
+	drm_gem_shmem_free(&bo->base);
+}
+
+static const struct drm_gem_object_funcs rocket_gem_funcs = {
+	.free = rocket_gem_bo_free,
+	.print_info = drm_gem_shmem_object_print_info,
+	.pin = drm_gem_shmem_object_pin,
+	.unpin = drm_gem_shmem_object_unpin,
+	.get_sg_table = drm_gem_shmem_object_get_sg_table,
+	.vmap = drm_gem_shmem_object_vmap,
+	.vunmap = drm_gem_shmem_object_vunmap,
+	.mmap = drm_gem_shmem_object_mmap,
+	.vm_ops = &drm_gem_shmem_vm_ops,
+};
+
+struct drm_gem_object *rocket_gem_create_object(struct drm_device *dev, size_t size)
+{
+	struct rocket_gem_object *obj;
+
+	obj = kzalloc(sizeof(*obj), GFP_KERNEL);
+	if (!obj)
+		return ERR_PTR(-ENOMEM);
+
+	obj->base.base.funcs = &rocket_gem_funcs;
+
+	return &obj->base.base;
+}
+
+int rocket_ioctl_create_bo(struct drm_device *dev, void *data, struct drm_file *file)
+{
+	struct rocket_file_priv *rocket_priv = file->driver_priv;
+	struct drm_rocket_create_bo *args = data;
+	struct drm_gem_shmem_object *shmem_obj;
+	struct rocket_gem_object *rkt_obj;
+	struct drm_gem_object *gem_obj;
+	struct sg_table *sgt;
+	int ret;
+
+	shmem_obj = drm_gem_shmem_create(dev, args->size);
+	if (IS_ERR(shmem_obj))
+		return PTR_ERR(shmem_obj);
+
+	gem_obj = &shmem_obj->base;
+	rkt_obj = to_rocket_bo(gem_obj);
+
+	rkt_obj->driver_priv = rocket_priv;
+	rkt_obj->domain = rocket_iommu_domain_get(rocket_priv);
+	rkt_obj->size = args->size;
+	rkt_obj->offset = 0;
+
+	ret = drm_gem_handle_create(file, gem_obj, &args->handle);
+	drm_gem_object_put(gem_obj);
+	if (ret)
+		goto err;
+
+	sgt = drm_gem_shmem_get_pages_sgt(shmem_obj);
+	if (IS_ERR(sgt)) {
+		ret = PTR_ERR(sgt);
+		goto err;
+	}
+
+	mutex_lock(&rocket_priv->mm_lock);
+	ret = drm_mm_insert_node_generic(&rocket_priv->mm, &rkt_obj->mm,
+					 rkt_obj->size, PAGE_SIZE,
+					 0, 0);
+	mutex_unlock(&rocket_priv->mm_lock);
+
+	ret = iommu_map_sgtable(rocket_priv->domain->domain,
+				rkt_obj->mm.start,
+				shmem_obj->sgt,
+				IOMMU_READ | IOMMU_WRITE);
+	if (ret < 0 || ret < args->size) {
+		drm_err(dev, "failed to map buffer: size=%d request_size=%u\n",
+			ret, args->size);
+		ret = -ENOMEM;
+		goto err_remove_node;
+	}
+
+	/* iommu_map_sgtable might have aligned the size */
+	rkt_obj->size = ret;
+	args->offset = drm_vma_node_offset_addr(&gem_obj->vma_node);
+	args->dma_address = rkt_obj->mm.start;
+
+	return 0;
+
+err_remove_node:
+	mutex_lock(&rocket_priv->mm_lock);
+	drm_mm_remove_node(&rkt_obj->mm);
+	mutex_unlock(&rocket_priv->mm_lock);
+
+err:
+	drm_gem_shmem_object_free(gem_obj);
+
+	return ret;
+}
diff --git a/drivers/accel/rocket/rocket_gem.h b/drivers/accel/rocket/rocket_gem.h
new file mode 100644
index 0000000000000000000000000000000000000000..91a1fc09c56ce483ebe80959e1a7ff934867bedc
--- /dev/null
+++ b/drivers/accel/rocket/rocket_gem.h
@@ -0,0 +1,30 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/* Copyright 2024-2025 Tomeu Vizoso <tomeu@tomeuvizoso.net> */
+
+#ifndef __ROCKET_GEM_H__
+#define __ROCKET_GEM_H__
+
+#include <drm/drm_gem_shmem_helper.h>
+
+struct rocket_gem_object {
+	struct drm_gem_shmem_object base;
+
+	struct rocket_file_priv *driver_priv;
+
+	struct rocket_iommu_domain *domain;
+	struct drm_mm_node mm;
+	size_t size;
+	u32 offset;
+};
+
+struct drm_gem_object *rocket_gem_create_object(struct drm_device *dev, size_t size);
+
+int rocket_ioctl_create_bo(struct drm_device *dev, void *data, struct drm_file *file);
+
+static inline
+struct  rocket_gem_object *to_rocket_bo(struct drm_gem_object *obj)
+{
+	return container_of(to_drm_gem_shmem_obj(obj), struct rocket_gem_object, base);
+}
+
+#endif
diff --git a/include/uapi/drm/rocket_accel.h b/include/uapi/drm/rocket_accel.h
new file mode 100644
index 0000000000000000000000000000000000000000..95720702b7c4413d72b89c1f0f59abb22dc8c6b3
--- /dev/null
+++ b/include/uapi/drm/rocket_accel.h
@@ -0,0 +1,44 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2024 Tomeu Vizoso
+ */
+#ifndef __DRM_UAPI_ROCKET_ACCEL_H__
+#define __DRM_UAPI_ROCKET_ACCEL_H__
+
+#include "drm.h"
+
+#if defined(__cplusplus)
+extern "C" {
+#endif
+
+#define DRM_ROCKET_CREATE_BO			0x00
+
+#define DRM_IOCTL_ROCKET_CREATE_BO		DRM_IOWR(DRM_COMMAND_BASE + DRM_ROCKET_CREATE_BO, struct drm_rocket_create_bo)
+
+/**
+ * struct drm_rocket_create_bo - ioctl argument for creating Rocket BOs.
+ *
+ */
+struct drm_rocket_create_bo {
+	/** Input: Size of the requested BO. */
+	__u32 size;
+
+	/** Output: GEM handle for the BO. */
+	__u32 handle;
+
+	/**
+	 * Output: DMA address for the BO in the NPU address space.  This address
+	 * is private to the DRM fd and is valid for the lifetime of the GEM
+	 * handle.
+	 */
+	__u64 dma_address;
+
+	/** Output: Offset into the drm node to use for subsequent mmap call. */
+	__u64 offset;
+};
+
+#if defined(__cplusplus)
+}
+#endif
+
+#endif /* __DRM_UAPI_ROCKET_ACCEL_H__ */

-- 
2.50.0

