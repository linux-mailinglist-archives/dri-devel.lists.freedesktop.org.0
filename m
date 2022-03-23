Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 19DF34E5601
	for <lists+dri-devel@lfdr.de>; Wed, 23 Mar 2022 17:08:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56B7410E74C;
	Wed, 23 Mar 2022 16:08:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB14310E749
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Mar 2022 16:08:29 +0000 (UTC)
Received: from dude03.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::39])
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1nX3X8-0001yD-U9; Wed, 23 Mar 2022 17:08:27 +0100
From: Lucas Stach <l.stach@pengutronix.de>
To: etnaviv@lists.freedesktop.org
Subject: [PATCH 3/4] drm/etnaviv: move flush_seq increment into
 etnaviv_iommu_map/unmap
Date: Wed, 23 Mar 2022 17:08:24 +0100
Message-Id: <20220323160825.3858619-3-l.stach@pengutronix.de>
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

The flush sequence is a marker that the page tables have been changed
and any affected TLBs need to be flushed. Move the flush_seq increment
a little further down the call stack to place it next to the actual
page table manipulation. Not functional change.

Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
---
 drivers/gpu/drm/etnaviv/etnaviv_mmu.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_mmu.c b/drivers/gpu/drm/etnaviv/etnaviv_mmu.c
index 3957b9a752f5..d41295208102 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_mmu.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_mmu.c
@@ -92,6 +92,8 @@ static int etnaviv_iommu_map(struct etnaviv_iommu_context *context, u32 iova,
 		da += bytes;
 	}
 
+	context->flush_seq++;
+
 	return 0;
 
 fail:
@@ -117,6 +119,8 @@ static void etnaviv_iommu_unmap(struct etnaviv_iommu_context *context, u32 iova,
 
 		da += bytes;
 	}
+
+	context->flush_seq++;
 }
 
 static void etnaviv_iommu_remove_mapping(struct etnaviv_iommu_context *context,
@@ -274,7 +278,6 @@ int etnaviv_iommu_map_gem(struct etnaviv_iommu_context *context,
 
 	mapping->context = etnaviv_iommu_context_get(context);
 	list_add_tail(&mapping->mmu_node, &context->mappings);
-	context->flush_seq++;
 unlock:
 	mutex_unlock(&context->lock);
 
@@ -299,7 +302,6 @@ void etnaviv_iommu_unmap_gem(struct etnaviv_iommu_context *context,
 		etnaviv_iommu_remove_mapping(context, mapping);
 
 	list_del(&mapping->mmu_node);
-	context->flush_seq++;
 	mutex_unlock(&context->lock);
 	etnaviv_iommu_context_put(context);
 }
-- 
2.30.2

