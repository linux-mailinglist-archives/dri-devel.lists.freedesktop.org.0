Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 282A7A43699
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2025 08:56:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9726710E5A0;
	Tue, 25 Feb 2025 07:56:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAF6C10E5A0
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2025 07:56:13 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-43994ef3872so31750075e9.2
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Feb 2025 23:56:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740470172; x=1741074972;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nam30mXYH7sqnxZsF8iziYkpPaRXuHdeqPaD1WJal/o=;
 b=ebAu3kF+U4oDuzLlP2fpt/zoL6sryFOPTim2NaTsx66t7mPewFfbrYUsR4en3sVe8J
 YBwGkn8sWmztDT6cyzKY5Eu7OfZEj6atJC2pucGMoh6uuSfBgq4NVeRoij8geDmNIr/u
 /jwSdSYZOtyi2RIGm2eGwv1aTNPaOQkr4MyKWD9T9CAMLqY8v+aYpY7Ws/qJRC/pkhYd
 h0sGw91iaHw9+eMfwbKt3WCo8KvS+byi8PuaUzQJTlgviLdwop3kOTXfJ+UAXAu/pbAD
 6hbjZAUVmfFfC4M/eHm6iuWJCT2VmHCptSK3OxhC5IEEzql760phm6ptqAp4sgMv/BJi
 BDqw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXXuwukFh2JVT0tYD4xHVflg/uzU1PrncHxEgiEubP0lbDwi/4AFLcXjmeKsVgTQ8aegOJwovFhlRE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxO3i+8Cnm71WZ/MKCSDElSs0976nohHFqsDlB6C8re2frWXdYN
 0FxunB0Dc6/tSvGIrKv0lzQkDRQ3igOQ89HXUl8fhg/Fn18D3oVG
X-Gm-Gg: ASbGnctSCDuRVGeAgrtZtwaSl2a/dsKuxpzxWamlrSu/LSmQiZfRHw76ORi38FQam2G
 oweegT5ByU85PQ76rXR4vevm0fyKDoTWMkoZGlTBtK4O3I3S/4v7f81xnZ9NMfWDhaRZ0E8lnj8
 CsNES+DUDaydxszdtRgMfhQyPOxoA12CkHPr97THGSNCXeM6yXEkaPoEDOs+yhT0wBU8MUx4VIT
 iuvkb+DwW7BP5/9B87sNN08/eraWUFg0PM/fJY21MWluNi87DmZF03pYi0ie+xQ41hmqTGbk4KV
 NmJx6vvMLIjw8+Y1YUzqLxIGU+Ia8zyqrWLfDgIQb0rhhMOjwVgpJSE/wQ==
X-Google-Smtp-Source: AGHT+IHmtdtPcIWm3ze8HJbO0PJUvdpS/G0UT9AX7Fpj+7cQRjuHZ04kk6lhxFh/1DepcXetWVaxlQ==
X-Received: by 2002:a05:600c:1989:b0:439:a6db:1824 with SMTP id
 5b1f17b1804b1-43ab0f4271cmr21458595e9.16.1740470171828; 
 Mon, 24 Feb 2025 23:56:11 -0800 (PST)
Received: from [10.42.0.1] (cst-prg-37-50.cust.vodafone.cz. [46.135.37.50])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-439b02f2475sm130299475e9.20.2025.02.24.23.56.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Feb 2025 23:56:11 -0800 (PST)
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Date: Tue, 25 Feb 2025 08:55:51 +0100
Subject: [PATCH v2 5/7] accel/rocket: Add IOCTL for BO creation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250225-6-10-rocket-v2-5-d4dbcfafc141@tomeuvizoso.net>
References: <20250225-6-10-rocket-v2-0-d4dbcfafc141@tomeuvizoso.net>
In-Reply-To: <20250225-6-10-rocket-v2-0-d4dbcfafc141@tomeuvizoso.net>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Jeffrey Hugo <quic_jhugo@quicinc.com>
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

Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>
---
 drivers/accel/rocket/Makefile        |   3 +-
 drivers/accel/rocket/rocket_device.c |   4 +
 drivers/accel/rocket/rocket_device.h |   2 +
 drivers/accel/rocket/rocket_drv.c    |   7 +-
 drivers/accel/rocket/rocket_gem.c    | 141 +++++++++++++++++++++++++++++++++++
 drivers/accel/rocket/rocket_gem.h    |  27 +++++++
 include/uapi/drm/rocket_accel.h      |  43 +++++++++++
 7 files changed, 225 insertions(+), 2 deletions(-)

diff --git a/drivers/accel/rocket/Makefile b/drivers/accel/rocket/Makefile
index 73a7280d260c068d37ad3048824f710482333540..875cac2243d902694e0d5d05e60b4ae551a633c4 100644
--- a/drivers/accel/rocket/Makefile
+++ b/drivers/accel/rocket/Makefile
@@ -5,4 +5,5 @@ obj-$(CONFIG_DRM_ACCEL_ROCKET) := rocket.o
 rocket-y := \
 	rocket_core.o \
 	rocket_device.o \
