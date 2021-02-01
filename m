Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2439030A9AE
	for <lists+dri-devel@lfdr.de>; Mon,  1 Feb 2021 15:25:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 440A36E5D1;
	Mon,  1 Feb 2021 14:25:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E9146E5BE
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Feb 2021 14:25:39 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 33B66AE03;
 Mon,  1 Feb 2021 14:25:38 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: patrik.r.jakobsson@gmail.com,
	airlied@linux.ie,
	daniel@ffwll.ch
Subject: [PATCH v2 3/4] drm/gma500: Remove CONFIG_X86 conditionals from source
 files
Date: Mon,  1 Feb 2021 15:25:33 +0100
Message-Id: <20210201142534.20364-4-tzimmermann@suse.de>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210201142534.20364-1-tzimmermann@suse.de>
References: <20210201142534.20364-1-tzimmermann@suse.de>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Remove the CONFIG_X86 conditionals from the source code. The driver
already depends on X86 in the Kconfig file. Also, no one has been
trying to build it on a non-x86 platform recently, or they would have
noticed that drm_ttm_cache_flush() doesn't exist.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/gma500/mmu.c | 21 ---------------------
 1 file changed, 21 deletions(-)

diff --git a/drivers/gpu/drm/gma500/mmu.c b/drivers/gpu/drm/gma500/mmu.c
index 13aff19aae9b..d856580b8111 100644
--- a/drivers/gpu/drm/gma500/mmu.c
+++ b/drivers/gpu/drm/gma500/mmu.c
@@ -48,7 +48,6 @@ static inline uint32_t psb_mmu_pd_index(uint32_t offset)
 	return offset >> PSB_PDE_SHIFT;
 }
 
-#if defined(CONFIG_X86)
 static inline void psb_clflush(void *addr)
 {
 	__asm__ __volatile__("clflush (%0)\n" : : "r"(addr) : "memory");
@@ -63,13 +62,6 @@ static inline void psb_mmu_clflush(struct psb_mmu_driver *driver, void *addr)
 	psb_clflush(addr);
 	mb();
 }
-#else
-
-static inline void psb_mmu_clflush(struct psb_mmu_driver *driver, void *addr)
-{;
-}
-
-#endif
 
 static void psb_mmu_flush_pd_locked(struct psb_mmu_driver *driver, int force)
 {
@@ -293,7 +285,6 @@ static struct psb_mmu_pt *psb_mmu_alloc_pt(struct psb_mmu_pd *pd)
 	for (i = 0; i < (PAGE_SIZE / sizeof(uint32_t)); ++i)
 		*ptes++ = pd->invalid_pte;
 
-#if defined(CONFIG_X86)
 	if (pd->driver->has_clflush && pd->hw_context != -1) {
 		mb();
 		for (i = 0; i < clflush_count; ++i) {
@@ -302,7 +293,6 @@ static struct psb_mmu_pt *psb_mmu_alloc_pt(struct psb_mmu_pd *pd)
 		}
 		mb();
 	}
-#endif
 	kunmap_atomic(v);
 	spin_unlock(lock);
 
@@ -459,7 +449,6 @@ struct psb_mmu_driver *psb_mmu_driver_init(struct drm_device *dev,
 
 	driver->has_clflush = 0;
 
-#if defined(CONFIG_X86)
 	if (boot_cpu_has(X86_FEATURE_CLFLUSH)) {
 		uint32_t tfms, misc, cap0, cap4, clflush_size;
 
@@ -476,7 +465,6 @@ struct psb_mmu_driver *psb_mmu_driver_init(struct drm_device *dev,
 		driver->clflush_mask = driver->clflush_add - 1;
 		driver->clflush_mask = ~driver->clflush_mask;
 	}
-#endif
 
 	up_write(&driver->sem);
 	return driver;
@@ -486,7 +474,6 @@ struct psb_mmu_driver *psb_mmu_driver_init(struct drm_device *dev,
 	return NULL;
 }
 
-#if defined(CONFIG_X86)
 static void psb_mmu_flush_ptes(struct psb_mmu_pd *pd, unsigned long address,
 			       uint32_t num_pages, uint32_t desired_tile_stride,
 			       uint32_t hw_tile_stride)
@@ -534,14 +521,6 @@ static void psb_mmu_flush_ptes(struct psb_mmu_pd *pd, unsigned long address,
 	}
 	mb();
 }
-#else
-static void psb_mmu_flush_ptes(struct psb_mmu_pd *pd, unsigned long address,
-			       uint32_t num_pages, uint32_t desired_tile_stride,
-			       uint32_t hw_tile_stride)
-{
-	drm_ttm_cache_flush();
-}
-#endif
 
 void psb_mmu_remove_pfn_sequence(struct psb_mmu_pd *pd,
 				 unsigned long address, uint32_t num_pages)
-- 
2.30.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
