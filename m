Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 855D52F29BC
	for <lists+dri-devel@lfdr.de>; Tue, 12 Jan 2021 09:10:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 779266E112;
	Tue, 12 Jan 2021 08:10:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB55C6E0EA;
 Tue, 12 Jan 2021 08:10:41 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 406AEB71E;
 Tue, 12 Jan 2021 08:10:40 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@linux.ie, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, alexander.deucher@amd.com, christian.koenig@amd.com
Subject: [PATCH 2/6] drm: Implement drm_need_swiotlb() in drm_cache.c
Date: Tue, 12 Jan 2021 09:10:31 +0100
Message-Id: <20210112081035.6882-3-tzimmermann@suse.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210112081035.6882-1-tzimmermann@suse.de>
References: <20210112081035.6882-1-tzimmermann@suse.de>
MIME-Version: 1.0
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The function is declared in drm_cache.h. I also removed the curly
braces from the for loop to adhere to kernel coding style.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_cache.c  | 32 ++++++++++++++++++++++++++++++++
 drivers/gpu/drm/drm_memory.c | 33 ---------------------------------
 2 files changed, 32 insertions(+), 33 deletions(-)

diff --git a/drivers/gpu/drm/drm_cache.c b/drivers/gpu/drm/drm_cache.c
index 0fe3c496002a..49551a7fa22f 100644
--- a/drivers/gpu/drm/drm_cache.c
+++ b/drivers/gpu/drm/drm_cache.c
@@ -30,6 +30,7 @@
 
 #include <linux/export.h>
 #include <linux/highmem.h>
+#include <xen/xen.h>
 
 #include <drm/drm_cache.h>
 
@@ -176,3 +177,34 @@ drm_clflush_virt_range(void *addr, unsigned long length)
 #endif
 }
 EXPORT_SYMBOL(drm_clflush_virt_range);
+
+bool drm_need_swiotlb(int dma_bits)
+{
+	struct resource *tmp;
+	resource_size_t max_iomem = 0;
+
+	/*
+	 * Xen paravirtual hosts require swiotlb regardless of requested dma
+	 * transfer size.
+	 *
+	 * NOTE: Really, what it requires is use of the dma_alloc_coherent
+	 *       allocator used in ttm_dma_populate() instead of
+	 *       ttm_populate_and_map_pages(), which bounce buffers so much in
+	 *       Xen it leads to swiotlb buffer exhaustion.
+	 */
+	if (xen_pv_domain())
+		return true;
+
+	/*
+	 * Enforce dma_alloc_coherent when memory encryption is active as well
+	 * for the same reasons as for Xen paravirtual hosts.
+	 */
+	if (mem_encrypt_active())
+		return true;
+
+	for (tmp = iomem_resource.child; tmp; tmp = tmp->sibling)
+		max_iomem = max(max_iomem,  tmp->end);
+
+	return max_iomem > ((u64)1 << dma_bits);
+}
+EXPORT_SYMBOL(drm_need_swiotlb);
diff --git a/drivers/gpu/drm/drm_memory.c b/drivers/gpu/drm/drm_memory.c
index f4f2bffdd5bd..e4f20a2eb6e7 100644
--- a/drivers/gpu/drm/drm_memory.c
+++ b/drivers/gpu/drm/drm_memory.c
@@ -37,7 +37,6 @@
 #include <linux/highmem.h>
 #include <linux/pci.h>
 #include <linux/vmalloc.h>
-#include <xen/xen.h>
 
 #include <drm/drm_agpsupport.h>
 #include <drm/drm_cache.h>
@@ -138,35 +137,3 @@ void drm_legacy_ioremapfree(struct drm_local_map *map, struct drm_device *dev)
 		iounmap(map->handle);
 }
 EXPORT_SYMBOL(drm_legacy_ioremapfree);
-
-bool drm_need_swiotlb(int dma_bits)
-{
-	struct resource *tmp;
-	resource_size_t max_iomem = 0;
-
-	/*
-	 * Xen paravirtual hosts require swiotlb regardless of requested dma
-	 * transfer size.
-	 *
-	 * NOTE: Really, what it requires is use of the dma_alloc_coherent
-	 *       allocator used in ttm_dma_populate() instead of
-	 *       ttm_populate_and_map_pages(), which bounce buffers so much in
-	 *       Xen it leads to swiotlb buffer exhaustion.
-	 */
-	if (xen_pv_domain())
-		return true;
-
-	/*
-	 * Enforce dma_alloc_coherent when memory encryption is active as well
-	 * for the same reasons as for Xen paravirtual hosts.
-	 */
-	if (mem_encrypt_active())
-		return true;
-
-	for (tmp = iomem_resource.child; tmp; tmp = tmp->sibling) {
-		max_iomem = max(max_iomem,  tmp->end);
-	}
-
-	return max_iomem > ((u64)1 << dma_bits);
-}
-EXPORT_SYMBOL(drm_need_swiotlb);
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