-	rocket_drv.o
+	rocket_drv.o \
+	rocket_gem.o
diff --git a/drivers/accel/rocket/rocket_device.c b/drivers/accel/rocket/rocket_device.c
index ce3b533f15c1011d8a7a23dd8132e907cc334c58..9af36357caba7148dcac764c8222699f3b572d60 100644
--- a/drivers/accel/rocket/rocket_device.c
+++ b/drivers/accel/rocket/rocket_device.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 /* Copyright 2024 Tomeu Vizoso <tomeu@tomeuvizoso.net> */
 
+#include "linux/mutex.h"
 #include <linux/clk.h>
 
 #include "rocket_device.h"
@@ -10,6 +11,8 @@ int rocket_device_init(struct rocket_device *rdev)
 	struct device *dev = rdev->cores[0].dev;
 	int err;
 
+	mutex_init(&rdev->iommu_lock);
+
 	rdev->clk_npu = devm_clk_get(dev, "npu");
 	rdev->pclk = devm_clk_get(dev, "pclk");
 
@@ -26,4 +29,5 @@ int rocket_device_init(struct rocket_device *rdev)
 void rocket_device_fini(struct rocket_device *rdev)
 {
 	rocket_core_fini(&rdev->cores[0]);
+	mutex_destroy(&rdev->iommu_lock);
 }
diff --git a/drivers/accel/rocket/rocket_device.h b/drivers/accel/rocket/rocket_device.h
index 466edba9102c5dc5dfac5d3fcc1c904f206eaebb..c6152569fdd9e5587c8e8d7b0d7c2e2a77af6000 100644
--- a/drivers/accel/rocket/rocket_device.h
+++ b/drivers/accel/rocket/rocket_device.h
@@ -14,6 +14,8 @@ struct rocket_device {
 	struct clk *clk_npu;
 	struct clk *pclk;
 
+	struct mutex iommu_lock;
+
 	struct rocket_core *cores;
 	unsigned int num_cores;
 };
diff --git a/drivers/accel/rocket/rocket_drv.c b/drivers/accel/rocket/rocket_drv.c
index c22d965f20f1239a36b1d823d5fe5f372713555d..e5612b52952fa7a0cd0af02aef314984bc483b05 100644
--- a/drivers/accel/rocket/rocket_drv.c
+++ b/drivers/accel/rocket/rocket_drv.c
@@ -6,6 +6,7 @@
 #include <drm/drm_gem.h>
 #include <drm/drm_ioctl.h>
 #include <drm/drm_of.h>
+#include <drm/rocket_accel.h>
 #include <linux/clk.h>
 #include <linux/component.h>
 #include <linux/dma-mapping.h>
@@ -14,6 +15,7 @@
 #include <linux/pm_runtime.h>
 
 #include "rocket_drv.h"
+#include "rocket_gem.h"
 
 static int
 rocket_open(struct drm_device *dev, struct drm_file *file)
