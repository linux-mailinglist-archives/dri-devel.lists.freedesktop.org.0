Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F19214104BD
	for <lists+dri-devel@lfdr.de>; Sat, 18 Sep 2021 09:25:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82EC16E0EA;
	Sat, 18 Sep 2021 07:25:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 943EC6EC78
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Sep 2021 12:57:59 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id 140so7303535wma.0
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Sep 2021 05:57:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kveOhsYdfcJGM7hWZYWGj9xAFDOT8yCCjJMc15hxR3E=;
 b=gmoH5MRBAIPsqFg4scp3ximcPls0Zz60KgnOCyiy17oQXlewYk7aLXSiloSnFp6aiR
 J6/wFkELg/duwNxRK3C2DBJsAwtXypryBFTpd0XnHDrTOvaRrul4sLBmOGdm12vZjV1s
 LoRihepH16yf6AefIbvS5ExqnQaI7yCiJmh7Hbmzaio5Vm1Jciv646S4oV+nbA+2cUhl
 tbJJYulBBiSqZu2U3qhugn2E8eXES1NcRTiJJ4PnyxgdVB3McxyHAPBl/RPoVUmCeB+c
 kxiIxiEaGDw6PTYuzwH0ZsSjlydeas6uUTO6BaWcKzfhE7CuQonU4zuRx6KMkaf+21Ik
 2OIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kveOhsYdfcJGM7hWZYWGj9xAFDOT8yCCjJMc15hxR3E=;
 b=hHNoDyD4d9KjklohkycEXEQWkwc4sgrKYZvec7R9MqAwwfQNn9ej5+S+Jbhs2+lrip
 +tNj90Xm3MtfYKsXRKZuGjxCwWZ0r2YRcRuwHrMXYJVvWK5mztCbvG3/FQh3BwGazOra
 c9iHZj52xteU8DqxwVWTOzY9iCErpi26tUU6IQBaXoP8AJ+4x7e99nmb3ro6bZsgwX+R
 /xdq/n+Ehwr7Vi6sQXo44LGgxbvAkjulQJJyPG9SReW12BuyzzutaLqr1X5rh6UgMfXO
 H76xffhU1ID/CPNQcau6lExIkBQ9jQVQBoO1uCjZCiQnFK2yNdjr5uJ14SplAuHRk3QJ
 LGEQ==
X-Gm-Message-State: AOAM5304uX7DSN8bOuwSR2SeBbmgs9BIwCStd++BTqaHxmwyXygZkX+8
 Rvu7xKmsp/2awWp4Qx3Oxj493w==
X-Google-Smtp-Source: ABdhPJzc+CE1ZuQk0hv+TyHYZ3w8badxvqjTtmMVEdAuwEbC5vK3pcLl/B/JLUTnk0U78dBaKrC91A==
X-Received: by 2002:a05:600c:4f95:: with SMTP id
 n21mr14849827wmq.22.1631883477885; 
 Fri, 17 Sep 2021 05:57:57 -0700 (PDT)
