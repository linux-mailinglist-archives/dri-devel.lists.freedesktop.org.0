Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E2E772F2B7
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jun 2023 04:48:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19BB810E40B;
	Wed, 14 Jun 2023 02:48:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from 189.cn (ptr.189.cn [183.61.185.104])
 by gabe.freedesktop.org (Postfix) with ESMTP id 0636F10E403;
 Wed, 14 Jun 2023 02:47:57 +0000 (UTC)
HMM_SOURCE_IP: 10.64.8.31:39796.1729481184
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-114.242.206.180 (unknown [10.64.8.31])
 by 189.cn (HERMES) with SMTP id 8D423102A3B;
 Wed, 14 Jun 2023 10:47:55 +0800 (CST)
Received: from  ([114.242.206.180])
 by gateway-151646-dep-75648544bd-xp9j7 with ESMTP id
 9fee7db26a3b4738992b705ddeb35013 for l.stach@pengutronix.de; 
 Wed, 14 Jun 2023 10:47:56 CST
X-Transaction-ID: 9fee7db26a3b4738992b705ddeb35013
X-Real-From: 15330273260@189.cn
X-Receive-IP: 114.242.206.180
X-MEDUSA-Status: 0
From: Sui Jingfeng <15330273260@189.cn>
To: Lucas Stach <l.stach@pengutronix.de>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Bjorn Helgaas <bhelgaas@google.com>
Subject: [PATCH v9 7/9] drm/etnaviv: Add support for the dma coherent device
Date: Wed, 14 Jun 2023 10:47:43 +0800
Message-Id: <20230614024745.865129-8-15330273260@189.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230614024745.865129-1-15330273260@189.cn>
References: <20230614024745.865129-1-15330273260@189.cn>
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
Cc: Sui Jingfeng <suijingfeng@loongson.cn>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, etnaviv@lists.freedesktop.org,
 loongson-kernel@lists.loongnix.cn
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Sui Jingfeng <suijingfeng@loongson.cn>

Loongson CPUs maintain cache coherency by hardware, which means that the
data in the CPU cache is identical to the data in main system memory. As
for the peripheral device, most of Loongson chips chose to define the
peripherals as DMA coherent by default, device drivers do not need to
maintain the coherency between a processor and an I/O device manually.

There are exceptions, for LS2K1000 SoC, part of peripheral device can be
configured as DMA non-coherent. But there is no released version of such
firmware exist in the market. Peripherals of older LS2K1000 is also DMA
non-coherent, but they are nearly outdated. So, those are trivial cases.

Nevertheless, kernel space still need to do the probe work, because vivante
GPU IP has been integrated into various platform. Hence, this patch add
runtime detection code to probe if a specific GPU is DMA coherent, If the
answer is yes, we are going to utilize such features. On Loongson platform,
When a buffer is accessed by both the GPU and the CPU, the driver should
prefer ETNA_BO_CACHED over ETNA_BO_WC.

This patch also add a new parameter: etnaviv_param_gpu_coherent, which
allow userspace to know if such a feature is available. Because
write-combined BO is still preferred in some case, especially where don't
need CPU read, for example, uploading shader bin.

Cc: Lucas Stach <l.stach@pengutronix.de>
Cc: Christian Gmeiner <christian.gmeiner@gmail.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Bjorn Helgaas <bhelgaas@google.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Signed-off-by: Sui Jingfeng <suijingfeng@loongson.cn>
---
 drivers/gpu/drm/etnaviv/etnaviv_drv.c       | 34 +++++++++++++++++++++
 drivers/gpu/drm/etnaviv/etnaviv_drv.h       |  6 ++++
 drivers/gpu/drm/etnaviv/etnaviv_gem.c       | 22 ++++++++++---
 drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c |  7 ++++-
 drivers/gpu/drm/etnaviv/etnaviv_gpu.c       |  4 +++
 include/uapi/drm/etnaviv_drm.h              |  1 +
 6 files changed, 69 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_drv.c b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
