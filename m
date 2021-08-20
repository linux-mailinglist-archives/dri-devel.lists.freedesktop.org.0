Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BBF3C3F350C
	for <lists+dri-devel@lfdr.de>; Fri, 20 Aug 2021 22:18:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D6846EB19;
	Fri, 20 Aug 2021 20:18:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69ED46EB18
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Aug 2021 20:18:33 +0000 (UTC)
Received: from dude03.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::39])
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1mHAyF-000258-Ip; Fri, 20 Aug 2021 22:18:31 +0200
From: Lucas Stach <l.stach@pengutronix.de>
To: etnaviv@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>, kernel@pengutronix.de,
 patchwork-lst@pengutronix.de
Subject: [PATCH 1/8] drm/etnaviv: return context from etnaviv_iommu_context_get
Date: Fri, 20 Aug 2021 22:18:23 +0200
Message-Id: <20210820201830.2005563-1-l.stach@pengutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::39
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Being able to have the refcount manipulation in an assignment makes
it much easier to parse the code.

Cc: stable@vger.kernel.org # 5.4
Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
Tested-by: Michael Walle <michael@walle.cc>
---
 drivers/gpu/drm/etnaviv/etnaviv_buffer.c     | 3 +--
 drivers/gpu/drm/etnaviv/etnaviv_gem.c        | 3 +--
 drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c | 3 +--
 drivers/gpu/drm/etnaviv/etnaviv_gpu.c        | 6 ++----
 drivers/gpu/drm/etnaviv/etnaviv_mmu.h        | 4 +++-
 5 files changed, 8 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_buffer.c b/drivers/gpu/drm/etnaviv/etnaviv_buffer.c
index 76d38561c910..cf741c5c82d2 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_buffer.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_buffer.c
@@ -397,8 +397,7 @@ void etnaviv_buffer_queue(struct etnaviv_gpu *gpu, u32 exec_state,
 		if (switch_mmu_context) {
 			struct etnaviv_iommu_context *old_context = gpu->mmu_context;
 
-			etnaviv_iommu_context_get(mmu_context);
-			gpu->mmu_context = mmu_context;
+			gpu->mmu_context = etnaviv_iommu_context_get(mmu_context);
 			etnaviv_iommu_context_put(old_context);
 		}
 
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem.c b/drivers/gpu/drm/etnaviv/etnaviv_gem.c
index b8fa6ed3dd73..fb7a33b88fc0 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gem.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gem.c
@@ -303,8 +303,7 @@ struct etnaviv_vram_mapping *etnaviv_gem_mapping_get(
 		list_del(&mapping->obj_node);
 	}
 
-	etnaviv_iommu_context_get(mmu_context);
-	mapping->context = mmu_context;
+	mapping->context = etnaviv_iommu_context_get(mmu_context);
 	mapping->use = 1;
 
 	ret = etnaviv_iommu_map_gem(mmu_context, etnaviv_obj,
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c b/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
index 4dd7d9d541c0..486259e154af 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
@@ -532,8 +532,7 @@ int etnaviv_ioctl_gem_submit(struct drm_device *dev, void *data,
 		goto err_submit_objects;
 
 	submit->ctx = file->driver_priv;
-	etnaviv_iommu_context_get(submit->ctx->mmu);
-	submit->mmu_context = submit->ctx->mmu;
+	submit->mmu_context = etnaviv_iommu_context_get(submit->ctx->mmu);
 	submit->exec_state = args->exec_state;
 	submit->flags = args->flags;
 
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
index 4102bcea3341..c8b9b0cc4442 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
@@ -1365,12 +1365,10 @@ struct dma_fence *etnaviv_gpu_submit(struct etnaviv_gem_submit *submit)
 	}
 
 	if (!gpu->mmu_context) {
-		etnaviv_iommu_context_get(submit->mmu_context);
-		gpu->mmu_context = submit->mmu_context;
+		gpu->mmu_context = etnaviv_iommu_context_get(submit->mmu_context);
 		etnaviv_gpu_start_fe_idleloop(gpu);
 	} else {
-		etnaviv_iommu_context_get(gpu->mmu_context);
-		submit->prev_mmu_context = gpu->mmu_context;
+		submit->prev_mmu_context = etnaviv_iommu_context_get(gpu->mmu_context);
 	}
 
 	if (submit->nr_pmrs) {
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_mmu.h b/drivers/gpu/drm/etnaviv/etnaviv_mmu.h
index d1d6902fd13b..e4a0b7d09c2e 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_mmu.h
+++ b/drivers/gpu/drm/etnaviv/etnaviv_mmu.h
@@ -105,9 +105,11 @@ void etnaviv_iommu_dump(struct etnaviv_iommu_context *ctx, void *buf);
 struct etnaviv_iommu_context *
 etnaviv_iommu_context_init(struct etnaviv_iommu_global *global,
 			   struct etnaviv_cmdbuf_suballoc *suballoc);
-static inline void etnaviv_iommu_context_get(struct etnaviv_iommu_context *ctx)
+static inline struct etnaviv_iommu_context *
+etnaviv_iommu_context_get(struct etnaviv_iommu_context *ctx)
 {
 	kref_get(&ctx->refcount);
+	return ctx;
 }
 void etnaviv_iommu_context_put(struct etnaviv_iommu_context *ctx);
 void etnaviv_iommu_restore(struct etnaviv_gpu *gpu,
-- 
2.30.2

