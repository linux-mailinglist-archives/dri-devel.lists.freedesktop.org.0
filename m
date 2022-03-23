Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 080974E5602
	for <lists+dri-devel@lfdr.de>; Wed, 23 Mar 2022 17:08:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5E1810E75B;
	Wed, 23 Mar 2022 16:08:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31FBF10E75B
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Mar 2022 16:08:31 +0000 (UTC)
Received: from dude03.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::39])
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1nX3X9-0001yD-Cn; Wed, 23 Mar 2022 17:08:27 +0100
From: Lucas Stach <l.stach@pengutronix.de>
To: etnaviv@lists.freedesktop.org
Subject: [PATCH 4/4] drm/etnaviv: reap idle softpin mappings when necessary
Date: Wed, 23 Mar 2022 17:08:25 +0100
Message-Id: <20220323160825.3858619-4-l.stach@pengutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220323160825.3858619-1-l.stach@pengutronix.de>
References: <20220323160825.3858619-1-l.stach@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Right now the only point where softpin mappings get removed from the
MMU context is when the mapped GEM object is destroyed. However,
userspace might want to reuse that address space before the object
is destroyed, which is a valid usage, as long as all mapping in that
region of the address space are no longer used by any GPU jobs.

Implement reaping of idle MMU mappings that would otherwise
prevent the insertion of a softpin mapping.

Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
Tested-by: Guido Günther <agx@sigxcpu.org>
Acked-by: Guido Günther <agx@sigxcpu.org>
Reviewed-by: Christian Gmeiner <christian.gmeiner@gmail.com>
---
 drivers/gpu/drm/etnaviv/etnaviv_mmu.c | 39 +++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_mmu.c b/drivers/gpu/drm/etnaviv/etnaviv_mmu.c
index d41295208102..dc1aa738c4f1 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_mmu.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_mmu.c
@@ -223,8 +223,47 @@ static int etnaviv_iommu_find_iova(struct etnaviv_iommu_context *context,
 static int etnaviv_iommu_insert_exact(struct etnaviv_iommu_context *context,
 		   struct drm_mm_node *node, size_t size, u64 va)
 {
+	struct etnaviv_vram_mapping *m, *n;
+	struct drm_mm_node *scan_node;
+	LIST_HEAD(scan_list);
+	int ret;
+
 	lockdep_assert_held(&context->lock);
 
+	ret = drm_mm_insert_node_in_range(&context->mm, node, size, 0, 0, va,
+					  va + size, DRM_MM_INSERT_LOWEST);
+	if (ret != -ENOSPC)
+		return ret;
+
+	/*
+	 * When we can't insert the node, due to a existing mapping blocking
+	 * the address space, there are two possible reasons:
+	 * 1. Userspace genuinely messed up and tried to reuse address space
+	 * before the last job using this VMA has finished executing.
+	 * 2. The existing buffer mappings are idle, but the buffers are not
+	 * destroyed yet (likely due to being referenced by another context) in
+	 * which case the mappings will not be cleaned up and we must reap them
+	 * here to make space for the new mapping.
+	 */
+
+	drm_mm_for_each_node_in_range(scan_node, &context->mm, va, va + size) {
+		m = container_of(scan_node, struct etnaviv_vram_mapping,
+				 vram_node);
+
+		if (m->use)
+			return -ENOSPC;
+
+		list_add(&m->scan_node, &scan_list);
+	}
+
+	list_for_each_entry_safe(m, n, &scan_list, scan_node) {
+		etnaviv_iommu_remove_mapping(context, m);
+		etnaviv_iommu_context_put(m->context);
+		m->context = NULL;
+		list_del_init(&m->mmu_node);
+		list_del_init(&m->scan_node);
+	}
+
 	return drm_mm_insert_node_in_range(&context->mm, node, size, 0, 0, va,
 					   va + size, DRM_MM_INSERT_LOWEST);
 }
-- 
2.30.2