index 0a365e96d371..1c9386e5a1b0 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_drv.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
@@ -5,7 +5,9 @@
 
 #include <linux/component.h>
 #include <linux/dma-mapping.h>
+#include <linux/dma-map-ops.h>
 #include <linux/module.h>
+#include <linux/of_address.h>
 #include <linux/of_platform.h>
 #include <linux/uaccess.h>
 
@@ -24,6 +26,34 @@
 #include "etnaviv_pci_drv.h"
 #include "etnaviv_perfmon.h"
 
+static struct device_node *etnaviv_of_first_available_node(void)
+{
+	struct device_node *core_node;
+
+	for_each_compatible_node(core_node, NULL, "vivante,gc") {
+		if (of_device_is_available(core_node))
+			return core_node;
+	}
+
+	return NULL;
+}
+
+static bool etnaviv_is_dma_coherent(struct device *dev)
+{
+	struct device_node *np;
+	bool coherent;
+
+	np = etnaviv_of_first_available_node();
+	if (np) {
+		coherent = of_dma_is_coherent(np);
+		of_node_put(np);
+	} else {
+		coherent = dev_is_dma_coherent(dev);
+	}
+
+	return coherent;
+}
+
 /*
  * etnaviv private data construction and destructions:
  */
@@ -52,6 +82,10 @@ etnaviv_alloc_private(struct device *dev, struct drm_device *drm)
 		return ERR_PTR(-ENOMEM);
 	}
 
