Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 62A2C40D686
	for <lists+dri-devel@lfdr.de>; Thu, 16 Sep 2021 11:44:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F8816EB3B;
	Thu, 16 Sep 2021 09:44:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE5556EB37
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Sep 2021 09:44:14 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id t18so8518281wrb.0
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Sep 2021 02:44:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5sukNNPmPu1+Cny7dyuNQ/H3foFwVcBpTP3ezpmbUXc=;
 b=ggM9ICr0z4MXH1YQIjbIcj3SBiGxRfsfsQ509rIYHxlWaGASGgTnZSlAeaFNOWv6vp
 kVQv6l9H9dsVdZXxD0yQUAip2Hu89zrYlWKbFxP9EChzyYNMxOQfRQI5n00i7yv0igKt
 3sHsFQSqAXAxt9IdY6+l/A8wfAgRAxNA3PNJ/LxYY2f+rgPOdWKwrSrIesiFtN6TEGj0
 gYScFJc4JYLTV+I8S3JWOKVLIMn4AoEQp7fIlL/jUEDIBu8Qpfuh9VVwHMSr4AG4YJZE
 vaqf1Z8vzjNpMP+TSnCxIRXmqruyu1Gb/1QkTS7QzUcueXPL7zL+2Dei824baIYXaCno
 N8qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5sukNNPmPu1+Cny7dyuNQ/H3foFwVcBpTP3ezpmbUXc=;
 b=WPaUOy07VPKgBwv+WFVq4GnjMUnpG0FoXraOOjD5Vasf17Q1mlW+MJ0jxDPsKvchdh
 DfjJHWao6gwrwnKOCdzz+RR2KZd0CxW8yq5yBGbRt+MpVrcYAgJ+kXZEI+fCnV+0Q8BV
 8o69dExxVjw0+ZdJiPq/ZFK3iGxoH3/t3x7KygxY41L1hpD+bYQ74HQ5kW2p1LdT9Gvq
 8mTLjta+bpE02Ob+tiBPwMQaH7lnu1p8WFPYIsmm334sQ6jLnwZcWsGN1tovYd1+dj9B
 i9TA2wZ7BtIbzfH3qrzwqX04KWxMxaF35U+mEnxZrRR6R2n/Fg4MB8RQ/XhrUai53x5C
 lEYw==
X-Gm-Message-State: AOAM5336f5Qpwo0/+KvxcAvYr0wxG8T3PCVYbKzwzDAgHP1JZJiZqaC1
 HYeMyUKALPB8/40zlGtTbUlJTXbxn+o=
X-Google-Smtp-Source: ABdhPJzNFLoij4UyejdjPVovB8EJAr/eF8N/KhRZeRtreBMxxqnzXq3dmSiXZ3gNMvszr0rTUeBCkA==
X-Received: by 2002:a5d:6ca2:: with SMTP id a2mr4884599wra.291.1631785453311; 
 Thu, 16 Sep 2021 02:44:13 -0700 (PDT)
Received: from localhost ([217.111.27.204])
 by smtp.gmail.com with ESMTPSA id t126sm6755278wma.4.2021.09.16.02.44.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Sep 2021 02:44:12 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: dri-devel@lists.freedesktop.org,
	linux-tegra@vger.kernel.org
Subject: [PATCH 3/6] drm/tegra: Implement buffer object cache
Date: Thu, 16 Sep 2021 11:44:01 +0200
Message-Id: <20210916094404.888267-3-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210916094404.888267-1-thierry.reding@gmail.com>
References: <20210916094404.888267-1-thierry.reding@gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Thierry Reding <treding@nvidia.com>

This cache is used to avoid mapping and unmapping buffer objects
unnecessarily. Mappings are cached per client and stay hot until
the buffer object is destroyed.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/gpu/drm/tegra/gem.c   | 14 +++++--
 drivers/gpu/drm/tegra/plane.c |  2 +-
 drivers/gpu/drm/tegra/uapi.c  |  3 +-
 drivers/gpu/host1x/bus.c      | 78 +++++++++++++++++++++++++++++++++++
 drivers/gpu/host1x/dev.c      |  2 +
 drivers/gpu/host1x/dev.h      |  2 +
 drivers/gpu/host1x/job.c      |  4 +-
 include/linux/host1x.h        | 53 +++++++++++++++++++-----
 8 files changed, 141 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/tegra/gem.c b/drivers/gpu/drm/tegra/gem.c
