Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C2398C9553
	for <lists+dri-devel@lfdr.de>; Sun, 19 May 2024 18:55:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B7B310E27D;
	Sun, 19 May 2024 16:54:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="FZ0O73IC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-181.mta0.migadu.com (out-181.mta0.migadu.com
 [91.218.175.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35DF510E27D
 for <dri-devel@lists.freedesktop.org>; Sun, 19 May 2024 16:54:55 +0000 (UTC)
X-Envelope-To: l.stach@pengutronix.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1716137693;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KrrrUAMvLGSMTDh1k6FGYebCnWRlfKpEJuCQOvt4lG0=;
 b=FZ0O73ICs+SYi6csaJNZ9pvooDQrgDy5pufCjf6szXgt5YlAwdygBvDcA9INZJ+NMdJyxz
 gdSpP6Z4mD5/m4m2OQZuCUug/RlvpiudtGlH+vOsTKwwgE0pX79o5sV4OGvdWEOmniw5Xc
 jXKOzhL75nSQMn9nDLZAv7L+zgIwIss=
X-Envelope-To: linux+etnaviv@armlinux.org.uk
X-Envelope-To: christian.gmeiner@gmail.com
X-Envelope-To: linux-kernel@vger.kernel.org
X-Envelope-To: etnaviv@lists.freedesktop.org
X-Envelope-To: dri-devel@lists.freedesktop.org
X-Envelope-To: sui.jingfeng@linux.dev
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Sui Jingfeng <sui.jingfeng@linux.dev>
To: Lucas Stach <l.stach@pengutronix.de>
Cc: Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 linux-kernel@vger.kernel.org, etnaviv@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Sui Jingfeng <sui.jingfeng@linux.dev>
Subject: [etnaviv-next v14 3/8] drm/etnaviv: Embed struct drm_device into
 struct etnaviv_drm_private
Date: Mon, 20 May 2024 00:53:16 +0800
Message-Id: <20240519165321.2123356-4-sui.jingfeng@linux.dev>
In-Reply-To: <20240519165321.2123356-1-sui.jingfeng@linux.dev>
References: <20240519165321.2123356-1-sui.jingfeng@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
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

Both the instance of struct drm_device and the instance of struct
etnaviv_drm_private are intended to be shared by all GPU cores, both have
only one instance created across drm/etnaviv driver. After embedded in,
the whole structure can be allocated with devm_drm_dev_alloc(). And the
DRM device created is automatically put on driver detach, so we don't need
to call drm_dev_put() explicitly on driver leave. It's also eliminate the
need to use the .dev_private member, which is deprecated according to the
drm document. We can also use container_of() to retrieve pointer for the
containing structure.

Signed-off-by: Sui Jingfeng <sui.jingfeng@linux.dev>
---
 drivers/gpu/drm/etnaviv/etnaviv_drv.c        | 65 ++++++++------------
 drivers/gpu/drm/etnaviv/etnaviv_drv.h        |  7 +++
 drivers/gpu/drm/etnaviv/etnaviv_gem.c        |  6 +-
 drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c |  2 +-
 drivers/gpu/drm/etnaviv/etnaviv_gpu.c        |  6 +-
 drivers/gpu/drm/etnaviv/etnaviv_mmu.c        |  4 +-
 6 files changed, 40 insertions(+), 50 deletions(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_drv.c b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
index 22c78bc944c4..e3eb31ba9a2b 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_drv.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
@@ -41,14 +41,9 @@ static struct device_node *etnaviv_of_first_available_node(void)
 	return NULL;
 }
 
-static struct etnaviv_drm_private *etnaviv_alloc_private(struct device *dev)
+static int etnaviv_private_init(struct device *dev,
+				struct etnaviv_drm_private *priv)
 {
-	struct etnaviv_drm_private *priv;
-
-	priv = kzalloc(sizeof(*priv), GFP_KERNEL);
-	if (!priv)
-		return ERR_PTR(-ENOMEM);
-
 	xa_init_flags(&priv->active_contexts, XA_FLAGS_ALLOC);
 
 	mutex_init(&priv->gem_lock);
@@ -58,15 +53,14 @@ static struct etnaviv_drm_private *etnaviv_alloc_private(struct device *dev)
 
 	priv->cmdbuf_suballoc = etnaviv_cmdbuf_suballoc_new(dev);
 	if (IS_ERR(priv->cmdbuf_suballoc)) {
-		kfree(priv);
 		dev_err(dev, "Failed to create cmdbuf suballocator\n");
-		return ERR_PTR(-ENOMEM);
+		return -ENOMEM;
 	}
 
-	return priv;
+	return 0;
 }
 
-static void etnaviv_free_private(struct etnaviv_drm_private *priv)
+static void etnaviv_private_fini(struct etnaviv_drm_private *priv)
 {
 	if (!priv)
 		return;
@@ -76,13 +70,11 @@ static void etnaviv_free_private(struct etnaviv_drm_private *priv)
 	etnaviv_cmdbuf_suballoc_destroy(priv->cmdbuf_suballoc);
 
 	xa_destroy(&priv->active_contexts);
-
-	kfree(priv);
 }
 
 static void load_gpu(struct drm_device *dev)
 {
-	struct etnaviv_drm_private *priv = dev->dev_private;
+	struct etnaviv_drm_private *priv = to_etnaviv_priv(dev);
 	unsigned int i;
 
 	for (i = 0; i < ETNA_MAX_PIPES; i++) {
@@ -100,7 +92,7 @@ static void load_gpu(struct drm_device *dev)
 
 static int etnaviv_open(struct drm_device *dev, struct drm_file *file)
 {
-	struct etnaviv_drm_private *priv = dev->dev_private;
+	struct etnaviv_drm_private *priv = to_etnaviv_priv(dev);
 	struct etnaviv_file_private *ctx;
 	int ret, i;
 
@@ -143,7 +135,7 @@ static int etnaviv_open(struct drm_device *dev, struct drm_file *file)
 
 static void etnaviv_postclose(struct drm_device *dev, struct drm_file *file)
 {
-	struct etnaviv_drm_private *priv = dev->dev_private;
+	struct etnaviv_drm_private *priv = to_etnaviv_priv(dev);
 	struct etnaviv_file_private *ctx = file->driver_priv;
 	unsigned int i;
 
@@ -168,7 +160,7 @@ static void etnaviv_postclose(struct drm_device *dev, struct drm_file *file)
 #ifdef CONFIG_DEBUG_FS
 static int etnaviv_gem_show(struct drm_device *dev, struct seq_file *m)
 {
-	struct etnaviv_drm_private *priv = dev->dev_private;
+	struct etnaviv_drm_private *priv = to_etnaviv_priv(dev);
 
 	etnaviv_gem_describe_objects(priv, m);
 
@@ -262,7 +254,7 @@ static int show_each_gpu(struct seq_file *m, void *arg)
 {
 	struct drm_info_node *node = (struct drm_info_node *) m->private;
 	struct drm_device *dev = node->minor->dev;
-	struct etnaviv_drm_private *priv = dev->dev_private;
+	struct etnaviv_drm_private *priv = to_etnaviv_priv(dev);
 	struct etnaviv_gpu *gpu;
 	int (*show)(struct etnaviv_gpu *gpu, struct seq_file *m) =
 			node->info_ent->data;
@@ -305,7 +297,7 @@ static void etnaviv_debugfs_init(struct drm_minor *minor)
 static int etnaviv_ioctl_get_param(struct drm_device *dev, void *data,
 		struct drm_file *file)
 {
-	struct etnaviv_drm_private *priv = dev->dev_private;
+	struct etnaviv_drm_private *priv = to_etnaviv_priv(dev);
 	struct drm_etnaviv_param *args = data;
 	struct etnaviv_gpu *gpu;
 
@@ -398,7 +390,7 @@ static int etnaviv_ioctl_wait_fence(struct drm_device *dev, void *data,
 		struct drm_file *file)
 {
 	struct drm_etnaviv_wait_fence *args = data;
-	struct etnaviv_drm_private *priv = dev->dev_private;
+	struct etnaviv_drm_private *priv = to_etnaviv_priv(dev);
 	struct drm_etnaviv_timespec *timeout = &args->timeout;
 	struct etnaviv_gpu *gpu;
 
@@ -446,7 +438,7 @@ static int etnaviv_ioctl_gem_userptr(struct drm_device *dev, void *data,
 static int etnaviv_ioctl_gem_wait(struct drm_device *dev, void *data,
 	struct drm_file *file)
 {
-	struct etnaviv_drm_private *priv = dev->dev_private;
+	struct etnaviv_drm_private *priv = to_etnaviv_priv(dev);
 	struct drm_etnaviv_gem_wait *args = data;
 	struct drm_etnaviv_timespec *timeout = &args->timeout;
 	struct drm_gem_object *obj;
@@ -480,7 +472,7 @@ static int etnaviv_ioctl_gem_wait(struct drm_device *dev, void *data,
 static int etnaviv_ioctl_pm_query_dom(struct drm_device *dev, void *data,
 	struct drm_file *file)
 {
-	struct etnaviv_drm_private *priv = dev->dev_private;
+	struct etnaviv_drm_private *priv = to_etnaviv_priv(dev);
 	struct drm_etnaviv_pm_domain *args = data;
 	struct etnaviv_gpu *gpu;
 
@@ -497,7 +489,7 @@ static int etnaviv_ioctl_pm_query_dom(struct drm_device *dev, void *data,
 static int etnaviv_ioctl_pm_query_sig(struct drm_device *dev, void *data,
 	struct drm_file *file)
 {
-	struct etnaviv_drm_private *priv = dev->dev_private;
+	struct etnaviv_drm_private *priv = to_etnaviv_priv(dev);
 	struct drm_etnaviv_pm_signal *args = data;
 	struct etnaviv_gpu *gpu;
 
@@ -556,17 +548,14 @@ static int etnaviv_bind(struct device *dev)
 	struct drm_device *drm;
 	int ret;
 
-	drm = drm_dev_alloc(&etnaviv_drm_driver, dev);
-	if (IS_ERR(drm))
-		return PTR_ERR(drm);
+	priv = devm_drm_dev_alloc(dev, &etnaviv_drm_driver,
+				  struct etnaviv_drm_private, drm);
+	if (IS_ERR(priv))
+		return PTR_ERR(priv);
 
-	priv = etnaviv_alloc_private(dev);
-	if (IS_ERR(priv)) {
-		ret = PTR_ERR(priv);
-		goto out_put;
-	}
+	etnaviv_private_init(dev, priv);
 
-	drm->dev_private = priv;
+	drm = &priv->drm;
 
 	dma_set_max_seg_size(dev, SZ_2G);
 
@@ -587,9 +576,7 @@ static int etnaviv_bind(struct device *dev)
 out_unbind:
 	component_unbind_all(dev, drm);
 out_free_priv:
-	etnaviv_free_private(priv);
-out_put:
-	drm_dev_put(drm);
+	etnaviv_private_fini(priv);
 
 	return ret;
 }
@@ -597,17 +584,13 @@ static int etnaviv_bind(struct device *dev)
 static void etnaviv_unbind(struct device *dev)
 {
 	struct drm_device *drm = dev_get_drvdata(dev);
-	struct etnaviv_drm_private *priv = drm->dev_private;
+	struct etnaviv_drm_private *priv = to_etnaviv_priv(drm);
 
 	drm_dev_unregister(drm);
 
 	component_unbind_all(dev, drm);
 
-	etnaviv_free_private(priv);
-
-	drm->dev_private = NULL;
-
-	drm_dev_put(drm);
+	etnaviv_private_fini(priv);
 }
 
 static const struct component_master_ops etnaviv_master_ops = {
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_drv.h b/drivers/gpu/drm/etnaviv/etnaviv_drv.h
index b3eb1662e90c..1f9b50b5a6aa 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_drv.h
+++ b/drivers/gpu/drm/etnaviv/etnaviv_drv.h
@@ -35,6 +35,7 @@ struct etnaviv_file_private {
 };
 
 struct etnaviv_drm_private {
+	struct drm_device drm;
 	int num_gpus;
 	struct etnaviv_gpu *gpu[ETNA_MAX_PIPES];
 	gfp_t shm_gfp_mask;
@@ -50,6 +51,12 @@ struct etnaviv_drm_private {
 	struct list_head gem_list;
 };
 
+static inline struct etnaviv_drm_private *
+to_etnaviv_priv(struct drm_device *ddev)
+{
+	return container_of(ddev, struct etnaviv_drm_private, drm);
+}
+
 int etnaviv_ioctl_gem_submit(struct drm_device *dev, void *data,
 		struct drm_file *file);
 
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem.c b/drivers/gpu/drm/etnaviv/etnaviv_gem.c
index 71a6d2b1c80f..aa95a5e98374 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gem.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gem.c
@@ -486,7 +486,7 @@ static const struct etnaviv_gem_ops etnaviv_gem_shmem_ops = {
 void etnaviv_gem_free_object(struct drm_gem_object *obj)
 {
 	struct etnaviv_gem_object *etnaviv_obj = to_etnaviv_bo(obj);
-	struct etnaviv_drm_private *priv = obj->dev->dev_private;
+	struct etnaviv_drm_private *priv = to_etnaviv_priv(obj->dev);
 	struct etnaviv_vram_mapping *mapping, *tmp;
 
 	/* object should not be active */
@@ -517,7 +517,7 @@ void etnaviv_gem_free_object(struct drm_gem_object *obj)
 
 void etnaviv_gem_obj_add(struct drm_device *dev, struct drm_gem_object *obj)
 {
-	struct etnaviv_drm_private *priv = dev->dev_private;
+	struct etnaviv_drm_private *priv = to_etnaviv_priv(dev);
 	struct etnaviv_gem_object *etnaviv_obj = to_etnaviv_bo(obj);
 
 	mutex_lock(&priv->gem_lock);
@@ -584,7 +584,7 @@ static int etnaviv_gem_new_impl(struct drm_device *dev, u32 flags,
 int etnaviv_gem_new_handle(struct drm_device *dev, struct drm_file *file,
 	u32 size, u32 flags, u32 *handle)
 {
-	struct etnaviv_drm_private *priv = dev->dev_private;
+	struct etnaviv_drm_private *priv = to_etnaviv_priv(dev);
 	struct drm_gem_object *obj = NULL;
 	int ret;
 
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c b/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
index 3d0f8d182506..6b40a39fb8cd 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
@@ -413,7 +413,7 @@ int etnaviv_ioctl_gem_submit(struct drm_device *dev, void *data,
 		struct drm_file *file)
 {
 	struct etnaviv_file_private *ctx = file->driver_priv;
-	struct etnaviv_drm_private *priv = dev->dev_private;
+	struct etnaviv_drm_private *priv = to_etnaviv_priv(dev);
 	struct drm_etnaviv_gem_submit *args = data;
 	struct drm_etnaviv_gem_submit_reloc *relocs;
 	struct drm_etnaviv_gem_submit_pmr *pmrs;
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
index e0c36f564fa6..02d7efdc82c0 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
@@ -38,7 +38,7 @@ static const struct platform_device_id gpu_ids[] = {
 
 int etnaviv_gpu_get_param(struct etnaviv_gpu *gpu, u32 param, u64 *value)
 {
-	struct etnaviv_drm_private *priv = gpu->drm->dev_private;
+	struct etnaviv_drm_private *priv = to_etnaviv_priv(gpu->drm);
 
 	switch (param) {
 	case ETNAVIV_PARAM_GPU_MODEL:
@@ -789,7 +789,7 @@ static void etnaviv_gpu_hw_init(struct etnaviv_gpu *gpu)
 
 int etnaviv_gpu_init(struct etnaviv_gpu *gpu)
 {
-	struct etnaviv_drm_private *priv = gpu->drm->dev_private;
+	struct etnaviv_drm_private *priv = to_etnaviv_priv(gpu->drm);
 	dma_addr_t cmdbuf_paddr;
 	int ret, i;
 
@@ -1779,7 +1779,7 @@ static int etnaviv_gpu_bind(struct device *dev, struct device *master,
 	void *data)
 {
 	struct drm_device *drm = data;
-	struct etnaviv_drm_private *priv = drm->dev_private;
+	struct etnaviv_drm_private *priv = to_etnaviv_priv(drm);
 	struct etnaviv_gpu *gpu = dev_get_drvdata(dev);
 	int ret;
 
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_mmu.c b/drivers/gpu/drm/etnaviv/etnaviv_mmu.c
index 1661d589bf3e..c38272868328 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_mmu.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_mmu.c
@@ -490,7 +490,7 @@ void etnaviv_iommu_dump(struct etnaviv_iommu_context *context, void *buf)
 int etnaviv_iommu_global_init(struct etnaviv_gpu *gpu)
 {
 	enum etnaviv_iommu_version version = ETNAVIV_IOMMU_V1;
-	struct etnaviv_drm_private *priv = gpu->drm->dev_private;
+	struct etnaviv_drm_private *priv = to_etnaviv_priv(gpu->drm);
 	struct etnaviv_iommu_global *global;
 	struct device *dev = gpu->drm->dev;
 
@@ -550,7 +550,7 @@ int etnaviv_iommu_global_init(struct etnaviv_gpu *gpu)
 
 void etnaviv_iommu_global_fini(struct etnaviv_gpu *gpu)
 {
-	struct etnaviv_drm_private *priv = gpu->drm->dev_private;
+	struct etnaviv_drm_private *priv = to_etnaviv_priv(gpu->drm);
 	struct etnaviv_iommu_global *global = priv->mmu_global;
 
 	if (!global)
-- 
2.34.1

