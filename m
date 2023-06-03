Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED8CA720FCD
	for <lists+dri-devel@lfdr.de>; Sat,  3 Jun 2023 13:00:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F84710E65A;
	Sat,  3 Jun 2023 11:00:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from 189.cn (ptr.189.cn [183.61.185.101])
 by gabe.freedesktop.org (Postfix) with ESMTP id 587F610E265;
 Sat,  3 Jun 2023 11:00:10 +0000 (UTC)
HMM_SOURCE_IP: 10.64.8.43:51732.1826327623
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-114.242.206.180 (unknown [10.64.8.43])
 by 189.cn (HERMES) with SMTP id 43D191002F0;
 Sat,  3 Jun 2023 19:00:07 +0800 (CST)
Received: from  ([114.242.206.180])
 by gateway-151646-dep-75648544bd-7vx9t with ESMTP id
 0507c27fc8ea46c69f03c9912654fed7 for l.stach@pengutronix.de; 
 Sat, 03 Jun 2023 19:00:09 CST
X-Transaction-ID: 0507c27fc8ea46c69f03c9912654fed7
X-Real-From: 15330273260@189.cn
X-Receive-IP: 114.242.206.180
X-MEDUSA-Status: 0
From: Sui Jingfeng <15330273260@189.cn>
To: Lucas Stach <l.stach@pengutronix.de>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Bjorn Helgaas <bhelgaas@google.com>
Subject: [PATCH v7 4/7] drm/etnaviv: add helpers for private data construction
 and destruction
Date: Sat,  3 Jun 2023 18:59:40 +0800
Message-Id: <20230603105943.3042766-5-15330273260@189.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230603105943.3042766-1-15330273260@189.cn>
References: <20230603105943.3042766-1-15330273260@189.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

struct etnaviv_drm_private contains a lot of common resources that are
shared by all GPUs. This patch introduces two dedicated functions, which
is for the construction and destruction of instances of this structure.
    
The idea is to avoid leaking its members outside. The error handling code
can also be simplified.

Signed-off-by: Sui Jingfeng <suijingfeng@loongson.cn>
---
 drivers/gpu/drm/etnaviv/etnaviv_drv.c | 73 +++++++++++++++++----------
 drivers/gpu/drm/etnaviv/etnaviv_drv.h |  1 +
 2 files changed, 47 insertions(+), 27 deletions(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_drv.c b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
index cec005035d0e..6a048be02857 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_drv.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
@@ -24,9 +24,47 @@
 #include "etnaviv_perfmon.h"
 
 /*
- * DRM operations:
+ * etnaviv private data construction and destructions:
  */
+static struct etnaviv_drm_private *
+etnaviv_alloc_private(struct device *dev, struct drm_device *drm)
+{
+	struct etnaviv_drm_private *priv;
+
+	priv = kzalloc(sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return ERR_PTR(-ENOMEM);
+
+	priv->drm = drm;
+
+	xa_init_flags(&priv->active_contexts, XA_FLAGS_ALLOC);
+
+	mutex_init(&priv->gem_lock);
+	INIT_LIST_HEAD(&priv->gem_list);
+	priv->num_gpus = 0;
+	priv->shm_gfp_mask = GFP_HIGHUSER | __GFP_RETRY_MAYFAIL | __GFP_NOWARN;
 
+	priv->cmdbuf_suballoc = etnaviv_cmdbuf_suballoc_new(dev);
+	if (IS_ERR(priv->cmdbuf_suballoc)) {
+		kfree(priv);
+		dev_err(dev, "Failed to create cmdbuf suballocator\n");
+		return ERR_PTR(-ENOMEM);
+	}
+
+	return priv;
+}
+
+static void etnaviv_free_private(struct etnaviv_drm_private *priv)
+{
+	if (!priv)
+		return;
+
+	etnaviv_cmdbuf_suballoc_destroy(priv->cmdbuf_suballoc);
+
+	xa_destroy(&priv->active_contexts);
+
+	kfree(priv);
+}
 
 static void load_gpu(struct drm_device *dev)
 {
@@ -511,35 +549,21 @@ static int etnaviv_bind(struct device *dev)
 	if (IS_ERR(drm))
 		return PTR_ERR(drm);
 
-	priv = kzalloc(sizeof(*priv), GFP_KERNEL);
-	if (!priv) {
-		dev_err(dev, "failed to allocate private data\n");
-		ret = -ENOMEM;
+	priv = etnaviv_alloc_private(dev, drm);
+	if (IS_ERR(priv)) {
+		ret = PTR_ERR(priv);
 		goto out_put;
 	}
+
 	drm->dev_private = priv;
 
 	dma_set_max_seg_size(dev, SZ_2G);
 
-	xa_init_flags(&priv->active_contexts, XA_FLAGS_ALLOC);
-
-	mutex_init(&priv->gem_lock);
-	INIT_LIST_HEAD(&priv->gem_list);
-	priv->num_gpus = 0;
-	priv->shm_gfp_mask = GFP_HIGHUSER | __GFP_RETRY_MAYFAIL | __GFP_NOWARN;
-
-	priv->cmdbuf_suballoc = etnaviv_cmdbuf_suballoc_new(drm->dev);
-	if (IS_ERR(priv->cmdbuf_suballoc)) {
-		dev_err(drm->dev, "Failed to create cmdbuf suballocator\n");
-		ret = PTR_ERR(priv->cmdbuf_suballoc);
-		goto out_free_priv;
-	}
-
 	dev_set_drvdata(dev, drm);
 
 	ret = component_bind_all(dev, drm);
 	if (ret < 0)
-		goto out_destroy_suballoc;
+		goto out_free_priv;
 
 	load_gpu(drm);
 
@@ -551,10 +575,8 @@ static int etnaviv_bind(struct device *dev)
 
 out_unbind:
 	component_unbind_all(dev, drm);
-out_destroy_suballoc:
-	etnaviv_cmdbuf_suballoc_destroy(priv->cmdbuf_suballoc);
 out_free_priv:
-	kfree(priv);
+	etnaviv_free_private(priv);
 out_put:
 	drm_dev_put(drm);
 
@@ -570,12 +592,9 @@ static void etnaviv_unbind(struct device *dev)
 
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
index b3eb1662e90c..e58f82e698de 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_drv.h
+++ b/drivers/gpu/drm/etnaviv/etnaviv_drv.h
@@ -35,6 +35,7 @@ struct etnaviv_file_private {
 };
 
 struct etnaviv_drm_private {
+	struct drm_device *drm;
 	int num_gpus;
 	struct etnaviv_gpu *gpu[ETNA_MAX_PIPES];
 	gfp_t shm_gfp_mask;
-- 
2.25.1