@@ -42,6 +44,8 @@ rocket_postclose(struct drm_device *dev, struct drm_file *file)
 static const struct drm_ioctl_desc rocket_drm_driver_ioctls[] = {
 #define ROCKET_IOCTL(n, func) \
 	DRM_IOCTL_DEF_DRV(ROCKET_##n, rocket_ioctl_##func, 0)
+
+	ROCKET_IOCTL(CREATE_BO, create_bo),
 };
 
 DEFINE_DRM_ACCEL_FOPS(rocket_accel_driver_fops);
@@ -51,9 +55,10 @@ DEFINE_DRM_ACCEL_FOPS(rocket_accel_driver_fops);
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
diff --git a/drivers/accel/rocket/rocket_gem.c b/drivers/accel/rocket/rocket_gem.c
new file mode 100644
index 0000000000000000000000000000000000000000..d5337cf1e275c249a1491d0dd28e6b8ccd2ff2cb
--- /dev/null
+++ b/drivers/accel/rocket/rocket_gem.c
@@ -0,0 +1,141 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright 2024 Tomeu Vizoso <tomeu@tomeuvizoso.net> */
+
+#include <drm/drm_device.h>
+#include <drm/drm_utils.h>
+#include <drm/rocket_accel.h>
+#include <linux/dma-mapping.h>
+#include <linux/iommu.h>
+
+#include "rocket_device.h"
+#include "rocket_gem.h"
+
+static void rocket_gem_bo_free(struct drm_gem_object *obj)
+{
+	struct rocket_device *rdev = to_rocket_device(obj->dev);
+	struct rocket_gem_object *bo = to_rocket_bo(obj);
+	struct sg_table *sgt;
+
+	drm_WARN_ON(obj->dev, bo->base.pages_use_count > 1);
+
+	mutex_lock(&rdev->iommu_lock);
+
+	sgt = drm_gem_shmem_get_pages_sgt(&bo->base);
+
+	/* Unmap this object from the IOMMUs for cores > 0 */
+	for (unsigned int core = 1; core < rdev->num_cores; core++) {
+		struct iommu_domain *domain = iommu_get_domain_for_dev(rdev->cores[core].dev);
+		size_t unmapped = iommu_unmap(domain, sgt->sgl->dma_address, bo->size);
+
+		drm_WARN_ON(obj->dev, unmapped != bo->size);
+	}
+
+	/* This will unmap the pages from the IOMMU linked to core 0 */
+	drm_gem_shmem_free(&bo->base);
+
+	mutex_unlock(&rdev->iommu_lock);
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
+/**
+ * rocket_gem_create_object - Implementation of driver->gem_create_object.
+ * @dev: DRM device
+ * @size: Size in bytes of the memory the object will reference
+ *
+ * This lets the GEM helpers allocate object structs for us, and keep
+ * our BO stats correct.
+ */
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
+	struct drm_rocket_create_bo *args = data;
+	struct rocket_device *rdev = to_rocket_device(dev);
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
+	rkt_obj->size = args->size;
+	rkt_obj->offset = 0;
+	mutex_init(&rkt_obj->mutex);
+
+	ret = drm_gem_handle_create(file, gem_obj, &args->handle);
+	drm_gem_object_put(gem_obj);
+	if (ret)
+		goto err;
+
+	mutex_lock(&rdev->iommu_lock);
+
+	/* This will map the pages to the IOMMU linked to core 0 */
+	sgt = drm_gem_shmem_get_pages_sgt(shmem_obj);
+	if (IS_ERR(sgt)) {
+		ret = PTR_ERR(sgt);
+		goto err_unlock;
+	}
+
+	/* Map the pages to the IOMMUs linked to the other cores, so all cores can access this BO */
+	for (unsigned int core = 1; core < rdev->num_cores; core++) {
+
+		ret = iommu_map_sgtable(iommu_get_domain_for_dev(rdev->cores[core].dev),
+					sgt->sgl->dma_address,
+					sgt,
+					IOMMU_READ | IOMMU_WRITE);
+		if (ret < 0 || ret < args->size) {
+			DRM_ERROR("failed to map buffer: size=%d request_size=%u\n",
+				ret, args->size);
+			ret = -ENOMEM;
+			goto err_unlock;
+		}
+
+		/* iommu_map_sgtable might have aligned the size */
+		rkt_obj->size = ret;
+
+		dma_sync_sgtable_for_device(rdev->cores[core].dev, shmem_obj->sgt,
+					    DMA_BIDIRECTIONAL);
+	}
+
+	mutex_unlock(&rdev->iommu_lock);
+
+	args->offset = drm_vma_node_offset_addr(&gem_obj->vma_node);
+	args->dma_address = sg_dma_address(shmem_obj->sgt->sgl);
+
+	return 0;
+
+err_unlock:
+	mutex_unlock(&rdev->iommu_lock);
+err:
+	drm_gem_shmem_object_free(gem_obj);
+
+	return ret;
+}
diff --git a/drivers/accel/rocket/rocket_gem.h b/drivers/accel/rocket/rocket_gem.h
new file mode 100644
index 0000000000000000000000000000000000000000..19b0cf91ddd99bd126c1af30beb169d6101f6dee
--- /dev/null
+++ b/drivers/accel/rocket/rocket_gem.h
@@ -0,0 +1,27 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/* Copyright 2024 Tomeu Vizoso <tomeu@tomeuvizoso.net> */
+
+#ifndef __ROCKET_GEM_H__
+#define __ROCKET_GEM_H__
+
+#include <drm/drm_gem_shmem_helper.h>
+
+struct rocket_gem_object {
+	struct drm_gem_shmem_object base;
+
+	struct mutex mutex;
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
index 0000000000000000000000000000000000000000..8338726a83c31b954608ca505cf78bcd70d3494b
--- /dev/null
+++ b/include/uapi/drm/rocket_accel.h
@@ -0,0 +1,43 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2024 Tomeu Vizoso
+ */
+#ifndef _ROCKET_DRM_H_
+#define _ROCKET_DRM_H_
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
+	__u32 size;
+
+	/** Returned GEM handle for the BO. */
+	__u32 handle;
+
+	/**
+	 * Returned DMA address for the BO in the NPU address space.  This address
+	 * is private to the DRM fd and is valid for the lifetime of the GEM
+	 * handle.
+	 */
+	__u64 dma_address;
+
+	/** Offset into the drm node to use for subsequent mmap call. */
+	__u64 offset;
+};
+
+#if defined(__cplusplus)
+}
+#endif
+
+#endif /* _ROCKET_DRM_H_ */

-- 
2.48.1

