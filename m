Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AFE86CF4CA
	for <lists+dri-devel@lfdr.de>; Wed, 29 Mar 2023 22:52:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6776310EC6E;
	Wed, 29 Mar 2023 20:52:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from 189.cn (ptr.189.cn [183.61.185.104])
 by gabe.freedesktop.org (Postfix) with ESMTP id BB0F110EC6A
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Mar 2023 20:51:45 +0000 (UTC)
HMM_SOURCE_IP: 10.64.8.43:36106.2084148567
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-114.242.206.180 (unknown [10.64.8.43])
 by 189.cn (HERMES) with SMTP id ACC9F1002C5;
 Thu, 30 Mar 2023 04:51:44 +0800 (CST)
Received: from  ([114.242.206.180])
 by gateway-151646-dep-7b48884fd-tj646 with ESMTP id
 c1edc99e9a6b4656b719d8890ec08287 for l.stach@pengutronix.de; 
 Thu, 30 Mar 2023 04:51:44 CST
X-Transaction-ID: c1edc99e9a6b4656b719d8890ec08287
X-Real-From: 15330273260@189.cn
X-Receive-IP: 114.242.206.180
X-MEDUSA-Status: 0
From: Sui Jingfeng <15330273260@189.cn>
To: Lucas Stach <l.stach@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Li Yi <liyi@loongson.cn>
Subject: [PATCH v3 4/6] drm/etnaviv: add helpers for private data construction
 and destruction
Date: Thu, 30 Mar 2023 04:51:27 +0800
Message-Id: <20230329205129.1513734-5-15330273260@189.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230329205129.1513734-1-15330273260@189.cn>
References: <20230329205129.1513734-1-15330273260@189.cn>
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
 dri-devel@lists.freedesktop.org, etnaviv@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Sui Jingfeng <suijingfeng@loongson.cn>

 struct etnaviv_drm_private contains a lot of common resources that is
 shared by all GPUs, members of it is large enough. This patch introduce
 two dedicate functions which is for the construction and destruction of
 the instance of this structure. The idea is avoid to leak its members
 to outside, then the error handling code can be simplified.

Signed-off-by: Sui Jingfeng <suijingfeng@loongson.cn>
---
 drivers/gpu/drm/etnaviv/etnaviv_drv.c | 71 +++++++++++++++++----------
 drivers/gpu/drm/etnaviv/etnaviv_drv.h |  4 ++
 2 files changed, 50 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_drv.c b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
index ce0537af80bd..93dfa4b1a38b 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_drv.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
@@ -539,28 +539,17 @@ static const struct drm_driver etnaviv_drm_driver = {
 	.minor              = 3,
 };
 
-/*
- * Platform driver:
- */
-static int etnaviv_bind(struct device *dev)
+static int etnaviv_alloc_private(struct device *dev,
+				 struct etnaviv_drm_private **ppriv)
 {
 	struct etnaviv_drm_private *priv;
-	struct drm_device *drm;
 	int ret;
 
-	drm = drm_dev_alloc(&etnaviv_drm_driver, dev);
-	if (IS_ERR(drm))
-		return PTR_ERR(drm);
-
 	priv = kzalloc(sizeof(*priv), GFP_KERNEL);
 	if (!priv) {
 		dev_err(dev, "failed to allocate private data\n");
-		ret = -ENOMEM;
-		goto out_put;
+		return -ENOMEM;
 	}
-	drm->dev_private = priv;
-
-	dma_set_max_seg_size(dev, SZ_2G);
 
 	xa_init_flags(&priv->active_contexts, XA_FLAGS_ALLOC);
 
@@ -569,18 +558,55 @@ static int etnaviv_bind(struct device *dev)
 	priv->num_gpus = 0;
 	priv->shm_gfp_mask = GFP_HIGHUSER | __GFP_RETRY_MAYFAIL | __GFP_NOWARN;
 
-	priv->cmdbuf_suballoc = etnaviv_cmdbuf_suballoc_new(drm->dev);
+	priv->cmdbuf_suballoc = etnaviv_cmdbuf_suballoc_new(dev);
 	if (IS_ERR(priv->cmdbuf_suballoc)) {
-		dev_err(drm->dev, "Failed to create cmdbuf suballocator\n");
+		dev_err(dev, "Failed to create cmdbuf suballocator\n");
 		ret = PTR_ERR(priv->cmdbuf_suballoc);
-		goto out_free_priv;
+		kfree(priv);
+		return ret;
 	}
 
+	*ppriv = priv;
+
+	return 0;
+}
+
+static void etnaviv_free_private(struct etnaviv_drm_private *priv)
+{
+	etnaviv_cmdbuf_suballoc_destroy(priv->cmdbuf_suballoc);
+
+	xa_destroy(&priv->active_contexts);
+
+	kfree(priv);
+}
+
+/*
+ * Platform driver:
+ */
+static int etnaviv_bind(struct device *dev)
+{
+	struct etnaviv_drm_private *priv;
+	struct drm_device *drm;
+	int ret;
+
+	drm = drm_dev_alloc(&etnaviv_drm_driver, dev);
+	if (IS_ERR(drm))
+		return PTR_ERR(drm);
+
+	ret = etnaviv_alloc_private(dev, &priv);
+	if (ret)
+		goto out_put;
+
+	priv->drm = drm;
+	drm->dev_private = priv;
+
+	dma_set_max_seg_size(dev, SZ_2G);
+
 	dev_set_drvdata(dev, drm);
 
 	ret = component_bind_all(dev, drm);
 	if (ret < 0)
-		goto out_destroy_suballoc;
+		goto out_free_priv;
 
 	load_gpu(drm);
 
@@ -592,10 +618,8 @@ static int etnaviv_bind(struct device *dev)
 
 out_unbind:
 	component_unbind_all(dev, drm);
-out_destroy_suballoc:
-	etnaviv_cmdbuf_suballoc_destroy(priv->cmdbuf_suballoc);
 out_free_priv:
-	kfree(priv);
+	etnaviv_free_private(priv);
 out_put:
 	drm_dev_put(drm);
 
@@ -611,12 +635,9 @@ static void etnaviv_unbind(struct device *dev)
 
 	component_unbind_all(dev, drm);
 
-	etnaviv_cmdbuf_suballoc_destroy(priv->cmdbuf_suballoc);
-
-	xa_destroy(&priv->active_contexts);
+	etnaviv_free_private(priv);
 
 	drm->dev_private = NULL;
-	kfree(priv);
 
 	drm_dev_put(drm);
 }
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_drv.h b/drivers/gpu/drm/etnaviv/etnaviv_drv.h
index b3eb1662e90c..87fb52c03c5e 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_drv.h
+++ b/drivers/gpu/drm/etnaviv/etnaviv_drv.h
@@ -35,6 +35,7 @@ struct etnaviv_file_private {
 };
 
 struct etnaviv_drm_private {
+	struct drm_device *drm;
 	int num_gpus;
 	struct etnaviv_gpu *gpu[ETNA_MAX_PIPES];
 	gfp_t shm_gfp_mask;
@@ -45,6 +46,9 @@ struct etnaviv_drm_private {
 	struct xarray active_contexts;
 	u32 next_context_id;
 
+	/* hint for platform support cached coherent caching mode */
+	bool has_cached_coherent;
+
 	/* list of GEM objects: */
 	struct mutex gem_lock;
 	struct list_head gem_list;
-- 
2.25.1

