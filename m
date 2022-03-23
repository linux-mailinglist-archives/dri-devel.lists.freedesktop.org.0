Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D3124E5604
	for <lists+dri-devel@lfdr.de>; Wed, 23 Mar 2022 17:08:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76A4810E75D;
	Wed, 23 Mar 2022 16:08:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 383DF10E749
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Mar 2022 16:08:30 +0000 (UTC)
Received: from dude03.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::39])
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1nX3X8-0001yD-FL; Wed, 23 Mar 2022 17:08:26 +0100
From: Lucas Stach <l.stach@pengutronix.de>
To: etnaviv@lists.freedesktop.org
Subject: [PATCH 2/4] drm/etnaviv: move MMU context ref/unref into map/unmap_gem
Date: Wed, 23 Mar 2022 17:08:23 +0100
Message-Id: <20220323160825.3858619-2-l.stach@pengutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220323160825.3858619-1-l.stach@pengutronix.de>
References: <20220323160825.3858619-1-l.stach@pengutronix.de>
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
Cc: patchwork-lst@pengutronix.de, kernel@pengutronix.de,
 dri-devel@lists.freedesktop.org, Russell King <linux+etnaviv@armlinux.org.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This makes it a little more clear that the mapping holds a reference
to the context once the buffer has been successfully mapped into that
context and simplifies the error handling a bit.

Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
---
 drivers/gpu/drm/etnaviv/etnaviv_gem.c | 11 +++--------
 drivers/gpu/drm/etnaviv/etnaviv_mmu.c |  3 +++
 2 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem.c b/drivers/gpu/drm/etnaviv/etnaviv_gem.c
index d5314aa28ff7..a68e6a17505e 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gem.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gem.c
@@ -294,18 +294,15 @@ struct etnaviv_vram_mapping *etnaviv_gem_mapping_get(
 		list_del(&mapping->obj_node);
 	}
 
-	mapping->context = etnaviv_iommu_context_get(mmu_context);
 	mapping->use = 1;
 
 	ret = etnaviv_iommu_map_gem(mmu_context, etnaviv_obj,
 				    mmu_context->global->memory_base,
 				    mapping, va);
-	if (ret < 0) {
-		etnaviv_iommu_context_put(mmu_context);
+	if (ret < 0)
 		kfree(mapping);
-	} else {
+	else
 		list_add_tail(&mapping->obj_node, &etnaviv_obj->vram_list);
-	}
 
 out:
 	mutex_unlock(&etnaviv_obj->lock);
@@ -498,10 +495,8 @@ void etnaviv_gem_free_object(struct drm_gem_object *obj)
 
 		WARN_ON(mapping->use);
 
-		if (context) {
+		if (context)
 			etnaviv_iommu_unmap_gem(context, mapping);
-			etnaviv_iommu_context_put(context);
-		}
 
 		list_del(&mapping->obj_node);
 		kfree(mapping);
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_mmu.c b/drivers/gpu/drm/etnaviv/etnaviv_mmu.c
index aabb997a74eb..3957b9a752f5 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_mmu.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_mmu.c
@@ -245,6 +245,7 @@ int etnaviv_iommu_map_gem(struct etnaviv_iommu_context *context,
 		iova = sg_dma_address(sgt->sgl) - memory_base;
 		if (iova < 0x80000000 - sg_dma_len(sgt->sgl)) {
 			mapping->iova = iova;
+			mapping->context = etnaviv_iommu_context_get(context);
 			list_add_tail(&mapping->mmu_node, &context->mappings);
 			ret = 0;
 			goto unlock;
@@ -271,6 +272,7 @@ int etnaviv_iommu_map_gem(struct etnaviv_iommu_context *context,
 		goto unlock;
 	}
 
+	mapping->context = etnaviv_iommu_context_get(context);
 	list_add_tail(&mapping->mmu_node, &context->mappings);
 	context->flush_seq++;
 unlock:
@@ -299,6 +301,7 @@ void etnaviv_iommu_unmap_gem(struct etnaviv_iommu_context *context,
 	list_del(&mapping->mmu_node);
 	context->flush_seq++;
 	mutex_unlock(&context->lock);
+	etnaviv_iommu_context_put(context);
 }
 
 static void etnaviv_iommu_context_free(struct kref *kref)
-- 
2.30.2