index 79a609f981d1..e3f0578fc411 100644
--- a/drivers/gpu/drm/tegra/gem.c
+++ b/drivers/gpu/drm/tegra/gem.c
@@ -39,6 +39,7 @@ static struct host1x_bo_mapping *tegra_bo_pin(struct device *dev, struct host1x_
 	if (!map)
 		return ERR_PTR(-ENOMEM);
 
+	kref_init(&map->ref);
 	map->bo = host1x_bo_get(bo);
 	map->direction = direction;
 	map->dev = dev;
@@ -129,9 +130,6 @@ static struct host1x_bo_mapping *tegra_bo_pin(struct device *dev, struct host1x_
 
 static void tegra_bo_unpin(struct host1x_bo_mapping *map)
 {
-	if (!map)
-		return;
-
 	if (map->attach) {
 		dma_buf_unmap_attachment(map->attach, map->sgt, map->direction);
 		dma_buf_detach(map->attach->dmabuf, map->attach);
@@ -465,8 +463,18 @@ static struct tegra_bo *tegra_bo_import(struct drm_device *drm,
 void tegra_bo_free_object(struct drm_gem_object *gem)
 {
 	struct tegra_drm *tegra = gem->dev->dev_private;
+	struct host1x_bo_mapping *mapping, *tmp;
 	struct tegra_bo *bo = to_tegra_bo(gem);
 
+	/* remove all mappings of this buffer object from any caches */
+	list_for_each_entry_safe(mapping, tmp, &bo->base.mappings, list) {
+		if (mapping->cache)
+			host1x_bo_unpin(mapping);
+		else
+			dev_err(gem->dev->dev, "mapping %p stale for device %s\n", mapping,
+				dev_name(mapping->dev));
+	}
+
 	if (tegra->domain)
 		tegra_bo_iommu_unmap(tegra, bo);
 
diff --git a/drivers/gpu/drm/tegra/plane.c b/drivers/gpu/drm/tegra/plane.c
index e579d966e8dc..f8e8afcbcbf2 100644
--- a/drivers/gpu/drm/tegra/plane.c
+++ b/drivers/gpu/drm/tegra/plane.c
@@ -145,7 +145,7 @@ static int tegra_dc_pin(struct tegra_dc *dc, struct tegra_plane_state *state)
 		struct tegra_bo *bo = tegra_fb_get_plane(state->base.fb, i);
 		struct host1x_bo_mapping *map;
 
-		map = host1x_bo_pin(dc->dev, &bo->base, DMA_TO_DEVICE);
+		map = host1x_bo_pin(dc->dev, &bo->base, DMA_TO_DEVICE, &dc->client.cache);
 		if (IS_ERR(map)) {
 			err = PTR_ERR(map);
 			goto unpin;
diff --git a/drivers/gpu/drm/tegra/uapi.c b/drivers/gpu/drm/tegra/uapi.c
index 794c400c38b1..66fe8717e747 100644
--- a/drivers/gpu/drm/tegra/uapi.c
+++ b/drivers/gpu/drm/tegra/uapi.c
@@ -201,7 +201,8 @@ int tegra_drm_ioctl_channel_map(struct drm_device *drm, void *data, struct drm_f
 		goto put_gem;
 	}
 
-	mapping->map = host1x_bo_pin(context->client->base.dev, mapping->bo, direction);
+	mapping->map = host1x_bo_pin(context->client->base.dev, mapping->bo, direction,
+				     &context->client->base.cache);
 	if (IS_ERR(mapping->map)) {
 		err = PTR_ERR(mapping->map);
 		goto put_gem;
diff --git a/drivers/gpu/host1x/bus.c b/drivers/gpu/host1x/bus.c
index 218e3718fd68..0b67d894470d 100644
--- a/drivers/gpu/host1x/bus.c
+++ b/drivers/gpu/host1x/bus.c
@@ -742,6 +742,7 @@ EXPORT_SYMBOL(host1x_driver_unregister);
  */
 void __host1x_client_init(struct host1x_client *client, struct lock_class_key *key)
 {
+	host1x_bo_cache_init(&client->cache);
 	INIT_LIST_HEAD(&client->list);
 	__mutex_init(&client->lock, "host1x client lock", key);
 	client->usecount = 0;
@@ -830,6 +831,8 @@ int host1x_client_unregister(struct host1x_client *client)
 
 	mutex_unlock(&clients_lock);
 
+	host1x_bo_cache_destroy(&client->cache);
+
 	return 0;
 }
 EXPORT_SYMBOL(host1x_client_unregister);
@@ -904,3 +907,78 @@ int host1x_client_resume(struct host1x_client *client)
 	return err;
 }
 EXPORT_SYMBOL(host1x_client_resume);
+
+struct host1x_bo_mapping *host1x_bo_pin(struct device *dev, struct host1x_bo *bo,
+					enum dma_data_direction dir,
+					struct host1x_bo_cache *cache)
+{
+	struct host1x_bo_mapping *mapping;
+
+	if (cache) {
+		mutex_lock(&cache->lock);
+
+		list_for_each_entry(mapping, &cache->mappings, entry) {
+			if (mapping->bo == bo && mapping->direction == dir) {
+				kref_get(&mapping->ref);
+				goto unlock;
+			}
+		}
+	}
+
+	mapping = bo->ops->pin(dev, bo, dir);
+	if (IS_ERR(mapping))
+		goto unlock;
+
+	spin_lock(&mapping->bo->lock);
+	list_add_tail(&mapping->list, &bo->mappings);
+	spin_unlock(&mapping->bo->lock);
+
+	if (cache) {
+		INIT_LIST_HEAD(&mapping->entry);
+		mapping->cache = cache;
+
+		list_add_tail(&mapping->entry, &cache->mappings);
+
+		/* bump reference count to track the copy in the cache */
+		kref_get(&mapping->ref);
+	}
+
+unlock:
+	if (cache)
+		mutex_unlock(&cache->lock);
+
+	return mapping;
+}
+EXPORT_SYMBOL(host1x_bo_pin);
+
+static void __host1x_bo_unpin(struct kref *ref)
+{
+	struct host1x_bo_mapping *mapping = to_host1x_bo_mapping(ref);
+
+	/*
+	 * When the last reference of the mapping goes away, make sure to remove the mapping from
+	 * the cache.
+	 */
+	if (mapping->cache)
+		list_del(&mapping->entry);
+
+	spin_lock(&mapping->bo->lock);
+	list_del(&mapping->list);
+	spin_unlock(&mapping->bo->lock);
+
+	mapping->bo->ops->unpin(mapping);
+}
+
+void host1x_bo_unpin(struct host1x_bo_mapping *mapping)
+{
+	struct host1x_bo_cache *cache = mapping->cache;
+
+	if (cache)
+		mutex_lock(&cache->lock);
+
+	kref_put(&mapping->ref, __host1x_bo_unpin);
+
+	if (cache)
+		mutex_unlock(&cache->lock);
+}
+EXPORT_SYMBOL(host1x_bo_unpin);
diff --git a/drivers/gpu/host1x/dev.c b/drivers/gpu/host1x/dev.c
index e2ddf3fcaa9a..3d4cabdbc78d 100644
--- a/drivers/gpu/host1x/dev.c
+++ b/drivers/gpu/host1x/dev.c
@@ -404,6 +404,7 @@ static int host1x_probe(struct platform_device *pdev)
 	if (syncpt_irq < 0)
 		return syncpt_irq;
 
+	host1x_bo_cache_init(&host->cache);
 	mutex_init(&host->devices_lock);
 	INIT_LIST_HEAD(&host->devices);
 	INIT_LIST_HEAD(&host->list);
@@ -530,6 +531,7 @@ static int host1x_remove(struct platform_device *pdev)
 	reset_control_assert(host->rst);
 	clk_disable_unprepare(host->clk);
 	host1x_iommu_exit(host);
+	host1x_bo_cache_destroy(&host->cache);
 
 	return 0;
 }
diff --git a/drivers/gpu/host1x/dev.h b/drivers/gpu/host1x/dev.h
index fa6d4bc46e98..5b7fdea5d169 100644
--- a/drivers/gpu/host1x/dev.h
+++ b/drivers/gpu/host1x/dev.h
@@ -149,6 +149,8 @@ struct host1x {
 	struct list_head list;
 
 	struct device_dma_parameters dma_parms;
+
+	struct host1x_bo_cache cache;
 };
 
 void host1x_hypervisor_writel(struct host1x *host1x, u32 r, u32 v);
diff --git a/drivers/gpu/host1x/job.c b/drivers/gpu/host1x/job.c
index 7a27895e0d28..5b7dcbdefcab 100644
--- a/drivers/gpu/host1x/job.c
+++ b/drivers/gpu/host1x/job.c
@@ -177,7 +177,7 @@ static unsigned int pin_job(struct host1x *host, struct host1x_job *job)
 			goto unpin;
 		}
 
-		map = host1x_bo_pin(dev, bo, direction);
+		map = host1x_bo_pin(dev, bo, direction, &client->cache);
 		if (IS_ERR(map)) {
 			err = PTR_ERR(map);
 			goto unpin;
@@ -224,7 +224,7 @@ static unsigned int pin_job(struct host1x *host, struct host1x_job *job)
 			goto unpin;
 		}
 
-		map = host1x_bo_pin(host->dev, g->bo, DMA_TO_DEVICE);
+		map = host1x_bo_pin(host->dev, g->bo, DMA_TO_DEVICE, &host->cache);
 		if (IS_ERR(map)) {
 			err = PTR_ERR(map);
 			goto unpin;
diff --git a/include/linux/host1x.h b/include/linux/host1x.h
index 56851523378a..2ca53d7ed7ca 100644
--- a/include/linux/host1x.h
+++ b/include/linux/host1x.h
@@ -8,6 +8,7 @@
 
 #include <linux/device.h>
 #include <linux/dma-direction.h>
+#include <linux/spinlock.h>
 #include <linux/types.h>
 
 enum host1x_class {
@@ -26,6 +27,28 @@ struct iommu_group;
 
 u64 host1x_get_dma_mask(struct host1x *host1x);
 
+/**
+ * struct host1x_bo_cache - host1x buffer object cache
+ * @mappings: list of mappings
+ * @lock: synchronizes accesses to the list of mappings
+ */
+struct host1x_bo_cache {
+	struct list_head mappings;
+	struct mutex lock;
+};
+
+static inline void host1x_bo_cache_init(struct host1x_bo_cache *cache)
+{
+	INIT_LIST_HEAD(&cache->mappings);
+	mutex_init(&cache->lock);
+}
+
+static inline void host1x_bo_cache_destroy(struct host1x_bo_cache *cache)
+{
+	/* XXX warn if not empty? */
+	mutex_destroy(&cache->lock);
+}
+
 /**
  * struct host1x_client_ops - host1x client operations
  * @early_init: host1x client early initialization code
@@ -76,6 +99,8 @@ struct host1x_client {
 	struct host1x_client *parent;
 	unsigned int usecount;
 	struct mutex lock;
+
+	struct host1x_bo_cache cache;
 };
 
 /*
@@ -86,16 +111,26 @@ struct host1x_bo;
 struct sg_table;
 
 struct host1x_bo_mapping {
+	struct kref ref;
 	struct dma_buf_attachment *attach;
 	enum dma_data_direction direction;
+	struct list_head list;
 	struct host1x_bo *bo;
 	struct sg_table *sgt;
 	unsigned int chunks;
 	struct device *dev;
 	dma_addr_t phys;
 	size_t size;
+
+	struct host1x_bo_cache *cache;
+	struct list_head entry;
 };
 
+static inline struct host1x_bo_mapping *to_host1x_bo_mapping(struct kref *ref)
+{
+	return container_of(ref, struct host1x_bo_mapping, ref);
+}
+
 struct host1x_bo_ops {
 	struct host1x_bo *(*get)(struct host1x_bo *bo);
 	void (*put)(struct host1x_bo *bo);
@@ -108,11 +143,15 @@ struct host1x_bo_ops {
 
 struct host1x_bo {
 	const struct host1x_bo_ops *ops;
+	struct list_head mappings;
+	spinlock_t lock;
 };
 
 static inline void host1x_bo_init(struct host1x_bo *bo,
 				  const struct host1x_bo_ops *ops)
 {
+	INIT_LIST_HEAD(&bo->mappings);
+	spin_lock_init(&bo->lock);
 	bo->ops = ops;
 }
 
@@ -126,16 +165,10 @@ static inline void host1x_bo_put(struct host1x_bo *bo)
 	bo->ops->put(bo);
 }
 
-static inline struct host1x_bo_mapping *host1x_bo_pin(struct device *dev, struct host1x_bo *bo,
-						      enum dma_data_direction dir)
-{
-	return bo->ops->pin(dev, bo, dir);
-}
-
-static inline void host1x_bo_unpin(struct host1x_bo_mapping *map)
-{
-	map->bo->ops->unpin(map);
-}
+struct host1x_bo_mapping *host1x_bo_pin(struct device *dev, struct host1x_bo *bo,
+					enum dma_data_direction dir,
+					struct host1x_bo_cache *cache);
+void host1x_bo_unpin(struct host1x_bo_mapping *map);
 
 static inline void *host1x_bo_mmap(struct host1x_bo *bo)
 {
-- 
2.33.0