+	priv->dma_coherent = etnaviv_is_dma_coherent(dev);
+
+	drm_info(drm, "%s is dma coherent\n", dev_name(dev));
+
 	return priv;
 }
 
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_drv.h b/drivers/gpu/drm/etnaviv/etnaviv_drv.h
index 9cd72948cfad..644e5712c050 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_drv.h
+++ b/drivers/gpu/drm/etnaviv/etnaviv_drv.h
@@ -46,6 +46,12 @@ struct etnaviv_drm_private {
 	struct xarray active_contexts;
 	u32 next_context_id;
 
+	/*
+	 * If true, the GPU is capable of snooping cpu cache. Here, it
+	 * also means that cache coherency is enforced by the hardware.
+	 */
+	bool dma_coherent;
+
 	/* list of GEM objects: */
 	struct mutex gem_lock;
 	struct list_head gem_list;
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem.c b/drivers/gpu/drm/etnaviv/etnaviv_gem.c
index b5f73502e3dd..39bdc3774f2d 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gem.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gem.c
@@ -343,6 +343,7 @@ void *etnaviv_gem_vmap(struct drm_gem_object *obj)
 static void *etnaviv_gem_vmap_impl(struct etnaviv_gem_object *obj)
 {
 	struct page **pages;
+	pgprot_t prot;
 
 	lockdep_assert_held(&obj->lock);
 
@@ -350,8 +351,19 @@ static void *etnaviv_gem_vmap_impl(struct etnaviv_gem_object *obj)
 	if (IS_ERR(pages))
 		return NULL;
 
-	return vmap(pages, obj->base.size >> PAGE_SHIFT,
-			VM_MAP, pgprot_writecombine(PAGE_KERNEL));
+	switch (obj->flags) {
+	case ETNA_BO_CACHED:
+		prot = PAGE_KERNEL;
+		break;
+	case ETNA_BO_UNCACHED:
+		prot = pgprot_noncached(PAGE_KERNEL);
+		break;
+	case ETNA_BO_WC:
+	default:
+		prot = pgprot_writecombine(PAGE_KERNEL);
+	}
+
+	return vmap(pages, obj->base.size >> PAGE_SHIFT, VM_MAP, prot);
 }
 
 static inline enum dma_data_direction etnaviv_op_to_dma_dir(u32 op)
@@ -369,6 +381,7 @@ int etnaviv_gem_cpu_prep(struct drm_gem_object *obj, u32 op,
 {
 	struct etnaviv_gem_object *etnaviv_obj = to_etnaviv_bo(obj);
 	struct drm_device *dev = obj->dev;
+	struct etnaviv_drm_private *priv = dev->dev_private;
 	bool write = !!(op & ETNA_PREP_WRITE);
 	int ret;
 
@@ -395,7 +408,7 @@ int etnaviv_gem_cpu_prep(struct drm_gem_object *obj, u32 op,
 			return ret == 0 ? -ETIMEDOUT : ret;
 	}
 
-	if (etnaviv_obj->flags & ETNA_BO_CACHED) {
+	if (!priv->dma_coherent && etnaviv_obj->flags & ETNA_BO_CACHED) {
 		dma_sync_sgtable_for_cpu(dev->dev, etnaviv_obj->sgt,
 					 etnaviv_op_to_dma_dir(op));
 		etnaviv_obj->last_cpu_prep_op = op;
@@ -408,8 +421,9 @@ int etnaviv_gem_cpu_fini(struct drm_gem_object *obj)
 {
 	struct drm_device *dev = obj->dev;
 	struct etnaviv_gem_object *etnaviv_obj = to_etnaviv_bo(obj);
+	struct etnaviv_drm_private *priv = dev->dev_private;
 
-	if (etnaviv_obj->flags & ETNA_BO_CACHED) {
+	if (!priv->dma_coherent && etnaviv_obj->flags & ETNA_BO_CACHED) {
 		/* fini without a prep is almost certainly a userspace error */
 		WARN_ON(etnaviv_obj->last_cpu_prep_op == 0);
 		dma_sync_sgtable_for_device(dev->dev, etnaviv_obj->sgt,
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c b/drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c
index 3524b5811682..754126992264 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c
@@ -112,11 +112,16 @@ static const struct etnaviv_gem_ops etnaviv_gem_prime_ops = {
 struct drm_gem_object *etnaviv_gem_prime_import_sg_table(struct drm_device *dev,
 	struct dma_buf_attachment *attach, struct sg_table *sgt)
 {
+	struct etnaviv_drm_private *priv = dev->dev_private;
 	struct etnaviv_gem_object *etnaviv_obj;
 	size_t size = PAGE_ALIGN(attach->dmabuf->size);
+	u32 cache_flags = ETNA_BO_WC;
 	int ret, npages;
 
-	ret = etnaviv_gem_new_private(dev, size, ETNA_BO_WC,
+	if (priv->dma_coherent)
+		cache_flags = ETNA_BO_CACHED;
+
+	ret = etnaviv_gem_new_private(dev, size, cache_flags,
 				      &etnaviv_gem_prime_ops, &etnaviv_obj);
 	if (ret < 0)
 		return ERR_PTR(ret);
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
index d6a21e97feb1..d99ac675ce8b 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
@@ -164,6 +164,10 @@ int etnaviv_gpu_get_param(struct etnaviv_gpu *gpu, u32 param, u64 *value)
 		*value = gpu->identity.eco_id;
 		break;
 
+	case ETNAVIV_PARAM_GPU_COHERENT:
+		*value = priv->dma_coherent;
+		break;
+
 	default:
 		DBG("%s: invalid param: %u", dev_name(gpu->dev), param);
 		return -EINVAL;
diff --git a/include/uapi/drm/etnaviv_drm.h b/include/uapi/drm/etnaviv_drm.h
index af024d90453d..76baf45d7158 100644
--- a/include/uapi/drm/etnaviv_drm.h
+++ b/include/uapi/drm/etnaviv_drm.h
@@ -77,6 +77,7 @@ struct drm_etnaviv_timespec {
 #define ETNAVIV_PARAM_GPU_PRODUCT_ID                0x1c
 #define ETNAVIV_PARAM_GPU_CUSTOMER_ID               0x1d
 #define ETNAVIV_PARAM_GPU_ECO_ID                    0x1e
+#define ETNAVIV_PARAM_GPU_COHERENT                  0x1f
 
 #define ETNA_MAX_PIPES 4
 
-- 
2.25.1

