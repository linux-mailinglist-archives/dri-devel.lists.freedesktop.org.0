Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 635DB574AA3
	for <lists+dri-devel@lfdr.de>; Thu, 14 Jul 2022 12:31:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 120DFA45A0;
	Thu, 14 Jul 2022 10:31:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF599A45A0
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Jul 2022 10:31:45 +0000 (UTC)
Received: from dude02.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::28])
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1oBw8F-0005K5-OP; Thu, 14 Jul 2022 12:31:43 +0200
From: Lucas Stach <l.stach@pengutronix.de>
To: etnaviv@lists.freedesktop.org
Subject: [PATCH 1/2] drm/etnaviv: move idle mapping reaping into separate
 function
Date: Thu, 14 Jul 2022 12:31:42 +0200
Message-Id: <20220714103143.1704573-1-l.stach@pengutronix.de>
X-Mailer: git-send-email 2.30.2
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
Cc: patchwork-lst@pengutronix.de, kernel@pengutronix.de,
 dri-devel@lists.freedesktop.org, Russell King <linux+etnaviv@armlinux.org.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The same logic is already used in two different places and now
it will also be needed outside of the compilation unit, so split
it into a separate function.

Cc: stable@vger.kernel.org # 5.19
Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
---
 drivers/gpu/drm/etnaviv/etnaviv_mmu.c | 23 +++++++++++++++--------
 drivers/gpu/drm/etnaviv/etnaviv_mmu.h |  1 +
 2 files changed, 16 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_mmu.c b/drivers/gpu/drm/etnaviv/etnaviv_mmu.c
index dc1aa738c4f1..55479cb8b1ac 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_mmu.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_mmu.c
@@ -135,6 +135,19 @@ static void etnaviv_iommu_remove_mapping(struct etnaviv_iommu_context *context,
 	drm_mm_remove_node(&mapping->vram_node);
 }
 
+void etnaviv_iommu_reap_mapping(struct etnaviv_vram_mapping *mapping)
+{
+	struct etnaviv_iommu_context *context = mapping->context;
+
+	lockdep_assert_held(&context->lock);
+	WARN_ON(mapping->use);
+
+	etnaviv_iommu_remove_mapping(context, mapping);
+	etnaviv_iommu_context_put(mapping->context);
+	mapping->context = NULL;
+	list_del_init(&mapping->mmu_node);
+}
+
 static int etnaviv_iommu_find_iova(struct etnaviv_iommu_context *context,
 				   struct drm_mm_node *node, size_t size)
 {
@@ -202,10 +215,7 @@ static int etnaviv_iommu_find_iova(struct etnaviv_iommu_context *context,
 		 * this mapping.
 		 */
 		list_for_each_entry_safe(m, n, &list, scan_node) {
-			etnaviv_iommu_remove_mapping(context, m);
-			etnaviv_iommu_context_put(m->context);
-			m->context = NULL;
-			list_del_init(&m->mmu_node);
+			etnaviv_iommu_reap_mapping(m);
 			list_del_init(&m->scan_node);
 		}
 
@@ -257,10 +267,7 @@ static int etnaviv_iommu_insert_exact(struct etnaviv_iommu_context *context,
 	}
 
 	list_for_each_entry_safe(m, n, &scan_list, scan_node) {
-		etnaviv_iommu_remove_mapping(context, m);
-		etnaviv_iommu_context_put(m->context);
-		m->context = NULL;
-		list_del_init(&m->mmu_node);
+		etnaviv_iommu_reap_mapping(m);
 		list_del_init(&m->scan_node);
 	}
 
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_mmu.h b/drivers/gpu/drm/etnaviv/etnaviv_mmu.h
index e4a0b7d09c2e..c01a147f0dfd 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_mmu.h
+++ b/drivers/gpu/drm/etnaviv/etnaviv_mmu.h
@@ -91,6 +91,7 @@ int etnaviv_iommu_map_gem(struct etnaviv_iommu_context *context,
 	struct etnaviv_vram_mapping *mapping, u64 va);
 void etnaviv_iommu_unmap_gem(struct etnaviv_iommu_context *context,
 	struct etnaviv_vram_mapping *mapping);
+void etnaviv_iommu_reap_mapping(struct etnaviv_vram_mapping *mapping);
 
 int etnaviv_iommu_get_suballoc_va(struct etnaviv_iommu_context *ctx,
 				  struct etnaviv_vram_mapping *mapping,
-- 
2.30.2

