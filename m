Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A1B8686A38
	for <lists+dri-devel@lfdr.de>; Wed,  1 Feb 2023 16:26:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDE8B10E411;
	Wed,  1 Feb 2023 15:26:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D077F10E40F
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Feb 2023 15:26:13 +0000 (UTC)
Received: from dude02.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::28])
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1pNEzy-0000ja-If; Wed, 01 Feb 2023 16:26:10 +0100
From: Lucas Stach <l.stach@pengutronix.de>
To: etnaviv@lists.freedesktop.org
Subject: [PATCH v3 2/3] drm/etnaviv: allocate unique ID per drm_file
Date: Wed,  1 Feb 2023 16:26:08 +0100
Message-Id: <20230201152609.1395525-2-l.stach@pengutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230201152609.1395525-1-l.stach@pengutronix.de>
References: <20230201152609.1395525-1-l.stach@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::28
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: kernel@pengutronix.de, dri-devel@lists.freedesktop.org,
 patchwork-lst@pengutronix.de, Russell King <linux+etnaviv@armlinux.org.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Allows to easily track if several fd are pointing to the same
execution context due to being dup'ed.

Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
---
v3: use xarray to track the active contexts to avoid issues
    on rollover
---
 drivers/gpu/drm/etnaviv/etnaviv_drv.c | 11 +++++++++++
 drivers/gpu/drm/etnaviv/etnaviv_drv.h |  4 ++++
 2 files changed, 15 insertions(+)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_drv.c b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
index 1d2b4fb4bcf8..31a7f59ccb49 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_drv.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
@@ -56,6 +56,11 @@ static int etnaviv_open(struct drm_device *dev, struct drm_file *file)
 	if (!ctx)
 		return -ENOMEM;
 
+	ret = xa_alloc_cyclic(&priv->active_contexts, &ctx->id, ctx,
+			      xa_limit_32b, &priv->next_context_id, GFP_KERNEL);
+	if (ret < 0)
+		goto out_free;
+
 	ctx->mmu = etnaviv_iommu_context_init(priv->mmu_global,
 					      priv->cmdbuf_suballoc);
 	if (!ctx->mmu) {
@@ -99,6 +104,8 @@ static void etnaviv_postclose(struct drm_device *dev, struct drm_file *file)
 
 	etnaviv_iommu_context_put(ctx->mmu);
 
+	xa_erase(&priv->active_contexts, ctx->id);
+
 	kfree(ctx);
 }
 
@@ -514,6 +521,8 @@ static int etnaviv_bind(struct device *dev)
 
 	dma_set_max_seg_size(dev, SZ_2G);
 
+	xa_init_flags(&priv->active_contexts, XA_FLAGS_ALLOC);
+
 	mutex_init(&priv->gem_lock);
 	INIT_LIST_HEAD(&priv->gem_list);
 	priv->num_gpus = 0;
@@ -563,6 +572,8 @@ static void etnaviv_unbind(struct device *dev)
 
 	etnaviv_cmdbuf_suballoc_destroy(priv->cmdbuf_suballoc);
 
+	xa_destroy(&priv->active_contexts);
+
 	drm->dev_private = NULL;
 	kfree(priv);
 
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_drv.h b/drivers/gpu/drm/etnaviv/etnaviv_drv.h
index 0b311af04f1d..b3eb1662e90c 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_drv.h
+++ b/drivers/gpu/drm/etnaviv/etnaviv_drv.h
@@ -29,6 +29,7 @@ struct etnaviv_iommu_global;
 #define ETNAVIV_SOFTPIN_START_ADDRESS	SZ_4M /* must be >= SUBALLOC_SIZE */
 
 struct etnaviv_file_private {
+	int id;
 	struct etnaviv_iommu_context	*mmu;
 	struct drm_sched_entity		sched_entity[ETNA_MAX_PIPES];
 };
@@ -41,6 +42,9 @@ struct etnaviv_drm_private {
 	struct etnaviv_cmdbuf_suballoc *cmdbuf_suballoc;
 	struct etnaviv_iommu_global *mmu_global;
 
+	struct xarray active_contexts;
+	u32 next_context_id;
+
 	/* list of GEM objects: */
 	struct mutex gem_lock;
 	struct list_head gem_list;
-- 
2.39.1