Received: from localhost.baylibre.local
 (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id f3sm6358636wmj.28.2021.09.17.05.57.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Sep 2021 05:57:56 -0700 (PDT)
From: Alexandre Bailon <abailon@baylibre.com>
To: airlied@linux.ie, daniel@ffwll.ch, robh+dt@kernel.org,
 matthias.bgg@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, ohad@wizery.com,
 bjorn.andersson@linaro.org, mathieu.poirier@linaro.org,
 sumit.semwal@linaro.org
Cc: christian.koenig@amd.com, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-remoteproc@vger.kernel.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, khilman@baylibre.com, gpain@baylibre.com,
 Alexandre Bailon <abailon@baylibre.com>
Subject: [RFC PATCH 2/4] DRM: Add support of AI Processor Unit (APU)
Date: Fri, 17 Sep 2021 14:59:43 +0200
Message-Id: <20210917125945.620097-3-abailon@baylibre.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210917125945.620097-1-abailon@baylibre.com>
References: <20210917125945.620097-1-abailon@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sat, 18 Sep 2021 07:25:35 +0000
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

Some Mediatek SoC provides hardware accelerator for AI / ML.
This driver provides the infrastructure to manage memory
shared between host CPU and the accelerator, and to submit
jobs to the accelerator.
The APU itself is managed by remoteproc so this drivers
relies on remoteproc to found the APU and get some important data
from it. But, the driver is quite generic and it should possible
to manage accelerator using another ways.
This driver doesn't manage itself the data transmitions.
It must be registered by another driver implementing the transmitions.

Signed-off-by: Alexandre Bailon <abailon@baylibre.com>
---
 drivers/gpu/drm/Kconfig            |   2 +
 drivers/gpu/drm/Makefile           |   1 +
 drivers/gpu/drm/apu/Kconfig        |  10 +
 drivers/gpu/drm/apu/Makefile       |   7 +
 drivers/gpu/drm/apu/apu_drm_drv.c  | 238 +++++++++++
 drivers/gpu/drm/apu/apu_gem.c      | 232 +++++++++++
 drivers/gpu/drm/apu/apu_internal.h |  89 ++++
 drivers/gpu/drm/apu/apu_sched.c    | 634 +++++++++++++++++++++++++++++
 include/drm/apu_drm.h              |  59 +++
 include/uapi/drm/apu_drm.h         | 106 +++++
 10 files changed, 1378 insertions(+)
 create mode 100644 drivers/gpu/drm/apu/Kconfig
 create mode 100644 drivers/gpu/drm/apu/Makefile
 create mode 100644 drivers/gpu/drm/apu/apu_drm_drv.c
 create mode 100644 drivers/gpu/drm/apu/apu_gem.c
 create mode 100644 drivers/gpu/drm/apu/apu_internal.h
 create mode 100644 drivers/gpu/drm/apu/apu_sched.c
 create mode 100644 include/drm/apu_drm.h
 create mode 100644 include/uapi/drm/apu_drm.h

diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index 8fc40317f2b77..bcdca35c9eda5 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -382,6 +382,8 @@ source "drivers/gpu/drm/xlnx/Kconfig"
 
 source "drivers/gpu/drm/gud/Kconfig"
 
+source "drivers/gpu/drm/apu/Kconfig"
+
 config DRM_HYPERV
 	tristate "DRM Support for Hyper-V synthetic video device"
 	depends on DRM && PCI && MMU && HYPERV
diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
index ad11121548983..f3d8432976558 100644
--- a/drivers/gpu/drm/Makefile
+++ b/drivers/gpu/drm/Makefile
@@ -127,4 +127,5 @@ obj-$(CONFIG_DRM_MCDE) += mcde/
 obj-$(CONFIG_DRM_TIDSS) += tidss/
 obj-y			+= xlnx/
 obj-y			+= gud/
+obj-$(CONFIG_DRM_APU) += apu/
 obj-$(CONFIG_DRM_HYPERV) += hyperv/
diff --git a/drivers/gpu/drm/apu/Kconfig b/drivers/gpu/drm/apu/Kconfig
new file mode 100644
index 0000000000000..c8471309a0351
--- /dev/null
+++ b/drivers/gpu/drm/apu/Kconfig
@@ -0,0 +1,10 @@
+# SPDX-License-Identifier: GPL-2.0-only
+#
+
+config DRM_APU
+	tristate "APU (AI Processor Unit)"
+	select REMOTEPROC
+	select DRM_SCHED
+	help
+	  This provides a DRM driver that provides some facilities to
+	  communicate with an accelerated processing unit (APU).
diff --git a/drivers/gpu/drm/apu/Makefile b/drivers/gpu/drm/apu/Makefile
new file mode 100644
index 0000000000000..3e97846b091c9
--- /dev/null
+++ b/drivers/gpu/drm/apu/Makefile
@@ -0,0 +1,7 @@
+# SPDX-License-Identifier: GPL-2.0
+
+apu_drm-y += apu_drm_drv.o
+apu_drm-y += apu_sched.o
+apu_drm-y += apu_gem.o
+
+obj-$(CONFIG_DRM_APU) += apu_drm.o
diff --git a/drivers/gpu/drm/apu/apu_drm_drv.c b/drivers/gpu/drm/apu/apu_drm_drv.c
new file mode 100644
index 0000000000000..91d8c99e373c0
--- /dev/null
+++ b/drivers/gpu/drm/apu/apu_drm_drv.c
@@ -0,0 +1,238 @@
+// SPDX-License-Identifier: GPL-2.0
+//
+// Copyright 2020 BayLibre SAS
+
+#include <linux/dma-map-ops.h>
+#include <linux/dma-mapping.h>
+#include <linux/iommu.h>
+#include <linux/iova.h>
+#include <linux/list.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/remoteproc.h>
+
+#include <drm/apu_drm.h>
+#include <drm/drm_drv.h>
+#include <drm/drm_gem_cma_helper.h>
+#include <drm/drm_probe_helper.h>
+
+#include <uapi/drm/apu_drm.h>
+
+#include "apu_internal.h"
+
+static LIST_HEAD(apu_devices);
+
+static const struct drm_ioctl_desc ioctls[] = {
+	DRM_IOCTL_DEF_DRV(APU_GEM_NEW, ioctl_gem_new,
+			  DRM_RENDER_ALLOW),
+	DRM_IOCTL_DEF_DRV(APU_GEM_QUEUE, ioctl_gem_queue,
+			  DRM_RENDER_ALLOW),
+	DRM_IOCTL_DEF_DRV(APU_GEM_DEQUEUE, ioctl_gem_dequeue,
+			  DRM_RENDER_ALLOW),
+	DRM_IOCTL_DEF_DRV(APU_GEM_IOMMU_MAP, ioctl_gem_iommu_map,
+			  DRM_RENDER_ALLOW),
+	DRM_IOCTL_DEF_DRV(APU_GEM_IOMMU_UNMAP, ioctl_gem_iommu_unmap,
+			  DRM_RENDER_ALLOW),
+	DRM_IOCTL_DEF_DRV(APU_STATE, ioctl_apu_state,
+			  DRM_RENDER_ALLOW),
+};
+
+DEFINE_DRM_GEM_CMA_FOPS(apu_drm_ops);
+
+static struct drm_driver apu_drm_driver = {
+	.driver_features = DRIVER_GEM | DRIVER_SYNCOBJ,
+	.name = "drm_apu",
+	.desc = "APU DRM driver",
+	.date = "20210319",
+	.major = 1,
+	.minor = 0,
+	.patchlevel = 0,
+	.ioctls = ioctls,
+	.num_ioctls = ARRAY_SIZE(ioctls),
+	.fops = &apu_drm_ops,
+	DRM_GEM_CMA_DRIVER_OPS_WITH_DUMB_CREATE(drm_gem_cma_dumb_create),
+};
+
+void *apu_drm_priv(struct apu_core *apu_core)
+{
+	return apu_core->priv;
+}
+EXPORT_SYMBOL_GPL(apu_drm_priv);
+
+int apu_drm_reserve_iova(struct apu_core *apu_core, u64 start, u64 size)
+{
+	struct apu_drm *apu_drm = apu_core->apu_drm;
+	struct iova *iova;
+
+	iova = reserve_iova(&apu_drm->iovad, PHYS_PFN(start),
+			    PHYS_PFN(start + size));
+	if (!iova)
+		return -ENOMEM;
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(apu_drm_reserve_iova);
+
+static int apu_drm_init_first_core(struct apu_drm *apu_drm,
+				   struct apu_core *apu_core)
+{
+	struct drm_device *drm;
+	struct device *parent;
+	u64 mask;
+
+	drm = apu_drm->drm;
+	parent = apu_core->rproc->dev.parent;
+	drm->dev->iommu_group = parent->iommu_group;
+	apu_drm->domain = iommu_get_domain_for_dev(parent);
+	set_dma_ops(drm->dev, get_dma_ops(parent));
+	mask = dma_get_mask(parent);
+	return dma_coerce_mask_and_coherent(drm->dev, mask);
+}
+
+struct apu_core *apu_drm_register_core(struct rproc *rproc,
+				       struct apu_drm_ops *ops, void *priv)
+{
+	struct apu_drm *apu_drm;
+	struct apu_core *apu_core;
+	int ret;
+
+	list_for_each_entry(apu_drm, &apu_devices, node) {
+		list_for_each_entry(apu_core, &apu_drm->apu_cores, node) {
+			if (apu_core->rproc == rproc) {
+				ret =
+				    apu_drm_init_first_core(apu_drm, apu_core);
+				apu_core->dev = &rproc->dev;
+				apu_core->priv = priv;
+				apu_core->ops = ops;
+
+				ret = apu_drm_job_init(apu_core);
+				if (ret)
+					return NULL;
+
+				return apu_core;
+			}
+		}
+	}
+
+	return NULL;
+}
+EXPORT_SYMBOL_GPL(apu_drm_register_core);
+
+int apu_drm_unregister_core(void *priv)
+{
+	struct apu_drm *apu_drm;
+	struct apu_core *apu_core;
+
+	list_for_each_entry(apu_drm, &apu_devices, node) {
+		list_for_each_entry(apu_core, &apu_drm->apu_cores, node) {
+			if (apu_core->priv == priv) {
+				apu_sched_fini(apu_core);
+				apu_core->priv = NULL;
+				apu_core->ops = NULL;
+			}
+		}
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(apu_drm_unregister_core);
+
+#ifdef CONFIG_OF
+static const struct of_device_id apu_platform_of_match[] = {
+	{ .compatible = "mediatek,apu-drm", },
+	{ },
+};
+
+MODULE_DEVICE_TABLE(of, apu_platform_of_match);
+#endif
+
+static int apu_platform_probe(struct platform_device *pdev)
+{
+	struct drm_device *drm;
+	struct apu_drm *apu_drm;
+	struct of_phandle_iterator it;
+	int index = 0;
+	u64 iova[2];
+	int ret;
+
+	apu_drm = devm_kzalloc(&pdev->dev, sizeof(*apu_drm), GFP_KERNEL);
+	if (!apu_drm)
+		return -ENOMEM;
+	INIT_LIST_HEAD(&apu_drm->apu_cores);
+
+	of_phandle_iterator_init(&it, pdev->dev.of_node, "remoteproc", NULL, 0);
+	while (of_phandle_iterator_next(&it) == 0) {
+		struct rproc *rproc = rproc_get_by_phandle(it.phandle);
+		struct apu_core *apu_core;
+
+		if (!rproc)
+			return -EPROBE_DEFER;
+
+		apu_core = devm_kzalloc(&pdev->dev, sizeof(*apu_core),
+					GFP_KERNEL);
+		if (!apu_core)
+			return -ENOMEM;
+
+		apu_core->rproc = rproc;
+		apu_core->device_id = index++;
+		apu_core->apu_drm = apu_drm;
+		spin_lock_init(&apu_core->ctx_lock);
+		INIT_LIST_HEAD(&apu_core->requests);
+		list_add(&apu_core->node, &apu_drm->apu_cores);
+	}
+
+	if (of_property_read_variable_u64_array(pdev->dev.of_node, "iova",
+						iova, ARRAY_SIZE(iova),
+						ARRAY_SIZE(iova)) !=
+	    ARRAY_SIZE(iova))
+		return -EINVAL;
+
+	init_iova_domain(&apu_drm->iovad, PAGE_SIZE, PHYS_PFN(iova[0]));
+	apu_drm->iova_limit_pfn = PHYS_PFN(iova[0] + iova[1]) - 1;
+
+	drm = drm_dev_alloc(&apu_drm_driver, &pdev->dev);
+	if (IS_ERR(drm)) {
+		ret = PTR_ERR(drm);
+		return ret;
+	}
+
+	ret = drm_dev_register(drm, 0);
+	if (ret) {
+		drm_dev_put(drm);
+		return ret;
+	}
+
+	drm->dev_private = apu_drm;
+	apu_drm->drm = drm;
+	apu_drm->dev = &pdev->dev;
+
+	platform_set_drvdata(pdev, drm);
+
+	list_add(&apu_drm->node, &apu_devices);
+
+	return 0;
+}
+
+static int apu_platform_remove(struct platform_device *pdev)
+{
+	struct drm_device *drm;
+
+	drm = platform_get_drvdata(pdev);
+
+	drm_dev_unregister(drm);
+	drm_dev_put(drm);
+
+	return 0;
+}
+
+static struct platform_driver apu_platform_driver = {
+	.probe = apu_platform_probe,
+	.remove = apu_platform_remove,
+	.driver = {
+		   .name = "apu_drm",
+		   .of_match_table = of_match_ptr(apu_platform_of_match),
+	},
+};
+
+module_platform_driver(apu_platform_driver);
diff --git a/drivers/gpu/drm/apu/apu_gem.c b/drivers/gpu/drm/apu/apu_gem.c
new file mode 100644
index 0000000000000..c867143dab436
--- /dev/null
+++ b/drivers/gpu/drm/apu/apu_gem.c
@@ -0,0 +1,232 @@
+// SPDX-License-Identifier: GPL-2.0
+//
+// Copyright 2020 BayLibre SAS
+
+#include <asm/cacheflush.h>
+
+#include <linux/dma-buf.h>
+#include <linux/dma-mapping.h>
+#include <linux/highmem.h>
+#include <linux/iommu.h>
+#include <linux/iova.h>
+#include <linux/mm.h>
+#include <linux/swap.h>
+
+#include <drm/drm_drv.h>
+#include <drm/drm_gem_cma_helper.h>
+
+#include <uapi/drm/apu_drm.h>
+
+#include "apu_internal.h"
+
+struct drm_gem_object *apu_gem_create_object(struct drm_device *dev,
+					     size_t size)
+{
+	struct drm_gem_cma_object *cma_obj;
+
+	cma_obj = drm_gem_cma_create(dev, size);
+	if (!cma_obj)
+		return NULL;
+
+	return &cma_obj->base;
+}
+
+int ioctl_gem_new(struct drm_device *dev, void *data,
+		  struct drm_file *file_priv)
+{
+	struct drm_apu_gem_new *args = data;
+	struct drm_gem_cma_object *cma_obj;
+	struct apu_gem_object *apu_obj;
+	struct drm_gem_object *gem_obj;
+	int ret;
+
+	cma_obj = drm_gem_cma_create(dev, args->size);
+	if (IS_ERR(cma_obj))
+		return PTR_ERR(cma_obj);
+
+	gem_obj = &cma_obj->base;
+	apu_obj = to_apu_bo(gem_obj);
+
+	/*
+	 * Save the size of buffer expected by application instead of the
+	 * aligned one.
+	 */
+	apu_obj->size = args->size;
+	apu_obj->offset = 0;
+	apu_obj->iommu_refcount = 0;
+	mutex_init(&apu_obj->mutex);
+
+	ret = drm_gem_handle_create(file_priv, gem_obj, &args->handle);
+	drm_gem_object_put(gem_obj);
+	if (ret) {
+		drm_gem_cma_free_object(gem_obj);
+		return ret;
+	}
+	args->offset = drm_vma_node_offset_addr(&gem_obj->vma_node);
+
+	return 0;
+}
+
+void apu_bo_iommu_unmap(struct apu_drm *apu_drm, struct apu_gem_object *obj)
+{
+	int iova_pfn;
+	int i;
+
+	if (!obj->iommu_sgt)
+		return;
+
+	mutex_lock(&obj->mutex);
+	obj->iommu_refcount--;
+	if (obj->iommu_refcount) {
+		mutex_unlock(&obj->mutex);
+		return;
+	}
+
+	iova_pfn = PHYS_PFN(obj->iova);
+	for (i = 0; i < obj->iommu_sgt->nents; i++) {
+		iommu_unmap(apu_drm->domain, PFN_PHYS(iova_pfn),
+			    PAGE_ALIGN(obj->iommu_sgt->sgl[i].length));
+		iova_pfn += PHYS_PFN(PAGE_ALIGN(obj->iommu_sgt->sgl[i].length));
+	}
+
+	sg_free_table(obj->iommu_sgt);
+	kfree(obj->iommu_sgt);
+
+	free_iova(&apu_drm->iovad, PHYS_PFN(obj->iova));
+	mutex_unlock(&obj->mutex);
+}
+
+static struct sg_table *apu_get_sg_table(struct drm_gem_object *obj)
+{
+	if (obj->funcs)
+		return obj->funcs->get_sg_table(obj);
+	return NULL;
+}
+
+int apu_bo_iommu_map(struct apu_drm *apu_drm, struct drm_gem_object *obj)
+{
+	struct apu_gem_object *apu_obj = to_apu_bo(obj);
+	struct scatterlist *sgl;
+	phys_addr_t phys;
+	int total_buf_space;
+	int iova_pfn;
+	int iova;
+	int ret;
+	int i;
+
+	mutex_lock(&apu_obj->mutex);
+	apu_obj->iommu_refcount++;
+	if (apu_obj->iommu_refcount != 1) {
+		mutex_unlock(&apu_obj->mutex);
+		return 0;
+	}
+
+	apu_obj->iommu_sgt = apu_get_sg_table(obj);
+	if (IS_ERR(apu_obj->iommu_sgt)) {
+		mutex_unlock(&apu_obj->mutex);
+		return PTR_ERR(apu_obj->iommu_sgt);
+	}
+
+	total_buf_space = obj->size;
+	iova_pfn = alloc_iova_fast(&apu_drm->iovad,
+				   total_buf_space >> PAGE_SHIFT,
+				   apu_drm->iova_limit_pfn, true);
+	apu_obj->iova = PFN_PHYS(iova_pfn);
+
+	if (!iova_pfn) {
+		dev_err(apu_drm->dev, "Failed to allocate iova address\n");
+		mutex_unlock(&apu_obj->mutex);
+		return -ENOMEM;
+	}
+
+	iova = apu_obj->iova;
+	sgl = apu_obj->iommu_sgt->sgl;
+	for (i = 0; i < apu_obj->iommu_sgt->nents; i++) {
+		phys = page_to_phys(sg_page(&sgl[i]));
+		ret =
+		    iommu_map(apu_drm->domain, PFN_PHYS(iova_pfn), phys,
+			      PAGE_ALIGN(sgl[i].length),
+			      IOMMU_READ | IOMMU_WRITE);
+		if (ret) {
+			dev_err(apu_drm->dev, "Failed to iommu map\n");
+			free_iova(&apu_drm->iovad, iova_pfn);
+			mutex_unlock(&apu_obj->mutex);
+			return ret;
+		}
+		iova += sgl[i].offset + sgl[i].length;
+		iova_pfn += PHYS_PFN(PAGE_ALIGN(sgl[i].length));
+	}
+	mutex_unlock(&apu_obj->mutex);
+
+	return 0;
+}
+
+int ioctl_gem_iommu_map(struct drm_device *dev, void *data,
+			struct drm_file *file_priv)
+{
+	struct apu_drm *apu_drm = dev->dev_private;
+	struct drm_apu_gem_iommu_map *args = data;
+	struct drm_gem_object **bos;
+	void __user *bo_handles;
+	int ret;
+	int i;
+
+	u64 *das = kvmalloc_array(args->bo_handle_count,
+				  sizeof(u64), GFP_KERNEL);
+	if (!das)
+		return -ENOMEM;
+
+	bo_handles = (void __user *)(uintptr_t) args->bo_handles;
+	ret = drm_gem_objects_lookup(file_priv, bo_handles,
+				     args->bo_handle_count, &bos);
+	if (ret) {
+		kvfree(das);
+		return ret;
+	}
+
+	for (i = 0; i < args->bo_handle_count; i++) {
+		ret = apu_bo_iommu_map(apu_drm, bos[i]);
+		if (ret) {
+			/* TODO: handle error */
+			break;
+		}
+		das[i] = to_apu_bo(bos[i])->iova + to_apu_bo(bos[i])->offset;
+	}
+
+	if (copy_to_user((void *)args->bo_device_addresses, das,
+			 args->bo_handle_count * sizeof(u64))) {
+		ret = -EFAULT;
+		DRM_DEBUG("Failed to copy device addresses\n");
+		goto out;
+	}
+
+out:
+	kvfree(das);
+	kvfree(bos);
+
+	return 0;
+}
+
+int ioctl_gem_iommu_unmap(struct drm_device *dev, void *data,
+			  struct drm_file *file_priv)
+{
+	struct apu_drm *apu_drm = dev->dev_private;
+	struct drm_apu_gem_iommu_map *args = data;
+	struct drm_gem_object **bos;
+	void __user *bo_handles;
+	int ret;
+	int i;
+
+	bo_handles = (void __user *)(uintptr_t) args->bo_handles;
+	ret = drm_gem_objects_lookup(file_priv, bo_handles,
+				     args->bo_handle_count, &bos);
+	if (ret)
+		return ret;
+
+	for (i = 0; i < args->bo_handle_count; i++)
+		apu_bo_iommu_unmap(apu_drm, to_apu_bo(bos[i]));
+
+	kvfree(bos);
+
+	return 0;
+}
diff --git a/drivers/gpu/drm/apu/apu_internal.h b/drivers/gpu/drm/apu/apu_internal.h
new file mode 100644
index 0000000000000..b789b2f3ad9c6
--- /dev/null
+++ b/drivers/gpu/drm/apu/apu_internal.h
@@ -0,0 +1,89 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef __APU_INTERNAL_H__
+#define __APU_INTERNAL_H__
+
+#include <linux/iova.h>
+
+#include <drm/drm_drv.h>
+#include <drm/drm_gem_cma_helper.h>
+#include <drm/gpu_scheduler.h>
+
+struct apu_gem_object {
+	struct drm_gem_cma_object base;
+	struct mutex mutex;
+	struct sg_table *iommu_sgt;
+	int iommu_refcount;
+	size_t size;
+	u32 iova;
+	u32 offset;
+};
+
+struct apu_sched;
+struct apu_core {
+	int device_id;
+	struct device *dev;
+	struct rproc *rproc;
+	struct apu_drm_ops *ops;
+	struct apu_drm *apu_drm;
+
+	spinlock_t ctx_lock;
+	struct list_head requests;
+
+	struct list_head node;
+	void *priv;
+
+	struct apu_sched *sched;
+	u32 flags;
+};
+
+struct apu_drm {
+	struct device *dev;
+	struct drm_device *drm;
+
+	struct iommu_domain *domain;
+	struct iova_domain iovad;
+	int iova_limit_pfn;
+
+	struct list_head apu_cores;
+	struct list_head node;
+};
+
+static inline struct apu_gem_object *to_apu_bo(struct drm_gem_object *obj)
+{
+	return container_of(to_drm_gem_cma_obj(obj), struct apu_gem_object,
+			    base);
+}
+
+struct apu_gem_object *to_apu_bo(struct drm_gem_object *obj);
+struct drm_gem_object *apu_gem_create_object(struct drm_device *dev,
+					     size_t size);
+
+int apu_bo_iommu_map(struct apu_drm *apu_drm, struct drm_gem_object *obj);
+void apu_bo_iommu_unmap(struct apu_drm *apu_drm, struct apu_gem_object *obj);
+struct drm_gem_object *apu_gem_create_object(struct drm_device *dev,
+					     size_t size);
+int ioctl_gem_new(struct drm_device *dev, void *data,
+		  struct drm_file *file_priv);
+int ioctl_gem_user_new(struct drm_device *dev, void *data,
+		       struct drm_file *file_priv);
+int ioctl_gem_iommu_map(struct drm_device *dev, void *data,
+			struct drm_file *file_priv);
+int ioctl_gem_iommu_unmap(struct drm_device *dev, void *data,
+			  struct drm_file *file_priv);
+int ioctl_gem_queue(struct drm_device *dev, void *data,
+		    struct drm_file *file_priv);
+int ioctl_gem_dequeue(struct drm_device *dev, void *data,
+		      struct drm_file *file_priv);
+int ioctl_apu_state(struct drm_device *dev, void *data,
+		    struct drm_file *file_priv);
+struct dma_buf *apu_gem_prime_export(struct drm_gem_object *gem,
+				     int flags);
+
+struct apu_job;
+
+int apu_drm_job_init(struct apu_core *core);
+void apu_sched_fini(struct apu_core *core);
+int apu_job_push(struct apu_job *job);
+void apu_job_put(struct apu_job *job);
+
+#endif /* __APU_INTERNAL_H__ */
diff --git a/drivers/gpu/drm/apu/apu_sched.c b/drivers/gpu/drm/apu/apu_sched.c
new file mode 100644
index 0000000000000..cebb0155c7783
--- /dev/null
+++ b/drivers/gpu/drm/apu/apu_sched.c
@@ -0,0 +1,634 @@
+// SPDX-License-Identifier: GPL-2.0
+//
+// Copyright 2020 BayLibre SAS
+
+#include <drm/apu_drm.h>
+#include <drm/drm_drv.h>
+#include <drm/drm_gem_cma_helper.h>
+#include <drm/drm_syncobj.h>
+#include <drm/gpu_scheduler.h>
+
+#include <uapi/drm/apu_drm.h>
+
+#include "apu_internal.h"
+
+struct apu_queue_state {
+	struct drm_gpu_scheduler sched;
+
+	u64 fence_context;
+	u64 seqno;
+};
+
+struct apu_request {
+	struct list_head node;
+	void *job;
+};
+
+struct apu_sched {
+	struct apu_queue_state apu_queue;
+	spinlock_t job_lock;
+	struct drm_sched_entity sched_entity;
+};
+
+struct apu_event {
+	struct drm_pending_event pending_event;
+	union {
+		struct drm_event base;
+		struct apu_job_event job_event;
+	};
+};
+
+struct apu_job {
+	struct drm_sched_job base;
+
+	struct kref refcount;
+
+	struct apu_core *apu_core;
+	struct apu_drm *apu_drm;
+
+	/* Fence to be signaled by IRQ handler when the job is complete. */
+	struct dma_fence *done_fence;
+
+	__u32 cmd;
+
+	/* Exclusive fences we have taken from the BOs to wait for */
+	struct dma_fence **implicit_fences;
+	struct drm_gem_object **bos;
+	u32 bo_count;
+
+	/* Fence to be signaled by drm-sched once its done with the job */
+	struct dma_fence *render_done_fence;
+
+	void *data_in;
+	uint16_t size_in;
+	void *data_out;
+	uint16_t size_out;
+	uint16_t result;
+	uint16_t id;
+
+	struct list_head node;
+	struct drm_syncobj *sync_out;
+
+	struct apu_event *event;
+};
+
+static DEFINE_IDA(req_ida);
+static LIST_HEAD(complete_node);
+
+int apu_drm_callback(struct apu_core *apu_core, void *data, int len)
+{
+	struct apu_request *apu_req, *tmp;
+	struct apu_dev_request *hdr = data;
+	unsigned long flags;
+
+	spin_lock_irqsave(&apu_core->ctx_lock, flags);
+	list_for_each_entry_safe(apu_req, tmp, &apu_core->requests, node) {
+		struct apu_job *job = apu_req->job;
+
+		if (job && hdr->id == job->id) {
+			kref_get(&job->refcount);
+			job->result = hdr->result;
+			if (job->size_out)
+				memcpy(job->data_out, hdr->data + job->size_in,
+				       min(job->size_out, hdr->size_out));
+			job->size_out = hdr->size_out;
+			list_add(&job->node, &complete_node);
+			list_del(&apu_req->node);
+			ida_simple_remove(&req_ida, hdr->id);
+			kfree(apu_req);
+			drm_send_event(job->apu_drm->drm,
+				       &job->event->pending_event);
+			dma_fence_signal_locked(job->done_fence);
+		}
+	}
+	spin_unlock_irqrestore(&apu_core->ctx_lock, flags);
+
+	return 0;
+}
+
+void apu_sched_fini(struct apu_core *core)
+{
+	drm_sched_fini(&core->sched->apu_queue.sched);
+	devm_kfree(core->dev, core->sched);
+	core->flags &= ~APU_ONLINE;
+	core->sched = NULL;
+}
+
+static void apu_job_cleanup(struct kref *ref)
+{
+	struct apu_job *job = container_of(ref, struct apu_job,
+					   refcount);
+	unsigned int i;
+
+	if (job->implicit_fences) {
+		for (i = 0; i < job->bo_count; i++)
+			dma_fence_put(job->implicit_fences[i]);
+		kvfree(job->implicit_fences);
+	}
+	dma_fence_put(job->done_fence);
+	dma_fence_put(job->render_done_fence);
+
+	if (job->bos) {
+		for (i = 0; i < job->bo_count; i++) {
+			struct apu_gem_object *apu_obj;
+
+			apu_obj = to_apu_bo(job->bos[i]);
+			apu_bo_iommu_unmap(job->apu_drm, apu_obj);
+			drm_gem_object_put(job->bos[i]);
+		}
+
+		kvfree(job->bos);
+	}
+
+	kfree(job->data_out);
+	kfree(job->data_in);
+	kfree(job);
+}
+
+void apu_job_put(struct apu_job *job)
+{
+	kref_put(&job->refcount, apu_job_cleanup);
+}
+
+static void apu_acquire_object_fences(struct drm_gem_object **bos,
+				      int bo_count,
+				      struct dma_fence **implicit_fences)
+{
+	int i;
+
+	for (i = 0; i < bo_count; i++)
+		implicit_fences[i] = dma_resv_get_excl_unlocked(bos[i]->resv);
+}
+
+static void apu_attach_object_fences(struct drm_gem_object **bos,
+				     int bo_count, struct dma_fence *fence)
+{
+	int i;
+
+	for (i = 0; i < bo_count; i++)
+		dma_resv_add_excl_fence(bos[i]->resv, fence);
+}
+
+int apu_job_push(struct apu_job *job)
+{
+	struct drm_sched_entity *entity = &job->apu_core->sched->sched_entity;
+	struct ww_acquire_ctx acquire_ctx;
+	int ret = 0;
+
+	ret = drm_gem_lock_reservations(job->bos, job->bo_count, &acquire_ctx);
+	if (ret)
+		return ret;
+
+	ret = drm_sched_job_init(&job->base, entity, NULL);
+	if (ret)
+		goto unlock;
+
+	job->render_done_fence = dma_fence_get(&job->base.s_fence->finished);
+
+	kref_get(&job->refcount);	/* put by scheduler job completion */
+
+	apu_acquire_object_fences(job->bos, job->bo_count,
+				  job->implicit_fences);
+
+	drm_sched_entity_push_job(&job->base, entity);
+
+	apu_attach_object_fences(job->bos, job->bo_count,
+				 job->render_done_fence);
+
+unlock:
+	drm_gem_unlock_reservations(job->bos, job->bo_count, &acquire_ctx);
+
+	return ret;
+}
+
+static const char *apu_fence_get_driver_name(struct dma_fence *fence)
+{
+	return "apu";
+}
+
+static const char *apu_fence_get_timeline_name(struct dma_fence *fence)
+{
+	return "apu-0";
+}
+
+static void apu_fence_release(struct dma_fence *f)
+{
+	kfree(f);
+}
+
+static const struct dma_fence_ops apu_fence_ops = {
+	.get_driver_name = apu_fence_get_driver_name,
+	.get_timeline_name = apu_fence_get_timeline_name,
+	.release = apu_fence_release,
+};
+
+static struct dma_fence *apu_fence_create(struct apu_sched *sched)
+{
+	struct dma_fence *fence;
+	struct apu_queue_state *apu_queue = &sched->apu_queue;
+
+	fence = kzalloc(sizeof(*fence), GFP_KERNEL);
+	if (!fence)
+		return ERR_PTR(-ENOMEM);
+
+	dma_fence_init(fence, &apu_fence_ops, &sched->job_lock,
+		       apu_queue->fence_context, apu_queue->seqno++);
+
+	return fence;
+}
+
+static struct apu_job *to_apu_job(struct drm_sched_job *sched_job)
+{
+	return container_of(sched_job, struct apu_job, base);
+}
+
+static struct dma_fence *apu_job_dependency(struct drm_sched_job *sched_job,
+					    struct drm_sched_entity *s_entity)
+{
+	struct apu_job *job = to_apu_job(sched_job);
+	struct dma_fence *fence;
+	unsigned int i;
+
+	/* Implicit fences, max. one per BO */
+	for (i = 0; i < job->bo_count; i++) {
+		if (job->implicit_fences[i]) {
+			fence = job->implicit_fences[i];
+			job->implicit_fences[i] = NULL;
+			return fence;
+		}
+	}
+
+	return NULL;
+}
+
+static int apu_job_hw_submit(struct apu_job *job)
+{
+	int ret;
+	struct apu_core *apu_core = job->apu_core;
+	struct apu_dev_request *dev_req;
+	struct apu_request *apu_req;
+	unsigned long flags;
+
+	int size = sizeof(*dev_req) + sizeof(u32) * job->bo_count * 2;
+	u32 *dev_req_da;
+	u32 *dev_req_buffer_size;
+	int i;
+
+	dev_req = kmalloc(size + job->size_in + job->size_out, GFP_KERNEL);
+	if (!dev_req)
+		return -ENOMEM;
+
+	dev_req->cmd = job->cmd;
+	dev_req->size_in = job->size_in;
+	dev_req->size_out = job->size_out;
+	dev_req->count = job->bo_count;
+	dev_req_da =
+	    (u32 *) (dev_req->data + dev_req->size_in + dev_req->size_out);
+	dev_req_buffer_size = (u32 *) (dev_req_da + dev_req->count);
+	memcpy(dev_req->data, job->data_in, job->size_in);
+
+	apu_req = kzalloc(sizeof(*apu_req), GFP_KERNEL);
+	if (!apu_req)
+		return -ENOMEM;
+
+	for (i = 0; i < job->bo_count; i++) {
+		struct apu_gem_object *obj = to_apu_bo(job->bos[i]);
+
+		dev_req_da[i] = obj->iova + obj->offset;
+		dev_req_buffer_size[i] = obj->size;
+	}
+
+	ret = ida_simple_get(&req_ida, 0, 0xffff, GFP_KERNEL);
+	if (ret < 0)
+		goto err_free_memory;
+
+	dev_req->id = ret;
+
+	job->id = dev_req->id;
+	apu_req->job = job;
+	spin_lock_irqsave(&apu_core->ctx_lock, flags);
+	list_add(&apu_req->node, &apu_core->requests);
+	spin_unlock_irqrestore(&apu_core->ctx_lock, flags);
+	ret =
+	    apu_core->ops->send(apu_core, dev_req,
+				size + dev_req->size_in + dev_req->size_out);
+	if (ret < 0)
+		goto err;
+	kfree(dev_req);
+
+	return 0;
+
+err:
+	list_del(&apu_req->node);
+	ida_simple_remove(&req_ida, dev_req->id);
+err_free_memory:
+	kfree(apu_req);
+	kfree(dev_req);
+
+	return ret;
+}
+
+static struct dma_fence *apu_job_run(struct drm_sched_job *sched_job)
+{
+	struct apu_job *job = to_apu_job(sched_job);
+	struct dma_fence *fence = NULL;
+
+	if (unlikely(job->base.s_fence->finished.error))
+		return NULL;
+
+	fence = apu_fence_create(job->apu_core->sched);
+	if (IS_ERR(fence))
+		return NULL;
+
+	job->done_fence = dma_fence_get(fence);
+
+	apu_job_hw_submit(job);
+
+	return fence;
+}
+
+static void apu_update_rpoc_state(struct apu_core *core)
+{
+	if (core->rproc) {
+		if (core->rproc->state == RPROC_CRASHED)
+			core->flags |= APU_CRASHED;
+		if (core->rproc->state == RPROC_OFFLINE)
+			core->flags &= ~APU_ONLINE;
+	}
+}
+
+static enum drm_gpu_sched_stat apu_job_timedout(struct drm_sched_job *sched_job)
+{
+	struct apu_request *apu_req, *tmp;
+	struct apu_job *job = to_apu_job(sched_job);
+
+	if (dma_fence_is_signaled(job->done_fence))
+		return DRM_GPU_SCHED_STAT_NOMINAL;
+
+	list_for_each_entry_safe(apu_req, tmp, &job->apu_core->requests, node) {
+		/* Remove the request and notify user about timeout */
+		if (apu_req->job == job) {
+			kref_get(&job->refcount);
+			job->apu_core->flags |= APU_TIMEDOUT;
+			apu_update_rpoc_state(job->apu_core);
+			job->result = ETIMEDOUT;
+			list_add(&job->node, &complete_node);
+			list_del(&apu_req->node);
+			ida_simple_remove(&req_ida, job->id);
+			kfree(apu_req);
+			drm_send_event(job->apu_drm->drm,
+				       &job->event->pending_event);
+			dma_fence_signal_locked(job->done_fence);
+		}
+	}
+
+	return DRM_GPU_SCHED_STAT_NOMINAL;
+}
+
+static void apu_job_free(struct drm_sched_job *sched_job)
+{
+	struct apu_job *job = to_apu_job(sched_job);
+
+	drm_sched_job_cleanup(sched_job);
+
+	apu_job_put(job);
+}
+
+static const struct drm_sched_backend_ops apu_sched_ops = {
+	.dependency = apu_job_dependency,
+	.run_job = apu_job_run,
+	.timedout_job = apu_job_timedout,
+	.free_job = apu_job_free
+};
+
+int apu_drm_job_init(struct apu_core *core)
+{
+	int ret;
+	struct apu_sched *apu_sched;
+	struct drm_gpu_scheduler *sched;
+
+	apu_sched = devm_kzalloc(core->dev, sizeof(*apu_sched), GFP_KERNEL);
+	if (!apu_sched)
+		return -ENOMEM;
+
+	sched = &apu_sched->apu_queue.sched;
+	apu_sched->apu_queue.fence_context = dma_fence_context_alloc(1);
+	ret = drm_sched_init(sched, &apu_sched_ops,
+			     1, 0, msecs_to_jiffies(500),
+			     NULL, NULL, "apu_js");
+	if (ret) {
+		dev_err(core->dev, "Failed to create scheduler: %d.", ret);
+		return ret;
+	}
+
+	ret = drm_sched_entity_init(&apu_sched->sched_entity,
+				    DRM_SCHED_PRIORITY_NORMAL,
+				    &sched, 1, NULL);
+
+	core->sched = apu_sched;
+	core->flags = APU_ONLINE;
+
+	return ret;
+}
+
+static struct apu_core *get_apu_core(struct apu_drm *apu_drm, int device_id)
+{
+	struct apu_core *apu_core;
+
+	list_for_each_entry(apu_core, &apu_drm->apu_cores, node) {
+		if (apu_core->device_id == device_id)
+			return apu_core;
+	}
+
+	return NULL;
+}
+
+static int apu_core_is_running(struct apu_core *core)
+{
+	return core->ops && core->priv && core->sched;
+}
+
+static int
+apu_lookup_bos(struct drm_device *dev,
+	       struct drm_file *file_priv,
+	       struct drm_apu_gem_queue *args, struct apu_job *job)
+{
+	void __user *bo_handles;
+	unsigned int i;
+	int ret;
+
+	job->bo_count = args->bo_handle_count;
+
+	if (!job->bo_count)
+		return 0;
+
+	job->implicit_fences = kvmalloc_array(job->bo_count,
+					      sizeof(struct dma_fence *),
+					      GFP_KERNEL | __GFP_ZERO);
+	if (!job->implicit_fences)
+		return -ENOMEM;
+
+	bo_handles = (void __user *)(uintptr_t) args->bo_handles;
+	ret = drm_gem_objects_lookup(file_priv, bo_handles,
+				     job->bo_count, &job->bos);
+	if (ret)
+		return ret;
+
+	for (i = 0; i < job->bo_count; i++) {
+		ret = apu_bo_iommu_map(job->apu_drm, job->bos[i]);
+		if (ret) {
+			/* TODO: handle error */
+			break;
+		}
+	}
+
+	return ret;
+}
+
+int ioctl_gem_queue(struct drm_device *dev, void *data,
+		    struct drm_file *file_priv)
+{
+	struct apu_drm *apu_drm = dev->dev_private;
+	struct drm_apu_gem_queue *args = data;
+	struct apu_event *event;
+	struct apu_core *core;
+	struct drm_syncobj *sync_out = NULL;
+	struct apu_job *job;
+	int ret = 0;
+
+	core = get_apu_core(apu_drm, args->device);
+	if (!apu_core_is_running(core))
+		return -ENODEV;
+
+	if (args->out_sync > 0) {
+		sync_out = drm_syncobj_find(file_priv, args->out_sync);
+		if (!sync_out)
+			return -ENODEV;
+	}
+
+	job = kzalloc(sizeof(*job), GFP_KERNEL);
+	if (!job) {
+		ret = -ENOMEM;
+		goto fail_out_sync;
+	}
+
+	kref_init(&job->refcount);
+
+	job->apu_drm = apu_drm;
+	job->apu_core = core;
+	job->cmd = args->cmd;
+	job->size_in = args->size_in;
+	job->size_out = args->size_out;
+	job->sync_out = sync_out;
+	if (job->size_in) {
+		job->data_in = kmalloc(job->size_in, GFP_KERNEL);
+		if (!job->data_in) {
+			ret = -ENOMEM;
+			goto fail_job;
+		}
+
+		ret =
+		    copy_from_user(job->data_in,
+				   (void __user *)(uintptr_t) args->data,
+				   job->size_in);
+		if (ret)
+			goto fail_job;
+	}
+
+	if (job->size_out) {
+		job->data_out = kmalloc(job->size_out, GFP_KERNEL);
+		if (!job->data_out) {
+			ret = -ENOMEM;
+			goto fail_job;
+		}
+	}
+
+	ret = apu_lookup_bos(dev, file_priv, args, job);
+	if (ret)
+		goto fail_job;
+
+	event = kzalloc(sizeof(*event), GFP_KERNEL);
+	event->base.length = sizeof(struct apu_job_event);
+	event->base.type = APU_JOB_COMPLETED;
+	event->job_event.out_sync = args->out_sync;
+	job->event = event;
+	ret = drm_event_reserve_init(dev, file_priv, &job->event->pending_event,
+				     &job->event->base);
+	if (ret)
+		goto fail_job;
+
+	ret = apu_job_push(job);
+	if (ret) {
+		drm_event_cancel_free(dev, &job->event->pending_event);
+		goto fail_job;
+	}
+
+	/* Update the return sync object for the job */
+	if (sync_out)
+		drm_syncobj_replace_fence(sync_out, job->render_done_fence);
+
+fail_job:
+	apu_job_put(job);
+fail_out_sync:
+	if (sync_out)
+		drm_syncobj_put(sync_out);
+
+	return ret;
+}
+
+int ioctl_gem_dequeue(struct drm_device *dev, void *data,
+		      struct drm_file *file_priv)
+{
+	struct drm_apu_gem_dequeue *args = data;
+	struct drm_syncobj *sync_out = NULL;
+	struct apu_job *job;
+	int ret = 0;
+
+	if (args->out_sync > 0) {
+		sync_out = drm_syncobj_find(file_priv, args->out_sync);
+		if (!sync_out)
+			return -ENODEV;
+	}
+
+	list_for_each_entry(job, &complete_node, node) {
+		if (job->sync_out == sync_out) {
+			if (job->data_out) {
+				ret = copy_to_user((void __user *)(uintptr_t)
+						   args->data, job->data_out,
+						   job->size_out);
+				args->size = job->size_out;
+			}
+			args->result = job->result;
+			list_del(&job->node);
+			apu_job_put(job);
+			drm_syncobj_put(sync_out);
+
+			return ret;
+		}
+	}
+
+	if (sync_out)
+		drm_syncobj_put(sync_out);
+
+	return 0;
+}
+
+int ioctl_apu_state(struct drm_device *dev, void *data,
+		    struct drm_file *file_priv)
+{
+	struct apu_drm *apu_drm = dev->dev_private;
+	struct drm_apu_state *args = data;
+	struct apu_core *core;
+
+	args->flags = 0;
+
+	core = get_apu_core(apu_drm, args->device);
+	if (!core)
+		return -ENODEV;
+	args->flags |= core->flags;
+
+	/* Reset APU flags */
+	core->flags &= ~(APU_TIMEDOUT | APU_CRASHED);
+
+	return 0;
+}
diff --git a/include/drm/apu_drm.h b/include/drm/apu_drm.h
new file mode 100644
index 0000000000000..f044ed0427fdd
--- /dev/null
+++ b/include/drm/apu_drm.h
@@ -0,0 +1,59 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef __APU_DRM_H__
+#define __APU_DRM_H__
+
+#include <linux/iova.h>
+#include <linux/remoteproc.h>
+
+struct apu_core;
+struct apu_drm;
+
+struct apu_drm_ops {
+	int (*send)(struct apu_core *apu_core, void *data, int len);
+	int (*callback)(struct apu_core *apu_core, void *data, int len);
+};
+
+#ifdef CONFIG_DRM_APU
+
+struct apu_core *apu_drm_register_core(struct rproc *rproc,
+				       struct apu_drm_ops *ops, void *priv);
+int apu_drm_reserve_iova(struct apu_core *apu_core, u64 start, u64 size);
+int apu_drm_unregister_core(void *priv);
+int apu_drm_callback(struct apu_core *apu_core, void *data, int len);
+void *apu_drm_priv(struct apu_core *apu_core);
+
+#else /* CONFIG_DRM_APU */
+
+static inline
+struct apu_core *apu_drm_register_core(struct rproc *rproc,
+				       struct apu_drm_ops *ops, void *priv)
+{
+	return NULL;
+}
+
+static inline
+int apu_drm_reserve_iova(struct apu_core *apu_core, u64 start, u64 size)
+{
+	return -ENOMEM;
+}
+
+static inline
+int apu_drm_uregister_core(void *priv)
+{
+	return -ENODEV;
+}
+
+static inline
+int apu_drm_callback(struct apu_core *apu_core, void *data, int len)
+{
+	return -ENODEV;
+}
+
+static inline void *apu_drm_priv(struct apu_core *apu_core)
+{
+	return NULL;
+}
+#endif /* CONFIG_DRM_APU */
+
+
+#endif /* __APU_DRM_H__ */
diff --git a/include/uapi/drm/apu_drm.h b/include/uapi/drm/apu_drm.h
new file mode 100644
index 0000000000000..c52e187bb0599
--- /dev/null
+++ b/include/uapi/drm/apu_drm.h
@@ -0,0 +1,106 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#ifndef __UAPI_APU_DRM_H__
+#define __UAPI_APU_DRM_H__
+
+#include "drm.h"
+
+#if defined(__cplusplus)
+extern "C" {
+#endif
+
+#define APU_JOB_COMPLETED 0x80000000
+
+/*
+ * Please note that modifications to all structs defined here are
+ * subject to backwards-compatibility constraints.
+ */
+
+/*
+ * Firmware request, must be aligned with the one defined in firmware.
+ * @id: Request id, used in the case of reply, to find the pending request
+ * @cmd: The command id to execute in the firmware
+ * @result: The result of the command executed on the firmware
+ * @size: The size of the data available in this request
+ * @count: The number of shared buffer
+ * @data: Contains the data attached with the request if size is greater than
+ *        zero, and the addresses of shared buffers if count is greater than
+ *        zero. Both the data and the shared buffer could be read and write
+ *        by the APU.
+ */
+struct  apu_dev_request {
+	u16 id;
+	u16 cmd;
+	u16 result;
+	u16 size_in;
+	u16 size_out;
+	u16 count;
+	u8 data[0];
+} __packed;
+
+struct drm_apu_gem_new {
+	__u32 size;			/* in */
+	__u32 flags;			/* in */
+	__u32 handle;			/* out */
+	__u64 offset;			/* out */
+};
+
+struct drm_apu_gem_queue {
+	__u32 device;
+	__u32 cmd;
+	__u32 out_sync;
+	__u64 bo_handles;
+	__u32 bo_handle_count;
+	__u16 size_in;
+	__u16 size_out;
+	__u64 data;
+};
+
+struct drm_apu_gem_dequeue {
+	__u32 out_sync;
+	__u16 result;
+	__u16 size;
+	__u64 data;
+};
+
+struct drm_apu_gem_iommu_map {
+	__u64 bo_handles;
+	__u32 bo_handle_count;
+	__u64 bo_device_addresses;
+};
+
+struct apu_job_event {
+	struct drm_event base;
+	__u32 out_sync;
+};
+
+#define APU_ONLINE		BIT(0)
+#define APU_CRASHED		BIT(1)
+#define APU_TIMEDOUT		BIT(2)
+
+struct drm_apu_state {
+	__u32 device;
+	__u32 flags;
+};
+
+#define DRM_APU_GEM_NEW			0x00
+#define DRM_APU_GEM_QUEUE		0x01
+#define DRM_APU_GEM_DEQUEUE		0x02
+#define DRM_APU_GEM_IOMMU_MAP		0x03
+#define DRM_APU_GEM_IOMMU_UNMAP		0x04
+#define DRM_APU_STATE			0x05
+#define DRM_APU_NUM_IOCTLS		0x06
+
+#define DRM_IOCTL_APU_GEM_NEW		DRM_IOWR(DRM_COMMAND_BASE + DRM_APU_GEM_NEW, struct drm_apu_gem_new)
+#define DRM_IOCTL_APU_GEM_USER_NEW	DRM_IOWR(DRM_COMMAND_BASE + DRM_APU_GEM_USER_NEW, struct drm_apu_gem_user_new)
+#define DRM_IOCTL_APU_GEM_QUEUE		DRM_IOWR(DRM_COMMAND_BASE + DRM_APU_GEM_QUEUE, struct drm_apu_gem_queue)
+#define DRM_IOCTL_APU_GEM_DEQUEUE	DRM_IOWR(DRM_COMMAND_BASE + DRM_APU_GEM_DEQUEUE, struct drm_apu_gem_dequeue)
+#define DRM_IOCTL_APU_GEM_IOMMU_MAP	DRM_IOWR(DRM_COMMAND_BASE + DRM_APU_GEM_IOMMU_MAP, struct drm_apu_gem_iommu_map)
+#define DRM_IOCTL_APU_GEM_IOMMU_UNMAP	DRM_IOWR(DRM_COMMAND_BASE + DRM_APU_GEM_IOMMU_UNMAP, struct drm_apu_gem_iommu_map)
+#define DRM_IOCTL_APU_STATE		DRM_IOWR(DRM_COMMAND_BASE + DRM_APU_STATE, struct drm_apu_state)
+
+#if defined(__cplusplus)
+}
+#endif
+
+#endif /* __UAPI_APU_DRM_H__ */
-- 
2.31.1

